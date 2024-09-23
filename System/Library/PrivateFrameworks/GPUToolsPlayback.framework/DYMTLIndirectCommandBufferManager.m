@implementation DYMTLIndirectCommandBufferManager

- (DYMTLIndirectCommandBufferManager)initWithFunctionPlayer:(id)a3
{
  id v5;
  DYMTLIndirectCommandBufferManager *v6;
  DYMTLIndirectCommandBufferManager *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)DYMTLIndirectCommandBufferManager;
  v6 = -[DYMTLIndirectCommandBufferManager init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_player, a3);

  return v7;
}

- (pair<unsigned)bufferIdAndOffsetForGPUVirtualAddress:(unint64_t)a3
{
  unint64_t v3;
  unint64_t v4;
  pair<unsigned long long, unsigned long long> result;

  v3 = GPUTools::MTL::Utils::DYMTLTranslateGPUAddressToBuffer(&self->_gpuVirtualAddressArray.__begin_, a3);
  result.var1 = v4;
  result.var0 = v3;
  return result;
}

- (unint64_t)renderPipelineIdForUniqueIdentifier:(unint64_t)a3
{
  _QWORD *v3;
  unint64_t v5;

  v5 = a3;
  v3 = std::__hash_table<std::__hash_value_type<unsigned long long,objc_object * {__strong}>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,objc_object * {__strong}>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,objc_object * {__strong}>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,objc_object * {__strong}>>>::find<unsigned long long>(&self->_renderPipelineStateUniqueIdentifier.__table_.__bucket_list_.__ptr_.__value_, &v5);
  if (v3)
    return v3[3];
  else
    return -1;
}

- (unint64_t)computePipelineIdForUniqueIdentifier:(unint64_t)a3
{
  _QWORD *v3;
  unint64_t v5;

  v5 = a3;
  v3 = std::__hash_table<std::__hash_value_type<unsigned long long,objc_object * {__strong}>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,objc_object * {__strong}>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,objc_object * {__strong}>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,objc_object * {__strong}>>>::find<unsigned long long>(&self->_computePipelineStateUniqueIdentifier.__table_.__bucket_list_.__ptr_.__value_, &v5);
  if (v3)
    return v3[3];
  else
    return -1;
}

- (void)addGPUVirtualAddress:(unint64_t)a3 forObjectId:(unint64_t)a4
{
  unint64_t v5;
  unint64_t *v6;

  v5 = a4;
  v6 = &v5;
  std::__hash_table<std::__hash_value_type<unsigned long long,unsigned long long>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,unsigned long long>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,unsigned long long>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,unsigned long long>>>::__emplace_unique_key_args<unsigned long long,std::piecewise_construct_t const&,std::tuple<unsigned long long const&>,std::tuple<>>((uint64_t)&self->_gpuVirtualAddressMap, &v5, (uint64_t)&std::piecewise_construct, &v6)[3] = a3;
  self->_recalculateVirtualAddress = 1;
}

- (void)addRenderPipelineStateUniqueIdentifier:(unint64_t)a3 forObjectId:(unint64_t)a4
{
  unint64_t v4;
  unint64_t *v5;

  v4 = a3;
  v5 = &v4;
  std::__hash_table<std::__hash_value_type<unsigned long long,unsigned long long>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,unsigned long long>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,unsigned long long>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,unsigned long long>>>::__emplace_unique_key_args<unsigned long long,std::piecewise_construct_t const&,std::tuple<unsigned long long const&>,std::tuple<>>((uint64_t)&self->_renderPipelineStateUniqueIdentifier, &v4, (uint64_t)&std::piecewise_construct, &v5)[3] = a4;
}

- (void)addComputePipelineStateUniqueIdentifier:(unint64_t)a3 forObjectId:(unint64_t)a4
{
  unint64_t v4;
  unint64_t *v5;

  v4 = a3;
  v5 = &v4;
  std::__hash_table<std::__hash_value_type<unsigned long long,unsigned long long>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,unsigned long long>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,unsigned long long>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,unsigned long long>>>::__emplace_unique_key_args<unsigned long long,std::piecewise_construct_t const&,std::tuple<unsigned long long const&>,std::tuple<>>((uint64_t)&self->_computePipelineStateUniqueIdentifier, &v4, (uint64_t)&std::piecewise_construct, &v5)[3] = a4;
}

