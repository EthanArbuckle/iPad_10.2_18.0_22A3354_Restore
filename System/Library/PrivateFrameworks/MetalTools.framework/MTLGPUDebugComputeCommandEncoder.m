@implementation MTLGPUDebugComputeCommandEncoder

- (MTLGPUDebugComputeCommandEncoder)initWithComputeCommandEncoder:(id)a3 parent:(id)a4 encoderID:(unsigned int)a5
{
  MTLGPUDebugComputeCommandEncoder *v6;
  MTLGPUDebugComputeCommandEncoder *v7;
  uint64_t v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)MTLGPUDebugComputeCommandEncoder;
  v6 = -[MTLToolsComputeCommandEncoder initWithBaseObject:parent:](&v10, sel_initWithBaseObject_parent_, a3, a4);
  v7 = v6;
  if (v6)
  {
    v8 = -[MTLToolsObject device](v6, "device");
    v7->_options = (Options *)(v8 + 264);
    v7->_dispatchID.encoderID = a5;
    v7->_dispatchID.eventID = 0;
    LOBYTE(v7->_commandBufferJumpNestingLevel) = (*(_QWORD *)(v8 + 284) & 0x200000001) != 0;
    MTLGPUDebugStageBufferHandles::clear(&v7->_handles);
    if ((*((_BYTE *)&v7->_options->var0 + 2) & 0x80) == 0)
      -[MTLGPUDebugComputeCommandEncoder _initBufferArgumentData:](v7, "_initBufferArgumentData:", v7->super.super.super._device);
  }
  return v7;
}

- (MTLGPUDebugComputeCommandEncoder)initWithComputeCommandEncoder:(id)a3 commandBuffer:(id)a4 descriptor:(id)a5 encoderID:(unsigned int)a6
{
  MTLGPUDebugComputeCommandEncoder *v7;
  MTLGPUDebugComputeCommandEncoder *v8;
  uint64_t p_deviceWrapper;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)MTLGPUDebugComputeCommandEncoder;
  v7 = -[MTLToolsComputeCommandEncoder initWithComputeCommandEncoder:parent:descriptor:](&v11, sel_initWithComputeCommandEncoder_parent_descriptor_, a3, a4, a5);
  v8 = v7;
  if (v7)
  {
    p_deviceWrapper = (uint64_t)&v7->super.super.super._device[2]._deviceWrapper;
    v7->_options = (Options *)p_deviceWrapper;
    v7->_dispatchID.encoderID = a6;
    v7->_dispatchID.eventID = 0;
    LOBYTE(v7->_commandBufferJumpNestingLevel) = (*(_QWORD *)(p_deviceWrapper + 20) & 0x200000001) != 0;
    MTLGPUDebugStageBufferHandles::clear(&v7->_handles);
    if ((*((_BYTE *)&v8->_options->var0 + 2) & 0x80) == 0)
      -[MTLGPUDebugComputeCommandEncoder _initBufferArgumentData:](v8, "_initBufferArgumentData:", v8->super.super.super._device);
  }
  return v8;
}

- (unsigned)encoderID
{
  return self->_dispatchID.encoderID;
}

- (id)temporaryBufferWithBytes:(const void *)a3 length:(unint64_t)a4
{
  return (id)-[MTLToolsObject temporaryBufferWithBytes:length:](self->super.super.super._parent, "temporaryBufferWithBytes:length:", a3, a4);
}

- (id)temporaryBufferWithLength:(unint64_t)a3
{
  return (id)-[MTLToolsObject temporaryBufferWithLength:](self->super.super.super._parent, "temporaryBufferWithLength:", a3);
}

- (void)setBufferUsageTable:(id)a3 textureUsageTable:(id)a4 textureTypeTable:(id)a5
{
  if ((*((_BYTE *)&self->_options->var0 + 2) & 1) != 0)
  {
    -[MTLToolsObject setBuffer:offset:atIndex:](self->super.super.super._baseObject, "setBuffer:offset:atIndex:", a3, 0, 5);
    -[MTLToolsObject setBuffer:offset:atIndex:](self->super.super.super._baseObject, "setBuffer:offset:atIndex:", a4, 0, 6);
    -[MTLToolsObject setBuffer:offset:atIndex:](self->super.super.super._baseObject, "setBuffer:offset:atIndex:", a5, 0, 7);
    -[MTLToolsObject useResource:usage:](self->super.super.super._baseObject, "useResource:usage:", a3, 1);
    -[MTLToolsObject useResource:usage:](self->super.super.super._baseObject, "useResource:usage:", a4, 1);
    -[MTLToolsObject useResource:usage:](self->super.super.super._baseObject, "useResource:usage:", a5, 1);
    self->_bufferUsageTable = (MTLBuffer *)a3;
    self->_textureUsageTable = (MTLBuffer *)a4;
    self->_textureTypeTable = (MTLBuffer *)a5;
  }
}

