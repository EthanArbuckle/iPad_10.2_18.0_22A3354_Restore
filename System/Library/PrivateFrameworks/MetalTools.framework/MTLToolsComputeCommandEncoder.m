@implementation MTLToolsComputeCommandEncoder

- (MTLToolsComputeCommandEncoder)initWithBaseObject:(id)a3 parent:(id)a4
{
  return -[MTLToolsComputeCommandEncoder initWithComputeCommandEncoder:parent:descriptor:](self, "initWithComputeCommandEncoder:parent:descriptor:", a3, a4, 0);
}

- (MTLToolsComputeCommandEncoder)initWithComputeCommandEncoder:(id)a3 parent:(id)a4 descriptor:(id)a5
{
  MTLToolsComputeCommandEncoder *v7;
  MTLToolsComputeCommandEncoder *v8;
  uint64_t i;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)MTLToolsComputeCommandEncoder;
  v7 = -[MTLToolsCommandEncoder initWithBaseObject:parent:](&v11, sel_initWithBaseObject_parent_, a3);
  v8 = v7;
  if (a5 && v7)
  {
    for (i = 0; i != 4; ++i)
      objc_msgSend(a4, "addRetainedObject:", objc_msgSend((id)objc_msgSend((id)objc_msgSend(a5, "sampleBufferAttachments"), "objectAtIndexedSubscript:", i), "sampleBuffer"));
  }
  return v8;
}

- (void)setComputePipelineState:(id)a3
{
  -[MTLToolsCommandEncoder addRetainedObject:](self, "addRetainedObject:");
  objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "setComputePipelineState:", objc_msgSend(a3, "baseObject"));
}

- (void)setBytes:(const void *)a3 length:(unint64_t)a4 atIndex:(unint64_t)a5
{
  objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "setBytes:length:atIndex:", a3, a4, a5);
}

- (void)setBufferOffset:(unint64_t)a3 atIndex:(unint64_t)a4
{
  objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "setBufferOffset:atIndex:", a3, a4);
}

- (void)setBuffer:(id)a3 offset:(unint64_t)a4 atIndex:(unint64_t)a5
{
  -[MTLToolsCommandEncoder addRetainedObject:](self, "addRetainedObject:");
  objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "setBuffer:offset:atIndex:", objc_msgSend(a3, "baseObject"), a4, a5);
}

- (void)setBuffers:(const void *)a3 offsets:(const unint64_t *)a4 withRange:(_NSRange)a5
{
  NSUInteger length;
  NSUInteger location;
  const void **v9;
  _QWORD *v10;
  NSUInteger v11;
  void *v12;
  _QWORD v13[32];

  length = a5.length;
  location = a5.location;
  v13[31] = *MEMORY[0x24BDAC8D0];
  if (a5.length)
  {
    v9 = a3;
    v10 = v13;
    v11 = a5.length;
    do
    {
      -[MTLToolsCommandEncoder addRetainedObject:](self, "addRetainedObject:", *v9);
      v12 = (void *)*v9++;
      *v10++ = objc_msgSend(v12, "baseObject");
      --v11;
    }
    while (v11);
  }
  objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject", a3), "setBuffers:offsets:withRange:", v13, a4, location, length);
}

- (void)setBuffer:(id)a3 offset:(unint64_t)a4 attributeStride:(unint64_t)a5 atIndex:(unint64_t)a6
{
  -[MTLToolsCommandEncoder addRetainedObject:](self, "addRetainedObject:");
  objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "setBuffer:offset:attributeStride:atIndex:", objc_msgSend(a3, "baseObject"), a4, a5, a6);
}

