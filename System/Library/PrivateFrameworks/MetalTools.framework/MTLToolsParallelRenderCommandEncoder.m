@implementation MTLToolsParallelRenderCommandEncoder

- (MTLToolsParallelRenderCommandEncoder)initWithBaseObject:(id)a3 parent:(id)a4
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)MTLToolsParallelRenderCommandEncoder;
  return -[MTLToolsCommandEncoder initWithBaseObject:parent:](&v5, sel_initWithBaseObject_parent_, a3, a4);
}

- (MTLToolsParallelRenderCommandEncoder)initWithParallelRenderCommandEncoder:(id)a3 parent:(id)a4 descriptor:(id)a5
{
  MTLToolsParallelRenderCommandEncoder *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)MTLToolsParallelRenderCommandEncoder;
  v7 = -[MTLToolsCommandEncoder initWithBaseObject:parent:](&v9, sel_initWithBaseObject_parent_, a3);
  if (v7)
  {
    objc_msgSend(a4, "retainObjectsFromRenderPassDescriptor:", a5);
    objc_msgSend(a4, "setUseRetainedObjectsLock:", 1);
  }
  return v7;
}

- (void)endEncoding
{
  objc_super v3;

  -[MTLToolsObject setUseRetainedObjectsLock:](self->super.super._parent, "setUseRetainedObjectsLock:", 0);
  v3.receiver = self;
  v3.super_class = (Class)MTLToolsParallelRenderCommandEncoder;
  -[MTLToolsCommandEncoder endEncoding](&v3, sel_endEncoding);
}

- (id)endEncodingAndRetrieveProgramAddressTable
{
  -[MTLToolsObject setUseRetainedObjectsLock:](self->super.super._parent, "setUseRetainedObjectsLock:", 0);
  return (id)objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "endEncodingAndRetrieveProgramAddressTable");
}

- (BOOL)isMemorylessRender
{
  return objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "isMemorylessRender");
}

- (id)renderCommandEncoder
{
  void *v3;
  uint64_t v4;
  MTLToolsRenderCommandEncoder *v5;

  v3 = (void *)MEMORY[0x22E309364](self, a2);
  v4 = objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "renderCommandEncoder");
  if (v4)
    v5 = -[MTLToolsCommandEncoder initWithBaseObject:parallelRenderCommandEncoder:]([MTLToolsRenderCommandEncoder alloc], "initWithBaseObject:parallelRenderCommandEncoder:", v4, self);
  else
    v5 = 0;
  objc_autoreleasePoolPop(v3);
  return v5;
}

- (id)sampledRenderCommandEncoderWithProgramInfoBuffer:(id *)a3 capacity:(unint64_t)a4
{
  void *v7;
  uint64_t v8;
  MTLToolsRenderCommandEncoder *v9;

  v7 = (void *)MEMORY[0x22E309364](self, a2);
  v8 = objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "sampledRenderCommandEncoderWithProgramInfoBuffer:capacity:", a3, a4);
  if (v8)
    v9 = -[MTLToolsCommandEncoder initWithBaseObject:parallelRenderCommandEncoder:]([MTLToolsRenderCommandEncoder alloc], "initWithBaseObject:parallelRenderCommandEncoder:", v8, self);
  else
    v9 = 0;
  objc_autoreleasePoolPop(v7);
  return v9;
}

- (void)setColorStoreAction:(unint64_t)a3 atIndex:(unint64_t)a4
{
  objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "setColorStoreAction:atIndex:", a3, a4);
}

- (void)setDepthStoreAction:(unint64_t)a3
{
  objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "setDepthStoreAction:", a3);
}

- (void)setStencilStoreAction:(unint64_t)a3
{
  objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "setStencilStoreAction:", a3);
}

- (void)setColorStoreActionOptions:(unint64_t)a3 atIndex:(unint64_t)a4
{
  objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "setColorStoreActionOptions:atIndex:", a3, a4);
}

- (void)setDepthStoreActionOptions:(unint64_t)a3
{
  objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "setDepthStoreActionOptions:", a3);
}

- (void)setStencilStoreActionOptions:(unint64_t)a3
{
  objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "setStencilStoreActionOptions:", a3);
}

@end
