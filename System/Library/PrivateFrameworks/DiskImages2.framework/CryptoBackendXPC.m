@implementation CryptoBackendXPC

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CryptoBackendXPC)initWithFormat:(const void *)a3 baseBackendXPC:(id)a4
{
  id v7;
  CryptoBackendXPC *v8;
  CryptoBackendXPC *v9;
  id *p_baseBackendXPC;
  std::__shared_weak_count *v11;
  unint64_t *v12;
  unint64_t v13;
  std::__shared_weak_count *v14;
  unint64_t *v15;
  unint64_t v16;
  std::__shared_weak_count *v17;
  unint64_t *p_shared_owners;
  unint64_t v19;
  uint64_t v21;
  std::__shared_weak_count *v22;
  __int128 v23;
  __int128 v24;
  objc_super v25;

  v7 = a4;
  v25.receiver = self;
  v25.super_class = (Class)CryptoBackendXPC;
  v8 = -[CryptoBackendXPC init](&v25, sel_init);
  v9 = v8;
  if (v8)
  {
    p_baseBackendXPC = (id *)&v8->_baseBackendXPC;
    objc_storeStrong((id *)&v8->_baseBackendXPC, a4);
    if (*p_baseBackendXPC)
    {
      objc_msgSend(*p_baseBackendXPC, "backend");
    }
    else
    {
      v21 = 0;
      v22 = 0;
    }
    std::allocate_shared[abi:ne180100]<crypto_format_backend,std::allocator<crypto_format_backend>,std::shared_ptr<Backend>,std::shared_ptr<crypto::format> const&,void>((uint64_t)&v21, (uint64_t)a3, &v23);
    v24 = v23;
    v23 = 0uLL;
    -[BackendXPC setBackend:](v9, "setBackend:", &v24);
    v11 = (std::__shared_weak_count *)*((_QWORD *)&v24 + 1);
    if (*((_QWORD *)&v24 + 1))
    {
      v12 = (unint64_t *)(*((_QWORD *)&v24 + 1) + 8);
      do
        v13 = __ldaxr(v12);
      while (__stlxr(v13 - 1, v12));
      if (!v13)
      {
        ((void (*)(std::__shared_weak_count *))v11->__on_zero_shared)(v11);
        std::__shared_weak_count::__release_weak(v11);
      }
    }
    v14 = (std::__shared_weak_count *)*((_QWORD *)&v23 + 1);
    if (*((_QWORD *)&v23 + 1))
    {
      v15 = (unint64_t *)(*((_QWORD *)&v23 + 1) + 8);
      do
        v16 = __ldaxr(v15);
      while (__stlxr(v16 - 1, v15));
      if (!v16)
      {
        ((void (*)(std::__shared_weak_count *))v14->__on_zero_shared)(v14);
        std::__shared_weak_count::__release_weak(v14);
      }
    }
    v17 = v22;
    if (v22)
    {
      p_shared_owners = (unint64_t *)&v22->__shared_owners_;
      do
        v19 = __ldaxr(p_shared_owners);
      while (__stlxr(v19 - 1, p_shared_owners));
      if (!v19)
      {
        ((void (*)(std::__shared_weak_count *))v17->__on_zero_shared)(v17);
        std::__shared_weak_count::__release_weak(v17);
      }
    }
  }

  return v9;
}

