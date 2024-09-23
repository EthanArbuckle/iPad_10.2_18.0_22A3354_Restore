@implementation DYMTLComputeCommandEncoderStateTracker

- (DYMTLComputeCommandEncoderStateTracker)initWithEncoder:(id)a3 dispatchType:(unint64_t)a4
{
  id v7;
  DYMTLComputeCommandEncoderStateTracker *v8;
  DYMTLComputeCommandEncoderStateTracker *v9;
  DYMTLComputeCommandEncoderStateTracker *v10;
  objc_super v12;

  v7 = a3;
  if (v7)
  {
    v12.receiver = self;
    v12.super_class = (Class)DYMTLComputeCommandEncoderStateTracker;
    v8 = -[DYMTLComputeCommandEncoderStateTracker init](&v12, sel_init);
    v9 = v8;
    if (v8)
    {
      objc_storeStrong((id *)&v8->_computeEncoder, a3);
      v9->_dispatchType = a4;
      v9->_hasSetStageInRegion = 0;
    }
    self = v9;
    v10 = self;
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (BOOL)conformsToProtocol:(id)a3
{
  id v4;
  BOOL v5;
  objc_super v7;

  v4 = a3;
  if ((-[MTLComputeCommandEncoderSPI conformsToProtocol:](self->_computeEncoder, "conformsToProtocol:", v4) & 1) != 0)
  {
    v5 = 1;
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)DYMTLComputeCommandEncoderStateTracker;
    v5 = -[DYMTLComputeCommandEncoderStateTracker conformsToProtocol:](&v7, sel_conformsToProtocol_, v4);
  }

  return v5;
}

- (id)forwardingTargetForSelector:(SEL)a3
{
  return self->_computeEncoder;
}

- (BOOL)respondsToSelector:(SEL)a3
{
  char v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)DYMTLComputeCommandEncoderStateTracker;
  if (-[DYMTLComputeCommandEncoderStateTracker respondsToSelector:](&v5, sel_respondsToSelector_))
    v3 = 1;
  else
    v3 = objc_opt_respondsToSelector();
  return v3 & 1;
}

- (id)computePipelineState
{
  return self->_computePipelineState;
}

- (void)setComputePipelineState:(id)a3
{
  self->_computePipelineState = (MTLComputePipelineState *)a3;
  -[MTLComputeCommandEncoderSPI setComputePipelineState:](self->_computeEncoder, "setComputePipelineState:");
}

- (void)setBytes:(const void *)a3 length:(unint64_t)a4 atIndex:(unint64_t)a5
{
  DYMTLBoundBufferInfo v9;

  DYMTLBoundBufferInfo::DYMTLBoundBufferInfo(&v9, a3, a4);
  DYMTLBoundBufferInfo::operator=((id *)&self->_buffers[a5].m_buffer, (uint64_t)&v9);
  free(v9.m_bytes);

  -[MTLComputeCommandEncoderSPI setBytes:length:atIndex:](self->_computeEncoder, "setBytes:length:atIndex:", a3, a4, a5);
}

- (void)setBuffer:(id)a3 offset:(unint64_t)a4 atIndex:(unint64_t)a5
{
  id v8;
  id v9;
  void *v10;
  unint64_t v11;

  v8 = a3;
  v9 = v8;
  v10 = 0;
  v11 = a4;
  DYMTLBoundBufferInfo::operator=((id *)&self->_buffers[a5].m_buffer, (uint64_t)&v9);
  free(v10);

  -[MTLComputeCommandEncoderSPI setBuffer:offset:atIndex:](self->_computeEncoder, "setBuffer:offset:atIndex:", v8, a4, a5);
}

- (void)setBufferOffset:(unint64_t)a3 atIndex:(unint64_t)a4
{
  self->_buffers[a4].m_offsetOrLength = a3;
  -[MTLComputeCommandEncoderSPI setBufferOffset:atIndex:](self->_computeEncoder, "setBufferOffset:atIndex:");
}

