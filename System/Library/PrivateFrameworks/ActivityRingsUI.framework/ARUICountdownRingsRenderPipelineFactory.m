@implementation ARUICountdownRingsRenderPipelineFactory

- (ARUICountdownRingsRenderPipelineFactory)initWithDevice:(id)a3 library:(id)a4
{
  id v6;
  id v7;
  ARUICountdownRingsRenderPipelineFactory *v8;
  ARUIRingsEmptyState *v9;
  ARUIRingsEmptyState *emptyState;
  ARUIRingsCountdownState *v11;
  ARUIRingsCountdownState *countdownState;
  ARUIRingsAlphaReductionState *v13;
  ARUIRingsAlphaReductionState *alphaReductionState;
  objc_super v16;

  v6 = a3;
  v7 = a4;
  v16.receiver = self;
  v16.super_class = (Class)ARUICountdownRingsRenderPipelineFactory;
  v8 = -[ARUIPipelineFactory initWithDevice:library:](&v16, sel_initWithDevice_library_, v6, v7);
  if (v8)
  {
    v9 = -[ARUIRingsRenderState initWithDevice:library:]([ARUIRingsEmptyState alloc], "initWithDevice:library:", v6, v7);
    emptyState = v8->_emptyState;
    v8->_emptyState = v9;

    v11 = -[ARUIRingsRenderState initWithDevice:library:]([ARUIRingsCountdownState alloc], "initWithDevice:library:", v6, v7);
    countdownState = v8->_countdownState;
    v8->_countdownState = v11;

    v13 = -[ARUIRingsRenderState initWithDevice:library:]([ARUIRingsAlphaReductionState alloc], "initWithDevice:library:", v6, v7);
    alphaReductionState = v8->_alphaReductionState;
    v8->_alphaReductionState = v13;

  }
  return v8;
}

- (ARUICountdownRingsRenderPipelineFactory)initWithDeviceSPI:(id)a3 librarySPI:(id)a4
{
  id v6;
  ARUICountdownRingsRenderPipelineFactory *v7;
  ARUIRingsEmptyState *v8;
  ARUIRingsEmptyState *emptyState;
  ARUIRingsCountdownState *v10;
  ARUIRingsCountdownState *countdownState;
  ARUIRingsAlphaReductionState *v12;
  ARUIRingsAlphaReductionState *alphaReductionState;
  objc_super v15;

  v6 = a4;
  v15.receiver = self;
  v15.super_class = (Class)ARUICountdownRingsRenderPipelineFactory;
  v7 = -[ARUIPipelineFactory initWithDeviceSPI:librarySPI:](&v15, sel_initWithDeviceSPI_librarySPI_, a3, v6);
  if (v7)
  {
    v8 = -[ARUIRingsRenderState initWithPipelineLibrary:]([ARUIRingsEmptyState alloc], "initWithPipelineLibrary:", v6);
    emptyState = v7->_emptyState;
    v7->_emptyState = v8;

    v10 = -[ARUIRingsRenderState initWithPipelineLibrary:]([ARUIRingsCountdownState alloc], "initWithPipelineLibrary:", v6);
    countdownState = v7->_countdownState;
    v7->_countdownState = v10;

    v12 = -[ARUIRingsRenderState initWithPipelineLibrary:]([ARUIRingsAlphaReductionState alloc], "initWithPipelineLibrary:", v6);
    alphaReductionState = v7->_alphaReductionState;
    v7->_alphaReductionState = v12;

  }
  return v7;
}

- (id)pipelineForConfiguration:(id)a3
{
  id v4;
  void *v5;
  int v6;
  int *v7;

  v4 = a3;
  if (objc_msgSend(v4, "hasVisibleRings"))
  {
    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v4, "hasEmptyRing");
    v7 = &OBJC_IVAR___ARUICountdownRingsRenderPipelineFactory__countdownState;
    if (v6)
      v7 = &OBJC_IVAR___ARUICountdownRingsRenderPipelineFactory__emptyState;
    objc_msgSend(v5, "addObject:", *(Class *)((char *)&self->super.super.super.isa + *v7));
    if (objc_msgSend(v4, "needsAlphaReductionPass"))
      objc_msgSend(v5, "addObject:", self->_alphaReductionState);
  }
  else
  {
    v5 = (void *)MEMORY[0x24BDBD1A8];
  }

  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_alphaReductionState, 0);
  objc_storeStrong((id *)&self->_countdownState, 0);
  objc_storeStrong((id *)&self->_emptyState, 0);
}

@end
