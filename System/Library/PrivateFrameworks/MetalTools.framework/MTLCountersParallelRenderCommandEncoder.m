@implementation MTLCountersParallelRenderCommandEncoder

- (MTLCountersParallelRenderCommandEncoder)initWithBaseRenderPass:(id)a3 commandBuffer:(id)a4 descriptor:(id)a5
{
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)MTLCountersParallelRenderCommandEncoder;
  return -[MTLToolsParallelRenderCommandEncoder initWithParallelRenderCommandEncoder:parent:descriptor:](&v6, sel_initWithParallelRenderCommandEncoder_parent_descriptor_, a3, a4, a5);
}

- (id)sampledRenderCommandEncoderWithProgramInfoBuffer:(id *)a3 capacity:(unint64_t)a4
{
  void *v7;
  uint64_t v8;
  MTLCountersRenderCommandEncoder *v9;

  v7 = (void *)MEMORY[0x22E309364](self, a2);
  v8 = objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "sampledRenderCommandEncoderWithProgramInfoBuffer:capacity:", a3, a4);
  if (v8)
  {
    v9 = -[MTLCountersRenderCommandEncoder initWithRenderCommandEncoder:parent:]([MTLCountersRenderCommandEncoder alloc], "initWithRenderCommandEncoder:parent:", v8, self);
    objc_autoreleasePoolPop(v7);
    return v9;
  }
  else
  {
    objc_autoreleasePoolPop(v7);
    return 0;
  }
}

- (id)renderCommandEncoder
{
  void *v3;
  uint64_t v4;
  MTLCountersRenderCommandEncoder *v5;

  v3 = (void *)MEMORY[0x22E309364](self, a2);
  v4 = objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "renderCommandEncoder");
  if (v4)
  {
    v5 = -[MTLCountersRenderCommandEncoder initWithRenderCommandEncoder:parent:]([MTLCountersRenderCommandEncoder alloc], "initWithRenderCommandEncoder:parent:", v4, self);
    objc_autoreleasePoolPop(v3);
    return v5;
  }
  else
  {
    objc_autoreleasePoolPop(v3);
    return 0;
  }
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

@end
