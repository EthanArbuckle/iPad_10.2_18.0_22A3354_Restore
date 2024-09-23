@implementation DEFile

- (DEFile)init
{
  DEFile *v2;
  std::__shared_weak_count_vtbl *v3;
  std::__shared_weak_count *v4;
  std::__shared_weak_count *v5;
  unint64_t *p_shared_owners;
  unint64_t v7;
  std::__shared_weak_count_vtbl *v9;
  std::__shared_weak_count *v10;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)DEFile;
  v2 = -[DEFile init](&v11, sel_init);
  if (v2)
  {
    v3 = (std::__shared_weak_count_vtbl *)operator new();
    bzero(v3, 0x2F0uLL);
    siri::dialogengine::File::File((siri::dialogengine::File *)v3);
    v9 = v3;
    v4 = (std::__shared_weak_count *)operator new();
    v4->__vftable = (std::__shared_weak_count_vtbl *)&off_1E793A3D8;
    v4->__shared_owners_ = 0;
    v4->__shared_weak_owners_ = 0;
    v4[1].__vftable = v3;
    v10 = v4;
    -[DEFile setThis:](v2, "setThis:", &v9);
    v5 = v10;
    if (v10)
    {
      p_shared_owners = (unint64_t *)&v10->__shared_owners_;
      do
        v7 = __ldaxr(p_shared_owners);
      while (__stlxr(v7 - 1, p_shared_owners));
      if (!v7)
      {
        ((void (*)(std::__shared_weak_count *))v5->__on_zero_shared)(v5);
        std::__shared_weak_count::__release_weak(v5);
      }
    }
  }
  return v2;
}

