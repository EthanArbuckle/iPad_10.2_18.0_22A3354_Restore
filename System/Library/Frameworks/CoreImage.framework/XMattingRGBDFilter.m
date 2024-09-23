@implementation XMattingRGBDFilter

- (XMattingRGBDFilter)initWithDevice:(id)a3 library:(id)a4
{
  id v7;
  id v8;
  XMattingRGBDFilter *v9;
  XMattingRGBDFilter *v10;
  BOOL v11;
  objc_super v13;

  v7 = a3;
  v8 = a4;
  v13.receiver = self;
  v13.super_class = (Class)XMattingRGBDFilter;
  v9 = -[XMattingRGBDFilter init](&v13, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_device, a3);
    objc_storeStrong((id *)&v10->_library, a4);
    *(_WORD *)&v10->stateComputed = 0;
    if (v7)
      v11 = (unint64_t)objc_msgSend(v7, "readWriteTextureSupport") > 1;
    else
      v11 = 0;
    v10->_supportsReadWriteTextures = v11;
  }

  return v10;
}

- (int)allocateResources:(id *)a3
{
  __int128 v4;
  XMattingBoxTensorFilter *v5;
  XMattingBoxTensorFilter *boxTensorFilter;
  XMattingBoxTensorFilter *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  MTLTexture *v12;
  MTLTexture *guideStack;
  MTLTexture *v14;
  MTLTexture *v15;
  MTLTexture *guideStackTexture2DView;
  MTLTexture *v17;
  MTLTexture *alphaStack;
  MTLTexture *v19;
  MTLTexture *v20;
  MTLTexture *alphaStackTexture2DView;
  MTLTexture *v22;
  MTLTexture *mean_I;
  MTLTexture *v24;
  MTLTexture *mean_alpha;
  void *v26;
  void *v27;
  void *v28;
  NSArray *v29;
  NSArray *var_I;
  uint64_t v31;
  void *v32;
  uint64_t v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  NSArray *v38;
  NSArray *coefficients;
  uint64_t v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  NSArray *v49;
  NSArray *coefficientsTexture2DView;
  uint64_t v51;
  void *v52;
  void *v53;
  MTLTexture *v54;
  MTLTexture *constraints;
  MTLTexture *v56;
  MTLTexture *v57;
  MTLTexture *constraintsTexture2DView;
  void *v59;
  MTLTexture *v60;
  MTLTexture *tmp_RGBA;
  MTLTexture *v62;
  int v63;
  _QWORD v65[2];
  _QWORD v66[2];
  _QWORD v67[4];

  v67[3] = *MEMORY[0x1E0C80C00];
  v4 = *(_OWORD *)&a3->var0;
  *(_OWORD *)&self->config.temporalRadius = *(_OWORD *)&a3->var3;
  *(_OWORD *)&self->config.internalWidth = v4;
  if (-[XMattingRGBDFilter _compileShadersWithLibrary:](self, "_compileShadersWithLibrary:", self->_library)
    || (v5 = -[XMattingBoxTensorFilter initWithDevice:library:]([XMattingBoxTensorFilter alloc], "initWithDevice:library:", self->_device, self->_library), boxTensorFilter = self->boxTensorFilter, self->boxTensorFilter = v5, boxTensorFilter, (v7 = self->boxTensorFilter) == 0)|| -[XMattingBoxTensorFilter allocateResources:](v7, "allocateResources:", *(_QWORD *)&self->config.spatialRadius))
  {
    v11 = 0;
    v9 = 0;
LABEL_27:
    -[XMattingRGBDFilter releaseResources](self, "releaseResources");
    v63 = -12786;
    goto LABEL_28;
  }
  objc_msgSend(MEMORY[0x1E0CC6BB0], "texture2DDescriptorWithPixelFormat:width:height:mipmapped:", 115, self->config.internalWidth, self->config.internalHeight, 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (!v8)
  {
    v11 = 0;
    goto LABEL_27;
  }
  objc_msgSend(v8, "setTextureType:", 3);
  objc_msgSend(v9, "setArrayLength:", self->config.arrayLength);
  objc_msgSend(v9, "setUsage:", 19);
  objc_msgSend(MEMORY[0x1E0CC6BB0], "texture2DDescriptorWithPixelFormat:width:height:mipmapped:", 25, self->config.internalWidth, self->config.internalHeight, 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (!v10)
    goto LABEL_27;
  objc_msgSend(v10, "setTextureType:", 3);
  objc_msgSend(v11, "setArrayLength:", self->config.arrayLength);
  objc_msgSend(v11, "setUsage:", 19);
  v12 = (MTLTexture *)-[MTLDevice newTextureWithDescriptor:](self->_device, "newTextureWithDescriptor:", v9);
  guideStack = self->_guideStack;
  self->_guideStack = v12;

  v14 = self->_guideStack;
  if (!v14)
    goto LABEL_27;
  v15 = (MTLTexture *)-[MTLTexture newTextureViewWithPixelFormat:textureType:levels:slices:](v14, "newTextureViewWithPixelFormat:textureType:levels:slices:", -[MTLTexture pixelFormat](self->_guideStack, "pixelFormat"), 2, 0, 1, 0, 1);
  guideStackTexture2DView = self->_guideStackTexture2DView;
  self->_guideStackTexture2DView = v15;

  if (!self->_guideStackTexture2DView)
    goto LABEL_27;
  v17 = (MTLTexture *)-[MTLDevice newTextureWithDescriptor:](self->_device, "newTextureWithDescriptor:", v11);
  alphaStack = self->_alphaStack;
  self->_alphaStack = v17;

  v19 = self->_alphaStack;
  if (!v19)
    goto LABEL_27;
  v20 = (MTLTexture *)-[MTLTexture newTextureViewWithPixelFormat:textureType:levels:slices:](v19, "newTextureViewWithPixelFormat:textureType:levels:slices:", -[MTLTexture pixelFormat](self->_alphaStack, "pixelFormat"), 2, 0, 1, 0, 1);
  alphaStackTexture2DView = self->_alphaStackTexture2DView;
  self->_alphaStackTexture2DView = v20;

  if (!self->_alphaStackTexture2DView)
    goto LABEL_27;
  v22 = (MTLTexture *)-[MTLDevice newTextureWithDescriptor:](self->_device, "newTextureWithDescriptor:", v9);
  mean_I = self->_mean_I;
  self->_mean_I = v22;

  if (!self->_mean_I)
    goto LABEL_27;
  v24 = (MTLTexture *)-[MTLDevice newTextureWithDescriptor:](self->_device, "newTextureWithDescriptor:", v11);
  mean_alpha = self->_mean_alpha;
  self->_mean_alpha = v24;

  if (!self->_mean_alpha)
    goto LABEL_27;
  v26 = (void *)-[MTLDevice newTextureWithDescriptor:](self->_device, "newTextureWithDescriptor:", v9);
  v67[0] = v26;
  v27 = (void *)-[MTLDevice newTextureWithDescriptor:](self->_device, "newTextureWithDescriptor:", v9);
  v67[1] = v27;
  v28 = (void *)-[MTLDevice newTextureWithDescriptor:](self->_device, "newTextureWithDescriptor:", v9);
  v67[2] = v28;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v67, 3);
  v29 = (NSArray *)objc_claimAutoreleasedReturnValue();
  var_I = self->_var_I;
  self->_var_I = v29;

  -[NSArray objectAtIndexedSubscript:](self->_var_I, "objectAtIndexedSubscript:", 0);
  v31 = objc_claimAutoreleasedReturnValue();
  if (!v31)
    goto LABEL_27;
  v32 = (void *)v31;
  -[NSArray objectAtIndexedSubscript:](self->_var_I, "objectAtIndexedSubscript:", 1);
  v33 = objc_claimAutoreleasedReturnValue();
  if (!v33)
  {

    goto LABEL_27;
  }
  v34 = (void *)v33;
  -[NSArray objectAtIndexedSubscript:](self->_var_I, "objectAtIndexedSubscript:", 2);
  v35 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v35)
    goto LABEL_27;
  v36 = (void *)-[MTLDevice newTextureWithDescriptor:](self->_device, "newTextureWithDescriptor:", v9);
  v66[0] = v36;
  v37 = (void *)-[MTLDevice newTextureWithDescriptor:](self->_device, "newTextureWithDescriptor:", v9);
  v66[1] = v37;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v66, 2);
  v38 = (NSArray *)objc_claimAutoreleasedReturnValue();
  coefficients = self->_coefficients;
  self->_coefficients = v38;

  -[NSArray objectAtIndexedSubscript:](self->_coefficients, "objectAtIndexedSubscript:", 0);
  v40 = objc_claimAutoreleasedReturnValue();
  if (!v40)
    goto LABEL_27;
  v41 = (void *)v40;
  -[NSArray objectAtIndexedSubscript:](self->_coefficients, "objectAtIndexedSubscript:", 1);
  v42 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v42)
    goto LABEL_27;
  -[NSArray objectAtIndexedSubscript:](self->_coefficients, "objectAtIndexedSubscript:", 0);
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSArray objectAtIndexedSubscript:](self->_coefficients, "objectAtIndexedSubscript:", 0);
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  v45 = (void *)objc_msgSend(v43, "newTextureViewWithPixelFormat:textureType:levels:slices:", objc_msgSend(v44, "pixelFormat"), 2, 0, 1, 0, 1);
  -[NSArray objectAtIndexedSubscript:](self->_coefficients, "objectAtIndexedSubscript:", 1, v45);
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSArray objectAtIndexedSubscript:](self->_coefficients, "objectAtIndexedSubscript:", 1);
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  v48 = (void *)objc_msgSend(v46, "newTextureViewWithPixelFormat:textureType:levels:slices:", objc_msgSend(v47, "pixelFormat"), 2, 0, 1, 0, 1);
  v65[1] = v48;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v65, 2);
  v49 = (NSArray *)objc_claimAutoreleasedReturnValue();
  coefficientsTexture2DView = self->_coefficientsTexture2DView;
  self->_coefficientsTexture2DView = v49;

  -[NSArray objectAtIndexedSubscript:](self->_coefficientsTexture2DView, "objectAtIndexedSubscript:", 0);
  v51 = objc_claimAutoreleasedReturnValue();
  if (!v51)
    goto LABEL_27;
  v52 = (void *)v51;
  -[NSArray objectAtIndexedSubscript:](self->_coefficientsTexture2DView, "objectAtIndexedSubscript:", 1);
  v53 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v53)
    goto LABEL_27;
  v54 = (MTLTexture *)-[MTLDevice newTextureWithDescriptor:](self->_device, "newTextureWithDescriptor:", v11);
  constraints = self->_constraints;
  self->_constraints = v54;

  v56 = self->_constraints;
  if (!v56)
    goto LABEL_27;
  v57 = (MTLTexture *)-[MTLTexture newTextureViewWithPixelFormat:textureType:levels:slices:](v56, "newTextureViewWithPixelFormat:textureType:levels:slices:", -[MTLTexture pixelFormat](self->_constraints, "pixelFormat"), 2, 0, 1, 0, 1);
  constraintsTexture2DView = self->_constraintsTexture2DView;
  self->_constraintsTexture2DView = v57;

  if (!self->_constraintsTexture2DView)
    goto LABEL_27;
  if (!self->_supportsReadWriteTextures)
  {
    v59 = (void *)objc_msgSend(v9, "copy");
    objc_msgSend(v59, "setTextureType:", 2);
    objc_msgSend(v59, "setArrayLength:", 1);
    v60 = (MTLTexture *)-[MTLDevice newTextureWithDescriptor:](self->_device, "newTextureWithDescriptor:", v59);
    tmp_RGBA = self->_tmp_RGBA;
    self->_tmp_RGBA = v60;

    v62 = self->_constraintsTexture2DView;
    if (!v62)
      goto LABEL_27;
  }
  v63 = 0;
