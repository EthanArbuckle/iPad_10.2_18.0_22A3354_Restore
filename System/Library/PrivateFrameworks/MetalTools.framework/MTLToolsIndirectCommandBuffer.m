@implementation MTLToolsIndirectCommandBuffer

- (id)indirectComputeCommandAtIndex:(unint64_t)a3
{
  void *v5;
  uint64_t v6;
  MTLToolsIndirectComputeCommand *v7;

  v5 = (void *)MEMORY[0x22E309364](self, a2);
  v6 = objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "indirectComputeCommandAtIndex:", a3);
  if (v6)
    v7 = -[MTLToolsObject initWithBaseObject:parent:]([MTLToolsIndirectComputeCommand alloc], "initWithBaseObject:parent:", v6, self);
  else
    v7 = 0;
  objc_autoreleasePoolPop(v5);
  return v7;
}

- (id)indirectRenderCommandAtIndex:(unint64_t)a3
{
  void *v5;
  uint64_t v6;
  MTLToolsIndirectRenderCommand *v7;

  v5 = (void *)MEMORY[0x22E309364](self, a2);
  v6 = objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "indirectRenderCommandAtIndex:", a3);
  if (v6)
    v7 = -[MTLToolsObject initWithBaseObject:parent:]([MTLToolsIndirectRenderCommand alloc], "initWithBaseObject:parent:", v6, self);
  else
    v7 = 0;
  objc_autoreleasePoolPop(v5);
  return v7;
}

- (unint64_t)size
{
  return objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "size");
}

- (unint64_t)storageMode
{
  return objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "storageMode");
}

- (void)getHeader:(void *)a3 headerSize:(unint64_t *)a4
{
  objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "getHeader:headerSize:", a3, a4);
}

- (void)resetWithRange:(_NSRange)a3
{
  objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "resetWithRange:", a3.location, a3.length);
}

- (unint64_t)uniqueIdentifier
{
  return objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "uniqueIdentifier");
}

- (unint64_t)gpuAddress
{
  return objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "gpuAddress");
}

- (unint64_t)resourceIndex
{
  return objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "resourceIndex");
}

- (unint64_t)gpuHandle
{
  return objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "gpuHandle");
}

- (MTLResourceID)gpuResourceID
{
  return (MTLResourceID)objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "gpuResourceID");
}

@end
