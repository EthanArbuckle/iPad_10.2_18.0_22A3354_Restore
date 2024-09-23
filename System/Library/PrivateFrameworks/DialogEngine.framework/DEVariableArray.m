@implementation DEVariableArray

- (DEVariableArray)init
{
  DEVariableArray *v2;
  _QWORD *v3;
  std::__shared_weak_count *v4;
  unint64_t *v5;
  unint64_t v6;
  __int128 v8;
  __int128 v9;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)DEVariableArray;
  v2 = -[DEVariable init](&v10, sel_init);
  if (v2)
  {
    v3 = operator new(0x78uLL);
    v3[1] = 0;
    v3[2] = 0;
    *v3 = &off_1E79361E0;
    *(_QWORD *)&v8 = siri::dialogengine::VariableArray::VariableArray((siri::dialogengine::VariableArray *)(v3 + 3));
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

- (DEVariableArray)initWithSharedPtr:(void *)a3
{
  DEVariableArray *v4;
  DEVariableArray *v5;
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
  v15.super_class = (Class)DEVariableArray;
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

- (DEVariableArray)initWithName:(id)a3
{
  id v4;
  DEVariableArray *v5;
  _QWORD *v6;
  std::__shared_weak_count *v7;
  unint64_t *v8;
  unint64_t v9;
  std::__shared_weak_count *v10;
  unint64_t *v11;
  unint64_t v12;
  std::string __p;
  __int128 v15;
  __int128 v16;
  objc_super v17;

  v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)DEVariableArray;
  v5 = -[DEVariable init](&v17, sel_init);
  if (v5)
  {
    std::string::basic_string[abi:ne180100]<0>(&__p, (char *)objc_msgSend(objc_retainAutorelease(v4), "UTF8String"));
    v6 = operator new(0x78uLL);
    v6[1] = 0;
    v6[2] = 0;
    *v6 = &off_1E79361E0;
    *(_QWORD *)&v15 = siri::dialogengine::VariableArray::VariableArray(v6 + 3, &__p);
    *((_QWORD *)&v15 + 1) = v6;
    v16 = v15;
    v15 = 0uLL;
    -[DEVariable setThis:](v5, "setThis:", &v16);
    v7 = (std::__shared_weak_count *)*((_QWORD *)&v16 + 1);
    if (*((_QWORD *)&v16 + 1))
    {
      v8 = (unint64_t *)(*((_QWORD *)&v16 + 1) + 8);
      do
        v9 = __ldaxr(v8);
      while (__stlxr(v9 - 1, v8));
      if (!v9)
      {
        ((void (*)(std::__shared_weak_count *))v7->__on_zero_shared)(v7);
        std::__shared_weak_count::__release_weak(v7);
      }
    }
    v10 = (std::__shared_weak_count *)*((_QWORD *)&v15 + 1);
    if (*((_QWORD *)&v15 + 1))
    {
      v11 = (unint64_t *)(*((_QWORD *)&v15 + 1) + 8);
      do
        v12 = __ldaxr(v11);
      while (__stlxr(v12 - 1, v11));
      if (!v12)
      {
        ((void (*)(std::__shared_weak_count *))v10->__on_zero_shared)(v10);
        std::__shared_weak_count::__release_weak(v10);
      }
    }
    if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
      operator delete(__p.__r_.__value_.__l.__data_);
  }

  return v5;
}

- (void)addItem:(id)a3
{
  id v4;
  _QWORD *v5;
  uint64_t *p_shared_owners;
  unint64_t v7;
  uint64_t *v8;
  unint64_t v9;
  _QWORD *v10;
  std::__shared_weak_count *v11;
  unint64_t *v12;
  unint64_t v13;
  unint64_t *v14;
  unint64_t v15;
  std::__shared_weak_count *v16;
  unint64_t *v17;
  unint64_t v18;
  _QWORD v19[2];
  void *lpsrc;
  std::__shared_weak_count *v21;
  _QWORD *v22;
  std::__shared_weak_count *v23;

  v4 = a3;
  -[DEVariable This](self, "This");
  if (lpsrc
  {
    v22 = v5;
    v23 = v21;
    if (v21)
    {
      p_shared_owners = &v21->__shared_owners_;
      do
        v7 = __ldxr((unint64_t *)p_shared_owners);
      while (__stxr(v7 + 1, (unint64_t *)p_shared_owners));
    }
  }
  else
  {
    v22 = 0;
    v23 = 0;
  }
  if (v21)
  {
    v8 = &v21->__shared_owners_;
    do
      v9 = __ldaxr((unint64_t *)v8);
    while (__stlxr(v9 - 1, (unint64_t *)v8));
    if (!v9)
    {
      ((void (*)(std::__shared_weak_count *))v21->__on_zero_shared)(v21);
      std::__shared_weak_count::__release_weak(v21);
    }
  }
  if (v22)
  {
    v10 = (_QWORD *)objc_msgSend(v4, "getSharedPtr");
    v11 = (std::__shared_weak_count *)v10[1];
    v19[0] = *v10;
    v19[1] = v11;
    if (v11)
    {
      v12 = (unint64_t *)&v11->__shared_owners_;
      do
        v13 = __ldxr(v12);
      while (__stxr(v13 + 1, v12));
    }
    siri::dialogengine::VariableArray::AddItem(v22, v19);
    if (v11)
    {
      v14 = (unint64_t *)&v11->__shared_owners_;
      do
        v15 = __ldaxr(v14);
      while (__stlxr(v15 - 1, v14));
      if (!v15)
      {
        ((void (*)(std::__shared_weak_count *))v11->__on_zero_shared)(v11);
        std::__shared_weak_count::__release_weak(v11);
      }
    }
  }
  v16 = v23;
  if (v23)
  {
    v17 = (unint64_t *)&v23->__shared_owners_;
    do
      v18 = __ldaxr(v17);
    while (__stlxr(v18 - 1, v17));
    if (!v18)
    {
      ((void (*)(std::__shared_weak_count *))v16->__on_zero_shared)(v16);
      std::__shared_weak_count::__release_weak(v16);
    }
  }

}

- (id)getItem:(unint64_t)a3
{
  _QWORD *v4;
  unint64_t *v5;
  unint64_t v6;
  unint64_t *v7;
  unint64_t v8;
  uint64_t v9;
  __int128 v10;
  unint64_t *v11;
  unint64_t v12;
  DEVariable *v13;
  std::__shared_weak_count *v14;
  unint64_t *v15;
  unint64_t v16;
  std::__shared_weak_count *v17;
  unint64_t *p_shared_owners;
  unint64_t v19;
  void *lpsrc[2];
  _QWORD *v22;
  std::__shared_weak_count *v23;

  -[DEVariable This](self, "This");
  if (lpsrc[0]
  {
    v22 = v4;
    v23 = (std::__shared_weak_count *)lpsrc[1];
    if (lpsrc[1])
    {
      v5 = (unint64_t *)((char *)lpsrc[1] + 8);
      do
        v6 = __ldxr(v5);
      while (__stxr(v6 + 1, v5));
    }
  }
  else
  {
    v22 = 0;
    v23 = 0;
  }
  if (lpsrc[1])
  {
    v7 = (unint64_t *)((char *)lpsrc[1] + 8);
    do
      v8 = __ldaxr(v7);
    while (__stlxr(v8 - 1, v7));
    if (!v8)
    {
      (*(void (**)(void *))(*(_QWORD *)lpsrc[1] + 16))(lpsrc[1]);
      std::__shared_weak_count::__release_weak((std::__shared_weak_count *)lpsrc[1]);
    }
  }
  if (v22)
  {
    v9 = v22[9];
    if (a3 >= (v22[10] - v9) >> 4)
    {
      lpsrc[0] = 0;
      lpsrc[1] = 0;
    }
    else
    {
      v10 = *(_OWORD *)(v9 + 16 * a3);
      *(_OWORD *)lpsrc = v10;
      if (*((_QWORD *)&v10 + 1))
      {
        v11 = (unint64_t *)(*((_QWORD *)&v10 + 1) + 8);
        do
          v12 = __ldxr(v11);
        while (__stxr(v12 + 1, v11));
      }
    }
    v13 = -[DEVariable initWithSharedPtr:]([DEVariable alloc], "initWithSharedPtr:", lpsrc);
    v14 = (std::__shared_weak_count *)lpsrc[1];
    if (lpsrc[1])
    {
      v15 = (unint64_t *)((char *)lpsrc[1] + 8);
      do
        v16 = __ldaxr(v15);
      while (__stlxr(v16 - 1, v15));
      if (!v16)
      {
        ((void (*)(std::__shared_weak_count *))v14->__on_zero_shared)(v14);
        std::__shared_weak_count::__release_weak(v14);
      }
    }
  }
  else
  {
    v13 = 0;
  }
  v17 = v23;
  if (v23)
  {
    p_shared_owners = (unint64_t *)&v23->__shared_owners_;
    do
      v19 = __ldaxr(p_shared_owners);
    while (__stlxr(v19 - 1, p_shared_owners));
    if (!v19)
    {
      ((void (*)(std::__shared_weak_count *))v17->__on_zero_shared)(v17);
      std::__shared_weak_count::__release_weak(v17);
    }
  }
  return v13;
}

- (unint64_t)getLength
{
  unint64_t v2;
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
    v2 = (uint64_t)(*(_QWORD *)(v2 + 80) - *(_QWORD *)(v2 + 72)) >> 4;
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
  return v2;
}

@end