LABEL_28:

  return v63;
}

- (void)releaseResources
{
  XMattingBoxTensorFilter *boxTensorFilter;
  MTLTexture *guideStack;
  MTLTexture *guideStackTexture2DView;
  MTLTexture *alphaStack;
  MTLTexture *alphaStackTexture2DView;
  MTLTexture *mean_I;
  MTLTexture *mean_alpha;
  NSArray *var_I;
  NSArray *coefficients;
  NSArray *coefficientsTexture2DView;
  MTLTexture *constraints;
  MTLTexture *constraintsTexture2DView;
  MTLTexture *tmp_RGBA;
  MTLComputePipelineState *nearestNeighborDownsamplingKernel;
  MTLComputePipelineState *halfToAlphaBLKernel;
  MTLComputePipelineState *computeInverted4DGuideCovarianceMatrixKernel;
  MTLComputePipelineState *compute4DCoefficientsKernel;
  MTLComputePipelineState *applyDepthAwareCoefficientsKernel;
  MTLComputePipelineState *applyDepthAwareCoefficientsNoConstraintsKernel;
  MTLComputePipelineState *applyDepthAwareCoefficientsSamplingKernel;
  MTLComputePipelineState *applyDepthAwareCoefficientsSamplingNoConstraintsKernel;

  boxTensorFilter = self->boxTensorFilter;
  self->boxTensorFilter = 0;

  guideStack = self->_guideStack;
  self->_guideStack = 0;

  guideStackTexture2DView = self->_guideStackTexture2DView;
  self->_guideStackTexture2DView = 0;

  alphaStack = self->_alphaStack;
  self->_alphaStack = 0;

  alphaStackTexture2DView = self->_alphaStackTexture2DView;
  self->_alphaStackTexture2DView = 0;

  mean_I = self->_mean_I;
  self->_mean_I = 0;

  mean_alpha = self->_mean_alpha;
  self->_mean_alpha = 0;

  var_I = self->_var_I;
  self->_var_I = 0;

  coefficients = self->_coefficients;
  self->_coefficients = 0;

  coefficientsTexture2DView = self->_coefficientsTexture2DView;
  self->_coefficientsTexture2DView = 0;

  constraints = self->_constraints;
  self->_constraints = 0;

  constraintsTexture2DView = self->_constraintsTexture2DView;
  self->_constraintsTexture2DView = 0;

  tmp_RGBA = self->_tmp_RGBA;
  self->_tmp_RGBA = 0;

  nearestNeighborDownsamplingKernel = self->_nearestNeighborDownsamplingKernel;
  self->_nearestNeighborDownsamplingKernel = 0;

  halfToAlphaBLKernel = self->_halfToAlphaBLKernel;
  self->_halfToAlphaBLKernel = 0;

  computeInverted4DGuideCovarianceMatrixKernel = self->_computeInverted4DGuideCovarianceMatrixKernel;
  self->_computeInverted4DGuideCovarianceMatrixKernel = 0;

  compute4DCoefficientsKernel = self->_compute4DCoefficientsKernel;
  self->_compute4DCoefficientsKernel = 0;

  applyDepthAwareCoefficientsKernel = self->_applyDepthAwareCoefficientsKernel;
  self->_applyDepthAwareCoefficientsKernel = 0;

  applyDepthAwareCoefficientsNoConstraintsKernel = self->_applyDepthAwareCoefficientsNoConstraintsKernel;
  self->_applyDepthAwareCoefficientsNoConstraintsKernel = 0;

  applyDepthAwareCoefficientsSamplingKernel = self->_applyDepthAwareCoefficientsSamplingKernel;
  self->_applyDepthAwareCoefficientsSamplingKernel = 0;

  applyDepthAwareCoefficientsSamplingNoConstraintsKernel = self->_applyDepthAwareCoefficientsSamplingNoConstraintsKernel;
  self->_applyDepthAwareCoefficientsSamplingNoConstraintsKernel = 0;

}

