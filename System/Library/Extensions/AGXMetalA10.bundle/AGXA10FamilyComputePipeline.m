@implementation AGXA10FamilyComputePipeline

- (AGXA10FamilyComputePipeline)initWithDevice:(id)a3 pipelineStateDescriptor:(id)a4
{
  AGXA10FamilyComputePipeline *v5;
  __shared_weak_count *v6;
  __shared_weak_count *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)AGXA10FamilyComputePipeline;
  v5 = -[_MTLComputePipelineState initWithDevice:pipelineStateDescriptor:](&v9, sel_initWithDevice_pipelineStateDescriptor_, a3);
  if (v5)
  {
    v6 = (__shared_weak_count *)objc_msgSend((id)objc_msgSend(a4, "computeFunction"), "vendorPrivate");
    v5->_impl.intersection_fn_ifb_data.__cntrl_ = v6;
    v7 = v6;
  }
  return v5;
}

- (AGXA10FamilyComputePipeline)initWithParent:(id)a3
{
  AGXA10FamilyComputePipeline *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)AGXA10FamilyComputePipeline;
  v4 = -[_MTLComputePipelineState initWithParent:](&v6, sel_initWithParent_);
  if (v4)
    v4->_impl.ift_spill_info.__ptr_ = (SpillInfo *)a3;
  return v4;
}

- (void)dealloc
{
  objc_super v3;

  self->_impl.intersection_fn_ifb_data.__cntrl_ = 0;
  v3.receiver = self;
  v3.super_class = (Class)AGXA10FamilyComputePipeline;
  -[_MTLComputePipelineState dealloc](&v3, sel_dealloc);
}

- (unint64_t)threadExecutionWidth
{
  return 32;
}

- (unint64_t)maxTotalThreadsPerThreadgroup
{
  return LODWORD(self->_impl.dylib_resources.dylibs.__begin_);
}

- (unint64_t)staticThreadgroupMemoryLength
{
  return *((unsigned int *)self->_impl.compute_variant + 811);
}

- (unint64_t)imageblockMemoryLengthForDimensions:(id *)a3
{
  return 0;
}

- (unint64_t)imageBlockMemoryLengthForDimensions:(id *)a3
{
  return 0;
}

- (id)functionHandleWithFunction:(id)a3
{
  id result;

  result = std::__hash_table<std::__hash_value_type<objc_object  {objcproto11MTLFunction}*,RetainedObjCPointer<AGXA10FamilyFunctionHandle *>>,std::__unordered_map_hasher<objc_object  {objcproto11MTLFunction},RetainedObjCPointer<AGXA10FamilyFunctionHandle *>,std::hash<objc_object  {objcproto11MTLFunction}>,std::equal_to<objc_object  {objcproto11MTLFunction}>,true>,std::__unordered_map_equal<objc_object  {objcproto11MTLFunction},RetainedObjCPointer<AGXA10FamilyFunctionHandle *>,std::equal_to,std::hash,true>,std::allocator<RetainedObjCPointer<AGXA10FamilyFunctionHandle *>>>::find<objc_object  {objcproto11MTLFunction}>(&self->_impl.dylib_resources.dylibs.__end_, (unint64_t)a3);
  if (result)
    return (id)*((_QWORD *)result + 3);
  return result;
}