- (DEFile)initWithSharedPtr:(shared_ptr<siri::dialogengine::File>)a3
{
  File *ptr;
  DEFile *v4;
  DEFile *v5;
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
  v15.super_class = (Class)DEFile;
  v4 = -[DEFile init](&v15, sel_init, a3.__ptr_, a3.__cntrl_);
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
    -[DEFile setThis:](v4, "setThis:", &v13);
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

- (id)getRoot
{
  std::__shared_weak_count *v2;
  unint64_t *p_shared_owners;
  unint64_t v4;
  uint64_t *v5;
  unint64_t v6;
  DEGroup *v7;
  unint64_t *v8;
  unint64_t v9;
  DEGroup *v10;
  std::__shared_weak_count *v11;
  unint64_t *v12;
  unint64_t v13;
  std::__shared_weak_count *v14;
  unint64_t *v15;
  unint64_t v16;
  uint64_t v18;
  std::__shared_weak_count *v19;
  uint64_t v20;
  std::__shared_weak_count *v21;
  uint64_t v22;
  std::__shared_weak_count *v23;

  -[DEFile This](self, "This");
  v2 = *(std::__shared_weak_count **)(v20 + 232);
  v22 = *(_QWORD *)(v20 + 224);
  v23 = v2;
  if (v2)
  {
    p_shared_owners = (unint64_t *)&v2->__shared_owners_;
    do
      v4 = __ldxr(p_shared_owners);
    while (__stxr(v4 + 1, p_shared_owners));
  }
  if (v21)
  {
    v5 = &v21->__shared_owners_;
    do
      v6 = __ldaxr((unint64_t *)v5);
    while (__stlxr(v6 - 1, (unint64_t *)v5));
    if (!v6)
    {
      ((void (*)(std::__shared_weak_count *))v21->__on_zero_shared)(v21);
      std::__shared_weak_count::__release_weak(v21);
    }
  }
  v7 = [DEGroup alloc];
  v18 = v22;
  v19 = v23;
  if (v23)
  {
    v8 = (unint64_t *)&v23->__shared_owners_;
    do
      v9 = __ldxr(v8);
    while (__stxr(v9 + 1, v8));
  }
  v10 = -[DEGroup initWithSharedPtr:](v7, "initWithSharedPtr:", &v18);
  v11 = v19;
  if (v19)
  {
    v12 = (unint64_t *)&v19->__shared_owners_;
    do
      v13 = __ldaxr(v12);
    while (__stlxr(v13 - 1, v12));
    if (!v13)
    {
      ((void (*)(std::__shared_weak_count *))v11->__on_zero_shared)(v11);
      std::__shared_weak_count::__release_weak(v11);
    }
  }
  v14 = v23;
  if (v23)
  {
    v15 = (unint64_t *)&v23->__shared_owners_;
    do
      v16 = __ldaxr(v15);
    while (__stlxr(v16 - 1, v15));
    if (!v16)
    {
      ((void (*)(std::__shared_weak_count *))v14->__on_zero_shared)(v14);
      std::__shared_weak_count::__release_weak(v14);
    }
  }
  return v10;
}

- (id)getFormatVersion
{
  void *v2;
  std::string *v3;
  void *v4;
  unint64_t *p_shared_owners;
  unint64_t v6;
  uint64_t v8;
  std::__shared_weak_count *v9;
  std::string v10;

  v2 = (void *)MEMORY[0x1E0CB3940];
  -[DEFile This](self, "This");
  if (*(char *)(v8 + 175) < 0)
    std::string::__init_copy_ctor_external(&v10, *(const std::string::value_type **)(v8 + 152), *(_QWORD *)(v8 + 160));
  else
    v10 = *(std::string *)(v8 + 152);
  if ((v10.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
    v3 = &v10;
  else
    v3 = (std::string *)v10.__r_.__value_.__r.__words[0];
  objc_msgSend(v2, "stringWithUTF8String:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (SHIBYTE(v10.__r_.__value_.__r.__words[2]) < 0)
    operator delete(v10.__r_.__value_.__l.__data_);
  if (v9)
  {
    p_shared_owners = (unint64_t *)&v9->__shared_owners_;
    do
      v6 = __ldaxr(p_shared_owners);
    while (__stlxr(v6 - 1, p_shared_owners));
    if (!v6)
    {
      ((void (*)())v9->__on_zero_shared)();
      std::__shared_weak_count::__release_weak(v9);
    }
  }
  return v4;
}

- (NSString)paramsFilename
{
  void *v2;
  std::string *v3;
  void *v4;
  unint64_t *p_shared_owners;
  unint64_t v6;
  uint64_t v8;
  std::__shared_weak_count *v9;
  std::string v10;

  v2 = (void *)MEMORY[0x1E0CB3940];
  -[DEFile This](self, "This");
  if (*(char *)(v8 + 55) < 0)
    std::string::__init_copy_ctor_external(&v10, *(const std::string::value_type **)(v8 + 32), *(_QWORD *)(v8 + 40));
  else
    v10 = *(std::string *)(v8 + 32);
  if ((v10.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
    v3 = &v10;
  else
    v3 = (std::string *)v10.__r_.__value_.__r.__words[0];
  objc_msgSend(v2, "stringWithUTF8String:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (SHIBYTE(v10.__r_.__value_.__r.__words[2]) < 0)
    operator delete(v10.__r_.__value_.__l.__data_);
  if (v9)
  {
    p_shared_owners = (unint64_t *)&v9->__shared_owners_;
    do
      v6 = __ldaxr(p_shared_owners);
    while (__stlxr(v6 - 1, p_shared_owners));
    if (!v6)
    {
      ((void (*)())v9->__on_zero_shared)();
      std::__shared_weak_count::__release_weak(v9);
    }
  }
  return (NSString *)v4;
}

- (void)setParamsFilename:(id)a3
{
  id v4;
  uint64_t v5;
  id v6;
  std::__shared_weak_count *v7;
  unint64_t *p_shared_owners;
  unint64_t v9;
  std::string __str;
  uint64_t v11;
  std::__shared_weak_count *v12;

  v4 = a3;
  -[DEFile This](self, "This");
  v5 = v11;
  v6 = objc_retainAutorelease(v4);
  std::string::basic_string[abi:ne180100]<0>(&__str, (char *)objc_msgSend(v6, "UTF8String"));
  std::string::operator=((std::string *)(v5 + 32), &__str);
  if (SHIBYTE(__str.__r_.__value_.__r.__words[2]) < 0)
    operator delete(__str.__r_.__value_.__l.__data_);
  v7 = v12;
  if (v12)
  {
    p_shared_owners = (unint64_t *)&v12->__shared_owners_;
    do
      v9 = __ldaxr(p_shared_owners);
    while (__stlxr(v9 - 1, p_shared_owners));
    if (!v9)
    {
      ((void (*)(std::__shared_weak_count *))v7->__on_zero_shared)(v7);
      std::__shared_weak_count::__release_weak(v7);
    }
  }

}

- (NSString)id
{
  void *v2;
  std::string *v3;
  void *v4;
  unint64_t *p_shared_owners;
  unint64_t v6;
  uint64_t v8;
  std::__shared_weak_count *v9;
  std::string v10;

  v2 = (void *)MEMORY[0x1E0CB3940];
  -[DEFile This](self, "This");
  if (*(char *)(v8 + 127) < 0)
    std::string::__init_copy_ctor_external(&v10, *(const std::string::value_type **)(v8 + 104), *(_QWORD *)(v8 + 112));
  else
    v10 = *(std::string *)(v8 + 104);
  if ((v10.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
    v3 = &v10;
  else
    v3 = (std::string *)v10.__r_.__value_.__r.__words[0];
  objc_msgSend(v2, "stringWithUTF8String:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (SHIBYTE(v10.__r_.__value_.__r.__words[2]) < 0)
    operator delete(v10.__r_.__value_.__l.__data_);
  if (v9)
  {
    p_shared_owners = (unint64_t *)&v9->__shared_owners_;
    do
      v6 = __ldaxr(p_shared_owners);
    while (__stlxr(v6 - 1, p_shared_owners));
    if (!v6)
    {
      ((void (*)())v9->__on_zero_shared)();
      std::__shared_weak_count::__release_weak(v9);
    }
  }
  return (NSString *)v4;
}

- (void)setId:(id)a3
{
  id v4;
  uint64_t v5;
  id v6;
  std::__shared_weak_count *v7;
  unint64_t *p_shared_owners;
  unint64_t v9;
  std::string __str;
  uint64_t v11;
  std::__shared_weak_count *v12;

  v4 = a3;
  -[DEFile This](self, "This");
  v5 = v11;
  v6 = objc_retainAutorelease(v4);
  std::string::basic_string[abi:ne180100]<0>(&__str, (char *)objc_msgSend(v6, "UTF8String"));
  std::string::operator=((std::string *)(v5 + 104), &__str);
  if (SHIBYTE(__str.__r_.__value_.__r.__words[2]) < 0)
    operator delete(__str.__r_.__value_.__l.__data_);
  v7 = v12;
  if (v12)
  {
    p_shared_owners = (unint64_t *)&v12->__shared_owners_;
    do
      v9 = __ldaxr(p_shared_owners);
    while (__stlxr(v9 - 1, p_shared_owners));
    if (!v9)
    {
      ((void (*)(std::__shared_weak_count *))v7->__on_zero_shared)(v7);
      std::__shared_weak_count::__release_weak(v7);
    }
  }

}

- (NSString)localeFilename
{
  void *v2;
  std::string *v3;
  void *v4;
  unint64_t *p_shared_owners;
  unint64_t v6;
  uint64_t v8;
  std::__shared_weak_count *v9;
  std::string v10;

  v2 = (void *)MEMORY[0x1E0CB3940];
  -[DEFile This](self, "This");
  if (*(char *)(v8 + 79) < 0)
    std::string::__init_copy_ctor_external(&v10, *(const std::string::value_type **)(v8 + 56), *(_QWORD *)(v8 + 64));
  else
    v10 = *(std::string *)(v8 + 56);
  if ((v10.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
    v3 = &v10;
  else
    v3 = (std::string *)v10.__r_.__value_.__r.__words[0];
  objc_msgSend(v2, "stringWithUTF8String:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (SHIBYTE(v10.__r_.__value_.__r.__words[2]) < 0)
    operator delete(v10.__r_.__value_.__l.__data_);
  if (v9)
  {
    p_shared_owners = (unint64_t *)&v9->__shared_owners_;
    do
      v6 = __ldaxr(p_shared_owners);
    while (__stlxr(v6 - 1, p_shared_owners));
    if (!v6)
    {
      ((void (*)())v9->__on_zero_shared)();
      std::__shared_weak_count::__release_weak(v9);
    }
  }
  return (NSString *)v4;
}

- (void)setLocaleFilename:(id)a3
{
  id v4;
  uint64_t v5;
  id v6;
  std::__shared_weak_count *v7;
  unint64_t *p_shared_owners;
  unint64_t v9;
  std::string __str;
  uint64_t v11;
  std::__shared_weak_count *v12;

  v4 = a3;
  -[DEFile This](self, "This");
  v5 = v11;
  v6 = objc_retainAutorelease(v4);
  std::string::basic_string[abi:ne180100]<0>(&__str, (char *)objc_msgSend(v6, "UTF8String"));
  std::string::operator=((std::string *)(v5 + 56), &__str);
  if (SHIBYTE(__str.__r_.__value_.__r.__words[2]) < 0)
    operator delete(__str.__r_.__value_.__l.__data_);
  v7 = v12;
  if (v12)
  {
    p_shared_owners = (unint64_t *)&v12->__shared_owners_;
    do
      v9 = __ldaxr(p_shared_owners);
    while (__stlxr(v9 - 1, p_shared_owners));
    if (!v9)
    {
      ((void (*)(std::__shared_weak_count *))v7->__on_zero_shared)(v7);
      std::__shared_weak_count::__release_weak(v7);
    }
  }

}

- (id)getParameters
{
  void *v3;
  std::__shared_weak_count *v4;
  unint64_t *p_shared_owners;
  unint64_t v6;
  uint64_t v7;
  unint64_t v8;
  std::__shared_weak_count *v9;
  DEParameter *v10;
  std::__shared_weak_count *v11;
  unint64_t *v12;
  unint64_t v13;
  void **v15;
  std::__shared_weak_count *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[DEFile This](self, "This");
  v18 = 0;
  v19 = 0;
  v17 = 0;
  std::vector<siri::dialogengine::Parameter>::__init_with_size[abi:ne180100]<siri::dialogengine::Parameter*,siri::dialogengine::Parameter*>(&v17, (uint64_t)v15[22], (uint64_t)v15[23], 0xCF3CF3CF3CF3CF3DLL * (((_BYTE *)v15[23] - (_BYTE *)v15[22]) >> 4));
  v4 = v16;
  if (v16)
  {
    p_shared_owners = (unint64_t *)&v16->__shared_owners_;
    do
      v6 = __ldaxr(p_shared_owners);
    while (__stlxr(v6 - 1, p_shared_owners));
    if (!v6)
    {
      ((void (*)(std::__shared_weak_count *))v4->__on_zero_shared)(v4);
      std::__shared_weak_count::__release_weak(v4);
    }
  }
  v7 = v17;
  if (v18 != v17)
  {
    v8 = 0;
    do
    {
      v9 = (std::__shared_weak_count *)operator new(0x168uLL);
      v9->__shared_weak_owners_ = 0;
      v9->__vftable = (std::__shared_weak_count_vtbl *)&off_1E79345A0;
      v9->__shared_owners_ = 0;
      v15 = (void **)siri::dialogengine::Parameter::Parameter((siri::dialogengine::Parameter *)&v9[1], (const siri::dialogengine::Parameter *)(v7 + 336 * v8));
      v16 = v9;
      v10 = -[DEParameter initWithSharedPtr:]([DEParameter alloc], "initWithSharedPtr:", &v15);
      objc_msgSend(v3, "addObject:", v10);

      v11 = v16;
      if (v16)
      {
        v12 = (unint64_t *)&v16->__shared_owners_;
        do
          v13 = __ldaxr(v12);
        while (__stlxr(v13 - 1, v12));
        if (!v13)
        {
          ((void (*)(std::__shared_weak_count *))v11->__on_zero_shared)(v11);
          std::__shared_weak_count::__release_weak(v11);
        }
      }
      ++v8;
      v7 = v17;
    }
    while (v8 < 0xCF3CF3CF3CF3CF3DLL * ((v18 - v17) >> 4));
  }
  v15 = (void **)&v17;
  std::vector<siri::dialogengine::Parameter>::__destroy_vector::operator()[abi:ne180100](&v15);
  return v3;
}

- (id)getDialogs
{
  std::__shared_weak_count *v2;
  unint64_t *p_shared_owners;
  unint64_t v4;
  void *v5;
  uint64_t v6;
  uint64_t i;
  std::__shared_weak_count *v8;
  siri::dialogengine::File *v9;
  unint64_t *v10;
  unint64_t v11;
  DEDialog *v12;
  unint64_t *v13;
  unint64_t v14;
  DEDialog *v15;
  std::__shared_weak_count *v16;
  unint64_t *v17;
  unint64_t v18;
  std::__shared_weak_count *v19;
  unint64_t *v20;
  unint64_t v21;
  siri::dialogengine::File *v23;
  std::__shared_weak_count *v24;
  siri::dialogengine::File *v25;
  std::__shared_weak_count *v26;
  uint64_t v27;
  uint64_t v28;

  -[DEFile This](self, "This");
  siri::dialogengine::File::GetDialogs(v25, (uint64_t)&v27);
  v2 = v26;
  if (v26)
  {
    p_shared_owners = (unint64_t *)&v26->__shared_owners_;
    do
      v4 = __ldaxr(p_shared_owners);
    while (__stlxr(v4 - 1, p_shared_owners));
    if (!v4)
    {
      ((void (*)(std::__shared_weak_count *))v2->__on_zero_shared)(v2);
      std::__shared_weak_count::__release_weak(v2);
    }
  }
  v5 = (void *)objc_opt_new();
  v6 = v27;
  for (i = v28; v6 != i; v6 += 16)
  {
    v9 = *(siri::dialogengine::File **)v6;
    v8 = *(std::__shared_weak_count **)(v6 + 8);
    v25 = *(siri::dialogengine::File **)v6;
    v26 = v8;
    if (v8)
    {
      v10 = (unint64_t *)&v8->__shared_owners_;
      do
        v11 = __ldxr(v10);
      while (__stxr(v11 + 1, v10));
    }
    v12 = [DEDialog alloc];
    v23 = v9;
    v24 = v8;
    if (v8)
    {
      v13 = (unint64_t *)&v8->__shared_owners_;
      do
        v14 = __ldxr(v13);
      while (__stxr(v14 + 1, v13));
    }
    v15 = -[DEDialog initWithSharedPtr:](v12, "initWithSharedPtr:", &v23);
    v16 = v24;
    if (v24)
    {
      v17 = (unint64_t *)&v24->__shared_owners_;
      do
        v18 = __ldaxr(v17);
      while (__stlxr(v18 - 1, v17));
      if (!v18)
      {
        ((void (*)(std::__shared_weak_count *))v16->__on_zero_shared)(v16);
        std::__shared_weak_count::__release_weak(v16);
      }
    }
    objc_msgSend(v5, "addObject:", v15);

    v19 = v26;
    if (v26)
    {
      v20 = (unint64_t *)&v26->__shared_owners_;
      do
        v21 = __ldaxr(v20);
      while (__stlxr(v21 - 1, v20));
      if (!v21)
      {
        ((void (*)(std::__shared_weak_count *))v19->__on_zero_shared)(v19);
        std::__shared_weak_count::__release_weak(v19);
      }
    }
  }
  v25 = (siri::dialogengine::File *)&v27;
  std::vector<std::shared_ptr<siri::dialogengine::VisualComponentsCombination::Entry>>::__destroy_vector::operator()[abi:ne180100]((void ***)&v25);
  return v5;
}

- (id)getValidationErrors
{
  void *v3;
  std::__shared_weak_count *size;
  unint64_t *v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  void *v10;
  std::string *p_p;
  void *v12;
  std::string __p;
  uint64_t v15;
  uint64_t v16;

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[DEFile This](self, "This");
  std::vector<siri::dialogengine::ValidationEntry>::vector<std::__tree_const_iterator<siri::dialogengine::ValidationEntry,std::__tree_node<siri::dialogengine::ValidationEntry,void *> *,long>,0>(&v15, *(_QWORD **)(__p.__r_.__value_.__r.__words[0] + 568), (_QWORD *)(__p.__r_.__value_.__r.__words[0] + 576));
  size = (std::__shared_weak_count *)__p.__r_.__value_.__l.__size_;
  if (__p.__r_.__value_.__l.__size_)
  {
    v5 = (unint64_t *)(__p.__r_.__value_.__l.__size_ + 8);
    do
      v6 = __ldaxr(v5);
    while (__stlxr(v6 - 1, v5));
    if (!v6)
    {
      ((void (*)(std::__shared_weak_count *))size->__on_zero_shared)(size);
      std::__shared_weak_count::__release_weak(size);
    }
  }
  v7 = v15;
  if (v16 != v15)
  {
    v8 = 0;
    v9 = 0;
    do
    {
      v10 = (void *)MEMORY[0x1E0CB3940];
      siri::dialogengine::ValidationEntry::GetFormattedText((siri::dialogengine::ValidationEntry *)(v7 + v8), &__p);
      if ((__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
        p_p = &__p;
      else
        p_p = (std::string *)__p.__r_.__value_.__r.__words[0];
      objc_msgSend(v10, "stringWithUTF8String:", p_p);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
        operator delete(__p.__r_.__value_.__l.__data_);
      objc_msgSend(v3, "addObject:", v12);

      ++v9;
      v7 = v15;
      v8 += 88;
    }
    while (v9 < 0x2E8BA2E8BA2E8BA3 * ((v16 - v15) >> 3));
  }
  __p.__r_.__value_.__r.__words[0] = (std::string::size_type)&v15;
  std::vector<siri::dialogengine::ValidationEntry>::__destroy_vector::operator()[abi:ne180100]((void ***)&__p);
  return v3;
}

- (id)getValidationWarnings
{
  void *v3;
  std::__shared_weak_count *size;
  unint64_t *v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  void *v10;
  std::string *p_p;
  void *v12;
  std::string __p;
  uint64_t v15;
  uint64_t v16;

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[DEFile This](self, "This");
  std::vector<siri::dialogengine::ValidationEntry>::vector<std::__tree_const_iterator<siri::dialogengine::ValidationEntry,std::__tree_node<siri::dialogengine::ValidationEntry,void *> *,long>,0>(&v15, *(_QWORD **)(__p.__r_.__value_.__r.__words[0] + 592), (_QWORD *)(__p.__r_.__value_.__r.__words[0] + 600));
  size = (std::__shared_weak_count *)__p.__r_.__value_.__l.__size_;
  if (__p.__r_.__value_.__l.__size_)
  {
    v5 = (unint64_t *)(__p.__r_.__value_.__l.__size_ + 8);
    do
      v6 = __ldaxr(v5);
    while (__stlxr(v6 - 1, v5));
    if (!v6)
    {
      ((void (*)(std::__shared_weak_count *))size->__on_zero_shared)(size);
      std::__shared_weak_count::__release_weak(size);
    }
  }
  v7 = v15;
  if (v16 != v15)
  {
    v8 = 0;
    v9 = 0;
    do
    {
      v10 = (void *)MEMORY[0x1E0CB3940];
      siri::dialogengine::ValidationEntry::GetFormattedText((siri::dialogengine::ValidationEntry *)(v7 + v8), &__p);
      if ((__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
        p_p = &__p;
      else
        p_p = (std::string *)__p.__r_.__value_.__r.__words[0];
      objc_msgSend(v10, "stringWithUTF8String:", p_p);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
        operator delete(__p.__r_.__value_.__l.__data_);
      objc_msgSend(v3, "addObject:", v12);

      ++v9;
      v7 = v15;
      v8 += 88;
    }
    while (v9 < 0x2E8BA2E8BA2E8BA3 * ((v16 - v15) >> 3));
  }
  __p.__r_.__value_.__r.__words[0] = (std::string::size_type)&v15;
  std::vector<siri::dialogengine::ValidationEntry>::__destroy_vector::operator()[abi:ne180100]((void ***)&__p);
  return v3;
}

- (id)execute:(id)a3
{
  id v4;
  void *v5;
  unint64_t *v6;
  unint64_t v7;
  uint64_t v8;
  unint64_t v9;
  __int128 v10;
  uint64_t v11;
  unint64_t *v12;
  unint64_t v13;
  DENode *v14;
  unint64_t *v15;
  unint64_t v16;
  DENode *v17;
  std::__shared_weak_count *v18;
  unint64_t *v19;
  unint64_t v20;
  std::__shared_weak_count *v21;
  unint64_t *v22;
  unint64_t v23;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  uint64_t v28;
  uint64_t v29;

  v4 = a3;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[DEFile This](self, "This");
  siri::dialogengine::File::Execute((siri::dialogengine::File *)v27, (const void ***)objc_msgSend(v4, "This"), (uint64_t)&v28);
  if (*((_QWORD *)&v27 + 1))
  {
    v6 = (unint64_t *)(*((_QWORD *)&v27 + 1) + 8);
    do
      v7 = __ldaxr(v6);
    while (__stlxr(v7 - 1, v6));
    if (!v7)
    {
      (*(void (**)(_QWORD))(**((_QWORD **)&v27 + 1) + 16))(*((_QWORD *)&v27 + 1));
      std::__shared_weak_count::__release_weak(*((std::__shared_weak_count **)&v27 + 1));
    }
  }
  v8 = v28;
  if (v29 != v28)
  {
    v9 = 0;
    do
    {
      v10 = *(_OWORD *)(v8 + 16 * v9);
      v27 = v10;
      v25 = v10;
      v11 = *((_QWORD *)&v10 + 1);
      if (*((_QWORD *)&v10 + 1))
      {
        v12 = (unint64_t *)(*((_QWORD *)&v10 + 1) + 8);
        do
          v13 = __ldxr(v12);
        while (__stxr(v13 + 1, v12));
      }
      v14 = [DENode alloc];
      v26 = v25;
      if (v11)
      {
        v15 = (unint64_t *)(v11 + 8);
        do
          v16 = __ldxr(v15);
        while (__stxr(v16 + 1, v15));
      }
      v17 = -[DENode initWithSharedPtr:](v14, "initWithSharedPtr:", &v26, v25);
      objc_msgSend(v5, "addObject:", v17);

      v18 = (std::__shared_weak_count *)*((_QWORD *)&v26 + 1);
      if (*((_QWORD *)&v26 + 1))
      {
        v19 = (unint64_t *)(*((_QWORD *)&v26 + 1) + 8);
        do
          v20 = __ldaxr(v19);
        while (__stlxr(v20 - 1, v19));
        if (!v20)
        {
          ((void (*)(std::__shared_weak_count *))v18->__on_zero_shared)(v18);
          std::__shared_weak_count::__release_weak(v18);
        }
      }
      v21 = (std::__shared_weak_count *)*((_QWORD *)&v27 + 1);
      if (*((_QWORD *)&v27 + 1))
      {
        v22 = (unint64_t *)(*((_QWORD *)&v27 + 1) + 8);
        do
          v23 = __ldaxr(v22);
        while (__stlxr(v23 - 1, v22));
        if (!v23)
        {
          ((void (*)(std::__shared_weak_count *))v21->__on_zero_shared)(v21);
          std::__shared_weak_count::__release_weak(v21);
        }
      }
      ++v9;
      v8 = v28;
    }
    while (v9 < (v29 - v28) >> 4);
  }
  *(_QWORD *)&v27 = &v28;
  std::vector<std::shared_ptr<siri::dialogengine::VisualComponentsCombination::Entry>>::__destroy_vector::operator()[abi:ne180100]((void ***)&v27);

  return v5;
}

- (shared_ptr<siri::dialogengine::File>)This
{
  void *v2;
  File *v3;
  __shared_weak_count *v4;
  shared_ptr<siri::dialogengine::File> result;

  objc_copyCppObjectAtomic(v2, &self->_This, (void (__cdecl *)(void *, const void *))__copy_helper_atomic_property_);
  result.__cntrl_ = v4;
  result.__ptr_ = v3;
  return result;
}

- (void)setThis:(shared_ptr<siri::dialogengine::File>)a3
{
  objc_copyCppObjectAtomic(&self->_This, a3.__ptr_, (void (__cdecl *)(void *, const void *))__assign_helper_atomic_property_);
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

@end