- (void)_calculateGPUVirtualAddress
{
  vector<GPUTools::MTL::Utils::DYMTLBufferGPUAddress, std::allocator<GPUTools::MTL::Utils::DYMTLBufferGPUAddress>> *p_gpuVirtualAddressArray;
  DYMTLBufferGPUAddress *value;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  DYMTLBufferGPUAddress *v10;
  DYMTLBufferGPUAddress *end;
  DYMTLBufferGPUAddress *v12;
  DYMTLBufferGPUAddress *begin;
  unint64_t v14;
  unint64_t v15;
  unint64_t v16;
  unint64_t v17;
  char *v18;
  char *v19;
  DYMTLBufferGPUAddress *v20;
  __int128 v21;
  DYMTLBufferGPUAddress *v22;
  unint64_t *v23;
  unint64_t v24;
  uint64_t v25;
  __compressed_pair<GPUTools::MTL::Utils::DYMTLBufferGPUAddress *, std::allocator<GPUTools::MTL::Utils::DYMTLBufferGPUAddress>> *p_end_cap;
  char v27;

  if (self->_recalculateVirtualAddress)
  {
    p_gpuVirtualAddressArray = &self->_gpuVirtualAddressArray;
    self->_gpuVirtualAddressArray.__end_ = self->_gpuVirtualAddressArray.__begin_;
    std::vector<GPUTools::MTL::Utils::DYMTLBufferGPUAddress>::reserve((void **)&self->_gpuVirtualAddressArray.__begin_, self->_gpuVirtualAddressMap.__table_.__p2_.__value_);
    value = p_gpuVirtualAddressArray[-5].__end_cap_.__value_;
    if (value)
    {
      p_end_cap = &self->_gpuVirtualAddressArray.__end_cap_;
      do
      {
        v6 = *((_QWORD *)value + 2);
        v5 = *((_QWORD *)value + 3);
        -[DYMTLFunctionPlayer objectForKey:](self->_player, "objectForKey:", v6, p_end_cap);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        v8 = objc_msgSend(v7, "length");
        v9 = v8;
        end = self->_gpuVirtualAddressArray.__end_;
        v10 = self->_gpuVirtualAddressArray.__end_cap_.__value_;
        if (end >= v10)
        {
          begin = p_gpuVirtualAddressArray->__begin_;
          v14 = 0xAAAAAAAAAAAAAAABLL * ((end - p_gpuVirtualAddressArray->__begin_) >> 3);
          v15 = v14 + 1;
          if (v14 + 1 > 0xAAAAAAAAAAAAAAALL)
            std::vector<std::pair<ShaderDebugger::Metadata::MDBase::MetadataType,unsigned long long>>::__throw_length_error[abi:ne180100]();
          v16 = 0xAAAAAAAAAAAAAAABLL * ((v10 - begin) >> 3);
          if (2 * v16 > v15)
            v15 = 2 * v16;
          if (v16 >= 0x555555555555555)
            v17 = 0xAAAAAAAAAAAAAAALL;
          else
            v17 = v15;
          if (v17)
          {
            v18 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<GPUTools::MTL::Utils::DYMTLBufferGPUAddress>>((uint64_t)p_end_cap, v17);
            begin = self->_gpuVirtualAddressArray.__begin_;
            end = self->_gpuVirtualAddressArray.__end_;
          }
          else
          {
            v18 = 0;
          }
          v19 = &v18[24 * v14];
          *(_QWORD *)v19 = v5;
          *((_QWORD *)v19 + 1) = v9;
          *((_QWORD *)v19 + 2) = v6;
          v20 = (DYMTLBufferGPUAddress *)v19;
          if (end != begin)
          {
            do
            {
              v21 = *(_OWORD *)((char *)end - 24);
              *((_QWORD *)v20 - 1) = *((_QWORD *)end - 1);
              *(_OWORD *)((char *)v20 - 24) = v21;
              v20 = (DYMTLBufferGPUAddress *)((char *)v20 - 24);
              end = (DYMTLBufferGPUAddress *)((char *)end - 24);
            }
            while (end != begin);
            begin = p_gpuVirtualAddressArray->__begin_;
          }
          v12 = (DYMTLBufferGPUAddress *)(v19 + 24);
          self->_gpuVirtualAddressArray.__begin_ = v20;
          self->_gpuVirtualAddressArray.__end_ = (DYMTLBufferGPUAddress *)(v19 + 24);
          self->_gpuVirtualAddressArray.__end_cap_.__value_ = (DYMTLBufferGPUAddress *)&v18[24 * v17];
          if (begin)
            operator delete(begin);
        }
        else
        {
          *(_QWORD *)end = v5;
          *((_QWORD *)end + 1) = v8;
          v12 = (DYMTLBufferGPUAddress *)((char *)end + 24);
          *((_QWORD *)end + 2) = v6;
        }
        self->_gpuVirtualAddressArray.__end_ = v12;

        value = *(DYMTLBufferGPUAddress **)value;
      }
      while (value);
    }
    v22 = self->_gpuVirtualAddressArray.__begin_;
    v23 = (unint64_t *)self->_gpuVirtualAddressArray.__end_;
    v24 = 126 - 2 * __clz(0xAAAAAAAAAAAAAAABLL * (((char *)v23 - (char *)v22) >> 3));
    if (v23 == (unint64_t *)v22)
      v25 = 0;
    else
      v25 = v24;
    std::__introsort<std::_ClassicAlgPolicy,std::__less<void,void> &,GPUTools::MTL::Utils::DYMTLBufferGPUAddress *,false>((uint64_t)v22, v23, (uint64_t)&v27, v25, 1);
    self->_recalculateVirtualAddress = 0;
  }
}

- (void)executeIndirectRenderCommand:(id)a3 withData:(const char *)a4 atIndex:(unint64_t)a5 forIndirectCommandBuffer:(id)a6
{
  id v10;
  id v11;
  MTLIndirectCommandBufferDescriptor *v12;
  void *v13;
  _OWORD v14[7];
  _OWORD v15[4];
  uint64_t v16;

  v10 = a3;
  v11 = a6;
  -[DYMTLIndirectCommandBufferManager _calculateGPUVirtualAddress](self, "_calculateGPUVirtualAddress");
  DYMTLGetAssociatedObject(v11, 0);
  v12 = (MTLIndirectCommandBufferDescriptor *)objc_claimAutoreleasedReturnValue();
  DYMTLGetAssociatedObject(v11, 3u);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = 0;
  memset(v15, 0, sizeof(v15));
  MakeDYMTLIndirectCommandBufferDescriptor(v12, objc_msgSend(v13, "maxKernelThreadgroupMemoryBindCount"), (uint64_t)v15);
  memset(v14, 0, sizeof(v14));
  GPUTools::MTL::Utils::DYMTLCreateIndirectCommandEncoder((uint64_t *)v15, (uint64_t)v14);
  DYMTLDrawRenderCommandEncoder(v10, a5, (uint64_t)a4, (GPUTools::MTL::Utils::DYMTLIndirectCommandEncoder *)v14, (_QWORD *)-[DYMTLFunctionPlayer objectMap](self->_player, "objectMap"), &self->_gpuVirtualAddressArray.__begin_);

}

