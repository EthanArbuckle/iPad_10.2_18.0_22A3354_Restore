@implementation GLRRenderPipelineStateES

- (GLRRenderPipelineStateES)initWithPipelineState:(id)a3 reflection:(id)a4
{
  GLRRenderPipelineStateES *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)GLRRenderPipelineStateES;
  v6 = -[GLRRenderPipelineStateES init](&v8, sel_init);
  v6->_internal.renderPipelineState = (MTLRenderPipelineStateSPI *)a3;
  *(_QWORD *)&v6->_internal.usageFlags = objc_msgSend(a4, "usageFlags");
  return v6;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)GLRRenderPipelineStateES;
  -[GLRRenderPipelineStateES dealloc](&v3, sel_dealloc);
}

@end