- (id)newComputePipelineStateWithAdditionalBinaryFunctions:(id)a3 error:(id *)a4
{
  void *ptr;
  AGXA10FamilyComputePipeline *v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  unint64_t prime;
  uint64_t v13;
  int8x8_t value;
  uint8x8_t v15;
  unint64_t v16;
  uint64_t v18;

  if (self->_impl.ift_spill_info.__ptr_)
    ptr = self->_impl.ift_spill_info.__ptr_;
  else
    ptr = self;
  v8 = -[AGXA10FamilyComputePipeline initWithParent:]([AGXA10FamilyComputePipeline alloc], "initWithParent:", ptr);
  -[_MTLComputePipelineState device](self, "device");
  if (v8)
  {
    v8->_impl.compute_variant = self->_impl.compute_variant;
    LODWORD(v8->_impl.dylib_resources.dylibs.__begin_) = self->_impl.dylib_resources.dylibs.__begin_;
    v8->_impl.supports_indirect_command_buffers = self->_impl.supports_indirect_command_buffers;
    v8->_impl.descendent_pipeline = 1;
    v9 = *(_OWORD *)&self->_impl.ei_state.pipeline_state_gpu_address;
    v10 = *(_OWORD *)&self->_impl.ei_state.allocation.buffer_.address.cpu;
    v11 = *(_OWORD *)&self->_impl.ei_state.allocation.resource_;
    v8->_impl.resource_indirection_heap_allocation.buffer_.address.gpu = self->_impl.resource_indirection_heap_allocation.buffer_.address.gpu;
    *(_OWORD *)&v8->_impl.ei_state.allocation.resource_ = v11;
    *(_OWORD *)&v8->_impl.ei_state.allocation.buffer_.address.cpu = v10;
    *(_OWORD *)&v8->_impl.ei_state.pipeline_state_gpu_address = v9;
    std::vector<std::shared_ptr<AGX::G9::DynamicLibrary>>::reserve((uint64_t)&v8->_impl.loader_runtime_state.total_ipr_buffer_bytes, ((uint64_t)(*(_QWORD *)&self->_impl.loader_runtime_state.max_sgpr_lm_size- *(_QWORD *)&self->_impl.loader_runtime_state.total_ipr_buffer_bytes) >> 4)+ objc_msgSend(a3, "count"));
    std::vector<std::shared_ptr<AGX::G9::DynamicLibrary>>::__insert_with_size[abi:nn180100]<std::__wrap_iter<std::shared_ptr<AGX::G9::DynamicLibrary> const*>,std::__wrap_iter<std::shared_ptr<AGX::G9::DynamicLibrary> const*>>((void **)&v8->_impl.loader_runtime_state.total_ipr_buffer_bytes, *(_QWORD *)&v8->_impl.loader_runtime_state.max_sgpr_lm_size, *(_QWORD **)&self->_impl.loader_runtime_state.total_ipr_buffer_bytes, *(_QWORD **)&self->_impl.loader_runtime_state.max_sgpr_lm_size, (uint64_t)(*(_QWORD *)&self->_impl.loader_runtime_state.max_sgpr_lm_size- *(_QWORD *)&self->_impl.loader_runtime_state.total_ipr_buffer_bytes) >> 4);
    if (v8 != self)
    {
      LODWORD(v8->_impl.function_handle_map.__table_.__bucket_list_.__ptr_.__value__2.__data_.__value_) = self->_impl.function_handle_map.__table_.__bucket_list_.__ptr_.__value__2.__data_.__value_;
      std::__hash_table<std::__hash_value_type<objc_object  {objcproto11MTLFunction}*,RetainedObjCPointer<AGXA10FamilyFunctionHandle *>>,std::__unordered_map_hasher<objc_object  {objcproto11MTLFunction},RetainedObjCPointer<AGXA10FamilyFunctionHandle *>,std::hash<objc_object  {objcproto11MTLFunction}>,std::equal_to<objc_object  {objcproto11MTLFunction}>,true>,std::__unordered_map_equal<objc_object  {objcproto11MTLFunction},RetainedObjCPointer<AGXA10FamilyFunctionHandle *>,std::equal_to,std::hash,true>,std::allocator<RetainedObjCPointer<AGXA10FamilyFunctionHandle *>>>::__assign_multi<std::__hash_const_iterator<std::__hash_node<RetainedObjCPointer<AGXA10FamilyFunctionHandle *>,void *> *>>(&v8->_impl.dylib_resources.dylibs.__end_, *(uint64_t ***)&self->_impl.max_wg_size);
    }
    prime = vcvtps_u32_f32((float)((unint64_t)v8->_impl.function_handle_map.__table_.__bucket_list_.__ptr_.__value_+ objc_msgSend(a3, "count"))/ *(float *)&v8->_impl.function_handle_map.__table_.__bucket_list_.__ptr_.__value__2.__data_.__value_);
    if (prime == 1)
    {
      prime = 2;
    }
    else if ((prime & (prime - 1)) != 0)
    {
      prime = std::__next_prime(prime);
    }
    value = (int8x8_t)v8->_impl.dylib_resources.dylibs.__end_cap_.__value_;
    if (prime > *(_QWORD *)&value)
      goto LABEL_27;
    if (prime < *(_QWORD *)&value)
    {
      v15 = (uint8x8_t)vcnt_s8(value);
      v15.i16[0] = vaddlv_u8(v15);
      v16 = vcvtps_u32_f32((float)(unint64_t)v8->_impl.function_handle_map.__table_.__bucket_list_.__ptr_.__value_/ *(float *)&v8->_impl.function_handle_map.__table_.__bucket_list_.__ptr_.__value__2.__data_.__value_);
      if (*(_QWORD *)&value < 3uLL || v15.u32[0] > 1uLL)
      {
        v16 = std::__next_prime(v16);
      }
      else
      {
        v18 = 1 << -(char)__clz(v16 - 1);
        if (v16 >= 2)
          v16 = v18;
      }
      if (prime <= v16)
        prime = v16;
      if (prime < *(_QWORD *)&value)
LABEL_27:
        std::__hash_table<std::__hash_value_type<std::string,unsigned int>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,unsigned int>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,unsigned int>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,unsigned int>>>::__do_rehash<true>((uint64_t)&v8->_impl.dylib_resources.dylibs.__end_, prime);
    }
  }
  else
  {
    if (a4)
    {
      v13 = objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObject:forKey:", CFSTR("Failed to allocate a new pipeline"), *MEMORY[0x24BDD0FC8]);
      *a4 = (id)objc_msgSend(objc_alloc(MEMORY[0x24BDD1540]), "initWithDomain:code:userInfo:", CFSTR("AGXMetalA10"), 1, v13);
    }
    return 0;
  }
  return v8;
}