- (unsigned)executeIndirectRenderCommands:(id)a3 withData:(const char *)a4 forRange:(_NSRange)a5 forIndirectCommandBuffer:(id)a6
{
  NSUInteger length;
  NSUInteger location;
  id v11;
  id v12;
  MTLIndirectCommandBufferDescriptor *v13;
  void *v14;
  unsigned int v15;
  void *v17;
  _OWORD v18[7];
  _OWORD v19[4];
  uint64_t v20;

  length = a5.length;
  location = a5.location;
  v11 = a3;
  v12 = a6;
  -[DYMTLIndirectCommandBufferManager _calculateGPUVirtualAddress](self, "_calculateGPUVirtualAddress");
  DYMTLGetAssociatedObject(v12, 0);
  v13 = (MTLIndirectCommandBufferDescriptor *)objc_claimAutoreleasedReturnValue();
  DYMTLGetAssociatedObject(v12, 3u);
  v20 = 0;
  memset(v19, 0, sizeof(v19));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  MakeDYMTLIndirectCommandBufferDescriptor(v13, objc_msgSend(v17, "maxKernelThreadgroupMemoryBindCount"), (uint64_t)v19);
  memset(v18, 0, sizeof(v18));
  GPUTools::MTL::Utils::DYMTLCreateIndirectCommandEncoder((uint64_t *)v19, (uint64_t)v18);
  -[DYMTLIndirectCommandBufferManager saveRenderEncoder:withDescriptor:](self, "saveRenderEncoder:withDescriptor:", v11, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (location >= location + length)
  {
    v15 = 0;
  }
  else
  {
    v15 = 0;
    do
    {
      DYMTSetupRenderCommandEncoder(v11, (uint64_t)v19, location, (uint64_t)a4, (GPUTools::MTL::Utils::DYMTLIndirectCommandEncoder *)v18, (_QWORD *)-[DYMTLFunctionPlayer objectMap](self->_player, "objectMap"), self);
      v15 += DYMTLDrawRenderCommandEncoder(v11, location++, (uint64_t)a4, (GPUTools::MTL::Utils::DYMTLIndirectCommandEncoder *)v18, (_QWORD *)-[DYMTLFunctionPlayer objectMap](self->_player, "objectMap"), &self->_gpuVirtualAddressArray.__begin_);
      --length;
    }
    while (length);
  }
  objc_msgSend(v14, "restoreEncoder:withDescriptor:", v11, v13);

  return v15;
}

- (void)executeIndirectComputeCommand:(id)a3 withData:(const char *)a4 atIndex:(unint64_t)a5 forIndirectCommandBuffer:(id)a6
{
  id v10;
  id v11;
  MTLIndirectCommandBufferDescriptor *v12;
  void *v13;
  id v14;
  const char *v15;
  uint64_t v16;
  const char *ThreadgroupMemoryLength;
  const char *v18;
  unint64_t i;
  const char *v20;
  const char *v21;
  __int128 v22;
  uint64_t v23;
  uint64_t v24;
  const char *v25;
  const char *v26;
  __int128 v27;
  uint64_t v28;
  uint64_t v29;
  _OWORD v30[6];
  __int128 v31;
  _OWORD v32[4];
  unint64_t v33;
  __int128 v34;
  uint64_t v35;
  __int128 v36;
  uint64_t v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;

  v10 = a3;
  v11 = a6;
  -[DYMTLIndirectCommandBufferManager _calculateGPUVirtualAddress](self, "_calculateGPUVirtualAddress");
  DYMTLGetAssociatedObject(v11, 0);
  v12 = (MTLIndirectCommandBufferDescriptor *)objc_claimAutoreleasedReturnValue();
  DYMTLGetAssociatedObject(v11, 3u);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v33 = 0;
  memset(v32, 0, sizeof(v32));
  MakeDYMTLIndirectCommandBufferDescriptor(v12, objc_msgSend(v13, "maxKernelThreadgroupMemoryBindCount"), (uint64_t)v32);
  v31 = 0u;
  memset(v30, 0, sizeof(v30));
  GPUTools::MTL::Utils::DYMTLCreateIndirectCommandEncoder((uint64_t *)v32, (uint64_t)v30);
  v14 = v10;
  v15 = &a4[*((_QWORD *)&v31 + 1) * a5];
  v16 = GPUTools::MTL::Utils::DYMTLIndirectCommandEncoder::commandType((GPUTools::MTL::Utils::DYMTLIndirectCommandEncoder *)v30, v15);
  if (v16)
  {
    ThreadgroupMemoryLength = GPUTools::MTL::Utils::DYMTLIndirectCommandEncoder::getThreadgroupMemoryLength((GPUTools::MTL::Utils::DYMTLIndirectCommandEncoder *)v30, v15);
    if (v33)
    {
      v18 = ThreadgroupMemoryLength;
      for (i = 0; i < v33; ++i)
        objc_msgSend(v14, "setThreadgroupMemoryLength:atIndex:", *(_QWORD *)&v18[8 * i], i);
    }
    if (v16 == 32)
    {
      v25 = GPUTools::MTL::Utils::DYMTLIndirectCommandEncoder::concurrentDispatchThreadgroupsArguments((GPUTools::MTL::Utils::DYMTLIndirectCommandEncoder *)v30, v15);
      v26 = GPUTools::MTL::Utils::DYMTLIndirectCommandEncoder::indirectDispatchArguments((GPUTools::MTL::Utils::DYMTLIndirectCommandEncoder *)v30, v15);
      v27 = *((_OWORD *)v26 + 1);
      v38 = *(_OWORD *)v26;
      v39 = v27;
      v40 = *((_OWORD *)v26 + 2);
      objc_msgSend(v14, "setStageInRegion:", &v38);
      v28 = *((_QWORD *)v25 + 2);
      v36 = *(_OWORD *)v25;
      v37 = v28;
      v29 = *((_QWORD *)v25 + 5);
      v34 = *(_OWORD *)(v25 + 24);
      v35 = v29;
      objc_msgSend(v14, "dispatchThreadgroups:threadsPerThreadgroup:", &v36, &v34);
    }
    else if (v16 == 64)
    {
      v20 = GPUTools::MTL::Utils::DYMTLIndirectCommandEncoder::concurrentDispatchThreadsArguments((GPUTools::MTL::Utils::DYMTLIndirectCommandEncoder *)v30, v15);
      v21 = GPUTools::MTL::Utils::DYMTLIndirectCommandEncoder::indirectDispatchArguments((GPUTools::MTL::Utils::DYMTLIndirectCommandEncoder *)v30, v15);
      v22 = *((_OWORD *)v21 + 1);
      v38 = *(_OWORD *)v21;
      v39 = v22;
      v40 = *((_OWORD *)v21 + 2);
      objc_msgSend(v14, "setStageInRegion:", &v38);
      v23 = *((_QWORD *)v20 + 2);
      v36 = *(_OWORD *)v20;
      v37 = v23;
      v24 = *((_QWORD *)v20 + 5);
      v34 = *(_OWORD *)(v20 + 24);
      v35 = v24;
      objc_msgSend(v14, "dispatchThreads:threadsPerThreadgroup:", &v36, &v34);
    }
  }

}

- (void)restoreBuffer:(id)a3 withData:(const char *)a4 commandQueue:(id)a5
{
  id v8;
  id v9;
  MTLIndirectCommandBufferDescriptor *v10;
  uint64_t v11;
  objc_object *v12;
  void *v13;
  objc_object *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  __int128 v19;

  v8 = a3;
  v9 = a5;
  DYMTLGetAssociatedObject(v8, 0);
  v10 = (MTLIndirectCommandBufferDescriptor *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v8, "size");
  v12 = (objc_object *)v8;
  DYMTLGetAssociatedObject(v12, 3u);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v12;
  if ((objc_msgSend(v13, "options") & 0x20) != 0)
  {
    -[objc_object device](v12, "device");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = (objc_object *)objc_msgSend(v15, "newIndirectCommandBufferWithDescriptor:maxCommandCount:options:", v10, v11, 0);

  }
  -[DYMTLIndirectCommandBufferManager _calculateGPUVirtualAddress](self, "_calculateGPUVirtualAddress");
  MakeDYMTLIndirectCommandBufferDescriptor(v10, objc_msgSend(v13, "maxKernelThreadgroupMemoryBindCount", 0, 0, 0, 0, 0, 0, 0, 0, 0), (uint64_t)&v19);
  DYMTLGetOriginalObject(v14);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  DYMTLEncodeIndirectCommandBuffer(v16, (uint64_t)&v19, v11, (uint64_t)a4, (_QWORD *)-[DYMTLFunctionPlayer objectMap](self->_player, "objectMap"), self);

  if (v14 != v12)
  {
    objc_msgSend(v9, "commandBuffer");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "blitCommandEncoder");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "copyIndirectCommandBuffer:sourceRange:destination:destinationIndex:", v14, 0, v11, v12, 0);
    objc_msgSend(v18, "endEncoding");
    objc_msgSend(v17, "commit");

  }
}

