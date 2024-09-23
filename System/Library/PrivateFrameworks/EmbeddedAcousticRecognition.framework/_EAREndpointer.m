@implementation _EAREndpointer

+ (void)initialize
{
  EARLogger *v3;

  v3 = (EARLogger *)objc_opt_class();
  if (v3 == a1)
    EARLogger::initializeLogging(v3);
}

- (_EAREndpointer)initWithConfiguration:(id)a3
{
  return -[_EAREndpointer initWithConfiguration:modelVersion:](self, "initWithConfiguration:modelVersion:", a3, 0);
}

- (_EAREndpointer)initWithConfiguration:(id)a3 modelVersion:(id *)a4
{
  id v6;
  id v7;
  void *v8;
  int v9;
  EARLogger *v10;
  NSObject *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  _EAREndpointer *v18;
  quasar::HybridEndpointer *v19;
  void **v20;
  void *__p;
  uint64_t v23;
  uint64_t v24;
  void *v25[2];
  uint64_t v26;
  objc_super v27;

  v6 = a3;
  v27.receiver = self;
  v27.super_class = (Class)_EAREndpointer;
  v7 = -[_EAREndpointer init](&v27, sel_init);
  if (!v7)
  {
LABEL_20:
    v18 = (_EAREndpointer *)v7;
    goto LABEL_21;
  }
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "fileExistsAtPath:", v6);

  if (v9)
  {
    v25[0] = 0;
    v25[1] = 0;
    v26 = 0;
    if (v6)
    {
      objc_msgSend(v6, "ear_toString");
    }
    else
    {
      __p = 0;
      v23 = 0;
      v24 = 0;
    }
    v19 = (quasar::HybridEndpointer *)operator new();
    quasar::HybridEndpointer::HybridEndpointer(v19, &__p, 0, v25);
    std::unique_ptr<quasar::HybridEndpointer>::reset[abi:ne180100]((quasar::HybridEndpointer **)v7 + 1, v19);
    if (SHIBYTE(v24) < 0)
      operator delete(__p);
    if (*((_QWORD *)v7 + 1))
    {
      if (a4)
      {
        if (v26 >= 0)
          v20 = v25;
        else
          v20 = (void **)v25[0];
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", v20, __p, v23, v24);
        *a4 = (id)objc_claimAutoreleasedReturnValue();
      }
      if (SHIBYTE(v26) < 0)
        operator delete(v25[0]);
      goto LABEL_20;
    }
    if (SHIBYTE(v26) < 0)
      operator delete(v25[0]);
  }
  else
  {
    EARLogger::QuasarOSLogger(v10);
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      -[_EAROnDeviceEndpointerInfo initWithConfig:].cold.1((uint64_t)v6, v11, v12, v13, v14, v15, v16, v17);

  }
  v18 = 0;
LABEL_21:

  return v18;
}

