@implementation MLTreeEnsembleRegressor

- (id)regress:(id)a3 options:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  MLPredictionEvent *v10;
  unint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void (**v14)(_QWORD);
  void *v15;
  MLMultiArray *v16;
  void *v17;
  void *v18;
  MLMultiArray *v19;
  unint64_t v20;
  uint64_t v21;
  void (**v22)(_QWORD);
  MLMultiArray *v23;
  CoreML::TreeEnsembles::Internal *v24;
  char *v25;
  const unsigned __int8 *v26;
  const double *v27;
  void *v28;
  _QWORD v30[6];
  _QWORD aBlock[6];
  id v32[7];
  _QWORD v33[3];

  v33[1] = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  -[MLModel predictionEvent](self, "predictionEvent");
  v10 = (MLPredictionEvent *)objc_claimAutoreleasedReturnValue();
  ElapsedTimeRecorder::ElapsedTimeRecorder((ElapsedTimeRecorder *)v32, v10, 24, -[MLModel signpostID](self, "signpostID"), objc_msgSend(v9, "parentSignpostID"), -[MLModel nextPredictionRequestID](self, "nextPredictionRequestID"));

  v11 = -[MLModel signpostID](self, "signpostID");
  v12 = objc_msgSend(v9, "parentSignpostID");
  kdebug_trace();
  v13 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __49__MLTreeEnsembleRegressor_regress_options_error___block_invoke;
  aBlock[3] = &__block_descriptor_48_e5_v8__0l;
  aBlock[4] = v11;
  aBlock[5] = v12;
  v14 = (void (**)(_QWORD))_Block_copy(aBlock);
  -[MLModel signpostID](self, "signpostID");
  kdebug_trace();
  -[MLModel vectorizeInput:error:](self, "vectorizeInput:error:", v8, a5);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[MLModel signpostID](self, "signpostID");
  kdebug_trace();
  if (v15)
  {
    v16 = [MLMultiArray alloc];
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", self->num_dimensions);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v33[0] = v17;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v33, 1);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = -[MLMultiArray initWithShape:dataType:error:](v16, "initWithShape:dataType:error:", v18, 65600, 0);

    v20 = -[MLModel signpostID](self, "signpostID");
    v21 = objc_msgSend(v9, "parentSignpostID");
    kdebug_trace();
    v30[0] = v13;
    v30[1] = 3221225472;
    v30[2] = __49__MLTreeEnsembleRegressor_regress_options_error___block_invoke_2;
    v30[3] = &__block_descriptor_48_e5_v8__0l;
    v30[4] = v20;
    v30[5] = v21;
    v22 = (void (**)(_QWORD))_Block_copy(v30);
    v23 = objc_retainAutorelease(v19);
    v24 = -[MLMultiArray mutableBytes](v23, "mutableBytes");
    v25 = -[MLTreeEnsembleRegressor modelData](self, "modelData");
    v26 = (const unsigned __int8 *)objc_msgSend(objc_retainAutorelease(v15), "bytes");
    CoreML::TreeEnsembles::Internal::predict(v24, (double *)v25, v26, v27);
    v22[2](v22);

    +[MLRegressorResult resultWithValue:](MLRegressorResult, "resultWithValue:", v23);
    v28 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v28 = 0;
  }

  v14[2](v14);
  ElapsedTimeRecorder::~ElapsedTimeRecorder(v32);

  return v28;
}

uint64_t __49__MLTreeEnsembleRegressor_regress_options_error___block_invoke_2()
{
  return kdebug_trace();
}

uint64_t __49__MLTreeEnsembleRegressor_regress_options_error___block_invoke()
{
  return kdebug_trace();
}

- (const)modelData
{
  if (self->_model_data)
    return (const char *)-[NSData bytes](self->_model_data, "bytes");
  else
    return self->_cached_model.__begin_;
}

- (double)scalarRegress:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  char *v8;
  const unsigned __int8 *v9;
  const double *v10;
  double v11;
  double v13;

  v6 = a3;
  if (self->num_dimensions == 1)
  {
    -[MLModel vectorizeInput:error:](self, "vectorizeInput:error:", v6, a4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7)
    {
      v13 = 0.0;
      v8 = -[MLTreeEnsembleRegressor modelData](self, "modelData");
      v9 = (const unsigned __int8 *)objc_msgSend(objc_retainAutorelease(v7), "bytes");
      CoreML::TreeEnsembles::Internal::predict((CoreML::TreeEnsembles::Internal *)&v13, (double *)v8, v9, v10);
      v11 = v13;
    }
    else
    {
      v11 = NAN;
    }

  }
  else
  {
    if (a4)
    {
      +[MLModelErrorUtils genericErrorWithFormat:](MLModelErrorUtils, "genericErrorWithFormat:", CFSTR("Dimension must equal one when using scalarRegress."));
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }
    v11 = NAN;
  }

  return v11;
}

