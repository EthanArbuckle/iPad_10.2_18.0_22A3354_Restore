@implementation SparseBundleBackendXPC

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (SparseBundleBackendXPC)initWithCoder:(id)a3
{
  id v4;
  SparseBundleBackendXPC *v5;
  void *v6;
  void *v7;
  void *v8;
  __int128 v9;
  std::__shared_weak_count *v10;
  unint64_t *p_shared_owners;
  unint64_t v12;
  unint64_t *v13;
  unint64_t v14;
  std::__shared_weak_count *v15;
  unint64_t *v16;
  unint64_t v17;
  std::__shared_weak_count *v18;
  unint64_t *v19;
  unint64_t v20;
  std::__shared_weak_count *v21;
  unint64_t *v22;
  unint64_t v23;
  std::__shared_weak_count *v24;
  unint64_t *v25;
  unint64_t v26;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  unsigned __int8 v32;
  int v33;
  objc_super v34;

  v4 = a3;
  v34.receiver = self;
  v34.super_class = (Class)SparseBundleBackendXPC;
  v5 = -[BackendXPC initWithCoder:](&v34, sel_initWithCoder_, v4);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("bundle_handle"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v33 = dup(objc_msgSend(v6, "fileDescriptor"));
    v32 = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("is_writable"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("lock_backend"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v7;
    v31 = 0uLL;
    if (v7)
    {
      objc_msgSend(v7, "backend");
      v9 = v30;
      v30 = 0uLL;
      v10 = (std::__shared_weak_count *)*((_QWORD *)&v31 + 1);
      v31 = v9;
      if (v10)
      {
        p_shared_owners = (unint64_t *)&v10->__shared_owners_;
        do
          v12 = __ldaxr(p_shared_owners);
        while (__stlxr(v12 - 1, p_shared_owners));
        if (!v12)
        {
          ((void (*)(std::__shared_weak_count *))v10->__on_zero_shared)(v10);
          std::__shared_weak_count::__release_weak(v10);
        }
      }
      if (*((_QWORD *)&v30 + 1))
      {
        v13 = (unint64_t *)(*((_QWORD *)&v30 + 1) + 8);
        do
          v14 = __ldaxr(v13);
        while (__stlxr(v14 - 1, v13));
        if (!v14)
        {
          (*(void (**)(_QWORD))(**((_QWORD **)&v30 + 1) + 16))(*((_QWORD *)&v30 + 1));
          std::__shared_weak_count::__release_weak(*((std::__shared_weak_count **)&v30 + 1));
        }
      }
    }
    crypto::format_serializer::decode(v4, (uint64_t *)-[BackendXPC cryptoHeader](v5, "cryptoHeader"), &v30);
    std::allocate_shared[abi:ne180100]<SparseBundleBackend,std::allocator<SparseBundleBackend>,int &,BOOL &,std::shared_ptr<FileLocal> &,std::shared_ptr<crypto::format> &,void>((unsigned int *)&v33, &v32, &v28);
    v29 = v28;
    v28 = 0uLL;
    -[BackendXPC setBackend:](v5, "setBackend:", &v29, 0);
    v15 = (std::__shared_weak_count *)*((_QWORD *)&v29 + 1);
    if (*((_QWORD *)&v29 + 1))
    {
      v16 = (unint64_t *)(*((_QWORD *)&v29 + 1) + 8);
      do
        v17 = __ldaxr(v16);
      while (__stlxr(v17 - 1, v16));
      if (!v17)
      {
        ((void (*)(std::__shared_weak_count *))v15->__on_zero_shared)(v15);
        std::__shared_weak_count::__release_weak(v15);
      }
    }
    v18 = (std::__shared_weak_count *)*((_QWORD *)&v28 + 1);
    if (*((_QWORD *)&v28 + 1))
    {
      v19 = (unint64_t *)(*((_QWORD *)&v28 + 1) + 8);
      do
        v20 = __ldaxr(v19);
      while (__stlxr(v20 - 1, v19));
      if (!v20)
      {
        ((void (*)(std::__shared_weak_count *))v18->__on_zero_shared)(v18);
        std::__shared_weak_count::__release_weak(v18);
      }
    }
    v21 = (std::__shared_weak_count *)*((_QWORD *)&v30 + 1);
    if (*((_QWORD *)&v30 + 1))
    {
      v22 = (unint64_t *)(*((_QWORD *)&v30 + 1) + 8);
      do
        v23 = __ldaxr(v22);
      while (__stlxr(v23 - 1, v22));
      if (!v23)
      {
        ((void (*)(std::__shared_weak_count *))v21->__on_zero_shared)(v21);
        std::__shared_weak_count::__release_weak(v21);
      }
    }
    v24 = (std::__shared_weak_count *)*((_QWORD *)&v31 + 1);
    if (*((_QWORD *)&v31 + 1))
    {
      v25 = (unint64_t *)(*((_QWORD *)&v31 + 1) + 8);
      do
        v26 = __ldaxr(v25);
      while (__stlxr(v26 - 1, v25));
      if (!v26)
      {
        ((void (*)(std::__shared_weak_count *))v24->__on_zero_shared)(v24);
        std::__shared_weak_count::__release_weak(v24);
      }
    }

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  std::__shared_weak_count *v5;
  uint64_t v6;
  void *v7;
  const crypto::format *v8;
  NSCoder *v9;
  FileLocalXPC *v10;
  FileLocalXPC *v11;
  std::__shared_weak_count *v12;
  uint64_t v13;
  unint64_t *p_shared_owners;
  unint64_t v15;
  std::__shared_weak_count *v16;
  unint64_t *v17;
  unint64_t v18;
  unint64_t *v19;
  unint64_t v20;
  uint64_t v21;
  std::__shared_weak_count *v22;
  objc_super v23;
  uint64_t v24;
  std::__shared_weak_count *v25;
  uint64_t v26;
  std::__shared_weak_count *v27;

  v4 = a3;
  -[BackendXPC backend](self, "backend");
  v6 = v24;
  v5 = v25;
  v26 = v24;
  v27 = v25;
  v23.receiver = self;
  v23.super_class = (Class)SparseBundleBackendXPC;
  -[BackendXPC encodeWithCoder:](&v23, sel_encodeWithCoder_, v4);
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1578]), "initWithFileDescriptor:", (**(uint64_t (***)(uint64_t))(v6 + 24))(v6 + 24));
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("bundle_handle"));
  objc_msgSend(v4, "encodeBool:forKey:", (*(uint64_t (**)(uint64_t))(*(_QWORD *)v6 + 48))(v6), CFSTR("is_writable"));
  v9 = *(NSCoder **)(v6 + 96);
  if (v9)
    crypto::format_serializer::encode((crypto::format_serializer *)v4, v9, v8);
  if ((*(unsigned int (**)(uint64_t))(*(_QWORD *)v6 + 192))(v6))
  {
    v10 = objc_alloc_init(FileLocalXPC);
    v11 = v10;
    v13 = *(_QWORD *)(v6 + 80);
    v12 = *(std::__shared_weak_count **)(v6 + 88);
    if (v12)
    {
      p_shared_owners = (unint64_t *)&v12->__shared_owners_;
      do
        v15 = __ldxr(p_shared_owners);
      while (__stxr(v15 + 1, p_shared_owners));
    }
    v21 = v13;
    v22 = v12;
    -[BackendXPC setBackend:](v10, "setBackend:", &v21, 0);
    v16 = v22;
    if (v22)
    {
      v17 = (unint64_t *)&v22->__shared_owners_;
      do
        v18 = __ldaxr(v17);
      while (__stlxr(v18 - 1, v17));
      if (!v18)
      {
        ((void (*)(std::__shared_weak_count *))v16->__on_zero_shared)(v16);
        std::__shared_weak_count::__release_weak(v16);
      }
    }
    objc_msgSend(v4, "encodeObject:forKey:", v11, CFSTR("lock_backend"));

    v5 = v27;
  }

  if (v5)
  {
    v19 = (unint64_t *)&v5->__shared_owners_;
    do
      v20 = __ldaxr(v19);
    while (__stlxr(v20 - 1, v19));
    if (!v20)
    {
      ((void (*)(std::__shared_weak_count *))v5->__on_zero_shared)(v5);
      std::__shared_weak_count::__release_weak(v5);
    }
  }

}