- (_EAREndpointer)initWithConfiguration:(id)a3 delaysTrigger:(BOOL)a4 modelVersion:(id *)a5
{
  _BOOL8 v6;
  id v8;
  id v9;
  void *v10;
  int v11;
  EARLogger *v12;
  NSObject *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  _EAREndpointer *v20;
  quasar::HybridEndpointer *v21;
  void **v22;
  void *__p;
  uint64_t v25;
  uint64_t v26;
  void *v27[2];
  uint64_t v28;
  objc_super v29;

  v6 = a4;
  v8 = a3;
  v29.receiver = self;
  v29.super_class = (Class)_EAREndpointer;
  v9 = -[_EAREndpointer init](&v29, sel_init);
  if (!v9)
  {
LABEL_20:
    v20 = (_EAREndpointer *)v9;
    goto LABEL_21;
  }
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "fileExistsAtPath:", v8);

  if (v11)
  {
    v27[0] = 0;
    v27[1] = 0;
    v28 = 0;
    if (v8)
    {
      objc_msgSend(v8, "ear_toString");
    }
    else
    {
      __p = 0;
      v25 = 0;
      v26 = 0;
    }
    v21 = (quasar::HybridEndpointer *)operator new();
    quasar::HybridEndpointer::HybridEndpointer(v21, &__p, v6, v27);
    std::unique_ptr<quasar::HybridEndpointer>::reset[abi:ne180100]((quasar::HybridEndpointer **)v9 + 1, v21);
    if (SHIBYTE(v26) < 0)
      operator delete(__p);
    if (*((_QWORD *)v9 + 1))
    {
      if (a5)
      {
        if (v28 >= 0)
          v22 = v27;
        else
          v22 = (void **)v27[0];
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", v22, __p, v25, v26);
        *a5 = (id)objc_claimAutoreleasedReturnValue();
      }
      if (SHIBYTE(v28) < 0)
        operator delete(v27[0]);
      goto LABEL_20;
    }
    if (SHIBYTE(v28) < 0)
      operator delete(v27[0]);
  }
  else
  {
    EARLogger::QuasarOSLogger(v12);
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      -[_EAROnDeviceEndpointerInfo initWithConfig:].cold.1((uint64_t)v8, v13, v14, v15, v16, v17, v18, v19);

  }
  v20 = 0;
LABEL_21:

  return v20;
}

- (BOOL)requestSupportedWithSamplingRate:(unint64_t)a3
{
  return quasar::HybridEndpointer::configureForRequest((quasar::HybridEndpointer *)self->_endpointer.__ptr_.__value_, a3);
}

- (void)updateEndpointerThresholdWithValue:(float)a3
{
  quasar::HybridEndpointer::updateEndpointThreshold((quasar::HybridEndpointer *)self->_endpointer.__ptr_.__value_, a3);
}

- (void)updateEndpointerDelayedTriggerSwitch:(BOOL)a3
{
  quasar::HybridEndpointer::updateEndpointDelayedTriggerSwitch((quasar::HybridEndpointer *)self->_endpointer.__ptr_.__value_, a3);
}

