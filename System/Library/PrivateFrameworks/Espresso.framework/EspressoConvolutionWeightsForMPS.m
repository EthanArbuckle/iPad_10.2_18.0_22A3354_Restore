@implementation EspressoConvolutionWeightsForMPS

- (EspressoConvolutionWeightsForMPS)initWithParams:(convolution_uniforms *)a3
{
  char *v4;
  EspressoConvolutionWeightsForMPS *v5;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  std::__shared_weak_count *v14;
  unint64_t *v15;
  unint64_t v16;
  std::__shared_weak_count *v17;
  unint64_t *v18;
  unint64_t v19;
  std::__shared_weak_count *v20;
  unint64_t *v21;
  unint64_t v22;
  __int128 v24;
  objc_super v25;

  v25.receiver = self;
  v25.super_class = (Class)EspressoConvolutionWeightsForMPS;
  v4 = -[EspressoConvolutionWeightsForMPS init](&v25, sel_init);
  v5 = (EspressoConvolutionWeightsForMPS *)v4;
  if (v4)
  {
    v6 = *(_OWORD *)&a3->W;
    v7 = *(_OWORD *)&a3->start_channel_low_priority_split;
    *(_OWORD *)(v4 + 40) = *(_OWORD *)&a3->has_biases;
    *(_OWORD *)(v4 + 24) = v7;
    *(_OWORD *)(v4 + 8) = v6;
    v8 = *(_OWORD *)&a3->Nx;
    v9 = *(_OWORD *)&a3->fused_activation_alpha;
    v10 = *(_OWORD *)&a3->pad.l;
    *(_OWORD *)(v4 + 104) = *(_OWORD *)&a3->dilation_x;
    *(_OWORD *)(v4 + 88) = v10;
    *(_OWORD *)(v4 + 72) = v9;
    *(_OWORD *)(v4 + 56) = v8;
    v11 = *(_OWORD *)&a3->has_batch_norm;
    v12 = *(_OWORD *)&a3->total_channel_bottom;
    v13 = *(_OWORD *)&a3->low_precision_accumulation;
    *(_QWORD *)(v4 + 165) = *(_QWORD *)((char *)&a3->stride_t + 1);
    *(_OWORD *)(v4 + 152) = v13;
    *(_OWORD *)(v4 + 136) = v12;
    *(_OWORD *)(v4 + 120) = v11;
    *((_DWORD *)v4 + 72) = 268435488;
    v24 = 0uLL;
    std::shared_ptr<Espresso::blob<unsigned short,4>>::operator=[abi:ne180100]((uint64_t)(v4 + 272), &v24);
    v14 = (std::__shared_weak_count *)*((_QWORD *)&v24 + 1);
    if (*((_QWORD *)&v24 + 1))
    {
      v15 = (unint64_t *)(*((_QWORD *)&v24 + 1) + 8);
      do
        v16 = __ldaxr(v15);
      while (__stlxr(v16 - 1, v15));
      if (!v16)
      {
        ((void (*)(std::__shared_weak_count *))v14->__on_zero_shared)(v14);
        std::__shared_weak_count::__release_weak(v14);
      }
    }
    v24 = 0uLL;
    std::shared_ptr<Espresso::blob<unsigned short,4>>::operator=[abi:ne180100]((uint64_t)&v5->quantization_ranges, &v24);
    v17 = (std::__shared_weak_count *)*((_QWORD *)&v24 + 1);
    if (*((_QWORD *)&v24 + 1))
    {
      v18 = (unint64_t *)(*((_QWORD *)&v24 + 1) + 8);
      do
        v19 = __ldaxr(v18);
      while (__stlxr(v19 - 1, v18));
      if (!v19)
      {
        ((void (*)(std::__shared_weak_count *))v17->__on_zero_shared)(v17);
        std::__shared_weak_count::__release_weak(v17);
      }
    }
    v24 = 0uLL;
    std::shared_ptr<Espresso::blob<unsigned short,4>>::operator=[abi:ne180100]((uint64_t)&v5->quantization_lut, &v24);
    v20 = (std::__shared_weak_count *)*((_QWORD *)&v24 + 1);
    if (*((_QWORD *)&v24 + 1))
    {
      v21 = (unint64_t *)(*((_QWORD *)&v24 + 1) + 8);
      do
        v22 = __ldaxr(v21);
      while (__stlxr(v22 - 1, v21));
      if (!v22)
      {
        ((void (*)(std::__shared_weak_count *))v20->__on_zero_shared)(v20);
        std::__shared_weak_count::__release_weak(v20);
      }
    }
  }
  return v5;
}

- (unsigned)dataType
{
  return self->data_type;
}

