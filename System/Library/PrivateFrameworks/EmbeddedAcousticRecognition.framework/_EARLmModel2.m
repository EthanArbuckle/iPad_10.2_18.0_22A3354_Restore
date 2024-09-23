@implementation _EARLmModel2

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
  uint64_t v4;
  std::__shared_weak_count *v5;
  unint64_t *p_shared_owners;
  unint64_t v7;
  _QWORD *v8;
  _QWORD *v9;
  std::__shared_weak_count *v10;
  unint64_t *v11;
  unint64_t v12;
  _QWORD *v13;
  objc_super v15;
  uint64_t v16;
  std::__shared_weak_count *v17;

  ptr = (uint64_t *)a3.__ptr_;
  if (*(_QWORD *)a3.__ptr_)
    v4 = *(_QWORD *)a3.__ptr_ + *(_QWORD *)(**(_QWORD **)a3.__ptr_ - 24);
  else
    v4 = 0;
  v5 = (std::__shared_weak_count *)*((_QWORD *)a3.__ptr_ + 1);
  v16 = v4;
  v17 = v5;
  if (v5)
  {
    p_shared_owners = (unint64_t *)&v5->__shared_owners_;
    do
      v7 = __ldxr(p_shared_owners);
    while (__stxr(v7 + 1, p_shared_owners));
  }
  v15.receiver = self;
  v15.super_class = (Class)_EARLmModel2;
  v8 = -[_EARLmHandle _initWithHandle:](&v15, sel__initWithHandle_, &v16, a3.__cntrl_);
  v9 = v8;
  v10 = v17;
  if (!v17)
    goto LABEL_11;
  v11 = (unint64_t *)&v17->__shared_owners_;
  do
    v12 = __ldaxr(v11);
  while (__stlxr(v12 - 1, v11));
  if (!v12)
  {
    ((void (*)(std::__shared_weak_count *))v10->__on_zero_shared)(v10);
    std::__shared_weak_count::__release_weak(v10);
    if (!v9)
      goto LABEL_14;
  }
  else
  {
LABEL_11:
    if (!v8)
      goto LABEL_14;
  }
  if (!*ptr)
  {
    v13 = 0;
    goto LABEL_18;
  }
  std::shared_ptr<kaldi::quasar::ShortlistDataOnDisk>::operator=[abi:ne180100](v9 + 3, ptr);
LABEL_14:
  v13 = v9;
LABEL_18:

  return v13;
}

- (void)setWeight:(float)a3
{
  quasar::LmModel2::setWeight((uint64_t)self->_model.__ptr_, a3);
}

- (BOOL)writeToDirectory:(id)a3
{
  id v4;
  void *v5;
  LmModel2 *ptr;
  char v7;
  void *__p[2];
  uint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = v4;
  ptr = self->_model.__ptr_;
  if (v4)
  {
    objc_msgSend(v4, "ear_toString");
  }
  else
  {
    __p[0] = 0;
    __p[1] = 0;
    v10 = 0;
  }
  v7 = quasar::LmModel2::write(ptr, (uint64_t)__p);
  if (SHIBYTE(v10) < 0)
    operator delete(__p[0]);

  return v7;
}

- (void)setProtectionClass:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  LmModel2 *ptr;
  int v8;
  int v9;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = v4;
  if ((id)*MEMORY[0x1E0CB2AB0] == v4)
  {
    ptr = self->_model.__ptr_;
    v8 = 1;
LABEL_12:
    *((_DWORD *)ptr + 34) = v8;
    goto LABEL_13;
  }
  if ((id)*MEMORY[0x1E0CB2AB8] == v4)
  {
    ptr = self->_model.__ptr_;
    v8 = 2;
    goto LABEL_12;
  }
  if ((id)*MEMORY[0x1E0CB2AC0] == v4)
  {
    ptr = self->_model.__ptr_;
    v8 = 3;
    goto LABEL_12;
  }
  if ((id)*MEMORY[0x1E0CB2AE0] == v4)
  {
    ptr = self->_model.__ptr_;
    v8 = 4;
    goto LABEL_12;
  }
  EarLmLogger();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v9 = 138412290;
    v10 = v5;
    _os_log_impl(&dword_1AD756000, v6, OS_LOG_TYPE_DEFAULT, "Unknown protection class: %@", (uint8_t *)&v9, 0xCu);
  }

LABEL_13:
}

- (id)metrics
{
  void *v2;
  _QWORD v4[10];

  v4[9] = *MEMORY[0x1E0C80C00];
  (*(void (**)(_QWORD *__return_ptr))(*(_QWORD *)self->_model.__ptr_ + 16))(v4);
  EARHelpers::dictFromPTree((EARHelpers *)v4, (const quasar::PTree *)1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  quasar::PTree::~PTree((quasar::PTree *)v4);
  return v2;
}

- (float)weight
{
  return quasar::LmModel2::getWeight((quasar::LmModel2 *)self->_model.__ptr_);
}

- (double)age
{
  return quasar::LmModel2::getAgeSeconds((quasar::LmModel2 *)self->_model.__ptr_);
}

- (id)serializedModelWithLanguage:(id)a3 modelData:(id)a4 oovs:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  std::string *p_p;
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
  std::string __p;
  _QWORD v32[5];
  _QWORD v33[6];

  v33[5] = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  objc_msgSend(v8, "stringByReplacingOccurrencesOfString:withString:", CFSTR("-"), CFSTR("_"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = (void *)MEMORY[0x1E0CB3940];
  kaldi::quasar::Vocab::OOvWord((kaldi::quasar::Vocab *)self->_model.__ptr_, &__p);
  if ((__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
    p_p = &__p;
  else
    p_p = (std::string *)__p.__r_.__value_.__r.__words[0];
  objc_msgSend(v12, "stringWithUTF8String:", p_p);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
    operator delete(__p.__r_.__value_.__l.__data_);
  objc_msgSend(v9, "_ear_sha256");
  v15 = objc_claimAutoreleasedReturnValue();
  v16 = (void *)v15;
  if (v10 && v11 && v14 && v15)
  {
    v32[0] = CFSTR("language");
    v32[1] = CFSTR("assetVersion");
    v33[0] = v11;
    v33[1] = v14;
    v32[2] = CFSTR("modelTrainingData");
    v32[3] = CFSTR("dataHash");
    v33[2] = v9;
    v33[3] = v15;
    v32[4] = CFSTR("oovs");
    v33[4] = v10;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v33, v32, 5);
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

  return v18;
}

+ (id)deserializeModelData:(id)a3
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

- (void).cxx_destruct
{
  std::shared_ptr<kaldi::quasar::ShortlistDataOnDisk>::~shared_ptr[abi:ne180100]((uint64_t)&self->_model);
}

- (id).cxx_construct
{
  *((_QWORD *)self + 3) = 0;
  *((_QWORD *)self + 4) = 0;
  return self;
}

@end
