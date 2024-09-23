@implementation DEExecutionContext

- (DEExecutionContext)init
{
  DEExecutionContext *v2;
  std::__shared_weak_count *v3;
  unint64_t *p_shared_owners;
  unint64_t v5;
  unint64_t *v6;
  unint64_t v7;
  uint64_t v9;
  std::__shared_weak_count *v10;
  siri::dialogengine::Context *v11;
  std::__shared_weak_count *v12;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)DEExecutionContext;
  v2 = -[DEExecutionContext init](&v13, sel_init);
  if (v2)
  {
    _ZNSt3__115allocate_sharedB8ne180100IN4siri12dialogengine7ContextENS_9allocatorIS3_EEJEvEENS_10shared_ptrIT_EERKT0_DpOT1_(&v11);
    -[DEExecutionContext setSharedThis:](v2, "setSharedThis:", &v11);
    v3 = v12;
    if (v12)
    {
      p_shared_owners = (unint64_t *)&v12->__shared_owners_;
      do
        v5 = __ldaxr(p_shared_owners);
      while (__stlxr(v5 - 1, p_shared_owners));
      if (!v5)
      {
        ((void (*)(std::__shared_weak_count *))v3->__on_zero_shared)(v3);
        std::__shared_weak_count::__release_weak(v3);
      }
    }
    -[DEExecutionContext SharedThis](v2, "SharedThis");
    -[DEExecutionContext setThis:](v2, "setThis:", v9);
    if (v10)
    {
      v6 = (unint64_t *)&v10->__shared_owners_;
      do
        v7 = __ldaxr(v6);
      while (__stlxr(v7 - 1, v6));
      if (!v7)
      {
        ((void (*)())v10->__on_zero_shared)();
        std::__shared_weak_count::__release_weak(v10);
      }
    }
  }
  return v2;
}

- (DEExecutionContext)initWithPtr:(shared_ptr<siri::dialogengine::Context>)a3
{
  Context *ptr;
  DEExecutionContext *v4;
  DEExecutionContext *v5;
  std::__shared_weak_count *v6;
  unint64_t *p_shared_owners;
  unint64_t v8;
  std::__shared_weak_count *v9;
  unint64_t *v10;
  unint64_t v11;
  unint64_t *v12;
  unint64_t v13;
  uint64_t v15;
  std::__shared_weak_count *v16;
  uint64_t v17;
  std::__shared_weak_count *v18;
  objc_super v19;

  ptr = a3.__ptr_;
  v19.receiver = self;
  v19.super_class = (Class)DEExecutionContext;
  v4 = -[DEExecutionContext init](&v19, sel_init, a3.__ptr_, a3.__cntrl_);
  v5 = v4;
  if (v4)
  {
    v6 = (std::__shared_weak_count *)*((_QWORD *)ptr + 1);
    v17 = *(_QWORD *)ptr;
    v18 = v6;
    if (v6)
    {
      p_shared_owners = (unint64_t *)&v6->__shared_owners_;
      do
        v8 = __ldxr(p_shared_owners);
      while (__stxr(v8 + 1, p_shared_owners));
    }
    -[DEExecutionContext setSharedThis:](v4, "setSharedThis:", &v17);
    v9 = v18;
    if (v18)
    {
      v10 = (unint64_t *)&v18->__shared_owners_;
      do
        v11 = __ldaxr(v10);
      while (__stlxr(v11 - 1, v10));
      if (!v11)
      {
        ((void (*)(std::__shared_weak_count *))v9->__on_zero_shared)(v9);
        std::__shared_weak_count::__release_weak(v9);
      }
    }
    -[DEExecutionContext SharedThis](v5, "SharedThis");
    -[DEExecutionContext setThis:](v5, "setThis:", v15);
    if (v16)
    {
      v12 = (unint64_t *)&v16->__shared_owners_;
      do
        v13 = __ldaxr(v12);
      while (__stlxr(v13 - 1, v12));
      if (!v13)
      {
        ((void (*)())v16->__on_zero_shared)();
        std::__shared_weak_count::__release_weak(v16);
      }
    }
  }
  return v5;
}

- (BOOL)load:(id)a3 locale:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  id v10;
  char v11;
  std::string __p;
  std::string v14;

  v6 = a3;
  v7 = a4;
  v8 = -[DEExecutionContext This](self, "This");
  v9 = objc_retainAutorelease(v6);
  std::string::basic_string[abi:ne180100]<0>(&v14, (char *)objc_msgSend(v9, "UTF8String"));
  v10 = objc_retainAutorelease(v7);
  std::string::basic_string[abi:ne180100]<0>(&__p, (char *)objc_msgSend(v10, "UTF8String"));
  v11 = siri::dialogengine::Context::LoadStrings((uint64_t)v8, &v14, &__p);
  if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
    operator delete(__p.__r_.__value_.__l.__data_);
  if (SHIBYTE(v14.__r_.__value_.__r.__words[2]) < 0)
    operator delete(v14.__r_.__value_.__l.__data_);

  return v11;
}

