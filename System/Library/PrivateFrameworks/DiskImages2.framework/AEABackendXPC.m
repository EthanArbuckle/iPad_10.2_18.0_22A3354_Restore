@implementation AEABackendXPC

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (AEABackendXPC)initWithBackend:(id)a3 key:(shared_ptr<unsigned char>)a4
{
  uint64_t *ptr;
  id v7;
  AEABackendXPC *v8;
  AEABackendXPC *v9;
  id *p_baseBackendXPC;
  std::__shared_weak_count *v11;
  unint64_t *v12;
  unint64_t v13;
  std::__shared_weak_count *v14;
  unint64_t *v15;
  unint64_t v16;
  unint64_t *p_shared_owners;
  unint64_t v18;
  std::__shared_weak_count *v20;
  __int128 v21;
  __int128 v22;
  objc_super v23;

  ptr = (uint64_t *)a4.__ptr_;
  v7 = a3;
  v23.receiver = self;
  v23.super_class = (Class)AEABackendXPC;
  v8 = -[AEABackendXPC init](&v23, sel_init);
  v9 = v8;
  if (v8)
  {
    p_baseBackendXPC = (id *)&v8->_baseBackendXPC;
    objc_storeStrong((id *)&v8->_baseBackendXPC, a3);
    std::shared_ptr<DiskImage>::operator=[abi:ne180100](&v9->_key.__ptr_, ptr);
    if (*p_baseBackendXPC)
      objc_msgSend(*p_baseBackendXPC, "backend");
    else
      v20 = 0;
    std::allocate_shared[abi:ne180100]<AEA_backend,std::allocator<AEA_backend>,std::shared_ptr<Backend>,std::shared_ptr<unsigned char> &,void>(&v21);
    v22 = v21;
    v21 = 0uLL;
    -[BackendXPC setBackend:](v9, "setBackend:", &v22);
    v11 = (std::__shared_weak_count *)*((_QWORD *)&v22 + 1);
    if (*((_QWORD *)&v22 + 1))
    {
      v12 = (unint64_t *)(*((_QWORD *)&v22 + 1) + 8);
      do
        v13 = __ldaxr(v12);
      while (__stlxr(v13 - 1, v12));
      if (!v13)
      {
        ((void (*)(std::__shared_weak_count *))v11->__on_zero_shared)(v11);
        std::__shared_weak_count::__release_weak(v11);
      }
    }
    v14 = (std::__shared_weak_count *)*((_QWORD *)&v21 + 1);
    if (*((_QWORD *)&v21 + 1))
    {
      v15 = (unint64_t *)(*((_QWORD *)&v21 + 1) + 8);
      do
        v16 = __ldaxr(v15);
      while (__stlxr(v16 - 1, v15));
      if (!v16)
      {
        ((void (*)(std::__shared_weak_count *))v14->__on_zero_shared)(v14);
        std::__shared_weak_count::__release_weak(v14);
      }
    }
    if (v20)
    {
      p_shared_owners = (unint64_t *)&v20->__shared_owners_;
      do
        v18 = __ldaxr(p_shared_owners);
      while (__stlxr(v18 - 1, p_shared_owners));
      if (!v18)
      {
        ((void (*)(std::__shared_weak_count *))v20->__on_zero_shared)(v20);
        std::__shared_weak_count::__release_weak(v20);
      }
    }
  }

  return v9;
}

