@implementation KNOXBackendXPC

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (KNOXBackendXPC)initWithURL:(id)a3 key:(void *)a4
{
  id v7;
  KNOXBackendXPC *v8;
  KNOXBackendXPC *v9;
  void *v10;
  id v11;
  std::__shared_weak_count *v12;
  unint64_t *v13;
  unint64_t v14;
  std::__shared_weak_count *v15;
  unint64_t *v16;
  unint64_t v17;
  std::__shared_weak_count *v18;
  unint64_t *p_shared_owners;
  unint64_t v20;
  int v22;
  char *v23;
  uint64_t v24;
  std::__shared_weak_count *v25;
  __int128 v26;
  __int128 v27;
  objc_super v28;

  v7 = a3;
  v28.receiver = self;
  v28.super_class = (Class)KNOXBackendXPC;
  v8 = -[KNOXBackendXPC init](&v28, sel_init);
  v9 = v8;
  if (v8)
  {
    std::shared_ptr<DiskImage>::operator=[abi:ne180100](&v8->_key.__ptr_, (uint64_t *)a4);
    objc_storeStrong((id *)&v9->_URL, a3);
    -[KNOXBackendXPC URL](v9, "URL");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "absoluteString");
    v11 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v23 = (char *)objc_msgSend(v11, "UTF8String");
    std::allocate_shared[abi:ne180100]<std::string,std::allocator<std::string>,char const*,void>(&v23, &v24);
    v22 = 0;
    std::allocate_shared[abi:ne180100]<Knoxbackend,std::allocator<Knoxbackend>,std::shared_ptr<std::string>,int,std::shared_ptr<unsigned char> &,void>((uint64_t)&v24, &v22, &v26);
    v27 = v26;
    v26 = 0uLL;
    -[BackendXPC setBackend:](v9, "setBackend:", &v27);
    v12 = (std::__shared_weak_count *)*((_QWORD *)&v27 + 1);
    if (*((_QWORD *)&v27 + 1))
    {
      v13 = (unint64_t *)(*((_QWORD *)&v27 + 1) + 8);
      do
        v14 = __ldaxr(v13);
      while (__stlxr(v14 - 1, v13));
      if (!v14)
      {
        ((void (*)(std::__shared_weak_count *))v12->__on_zero_shared)(v12);
        std::__shared_weak_count::__release_weak(v12);
      }
    }
    v15 = (std::__shared_weak_count *)*((_QWORD *)&v26 + 1);
    if (*((_QWORD *)&v26 + 1))
    {
      v16 = (unint64_t *)(*((_QWORD *)&v26 + 1) + 8);
      do
        v17 = __ldaxr(v16);
      while (__stlxr(v17 - 1, v16));
      if (!v17)
      {
        ((void (*)(std::__shared_weak_count *))v15->__on_zero_shared)(v15);
        std::__shared_weak_count::__release_weak(v15);
      }
    }
    v18 = v25;
    if (v25)
    {
      p_shared_owners = (unint64_t *)&v25->__shared_owners_;
      do
        v20 = __ldaxr(p_shared_owners);
      while (__stlxr(v20 - 1, p_shared_owners));
      if (!v20)
      {
        ((void (*)(std::__shared_weak_count *))v18->__on_zero_shared)(v18);
        std::__shared_weak_count::__release_weak(v18);
      }
    }

  }
  return v9;
}

