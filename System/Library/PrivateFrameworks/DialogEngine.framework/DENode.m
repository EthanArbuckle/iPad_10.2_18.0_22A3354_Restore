@implementation DENode

- (DENode)init
{
  DENode *v2;
  _OWORD *v3;
  std::__shared_weak_count *v4;
  unint64_t *p_shared_owners;
  unint64_t v6;
  char *v8;
  std::__shared_weak_count *v9;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)DENode;
  v2 = -[DENode init](&v10, sel_init);
  if (v2)
  {
    v3 = operator new(0xE8uLL);
    *(_OWORD *)((char *)v3 + 8) = 0u;
    *(_QWORD *)v3 = &off_1E792D260;
    *(_OWORD *)((char *)v3 + 216) = 0u;
    v3[2] = 0u;
    v3[3] = 0u;
    v3[4] = 0u;
    *(_OWORD *)((char *)v3 + 104) = 0u;
    *((_QWORD *)v3 + 12) = (char *)v3 + 104;
    *((_QWORD *)v3 + 3) = off_1E793A6B0;
    *((_QWORD *)v3 + 10) = 0;
    *((_QWORD *)v3 + 11) = &unk_1E793A708;
    *(_OWORD *)((char *)v3 + 120) = 0u;
    *(_OWORD *)((char *)v3 + 136) = 0u;
    *(_OWORD *)((char *)v3 + 152) = 0u;
    *(_OWORD *)((char *)v3 + 168) = 0u;
    *(_OWORD *)((char *)v3 + 184) = 0u;
    *(_OWORD *)((char *)v3 + 200) = 0u;
    *((_DWORD *)v3 + 54) = 1065353216;
    v8 = (char *)v3 + 24;
    v9 = (std::__shared_weak_count *)v3;
    -[DENode setThis:](v2, "setThis:", &v8);
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

- (DENode)initWithSharedPtr:(shared_ptr<siri::dialogengine::Node>)a3
{
  Node *ptr;
  DENode *v4;
  DENode *v5;
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
  v15.super_class = (Class)DENode;
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
    -[DENode setThis:](v4, "setThis:", &v13);
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

- (shared_ptr<siri::dialogengine::Node>)getSharedPtr
{
  Node **v2;
  __shared_weak_count *cntrl;
  unint64_t *v4;
  unint64_t v5;
  shared_ptr<siri::dialogengine::Node> result;

  cntrl = self->_This.__cntrl_;
  *v2 = self->_This.__ptr_;
  v2[1] = (Node *)cntrl;
  if (cntrl)
  {
    v4 = (unint64_t *)((char *)cntrl + 8);
    do
      v5 = __ldxr(v4);
    while (__stxr(v5 + 1, v4));
  }
  result.__cntrl_ = (__shared_weak_count *)a2;
  result.__ptr_ = (Node *)self;
  return result;
}

- (BOOL)isOfType:(unint64_t)a3
{
  unint64_t *p_shared_owners;
  unint64_t v4;
  unint64_t v5;
  char v6;
  unint64_t *v7;
  unint64_t v8;
  unint64_t v9;
  unint64_t *v10;
  unint64_t v11;
  unint64_t v12;
  unint64_t *v13;
  unint64_t v14;
  unint64_t v15;
  unint64_t *v16;
  unint64_t v17;
  unint64_t v18;
  BOOL v19;
  std::__shared_weak_count *v20;
  unint64_t *v21;
  unint64_t v22;
  unint64_t *v23;
  unint64_t *v24;
  unint64_t *v25;
  unint64_t *v27;
  unint64_t v28;
  void *lpsrc;
  std::__shared_weak_count *v30;

  switch(a3)
  {
    case 1uLL:
      -[DENode This](self, "This");
      if (lpsrc
      {
        if (v30)
        {
          p_shared_owners = (unint64_t *)&v30->__shared_owners_;
          do
            v4 = __ldxr(p_shared_owners);
          while (__stxr(v4 + 1, p_shared_owners));
          do
            v5 = __ldaxr(p_shared_owners);
          while (__stlxr(v5 - 1, p_shared_owners));
          if (!v5)
          {
            ((void (*)())v30->__on_zero_shared)();
            std::__shared_weak_count::__release_weak(v30);
          }
        }
        v6 = 1;
      }
      else
      {
        v6 = 0;
      }
      v20 = v30;
      if (!v30)
        return (v6 & 1) != 0;
      v21 = (unint64_t *)&v30->__shared_owners_;
      do
        v22 = __ldaxr(v21);
      while (__stlxr(v22 - 1, v21));
      break;
    case 2uLL:
      -[DENode This](self, "This");
      if (lpsrc
      {
        if (v30)
        {
          v7 = (unint64_t *)&v30->__shared_owners_;
          do
            v8 = __ldxr(v7);
          while (__stxr(v8 + 1, v7));
          do
            v9 = __ldaxr(v7);
          while (__stlxr(v9 - 1, v7));
          if (!v9)
          {
            ((void (*)())v30->__on_zero_shared)();
            std::__shared_weak_count::__release_weak(v30);
          }
        }
        v6 = 1;
      }
      else
      {
        v6 = 0;
      }
      v20 = v30;
      if (!v30)
        return (v6 & 1) != 0;
      v23 = (unint64_t *)&v30->__shared_owners_;
      do
        v22 = __ldaxr(v23);
      while (__stlxr(v22 - 1, v23));
      break;
    case 3uLL:
      -[DENode This](self, "This");
      if (lpsrc
      {
        if (v30)
        {
          v10 = (unint64_t *)&v30->__shared_owners_;
          do
            v11 = __ldxr(v10);
          while (__stxr(v11 + 1, v10));
          do
            v12 = __ldaxr(v10);
          while (__stlxr(v12 - 1, v10));
          if (!v12)
          {
            ((void (*)())v30->__on_zero_shared)();
            std::__shared_weak_count::__release_weak(v30);
          }
        }
        v6 = 1;
      }
      else
      {
        v6 = 0;
      }
      v20 = v30;
      if (!v30)
        return (v6 & 1) != 0;
      v24 = (unint64_t *)&v30->__shared_owners_;
      do
        v22 = __ldaxr(v24);
      while (__stlxr(v22 - 1, v24));
      break;
    case 4uLL:
      -[DENode This](self, "This");
      if (lpsrc
      {
        if (v30)
        {
          v13 = (unint64_t *)&v30->__shared_owners_;
          do
            v14 = __ldxr(v13);
          while (__stxr(v14 + 1, v13));
          do
            v15 = __ldaxr(v13);
          while (__stlxr(v15 - 1, v13));
          if (!v15)
          {
            ((void (*)())v30->__on_zero_shared)();
            std::__shared_weak_count::__release_weak(v30);
          }
        }
        v6 = 1;
      }
      else
      {
        v6 = 0;
      }
      v20 = v30;
      if (!v30)
        return (v6 & 1) != 0;
      v25 = (unint64_t *)&v30->__shared_owners_;
      do
        v22 = __ldaxr(v25);
      while (__stlxr(v22 - 1, v25));
      break;
    case 5uLL:
      -[DENode This](self, "This");
      if (lpsrc
      {
        if (v30)
        {
          v16 = (unint64_t *)&v30->__shared_owners_;
          do
            v17 = __ldxr(v16);
          while (__stxr(v17 + 1, v16));
          do
            v18 = __ldaxr(v16);
          while (__stlxr(v18 - 1, v16));
          if (!v18)
          {
            ((void (*)())v30->__on_zero_shared)();
            std::__shared_weak_count::__release_weak(v30);
          }
        }
        v19 = 1;
      }
      else
      {
        v19 = 0;
      }
      if (v30)
      {
        v27 = (unint64_t *)&v30->__shared_owners_;
        do
          v28 = __ldaxr(v27);
        while (__stlxr(v28 - 1, v27));
        if (!v28)
        {
          ((void (*)())v30->__on_zero_shared)();
          std::__shared_weak_count::__release_weak(v30);
        }
      }
      return v19;
    default:
      return 0;
  }
  if (!v22)
  {
    ((void (*)(std::__shared_weak_count *))v20->__on_zero_shared)(v20);
    std::__shared_weak_count::__release_weak(v20);
    return (v6 & 1) != 0;
  }
  return (v6 & 1) != 0;
}

- (id)getDialog
{
  void *v2;
  uint64_t *p_shared_owners;
  unint64_t v4;
  uint64_t *v5;
  unint64_t v6;
  DEDialog *v7;
  unint64_t *v8;
  unint64_t v9;
  DEDialog *v10;
  std::__shared_weak_count *v11;
  unint64_t *v12;
  unint64_t v13;
  std::__shared_weak_count *v14;
  unint64_t *v15;
  unint64_t v16;
  void *v18;
  std::__shared_weak_count *v19;
  void *lpsrc;
  std::__shared_weak_count *v21;
  void *v22;
  std::__shared_weak_count *v23;

  -[DENode This](self, "This");
  if (lpsrc
  {
    v22 = v2;
    v23 = v21;
    if (v21)
    {
      p_shared_owners = &v21->__shared_owners_;
      do
        v4 = __ldxr((unint64_t *)p_shared_owners);
      while (__stxr(v4 + 1, (unint64_t *)p_shared_owners));
    }
  }
  else
  {
    v22 = 0;
    v23 = 0;
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
  v7 = [DEDialog alloc];
  v18 = v22;
  v19 = v23;
  if (v23)
  {
    v8 = (unint64_t *)&v23->__shared_owners_;
    do
      v9 = __ldxr(v8);
    while (__stxr(v9 + 1, v8));
  }
  v10 = -[DEDialog initWithSharedPtr:](v7, "initWithSharedPtr:", &v18);
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

- (NSString)conditionName
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
  -[DENode This](self, "This");
  if (*(char *)(v8 + 143) < 0)
    std::string::__init_copy_ctor_external(&v10, *(const std::string::value_type **)(v8 + 120), *(_QWORD *)(v8 + 128));
  else
    v10 = *(std::string *)(v8 + 120);
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

- (void)setConditionName:(id)a3
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
  -[DENode This](self, "This");
  v5 = v11;
  v6 = objc_retainAutorelease(v4);
  std::string::basic_string[abi:ne180100]<0>(&__str, (char *)objc_msgSend(v6, "UTF8String"));
  std::string::operator=(v5 + 5, &__str);
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

- (id)getGlobalId:(id)a3
{
  id v4;
  void *v5;
  std::string *p_p;
  void *v7;
  std::__shared_weak_count *v8;
  unint64_t *p_shared_owners;
  unint64_t v10;
  siri::dialogengine::Node *v12;
  std::__shared_weak_count *v13;
  std::string __p;

  v4 = a3;
  v5 = (void *)MEMORY[0x1E0CB3940];
  -[DENode This](self, "This");
  siri::dialogengine::Node::GetGlobalId(v12, (siri::dialogengine::Context *)objc_msgSend(v4, "This"), &__p);
  if ((__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
    p_p = &__p;
  else
    p_p = (std::string *)__p.__r_.__value_.__r.__words[0];
  objc_msgSend(v5, "stringWithUTF8String:", p_p);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
    operator delete(__p.__r_.__value_.__l.__data_);
  v8 = v13;
  if (v13)
  {
    p_shared_owners = (unint64_t *)&v13->__shared_owners_;
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

- (shared_ptr<siri::dialogengine::Node>)This
{
  void *v2;
  Node *v3;
  __shared_weak_count *v4;
  shared_ptr<siri::dialogengine::Node> result;

  objc_copyCppObjectAtomic(v2, &self->_This, (void (__cdecl *)(void *, const void *))__copy_helper_atomic_property__1807);
  result.__cntrl_ = v4;
  result.__ptr_ = v3;
  return result;
}

- (void)setThis:(shared_ptr<siri::dialogengine::Node>)a3
{
  objc_copyCppObjectAtomic(&self->_This, a3.__ptr_, (void (__cdecl *)(void *, const void *))__assign_helper_atomic_property__1806);
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
