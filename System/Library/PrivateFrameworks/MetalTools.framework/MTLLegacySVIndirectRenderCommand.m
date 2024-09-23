@implementation MTLLegacySVIndirectRenderCommand

- (MTLLegacySVIndirectRenderCommand)initWithIndirectRenderCommand:(id)a3 commandIndex:(unint64_t)a4 indirectCommandBuffer:(id)a5
{
  MTLLegacySVIndirectRenderCommand *result;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)MTLLegacySVIndirectRenderCommand;
  result = -[MTLToolsObject initWithBaseObject:parent:](&v7, sel_initWithBaseObject_parent_, a3, a5);
  if (result)
    result->_commandIndex = a4;
  return result;
}

- (void)setVertexBuffer:(id)a3 offset:(unint64_t)a4 atIndex:(unint64_t)a5
{
  -[MTLLegacySVIndirectRenderCommand setVertexBuffer:offset:attributeStride:atIndex:](self, "setVertexBuffer:offset:attributeStride:atIndex:", a3, a4, -1, a5);
}

- (void)setVertexBuffer:(id)a3 offset:(unint64_t)a4 attributeStride:(unint64_t)a5 atIndex:(unint64_t)a6
{
  -[MTLToolsObject setBuffer:offset:attributeStride:atIndex:forStage:commandIndex:](self->super.super._parent, "setBuffer:offset:attributeStride:atIndex:forStage:commandIndex:", a3, a4, a5, a6, 1, self->_commandIndex);
}

- (void)setFragmentBuffer:(id)a3 offset:(unint64_t)a4 atIndex:(unint64_t)a5
{
  -[MTLToolsObject setBuffer:offset:attributeStride:atIndex:forStage:commandIndex:](self->super.super._parent, "setBuffer:offset:attributeStride:atIndex:forStage:commandIndex:", a3, a4, -1, a5, 2, self->_commandIndex);
}

- (void)setObjectBuffer:(id)a3 offset:(unint64_t)a4 atIndex:(unint64_t)a5
{
  -[MTLToolsObject setBuffer:offset:attributeStride:atIndex:forStage:commandIndex:](self->super.super._parent, "setBuffer:offset:attributeStride:atIndex:forStage:commandIndex:", a3, a4, -1, a5, 8, self->_commandIndex);
}

- (void)setMeshBuffer:(id)a3 offset:(unint64_t)a4 atIndex:(unint64_t)a5
{
  -[MTLToolsObject setBuffer:offset:attributeStride:atIndex:forStage:commandIndex:](self->super.super._parent, "setBuffer:offset:attributeStride:atIndex:forStage:commandIndex:", a3, a4, -1, a5, 7, self->_commandIndex);
}

- (void)setRenderPipelineState:(id)a3
{
  -[MTLToolsObject setRenderPipelineStateBuffers:commandIndex:](self->super.super._parent, "setRenderPipelineStateBuffers:commandIndex:", a3, self->_commandIndex);
  -[MTLToolsObject setRenderPipelineState:](self->super.super._baseObject, "setRenderPipelineState:", objc_msgSend(a3, "baseObject"));
}

- (void)drawIndexedPatches:(unint64_t)a3 patchStart:(unint64_t)a4 patchCount:(unint64_t)a5 patchIndexBuffer:(id)a6 patchIndexBufferOffset:(unint64_t)a7 controlPointIndexBuffer:(id)a8 controlPointIndexBufferOffset:(unint64_t)a9 instanceCount:(unint64_t)a10 baseInstance:(unint64_t)a11 tessellationFactorBuffer:(id)a12 tessellationFactorBufferOffset:(unint64_t)a13 tessellationFactorBufferInstanceStride:(unint64_t)a14
{
  objc_super v20;

  -[MTLToolsObject setTessellationControlPointIndexBuffer:offset:commandIndex:](self->super.super._parent, "setTessellationControlPointIndexBuffer:offset:commandIndex:", a8, a9, self->_commandIndex);
  v20.receiver = self;
  v20.super_class = (Class)MTLLegacySVIndirectRenderCommand;
  -[MTLToolsIndirectRenderCommand drawPatches:patchStart:patchCount:patchIndexBuffer:patchIndexBufferOffset:instanceCount:baseInstance:tessellationFactorBuffer:tessellationFactorBufferOffset:tessellationFactorBufferInstanceStride:](&v20, sel_drawPatches_patchStart_patchCount_patchIndexBuffer_patchIndexBufferOffset_instanceCount_baseInstance_tessellationFactorBuffer_tessellationFactorBufferOffset_tessellationFactorBufferInstanceStride_, a3, a4, a5, a6, a7, a10, a11, a12, a13, a14);
}

- (void)dealloc
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)MTLLegacySVIndirectRenderCommand;
  -[MTLToolsObject dealloc](&v2, sel_dealloc);
}

@end