- (void)setBuffers:(const void *)a3 offsets:(const unint64_t *)a4 withRange:(_NSRange)a5
{
  NSUInteger length;
  NSUInteger location;
  DYMTLBoundBufferInfo *v10;
  const void **v11;
  const unint64_t *v12;
  NSUInteger v13;
  uint64_t v14;
  id v15;
  void *v16;
  uint64_t v17;

  length = a5.length;
  location = a5.location;
  if (a5.length)
  {
    v10 = &self->_buffers[a5.location];
    v11 = a3;
    v12 = a4;
    v13 = a5.length;
    do
    {
      v14 = *v12++;
      v15 = (id)*v11;
      v16 = 0;
      v17 = v14;
      DYMTLBoundBufferInfo::operator=((id *)&v10->m_buffer, (uint64_t)&v15);
      free(v16);

      ++v11;
      ++v10;
      --v13;
    }
    while (v13);
  }
  -[MTLComputeCommandEncoderSPI setBuffers:offsets:withRange:](self->_computeEncoder, "setBuffers:offsets:withRange:", a3, a4, location, length);
}

- (void)setTexture:(id)a3 atIndex:(unint64_t)a4
{
  self->_textures[a4] = (MTLTexture *)a3;
  -[MTLComputeCommandEncoderSPI setTexture:atIndex:](self->_computeEncoder, "setTexture:atIndex:");
}

- (void)setTextures:(const void *)a3 withRange:(_NSRange)a4
{
  MTLTexture **v4;
  const void **v5;
  NSUInteger length;
  MTLTexture *v7;

  if (a4.length)
  {
    v4 = &self->_textures[a4.location];
    v5 = a3;
    length = a4.length;
    do
    {
      v7 = (MTLTexture *)*v5++;
      *v4++ = v7;
      --length;
    }
    while (length);
  }
  -[MTLComputeCommandEncoderSPI setTextures:withRange:](self->_computeEncoder, "setTextures:withRange:", a3, a4.location);
}

- (void)setSamplerState:(id)a3 atIndex:(unint64_t)a4
{
  char *v4;

  v4 = (char *)self + 16 * a4;
  *((_QWORD *)v4 + 230) = a3;
  *((_QWORD *)v4 + 231) = 0x447A000000000000;
  -[MTLComputeCommandEncoderSPI setSamplerState:atIndex:](self->_computeEncoder, "setSamplerState:atIndex:");
}

- (void)setSamplerStates:(const void *)a3 withRange:(_NSRange)a4
{
  float *p_minLOD;
  const void **v5;
  NSUInteger length;
  uint64_t v7;

  if (a4.length)
  {
    p_minLOD = &self->_samplers[a4.location].minLOD;
    v5 = a3;
    length = a4.length;
    do
    {
      v7 = (uint64_t)*v5++;
      *((_QWORD *)p_minLOD - 1) = v7;
      *(_QWORD *)p_minLOD = 0x447A000000000000;
      p_minLOD += 4;
      --length;
    }
    while (length);
  }
  -[MTLComputeCommandEncoderSPI setSamplerStates:withRange:](self->_computeEncoder, "setSamplerStates:withRange:", a3, a4.location);
}

- (void)setSamplerState:(id)a3 lodMinClamp:(float)a4 lodMaxClamp:(float)a5 atIndex:(unint64_t)a6
{
  char *v6;

  v6 = (char *)self + 16 * a6;
  *((_QWORD *)v6 + 230) = a3;
  *((float *)v6 + 462) = a4;
  *((float *)v6 + 463) = a5;
  -[MTLComputeCommandEncoderSPI setSamplerState:lodMinClamp:lodMaxClamp:atIndex:](self->_computeEncoder, "setSamplerState:lodMinClamp:lodMaxClamp:atIndex:");
}