- (double)scalarRegress:(double *)a3
{
  char *v4;
  const double *v5;
  double v7;

  v7 = 0.0;
  v4 = -[MLTreeEnsembleRegressor modelData](self, "modelData");
  CoreML::TreeEnsembles::Internal::predict((CoreML::TreeEnsembles::Internal *)&v7, (double *)v4, (const unsigned __int8 *)a3, v5);
  return v7;
}

- (void)vectorRegress:(double *)a3 dest:(double *)a4
{
  char *v6;
  const double *v7;

  v6 = -[MLTreeEnsembleRegressor modelData](self, "modelData");
  CoreML::TreeEnsembles::Internal::predict((CoreML::TreeEnsembles::Internal *)a4, (double *)v6, (const unsigned __int8 *)a3, v7);
}

- (void).cxx_destruct
{
  char *begin;

  objc_storeStrong((id *)&self->output_classes, 0);
  begin = self->_cached_model.__begin_;
  if (begin)
  {
    self->_cached_model.__end_ = begin;
    operator delete(begin);
  }
  objc_storeStrong((id *)&self->_model_data, 0);
}

- (id).cxx_construct
{
  *((_QWORD *)self + 12) = 0;
  *((_QWORD *)self + 13) = 0;
  *((_QWORD *)self + 11) = 0;
  return self;
}

+ (id)loadModelFromSpecificationWithCompilationOptions:(void *)a3 options:(id)a4 error:(id *)a5
{
  const CoreML::Specification::ModelDescription *v7;
  MLTreeEnsembleRegressor *v8;
  MLModelConfiguration *v9;
  _QWORD *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  id v16;
  uint64_t v17;
  _OWORD *v18;
  uint64_t v19;
  std::__shared_weak_count *v20;
  unint64_t *p_shared_owners;
  unint64_t v22;
  _QWORD *v23;
  void *v24;
  unint64_t *v25;
  unint64_t v26;
  std::__shared_weak_count *v27;
  unint64_t *v28;
  unint64_t v29;
  _QWORD *v30;
  id v32;
  void *__p[2];
  uint64_t v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  uint64_t v39;
  std::__shared_weak_count *v40;
  _BYTE v41[176];
  void **v42;
  uint8_t v43[128];
  uint8_t buf[8];
  _QWORD *v45[5];

  v45[3] = *(_QWORD **)MEMORY[0x1E0C80C00];
  v32 = a4;
  if (*(_QWORD *)(*(_QWORD *)a3 + 16))
    v7 = *(const CoreML::Specification::ModelDescription **)(*(_QWORD *)a3 + 16);
  else
    v7 = (const CoreML::Specification::ModelDescription *)&CoreML::Specification::_ModelDescription_default_instance_;
  CoreML::Specification::ModelDescription::ModelDescription((CoreML::Specification::ModelDescription *)v41, v7);
  if (*(_DWORD *)(*(_QWORD *)a3 + 44) == 302)
  {
    v8 = [MLTreeEnsembleRegressor alloc];
    v9 = objc_alloc_init(MLModelConfiguration);
    v10 = -[MLRegressor initDescriptionOnlyWithSpecification:configuration:error:](v8, "initDescriptionOnlyWithSpecification:configuration:error:", a3, v9, a5);

    if (v10)
    {
      CoreML::TreeEnsembles::constructAndValidateTreeEnsembleFromSpec((CoreML::TreeEnsembles *)&v39, *(const CoreML::Specification::Model **)a3);
      v45[0] = 0;
      v45[1] = 0;
      *(_QWORD *)buf = v45;
      v35 = 0u;
      v36 = 0u;
      v37 = 0u;
      v38 = 0u;
      v11 = v32;
      v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v35, v43, 16);
      if (v12)
      {
        v13 = *(_QWORD *)v36;
        do
        {
          for (i = 0; i != v12; ++i)
          {
            if (*(_QWORD *)v36 != v13)
              objc_enumerationMutation(v11);
            v15 = *(void **)(*((_QWORD *)&v35 + 1) + 8 * i);
            objc_msgSend(v11, "objectForKeyedSubscript:", v15);
            v16 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
            v17 = objc_msgSend(v16, "UTF8String");
            std::string::basic_string[abi:ne180100]<0>(__p, (char *)objc_msgSend(objc_retainAutorelease(v15), "UTF8String"));
            v42 = __p;
            v18 = std::__tree<std::__value_type<std::string,std::string>,std::__map_value_compare<std::string,std::__value_type<std::string,std::string>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,std::string>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string&&>,std::tuple<>>((uint64_t **)buf, __p, (_OWORD **)&v42);
            MEMORY[0x1A1AD5EAC]((char *)v18 + 56, v17);
            if (SHIBYTE(v34) < 0)
              operator delete(__p[0]);

          }
          v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v35, v43, 16);
        }
        while (v12);
      }

      v19 = v39;
      v20 = v40;
      if (v40)
      {
        p_shared_owners = (unint64_t *)&v40->__shared_owners_;
        do
          v22 = __ldxr(p_shared_owners);
        while (__stxr(v22 + 1, p_shared_owners));
      }
      CoreML::TreeEnsembles::buildTreeEnsembleModelFromSpec((uint64_t)__p, v19, v20, (uint64_t)buf);
      v23 = v10 + 11;
      v24 = (void *)v10[11];
      if (v24)
      {
        v10[12] = v24;
        operator delete(v24);
        *v23 = 0;
        v10[12] = 0;
        v10[13] = 0;
      }
      *(_OWORD *)v23 = *(_OWORD *)__p;
      v10[13] = v34;
      __p[0] = 0;
      __p[1] = 0;
      v34 = 0;
      if (v20)
      {
        v25 = (unint64_t *)&v20->__shared_owners_;
        do
          v26 = __ldaxr(v25);
        while (__stlxr(v26 - 1, v25));
        if (!v26)
        {
          ((void (*)(std::__shared_weak_count *))v20->__on_zero_shared)(v20);
          std::__shared_weak_count::__release_weak(v20);
        }
      }
      v10[14] = *(_QWORD *)(v39 + 16);
      std::__tree<std::__value_type<std::string,std::string>,std::__map_value_compare<std::string,std::__value_type<std::string,std::string>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,std::string>>>::destroy(v45[0]);
      v27 = v40;
      if (v40)
      {
        v28 = (unint64_t *)&v40->__shared_owners_;
        do
          v29 = __ldaxr(v28);
        while (__stlxr(v29 - 1, v28));
        if (!v29)
        {
          ((void (*)(std::__shared_weak_count *))v27->__on_zero_shared)(v27);
          std::__shared_weak_count::__release_weak(v27);
        }
      }
      v30 = v10;
    }
    else
    {
      v30 = 0;
    }

  }
  else if (a5)
  {
    +[MLModelErrorUtils IOErrorWithFormat:](MLModelErrorUtils, "IOErrorWithFormat:", CFSTR("Interface type is not an TreeEnsembleRegressor"));
    v30 = 0;
    *a5 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v30 = 0;
  }
  CoreML::Specification::ModelDescription::~ModelDescription((CoreML::Specification::ModelDescription *)v41);

  return v30;
}