- (void)dealloc
{
  objc_super v3;

  -[XMattingRGBDFilter releaseResources](self, "releaseResources");
  v3.receiver = self;
  v3.super_class = (Class)XMattingRGBDFilter;
  -[XMattingRGBDFilter dealloc](&v3, sel_dealloc);
}

- (int)_compileShadersWithLibrary:(id)a3
{
  id v4;
  void *v5;
  MTLComputePipelineState *v6;
  MTLComputePipelineState *nearestNeighborDownsamplingKernel;
  const __CFString *v8;
  void *v9;
  MTLComputePipelineState *v10;
  MTLComputePipelineState *halfToAlphaBLKernel;
  MTLComputePipelineState *v12;
  MTLComputePipelineState *computeInverted4DGuideCovarianceMatrixKernel;
  MTLComputePipelineState *v14;
  MTLComputePipelineState *compute4DCoefficientsKernel;
  MTLComputePipelineState *v16;
  MTLComputePipelineState *applyDepthAwareCoefficientsKernel;
  MTLComputePipelineState *v18;
  MTLComputePipelineState *applyDepthAwareCoefficientsNoConstraintsKernel;
  MTLComputePipelineState *v20;
  MTLComputePipelineState *applyDepthAwareCoefficientsSamplingKernel;
  MTLComputePipelineState *v22;
  MTLComputePipelineState *applyDepthAwareCoefficientsSamplingNoConstraintsKernel;
  int v24;

  v4 = a3;
  v5 = (void *)-[MTLLibrary newFunctionWithName:](self->_library, "newFunctionWithName:", CFSTR("nearestNeighborDownsampling"));
  v6 = (MTLComputePipelineState *)-[MTLDevice newComputePipelineStateWithFunction:error:](self->_device, "newComputePipelineStateWithFunction:error:", v5, 0);
  nearestNeighborDownsamplingKernel = self->_nearestNeighborDownsamplingKernel;
  self->_nearestNeighborDownsamplingKernel = v6;

  if (!self->_nearestNeighborDownsamplingKernel)
    goto LABEL_15;
  if (self->_supportsReadWriteTextures)
    v8 = CFSTR("halfToAlphaBL_RWS");
  else
    v8 = CFSTR("halfToAlphaBL");
  v9 = (void *)objc_msgSend(v4, "newFunctionWithName:", v8);

  v10 = (MTLComputePipelineState *)-[MTLDevice newComputePipelineStateWithFunction:error:](self->_device, "newComputePipelineStateWithFunction:error:", v9, 0);
  halfToAlphaBLKernel = self->_halfToAlphaBLKernel;
  self->_halfToAlphaBLKernel = v10;

  if (!self->_halfToAlphaBLKernel)
    goto LABEL_16;
  v5 = (void *)-[MTLLibrary newFunctionWithName:](self->_library, "newFunctionWithName:", CFSTR("computeInverted4DGuideCovarianceMatrix"));

  v12 = (MTLComputePipelineState *)-[MTLDevice newComputePipelineStateWithFunction:error:](self->_device, "newComputePipelineStateWithFunction:error:", v5, 0);
  computeInverted4DGuideCovarianceMatrixKernel = self->_computeInverted4DGuideCovarianceMatrixKernel;
  self->_computeInverted4DGuideCovarianceMatrixKernel = v12;

  if (!self->_computeInverted4DGuideCovarianceMatrixKernel)
    goto LABEL_15;
  v9 = (void *)-[MTLLibrary newFunctionWithName:](self->_library, "newFunctionWithName:", CFSTR("compute4DCoefficients"));

  v14 = (MTLComputePipelineState *)-[MTLDevice newComputePipelineStateWithFunction:error:](self->_device, "newComputePipelineStateWithFunction:error:", v9, 0);
  compute4DCoefficientsKernel = self->_compute4DCoefficientsKernel;
  self->_compute4DCoefficientsKernel = v14;

  if (!self->_compute4DCoefficientsKernel)
  {
LABEL_16:
    v24 = -12786;
    goto LABEL_13;
  }
  v5 = (void *)-[MTLLibrary newFunctionWithName:](self->_library, "newFunctionWithName:", CFSTR("applyDepthAwareCoefficients"));

  v16 = (MTLComputePipelineState *)-[MTLDevice newComputePipelineStateWithFunction:error:](self->_device, "newComputePipelineStateWithFunction:error:", v5, 0);
  applyDepthAwareCoefficientsKernel = self->_applyDepthAwareCoefficientsKernel;
  self->_applyDepthAwareCoefficientsKernel = v16;

  if (!self->_applyDepthAwareCoefficientsKernel)
  {
LABEL_15:
    v24 = -12786;
    goto LABEL_14;
  }
  v9 = (void *)-[MTLLibrary newFunctionWithName:](self->_library, "newFunctionWithName:", CFSTR("applyDepthAwareCoefficientsNoConstraints"));

  v18 = (MTLComputePipelineState *)-[MTLDevice newComputePipelineStateWithFunction:error:](self->_device, "newComputePipelineStateWithFunction:error:", v9, 0);
  applyDepthAwareCoefficientsNoConstraintsKernel = self->_applyDepthAwareCoefficientsNoConstraintsKernel;
  self->_applyDepthAwareCoefficientsNoConstraintsKernel = v18;

  if (!self->_applyDepthAwareCoefficientsNoConstraintsKernel)
    goto LABEL_16;
  v5 = (void *)-[MTLLibrary newFunctionWithName:](self->_library, "newFunctionWithName:", CFSTR("applyDepthAwareCoefficientsSampling"));

  v20 = (MTLComputePipelineState *)-[MTLDevice newComputePipelineStateWithFunction:error:](self->_device, "newComputePipelineStateWithFunction:error:", v5, 0);
  applyDepthAwareCoefficientsSamplingKernel = self->_applyDepthAwareCoefficientsSamplingKernel;
  self->_applyDepthAwareCoefficientsSamplingKernel = v20;

  if (!self->_applyDepthAwareCoefficientsSamplingKernel)
    goto LABEL_15;
  v9 = (void *)-[MTLLibrary newFunctionWithName:](self->_library, "newFunctionWithName:", CFSTR("applyDepthAwareCoefficientsSamplingNoConstraints"));

  v22 = (MTLComputePipelineState *)-[MTLDevice newComputePipelineStateWithFunction:error:](self->_device, "newComputePipelineStateWithFunction:error:", v9, 0);
  applyDepthAwareCoefficientsSamplingNoConstraintsKernel = self->_applyDepthAwareCoefficientsSamplingNoConstraintsKernel;
  self->_applyDepthAwareCoefficientsSamplingNoConstraintsKernel = v22;

  if (!self->_applyDepthAwareCoefficientsSamplingKernel)
    goto LABEL_16;
  v24 = 0;
LABEL_13:
  v5 = v9;
LABEL_14:

  return v24;
}