- (SparseBundleBackendXPC)initWithURL:(id)a3 fileOpenFlags:(int)a4 bandSize:(unint64_t)a5
{
  id v8;
  SparseBundleBackendXPC *v9;
  std::__shared_weak_count *v10;
  unint64_t *v11;
  unint64_t v12;
  std::__shared_weak_count *v13;
  unint64_t *v14;
  unint64_t v15;
  char *v17;
  __int128 v18;
  __int128 v19;
  objc_super v20;
  unint64_t v21;
  unsigned int v22;

  v8 = a3;
  v22 = a4;
  v21 = a5;
  v20.receiver = self;
  v20.super_class = (Class)SparseBundleBackendXPC;
  v9 = -[SparseBundleBackendXPC init](&v20, sel_init);
  if (v9)
  {
    v17 = (char *)objc_msgSend(objc_retainAutorelease(v8), "fileSystemRepresentation");
    std::allocate_shared[abi:ne180100]<SparseBundleBackend,std::allocator<SparseBundleBackend>,char const*,int &,unsigned long &,void>(&v17, &v22, (uint64_t *)&v21, &v18);
    v19 = v18;
    v18 = 0uLL;
    -[BackendXPC setBackend:](v9, "setBackend:", &v19);
    v10 = (std::__shared_weak_count *)*((_QWORD *)&v19 + 1);
    if (*((_QWORD *)&v19 + 1))
    {
      v11 = (unint64_t *)(*((_QWORD *)&v19 + 1) + 8);
      do
        v12 = __ldaxr(v11);
      while (__stlxr(v12 - 1, v11));
      if (!v12)
      {
        ((void (*)(std::__shared_weak_count *))v10->__on_zero_shared)(v10);
        std::__shared_weak_count::__release_weak(v10);
      }
    }
    v13 = (std::__shared_weak_count *)*((_QWORD *)&v18 + 1);
    if (*((_QWORD *)&v18 + 1))
    {
      v14 = (unint64_t *)(*((_QWORD *)&v18 + 1) + 8);
      do
        v15 = __ldaxr(v14);
      while (__stlxr(v15 - 1, v14));
      if (!v15)
      {
        ((void (*)(std::__shared_weak_count *))v13->__on_zero_shared)(v13);
        std::__shared_weak_count::__release_weak(v13);
      }
    }
  }

  return v9;
}

