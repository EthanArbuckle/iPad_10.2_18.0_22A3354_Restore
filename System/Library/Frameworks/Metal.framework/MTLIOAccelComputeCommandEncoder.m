@implementation MTLIOAccelComputeCommandEncoder

- (unint64_t)getType
{
  return 1;
}

- (void)updateFence:(id)a3
{
  -[MTLIOAccelComputeCommandEncoder doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);
}

- (void)waitForFence:(id)a3
{
  -[MTLIOAccelComputeCommandEncoder doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);
}

- (id)getComputePipelineState
{
  -[MTLIOAccelComputeCommandEncoder doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);
  return 0;
}

- (void)getBufferContentsAtIndex:(unint64_t)a3
{
  -[MTLIOAccelComputeCommandEncoder doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);
  return 0;
}

- (void)useHeap:(id)a3
{
  -[MTLIOAccelComputeCommandEncoder doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);
}

- (void)useHeaps:(const void *)a3 count:(unint64_t)a4
{
  -[MTLIOAccelComputeCommandEncoder doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2, a4);
}

- (void)setEmulationBuffers:(const void *)a3 offsets:(const unint64_t *)a4 withRange:(_NSRange)a5
{
  -[MTLIOAccelComputeCommandEncoder doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2, a4, a5.location, a5.length);
}

- (void)setEmulationTextures:(const void *)a3 withRange:(_NSRange)a4
{
  -[MTLIOAccelComputeCommandEncoder doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2, a4.location, a4.length);
}

- (void)setEmulationSamplerStates:(const void *)a3 withRange:(_NSRange)a4
{
  -[MTLIOAccelComputeCommandEncoder doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2, a4.location, a4.length);
}

- (void)memoryBarrierWithScope:(unint64_t)a3
{
  if (-[_MTLCommandEncoder dispatchType](self, "dispatchType") == 1)
    -[MTLIOAccelComputeCommandEncoder doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);
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
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
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
  -[MTLIOAccelComputeCommandEncoder memoryBarrierWithScope:](self, "memoryBarrierWithScope:", v7);
}

- (void)sampleCountersInBuffer:(id)a3 atSampleIndex:(unint64_t)a4 withBarrier:(BOOL)a5
{
  -[MTLIOAccelComputeCommandEncoder doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2, a4, a5);
}

- (void)setVisibleFunctionTable:(id)a3 atBufferIndex:(unint64_t)a4
{
  -[MTLIOAccelComputeCommandEncoder doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2, a4);
}

- (void)setVisibleFunctionTables:(const void *)a3 withBufferRange:(_NSRange)a4
{
  -[MTLIOAccelComputeCommandEncoder doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2, a4.location, a4.length);
}

- (void)setIntersectionFunctionTable:(id)a3 atBufferIndex:(unint64_t)a4
{
  if ((-[MTLDevice requiresRaytracingEmulation](-[_MTLCommandEncoder device](self, "device"), "requiresRaytracingEmulation") & 1) != 0)-[MTLIOAccelComputeCommandEncoder setVisibleFunctionTable:atBufferIndex:](self, "setVisibleFunctionTable:atBufferIndex:", objc_msgSend(a3, "visibleFunctionTable"), a4);
  else
    -[MTLIOAccelComputeCommandEncoder doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);
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
  v12[1] = *MEMORY[0x1E0C80C00];
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
    -[MTLIOAccelComputeCommandEncoder setVisibleFunctionTables:withBufferRange:](self, "setVisibleFunctionTables:withBufferRange:", (char *)v12 - ((8 * length + 15) & 0xFFFFFFFFFFFFFFF0), location, length);
  }
  else
  {
    -[MTLIOAccelComputeCommandEncoder doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);
  }
}

@end
