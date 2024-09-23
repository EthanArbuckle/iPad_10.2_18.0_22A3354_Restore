@implementation DEVariableString

- (DEVariableString)init
{
  DEVariableString *v2;
  _QWORD *v3;
  std::__shared_weak_count *v4;
  unint64_t *v5;
  unint64_t v6;
  __int128 v8;
  __int128 v9;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)DEVariableString;
  v2 = -[DEVariable init](&v10, sel_init);
  if (v2)
  {
    v3 = operator new(0x108uLL);
    v3[1] = 0;
    v3[2] = 0;
    *v3 = &off_1E793A548;
    *(_QWORD *)&v8 = siri::dialogengine::VariableString::VariableString((siri::dialogengine::VariableString *)(v3 + 3));
    *((_QWORD *)&v8 + 1) = v3;
    v9 = v8;
    -[DEVariable setThis:](v2, "setThis:", &v9, 0);
    v4 = (std::__shared_weak_count *)*((_QWORD *)&v9 + 1);
    if (*((_QWORD *)&v9 + 1))
    {
      v5 = (unint64_t *)(*((_QWORD *)&v9 + 1) + 8);
      do
        v6 = __ldaxr(v5);
      while (__stlxr(v6 - 1, v5));
      if (!v6)
      {
        ((void (*)(std::__shared_weak_count *))v4->__on_zero_shared)(v4);
        std::__shared_weak_count::__release_weak(v4);
      }
    }
  }
  return v2;
}