- (void)addVariable:(id)a3
{
  void *v4;
  uint64_t *v5;
  std::__shared_weak_count *v6;
  unint64_t *p_shared_owners;
  unint64_t v8;
  unint64_t *v9;
  unint64_t v10;
  id v11;
  uint64_t v12[2];

  v11 = a3;
  v4 = -[DEExecutionContext This](self, "This");
  v5 = (uint64_t *)objc_msgSend(v11, "getSharedPtr");
  v6 = (std::__shared_weak_count *)v5[1];
  v12[0] = *v5;
  v12[1] = (uint64_t)v6;
  if (v6)
  {
    p_shared_owners = (unint64_t *)&v6->__shared_owners_;
    do
      v8 = __ldxr(p_shared_owners);
    while (__stxr(v8 + 1, p_shared_owners));
  }
  siri::dialogengine::Context::AddVariable((uint64_t)v4, v12);
  if (v6)
  {
    v9 = (unint64_t *)&v6->__shared_owners_;
    do
      v10 = __ldaxr(v9);
    while (__stlxr(v10 - 1, v9));
    if (!v10)
    {
      ((void (*)(std::__shared_weak_count *))v6->__on_zero_shared)(v6);
      std::__shared_weak_count::__release_weak(v6);
    }
  }

}

- (id)findVariable:(id)a3
{
  id v4;
  void *v5;
  id v6;
  DEVariable *v7;
  std::__shared_weak_count *v8;
  unint64_t *p_shared_owners;
  unint64_t v10;
  void *__p[2];
  char v13;
  uint64_t v14;
  std::__shared_weak_count *v15;

  v4 = a3;
  v5 = -[DEExecutionContext This](self, "This");
  v6 = objc_retainAutorelease(v4);
  std::string::basic_string[abi:ne180100]<0>(__p, (char *)objc_msgSend(v6, "UTF8String"));
  siri::dialogengine::Context::FindVariable((uint64_t)v5, (uint64_t)__p, &v14);
  if (v13 < 0)
    operator delete(__p[0]);
  v7 = -[DEVariable initWithSharedPtr:]([DEVariable alloc], "initWithSharedPtr:", &v14);
  v8 = v15;
  if (v15)
  {
    p_shared_owners = (unint64_t *)&v15->__shared_owners_;
    do
      v10 = __ldaxr(p_shared_owners);
    while (__stlxr(v10 - 1, p_shared_owners));
    if (!v10)
    {
      ((void (*)(std::__shared_weak_count *))v8->__on_zero_shared)(v8);
      std::__shared_weak_count::__release_weak(v8);
    }
  }

  return v7;
}

- (void)setFile:(id)a3
{
  id v4;
  _QWORD *v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t *p_shared_owners;
  unint64_t v9;
  uint64_t v10;
  std::__shared_weak_count *v11;

  v4 = a3;
  v5 = -[DEExecutionContext This](self, "This");
  if (v4)
  {
    objc_msgSend(v4, "getSharedPtr");
    v6 = v10;
    v7 = (uint64_t)v11;
  }
  else
  {
    v7 = 0;
    v6 = 0;
    v11 = 0;
  }
  std::shared_ptr<siri::dialogengine::PatternSchemaUsage>::operator=[abi:ne180100](v5 + 63, v6, v7);
  if (v11)
  {
    p_shared_owners = (unint64_t *)&v11->__shared_owners_;
    do
      v9 = __ldaxr(p_shared_owners);
    while (__stlxr(v9 - 1, p_shared_owners));
    if (!v9)
    {
      ((void (*)(std::__shared_weak_count *))v11->__on_zero_shared)(v11);
      std::__shared_weak_count::__release_weak(v11);
    }
  }

}

- (id)getFile
{
  _QWORD *v2;
  DEFile *v3;
  std::__shared_weak_count *v4;
  unint64_t *p_shared_owners;
  unint64_t v6;
  DEFile *v7;
  std::__shared_weak_count *v8;
  unint64_t *v9;
  unint64_t v10;
  uint64_t v12;
  std::__shared_weak_count *v13;

  v2 = -[DEExecutionContext This](self, "This");
  v3 = [DEFile alloc];
  v4 = (std::__shared_weak_count *)v2[64];
  v12 = v2[63];
  v13 = v4;
  if (v4)
  {
    p_shared_owners = (unint64_t *)&v4->__shared_owners_;
    do
      v6 = __ldxr(p_shared_owners);
    while (__stxr(v6 + 1, p_shared_owners));
  }
  v7 = -[DEFile initWithSharedPtr:](v3, "initWithSharedPtr:", &v12);
  v8 = v13;
  if (v13)
  {
    v9 = (unint64_t *)&v13->__shared_owners_;
    do
      v10 = __ldaxr(v9);
    while (__stlxr(v10 - 1, v9));
    if (!v10)
    {
      ((void (*)(std::__shared_weak_count *))v8->__on_zero_shared)(v8);
      std::__shared_weak_count::__release_weak(v8);
    }
  }
  return v7;
}

