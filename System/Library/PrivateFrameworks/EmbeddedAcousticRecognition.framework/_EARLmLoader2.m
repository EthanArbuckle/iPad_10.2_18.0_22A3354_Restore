@implementation _EARLmLoader2

+ (void)initialize
{
  EARLogger *v3;

  v3 = (EARLogger *)objc_opt_class();
  if (v3 == a1)
    EARLogger::initializeLogging(v3);
}

- (_EARLmLoader2)init
{
  return -[_EARLmLoader2 initWithRoot:](self, "initWithRoot:", &stru_1E5D49530);
}

- (_EARLmLoader2)initWithRoot:(id)a3
{
  id v4;
  _EARLmLoader2 *v5;
  std::__shared_weak_count *v6;
  unint64_t *v7;
  unint64_t v8;
  _EARLmLoader2 *v9;
  __int128 v11;
  objc_super v12;
  void *__p;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)_EARLmLoader2;
  v5 = -[_EARLmLoader2 init](&v12, sel_init);
  if (v5)
  {
    if (v4)
    {
      objc_msgSend(v4, "ear_toString");
    }
    else
    {
      __p = 0;
      v14 = 0;
      v15 = 0;
    }
    std::allocate_shared[abi:ne180100]<quasar::LmLoader2,std::allocator<quasar::LmLoader2>,std::string,void>(&v11);
    std::shared_ptr<kaldi::quasar::CEAttnEncoderDecoder>::operator=[abi:ne180100]((uint64_t)&v5->_loader, &v11);
    v6 = (std::__shared_weak_count *)*((_QWORD *)&v11 + 1);
    if (*((_QWORD *)&v11 + 1))
    {
      v7 = (unint64_t *)(*((_QWORD *)&v11 + 1) + 8);
      do
        v8 = __ldaxr(v7);
      while (__stlxr(v8 - 1, v7));
      if (!v8)
      {
        ((void (*)(std::__shared_weak_count *))v6->__on_zero_shared)(v6);
        std::__shared_weak_count::__release_weak(v6);
      }
    }
    if (SHIBYTE(v15) < 0)
      operator delete(__p);
  }
  v9 = v5;

  return v9;
}

- (id)fetchOrLoadModelWithDirectory:(id)a3 recognizer:(id)a4
{
  id v6;
  id v7;
  void *v8;
  LmLoader2 *ptr;
  quasar::SpeechRecognizer *v10;
  quasar::SystemConfig *SysConfig;
  uint64_t *p_shared_owners;
  unint64_t v13;
  _EARLmModel2 *v14;
  unint64_t *v15;
  unint64_t v16;
  id v17;
  std::__shared_weak_count *v18;
  unint64_t *v19;
  unint64_t v20;
  std::__shared_weak_count *v21;
  unint64_t *v22;
  unint64_t v23;
  uint64_t v25;
  std::__shared_weak_count *v26;
  quasar::SpeechRecognizer *v27;
  std::__shared_weak_count *v28;
  uint64_t v29;
  std::__shared_weak_count *v30;
  std::string __p;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = v7;
  ptr = self->_loader.__ptr_;
  if (!v6)
  {
    memset(&__p, 0, sizeof(__p));
    if (v7)
      goto LABEL_3;
LABEL_5:
    v10 = 0;
    v27 = 0;
    v28 = 0;
    goto LABEL_6;
  }
  objc_msgSend(v6, "ear_toString");
  if (!v8)
    goto LABEL_5;
LABEL_3:
  objc_msgSend(v8, "getRecognizer");
  v10 = v27;
LABEL_6:
  SysConfig = (quasar::SystemConfig *)quasar::SpeechRecognizer::getSysConfig(v10);
  quasar::LmLoader2::fetchOrLoadModel(SysConfig, (uint64_t)ptr, &__p, &v29);
  if (v28)
  {
    p_shared_owners = &v28->__shared_owners_;
    do
      v13 = __ldaxr((unint64_t *)p_shared_owners);
    while (__stlxr(v13 - 1, (unint64_t *)p_shared_owners));
    if (!v13)
    {
      ((void (*)(std::__shared_weak_count *))v28->__on_zero_shared)(v28);
      std::__shared_weak_count::__release_weak(v28);
    }
  }
  if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
    operator delete(__p.__r_.__value_.__l.__data_);
  if (v29)
  {
    v14 = [_EARLmModel2 alloc];
    v25 = v29;
    v26 = v30;
    if (v30)
    {
      v15 = (unint64_t *)&v30->__shared_owners_;
      do
        v16 = __ldxr(v15);
      while (__stxr(v16 + 1, v15));
    }
    v17 = -[_EARLmModel2 _initWithModel:](v14, "_initWithModel:", &v25);
    v18 = v26;
    if (v26)
    {
      v19 = (unint64_t *)&v26->__shared_owners_;
      do
        v20 = __ldaxr(v19);
      while (__stlxr(v20 - 1, v19));
      if (!v20)
      {
        ((void (*)(std::__shared_weak_count *))v18->__on_zero_shared)(v18);
        std::__shared_weak_count::__release_weak(v18);
      }
    }
  }
  else
  {
    v17 = 0;
  }
  v21 = v30;
  if (v30)
  {
    v22 = (unint64_t *)&v30->__shared_owners_;
    do
      v23 = __ldaxr(v22);
    while (__stlxr(v23 - 1, v22));
    if (!v23)
    {
      ((void (*)(std::__shared_weak_count *))v21->__on_zero_shared)(v21);
      std::__shared_weak_count::__release_weak(v21);
    }
  }

  return v17;
}

