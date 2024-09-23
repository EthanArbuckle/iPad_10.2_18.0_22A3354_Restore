@implementation DEVariableObject

- (DEVariableObject)init
{
  DEVariableObject *v2;
  std::__shared_weak_count *v3;
  unint64_t *v4;
  unint64_t v5;
  std::__shared_weak_count *v6;
  unint64_t *v7;
  unint64_t v8;
  __int128 v10;
  __int128 v11;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)DEVariableObject;
  v2 = -[DEVariable init](&v12, sel_init);
  if (v2)
  {
    _ZNSt3__115allocate_sharedB8ne180100IN4siri12dialogengine14VariableObjectENS_9allocatorIS3_EEJEvEENS_10shared_ptrIT_EERKT0_DpOT1_((siri::dialogengine::VariableObject **)&v10);
    v11 = v10;
    v10 = 0uLL;
    -[DEVariable setThis:](v2, "setThis:", &v11, 0);
    v3 = (std::__shared_weak_count *)*((_QWORD *)&v11 + 1);
    if (*((_QWORD *)&v11 + 1))
    {
      v4 = (unint64_t *)(*((_QWORD *)&v11 + 1) + 8);
      do
        v5 = __ldaxr(v4);
      while (__stlxr(v5 - 1, v4));
      if (!v5)
      {
        ((void (*)(std::__shared_weak_count *))v3->__on_zero_shared)(v3);
        std::__shared_weak_count::__release_weak(v3);
      }
    }
    v6 = (std::__shared_weak_count *)*((_QWORD *)&v10 + 1);
    if (*((_QWORD *)&v10 + 1))
    {
      v7 = (unint64_t *)(*((_QWORD *)&v10 + 1) + 8);
      do
        v8 = __ldaxr(v7);
      while (__stlxr(v8 - 1, v7));
      if (!v8)
      {
        ((void (*)(std::__shared_weak_count *))v6->__on_zero_shared)(v6);
        std::__shared_weak_count::__release_weak(v6);
      }
    }
  }
  return v2;
}