- (void)setBuffers:(const void *)a3 offsets:(const unint64_t *)a4 attributeStrides:(const unint64_t *)a5 withRange:(_NSRange)a6
{
  NSUInteger length;
  NSUInteger location;
  const void **v11;
  _QWORD *v12;
  NSUInteger v13;
  void *v14;
  _QWORD v15[32];

  length = a6.length;
  location = a6.location;
  v15[31] = *MEMORY[0x24BDAC8D0];
  if (a6.length)
  {
    v11 = a3;
    v12 = v15;
    v13 = a6.length;
    do
    {
      -[MTLToolsCommandEncoder addRetainedObject:](self, "addRetainedObject:", *v11);
      v14 = (void *)*v11++;
      *v12++ = objc_msgSend(v14, "baseObject");
      --v13;
    }
    while (v13);
  }
  objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject", a3), "setBuffers:offsets:attributeStrides:withRange:", v15, a4, a5, location, length);
}

- (void)setBufferOffset:(unint64_t)a3 attributeStride:(unint64_t)a4 atIndex:(unint64_t)a5
{
  objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "setBufferOffset:attributeStride:atIndex:", a3, a4, a5);
}

- (void)setBytes:(const void *)a3 length:(unint64_t)a4 attributeStride:(unint64_t)a5 atIndex:(unint64_t)a6
{
  objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "setBytes:length:attributeStride:atIndex:", a3, a4, a5, a6);
}

- (void)setTexture:(id)a3 atIndex:(unint64_t)a4
{
  -[MTLToolsCommandEncoder addRetainedObject:](self, "addRetainedObject:");
  objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "setTexture:atIndex:", objc_msgSend(a3, "baseObject"), a4);
}

- (void)setTextures:(const void *)a3 withRange:(_NSRange)a4
{
  NSUInteger length;
  NSUInteger location;
  const void **v7;
  _QWORD *v8;
  NSUInteger v9;
  void *v10;
  _BYTE v11[1024];
  uint64_t v12;

  length = a4.length;
  location = a4.location;
  v12 = *MEMORY[0x24BDAC8D0];
  if (a4.length)
  {
    v7 = a3;
    v8 = v11;
    v9 = a4.length;
    do
    {
      -[MTLToolsCommandEncoder addRetainedObject:](self, "addRetainedObject:", *v7);
      v10 = (void *)*v7++;
      *v8++ = objc_msgSend(v10, "baseObject");
      --v9;
    }
    while (v9);
  }
  objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject", a3), "setTextures:withRange:", v11, location, length);
}

- (void)setSamplerState:(id)a3 atIndex:(unint64_t)a4
{
  -[MTLToolsCommandEncoder addRetainedObject:](self, "addRetainedObject:");
  objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "setSamplerState:atIndex:", objc_msgSend(a3, "baseObject"), a4);
}

- (void)setSamplerStates:(const void *)a3 withRange:(_NSRange)a4
{
  NSUInteger length;
  NSUInteger location;
  const void **v7;
  _QWORD *v8;
  NSUInteger v9;
  void *v10;
  _BYTE v11[128];
  uint64_t v12;

  length = a4.length;
  location = a4.location;
  v12 = *MEMORY[0x24BDAC8D0];
  if (a4.length)
  {
    v7 = a3;
    v8 = v11;
    v9 = a4.length;
    do
    {
      -[MTLToolsCommandEncoder addRetainedObject:](self, "addRetainedObject:", *v7);
      v10 = (void *)*v7++;
      *v8++ = objc_msgSend(v10, "baseObject");
      --v9;
    }
    while (v9);
  }
  objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject", a3), "setSamplerStates:withRange:", v11, location, length);
}

- (void)setSamplerState:(id)a3 lodMinClamp:(float)a4 lodMaxClamp:(float)a5 atIndex:(unint64_t)a6
{
  id v11;
  uint64_t v12;
  double v13;
  double v14;

  -[MTLToolsCommandEncoder addRetainedObject:](self, "addRetainedObject:");
  v11 = -[MTLToolsObject baseObject](self, "baseObject");
  v12 = objc_msgSend(a3, "baseObject");
  *(float *)&v13 = a4;
  *(float *)&v14 = a5;
  objc_msgSend(v11, "setSamplerState:lodMinClamp:lodMaxClamp:atIndex:", v12, a6, v13, v14);
}