- (void)setKernelReportBuffer:(id)a3 offset:(unint64_t)a4
{
  MTLGPUDebugBufferSubAlloc *p_reportBuffer;
  id v8;
  MTLToolsObject *baseObject;
  uint64_t v10;
  uint64_t v11;

  p_reportBuffer = &self->_reportBuffer;
  v8 = a3;

  p_reportBuffer->buffer = (MTLBuffer *)a3;
  p_reportBuffer->offset = a4;
  baseObject = self->super.super.super._baseObject;
  v10 = objc_msgSend(a3, "baseObject");
  if ((*(_QWORD *)&self->_options->var0 & 0x10000) != 0)
    v11 = 2;
  else
    v11 = 32;
  -[MTLToolsObject setBuffer:offset:atIndex:](baseObject, "setBuffer:offset:atIndex:", v10, a4, v11);
}

- (void)flushBindings
{
  MTLToolsObject *baseObject;
  uint64_t v4;
  uint64_t v5;
  unsigned int v6;
  unsigned int v7;
  unint64_t v8;
  unint64_t v9;
  uint64_t v10;
  $75A86BEFE5181BCE6D1FBDE93997BD40 var0;
  uint64_t v12;
  Options *options;
  uint64_t v14;
  unsigned int v15;
  uint64_t v16;

  baseObject = self->super.super.super._baseObject;
  if ((*(_QWORD *)&self->_options->var0 & 0x10000) != 0)
    v4 = 3;
  else
    v4 = 33;
  -[MTLToolsObject setBytes:length:atIndex:](baseObject, "setBytes:length:atIndex:", &self->_dispatchID, 24, v4);
  v5 = *(_QWORD *)&self->_options->var0 & 0x7000000;
  v6 = -[MTLDebugInstrumentationData activeThreadgroupMask](-[MTLToolsComputePipelineState debugInstrumentationData](self->_currentPipeline, "debugInstrumentationData"), "activeThreadgroupMask");
  v7 = -[MTLDebugInstrumentationData threadgroupArgumentOffset](-[MTLToolsComputePipelineState debugInstrumentationData](self->_currentPipeline, "debugInstrumentationData"), "threadgroupArgumentOffset");
  if (v5 && self->_threadgroup.needsFlush)
  {
    v15 = v6;
    v8 = MTLGPUDebugThreadgroupLengths::setupTableEntries((uint64_t)&self->_threadgroup, &v15, v7);
    if (v8)
    {
      v9 = v8;
      if ((*(_QWORD *)&self->_options->var0 & 0x10000) != 0)
        v10 = 4;
      else
        v10 = 34;
      -[MTLToolsObject setBytes:length:atIndex:](self->super.super.super._baseObject, "setBytes:length:atIndex:", self->_threadgroup.entries, 256, v10);
      -[MTLToolsObject setThreadgroupMemoryLength:atIndex:](self->super.super.super._baseObject, "setThreadgroupMemoryLength:atIndex:", v9, 0);
    }
    self->_threadgroup.needsFlush = 0;
  }
  var0 = self->_options->var0;
  if ((*(_QWORD *)&var0 & 0x200000001) != 0)
  {
    -[MTLToolsRetainingContainer encodeResourceTableBuffers:type:](-[MTLToolsCommandEncoder commandBuffer](self, "commandBuffer"), "encodeResourceTableBuffers:type:", self, 1);
    var0 = self->_options->var0;
  }
  if ((*(_DWORD *)&var0 & 0x800000) != 0)
  {
    -[MTLToolsObject useResource:usage:](self->super.super.super._baseObject, "useResource:usage:", self->super.super.super._device[3].samplerObjectCache, 1);
    v14 = -[MTLDebugInstrumentationData bufferAccessMask](-[MTLToolsComputePipelineState debugInstrumentationData](self->_currentPipeline, "debugInstrumentationData"), "bufferAccessMask");
    if ((*((_BYTE *)&self->_options->var0 + 2) & 0x80) != 0)
      -[MTLToolsObject setBuffer:offset:atIndex:](self->super.super.super._baseObject, "setBuffer:offset:atIndex:", *(_QWORD *)(-[MTLToolsObject device](self, "device") + 424), 0, 21);
    if (self->_handles.needsFlush)
    {
      v16 = v14;
      MTLGPUDebugStageBufferHandles::flush<MTLGPUDebug::EncoderVariantIndirection<MTLGPUDebug::KernelEncoderClass>>((uint64_t)&self->_handles, (unint64_t *)&v16, (id *)&self->super.super.super.super.isa, 20, 23);
    }
  }
  else
  {
    v12 = -[MTLDebugInstrumentationData bufferAccessMask](-[MTLToolsComputePipelineState debugInstrumentationData](self->_currentPipeline, "debugInstrumentationData"), "bufferAccessMask");
    options = self->_options;
    if ((*(_DWORD *)&var0 & 0x10000) != 0)
    {
      if ((*((_BYTE *)&options->var0 + 2) & 0x80) != 0)
        -[MTLToolsObject setBuffer:offset:atIndex:](self->super.super.super._baseObject, "setBuffer:offset:atIndex:", *(_QWORD *)(-[MTLToolsObject device](self, "device") + 424), 0, 21);
      if (self->_handles.needsFlush)
      {
        v16 = v12;
        MTLGPUDebugStageBufferHandles::flush<MTLGPUDebug::EncoderVariantT2<MTLGPUDebug::KernelEncoderClass>>((uint64_t)&self->_handles, (unint64_t *)&v16, self, 20, 23);
      }
    }
    else
    {
      if ((*((_BYTE *)&options->var0 + 2) & 0x80) != 0)
        -[MTLToolsObject setBuffer:offset:atIndex:](self->super.super.super._baseObject, "setBuffer:offset:atIndex:", *(_QWORD *)(-[MTLToolsObject device](self, "device") + 424), 0, 21);
      if (self->_handles.needsFlush)
      {
        v16 = v12;
        MTLGPUDebugStageBufferHandles::flush<MTLGPUDebug::EncoderVariantT1AGX<MTLGPUDebug::KernelEncoderClass>>((uint64_t)&self->_handles, (unint64_t *)&v16, self);
      }
    }
  }
  ++self->_dispatchID.eventID;
}