- (void)encodePushOn:(id)a3 textureArray:(id)a4 texture:(id)a5
{
  id v7;
  id v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;

  v7 = a4;
  v8 = a5;
  objc_msgSend(a3, "blitCommandEncoder");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v7, "width");
  v11 = objc_msgSend(v7, "height");
  v12 = objc_msgSend(v7, "depth");
  if ((unint64_t)objc_msgSend(v7, "arrayLength") >= 2)
  {
    v13 = 1;
    do
    {
      v21 = 0;
      v22 = 0;
      v23 = 0;
      v18 = v10;
      v19 = v11;
      v20 = v12;
      v15 = 0;
      v16 = 0;
      v17 = 0;
      objc_msgSend(v9, "copyFromTexture:sourceSlice:sourceLevel:sourceOrigin:sourceSize:toTexture:destinationSlice:destinationLevel:destinationOrigin:", v7, v13, 0, &v21, &v18, v7, v13 - 1, 0, &v15);
      ++v13;
    }
    while (v13 < objc_msgSend(v7, "arrayLength"));
  }
  v14 = objc_msgSend(v7, "arrayLength");
  v21 = 0;
  v22 = 0;
  v23 = 0;
  v18 = v10;
  v19 = v11;
  v20 = v12;
  v15 = 0;
  v16 = 0;
  v17 = 0;
  objc_msgSend(v9, "copyFromTexture:sourceSlice:sourceLevel:sourceOrigin:sourceSize:toTexture:destinationSlice:destinationLevel:destinationOrigin:", v8, 0, 0, &v21, &v18, v7, v14 - 1, 0, &v15);
  objc_msgSend(v9, "endEncoding");

}

- (int)encodeDisparityToAlphaOn:(id)a3 disparityTexture:(id)a4 destinationTexture:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  int v16;
  int v17;
  int v18;
  _QWORD v20[3];
  _QWORD v21[3];

  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (!self->_supportsReadWriteTextures)
  {
    objc_msgSend(v8, "blitCommandEncoder");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "copyFromTexture:toTexture:", v10, self->_tmp_RGBA);
    objc_msgSend(v11, "endEncoding");

  }
  objc_msgSend(v8, "computeCommandEncoder");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v12;
  if (v12)
  {
    objc_msgSend(v12, "setLabel:", CFSTR("encodeDisparityToAlphaOn"));
    v14 = objc_msgSend(v9, "pixelFormat");
    if (v14 == 25 || v14 == 10)
    {
      objc_msgSend(v13, "setComputePipelineState:", self->_halfToAlphaBLKernel);
      objc_msgSend(v13, "setTexture:atIndex:", v9, 0);
      if (self->_supportsReadWriteTextures)
      {
        v15 = 1;
      }
      else
      {
        objc_msgSend(v13, "setTexture:atIndex:", self->_tmp_RGBA, 1);
        v15 = 2;
      }
      objc_msgSend(v13, "setTexture:atIndex:", v10, v15);
      v17 = -[MTLComputePipelineState threadExecutionWidth](self->_halfToAlphaBLKernel, "threadExecutionWidth");
      v18 = (int)-[MTLComputePipelineState maxTotalThreadsPerThreadgroup](self->_halfToAlphaBLKernel, "maxTotalThreadsPerThreadgroup")/ v17;
      v21[0] = (int)(v17 + objc_msgSend(v10, "width") - 1) / v17;
      v21[1] = (int)(v18 + objc_msgSend(v10, "height") - 1) / v18;
      v21[2] = 1;
      v20[0] = v17;
      v20[1] = v18;
      v20[2] = 1;
      objc_msgSend(v13, "dispatchThreadgroups:threadsPerThreadgroup:", v21, v20);
      objc_msgSend(v13, "endEncoding");
      v16 = 0;
    }
    else
    {
      v16 = -12780;
    }
  }
  else
  {
    v16 = -1;
  }

  return v16;
}

- (int)encodeNearestNeighborDownSamplingOn:(id)a3 inputTexture:(id)a4 outputTexture:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  int v12;
  int v13;
  int v14;
  _QWORD v16[3];
  _QWORD v17[3];

  v8 = a4;
  v9 = a5;
  objc_msgSend(a3, "computeCommandEncoder");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (v10)
  {
    objc_msgSend(v10, "setLabel:", CFSTR("nearestNeighborDownsamplingKernel"));
    objc_msgSend(v11, "setComputePipelineState:", self->_nearestNeighborDownsamplingKernel);
    objc_msgSend(v11, "setTexture:atIndex:", v8, 0);
    objc_msgSend(v11, "setTexture:atIndex:", v9, 1);
    v12 = -[MTLComputePipelineState threadExecutionWidth](self->_nearestNeighborDownsamplingKernel, "threadExecutionWidth");
    v13 = (int)-[MTLComputePipelineState maxTotalThreadsPerThreadgroup](self->_nearestNeighborDownsamplingKernel, "maxTotalThreadsPerThreadgroup")/ v12;
    v17[0] = (int)(v12 + objc_msgSend(v9, "width") - 1) / v12;
    v17[1] = (int)(v13 + objc_msgSend(v9, "height") - 1) / v13;
    v17[2] = 1;
    v16[0] = v12;
    v16[1] = v13;
    v16[2] = 1;
    objc_msgSend(v11, "dispatchThreadgroups:threadsPerThreadgroup:", v17, v16);
    objc_msgSend(v11, "endEncoding");
    v14 = 0;
  }
  else
  {
    v14 = -1;
  }

  return v14;
}