- (void)setSamplerStates:(const void *)a3 lodMinClamps:(const float *)a4 lodMaxClamps:(const float *)a5 withRange:(_NSRange)a6
{
  float *p_maxLOD;
  const void **v7;
  const float *v8;
  const float *v9;
  NSUInteger length;
  uint64_t v11;
  uint64_t v12;
  int v13;

  if (a6.length)
  {
    p_maxLOD = &self->_samplers[a6.location].maxLOD;
    v7 = a3;
    v8 = a4;
    v9 = a5;
    length = a6.length;
    do
    {
      v12 = (uint64_t)*v7++;
      v11 = v12;
      *(float *)&v12 = *v8++;
      v13 = v12;
      *(float *)&v12 = *v9++;
      *(_QWORD *)(p_maxLOD - 3) = v11;
      *((_DWORD *)p_maxLOD - 1) = v13;
      *(_DWORD *)p_maxLOD = v12;
      p_maxLOD += 4;
      --length;
    }
    while (length);
  }
  -[MTLComputeCommandEncoderSPI setSamplerStates:lodMinClamps:lodMaxClamps:withRange:](self->_computeEncoder, "setSamplerStates:lodMinClamps:lodMaxClamps:withRange:", a3, a4, a5, a6.location);
}

- (void)setThreadgroupMemoryLength:(unint64_t)a3 atIndex:(unint64_t)a4
{
  self->_threadgroupMemories[a4] = a3;
  -[MTLComputeCommandEncoderSPI setThreadgroupMemoryLength:atIndex:](self->_computeEncoder, "setThreadgroupMemoryLength:atIndex:");
}

- (void)setStageInRegion:(id *)a3
{
  __int128 v3;
  __int128 v4;
  MTLComputeCommandEncoderSPI *computeEncoder;
  __int128 v6;
  _OWORD v7[3];

  self->_hasSetStageInRegion = 1;
  v3 = *(_OWORD *)&a3->var0.var0;
  v4 = *(_OWORD *)&a3->var1.var1;
  *(_OWORD *)&self->_stageInRegion.origin.z = *(_OWORD *)&a3->var0.var2;
  *(_OWORD *)&self->_stageInRegion.size.height = v4;
  *(_OWORD *)&self->_stageInRegion.origin.x = v3;
  computeEncoder = self->_computeEncoder;
  v6 = *(_OWORD *)&a3->var0.var2;
  v7[0] = *(_OWORD *)&a3->var0.var0;
  v7[1] = v6;
  v7[2] = *(_OWORD *)&a3->var1.var1;
  -[MTLComputeCommandEncoderSPI setStageInRegion:](computeEncoder, "setStageInRegion:", v7);
}

- (void)setStageInRegionWithIndirectBuffer:(id)a3 indirectBufferOffset:(unint64_t)a4
{
  self->_stageInRegionIndirectBuffer = (MTLBuffer *)a3;
  self->_stageInRegionIndirectBufferOffset = a4;
  -[MTLComputeCommandEncoderSPI setStageInRegionWithIndirectBuffer:indirectBufferOffset:](self->_computeEncoder, "setStageInRegionWithIndirectBuffer:indirectBufferOffset:");
}

