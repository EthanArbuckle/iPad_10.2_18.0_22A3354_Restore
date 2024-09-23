@implementation _CSStoreAccessContext

- (id)initForSharedReading
{
  char *v2;
  char *v3;
  __int128 v4;
  std::__shared_weak_count *v5;
  unint64_t *p_shared_owners;
  unint64_t v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)_CSStoreAccessContext;
  v2 = -[_CSStoreAccessContext init](&v9, sel_init);
  if (v2)
  {
    v3 = (char *)operator new(0x50uLL);
    *((_QWORD *)v3 + 1) = 0;
    *((_QWORD *)v3 + 2) = 0;
    *((_QWORD *)v3 + 3) = off_1E4E21230;
    *(_QWORD *)v3 = &off_1E4E21328;
    *((_DWORD *)v3 + 8) = 0;
    *(_OWORD *)(v3 + 40) = 0u;
    *(_OWORD *)(v3 + 56) = 0u;
    *((_DWORD *)v3 + 18) = 1065353216;
    *(_QWORD *)&v4 = v3 + 24;
    *((_QWORD *)&v4 + 1) = v3;
    v5 = (std::__shared_weak_count *)*((_QWORD *)v2 + 2);
    *(_OWORD *)(v2 + 8) = v4;
    if (v5)
    {
      p_shared_owners = (unint64_t *)&v5->__shared_owners_;
      do
        v7 = __ldaxr(p_shared_owners);
      while (__stlxr(v7 - 1, p_shared_owners));
      if (!v7)
      {
        ((void (*)(std::__shared_weak_count *))v5->__on_zero_shared)(v5);
        std::__shared_weak_count::__release_weak(v5);
      }
    }
  }
  return v2;
}

- (id)description
{
  id v3;
  void *v4;
  void *v5;

  v3 = objc_alloc(MEMORY[0x1E0CB3940]);
  v4 = (void *)(*(uint64_t (**)(CSStoreAccessContextInterface *))(*(_QWORD *)self->_impl.__ptr_ + 32))(self->_impl.__ptr_);
  v5 = (void *)objc_msgSend(v3, "initWithFormat:", CFSTR("<_CSStoreAccessContext: %@>"), v4);

  return v5;
}

- (void).cxx_destruct
{
  __shared_weak_count *cntrl;
  unint64_t *v3;
  unint64_t v4;

  cntrl = self->_impl.__cntrl_;
  if (cntrl)
  {
    v3 = (unint64_t *)((char *)cntrl + 8);
    do
      v4 = __ldaxr(v3);
    while (__stlxr(v4 - 1, v3));
    if (!v4)
    {
      (*(void (**)(__shared_weak_count *, SEL))(*(_QWORD *)cntrl + 16))(cntrl, a2);
      std::__shared_weak_count::__release_weak((std::__shared_weak_count *)cntrl);
    }
  }
}

- (id).cxx_construct
{
  *((_QWORD *)self + 1) = 0;
  *((_QWORD *)self + 2) = 0;
  return self;
}

@end