- (KNOXBackendXPC)initWithCoder:(id)a3
{
  id v4;
  KNOXBackendXPC *v5;
  uint64_t v6;
  DIURL *URL;
  _OWORD *v8;
  uint64_t v9;
  std::__shared_weak_count *v10;
  unint64_t *v11;
  unint64_t v12;
  char *ptr;
  __int128 v14;
  void *v15;
  id v16;
  std::__shared_weak_count *v17;
  unint64_t *v18;
  unint64_t v19;
  std::__shared_weak_count *v20;
  unint64_t *v21;
  unint64_t v22;
  std::__shared_weak_count *v23;
  unint64_t *v24;
  unint64_t v25;
  KNOXBackendXPC *v26;
  int v28;
  char *v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  uint64_t v33;
  objc_super v34;

  v4 = a3;
  v34.receiver = self;
  v34.super_class = (Class)KNOXBackendXPC;
  v5 = -[BackendXPC initWithCoder:](&v34, sel_initWithCoder_, v4);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("URL"));
    v6 = objc_claimAutoreleasedReturnValue();
    URL = v5->_URL;
    v5->_URL = (DIURL *)v6;

    v33 = 0;
    v8 = (_OWORD *)objc_msgSend(objc_retainAutorelease(v4), "decodeBytesForKey:returnedLength:", CFSTR("encKeys"), &v33);
    if (!v8 || v33 != 32)
    {
      v26 = 0;
      goto LABEL_27;
    }
    v9 = operator new[]();
    std::shared_ptr<unsigned char>::shared_ptr[abi:ne180100]<unsigned char,std::default_delete<unsigned char []>,void>(&v32, v9);
    std::shared_ptr<_di_plugin_t>::operator=[abi:ne180100]((uint64_t)&v5->_key, &v32);
    v10 = (std::__shared_weak_count *)*((_QWORD *)&v32 + 1);
    if (*((_QWORD *)&v32 + 1))
    {
      v11 = (unint64_t *)(*((_QWORD *)&v32 + 1) + 8);
      do
        v12 = __ldaxr(v11);
      while (__stlxr(v12 - 1, v11));
      if (!v12)
      {
        ((void (*)(std::__shared_weak_count *))v10->__on_zero_shared)(v10);
        std::__shared_weak_count::__release_weak(v10);
      }
    }
    ptr = v5->_key.__ptr_;
    v14 = v8[1];
    *(_OWORD *)ptr = *v8;
    *((_OWORD *)ptr + 1) = v14;
    -[KNOXBackendXPC URL](v5, "URL");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "absoluteString");
    v16 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v29 = (char *)objc_msgSend(v16, "UTF8String");
    std::allocate_shared[abi:ne180100]<std::string,std::allocator<std::string>,char const*,void>(&v29, &v32);
    v28 = 0;
    std::allocate_shared[abi:ne180100]<Knoxbackend,std::allocator<Knoxbackend>,std::shared_ptr<std::string>,int,std::shared_ptr<unsigned char> &,void>((uint64_t)&v32, &v28, &v30);
    v31 = v30;
    v30 = 0uLL;
    -[BackendXPC setBackend:](v5, "setBackend:", &v31);
    v17 = (std::__shared_weak_count *)*((_QWORD *)&v31 + 1);
    if (*((_QWORD *)&v31 + 1))
    {
      v18 = (unint64_t *)(*((_QWORD *)&v31 + 1) + 8);
      do
        v19 = __ldaxr(v18);
      while (__stlxr(v19 - 1, v18));
      if (!v19)
      {
        ((void (*)(std::__shared_weak_count *))v17->__on_zero_shared)(v17);
        std::__shared_weak_count::__release_weak(v17);
      }
    }
    v20 = (std::__shared_weak_count *)*((_QWORD *)&v30 + 1);
    if (*((_QWORD *)&v30 + 1))
    {
      v21 = (unint64_t *)(*((_QWORD *)&v30 + 1) + 8);
      do
        v22 = __ldaxr(v21);
      while (__stlxr(v22 - 1, v21));
      if (!v22)
      {
        ((void (*)(std::__shared_weak_count *))v20->__on_zero_shared)(v20);
        std::__shared_weak_count::__release_weak(v20);
      }
    }
    v23 = (std::__shared_weak_count *)*((_QWORD *)&v32 + 1);
    if (*((_QWORD *)&v32 + 1))
    {
      v24 = (unint64_t *)(*((_QWORD *)&v32 + 1) + 8);
      do
        v25 = __ldaxr(v24);
      while (__stlxr(v25 - 1, v24));
      if (!v25)
      {
        ((void (*)(std::__shared_weak_count *))v23->__on_zero_shared)(v23);
        std::__shared_weak_count::__release_weak(v23);
      }
    }

  }
  v26 = v5;
LABEL_27:

  return v26;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  objc_super v6;

  v4 = a3;
  v6.receiver = self;
  v6.super_class = (Class)KNOXBackendXPC;
  -[BackendXPC encodeWithCoder:](&v6, sel_encodeWithCoder_, v4);
  -[KNOXBackendXPC URL](self, "URL");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("URL"));

  objc_msgSend(v4, "encodeBytes:length:forKey:", self->_key.__ptr_, 32, CFSTR("encKeys"));
}

- (DIURL)URL
{
  return self->_URL;
}

- (void)setURL:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
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
  objc_storeStrong((id *)&self->_URL, 0);
}

- (id).cxx_construct
{
  *((_QWORD *)self + 5) = 0;
  *((_QWORD *)self + 6) = 0;
  return self;
}

@end
