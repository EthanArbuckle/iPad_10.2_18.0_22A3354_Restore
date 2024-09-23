@implementation DEObjectSchema

- (DEObjectSchema)init
{
  DEObjectSchema *v2;
  DEObjectSchema *v3;
  std::__shared_weak_count *v4;
  unint64_t *p_shared_owners;
  unint64_t v6;
  uint64_t v8;
  std::__shared_weak_count *v9;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)DEObjectSchema;
  v2 = -[DEObjectSchema init](&v10, sel_init);
  v3 = v2;
  if (v2)
  {
    v8 = 0;
    v9 = 0;
    -[DEObjectSchema setThis:](v2, "setThis:", &v8);
    v4 = v9;
    if (v9)
    {
      p_shared_owners = (unint64_t *)&v9->__shared_owners_;
      do
        v6 = __ldaxr(p_shared_owners);
      while (__stlxr(v6 - 1, p_shared_owners));
      if (!v6)
      {
        ((void (*)(std::__shared_weak_count *))v4->__on_zero_shared)(v4);
        std::__shared_weak_count::__release_weak(v4);
      }
    }
  }
  return v3;
}

- (DEObjectSchema)initWithPtr:(shared_ptr<siri::dialogengine::ObjectSchema>)a3
{
  ObjectSchema *ptr;
  DEObjectSchema *v4;
  DEObjectSchema *v5;
  std::__shared_weak_count *v6;
  unint64_t *p_shared_owners;
  unint64_t v8;
  std::__shared_weak_count *v9;
  unint64_t *v10;
  unint64_t v11;
  uint64_t v13;
  std::__shared_weak_count *v14;
  objc_super v15;

  ptr = a3.__ptr_;
  v15.receiver = self;
  v15.super_class = (Class)DEObjectSchema;
  v4 = -[DEObjectSchema init](&v15, sel_init, a3.__ptr_, a3.__cntrl_);
  v5 = v4;
  if (v4)
  {
    v6 = (std::__shared_weak_count *)*((_QWORD *)ptr + 1);
    v13 = *(_QWORD *)ptr;
    v14 = v6;
    if (v6)
    {
      p_shared_owners = (unint64_t *)&v6->__shared_owners_;
      do
        v8 = __ldxr(p_shared_owners);
      while (__stxr(v8 + 1, p_shared_owners));
    }
    -[DEObjectSchema setThis:](v4, "setThis:", &v13);
    v9 = v14;
    if (v14)
    {
      v10 = (unint64_t *)&v14->__shared_owners_;
      do
        v11 = __ldaxr(v10);
      while (__stlxr(v11 - 1, v10));
      if (!v11)
      {
        ((void (*)(std::__shared_weak_count *))v9->__on_zero_shared)(v9);
        std::__shared_weak_count::__release_weak(v9);
      }
    }
  }
  return v5;
}

