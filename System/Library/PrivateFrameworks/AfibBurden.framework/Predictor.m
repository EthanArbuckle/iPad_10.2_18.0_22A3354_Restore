@implementation Predictor

- (Predictor)init
{
  Predictor *v2;
  uint64_t v3;
  id v4;
  MLMultiArray *TeModelInput;
  Predictor *v6;
  id v7;
  void *v8;
  Te_c3seuakuh8 *v9;
  id v10;
  Te_c3seuakuh8 *mTe_c3seuakuh8;
  Te_tjejjxf8q3 *v12;
  Te_tjejjxf8q3 *mTe_tjejjxf8q3;
  MLPredictionOptions *v14;
  MLPredictionOptions *modelOptions;
  MLPredictionOptions *v16;
  id v18;
  id v19;
  id v20;
  objc_super v21;

  v21.receiver = self;
  v21.super_class = (Class)Predictor;
  v2 = -[Predictor init](&v21, sel_init);
  if (v2)
  {
    v20 = 0;
    v3 = objc_msgSend(objc_alloc(MEMORY[0x24BDBFFF0]), "initWithShape:dataType:error:", &unk_25075A3D8, 65600, &v20);
    v4 = v20;
    TeModelInput = v2->_TeModelInput;
    v2->_TeModelInput = (MLMultiArray *)v3;

    if (v4)
    {
      v6 = 0;
LABEL_13:

      goto LABEL_14;
    }
    v7 = objc_alloc_init(MEMORY[0x24BDBFFD8]);
    v8 = v7;
    if (v7)
    {
      objc_msgSend(v7, "setComputeUnits:", 0);
      v19 = 0;
      v9 = -[Te_c3seuakuh8 initWithConfiguration:error:]([Te_c3seuakuh8 alloc], "initWithConfiguration:error:", v8, &v19);
      v10 = v19;
      mTe_c3seuakuh8 = v2->_mTe_c3seuakuh8;
      v2->_mTe_c3seuakuh8 = v9;

      v18 = v10;
      v12 = -[Te_tjejjxf8q3 initWithConfiguration:error:]([Te_tjejjxf8q3 alloc], "initWithConfiguration:error:", v8, &v18);
      v4 = v18;

      mTe_tjejjxf8q3 = v2->_mTe_tjejjxf8q3;
      v2->_mTe_tjejjxf8q3 = v12;

      if (v2->_mTe_c3seuakuh8)
      {
        if (v2->_mTe_tjejjxf8q3)
        {
          v14 = (MLPredictionOptions *)objc_alloc_init(MEMORY[0x24BDC0018]);
          modelOptions = v2->_modelOptions;
          v2->_modelOptions = v14;

          v16 = v2->_modelOptions;
          if (v16)
          {
            -[MLPredictionOptions setUsesCPUOnly:](v16, "setUsesCPUOnly:", 1);
            v6 = v2;
LABEL_12:

            goto LABEL_13;
          }
        }
      }
    }
    else
    {
      v4 = 0;
    }
    v6 = 0;
    goto LABEL_12;
  }
  v6 = 0;
LABEL_14:

  return v6;
}