- (void)setComputePipelineStateBuffers:(id)a3
{
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  uint64_t v10;
  uint64_t v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  if ((*((_BYTE *)&self->_options->var0 + 2) & 0x80) != 0)
  {
    if (objc_msgSend(a3, "globalConstantsBuffer"))
    {
      -[MTLToolsCommandEncoder addRetainedObject:](self, "addRetainedObject:", objc_msgSend(a3, "globalConstantsBuffer"));
      -[MTLGPUDebugComputeCommandEncoder useResource:usage:](self, "useResource:usage:", objc_msgSend(a3, "globalConstantsBuffer"), 1);
    }
    v14 = 0u;
    v15 = 0u;
    v12 = 0u;
    v13 = 0u;
    v5 = (void *)objc_msgSend(a3, "binaryFunctionData");
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v13;
      do
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v13 != v8)
            objc_enumerationMutation(v5);
          v10 = *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * i);
          if (*(_QWORD *)(v10 + 8))
          {
            -[MTLToolsCommandEncoder addRetainedObject:](self, "addRetainedObject:");
            -[MTLGPUDebugComputeCommandEncoder useResource:usage:](self, "useResource:usage:", *(_QWORD *)(v10 + 8), 1);
          }
        }
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      }
      while (v7);
    }
    v11 = objc_msgSend((id)objc_msgSend(a3, "globalConstantsBuffer"), "handleForOffset:", objc_msgSend(a3, "constantOffset"));
    -[MTLToolsObject setBytes:length:atIndex:](self->super.super.super._baseObject, "setBytes:length:atIndex:", &v11, 8, 12);
  }
  else
  {
    -[MTLToolsObject setBuffer:offset:atIndex:](self->super.super.super._baseObject, "setBuffer:offset:atIndex:", objc_msgSend(a3, "globalConstantsBuffer"), objc_msgSend(a3, "constantOffset"), 12);
  }
}

- (void)setBuffer:(id)a3 offset:(unint64_t)a4 atIndex:(unint64_t)a5
{
  -[MTLGPUDebugComputeCommandEncoder setBuffer:offset:attributeStride:atIndex:](self, "setBuffer:offset:attributeStride:atIndex:", a3, a4, -1, a5);
}

