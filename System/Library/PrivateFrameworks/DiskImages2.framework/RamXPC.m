@implementation RamXPC

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (RamXPC)initWithSize:(unint64_t)a3
{
  RamXPC *v3;
  std::__shared_weak_count *v4;
  unint64_t *v5;
  unint64_t v6;
  std::__shared_weak_count *v7;
  unint64_t *v8;
  unint64_t v9;
  __int128 v11;
  __int128 v12;
  objc_super v13;
  unint64_t v14;

  v14 = a3;
  v13.receiver = self;
  v13.super_class = (Class)RamXPC;
  v3 = -[RamXPC init](&v13, sel_init);
  if (v3)
  {
    std::allocate_shared[abi:ne180100]<BackendNull,std::allocator<BackendNull>,unsigned long long &,void>((uint64_t *)&v14, &v11);
    v12 = v11;
    v11 = 0uLL;
    -[BackendXPC setBackend:](v3, "setBackend:", &v12, 0);
    v4 = (std::__shared_weak_count *)*((_QWORD *)&v12 + 1);
    if (*((_QWORD *)&v12 + 1))
    {
      v5 = (unint64_t *)(*((_QWORD *)&v12 + 1) + 8);
      do
        v6 = __ldaxr(v5);
      while (__stlxr(v6 - 1, v5));
      if (!v6)
      {
        ((void (*)(std::__shared_weak_count *))v4->__on_zero_shared)(v4);
        std::__shared_weak_count::__release_weak(v4);
      }
    }
    v7 = (std::__shared_weak_count *)*((_QWORD *)&v11 + 1);
    if (*((_QWORD *)&v11 + 1))
    {
      v8 = (unint64_t *)(*((_QWORD *)&v11 + 1) + 8);
      do
        v9 = __ldaxr(v8);
      while (__stlxr(v9 - 1, v8));
      if (!v9)
      {
        ((void (*)(std::__shared_weak_count *))v7->__on_zero_shared)(v7);
        std::__shared_weak_count::__release_weak(v7);
      }
    }
  }
  return v3;
}

- (void)createRamBackend
{
  uint64_t v3;
  std::__shared_weak_count *v4;
  unint64_t *v5;
  unint64_t v6;
  std::__shared_weak_count *v7;
  unint64_t *v8;
  unint64_t v9;
  unint64_t *p_shared_owners;
  unint64_t v11;
  std::__shared_weak_count *v12;
  unint64_t *v13;
  unint64_t v14;
  uint64_t v15;
  std::__shared_weak_count *v16;
  uint64_t v17;
  __int128 v18;
  __int128 v19;
  uint64_t v20;
  std::__shared_weak_count *v21;
  uint64_t v22[3];

  v22[2] = *MEMORY[0x24BDAC8D0];
  -[BackendXPC backend](self, "backend");
  v17 = (*(uint64_t (**)(uint64_t))(*(_QWORD *)v20 + 40))(v20);
  -[BackendXPC backend](self, "backend");
  v22[0] = (*(uint64_t (**)())(*(_QWORD *)v15 + 160))();
  v22[1] = v3;
  std::allocate_shared[abi:ne180100]<Ram,std::allocator<Ram>,unsigned long long,boost::uuids::uuid,void>((size_t *)&v17, v22, &v18);
  v19 = v18;
  v18 = 0uLL;
  -[BackendXPC setBackend:](self, "setBackend:", &v19);
  v4 = (std::__shared_weak_count *)*((_QWORD *)&v19 + 1);
  if (*((_QWORD *)&v19 + 1))
  {
    v5 = (unint64_t *)(*((_QWORD *)&v19 + 1) + 8);
    do
      v6 = __ldaxr(v5);
    while (__stlxr(v6 - 1, v5));
    if (!v6)
    {
      ((void (*)(std::__shared_weak_count *))v4->__on_zero_shared)(v4);
      std::__shared_weak_count::__release_weak(v4);
    }
  }
  v7 = (std::__shared_weak_count *)*((_QWORD *)&v18 + 1);
  if (*((_QWORD *)&v18 + 1))
  {
    v8 = (unint64_t *)(*((_QWORD *)&v18 + 1) + 8);
    do
      v9 = __ldaxr(v8);
    while (__stlxr(v9 - 1, v8));
    if (!v9)
    {
      ((void (*)(std::__shared_weak_count *))v7->__on_zero_shared)(v7);
      std::__shared_weak_count::__release_weak(v7);
    }
  }
  if (v16)
  {
    p_shared_owners = (unint64_t *)&v16->__shared_owners_;
    do
      v11 = __ldaxr(p_shared_owners);
    while (__stlxr(v11 - 1, p_shared_owners));
    if (!v11)
    {
      ((void (*)())v16->__on_zero_shared)();
      std::__shared_weak_count::__release_weak(v16);
    }
  }
  v12 = v21;
  if (v21)
  {
    v13 = (unint64_t *)&v21->__shared_owners_;
    do
      v14 = __ldaxr(v13);
    while (__stlxr(v14 - 1, v13));
    if (!v14)
    {
      ((void (*)(std::__shared_weak_count *))v12->__on_zero_shared)(v12);
      std::__shared_weak_count::__release_weak(v12);
    }
  }
}