- (BOOL)predict:(void *)a3 afib:(void *)a4 be_mode:(BOOL *)a5 with_error_status:(BOOL *)a6
{
  uint64_t i;
  MLMultiArray *TeModelInput;
  void *v12;
  Te_c3seuakuh8Input *v13;
  Te_c3seuakuh8Input *TeModelInput_c3seuakuh8;
  Te_tjejjxf8q3Input *v15;
  Te_tjejjxf8q3Input *TeModelInput_tjejjxf8q3;
  Te_c3seuakuh8 *mTe_c3seuakuh8;
  Te_c3seuakuh8Input *v18;
  MLPredictionOptions *modelOptions;
  Te_c3seuakuh8Output *v20;
  unint64_t v21;
  Te_c3seuakuh8Output *TeModelOutput_c3seuakuh8;
  Te_tjejjxf8q3 *mTe_tjejjxf8q3;
  Te_tjejjxf8q3Input *v24;
  MLPredictionOptions *v25;
  Te_tjejjxf8q3Output *v26;
  unint64_t v27;
  Te_tjejjxf8q3Output *TeModelOutput_tjejjxf8q3;
  BOOL v29;
  void *v30;
  void *v31;
  double v32;
  double v33;
  void *v34;
  void *v35;
  double v36;
  double v37;
  double v38;
  double v39;
  double v40;
  float v41;
  unint64_t v42;
  float *v43;
  float *v44;
  float *v45;
  uint64_t v46;
  unint64_t v47;
  uint64_t v48;
  unint64_t v49;
  char *v50;
  float *v51;
  char *v52;
  int v53;
  std::string *v54;
  __int128 v55;
  std::string *v56;
  __int128 v57;
  std::string *v58;
  std::string::size_type size;
  std::string *v60;
  void *v61;
  int v62;
  NSObject *v63;
  void **p_p;
  std::string v66;
  std::string v67;
  std::string v68;
  id v69;
  id v70;
  void *__p;
  __int128 v72;
  void *v73;
  void *v74;
  uint64_t v75;
  std::string v76;
  _QWORD v77[3];

  v77[2] = *MEMORY[0x24BDAC8D0];
  v73 = 0;
  v74 = 0;
  v75 = 0;
  __p = 0;
  v72 = 0uLL;
  -[Predictor resample:output:](self, "resample:output:", a3, &v73);
  for (i = 0; i != 240; ++i)
  {
    TeModelInput = self->_TeModelInput;
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", *((double *)v73 + i));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[MLMultiArray setObject:atIndexedSubscript:](TeModelInput, "setObject:atIndexedSubscript:", v12, i);

  }
  v13 = -[Te_c3seuakuh8Input initWithPlaceholder:]([Te_c3seuakuh8Input alloc], "initWithPlaceholder:", self->_TeModelInput);
  TeModelInput_c3seuakuh8 = self->_TeModelInput_c3seuakuh8;
  self->_TeModelInput_c3seuakuh8 = v13;

  v15 = -[Te_tjejjxf8q3Input initWithPlaceholder:]([Te_tjejjxf8q3Input alloc], "initWithPlaceholder:", self->_TeModelInput);
  TeModelInput_tjejjxf8q3 = self->_TeModelInput_tjejjxf8q3;
  self->_TeModelInput_tjejjxf8q3 = v15;

  mTe_c3seuakuh8 = self->_mTe_c3seuakuh8;
  v18 = self->_TeModelInput_c3seuakuh8;
  modelOptions = self->_modelOptions;
  v70 = 0;
  -[Te_c3seuakuh8 predictionFromFeatures:options:error:](mTe_c3seuakuh8, "predictionFromFeatures:options:error:", v18, modelOptions, &v70);
  v20 = (Te_c3seuakuh8Output *)objc_claimAutoreleasedReturnValue();
  v21 = (unint64_t)v70;
  TeModelOutput_c3seuakuh8 = self->_TeModelOutput_c3seuakuh8;
  self->_TeModelOutput_c3seuakuh8 = v20;

  mTe_tjejjxf8q3 = self->_mTe_tjejjxf8q3;
  v24 = self->_TeModelInput_tjejjxf8q3;
  v25 = self->_modelOptions;
  v69 = 0;
  -[Te_tjejjxf8q3 predictionFromFeatures:options:error:](mTe_tjejjxf8q3, "predictionFromFeatures:options:error:", v24, v25, &v69);
  v26 = (Te_tjejjxf8q3Output *)objc_claimAutoreleasedReturnValue();
  v27 = (unint64_t)v69;
  TeModelOutput_tjejjxf8q3 = self->_TeModelOutput_tjejjxf8q3;
  self->_TeModelOutput_tjejjxf8q3 = v26;

  if (v21 | v27)
  {
    v29 = 0;
    *a6 = 1;
  }
  else
  {
    *a6 = 0;
    -[Te_c3seuakuh8Output RHYTHM_TYPE_HEAD_FC_1_fully_connected_BiasAdd](self->_TeModelOutput_c3seuakuh8, "RHYTHM_TYPE_HEAD_FC_1_fully_connected_BiasAdd");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "objectAtIndexedSubscript:", 1);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "doubleValue");
    v33 = exp(v32 * -1.62473583 + 0.976720872);

    -[Te_tjejjxf8q3Output RHYTHM_TYPE_HEAD_FC_1_fully_connected_BiasAdd](self->_TeModelOutput_tjejjxf8q3, "RHYTHM_TYPE_HEAD_FC_1_fully_connected_BiasAdd");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "objectAtIndexedSubscript:", 1);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "doubleValue");
    v37 = exp(v36 * -1.51426294 + 0.182884028);

    v38 = 1.0 / (v33 + 1.0);
    v39 = 1.0 / (v37 + 1.0);
    v40 = (v38 + v39) * 0.5;
    v41 = v40;
    v42 = *((_QWORD *)a4 + 2);
    v43 = (float *)*((_QWORD *)a4 + 1);
    if ((unint64_t)v43 >= v42)
    {
      v45 = *(float **)a4;
      v46 = ((uint64_t)v43 - *(_QWORD *)a4) >> 2;
      v47 = v46 + 1;
      if ((unint64_t)(v46 + 1) >> 62)
        std::vector<float>::__throw_length_error[abi:ne180100]();
      v48 = v42 - (_QWORD)v45;
      if (v48 >> 1 > v47)
        v47 = v48 >> 1;
      if ((unint64_t)v48 >= 0x7FFFFFFFFFFFFFFCLL)
        v49 = 0x3FFFFFFFFFFFFFFFLL;
      else
        v49 = v47;
      if (v49)
      {
        v50 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<int>>((uint64_t)a4 + 16, v49);
        v45 = *(float **)a4;
        v43 = (float *)*((_QWORD *)a4 + 1);
      }
      else
      {
        v50 = 0;
      }
      v51 = (float *)&v50[4 * v46];
      v52 = &v50[4 * v49];
      *v51 = v41;
      v44 = v51 + 1;
      while (v43 != v45)
      {
        v53 = *((_DWORD *)v43-- - 1);
        *((_DWORD *)v51-- - 1) = v53;
      }
      *(_QWORD *)a4 = v51;
      *((_QWORD *)a4 + 1) = v44;
      *((_QWORD *)a4 + 2) = v52;
      if (v45)
        operator delete(v45);
    }
    else
    {
      *v43 = v41;
      v44 = v43 + 1;
    }
    *((_QWORD *)a4 + 1) = v44;
    std::to_string(&v67, v38);
    v54 = std::string::insert(&v67, 0, "Tellurium AFib probabilities from two models: ");
    v55 = *(_OWORD *)&v54->__r_.__value_.__l.__data_;
    v68.__r_.__value_.__r.__words[2] = v54->__r_.__value_.__r.__words[2];
    *(_OWORD *)&v68.__r_.__value_.__l.__data_ = v55;
    v54->__r_.__value_.__l.__size_ = 0;
    v54->__r_.__value_.__r.__words[2] = 0;
    v54->__r_.__value_.__r.__words[0] = 0;
    v56 = std::string::append(&v68, " ");
    v57 = *(_OWORD *)&v56->__r_.__value_.__l.__data_;
    v76.__r_.__value_.__r.__words[2] = v56->__r_.__value_.__r.__words[2];
    *(_OWORD *)&v76.__r_.__value_.__l.__data_ = v57;
    v56->__r_.__value_.__l.__size_ = 0;
    v56->__r_.__value_.__r.__words[2] = 0;
    v56->__r_.__value_.__r.__words[0] = 0;
    std::to_string(&v66, v39);
    if ((v66.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
      v58 = &v66;
    else
      v58 = (std::string *)v66.__r_.__value_.__r.__words[0];
    if ((v66.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
      size = HIBYTE(v66.__r_.__value_.__r.__words[2]);
    else
      size = v66.__r_.__value_.__l.__size_;
    v60 = std::string::append(&v76, (const std::string::value_type *)v58, size);
    v61 = (void *)v60->__r_.__value_.__r.__words[0];
    v77[0] = v60->__r_.__value_.__l.__size_;
    *(_QWORD *)((char *)v77 + 7) = *(std::string::size_type *)((char *)&v60->__r_.__value_.__r.__words[1] + 7);
    v62 = SHIBYTE(v60->__r_.__value_.__r.__words[2]);
    v60->__r_.__value_.__l.__size_ = 0;
    v60->__r_.__value_.__r.__words[2] = 0;
    v60->__r_.__value_.__r.__words[0] = 0;
    if (SHIBYTE(v72) < 0)
      operator delete(__p);
    __p = v61;
    *(_QWORD *)&v72 = v77[0];
    *(_QWORD *)((char *)&v72 + 7) = *(_QWORD *)((char *)v77 + 7);
    HIBYTE(v72) = v62;
    if (SHIBYTE(v66.__r_.__value_.__r.__words[2]) < 0)
      operator delete(v66.__r_.__value_.__l.__data_);
    if (SHIBYTE(v76.__r_.__value_.__r.__words[2]) < 0)
      operator delete(v76.__r_.__value_.__l.__data_);
    if (SHIBYTE(v68.__r_.__value_.__r.__words[2]) < 0)
      operator delete(v68.__r_.__value_.__l.__data_);
    if (SHIBYTE(v67.__r_.__value_.__r.__words[2]) < 0)
      operator delete(v67.__r_.__value_.__l.__data_);
    algs_get_log_0();
    v63 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v63, OS_LOG_TYPE_DEFAULT))
    {
      p_p = &__p;
      if (v62 < 0)
        p_p = (void **)v61;
      LODWORD(v76.__r_.__value_.__l.__data_) = 136446210;
      *(std::string::size_type *)((char *)v76.__r_.__value_.__r.__words + 4) = (std::string::size_type)p_p;
      _os_log_impl(&dword_235FAB000, v63, OS_LOG_TYPE_DEFAULT, "%{public}s", (uint8_t *)&v76, 0xCu);
    }

    v29 = v40 > dbl_235FC30A0[!*a5];
    if (SHIBYTE(v72) < 0)
      operator delete(__p);
  }
  if (v73)
  {
    v74 = v73;
    operator delete(v73);
  }

  return v29;
}

