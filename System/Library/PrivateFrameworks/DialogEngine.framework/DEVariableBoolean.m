@implementation DEVariableBoolean

- (DEVariableBoolean)init
{
  DEVariableBoolean *v2;
  _QWORD *v3;
  std::__shared_weak_count *v4;
  unint64_t *v5;
  unint64_t v6;
  __int128 v8;
  __int128 v9;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)DEVariableBoolean;
  v2 = -[DEVariable init](&v10, sel_init);
  if (v2)
  {
    v3 = operator new(0x60uLL);
    v3[1] = 0;
    v3[2] = 0;
    *v3 = &off_1E793A478;
    *(_QWORD *)&v8 = siri::dialogengine::VariableBoolean::VariableBoolean((siri::dialogengine::VariableBoolean *)(v3 + 3));
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

- (DEVariableBoolean)initWithSharedPtr:(void *)a3
{
  DEVariableBoolean *v4;
  DEVariableBoolean *v5;
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
  v15.super_class = (Class)DEVariableBoolean;
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

- (DEVariableBoolean)initWithName:(id)a3 value:(BOOL)a4
{
  id v6;
  DEVariableBoolean *v7;
  _QWORD *v8;
  std::__shared_weak_count *v9;
  unint64_t *v10;
  unint64_t v11;
  std::__shared_weak_count *v12;
  unint64_t *v13;
  unint64_t v14;
  std::string __p;
  __int128 v17;
  __int128 v18;
  objc_super v19;

  v6 = a3;
  v19.receiver = self;
  v19.super_class = (Class)DEVariableBoolean;
  v7 = -[DEVariable init](&v19, sel_init);
  if (v7)
  {
    std::string::basic_string[abi:ne180100]<0>(&__p, (char *)objc_msgSend(objc_retainAutorelease(v6), "UTF8String"));
    v8 = operator new(0x60uLL);
    v8[1] = 0;
    v8[2] = 0;
    *v8 = &off_1E793A478;
    *(_QWORD *)&v17 = siri::dialogengine::VariableBoolean::VariableBoolean((uint64_t)(v8 + 3), &__p, a4);
    *((_QWORD *)&v17 + 1) = v8;
    v18 = v17;
    v17 = 0uLL;
    -[DEVariable setThis:](v7, "setThis:", &v18);
    v9 = (std::__shared_weak_count *)*((_QWORD *)&v18 + 1);
    if (*((_QWORD *)&v18 + 1))
    {
      v10 = (unint64_t *)(*((_QWORD *)&v18 + 1) + 8);
      do
        v11 = __ldaxr(v10);
      while (__stlxr(v11 - 1, v10));
      if (!v11)
      {
        ((void (*)(std::__shared_weak_count *))v9->__on_zero_shared)(v9);
        std::__shared_weak_count::__release_weak(v9);
      }
    }
    v12 = (std::__shared_weak_count *)*((_QWORD *)&v17 + 1);
    if (*((_QWORD *)&v17 + 1))
    {
      v13 = (unint64_t *)(*((_QWORD *)&v17 + 1) + 8);
      do
        v14 = __ldaxr(v13);
      while (__stlxr(v14 - 1, v13));
      if (!v14)
      {
        ((void (*)(std::__shared_weak_count *))v12->__on_zero_shared)(v12);
        std::__shared_weak_count::__release_weak(v12);
      }
    }
    if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
      operator delete(__p.__r_.__value_.__l.__data_);
  }

  return v7;
}

- (BOOL)getValue
{
  _BYTE *v2;
  std::__shared_weak_count *v3;
  unint64_t *p_shared_owners;
  unint64_t v5;
  unint64_t *v6;
  unint64_t v7;
  unint64_t *v8;
  unint64_t v9;
  void *lpsrc;
  std::__shared_weak_count *v12;

  -[DEVariable This](self, "This");
  if (!lpsrc)
  {
    v2 = 0;
    goto LABEL_8;
  }
  if (!v2)
  {
LABEL_8:
    v3 = 0;
    goto LABEL_9;
  }
  v3 = v12;
  if (v12)
  {
    p_shared_owners = (unint64_t *)&v12->__shared_owners_;
    do
      v5 = __ldxr(p_shared_owners);
    while (__stxr(v5 + 1, p_shared_owners));
  }
LABEL_9:
  if (v12)
  {
    v6 = (unint64_t *)&v12->__shared_owners_;
    do
      v7 = __ldaxr(v6);
    while (__stlxr(v7 - 1, v6));
    if (!v7)
    {
      ((void (*)())v12->__on_zero_shared)();
      std::__shared_weak_count::__release_weak(v12);
      if (!v2)
        goto LABEL_15;
      goto LABEL_14;
    }
  }
  if (v2)
LABEL_14:
    LOBYTE(v2) = v2[66] != 0;
LABEL_15:
  if (v3)
  {
    v8 = (unint64_t *)&v3->__shared_owners_;
    do
      v9 = __ldaxr(v8);
    while (__stlxr(v9 - 1, v8));
    if (!v9)
    {
      ((void (*)(std::__shared_weak_count *))v3->__on_zero_shared)(v3);
      std::__shared_weak_count::__release_weak(v3);
    }
  }
  return (char)v2;
}

- (void)setValue:(BOOL)a3
{
  _BYTE *v4;
  std::__shared_weak_count *v5;
  unint64_t *p_shared_owners;
  unint64_t v7;
  unint64_t *v8;
  unint64_t v9;
  unint64_t *v10;
  unint64_t v11;
  void *lpsrc;
  std::__shared_weak_count *v13;

  -[DEVariable This](self, "This");
  if (!lpsrc)
  {
    v4 = 0;
    goto LABEL_8;
  }
  if (!v4)
  {
LABEL_8:
    v5 = 0;
    goto LABEL_9;
  }
  v5 = v13;
  if (v13)
  {
    p_shared_owners = (unint64_t *)&v13->__shared_owners_;
    do
      v7 = __ldxr(p_shared_owners);
    while (__stxr(v7 + 1, p_shared_owners));
  }
LABEL_9:
  if (v13)
  {
    v8 = (unint64_t *)&v13->__shared_owners_;
    do
      v9 = __ldaxr(v8);
    while (__stlxr(v9 - 1, v8));
    if (!v9)
    {
      ((void (*)())v13->__on_zero_shared)();
      std::__shared_weak_count::__release_weak(v13);
    }
  }
  v4[66] = a3;
  if (v5)
  {
    v10 = (unint64_t *)&v5->__shared_owners_;
    do
      v11 = __ldaxr(v10);
    while (__stlxr(v11 - 1, v10));
    if (!v11)
    {
      ((void (*)(std::__shared_weak_count *))v5->__on_zero_shared)(v5);
      std::__shared_weak_count::__release_weak(v5);
    }
  }
}

@end