- (void)setBuffer:(id)a3 offset:(unint64_t)a4 attributeStride:(unint64_t)a5 atIndex:(unint64_t)a6
{
  MTLGPUDebugStageBufferHandles::setBuffer(&self->_handles, (MTLGPUDebugBuffer *)a3, (char *)a4, (void *)a5, a6);
  if (LOBYTE(self->_commandBufferJumpNestingLevel))
    -[MTLToolsObject markBuffer:usage:stages:](self->super.super.super._parent, "markBuffer:usage:stages:", a3, 3, 1);
  -[MTLToolsCommandEncoder addRetainedObject:](self, "addRetainedObject:", a3);
}

- (void)setBufferOffset:(unint64_t)a3 atIndex:(unint64_t)a4
{
  -[MTLGPUDebugComputeCommandEncoder setBufferOffset:attributeStride:atIndex:](self, "setBufferOffset:attributeStride:atIndex:", a3, -1, a4);
}

- (void)setBufferOffset:(unint64_t)a3 attributeStride:(unint64_t)a4 atIndex:(unint64_t)a5
{
  MTLGPUDebugStageBufferHandles::setBufferOffset(&self->_handles, a3, a4, a5);
}

- (void)setBuffers:(const void *)a3 offsets:(const unint64_t *)a4 withRange:(_NSRange)a5
{
  NSUInteger length;
  NSUInteger location;
  _QWORD *v10;
  uint64_t v11;
  void *__p[3];

  length = a5.length;
  location = a5.location;
  std::vector<unsigned long>::vector(__p, a5.length);
  v10 = __p[0];
  if (length)
  {
    v11 = 0;
    do
      v10[v11++] = -1;
    while (length > v11);
  }
  -[MTLGPUDebugComputeCommandEncoder setBuffers:offsets:attributeStrides:withRange:](self, "setBuffers:offsets:attributeStrides:withRange:", a3, a4, v10, location, length);
  if (__p[0])
  {
    __p[1] = __p[0];
    operator delete(__p[0]);
  }
}

- (void)setBuffers:(const void *)a3 offsets:(const unint64_t *)a4 attributeStrides:(const unint64_t *)a5 withRange:(_NSRange)a6
{
  NSUInteger length;
  NSUInteger location;
  uint64_t v12;
  unsigned int v13;

  if (a6.length)
  {
    length = a6.length;
    location = a6.location;
    v12 = 0;
    v13 = 1;
    do
    {
      -[MTLGPUDebugComputeCommandEncoder setBuffer:offset:attributeStride:atIndex:](self, "setBuffer:offset:attributeStride:atIndex:", a3[v12], a4[v12], a5[v12], v12 + location);
      v12 = v13;
    }
    while (length > v13++);
  }
}

- (void)setBytes:(const void *)a3 length:(unint64_t)a4 atIndex:(unint64_t)a5
{
  -[MTLGPUDebugComputeCommandEncoder setBytes:length:attributeStride:atIndex:](self, "setBytes:length:attributeStride:atIndex:", a3, a4, -1, a5);
}

- (void)setBytes:(const void *)a3 length:(unint64_t)a4 attributeStride:(unint64_t)a5 atIndex:(unint64_t)a6
{
  -[MTLGPUDebugComputeCommandEncoder setBuffer:offset:attributeStride:atIndex:](self, "setBuffer:offset:attributeStride:atIndex:", -[MTLGPUDebugComputeCommandEncoder temporaryBufferWithBytes:length:](self, "temporaryBufferWithBytes:length:", a3, a4), 0, a5, a6);
}

- (void)setAccelerationStructure:(id)a3 atBufferIndex:(unint64_t)a4
{
  MTLGPUDebugStageBufferHandles::setResource((uint64_t)&self->_handles, a3, a4);
}

- (void)setAccelerationStructures:(const void *)a3 withBufferRange:(_NSRange)a4
{
  NSUInteger length;
  NSUInteger location;
  uint64_t v8;

  if (a4.length)
  {
    length = a4.length;
    location = a4.location;
    do
    {
      v8 = (uint64_t)*a3++;
      -[MTLGPUDebugComputeCommandEncoder setAccelerationStructure:atBufferIndex:](self, "setAccelerationStructure:atBufferIndex:", v8, location++);
      --length;
    }
    while (length);
  }
}