- (id)descriptor
{
  uint64_t Nx;
  uint64_t Ny;
  int K;
  void *v7;
  int n_groups;
  uint64_t v9;
  void *v10;
  double v11;
  double v12;
  uint64_t v13;
  int fused_activation_mode;
  int stride_x;
  uint64_t v16;
  int stride_y;
  uint64_t v18;

  Nx = self->params.Nx;
  Ny = self->params.Ny;
  K = self->params.K;
  if (self->params.n_groups != K || K < 2)
  {
    objc_msgSend(MEMORY[0x1E0CC6CB0], "cnnConvolutionDescriptorWithKernelWidth:kernelHeight:inputFeatureChannels:outputFeatureChannels:", Nx, Ny, K, self->params.C);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v7;
    n_groups = self->params.n_groups;
    if (n_groups <= 1)
      v9 = 1;
    else
      v9 = n_groups;
    objc_msgSend(v7, "setGroups:", v9);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CC6CE8], "cnnConvolutionDescriptorWithKernelWidth:kernelHeight:inputFeatureChannels:outputFeatureChannels:", Nx, Ny);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setGroups:", 1);
  }
  if (self->params.fused_relu)
  {
    LODWORD(v11) = 0;
    v13 = 1;
  }
  else
  {
    if (self->params.fused_tanh)
      v13 = 5;
    else
      v13 = 0;
    LODWORD(v11) = 1.0;
    if (!self->params.fused_tanh)
      *(float *)&v11 = 0.0;
  }
  fused_activation_mode = self->params.fused_activation_mode;
  LODWORD(v12) = LODWORD(v11);
  if (fused_activation_mode != -1)
  {
    if (fused_activation_mode != 24)
      Espresso::throw_exception_selector<Espresso::not_implemented_error>("Only ACTIVATION_LEAKY_RELU_CLAMPED is accessible as a fused neuron for MPSCNNConvolution.");
    *(float *)&v11 = self->params.fused_activation_alpha;
    *(float *)&v12 = self->params.fused_activation_beta;
    v13 = 11;
  }
  objc_msgSend(v10, "setNeuronType:parameterA:parameterB:", v13, v11, v12);
  if (self->params.dilation_x > 1 || self->params.dilation_y >= 2)
  {
    objc_msgSend(v10, "setDilationRateX:");
    objc_msgSend(v10, "setDilationRateY:", self->params.dilation_y);
  }
  stride_x = self->params.stride_x;
  if (stride_x <= 1)
    v16 = 1;
  else
    v16 = stride_x;
  objc_msgSend(v10, "setStrideInPixelsX:", v16);
  stride_y = self->params.stride_y;
  if (stride_y <= 1)
    v18 = 1;
  else
    v18 = stride_y;
  objc_msgSend(v10, "setStrideInPixelsY:", v18);
  return v10;
}

- (BOOL)load
{
  return 1;
}