- (int)encodeCoefficientsOn:(id)a3 guideStack:(id)a4 alphaStack:(id)a5 mean_I:(id)a6 var_I:(id)a7 coefficients:(id)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  id v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t i;
  void *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  id v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t j;
  void *v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  int v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  int v52;
  id v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t k;
  int v58;
  id v60;
  id v61;
  id v62;
  void *v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  _QWORD v68[3];
  _QWORD v69[3];
  __int128 v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  _BYTE v78[128];
  _BYTE v79[128];
  _BYTE v80[128];
  uint64_t v81;

  v81 = *MEMORY[0x1E0C80C00];
  v14 = a3;
  v15 = a4;
  v16 = a5;
  v17 = a6;
  v18 = a7;
  v19 = a8;
  v20 = objc_msgSend(v15, "width");
  if (v20 != objc_msgSend(v16, "width")
    || (v21 = objc_msgSend(v15, "height"), v21 != objc_msgSend(v16, "height"))
    || (v22 = objc_msgSend(v15, "arrayLength"), v22 != objc_msgSend(v16, "arrayLength"))
    || (v23 = objc_msgSend(v15, "width"), v23 != objc_msgSend(v17, "width"))
    || (v24 = objc_msgSend(v15, "height"), v24 != objc_msgSend(v17, "height"))
    || (v25 = objc_msgSend(v15, "arrayLength"), v25 != objc_msgSend(v17, "arrayLength"))
    || objc_msgSend(v18, "count") != 3)
  {
    v58 = -12780;
    goto LABEL_44;
  }
  v62 = v16;
  v63 = v19;
  v76 = 0u;
  v77 = 0u;
  v74 = 0u;
  v75 = 0u;
  v61 = v18;
  v26 = v18;
  v27 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v74, v80, 16);
  if (v27)
  {
    v28 = v27;
    v29 = *(_QWORD *)v75;
    while (2)
    {
      for (i = 0; i != v28; ++i)
      {
        if (*(_QWORD *)v75 != v29)
          objc_enumerationMutation(v26);
        v31 = *(void **)(*((_QWORD *)&v74 + 1) + 8 * i);
        v32 = objc_msgSend(v31, "width");
        if (v32 == objc_msgSend(v15, "width"))
        {
          v33 = objc_msgSend(v31, "height");
          if (v33 == objc_msgSend(v15, "height"))
          {
            v34 = objc_msgSend(v31, "arrayLength");
            if (v34 == objc_msgSend(v15, "arrayLength"))
              continue;
          }
        }
        v58 = -12780;
        v46 = v26;
        v16 = v62;
        goto LABEL_42;
      }
      v28 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v74, v80, 16);
      if (v28)
        continue;
      break;
    }
  }

  v19 = v63;
  if (objc_msgSend(v63, "count") != 2)
  {
    v58 = -12780;
    v18 = v61;
    v16 = v62;
    goto LABEL_44;
  }
  v60 = v17;
  v72 = 0u;
  v73 = 0u;
  v70 = 0u;
  v71 = 0u;
  v35 = v63;
  v36 = objc_msgSend(v35, "countByEnumeratingWithState:objects:count:", &v70, v79, 16);
  if (v36)
  {
    v37 = v36;
    v38 = *(_QWORD *)v71;
    while (2)
    {
      for (j = 0; j != v37; ++j)
      {
        if (*(_QWORD *)v71 != v38)
          objc_enumerationMutation(v35);
        v40 = *(void **)(*((_QWORD *)&v70 + 1) + 8 * j);
        v41 = objc_msgSend(v40, "width", v60);
        if (v41 == objc_msgSend(v15, "width"))
        {
          v42 = objc_msgSend(v40, "height");
          if (v42 == objc_msgSend(v15, "height"))
          {
            v43 = objc_msgSend(v40, "arrayLength");
            if (v43 == objc_msgSend(v15, "arrayLength"))
              continue;
          }
        }
        v58 = -12780;
        v46 = v35;
        goto LABEL_41;
      }
      v37 = objc_msgSend(v35, "countByEnumeratingWithState:objects:count:", &v70, v79, 16);
      if (v37)
        continue;
      break;
    }
  }

  v44 = -[XMattingBoxTensorFilter encodeOnCommandBuffer:sourceTexture:destinationTexture:](self->boxTensorFilter, "encodeOnCommandBuffer:sourceTexture:destinationTexture:", v14, self->_alphaStack, self->_mean_alpha);
  if (v44)
  {
    v58 = v44;
    v16 = v62;
    v17 = v60;
  }
  else
  {
    objc_msgSend(v14, "computeCommandEncoder");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = v62;
    v17 = v60;
    if (v45)
    {
      v46 = v45;
      objc_msgSend(v45, "setLabel:", CFSTR("compute4DCoefficientsKernel"));
      objc_msgSend(v46, "setComputePipelineState:", self->_compute4DCoefficientsKernel);
      objc_msgSend(v46, "setTexture:atIndex:", v15, 0);
      objc_msgSend(v46, "setTexture:atIndex:", v62, 1);
      objc_msgSend(v46, "setTexture:atIndex:", v60, 2);
      objc_msgSend(v46, "setTexture:atIndex:", self->_mean_alpha, 3);
      objc_msgSend(v26, "objectAtIndexedSubscript:", 0);
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v46, "setTexture:atIndex:", v47, 4);

      objc_msgSend(v26, "objectAtIndexedSubscript:", 1);
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v46, "setTexture:atIndex:", v48, 5);

      objc_msgSend(v26, "objectAtIndexedSubscript:", 2);
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v46, "setTexture:atIndex:", v49, 6);

      objc_msgSend(v35, "objectAtIndexedSubscript:", 0);
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v46, "setTexture:atIndex:", v50, 7);

      objc_msgSend(v35, "objectAtIndexedSubscript:", 1);
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v46, "setTexture:atIndex:", v51, 8);

      objc_msgSend(v46, "setBytes:length:atIndex:", &self->config.spatialRadius, 4, 0);
      LODWORD(v51) = -[MTLComputePipelineState threadExecutionWidth](self->_compute4DCoefficientsKernel, "threadExecutionWidth");
      v52 = (int)-[MTLComputePipelineState maxTotalThreadsPerThreadgroup](self->_compute4DCoefficientsKernel, "maxTotalThreadsPerThreadgroup")/ (int)v51;
      v69[0] = (int)((_DWORD)v51 + objc_msgSend(v15, "width") - 1) / (int)v51;
      v69[1] = (int)(v52 + objc_msgSend(v15, "height") - 1) / v52;
      v69[2] = 1;
      v68[0] = (int)v51;
      v68[1] = v52;
      v68[2] = 1;
      objc_msgSend(v46, "dispatchThreadgroups:threadsPerThreadgroup:", v69, v68);
      objc_msgSend(v46, "endEncoding");
      v66 = 0u;
      v67 = 0u;
      v64 = 0u;
      v65 = 0u;
      v53 = v35;
      v54 = objc_msgSend(v53, "countByEnumeratingWithState:objects:count:", &v64, v78, 16);
      if (v54)
      {
        v55 = v54;
        v56 = *(_QWORD *)v65;
        do
        {
          for (k = 0; k != v55; ++k)
          {
            if (*(_QWORD *)v65 != v56)
              objc_enumerationMutation(v53);
            -[XMattingBoxTensorFilter encodeOnCommandBuffer:sourceTexture:destinationTexture:](self->boxTensorFilter, "encodeOnCommandBuffer:sourceTexture:destinationTexture:", v14, *(_QWORD *)(*((_QWORD *)&v64 + 1) + 8 * k), *(_QWORD *)(*((_QWORD *)&v64 + 1) + 8 * k), v60);
          }
          v55 = objc_msgSend(v53, "countByEnumeratingWithState:objects:count:", &v64, v78, 16);
        }
        while (v55);
      }

      v58 = 0;
LABEL_41:
      v16 = v62;
      v17 = v60;
LABEL_42:
      v18 = v61;

      goto LABEL_43;
    }
    v58 = -1;
  }
  v18 = v61;
LABEL_43:
  v19 = v63;
LABEL_44:

  return v58;
}