- (void)setSamplerStates:(const void *)a3 lodMinClamps:(const float *)a4 lodMaxClamps:(const float *)a5 withRange:(_NSRange)a6
{
  NSUInteger length;
  NSUInteger location;
  const void **v11;
  _QWORD *v12;
  NSUInteger v13;
  void *v14;
  _BYTE v15[128];
  uint64_t v16;

  length = a6.length;
  location = a6.location;
  v16 = *MEMORY[0x24BDAC8D0];
  if (a6.length)
  {
    v11 = a3;
    v12 = v15;
    v13 = a6.length;
    do
    {
      -[MTLToolsCommandEncoder addRetainedObject:](self, "addRetainedObject:", *v11);
      v14 = (void *)*v11++;
      *v12++ = objc_msgSend(v14, "baseObject");
      --v13;
    }
    while (v13);
  }
  objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject", a3), "setSamplerStates:lodMinClamps:lodMaxClamps:withRange:", v15, a4, a5, location, length);
}

- (void)setThreadgroupMemoryLength:(unint64_t)a3 atIndex:(unint64_t)a4
{
  objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "setThreadgroupMemoryLength:atIndex:", a3, a4);
}

- (void)dispatchThreadgroups:(id *)a3 threadsPerThreadgroup:(id *)a4
{
  id v6;
  $F99D9A4FB75BC57F3386B8DC8EE08D7A v7;
  $F99D9A4FB75BC57F3386B8DC8EE08D7A v8;

  v6 = -[MTLToolsObject baseObject](self, "baseObject");
  v8 = *a3;
  v7 = *a4;
  objc_msgSend(v6, "dispatchThreadgroups:threadsPerThreadgroup:", &v8, &v7);
}

- (void)setStageInRegion:(id *)a3
{
  id v4;
  __int128 v5;
  _OWORD v6[3];

  v4 = -[MTLToolsObject baseObject](self, "baseObject");
  v5 = *(_OWORD *)&a3->var0.var2;
  v6[0] = *(_OWORD *)&a3->var0.var0;
  v6[1] = v5;
  v6[2] = *(_OWORD *)&a3->var1.var1;
  objc_msgSend(v4, "setStageInRegion:", v6);
}

- (void)setStageInRegionWithIndirectBuffer:(id)a3 indirectBufferOffset:(unint64_t)a4
{
  -[MTLToolsCommandEncoder addRetainedObject:](self, "addRetainedObject:");
  objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "setStageInRegionWithIndirectBuffer:indirectBufferOffset:", objc_msgSend(a3, "baseObject"), a4);
}

- (void)setImageblockWidth:(unint64_t)a3 height:(unint64_t)a4
{
  objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "setImageblockWidth:height:", a3, a4);
}

- (void)dispatchThreadgroupsWithIndirectBuffer:(id)a3 indirectBufferOffset:(unint64_t)a4 threadsPerThreadgroup:(id *)a5
{
  id v9;
  uint64_t v10;
  $F99D9A4FB75BC57F3386B8DC8EE08D7A v11;

  -[MTLToolsCommandEncoder addRetainedObject:](self, "addRetainedObject:");
  v9 = -[MTLToolsObject baseObject](self, "baseObject");
  v10 = objc_msgSend(a3, "baseObject");
  v11 = *a5;
  objc_msgSend(v9, "dispatchThreadgroupsWithIndirectBuffer:indirectBufferOffset:threadsPerThreadgroup:", v10, a4, &v11);
}

- (void)dispatchThreads:(id *)a3 threadsPerThreadgroup:(id *)a4
{
  id v6;
  $F99D9A4FB75BC57F3386B8DC8EE08D7A v7;
  $F99D9A4FB75BC57F3386B8DC8EE08D7A v8;

  v6 = -[MTLToolsObject baseObject](self, "baseObject");
  v8 = *a3;
  v7 = *a4;
  objc_msgSend(v6, "dispatchThreads:threadsPerThreadgroup:", &v8, &v7);
}

- (void)dispatchThreadsWithIndirectBuffer:(id)a3 indirectBufferOffset:(unint64_t)a4
{
  -[MTLToolsCommandEncoder addRetainedObject:](self, "addRetainedObject:");
  objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "dispatchThreadsWithIndirectBuffer:indirectBufferOffset:", objc_msgSend(a3, "baseObject"), a4);
}

