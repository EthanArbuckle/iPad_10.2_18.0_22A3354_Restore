@implementation ARUIOverlappingRingsRenderPipelineFactory

- (id)pipelineForConfiguration:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  if (objc_msgSend(v4, "hasVisibleRings"))
  {
    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v4, "hasVisibleRings"))
    {
      if (objc_msgSend(v4, "hasEmptyRing"))
        objc_msgSend(v5, "addObject:", self->_emptyState);
      if (objc_msgSend(v4, "hasFilledRing"))
      {
        objc_msgSend(v5, "addObject:", self->_fillState);
        if (objc_msgSend(v4, "hasOverlappingRing"))
          objc_msgSend(v5, "addObject:", self->_endCapShadowState);
      }
      if (objc_msgSend(v4, "needsAlphaReductionPass"))
        objc_msgSend(v5, "addObject:", self->_alphaReductionState);
    }
  }
  else
  {
    v5 = (void *)MEMORY[0x24BDBD1A8];
  }

  return v5;
}

- (ARUIOverlappingRingsRenderPipelineFactory)initWithDeviceSPI:(id)a3 librarySPI:(id)a4
{
  id v6;
  ARUIOverlappingRingsRenderPipelineFactory *v7;
  ARUIRingsEmptyState *v8;
  ARUIRingsEmptyState *emptyState;
  ARUIRingsFillState *v10;
  ARUIRingsFillState *fillState;
  ARUIRingsEndCapShadowState *v12;
  ARUIRingsEndCapShadowState *endCapShadowState;
  ARUIRingsAlphaReductionState *v14;
  ARUIRingsAlphaReductionState *alphaReductionState;
  objc_super v17;

  v6 = a4;
  v17.receiver = self;
  v17.super_class = (Class)ARUIOverlappingRingsRenderPipelineFactory;
  v7 = -[ARUIPipelineFactory initWithDeviceSPI:librarySPI:](&v17, sel_initWithDeviceSPI_librarySPI_, a3, v6);
  if (v7)
  {
    v8 = -[ARUIRingsRenderState initWithPipelineLibrary:]([ARUIRingsEmptyState alloc], "initWithPipelineLibrary:", v6);
    emptyState = v7->_emptyState;
    v7->_emptyState = v8;

    v10 = -[ARUIRingsRenderState initWithPipelineLibrary:]([ARUIRingsFillState alloc], "initWithPipelineLibrary:", v6);
    fillState = v7->_fillState;
    v7->_fillState = v10;

    v12 = -[ARUIRingsRenderState initWithPipelineLibrary:]([ARUIRingsEndCapShadowState alloc], "initWithPipelineLibrary:", v6);
    endCapShadowState = v7->_endCapShadowState;
    v7->_endCapShadowState = v12;

    v14 = -[ARUIRingsRenderState initWithPipelineLibrary:]([ARUIRingsAlphaReductionState alloc], "initWithPipelineLibrary:", v6);
    alphaReductionState = v7->_alphaReductionState;
    v7->_alphaReductionState = v14;

  }
  return v7;
}

- (ARUIOverlappingRingsRenderPipelineFactory)initWithDevice:(id)a3 library:(id)a4
{
  id v6;
  id v7;
  ARUIOverlappingRingsRenderPipelineFactory *v8;
  ARUIRingsEmptyState *v9;
  ARUIRingsEmptyState *emptyState;
  ARUIRingsFillState *v11;
  ARUIRingsFillState *fillState;
  ARUIRingsEndCapShadowState *v13;
  ARUIRingsEndCapShadowState *endCapShadowState;
  ARUIRingsAlphaReductionState *v15;
  ARUIRingsAlphaReductionState *alphaReductionState;
  objc_super v18;

  v6 = a3;
  v7 = a4;
  v18.receiver = self;
  v18.super_class = (Class)ARUIOverlappingRingsRenderPipelineFactory;
  v8 = -[ARUIPipelineFactory initWithDevice:library:](&v18, sel_initWithDevice_library_, v6, v7);
  if (v8)
  {
    v9 = -[ARUIRingsRenderState initWithDevice:library:]([ARUIRingsEmptyState alloc], "initWithDevice:library:", v6, v7);
    emptyState = v8->_emptyState;
    v8->_emptyState = v9;

    v11 = -[ARUIRingsRenderState initWithDevice:library:]([ARUIRingsFillState alloc], "initWithDevice:library:", v6, v7);
    fillState = v8->_fillState;
    v8->_fillState = v11;

    v13 = -[ARUIRingsRenderState initWithDevice:library:]([ARUIRingsEndCapShadowState alloc], "initWithDevice:library:", v6, v7);
    endCapShadowState = v8->_endCapShadowState;
    v8->_endCapShadowState = v13;

    v15 = -[ARUIRingsRenderState initWithDevice:library:]([ARUIRingsAlphaReductionState alloc], "initWithDevice:library:", v6, v7);
    alphaReductionState = v8->_alphaReductionState;
    v8->_alphaReductionState = v15;

  }
  return v8;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_alphaReductionState, 0);
  objc_storeStrong((id *)&self->_endCapShadowState, 0);
  objc_storeStrong((id *)&self->_fillState, 0);
  objc_storeStrong((id *)&self->_emptyState, 0);
}

@end
