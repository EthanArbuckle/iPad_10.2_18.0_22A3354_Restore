@implementation EspressoNetwork

- (EspressoContext)ctx
{
  EspressoContext *v3;
  net *ptr;
  std::__shared_weak_count *v5;
  uint64_t v6;
  unint64_t *p_shared_owners;
  unint64_t v8;
  EspressoContext *v9;
  std::__shared_weak_count *v10;
  unint64_t *v11;
  unint64_t v12;
  uint64_t v14;
  std::__shared_weak_count *v15;

  v3 = [EspressoContext alloc];
  ptr = self->_net.__ptr_;
  v6 = *((_QWORD *)ptr + 2);
  v5 = (std::__shared_weak_count *)*((_QWORD *)ptr + 3);
  v14 = v6;
  v15 = v5;
  if (v5)
  {
    p_shared_owners = (unint64_t *)&v5->__shared_owners_;
    do
      v8 = __ldxr(p_shared_owners);
    while (__stxr(v8 + 1, p_shared_owners));
  }
  v9 = -[EspressoContext initWithContext:](v3, "initWithContext:", &v14);
  v10 = v15;
  if (v15)
  {
    v11 = (unint64_t *)&v15->__shared_owners_;
    do
      v12 = __ldaxr(v11);
    while (__stlxr(v12 - 1, v11));
    if (!v12)
    {
      ((void (*)(std::__shared_weak_count *))v10->__on_zero_shared)(v10);
      std::__shared_weak_count::__release_weak(v10);
    }
  }
  return v9;
}

- (EspressoNetwork)initWithJSFile:(const char *)a3 context:(id)a4 computePath:(int)a5
{
  id v8;
  std::__shared_weak_count *v9;
  unint64_t *v10;
  unint64_t v11;
  std::__shared_weak_count *v12;
  unint64_t *p_shared_owners;
  unint64_t v14;
  uint64_t v16;
  std::__shared_weak_count *v17;
  void *__p[2];
  char v19;
  __int128 v20;

  v8 = a4;
  std::string::basic_string[abi:ne180100]<0>(__p, (char *)a3);
  if (v8)
  {
    objc_msgSend(v8, "ctx");
  }
  else
  {
    v16 = 0;
    v17 = 0;
  }
  Espresso::load_network((uint64_t)__p, &v16, a5, 0, (uint64_t *)&v20);
  std::shared_ptr<Espresso::blob<unsigned short,4>>::operator=[abi:ne180100]((uint64_t)&self->_net, &v20);
  v9 = (std::__shared_weak_count *)*((_QWORD *)&v20 + 1);
  if (*((_QWORD *)&v20 + 1))
  {
    v10 = (unint64_t *)(*((_QWORD *)&v20 + 1) + 8);
    do
      v11 = __ldaxr(v10);
    while (__stlxr(v11 - 1, v10));
    if (!v11)
    {
      ((void (*)(std::__shared_weak_count *))v9->__on_zero_shared)(v9);
      std::__shared_weak_count::__release_weak(v9);
    }
  }
  v12 = v17;
  if (v17)
  {
    p_shared_owners = (unint64_t *)&v17->__shared_owners_;
    do
      v14 = __ldaxr(p_shared_owners);
    while (__stlxr(v14 - 1, p_shared_owners));
    if (!v14)
    {
      ((void (*)(std::__shared_weak_count *))v12->__on_zero_shared)(v12);
      std::__shared_weak_count::__release_weak(v12);
    }
  }
  if (v19 < 0)
    operator delete(__p[0]);

  return self;
}

- (EspressoNetwork)initWithJSFile:(const char *)a3 binSerializerId:(const char *)a4 context:(id)a5 computePath:(int)a6
{
  uint64_t v6;
  id v10;
  std::__shared_weak_count *v11;
  unint64_t *v12;
  unint64_t v13;
  std::__shared_weak_count *v14;
  unint64_t *p_shared_owners;
  unint64_t v16;
  uint64_t v18;
  std::__shared_weak_count *v19;
  void *__p[2];
  char v21;
  void *v22[2];
  char v23;
  __int128 v24;

  v6 = *(_QWORD *)&a6;
  v10 = a5;
  std::string::basic_string[abi:ne180100]<0>(v22, (char *)a3);
  std::string::basic_string[abi:ne180100]<0>(__p, (char *)a4);
  if (v10)
  {
    objc_msgSend(v10, "ctx");
  }
  else
  {
    v18 = 0;
    v19 = 0;
  }
  Espresso::load_network_binserializer((uint64_t)v22, (const void **)__p, &v18, v6, 1, (uint64_t)&v24);
  std::shared_ptr<Espresso::blob<unsigned short,4>>::operator=[abi:ne180100]((uint64_t)&self->_net, &v24);
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
  v14 = v19;
  if (v19)
  {
    p_shared_owners = (unint64_t *)&v19->__shared_owners_;
    do
      v16 = __ldaxr(p_shared_owners);
    while (__stlxr(v16 - 1, p_shared_owners));
    if (!v16)
    {
      ((void (*)(std::__shared_weak_count *))v14->__on_zero_shared)(v14);
      std::__shared_weak_count::__release_weak(v14);
    }
  }
  if (v21 < 0)
    operator delete(__p[0]);
  if (v23 < 0)
    operator delete(v22[0]);

  return self;
}

- (unint64_t)layers_size
{
  return (uint64_t)(*((_QWORD *)self->_net.__ptr_ + 5) - *((_QWORD *)self->_net.__ptr_ + 4)) >> 4;
}

- (void)wipe_layers_blobs
{
  Espresso::net::wipe_layers_blobs((Espresso::net *)self->_net.__ptr_);
}

- (shared_ptr<Espresso::net>)net
{
  void *v2;
  net *v3;
  __shared_weak_count *v4;
  shared_ptr<Espresso::net> result;

  objc_copyCppObjectAtomic(v2, &self->_net, (void (__cdecl *)(void *, const void *))__copy_helper_atomic_property__2621);
  result.__cntrl_ = v4;
  result.__ptr_ = v3;
  return result;
}

- (void).cxx_destruct
{
  std::shared_ptr<void>::~shared_ptr[abi:ne180100]((uint64_t)&self->_net);
}

- (id).cxx_construct
{
  *((_QWORD *)self + 1) = 0;
  *((_QWORD *)self + 2) = 0;
  return self;
}

@end