- (void)resample:(void *)a3 output:(void *)a4
{
  double *v6;
  uint64_t v7;
  uint64_t v8;
  _QWORD *v9;
  double *v10;
  double v11;
  double *v12;
  double *v13;
  uint64_t v14;
  unint64_t v15;
  uint64_t v16;
  unint64_t v17;
  char *v18;
  char *v19;
  uint64_t v20;
  double *v21;
  uint64_t v22;
  unint64_t v23;
  double v24;
  double *v25;
  uint64_t v26;
  unint64_t v27;
  uint64_t v28;
  unint64_t v29;
  char *v30;
  double *v31;
  double *v32;
  uint64_t v33;
  double *v34;
  uint64_t v35;
  int v36;
  _QWORD *v37;
  double *v38;
  int v39;
  double v40;
  double *v41;
  uint64_t v42;
  unint64_t v43;
  uint64_t v44;
  unint64_t v45;
  char *v46;
  double *v47;
  uint64_t v48;
  double *v49;
  unint64_t v50;
  _QWORD *v51;
  unint64_t v52;
  uint64_t v53;
  uint64_t v54;
  unint64_t v55;
  uint64_t v56;
  char *v57;
  double *v58;
  double *v59;
  uint64_t v60;
  double *__p;
  double *v62;
  double *v63;

  __p = 0;
  v62 = 0;
  v63 = 0;
  std::vector<double>::reserve((void **)a4, 0xF0uLL);
  v6 = *(double **)a3;
  v7 = *((_QWORD *)a3 + 1);
  if (v7 - *(_QWORD *)a3 != 8)
  {
    v21 = 0;
    v22 = 0;
    do
    {
      v23 = v22 + 1;
      v24 = 60.0 / (v6[v22 + 1] - v6[v22]);
      if (v21 >= v63)
      {
        v25 = __p;
        v26 = v21 - __p;
        v27 = v26 + 1;
        if ((unint64_t)(v26 + 1) >> 61)
          std::vector<float>::__throw_length_error[abi:ne180100]();
        v28 = (char *)v63 - (char *)__p;
        if (((char *)v63 - (char *)__p) >> 2 > v27)
          v27 = v28 >> 2;
        if ((unint64_t)v28 >= 0x7FFFFFFFFFFFFFF8)
          v29 = 0x1FFFFFFFFFFFFFFFLL;
        else
          v29 = v27;
        if (v29)
        {
          v30 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<double>>((uint64_t)&v63, v29);
          v25 = __p;
          v21 = v62;
        }
        else
        {
          v30 = 0;
        }
        v31 = (double *)&v30[8 * v26];
        *v31 = v24;
        v32 = v31 + 1;
        while (v21 != v25)
        {
          v33 = *((_QWORD *)v21-- - 1);
          *((_QWORD *)v31-- - 1) = v33;
        }
        __p = v31;
        v63 = (double *)&v30[8 * v29];
        if (v25)
          operator delete(v25);
        v21 = v32;
      }
      else
      {
        *v21++ = v24;
      }
      v62 = v21;
      v6 = *(double **)a3;
      v7 = *((_QWORD *)a3 + 1);
      ++v22;
    }
    while (((v7 - *(_QWORD *)a3) >> 3) - 1 > v23);
  }
  v8 = v7 - 8;
  *((_QWORD *)a3 + 1) = v7 - 8;
  if (*v6 <= 0.0)
  {
    v11 = 0.0;
  }
  else
  {
    v9 = (char *)a4 + 16;
    v10 = (double *)*((_QWORD *)a4 + 1);
    v11 = 0.0;
    do
    {
      if ((unint64_t)v10 >= *v9)
      {
        v13 = *(double **)a4;
        v14 = ((uint64_t)v10 - *(_QWORD *)a4) >> 3;
        v15 = v14 + 1;
        if ((unint64_t)(v14 + 1) >> 61)
          std::vector<float>::__throw_length_error[abi:ne180100]();
        v16 = *v9 - (_QWORD)v13;
        if (v16 >> 2 > v15)
          v15 = v16 >> 2;
        if ((unint64_t)v16 >= 0x7FFFFFFFFFFFFFF8)
          v17 = 0x1FFFFFFFFFFFFFFFLL;
        else
          v17 = v15;
        if (v17)
        {
          v18 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<double>>((uint64_t)a4 + 16, v17);
          v13 = *(double **)a4;
          v10 = (double *)*((_QWORD *)a4 + 1);
        }
        else
        {
          v18 = 0;
        }
        v19 = &v18[8 * v14];
        *(_QWORD *)v19 = 0;
        v12 = (double *)(v19 + 8);
        while (v10 != v13)
        {
          v20 = *((_QWORD *)v10-- - 1);
          *((_QWORD *)v19 - 1) = v20;
          v19 -= 8;
        }
        *(_QWORD *)a4 = v19;
        *((_QWORD *)a4 + 1) = v12;
        *((_QWORD *)a4 + 2) = &v18[8 * v17];
        if (v13)
          operator delete(v13);
      }
      else
      {
        *v10 = 0.0;
        v12 = v10 + 1;
      }
      *((_QWORD *)a4 + 1) = v12;
      v11 = v11 + 0.25;
      v6 = *(double **)a3;
      v10 = v12;
    }
    while (v11 < **(double **)a3);
    v8 = *((_QWORD *)a3 + 1);
  }
  if (v8 - (_QWORD)v6 == 8)
  {
    v34 = (double *)*((_QWORD *)a4 + 1);
  }
  else
  {
    v35 = 0;
    v36 = 0;
    v37 = (char *)a4 + 16;
    v38 = (double *)*((_QWORD *)a4 + 1);
    do
    {
      v39 = v36 + 1;
      v40 = __p[v35] + (__p[v39] - __p[v35]) / (v6[v39] - v6[v35]) * (v11 - v6[v35]);
      if ((unint64_t)v38 >= *v37)
      {
        v41 = *(double **)a4;
        v42 = ((uint64_t)v38 - *(_QWORD *)a4) >> 3;
        v43 = v42 + 1;
        if ((unint64_t)(v42 + 1) >> 61)
          std::vector<float>::__throw_length_error[abi:ne180100]();
        v44 = *v37 - (_QWORD)v41;
        if (v44 >> 2 > v43)
          v43 = v44 >> 2;
        if ((unint64_t)v44 >= 0x7FFFFFFFFFFFFFF8)
          v45 = 0x1FFFFFFFFFFFFFFFLL;
        else
          v45 = v43;
        if (v45)
        {
          v46 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<double>>((uint64_t)a4 + 16, v45);
          v41 = *(double **)a4;
          v38 = (double *)*((_QWORD *)a4 + 1);
        }
        else
        {
          v46 = 0;
        }
        v47 = (double *)&v46[8 * v42];
        *v47 = v40;
        v34 = v47 + 1;
        while (v38 != v41)
        {
          v48 = *((_QWORD *)v38-- - 1);
          *((_QWORD *)v47-- - 1) = v48;
        }
        *(_QWORD *)a4 = v47;
        *((_QWORD *)a4 + 1) = v34;
        *((_QWORD *)a4 + 2) = &v46[8 * v45];
        if (v41)
          operator delete(v41);
      }
      else
      {
        *v38 = v40;
        v34 = v38 + 1;
      }
      *((_QWORD *)a4 + 1) = v34;
      v11 = v11 + 0.25;
      v6 = *(double **)a3;
      if (v11 >= *(double *)(*(_QWORD *)a3 + 8 * v39))
        ++v36;
      v35 = v36;
      v38 = v34;
    }
    while (((uint64_t)(*((_QWORD *)a3 + 1) - (_QWORD)v6) >> 3) - 1 > (unint64_t)v36);
  }
  v49 = *(double **)a4;
  v50 = (unint64_t)v34 - *(_QWORD *)a4;
  if (v50 <= 0x77F)
  {
    v51 = (char *)a4 + 16;
    do
    {
      if ((unint64_t)v34 >= *v51)
      {
        v52 = v50 >> 3;
        v53 = *v51 - (_QWORD)v49;
        if (v53 >> 2 <= (v50 >> 3) + 1)
          v54 = v52 + 1;
        else
          v54 = v53 >> 2;
        if ((unint64_t)v53 >= 0x7FFFFFFFFFFFFFF8)
          v55 = 0x1FFFFFFFFFFFFFFFLL;
        else
          v55 = v54;
        v57 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<double>>((uint64_t)a4 + 16, v55);
        v58 = *(double **)a4;
        v59 = (double *)*((_QWORD *)a4 + 1);
        v49 = (double *)&v57[8 * v52];
        *v49 = 0.0;
        v34 = v49 + 1;
        while (v59 != v58)
        {
          v60 = *((_QWORD *)v59-- - 1);
          *((_QWORD *)v49-- - 1) = v60;
        }
        *(_QWORD *)a4 = v49;
        *((_QWORD *)a4 + 1) = v34;
        *((_QWORD *)a4 + 2) = &v57[8 * v56];
        if (v58)
        {
          operator delete(v58);
          v49 = *(double **)a4;
        }
      }
      else
      {
        *v34++ = 0.0;
      }
      *((_QWORD *)a4 + 1) = v34;
      v50 = (char *)v34 - (char *)v49;
    }
    while ((unint64_t)((char *)v34 - (char *)v49) < 0x780);
  }
  while (v49 != v34)
    ++v49;
  if (__p)
    operator delete(__p);
}