- (SparseBundleBackendXPC)initWithURL:(id)a3 fileOpenFlags:(int)a4
{
  id v6;
  SparseBundleBackendXPC *v7;
  std::__shared_weak_count *v8;
  unint64_t *v9;
  unint64_t v10;
  std::__shared_weak_count *v11;
  unint64_t *v12;
  unint64_t v13;
  char *v15;
  __int128 v16;
  __int128 v17;
  objc_super v18;
  unsigned int v19;

  v6 = a3;
  v19 = a4;
  v18.receiver = self;
  v18.super_class = (Class)SparseBundleBackendXPC;
  v7 = -[SparseBundleBackendXPC init](&v18, sel_init);
  if (v7)
  {
    v15 = (char *)objc_msgSend(objc_retainAutorelease(v6), "fileSystemRepresentation");
    std::allocate_shared[abi:ne180100]<SparseBundleBackend,std::allocator<SparseBundleBackend>,char const*,int &,void>(&v15, &v19, &v16);
    v17 = v16;
    v16 = 0uLL;
    -[BackendXPC setBackend:](v7, "setBackend:", &v17);
    v8 = (std::__shared_weak_count *)*((_QWORD *)&v17 + 1);
    if (*((_QWORD *)&v17 + 1))
    {
      v9 = (unint64_t *)(*((_QWORD *)&v17 + 1) + 8);
      do
        v10 = __ldaxr(v9);
      while (__stlxr(v10 - 1, v9));
      if (!v10)
      {
        ((void (*)(std::__shared_weak_count *))v8->__on_zero_shared)(v8);
        std::__shared_weak_count::__release_weak(v8);
      }
    }
    v11 = (std::__shared_weak_count *)*((_QWORD *)&v16 + 1);
    if (*((_QWORD *)&v16 + 1))
    {
      v12 = (unint64_t *)(*((_QWORD *)&v16 + 1) + 8);
      do
        v13 = __ldaxr(v12);
      while (__stlxr(v13 - 1, v12));
      if (!v13)
      {
        ((void (*)(std::__shared_weak_count *))v11->__on_zero_shared)(v11);
        std::__shared_weak_count::__release_weak(v11);
      }
    }
  }

  return v7;
}

- (shared_ptr<Backend>)getCryptoHeaderBackend
{
  _OWORD *v2;
  _OWORD *v3;
  std::__shared_weak_count *v4;
  Backend *v5;
  __shared_weak_count *v6;
  unint64_t *p_shared_owners;
  unint64_t v8;
  _OWORD v9[2];
  shared_ptr<Backend> result;

  v3 = v2;
  -[BackendXPC backend](self, "backend");
  v4 = (std::__shared_weak_count *)*((_QWORD *)&v9[0] + 1);
  v9[1] = v9[0];
  SparseBundleBackend::open_token_file(*(SparseBundleBackend **)&v9[0], v9);
  *v3 = v9[0];
  if (v4)
  {
    p_shared_owners = (unint64_t *)&v4->__shared_owners_;
    do
      v8 = __ldaxr(p_shared_owners);
    while (__stlxr(v8 - 1, p_shared_owners));
    if (!v8)
    {
      ((void (*)(std::__shared_weak_count *))v4->__on_zero_shared)(v4);
      std::__shared_weak_count::__release_weak(v4);
    }
  }
  result.__cntrl_ = v6;
  result.__ptr_ = v5;
  return result;
}

