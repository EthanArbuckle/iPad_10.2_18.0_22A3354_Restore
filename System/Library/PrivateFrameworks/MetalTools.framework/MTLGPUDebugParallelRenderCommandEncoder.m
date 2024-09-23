@implementation MTLGPUDebugParallelRenderCommandEncoder

- (MTLGPUDebugParallelRenderCommandEncoder)initWithParallelRenderCommandEncoder:(id)a3 parent:(id)a4 descriptor:(id)a5 encoderID:(unsigned int)a6
{
  MTLGPUDebugParallelRenderCommandEncoder *result;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)MTLGPUDebugParallelRenderCommandEncoder;
  result = -[MTLToolsParallelRenderCommandEncoder initWithParallelRenderCommandEncoder:parent:descriptor:](&v8, sel_initWithParallelRenderCommandEncoder_parent_descriptor_, a3, a4, a5);
  if (result)
    result->_encoderID = a6;
  return result;
}

- (id)renderCommandEncoder
{
  MTLGPUDebugRenderCommandEncoder *v3;

  v3 = -[MTLGPUDebugRenderCommandEncoder initWithRenderCommandEncoder:parallelEncoder:encoderID:]([MTLGPUDebugRenderCommandEncoder alloc], "initWithRenderCommandEncoder:parallelEncoder:encoderID:", -[MTLToolsObject renderCommandEncoder](self->super.super.super._baseObject, "renderCommandEncoder"), self, self->_encoderID);
  -[MTLToolsObject beginingEncoder:type:](self->super.super.super._parent, "beginingEncoder:type:", v3, 3);
  ++self->_encoderID;
  return v3;
}

@end