- (NSString)name
{
  void *v3;
  __int128 v4;
  __CFString *v5;
  std::string *v6;
  unint64_t *p_shared_owners;
  unint64_t v8;
  std::__shared_weak_count *v9;
  unint64_t *v10;
  unint64_t v11;
  __int128 *v13;
  std::__shared_weak_count *v14;
  std::string v15;
  uint64_t v16;
  std::__shared_weak_count *v17;

  -[DEObjectSchema This](self, "This");
  if (v16)
  {
    v3 = (void *)MEMORY[0x1E0CB3940];
    -[DEObjectSchema This](self, "This");
    if (*((char *)v13 + 23) < 0)
    {
      std::string::__init_copy_ctor_external(&v15, *(const std::string::value_type **)v13, *((_QWORD *)v13 + 1));
    }
    else
    {
      v4 = *v13;
      v15.__r_.__value_.__r.__words[2] = *((_QWORD *)v13 + 2);
      *(_OWORD *)&v15.__r_.__value_.__l.__data_ = v4;
    }
    if ((v15.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
      v6 = &v15;
    else
      v6 = (std::string *)v15.__r_.__value_.__r.__words[0];
    objc_msgSend(v3, "stringWithUTF8String:", v6);
    v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
    if (SHIBYTE(v15.__r_.__value_.__r.__words[2]) < 0)
      operator delete(v15.__r_.__value_.__l.__data_);
    if (v14)
    {
      p_shared_owners = (unint64_t *)&v14->__shared_owners_;
      do
        v8 = __ldaxr(p_shared_owners);
      while (__stlxr(v8 - 1, p_shared_owners));
      if (!v8)
      {
        ((void (*)())v14->__on_zero_shared)();
        std::__shared_weak_count::__release_weak(v14);
      }
    }
  }
  else
  {
    v5 = &stru_1E793AF80;
  }
  v9 = v17;
  if (v17)
  {
    v10 = (unint64_t *)&v17->__shared_owners_;
    do
      v11 = __ldaxr(v10);
    while (__stlxr(v11 - 1, v10));
    if (!v11)
    {
      ((void (*)(std::__shared_weak_count *))v9->__on_zero_shared)(v9);
      std::__shared_weak_count::__release_weak(v9);
    }
  }
  return (NSString *)v5;
}

- (NSString)baseObject
{
  void *v3;
  __CFString *v4;
  std::string *v5;
  unint64_t *p_shared_owners;
  unint64_t v7;
  std::__shared_weak_count *v8;
  unint64_t *v9;
  unint64_t v10;
  uint64_t v12;
  std::__shared_weak_count *v13;
  std::string v14;
  uint64_t v15;
  std::__shared_weak_count *v16;

  -[DEObjectSchema This](self, "This");
  if (v15)
  {
    v3 = (void *)MEMORY[0x1E0CB3940];
    -[DEObjectSchema This](self, "This");
    if (*(char *)(v12 + 95) < 0)
      std::string::__init_copy_ctor_external(&v14, *(const std::string::value_type **)(v12 + 72), *(_QWORD *)(v12 + 80));
    else
      v14 = *(std::string *)(v12 + 72);
    if ((v14.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
      v5 = &v14;
    else
      v5 = (std::string *)v14.__r_.__value_.__r.__words[0];
    objc_msgSend(v3, "stringWithUTF8String:", v5);
    v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
    if (SHIBYTE(v14.__r_.__value_.__r.__words[2]) < 0)
      operator delete(v14.__r_.__value_.__l.__data_);
    if (v13)
    {
      p_shared_owners = (unint64_t *)&v13->__shared_owners_;
      do
        v7 = __ldaxr(p_shared_owners);
      while (__stlxr(v7 - 1, p_shared_owners));
      if (!v7)
      {
        ((void (*)())v13->__on_zero_shared)();
        std::__shared_weak_count::__release_weak(v13);
      }
    }
  }
  else
  {
    v4 = &stru_1E793AF80;
  }
  v8 = v16;
  if (v16)
  {
    v9 = (unint64_t *)&v16->__shared_owners_;
    do
      v10 = __ldaxr(v9);
    while (__stlxr(v10 - 1, v9));
    if (!v10)
    {
      ((void (*)(std::__shared_weak_count *))v8->__on_zero_shared)(v8);
      std::__shared_weak_count::__release_weak(v8);
    }
  }
  return (NSString *)v4;
}

- (NSString)description
{
  void *v3;
  __CFString *v4;
  std::string *v5;
  unint64_t *p_shared_owners;
  unint64_t v7;
  std::__shared_weak_count *v8;
  unint64_t *v9;
  unint64_t v10;
  uint64_t v12;
  std::__shared_weak_count *v13;
  std::string v14;
  uint64_t v15;
  std::__shared_weak_count *v16;

  -[DEObjectSchema This](self, "This");
  if (v15)
  {
    v3 = (void *)MEMORY[0x1E0CB3940];
    -[DEObjectSchema This](self, "This");
    if (*(char *)(v12 + 71) < 0)
      std::string::__init_copy_ctor_external(&v14, *(const std::string::value_type **)(v12 + 48), *(_QWORD *)(v12 + 56));
    else
      v14 = *(std::string *)(v12 + 48);
    if ((v14.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
      v5 = &v14;
    else
      v5 = (std::string *)v14.__r_.__value_.__r.__words[0];
    objc_msgSend(v3, "stringWithUTF8String:", v5);
    v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
    if (SHIBYTE(v14.__r_.__value_.__r.__words[2]) < 0)
      operator delete(v14.__r_.__value_.__l.__data_);
    if (v13)
    {
      p_shared_owners = (unint64_t *)&v13->__shared_owners_;
      do
        v7 = __ldaxr(p_shared_owners);
      while (__stlxr(v7 - 1, p_shared_owners));
      if (!v7)
      {
        ((void (*)())v13->__on_zero_shared)();
        std::__shared_weak_count::__release_weak(v13);
      }
    }
  }
  else
  {
    v4 = &stru_1E793AF80;
  }
  v8 = v16;
  if (v16)
  {
    v9 = (unint64_t *)&v16->__shared_owners_;
    do
      v10 = __ldaxr(v9);
    while (__stlxr(v10 - 1, v9));
    if (!v10)
    {
      ((void (*)(std::__shared_weak_count *))v8->__on_zero_shared)(v8);
      std::__shared_weak_count::__release_weak(v8);
    }
  }
  return (NSString *)v4;
}

- (id)propertyNames:(id)a3
{
  id v4;
  void *v5;
  unint64_t *p_size;
  unint64_t v7;
  uint64_t v8;
  unint64_t *v9;
  unint64_t v10;
  std::vector<std::string>::pointer begin;
  std::vector<std::string>::pointer i;
  __int128 v13;
  std::string *p_p;
  void *v15;
  std::string __p;
  std::vector<std::string> v18;

  v4 = a3;
  v5 = (void *)objc_opt_new();
  -[DEObjectSchema This](self, "This");
  if (!v18.__end_)
    goto LABEL_5;
  p_size = &v18.__end_->__r_.__value_.__l.__size_;
  do
    v7 = __ldaxr(p_size);
  while (__stlxr(v7 - 1, p_size));
  if (!v7)
  {
    (*((void (**)(std::vector<std::string>::pointer))v18.__end_->__r_.__value_.__l.__data_ + 2))(v18.__end_);
    std::__shared_weak_count::__release_weak((std::__shared_weak_count *)v18.__end_);
    if (!v18.__begin_)
      goto LABEL_22;
  }
  else
  {
LABEL_5:
    if (!v18.__begin_)
      goto LABEL_22;
  }
  v8 = objc_msgSend(v4, "This");
  -[DEObjectSchema This](self, "This");
  siri::dialogengine::ObjectSchema::GetPropertyNames((uint64_t)__p.__r_.__value_.__l.__data_, v8, 0, &v18);
  if (__p.__r_.__value_.__l.__size_)
  {
    v9 = (unint64_t *)(__p.__r_.__value_.__l.__size_ + 8);
    do
      v10 = __ldaxr(v9);
    while (__stlxr(v10 - 1, v9));
    if (!v10)
    {
      (*(void (**)(std::string::size_type))(*(_QWORD *)__p.__r_.__value_.__l.__size_ + 16))(__p.__r_.__value_.__l.__size_);
      std::__shared_weak_count::__release_weak((std::__shared_weak_count *)__p.__r_.__value_.__l.__size_);
    }
  }
  begin = v18.__begin_;
  for (i = v18.__end_; begin != i; ++begin)
  {
    if (SHIBYTE(begin->__r_.__value_.__r.__words[2]) < 0)
    {
      std::string::__init_copy_ctor_external(&__p, begin->__r_.__value_.__l.__data_, begin->__r_.__value_.__l.__size_);
    }
    else
    {
      v13 = *(_OWORD *)&begin->__r_.__value_.__l.__data_;
      __p.__r_.__value_.__r.__words[2] = begin->__r_.__value_.__r.__words[2];
      *(_OWORD *)&__p.__r_.__value_.__l.__data_ = v13;
    }
    if ((__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
      p_p = &__p;
    else
      p_p = (std::string *)__p.__r_.__value_.__r.__words[0];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", p_p, *(_OWORD *)&__p.__r_.__value_.__l.__data_, __p.__r_.__value_.__r.__words[2]);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObject:", v15);

    if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
      operator delete(__p.__r_.__value_.__l.__data_);
  }
  __p.__r_.__value_.__r.__words[0] = (std::string::size_type)&v18;
  std::vector<std::string>::__destroy_vector::operator()[abi:ne180100]((void ***)&__p);
LABEL_22:

  return v5;
}

- (id)property:(id)a3 name:(id)a4
{
  id v6;
  id v7;
  uint64_t *p_shared_owners;
  unint64_t v9;
  const char *v10;
  uint64_t v11;
  std::__shared_weak_count *v12;
  unint64_t *v13;
  unint64_t v14;
  DEObjectProperty *v15;
  void *__p[2];
  char v18;
  uint64_t v19;
  std::__shared_weak_count *v20;
  void *v21;
  std::__shared_weak_count *v22;
  char v23;

  v6 = a3;
  v7 = a4;
  -[DEObjectSchema This](self, "This");
  if (!v22)
    goto LABEL_5;
  p_shared_owners = &v22->__shared_owners_;
  do
    v9 = __ldaxr((unint64_t *)p_shared_owners);
  while (__stlxr(v9 - 1, (unint64_t *)p_shared_owners));
  if (v9)
  {
LABEL_5:
    if (v21)
      goto LABEL_6;
LABEL_17:
    v15 = 0;
    goto LABEL_18;
  }
  ((void (*)(std::__shared_weak_count *))v22->__on_zero_shared)(v22);
  std::__shared_weak_count::__release_weak(v22);
  if (!v21)
    goto LABEL_17;
LABEL_6:
  v10 = (const char *)objc_msgSend(v6, "This");
  -[DEObjectSchema This](self, "This");
  v11 = v19;
  std::string::basic_string[abi:ne180100]<0>(__p, (char *)objc_msgSend(objc_retainAutorelease(v7), "UTF8String"));
  siri::dialogengine::ObjectSchema::GetProperty(v11, v10, (const void **)__p, 0, (siri::dialogengine::ObjectProperty *)&v21);
  if (v18 < 0)
    operator delete(__p[0]);
  v12 = v20;
  if (v20)
  {
    v13 = (unint64_t *)&v20->__shared_owners_;
    do
      v14 = __ldaxr(v13);
    while (__stlxr(v14 - 1, v13));
    if (!v14)
    {
      ((void (*)(std::__shared_weak_count *))v12->__on_zero_shared)(v12);
      std::__shared_weak_count::__release_weak(v12);
    }
  }
  if (!v23)
    goto LABEL_17;
  v15 = -[DEObjectProperty initWithOpt:]([DEObjectProperty alloc], "initWithOpt:", &v21);
  if (v23)
    siri::dialogengine::ObjectProperty::~ObjectProperty(&v21);
LABEL_18:

  return v15;
}

- (id)inputNames:(id)a3
{
  id v4;
  void *v5;
  unint64_t *p_size;
  unint64_t v7;
  uint64_t v8;
  unint64_t *v9;
  unint64_t v10;
  std::vector<std::string>::pointer begin;
  std::vector<std::string>::pointer i;
  __int128 v13;
  std::string *p_p;
  void *v15;
  std::string __p;
  std::vector<std::string> v18;

  v4 = a3;
  v5 = (void *)objc_opt_new();
  -[DEObjectSchema This](self, "This");
  if (!v18.__end_)
    goto LABEL_5;
  p_size = &v18.__end_->__r_.__value_.__l.__size_;
  do
    v7 = __ldaxr(p_size);
  while (__stlxr(v7 - 1, p_size));
  if (!v7)
  {
    (*((void (**)(std::vector<std::string>::pointer))v18.__end_->__r_.__value_.__l.__data_ + 2))(v18.__end_);
    std::__shared_weak_count::__release_weak((std::__shared_weak_count *)v18.__end_);
    if (!v18.__begin_)
      goto LABEL_22;
  }
  else
  {
LABEL_5:
    if (!v18.__begin_)
      goto LABEL_22;
  }
  v8 = objc_msgSend(v4, "This");
  -[DEObjectSchema This](self, "This");
  siri::dialogengine::ObjectSchema::GetInputNames((uint64_t)__p.__r_.__value_.__l.__data_, v8, 0, &v18);
  if (__p.__r_.__value_.__l.__size_)
  {
    v9 = (unint64_t *)(__p.__r_.__value_.__l.__size_ + 8);
    do
      v10 = __ldaxr(v9);
    while (__stlxr(v10 - 1, v9));
    if (!v10)
    {
      (*(void (**)(std::string::size_type))(*(_QWORD *)__p.__r_.__value_.__l.__size_ + 16))(__p.__r_.__value_.__l.__size_);
      std::__shared_weak_count::__release_weak((std::__shared_weak_count *)__p.__r_.__value_.__l.__size_);
    }
  }
  begin = v18.__begin_;
  for (i = v18.__end_; begin != i; ++begin)
  {
    if (SHIBYTE(begin->__r_.__value_.__r.__words[2]) < 0)
    {
      std::string::__init_copy_ctor_external(&__p, begin->__r_.__value_.__l.__data_, begin->__r_.__value_.__l.__size_);
    }
    else
    {
      v13 = *(_OWORD *)&begin->__r_.__value_.__l.__data_;
      __p.__r_.__value_.__r.__words[2] = begin->__r_.__value_.__r.__words[2];
      *(_OWORD *)&__p.__r_.__value_.__l.__data_ = v13;
    }
    if ((__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
      p_p = &__p;
    else
      p_p = (std::string *)__p.__r_.__value_.__r.__words[0];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", p_p, *(_OWORD *)&__p.__r_.__value_.__l.__data_, __p.__r_.__value_.__r.__words[2]);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObject:", v15);

    if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
      operator delete(__p.__r_.__value_.__l.__data_);
  }
  __p.__r_.__value_.__r.__words[0] = (std::string::size_type)&v18;
  std::vector<std::string>::__destroy_vector::operator()[abi:ne180100]((void ***)&__p);
LABEL_22:

  return v5;
}

- (id)input:(id)a3 name:(id)a4
{
  id v6;
  id v7;
  unint64_t *v8;
  unint64_t v9;
  const char *v10;
  uint64_t v11;
  std::__shared_weak_count *v12;
  unint64_t *p_shared_owners;
  unint64_t v14;
  uint64_t v15;
  std::__shared_weak_count *v16;
  uint64_t v17;
  DEObjectProperty *v18;
  uint64_t v19;
  uint64_t v20;
  std::__shared_weak_count *v21;
  unint64_t *v22;
  unint64_t v23;
  std::string __p;
  uint64_t v26;
  std::__shared_weak_count *v27;
  void *v28;
  std::string v29;
  std::string v30;
  std::string v31;

  v6 = a3;
  v7 = a4;
  -[DEObjectSchema This](self, "This");
  if (v29.__r_.__value_.__r.__words[0])
  {
    v8 = (unint64_t *)(v29.__r_.__value_.__r.__words[0] + 8);
    do
      v9 = __ldaxr(v8);
    while (__stlxr(v9 - 1, v8));
    if (!v9)
    {
      (*(void (**)(std::string::size_type))(*(_QWORD *)v29.__r_.__value_.__l.__data_ + 16))(v29.__r_.__value_.__r.__words[0]);
      std::__shared_weak_count::__release_weak((std::__shared_weak_count *)v29.__r_.__value_.__l.__data_);
      if (v28)
        goto LABEL_6;
LABEL_16:
      v18 = 0;
      goto LABEL_36;
    }
  }
  if (!v28)
    goto LABEL_16;
LABEL_6:
  v10 = (const char *)objc_msgSend(v6, "This");
  -[DEObjectSchema This](self, "This");
  v11 = v26;
  std::string::basic_string[abi:ne180100]<0>(&__p, (char *)objc_msgSend(objc_retainAutorelease(v7), "UTF8String"));
  siri::dialogengine::ObjectSchema::ResolveInput(v11, v10, (const void **)&__p.__r_.__value_.__l.__data_, 0, (uint64_t)&v28);
  if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
    operator delete(__p.__r_.__value_.__l.__data_);
  v12 = v27;
  if (v27)
  {
    p_shared_owners = (unint64_t *)&v27->__shared_owners_;
    do
      v14 = __ldaxr(p_shared_owners);
    while (__stlxr(v14 - 1, p_shared_owners));
    if (!v14)
    {
      ((void (*)(std::__shared_weak_count *))v12->__on_zero_shared)(v12);
      std::__shared_weak_count::__release_weak(v12);
    }
  }
  v15 = operator new();
  *(_OWORD *)(v15 + 208) = 0u;
  *(_OWORD *)(v15 + 224) = 0u;
  *(_OWORD *)(v15 + 176) = 0u;
  *(_OWORD *)(v15 + 192) = 0u;
  *(_OWORD *)(v15 + 144) = 0u;
  *(_OWORD *)(v15 + 160) = 0u;
  *(_OWORD *)(v15 + 112) = 0u;
  *(_OWORD *)(v15 + 128) = 0u;
  *(_OWORD *)(v15 + 80) = 0u;
  *(_OWORD *)(v15 + 96) = 0u;
  *(_OWORD *)(v15 + 48) = 0u;
  *(_OWORD *)(v15 + 64) = 0u;
  *(_OWORD *)(v15 + 16) = 0u;
  *(_OWORD *)(v15 + 32) = 0u;
  *(_OWORD *)v15 = 0u;
  *(_WORD *)(v15 + 153) = 257;
  *(_QWORD *)v15 = &off_1E793AE08;
  *(_OWORD *)(v15 + 218) = 0u;
  v26 = v15;
  v16 = (std::__shared_weak_count *)operator new();
  v16->__vftable = (std::__shared_weak_count_vtbl *)&off_1E79352A8;
  v16->__shared_owners_ = 0;
  v16->__shared_weak_owners_ = 0;
  v16[1].__vftable = (std::__shared_weak_count_vtbl *)v15;
  v27 = v16;
  v17 = v26;
  if (SHIBYTE(v29.__r_.__value_.__r.__words[2]) < 0)
    std::string::__init_copy_ctor_external(&__p, v29.__r_.__value_.__l.__data_, v29.__r_.__value_.__l.__size_);
  else
    __p = v29;
  std::string::operator=((std::string *)(v17 + 8), &__p);
  if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
    operator delete(__p.__r_.__value_.__l.__data_);
  v19 = v26;
  if (SHIBYTE(v30.__r_.__value_.__r.__words[2]) < 0)
    std::string::__init_copy_ctor_external(&__p, v30.__r_.__value_.__l.__data_, v30.__r_.__value_.__l.__size_);
  else
    __p = v30;
  std::string::operator=((std::string *)(v19 + 32), &__p);
  if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
    operator delete(__p.__r_.__value_.__l.__data_);
  v20 = v26;
  if (SHIBYTE(v31.__r_.__value_.__r.__words[2]) < 0)
    std::string::__init_copy_ctor_external(&__p, v31.__r_.__value_.__l.__data_, v31.__r_.__value_.__l.__size_);
  else
    __p = v31;
  std::string::operator=((std::string *)(v20 + 56), &__p);
  if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
    operator delete(__p.__r_.__value_.__l.__data_);
  v18 = -[DEObjectProperty initWithSharedPtr:]([DEObjectProperty alloc], "initWithSharedPtr:", &v26);
  v21 = v27;
  if (v27)
  {
    v22 = (unint64_t *)&v27->__shared_owners_;
    do
      v23 = __ldaxr(v22);
    while (__stlxr(v23 - 1, v22));
    if (!v23)
    {
      ((void (*)(std::__shared_weak_count *))v21->__on_zero_shared)(v21);
      std::__shared_weak_count::__release_weak(v21);
    }
  }
  siri::dialogengine::PropertyBase::~PropertyBase(&v28);
LABEL_36:

  return v18;
}

- (shared_ptr<siri::dialogengine::ObjectSchema>)This
{
  void *v2;
  ObjectSchema *v3;
  __shared_weak_count *v4;
  shared_ptr<siri::dialogengine::ObjectSchema> result;

  objc_copyCppObjectAtomic(v2, &self->_This, (void (__cdecl *)(void *, const void *))__copy_helper_atomic_property__25195);
  result.__cntrl_ = v4;
  result.__ptr_ = v3;
  return result;
}

- (void)setThis:(shared_ptr<siri::dialogengine::ObjectSchema>)a3
{
  objc_copyCppObjectAtomic(&self->_This, a3.__ptr_, (void (__cdecl *)(void *, const void *))__assign_helper_atomic_property__25194);
}

- (void).cxx_destruct
{
  std::shared_ptr<siri::dialogengine::VisualComponentsCombination::Entry>::~shared_ptr[abi:ne180100]((uint64_t)&self->_This);
}

- (id).cxx_construct
{
  *((_QWORD *)self + 1) = 0;
  *((_QWORD *)self + 2) = 0;
  return self;
}

+ (id)schema:(id)a3 typeName:(id)a4
{
  id v5;
  uint64_t v6;
  id v7;
  DEObjectSchema *v8;
  unint64_t *p_shared_owners;
  unint64_t v10;
  DEObjectSchema *v11;
  std::__shared_weak_count *v12;
  unint64_t *v13;
  unint64_t v14;
  std::__shared_weak_count *v15;
  unint64_t *v16;
  unint64_t v17;
  uint64_t v19;
  std::__shared_weak_count *v20;
  uint64_t v21;
  std::__shared_weak_count *v22;
  void *__p[2];
  char v24;

  v5 = a4;
  v6 = objc_msgSend(a3, "This");
  v7 = objc_retainAutorelease(v5);
  std::string::basic_string[abi:ne180100]<0>(__p, (char *)objc_msgSend(v7, "UTF8String"));
  siri::dialogengine::ObjectRegistry::GetObject(v6, (const std::string::value_type **)__p, &v21);
  if (v21)
  {
    v8 = [DEObjectSchema alloc];
    v19 = v21;
    v20 = v22;
    if (v22)
    {
      p_shared_owners = (unint64_t *)&v22->__shared_owners_;
      do
        v10 = __ldxr(p_shared_owners);
      while (__stxr(v10 + 1, p_shared_owners));
    }
    v11 = -[DEObjectSchema initWithPtr:](v8, "initWithPtr:", &v19);
    v12 = v20;
    if (v20)
    {
      v13 = (unint64_t *)&v20->__shared_owners_;
      do
        v14 = __ldaxr(v13);
      while (__stlxr(v14 - 1, v13));
      if (!v14)
      {
        ((void (*)(std::__shared_weak_count *))v12->__on_zero_shared)(v12);
        std::__shared_weak_count::__release_weak(v12);
      }
    }
  }
  else
  {
    v11 = 0;
  }
  v15 = v22;
  if (v22)
  {
    v16 = (unint64_t *)&v22->__shared_owners_;
    do
      v17 = __ldaxr(v16);
    while (__stlxr(v17 - 1, v16));
    if (!v17)
    {
      ((void (*)(std::__shared_weak_count *))v15->__on_zero_shared)(v15);
      std::__shared_weak_count::__release_weak(v15);
    }
  }
  if (v24 < 0)
    operator delete(__p[0]);

  return v11;
}

@end