- (void)useResource:(id)a3 usage:(unint64_t)a4
{
  id v6;
  DYMTLUsedResourceInfo *value;
  DYMTLUsedResourceInfo *end;
  DYMTLUsedResourceInfo *v9;
  DYMTLUsedResourceInfo *begin;
  uint64_t v11;
  unint64_t v12;
  uint64_t v13;
  unint64_t v14;
  char *v15;
  char *v16;
  uint64_t v17;
  DYMTLUsedResourceInfo *v18;
  DYMTLUsedResourceInfo *v19;
  DYMTLUsedResourceInfo *v20;
  id v21;

  v6 = a3;
  value = self->_usedResources.__end_cap_.__value_;
  end = self->_usedResources.__end_;
  v21 = v6;
  if (end >= value)
  {
    begin = self->_usedResources.__begin_;
    v11 = (end - begin) >> 4;
    v12 = v11 + 1;
    if ((unint64_t)(v11 + 1) >> 60)
      std::vector<std::pair<ShaderDebugger::Metadata::MDBase::MetadataType,unsigned long long>>::__throw_length_error[abi:ne180100]();
    v13 = value - begin;
    if (v13 >> 3 > v12)
      v12 = v13 >> 3;
    if ((unint64_t)v13 >= 0x7FFFFFFFFFFFFFF0)
      v14 = 0xFFFFFFFFFFFFFFFLL;
    else
      v14 = v12;
    v15 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<std::pair<ShaderDebugger::Metadata::MDBase::MetadataType,unsigned long long>>>((uint64_t)&self->_usedResources.__end_cap_, v14);
    v16 = &v15[16 * v11];
    v18 = (DYMTLUsedResourceInfo *)&v15[16 * v17];
    *(_QWORD *)v16 = v21;
    *((_QWORD *)v16 + 1) = a4;
    v9 = (DYMTLUsedResourceInfo *)(v16 + 16);
    v20 = self->_usedResources.__begin_;
    v19 = self->_usedResources.__end_;
    if (v19 != v20)
    {
      do
      {
        *((_OWORD *)v16 - 1) = *((_OWORD *)v19 - 1);
        v16 -= 16;
        v19 = (DYMTLUsedResourceInfo *)((char *)v19 - 16);
      }
      while (v19 != v20);
      v19 = self->_usedResources.__begin_;
    }
    self->_usedResources.__begin_ = (DYMTLUsedResourceInfo *)v16;
    self->_usedResources.__end_ = v9;
    self->_usedResources.__end_cap_.__value_ = v18;
    if (v19)
      operator delete(v19);
    v6 = v21;
  }
  else
  {
    *(_QWORD *)end = v6;
    *((_QWORD *)end + 1) = a4;
    v9 = (DYMTLUsedResourceInfo *)((char *)end + 16);
  }
  self->_usedResources.__end_ = v9;
  -[MTLComputeCommandEncoderSPI useResource:usage:](self->_computeEncoder, "useResource:usage:", v6, a4);

}

- (void)useResources:(const void *)a3 count:(unint64_t)a4 usage:(unint64_t)a5
{
  uint64_t v9;
  vector<DYMTLUsedResourceInfo, std::allocator<DYMTLUsedResourceInfo>> *p_usedResources;
  __compressed_pair<DYMTLUsedResourceInfo *, std::allocator<DYMTLUsedResourceInfo>> *p_end_cap;
  DYMTLUsedResourceInfo *end;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  unint64_t v16;
  char *v17;
  uint64_t v18;
  char *v19;
  DYMTLUsedResourceInfo *v20;
  DYMTLUsedResourceInfo *begin;
  DYMTLUsedResourceInfo *v22;

  if (a4)
  {
    v9 = 0;
    p_usedResources = &self->_usedResources;
    p_end_cap = &self->_usedResources.__end_cap_;
    end = self->_usedResources.__end_;
    do
    {
      if (end >= p_end_cap->__value_)
      {
        v13 = (end - p_usedResources->__begin_) >> 4;
        if ((unint64_t)(v13 + 1) >> 60)
          std::vector<std::pair<ShaderDebugger::Metadata::MDBase::MetadataType,unsigned long long>>::__throw_length_error[abi:ne180100]();
        v14 = p_end_cap->__value_ - p_usedResources->__begin_;
        v15 = v14 >> 3;
        if (v14 >> 3 <= (unint64_t)(v13 + 1))
          v15 = v13 + 1;
        if ((unint64_t)v14 >= 0x7FFFFFFFFFFFFFF0)
          v16 = 0xFFFFFFFFFFFFFFFLL;
        else
          v16 = v15;
        v17 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<std::pair<ShaderDebugger::Metadata::MDBase::MetadataType,unsigned long long>>>((uint64_t)&self->_usedResources.__end_cap_, v16);
        v19 = &v17[16 * v13];
        *(_QWORD *)v19 = a3[v9];
        *((_QWORD *)v19 + 1) = a5;
        begin = self->_usedResources.__begin_;
        v20 = self->_usedResources.__end_;
        v22 = (DYMTLUsedResourceInfo *)v19;
        if (v20 != begin)
        {
          do
          {
            *((_OWORD *)v22 - 1) = *((_OWORD *)v20 - 1);
            v22 = (DYMTLUsedResourceInfo *)((char *)v22 - 16);
            v20 = (DYMTLUsedResourceInfo *)((char *)v20 - 16);
          }
          while (v20 != begin);
          v20 = p_usedResources->__begin_;
        }
        end = (DYMTLUsedResourceInfo *)(v19 + 16);
        self->_usedResources.__begin_ = v22;
        self->_usedResources.__end_ = (DYMTLUsedResourceInfo *)(v19 + 16);
        self->_usedResources.__end_cap_.__value_ = (DYMTLUsedResourceInfo *)&v17[16 * v18];
        if (v20)
          operator delete(v20);
      }
      else
      {
        *(_QWORD *)end = a3[v9];
        *((_QWORD *)end + 1) = a5;
        end = (DYMTLUsedResourceInfo *)((char *)end + 16);
      }
      self->_usedResources.__end_ = end;
      ++v9;
    }
    while (v9 != a4);
  }
  -[MTLComputeCommandEncoderSPI useResources:count:usage:](self->_computeEncoder, "useResources:count:usage:", a3, a4, a5);
}