- (AEABackendXPC)initWithCoder:(id)a3
{
  id v4;
  AEABackendXPC *v5;
  id v6;
  _OWORD *v7;
  uint64_t v8;
  std::__shared_weak_count *v9;
  unint64_t *v10;
  unint64_t v11;
  char *ptr;
  __int128 v13;
  uint64_t v14;
  BackendXPC *baseBackendXPC;
  BackendXPC *v16;
  AEABackendXPC *v17;
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
  uint64_t v31;
  objc_super v32;

  v4 = a3;
  v32.receiver = self;
  v32.super_class = (Class)AEABackendXPC;
  v5 = -[BackendXPC initWithCoder:](&v32, sel_initWithCoder_, v4);
  if (!v5)
  {
LABEL_28:
    v17 = v5;
    goto LABEL_29;
  }
  v31 = 0;
  v6 = objc_retainAutorelease(v4);
  v7 = (_OWORD *)objc_msgSend(v6, "decodeBytesForKey:returnedLength:", CFSTR("encKeys"), &v31);
  if (v7 && v31 == 32)
  {
    v8 = operator new[]();
    std::shared_ptr<unsigned char>::shared_ptr[abi:ne180100]<unsigned char,std::default_delete<unsigned char []>,void>(&v30, v8);
    std::shared_ptr<_di_plugin_t>::operator=[abi:ne180100]((uint64_t)&v5->_key, &v30);
    v9 = (std::__shared_weak_count *)*((_QWORD *)&v30 + 1);
    if (*((_QWORD *)&v30 + 1))
    {
      v10 = (unint64_t *)(*((_QWORD *)&v30 + 1) + 8);
      do
        v11 = __ldaxr(v10);
      while (__stlxr(v11 - 1, v10));
      if (!v11)
      {
        ((void (*)(std::__shared_weak_count *))v9->__on_zero_shared)(v9);
        std::__shared_weak_count::__release_weak(v9);
      }
    }
    ptr = v5->_key.__ptr_;
    v13 = v7[1];
    *(_OWORD *)ptr = *v7;
    *((_OWORD *)ptr + 1) = v13;
    objc_msgSend(v6, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("baseBackend"));
    v14 = objc_claimAutoreleasedReturnValue();
    baseBackendXPC = v5->_baseBackendXPC;
    v5->_baseBackendXPC = (BackendXPC *)v14;

    v16 = v5->_baseBackendXPC;
    if (v16)
      -[BackendXPC backend](v16, "backend");
    else
      v30 = 0uLL;
    std::allocate_shared[abi:ne180100]<AEA_backend,std::allocator<AEA_backend>,std::shared_ptr<Backend>,std::shared_ptr<unsigned char> &,void>(&v28);
    v29 = v28;
    v28 = 0uLL;
    -[BackendXPC setBackend:](v5, "setBackend:", &v29, 0);
    v18 = (std::__shared_weak_count *)*((_QWORD *)&v29 + 1);
    if (*((_QWORD *)&v29 + 1))
    {
      v19 = (unint64_t *)(*((_QWORD *)&v29 + 1) + 8);
      do
        v20 = __ldaxr(v19);
      while (__stlxr(v20 - 1, v19));
      if (!v20)
      {
        ((void (*)(std::__shared_weak_count *))v18->__on_zero_shared)(v18);
        std::__shared_weak_count::__release_weak(v18);
      }
    }
    v21 = (std::__shared_weak_count *)*((_QWORD *)&v28 + 1);
    if (*((_QWORD *)&v28 + 1))
    {
      v22 = (unint64_t *)(*((_QWORD *)&v28 + 1) + 8);
      do
        v23 = __ldaxr(v22);
      while (__stlxr(v23 - 1, v22));
      if (!v23)
      {
        ((void (*)(std::__shared_weak_count *))v21->__on_zero_shared)(v21);
        std::__shared_weak_count::__release_weak(v21);
      }
    }
    v24 = (std::__shared_weak_count *)*((_QWORD *)&v30 + 1);
    if (*((_QWORD *)&v30 + 1))
    {
      v25 = (unint64_t *)(*((_QWORD *)&v30 + 1) + 8);
      do
        v26 = __ldaxr(v25);
      while (__stlxr(v26 - 1, v25));
      if (!v26)
      {
        ((void (*)(std::__shared_weak_count *))v24->__on_zero_shared)(v24);
        std::__shared_weak_count::__release_weak(v24);
      }
    }
    goto LABEL_28;
  }
  v17 = 0;
LABEL_29:

  return v17;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  objc_super v6;

  v4 = a3;
  v6.receiver = self;
  v6.super_class = (Class)AEABackendXPC;
  -[BackendXPC encodeWithCoder:](&v6, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeBytes:length:forKey:", self->_key.__ptr_, 32, CFSTR("encKeys"));
  -[AEABackendXPC baseBackendXPC](self, "baseBackendXPC");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("baseBackend"));

}

- (BackendXPC)baseBackendXPC
{
  return self->_baseBackendXPC;
}

- (shared_ptr<unsigned)key
{
  char **v2;
  __shared_weak_count *cntrl;
  unint64_t *v4;
  unint64_t v5;
  shared_ptr<unsigned char> result;

  cntrl = self->_key.__cntrl_;
  *v2 = self->_key.__ptr_;
  v2[1] = (char *)cntrl;
  if (cntrl)
  {
    v4 = (unint64_t *)((char *)cntrl + 8);
    do
      v5 = __ldxr(v4);
    while (__stxr(v5 + 1, v4));
  }
  result.__cntrl_ = (__shared_weak_count *)a2;
  result.__ptr_ = (char *)self;
  return result;
}

- (void).cxx_destruct
{
  std::shared_ptr<char>::~shared_ptr[abi:ne180100]((uint64_t)&self->_key);
  objc_storeStrong((id *)&self->_baseBackendXPC, 0);
}

- (id).cxx_construct
{
  *((_QWORD *)self + 5) = 0;
  *((_QWORD *)self + 6) = 0;
  return self;
}

@end
