@implementation _EARLmModel

+ (void)initialize
{
  EARLogger *v3;

  v3 = (EARLogger *)objc_opt_class();
  if (v3 == a1)
    EARLogger::initializeLogging(v3);
}

- (id)_initWithModel:(shared_ptr<quasar::LmModel2>)a3
{
  uint64_t *ptr;
  _EARLmModel *v4;
  _EARLmModel *v5;
  objc_super v7;

  ptr = (uint64_t *)a3.__ptr_;
  v7.receiver = self;
  v7.super_class = (Class)_EARLmModel;
  v4 = -[_EARLmModel init](&v7, sel_init, a3.__ptr_, a3.__cntrl_);
  v5 = v4;
  if (v4)
    std::shared_ptr<kaldi::quasar::ShortlistDataOnDisk>::operator=[abi:ne180100](&v4->_model.__ptr_, ptr);
  return v5;
}

- (_EARLmModel)initWithConfiguration:(id)a3 root:(id)a4
{
  id v6;
  id v7;
  _EARLmModel *v8;
  void *v9;
  char v10;
  NSObject *v11;
  _EARLmModel *v12;
  std::__shared_weak_count *v13;
  unint64_t *v14;
  unint64_t v15;
  void *__p[2];
  uint64_t v18;
  __int128 v19;
  objc_super v20;
  __int128 buf;
  uint64_t v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v20.receiver = self;
  v20.super_class = (Class)_EARLmModel;
  v8 = -[_EARLmModel init](&v20, sel_init);
  if (!v8)
  {
LABEL_20:
    v12 = v8;
    goto LABEL_21;
  }
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "fileExistsAtPath:", v6);

  if ((v10 & 1) != 0)
  {
    if (v6)
    {
      objc_msgSend(v6, "ear_toString");
      if (v7)
      {
LABEL_5:
        objc_msgSend(v7, "ear_toString");
        goto LABEL_11;
      }
    }
    else
    {
      buf = 0uLL;
      v22 = 0;
      if (v7)
        goto LABEL_5;
    }
    __p[0] = 0;
    __p[1] = 0;
    v18 = 0;
LABEL_11:
    quasar::makeLmBuildConfig((uint64_t)&buf, (uint64_t)__p, (uint64_t *)&v19);
    std::shared_ptr<kaldi::quasar::CEAttnEncoderDecoder>::operator=[abi:ne180100]((uint64_t)&v8->_buildConfig, &v19);
    v13 = (std::__shared_weak_count *)*((_QWORD *)&v19 + 1);
    if (*((_QWORD *)&v19 + 1))
    {
      v14 = (unint64_t *)(*((_QWORD *)&v19 + 1) + 8);
      do
        v15 = __ldaxr(v14);
      while (__stlxr(v15 - 1, v14));
      if (!v15)
      {
        ((void (*)(std::__shared_weak_count *))v13->__on_zero_shared)(v13);
        std::__shared_weak_count::__release_weak(v13);
      }
    }
    if (SHIBYTE(v18) < 0)
      operator delete(__p[0]);
    if (SHIBYTE(v22) < 0)
      operator delete((void *)buf);
    goto LABEL_20;
  }
  EarLmLogger();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 138412290;
    *(_QWORD *)((char *)&buf + 4) = v6;
    _os_log_impl(&dword_1AD756000, v11, OS_LOG_TYPE_DEFAULT, "File does not exist %@", (uint8_t *)&buf, 0xCu);
  }

  v12 = 0;
LABEL_21:

  return v12;
}

- (_EARLmModel)initWithConfiguration:(id)a3
{
  return -[_EARLmModel initWithConfiguration:root:](self, "initWithConfiguration:root:", a3, &stru_1E5D49530);
}