- (int)encodeStateOn:(id)a3 colorGuide:(id)a4 disparityGuide:(id)a5 initialSegmentation:(id)a6 constraints:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  NSArray *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t i;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  int v29;
  int v30;
  NSArray *v31;
  void *v32;
  void *v33;
  void *v34;
  int v35;
  int v36;
  int v37;
  MTLTexture *constraintsTexture2DView;
  int v39;
  MTLTexture *constraints;
  id v42;
  void *v43;
  _QWORD v44[3];
  _QWORD v45[3];
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  _BYTE v50[128];
  uint64_t v51;

  v51 = *MEMORY[0x1E0C80C00];
  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  v43 = v13;
  if (objc_msgSend(v13, "textureType") == 2
    && objc_msgSend(v14, "textureType") == 2
    && (!v15 || objc_msgSend(v15, "textureType") == 2)
    && (!v16 || objc_msgSend(v16, "textureType") == 2)
    && (v17 = -[MTLTexture width](self->_guideStack, "width"), v17 == -[MTLTexture width](self->_mean_I, "width"))
    && (v18 = -[MTLTexture height](self->_guideStack, "height"), v18 == -[MTLTexture height](self->_mean_I, "height"))
    && (v19 = -[MTLTexture arrayLength](self->_guideStack, "arrayLength"),
        v19 == -[MTLTexture arrayLength](self->_mean_I, "arrayLength"))
    && -[NSArray count](self->_var_I, "count") == 3)
  {
    v42 = v14;
    v48 = 0u;
    v49 = 0u;
    v46 = 0u;
    v47 = 0u;
    v20 = self->_var_I;
    v21 = -[NSArray countByEnumeratingWithState:objects:count:](v20, "countByEnumeratingWithState:objects:count:", &v46, v50, 16);
    if (v21)
    {
      v22 = v21;
      v23 = *(_QWORD *)v47;
      while (2)
      {
        for (i = 0; i != v22; ++i)
        {
          if (*(_QWORD *)v47 != v23)
            objc_enumerationMutation(v20);
          v25 = *(void **)(*((_QWORD *)&v46 + 1) + 8 * i);
          v26 = objc_msgSend(v25, "width", v42);
          if (v26 == -[MTLTexture width](self->_guideStack, "width"))
          {
            v27 = objc_msgSend(v25, "height");
            if (v27 == -[MTLTexture height](self->_guideStack, "height"))
            {
              v28 = objc_msgSend(v25, "arrayLength");
              if (v28 == -[MTLTexture arrayLength](self->_guideStack, "arrayLength"))
                continue;
            }
          }
          v39 = -12780;
          v14 = v42;
          goto LABEL_31;
        }
        v22 = -[NSArray countByEnumeratingWithState:objects:count:](v20, "countByEnumeratingWithState:objects:count:", &v46, v50, 16);
        if (v22)
          continue;
        break;
      }
    }

    v29 = -[XMattingRGBDFilter encodeNearestNeighborDownSamplingOn:inputTexture:outputTexture:](self, "encodeNearestNeighborDownSamplingOn:inputTexture:outputTexture:", v12, v43, self->_guideStackTexture2DView);
    if (v29)
    {
      v39 = v29;
      v14 = v42;
    }
    else
    {
      v14 = v42;
      v30 = -[XMattingRGBDFilter encodeDisparityToAlphaOn:disparityTexture:destinationTexture:](self, "encodeDisparityToAlphaOn:disparityTexture:destinationTexture:", v12, v42, self->_guideStackTexture2DView);
      if (v30)
      {
        v39 = v30;
      }
      else
      {
        -[XMattingBoxTensorFilter encodeOnCommandBuffer:sourceTexture:destinationTexture:](self->boxTensorFilter, "encodeOnCommandBuffer:sourceTexture:destinationTexture:", v12, self->_guideStack, self->_mean_I);
        objc_msgSend(v12, "computeCommandEncoder");
        v31 = (NSArray *)objc_claimAutoreleasedReturnValue();
        if (v31)
        {
          v20 = v31;
          -[NSArray setLabel:](v31, "setLabel:", CFSTR("computeInverted4DGuideCovarianceMatrixKernel"));
          -[NSArray setComputePipelineState:](v20, "setComputePipelineState:", self->_computeInverted4DGuideCovarianceMatrixKernel);
          -[NSArray setTexture:atIndex:](v20, "setTexture:atIndex:", self->_guideStack, 0);
          -[NSArray setTexture:atIndex:](v20, "setTexture:atIndex:", self->_mean_I, 1);
          -[NSArray objectAtIndexedSubscript:](self->_var_I, "objectAtIndexedSubscript:", 0);
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSArray setTexture:atIndex:](v20, "setTexture:atIndex:", v32, 2);

          -[NSArray objectAtIndexedSubscript:](self->_var_I, "objectAtIndexedSubscript:", 1);
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSArray setTexture:atIndex:](v20, "setTexture:atIndex:", v33, 3);

          -[NSArray objectAtIndexedSubscript:](self->_var_I, "objectAtIndexedSubscript:", 2);
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSArray setTexture:atIndex:](v20, "setTexture:atIndex:", v34, 4);

          -[NSArray setBytes:length:atIndex:](v20, "setBytes:length:atIndex:", &self->config.epsilon, 4, 0);
          -[NSArray setBytes:length:atIndex:](v20, "setBytes:length:atIndex:", &self->config.spatialRadius, 4, 1);
          LODWORD(v34) = -[MTLComputePipelineState threadExecutionWidth](self->_computeInverted4DGuideCovarianceMatrixKernel, "threadExecutionWidth");
          v35 = (int)-[MTLComputePipelineState maxTotalThreadsPerThreadgroup](self->_computeInverted4DGuideCovarianceMatrixKernel, "maxTotalThreadsPerThreadgroup")/ (int)v34;
          v36 = (int)((_DWORD)v34 + -[MTLTexture width](self->_guideStack, "width") - 1) / (int)v34;
          v37 = -[MTLTexture height](self->_guideStack, "height");
          v45[0] = v36;
          v45[1] = (v35 + v37 - 1) / v35;
          v45[2] = 1;
          v44[0] = (int)v34;
          v44[1] = v35;
          v44[2] = 1;
          -[NSArray dispatchThreadgroups:threadsPerThreadgroup:](v20, "dispatchThreadgroups:threadsPerThreadgroup:", v45, v44);
          -[NSArray endEncoding](v20, "endEncoding");
          if (v15)
            -[XMattingRGBDFilter encodeNearestNeighborDownSamplingOn:inputTexture:outputTexture:](self, "encodeNearestNeighborDownSamplingOn:inputTexture:outputTexture:", v12, v15, self->_alphaStackTexture2DView);
          constraintsTexture2DView = self->_constraintsTexture2DView;
          if (v16)
          {
            -[XMattingRGBDFilter encodeNearestNeighborDownSamplingOn:inputTexture:outputTexture:](self, "encodeNearestNeighborDownSamplingOn:inputTexture:outputTexture:", v12, v16, constraintsTexture2DView);
          }
          else
          {
            self->_constraintsTexture2DView = 0;

            constraints = self->_constraints;
            self->_constraints = 0;

          }
          v14 = v42;
          v39 = 0;
          self->stateComputed = 1;
LABEL_31:

        }
        else
        {
          v39 = -1;
        }
      }
    }
  }
  else
  {
    v39 = -12780;
  }

  return v39;
}