- (CryptoBackendXPC)initWithCoder:(id)a3
{
  id v4;
  CryptoBackendXPC *v5;
  CryptoBackendXPC *v6;
  uint64_t v7;
  BackendXPC *baseBackendXPC;
  BackendXPC *v9;
  std::__shared_weak_count *v10;
  unint64_t *v11;
  unint64_t v12;
  std::__shared_weak_count *v13;
  unint64_t *v14;
  unint64_t v15;
  std::__shared_weak_count *v16;
  unint64_t *p_shared_owners;
  unint64_t v18;
  std::__shared_weak_count *v19;
  unint64_t *v20;
  unint64_t v21;
  _QWORD *exception;
  const std::error_category *v24;
  uint64_t v25;
  std::__shared_weak_count *v26;
  __int128 v27;
  __int128 v28;
  uint64_t v29;
  std::__shared_weak_count *v30;
  objc_super v31;

  v4 = a3;
  v31.receiver = self;
  v31.super_class = (Class)CryptoBackendXPC;
  v5 = -[BackendXPC initWithCoder:](&v31, sel_initWithCoder_, v4);
  v6 = v5;
  if (v5)
  {
    crypto::format_serializer::decode(v4, (uint64_t *)-[BackendXPC cryptoHeader](v5, "cryptoHeader"), &v29);
    if (!v29)
    {
      exception = __cxa_allocate_exception(0x40uLL);
      *exception = &off_24CF07908;
      v24 = std::generic_category();
      exception[1] = 154;
      exception[2] = v24;
      *((_BYTE *)exception + 24) = 0;
      *((_BYTE *)exception + 48) = 0;
      exception[7] = "Failed to deserialize crypto format";
    }
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("baseBackend"));
    v7 = objc_claimAutoreleasedReturnValue();
    baseBackendXPC = v6->_baseBackendXPC;
    v6->_baseBackendXPC = (BackendXPC *)v7;

    v9 = v6->_baseBackendXPC;
    if (v9)
    {
      -[BackendXPC backend](v9, "backend");
    }
    else
    {
      v25 = 0;
      v26 = 0;
    }
    std::allocate_shared[abi:ne180100]<crypto_format_backend,std::allocator<crypto_format_backend>,std::shared_ptr<Backend>,std::shared_ptr<crypto::format> &,void>((uint64_t)&v25, (uint64_t)&v29, &v27);
    v28 = v27;
    v27 = 0uLL;
    -[BackendXPC setBackend:](v6, "setBackend:", &v28);
    v10 = (std::__shared_weak_count *)*((_QWORD *)&v28 + 1);
    if (*((_QWORD *)&v28 + 1))
    {
      v11 = (unint64_t *)(*((_QWORD *)&v28 + 1) + 8);
      do
        v12 = __ldaxr(v11);
      while (__stlxr(v12 - 1, v11));
      if (!v12)
      {
        ((void (*)(std::__shared_weak_count *))v10->__on_zero_shared)(v10);
        std::__shared_weak_count::__release_weak(v10);
      }
    }
    v13 = (std::__shared_weak_count *)*((_QWORD *)&v27 + 1);
    if (*((_QWORD *)&v27 + 1))
    {
      v14 = (unint64_t *)(*((_QWORD *)&v27 + 1) + 8);
      do
        v15 = __ldaxr(v14);
      while (__stlxr(v15 - 1, v14));
      if (!v15)
      {
        ((void (*)(std::__shared_weak_count *))v13->__on_zero_shared)(v13);
        std::__shared_weak_count::__release_weak(v13);
      }
    }
    v16 = v26;
    if (v26)
    {
      p_shared_owners = (unint64_t *)&v26->__shared_owners_;
      do
        v18 = __ldaxr(p_shared_owners);
      while (__stlxr(v18 - 1, p_shared_owners));
      if (!v18)
      {
        ((void (*)(std::__shared_weak_count *))v16->__on_zero_shared)(v16);
        std::__shared_weak_count::__release_weak(v16);
      }
    }
    v19 = v30;
    if (v30)
    {
      v20 = (unint64_t *)&v30->__shared_owners_;
      do
        v21 = __ldaxr(v20);
      while (__stlxr(v21 - 1, v20));
      if (!v21)
      {
        ((void (*)(std::__shared_weak_count *))v19->__on_zero_shared)(v19);
        std::__shared_weak_count::__release_weak(v19);
      }
    }
  }

  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  crypto::format_serializer *v4;
  const crypto::format *v5;
  NSCoder *v6;
  std::__shared_weak_count *v7;
  unint64_t *p_shared_owners;
  unint64_t v9;
  unint64_t *v10;
  unint64_t v11;
  void *v12;
  unint64_t *v13;
  unint64_t v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  objc_super v18;

  v4 = (crypto::format_serializer *)a3;
  v18.receiver = self;
  v18.super_class = (Class)CryptoBackendXPC;
  -[BackendXPC encodeWithCoder:](&v18, sel_encodeWithCoder_, v4);
  -[BackendXPC backend](self, "backend");
  v17 = v15;
  v6 = *(NSCoder **)(v15 + 40);
  v7 = *(std::__shared_weak_count **)(v15 + 48);
  *(_QWORD *)&v16 = v6;
  *((_QWORD *)&v16 + 1) = v7;
  if (v7)
  {
    p_shared_owners = (unint64_t *)&v7->__shared_owners_;
    do
      v9 = __ldxr(p_shared_owners);
    while (__stxr(v9 + 1, p_shared_owners));
  }
  crypto::format_serializer::encode(v4, v6, v5);
  if (v7)
  {
    v10 = (unint64_t *)&v7->__shared_owners_;
    do
      v11 = __ldaxr(v10);
    while (__stlxr(v11 - 1, v10));
    if (!v11)
    {
      ((void (*)(std::__shared_weak_count *))v7->__on_zero_shared)(v7);
      std::__shared_weak_count::__release_weak(v7);
    }
  }
  -[CryptoBackendXPC baseBackendXPC](self, "baseBackendXPC", v16, (_QWORD)v17);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[crypto::format_serializer encodeObject:forKey:](v4, "encodeObject:forKey:", v12, CFSTR("baseBackend"));

  if (*((_QWORD *)&v17 + 1))
  {
    v13 = (unint64_t *)(*((_QWORD *)&v17 + 1) + 8);
    do
      v14 = __ldaxr(v13);
    while (__stlxr(v14 - 1, v13));
    if (!v14)
    {
      (*(void (**)(_QWORD))(**((_QWORD **)&v17 + 1) + 16))(*((_QWORD *)&v17 + 1));
      std::__shared_weak_count::__release_weak(*((std::__shared_weak_count **)&v17 + 1));
    }
  }

}

