FROM continuumio/miniconda3

RUN apt-get -qq update --yes \
 && apt-get -qq install --yes --no-install-recommends \
    build-essential git make clang libboost-dev postgresql-client ca-certificates \
 && rm -rf /var/lib/apt/lists/*

RUN /opt/conda/bin/conda config --add channels conda-forge \
  && /opt/conda/bin/conda update --all --yes --quiet \
  && /opt/conda/bin/conda install --yes conda-build \
  && /opt/conda/bin/conda clean --all --yes