- (id)initFromDirectory:(id)a3
{
  id v4;
  _EARLmModel *v5;
  void *v6;
  char v7;
  NSObject *v8;
  std::__shared_weak_count *v9;
  unint64_t *p_shared_owners;
  unint64_t v11;
  _EARLmModel *v12;
  std::__shared_weak_count *v13;
  unint64_t *v14;
  unint64_t v15;
  void *__p[2];
  char v18;
  void *v19[2];
  uint64_t v20;
  uint64_t v21;
  std::__shared_weak_count *v22;
  char v23;
  objc_super v24;
  __int128 buf;
  uint64_t v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v24.receiver = self;
  v24.super_class = (Class)_EARLmModel;
  v5 = -[_EARLmModel init](&v24, sel_init);
  if (v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "fileExistsAtPath:", v4);

    if ((v7 & 1) != 0)
    {
      buf = 0uLL;
      v26 = 0;
      LOBYTE(v21) = 0;
      v23 = 0;
      if (v4)
      {
        objc_msgSend(v4, "ear_toString");
      }
      else
      {
        v19[0] = 0;
        v19[1] = 0;
        v20 = 0;
      }
      std::string::basic_string[abi:ne180100]<0>(__p, "");
      quasar::loadLmFromDirectory((uint64_t)v19, (uint64_t)__p, (uint64_t)&buf, (uint64_t)&v21);
      if (v18 < 0)
        operator delete(__p[0]);
      if (SHIBYTE(v20) < 0)
        operator delete(v19[0]);
      if (v23)
      {
        if (v21)
        {
          std::shared_ptr<kaldi::quasar::ShortlistDataOnDisk>::operator=[abi:ne180100](&v5->_model.__ptr_, &v21);
          if (v23)
          {
            v9 = v22;
            if (v22)
            {
              p_shared_owners = (unint64_t *)&v22->__shared_owners_;
              do
                v11 = __ldaxr(p_shared_owners);
              while (__stlxr(v11 - 1, p_shared_owners));
              if (!v11)
              {
                ((void (*)(std::__shared_weak_count *))v9->__on_zero_shared)(v9);
                std::__shared_weak_count::__release_weak(v9);
              }
            }
          }
          if (SHIBYTE(v26) < 0)
            operator delete((void *)buf);
          goto LABEL_23;
        }
        v13 = v22;
        if (v22)
        {
          v14 = (unint64_t *)&v22->__shared_owners_;
          do
            v15 = __ldaxr(v14);
          while (__stlxr(v15 - 1, v14));
          if (!v15)
          {
            ((void (*)(std::__shared_weak_count *))v13->__on_zero_shared)(v13);
            std::__shared_weak_count::__release_weak(v13);
          }
        }
      }
      if (SHIBYTE(v26) < 0)
        operator delete((void *)buf);
    }
    else
    {
      EarLmLogger();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        LODWORD(buf) = 138412290;
        *(_QWORD *)((char *)&buf + 4) = v4;
        _os_log_impl(&dword_1AD756000, v8, OS_LOG_TYPE_DEFAULT, "File does not exist %@", (uint8_t *)&buf, 0xCu);
      }

    }
    v12 = 0;
    goto LABEL_32;
  }
LABEL_23:
  v12 = v5;
LABEL_32:

  return v12;
}

- (id)handle
{
  _EARLmHandle *v3;
  LmModel2 *ptr;
  char *v5;
  __shared_weak_count *cntrl;
  unint64_t *v7;
  unint64_t v8;
  id v9;
  std::__shared_weak_count *v10;
  unint64_t *v11;
  unint64_t v12;
  char *v14;
  __shared_weak_count *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  if (self->_model.__ptr_)
  {
    v3 = [_EARLmHandle alloc];
    ptr = self->_model.__ptr_;
    if (ptr)
      v5 = (char *)ptr + *(_QWORD *)(*(_QWORD *)ptr - 24);
    else
      v5 = 0;
    cntrl = self->_model.__cntrl_;
    v14 = v5;
    v15 = cntrl;
    if (cntrl)
    {
      v7 = (unint64_t *)((char *)cntrl + 8);
      do
        v8 = __ldxr(v7);
      while (__stxr(v8 + 1, v7));
    }
    v9 = -[_EARLmHandle _initWithHandle:](v3, "_initWithHandle:", &v14);
    v10 = (std::__shared_weak_count *)v15;
    if (v15)
    {
      v11 = (unint64_t *)((char *)v15 + 8);
      do
        v12 = __ldaxr(v11);
      while (__stlxr(v12 - 1, v11));
      if (!v12)
      {
        ((void (*)(std::__shared_weak_count *))v10->__on_zero_shared)(v10);
        std::__shared_weak_count::__release_weak(v10);
      }
    }
  }
  else
  {
    v9 = 0;
  }
  return v9;
}