- (id)newKernelDebugInfo
{
  return (id)objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "newKernelDebugInfo");
}

- (void)updateFence:(id)a3
{
  -[MTLToolsCommandEncoder addRetainedObject:](self, "addRetainedObject:");
  objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "updateFence:", objc_msgSend(a3, "baseObject"));
}

- (void)waitForFence:(id)a3
{
  -[MTLToolsCommandEncoder addRetainedObject:](self, "addRetainedObject:");
  objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "waitForFence:", objc_msgSend(a3, "baseObject"));
}

- (void)useResource:(id)a3 usage:(unint64_t)a4
{
  -[MTLToolsCommandEncoder addRetainedObject:](self, "addRetainedObject:");
  objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "useResource:usage:", objc_msgSend(a3, "baseObject"), a4);
}

- (void)useResources:(const void *)a3 count:(unint64_t)a4 usage:(unint64_t)a5
{
  uint64_t v9;
  uint64_t v10;
  id v11;
  void *__p[3];

  std::vector<objc_object  {objcproto11MTLResource}*>::vector(__p, a4);
  if (a4)
  {
    v9 = 0;
    do
    {
      -[MTLToolsCommandEncoder addRetainedObject:](self, "addRetainedObject:", a3[v9]);
      v10 = objc_msgSend((id)a3[v9], "baseObject");
      *((_QWORD *)__p[0] + v9++) = v10;
    }
    while (a4 != v9);
  }
  v11 = -[MTLToolsObject baseObject](self, "baseObject");
  objc_msgSend(v11, "useResources:count:usage:", __p[0], a4, a5);
  if (__p[0])
  {
    __p[1] = __p[0];
    operator delete(__p[0]);
  }
}

- (void)useHeap:(id)a3
{
  -[MTLToolsCommandEncoder addRetainedObject:](self, "addRetainedObject:");
  objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "useHeap:", objc_msgSend(a3, "baseObject"));
}

- (void)useHeaps:(const void *)a3 count:(unint64_t)a4
{
  uint64_t v7;
  uint64_t v8;
  id v9;
  void *__p[3];

  std::vector<objc_object  {objcproto7MTLHeap}*>::vector(__p, a4);
  if (a4)
  {
    v7 = 0;
    do
    {
      -[MTLToolsCommandEncoder addRetainedObject:](self, "addRetainedObject:", a3[v7]);
      v8 = objc_msgSend((id)a3[v7], "baseObject");
      *((_QWORD *)__p[0] + v7++) = v8;
    }
    while (a4 != v7);
  }
  v9 = -[MTLToolsObject baseObject](self, "baseObject");
  objc_msgSend(v9, "useHeaps:count:", __p[0], a4);
  if (__p[0])
  {
    __p[1] = __p[0];
    operator delete(__p[0]);
  }
}

- (void)executeCommandsInBuffer:(id)a3 withRange:(_NSRange)a4
{
  NSUInteger length;
  NSUInteger location;

  length = a4.length;
  location = a4.location;
  -[MTLToolsCommandEncoder addRetainedObject:](self, "addRetainedObject:");
  objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "executeCommandsInBuffer:withRange:", objc_msgSend(a3, "baseObject"), location, length);
}

- (void)executeCommandsInBuffer:(id)a3 indirectBuffer:(id)a4 indirectBufferOffset:(unint64_t)a5
{
  -[MTLToolsCommandEncoder addRetainedObject:](self, "addRetainedObject:");
  objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "executeCommandsInBuffer:indirectBuffer:indirectBufferOffset:", objc_msgSend(a3, "baseObject"), objc_msgSend(a4, "baseObject"), a5);
}

- (unint64_t)dispatchType
{
  return objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "dispatchType");
}

- (void)memoryBarrierWithScope:(unint64_t)a3
{
  objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "memoryBarrierWithScope:", a3);
}