- (DEVariableObject)initWithSharedPtr:(void *)a3
{
  DEVariableObject *v4;
  DEVariableObject *v5;
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
  v15.super_class = (Class)DEVariableObject;
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

- (DEVariableObject)initWithName:(id)a3
{
  id v4;
  DEVariableObject *v5;
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
  v17.super_class = (Class)DEVariableObject;
  v5 = -[DEVariable init](&v17, sel_init);
  if (v5)
  {
    std::string::basic_string[abi:ne180100]<0>(&__p, (char *)objc_msgSend(objc_retainAutorelease(v4), "UTF8String"));
    v6 = operator new(0x78uLL);
    v6[1] = 0;
    v6[2] = 0;
    *v6 = &off_1E7936190;
    *(_QWORD *)&v15 = siri::dialogengine::VariableObject::VariableObject(v6 + 3, &__p);
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

- (void)addProperty:(id)a3
{
  id v4;
  void *v5;
  uint64_t *p_shared_owners;
  unint64_t v7;
  uint64_t *v8;
  unint64_t v9;
  uint64_t *v10;
  std::__shared_weak_count *v11;
  unint64_t *v12;
  unint64_t v13;
  unint64_t *v14;
  unint64_t v15;
  std::__shared_weak_count *v16;
  unint64_t *v17;
  unint64_t v18;
  uint64_t v19[2];
  void *lpsrc;
  std::__shared_weak_count *v21;
  uint64_t v22;
  std::__shared_weak_count *v23;

  v4 = a3;
  -[DEVariable This](self, "This");
  if (lpsrc
  {
    v22 = (uint64_t)v5;
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
    v10 = (uint64_t *)objc_msgSend(v4, "getSharedPtr");
    v11 = (std::__shared_weak_count *)v10[1];
    v19[0] = *v10;
    v19[1] = (uint64_t)v11;
    if (v11)
    {
      v12 = (unint64_t *)&v11->__shared_owners_;
      do
        v13 = __ldxr(v12);
      while (__stxr(v13 + 1, v12));
    }
    siri::dialogengine::VariableObject::AddProperty(v22, v19);
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

- (id)getValue:(id)a3
{
  id v4;
  DEVariable *v5;
  uint64_t *p_shared_owners;
  unint64_t v7;
  uint64_t *v8;
  unint64_t v9;
  DEVariable *v10;
  uint64_t v11;
  std::__shared_weak_count *v12;
  uint64_t v13;
  unint64_t *v14;
  unint64_t v15;
  DEVariable *v16;
  std::__shared_weak_count *v17;
  unint64_t *v18;
  unint64_t v19;
  std::__shared_weak_count *v20;
  unint64_t *v21;
  unint64_t v22;
  void *lpsrc;
  std::__shared_weak_count *v25;
  char v26;
  uint64_t v27;
  std::__shared_weak_count *v28;
  DEVariable *v29;
  std::__shared_weak_count *v30;

  v4 = a3;
  -[DEVariable This](self, "This");
  if (lpsrc
  {
    v29 = v5;
    v30 = v25;
    if (v25)
    {
      p_shared_owners = &v25->__shared_owners_;
      do
        v7 = __ldxr((unint64_t *)p_shared_owners);
      while (__stxr(v7 + 1, (unint64_t *)p_shared_owners));
    }
  }
  else
  {
    v29 = 0;
    v30 = 0;
  }
  if (v25)
  {
    v8 = &v25->__shared_owners_;
    do
      v9 = __ldaxr((unint64_t *)v8);
    while (__stlxr(v9 - 1, (unint64_t *)v8));
    if (!v9)
    {
      ((void (*)(std::__shared_weak_count *))v25->__on_zero_shared)(v25);
      std::__shared_weak_count::__release_weak(v25);
    }
  }
  v10 = v29;
  if (v29)
  {
    std::string::basic_string[abi:ne180100]<0>(&lpsrc, (char *)objc_msgSend(objc_retainAutorelease(v4), "UTF8String"));
    v11 = std::__tree<std::string>::find<std::string>((uint64_t)&v10[3], (const void **)&lpsrc);
    if (&v10[3]._This == (shared_ptr<siri::dialogengine::Variable> *)v11)
    {
      v13 = 0;
      v27 = 0;
      v28 = 0;
    }
    else
    {
      v13 = *(_QWORD *)(v11 + 56);
      v12 = *(std::__shared_weak_count **)(v11 + 64);
      v27 = v13;
      v28 = v12;
      if (v12)
      {
        v14 = (unint64_t *)&v12->__shared_owners_;
        do
          v15 = __ldxr(v14);
        while (__stxr(v15 + 1, v14));
      }
    }
    if (v26 < 0)
      operator delete(lpsrc);
    if (v13)
      v16 = -[DEVariable initWithSharedPtr:]([DEVariable alloc], "initWithSharedPtr:", &v27);
    else
      v16 = objc_alloc_init(DEVariable);
    v10 = v16;
    v17 = v28;
    if (v28)
    {
      v18 = (unint64_t *)&v28->__shared_owners_;
      do
        v19 = __ldaxr(v18);
      while (__stlxr(v19 - 1, v18));
      if (!v19)
      {
        ((void (*)(std::__shared_weak_count *))v17->__on_zero_shared)(v17);
        std::__shared_weak_count::__release_weak(v17);
      }
    }
  }
  v20 = v30;
  if (v30)
  {
    v21 = (unint64_t *)&v30->__shared_owners_;
    do
      v22 = __ldaxr(v21);
    while (__stlxr(v22 - 1, v21));
    if (!v22)
    {
      ((void (*)(std::__shared_weak_count *))v20->__on_zero_shared)(v20);
      std::__shared_weak_count::__release_weak(v20);
    }
  }

  return v10;
}

- (id)getValues
{
  siri::dialogengine::VariableObject *v2;
  uint64_t *p_shared_owners;
  unint64_t v4;
  uint64_t *v5;
  unint64_t v6;
  siri::dialogengine::VariableObject *v7;
  void *v8;
  _OWORD *v9;
  unint64_t v10;
  __int128 v11;
  unint64_t *v12;
  unint64_t v13;
  DEVariable *v14;
  std::__shared_weak_count *v15;
  unint64_t *v16;
  unint64_t v17;
  std::__shared_weak_count *v18;
  unint64_t *v19;
  unint64_t v20;
  __int128 v22;
  void *lpsrc;
  std::__shared_weak_count *v24;
  siri::dialogengine::VariableObject *v25;
  std::__shared_weak_count *v26;

  -[DEVariable This](self, "This");
  if (lpsrc
  {
    v25 = v2;
    v26 = v24;
    if (v24)
    {
      p_shared_owners = &v24->__shared_owners_;
      do
        v4 = __ldxr((unint64_t *)p_shared_owners);
      while (__stxr(v4 + 1, (unint64_t *)p_shared_owners));
    }
  }
  else
  {
    v25 = 0;
    v26 = 0;
  }
  if (v24)
  {
    v5 = &v24->__shared_owners_;
    do
      v6 = __ldaxr((unint64_t *)v5);
    while (__stlxr(v6 - 1, (unint64_t *)v5));
    if (!v6)
    {
      ((void (*)(std::__shared_weak_count *))v24->__on_zero_shared)(v24);
      std::__shared_weak_count::__release_weak(v24);
    }
  }
  v7 = v25;
  if (v25)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    siri::dialogengine::VariableObject::GetValues(v7, (char **)&lpsrc);
    v9 = lpsrc;
    if (v24 != lpsrc)
    {
      v10 = 0;
      do
      {
        v11 = v9[v10];
        v22 = v11;
        if (*((_QWORD *)&v11 + 1))
        {
          v12 = (unint64_t *)(*((_QWORD *)&v11 + 1) + 8);
          do
            v13 = __ldxr(v12);
          while (__stxr(v13 + 1, v12));
        }
        v14 = -[DEVariable initWithSharedPtr:]([DEVariable alloc], "initWithSharedPtr:", &v22);
        objc_msgSend(v8, "addObject:", v14, (_QWORD)v22);

        v15 = (std::__shared_weak_count *)*((_QWORD *)&v22 + 1);
        if (*((_QWORD *)&v22 + 1))
        {
          v16 = (unint64_t *)(*((_QWORD *)&v22 + 1) + 8);
          do
            v17 = __ldaxr(v16);
          while (__stlxr(v17 - 1, v16));
          if (!v17)
          {
            ((void (*)(std::__shared_weak_count *))v15->__on_zero_shared)(v15);
            std::__shared_weak_count::__release_weak(v15);
          }
        }
        ++v10;
        v9 = lpsrc;
      }
      while (v10 < ((char *)v24 - (_BYTE *)lpsrc) >> 4);
    }
    *(_QWORD *)&v22 = &lpsrc;
    std::vector<std::shared_ptr<siri::dialogengine::VisualComponentsCombination::Entry>>::__destroy_vector::operator()[abi:ne180100]((void ***)&v22);
  }
  else
  {
    v8 = 0;
  }
  v18 = v26;
  if (v26)
  {
    v19 = (unint64_t *)&v26->__shared_owners_;
    do
      v20 = __ldaxr(v19);
    while (__stlxr(v20 - 1, v19));
    if (!v20)
    {
      ((void (*)(std::__shared_weak_count *))v18->__on_zero_shared)(v18);
      std::__shared_weak_count::__release_weak(v18);
    }
  }
  return v8;
}

@end