- (void)restoreBuffer:(id)a3 optimizedRanges:(const char *)a4 commandQueue:(id)a5
{
  id v7;
  id v8;
  const void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  v8 = a5;
  GPUTools::MTL::MakeIndirectCommandBufferOptimizedRangeList((GPUTools::MTL *)a4, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v10, "count"))
  {
    objc_msgSend(v8, "commandBuffer");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "blitCommandEncoder");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = 0u;
    v22 = 0u;
    v19 = 0u;
    v20 = 0u;
    v13 = v10;
    v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    if (v14)
    {
      v15 = *(_QWORD *)v20;
      do
      {
        v16 = 0;
        do
        {
          if (*(_QWORD *)v20 != v15)
            objc_enumerationMutation(v13);
          v17 = objc_msgSend(*(id *)(*((_QWORD *)&v19 + 1) + 8 * v16), "rangeValue", (_QWORD)v19);
          objc_msgSend(v12, "optimizeIndirectCommandBuffer:withRange:", v7, v17, v18);
          ++v16;
        }
        while (v14 != v16);
        v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
      }
      while (v14);
    }

    objc_msgSend(v12, "endEncoding");
    objc_msgSend(v11, "commit");

  }
}

- (unint64_t)setupRenderCommandEncoder:(id)a3 withData:(const char *)a4 atIndex:(unint64_t)a5 forIndirectCommandBuffer:(id)a6
{
  id v10;
  id v11;
  MTLIndirectCommandBufferDescriptor *v12;
  void *v13;
  unint64_t v14;
  _OWORD v16[7];
  _OWORD v17[4];
  uint64_t v18;

  v10 = a3;
  v11 = a6;
  -[DYMTLIndirectCommandBufferManager _calculateGPUVirtualAddress](self, "_calculateGPUVirtualAddress");
  DYMTLGetAssociatedObject(v11, 0);
  v12 = (MTLIndirectCommandBufferDescriptor *)objc_claimAutoreleasedReturnValue();
  DYMTLGetAssociatedObject(v11, 3u);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = 0;
  memset(v17, 0, sizeof(v17));
  MakeDYMTLIndirectCommandBufferDescriptor(v12, objc_msgSend(v13, "maxKernelThreadgroupMemoryBindCount"), (uint64_t)v17);
  memset(v16, 0, sizeof(v16));
  GPUTools::MTL::Utils::DYMTLCreateIndirectCommandEncoder((uint64_t *)v17, (uint64_t)v16);
  v14 = DYMTSetupRenderCommandEncoder(v10, (uint64_t)v17, a5, (uint64_t)a4, (GPUTools::MTL::Utils::DYMTLIndirectCommandEncoder *)v16, (_QWORD *)-[DYMTLFunctionPlayer objectMap](self->_player, "objectMap"), self);

  return v14;
}