- (void)useHeap:(id)a3
{
  id v4;

  v4 = a3;
  std::vector<objc_object  {objcproto11MTLResource}* {__strong}>::push_back[abi:ne180100]((char **)&self->_usedHeaps, &v4);
  -[MTLComputeCommandEncoderSPI useHeap:](self->_computeEncoder, "useHeap:", v4);

}

- (void)useHeaps:(const void *)a3 count:(unint64_t)a4
{
  const void **v7;
  unint64_t v8;

  if (a4)
  {
    v7 = a3;
    v8 = a4;
    do
    {
      std::vector<objc_object  {objcproto11MTLResource}* {__strong}>::push_back[abi:ne180100]((char **)&self->_usedHeaps, (id *)v7++);
      --v8;
    }
    while (v8);
  }
  -[MTLComputeCommandEncoderSPI useHeaps:count:](self->_computeEncoder, "useHeaps:count:", a3, a4);
}

- (void)enumerateBuffersUsingBlock:(id)a3
{
  void (**v4)(id, DYMTLBoundBufferInfo *, unint64_t, _BYTE *);
  unint64_t v5;
  DYMTLBoundBufferInfo *i;
  void *m_bytes;
  char v8;

  v4 = (void (**)(id, DYMTLBoundBufferInfo *, unint64_t, _BYTE *))a3;
  v5 = 0;
  v8 = 0;
  for (i = self->_buffers; ; ++i)
  {
    m_bytes = i->m_bytes;
    if (!i->m_buffer)
      break;
    if (!m_bytes)
      goto LABEL_7;
LABEL_4:
    if (v5 > 0x1D)
      goto LABEL_10;
LABEL_9:
    ++v5;
  }
  if (!m_bytes)
    goto LABEL_4;
LABEL_7:
  v4[2](v4, i, v5, &v8);
  if (!v8 && v5 < 0x1E)
    goto LABEL_9;
LABEL_10:

}

- (void)enumerateTexturesUsingBlock:(id)a3
{
  void (**v4)(id, MTLTexture *, unint64_t, _BYTE *);
  unint64_t v5;
  MTLTexture **textures;
  MTLTexture *v7;
  char v8;

  v4 = (void (**)(id, MTLTexture *, unint64_t, _BYTE *))a3;
  v5 = 0;
  v8 = 0;
  textures = self->_textures;
  while (1)
  {
    v7 = textures[v5];
    if (v7)
      break;
    if (v5 > 0x7E)
      goto LABEL_8;
LABEL_7:
    ++v5;
  }
  v4[2](v4, v7, v5, &v8);
  if (!v8 && v5 < 0x7F)
    goto LABEL_7;
LABEL_8:

}

