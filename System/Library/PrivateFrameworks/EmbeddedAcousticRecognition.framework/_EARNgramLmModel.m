@implementation _EARNgramLmModel

+ (void)initialize
{
  EARLogger *v3;

  v3 = (EARLogger *)objc_opt_class();
  if (v3 == a1)
    EARLogger::initializeLogging(v3);
}

- (id)_initWithModel:(shared_ptr<quasar:(shared_ptr<quasar::NgramFstConfig>)a4 :NgramLmModel2>)a3 config:
{
  uint64_t *cntrl;
  uint64_t *ptr;
  _EARNgramLmModel *v6;
  _EARNgramLmModel *v7;
  objc_super v9;

  cntrl = (uint64_t *)a3.__cntrl_;
  ptr = (uint64_t *)a3.__ptr_;
  v9.receiver = self;
  v9.super_class = (Class)_EARNgramLmModel;
  v6 = -[_EARNgramLmModel init](&v9, sel_init, a3.__ptr_, a3.__cntrl_, a4.__ptr_, a4.__cntrl_);
  v7 = v6;
  if (v6)
  {
    std::shared_ptr<kaldi::quasar::ShortlistDataOnDisk>::operator=[abi:ne180100](&v6->_ngramModel.__ptr_, ptr);
    std::shared_ptr<kaldi::quasar::ShortlistDataOnDisk>::operator=[abi:ne180100](&v7->_ngramBuildConfig.__ptr_, cntrl);
  }
  return v7;
}

- (_EARNgramLmModel)initWithConfiguration:(id)a3 root:(id)a4
{
  _EARNgramLmModel *v4;
  _EARNgramLmModel *v5;
  void *v6;
  unint64_t *p_shared_owners;
  unint64_t v8;
  std::__shared_weak_count *v9;
  unint64_t *v10;
  unint64_t v11;
  unint64_t *v12;
  unint64_t v13;
  _EARNgramLmModel *v14;
  NSObject *v15;
  void *lpsrc;
  std::__shared_weak_count *v18;
  __int128 buf;
  objc_super v20;

  v20.receiver = self;
  v20.super_class = (Class)_EARNgramLmModel;
  v4 = -[_EARLmModel initWithConfiguration:root:](&v20, sel_initWithConfiguration_root_, a3, a4);
  v5 = v4;
  if (!v4)
  {
    v18 = 0;
LABEL_9:
    buf = 0uLL;
    goto LABEL_10;
  }
  -[_EARLmModel buildConfig](v4, "buildConfig");
  if (!lpsrc)
    goto LABEL_9;
  if (!v6)
    goto LABEL_9;
  *(_QWORD *)&buf = v6;
  *((_QWORD *)&buf + 1) = v18;
  if (v18)
  {
    p_shared_owners = (unint64_t *)&v18->__shared_owners_;
    do
      v8 = __ldxr(p_shared_owners);
    while (__stxr(v8 + 1, p_shared_owners));
  }
LABEL_10:
  std::shared_ptr<kaldi::quasar::CEAttnEncoderDecoder>::operator=[abi:ne180100]((uint64_t)&v5->_ngramBuildConfig, &buf);
  v9 = (std::__shared_weak_count *)*((_QWORD *)&buf + 1);
  if (*((_QWORD *)&buf + 1))
  {
    v10 = (unint64_t *)(*((_QWORD *)&buf + 1) + 8);
    do
      v11 = __ldaxr(v10);
    while (__stlxr(v11 - 1, v10));
    if (!v11)
    {
      ((void (*)(std::__shared_weak_count *))v9->__on_zero_shared)(v9);
      std::__shared_weak_count::__release_weak(v9);
    }
  }
  if (v18)
  {
    v12 = (unint64_t *)&v18->__shared_owners_;
    do
      v13 = __ldaxr(v12);
    while (__stlxr(v13 - 1, v12));
    if (!v13)
    {
      ((void (*)(std::__shared_weak_count *))v18->__on_zero_shared)(v18);
      std::__shared_weak_count::__release_weak(v18);
    }
  }
  if (v5->_ngramBuildConfig.__ptr_)
  {
    v14 = v5;
  }
  else
  {
    EarLmLogger();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(buf) = 0;
      _os_log_impl(&dword_1AD756000, v15, OS_LOG_TYPE_DEFAULT, "Cannot cast to NgramFstConfig", (uint8_t *)&buf, 2u);
    }

    v14 = 0;
  }

  return v14;
}