- (void)weights
{
  void *ptr;
  std::runtime_error *exception;

  ptr = self->quantized_weights_blob.__ptr_;
  if (!ptr)
  {
    ptr = self->weights_blob.__ptr_;
    if (!ptr)
    {
      ptr = self->weights_f16_blob.__ptr_;
      if (!ptr)
      {
        exception = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
        std::runtime_error::runtime_error(exception, "Null weights found");
        __cxa_throw(exception, MEMORY[0x1E0DE4E80], (void (*)(void *))MEMORY[0x1E0DE4338]);
      }
    }
  }
  return (void *)*((_QWORD *)ptr + 3);
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
  std::__shared_weak_count *v21;
  unint64_t *v22;
  unint64_t v23;
  __int128 v24;

  v24 = 0uLL;
  std::shared_ptr<Espresso::blob<unsigned short,4>>::operator=[abi:ne180100]((uint64_t)&self->quantization_ranges, &v24);
  v3 = (std::__shared_weak_count *)*((_QWORD *)&v24 + 1);
  if (*((_QWORD *)&v24 + 1))
  {
    v4 = (unint64_t *)(*((_QWORD *)&v24 + 1) + 8);
    do
      v5 = __ldaxr(v4);
    while (__stlxr(v5 - 1, v4));
    if (!v5)
    {
      ((void (*)(std::__shared_weak_count *))v3->__on_zero_shared)(v3);
      std::__shared_weak_count::__release_weak(v3);
    }
  }
  v24 = 0uLL;
  std::shared_ptr<Espresso::blob<unsigned short,4>>::operator=[abi:ne180100]((uint64_t)&self->scale_factor_batch_norm, &v24);
  v6 = (std::__shared_weak_count *)*((_QWORD *)&v24 + 1);
  if (*((_QWORD *)&v24 + 1))
  {
    v7 = (unint64_t *)(*((_QWORD *)&v24 + 1) + 8);
    do
      v8 = __ldaxr(v7);
    while (__stlxr(v8 - 1, v7));
    if (!v8)
    {
      ((void (*)(std::__shared_weak_count *))v6->__on_zero_shared)(v6);
      std::__shared_weak_count::__release_weak(v6);
    }
  }
  v24 = 0uLL;
  std::shared_ptr<Espresso::blob<unsigned short,4>>::operator=[abi:ne180100]((uint64_t)&self->quantization_lut, &v24);
  v9 = (std::__shared_weak_count *)*((_QWORD *)&v24 + 1);
  if (*((_QWORD *)&v24 + 1))
  {
    v10 = (unint64_t *)(*((_QWORD *)&v24 + 1) + 8);
    do
      v11 = __ldaxr(v10);
    while (__stlxr(v11 - 1, v10));
    if (!v11)
    {
      ((void (*)(std::__shared_weak_count *))v9->__on_zero_shared)(v9);
      std::__shared_weak_count::__release_weak(v9);
    }
  }
  v24 = 0uLL;
  std::shared_ptr<Espresso::blob<unsigned short,4>>::operator=[abi:ne180100]((uint64_t)&self->quantized_weights_blob, &v24);
  v12 = (std::__shared_weak_count *)*((_QWORD *)&v24 + 1);
  if (*((_QWORD *)&v24 + 1))
  {
    v13 = (unint64_t *)(*((_QWORD *)&v24 + 1) + 8);
    do
      v14 = __ldaxr(v13);
    while (__stlxr(v14 - 1, v13));
    if (!v14)
    {
      ((void (*)(std::__shared_weak_count *))v12->__on_zero_shared)(v12);
      std::__shared_weak_count::__release_weak(v12);
    }
  }
  v24 = 0uLL;
  std::shared_ptr<Espresso::blob<unsigned short,4>>::operator=[abi:ne180100]((uint64_t)&self->weights_blob, &v24);
  v15 = (std::__shared_weak_count *)*((_QWORD *)&v24 + 1);
  if (*((_QWORD *)&v24 + 1))
  {
    v16 = (unint64_t *)(*((_QWORD *)&v24 + 1) + 8);
    do
      v17 = __ldaxr(v16);
    while (__stlxr(v17 - 1, v16));
    if (!v17)
    {
      ((void (*)(std::__shared_weak_count *))v15->__on_zero_shared)(v15);
      std::__shared_weak_count::__release_weak(v15);
    }
  }
  v24 = 0uLL;
  std::shared_ptr<Espresso::blob<unsigned short,4>>::operator=[abi:ne180100]((uint64_t)&self->biases_blob, &v24);
  v18 = (std::__shared_weak_count *)*((_QWORD *)&v24 + 1);
  if (*((_QWORD *)&v24 + 1))
  {
    v19 = (unint64_t *)(*((_QWORD *)&v24 + 1) + 8);
    do
      v20 = __ldaxr(v19);
    while (__stlxr(v20 - 1, v19));
    if (!v20)
    {
      ((void (*)(std::__shared_weak_count *))v18->__on_zero_shared)(v18);
      std::__shared_weak_count::__release_weak(v18);
    }
  }
  v24 = 0uLL;
  std::shared_ptr<Espresso::blob<unsigned short,4>>::operator=[abi:ne180100]((uint64_t)&self->weights_f16_blob, &v24);
  v21 = (std::__shared_weak_count *)*((_QWORD *)&v24 + 1);
  if (*((_QWORD *)&v24 + 1))
  {
    v22 = (unint64_t *)(*((_QWORD *)&v24 + 1) + 8);
    do
      v23 = __ldaxr(v22);
    while (__stlxr(v23 - 1, v22));
    if (!v23)
    {
      ((void (*)(std::__shared_weak_count *))v21->__on_zero_shared)(v21);
      std::__shared_weak_count::__release_weak(v21);
    }
  }
}

