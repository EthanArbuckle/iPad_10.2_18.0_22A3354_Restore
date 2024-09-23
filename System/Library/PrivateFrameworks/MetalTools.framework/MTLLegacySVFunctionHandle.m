@implementation MTLLegacySVFunctionHandle

- (MTLLegacySVFunctionHandle)initWithFunctionHandle:(id)a3 computePiplineState:(id)a4 function:(id)a5
{
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)MTLLegacySVFunctionHandle;
  return -[MTLToolsFunctionHandle initWithBaseObject:parent:function:](&v6, sel_initWithBaseObject_parent_function_, a3, a4, a5);
}

- (MTLLegacySVFunctionHandle)initWithFunctionHandle:(id)a3 renderPipelineState:(id)a4 stage:(unint64_t)a5 function:(id)a6
{
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)MTLLegacySVFunctionHandle;
  return -[MTLToolsFunctionHandle initWithBaseObject:parent:function:](&v7, sel_initWithBaseObject_parent_function_, a3, a4, a6);
}

@end