- (void)setTemplateDir:(id)a3
{
  id v4;
  char *v5;
  id v6;
  void *__p[2];
  char v8;
  std::string *v9;
  std::string *v10;
  void *v11;
  uint64_t v12;
  std::string **v13;

  v4 = a3;
  v5 = -[DEExecutionContext This](self, "This");
  siri::dialogengine::RequestInfo::RequestInfo((siri::dialogengine::RequestInfo *)&v11, (const siri::dialogengine::RequestInfo *)(v5 + 8));
  v6 = objc_retainAutorelease(v4);
  std::string::basic_string[abi:ne180100]<0>(__p, (char *)objc_msgSend(v6, "UTF8String"));
  siri::dialogengine::GetTemplateDirs((uint64_t)__p, 0, (uint64_t)&v9);
  std::vector<siri::dialogengine::UpdatableDir>::__assign_with_size[abi:ne180100]<siri::dialogengine::UpdatableDir*,siri::dialogengine::UpdatableDir*>((uint64_t)&v12, v9, v10, 0xAAAAAAAAAAAAAAABLL * (((char *)v10 - (char *)v9) >> 5));
  v13 = &v9;
  std::vector<siri::dialogengine::UpdatableDir>::__destroy_vector::operator()[abi:ne180100]((void ***)&v13);
  if (v8 < 0)
    operator delete(__p[0]);
  siri::dialogengine::Context::SetRequestInfo((uint64_t)v5, (uint64_t)&v11);
  siri::dialogengine::RequestInfo::~RequestInfo(&v11);

}

- (BOOL)needsUpgrade:(id)a3
{
  id v4;
  _QWORD *v5;
  uint64_t v6;
  std::__shared_weak_count *v7;
  unint64_t *p_shared_owners;
  unint64_t v9;
  char v10;
  unint64_t *v11;
  unint64_t v12;
  std::vector<std::pair<std::string, std::string>> v14;
  void *__p[2];
  char v16;
  std::string v17;
  std::string v18;
  uint64_t v19;
  std::__shared_weak_count *v20;
  std::vector<std::pair<std::string, std::string>> *v21;

  v4 = a3;
  v5 = -[DEExecutionContext This](self, "This");
  if (v5)
  {
    v6 = v5[63];
    v7 = (std::__shared_weak_count *)v5[64];
    v19 = v6;
    v20 = v7;
    if (v7)
    {
      p_shared_owners = (unint64_t *)&v7->__shared_owners_;
      do
        v9 = __ldxr(p_shared_owners);
      while (__stxr(v9 + 1, p_shared_owners));
    }
    v10 = 0;
    if (v4 && v6)
    {
      if (*(char *)(v6 + 175) < 0)
        std::string::__init_copy_ctor_external(&v18, *(const std::string::value_type **)(v6 + 152), *(_QWORD *)(v6 + 160));
      else
        v18 = *(std::string *)(v6 + 152);
      std::string::basic_string[abi:ne180100]<0>(__p, (char *)objc_msgSend(objc_retainAutorelease(v4), "UTF8String"));
      memset(&v14, 0, sizeof(v14));
      siri::dialogengine::GetCatVersionForOS(&v14, (uint64_t)__p, &v17);
      v21 = &v14;
      std::vector<std::pair<std::string,std::string>>::__destroy_vector::operator()[abi:ne180100]((void ***)&v21);
      if (v16 < 0)
        operator delete(__p[0]);
      v10 = siri::dialogengine::VersionLessThan((unsigned __int8 *)&v18, (unsigned __int8 *)&v17);
      if (SHIBYTE(v17.__r_.__value_.__r.__words[2]) < 0)
        operator delete(v17.__r_.__value_.__l.__data_);
      if (SHIBYTE(v18.__r_.__value_.__r.__words[2]) < 0)
        operator delete(v18.__r_.__value_.__l.__data_);
    }
    if (v7)
    {
      v11 = (unint64_t *)&v7->__shared_owners_;
      do
        v12 = __ldaxr(v11);
      while (__stlxr(v12 - 1, v11));
      if (!v12)
      {
        ((void (*)(std::__shared_weak_count *))v7->__on_zero_shared)(v7);
        std::__shared_weak_count::__release_weak(v7);
      }
    }
  }
  else
  {
    v10 = 0;
    v19 = 0;
    v20 = 0;
  }

  return v10;
}

