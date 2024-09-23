@implementation MTLGPUDebugIndirectComputeCommand

- (MTLGPUDebugIndirectComputeCommand)initWithIndirectComputeCommand:(id)a3 commandIndex:(unint64_t)a4 indirectCommandBuffer:(id)a5
{
  MTLGPUDebugIndirectComputeCommand *result;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)MTLGPUDebugIndirectComputeCommand;
  result = -[MTLToolsObject initWithBaseObject:parent:](&v7, sel_initWithBaseObject_parent_, a3, a5);
  if (result)
    result->_commandIndex = a4;
  return result;
}

- (void)reset
{
  -[MTLToolsObject resetAtIndex:](self->super.super._parent, "resetAtIndex:", self->_commandIndex);
  -[MTLToolsObject reset](self->super.super._baseObject, "reset");
}

- (void)setBarrier
{
  -[MTLToolsObject setBarrier](self->super.super._baseObject, "setBarrier");
}

- (void)clearBarrier
{
  -[MTLToolsObject clearBarrier](self->super.super._baseObject, "clearBarrier");
}

- (void)setStageInRegion:(id *)a3
{
  MTLToolsObject *baseObject;
  __int128 v4;
  _OWORD v5[3];

  baseObject = self->super.super._baseObject;
  v4 = *(_OWORD *)&a3->var0.var2;
  v5[0] = *(_OWORD *)&a3->var0.var0;
  v5[1] = v4;
  v5[2] = *(_OWORD *)&a3->var1.var1;
  -[MTLToolsObject setStageInRegion:](baseObject, "setStageInRegion:", v5);
}

- (void)setKernelBuffer:(id)a3 offset:(unint64_t)a4 atIndex:(unint64_t)a5
{
  -[MTLGPUDebugIndirectComputeCommand setKernelBuffer:offset:attributeStride:atIndex:](self, "setKernelBuffer:offset:attributeStride:atIndex:", a3, a4, -1, a5);
}

- (void)setKernelBuffer:(id)a3 offset:(unint64_t)a4 attributeStride:(unint64_t)a5 atIndex:(unint64_t)a6
{
  -[MTLToolsObject setBuffer:offset:attributeStride:atIndex:forStage:commandIndex:](self->super.super._parent, "setBuffer:offset:attributeStride:atIndex:forStage:commandIndex:", a3, a4, a5, a6, 3, self->_commandIndex);
}

- (void)setThreadgroupMemoryLength:(unint64_t)a3 atIndex:(unint64_t)a4
{
  -[MTLToolsObject setThreadgroupMemoryLength:atIndex:commandIndex:](self->super.super._parent, "setThreadgroupMemoryLength:atIndex:commandIndex:", a3, a4, self->_commandIndex);
}

- (void)setComputePipelineState:(id)a3
{
  -[MTLToolsObject setComputePipelineStateBuffers:commandIndex:](self->super.super._parent, "setComputePipelineStateBuffers:commandIndex:", a3, self->_commandIndex);
  -[MTLToolsObject setComputePipelineState:](self->super.super._baseObject, "setComputePipelineState:", objc_msgSend(a3, "baseObject"));
}

- (void)concurrentDispatchThreads:(id *)a3 threadsPerThreadgroup:(id *)a4
{
  objc_super v4;
  $F99D9A4FB75BC57F3386B8DC8EE08D7A v5;
  $F99D9A4FB75BC57F3386B8DC8EE08D7A v6;

  v6 = *a3;
  v5 = *a4;
  v4.receiver = self;
  v4.super_class = (Class)MTLGPUDebugIndirectComputeCommand;
  -[MTLToolsIndirectComputeCommand concurrentDispatchThreads:threadsPerThreadgroup:](&v4, sel_concurrentDispatchThreads_threadsPerThreadgroup_, &v6, &v5);
}

- (void)concurrentDispatchThreadgroups:(id *)a3 threadsPerThreadgroup:(id *)a4
{
  objc_super v4;
  $F99D9A4FB75BC57F3386B8DC8EE08D7A v5;
  $F99D9A4FB75BC57F3386B8DC8EE08D7A v6;

  v6 = *a3;
  v5 = *a4;
  v4.receiver = self;
  v4.super_class = (Class)MTLGPUDebugIndirectComputeCommand;
  -[MTLToolsIndirectComputeCommand concurrentDispatchThreadgroups:threadsPerThreadgroup:](&v4, sel_concurrentDispatchThreadgroups_threadsPerThreadgroup_, &v6, &v5);
}

- (void)dealloc
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)MTLGPUDebugIndirectComputeCommand;
  -[MTLToolsObject dealloc](&v2, sel_dealloc);
}

@end
