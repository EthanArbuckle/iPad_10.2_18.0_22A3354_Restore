@implementation _MTLIndirectComputeCommand

- (unint64_t)getPipelineStateUniqueIdentifier
{
  -[_MTLIndirectComputeCommand doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);
  return 0;
}

- (void)concurrentDispatchThreadgroups:(id *)a3 threadsPerThreadgroup:(id *)a4
{
  -[_MTLIndirectComputeCommand doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2, a4);
}

- (void)concurrentDispatchThreads:(id *)a3 threadsPerThreadgroup:(id *)a4
{
  -[_MTLIndirectComputeCommand doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2, a4);
}

- (void)setImageblockWidth:(unint64_t)a3 height:(unint64_t)a4
{
  -[_MTLIndirectComputeCommand doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2, a4);
}

- (void)setBarrier
{
  -[_MTLIndirectComputeCommand doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);
}

- (void)clearBarrier
{
  -[_MTLIndirectComputeCommand doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);
}

- (unint64_t)getThreadgroupMemoryLengthAtIndex:(unint64_t)a3
{
  -[_MTLIndirectComputeCommand doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);
  return 0;
}

- ($34D5C35368F688BCCD66CCEA543B57DA)getStageInRegion
{
  $34D5C35368F688BCCD66CCEA543B57DA *result;

  result = ($34D5C35368F688BCCD66CCEA543B57DA *)-[_MTLIndirectComputeCommand doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a3);
  *(_OWORD *)&retstr->var0.var0 = 0u;
  *(_OWORD *)&retstr->var0.var2 = 0u;
  *(int64x2_t *)&retstr->var1.var1 = vdupq_n_s64(1uLL);
  return result;
}

- (BOOL)hasBarrier
{
  -[_MTLIndirectComputeCommand doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);
  return 0;
}

- (id)getImageBlockSize
{
  -[_MTLIndirectComputeCommand doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);
  return 0;
}

- (void)setThreadgroupMemoryLength:(unint64_t)a3 atIndex:(unint64_t)a4
{
  -[_MTLIndirectComputeCommand doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2, a4);
}

- (void)setStageInRegion:(id *)a3
{
  -[_MTLIndirectComputeCommand doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);
}

- (void)reset
{
  -[_MTLIndirectComputeCommand doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);
}

- (void)setComputePipelineState:(id)a3
{
  -[_MTLIndirectComputeCommand doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);
}

- (void)setKernelArgument:(id)a3 offset:(unint64_t)a4 atIndex:(unint64_t)a5
{
  -[_MTLIndirectComputeCommand doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2, a4, a5);
}

- (void)setKernelBuffer:(id)a3 offset:(unint64_t)a4 atIndex:(unint64_t)a5
{
  -[_MTLIndirectComputeCommand doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2, a4, a5);
}

- (void)setKernelBuffer:(id)a3 offset:(unint64_t)a4 attributeStride:(unint64_t)a5 atIndex:(unint64_t)a6
{
  -[_MTLIndirectComputeCommand doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2, a4, a5, a6);
}

- (unint64_t)getOptimizedStatus
{
  -[_MTLIndirectComputeCommand doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);
  return 0;
}

- (id)dispatchThreadgroupsArguments
{
  -[_MTLIndirectComputeCommand doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);
  return 0;
}

- (id)dispatchThreadsArguments
{
  -[_MTLIndirectComputeCommand doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);
  return 0;
}

- (unint64_t)getCommandType
{
  -[_MTLIndirectComputeCommand doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);
  return 0;
}

- (void)getKernelBufferAtIndex:(unint64_t)a3
{
  -[_MTLIndirectComputeCommand doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);
  return 0;
}

- (unint64_t)getKernelAttributeStrideAtIndex:(unint64_t)a3
{
  -[_MTLIndirectComputeCommand doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);
  return 0;
}

@end