- (void)memoryBarrierWithResources:(const void *)a3 count:(unint64_t)a4
{
  uint64_t v7;
  uint64_t v8;
  id v9;
  void *__p[3];

  std::vector<objc_object  {objcproto11MTLResource}*>::vector(__p, a4);
  if (a4)
  {
    v7 = 0;
    do
    {
      v8 = objc_msgSend((id)a3[v7], "baseObject");
      *((_QWORD *)__p[0] + v7++) = v8;
    }
    while (a4 != v7);
  }
  v9 = -[MTLToolsObject baseObject](self, "baseObject");
  objc_msgSend(v9, "memoryBarrierWithResources:count:", __p[0], a4);
  if (__p[0])
  {
    __p[1] = __p[0];
    operator delete(__p[0]);
  }
}

- (void)sampleCountersInBuffer:(id)a3 atSampleIndex:(unint64_t)a4 withBarrier:(BOOL)a5
{
  _BOOL8 v5;

  v5 = a5;
  -[MTLToolsCommandEncoder addRetainedObject:](self, "addRetainedObject:");
  objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "sampleCountersInBuffer:atSampleIndex:withBarrier:", objc_msgSend(a3, "baseObject"), a4, v5);
}

- (void)enableNullBufferBinds:(BOOL)a3
{
  _BOOL8 v3;

  v3 = a3;
  -[MTLToolsObject baseObject](self, "baseObject");
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "enableNullBufferBinds:", v3);
}

- (void)setVisibleFunctionTable:(id)a3 atBufferIndex:(unint64_t)a4
{
  objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "setVisibleFunctionTable:atBufferIndex:", objc_msgSend(a3, "baseObject"), a4);
}

- (void)setVisibleFunctionTables:(const void *)a3 withBufferRange:(_NSRange)a4
{
  NSUInteger length;
  NSUInteger location;
  uint64_t i;
  uint64_t v9;
  id v10;
  void *__p[3];

  length = a4.length;
  location = a4.location;
  std::vector<objc_object  {objcproto23MTLVisibleFunctionTable}*>::vector(__p, a4.length);
  if (length)
  {
    for (i = 0; i != length; ++i)
    {
      v9 = objc_msgSend((id)a3[i], "baseObject");
      *((_QWORD *)__p[0] + i) = v9;
    }
  }
  v10 = -[MTLToolsObject baseObject](self, "baseObject");
  objc_msgSend(v10, "setVisibleFunctionTables:withBufferRange:", __p[0], location, length);
  if (__p[0])
  {
    __p[1] = __p[0];
    operator delete(__p[0]);
  }
}

- (void)setIntersectionFunctionTable:(id)a3 atBufferIndex:(unint64_t)a4
{
  objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "setIntersectionFunctionTable:atBufferIndex:", objc_msgSend(a3, "baseObject"), a4);
}

- (void)setIntersectionFunctionTables:(const void *)a3 withBufferRange:(_NSRange)a4
{
  NSUInteger length;
  NSUInteger location;
  uint64_t i;
  uint64_t v9;
  id v10;
  void *__p[3];

  length = a4.length;
  location = a4.location;
  std::vector<objc_object  {objcproto28MTLIntersectionFunctionTable}*>::vector(__p, a4.length);
  if (length)
  {
    for (i = 0; i != length; ++i)
    {
      v9 = objc_msgSend((id)a3[i], "baseObject");
      *((_QWORD *)__p[0] + i) = v9;
    }
  }
  v10 = -[MTLToolsObject baseObject](self, "baseObject");
  objc_msgSend(v10, "setIntersectionFunctionTables:withBufferRange:", __p[0], location, length);
  if (__p[0])
  {
    __p[1] = __p[0];
    operator delete(__p[0]);
  }
}

- (void)setAccelerationStructure:(id)a3 atBufferIndex:(unint64_t)a4
{
  objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "setAccelerationStructure:atBufferIndex:", objc_msgSend(a3, "baseObject"), a4);
}

- (void)useResourceGroup:(id)a3 usage:(unint64_t)a4
{
  objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "useResourceGroup:usage:", a3, a4);
}