- (DEVariableString)initWithSharedPtr:(void *)a3
{
  DEVariableString *v4;
  DEVariableString *v5;
  std::__shared_weak_count *v6;
  unint64_t *p_shared_owners;
  unint64_t v8;
  std::__shared_weak_count *v9;
  unint64_t *v10;
  unint64_t v11;
  uint64_t v13;
  std::__shared_weak_count *v14;
  objc_super v15;

  v15.receiver = self;
  v15.super_class = (Class)DEVariableString;
  v4 = -[DEVariable init](&v15, sel_init);
  v5 = v4;
  if (v4)
  {
    v6 = (std::__shared_weak_count *)*((_QWORD *)a3 + 1);
    v13 = *(_QWORD *)a3;
    v14 = v6;
    if (v6)
    {
      p_shared_owners = (unint64_t *)&v6->__shared_owners_;
      do
        v8 = __ldxr(p_shared_owners);
      while (__stxr(v8 + 1, p_shared_owners));
    }
    -[DEVariable setThis:](v4, "setThis:", &v13);
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

- (DEVariableString)initWithName:(id)a3 string:(id)a4
{
  id v6;
  id v7;
  DEVariableString *v8;
  _QWORD *v9;
  std::__shared_weak_count *v10;
  unint64_t *v11;
  unint64_t v12;
  std::__shared_weak_count *v13;
  unint64_t *v14;
  unint64_t v15;
  void *__p[2];
  char v18;
  std::string v19;
  __int128 v20;
  __int128 v21;
  objc_super v22;

  v6 = a3;
  v7 = a4;
  v22.receiver = self;
  v22.super_class = (Class)DEVariableString;
  v8 = -[DEVariable init](&v22, sel_init);
  if (v8)
  {
    std::string::basic_string[abi:ne180100]<0>(&v19, (char *)objc_msgSend(objc_retainAutorelease(v6), "UTF8String"));
    std::string::basic_string[abi:ne180100]<0>(__p, (char *)objc_msgSend(objc_retainAutorelease(v7), "UTF8String"));
    v9 = operator new(0x108uLL);
    v9[1] = 0;
    v9[2] = 0;
    *v9 = &off_1E793A548;
    *(_QWORD *)&v20 = siri::dialogengine::VariableString::VariableString((uint64_t)(v9 + 3), &v19, (uint64_t)__p);
    *((_QWORD *)&v20 + 1) = v9;
    v21 = v20;
    v20 = 0uLL;
    -[DEVariable setThis:](v8, "setThis:", &v21);
    v10 = (std::__shared_weak_count *)*((_QWORD *)&v21 + 1);
    if (*((_QWORD *)&v21 + 1))
    {
      v11 = (unint64_t *)(*((_QWORD *)&v21 + 1) + 8);
      do
        v12 = __ldaxr(v11);
      while (__stlxr(v12 - 1, v11));
      if (!v12)
      {
        ((void (*)(std::__shared_weak_count *))v10->__on_zero_shared)(v10);
        std::__shared_weak_count::__release_weak(v10);
      }
    }
    v13 = (std::__shared_weak_count *)*((_QWORD *)&v20 + 1);
    if (*((_QWORD *)&v20 + 1))
    {
      v14 = (unint64_t *)(*((_QWORD *)&v20 + 1) + 8);
      do
        v15 = __ldaxr(v14);
      while (__stlxr(v15 - 1, v14));
      if (!v15)
      {
        ((void (*)(std::__shared_weak_count *))v13->__on_zero_shared)(v13);
        std::__shared_weak_count::__release_weak(v13);
      }
    }
    if (v18 < 0)
      operator delete(__p[0]);
    if (SHIBYTE(v19.__r_.__value_.__r.__words[2]) < 0)
      operator delete(v19.__r_.__value_.__l.__data_);
  }

  return v8;
}

- (DEVariableString)initWithName:(id)a3 print:(id)a4 speak:(id)a5
{
  id v8;
  id v9;
  id v10;
  _QWORD *v11;
  std::string __p;
  std::string v14;
  std::string v15;
  objc_super v16;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v16.receiver = self;
  v16.super_class = (Class)DEVariableString;
  if (-[DEVariable init](&v16, sel_init))
  {
    std::string::basic_string[abi:ne180100]<0>(&v15, (char *)objc_msgSend(objc_retainAutorelease(v8), "UTF8String"));
    std::string::basic_string[abi:ne180100]<0>(&v14, (char *)objc_msgSend(objc_retainAutorelease(v9), "UTF8String"));
    std::string::basic_string[abi:ne180100]<0>(&__p, (char *)objc_msgSend(objc_retainAutorelease(v10), "UTF8String"));
    v11 = operator new(0x108uLL);
    v11[1] = 0;
    v11[2] = 0;
    *v11 = &off_1E793A548;
    siri::dialogengine::VariableString::VariableString((uint64_t)(v11 + 3), &v15, &v14, &__p);
  }

  return 0;
}

- (NSString)printValue
{
  char *v2;
  unint64_t *v3;
  unint64_t v4;
  unint64_t *v5;
  unint64_t v6;
  void *v7;
  void *v8;
  std::string *p_lpsrc;
  std::__shared_weak_count *v10;
  unint64_t *v11;
  unint64_t v12;
  std::string lpsrc;
  char *v15;
  std::string::size_type size;

  -[DEVariable This](self, "This");
  if (lpsrc.__r_.__value_.__r.__words[0]
  {
    v15 = v2;
    size = lpsrc.__r_.__value_.__l.__size_;
    if (lpsrc.__r_.__value_.__l.__size_)
    {
      v3 = (unint64_t *)(lpsrc.__r_.__value_.__l.__size_ + 8);
      do
        v4 = __ldxr(v3);
      while (__stxr(v4 + 1, v3));
    }
  }
  else
  {
    v15 = 0;
    size = 0;
  }
  if (lpsrc.__r_.__value_.__l.__size_)
  {
    v5 = (unint64_t *)(lpsrc.__r_.__value_.__l.__size_ + 8);
    do
      v6 = __ldaxr(v5);
    while (__stlxr(v6 - 1, v5));
    if (!v6)
    {
      (*(void (**)(std::string::size_type))(*(_QWORD *)lpsrc.__r_.__value_.__l.__size_ + 16))(lpsrc.__r_.__value_.__l.__size_);
      std::__shared_weak_count::__release_weak((std::__shared_weak_count *)lpsrc.__r_.__value_.__l.__size_);
    }
  }
  if (v15)
  {
    v7 = (void *)MEMORY[0x1E0CB3940];
    if (v15[95] < 0)
      std::string::__init_copy_ctor_external(&lpsrc, *((const std::string::value_type **)v15 + 9), *((_QWORD *)v15 + 10));
    else
      lpsrc = *(std::string *)(v15 + 3);
    if ((lpsrc.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
      p_lpsrc = &lpsrc;
    else
      p_lpsrc = (std::string *)lpsrc.__r_.__value_.__r.__words[0];
    objc_msgSend(v7, "stringWithUTF8String:", p_lpsrc, *(_OWORD *)&lpsrc.__r_.__value_.__l.__data_, lpsrc.__r_.__value_.__r.__words[2]);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (SHIBYTE(lpsrc.__r_.__value_.__r.__words[2]) < 0)
      operator delete(lpsrc.__r_.__value_.__l.__data_);
  }
  else
  {
    v8 = 0;
  }
  v10 = (std::__shared_weak_count *)size;
  if (size)
  {
    v11 = (unint64_t *)(size + 8);
    do
      v12 = __ldaxr(v11);
    while (__stlxr(v12 - 1, v11));
    if (!v12)
    {
      ((void (*)(std::__shared_weak_count *))v10->__on_zero_shared)(v10);
      std::__shared_weak_count::__release_weak(v10);
    }
  }
  return (NSString *)v8;
}

- (NSString)speakValue
{
  char *v2;
  unint64_t *v3;
  unint64_t v4;
  unint64_t *v5;
  unint64_t v6;
  void *v7;
  void *v8;
  std::string *p_lpsrc;
  std::__shared_weak_count *v10;
  unint64_t *v11;
  unint64_t v12;
  std::string lpsrc;
  char *v15;
  std::string::size_type size;

  -[DEVariable This](self, "This");
  if (lpsrc.__r_.__value_.__r.__words[0]
  {
    v15 = v2;
    size = lpsrc.__r_.__value_.__l.__size_;
    if (lpsrc.__r_.__value_.__l.__size_)
    {
      v3 = (unint64_t *)(lpsrc.__r_.__value_.__l.__size_ + 8);
      do
        v4 = __ldxr(v3);
      while (__stxr(v4 + 1, v3));
    }
  }
  else
  {
    v15 = 0;
    size = 0;
  }
  if (lpsrc.__r_.__value_.__l.__size_)
  {
    v5 = (unint64_t *)(lpsrc.__r_.__value_.__l.__size_ + 8);
    do
      v6 = __ldaxr(v5);
    while (__stlxr(v6 - 1, v5));
    if (!v6)
    {
      (*(void (**)(std::string::size_type))(*(_QWORD *)lpsrc.__r_.__value_.__l.__size_ + 16))(lpsrc.__r_.__value_.__l.__size_);
      std::__shared_weak_count::__release_weak((std::__shared_weak_count *)lpsrc.__r_.__value_.__l.__size_);
    }
  }
  if (v15)
  {
    v7 = (void *)MEMORY[0x1E0CB3940];
    if (v15[119] < 0)
      std::string::__init_copy_ctor_external(&lpsrc, *((const std::string::value_type **)v15 + 12), *((_QWORD *)v15 + 13));
    else
      lpsrc = *(std::string *)(v15 + 4);
    if ((lpsrc.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
      p_lpsrc = &lpsrc;
    else
      p_lpsrc = (std::string *)lpsrc.__r_.__value_.__r.__words[0];
    objc_msgSend(v7, "stringWithUTF8String:", p_lpsrc, *(_OWORD *)&lpsrc.__r_.__value_.__l.__data_, lpsrc.__r_.__value_.__r.__words[2]);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (SHIBYTE(lpsrc.__r_.__value_.__r.__words[2]) < 0)
      operator delete(lpsrc.__r_.__value_.__l.__data_);
  }
  else
  {
    v8 = 0;
  }
  v10 = (std::__shared_weak_count *)size;
  if (size)
  {
    v11 = (unint64_t *)(size + 8);
    do
      v12 = __ldaxr(v11);
    while (__stlxr(v12 - 1, v11));
    if (!v12)
    {
      ((void (*)(std::__shared_weak_count *))v10->__on_zero_shared)(v10);
      std::__shared_weak_count::__release_weak(v10);
    }
  }
  return (NSString *)v8;
}

- (void)setValuePrint:(id)a3 speak:(id)a4
{
  id v6;
  id v7;
  std::string *v8;
  unint64_t *v9;
  unint64_t v10;
  unint64_t *v11;
  unint64_t v12;
  std::string *v13;
  uint64_t *p_shared_owners;
  unint64_t v15;
  std::string __p;
  std::string lpsrc;
  std::string *v18;
  std::__shared_weak_count *size;

  v6 = a3;
  v7 = a4;
  -[DEVariable This](self, "This");
  if (lpsrc.__r_.__value_.__r.__words[0]
  {
    v18 = v8;
    size = (std::__shared_weak_count *)lpsrc.__r_.__value_.__l.__size_;
    if (lpsrc.__r_.__value_.__l.__size_)
    {
      v9 = (unint64_t *)(lpsrc.__r_.__value_.__l.__size_ + 8);
      do
        v10 = __ldxr(v9);
      while (__stxr(v10 + 1, v9));
    }
  }
  else
  {
    v18 = 0;
    size = 0;
  }
  if (lpsrc.__r_.__value_.__l.__size_)
  {
    v11 = (unint64_t *)(lpsrc.__r_.__value_.__l.__size_ + 8);
    do
      v12 = __ldaxr(v11);
    while (__stlxr(v12 - 1, v11));
    if (!v12)
    {
      (*(void (**)(std::string::size_type))(*(_QWORD *)lpsrc.__r_.__value_.__l.__size_ + 16))(lpsrc.__r_.__value_.__l.__size_);
      std::__shared_weak_count::__release_weak((std::__shared_weak_count *)lpsrc.__r_.__value_.__l.__size_);
    }
  }
  v13 = v18;
  if (v18)
  {
    std::string::basic_string[abi:ne180100]<0>(&lpsrc, (char *)objc_msgSend(objc_retainAutorelease(v6), "UTF8String"));
    std::string::basic_string[abi:ne180100]<0>(&__p, (char *)objc_msgSend(objc_retainAutorelease(v7), "UTF8String"));
    siri::dialogengine::SpeakableString::SetString(v13 + 3, &lpsrc, &__p);
  }
  if (size)
  {
    p_shared_owners = &size->__shared_owners_;
    do
      v15 = __ldaxr((unint64_t *)p_shared_owners);
    while (__stlxr(v15 - 1, (unint64_t *)p_shared_owners));
    if (!v15)
    {
      ((void (*)(std::__shared_weak_count *))size->__on_zero_shared)(size);
      std::__shared_weak_count::__release_weak(size);
    }
  }

}

@end
