@implementation DEPatternSchema

- (DEPatternSchema)init
{
  DEPatternSchema *v2;
  DEPatternSchema *v3;
  std::__shared_weak_count *v4;
  unint64_t *p_shared_owners;
  unint64_t v6;
  uint64_t v8;
  std::__shared_weak_count *v9;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)DEPatternSchema;
  v2 = -[DEPatternSchema init](&v10, sel_init);
  v3 = v2;
  if (v2)
  {
    v8 = 0;
    v9 = 0;
    -[DEPatternSchema setThis:](v2, "setThis:", &v8);
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

- (DEPatternSchema)initWithPtr:(shared_ptr<siri::dialogengine::PatternSchema>)a3
{
  PatternSchema *ptr;
  DEPatternSchema *v4;
  DEPatternSchema *v5;
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
  v15.super_class = (Class)DEPatternSchema;
  v4 = -[DEPatternSchema init](&v15, sel_init, a3.__ptr_, a3.__cntrl_);
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
    -[DEPatternSchema setThis:](v4, "setThis:", &v13);
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

  -[DEPatternSchema This](self, "This");
  if (v16)
  {
    v3 = (void *)MEMORY[0x1E0CB3940];
    -[DEPatternSchema This](self, "This");
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

  -[DEPatternSchema This](self, "This");
  if (v15)
  {
    v3 = (void *)MEMORY[0x1E0CB3940];
    -[DEPatternSchema This](self, "This");
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

- (id)requiredParameterNames
{
  void *v3;
  unint64_t *v4;
  unint64_t v5;
  unint64_t *v6;
  unint64_t v7;
  __int128 *v8;
  std::string *p_p;
  void *v10;
  std::__shared_weak_count *v11;
  unint64_t *p_shared_owners;
  unint64_t v13;
  __int128 *v14;
  __int128 *v15;
  BOOL v16;
  std::string __p;
  std::__shared_weak_count *v19;
  __int128 *v20;
  _QWORD *v21[2];

  v3 = (void *)objc_opt_new();
  -[DEPatternSchema This](self, "This");
  if (!__p.__r_.__value_.__l.__size_)
    goto LABEL_5;
  v4 = (unint64_t *)(__p.__r_.__value_.__l.__size_ + 8);
  do
    v5 = __ldaxr(v4);
  while (__stlxr(v5 - 1, v4));
  if (!v5)
  {
    (*(void (**)(std::string::size_type))(*(_QWORD *)__p.__r_.__value_.__l.__size_ + 16))(__p.__r_.__value_.__l.__size_);
    std::__shared_weak_count::__release_weak((std::__shared_weak_count *)__p.__r_.__value_.__l.__size_);
    if (!__p.__r_.__value_.__r.__words[0])
      return v3;
  }
  else
  {
LABEL_5:
    if (!__p.__r_.__value_.__r.__words[0])
      return v3;
  }
  -[DEPatternSchema This](self, "This");
  std::map<std::string,std::shared_ptr<siri::dialogengine::Parameter>>::map[abi:ne180100]((uint64_t)&v20, (const void ***)(__p.__r_.__value_.__r.__words[0] + 144));
  if (__p.__r_.__value_.__l.__size_)
  {
    v6 = (unint64_t *)(__p.__r_.__value_.__l.__size_ + 8);
    do
      v7 = __ldaxr(v6);
    while (__stlxr(v7 - 1, v6));
    if (!v7)
    {
      (*(void (**)(std::string::size_type))(*(_QWORD *)__p.__r_.__value_.__l.__size_ + 16))(__p.__r_.__value_.__l.__size_);
      std::__shared_weak_count::__release_weak((std::__shared_weak_count *)__p.__r_.__value_.__l.__size_);
    }
  }
  v8 = v20;
  if (v20 != (__int128 *)v21)
  {
    do
    {
      std::pair<std::string const,std::shared_ptr<siri::dialogengine::JSONValue>>::pair[abi:ne180100](&__p, v8 + 2);
      if ((__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
        p_p = &__p;
      else
        p_p = (std::string *)__p.__r_.__value_.__r.__words[0];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", p_p);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "addObject:", v10);

      v11 = v19;
      if (v19)
      {
        p_shared_owners = (unint64_t *)&v19->__shared_owners_;
        do
          v13 = __ldaxr(p_shared_owners);
        while (__stlxr(v13 - 1, p_shared_owners));
        if (!v13)
        {
          ((void (*)(std::__shared_weak_count *))v11->__on_zero_shared)(v11);
          std::__shared_weak_count::__release_weak(v11);
        }
      }
      if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
        operator delete(__p.__r_.__value_.__l.__data_);
      v14 = (__int128 *)*((_QWORD *)v8 + 1);
      if (v14)
      {
        do
        {
          v15 = v14;
          v14 = *(__int128 **)v14;
        }
        while (v14);
      }
      else
      {
        do
        {
          v15 = (__int128 *)*((_QWORD *)v8 + 2);
          v16 = *(_QWORD *)v15 == (_QWORD)v8;
          v8 = v15;
        }
        while (!v16);
      }
      v8 = v15;
    }
    while (v15 != (__int128 *)v21);
  }
  std::__tree<std::__value_type<std::string,std::shared_ptr<siri::dialogengine::JSONValue>>,std::__map_value_compare<std::string,std::__value_type<std::string,std::shared_ptr<siri::dialogengine::JSONValue>>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,std::shared_ptr<siri::dialogengine::JSONValue>>>>::destroy(v21[0]);
  return v3;
}

- (id)requiredParameter:(id)a3
{
  id v4;
  uint64_t *p_shared_owners;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  std::__shared_weak_count *v9;
  unint64_t *v10;
  unint64_t v11;
  DEParameter *v12;
  std::__shared_weak_count *v13;
  unint64_t *v14;
  unint64_t v15;
  std::__shared_weak_count *v16;
  unint64_t *v17;
  unint64_t v18;
  void *__p;
  std::__shared_weak_count *v21;
  char v22;
  uint64_t v23;
  std::__shared_weak_count *v24;
  uint64_t v25;
  std::__shared_weak_count *v26;

  v4 = a3;
  -[DEPatternSchema This](self, "This");
  if (v21)
  {
    p_shared_owners = &v21->__shared_owners_;
    do
      v6 = __ldaxr((unint64_t *)p_shared_owners);
    while (__stlxr(v6 - 1, (unint64_t *)p_shared_owners));
    if (!v6)
    {
      ((void (*)(std::__shared_weak_count *))v21->__on_zero_shared)(v21);
      std::__shared_weak_count::__release_weak(v21);
      if (__p)
        goto LABEL_6;
LABEL_12:
      v12 = 0;
      goto LABEL_29;
    }
  }
  if (!__p)
    goto LABEL_12;
LABEL_6:
  -[DEPatternSchema This](self, "This");
  v7 = v23;
  std::string::basic_string[abi:ne180100]<0>(&__p, (char *)objc_msgSend(objc_retainAutorelease(v4), "UTF8String"));
  v8 = std::__tree<std::string>::find<std::string>(v7 + 144, (const void **)&__p);
  if (v7 + 152 == v8)
  {
    v25 = 0;
    v26 = 0;
  }
  else
  {
    v9 = *(std::__shared_weak_count **)(v8 + 64);
    v25 = *(_QWORD *)(v8 + 56);
    v26 = v9;
    if (v9)
    {
      v10 = (unint64_t *)&v9->__shared_owners_;
      do
        v11 = __ldxr(v10);
      while (__stxr(v11 + 1, v10));
    }
  }
  if (v22 < 0)
    operator delete(__p);
  v13 = v24;
  if (v24)
  {
    v14 = (unint64_t *)&v24->__shared_owners_;
    do
      v15 = __ldaxr(v14);
    while (__stlxr(v15 - 1, v14));
    if (!v15)
    {
      ((void (*)(std::__shared_weak_count *))v13->__on_zero_shared)(v13);
      std::__shared_weak_count::__release_weak(v13);
    }
  }
  if (v25)
    v12 = -[DEParameter initWithSharedPtr:]([DEParameter alloc], "initWithSharedPtr:", &v25);
  else
    v12 = 0;
  v16 = v26;
  if (v26)
  {
    v17 = (unint64_t *)&v26->__shared_owners_;
    do
      v18 = __ldaxr(v17);
    while (__stlxr(v18 - 1, v17));
    if (!v18)
    {
      ((void (*)(std::__shared_weak_count *))v16->__on_zero_shared)(v16);
      std::__shared_weak_count::__release_weak(v16);
    }
  }
LABEL_29:

  return v12;
}

- (id)computedParameterNames
{
  void *v3;
  unint64_t *v4;
  unint64_t v5;
  unint64_t *v6;
  unint64_t v7;
  __int128 *v8;
  std::string *p_p;
  void *v10;
  std::__shared_weak_count *v11;
  unint64_t *p_shared_owners;
  unint64_t v13;
  __int128 *v14;
  __int128 *v15;
  BOOL v16;
  std::string __p;
  std::__shared_weak_count *v19;
  __int128 *v20;
  _QWORD *v21[2];

  v3 = (void *)objc_opt_new();
  -[DEPatternSchema This](self, "This");
  if (!__p.__r_.__value_.__l.__size_)
    goto LABEL_5;
  v4 = (unint64_t *)(__p.__r_.__value_.__l.__size_ + 8);
  do
    v5 = __ldaxr(v4);
  while (__stlxr(v5 - 1, v4));
  if (!v5)
  {
    (*(void (**)(std::string::size_type))(*(_QWORD *)__p.__r_.__value_.__l.__size_ + 16))(__p.__r_.__value_.__l.__size_);
    std::__shared_weak_count::__release_weak((std::__shared_weak_count *)__p.__r_.__value_.__l.__size_);
    if (!__p.__r_.__value_.__r.__words[0])
      return v3;
  }
  else
  {
LABEL_5:
    if (!__p.__r_.__value_.__r.__words[0])
      return v3;
  }
  -[DEPatternSchema This](self, "This");
  std::map<std::string,std::shared_ptr<siri::dialogengine::Parameter>>::map[abi:ne180100]((uint64_t)&v20, (const void ***)(__p.__r_.__value_.__r.__words[0] + 168));
  if (__p.__r_.__value_.__l.__size_)
  {
    v6 = (unint64_t *)(__p.__r_.__value_.__l.__size_ + 8);
    do
      v7 = __ldaxr(v6);
    while (__stlxr(v7 - 1, v6));
    if (!v7)
    {
      (*(void (**)(std::string::size_type))(*(_QWORD *)__p.__r_.__value_.__l.__size_ + 16))(__p.__r_.__value_.__l.__size_);
      std::__shared_weak_count::__release_weak((std::__shared_weak_count *)__p.__r_.__value_.__l.__size_);
    }
  }
  v8 = v20;
  if (v20 != (__int128 *)v21)
  {
    do
    {
      std::pair<std::string const,std::shared_ptr<siri::dialogengine::JSONValue>>::pair[abi:ne180100](&__p, v8 + 2);
      if ((__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
        p_p = &__p;
      else
        p_p = (std::string *)__p.__r_.__value_.__r.__words[0];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", p_p);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "addObject:", v10);

      v11 = v19;
      if (v19)
      {
        p_shared_owners = (unint64_t *)&v19->__shared_owners_;
        do
          v13 = __ldaxr(p_shared_owners);
        while (__stlxr(v13 - 1, p_shared_owners));
        if (!v13)
        {
          ((void (*)(std::__shared_weak_count *))v11->__on_zero_shared)(v11);
          std::__shared_weak_count::__release_weak(v11);
        }
      }
      if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
        operator delete(__p.__r_.__value_.__l.__data_);
      v14 = (__int128 *)*((_QWORD *)v8 + 1);
      if (v14)
      {
        do
        {
          v15 = v14;
          v14 = *(__int128 **)v14;
        }
        while (v14);
      }
      else
      {
        do
        {
          v15 = (__int128 *)*((_QWORD *)v8 + 2);
          v16 = *(_QWORD *)v15 == (_QWORD)v8;
          v8 = v15;
        }
        while (!v16);
      }
      v8 = v15;
    }
    while (v15 != (__int128 *)v21);
  }
  std::__tree<std::__value_type<std::string,std::shared_ptr<siri::dialogengine::JSONValue>>,std::__map_value_compare<std::string,std::__value_type<std::string,std::shared_ptr<siri::dialogengine::JSONValue>>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,std::shared_ptr<siri::dialogengine::JSONValue>>>>::destroy(v21[0]);
  return v3;
}

- (id)computedParameter:(id)a3
{
  id v4;
  uint64_t *p_shared_owners;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  std::__shared_weak_count *v9;
  unint64_t *v10;
  unint64_t v11;
  DEParameter *v12;
  std::__shared_weak_count *v13;
  unint64_t *v14;
  unint64_t v15;
  std::__shared_weak_count *v16;
  unint64_t *v17;
  unint64_t v18;
  void *__p;
  std::__shared_weak_count *v21;
  char v22;
  uint64_t v23;
  std::__shared_weak_count *v24;
  uint64_t v25;
  std::__shared_weak_count *v26;

  v4 = a3;
  -[DEPatternSchema This](self, "This");
  if (v21)
  {
    p_shared_owners = &v21->__shared_owners_;
    do
      v6 = __ldaxr((unint64_t *)p_shared_owners);
    while (__stlxr(v6 - 1, (unint64_t *)p_shared_owners));
    if (!v6)
    {
      ((void (*)(std::__shared_weak_count *))v21->__on_zero_shared)(v21);
      std::__shared_weak_count::__release_weak(v21);
      if (__p)
        goto LABEL_6;
LABEL_12:
      v12 = 0;
      goto LABEL_29;
    }
  }
  if (!__p)
    goto LABEL_12;
LABEL_6:
  -[DEPatternSchema This](self, "This");
  v7 = v23;
  std::string::basic_string[abi:ne180100]<0>(&__p, (char *)objc_msgSend(objc_retainAutorelease(v4), "UTF8String"));
  v8 = std::__tree<std::string>::find<std::string>(v7 + 168, (const void **)&__p);
  if (v7 + 176 == v8)
  {
    v25 = 0;
    v26 = 0;
  }
  else
  {
    v9 = *(std::__shared_weak_count **)(v8 + 64);
    v25 = *(_QWORD *)(v8 + 56);
    v26 = v9;
    if (v9)
    {
      v10 = (unint64_t *)&v9->__shared_owners_;
      do
        v11 = __ldxr(v10);
      while (__stxr(v11 + 1, v10));
    }
  }
  if (v22 < 0)
    operator delete(__p);
  v13 = v24;
  if (v24)
  {
    v14 = (unint64_t *)&v24->__shared_owners_;
    do
      v15 = __ldaxr(v14);
    while (__stlxr(v15 - 1, v14));
    if (!v15)
    {
      ((void (*)(std::__shared_weak_count *))v13->__on_zero_shared)(v13);
      std::__shared_weak_count::__release_weak(v13);
    }
  }
  if (v25)
    v12 = -[DEParameter initWithSharedPtr:]([DEParameter alloc], "initWithSharedPtr:", &v25);
  else
    v12 = 0;
  v16 = v26;
  if (v26)
  {
    v17 = (unint64_t *)&v26->__shared_owners_;
    do
      v18 = __ldaxr(v17);
    while (__stlxr(v18 - 1, v17));
    if (!v18)
    {
      ((void (*)(std::__shared_weak_count *))v16->__on_zero_shared)(v16);
      std::__shared_weak_count::__release_weak(v16);
    }
  }
LABEL_29:

  return v12;
}

- (id)settingNames
{
  void *v3;
  unint64_t *v4;
  unint64_t v5;
  unint64_t *v6;
  unint64_t v7;
  __int128 *v8;
  std::string *p_p;
  void *v10;
  std::__shared_weak_count *v11;
  unint64_t *p_shared_owners;
  unint64_t v13;
  __int128 *v14;
  __int128 *v15;
  BOOL v16;
  std::string __p;
  std::__shared_weak_count *v19;
  __int128 *v20;
  _QWORD *v21[2];

  v3 = (void *)objc_opt_new();
  -[DEPatternSchema This](self, "This");
  if (!__p.__r_.__value_.__l.__size_)
    goto LABEL_5;
  v4 = (unint64_t *)(__p.__r_.__value_.__l.__size_ + 8);
  do
    v5 = __ldaxr(v4);
  while (__stlxr(v5 - 1, v4));
  if (!v5)
  {
    (*(void (**)(std::string::size_type))(*(_QWORD *)__p.__r_.__value_.__l.__size_ + 16))(__p.__r_.__value_.__l.__size_);
    std::__shared_weak_count::__release_weak((std::__shared_weak_count *)__p.__r_.__value_.__l.__size_);
    if (!__p.__r_.__value_.__r.__words[0])
      return v3;
  }
  else
  {
LABEL_5:
    if (!__p.__r_.__value_.__r.__words[0])
      return v3;
  }
  -[DEPatternSchema This](self, "This");
  siri::dialogengine::PatternSchema::GetSettings((siri::dialogengine::PatternSchema *)__p.__r_.__value_.__l.__data_, (uint64_t)&v20);
  if (__p.__r_.__value_.__l.__size_)
  {
    v6 = (unint64_t *)(__p.__r_.__value_.__l.__size_ + 8);
    do
      v7 = __ldaxr(v6);
    while (__stlxr(v7 - 1, v6));
    if (!v7)
    {
      (*(void (**)(std::string::size_type))(*(_QWORD *)__p.__r_.__value_.__l.__size_ + 16))(__p.__r_.__value_.__l.__size_);
      std::__shared_weak_count::__release_weak((std::__shared_weak_count *)__p.__r_.__value_.__l.__size_);
    }
  }
  v8 = v20;
  if (v20 != (__int128 *)v21)
  {
    do
    {
      std::pair<std::string const,std::shared_ptr<siri::dialogengine::JSONValue>>::pair[abi:ne180100](&__p, v8 + 2);
      if ((__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
        p_p = &__p;
      else
        p_p = (std::string *)__p.__r_.__value_.__r.__words[0];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", p_p);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "addObject:", v10);

      v11 = v19;
      if (v19)
      {
        p_shared_owners = (unint64_t *)&v19->__shared_owners_;
        do
          v13 = __ldaxr(p_shared_owners);
        while (__stlxr(v13 - 1, p_shared_owners));
        if (!v13)
        {
          ((void (*)(std::__shared_weak_count *))v11->__on_zero_shared)(v11);
          std::__shared_weak_count::__release_weak(v11);
        }
      }
      if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
        operator delete(__p.__r_.__value_.__l.__data_);
      v14 = (__int128 *)*((_QWORD *)v8 + 1);
      if (v14)
      {
        do
        {
          v15 = v14;
          v14 = *(__int128 **)v14;
        }
        while (v14);
      }
      else
      {
        do
        {
          v15 = (__int128 *)*((_QWORD *)v8 + 2);
          v16 = *(_QWORD *)v15 == (_QWORD)v8;
          v8 = v15;
        }
        while (!v16);
      }
      v8 = v15;
    }
    while (v15 != (__int128 *)v21);
  }
  std::__tree<std::__value_type<std::string,std::shared_ptr<siri::dialogengine::JSONValue>>,std::__map_value_compare<std::string,std::__value_type<std::string,std::shared_ptr<siri::dialogengine::JSONValue>>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,std::shared_ptr<siri::dialogengine::JSONValue>>>>::destroy(v21[0]);
  return v3;
}

- (id)setting:(id)a3
{
  id v4;
  uint64_t *p_shared_owners;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  std::__shared_weak_count *v9;
  unint64_t *v10;
  unint64_t v11;
  DEPatternSetting *v12;
  std::__shared_weak_count *v13;
  unint64_t *v14;
  unint64_t v15;
  std::__shared_weak_count *v16;
  unint64_t *v17;
  unint64_t v18;
  void *__p;
  std::__shared_weak_count *v21;
  char v22;
  uint64_t v23;
  std::__shared_weak_count *v24;
  uint64_t v25;
  std::__shared_weak_count *v26;

  v4 = a3;
  -[DEPatternSchema This](self, "This");
  if (v21)
  {
    p_shared_owners = &v21->__shared_owners_;
    do
      v6 = __ldaxr((unint64_t *)p_shared_owners);
    while (__stlxr(v6 - 1, (unint64_t *)p_shared_owners));
    if (!v6)
    {
      ((void (*)(std::__shared_weak_count *))v21->__on_zero_shared)(v21);
      std::__shared_weak_count::__release_weak(v21);
      if (__p)
        goto LABEL_6;
LABEL_12:
      v12 = 0;
      goto LABEL_29;
    }
  }
  if (!__p)
    goto LABEL_12;
LABEL_6:
  -[DEPatternSchema This](self, "This");
  v7 = v23;
  std::string::basic_string[abi:ne180100]<0>(&__p, (char *)objc_msgSend(objc_retainAutorelease(v4), "UTF8String"));
  v8 = std::__tree<std::string>::find<std::string>(v7 + 120, (const void **)&__p);
  if (v7 + 128 == v8)
  {
    v25 = 0;
    v26 = 0;
  }
  else
  {
    v9 = *(std::__shared_weak_count **)(v8 + 64);
    v25 = *(_QWORD *)(v8 + 56);
    v26 = v9;
    if (v9)
    {
      v10 = (unint64_t *)&v9->__shared_owners_;
      do
        v11 = __ldxr(v10);
      while (__stxr(v11 + 1, v10));
    }
  }
  if (v22 < 0)
    operator delete(__p);
  v13 = v24;
  if (v24)
  {
    v14 = (unint64_t *)&v24->__shared_owners_;
    do
      v15 = __ldaxr(v14);
    while (__stlxr(v15 - 1, v14));
    if (!v15)
    {
      ((void (*)(std::__shared_weak_count *))v13->__on_zero_shared)(v13);
      std::__shared_weak_count::__release_weak(v13);
    }
  }
  if (v25)
    v12 = -[DEPatternSetting initWithSharedPtr:]([DEPatternSetting alloc], "initWithSharedPtr:", &v25);
  else
    v12 = 0;
  v16 = v26;
  if (v26)
  {
    v17 = (unint64_t *)&v26->__shared_owners_;
    do
      v18 = __ldaxr(v17);
    while (__stlxr(v18 - 1, v17));
    if (!v18)
    {
      ((void (*)(std::__shared_weak_count *))v16->__on_zero_shared)(v16);
      std::__shared_weak_count::__release_weak(v16);
    }
  }
LABEL_29:

  return v12;
}

- (shared_ptr<siri::dialogengine::PatternSchema>)This
{
  void *v2;
  PatternSchema *v3;
  __shared_weak_count *v4;
  shared_ptr<siri::dialogengine::PatternSchema> result;

  objc_copyCppObjectAtomic(v2, &self->_This, (void (__cdecl *)(void *, const void *))__copy_helper_atomic_property__48851);
  result.__cntrl_ = v4;
  result.__ptr_ = v3;
  return result;
}

- (void)setThis:(shared_ptr<siri::dialogengine::PatternSchema>)a3
{
  objc_copyCppObjectAtomic(&self->_This, a3.__ptr_, (void (__cdecl *)(void *, const void *))__assign_helper_atomic_property__48850);
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
  uint64_t *v6;
  id v7;
  DEPatternSchema *v8;
  unint64_t *p_shared_owners;
  unint64_t v10;
  DEPatternSchema *v11;
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
  v6 = (uint64_t *)objc_msgSend(a3, "This");
  v7 = objc_retainAutorelease(v5);
  std::string::basic_string[abi:ne180100]<0>(__p, (char *)objc_msgSend(v7, "UTF8String"));
  siri::dialogengine::PatternRegistry::GetSchema(v6, (const std::string::value_type **)__p, &v21);
  if (v21)
  {
    v8 = [DEPatternSchema alloc];
    v19 = v21;
    v20 = v22;
    if (v22)
    {
      p_shared_owners = (unint64_t *)&v22->__shared_owners_;
      do
        v10 = __ldxr(p_shared_owners);
      while (__stxr(v10 + 1, p_shared_owners));
    }
    v11 = -[DEPatternSchema initWithPtr:](v8, "initWithPtr:", &v19);
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