- (unint64_t)setupComputeCommandEncoder:(id)a3 withData:(const char *)a4 atIndex:(unint64_t)a5 forIndirectCommandBuffer:(id)a6
{
  id v10;
  id v11;
  void *v12;
  _QWORD *v13;
  id v14;
  DYMTLIndirectCommandBufferManager *v15;
  const char *v16;
  unint64_t v17;
  void *v18;
  const char *KernelBuffers;
  const char *v20;
  unint64_t v21;
  unint64_t v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  MTLIndirectCommandBufferDescriptor *v27;
  _OWORD v28[6];
  __int128 v29;
  _OWORD v30[3];
  __int128 v31;
  uint64_t v32;

  v10 = a3;
  v11 = a6;
  -[DYMTLIndirectCommandBufferManager _calculateGPUVirtualAddress](self, "_calculateGPUVirtualAddress", v10);
  DYMTLGetAssociatedObject(v11, 0);
  v27 = (MTLIndirectCommandBufferDescriptor *)objc_claimAutoreleasedReturnValue();
  DYMTLGetAssociatedObject(v11, 3u);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = 0;
  v31 = 0u;
  memset(v30, 0, sizeof(v30));
  MakeDYMTLIndirectCommandBufferDescriptor(v27, objc_msgSend(v12, "maxKernelThreadgroupMemoryBindCount"), (uint64_t)v30);
  v29 = 0u;
  memset(v28, 0, sizeof(v28));
  GPUTools::MTL::Utils::DYMTLCreateIndirectCommandEncoder((uint64_t *)v30, (uint64_t)v28);
  v13 = -[DYMTLFunctionPlayer objectMap](self->_player, "objectMap");
  v14 = v10;
  v15 = self;
  v16 = &a4[*((_QWORD *)&v29 + 1) * a5];
  if (BYTE9(v30[0]))
  {
    v17 = 0;
  }
  else
  {
    v17 = -[DYMTLIndirectCommandBufferManager computePipelineIdForUniqueIdentifier:](v15, "computePipelineIdForUniqueIdentifier:", GPUTools::MTL::Utils::DYMTLIndirectCommandEncoder::getPipelineStateUniqueIdentifier((GPUTools::MTL::Utils::DYMTLIndirectCommandEncoder *)v28, v16));
    GetObjectForKey(v13, v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setComputePipelineState:", v18);

  }
  if (!BYTE8(v30[0]))
  {
    KernelBuffers = GPUTools::MTL::Utils::DYMTLIndirectCommandEncoder::getKernelBuffers((GPUTools::MTL::Utils::DYMTLIndirectCommandEncoder *)v28, v16);
    if ((_QWORD)v31)
    {
      v20 = KernelBuffers;
      v21 = 0;
      do
      {
        v22 = -[DYMTLIndirectCommandBufferManager bufferIdAndOffsetForGPUVirtualAddress:](v15, "bufferIdAndOffsetForGPUVirtualAddress:", *(_QWORD *)&v20[8 * v21]);
        v24 = v23;
        GetObjectForKey(v13, v22);
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "setBuffer:offset:atIndex:", v25, v24, v21);

        ++v21;
      }
      while (v21 < (unint64_t)v31);
    }
  }

  return v17;
}

