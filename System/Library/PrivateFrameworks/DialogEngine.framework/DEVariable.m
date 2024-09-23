@implementation DEVariable

- (DEVariable)init
{
  DEVariable *v2;
  std::__shared_weak_count *v3;
  std::__shared_weak_count *v4;
  unint64_t *p_shared_owners;
  unint64_t v6;
  siri::dialogengine::Variable *v8;
  std::__shared_weak_count *v9;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)DEVariable;
  v2 = -[DEVariable init](&v10, sel_init);
  if (v2)
  {
    v3 = (std::__shared_weak_count *)operator new(0x60uLL);
    v3->__shared_owners_ = 0;
    v3->__shared_weak_owners_ = 0;
    v3->__vftable = (std::__shared_weak_count_vtbl *)&off_1E79358E8;
    v8 = siri::dialogengine::Variable::Variable((siri::dialogengine::Variable *)&v3[1]);
    v9 = v3;
    -[DEVariable setThis:](v2, "setThis:", &v8);
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
  return v2;
}

- (DEVariable)initWithSharedPtr:(void *)a3
{
  DEVariable *v4;
  DEVariable *v5;
  std::__shared_weak_count *v6;
  unint64_t *p_shared_owners;
  unint64_t v8;
  std::__shared_weak_count *v9;
  unint64_t *v10;
  unint64_t v11;
  void *v12;
  char v13;
  __objc2_class **v14;
  void *v15;
  char v16;
  void *v17;
  char v18;
  void *v19;
  char v20;
  void *v21;
  int v22;
  DEVariable *v23;
  DEVariable *v24;
  uint64_t v26;
  std::__shared_weak_count *v27;
  objc_super v28;

  v28.receiver = self;
  v28.super_class = (Class)DEVariable;
  v4 = -[DEVariable init](&v28, sel_init);
  v5 = v4;
  if (v4)
  {
    v6 = (std::__shared_weak_count *)*((_QWORD *)a3 + 1);
    v26 = *(_QWORD *)a3;
    v27 = v6;
    if (v6)
    {
      p_shared_owners = (unint64_t *)&v6->__shared_owners_;
      do
        v8 = __ldxr(p_shared_owners);
      while (__stxr(v8 + 1, p_shared_owners));
    }
    -[DEVariable setThis:](v4, "setThis:", &v26);
    v9 = v27;
    if (v27)
    {
      v10 = (unint64_t *)&v27->__shared_owners_;
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
  -[DEVariable type](v5, "type", v26);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "isEqualToString:", CFSTR("dialog.String"));

  if ((v13 & 1) != 0)
  {
    v14 = off_1E7924810;
  }
  else
  {
    -[DEVariable type](v5, "type");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v15, "isEqualToString:", CFSTR("dialog.Boolean"));

    if ((v16 & 1) != 0)
    {
      v14 = off_1E79247F8;
    }
    else
    {
      -[DEVariable type](v5, "type");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = objc_msgSend(v17, "isEqualToString:", CFSTR("dialog.Number"));

      if ((v18 & 1) != 0)
      {
        v14 = off_1E7924800;
      }
      else
      {
        -[DEVariable type](v5, "type");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v20 = objc_msgSend(v19, "isEqualToString:", CFSTR("dialog.Object"));

        if ((v20 & 1) != 0)
        {
          v14 = off_1E7924808;
        }
        else
        {
          -[DEVariable type](v5, "type");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          v22 = objc_msgSend(v21, "isEqualToString:", CFSTR("dialog.Array"));

          if (!v22)
          {
            v23 = v5;
            goto LABEL_21;
          }
          v14 = off_1E79247F0;
        }
      }
    }
  }
  v23 = (DEVariable *)objc_msgSend(objc_alloc(*v14), "initWithSharedPtr:", a3);
LABEL_21:
  v24 = v23;

  return v24;
}

- (void)getSharedPtr
{
  return &self->_This;
}