- (BOOL)didEndpointWithFeatures:(id)a3 audioTimestamp:(double)a4 featuresToLog:(id *)a5 endpointPosterior:(float *)a6 extraDelayMs:(int *)a7
{
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  id v15;
  int v16;
  int v17;
  char *v18;
  char *v19;
  char *v20;
  uint64_t v21;
  unint64_t v22;
  uint64_t v23;
  unint64_t v24;
  char *v25;
  char *v26;
  int v27;
  HybridEndpointer *value;
  void *v29;
  int v30;
  int v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  double v39;
  double v40;
  double v41;
  float v42;
  float v43;
  float v44;
  float v45;
  int v46;
  float v47;
  float v48;
  float v49;
  float v50;
  float v51;
  BOOL v52;
  float *v53;
  int *v55;
  id v57;
  void *__p;
  char *v59;
  char *v60;
  int v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  void *v66;
  void *v67;
  uint64_t v68;
  uint64_t v69;

  v69 = *MEMORY[0x1E0C80C00];
  v61 = 0;
  v57 = a3;
  objc_msgSend(v57, "pauseCounts");
  v55 = a7;
  v59 = 0;
  v60 = 0;
  __p = 0;
  v62 = 0u;
  v63 = 0u;
  v64 = 0u;
  v65 = 0u;
  v11 = (id)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v62, &v66, 16);
  if (v12)
  {
    v13 = *(_QWORD *)v63;
    do
    {
      for (i = 0; i != v12; ++i)
      {
        if (*(_QWORD *)v63 != v13)
          objc_enumerationMutation(v11);
        v15 = *(id *)(*((_QWORD *)&v62 + 1) + 8 * i);
        v16 = objc_msgSend(v15, "unsignedIntValue");
        v17 = v16;
        v18 = v59;
        if (v59 >= v60)
        {
          v20 = (char *)__p;
          v21 = (v59 - (_BYTE *)__p) >> 2;
          v22 = v21 + 1;
          if ((unint64_t)(v21 + 1) >> 62)
            std::vector<int>::__throw_length_error[abi:ne180100]();
          v23 = v60 - (_BYTE *)__p;
          if ((v60 - (_BYTE *)__p) >> 1 > v22)
            v22 = v23 >> 1;
          if ((unint64_t)v23 >= 0x7FFFFFFFFFFFFFFCLL)
            v24 = 0x3FFFFFFFFFFFFFFFLL;
          else
            v24 = v22;
          if (v24)
          {
            v25 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<int>>((uint64_t)&v60, v24);
            v20 = (char *)__p;
            v18 = v59;
          }
          else
          {
            v25 = 0;
          }
          v26 = &v25[4 * v21];
          *(_DWORD *)v26 = v17;
          v19 = v26 + 4;
          while (v18 != v20)
          {
            v27 = *((_DWORD *)v18 - 1);
            v18 -= 4;
            *((_DWORD *)v26 - 1) = v27;
            v26 -= 4;
          }
          __p = v26;
          v59 = v19;
          v60 = &v25[4 * v24];
          if (v20)
            operator delete(v20);
        }
        else
        {
          *(_DWORD *)v59 = v16;
          v19 = v18 + 4;
        }
        v59 = v19;

      }
      v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v62, &v66, 16);
    }
    while (v12);
  }

  v66 = 0;
  v67 = 0;
  v68 = 0;
  LODWORD(v62) = 0;
  value = self->_endpointer.__ptr_.__value_;
  v29 = v57;
  v30 = objc_msgSend(v57, "wordCount");
  v31 = objc_msgSend(v57, "trailingSilenceDuration");
  objc_msgSend(v57, "endOfSentenceLikelihood");
  v33 = v32;
  objc_msgSend(v57, "acousticEndpointerScore");
  v35 = v34;
  objc_msgSend(v57, "silencePosterior");
  v37 = v36;
  objc_msgSend(v57, "clientSilenceFramesCountMs");
  v39 = v38;
  objc_msgSend(v57, "clientSilenceProbability");
  v41 = v40;
  objc_msgSend(v57, "silencePosteriorNF");
  v43 = v42;
  objc_msgSend(v57, "serverFeaturesLatency");
  v45 = v44;
  v46 = objc_msgSend(v57, "eagerResultEndTime");
  v47 = v33;
  v48 = v35;
  v49 = v37;
  v50 = v39;
  v51 = v41;
  v52 = quasar::HybridEndpointer::evalEndPoint((uint64_t)value, (float *)&v61, v30, v31, (unsigned int **)&__p, v46, (double **)&v66, &v62, a4, v47, v48, v49, v50, v51, v43, v45);
  v53 = a6;
  if (v55)
    *v55 = v62;
  if (a5 && v66 != v67)
  {
    EARHelpers::VectorToArray<double>((double **)&v66);
    v29 = v57;
    *a5 = (id)objc_claimAutoreleasedReturnValue();
    v53 = a6;
  }
  if (v53)
    *(_DWORD *)v53 = v61;
  if (v66)
  {
    v67 = v66;
    operator delete(v66);
  }
  if (__p)
  {
    v59 = (char *)__p;
    operator delete(__p);
  }

  return v52;
}