- (MLMultiArray)TeModelInput
{
  return self->_TeModelInput;
}

- (Te_c3seuakuh8)mTe_c3seuakuh8
{
  return self->_mTe_c3seuakuh8;
}

- (Te_tjejjxf8q3)mTe_tjejjxf8q3
{
  return self->_mTe_tjejjxf8q3;
}

- (Te_c3seuakuh8Output)TeModelOutput_c3seuakuh8
{
  return self->_TeModelOutput_c3seuakuh8;
}

- (Te_tjejjxf8q3Output)TeModelOutput_tjejjxf8q3
{
  return self->_TeModelOutput_tjejjxf8q3;
}

- (Te_c3seuakuh8Input)TeModelInput_c3seuakuh8
{
  return self->_TeModelInput_c3seuakuh8;
}

- (Te_tjejjxf8q3Input)TeModelInput_tjejjxf8q3
{
  return self->_TeModelInput_tjejjxf8q3;
}

- (MLPredictionOptions)modelOptions
{
  return self->_modelOptions;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_modelOptions, 0);
  objc_storeStrong((id *)&self->_TeModelInput_tjejjxf8q3, 0);
  objc_storeStrong((id *)&self->_TeModelInput_c3seuakuh8, 0);
  objc_storeStrong((id *)&self->_TeModelOutput_tjejjxf8q3, 0);
  objc_storeStrong((id *)&self->_TeModelOutput_c3seuakuh8, 0);
  objc_storeStrong((id *)&self->_mTe_tjejjxf8q3, 0);
  objc_storeStrong((id *)&self->_mTe_c3seuakuh8, 0);
  objc_storeStrong((id *)&self->_TeModelInput, 0);
}

@end
