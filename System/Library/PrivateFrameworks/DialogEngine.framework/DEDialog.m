@implementation DEDialog

- (DEDialog)init
{
  DEDialog *v2;
  std::__shared_weak_count *v3;
  unint64_t *p_shared_owners;
  unint64_t v5;
  uint64_t v7;
  std::__shared_weak_count *v8;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)DEDialog;
  v2 = -[DENode init](&v9, sel_init);
  if (v2)
  {
    -[DEDialog setThis:](v2, "setThis:", &v7, _ZNSt3__115allocate_sharedB8ne180100IN4siri12dialogengine6DialogENS_9allocatorIS3_EEJEvEENS_10shared_ptrIT_EERKT0_DpOT1_(&v7));
    v3 = v8;
    if (v8)
    {
      p_shared_owners = (unint64_t *)&v8->__shared_owners_;
      do
        v5 = __ldaxr(p_shared_owners);
      while (__stlxr(v5 - 1, p_shared_owners));
      if (!v5)
      {
        ((void (*)(std::__shared_weak_count *))v3->__on_zero_shared)(v3);
        std::__shared_weak_count::__release_weak(v3);
      }
    }
  }
  return v2;
}

- (DEDialog)initWithSharedPtr:(shared_ptr<siri::dialogengine::Dialog>)a3
{
  Dialog *ptr;
  DEDialog *v4;
  DEDialog *v5;
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
  v15.super_class = (Class)DEDialog;
  v4 = -[DENode init](&v15, sel_init, a3.__ptr_, a3.__cntrl_);
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
    -[DEDialog setThis:](v4, "setThis:", &v13);
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
  -[DEDialog This](self, "This");
  if (*(char *)(v8 + 119) < 0)
    std::string::__init_copy_ctor_external(&v10, *(const std::string::value_type **)(v8 + 96), *(_QWORD *)(v8 + 104));
  else
    v10 = *(std::string *)(v8 + 96);
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
  std::string *v5;
  id v6;
  std::__shared_weak_count *v7;
  unint64_t *p_shared_owners;
  unint64_t v9;
  std::string __str;
  std::string *v11;
  std::__shared_weak_count *v12;

  v4 = a3;
  -[DEDialog This](self, "This");
  v5 = v11;
  v6 = objc_retainAutorelease(v4);
  std::string::basic_string[abi:ne180100]<0>(&__str, (char *)objc_msgSend(v6, "UTF8String"));
  std::string::operator=(v5 + 4, &__str);
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

- (DESpeakableString)content
{
  unint64_t *v2;
  unint64_t v3;
  DESpeakableString *v4;
  void *v5;
  std::string *v6;
  void *v7;
  void *v8;
  std::string *p_p;
  void *v10;
  DESpeakableString *v11;
  std::string __p;
  std::string v14;
  std::string v15;
  std::string v16;
  void *v17;
  char v18;
  void *v19;
  char v20;
  void *v21;
  char v22;
  void *v23;
  char v24;
  void *v25;
  char v26;

  -[DEDialog This](self, "This");
  siri::dialogengine::SpeakableString::SpeakableString(&v15, (const siri::dialogengine::SpeakableString *)(v14.__r_.__value_.__r.__words[0] + 208));
  if (v14.__r_.__value_.__l.__size_)
  {
    v2 = (unint64_t *)(v14.__r_.__value_.__l.__size_ + 8);
    do
      v3 = __ldaxr(v2);
    while (__stlxr(v3 - 1, v2));
    if (!v3)
    {
      (*(void (**)(std::string::size_type))(*(_QWORD *)v14.__r_.__value_.__l.__size_ + 16))(v14.__r_.__value_.__l.__size_);
      std::__shared_weak_count::__release_weak((std::__shared_weak_count *)v14.__r_.__value_.__l.__size_);
    }
  }
  v4 = [DESpeakableString alloc];
  v5 = (void *)MEMORY[0x1E0CB3940];
  if (SHIBYTE(v15.__r_.__value_.__r.__words[2]) < 0)
    std::string::__init_copy_ctor_external(&v14, v15.__r_.__value_.__l.__data_, v15.__r_.__value_.__l.__size_);
  else
    v14 = v15;
  if ((v14.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
    v6 = &v14;
  else
    v6 = (std::string *)v14.__r_.__value_.__r.__words[0];
  objc_msgSend(v5, "stringWithUTF8String:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)MEMORY[0x1E0CB3940];
  if (SHIBYTE(v16.__r_.__value_.__r.__words[2]) < 0)
    std::string::__init_copy_ctor_external(&__p, v16.__r_.__value_.__l.__data_, v16.__r_.__value_.__l.__size_);
  else
    __p = v16;
  if ((__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
    p_p = &__p;
  else
    p_p = (std::string *)__p.__r_.__value_.__r.__words[0];
  objc_msgSend(v8, "stringWithUTF8String:", p_p, *(_OWORD *)&__p.__r_.__value_.__l.__data_, __p.__r_.__value_.__r.__words[2]);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = -[DESpeakableString initWithPrint:speak:](v4, "initWithPrint:speak:", v7, v10);

  if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
    operator delete(__p.__r_.__value_.__l.__data_);

  if (SHIBYTE(v14.__r_.__value_.__r.__words[2]) < 0)
    operator delete(v14.__r_.__value_.__l.__data_);
  if (v26 < 0)
    operator delete(v25);
  if (v24 < 0)
    operator delete(v23);
  if (v22 < 0)
    operator delete(v21);
  if (v20 < 0)
    operator delete(v19);
  if (v18 < 0)
    operator delete(v17);
  if (SHIBYTE(v16.__r_.__value_.__r.__words[2]) < 0)
    operator delete(v16.__r_.__value_.__l.__data_);
  if (SHIBYTE(v15.__r_.__value_.__r.__words[2]) < 0)
    operator delete(v15.__r_.__value_.__l.__data_);
  return v11;
}

- (id)getExpandedContent:(id)a3
{
  id v4;
  unint64_t *v5;
  unint64_t v6;
  DESpeakableString *v7;
  void *v8;
  std::string *v9;
  void *v10;
  void *v11;
  std::string *p_p;
  void *v13;
  DESpeakableString *v14;
  std::string __p;
  std::string v17;
  std::string v18;
  std::string v19;
  void *v20;
  char v21;
  void *v22;
  char v23;
  void *v24;
  char v25;
  void *v26;
  char v27;
  void *v28;
  char v29;

  v4 = a3;
  -[DEDialog This](self, "This");
  siri::dialogengine::Dialog::GetExpandedFull((siri::dialogengine::Dialog *)v17.__r_.__value_.__l.__data_, (siri::dialogengine::Context *)objc_msgSend(v4, "This"), (uint64_t)&v18);
  if (v17.__r_.__value_.__l.__size_)
  {
    v5 = (unint64_t *)(v17.__r_.__value_.__l.__size_ + 8);
    do
      v6 = __ldaxr(v5);
    while (__stlxr(v6 - 1, v5));
    if (!v6)
    {
      (*(void (**)(std::string::size_type))(*(_QWORD *)v17.__r_.__value_.__l.__size_ + 16))(v17.__r_.__value_.__l.__size_);
      std::__shared_weak_count::__release_weak((std::__shared_weak_count *)v17.__r_.__value_.__l.__size_);
    }
  }
  v7 = [DESpeakableString alloc];
  v8 = (void *)MEMORY[0x1E0CB3940];
  if (SHIBYTE(v18.__r_.__value_.__r.__words[2]) < 0)
    std::string::__init_copy_ctor_external(&v17, v18.__r_.__value_.__l.__data_, v18.__r_.__value_.__l.__size_);
  else
    v17 = v18;
  if ((v17.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
    v9 = &v17;
  else
    v9 = (std::string *)v17.__r_.__value_.__r.__words[0];
  objc_msgSend(v8, "stringWithUTF8String:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)MEMORY[0x1E0CB3940];
  if (SHIBYTE(v19.__r_.__value_.__r.__words[2]) < 0)
    std::string::__init_copy_ctor_external(&__p, v19.__r_.__value_.__l.__data_, v19.__r_.__value_.__l.__size_);
  else
    __p = v19;
  if ((__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
    p_p = &__p;
  else
    p_p = (std::string *)__p.__r_.__value_.__r.__words[0];
  objc_msgSend(v11, "stringWithUTF8String:", p_p, *(_OWORD *)&__p.__r_.__value_.__l.__data_, __p.__r_.__value_.__r.__words[2]);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = -[DESpeakableString initWithPrint:speak:](v7, "initWithPrint:speak:", v10, v13);

  if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
    operator delete(__p.__r_.__value_.__l.__data_);

  if (SHIBYTE(v17.__r_.__value_.__r.__words[2]) < 0)
    operator delete(v17.__r_.__value_.__l.__data_);
  if (v29 < 0)
    operator delete(v28);
  if (v27 < 0)
    operator delete(v26);
  if (v25 < 0)
    operator delete(v24);
  if (v23 < 0)
    operator delete(v22);
  if (v21 < 0)
    operator delete(v20);
  if (SHIBYTE(v19.__r_.__value_.__r.__words[2]) < 0)
    operator delete(v19.__r_.__value_.__l.__data_);
  if (SHIBYTE(v18.__r_.__value_.__r.__words[2]) < 0)
    operator delete(v18.__r_.__value_.__l.__data_);

  return v14;
}

- (void)setContent:(id)a3
{
  id v3;
  id v4;
  id v5;
  void *v6;
  std::string v7;
  std::string v8;

  v3 = a3;
  objc_msgSend(v3, "print");
  v4 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  std::string::basic_string[abi:ne180100]<0>(&v8, (char *)objc_msgSend(v4, "UTF8String"));

  objc_msgSend(v3, "speak");
  v5 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  std::string::basic_string[abi:ne180100]<0>(&v7, (char *)objc_msgSend(v5, "UTF8String"));

  siri::dialogengine::SpeakableString::SpeakableString((uint64_t)&v6, &v8, &v7);
}

- (DESpeakableString)caption
{
  unint64_t *v2;
  unint64_t v3;
  DESpeakableString *v4;
  void *v5;
  std::string *v6;
  void *v7;
  void *v8;
  std::string *p_p;
  void *v10;
  DESpeakableString *v11;
  std::string __p;
  std::string v14;
  std::string v15;
  std::string v16;
  void *v17;
  char v18;
  void *v19;
  char v20;
  void *v21;
  char v22;
  void *v23;
  char v24;
  void *v25;
  char v26;

  -[DEDialog This](self, "This");
  siri::dialogengine::SpeakableString::SpeakableString(&v15, (const siri::dialogengine::SpeakableString *)(v14.__r_.__value_.__r.__words[0] + 376));
  if (v14.__r_.__value_.__l.__size_)
  {
    v2 = (unint64_t *)(v14.__r_.__value_.__l.__size_ + 8);
    do
      v3 = __ldaxr(v2);
    while (__stlxr(v3 - 1, v2));
    if (!v3)
    {
      (*(void (**)(std::string::size_type))(*(_QWORD *)v14.__r_.__value_.__l.__size_ + 16))(v14.__r_.__value_.__l.__size_);
      std::__shared_weak_count::__release_weak((std::__shared_weak_count *)v14.__r_.__value_.__l.__size_);
    }
  }
  v4 = [DESpeakableString alloc];
  v5 = (void *)MEMORY[0x1E0CB3940];
  if (SHIBYTE(v15.__r_.__value_.__r.__words[2]) < 0)
    std::string::__init_copy_ctor_external(&v14, v15.__r_.__value_.__l.__data_, v15.__r_.__value_.__l.__size_);
  else
    v14 = v15;
  if ((v14.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
    v6 = &v14;
  else
    v6 = (std::string *)v14.__r_.__value_.__r.__words[0];
  objc_msgSend(v5, "stringWithUTF8String:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)MEMORY[0x1E0CB3940];
  if (SHIBYTE(v16.__r_.__value_.__r.__words[2]) < 0)
    std::string::__init_copy_ctor_external(&__p, v16.__r_.__value_.__l.__data_, v16.__r_.__value_.__l.__size_);
  else
    __p = v16;
  if ((__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
    p_p = &__p;
  else
    p_p = (std::string *)__p.__r_.__value_.__r.__words[0];
  objc_msgSend(v8, "stringWithUTF8String:", p_p, *(_OWORD *)&__p.__r_.__value_.__l.__data_, __p.__r_.__value_.__r.__words[2]);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = -[DESpeakableString initWithPrint:speak:](v4, "initWithPrint:speak:", v7, v10);

  if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
    operator delete(__p.__r_.__value_.__l.__data_);

  if (SHIBYTE(v14.__r_.__value_.__r.__words[2]) < 0)
    operator delete(v14.__r_.__value_.__l.__data_);
  if (v26 < 0)
    operator delete(v25);
  if (v24 < 0)
    operator delete(v23);
  if (v22 < 0)
    operator delete(v21);
  if (v20 < 0)
    operator delete(v19);
  if (v18 < 0)
    operator delete(v17);
  if (SHIBYTE(v16.__r_.__value_.__r.__words[2]) < 0)
    operator delete(v16.__r_.__value_.__l.__data_);
  if (SHIBYTE(v15.__r_.__value_.__r.__words[2]) < 0)
    operator delete(v15.__r_.__value_.__l.__data_);
  return v11;
}

- (id)getExpandedCaption:(id)a3
{
  id v4;
  unint64_t *v5;
  unint64_t v6;
  DESpeakableString *v7;
  void *v8;
  std::string *v9;
  void *v10;
  void *v11;
  std::string *p_p;
  void *v13;
  DESpeakableString *v14;
  std::string __p;
  std::string v17;
  std::string v18;
  std::string v19;
  void *v20;
  char v21;
  void *v22;
  char v23;
  void *v24;
  char v25;
  void *v26;
  char v27;
  void *v28;
  char v29;

  v4 = a3;
  -[DEDialog This](self, "This");
  siri::dialogengine::Dialog::GetExpandedSupporting((siri::dialogengine::Dialog *)v17.__r_.__value_.__l.__data_, (siri::dialogengine::Context *)objc_msgSend(v4, "This"), (uint64_t)&v18);
  if (v17.__r_.__value_.__l.__size_)
  {
    v5 = (unint64_t *)(v17.__r_.__value_.__l.__size_ + 8);
    do
      v6 = __ldaxr(v5);
    while (__stlxr(v6 - 1, v5));
    if (!v6)
    {
      (*(void (**)(std::string::size_type))(*(_QWORD *)v17.__r_.__value_.__l.__size_ + 16))(v17.__r_.__value_.__l.__size_);
      std::__shared_weak_count::__release_weak((std::__shared_weak_count *)v17.__r_.__value_.__l.__size_);
    }
  }
  v7 = [DESpeakableString alloc];
  v8 = (void *)MEMORY[0x1E0CB3940];
  if (SHIBYTE(v18.__r_.__value_.__r.__words[2]) < 0)
    std::string::__init_copy_ctor_external(&v17, v18.__r_.__value_.__l.__data_, v18.__r_.__value_.__l.__size_);
  else
    v17 = v18;
  if ((v17.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
    v9 = &v17;
  else
    v9 = (std::string *)v17.__r_.__value_.__r.__words[0];
  objc_msgSend(v8, "stringWithUTF8String:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)MEMORY[0x1E0CB3940];
  if (SHIBYTE(v19.__r_.__value_.__r.__words[2]) < 0)
    std::string::__init_copy_ctor_external(&__p, v19.__r_.__value_.__l.__data_, v19.__r_.__value_.__l.__size_);
  else
    __p = v19;
  if ((__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
    p_p = &__p;
  else
    p_p = (std::string *)__p.__r_.__value_.__r.__words[0];
  objc_msgSend(v11, "stringWithUTF8String:", p_p, *(_OWORD *)&__p.__r_.__value_.__l.__data_, __p.__r_.__value_.__r.__words[2]);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = -[DESpeakableString initWithPrint:speak:](v7, "initWithPrint:speak:", v10, v13);

  if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
    operator delete(__p.__r_.__value_.__l.__data_);

  if (SHIBYTE(v17.__r_.__value_.__r.__words[2]) < 0)
    operator delete(v17.__r_.__value_.__l.__data_);
  if (v29 < 0)
    operator delete(v28);
  if (v27 < 0)
    operator delete(v26);
  if (v25 < 0)
    operator delete(v24);
  if (v23 < 0)
    operator delete(v22);
  if (v21 < 0)
    operator delete(v20);
  if (SHIBYTE(v19.__r_.__value_.__r.__words[2]) < 0)
    operator delete(v19.__r_.__value_.__l.__data_);
  if (SHIBYTE(v18.__r_.__value_.__r.__words[2]) < 0)
    operator delete(v18.__r_.__value_.__l.__data_);

  return v14;
}

- (void)setCaption:(id)a3
{
  id v3;
  id v4;
  id v5;
  void *v6;
  std::string v7;
  std::string v8;

  v3 = a3;
  objc_msgSend(v3, "print");
  v4 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  std::string::basic_string[abi:ne180100]<0>(&v8, (char *)objc_msgSend(v4, "UTF8String"));

  objc_msgSend(v3, "speak");
  v5 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  std::string::basic_string[abi:ne180100]<0>(&v7, (char *)objc_msgSend(v5, "UTF8String"));

  siri::dialogengine::SpeakableString::SpeakableString((uint64_t)&v6, &v8, &v7);
}

- (BOOL)validate:(id)a3
{
  id v4;
  char v5;
  unint64_t *p_shared_owners;
  unint64_t v7;
  uint64_t v9;
  std::__shared_weak_count *v10;

  v4 = a3;
  -[DEDialog This](self, "This");
  v5 = (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)v9 + 32))(v9, objc_msgSend(v4, "This"));
  if (v10)
  {
    p_shared_owners = (unint64_t *)&v10->__shared_owners_;
    do
      v7 = __ldaxr(p_shared_owners);
    while (__stlxr(v7 - 1, p_shared_owners));
    if (!v7)
    {
      ((void (*)())v10->__on_zero_shared)();
      std::__shared_weak_count::__release_weak(v10);
    }
  }

  return v5;
}

- (BOOL)isSelectable:(id)a3
{
  id v4;
  char v5;
  unint64_t *p_shared_owners;
  unint64_t v7;
  uint64_t v9;
  std::__shared_weak_count *v10;

  v4 = a3;
  -[DEDialog This](self, "This");
  v5 = (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)v9 + 48))(v9, objc_msgSend(v4, "This"));
  if (v10)
  {
    p_shared_owners = (unint64_t *)&v10->__shared_owners_;
    do
      v7 = __ldaxr(p_shared_owners);
    while (__stlxr(v7 - 1, p_shared_owners));
    if (!v7)
    {
      ((void (*)())v10->__on_zero_shared)();
      std::__shared_weak_count::__release_weak(v10);
    }
  }

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  BOOL v5;
  unint64_t *p_shared_owners;
  unint64_t v7;
  unint64_t *v8;
  unint64_t v9;
  uint64_t v11;
  std::__shared_weak_count *v12;
  uint64_t v13;
  std::__shared_weak_count *v14;

  v4 = a3;
  -[DEDialog This](self, "This");
  objc_msgSend(v4, "This");
  v5 = siri::dialogengine::Dialog::operator==(v13, v11);
  if (v12)
  {
    p_shared_owners = (unint64_t *)&v12->__shared_owners_;
    do
      v7 = __ldaxr(p_shared_owners);
    while (__stlxr(v7 - 1, p_shared_owners));
    if (!v7)
    {
      ((void (*)())v12->__on_zero_shared)();
      std::__shared_weak_count::__release_weak(v12);
    }
  }
  if (v14)
  {
    v8 = (unint64_t *)&v14->__shared_owners_;
    do
      v9 = __ldaxr(v8);
    while (__stlxr(v9 - 1, v8));
    if (!v9)
    {
      ((void (*)())v14->__on_zero_shared)();
      std::__shared_weak_count::__release_weak(v14);
    }
  }

  return v5;
}

- (shared_ptr<siri::dialogengine::Dialog>)This
{
  void *v2;
  Dialog *v3;
  __shared_weak_count *v4;
  shared_ptr<siri::dialogengine::Dialog> result;

  objc_copyCppObjectAtomic(v2, &self->_This, (void (__cdecl *)(void *, const void *))__copy_helper_atomic_property__24391);
  result.__cntrl_ = v4;
  result.__ptr_ = v3;
  return result;
}

- (void)setThis:(shared_ptr<siri::dialogengine::Dialog>)a3
{
  objc_copyCppObjectAtomic(&self->_This, a3.__ptr_, (void (__cdecl *)(void *, const void *))__assign_helper_atomic_property__24390);
}

- (void).cxx_destruct
{
  std::shared_ptr<siri::dialogengine::VisualComponentsCombination::Entry>::~shared_ptr[abi:ne180100]((uint64_t)&self->_This);
}

- (id).cxx_construct
{
  *((_QWORD *)self + 3) = 0;
  *((_QWORD *)self + 4) = 0;
  return self;
}

@end