- (BOOL)trainWithData:(id)a3
{
  id v4;
  void *v5;
  quasar::LmData *v6;
  shared_ptr<quasar::LmModel2> *p_model;
  std::__shared_weak_count *v8;
  unint64_t *v9;
  unint64_t v10;
  unint64_t *p_shared_owners;
  unint64_t v12;
  BOOL v13;
  quasar::LmData *v15;
  std::__shared_weak_count *v16;
  __int128 v17;
  void *__p[2];
  char v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = v4;
  if (v4)
  {
    objc_msgSend(v4, "data");
    v6 = v15;
  }
  else
  {
    v6 = 0;
    v16 = 0;
  }
  std::string::basic_string[abi:ne180100]<0>(__p, "");
  quasar::buildLm(v6, (const std::string **)&self->_buildConfig, (const void **)__p, 1, (uint64_t *)&v17);
  p_model = &self->_model;
  std::shared_ptr<kaldi::quasar::CEAttnEncoderDecoder>::operator=[abi:ne180100]((uint64_t)p_model, &v17);
  v8 = (std::__shared_weak_count *)*((_QWORD *)&v17 + 1);
  if (*((_QWORD *)&v17 + 1))
  {
    v9 = (unint64_t *)(*((_QWORD *)&v17 + 1) + 8);
    do
      v10 = __ldaxr(v9);
    while (__stlxr(v10 - 1, v9));
    if (!v10)
    {
      ((void (*)(std::__shared_weak_count *))v8->__on_zero_shared)(v8);
      std::__shared_weak_count::__release_weak(v8);
    }
  }
  if (v19 < 0)
    operator delete(__p[0]);
  if (v16)
  {
    p_shared_owners = (unint64_t *)&v16->__shared_owners_;
    do
      v12 = __ldaxr(p_shared_owners);
    while (__stlxr(v12 - 1, p_shared_owners));
    if (!v12)
    {
      ((void (*)(std::__shared_weak_count *))v16->__on_zero_shared)(v16);
      std::__shared_weak_count::__release_weak(v16);
    }
  }
  v13 = p_model->__ptr_ != 0;

  return v13;
}

- (void)setWeight:(float)a3
{
  LmModel2 *ptr;

  ptr = self->_model.__ptr_;
  if (ptr)
    quasar::LmModel2::setWeight((uint64_t)ptr, a3);
}

- (BOOL)writeToDirectory:(id)a3
{
  id v4;
  void *v5;
  LmModel2 *ptr;
  void *__p[2];
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = v4;
  ptr = self->_model.__ptr_;
  if (ptr)
  {
    if (v4)
    {
      objc_msgSend(v4, "ear_toString");
    }
    else
    {
      __p[0] = 0;
      __p[1] = 0;
      v9 = 0;
    }
    LOBYTE(ptr) = quasar::LmModel2::write(ptr, (uint64_t)__p);
    if (SHIBYTE(v9) < 0)
      operator delete(__p[0]);
  }

  return (char)ptr;
}

+ (void)removeWithDirectory:(id)a3
{
  id v3;
  void *v4;
  void *__p[2];
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = v3;
  if (v3)
  {
    objc_msgSend(v3, "ear_toString");
  }
  else
  {
    __p[0] = 0;
    __p[1] = 0;
    v6 = 0;
  }
  quasar::removeLm((uint64_t)__p);
  if (SHIBYTE(v6) < 0)
    operator delete(__p[0]);

}

- (id)metrics
{
  LmModel2 *ptr;
  void *v3;
  _QWORD v5[10];

  v5[9] = *MEMORY[0x1E0C80C00];
  ptr = self->_model.__ptr_;
  if (!ptr)
    return 0;
  (*(void (**)(_QWORD *__return_ptr))(*(_QWORD *)ptr + 16))(v5);
  EARHelpers::dictFromPTree((EARHelpers *)v5, (const quasar::PTree *)1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  quasar::PTree::~PTree((quasar::PTree *)v5);
  return v3;
}

- (float)weight
{
  LmModel2 *ptr;

  ptr = self->_model.__ptr_;
  if (ptr)
    return quasar::LmModel2::getWeight((quasar::LmModel2 *)ptr);
  else
    return 0.0;
}

- (double)age
{
  LmModel2 *ptr;

  ptr = self->_model.__ptr_;
  if (ptr)
    return quasar::LmModel2::getAgeSeconds((quasar::LmModel2 *)ptr);
  else
    return 0.0;
}

- (id)serializedModelWithLanguage:(id)a3 modelData:(id)a4 oovs:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  LmBuildConfig *ptr;
  _QWORD *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  NSObject *v17;
  void *v18;
  id v19;
  id v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  NSObject *v28;
  id v30;
  _QWORD v31[5];
  _QWORD v32[6];

  v32[5] = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  objc_msgSend(v8, "stringByReplacingOccurrencesOfString:withString:", CFSTR("-"), CFSTR("_"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  ptr = self->_buildConfig.__ptr_;
  if (ptr)
  {
    v13 = (_QWORD *)((char *)ptr + 48);
    if (*((char *)ptr + 71) < 0)
      v13 = (_QWORD *)*v13;
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "_ear_sha256");
    v15 = objc_claimAutoreleasedReturnValue();
    v16 = (void *)v15;
    if (v10 && v11 && v14 && v15)
    {
      v31[0] = CFSTR("language");
      v31[1] = CFSTR("assetVersion");
      v32[0] = v11;
      v32[1] = v14;
      v31[2] = CFSTR("modelTrainingData");
      v31[3] = CFSTR("dataHash");
      v32[2] = v9;
      v32[3] = v15;
      v31[4] = CFSTR("oovs");
      v32[4] = v10;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v32, v31, 5);
      v17 = objc_claimAutoreleasedReturnValue();
      v30 = 0;
      objc_msgSend(MEMORY[0x1E0CB38B0], "dataWithPropertyList:format:options:error:", v17, 200, 0, &v30);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = v30;
      if (v18)
      {
        v20 = v18;
      }
      else
      {
        EarLmLogger();
        v28 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
          -[_EARLmModel serializedModelWithLanguage:modelData:oovs:].cold.1();

      }
    }
    else
    {
      EarLmLogger();
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
        -[_EARLmModel serializedModelWithLanguage:modelData:oovs:].cold.2(v17, v21, v22, v23, v24, v25, v26, v27);
      v19 = 0;
      v18 = 0;
    }

  }
  else
  {
    v18 = 0;
  }

  return v18;
}

