@implementation MTLToolsIOScratchBufferAllocator

- (MTLToolsIOScratchBufferAllocator)initWithBaseObject:(id)a3 parent:(id)a4
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)MTLToolsIOScratchBufferAllocator;
  return -[MTLToolsObject initWithBaseObject:parent:](&v5, sel_initWithBaseObject_parent_, a3, a4);
}

- (void)dealloc
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)MTLToolsIOScratchBufferAllocator;
  -[MTLToolsObject dealloc](&v2, sel_dealloc);
}

- (id)newScratchBufferWithMinimumSize:(unint64_t)a3
{
  void *v4;
  MTLToolsIOScratchBuffer *v5;

  v4 = (void *)objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "newScratchBufferWithMinimumSize:", a3);
  v5 = -[MTLToolsIOScratchBuffer initWithBaseObject:parent:]([MTLToolsIOScratchBuffer alloc], "initWithBaseObject:parent:", v4, self);

  return v5;
}

@end