- (void)enumerateSamplersUsingBlock:(id)a3
{
  void (**v4)(id, DYMTLBoundSamplerInfo *, unint64_t, _BYTE *);
  unint64_t v5;
  DYMTLBoundSamplerInfo *i;
  BOOL v7;
  char v8;

  v4 = (void (**)(id, DYMTLBoundSamplerInfo *, unint64_t, _BYTE *))a3;
  v5 = 0;
  v8 = 0;
  for (i = self->_samplers; !i->sampler; ++i)
  {
    if (v5 > 0xE)
      goto LABEL_11;
LABEL_10:
    ++v5;
  }
  v4[2](v4, i, v5, &v8);
  if (v8)
    v7 = 1;
  else
    v7 = v5 >= 0xF;
  if (!v7)
    goto LABEL_10;
LABEL_11:

}

- (void)applyToEncoder:(id)a3 rawBytesBlock:(id)a4
{
  id v6;
  id v7;
  __end_ **begin;
  __end_cap_ **var0;
  __end_ *v10;
  DYMTLUsedResourceInfo *v11;
  DYMTLUsedResourceInfo *end;
  uint64_t v13;
  id v14;
  id v15;
  id v16;
  id v17;
  uint64_t i;
  unint64_t v19;
  void *v20;
  void *v21;
  __int128 v22;
  MTLBuffer *stageInRegionIndirectBuffer;
  _OWORD v24[3];
  _QWORD v25[4];
  id v26;
  _QWORD v27[4];
  id v28;
  _QWORD v29[4];
  id v30;
  id v31;

  v6 = a3;
  v7 = a4;
  begin = self->_usedHeaps.__begin_;
  var0 = self->_usedHeaps.var0;
  while (begin != var0)
  {
    v10 = *begin;
    objc_msgSend(v6, "useHeap:", v10);

    ++begin;
  }
  v11 = self->_usedResources.__begin_;
  end = self->_usedResources.__end_;
  while (v11 != end)
  {
    objc_msgSend(v6, "useResource:usage:", *(_QWORD *)v11, *((_QWORD *)v11 + 1));
    v11 = (DYMTLUsedResourceInfo *)((char *)v11 + 16);
  }
  v13 = MEMORY[0x24BDAC760];
  v29[0] = MEMORY[0x24BDAC760];
  v29[1] = 3221225472;
  v29[2] = __71__DYMTLComputeCommandEncoderStateTracker_applyToEncoder_rawBytesBlock___block_invoke;
  v29[3] = &unk_250D6FB28;
  v14 = v7;
  v31 = v14;
  v15 = v6;
  v30 = v15;
  -[DYMTLComputeCommandEncoderStateTracker enumerateBuffersUsingBlock:](self, "enumerateBuffersUsingBlock:", v29);
  v27[0] = v13;
  v27[1] = 3221225472;
  v27[2] = __71__DYMTLComputeCommandEncoderStateTracker_applyToEncoder_rawBytesBlock___block_invoke_2;
  v27[3] = &unk_250D6F5C0;
  v16 = v15;
  v28 = v16;
  -[DYMTLComputeCommandEncoderStateTracker enumerateTexturesUsingBlock:](self, "enumerateTexturesUsingBlock:", v27);
  v25[0] = v13;
  v25[1] = 3221225472;
  v25[2] = __71__DYMTLComputeCommandEncoderStateTracker_applyToEncoder_rawBytesBlock___block_invoke_3;
  v25[3] = &unk_250D6FB50;
  v17 = v16;
  v26 = v17;
  -[DYMTLComputeCommandEncoderStateTracker enumerateSamplersUsingBlock:](self, "enumerateSamplersUsingBlock:", v25);
  for (i = 0; i != 31; ++i)
  {
    v19 = self->_threadgroupMemories[i];
    if (v19)
      objc_msgSend(v17, "setThreadgroupMemoryLength:atIndex:", v19, i);
  }
  if (self->_computePipelineState)
    objc_msgSend(v17, "setComputePipelineState:");
  -[MTLComputeCommandEncoderSPI label](self->_computeEncoder, "label");
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  if (v20)
  {
    -[MTLComputeCommandEncoderSPI label](self->_computeEncoder, "label");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setLabel:", v21);

  }
  if (self->_hasSetStageInRegion)
  {
    v22 = *(_OWORD *)&self->_stageInRegion.origin.z;
    v24[0] = *(_OWORD *)&self->_stageInRegion.origin.x;
    v24[1] = v22;
    v24[2] = *(_OWORD *)&self->_stageInRegion.size.height;
    objc_msgSend(v17, "setStageInRegion:", v24);
  }
  stageInRegionIndirectBuffer = self->_stageInRegionIndirectBuffer;
  if (stageInRegionIndirectBuffer)
    objc_msgSend(v17, "setStageInRegionWithIndirectBuffer:indirectBufferOffset:", stageInRegionIndirectBuffer, self->_stageInRegionIndirectBufferOffset);

}