- (void)setTexture:(id)a3 atIndex:(unint64_t)a4
{
  uint64_t v7;
  MTLToolsObject *baseObject;

  v7 = objc_msgSend(a3, "baseObject");
  baseObject = self->super.super.super._baseObject;
  if (a3)
  {
    if (LOBYTE(self->_commandBufferJumpNestingLevel))
      -[MTLToolsObject markTexture:usage:stages:](self->super.super.super._parent, "markTexture:usage:stages:", a3, 3, 1);
    -[MTLToolsCommandEncoder addRetainedObject:](self, "addRetainedObject:", a3);
  }
  -[MTLToolsObject setTexture:atIndex:](baseObject, "setTexture:atIndex:", v7, a4);
}

- (void)setTextures:(const void *)a3 withRange:(_NSRange)a4
{
  NSUInteger length;
  NSUInteger location;
  const void *v8;
  uint64_t v9;
  MTLToolsObject *baseObject;

  if (a4.length)
  {
    length = a4.length;
    location = a4.location;
    do
    {
      v8 = *a3;
      v9 = objc_msgSend((id)*a3, "baseObject");
      baseObject = self->super.super.super._baseObject;
      if (v8)
      {
        if (LOBYTE(self->_commandBufferJumpNestingLevel))
          -[MTLToolsObject markTexture:usage:stages:](self->super.super.super._parent, "markTexture:usage:stages:", v8, 3, 1);
        -[MTLToolsCommandEncoder addRetainedObject:](self, "addRetainedObject:", v8);
      }
      -[MTLToolsObject setTexture:atIndex:](baseObject, "setTexture:atIndex:", v9, location++);
      ++a3;
      --length;
    }
    while (length);
  }
}

- (void)setVisibleFunctionTable:(id)a3 atBufferIndex:(unint64_t)a4
{
  MTLGPUDebugStageBufferHandles::setResource((uint64_t)&self->_handles, a3, a4);
  if (a3)
    -[MTLToolsObject useResource:usage:](self->super.super.super._baseObject, "useResource:usage:", *((_QWORD *)a3 + 2), 1);
}

- (void)setVisibleFunctionTables:(const void *)a3 withBufferRange:(_NSRange)a4
{
  NSUInteger length;
  NSUInteger location;
  uint64_t v8;

  if (a4.length)
  {
    length = a4.length;
    location = a4.location;
    do
    {
      v8 = (uint64_t)*a3++;
      -[MTLGPUDebugComputeCommandEncoder setVisibleFunctionTable:atBufferIndex:](self, "setVisibleFunctionTable:atBufferIndex:", v8, location++);
      --length;
    }
    while (length);
  }
}

- (void)setIntersectionFunctionTable:(id)a3 atBufferIndex:(unint64_t)a4
{
  MTLGPUDebugStageBufferHandles::setResource((uint64_t)&self->_handles, a3, a4);
  if (a3)
    -[MTLToolsObject useResource:usage:](self->super.super.super._baseObject, "useResource:usage:", *((_QWORD *)a3 + 2), 1);
}

- (void)setIntersectionFunctionTables:(const void *)a3 withBufferRange:(_NSRange)a4
{
  NSUInteger length;
  NSUInteger location;
  uint64_t v8;

  if (a4.length)
  {
    length = a4.length;
    location = a4.location;
    do
    {
      v8 = (uint64_t)*a3++;
      -[MTLGPUDebugComputeCommandEncoder setIntersectionFunctionTable:atBufferIndex:](self, "setIntersectionFunctionTable:atBufferIndex:", v8, location++);
      --length;
    }
    while (length);
  }
}

- (void)dispatchThreads:(id *)a3 threadsPerThreadgroup:(id *)a4
{
  objc_super v7;
  $F99D9A4FB75BC57F3386B8DC8EE08D7A v8;
  $F99D9A4FB75BC57F3386B8DC8EE08D7A v9;

  -[MTLGPUDebugComputeCommandEncoder flushBindings](self, "flushBindings");
  v9 = *a3;
  v8 = *a4;
  v7.receiver = self;
  v7.super_class = (Class)MTLGPUDebugComputeCommandEncoder;
  -[MTLToolsComputeCommandEncoder dispatchThreads:threadsPerThreadgroup:](&v7, sel_dispatchThreads_threadsPerThreadgroup_, &v9, &v8);
}

- (void)dispatchThreadsWithIndirectBuffer:(id)a3 indirectBufferOffset:(unint64_t)a4
{
  objc_super v7;

  -[MTLGPUDebugComputeCommandEncoder flushBindings](self, "flushBindings");
  v7.receiver = self;
  v7.super_class = (Class)MTLGPUDebugComputeCommandEncoder;
  -[MTLToolsComputeCommandEncoder dispatchThreadsWithIndirectBuffer:indirectBufferOffset:](&v7, sel_dispatchThreadsWithIndirectBuffer_indirectBufferOffset_, a3, a4);
}