- (int)encodeStepOn:(id)a3
{
  id v4;
  int v5;
  int v6;

  v4 = a3;
  v5 = -[XMattingRGBDFilter encodeCoefficientsOn:guideStack:alphaStack:mean_I:var_I:coefficients:](self, "encodeCoefficientsOn:guideStack:alphaStack:mean_I:var_I:coefficients:", v4, self->_guideStack, self->_alphaStack, self->_mean_I, self->_var_I, self->_coefficients);
  if (!v5)
    v5 = -[XMattingRGBDFilter encodeApplyCoefficientsOn:colorGuide:disparityGuide:constraints:destinationAlphaTexture:](self, "encodeApplyCoefficientsOn:colorGuide:disparityGuide:constraints:destinationAlphaTexture:", v4, self->_guideStackTexture2DView, 0, self->_constraintsTexture2DView, self->_alphaStackTexture2DView);
  v6 = v5;

  return v6;
}

- (int)encodeApplyCoefficientsOn:(id)a3 colorGuide:(id)a4 disparityGuide:(id)a5 constraints:(id)a6 destinationAlphaTexture:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  NSArray *v17;
  uint64_t v18;
  uint64_t v19;
  _BOOL4 v20;
  uint64_t v21;
  uint64_t v22;
  _BOOL4 v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  int v31;
  _QWORD *v32;
  _QWORD *v33;
  void *v34;
  void *v35;
  void *v36;
  int v37;
  id v38;
  int v39;
  int v40;
  uint64_t v41;
  void *v42;
  void *v43;
  id v44;
  int v45;
  uint64_t v46;
  void *v47;
  void *v48;
  void *v49;
  int v50;
  int v51;
  _QWORD v53[3];
  _QWORD v54[3];
  _QWORD v55[3];
  _QWORD v56[3];
  _QWORD v57[3];
  _QWORD v58[3];
  _QWORD v59[3];
  _QWORD v60[4];

  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  v17 = self->_coefficientsTexture2DView;
  if (objc_msgSend(v13, "textureType") != 2
    || v14 && objc_msgSend(v14, "textureType") != 2
    || v15 && objc_msgSend(v15, "textureType") != 2
    || objc_msgSend(v16, "textureType") != 2)
  {
    v51 = -12780;
    goto LABEL_29;
  }
  v18 = objc_msgSend(v13, "width");
  if (v18 == objc_msgSend(v16, "width"))
  {
    v19 = objc_msgSend(v13, "height");
    v20 = v19 != objc_msgSend(v16, "height");
    if (v14)
      goto LABEL_9;
LABEL_13:
    v23 = 0;
    if (!v15)
      goto LABEL_20;
    goto LABEL_14;
  }
  v20 = 1;
  if (!v14)
    goto LABEL_13;
LABEL_9:
  v21 = objc_msgSend(v14, "width");
  if (v21 == objc_msgSend(v16, "width"))
  {
    v22 = objc_msgSend(v14, "height");
    v23 = v22 != objc_msgSend(v16, "height");
    if (!v15)
    {
LABEL_20:
      if (!v20 && !v23)
      {
        objc_msgSend(v12, "computeCommandEncoder");
        v47 = (void *)objc_claimAutoreleasedReturnValue();
        if (v47)
        {
          v28 = v47;
          objc_msgSend(v47, "setLabel:", CFSTR("applyDepthAwareCoefficientsNoConstraintsKernel"));
          objc_msgSend(v28, "setComputePipelineState:", self->_applyDepthAwareCoefficientsNoConstraintsKernel);
          -[NSArray objectAtIndexedSubscript:](v17, "objectAtIndexedSubscript:", 0);
          v48 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v28, "setTexture:atIndex:", v48, 0);

          -[NSArray objectAtIndexedSubscript:](v17, "objectAtIndexedSubscript:", 1);
          v49 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v28, "setTexture:atIndex:", v49, 1);

          objc_msgSend(v28, "setTexture:atIndex:", v13, 2);
          objc_msgSend(v28, "setTexture:atIndex:", v14, 3);
          objc_msgSend(v28, "setTexture:atIndex:", v16, 4);
          LODWORD(v49) = -[MTLComputePipelineState threadExecutionWidth](self->_applyDepthAwareCoefficientsNoConstraintsKernel, "threadExecutionWidth");
          v50 = (int)-[MTLComputePipelineState maxTotalThreadsPerThreadgroup](self->_applyDepthAwareCoefficientsNoConstraintsKernel, "maxTotalThreadsPerThreadgroup")/ (int)v49;
          v58[0] = (int)((_DWORD)v49 + objc_msgSend(v16, "width") - 1) / (int)v49;
          v58[1] = (int)(v50 + objc_msgSend(v16, "height") - 1) / v50;
          v58[2] = 1;
          v57[0] = (int)v49;
          v57[1] = v50;
          v57[2] = 1;
          v32 = v58;
          v33 = v57;
          goto LABEL_28;
        }
        goto LABEL_31;
      }
LABEL_21:
      objc_msgSend(v12, "computeCommandEncoder");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      v28 = v34;
      if (v15)
      {
        if (v34)
        {
          objc_msgSend(v34, "setLabel:", CFSTR("applyDepthAwareCoefficientsSamplingKernel"));
          objc_msgSend(v28, "setComputePipelineState:", self->_applyDepthAwareCoefficientsSamplingKernel);
          -[NSArray objectAtIndexedSubscript:](v17, "objectAtIndexedSubscript:", 0);
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v28, "setTexture:atIndex:", v35, 0);

          -[NSArray objectAtIndexedSubscript:](v17, "objectAtIndexedSubscript:", 1);
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v28, "setTexture:atIndex:", v36, 1);

          objc_msgSend(v28, "setTexture:atIndex:", v13, 2);
          objc_msgSend(v28, "setTexture:atIndex:", v14, 3);
          objc_msgSend(v28, "setTexture:atIndex:", v15, 4);
          objc_msgSend(v28, "setTexture:atIndex:", v16, 5);
          objc_msgSend(v28, "setTexture:atIndex:", v16, 6);
          LODWORD(v36) = -[MTLComputePipelineState threadExecutionWidth](self->_applyDepthAwareCoefficientsSamplingKernel, "threadExecutionWidth");
          v37 = (int)-[MTLComputePipelineState maxTotalThreadsPerThreadgroup](self->_applyDepthAwareCoefficientsSamplingKernel, "maxTotalThreadsPerThreadgroup")/ (int)v36;
          v38 = v12;
          v39 = (int)((_DWORD)v36 + objc_msgSend(v16, "width") - 1) / (int)v36;
          v40 = objc_msgSend(v16, "height");
          v41 = v39;
          v12 = v38;
          v56[0] = v41;
          v56[1] = (v37 + v40 - 1) / v37;
          v56[2] = 1;
          v55[0] = (int)v36;
          v55[1] = v37;
          v55[2] = 1;
          v32 = v56;
          v33 = v55;
          goto LABEL_28;
        }
      }
      else if (v34)
      {
        objc_msgSend(v34, "setLabel:", CFSTR("applyDepthAwareCoefficientsSamplingNoConstraintsKernel"));
        objc_msgSend(v28, "setComputePipelineState:", self->_applyDepthAwareCoefficientsSamplingNoConstraintsKernel);
        -[NSArray objectAtIndexedSubscript:](v17, "objectAtIndexedSubscript:", 0);
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v28, "setTexture:atIndex:", v42, 0);

        -[NSArray objectAtIndexedSubscript:](v17, "objectAtIndexedSubscript:", 1);
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v28, "setTexture:atIndex:", v43, 1);

        objc_msgSend(v28, "setTexture:atIndex:", v13, 2);
        objc_msgSend(v28, "setTexture:atIndex:", v14, 3);
        objc_msgSend(v28, "setTexture:atIndex:", v16, 4);
        LODWORD(v43) = -[MTLComputePipelineState threadExecutionWidth](self->_applyDepthAwareCoefficientsSamplingNoConstraintsKernel, "threadExecutionWidth");
        v44 = v12;
        v45 = (int)-[MTLComputePipelineState maxTotalThreadsPerThreadgroup](self->_applyDepthAwareCoefficientsSamplingNoConstraintsKernel, "maxTotalThreadsPerThreadgroup")/ (int)v43;
        v54[0] = (int)((_DWORD)v43 + objc_msgSend(v16, "width") - 1) / (int)v43;
        v54[1] = (int)(v45 + objc_msgSend(v16, "height") - 1) / v45;
        v54[2] = 1;
        v46 = v45;
        v12 = v44;
        v53[0] = (int)v43;
        v53[1] = v46;
        v53[2] = 1;
        v32 = v54;
        v33 = v53;
        goto LABEL_28;
      }