- (id)newIntersectionFunctionTableWithDescriptor:(id)a3
{
  id result;
  id v6;
  id v7;
  void *v8;

  result = (id)-[MTLDevice requiresRaytracingEmulation](-[_MTLComputePipelineState device](self, "device"), "requiresRaytracingEmulation");
  if ((_DWORD)result)
  {
    v6 = objc_alloc_init(MEMORY[0x24BDDD778]);
    objc_msgSend(v6, "setFunctionCount:", objc_msgSend(a3, "functionCount"));
    objc_msgSend(v6, "setResourceIndex:", objc_msgSend(a3, "resourceIndex"));
    objc_msgSend(v6, "setForceResourceIndex:", objc_msgSend(a3, "forceResourceIndex"));
    v7 = -[AGXA10FamilyComputePipeline newVisibleFunctionTableWithDescriptor:](self, "newVisibleFunctionTableWithDescriptor:", v6);

    v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE515E8]), "initWithVisibleFunctionTable:", v7);
    return v8;
  }
  return result;
}

- (id)newVisibleFunctionTableWithDescriptor:(id)a3
{
  MTLDevice *v5;
  uint64_t v7;

  v5 = -[_MTLComputePipelineState device](self, "device");
  LODWORD(v7) = 0;
  return -[AGXA10FamilyVisibleFunctionTable initWithDevice:functionCount:options:isSuballocDisabled:resourceIndex:pipelineState:type:]([AGXA10FamilyVisibleFunctionTable alloc], "initWithDevice:functionCount:options:isSuballocDisabled:resourceIndex:pipelineState:type:", v5, objc_msgSend(a3, "functionCount"), 0, *(unsigned __int8 *)(*((_QWORD *)v5 + 101) + 6725), objc_msgSend(a3, "resourceIndex"), self, v7);
}

- (unsigned)getComputeKernelTelemetryID
{
  return *((_DWORD *)self->_impl.compute_variant + 106);
}

- (unint64_t)uniqueIdentifier
{
  unint64_t result;

  result = (unint64_t)&self->_impl;
  if (*(_BYTE *)(result + 24))
    return *(_QWORD *)(result + 40);
  return result;
}

- (unint64_t)resourceIndex
{
  return 0;
}

- (unint64_t)allocatedSize
{
  int v2;

  if (self->_impl.supports_indirect_command_buffers)
    v2 = 232;
  else
    v2 = 0;
  return (v2 + *((_DWORD *)self->_impl.compute_variant + 709));
}

