@implementation MTLToolsIndirectComputeCommand

- (void)setComputePipelineState:(id)a3
{
  objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "setComputePipelineState:", objc_msgSend(a3, "baseObject"));
}

- (void)concurrentDispatchThreads:(id *)a3 threadsPerThreadgroup:(id *)a4
{
  id v6;
  $F99D9A4FB75BC57F3386B8DC8EE08D7A v7;
  $F99D9A4FB75BC57F3386B8DC8EE08D7A v8;

  v6 = -[MTLToolsObject baseObject](self, "baseObject");
  v8 = *a3;
  v7 = *a4;
  objc_msgSend(v6, "concurrentDispatchThreads:threadsPerThreadgroup:", &v8, &v7);
}

- (unint64_t)getThreadgroupMemoryLengthAtIndex:(unint64_t)a3
{
  return objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "getThreadgroupMemoryLengthAtIndex:", a3);
}

- ($1A7EE345FBD7959593737C54B12A4BDF)getStageInRegion
{
  $1A7EE345FBD7959593737C54B12A4BDF *result;

  result = -[MTLToolsObject baseObject](self, "baseObject");
  if (result)
    return ($1A7EE345FBD7959593737C54B12A4BDF *)-[$1A7EE345FBD7959593737C54B12A4BDF getStageInRegion](result, "getStageInRegion");
  *(_OWORD *)&retstr->var0.var2 = 0u;
  *(_OWORD *)&retstr->var1.var1 = 0u;
  *(_OWORD *)&retstr->var0.var0 = 0u;
  return result;
}

- (BOOL)hasBarrier
{
  return objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "hasBarrier");
}

- (id)getImageBlockSize
{
  return (id)objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "getImageBlockSize");
}

- (void)setImageblockWidth:(unint64_t)a3 height:(unint64_t)a4
{
  objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "setImageblockWidth:height:", a3, a4);
}

- (void)setBarrier
{
  objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "setBarrier");
}

- (void)clearBarrier
{
  objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "clearBarrier");
}

- (void)concurrentDispatchThreadgroups:(id *)a3 threadsPerThreadgroup:(id *)a4
{
  id v6;
  $F99D9A4FB75BC57F3386B8DC8EE08D7A v7;
  $F99D9A4FB75BC57F3386B8DC8EE08D7A v8;

  v6 = -[MTLToolsObject baseObject](self, "baseObject");
  v8 = *a3;
  v7 = *a4;
  objc_msgSend(v6, "concurrentDispatchThreadgroups:threadsPerThreadgroup:", &v8, &v7);
}

- (id)dispatchThreadgroupsArguments
{
  return (id)objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "dispatchThreadgroupsArguments");
}

- (id)dispatchThreadsArguments
{
  return (id)objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "dispatchThreadsArguments");
}

- (void)reset
{
  objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "reset");
}

- (void)setThreadgroupMemoryLength:(unint64_t)a3 atIndex:(unint64_t)a4
{
  objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "setThreadgroupMemoryLength:atIndex:", a3, a4);
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

- (void)setKernelBuffer:(id)a3 offset:(unint64_t)a4 atIndex:(unint64_t)a5
{
  objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "setKernelBuffer:offset:atIndex:", objc_msgSend(a3, "baseObject"), a4, a5);
}

- (void)setKernelBuffer:(id)a3 offset:(unint64_t)a4 attributeStride:(unint64_t)a5 atIndex:(unint64_t)a6
{
  objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "setKernelBuffer:offset:attributeStride:atIndex:", a3, a4, a5, a6);
}

- (unint64_t)getPipelineStateUniqueIdentifier
{
  return objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "getPipelineStateUniqueIdentifier");
}

- (void)getKernelBufferAtIndex:(unint64_t)a3
{
  return (void *)objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "getKernelBufferAtIndex:", a3);
}

- (unint64_t)getKernelBufferAddressAtIndex:(unint64_t)a3
{
  return objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "getKernelBufferAddressAtIndex:", a3);
}

- (unint64_t)getCommandType
{
  return objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "getCommandType");
}

- (unint64_t)getOptimizedStatus
{
  return objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "getOptimizedStatus");
}

- (unint64_t)getKernelAttributeStrideAtIndex:(unint64_t)a3
{
  return objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "getKernelAttributeStrideAtIndex:", a3);
}

@end