- (void)replaceWithBackendXPC:(id)a3
{
  id v4;
  uint64_t v5;
  unint64_t *v6;
  unint64_t v7;
  unint64_t *p_shared_owners;
  unint64_t v9;
  std::__shared_weak_count *v10;
  unint64_t *v11;
  unint64_t v12;
  std::__shared_weak_count *v13;
  unint64_t *v14;
  unint64_t v15;
  uint64_t v16;
  std::__shared_weak_count *v17;
  objc_super v18;
  __int128 v19;
  __int128 v20;

  v4 = a3;
  -[BackendXPC backend](self, "backend");
  v20 = v19;
  v5 = *(_QWORD *)(v19 + 104);
  *(_QWORD *)&v19 = *(_QWORD *)(v19 + 96);
  *((_QWORD *)&v19 + 1) = v5;
  if (v5)
  {
    v6 = (unint64_t *)(v5 + 8);
    do
      v7 = __ldxr(v6);
    while (__stxr(v7 + 1, v6));
  }
  v18.receiver = self;
  v18.super_class = (Class)SparseBundleBackendXPC;
  -[BackendXPC replaceWithBackendXPC:](&v18, sel_replaceWithBackendXPC_, v4);
  -[BackendXPC backend](self, "backend");
  std::shared_ptr<DiskImage>::operator=[abi:ne180100]((_QWORD *)(v16 + 96), (uint64_t *)&v19);
  if (v17)
  {
    p_shared_owners = (unint64_t *)&v17->__shared_owners_;
    do
      v9 = __ldaxr(p_shared_owners);
    while (__stlxr(v9 - 1, p_shared_owners));
    if (!v9)
    {
      ((void (*)())v17->__on_zero_shared)();
      std::__shared_weak_count::__release_weak(v17);
    }
  }
  v10 = (std::__shared_weak_count *)*((_QWORD *)&v19 + 1);
  if (*((_QWORD *)&v19 + 1))
  {
    v11 = (unint64_t *)(*((_QWORD *)&v19 + 1) + 8);
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

}

- (BOOL)isUnlocked
{
  uint64_t v2;
  unint64_t *p_shared_owners;
  unint64_t v4;
  uint64_t v6;
  std::__shared_weak_count *v7;

  -[BackendXPC backend](self, "backend");
  v2 = *(_QWORD *)(v6 + 96);
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
  return v2 != 0;
}

- (id)newWithCryptoFormat:(const void *)a3
{
  SparseBundleBackendXPC *v5;
  unint64_t *p_shared_owners;
  unint64_t v7;
  std::__shared_weak_count *v8;
  unint64_t *v9;
  unint64_t v10;
  std::__shared_weak_count *v11;
  unint64_t *v12;
  unint64_t v13;
  uint64_t v15;
  std::__shared_weak_count *v16;
  uint64_t v17;
  std::__shared_weak_count *v18;
  uint64_t v19;
  std::__shared_weak_count *v20;

  v5 = objc_alloc_init(SparseBundleBackendXPC);
  -[BackendXPC backend](self, "backend");
  v19 = v17;
  v20 = v18;
  std::shared_ptr<DiskImage>::operator=[abi:ne180100]((_QWORD *)(v17 + 96), (uint64_t *)a3);
  v15 = v17;
  v16 = v18;
  if (v18)
  {
    p_shared_owners = (unint64_t *)&v18->__shared_owners_;
    do
      v7 = __ldxr(p_shared_owners);
    while (__stxr(v7 + 1, p_shared_owners));
  }
  -[BackendXPC setBackend:](v5, "setBackend:", &v15);
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
  v11 = v20;
  if (v20)
  {
    v12 = (unint64_t *)&v20->__shared_owners_;
    do
      v13 = __ldaxr(v12);
    while (__stlxr(v13 - 1, v12));
    if (!v13)
    {
      ((void (*)(std::__shared_weak_count *))v11->__on_zero_shared)(v11);
      std::__shared_weak_count::__release_weak(v11);
    }
  }
  return v5;
}

@end
