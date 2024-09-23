@implementation ARUIRingsRenderState

- (MTLRenderPipelineState)renderPipelineState
{
  return self->_renderPipelineState;
}

- (unint64_t)renderArea
{
  return self->_renderArea;
}

- (ARUIRingsRenderState)initWithPipelineLibrary:(id)a3
{
  id v4;
  ARUIRingsRenderState *v5;
  ARUIRingsRenderState *v6;
  void *v7;
  void *v8;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)ARUIRingsRenderState;
  v5 = -[ARUIRingsRenderState init](&v10, sel_init);
  v6 = v5;
  if (v5)
  {
    -[ARUIRingsRenderState name](v5, "name");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (void *)objc_msgSend(v4, "newRenderPipelineStateWithName:options:reflection:error:", v7, 0, 0, 0);

    -[ARUIRingsRenderState setRenderPipelineState:](v6, "setRenderPipelineState:", v8);
    -[ARUIRingsRenderState didInitialize](v6, "didInitialize");

  }
  return v6;
}

- (void)setRenderPipelineState:(id)a3
{
  objc_storeStrong((id *)&self->_renderPipelineState, a3);
}

- (void)didInitialize
{
  *(_OWORD *)&self->_renderArea = xmmword_212E0AB30;
}

- (void)setRenderArea:(unint64_t)a3
{
  self->_renderArea = a3;
}

- (ARUIRingsRenderState)initWithDevice:(id)a3 library:(id)a4
{
  id v6;
  id v7;
  ARUIRingsRenderState *v8;
  ARUIRingsRenderState *v9;
  void *v10;
  void *v11;
  objc_super v13;

  v6 = a3;
  v7 = a4;
  v13.receiver = self;
  v13.super_class = (Class)ARUIRingsRenderState;
  v8 = -[ARUIRingsRenderState init](&v13, sel_init);
  v9 = v8;
  if (v8)
  {
    -[ARUIRingsRenderState renderPipelineDescriptorFromLibrary:](v8, "renderPipelineDescriptorFromLibrary:", v7);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (void *)objc_msgSend(v6, "newRenderPipelineStateWithDescriptor:error:", v10, 0);
    -[ARUIRingsRenderState setRenderPipelineState:](v9, "setRenderPipelineState:", v11);
    -[ARUIRingsRenderState didInitialize](v9, "didInitialize");

  }
  return v9;
}

- (id)renderPipelineDescriptorFromLibrary:(id)a3
{
  return 0;
}

- (id)name
{
  return 0;
}

- (BOOL)shouldRunStateForRing:(id)a3
{
  return 1;
}

- (int64_t)centeredAroundPercentSegmentDrawCount
{
  return self->_centeredAroundPercentSegmentDrawCount;
}

- (void)setCenteredAroundPercentSegmentDrawCount:(int64_t)a3
{
  self->_centeredAroundPercentSegmentDrawCount = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_renderPipelineState, 0);
}

@end
