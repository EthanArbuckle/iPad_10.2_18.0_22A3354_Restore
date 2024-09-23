@implementation MTLDebugIOCommandQueue

- (id)commandBuffer
{
  void *v3;
  MTLDebugIOCommandBuffer *v4;

  v3 = (void *)MEMORY[0x22E309364](self, a2);
  v4 = -[MTLToolsIOCommandBuffer initWithBaseObject:parent:]([MTLDebugIOCommandBuffer alloc], "initWithBaseObject:parent:", objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "commandBuffer"), self);
  objc_autoreleasePoolPop(v3);
  return v4;
}

- (id)commandBufferWithUnretainedReferences
{
  void *v3;
  MTLDebugIOCommandBuffer *v4;

  v3 = (void *)MEMORY[0x22E309364](self, a2);
  v4 = -[MTLToolsIOCommandBuffer initWithBaseObject:parent:]([MTLDebugIOCommandBuffer alloc], "initWithBaseObject:parent:", objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "commandBufferWithUnretainedReferences"), self);
  objc_autoreleasePoolPop(v3);
  return v4;
}

- (void)barrier
{
  objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "barrier");
}

- (unint64_t)globalTraceObjectID
{
  return objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "globalTraceObjectID");
}

@end