- (_EARNgramLmModel)initWithConfiguration:(id)a3
{
  return -[_EARNgramLmModel initWithConfiguration:root:](self, "initWithConfiguration:root:", a3, CFSTR("app-lm.NGRAM"));
}

- (id)initFromDirectory:(id)a3
{
  _QWORD *v3;
  _QWORD *v4;
  void *v5;
  unint64_t *p_shared_owners;
  unint64_t v7;
  std::__shared_weak_count *v8;
  unint64_t *v9;
  unint64_t v10;
  unint64_t *v11;
  unint64_t v12;
  _QWORD *v13;
  NSObject *v14;
  void *lpsrc;
  std::__shared_weak_count *v17;
  __int128 buf;
  objc_super v19;

  v19.receiver = self;
  v19.super_class = (Class)_EARNgramLmModel;
  v3 = -[_EARLmModel initFromDirectory:](&v19, sel_initFromDirectory_, a3);
  v4 = v3;
  if (!v3)
  {
    v17 = 0;
LABEL_9:
    buf = 0uLL;
    goto LABEL_10;
  }
  objc_msgSend(v3, "model");
  if (!lpsrc)
    goto LABEL_9;
  if (!v5)
    goto LABEL_9;
  *(_QWORD *)&buf = v5;
  *((_QWORD *)&buf + 1) = v17;
  if (v17)
  {
    p_shared_owners = (unint64_t *)&v17->__shared_owners_;
    do
      v7 = __ldxr(p_shared_owners);
    while (__stxr(v7 + 1, p_shared_owners));
  }
LABEL_10:
  std::shared_ptr<kaldi::quasar::CEAttnEncoderDecoder>::operator=[abi:ne180100]((uint64_t)(v4 + 5), &buf);
  v8 = (std::__shared_weak_count *)*((_QWORD *)&buf + 1);
  if (*((_QWORD *)&buf + 1))
  {
    v9 = (unint64_t *)(*((_QWORD *)&buf + 1) + 8);
    do
      v10 = __ldaxr(v9);
    while (__stlxr(v10 - 1, v9));
    if (!v10)
    {
      ((void (*)(std::__shared_weak_count *))v8->__on_zero_shared)(v8);
      std::__shared_weak_count::__release_weak(v8);
    }
  }
  if (v17)
  {
    v11 = (unint64_t *)&v17->__shared_owners_;
    do
      v12 = __ldaxr(v11);
    while (__stlxr(v12 - 1, v11));
    if (!v12)
    {
      ((void (*)(std::__shared_weak_count *))v17->__on_zero_shared)(v17);
      std::__shared_weak_count::__release_weak(v17);
    }
  }
  if (v4[5])
  {
    v13 = v4;
  }
  else
  {
    EarLmLogger();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(buf) = 0;
      _os_log_impl(&dword_1AD756000, v14, OS_LOG_TYPE_DEFAULT, "Cannot cast to NgramLmModel", (uint8_t *)&buf, 2u);
    }

    v13 = 0;
  }

  return v13;
}