- (id)defaultServerEndpointFeatures
{
  _EARDefaultServerEndpointFeatures *v2;
  float v3;
  float v4;
  int v5;
  int v6;
  double v7;
  double v8;
  double v9;
  _EARDefaultServerEndpointFeatures *v10;
  void *__p[2];
  char v13;
  void *v14[2];
  char v15;
  void *v16[2];
  char v17;
  void *v18[2];
  char v19;
  void *v20[2];
  char v21;
  uint64_t *v22[3];
  void **v23;

  quasar::HybridEndpointer::defaultServerEndpointFeatures((const void ***)self->_endpointer.__ptr_.__value_, (uint64_t *)v22);
  v2 = [_EARDefaultServerEndpointFeatures alloc];
  std::string::basic_string[abi:ne180100]<0>(v20, quasar::EP_NUM_OF_WORDS_STR[0]);
  v18[0] = v20;
  v3 = *((float *)std::__tree<std::__value_type<std::string,float>,std::__map_value_compare<std::string,std::__value_type<std::string,float>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,float>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string&&>,std::tuple<>>(v22, (const void **)v20, (uint64_t)&std::piecewise_construct, (_OWORD **)v18)+ 14);
  std::string::basic_string[abi:ne180100]<0>(v18, quasar::EP_NUM_TRAILING_SIL_STR[0]);
  v16[0] = v18;
  v4 = *((float *)std::__tree<std::__value_type<std::string,float>,std::__map_value_compare<std::string,std::__value_type<std::string,float>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,float>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string&&>,std::tuple<>>(v22, (const void **)v18, (uint64_t)&std::piecewise_construct, (_OWORD **)v16)+ 14);
  std::string::basic_string[abi:ne180100]<0>(v16, quasar::EP_EOS_LIKELIHOOD_STR[0]);
  v14[0] = v16;
  v5 = *((_DWORD *)std::__tree<std::__value_type<std::string,float>,std::__map_value_compare<std::string,std::__value_type<std::string,float>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,float>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string&&>,std::tuple<>>(v22, (const void **)v16, (uint64_t)&std::piecewise_construct, (_OWORD **)v14)+ 14);
  std::string::basic_string[abi:ne180100]<0>(v14, quasar::EP_ACOUSTIC_EP_SCORE_STR[0]);
  __p[0] = v14;
  v6 = *((_DWORD *)std::__tree<std::__value_type<std::string,float>,std::__map_value_compare<std::string,std::__value_type<std::string,float>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,float>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string&&>,std::tuple<>>(v22, (const void **)v14, (uint64_t)&std::piecewise_construct, (_OWORD **)__p)+ 14);
  std::string::basic_string[abi:ne180100]<0>(__p, quasar::EP_SILENCE_POSTERIOR_STR[0]);
  v23 = __p;
  LODWORD(v7) = *((_DWORD *)std::__tree<std::__value_type<std::string,float>,std::__map_value_compare<std::string,std::__value_type<std::string,float>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,float>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string&&>,std::tuple<>>(v22, (const void **)__p, (uint64_t)&std::piecewise_construct, (_OWORD **)&v23)+ 14);
  LODWORD(v8) = v5;
  LODWORD(v9) = v6;
  v10 = -[_EARDefaultServerEndpointFeatures initWithWordCount:trailingSilenceDuration:endOfSentenceLikelihood:acousticEndpointerScore:silencePosterior:](v2, "initWithWordCount:trailingSilenceDuration:endOfSentenceLikelihood:acousticEndpointerScore:silencePosterior:", (uint64_t)v3, (uint64_t)v4, v8, v9, v7);
  if (v13 < 0)
    operator delete(__p[0]);
  if (v15 < 0)
    operator delete(v14[0]);
  if (v17 < 0)
    operator delete(v16[0]);
  if (v19 < 0)
    operator delete(v18[0]);
  if (v21 < 0)
    operator delete(v20[0]);
  std::__tree<std::string>::destroy((uint64_t)v22, (char *)v22[1]);
  return v10;
}