- (void)updateReplayerTranslationBuffer
{
  _QWORD *next;
  void *v4;
  void *v5;
  id v6;
  id v7;
  void **v8;
  void **v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v12;
  unint64_t v13;
  char *v14;
  uint64_t v15;
  char *v16;
  void **v17;
  void **v18;
  void **v19;
  void **v20;
  void *v21;
  void *v22;
  char *v23;
  char *v24;
  void **v25;
  char *v26;
  char *v27;
  uint64_t v28;
  void **v29;
  void **v30;
  void *v31;
  objc_object *v32;
  void *v33;
  char *v34;
  int64_t v35;
  uint64_t v36;
  char *v37;
  int64_t v38;
  uint64_t v39;
  char *v40;
  int64_t v41;
  _QWORD *v42;
  void *v43;
  void *v44;
  id v45;
  id v46;
  void **v47;
  void **v48;
  uint64_t v49;
  unint64_t v50;
  uint64_t v51;
  unint64_t v52;
  char *v53;
  uint64_t v54;
  char *v55;
  void **v56;
  void **v57;
  void **v58;
  void **v59;
  void *v60;
  void *v61;
  char *v62;
  char *v63;
  void **v64;
  char *v65;
  int64_t v66;
  void **v67;
  void **v68;
  objc_object *v69;
  void *v70;
  char *v71;
  int64_t v72;
  void *v73;
  uint64_t v74;
  char *v75;
  int64_t v76;
  _QWORD *v77;
  void *v78;
  void *v79;
  id v80;
  id v81;
  void **v82;
  void **v83;
  uint64_t v84;
  unint64_t v85;
  uint64_t v86;
  unint64_t v87;
  char *v88;
  uint64_t v89;
  char *v90;
  void **v91;
  void **v92;
  void **v93;
  void **v94;
  void *v95;
  void *v96;
  char *v97;
  uint64_t v98;
  char *v99;
  int64_t v100;
  void **v101;
  void **v102;
  objc_object *v103;
  void *v104;
  char *v105;
  int64_t v106;
  void *v107;
  uint64_t v108;
  char *v109;
  int64_t v110;
  void *v111;
  void *v112;
  void **v113;
  void **v114;
  char *v115;
  void *__p;
  char *v117;
  uint64_t v118;
  void **v119;
  void **v120;
  void **v121;
  char *v122;
  char **v123;

  __p = 0;
  v117 = 0;
  v118 = 0;
  v113 = 0;
  v114 = 0;
  v115 = 0;
  next = self->_gpuVirtualAddressMap.__table_.__p1_.__value_.__next_;
  if (next)
  {
    do
    {
      v4 = (void *)next[2];
      -[DYMTLFunctionPlayer objectForKey:](self->_player, "objectForKey:", v4, v113);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v5, "conformsToProtocol:", &unk_256BDB468))
      {
        v6 = v5;
        v7 = v6;
        v8 = v114;
        if (v114 >= (void **)v115)
        {
          v10 = ((char *)v114 - (char *)v113) >> 4;
          v11 = v10 + 1;
          if ((unint64_t)(v10 + 1) >> 60)
            std::vector<std::pair<ShaderDebugger::Metadata::MDBase::MetadataType,unsigned long long>>::__throw_length_error[abi:ne180100]();
          v12 = v115 - (char *)v113;
          if ((v115 - (char *)v113) >> 3 > v11)
            v11 = v12 >> 3;
          if ((unint64_t)v12 >= 0x7FFFFFFFFFFFFFF0)
            v13 = 0xFFFFFFFFFFFFFFFLL;
          else
            v13 = v11;
          v123 = &v115;
          v14 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<std::pair<ShaderDebugger::Metadata::MDBase::MetadataType,unsigned long long>>>((uint64_t)&v115, v13);
          v16 = &v14[16 * v10];
          *(_QWORD *)v16 = v4;
          *((_QWORD *)v16 + 1) = v7;
          v18 = v113;
          v17 = v114;
          v19 = (void **)v16;
          if (v114 != v113)
          {
            v20 = v114;
            do
            {
              v21 = *(v20 - 2);
              v20 -= 2;
              *(v19 - 2) = v21;
              v19 -= 2;
              v22 = v20[1];
              v20[1] = 0;
              v19[1] = v22;
            }
            while (v20 != v18);
          }
          v9 = (void **)(v16 + 16);
          v113 = v19;
          v114 = (void **)(v16 + 16);
          v23 = v115;
          v115 = &v14[16 * v15];
          v121 = v17;
          v122 = v23;
          v119 = v18;
          v120 = v18;
          std::__split_buffer<std::pair<unsigned long long,objc_object * {__strong}>>::~__split_buffer((uint64_t)&v119);
        }
        else
        {
          *v114 = v4;
          v8[1] = v6;
          v9 = v8 + 2;
        }
        v114 = v9;
      }

      next = (_QWORD *)*next;
    }
    while (next);
    v25 = v113;
    v24 = (char *)v114;
    v26 = (char *)__p;
    v27 = v117;
  }
  else
  {
    v26 = 0;
    v27 = 0;
    v25 = 0;
    v24 = 0;
  }
  v28 = v27 - v26;
  if ((unint64_t)(v27 - v26) > 0xFFFFFFFFFFFFFFF7)
  {
    v117 = v27 + 8;
  }
  else
  {
    std::vector<unsigned char>::__append((unint64_t *)&__p, 8uLL);
    v26 = (char *)__p;
  }
  *(_QWORD *)&v26[v28] = (v24 - (char *)v25) >> 4;
  v29 = v113;
  v30 = v114;
  while (v29 != v30)
  {
    v31 = *v29;
    v32 = v29[1];
    DYMTLGetOriginalObject(v32);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v34 = (char *)__p;
    v35 = v117 - (_BYTE *)__p;
    if ((unint64_t)(v117 - (_BYTE *)__p) > 0xFFFFFFFFFFFFFFF7)
    {
      v117 += 8;
    }
    else
    {
      std::vector<unsigned char>::__append((unint64_t *)&__p, 8uLL);
      v34 = (char *)__p;
    }
    *(_QWORD *)&v34[v35] = v31;
    v36 = objc_msgSend(v33, "gpuAddress", v113);
    v37 = (char *)__p;
    v38 = v117 - (_BYTE *)__p;
    if ((unint64_t)(v117 - (_BYTE *)__p) > 0xFFFFFFFFFFFFFFF7)
    {
      v117 += 8;
    }
    else
    {
      std::vector<unsigned char>::__append((unint64_t *)&__p, 8uLL);
      v37 = (char *)__p;
    }
    *(_QWORD *)&v37[v38] = v36;
    v39 = objc_msgSend(v33, "length");
    v40 = (char *)__p;
    v41 = v117 - (_BYTE *)__p;
    if ((unint64_t)(v117 - (_BYTE *)__p) > 0xFFFFFFFFFFFFFFF7)
    {
      v117 += 8;
    }
    else
    {
      std::vector<unsigned char>::__append((unint64_t *)&__p, 8uLL);
      v40 = (char *)__p;
    }
    *(_QWORD *)&v40[v41] = v39;

    v29 += 2;
  }
  v119 = (void **)&v113;
  std::vector<std::pair<unsigned long long,objc_object * {__strong}>>::__destroy_vector::operator()[abi:ne180100](&v119);
  v113 = 0;
  v114 = 0;
  v115 = 0;
  v42 = self->_renderPipelineStateUniqueIdentifier.__table_.__p1_.__value_.__next_;
  if (v42)
  {
    do
    {
      v43 = (void *)v42[3];
      -[DYMTLFunctionPlayer objectForKey:](self->_player, "objectForKey:", v43, v113);
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v44, "conformsToProtocol:", &unk_256BDB910))
      {
        v45 = v44;
        v46 = v45;
        v47 = v114;
        if (v114 >= (void **)v115)
        {
          v49 = ((char *)v114 - (char *)v113) >> 4;
          v50 = v49 + 1;
          if ((unint64_t)(v49 + 1) >> 60)
            std::vector<std::pair<ShaderDebugger::Metadata::MDBase::MetadataType,unsigned long long>>::__throw_length_error[abi:ne180100]();
          v51 = v115 - (char *)v113;
          if ((v115 - (char *)v113) >> 3 > v50)
            v50 = v51 >> 3;
          if ((unint64_t)v51 >= 0x7FFFFFFFFFFFFFF0)
            v52 = 0xFFFFFFFFFFFFFFFLL;
          else
            v52 = v50;
          v123 = &v115;
          v53 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<std::pair<ShaderDebugger::Metadata::MDBase::MetadataType,unsigned long long>>>((uint64_t)&v115, v52);
          v55 = &v53[16 * v49];
          *(_QWORD *)v55 = v43;
          *((_QWORD *)v55 + 1) = v46;
          v57 = v113;
          v56 = v114;
          v58 = (void **)v55;
          if (v114 != v113)
          {
            v59 = v114;
            do
            {
              v60 = *(v59 - 2);
              v59 -= 2;
              *(v58 - 2) = v60;
              v58 -= 2;
              v61 = v59[1];
              v59[1] = 0;
              v58[1] = v61;
            }
            while (v59 != v57);
          }
          v48 = (void **)(v55 + 16);
          v113 = v58;
          v114 = (void **)(v55 + 16);
          v62 = v115;
          v115 = &v53[16 * v54];
          v121 = v56;
          v122 = v62;
          v119 = v57;
          v120 = v57;
          std::__split_buffer<std::pair<unsigned long long,objc_object * {__strong}>>::~__split_buffer((uint64_t)&v119);
        }
        else
        {
          *v114 = v43;
          v47[1] = v45;
          v48 = v47 + 2;
        }
        v114 = v48;
      }

      v42 = (_QWORD *)*v42;
    }
    while (v42);
    v64 = v113;
    v63 = (char *)v114;
  }
  else
  {
    v64 = 0;
    v63 = 0;
  }
  v65 = (char *)__p;
  v66 = v117 - (_BYTE *)__p;
  if ((unint64_t)(v117 - (_BYTE *)__p) > 0xFFFFFFFFFFFFFFF7)
  {
    v117 += 8;
  }
  else
  {
    std::vector<unsigned char>::__append((unint64_t *)&__p, 8uLL);
    v65 = (char *)__p;
  }
  *(_QWORD *)&v65[v66] = (v63 - (char *)v64) >> 4;
  v67 = v113;
  v68 = v114;
  while (v67 != v68)
  {
    v69 = v67[1];
    v70 = *v67;
    v71 = (char *)__p;
    v72 = v117 - (_BYTE *)__p;
    if ((unint64_t)(v117 - (_BYTE *)__p) > 0xFFFFFFFFFFFFFFF7)
    {
      v117 += 8;
    }
    else
    {
      std::vector<unsigned char>::__append((unint64_t *)&__p, 8uLL);
      v71 = (char *)__p;
    }
    *(_QWORD *)&v71[v72] = v70;
    DYMTLGetOriginalObject(v69);
    v73 = (void *)objc_claimAutoreleasedReturnValue();
    v74 = objc_msgSend(v73, "uniqueIdentifier");
    v75 = (char *)__p;
    v76 = v117 - (_BYTE *)__p;
    if ((unint64_t)(v117 - (_BYTE *)__p) > 0xFFFFFFFFFFFFFFF7)
    {
      v117 += 8;
    }
    else
    {
      std::vector<unsigned char>::__append((unint64_t *)&__p, 8uLL);
      v75 = (char *)__p;
    }
    *(_QWORD *)&v75[v76] = v74;

    v67 += 2;
  }
  v119 = (void **)&v113;
  std::vector<std::pair<unsigned long long,objc_object * {__strong}>>::__destroy_vector::operator()[abi:ne180100](&v119);
  v113 = 0;
  v114 = 0;
  v115 = 0;
  v77 = self->_computePipelineStateUniqueIdentifier.__table_.__p1_.__value_.__next_;
  if (v77)
  {
    do
    {
      v78 = (void *)v77[3];
      -[DYMTLFunctionPlayer objectForKey:](self->_player, "objectForKey:", v78, v113);
      v79 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v79, "conformsToProtocol:", &unk_256BDBBA8))
      {
        v80 = v79;
        v81 = v80;
        v82 = v114;
        if (v114 >= (void **)v115)
        {
          v84 = ((char *)v114 - (char *)v113) >> 4;
          v85 = v84 + 1;
          if ((unint64_t)(v84 + 1) >> 60)
            std::vector<std::pair<ShaderDebugger::Metadata::MDBase::MetadataType,unsigned long long>>::__throw_length_error[abi:ne180100]();
          v86 = v115 - (char *)v113;
          if ((v115 - (char *)v113) >> 3 > v85)
            v85 = v86 >> 3;
          if ((unint64_t)v86 >= 0x7FFFFFFFFFFFFFF0)
            v87 = 0xFFFFFFFFFFFFFFFLL;
          else
            v87 = v85;
          v123 = &v115;
          v88 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<std::pair<ShaderDebugger::Metadata::MDBase::MetadataType,unsigned long long>>>((uint64_t)&v115, v87);
          v90 = &v88[16 * v84];
          *(_QWORD *)v90 = v78;
          *((_QWORD *)v90 + 1) = v81;
          v92 = v113;
          v91 = v114;
          v93 = (void **)v90;
          if (v114 != v113)
          {
            v94 = v114;
            do
            {
              v95 = *(v94 - 2);
              v94 -= 2;
              *(v93 - 2) = v95;
              v93 -= 2;
              v96 = v94[1];
              v94[1] = 0;
              v93[1] = v96;
            }
            while (v94 != v92);
          }
          v83 = (void **)(v90 + 16);
          v113 = v93;
          v114 = (void **)(v90 + 16);
          v97 = v115;
          v115 = &v88[16 * v89];
          v121 = v91;
          v122 = v97;
          v119 = v92;
          v120 = v92;
          std::__split_buffer<std::pair<unsigned long long,objc_object * {__strong}>>::~__split_buffer((uint64_t)&v119);
        }
        else
        {
          *v114 = v78;
          v82[1] = v80;
          v83 = v82 + 2;
        }
        v114 = v83;
      }

      v77 = (_QWORD *)*v77;
    }
    while (v77);
    v98 = ((char *)v114 - (char *)v113) >> 4;
  }
  else
  {
    v98 = 0;
  }
  v99 = (char *)__p;
  v100 = v117 - (_BYTE *)__p;
  if ((unint64_t)(v117 - (_BYTE *)__p) > 0xFFFFFFFFFFFFFFF7)
  {
    v117 += 8;
  }
  else
  {
    std::vector<unsigned char>::__append((unint64_t *)&__p, 8uLL);
    v99 = (char *)__p;
  }
  *(_QWORD *)&v99[v100] = v98;
  v101 = v113;
  v102 = v114;
  while (v101 != v102)
  {
    v103 = v101[1];
    v104 = *v101;
    v105 = (char *)__p;
    v106 = v117 - (_BYTE *)__p;
    if ((unint64_t)(v117 - (_BYTE *)__p) > 0xFFFFFFFFFFFFFFF7)
    {
      v117 += 8;
    }
    else
    {
      std::vector<unsigned char>::__append((unint64_t *)&__p, 8uLL);
      v105 = (char *)__p;
    }
    *(_QWORD *)&v105[v106] = v104;
    DYMTLGetOriginalObject(v103);
    v107 = (void *)objc_claimAutoreleasedReturnValue();
    v108 = objc_msgSend(v107, "uniqueIdentifier");
    v109 = (char *)__p;
    v110 = v117 - (_BYTE *)__p;
    if ((unint64_t)(v117 - (_BYTE *)__p) > 0xFFFFFFFFFFFFFFF7)
    {
      v117 += 8;
    }
    else
    {
      std::vector<unsigned char>::__append((unint64_t *)&__p, 8uLL);
      v109 = (char *)__p;
    }
    *(_QWORD *)&v109[v110] = v108;

    v101 += 2;
  }
  v119 = (void **)&v113;
  std::vector<std::pair<unsigned long long,objc_object * {__strong}>>::__destroy_vector::operator()[abi:ne180100](&v119);
  -[DYMTLFunctionPlayer device](self->_player, "device");
  v111 = (void *)objc_claimAutoreleasedReturnValue();
  v112 = (void *)objc_msgSend(v111, "newBufferWithBytes:length:options:", __p, v117 - (_BYTE *)__p, 0);

  -[DYMTLFunctionPlayer setObject:forKey:](self->_player, "setObject:forKey:", v112, *MEMORY[0x24BE394B0]);
  if (__p)
  {
    v117 = (char *)__p;
    operator delete(__p);
  }
}