- (id)loadForRecognitionWithDirectory:(id)a3 recognizer:(id)a4 task:(id)a5 applicationName:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  LmLoader2 *ptr;
  quasar::SpeechRecognizer *v15;
  quasar::SystemConfig *SysConfig;
  std::__shared_weak_count *v17;
  unint64_t *p_shared_owners;
  unint64_t v19;
  _EARLmModel2 *v20;
  unint64_t *v21;
  unint64_t v22;
  id v23;
  std::__shared_weak_count *v24;
  unint64_t *v25;
  unint64_t v26;
  std::__shared_weak_count *v27;
  unint64_t *v28;
  unint64_t v29;
  uint64_t v31;
  std::__shared_weak_count *v32;
  void *__p[2];
  uint64_t v34;
  void *v35[2];
  uint64_t v36;
  quasar::SpeechRecognizer *v37;
  std::__shared_weak_count *v38;
  uint64_t v39;
  std::__shared_weak_count *v40;
  std::string v41;
  uint64_t v42;

  v42 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  ptr = self->_loader.__ptr_;
  if (v10)
  {
    objc_msgSend(v10, "ear_toString");
    if (v11)
    {
LABEL_3:
      objc_msgSend(v11, "getRecognizer");
      v15 = v37;
      goto LABEL_6;
    }
  }
  else
  {
    memset(&v41, 0, sizeof(v41));
    if (v11)
      goto LABEL_3;
  }
  v15 = 0;
  v37 = 0;
  v38 = 0;
LABEL_6:
  SysConfig = (quasar::SystemConfig *)quasar::SpeechRecognizer::getSysConfig(v15);
  if (v12)
  {
    objc_msgSend(v12, "ear_toString");
    if (v13)
    {
LABEL_8:
      objc_msgSend(v13, "ear_toString");
      goto LABEL_11;
    }
  }
  else
  {
    v35[0] = 0;
    v35[1] = 0;
    v36 = 0;
    if (v13)
      goto LABEL_8;
  }
  __p[0] = 0;
  __p[1] = 0;
  v34 = 0;
LABEL_11:
  quasar::LmLoader2::loadForRecognition(SysConfig, (uint64_t)ptr, &v41, (uint64_t)v35, (uint64_t)__p, &v39);
  if (SHIBYTE(v34) < 0)
    operator delete(__p[0]);
  if (SHIBYTE(v36) < 0)
    operator delete(v35[0]);
  v17 = v38;
  if (v38)
  {
    p_shared_owners = (unint64_t *)&v38->__shared_owners_;
    do
      v19 = __ldaxr(p_shared_owners);
    while (__stlxr(v19 - 1, p_shared_owners));
    if (!v19)
    {
      ((void (*)(std::__shared_weak_count *))v17->__on_zero_shared)(v17);
      std::__shared_weak_count::__release_weak(v17);
    }
  }
  if (SHIBYTE(v41.__r_.__value_.__r.__words[2]) < 0)
    operator delete(v41.__r_.__value_.__l.__data_);
  if (v39)
  {
    v20 = [_EARLmModel2 alloc];
    v31 = v39;
    v32 = v40;
    if (v40)
    {
      v21 = (unint64_t *)&v40->__shared_owners_;
      do
        v22 = __ldxr(v21);
      while (__stxr(v22 + 1, v21));
    }
    v23 = -[_EARLmModel2 _initWithModel:](v20, "_initWithModel:", &v31);
    v24 = v32;
    if (v32)
    {
      v25 = (unint64_t *)&v32->__shared_owners_;
      do
        v26 = __ldaxr(v25);
      while (__stlxr(v26 - 1, v25));
      if (!v26)
      {
        ((void (*)(std::__shared_weak_count *))v24->__on_zero_shared)(v24);
        std::__shared_weak_count::__release_weak(v24);
      }
    }
  }
  else
  {
    v23 = 0;
  }
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

  return v23;
}

- (void)invalidate
{
  quasar::LmLoader2::invalidate((uint64_t)self->_loader.__ptr_);
}

- (void).cxx_destruct
{
  std::shared_ptr<kaldi::quasar::ShortlistDataOnDisk>::~shared_ptr[abi:ne180100]((uint64_t)&self->_loader);
}

- (id).cxx_construct
{
  *((_QWORD *)self + 1) = 0;
  *((_QWORD *)self + 2) = 0;
  return self;
}

@end