- (id)deserializeModelData:(id)a3
{
  void *v3;
  id v4;
  id v5;
  NSObject *v6;
  id v8;

  v8 = 0;
  objc_msgSend(MEMORY[0x1E0CB38B0], "propertyListWithData:options:format:error:", a3, 0, 0, &v8);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v8;
  if (v3)
  {
    v5 = v3;
  }
  else
  {
    EarLmLogger();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      -[_EARLmModel deserializeModelData:].cold.1();

  }
  return v3;
}

- (shared_ptr<quasar::LmModel2>)model
{
  LmModel2 **v2;
  __shared_weak_count *cntrl;
  unint64_t *v4;
  unint64_t v5;
  shared_ptr<quasar::LmModel2> result;

  cntrl = self->_model.__cntrl_;
  *v2 = self->_model.__ptr_;
  v2[1] = (LmModel2 *)cntrl;
  if (cntrl)
  {
    v4 = (unint64_t *)((char *)cntrl + 8);
    do
      v5 = __ldxr(v4);
    while (__stxr(v5 + 1, v4));
  }
  result.__cntrl_ = (__shared_weak_count *)a2;
  result.__ptr_ = (LmModel2 *)self;
  return result;
}

- (shared_ptr<quasar::LmBuildConfig>)buildConfig
{
  LmBuildConfig **v2;
  __shared_weak_count *cntrl;
  unint64_t *v4;
  unint64_t v5;
  shared_ptr<quasar::LmBuildConfig> result;

  cntrl = self->_buildConfig.__cntrl_;
  *v2 = self->_buildConfig.__ptr_;
  v2[1] = (LmBuildConfig *)cntrl;
  if (cntrl)
  {
    v4 = (unint64_t *)((char *)cntrl + 8);
    do
      v5 = __ldxr(v4);
    while (__stxr(v5 + 1, v4));
  }
  result.__cntrl_ = (__shared_weak_count *)a2;
  result.__ptr_ = (LmBuildConfig *)self;
  return result;
}

- (void).cxx_destruct
{
  std::shared_ptr<kaldi::quasar::ShortlistDataOnDisk>::~shared_ptr[abi:ne180100]((uint64_t)&self->_buildConfig);
  std::shared_ptr<kaldi::quasar::ShortlistDataOnDisk>::~shared_ptr[abi:ne180100]((uint64_t)&self->_model);
}

- (id).cxx_construct
{
  *(_OWORD *)((char *)self + 24) = 0u;
  *(_OWORD *)((char *)self + 8) = 0u;
  return self;
}

- (void)serializedModelWithLanguage:modelData:oovs:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0(&dword_1AD756000, v0, v1, "Serialization process failed with error: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)serializedModelWithLanguage:(uint64_t)a3 modelData:(uint64_t)a4 oovs:(uint64_t)a5 .cold.2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_2(&dword_1AD756000, a1, a3, "Input data to serialization is nil", a5, a6, a7, a8, 0);
}

- (void)deserializeModelData:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0(&dword_1AD756000, v0, v1, "Deserialization process failed with error: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

@end