- (NSString)name
{
  void *v2;
  __int128 v3;
  std::string *v4;
  void *v5;
  unint64_t *p_shared_owners;
  unint64_t v7;
  uint64_t v9;
  std::__shared_weak_count *v10;
  std::string v11;

  v2 = (void *)MEMORY[0x1E0CB3940];
  -[DEVariable This](self, "This");
  if (*(char *)(v9 + 31) < 0)
  {
    std::string::__init_copy_ctor_external(&v11, *(const std::string::value_type **)(v9 + 8), *(_QWORD *)(v9 + 16));
  }
  else
  {
    v3 = *(_OWORD *)(v9 + 8);
    v11.__r_.__value_.__r.__words[2] = *(_QWORD *)(v9 + 24);
    *(_OWORD *)&v11.__r_.__value_.__l.__data_ = v3;
  }
  if ((v11.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
    v4 = &v11;
  else
    v4 = (std::string *)v11.__r_.__value_.__r.__words[0];
  objc_msgSend(v2, "stringWithUTF8String:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (SHIBYTE(v11.__r_.__value_.__r.__words[2]) < 0)
    operator delete(v11.__r_.__value_.__l.__data_);
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
  return (NSString *)v5;
}

- (void)setName:(id)a3
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
  -[DEVariable This](self, "This");
  v5 = v11;
  v6 = objc_retainAutorelease(v4);
  std::string::basic_string[abi:ne180100]<0>(&__str, (char *)objc_msgSend(v6, "UTF8String"));
  std::string::operator=((std::string *)(v5 + 8), &__str);
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

- (NSString)type
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
  -[DEVariable This](self, "This");
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

- (void)setType:(id)a3
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
  -[DEVariable This](self, "This");
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

- (BOOL)isEmpty
{
  char v2;
  unint64_t *p_shared_owners;
  unint64_t v4;
  uint64_t v6;
  std::__shared_weak_count *v7;

  -[DEVariable This](self, "This");
  v2 = (*(uint64_t (**)())(*(_QWORD *)v6 + 32))();
  if (v7)
  {
    p_shared_owners = (unint64_t *)&v7->__shared_owners_;
    do
      v4 = __ldaxr(p_shared_owners);
    while (__stlxr(v4 - 1, p_shared_owners));
    if (!v4)
    {
      ((void (*)())v7->__on_zero_shared)();
      std::__shared_weak_count::__release_weak(v7);
    }
  }
  return v2;
}

- (id)toString:(int)a3
{
  void *v3;
  void *v4;
  std::string *v6;
  void *v7;
  std::__shared_weak_count *v8;
  unint64_t *v9;
  unint64_t v10;
  std::string *v11;
  unint64_t *p_shared_owners;
  uint64_t v13;
  std::__shared_weak_count *v14;
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
  void *__p;
  char v26;
  std::string v27;

  if (a3 == 1)
  {
    v4 = (void *)MEMORY[0x1E0CB3940];
    -[DEVariable This](self, "This");
    (*(void (**)(std::string *__return_ptr))(*(_QWORD *)v13 + 48))(&v15);
    if (SHIBYTE(v15.__r_.__value_.__r.__words[2]) < 0)
      std::string::__init_copy_ctor_external(&v27, v15.__r_.__value_.__l.__data_, v15.__r_.__value_.__l.__size_);
    else
      v27 = v15;
    if ((v27.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
      v11 = &v27;
    else
      v11 = (std::string *)v27.__r_.__value_.__r.__words[0];
    objc_msgSend(v4, "stringWithUTF8String:", v11);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (SHIBYTE(v27.__r_.__value_.__r.__words[2]) < 0)
      operator delete(v27.__r_.__value_.__l.__data_);
    if (v26 < 0)
      operator delete(__p);
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
    v8 = v14;
    if (!v14)
      return v7;
    p_shared_owners = (unint64_t *)&v14->__shared_owners_;
    do
      v10 = __ldaxr(p_shared_owners);
    while (__stlxr(v10 - 1, p_shared_owners));
    goto LABEL_55;
  }
  if (a3)
    return &stru_1E793AF80;
  v3 = (void *)MEMORY[0x1E0CB3940];
  -[DEVariable This](self, "This");
  (*(void (**)(std::string *__return_ptr))(*(_QWORD *)v13 + 48))(&v15);
  if (SHIBYTE(v16.__r_.__value_.__r.__words[2]) < 0)
    std::string::__init_copy_ctor_external(&v27, v16.__r_.__value_.__l.__data_, v16.__r_.__value_.__l.__size_);
  else
    v27 = v16;
  if ((v27.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
    v6 = &v27;
  else
    v6 = (std::string *)v27.__r_.__value_.__r.__words[0];
  objc_msgSend(v3, "stringWithUTF8String:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (SHIBYTE(v27.__r_.__value_.__r.__words[2]) < 0)
    operator delete(v27.__r_.__value_.__l.__data_);
  if (v26 < 0)
    operator delete(__p);
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
  v8 = v14;
  if (v14)
  {
    v9 = (unint64_t *)&v14->__shared_owners_;
    do
      v10 = __ldaxr(v9);
    while (__stlxr(v10 - 1, v9));
LABEL_55:
    if (!v10)
    {
      ((void (*)(std::__shared_weak_count *))v8->__on_zero_shared)(v8);
      std::__shared_weak_count::__release_weak(v8);
    }
  }
  return v7;
}

- (shared_ptr<siri::dialogengine::Variable>)This
{
  void *v2;
  Variable *v3;
  __shared_weak_count *v4;
  shared_ptr<siri::dialogengine::Variable> result;

  objc_copyCppObjectAtomic(v2, &self->_This, (void (__cdecl *)(void *, const void *))__copy_helper_atomic_property__25474);
  result.__cntrl_ = v4;
  result.__ptr_ = v3;
  return result;
}

- (void)setThis:(shared_ptr<siri::dialogengine::Variable>)a3
{
  objc_copyCppObjectAtomic(&self->_This, a3.__ptr_, (void (__cdecl *)(void *, const void *))__assign_helper_atomic_property__25473);
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