- (void)replaceWithBackendXPC:(id)a3
{
  id v5;
  __int128 v6;
  std::__shared_weak_count *v7;
  unint64_t *p_shared_owners;
  unint64_t v9;
  unint64_t *v10;
  unint64_t v11;
  __int128 v12;
  uint64_t v13;
  std::__shared_weak_count *v14;

  v5 = a3;
  -[BackendXPC backend](self, "backend");
  if (v5)
  {
    objc_msgSend(v5, "backend");
    v6 = v12;
  }
  else
  {
    v6 = 0uLL;
  }
  v7 = *(std::__shared_weak_count **)(v13 + 32);
  *(_OWORD *)(v13 + 24) = v6;
  if (v7)
  {
    p_shared_owners = (unint64_t *)&v7->__shared_owners_;
    do
      v9 = __ldaxr(p_shared_owners);
    while (__stlxr(v9 - 1, p_shared_owners));
    if (!v9)
    {
      ((void (*)(std::__shared_weak_count *))v7->__on_zero_shared)(v7);
      std::__shared_weak_count::__release_weak(v7);
    }
  }
  objc_storeStrong((id *)&self->_baseBackendXPC, a3);
  if (v14)
  {
    v10 = (unint64_t *)&v14->__shared_owners_;
    do
      v11 = __ldaxr(v10);
    while (__stlxr(v11 - 1, v10));
    if (!v11)
    {
      ((void (*)())v14->__on_zero_shared)();
      std::__shared_weak_count::__release_weak(v14);
    }
  }

}

- (BOOL)isUnlocked
{
  return 1;
}

- (BackendXPC)baseBackendXPC
{
  return self->_baseBackendXPC;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_baseBackendXPC, 0);
}

@end