- (id)upgrade:(id)a3
{
  void *v3;
  id v4;
  id v5;
  void *v6;
  uint64_t v7;
  _QWORD *v8;
  std::__shared_weak_count *v9;
  uint64_t v10;
  unint64_t *p_shared_owners;
  unint64_t v12;
  unint64_t *v13;
  unint64_t v14;
  id v15;
  std::string::size_type v16;
  std::__shared_weak_count *v17;
  unint64_t *v18;
  unint64_t v19;
  std::string::size_type size;
  unint64_t *v21;
  unint64_t v22;
  const char *v23;
  std::string *v24;
  __int128 v25;
  const char *v26;
  char v27;
  char v28;
  std::string *v29;
  void *v30;
  std::string *v31;
  void *v32;
  id v33;
  id v34;
  std::string v36[146];
  std::string v37;
  std::string v38;
  std::string v39;
  void *__p[2];
  char v41;
  std::string __s;
  std::string v43;
  std::string v44;
  std::string v45;
  void *v46[2];
  char v47;
  std::string v48;
  std::string v49;

  v3 = (void *)MEMORY[0x1E0C80A78](self);
  v5 = v4;
  v6 = (void *)objc_opt_new();
  v7 = objc_msgSend(v3, "This");
  v8 = (_QWORD *)v7;
  if (!v7)
    goto LABEL_16;
  v10 = *(_QWORD *)(v7 + 504);
  v9 = *(std::__shared_weak_count **)(v7 + 512);
  if (!v9)
    goto LABEL_8;
  p_shared_owners = (unint64_t *)&v9->__shared_owners_;
  do
    v12 = __ldxr(p_shared_owners);
  while (__stxr(v12 + 1, p_shared_owners));
  v13 = (unint64_t *)&v9->__shared_owners_;
  do
    v14 = __ldaxr(v13);
  while (__stlxr(v14 - 1, v13));
  if (v14)
  {
LABEL_8:
    if (v10)
      goto LABEL_9;
LABEL_16:
    v15 = v6;
    goto LABEL_92;
  }
  ((void (*)(std::__shared_weak_count *))v9->__on_zero_shared)(v9);
  std::__shared_weak_count::__release_weak(v9);
  if (!v10)
    goto LABEL_16;
LABEL_9:
  memset(&v49, 0, sizeof(v49));
  memset(&v48, 0, sizeof(v48));
  std::string::basic_string[abi:ne180100]<0>(v36, "/tmp");
  std::string::basic_string[abi:ne180100]<0>(__p, "UpgradeTemplates");
  siri::dialogengine::JoinPath((uint64_t)v36, (uint64_t)__p, (uint64_t)v46);
  if (v41 < 0)
    operator delete(__p[0]);
  if (SHIBYTE(v36[0].__r_.__value_.__r.__words[2]) < 0)
    operator delete(v36[0].__r_.__value_.__l.__data_);
  siri::dialogengine::RequestInfo::RequestInfo((siri::dialogengine::RequestInfo *)__p, (const siri::dialogengine::RequestInfo *)(v8 + 1));
  if (SHIBYTE(__s.__r_.__value_.__r.__words[2]) < 0)
    std::string::__init_copy_ctor_external(v36, __s.__r_.__value_.__l.__data_, __s.__r_.__value_.__l.__size_);
  else
    v36[0] = __s;
  if (SHIBYTE(v36[0].__r_.__value_.__r.__words[2]) < 0)
  {
    size = v36[0].__r_.__value_.__l.__size_;
    operator delete(v36[0].__r_.__value_.__l.__data_);
    if (size)
      goto LABEL_20;
  }
  else if (*((_BYTE *)&v36[0].__r_.__value_.__s + 23))
  {
LABEL_20:
    v16 = v8[63];
    v17 = (std::__shared_weak_count *)v8[64];
    v37.__r_.__value_.__r.__words[0] = v16;
    v37.__r_.__value_.__l.__size_ = (std::string::size_type)v17;
    if (v17)
    {
      v18 = (unint64_t *)&v17->__shared_owners_;
      do
        v19 = __ldxr(v18);
      while (__stxr(v19 + 1, v18));
    }
    if (*(char *)(v16 + 127) < 0)
      std::string::__init_copy_ctor_external(&v38, *(const std::string::value_type **)(v16 + 104), *(_QWORD *)(v16 + 112));
    else
      v38 = *(std::string *)(v16 + 104);
    siri::dialogengine::CatIdToPath((uint64_t)&v38, &v39);
    siri::dialogengine::JoinPath((uint64_t)v46, (uint64_t)&v39, (uint64_t)v36);
    if (SHIBYTE(v39.__r_.__value_.__r.__words[2]) < 0)
      operator delete(v39.__r_.__value_.__l.__data_);
    if (SHIBYTE(v38.__r_.__value_.__r.__words[2]) < 0)
      operator delete(v38.__r_.__value_.__l.__data_);
    if (v17)
    {
      v21 = (unint64_t *)&v17->__shared_owners_;
      do
        v22 = __ldaxr(v21);
      while (__stlxr(v22 - 1, v21));
      if (!v22)
      {
        ((void (*)(std::__shared_weak_count *))v17->__on_zero_shared)(v17);
        std::__shared_weak_count::__release_weak(v17);
      }
    }
    std::string::basic_string[abi:ne180100]<0>(&v38, "_params.cat.xml");
    siri::dialogengine::JoinPath((uint64_t)v36, (uint64_t)&v38, (uint64_t)&v39);
    if (SHIBYTE(v49.__r_.__value_.__r.__words[2]) < 0)
      operator delete(v49.__r_.__value_.__l.__data_);
    v49 = v39;
    *((_BYTE *)&v39.__r_.__value_.__s + 23) = 0;
    v39.__r_.__value_.__s.__data_[0] = 0;
    if (SHIBYTE(v38.__r_.__value_.__r.__words[2]) < 0)
      operator delete(v38.__r_.__value_.__l.__data_);
    siri::dialogengine::Context::GetLocale((siri::dialogengine::Context *)v8, v23, (uint64_t)&v37);
    v24 = std::string::append(&v37, ".cat.xml");
    v25 = *(_OWORD *)&v24->__r_.__value_.__l.__data_;
    v38.__r_.__value_.__r.__words[2] = v24->__r_.__value_.__r.__words[2];
    *(_OWORD *)&v38.__r_.__value_.__l.__data_ = v25;
    v24->__r_.__value_.__l.__size_ = 0;
    v24->__r_.__value_.__r.__words[2] = 0;
    v24->__r_.__value_.__r.__words[0] = 0;
    siri::dialogengine::JoinPath((uint64_t)v36, (uint64_t)&v38, (uint64_t)&v39);
    if (SHIBYTE(v48.__r_.__value_.__r.__words[2]) < 0)
      operator delete(v48.__r_.__value_.__l.__data_);
    v48 = v39;
    *((_BYTE *)&v39.__r_.__value_.__s + 23) = 0;
    v39.__r_.__value_.__s.__data_[0] = 0;
    if (SHIBYTE(v38.__r_.__value_.__r.__words[2]) < 0)
      operator delete(v38.__r_.__value_.__l.__data_);
    if (SHIBYTE(v37.__r_.__value_.__r.__words[2]) < 0)
      operator delete(v37.__r_.__value_.__l.__data_);
    if (SHIBYTE(__s.__r_.__value_.__r.__words[2]) < 0)
      std::string::__init_copy_ctor_external(&v39, __s.__r_.__value_.__l.__data_, __s.__r_.__value_.__l.__size_);
    else
      v39 = __s;
    siri::dialogengine::WriteFileFromString(&v49, (uint64_t)&v39);
    if (SHIBYTE(v39.__r_.__value_.__r.__words[2]) < 0)
      operator delete(v39.__r_.__value_.__l.__data_);
    if (SHIBYTE(v44.__r_.__value_.__r.__words[2]) < 0)
      std::string::__init_copy_ctor_external(&v39, v44.__r_.__value_.__l.__data_, v44.__r_.__value_.__l.__size_);
    else
      v39 = v44;
    siri::dialogengine::WriteFileFromString(&v48, (uint64_t)&v39);
    if (SHIBYTE(v39.__r_.__value_.__r.__words[2]) < 0)
      operator delete(v39.__r_.__value_.__l.__data_);
    if (SHIBYTE(v36[0].__r_.__value_.__r.__words[2]) < 0)
      operator delete(v36[0].__r_.__value_.__l.__data_);
    goto LABEL_69;
  }
  if (SHIBYTE(v43.__r_.__value_.__r.__words[2]) < 0)
    std::string::__init_copy_ctor_external(v36, v43.__r_.__value_.__l.__data_, v43.__r_.__value_.__l.__size_);
  else
    v36[0] = v43;
  if (SHIBYTE(v49.__r_.__value_.__r.__words[2]) < 0)
    operator delete(v49.__r_.__value_.__l.__data_);
  v49 = v36[0];
  if (SHIBYTE(v45.__r_.__value_.__r.__words[2]) < 0)
    std::string::__init_copy_ctor_external(v36, v45.__r_.__value_.__l.__data_, v45.__r_.__value_.__l.__size_);
  else
    v36[0] = v45;
  if (SHIBYTE(v48.__r_.__value_.__r.__words[2]) < 0)
    operator delete(v48.__r_.__value_.__l.__data_);
  v48 = v36[0];
LABEL_69:
  siri::dialogengine::Context::Context((siri::dialogengine::Context *)v36);
  if ((siri::dialogengine::Context::LoadFiles((uint64_t)v36, (uint64_t)&v49, (uint64_t)&v48) & 1) != 0)
  {
    std::string::basic_string[abi:ne180100]<0>(&v39, (char *)objc_msgSend(objc_retainAutorelease(v5), "UTF8String"));
    v27 = siri::dialogengine::Context::UpgradeAndSave((uint64_t)v36, (uint64_t)&v48, (uint64_t)&v39);
    v28 = v27;
    if (SHIBYTE(v39.__r_.__value_.__r.__words[2]) < 0)
    {
      operator delete(v39.__r_.__value_.__l.__data_);
      if ((v28 & 1) != 0)
        goto LABEL_72;
    }
    else if ((v27 & 1) != 0)
    {
LABEL_72:
      siri::dialogengine::ReadFileToString((uint64_t)&v49, &v39);
      siri::dialogengine::ReadFileToString((uint64_t)&v48, &v38);
      siri::dialogengine::DeleteDirTree((char *)v46);
      if ((v39.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
        v29 = &v39;
      else
        v29 = (std::string *)v39.__r_.__value_.__r.__words[0];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", v29, v36[0].__r_.__value_.__r.__words[0]);
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "setObject:forKey:", v30, CFSTR("params"));

      if ((v38.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
        v31 = &v38;
      else
        v31 = (std::string *)v38.__r_.__value_.__r.__words[0];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", v31);
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "setObject:forKey:", v32, CFSTR("locale"));

      v33 = v6;
      if (SHIBYTE(v38.__r_.__value_.__r.__words[2]) < 0)
        operator delete(v38.__r_.__value_.__l.__data_);
      if (SHIBYTE(v39.__r_.__value_.__r.__words[2]) < 0)
        operator delete(v39.__r_.__value_.__l.__data_);
      goto LABEL_86;
    }
    siri::dialogengine::DeleteDirTree((char *)v46);
  }
  else
  {
    siri::dialogengine::Log::Error((siri::dialogengine::Log *)"Unable to load CAT content in order to perform upgrade.", v26);
    siri::dialogengine::DeleteDirTree((char *)v46);
  }
  v34 = v6;
LABEL_86:
  siri::dialogengine::Context::~Context((siri::dialogengine::Context *)v36);
  siri::dialogengine::RequestInfo::~RequestInfo(__p);
  if (v47 < 0)
    operator delete(v46[0]);
  if (SHIBYTE(v48.__r_.__value_.__r.__words[2]) < 0)
    operator delete(v48.__r_.__value_.__l.__data_);
  if (SHIBYTE(v49.__r_.__value_.__r.__words[2]) < 0)
    operator delete(v49.__r_.__value_.__l.__data_);
LABEL_92:

  return v6;
}

- (NSString)loadStatus
{
  char *v2;
  void *v3;
  std::string *p_p;
  void *v5;
  std::string __p;

  v2 = -[DEExecutionContext This](self, "This");
  v3 = (void *)MEMORY[0x1E0CB3940];
  if (v2[711] < 0)
    std::string::__init_copy_ctor_external(&__p, *((const std::string::value_type **)v2 + 86), *((_QWORD *)v2 + 87));
  else
    __p = *(std::string *)(v2 + 688);
  if ((__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
    p_p = &__p;
  else
    p_p = (std::string *)__p.__r_.__value_.__r.__words[0];
  objc_msgSend(v3, "stringWithUTF8String:", p_p, *(_OWORD *)&__p.__r_.__value_.__l.__data_, __p.__r_.__value_.__r.__words[2]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
    operator delete(__p.__r_.__value_.__l.__data_);
  return (NSString *)v5;
}

- (NSString)locale
{
  siri::dialogengine::Context *v2;
  void *v3;
  const char *v4;
  void **v5;
  void *v6;
  void *__p[2];
  char v9;

  v2 = -[DEExecutionContext This](self, "This");
  v3 = (void *)MEMORY[0x1E0CB3940];
  siri::dialogengine::Context::GetLocale(v2, v4, (uint64_t)__p);
  if (v9 >= 0)
    v5 = __p;
  else
    v5 = (void **)__p[0];
  objc_msgSend(v3, "stringWithUTF8String:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9 < 0)
    operator delete(__p[0]);
  return (NSString *)v6;
}

- (void)registerMorphunDataPathFor:(id)a3 path:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  id v10;
  void *__p[2];
  char v12;
  std::string v13;

  v6 = a3;
  v7 = a4;
  v8 = -[DEExecutionContext This](self, "This");
  v9 = objc_retainAutorelease(v6);
  std::string::basic_string[abi:ne180100]<0>(&v13, (char *)objc_msgSend(v9, "UTF8String"));
  v10 = objc_retainAutorelease(v7);
  std::string::basic_string[abi:ne180100]<0>(__p, (char *)objc_msgSend(v10, "UTF8String"));
  siri::dialogengine::RegisterMorphunData((uint64_t)v8, &v13, (uint64_t)__p);
  if (v12 < 0)
    operator delete(__p[0]);
  if (SHIBYTE(v13.__r_.__value_.__r.__words[2]) < 0)
    operator delete(v13.__r_.__value_.__l.__data_);

}

- (void)enableDebugLogging
{
  const char *v2;

  siri::dialogengine::Log::SetLogDebugMessages((siri::dialogengine::Log *)1);
  siri::dialogengine::Log::Debug((siri::dialogengine::Log *)"Debug mode activated", v2);
}

- (id)getBuiltinSemanticConcepts
{
  void *v2;
  std::string *p_p;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  void *v12;
  int v13;
  void *v14;
  void *v15;
  void *v16;
  void *v18;
  id obj;
  void *v20;
  void *v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  std::string __p;
  __int128 *v27[3];
  void *v28;
  uint64_t v29;
  uint64_t v30;
  _BYTE v31[128];
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  siri::dialogengine::RequestInfo::RequestInfo((siri::dialogengine::RequestInfo *)&v28, (const siri::dialogengine::RequestInfo *)(-[DEExecutionContext This](self, "This") + 8));
  memset(v27, 0, sizeof(v27));
  std::vector<siri::dialogengine::UpdatableDir>::__init_with_size[abi:ne180100]<siri::dialogengine::UpdatableDir*,siri::dialogengine::UpdatableDir*>(v27, v29, v30, 0xAAAAAAAAAAAAAAABLL * ((v30 - v29) >> 5));
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = (void *)MEMORY[0x1E0CB3940];
  siri::dialogengine::GetBaseDir(v27, &__p);
  if ((__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
    p_p = &__p;
  else
    p_p = (std::string *)__p.__r_.__value_.__r.__words[0];
  objc_msgSend(v2, "stringWithFormat:", CFSTR("%s/%s"), p_p, "metadata");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
    operator delete(__p.__r_.__value_.__l.__data_);
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "enumeratorAtPath:", v21);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  __p.__r_.__value_.__s.__data_[0] = 1;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  obj = v4;
  v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v22, v31, 16);
  if (v5)
  {
    v6 = *(_QWORD *)v23;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v23 != v6)
          objc_enumerationMutation(obj);
        v8 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * i);
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@/%@"), v21, v8);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = objc_msgSend(v20, "fileExistsAtPath:isDirectory:", v9, &__p);
        objc_msgSend(v8, "lastPathComponent");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "pathExtension");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = objc_msgSend(v12, "isEqualToString:", CFSTR("dtag"));

        if ((v10 & v13) == 1)
        {
          objc_msgSend(v8, "lastPathComponent");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "stringByDeletingPathExtension");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v18, "addObject:", v15);

        }
      }
      v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v22, v31, 16);
    }
    while (v5);
  }

  objc_msgSend(v18, "allObjects");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  __p.__r_.__value_.__r.__words[0] = (std::string::size_type)v27;
  std::vector<siri::dialogengine::UpdatableDir>::__destroy_vector::operator()[abi:ne180100]((void ***)&__p);
  siri::dialogengine::RequestInfo::~RequestInfo(&v28);
  return v16;
}