- (BOOL)writeToDirectory:(id)a3
{
  id v4;
  void *v5;
  unint64_t *p_shared_owners;
  unint64_t v7;
  shared_ptr<quasar::NgramLmModel2> *p_ngramModel;
  std::__shared_weak_count *v9;
  unint64_t *v10;
  unint64_t v11;
  unint64_t *v12;
  unint64_t v13;
  NgramLmModel2 *ptr;
  NSObject *v15;
  char v16;
  void *lpsrc;
  std::__shared_weak_count *v19;
  __int128 buf;
  uint64_t v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[_EARLmModel model](self, "model");
  if (lpsrc
  {
    *(_QWORD *)&buf = v5;
    *((_QWORD *)&buf + 1) = v19;
    if (v19)
    {
      p_shared_owners = (unint64_t *)&v19->__shared_owners_;
      do
        v7 = __ldxr(p_shared_owners);
      while (__stxr(v7 + 1, p_shared_owners));
    }
  }
  else
  {
    buf = 0uLL;
  }
  p_ngramModel = &self->_ngramModel;
  std::shared_ptr<kaldi::quasar::CEAttnEncoderDecoder>::operator=[abi:ne180100]((uint64_t)p_ngramModel, &buf);
  v9 = (std::__shared_weak_count *)*((_QWORD *)&buf + 1);
  if (*((_QWORD *)&buf + 1))
  {
    v10 = (unint64_t *)(*((_QWORD *)&buf + 1) + 8);
    do
      v11 = __ldaxr(v10);
    while (__stlxr(v11 - 1, v10));
    if (!v11)
    {
      ((void (*)(std::__shared_weak_count *))v9->__on_zero_shared)(v9);
      std::__shared_weak_count::__release_weak(v9);
    }
  }
  if (v19)
  {
    v12 = (unint64_t *)&v19->__shared_owners_;
    do
      v13 = __ldaxr(v12);
    while (__stlxr(v13 - 1, v12));
    if (!v13)
    {
      ((void (*)())v19->__on_zero_shared)();
      std::__shared_weak_count::__release_weak(v19);
    }
  }
  ptr = p_ngramModel->__ptr_;
  if (ptr)
  {
    if (v4)
    {
      objc_msgSend(v4, "ear_toString");
    }
    else
    {
      buf = 0uLL;
      v21 = 0;
    }
    v16 = quasar::LmModel2::write((_BYTE *)ptr + 656, (uint64_t)&buf);
    if (SHIBYTE(v21) < 0)
      operator delete((void *)buf);
  }
  else
  {
    EarLmLogger();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(buf) = 0;
      _os_log_impl(&dword_1AD756000, v15, OS_LOG_TYPE_DEFAULT, "Cannot cast to NgramLmModel", (uint8_t *)&buf, 2u);
    }

    v16 = 0;
  }

  return v16;
}