- (uint64_t)rangesForUInt8Kernel
{
  return *(_QWORD *)(*(_QWORD *)(a1 + 240) + 16);
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

- (BOOL)ready
{
  unsigned int data_type;
  uint64_t v4;

  data_type = self->data_type;
  if (data_type == 268435488)
  {
    if (!self->biases_blob.__ptr_)
      return 0;
    v4 = 192;
    return *(Class *)((char *)&self->super.isa + v4) != 0;
  }
  if (data_type == 268435472)
  {
    if (!self->biases_blob.__ptr_)
      return 0;
    v4 = 208;
    return *(Class *)((char *)&self->super.isa + v4) != 0;
  }
  if (data_type == 8 && self->biases_blob.__ptr_ && self->quantized_weights_blob.__ptr_)
  {
    if (self->quantization_ranges.__ptr_)
      return 1;
    v4 = 256;
    return *(Class *)((char *)&self->super.isa + v4) != 0;
  }
  return 0;
}

- (id)label
{
  return CFSTR("Conv");
}

- (id)copyWithZone:(_NSZone *)a3
{
  EspressoConvolutionWeightsForMPS *v4;
  __int128 v5;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  uint64_t v10;
  _OWORD v12[10];
  uint64_t v13;

  v4 = [EspressoConvolutionWeightsForMPS alloc];
  v5 = *(_OWORD *)&self->params.has_batch_norm;
  v6 = *(_OWORD *)&self->params.low_precision_accumulation;
  v12[8] = *(_OWORD *)&self->params.total_channel_bottom;
  v12[9] = v6;
  v13 = *(_QWORD *)&self->params.disable_bnns_client_ptr;
  v7 = *(_OWORD *)&self->params.Nx;
  v8 = *(_OWORD *)&self->params.pad.l;
  v12[4] = *(_OWORD *)&self->params.fused_activation_alpha;
  v12[5] = v8;
  v12[6] = *(_OWORD *)&self->params.dilation_x;
  v12[7] = v5;
  v9 = *(_OWORD *)&self->params.start_channel_low_priority_split;
  v12[0] = *(_OWORD *)&self->params.W;
  v12[1] = v9;
  v12[2] = *(_OWORD *)&self->params.has_biases;
  v12[3] = v7;
  v10 = -[EspressoConvolutionWeightsForMPS initWithParams:](v4, "initWithParams:", v12);
  std::shared_ptr<Espresso::analysis_result>::operator=[abi:ne180100]((_QWORD *)(v10 + 176), (uint64_t)self->quantized_weights_blob.__ptr_, (uint64_t)self->quantized_weights_blob.__cntrl_);
  std::shared_ptr<Espresso::analysis_result>::operator=[abi:ne180100]((_QWORD *)(v10 + 192), (uint64_t)self->weights_blob.__ptr_, (uint64_t)self->weights_blob.__cntrl_);
  std::shared_ptr<Espresso::analysis_result>::operator=[abi:ne180100]((_QWORD *)(v10 + 208), (uint64_t)self->weights_f16_blob.__ptr_, (uint64_t)self->weights_f16_blob.__cntrl_);
  std::shared_ptr<Espresso::analysis_result>::operator=[abi:ne180100]((_QWORD *)(v10 + 224), (uint64_t)self->biases_blob.__ptr_, (uint64_t)self->biases_blob.__cntrl_);
  std::shared_ptr<Espresso::analysis_result>::operator=[abi:ne180100]((_QWORD *)(v10 + 240), (uint64_t)self->quantization_ranges.__ptr_, (uint64_t)self->quantization_ranges.__cntrl_);
  std::shared_ptr<Espresso::analysis_result>::operator=[abi:ne180100]((_QWORD *)(v10 + 256), (uint64_t)self->quantization_lut.__ptr_, (uint64_t)self->quantization_lut.__cntrl_);
  std::shared_ptr<Espresso::analysis_result>::operator=[abi:ne180100]((_QWORD *)(v10 + 272), (uint64_t)self->scale_factor_batch_norm.__ptr_, (uint64_t)self->scale_factor_batch_norm.__cntrl_);
  *(_DWORD *)(v10 + 288) = self->data_type;
  return (id)v10;
}

- (void).cxx_destruct
{
  std::shared_ptr<void>::~shared_ptr[abi:ne180100]((uint64_t)&self->scale_factor_batch_norm);
  std::shared_ptr<void>::~shared_ptr[abi:ne180100]((uint64_t)&self->quantization_lut);
  std::shared_ptr<void>::~shared_ptr[abi:ne180100]((uint64_t)&self->quantization_ranges);
  std::shared_ptr<void>::~shared_ptr[abi:ne180100]((uint64_t)&self->biases_blob);
  std::shared_ptr<void>::~shared_ptr[abi:ne180100]((uint64_t)&self->weights_f16_blob);
  std::shared_ptr<void>::~shared_ptr[abi:ne180100]((uint64_t)&self->weights_blob);
  std::shared_ptr<void>::~shared_ptr[abi:ne180100]((uint64_t)&self->quantized_weights_blob);
}

- (id).cxx_construct
{
  Espresso::convolution_uniforms::convolution_uniforms((Espresso::convolution_uniforms *)&self->params);
  self->quantization_lut = 0u;
  self->scale_factor_batch_norm = 0u;
  self->biases_blob = 0u;
  self->quantization_ranges = 0u;
  self->weights_blob = 0u;
  self->weights_f16_blob = 0u;
  self->quantized_weights_blob = 0u;
  return self;
}

@end