- (BOOL)isBuiltinType:(id)a3
{
  id v3;
  void *v4;
  char *v5;
  BOOL IsBuiltinType;
  std::string __p;

  v3 = a3;
  v4 = v3;
  if (v3)
    v5 = (char *)objc_msgSend(objc_retainAutorelease(v3), "UTF8String");
  else
    v5 = "";
  std::string::basic_string[abi:ne180100]<0>(&__p, v5);
  IsBuiltinType = siri::dialogengine::IsBuiltinType(&__p);
  if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
    operator delete(__p.__r_.__value_.__l.__data_);

  return IsBuiltinType;
}

- (void)This
{
  return self->_This;
}

- (void)setThis:(void *)a3
{
  self->_This = a3;
}

- (shared_ptr<siri::dialogengine::Context>)SharedThis
{
  void *v2;
  Context *v3;
  __shared_weak_count *v4;
  shared_ptr<siri::dialogengine::Context> result;

  objc_copyCppObjectAtomic(v2, &self->_SharedThis, (void (__cdecl *)(void *, const void *))__copy_helper_atomic_property__23032);
  result.__cntrl_ = v4;
  result.__ptr_ = v3;
  return result;
}

- (void)setSharedThis:(shared_ptr<siri::dialogengine::Context>)a3
{
  objc_copyCppObjectAtomic(&self->_SharedThis, a3.__ptr_, (void (__cdecl *)(void *, const void *))__assign_helper_atomic_property__23031);
}

