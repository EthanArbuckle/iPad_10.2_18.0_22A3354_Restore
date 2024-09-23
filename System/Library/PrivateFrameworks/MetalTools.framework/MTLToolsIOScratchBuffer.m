@implementation MTLToolsIOScratchBuffer

- (MTLToolsIOScratchBuffer)initWithBaseObject:(id)a3 parent:(id)a4
{
  objc_super v5;

  if (a3)
  {
    v5.receiver = self;
    v5.super_class = (Class)MTLToolsIOScratchBuffer;
    return -[MTLToolsObject initWithBaseObject:parent:](&v5, sel_initWithBaseObject_parent_, a3, a4);
  }
  else
  {

    return 0;
  }
}

- (void)dealloc
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)MTLToolsIOScratchBuffer;
  -[MTLToolsObject dealloc](&v2, sel_dealloc);
}

- (MTLBuffer)buffer
{
  return (MTLBuffer *)objc_msgSend((id)objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "buffer"), "baseObject");
}

@end