- (RamXPC)initWithCoder:(id)a3
{
  id v4;
  RamXPC *v5;
  void *v6;
  std::__shared_weak_count *v7;
  unint64_t *v8;
  unint64_t v9;
  std::__shared_weak_count *v10;
  unint64_t *v11;
  unint64_t v12;
  __int128 v14;
  __int128 v15;
  uint64_t v16;
  objc_super v17;
  uint64_t v18[3];

  v18[2] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)RamXPC;
  v5 = -[BackendXPC initWithCoder:](&v17, sel_initWithCoder_, v4);
  if (v5)
  {
    v16 = objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("size"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("identifier"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "getUUIDBytes:", v18);
    std::allocate_shared[abi:ne180100]<BackendNull,std::allocator<BackendNull>,unsigned long long &,boost::uuids::uuid &,void>(&v16, v18, &v14);
    v15 = v14;
    v14 = 0uLL;
    -[BackendXPC setBackend:](v5, "setBackend:", &v15, 0);
    v7 = (std::__shared_weak_count *)*((_QWORD *)&v15 + 1);
    if (*((_QWORD *)&v15 + 1))
    {
      v8 = (unint64_t *)(*((_QWORD *)&v15 + 1) + 8);
      do
        v9 = __ldaxr(v8);
      while (__stlxr(v9 - 1, v8));
      if (!v9)
      {
        ((void (*)(std::__shared_weak_count *))v7->__on_zero_shared)(v7);
        std::__shared_weak_count::__release_weak(v7);
      }
    }
    v10 = (std::__shared_weak_count *)*((_QWORD *)&v14 + 1);
    if (*((_QWORD *)&v14 + 1))
    {
      v11 = (unint64_t *)(*((_QWORD *)&v14 + 1) + 8);
      do
        v12 = __ldaxr(v11);
      while (__stlxr(v12 - 1, v11));
      if (!v12)
      {
        ((void (*)(std::__shared_weak_count *))v10->__on_zero_shared)(v10);
        std::__shared_weak_count::__release_weak(v10);
      }
    }

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  unint64_t *p_shared_owners;
  unint64_t v6;
  void *v7;
  uint64_t v8;
  std::__shared_weak_count *v9;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)RamXPC;
  -[BackendXPC encodeWithCoder:](&v10, sel_encodeWithCoder_, v4);
  -[BackendXPC backend](self, "backend");
  objc_msgSend(v4, "encodeInt64:forKey:", (*(uint64_t (**)())(*(_QWORD *)v8 + 40))(), CFSTR("size"));
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
  -[BackendXPC instanceID](self, "instanceID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("identifier"));

}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  std::__shared_weak_count *v6;
  unint64_t *p_shared_owners;
  unint64_t v8;
  uint64_t v10;
  std::__shared_weak_count *v11;
  objc_super v12;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v12.receiver = self;
  v12.super_class = (Class)RamXPC;
  -[BackendXPC description](&v12, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[BackendXPC backend](self, "backend");
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@[ramsize=%llu]"), v4, (*(uint64_t (**)(uint64_t))(*(_QWORD *)v10 + 40))(v10));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v11;
  if (v11)
  {
    p_shared_owners = (unint64_t *)&v11->__shared_owners_;
    do
      v8 = __ldaxr(p_shared_owners);
    while (__stlxr(v8 - 1, p_shared_owners));
    if (!v8)
    {
      ((void (*)(std::__shared_weak_count *))v6->__on_zero_shared)(v6);
      std::__shared_weak_count::__release_weak(v6);
    }
  }

  return v5;
}

@end
