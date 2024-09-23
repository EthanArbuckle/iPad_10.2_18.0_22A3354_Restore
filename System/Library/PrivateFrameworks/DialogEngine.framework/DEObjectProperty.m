@implementation DEObjectProperty

- (DEObjectProperty)init
{
  DEObjectProperty *v2;
  DEObjectProperty *v3;
  std::__shared_weak_count *v4;
  unint64_t *p_shared_owners;
  unint64_t v6;
  void *v8[30];
  char v9;
  uint64_t v10;
  std::__shared_weak_count *v11;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)DEObjectProperty;
  v2 = -[DEObjectProperty init](&v12, sel_init);
  v3 = v2;
  if (v2)
  {
    v10 = 0;
    v11 = 0;
    -[DEObjectProperty setThisShared:](v2, "setThisShared:", &v10);
    v4 = v11;
    if (v11)
    {
      p_shared_owners = (unint64_t *)&v11->__shared_owners_;
      do
        v6 = __ldaxr(p_shared_owners);
      while (__stlxr(v6 - 1, p_shared_owners));
      if (!v6)
      {
        ((void (*)(std::__shared_weak_count *))v4->__on_zero_shared)(v4);
        std::__shared_weak_count::__release_weak(v4);
      }
    }
    LOBYTE(v8[0]) = 0;
    v9 = 0;
    -[DEObjectProperty setThis:](v3, "setThis:", v8);
    if (v9)
      siri::dialogengine::ObjectProperty::~ObjectProperty(v8);
  }
  return v3;
}

- (DEObjectProperty)initWithOpt:(const void *)a3
{
  DEObjectProperty *v4;
  DEObjectProperty *v5;
  std::__shared_weak_count *v6;
  unint64_t *p_shared_owners;
  unint64_t v8;
  void *v10[30];
  char v11;
  uint64_t v12;
  std::__shared_weak_count *v13;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)DEObjectProperty;
  v4 = -[DEObjectProperty init](&v14, sel_init);
  v5 = v4;
  if (v4)
  {
    v12 = 0;
    v13 = 0;
    -[DEObjectProperty setThisShared:](v4, "setThisShared:", &v12);
    v6 = v13;
    if (v13)
    {
      p_shared_owners = (unint64_t *)&v13->__shared_owners_;
      do
        v8 = __ldaxr(p_shared_owners);
      while (__stlxr(v8 - 1, p_shared_owners));
      if (!v8)
      {
        ((void (*)(std::__shared_weak_count *))v6->__on_zero_shared)(v6);
        std::__shared_weak_count::__release_weak(v6);
      }
    }
    std::__optional_copy_base<siri::dialogengine::ObjectProperty,false>::__optional_copy_base[abi:ne180100]((siri::dialogengine::ObjectProperty *)v10, (const siri::dialogengine::ObjectProperty *)a3);
    -[DEObjectProperty setThis:](v5, "setThis:", v10);
    if (v11)
      siri::dialogengine::ObjectProperty::~ObjectProperty(v10);
  }
  return v5;
}

- (DEObjectProperty)initWithSharedPtr:(void *)a3
{
  DEObjectProperty *v4;
  DEObjectProperty *v5;
  std::__shared_weak_count *v6;
  unint64_t *p_shared_owners;
  unint64_t v8;
  std::__shared_weak_count *v9;
  unint64_t *v10;
  unint64_t v11;
  void *v13[30];
  char v14;
  uint64_t v15;
  std::__shared_weak_count *v16;
  objc_super v17;

  v17.receiver = self;
  v17.super_class = (Class)DEObjectProperty;
  v4 = -[DEObjectProperty init](&v17, sel_init);
  v5 = v4;
  if (v4)
  {
    v6 = (std::__shared_weak_count *)*((_QWORD *)a3 + 1);
    v15 = *(_QWORD *)a3;
    v16 = v6;
    if (v6)
    {
      p_shared_owners = (unint64_t *)&v6->__shared_owners_;
      do
        v8 = __ldxr(p_shared_owners);
      while (__stxr(v8 + 1, p_shared_owners));
    }
    -[DEObjectProperty setThisShared:](v4, "setThisShared:", &v15);
    v9 = v16;
    if (v16)
    {
      v10 = (unint64_t *)&v16->__shared_owners_;
      do
        v11 = __ldaxr(v10);
      while (__stlxr(v11 - 1, v10));
      if (!v11)
      {
        ((void (*)(std::__shared_weak_count *))v9->__on_zero_shared)(v9);
        std::__shared_weak_count::__release_weak(v9);
      }
    }
    LOBYTE(v13[0]) = 0;
    v14 = 0;
    -[DEObjectProperty setThis:](v5, "setThis:", v13);
    if (v14)
      siri::dialogengine::ObjectProperty::~ObjectProperty(v13);
  }
  return v5;
}