- (void)dispatchThreadgroups:(id *)a3 threadsPerThreadgroup:(id *)a4
{
  objc_super v7;
  $F99D9A4FB75BC57F3386B8DC8EE08D7A v8;
  $F99D9A4FB75BC57F3386B8DC8EE08D7A v9;

  -[MTLGPUDebugComputeCommandEncoder flushBindings](self, "flushBindings");
  v9 = *a3;
  v8 = *a4;
  v7.receiver = self;
  v7.super_class = (Class)MTLGPUDebugComputeCommandEncoder;
  -[MTLToolsComputeCommandEncoder dispatchThreadgroups:threadsPerThreadgroup:](&v7, sel_dispatchThreadgroups_threadsPerThreadgroup_, &v9, &v8);
}

- (void)dispatchThreadgroupsWithIndirectBuffer:(id)a3 indirectBufferOffset:(unint64_t)a4 threadsPerThreadgroup:(id *)a5
{
  objc_super v9;
  $F99D9A4FB75BC57F3386B8DC8EE08D7A v10;

  -[MTLGPUDebugComputeCommandEncoder flushBindings](self, "flushBindings");
  v10 = *a5;
  v9.receiver = self;
  v9.super_class = (Class)MTLGPUDebugComputeCommandEncoder;
  -[MTLToolsComputeCommandEncoder dispatchThreadgroupsWithIndirectBuffer:indirectBufferOffset:threadsPerThreadgroup:](&v9, sel_dispatchThreadgroupsWithIndirectBuffer_indirectBufferOffset_threadsPerThreadgroup_, a3, a4, &v10);
}

- (void)setThreadgroupMemoryLength:(unint64_t)a3 atIndex:(unint64_t)a4
{
  objc_super v4;

  if ((*((_BYTE *)&self->_options->var0 + 3) & 7) != 0)
  {
    MTLGPUDebugThreadgroupLengths::setThreadgroupMemoryLength(&self->_threadgroup, a3, a4);
  }
  else
  {
    v4.receiver = self;
    v4.super_class = (Class)MTLGPUDebugComputeCommandEncoder;
    -[MTLToolsComputeCommandEncoder setThreadgroupMemoryLength:atIndex:](&v4, sel_setThreadgroupMemoryLength_atIndex_, a3, a4);
  }
}

- (void)useResourceInternal:(id)a3 usage:(unint64_t)a4
{
  -[MTLToolsObject useResource:usage:](self->super.super.super._baseObject, "useResource:usage:", a3, a4);
}

- (void)useResource:(id)a3 usage:(unint64_t)a4
{
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)MTLGPUDebugComputeCommandEncoder;
  -[MTLToolsComputeCommandEncoder useResource:usage:](&v7, sel_useResource_usage_);
  if (LOBYTE(self->_commandBufferJumpNestingLevel))
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      -[MTLToolsObject markBuffer:usage:stages:](self->super.super.super._parent, "markBuffer:usage:stages:", a3, a4, 1);
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        -[MTLToolsObject markTexture:usage:stages:](self->super.super.super._parent, "markTexture:usage:stages:", a3, a4, 1);
    }
  }
  objc_msgSend(a3, "useWithComputeEncoder:usage:", self, a4);
}

- (void)useResources:(const void *)a3 count:(unint64_t)a4 usage:(unint64_t)a5
{
  unint64_t v6;
  uint64_t v9;

  if (a4)
  {
    v6 = a4;
    do
    {
      v9 = (uint64_t)*a3++;
      -[MTLGPUDebugComputeCommandEncoder useResource:usage:](self, "useResource:usage:", v9, a5);
      --v6;
    }
    while (v6);
  }
}

- (void)useHeap:(id)a3
{
  objc_super v5;

  if (LOBYTE(self->_commandBufferJumpNestingLevel))
    -[MTLToolsObject markHeap:stages:](self->super.super.super._parent, "markHeap:stages:", a3, 1);
  v5.receiver = self;
  v5.super_class = (Class)MTLGPUDebugComputeCommandEncoder;
  -[MTLToolsComputeCommandEncoder useHeap:](&v5, sel_useHeap_, a3);
}

- (void)useHeaps:(const void *)a3 count:(unint64_t)a4
{
  unint64_t v4;
  uint64_t v7;

  if (a4)
  {
    v4 = a4;
    do
    {
      v7 = (uint64_t)*a3++;
      -[MTLGPUDebugComputeCommandEncoder useHeap:](self, "useHeap:", v7);
      --v4;
    }
    while (v4);
  }
}