- (id)generateNgramCounts:(id)a3
{
  id v4;
  void *v5;
  __shared_weak_count *cntrl;
  uint64_t **ptr;
  unint64_t *v8;
  unint64_t v9;
  unint64_t *p_shared_owners;
  unint64_t v11;
  std::__shared_weak_count *v12;
  unint64_t *v13;
  unint64_t v14;
  std::string *p_p;
  void *v16;
  const quasar::NgramSrilmCountConfig *v18;
  std::__shared_weak_count *v19;
  uint64_t **v20;
  __shared_weak_count *v21;
  std::string __p;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = v4;
  ptr = (uint64_t **)self->_ngramBuildConfig.__ptr_;
  cntrl = self->_ngramBuildConfig.__cntrl_;
  if (cntrl)
  {
    v8 = (unint64_t *)((char *)cntrl + 8);
    do
      v9 = __ldxr(v8);
    while (__stxr(v9 + 1, v8));
  }
  v20 = ptr;
  v21 = cntrl;
  objc_msgSend(v4, "data");
  quasar::generateNgramCountsStr(&v20, v18, &__p);
  if (v19)
  {
    p_shared_owners = (unint64_t *)&v19->__shared_owners_;
    do
      v11 = __ldaxr(p_shared_owners);
    while (__stlxr(v11 - 1, p_shared_owners));
    if (!v11)
    {
      ((void (*)())v19->__on_zero_shared)();
      std::__shared_weak_count::__release_weak(v19);
    }
  }
  v12 = (std::__shared_weak_count *)v21;
  if (v21)
  {
    v13 = (unint64_t *)((char *)v21 + 8);
    do
      v14 = __ldaxr(v13);
    while (__stlxr(v14 - 1, v13));
    if (!v14)
    {
      ((void (*)(std::__shared_weak_count *))v12->__on_zero_shared)(v12);
      std::__shared_weak_count::__release_weak(v12);
    }
  }
  if ((__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
    p_p = &__p;
  else
    p_p = (std::string *)__p.__r_.__value_.__r.__words[0];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", p_p);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
    operator delete(__p.__r_.__value_.__l.__data_);

  return v16;
}

- (NSString)arpaFileName
{
  NgramLmModel2 *ptr;
  void *v3;
  void **v4;
  void *v5;
  void *v7[2];
  char v8;
  void *__p[2];
  char v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  ptr = self->_ngramModel.__ptr_;
  if (ptr)
  {
    v3 = (void *)MEMORY[0x1E0CB3940];
    std::string::basic_string[abi:ne180100]<0>(v7, "");
    quasar::NgramLmModel2::getArpaFileName((uint64_t)ptr, (uint64_t)v7, __p);
    if (v10 >= 0)
      v4 = __p;
    else
      v4 = (void **)__p[0];
    objc_msgSend(v3, "stringWithUTF8String:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v10 < 0)
      operator delete(__p[0]);
    if (v8 < 0)
      operator delete(v7[0]);
  }
  else
  {
    v5 = 0;
  }
  return (NSString *)v5;
}

- (shared_ptr<quasar::NgramLmModel2>)ngramModel
{
  NgramLmModel2 **v2;
  __shared_weak_count *cntrl;
  unint64_t *v4;
  unint64_t v5;
  shared_ptr<quasar::NgramLmModel2> result;

  cntrl = self->_ngramModel.__cntrl_;
  *v2 = self->_ngramModel.__ptr_;
  v2[1] = (NgramLmModel2 *)cntrl;
  if (cntrl)
  {
    v4 = (unint64_t *)((char *)cntrl + 8);
    do
      v5 = __ldxr(v4);
    while (__stxr(v5 + 1, v4));
  }
  result.__cntrl_ = (__shared_weak_count *)a2;
  result.__ptr_ = (NgramLmModel2 *)self;
  return result;
}

- (shared_ptr<quasar::NgramFstConfig>)ngramBuildConfig
{
  NgramFstConfig **v2;
  __shared_weak_count *cntrl;
  unint64_t *v4;
  unint64_t v5;
  shared_ptr<quasar::NgramFstConfig> result;

  cntrl = self->_ngramBuildConfig.__cntrl_;
  *v2 = self->_ngramBuildConfig.__ptr_;
  v2[1] = (NgramFstConfig *)cntrl;
  if (cntrl)
  {
    v4 = (unint64_t *)((char *)cntrl + 8);
    do
      v5 = __ldxr(v4);
    while (__stxr(v5 + 1, v4));
  }
  result.__cntrl_ = (__shared_weak_count *)a2;
  result.__ptr_ = (NgramFstConfig *)self;
  return result;
}

- (void).cxx_destruct
{
  std::shared_ptr<kaldi::quasar::ShortlistDataOnDisk>::~shared_ptr[abi:ne180100]((uint64_t)&self->_ngramBuildConfig);
  std::shared_ptr<kaldi::quasar::ShortlistDataOnDisk>::~shared_ptr[abi:ne180100]((uint64_t)&self->_ngramModel);
}

- (id).cxx_construct
{
  *((_QWORD *)self + 5) = 0;
  *((_QWORD *)self + 6) = 0;
  *((_QWORD *)self + 7) = 0;
  *((_QWORD *)self + 8) = 0;
  return self;
}

@end