- (id)convertIndirectCommandBufferData:(const char *)a3 range:(_NSRange)a4 toFBufStream:(const CoreFunction *)a5
{
  NSUInteger length;
  NSUInteger location;
  char v10;
  void *v11;
  MTLIndirectCommandBufferDescriptor *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  _OWORD v18[6];
  __int128 v19;
  _OWORD v20[4];
  uint64_t v21;

  length = a4.length;
  location = a4.location;
  -[DYMTLIndirectCommandBufferManager _calculateGPUVirtualAddress](self, "_calculateGPUVirtualAddress");
  v10 = GPUTools::FD::Argument::ViewAsScalarArray<unsigned long long>((uint64_t)a5->var6, 0);
  -[DYMTLFunctionPlayer objectForKey:](self->_player, "objectForKey:", GPUTools::FD::Argument::ViewAsScalarArray<unsigned long long>((uint64_t)&a5->var6[1], 0));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  DYMTLGetAssociatedObject(v11, 0);
  v12 = (MTLIndirectCommandBufferDescriptor *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v11, "size");
  DYMTLGetAssociatedObject(v11, 3u);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = 0;
  memset(v20, 0, sizeof(v20));
  MakeDYMTLIndirectCommandBufferDescriptor(v12, objc_msgSend(v14, "maxKernelThreadgroupMemoryBindCount"), (uint64_t)v20);
  v19 = 0u;
  memset(v18, 0, sizeof(v18));
  GPUTools::MTL::Utils::DYMTLCreateIndirectCommandEncoder((uint64_t *)v20, (uint64_t)v18);
  objc_msgSend(MEMORY[0x24BDBCE50], "dataWithBytesNoCopy:length:freeWhenDone:", a3, *((_QWORD *)&v19 + 1) * v13, 0);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  GPUTools::MTL::Utils::DYMTLConvertIndirectCommandBufferDataToFBufStream((uint64_t)v20, v15, v10, location, length, self, a5->var1);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  return v16;
}