+ (id)loadModelFromSpecification:(void *)a3 configuration:(id)a4 error:(id *)a5
{
  +[MLTreeEnsembleRegressor loadModelFromSpecificationWithCompilationOptions:options:error:](MLTreeEnsembleRegressor, "loadModelFromSpecificationWithCompilationOptions:options:error:", a3, MEMORY[0x1E0C9AA70], a5);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)compileSpecification:(void *)a3 toArchive:(void *)a4 options:(id)a5 error:(id *)a6
{
  void *v9;
  _QWORD *v10;
  _QWORD *v11;
  void *v12;
  std::__shared_weak_count *v13;
  unint64_t *p_shared_owners;
  unint64_t v15;
  _QWORD *v17;
  std::__shared_weak_count *v18;
  void *__p[2];
  uint64_t v20;

  +[MLModel serializeInterfaceAndMetadata:toArchive:error:](MLModel, "serializeInterfaceAndMetadata:toArchive:error:", a3, a4, a6);
  v9 = (void *)objc_opt_new();
  +[MLTreeEnsembleRegressor loadModelFromSpecification:configuration:error:](MLTreeEnsembleRegressor, "loadModelFromSpecification:configuration:error:", a3, v9, a6);
  v10 = (_QWORD *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    __p[0] = 0;
    __p[1] = 0;
    v20 = 0;
    operator<<<unsigned char>((uint64_t)a4, (uint64_t *)__p);
    std::string::basic_string[abi:ne180100]<0>(__p, (char *)&unk_19CB39696);
    OArchive::uniqueBlob(&v17, *((_QWORD **)a4 + 1), (const void **)__p);
    if (SHIBYTE(v20) < 0)
      operator delete(__p[0]);
    v11 = v17;
    operator<<((uint64_t)a4, v17 + 72);
    if ((v10[12] - v10[11]) >> 31)
    {
      if (a6)
      {
        +[MLModelErrorUtils genericErrorWithFormat:](MLModelErrorUtils, "genericErrorWithFormat:", CFSTR("Internal error: model too large to be compiled."));
        v12 = 0;
        *a6 = (id)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v12 = 0;
      }
    }
    else
    {
      if (!*(_BYTE *)v11 && !v11[78])
        Archiver::_ODataBlobImpl::_openAsStream(v11);
      std::ostream::write();
      operator<<((uint64_t)a4, v10[14]);
      +[MLCompilerResult resultWithArchive:](MLCompilerResult, "resultWithArchive:", a4);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v13 = v18;
    if (v18)
    {
      p_shared_owners = (unint64_t *)&v18->__shared_owners_;
      do
        v15 = __ldaxr(p_shared_owners);
      while (__stlxr(v15 - 1, p_shared_owners));
      if (!v15)
      {
        ((void (*)(std::__shared_weak_count *))v13->__on_zero_shared)(v13);
        std::__shared_weak_count::__release_weak(v13);
      }
    }
  }
  else
  {
    v12 = 0;
  }

  return v12;
}

+ (id)compiledVersionForSpecification:(void *)a3 options:(id)a4 error:(id *)a5
{
  +[MLVersionInfo versionInfoWithMajor:minor:patch:variant:](MLVersionInfo, "versionInfoWithMajor:minor:patch:variant:", 1, 0, 0, CFSTR("generic"));
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)loadModelFromCompiledArchive:(void *)a3 modelVersionInfo:(id)a4 compilerVersionInfo:(id)a5 configuration:(id)a6 error:(id *)a7
{
  id v10;
  id v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  MLTreeEnsembleRegressor *v16;
  MLModelAssetDescription *v17;
  MLTreeEnsembleRegressor *v18;
  void *v19;
  uint64_t v20;
  NSData *model_data;
  std::__shared_weak_count *v22;
  unint64_t *p_shared_owners;
  unint64_t v24;
  MLTreeEnsembleRegressor *v25;
  uint64_t v27;
  std::__shared_weak_count *v28;
  std::string __p;

  v10 = a5;
  v11 = a6;
  +[MLVersionInfo versionInfoWithMajor:minor:patch:variant:](MLVersionInfo, "versionInfoWithMajor:minor:patch:variant:", 1, 0, 0, CFSTR("generic"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "majorVersion");
  if (v13 >= objc_msgSend(v10, "majorVersion"))
  {
    v17 = -[MLModelAssetDescription initWithCompiledModelArchive:error:]([MLModelAssetDescription alloc], "initWithCompiledModelArchive:error:", a3, a7);
    if (v17)
    {
      v18 = [MLTreeEnsembleRegressor alloc];
      -[MLModelAssetDescription defaultModelDescription](v17, "defaultModelDescription");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = -[MLModel initWithDescription:configuration:](v18, "initWithDescription:configuration:", v19, v11);

      if (v16)
      {
        operator>><unsigned char>((uint64_t)a3, &v16->_cached_model.__begin_);
        if (v16->_cached_model.__begin_ == v16->_cached_model.__end_)
        {
          memset(&__p, 0, sizeof(__p));
          operator>>((uint64_t)a3, &__p);
          IArchive::blob(&v27, *(_QWORD *)a3, (uint64_t)&__p);
          (*(void (**)(uint64_t))(*(_QWORD *)v27 + 32))(v27);
          v20 = objc_claimAutoreleasedReturnValue();
          model_data = v16->_model_data;
          v16->_model_data = (NSData *)v20;

          v22 = v28;
          if (v28)
          {
            p_shared_owners = (unint64_t *)&v28->__shared_owners_;
            do
              v24 = __ldaxr(p_shared_owners);
            while (__stlxr(v24 - 1, p_shared_owners));
            if (!v24)
            {
              ((void (*)(std::__shared_weak_count *))v22->__on_zero_shared)(v22);
              std::__shared_weak_count::__release_weak(v22);
            }
          }
          if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
            operator delete(__p.__r_.__value_.__l.__data_);
        }
        __p.__r_.__value_.__r.__words[0] = 0;
        operator>>((uint64_t)a3);
        v16->num_dimensions = __p.__r_.__value_.__r.__words[0];
        v25 = v16;
      }

    }
    else
    {
      v16 = 0;
    }

  }
  else
  {
    if (a7)
    {
      objc_msgSend(v10, "versionNumberString");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "versionNumberString");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      +[MLModelErrorUtils genericErrorWithFormat:](MLModelErrorUtils, "genericErrorWithFormat:", CFSTR("compiler major version for compiled model is %@ and is more recent than this framework major version %@."), v14, v15);
      *a7 = (id)objc_claimAutoreleasedReturnValue();

    }
    v16 = 0;
  }

  return v16;
}

@end