- (void).cxx_destruct
{
  std::shared_ptr<siri::dialogengine::VisualComponentsCombination::Entry>::~shared_ptr[abi:ne180100]((uint64_t)&self->_SharedThis);
}

- (id).cxx_construct
{
  *((_QWORD *)self + 2) = 0;
  *((_QWORD *)self + 3) = 0;
  return self;
}

+ (id)globalParameters
{
  __int128 *v2;
  void *v3;
  std::string *v4;
  void *v5;
  void *v6;
  std::string *v7;
  void *v8;
  __int128 *v9;
  __int128 *v10;
  BOOL v11;
  id v13;
  std::string v14;
  std::string __p;
  void *v16;
  std::string v17;
  std::string v18;
  void *v19[12];
  __int128 *v20;
  _QWORD *v21[2];
  _BYTE v22[3520];

  siri::dialogengine::Context::Context((siri::dialogengine::Context *)v22);
  v13 = (id)objc_opt_new();
  siri::dialogengine::Context::GetGlobalParameters((siri::dialogengine::Context *)v22, (uint64_t)&v20);
  v2 = v20;
  if (v20 != (__int128 *)v21)
  {
    do
    {
      std::pair<std::string const,siri::dialogengine::Parameter>::pair[abi:ne180100](&__p, v2 + 2);
      v3 = (void *)MEMORY[0x1E0CB3940];
      if (SHIBYTE(v17.__r_.__value_.__r.__words[2]) < 0)
        std::string::__init_copy_ctor_external(&v14, v17.__r_.__value_.__l.__data_, v17.__r_.__value_.__l.__size_);
      else
        v14 = v17;
      if ((v14.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
        v4 = &v14;
      else
        v4 = (std::string *)v14.__r_.__value_.__r.__words[0];
      objc_msgSend(v3, "stringWithUTF8String:", v4);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      if (SHIBYTE(v14.__r_.__value_.__r.__words[2]) < 0)
        operator delete(v14.__r_.__value_.__l.__data_);
      v6 = (void *)MEMORY[0x1E0CB3940];
      if (SHIBYTE(v18.__r_.__value_.__r.__words[2]) < 0)
        std::string::__init_copy_ctor_external(&v14, v18.__r_.__value_.__l.__data_, v18.__r_.__value_.__l.__size_);
      else
        v14 = v18;
      if ((v14.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
        v7 = &v14;
      else
        v7 = (std::string *)v14.__r_.__value_.__r.__words[0];
      objc_msgSend(v6, "stringWithUTF8String:", v7);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      if (SHIBYTE(v14.__r_.__value_.__r.__words[2]) < 0)
        operator delete(v14.__r_.__value_.__l.__data_);
      objc_msgSend(v13, "setObject:forKey:", v8, v5);

      v19[8] = off_1E793AED8;
      std::__tree<std::__value_type<std::string,std::string>,std::__map_value_compare<std::string,std::__value_type<std::string,std::string>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,std::string>>>::destroy((_QWORD *)v19[10]);
      siri::dialogengine::LineNumberBase::~LineNumberBase(v19);
      siri::dialogengine::ObjectProperty::~ObjectProperty(&v16);
      if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
        operator delete(__p.__r_.__value_.__l.__data_);
      v9 = (__int128 *)*((_QWORD *)v2 + 1);
      if (v9)
      {
        do
        {
          v10 = v9;
          v9 = *(__int128 **)v9;
        }
        while (v9);
      }
      else
      {
        do
        {
          v10 = (__int128 *)*((_QWORD *)v2 + 2);
          v11 = *(_QWORD *)v10 == (_QWORD)v2;
          v2 = v10;
        }
        while (!v11);
      }
      v2 = v10;
    }
    while (v10 != (__int128 *)v21);
  }
  std::__tree<std::__value_type<std::string,siri::dialogengine::Parameter>,std::__map_value_compare<std::string,std::__value_type<std::string,siri::dialogengine::Parameter>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,siri::dialogengine::Parameter>>>::destroy(v21[0]);
  siri::dialogengine::Context::~Context((siri::dialogengine::Context *)v22);
  return v13;
}

@end
