@implementation EspressoInnerProductWeightsForMPS

- (id).cxx_construct
{
  *((_BYTE *)self + 48) = 0;
  *((_DWORD *)self + 15) = -1;
  __asm { FMOV            V0.2S, #1.0 }
  *((_QWORD *)self + 8) = _D0;
  *(_QWORD *)((char *)self + 132) = 0;
  *(_OWORD *)((char *)self + 8) = xmmword_191A93320;
  *((_DWORD *)self + 6) = 0;
  *(_QWORD *)((char *)self + 28) = _D0;
  *(_QWORD *)((char *)self + 92) = 0;
  *(_QWORD *)((char *)self + 36) = 0;
  *(_QWORD *)((char *)self + 52) = 0;
  *((_DWORD *)self + 11) = 0;
  *(_QWORD *)((char *)self + 108) = 0;
  *(_QWORD *)((char *)self + 124) = 0;
  *(_QWORD *)((char *)self + 116) = 0;
  *((_OWORD *)self + 9) = 0u;
  *((_OWORD *)self + 10) = 0u;
  *((_OWORD *)self + 11) = 0u;
  *((_OWORD *)self + 12) = 0u;
  *((_OWORD *)self + 13) = 0u;
  *((_OWORD *)self + 14) = 0u;
  return self;
}

- (void).cxx_destruct
{
  std::shared_ptr<void>::~shared_ptr[abi:ne180100]((uint64_t)&self->quantization_lut);
  std::shared_ptr<void>::~shared_ptr[abi:ne180100]((uint64_t)&self->quantization_ranges);
  std::shared_ptr<void>::~shared_ptr[abi:ne180100]((uint64_t)&self->biases_blob);
  std::shared_ptr<void>::~shared_ptr[abi:ne180100]((uint64_t)&self->quantized_weights_blob);
  std::shared_ptr<void>::~shared_ptr[abi:ne180100]((uint64_t)&self->weights_f16_blob);
  std::shared_ptr<void>::~shared_ptr[abi:ne180100]((uint64_t)&self->weights_blob);
}

- (EspressoInnerProductWeightsForMPS)initWithParams:(inner_product_uniforms *)a3
{
  char *v4;
  EspressoInnerProductWeightsForMPS *v5;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  std::__shared_weak_count *v12;
  unint64_t *v13;
  unint64_t v14;
  std::__shared_weak_count *v15;
  unint64_t *v16;
  unint64_t v17;
  __int128 v19;
  objc_super v20;

  v20.receiver = self;
  v20.super_class = (Class)EspressoInnerProductWeightsForMPS;
  v4 = -[EspressoInnerProductWeightsForMPS init](&v20, sel_init);
  v5 = (EspressoInnerProductWeightsForMPS *)v4;
  if (v4)
  {
    *(_OWORD *)(v4 + 8) = *(_OWORD *)&a3->nC;
    v6 = *(_OWORD *)&a3->has_tanh;
    v7 = *(_OWORD *)&a3->is_lookup;
    v8 = *(_OWORD *)&a3->use_raw_buffers;
    *(_OWORD *)(v4 + 72) = *(_OWORD *)&a3->m;
    *(_OWORD *)(v4 + 56) = v8;
    *(_OWORD *)(v4 + 40) = v7;
    *(_OWORD *)(v4 + 24) = v6;
    v9 = *(_OWORD *)&a3->Bbytes;
    v10 = *(_OWORD *)&a3->n8_splitk;
    v11 = *(_OWORD *)&a3->sparse_block_size_y;
    *((_DWORD *)v4 + 34) = a3->disable_bnns_client_ptr;
    *(_OWORD *)(v4 + 120) = v11;
    *(_OWORD *)(v4 + 104) = v10;
    *(_OWORD *)(v4 + 88) = v9;
    *((_DWORD *)v4 + 60) = 268435488;
    v19 = 0uLL;
    std::shared_ptr<Espresso::blob<unsigned short,4>>::operator=[abi:ne180100]((uint64_t)(v4 + 208), &v19);
    v12 = (std::__shared_weak_count *)*((_QWORD *)&v19 + 1);
    if (*((_QWORD *)&v19 + 1))
    {
      v13 = (unint64_t *)(*((_QWORD *)&v19 + 1) + 8);
      do
        v14 = __ldaxr(v13);
      while (__stlxr(v14 - 1, v13));
      if (!v14)
      {
        ((void (*)(std::__shared_weak_count *))v12->__on_zero_shared)(v12);
        std::__shared_weak_count::__release_weak(v12);
      }
    }
    v19 = 0uLL;
    std::shared_ptr<Espresso::blob<unsigned short,4>>::operator=[abi:ne180100]((uint64_t)&v5->quantization_lut, &v19);
    v15 = (std::__shared_weak_count *)*((_QWORD *)&v19 + 1);
    if (*((_QWORD *)&v19 + 1))
    {
      v16 = (unint64_t *)(*((_QWORD *)&v19 + 1) + 8);
      do
        v17 = __ldaxr(v16);
      while (__stlxr(v17 - 1, v16));
      if (!v17)
      {
        ((void (*)(std::__shared_weak_count *))v15->__on_zero_shared)(v15);
        std::__shared_weak_count::__release_weak(v15);
      }
    }
  }
  return v5;
}

- (id)label
{
  return CFSTR("FC");
}

- (unsigned)dataType
{
  return self->data_type;
}

- (id)descriptor
{
  uint64_t v3;
  void *v4;
  double v5;
  void *v6;
  double v7;

  v3 = 1;
  objc_msgSend(MEMORY[0x1E0CC6CB0], "cnnConvolutionDescriptorWithKernelWidth:kernelHeight:inputFeatureChannels:outputFeatureChannels:", 1, 1, self->params.nB, self->params.nC);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v4;
  LODWORD(v7) = 0;
  if (!self->params.has_relu)
  {
    if (self->params.has_tanh)
    {
      *(float *)&v5 = self->params.tanh_alpha;
      *(float *)&v7 = self->params.tanh_beta;
      v3 = 5;
      goto LABEL_5;
    }
    v3 = 0;
  }
  LODWORD(v5) = 0;
LABEL_5:
  objc_msgSend(v4, "setNeuronType:parameterA:parameterB:", v3, v5, v7);
  return v6;
}

- (BOOL)load
{
  return 1;
}

- (void)weights
{
  void *ptr;
  std::runtime_error *exception;

  ptr = self->weights_blob.__ptr_;
  if (!ptr)
  {
    ptr = self->weights_f16_blob.__ptr_;
    if (!ptr)
    {
      ptr = self->quantized_weights_blob.__ptr_;
      if (!ptr)
      {
        exception = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
        std::runtime_error::runtime_error(exception, "Null weights found");
        __cxa_throw(exception, MEMORY[0x1E0DE4E80], (void (*)(void *))MEMORY[0x1E0DE4338]);
      }
    }
  }
  return (void *)*((_QWORD *)ptr + 2);
}

- (uint64_t)rangesForUInt8Kernel
{
  return *(_QWORD *)(*(_QWORD *)(a1 + 208) + 16);
}

- (float)lookupTableForUInt8Kernel
{
  void *ptr;

  ptr = self->quantization_lut.__ptr_;
  if (ptr)
    return (float *)*((_QWORD *)ptr + 2);
  else
    return 0;
}

- (float)biasTerms
{
  return (float *)*((_QWORD *)self->biases_blob.__ptr_ + 2);
}

- (void)purge
{
  std::__shared_weak_count *v3;
  unint64_t *v4;
  unint64_t v5;
  std::__shared_weak_count *v6;
  unint64_t *v7;
  unint64_t v8;
  std::__shared_weak_count *v9;
  unint64_t *v10;
  unint64_t v11;
  std::__shared_weak_count *v12;
  unint64_t *v13;
  unint64_t v14;
  std::__shared_weak_count *v15;
  unint64_t *v16;
  unint64_t v17;
  std::__shared_weak_count *v18;
  unint64_t *v19;
  unint64_t v20;
  __int128 v21;

  v21 = 0uLL;
  std::shared_ptr<Espresso::blob<unsigned short,4>>::operator=[abi:ne180100]((uint64_t)&self->weights_blob, &v21);
  v3 = (std::__shared_weak_count *)*((_QWORD *)&v21 + 1);
  if (*((_QWORD *)&v21 + 1))
  {
    v4 = (unint64_t *)(*((_QWORD *)&v21 + 1) + 8);
    do
      v5 = __ldaxr(v4);
    while (__stlxr(v5 - 1, v4));
    if (!v5)
    {
      ((void (*)(std::__shared_weak_count *))v3->__on_zero_shared)(v3);
      std::__shared_weak_count::__release_weak(v3);
    }
  }
  v21 = 0uLL;
  std::shared_ptr<Espresso::blob<unsigned short,4>>::operator=[abi:ne180100]((uint64_t)&self->weights_f16_blob, &v21);
  v6 = (std::__shared_weak_count *)*((_QWORD *)&v21 + 1);
  if (*((_QWORD *)&v21 + 1))
  {
    v7 = (unint64_t *)(*((_QWORD *)&v21 + 1) + 8);
    do
      v8 = __ldaxr(v7);
    while (__stlxr(v8 - 1, v7));
    if (!v8)
    {
      ((void (*)(std::__shared_weak_count *))v6->__on_zero_shared)(v6);
      std::__shared_weak_count::__release_weak(v6);
    }
  }
  v21 = 0uLL;
  std::shared_ptr<Espresso::blob<unsigned short,4>>::operator=[abi:ne180100]((uint64_t)&self->biases_blob, &v21);
  v9 = (std::__shared_weak_count *)*((_QWORD *)&v21 + 1);
  if (*((_QWORD *)&v21 + 1))
  {
    v10 = (unint64_t *)(*((_QWORD *)&v21 + 1) + 8);
    do
      v11 = __ldaxr(v10);
    while (__stlxr(v11 - 1, v10));
    if (!v11)
    {
      ((void (*)(std::__shared_weak_count *))v9->__on_zero_shared)(v9);
      std::__shared_weak_count::__release_weak(v9);
    }
  }
  v21 = 0uLL;
  std::shared_ptr<Espresso::blob<unsigned short,4>>::operator=[abi:ne180100]((uint64_t)&self->quantization_ranges, &v21);
  v12 = (std::__shared_weak_count *)*((_QWORD *)&v21 + 1);
  if (*((_QWORD *)&v21 + 1))
  {
    v13 = (unint64_t *)(*((_QWORD *)&v21 + 1) + 8);
    do
      v14 = __ldaxr(v13);
    while (__stlxr(v14 - 1, v13));
    if (!v14)
    {
      ((void (*)(std::__shared_weak_count *))v12->__on_zero_shared)(v12);
      std::__shared_weak_count::__release_weak(v12);
    }
  }
  v21 = 0uLL;
  std::shared_ptr<Espresso::blob<unsigned short,4>>::operator=[abi:ne180100]((uint64_t)&self->quantization_lut, &v21);
  v15 = (std::__shared_weak_count *)*((_QWORD *)&v21 + 1);
  if (*((_QWORD *)&v21 + 1))
  {
    v16 = (unint64_t *)(*((_QWORD *)&v21 + 1) + 8);
    do
      v17 = __ldaxr(v16);
    while (__stlxr(v17 - 1, v16));
    if (!v17)
    {
      ((void (*)(std::__shared_weak_count *))v15->__on_zero_shared)(v15);
      std::__shared_weak_count::__release_weak(v15);
    }
  }
  v21 = 0uLL;
  std::shared_ptr<Espresso::blob<unsigned short,4>>::operator=[abi:ne180100]((uint64_t)&self->quantized_weights_blob, &v21);
  v18 = (std::__shared_weak_count *)*((_QWORD *)&v21 + 1);
  if (*((_QWORD *)&v21 + 1))
  {
    v19 = (unint64_t *)(*((_QWORD *)&v21 + 1) + 8);
    do
      v20 = __ldaxr(v19);
    while (__stlxr(v20 - 1, v19));
    if (!v20)
    {
      ((void (*)(std::__shared_weak_count *))v18->__on_zero_shared)(v18);
      std::__shared_weak_count::__release_weak(v18);
    }
  }
}

- (BOOL)ready
{
  unsigned int data_type;
  uint64_t v3;

  data_type = self->data_type;
  if (data_type == 8)
  {
    if (self->biases_blob.__ptr_ && self->quantized_weights_blob.__ptr_)
    {
      if (self->quantization_ranges.__ptr_)
        return 1;
      v3 = 224;
      return *(Class *)((char *)&self->super.isa + v3) != 0;
    }
    return 0;
  }
  if (data_type == 268435472)
  {
    if (self->biases_blob.__ptr_)
    {
      v3 = 160;
      return *(Class *)((char *)&self->super.isa + v3) != 0;
    }
    return 0;
  }
  if (data_type != 268435488 || !self->biases_blob.__ptr_)
    return 0;
  v3 = 144;
  return *(Class *)((char *)&self->super.isa + v3) != 0;
}

- (id)copyWithZone:(_NSZone *)a3
{
  EspressoInnerProductWeightsForMPS *v4;
  __int128 v5;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  uint64_t v9;
  _OWORD v11[8];
  int disable_bnns_client_ptr;

  v4 = [EspressoInnerProductWeightsForMPS alloc];
  v5 = *(_OWORD *)&self->params.Bbytes;
  v6 = *(_OWORD *)&self->params.sparse_block_size_y;
  v11[6] = *(_OWORD *)&self->params.n8_splitk;
  v11[7] = v6;
  disable_bnns_client_ptr = self->params.disable_bnns_client_ptr;
  v7 = *(_OWORD *)&self->params.has_tanh;
  v8 = *(_OWORD *)&self->params.use_raw_buffers;
  v11[2] = *(_OWORD *)&self->params.is_lookup;
  v11[3] = v8;
  v11[4] = *(_OWORD *)&self->params.m;
  v11[5] = v5;
  v11[0] = *(_OWORD *)&self->params.nC;
  v11[1] = v7;
  v9 = -[EspressoInnerProductWeightsForMPS initWithParams:](v4, "initWithParams:", v11);
  std::shared_ptr<Espresso::analysis_result>::operator=[abi:ne180100]((_QWORD *)(v9 + 144), (uint64_t)self->weights_blob.__ptr_, (uint64_t)self->weights_blob.__cntrl_);
  std::shared_ptr<Espresso::analysis_result>::operator=[abi:ne180100]((_QWORD *)(v9 + 160), (uint64_t)self->weights_f16_blob.__ptr_, (uint64_t)self->weights_f16_blob.__cntrl_);
  std::shared_ptr<Espresso::analysis_result>::operator=[abi:ne180100]((_QWORD *)(v9 + 176), (uint64_t)self->quantized_weights_blob.__ptr_, (uint64_t)self->quantized_weights_blob.__cntrl_);
  std::shared_ptr<Espresso::analysis_result>::operator=[abi:ne180100]((_QWORD *)(v9 + 192), (uint64_t)self->biases_blob.__ptr_, (uint64_t)self->biases_blob.__cntrl_);
  std::shared_ptr<Espresso::analysis_result>::operator=[abi:ne180100]((_QWORD *)(v9 + 208), (uint64_t)self->quantization_ranges.__ptr_, (uint64_t)self->quantization_ranges.__cntrl_);
  std::shared_ptr<Espresso::analysis_result>::operator=[abi:ne180100]((_QWORD *)(v9 + 224), (uint64_t)self->quantization_lut.__ptr_, (uint64_t)self->quantization_lut.__cntrl_);
  *(_DWORD *)(v9 + 240) = self->data_type;
  return (id)v9;
}

@end