- (BOOL)acceptEagerResultWithFeatures:(id)a3 featuresToLog:(id *)a4
{
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  id v9;
  int v10;
  int v11;
  char *v12;
  char *v13;
  char *v14;
  uint64_t v15;
  unint64_t v16;
  uint64_t v17;
  unint64_t v18;
  char *v19;
  char *v20;
  int v21;
  HybridEndpointer *value;
  void *v23;
  int v24;
  int v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  float v34;
  float v35;
  float v36;
  float v37;
  int v38;
  float v39;
  float v40;
  float v41;
  float v42;
  char v43;
  void *v44;
  id v47;
  void *__p;
  char *v49;
  char *v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  void *v55;
  void *v56;
  uint64_t v57;
  uint64_t v58;

  v58 = *MEMORY[0x1E0C80C00];
  v47 = a3;
  objc_msgSend(v47, "pauseCounts");
  v49 = 0;
  v50 = 0;
  __p = 0;
  v51 = 0u;
  v52 = 0u;
  v53 = 0u;
  v54 = 0u;
  v5 = (id)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v51, &v55, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v52;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v52 != v7)
          objc_enumerationMutation(v5);
        v9 = *(id *)(*((_QWORD *)&v51 + 1) + 8 * i);
        v10 = objc_msgSend(v9, "unsignedIntValue");
        v11 = v10;
        v12 = v49;
        if (v49 >= v50)
        {
          v14 = (char *)__p;
          v15 = (v49 - (_BYTE *)__p) >> 2;
          v16 = v15 + 1;
          if ((unint64_t)(v15 + 1) >> 62)
            std::vector<int>::__throw_length_error[abi:ne180100]();
          v17 = v50 - (_BYTE *)__p;
          if ((v50 - (_BYTE *)__p) >> 1 > v16)
            v16 = v17 >> 1;
          if ((unint64_t)v17 >= 0x7FFFFFFFFFFFFFFCLL)
            v18 = 0x3FFFFFFFFFFFFFFFLL;
          else
            v18 = v16;
          if (v18)
          {
            v19 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<int>>((uint64_t)&v50, v18);
            v14 = (char *)__p;
            v12 = v49;
          }
          else
          {
            v19 = 0;
          }
          v20 = &v19[4 * v15];
          *(_DWORD *)v20 = v11;
          v13 = v20 + 4;
          while (v12 != v14)
          {
            v21 = *((_DWORD *)v12 - 1);
            v12 -= 4;
            *((_DWORD *)v20 - 1) = v21;
            v20 -= 4;
          }
          __p = v20;
          v49 = v13;
          v50 = &v19[4 * v18];
          if (v14)
            operator delete(v14);
        }
        else
        {
          *(_DWORD *)v49 = v10;
          v13 = v12 + 4;
        }
        v49 = v13;

      }
      v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v51, &v55, 16);
    }
    while (v6);
  }

  v55 = 0;
  v56 = 0;
  v57 = 0;
  value = self->_endpointer.__ptr_.__value_;
  v23 = v47;
  v24 = objc_msgSend(v47, "wordCount");
  v25 = objc_msgSend(v47, "trailingSilenceDuration");
  objc_msgSend(v47, "endOfSentenceLikelihood");
  v27 = v26;
  objc_msgSend(v47, "silencePosterior");
  v29 = v28;
  objc_msgSend(v47, "clientSilenceFramesCountMs");
  v31 = v30;
  objc_msgSend(v47, "clientSilenceProbability");
  v33 = v32;
  objc_msgSend(v47, "silencePosteriorNF");
  v35 = v34;
  objc_msgSend(v47, "serverFeaturesLatency");
  v37 = v36;
  v38 = objc_msgSend(v47, "eagerResultEndTime");
  v39 = v27;
  v40 = v29;
  v41 = v31;
  v42 = v33;
  v43 = quasar::HybridEndpointer::acceptEagerResult(value, v24, v25, (unsigned int **)&__p, v38, (char *)&v55, v39, v40, v41, v42, v35, v37);
  v44 = v55;
  if (a4 && v55 != v56)
  {
    EARHelpers::VectorToArray<double>((double **)&v55);
    v23 = v47;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
    v44 = v55;
  }
  if (v44)
  {
    v56 = v44;
    operator delete(v44);
  }
  if (__p)
  {
    v49 = (char *)__p;
    operator delete(__p);
  }

  return v43;
}

- (void).cxx_destruct
{
  std::unique_ptr<quasar::HybridEndpointer>::reset[abi:ne180100]((quasar::HybridEndpointer **)&self->_endpointer, 0);
}

- (id).cxx_construct
{
  *((_QWORD *)self + 1) = 0;
  return self;
}

@end