- (void)useResidencySet:(id)a3
{
  objc_super v5;

  if ((*(_QWORD *)&self->_options->var0 & 0x200000001) != 0)
    -[MTLToolsRetainingContainer addResidencySetGPUDebug:fromEncoder:](-[MTLToolsCommandEncoder commandBuffer](self, "commandBuffer"), "addResidencySetGPUDebug:fromEncoder:", a3, self);
  v5.receiver = self;
  v5.super_class = (Class)MTLGPUDebugComputeCommandEncoder;
  -[MTLToolsComputeCommandEncoder useResidencySet:](&v5, sel_useResidencySet_, a3);
}

- (void)useResidencySets:(const void *)a3 count:(unint64_t)a4
{
  const void **v8;
  unint64_t v9;
  uint64_t v10;
  objc_super v11;

  if ((*(_QWORD *)&self->_options->var0 & 0x200000001) != 0 && a4 != 0)
  {
    v8 = a3;
    v9 = a4;
    do
    {
      v10 = (uint64_t)*v8++;
      -[MTLToolsRetainingContainer addResidencySetGPUDebug:fromEncoder:](-[MTLToolsCommandEncoder commandBuffer](self, "commandBuffer"), "addResidencySetGPUDebug:fromEncoder:", v10, self);
      --v9;
    }
    while (v9);
  }
  v11.receiver = self;
  v11.super_class = (Class)MTLGPUDebugComputeCommandEncoder;
  -[MTLToolsComputeCommandEncoder useResidencySets:count:](&v11, sel_useResidencySets_count_, a3, a4);
}

- (void)setComputePipelineState:(id)a3
{
  Options *options;
  objc_super v6;

  self->_dispatchID.pipelineStateID = (unint64_t)a3;
  self->_dispatchID.entryPointImageID = objc_msgSend(a3, "kernelFunctionData");
  if (self->_currentPipeline == a3)
  {
    options = self->_options;
  }
  else
  {
    self->_threadgroup.needsFlush = 1;
    options = self->_options;
    if ((*((_BYTE *)&options->var0 + 2) & 0x81) == 0)
      self->_handles.needsFlush = 1;
  }
  if ((*((_BYTE *)&options->var0 + 2) & 0x40) != 0)
    -[MTLGPUDebugComputeCommandEncoder setComputePipelineStateBuffers:](self, "setComputePipelineStateBuffers:", a3);
  self->_currentPipeline = (MTLGPUDebugComputePipelineState *)a3;
  v6.receiver = self;
  v6.super_class = (Class)MTLGPUDebugComputeCommandEncoder;
  -[MTLToolsComputeCommandEncoder setComputePipelineState:](&v6, sel_setComputePipelineState_, a3);
}

- (void)endEncoding
{
  objc_super v3;

  -[MTLToolsRetainingContainer endingEncoder:type:](-[MTLToolsCommandEncoder commandBuffer](self, "commandBuffer"), "endingEncoder:type:", self, 1);
  MTLGPUDebugStageBufferHandles::clear(&self->_handles);

  self->_reportBuffer.buffer = 0;
  self->_reportBuffer.offset = 0;
  v3.receiver = self;
  v3.super_class = (Class)MTLGPUDebugComputeCommandEncoder;
  -[MTLToolsCommandEncoder endEncoding](&v3, sel_endEncoding);
}

- (void)executeCommandsInBuffer:(id)a3 withRange:(_NSRange)a4
{
  NSUInteger length;
  NSUInteger location;
  objc_super v8;
  unint64_t v9;
  int v10;

  length = a4.length;
  location = a4.location;
  v9 = LODWORD(a4.location) | ((unint64_t)LODWORD(a4.length) << 32);
  v10 = 1;
  PrepareExecuteIndirect(self, a3, (uint64_t)&v9);
  v8.receiver = self;
  v8.super_class = (Class)MTLGPUDebugComputeCommandEncoder;
  -[MTLToolsComputeCommandEncoder executeCommandsInBuffer:withRange:](&v8, sel_executeCommandsInBuffer_withRange_, a3, location, length);
  RestoreInternalState(self);
}