- (id)pipelineBinaries
{
  ComputePipeline *p_impl;
  id v3;
  ComputeProgramVariant *compute_variant;
  id v5;
  char *v6;
  uint64_t v7;
  uint64_t v9;
  uint64_t v10;
  id v11;
  uint64_t v12;
  uint64_t i;
  uint64_t v14;
  uint64_t v15;
  _QWORD v16[2];
  _QWORD v17[3];

  v17[2] = *MEMORY[0x24BDAC8D0];
  p_impl = &self->_impl;
  if (!self->_impl.compute_variant)
    return 0;
  v16[0] = CFSTR("compute");
  v3 = objc_alloc(MEMORY[0x24BDDD7E0]);
  compute_variant = p_impl->compute_variant;
  if (*((char *)compute_variant + 895) < 0)
  {
    if (*((_QWORD *)compute_variant + 110))
      goto LABEL_4;
LABEL_8:
    v9 = 0;
    goto LABEL_11;
  }
  if (!*((_BYTE *)compute_variant + 895))
    goto LABEL_8;
LABEL_4:
  v5 = objc_alloc(MEMORY[0x24BDBCE50]);
  if (*((char *)compute_variant + 895) < 0)
  {
    v6 = (char *)*((_QWORD *)compute_variant + 109);
    v7 = *((_QWORD *)compute_variant + 110);
  }
  else
  {
    v6 = (char *)compute_variant + 872;
    v7 = *((unsigned __int8 *)compute_variant + 895);
  }
  v9 = objc_msgSend(v5, "initWithBytes:length:", v6, v7);
  compute_variant = p_impl->compute_variant;
LABEL_11:
  v15 = objc_msgSend(v3, "initWithBinary:uniqueIdentifier:debugIdentifier:", v9, *((_QWORD *)compute_variant + 53), *((unsigned int *)compute_variant + 104));
  v10 = objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v15, 1);
  v16[1] = CFSTR("compute-dynamic-libraries");
  v17[0] = v10;
  v11 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v12 = *(_QWORD *)&p_impl->loader_runtime_state.total_ipr_buffer_bytes;
  for (i = *(_QWORD *)&p_impl->loader_runtime_state.max_sgpr_lm_size; v12 != i; v12 += 16)
    objc_msgSend(v11, "addObject:", objc_msgSend(objc_alloc(MEMORY[0x24BDDD7E0]), "initWithBinary:uniqueIdentifier:debugIdentifier:", 0, 0, 0));
  v14 = objc_msgSend(v11, "copy");

  v17[1] = v14;
  return (id)objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v17, v16, 2);
}

- (void).cxx_destruct
{
  AGX::ComputePipeline<AGX::G9::ObjClasses,AGX::G9::Classes,AGX::G9::Encoders>::~ComputePipeline((uint64_t *)&self->_impl);
}

- (id).cxx_construct
{
  *((_DWORD *)self + 23) = 0;
  *((_DWORD *)self + 24) = 0;
  *(_OWORD *)((char *)self + 104) = 0u;
  *(_OWORD *)((char *)self + 120) = 0u;
  *(_OWORD *)((char *)self + 136) = 0u;
  *((_QWORD *)self + 30) = 0;
  *((_QWORD *)self + 31) = 0;
  *((_BYTE *)self + 256) = 0;
  *((_QWORD *)self + 34) = 0;
  *((_QWORD *)self + 35) = 0;
  *((_QWORD *)self + 33) = 0;
  *(_OWORD *)((char *)self + 296) = 0u;
  *(_OWORD *)((char *)self + 312) = 0u;
  *((_QWORD *)self + 9) = 0;
  *((_QWORD *)self + 10) = 0;
  *((_QWORD *)self + 8) = 0;
  *(_DWORD *)((char *)self + 87) = 0;
  *(_QWORD *)((char *)self + 229) = 0;
  *(_OWORD *)((char *)self + 216) = 0u;
  *(_OWORD *)((char *)self + 200) = 0u;
  *(_OWORD *)((char *)self + 184) = 0u;
  *(_OWORD *)((char *)self + 168) = 0u;
  *((_DWORD *)self + 82) = 1065353216;
  *((_OWORD *)self + 21) = 0u;
  *((_OWORD *)self + 22) = 0u;
  *((_DWORD *)self + 92) = 1065353216;
  *(_OWORD *)((char *)self + 376) = 0u;
  *(_OWORD *)((char *)self + 392) = 0u;
  *((_QWORD *)self + 51) = 0;
  *((_DWORD *)self + 104) = 1065353216;
  *(_OWORD *)((char *)self + 424) = 0u;
  *(_OWORD *)((char *)self + 440) = 0u;
  *(_OWORD *)((char *)self + 456) = 0u;
  return self;
}

@end