void __71__DYMTLComputeCommandEncoderStateTracker_applyToEncoder_rawBytesBlock___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  id v11;

  if (*(_QWORD *)a2 || !*(_QWORD *)(a2 + 8))
  {
    v6 = *(void **)(a1 + 32);
    v7 = *(id *)a2;
    if (*(_QWORD *)a2 && !*(_QWORD *)(a2 + 8))
      v8 = *(_QWORD *)(a2 + 16);
    else
      v8 = 0;
    v11 = v7;
    objc_msgSend(v6, "setBuffer:offset:atIndex:", v7, v8, a3);

  }
  else
  {
    v9 = (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
    if (*(_QWORD *)a2 || !*(_QWORD *)(a2 + 8))
      v10 = 0;
    else
      v10 = *(_QWORD *)(a2 + 16);
    objc_msgSend(*(id *)(a1 + 32), "setBytes:length:atIndex:", v9, v10, a3);
  }
}

uint64_t __71__DYMTLComputeCommandEncoderStateTracker_applyToEncoder_rawBytesBlock___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(a1 + 32), "setTexture:atIndex:", a2, a3);
}

uint64_t __71__DYMTLComputeCommandEncoderStateTracker_applyToEncoder_rawBytesBlock___block_invoke_3(uint64_t a1, uint64_t a2, uint64_t a3, double a4, double a5)
{
  LODWORD(a4) = *(_DWORD *)(a2 + 8);
  LODWORD(a5) = *(_DWORD *)(a2 + 12);
  return objc_msgSend(*(id *)(a1 + 32), "setSamplerState:lodMinClamp:lodMaxClamp:atIndex:", *(_QWORD *)a2, a3, a4, a5);
}

- (void).cxx_destruct
{
  uint64_t v3;
  DYMTLUsedResourceInfo *begin;
  vector<id<MTLHeap>, std::allocator<id<MTLHeap>>> *p_usedHeaps;

  v3 = 744;
  do
  {
    free(*(void **)((char *)&self->_usedResources.__end_ + v3));

    v3 -= 24;
  }
  while (v3);
  begin = self->_usedResources.__begin_;
  if (begin)
  {
    self->_usedResources.__end_ = begin;
    operator delete(begin);
  }
  p_usedHeaps = &self->_usedHeaps;
  std::vector<objc_object  {objcproto11MTLResource}* {__strong}>::__destroy_vector::operator()[abi:ne180100]((void ***)&p_usedHeaps);
  objc_storeStrong((id *)&self->_computeEncoder, 0);
}

- (id).cxx_construct
{
  bzero(&self->_usedHeaps, 0x318uLL);
  return self;
}

@end