- (void)insertCompressedTextureReinterpretationFlush
{
  objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "insertCompressedTextureReinterpretationFlush");
}

- (void)encodeStartDoWhile
{
  objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "encodeStartDoWhile");
}

- (BOOL)encodeEndDoWhile:(id)a3 offset:(unint64_t)a4 comparison:(unint64_t)a5 referenceValue:(unsigned int)a6
{
  uint64_t v6;

  v6 = *(_QWORD *)&a6;
  -[MTLToolsCommandEncoder addRetainedObject:](self, "addRetainedObject:");
  return objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "encodeEndDoWhile:offset:comparison:referenceValue:", objc_msgSend(a3, "baseObject"), a4, a5, v6);
}

- (void)encodeStartWhile:(id)a3 offset:(unint64_t)a4 comparison:(unint64_t)a5 referenceValue:(unsigned int)a6
{
  uint64_t v6;

  v6 = *(_QWORD *)&a6;
  -[MTLToolsCommandEncoder addRetainedObject:](self, "addRetainedObject:");
  objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "encodeStartWhile:offset:comparison:referenceValue:", objc_msgSend(a3, "baseObject"), a4, a5, v6);
}

- (BOOL)encodeEndWhile
{
  return objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "encodeEndWhile");
}

- (void)encodeStartIf:(id)a3 offset:(unint64_t)a4 comparison:(unint64_t)a5 referenceValue:(unsigned int)a6
{
  uint64_t v6;

  v6 = *(_QWORD *)&a6;
  -[MTLToolsCommandEncoder addRetainedObject:](self, "addRetainedObject:");
  objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "encodeStartIf:offset:comparison:referenceValue:", objc_msgSend(a3, "baseObject"), a4, a5, v6);
}

- (void)encodeStartElse
{
  objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "encodeStartElse");
}

- (BOOL)encodeEndIf
{
  return objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "encodeEndIf");
}

- (id)endEncodingAndRetrieveProgramAddressTable
{
  return (id)objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "endEncodingAndRetrieveProgramAddressTable");
}

- (void)setSubstream:(unsigned int)a3
{
  objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "setSubstream:", *(_QWORD *)&a3);
}

- (void)signalProgress:(unsigned int)a3
{
  objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "signalProgress:", *(_QWORD *)&a3);
}

- (void)waitForProgress:(unsigned int)a3
{
  objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "waitForProgress:", *(_QWORD *)&a3);
}

- (void)setThreadgroupPackingDisabled:(BOOL)a3
{
  objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "setThreadgroupPackingDisabled:", a3);
}

- (void)setThreadgroupDistributionMode:(int64_t)a3
{
  objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "setThreadgroupDistributionMode:", a3);
}

- (void)setThreadgroupDistributionModeWithClusterGroupIndex:(unsigned int)a3
{
  objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "setThreadgroupDistributionModeWithClusterGroupIndex:", *(_QWORD *)&a3);
}

- (void)useResidencySet:(id)a3
{
  -[MTLToolsCommandEncoder addRetainedObject:](self, "addRetainedObject:");
  objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "useResidencySet:", objc_msgSend(a3, "baseObject"));
}

- (void)useResidencySets:(const void *)a3 count:(unint64_t)a4
{
  uint64_t v7;
  uint64_t v8;
  id v9;
  void *__p[3];

  std::vector<objc_object  {objcproto15MTLResidencySet}*>::vector(__p, a4);
  if (a4)
  {
    v7 = 0;
    do
    {
      -[MTLToolsCommandEncoder addRetainedObject:](self, "addRetainedObject:", a3[v7]);
      v8 = objc_msgSend((id)a3[v7], "baseObject");
      *((_QWORD *)__p[0] + v7++) = v8;
    }
    while (a4 != v7);
  }
  v9 = -[MTLToolsObject baseObject](self, "baseObject");
  objc_msgSend(v9, "useResidencySets:count:", __p[0], a4);
  if (__p[0])
  {
    __p[1] = __p[0];
    operator delete(__p[0]);
  }
}

@end