- (void)executeCommandsInBuffer:(id)a3 indirectBuffer:(id)a4 indirectBufferOffset:(unint64_t)a5
{
  objc_super v9;
  _QWORD v10[2];
  int v11;

  v10[0] = a4;
  v10[1] = a5;
  v11 = 0;
  PrepareExecuteIndirect(self, a3, (uint64_t)v10);
  v9.receiver = self;
  v9.super_class = (Class)MTLGPUDebugComputeCommandEncoder;
  -[MTLToolsComputeCommandEncoder executeCommandsInBuffer:indirectBuffer:indirectBufferOffset:](&v9, sel_executeCommandsInBuffer_indirectBuffer_indirectBufferOffset_, a3, a4, a5);
  RestoreInternalState(self);
}

- (void)encodeStartDoWhile
{
  int v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)MTLGPUDebugComputeCommandEncoder;
  -[MTLToolsComputeCommandEncoder encodeStartDoWhile](&v4, sel_encodeStartDoWhile);
  v3 = *(&self->_commandBufferJumpNestingLevel + 1);
  if (!v3)
  {
    RestoreInternalState(self);
    v3 = *(&self->_commandBufferJumpNestingLevel + 1);
  }
  *(&self->_commandBufferJumpNestingLevel + 1) = v3 + 1;
}

- (BOOL)encodeEndDoWhile:(id)a3 offset:(unint64_t)a4 comparison:(unint64_t)a5 referenceValue:(unsigned int)a6
{
  objc_super v7;

  --*(&self->_commandBufferJumpNestingLevel + 1);
  v7.receiver = self;
  v7.super_class = (Class)MTLGPUDebugComputeCommandEncoder;
  return -[MTLToolsComputeCommandEncoder encodeEndDoWhile:offset:comparison:referenceValue:](&v7, sel_encodeEndDoWhile_offset_comparison_referenceValue_, a3, a4, a5, *(_QWORD *)&a6);
}

- (void)encodeStartIf:(id)a3 offset:(unint64_t)a4 comparison:(unint64_t)a5 referenceValue:(unsigned int)a6
{
  int v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)MTLGPUDebugComputeCommandEncoder;
  -[MTLToolsComputeCommandEncoder encodeStartIf:offset:comparison:referenceValue:](&v8, sel_encodeStartIf_offset_comparison_referenceValue_, a3, a4, a5, *(_QWORD *)&a6);
  v7 = *(&self->_commandBufferJumpNestingLevel + 1);
  if (!v7)
  {
    RestoreInternalState(self);
    v7 = *(&self->_commandBufferJumpNestingLevel + 1);
  }
  *(&self->_commandBufferJumpNestingLevel + 1) = v7 + 1;
}

- (BOOL)encodeEndIf
{
  objc_super v3;

  --*(&self->_commandBufferJumpNestingLevel + 1);
  v3.receiver = self;
  v3.super_class = (Class)MTLGPUDebugComputeCommandEncoder;
  return -[MTLToolsComputeCommandEncoder encodeEndIf](&v3, sel_encodeEndIf);
}

- (void)encodeStartWhile:(id)a3 offset:(unint64_t)a4 comparison:(unint64_t)a5 referenceValue:(unsigned int)a6
{
  int v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)MTLGPUDebugComputeCommandEncoder;
  -[MTLToolsComputeCommandEncoder encodeStartWhile:offset:comparison:referenceValue:](&v8, sel_encodeStartWhile_offset_comparison_referenceValue_, a3, a4, a5, *(_QWORD *)&a6);
  v7 = *(&self->_commandBufferJumpNestingLevel + 1);
  if (!v7)
  {
    RestoreInternalState(self);
    v7 = *(&self->_commandBufferJumpNestingLevel + 1);
  }
  *(&self->_commandBufferJumpNestingLevel + 1) = v7 + 1;
}

- (BOOL)encodeEndWhile
{
  objc_super v3;

  --*(&self->_commandBufferJumpNestingLevel + 1);
  v3.receiver = self;
  v3.super_class = (Class)MTLGPUDebugComputeCommandEncoder;
  return -[MTLToolsComputeCommandEncoder encodeEndWhile](&v3, sel_encodeEndWhile);
}

- (void)beginVirtualSubstream
{
  objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "beginVirtualSubstream");
}

- (unint64_t)nextVirtualSubstream
{
  return objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "nextVirtualSubstream");
}

- (void)endVirtualSubstream
{
  objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "endVirtualSubstream");
}

- (void)waitForVirtualSubstream:(unint64_t)a3
{
  objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "waitForVirtualSubstream:", a3);
}

- (id).cxx_construct
{
  *((_BYTE *)self + 1688) = 0;
  *((_BYTE *)self + 2076) = 0;
  *((_QWORD *)self + 264) = 0;
  return self;
}

@end
