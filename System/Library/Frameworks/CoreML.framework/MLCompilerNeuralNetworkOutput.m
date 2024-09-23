@implementation MLCompilerNeuralNetworkOutput

- (MLCompilerNeuralNetworkOutput)initWithEspressoNetwork:(shared_ptr<Espresso::net>)a3
{
  net *ptr;
  MLCompilerNeuralNetworkOutput *v4;
  MLCompilerNeuralNetworkOutput *v5;
  objc_super v7;

  ptr = a3.__ptr_;
  v7.receiver = self;
  v7.super_class = (Class)MLCompilerNeuralNetworkOutput;
  v4 = -[MLCompilerNeuralNetworkOutput init](&v7, sel_init, a3.__ptr_, a3.__cntrl_);
  v5 = v4;
  if (v4)
    std::shared_ptr<unsigned char>::operator=[abi:ne180100](&v4->_network.__ptr_, *(_QWORD *)ptr, *((_QWORD *)ptr + 1));
  return v5;
}

- (MLCompilerNeuralNetworkOutput)initWithMILProgram:(shared_ptr<MIL::IRProgram>)a3
{
  IRProgram *ptr;
  MLCompilerNeuralNetworkOutput *v4;
  MLCompilerNeuralNetworkOutput *v5;
  uint64_t v6;
  IRProgram *v7;
  unint64_t *v8;
  unint64_t v9;
  std::__shared_weak_count *cntrl;
  unint64_t *p_shared_owners;
  unint64_t v12;
  objc_super v14;

  ptr = a3.__ptr_;
  v14.receiver = self;
  v14.super_class = (Class)MLCompilerNeuralNetworkOutput;
  v4 = -[MLCompilerNeuralNetworkOutput init](&v14, sel_init, a3.__ptr_, a3.__cntrl_);
  v5 = v4;
  if (v4)
  {
    v7 = *(IRProgram **)ptr;
    v6 = *((_QWORD *)ptr + 1);
    if (v6)
    {
      v8 = (unint64_t *)(v6 + 8);
      do
        v9 = __ldxr(v8);
      while (__stxr(v9 + 1, v8));
    }
    cntrl = (std::__shared_weak_count *)v4->_program.__cntrl_;
    v4->_program.__ptr_ = v7;
    v4->_program.__cntrl_ = (__shared_weak_count *)v6;
    if (cntrl)
    {
      p_shared_owners = (unint64_t *)&cntrl->__shared_owners_;
      do
        v12 = __ldaxr(p_shared_owners);
      while (__stlxr(v12 - 1, p_shared_owners));
      if (!v12)
      {
        ((void (*)(std::__shared_weak_count *))cntrl->__on_zero_shared)(cntrl);
        std::__shared_weak_count::__release_weak(cntrl);
      }
    }
  }
  return v5;
}

- (shared_ptr<Espresso::net>)network
{
  net **v2;
  __shared_weak_count *cntrl;
  unint64_t *v4;
  unint64_t v5;
  shared_ptr<Espresso::net> result;

  cntrl = self->_network.__cntrl_;
  *v2 = self->_network.__ptr_;
  v2[1] = (net *)cntrl;
  if (cntrl)
  {
    v4 = (unint64_t *)((char *)cntrl + 8);
    do
      v5 = __ldxr(v4);
    while (__stxr(v5 + 1, v4));
  }
  result.__cntrl_ = (__shared_weak_count *)a2;
  result.__ptr_ = (net *)self;
  return result;
}

- (shared_ptr<MIL::IRProgram>)program
{
  IRProgram **v2;
  __shared_weak_count *cntrl;
  unint64_t *v4;
  unint64_t v5;
  shared_ptr<MIL::IRProgram> result;

  cntrl = self->_program.__cntrl_;
  *v2 = self->_program.__ptr_;
  v2[1] = (IRProgram *)cntrl;
  if (cntrl)
  {
    v4 = (unint64_t *)((char *)cntrl + 8);
    do
      v5 = __ldxr(v4);
    while (__stxr(v5 + 1, v4));
  }
  result.__cntrl_ = (__shared_weak_count *)a2;
  result.__ptr_ = (IRProgram *)self;
  return result;
}

- (void).cxx_destruct
{
  std::shared_ptr<nlohmann::detail::output_adapter_protocol<char>>::~shared_ptr[abi:ne180100]((uint64_t)&self->_program);
  std::shared_ptr<nlohmann::detail::output_adapter_protocol<char>>::~shared_ptr[abi:ne180100]((uint64_t)&self->_network);
}

- (id).cxx_construct
{
  *(_OWORD *)((char *)self + 24) = 0u;
  *(_OWORD *)((char *)self + 8) = 0u;
  return self;
}

+ (id)outputWithEspressoNetwork:(shared_ptr<Espresso::net>)a3
{
  net *ptr;
  id v4;
  std::__shared_weak_count *v5;
  unint64_t *p_shared_owners;
  unint64_t v7;
  void *v8;
  std::__shared_weak_count *v9;
  unint64_t *v10;
  unint64_t v11;
  uint64_t v13;
  std::__shared_weak_count *v14;

  ptr = a3.__ptr_;
  v4 = objc_alloc((Class)a1);
  v5 = (std::__shared_weak_count *)*((_QWORD *)ptr + 1);
  v13 = *(_QWORD *)ptr;
  v14 = v5;
  if (v5)
  {
    p_shared_owners = (unint64_t *)&v5->__shared_owners_;
    do
      v7 = __ldxr(p_shared_owners);
    while (__stxr(v7 + 1, p_shared_owners));
  }
  v8 = (void *)objc_msgSend(v4, "initWithEspressoNetwork:", &v13);
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
  return v8;
}

+ (id)outputWithMILProgram:()unique_ptr<MIL:(std::default_delete<MIL::IRProgram>>)a3 :IRProgram
{
  id v4;
  std::__shared_weak_count *v5;
  std::__shared_weak_count_vtbl *v6;
  void *v7;
  std::__shared_weak_count *v8;
  unint64_t *p_shared_owners;
  unint64_t v10;
  uint64_t v12;
  std::__shared_weak_count *v13;

  v4 = objc_alloc((Class)a1);
  v12 = *(_QWORD *)a3.var0.var0;
  if (v12)
  {
    v5 = (std::__shared_weak_count *)operator new();
    v6 = *(std::__shared_weak_count_vtbl **)a3.var0.var0;
    v5->__vftable = (std::__shared_weak_count_vtbl *)&off_1E3D5C4F0;
    v5->__shared_owners_ = 0;
    v5->__shared_weak_owners_ = 0;
    v5[1].__vftable = v6;
  }
  else
  {
    v5 = 0;
  }
  v13 = v5;
  *(_QWORD *)a3.var0.var0 = 0;
  v7 = (void *)objc_msgSend(v4, "initWithMILProgram:", &v12);
  v8 = v13;
  if (v13)
  {
    p_shared_owners = (unint64_t *)&v13->__shared_owners_;
    do
      v10 = __ldaxr(p_shared_owners);
    while (__stlxr(v10 - 1, p_shared_owners));
    if (!v10)
    {
      ((void (*)(std::__shared_weak_count *))v8->__on_zero_shared)(v8);
      std::__shared_weak_count::__release_weak(v8);
    }
  }
  return v7;
}

@end
