@implementation EspressoContext

- (EspressoContext)initWithContext:(shared_ptr<Espresso::abstract_context>)a3
{
  std::shared_ptr<Espresso::analysis_result>::operator=[abi:ne180100](&self->_ctx.__ptr_, *(_QWORD *)a3.__ptr_, *((_QWORD *)a3.__ptr_ + 1));
  return self;
}

- (EspressoContext)initWithPlatform:(int)a3
{
  std::__shared_weak_count *v4;
  unint64_t *v5;
  unint64_t v6;
  int v8;
  __int128 v9;

  v8 = a3;
  Espresso::create_context(&v8, &v9);
  std::shared_ptr<Espresso::blob<unsigned short,4>>::operator=[abi:ne180100]((uint64_t)&self->_ctx, &v9);
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
  return self;
}

- (EspressoContext)initWithDevice:(id)a3 andWisdomParams:(id)a4
{
  std::__shared_weak_count *v5;
  unint64_t *v6;
  unint64_t v7;
  __int128 v9;

  Espresso::create_metal_context((uint64_t)&v9, a3, a4);
  std::shared_ptr<Espresso::blob<unsigned short,4>>::operator=[abi:ne180100]((uint64_t)&self->_ctx, &v9);
  v5 = (std::__shared_weak_count *)*((_QWORD *)&v9 + 1);
  if (*((_QWORD *)&v9 + 1))
  {
    v6 = (unint64_t *)(*((_QWORD *)&v9 + 1) + 8);
    do
      v7 = __ldaxr(v6);
    while (__stlxr(v7 - 1, v6));
    if (!v7)
    {
      ((void (*)(std::__shared_weak_count *))v5->__on_zero_shared)(v5);
      std::__shared_weak_count::__release_weak(v5);
    }
  }
  return self;
}

- (EspressoContext)initWithNetworkContext:(id)a3
{
  std::shared_ptr<Espresso::analysis_result>::operator=[abi:ne180100](&self->_ctx.__ptr_, *(_QWORD *)(*((_QWORD *)a3 + 1) + 16), *(_QWORD *)(*((_QWORD *)a3 + 1) + 24));
  return self;
}

- (int)platform
{
  return (***((uint64_t (****)(_QWORD))self->_ctx.__ptr_ + 1))(*((_QWORD *)self->_ctx.__ptr_ + 1));
}

- (void)set_priority:(BOOL)a3 low_priority_max_ms_per_command_buffer:(float)a4 gpu_priority:(unsigned int)a5
{
  (*(void (**)(abstract_context *, BOOL, _QWORD, float))(*(_QWORD *)self->_ctx.__ptr_ + 16))(self->_ctx.__ptr_, a3, *(_QWORD *)&a5, a4);
}

- (shared_ptr<Espresso::abstract_context>)ctx
{
  void *v2;
  abstract_context *v3;
  __shared_weak_count *v4;
  shared_ptr<Espresso::abstract_context> result;

  objc_copyCppObjectAtomic(v2, &self->_ctx, (void (__cdecl *)(void *, const void *))__copy_helper_atomic_property__36);
  result.__cntrl_ = v4;
  result.__ptr_ = v3;
  return result;
}

- (void).cxx_destruct
{
  std::shared_ptr<void>::~shared_ptr[abi:ne180100]((uint64_t)&self->_ctx);
}

- (id).cxx_construct
{
  *((_QWORD *)self + 1) = 0;
  *((_QWORD *)self + 2) = 0;
  return self;
}

@end