- (id)sampleValuesForLocale:(id)a3
{
  siri::dialogengine::Log::Error((siri::dialogengine::Log *)"DEObjectProperty.sampleValuesForLocale is deprecated.", a2, a3);
  return (id)objc_opt_new();
}

- (NSArray)sampleValueLocales
{
  siri::dialogengine::Log::Error((siri::dialogengine::Log *)"DEObjectProperty.sampleValueLocales is deprecated.", a2);
  return (NSArray *)(id)objc_opt_new();
}

- (NSString)name
{
  unint64_t *v3;
  unint64_t v4;
  __int128 v5;
  std::string *v6;
  void *v7;
  unint64_t *v9;
  unint64_t v10;
  std::string v11;
  _BYTE v12[224];
  char v13;
  std::string v14;

  memset(&v14, 0, sizeof(v14));
  -[DEObjectProperty This](self, "This");
  if (v13)
  {
    siri::dialogengine::ObjectProperty::~ObjectProperty((void **)v12);
    -[DEObjectProperty This](self, "This");
    if ((v12[31] & 0x80000000) != 0)
      std::string::__init_copy_ctor_external(&v11, *(const std::string::value_type **)&v12[8], *(std::string::size_type *)&v12[16]);
    else
      v11 = *(std::string *)&v12[8];
    v14 = v11;
    *((_BYTE *)&v11.__r_.__value_.__s + 23) = 0;
    v11.__r_.__value_.__s.__data_[0] = 0;
    if (v13)
      siri::dialogengine::ObjectProperty::~ObjectProperty((void **)v12);
  }
  else
  {
    -[DEObjectProperty ThisShared](self, "ThisShared");
    if (!*(_QWORD *)&v12[8])
      goto LABEL_8;
    v3 = (unint64_t *)(*(_QWORD *)&v12[8] + 8);
    do
      v4 = __ldaxr(v3);
    while (__stlxr(v4 - 1, v3));
    if (!v4)
    {
      (*(void (**)(_QWORD))(**(_QWORD **)&v12[8] + 16))(*(_QWORD *)&v12[8]);
      std::__shared_weak_count::__release_weak(*(std::__shared_weak_count **)&v12[8]);
      if (!*(_QWORD *)v12)
        goto LABEL_14;
    }
    else
    {
LABEL_8:
      if (!*(_QWORD *)v12)
        goto LABEL_14;
    }
    -[DEObjectProperty ThisShared](self, "ThisShared");
    if (*(char *)(v11.__r_.__value_.__r.__words[0] + 31) < 0)
    {
      std::string::__init_copy_ctor_external((std::string *)v12, *(const std::string::value_type **)(v11.__r_.__value_.__r.__words[0] + 8), *(_QWORD *)(v11.__r_.__value_.__r.__words[0] + 16));
    }
    else
    {
      v5 = *(_OWORD *)(v11.__r_.__value_.__r.__words[0] + 8);
      *(_QWORD *)&v12[16] = *(_QWORD *)(v11.__r_.__value_.__r.__words[0] + 24);
      *(_OWORD *)v12 = v5;
    }
    if (SHIBYTE(v14.__r_.__value_.__r.__words[2]) < 0)
      operator delete(v14.__r_.__value_.__l.__data_);
    v14 = *(std::string *)v12;
    v12[23] = 0;
    v12[0] = 0;
    if (v11.__r_.__value_.__l.__size_)
    {
      v9 = (unint64_t *)(v11.__r_.__value_.__l.__size_ + 8);
      do
        v10 = __ldaxr(v9);
      while (__stlxr(v10 - 1, v9));
      if (!v10)
      {
        (*(void (**)(std::string::size_type))(*(_QWORD *)v11.__r_.__value_.__l.__size_ + 16))(v11.__r_.__value_.__l.__size_);
        std::__shared_weak_count::__release_weak((std::__shared_weak_count *)v11.__r_.__value_.__l.__size_);
      }
    }
  }
LABEL_14:
  if ((v14.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
    v6 = &v14;
  else
    v6 = (std::string *)v14.__r_.__value_.__r.__words[0];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", v6, v11.__r_.__value_.__r.__words[0]);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (SHIBYTE(v14.__r_.__value_.__r.__words[2]) < 0)
    operator delete(v14.__r_.__value_.__l.__data_);
  return (NSString *)v7;
}

- (NSString)type
{
  unint64_t *v3;
  unint64_t v4;
  std::string *v5;
  void *v6;
  unint64_t *v8;
  unint64_t v9;
  std::string v10;
  std::string v11;
  std::string v12;
  char v13;
  std::string v14;

  memset(&v14, 0, sizeof(v14));
  -[DEObjectProperty This](self, "This");
  if (v13)
  {
    siri::dialogengine::ObjectProperty::~ObjectProperty((void **)&v11.__r_.__value_.__l.__data_);
    -[DEObjectProperty This](self, "This");
    if (SHIBYTE(v12.__r_.__value_.__r.__words[2]) < 0)
      std::string::__init_copy_ctor_external(&v10, v12.__r_.__value_.__l.__data_, v12.__r_.__value_.__l.__size_);
    else
      v10 = v12;
    v14 = v10;
    *((_BYTE *)&v10.__r_.__value_.__s + 23) = 0;
    v10.__r_.__value_.__s.__data_[0] = 0;
    if (v13)
      siri::dialogengine::ObjectProperty::~ObjectProperty((void **)&v11.__r_.__value_.__l.__data_);
  }
  else
  {
    -[DEObjectProperty ThisShared](self, "ThisShared");
    if (!v11.__r_.__value_.__l.__size_)
      goto LABEL_8;
    v3 = (unint64_t *)(v11.__r_.__value_.__l.__size_ + 8);
    do
      v4 = __ldaxr(v3);
    while (__stlxr(v4 - 1, v3));
    if (!v4)
    {
      (*(void (**)(std::string::size_type))(*(_QWORD *)v11.__r_.__value_.__l.__size_ + 16))(v11.__r_.__value_.__l.__size_);
      std::__shared_weak_count::__release_weak((std::__shared_weak_count *)v11.__r_.__value_.__l.__size_);
      if (!v11.__r_.__value_.__r.__words[0])
        goto LABEL_14;
    }
    else
    {
LABEL_8:
      if (!v11.__r_.__value_.__r.__words[0])
        goto LABEL_14;
    }
    -[DEObjectProperty ThisShared](self, "ThisShared");
    if (*(char *)(v10.__r_.__value_.__r.__words[0] + 55) < 0)
      std::string::__init_copy_ctor_external(&v11, *(const std::string::value_type **)(v10.__r_.__value_.__r.__words[0] + 32), *(_QWORD *)(v10.__r_.__value_.__r.__words[0] + 40));
    else
      v11 = *(std::string *)(v10.__r_.__value_.__r.__words[0] + 32);
    if (SHIBYTE(v14.__r_.__value_.__r.__words[2]) < 0)
      operator delete(v14.__r_.__value_.__l.__data_);
    v14 = v11;
    *((_BYTE *)&v11.__r_.__value_.__s + 23) = 0;
    v11.__r_.__value_.__s.__data_[0] = 0;
    if (v10.__r_.__value_.__l.__size_)
    {
      v8 = (unint64_t *)(v10.__r_.__value_.__l.__size_ + 8);
      do
        v9 = __ldaxr(v8);
      while (__stlxr(v9 - 1, v8));
      if (!v9)
      {
        (*(void (**)(std::string::size_type))(*(_QWORD *)v10.__r_.__value_.__l.__size_ + 16))(v10.__r_.__value_.__l.__size_);
        std::__shared_weak_count::__release_weak((std::__shared_weak_count *)v10.__r_.__value_.__l.__size_);
      }
    }
  }
LABEL_14:
  if ((v14.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
    v5 = &v14;
  else
    v5 = (std::string *)v14.__r_.__value_.__r.__words[0];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", v5, v10.__r_.__value_.__r.__words[0]);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (SHIBYTE(v14.__r_.__value_.__r.__words[2]) < 0)
    operator delete(v14.__r_.__value_.__l.__data_);
  return (NSString *)v6;
}

- (NSString)description
{
  unint64_t *v3;
  unint64_t v4;
  std::string *v5;
  void *v6;
  unint64_t *v8;
  unint64_t v9;
  std::string v10;
  std::string v11;
  std::string v12;
  char v13;
  std::string v14;

  memset(&v14, 0, sizeof(v14));
  -[DEObjectProperty This](self, "This");
  if (v13)
  {
    siri::dialogengine::ObjectProperty::~ObjectProperty((void **)&v11.__r_.__value_.__l.__data_);
    -[DEObjectProperty This](self, "This");
    if (SHIBYTE(v12.__r_.__value_.__r.__words[2]) < 0)
      std::string::__init_copy_ctor_external(&v10, v12.__r_.__value_.__l.__data_, v12.__r_.__value_.__l.__size_);
    else
      v10 = v12;
    v14 = v10;
    *((_BYTE *)&v10.__r_.__value_.__s + 23) = 0;
    v10.__r_.__value_.__s.__data_[0] = 0;
    if (v13)
      siri::dialogengine::ObjectProperty::~ObjectProperty((void **)&v11.__r_.__value_.__l.__data_);
  }
  else
  {
    -[DEObjectProperty ThisShared](self, "ThisShared");
    if (!v11.__r_.__value_.__l.__size_)
      goto LABEL_8;
    v3 = (unint64_t *)(v11.__r_.__value_.__l.__size_ + 8);
    do
      v4 = __ldaxr(v3);
    while (__stlxr(v4 - 1, v3));
    if (!v4)
    {
      (*(void (**)(std::string::size_type))(*(_QWORD *)v11.__r_.__value_.__l.__size_ + 16))(v11.__r_.__value_.__l.__size_);
      std::__shared_weak_count::__release_weak((std::__shared_weak_count *)v11.__r_.__value_.__l.__size_);
      if (!v11.__r_.__value_.__r.__words[0])
        goto LABEL_14;
    }
    else
    {
LABEL_8:
      if (!v11.__r_.__value_.__r.__words[0])
        goto LABEL_14;
    }
    -[DEObjectProperty ThisShared](self, "ThisShared");
    if (*(char *)(v10.__r_.__value_.__r.__words[0] + 79) < 0)
      std::string::__init_copy_ctor_external(&v11, *(const std::string::value_type **)(v10.__r_.__value_.__r.__words[0] + 56), *(_QWORD *)(v10.__r_.__value_.__r.__words[0] + 64));
    else
      v11 = *(std::string *)(v10.__r_.__value_.__r.__words[0] + 56);
    if (SHIBYTE(v14.__r_.__value_.__r.__words[2]) < 0)
      operator delete(v14.__r_.__value_.__l.__data_);
    v14 = v11;
    *((_BYTE *)&v11.__r_.__value_.__s + 23) = 0;
    v11.__r_.__value_.__s.__data_[0] = 0;
    if (v10.__r_.__value_.__l.__size_)
    {
      v8 = (unint64_t *)(v10.__r_.__value_.__l.__size_ + 8);
      do
        v9 = __ldaxr(v8);
      while (__stlxr(v9 - 1, v8));
      if (!v9)
      {
        (*(void (**)(std::string::size_type))(*(_QWORD *)v10.__r_.__value_.__l.__size_ + 16))(v10.__r_.__value_.__l.__size_);
        std::__shared_weak_count::__release_weak((std::__shared_weak_count *)v10.__r_.__value_.__l.__size_);
      }
    }
  }
LABEL_14:
  if ((v14.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
    v5 = &v14;
  else
    v5 = (std::string *)v14.__r_.__value_.__r.__words[0];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", v5, v10.__r_.__value_.__r.__words[0]);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (SHIBYTE(v14.__r_.__value_.__r.__words[2]) < 0)
    operator delete(v14.__r_.__value_.__l.__data_);
  return (NSString *)v6;
}

- (NSString)semanticConcept
{
  unint64_t *v3;
  unint64_t v4;
  std::string *v5;
  void *v6;
  unint64_t *v8;
  unint64_t v9;
  std::string v10;
  std::string v11;
  std::string v12;
  char v13;
  std::string v14;

  memset(&v14, 0, sizeof(v14));
  -[DEObjectProperty This](self, "This");
  if (v13)
  {
    siri::dialogengine::ObjectProperty::~ObjectProperty((void **)&v11.__r_.__value_.__l.__data_);
    -[DEObjectProperty This](self, "This");
    if (SHIBYTE(v12.__r_.__value_.__r.__words[2]) < 0)
      std::string::__init_copy_ctor_external(&v10, v12.__r_.__value_.__l.__data_, v12.__r_.__value_.__l.__size_);
    else
      v10 = v12;
    v14 = v10;
    *((_BYTE *)&v10.__r_.__value_.__s + 23) = 0;
    v10.__r_.__value_.__s.__data_[0] = 0;
    if (v13)
      siri::dialogengine::ObjectProperty::~ObjectProperty((void **)&v11.__r_.__value_.__l.__data_);
  }
  else
  {
    -[DEObjectProperty ThisShared](self, "ThisShared");
    if (!v11.__r_.__value_.__l.__size_)
      goto LABEL_8;
    v3 = (unint64_t *)(v11.__r_.__value_.__l.__size_ + 8);
    do
      v4 = __ldaxr(v3);
    while (__stlxr(v4 - 1, v3));
    if (!v4)
    {
      (*(void (**)(std::string::size_type))(*(_QWORD *)v11.__r_.__value_.__l.__size_ + 16))(v11.__r_.__value_.__l.__size_);
      std::__shared_weak_count::__release_weak((std::__shared_weak_count *)v11.__r_.__value_.__l.__size_);
      if (!v11.__r_.__value_.__r.__words[0])
        goto LABEL_14;
    }
    else
    {
LABEL_8:
      if (!v11.__r_.__value_.__r.__words[0])
        goto LABEL_14;
    }
    -[DEObjectProperty ThisShared](self, "ThisShared");
    if (*(char *)(v10.__r_.__value_.__r.__words[0] + 183) < 0)
      std::string::__init_copy_ctor_external(&v11, *(const std::string::value_type **)(v10.__r_.__value_.__r.__words[0] + 160), *(_QWORD *)(v10.__r_.__value_.__r.__words[0] + 168));
    else
      v11 = *(std::string *)(v10.__r_.__value_.__r.__words[0] + 160);
    if (SHIBYTE(v14.__r_.__value_.__r.__words[2]) < 0)
      operator delete(v14.__r_.__value_.__l.__data_);
    v14 = v11;
    *((_BYTE *)&v11.__r_.__value_.__s + 23) = 0;
    v11.__r_.__value_.__s.__data_[0] = 0;
    if (v10.__r_.__value_.__l.__size_)
    {
      v8 = (unint64_t *)(v10.__r_.__value_.__l.__size_ + 8);
      do
        v9 = __ldaxr(v8);
      while (__stlxr(v9 - 1, v8));
      if (!v9)
      {
        (*(void (**)(std::string::size_type))(*(_QWORD *)v10.__r_.__value_.__l.__size_ + 16))(v10.__r_.__value_.__l.__size_);
        std::__shared_weak_count::__release_weak((std::__shared_weak_count *)v10.__r_.__value_.__l.__size_);
      }
    }
  }
LABEL_14:
  if ((v14.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
    v5 = &v14;
  else
    v5 = (std::string *)v14.__r_.__value_.__r.__words[0];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", v5, v10.__r_.__value_.__r.__words[0]);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (SHIBYTE(v14.__r_.__value_.__r.__words[2]) < 0)
    operator delete(v14.__r_.__value_.__l.__data_);
  return (NSString *)v6;
}

- (shared_ptr<siri::dialogengine::ObjectProperty>)ThisShared
{
  void *v2;
  ObjectProperty *v3;
  __shared_weak_count *v4;
  shared_ptr<siri::dialogengine::ObjectProperty> result;

  objc_copyCppObjectAtomic(v2, &self->_ThisShared, (void (__cdecl *)(void *, const void *))__copy_helper_atomic_property__2751);
  result.__cntrl_ = v4;
  result.__ptr_ = v3;
  return result;
}

- (void)setThisShared:(shared_ptr<siri::dialogengine::ObjectProperty>)a3
{
  objc_copyCppObjectAtomic(&self->_ThisShared, a3.__ptr_, (void (__cdecl *)(void *, const void *))__assign_helper_atomic_property__2750);
}

- (optional<siri::dialogengine::ObjectProperty>)This
{
  uint64_t v1;
  optional<siri::dialogengine::ObjectProperty> *result;

  objc_copyCppObjectAtomic(retstr, (const void *)(v1 + 24), (void (__cdecl *)(void *, const void *))__copy_helper_atomic_property__3);
  return result;
}

- (void)setThis:(optional<siri::dialogengine::ObjectProperty> *)a3
{
  objc_copyCppObjectAtomic(&self->_This, a3, (void (__cdecl *)(void *, const void *))__assign_helper_atomic_property__4);
}

- (void).cxx_destruct
{
  if (LOBYTE(self[3].super.isa))
    siri::dialogengine::ObjectProperty::~ObjectProperty((void **)&self->_This);
  std::shared_ptr<siri::dialogengine::VisualComponentsCombination::Entry>::~shared_ptr[abi:ne180100]((uint64_t)&self->_ThisShared);
}

- (id).cxx_construct
{
  *((_BYTE *)self + 264) = 0;
  *((_QWORD *)self + 1) = 0;
  *((_QWORD *)self + 2) = 0;
  *((_BYTE *)self + 24) = 0;
  return self;
}

@end
