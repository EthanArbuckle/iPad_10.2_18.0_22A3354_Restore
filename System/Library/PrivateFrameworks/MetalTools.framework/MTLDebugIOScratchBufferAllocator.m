@implementation MTLDebugIOScratchBufferAllocator

- (MTLDebugIOScratchBufferAllocator)initWithBaseObject:(id)a3 parent:(id)a4
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)MTLDebugIOScratchBufferAllocator;
  return -[MTLToolsIOScratchBufferAllocator initWithBaseObject:parent:](&v5, sel_initWithBaseObject_parent_, a3, a4);
}

- (void)dealloc
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)MTLDebugIOScratchBufferAllocator;
  -[MTLToolsIOScratchBufferAllocator dealloc](&v2, sel_dealloc);
}

- (id)newScratchBufferWithMinimumSize:(unint64_t)a3
{
  void *v4;
  MTLDebugIOScratchBuffer *v5;

  v4 = (void *)objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "newScratchBufferWithMinimumSize:", a3);
  v5 = -[MTLToolsIOScratchBuffer initWithBaseObject:parent:]([MTLDebugIOScratchBuffer alloc], "initWithBaseObject:parent:", v4, self);

  return v5;
}

- (id)allocateScratchBufferWithMinimumSize:(unint64_t)a3
{
  void *v4;
  MTLDebugIOScratchBuffer *v5;

  v4 = (void *)objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "newScratchBufferWithMinimumSize:", a3);
  v5 = -[MTLToolsIOScratchBuffer initWithBaseObject:parent:]([MTLDebugIOScratchBuffer alloc], "initWithBaseObject:parent:", v4, self);

  return v5;
}

@end