LABEL_31:
      v51 = -1;
      goto LABEL_29;
    }
  }
  else
  {
    v23 = 1;
    if (!v15)
      goto LABEL_20;
  }
LABEL_14:
  v24 = objc_msgSend(v15, "width");
  if (v24 != objc_msgSend(v13, "width"))
    goto LABEL_21;
  v25 = objc_msgSend(v15, "height");
  v26 = objc_msgSend(v13, "height");
  if (v20 || v23 || v25 != v26)
    goto LABEL_21;
  objc_msgSend(v12, "computeCommandEncoder");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v27)
    goto LABEL_31;
  v28 = v27;
  objc_msgSend(v27, "setLabel:", CFSTR("applyDepthAwareCoefficientsKernel"));
  objc_msgSend(v28, "setComputePipelineState:", self->_applyDepthAwareCoefficientsKernel);
  -[NSArray objectAtIndexedSubscript:](v17, "objectAtIndexedSubscript:", 0);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "setTexture:atIndex:", v29, 0);

  -[NSArray objectAtIndexedSubscript:](v17, "objectAtIndexedSubscript:", 1);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "setTexture:atIndex:", v30, 1);

  objc_msgSend(v28, "setTexture:atIndex:", v13, 2);
  objc_msgSend(v28, "setTexture:atIndex:", v14, 3);
  objc_msgSend(v28, "setTexture:atIndex:", v15, 4);
  objc_msgSend(v28, "setTexture:atIndex:", v16, 5);
  LODWORD(v30) = -[MTLComputePipelineState threadExecutionWidth](self->_applyDepthAwareCoefficientsKernel, "threadExecutionWidth");
  v31 = (int)-[MTLComputePipelineState maxTotalThreadsPerThreadgroup](self->_applyDepthAwareCoefficientsKernel, "maxTotalThreadsPerThreadgroup")/ (int)v30;
  v60[0] = (int)((_DWORD)v30 + objc_msgSend(v16, "width") - 1) / (int)v30;
  v60[1] = (int)(v31 + objc_msgSend(v16, "height") - 1) / v31;
  v60[2] = 1;
  v59[0] = (int)v30;
  v59[1] = v31;
  v59[2] = 1;
  v32 = v60;
  v33 = v59;
LABEL_28:
  objc_msgSend(v28, "dispatchThreadgroups:threadsPerThreadgroup:", v32, v33);
  objc_msgSend(v28, "endEncoding");

  v51 = 0;
LABEL_29:

  return v51;
}

- (int)encodeUpsampleOn:(id)a3 segmentation:(id)a4 colorGuide:(id)a5 disparityGuide:(id)a6 outputMatte:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  int v16;
  int v17;

  v12 = a3;
  v13 = a5;
  v14 = a6;
  v15 = a7;
  v16 = -[XMattingRGBDFilter encodeStateOn:colorGuide:disparityGuide:initialSegmentation:constraints:](self, "encodeStateOn:colorGuide:disparityGuide:initialSegmentation:constraints:", v12, v13, v14, a4, 0);
  if (!v16)
  {
    v16 = -[XMattingRGBDFilter encodeCoefficientsOn:guideStack:alphaStack:mean_I:var_I:coefficients:](self, "encodeCoefficientsOn:guideStack:alphaStack:mean_I:var_I:coefficients:", v12, self->_guideStack, self->_alphaStack, self->_mean_I, self->_var_I, self->_coefficients);
    if (!v16)
      v16 = -[XMattingRGBDFilter encodeApplyCoefficientsOn:colorGuide:disparityGuide:constraints:destinationAlphaTexture:](self, "encodeApplyCoefficientsOn:colorGuide:disparityGuide:constraints:destinationAlphaTexture:", v12, v13, v14, 0, v15);
  }
  v17 = v16;

  return v17;
}

- (XMattingBoxTensorFilter)boxTensorFilter
{
  return (XMattingBoxTensorFilter *)objc_getProperty(self, a2, 200, 1);
}

- (void)setBoxTensorFilter:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 200);
}

- ($53C07DD1BF241965B24C8E9E4ED7E53D)config
{
  $53C07DD1BF241965B24C8E9E4ED7E53D *result;

  objc_copyStruct(retstr, &self->config, 28, 1, 0);
  return result;
}

- (void)setConfig:(id *)a3
{
  objc_copyStruct(&self->config, a3, 28, 1, 0);
}

- (BOOL)stateComputed
{
  return self->stateComputed;
}

- (BOOL)coefficientsComputed
{
  return self->coefficientsComputed;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->boxTensorFilter, 0);
  objc_storeStrong((id *)&self->_tmp_RGBA, 0);
  objc_storeStrong((id *)&self->_applyDepthAwareCoefficientsSamplingNoConstraintsKernel, 0);
  objc_storeStrong((id *)&self->_applyDepthAwareCoefficientsSamplingKernel, 0);
  objc_storeStrong((id *)&self->_applyDepthAwareCoefficientsNoConstraintsKernel, 0);
  objc_storeStrong((id *)&self->_applyDepthAwareCoefficientsKernel, 0);
  objc_storeStrong((id *)&self->_compute4DCoefficientsKernel, 0);
  objc_storeStrong((id *)&self->_computeInverted4DGuideCovarianceMatrixKernel, 0);
  objc_storeStrong((id *)&self->_halfToAlphaBLKernel, 0);
  objc_storeStrong((id *)&self->_nearestNeighborDownsamplingKernel, 0);
  objc_storeStrong((id *)&self->_constraintsTexture2DView, 0);
  objc_storeStrong((id *)&self->_constraints, 0);
  objc_storeStrong((id *)&self->_coefficientsTexture2DView, 0);
  objc_storeStrong((id *)&self->_coefficients, 0);
  objc_storeStrong((id *)&self->_var_I, 0);
  objc_storeStrong((id *)&self->_mean_alpha, 0);
  objc_storeStrong((id *)&self->_mean_I, 0);
  objc_storeStrong((id *)&self->_alphaStackTexture2DView, 0);
  objc_storeStrong((id *)&self->_alphaStack, 0);
  objc_storeStrong((id *)&self->_guideStackTexture2DView, 0);
  objc_storeStrong((id *)&self->_guideStack, 0);
  objc_storeStrong((id *)&self->_library, 0);
  objc_storeStrong((id *)&self->_device, 0);
}

@end
