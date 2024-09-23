@implementation ARUIRenderState

- (ARUIRenderState)initWithDevice:(id)a3 library:(id)a4
{
  id v6;
  id v7;
  ARUIRenderState *v8;
  ARUIRenderState *v9;
  void *v10;
  void *v11;
  objc_super v13;

  v6 = a3;
  v7 = a4;
  v13.receiver = self;
  v13.super_class = (Class)ARUIRenderState;
  v8 = -[ARUIRenderState init](&v13, sel_init);
  v9 = v8;
  if (v8)
  {
    -[ARUIRenderState renderPipelineDescriptorFromLibrary:](v8, "renderPipelineDescriptorFromLibrary:", v7);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (void *)objc_msgSend(v6, "newRenderPipelineStateWithDescriptor:error:", v10, 0);
    -[ARUIRenderState setRenderPipelineState:](v9, "setRenderPipelineState:", v11);

  }
  return v9;
}

- (void)setRenderPipelineState:(id)a3
{
  objc_storeStrong((id *)&self->_renderPipelineState, a3);
}

- (MTLRenderPipelineState)renderPipelineState
{
  return self->_renderPipelineState;
}

- (id)renderPipelineDescriptorFromLibrary:(id)a3
{
  return 0;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_renderPipelineState, 0);
}

@end