- (id)saveRenderEncoder:(id)a3 withDescriptor:(id)a4
{
  +[IndirectRenderCommandEncoderState saveEncoder:withDescriptor:player:](IndirectRenderCommandEncoderState, "saveEncoder:withDescriptor:player:", a3, a4, self->_player);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)saveComputeEncoder:(id)a3 withDescriptor:(id)a4
{
  +[IndirectComputeCommandEncoderState saveEncoder:withDescriptor:player:](IndirectComputeCommandEncoderState, "saveEncoder:withDescriptor:player:", a3, a4, self->_player);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void).cxx_destruct
{
  DYMTLBufferGPUAddress *begin;

  begin = self->_gpuVirtualAddressArray.__begin_;
  if (begin)
  {
    self->_gpuVirtualAddressArray.__end_ = begin;
    operator delete(begin);
  }
  std::__hash_table<std::__hash_value_type<unsigned long long,BOOL>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,BOOL>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,BOOL>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,BOOL>>>::~__hash_table((uint64_t)&self->_computePipelineStateUniqueIdentifier);
  std::__hash_table<std::__hash_value_type<unsigned long long,BOOL>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,BOOL>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,BOOL>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,BOOL>>>::~__hash_table((uint64_t)&self->_renderPipelineStateUniqueIdentifier);
  std::__hash_table<std::__hash_value_type<unsigned long long,BOOL>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,BOOL>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,BOOL>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,BOOL>>>::~__hash_table((uint64_t)&self->_gpuVirtualAddressMap);
  objc_storeStrong((id *)&self->_player, 0);
}

- (id).cxx_construct
{
  *((_OWORD *)self + 1) = 0u;
  *((_OWORD *)self + 2) = 0u;
  *((_DWORD *)self + 12) = 1065353216;
  *(_OWORD *)((char *)self + 56) = 0u;
  *(_OWORD *)((char *)self + 72) = 0u;
  *((_DWORD *)self + 22) = 1065353216;
  *((_OWORD *)self + 6) = 0u;
  *((_OWORD *)self + 7) = 0u;
  *((_DWORD *)self + 32) = 1065353216;
  *((_QWORD *)self + 18) = 0;
  *((_QWORD *)self + 19) = 0;
  *((_QWORD *)self + 17) = 0;
  return self;
}

@end
