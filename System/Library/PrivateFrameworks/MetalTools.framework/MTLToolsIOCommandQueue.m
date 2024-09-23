@implementation MTLToolsIOCommandQueue

- (NSString)label
{
  return (NSString *)objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "label");
}

- (void)setLabel:(id)a3
{
  objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "setLabel:", a3);
}

- (MTLToolsIOCommandQueue)initWithBaseObject:(id)a3 parent:(id)a4
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)MTLToolsIOCommandQueue;
  return -[MTLToolsObject initWithBaseObject:parent:](&v5, sel_initWithBaseObject_parent_, a3, a4);
}

- (void)dealloc
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)MTLToolsIOCommandQueue;
  -[MTLToolsObject dealloc](&v2, sel_dealloc);
}

- (id)commandBuffer
{
  void *v3;
  MTLToolsIOCommandBuffer *v4;

  v3 = (void *)MEMORY[0x22E309364](self, a2);
  v4 = -[MTLToolsIOCommandBuffer initWithBaseObject:parent:]([MTLToolsIOCommandBuffer alloc], "initWithBaseObject:parent:", objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "commandBuffer"), self);
  objc_autoreleasePoolPop(v3);
  return v4;
}

- (id)commandBufferWithUnretainedReferences
{
  void *v3;
  MTLToolsIOCommandBuffer *v4;

  v3 = (void *)MEMORY[0x22E309364](self, a2);
  v4 = -[MTLToolsIOCommandBuffer initWithBaseObject:parent:]([MTLToolsIOCommandBuffer alloc], "initWithBaseObject:parent:", objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "commandBufferWithUnretainedReferences"), self);
  objc_autoreleasePoolPop(v3);
  return v4;
}

- (void)barrier
{
  objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "enqueueBarrier");
}

- (void)enqueueBarrier
{
  objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "enqueueBarrier");
}

- (unint64_t)globalTraceObjectID
{
  return objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "globalTraceObjectID");
}

@end
