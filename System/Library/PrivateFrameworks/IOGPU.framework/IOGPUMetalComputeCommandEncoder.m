@implementation IOGPUMetalComputeCommandEncoder

- (unint64_t)getType
{
  return 1;
}

- (void)updateFence:(id)a3
{
  -[IOGPUMetalComputeCommandEncoder doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);
}

- (void)waitForFence:(id)a3
{
  -[IOGPUMetalComputeCommandEncoder doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);
}

- (id)getComputePipelineState
{
  -[IOGPUMetalComputeCommandEncoder doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);
  return 0;
}

- (void)getBufferContentsAtIndex:(unint64_t)a3
{
  -[IOGPUMetalComputeCommandEncoder doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);
  return 0;
}

- (void)memoryBarrierWithScope:(unint64_t)a3
{
  if (-[_MTLCommandEncoder dispatchType](self, "dispatchType") == 1)
    -[IOGPUMetalComputeCommandEncoder doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);
  -[_MTLCommandEncoder memoryBarrierNotificationWithScope:](self, "memoryBarrierNotificationWithScope:", a3);
}

- (void)memoryBarrierWithResources:(const void *)a3 count:(unint64_t)a4
{
  unint64_t v5;
  uint64_t v7;
  uint64_t v8;

  if (a4)
  {
    v5 = a4;
    v7 = 0;
    do
    {
      ++a3;
      if ((objc_opt_respondsToSelector() & 1) != 0)
        v8 = 2;
      else
        v8 = 1;
      v7 |= v8;
      --v5;
    }
    while (v5);
  }
  else
  {
    v7 = 0;
  }
  -[IOGPUMetalComputeCommandEncoder memoryBarrierWithScope:](self, "memoryBarrierWithScope:", v7);
}

- (void)sampleCountersInBuffer:(id)a3 atSampleIndex:(unint64_t)a4 withBarrier:(BOOL)a5
{
  -[IOGPUMetalComputeCommandEncoder doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2, a4, a5);
}

- (void)setAccelerationStructure:(id)a3 atBufferIndex:(unint64_t)a4
{
  if ((-[MTLDevice requiresRaytracingEmulation](-[_MTLCommandEncoder device](self, "device"), "requiresRaytracingEmulation") & 1) != 0)-[IOGPUMetalComputeCommandEncoder setBuffer:offset:atIndex:](self, "setBuffer:offset:atIndex:", objc_msgSend(a3, "buffer"), objc_msgSend(a3, "bufferOffset"), a4);
  else
    -[IOGPUMetalComputeCommandEncoder doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);
}

- (void)setFunctionTable:(id)a3 atIndex:(unint64_t)a4
{
  -[IOGPUMetalComputeCommandEncoder doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2, a4);
}

- (void)setFunctionTables:(const void *)a3 withRange:(_NSRange)a4
{
  -[IOGPUMetalComputeCommandEncoder doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2, a4.location, a4.length);
}

- (void)setIntersectionFunctionTable:(id)a3 atBufferIndex:(unint64_t)a4
{
  if ((-[MTLDevice requiresRaytracingEmulation](-[_MTLCommandEncoder device](self, "device"), "requiresRaytracingEmulation") & 1) != 0)-[IOGPUMetalComputeCommandEncoder setVisibleFunctionTable:atBufferIndex:](self, "setVisibleFunctionTable:atBufferIndex:", objc_msgSend(a3, "visibleFunctionTable"), a4);
  else
    -[IOGPUMetalComputeCommandEncoder doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);
}

- (void)setIntersectionFunctionTables:(const void *)a3 withBufferRange:(_NSRange)a4
{
  NSUInteger length;
  NSUInteger location;
  _QWORD *v9;
  NSUInteger v10;
  void *v11;
  _QWORD v12[2];

  length = a4.length;
  location = a4.location;
  v12[1] = *MEMORY[0x24BDAC8D0];
  if ((-[MTLDevice requiresRaytracingEmulation](-[_MTLCommandEncoder device](self, "device"), "requiresRaytracingEmulation") & 1) != 0)
  {
    if (length)
    {
      v9 = (_QWORD *)((char *)v12 - ((8 * length + 15) & 0xFFFFFFFFFFFFFFF0));
      v10 = length;
      do
      {
        v11 = (void *)*a3++;
        *v9++ = objc_msgSend(v11, "visibleFunctionTable");
        --v10;
      }
      while (v10);
    }
    -[IOGPUMetalComputeCommandEncoder setVisibleFunctionTables:withBufferRange:](self, "setVisibleFunctionTables:withBufferRange:", (char *)v12 - ((8 * length + 15) & 0xFFFFFFFFFFFFFFF0), location, length);
  }
  else
  {
    -[IOGPUMetalComputeCommandEncoder doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);
  }
}

@end
