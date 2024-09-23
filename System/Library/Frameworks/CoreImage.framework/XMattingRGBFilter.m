@implementation XMattingRGBFilter

- (XMattingRGBFilter)initWithDevice:(id)a3 library:(id)a4
{
  id v7;
  id v8;
  XMattingRGBFilter *v9;
  XMattingRGBFilter *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)XMattingRGBFilter;
  v9 = -[XMattingRGBFilter init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_device, a3);
    objc_storeStrong((id *)&v10->_library, a4);
    *(_WORD *)&v10->stateComputed = 0;
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
  NSArray *v28;
  NSArray *var_I;
  uint64_t v30;
  void *v31;
  void *v32;
  MTLTexture *v33;
  MTLTexture *coefficients;
  MTLTexture *v35;
  MTLTexture *v36;
  MTLTexture *coefficientsTexture2DView;
  MTLTexture *v38;
  MTLTexture *constraints;
  MTLTexture *v40;
  MTLTexture *v41;
  MTLTexture *constraintsTexture2DView;
  int v43;
  _QWORD v45[3];

  v45[2] = *MEMORY[0x1E0C80C00];
  v4 = *(_OWORD *)&a3->var0;
  *(_OWORD *)&self->config.temporalRadius = *(_OWORD *)&a3->var3;
  *(_OWORD *)&self->config.internalWidth = v4;
  if (-[XMattingRGBFilter _compileShadersWithLibrary:](self, "_compileShadersWithLibrary:", self->_library)
    || (v5 = -[XMattingBoxTensorFilter initWithDevice:library:]([XMattingBoxTensorFilter alloc], "initWithDevice:library:", self->_device, self->_library), boxTensorFilter = self->boxTensorFilter, self->boxTensorFilter = v5, boxTensorFilter, (v7 = self->boxTensorFilter) == 0)|| -[XMattingBoxTensorFilter allocateResources:](v7, "allocateResources:", *(_QWORD *)&self->config.spatialRadius))
  {
    v11 = 0;
    v9 = 0;
LABEL_21:
    -[XMattingRGBFilter releaseResources](self, "releaseResources");
    v43 = -12786;
    goto LABEL_22;
  }
  objc_msgSend(MEMORY[0x1E0CC6BB0], "texture2DDescriptorWithPixelFormat:width:height:mipmapped:", 115, self->config.internalWidth, self->config.internalHeight, 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (!v8)
  {
    v11 = 0;
    goto LABEL_21;
  }
  objc_msgSend(v8, "setTextureType:", 3);
  objc_msgSend(v9, "setArrayLength:", self->config.arrayLength);
  objc_msgSend(v9, "setUsage:", 19);
  objc_msgSend(MEMORY[0x1E0CC6BB0], "texture2DDescriptorWithPixelFormat:width:height:mipmapped:", 25, self->config.internalWidth, self->config.internalHeight, 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (!v10)
    goto LABEL_21;
  objc_msgSend(v10, "setTextureType:", 3);
  objc_msgSend(v11, "setArrayLength:", self->config.arrayLength);
  objc_msgSend(v11, "setUsage:", 19);
  v12 = (MTLTexture *)-[MTLDevice newTextureWithDescriptor:](self->_device, "newTextureWithDescriptor:", v9);
  guideStack = self->_guideStack;
  self->_guideStack = v12;

  v14 = self->_guideStack;
  if (!v14)
    goto LABEL_21;
  v15 = (MTLTexture *)-[MTLTexture newTextureViewWithPixelFormat:textureType:levels:slices:](v14, "newTextureViewWithPixelFormat:textureType:levels:slices:", -[MTLTexture pixelFormat](self->_guideStack, "pixelFormat"), 2, 0, 1, 0, 1);
  guideStackTexture2DView = self->_guideStackTexture2DView;
  self->_guideStackTexture2DView = v15;

  if (!self->_guideStackTexture2DView)
    goto LABEL_21;
  v17 = (MTLTexture *)-[MTLDevice newTextureWithDescriptor:](self->_device, "newTextureWithDescriptor:", v11);
  alphaStack = self->_alphaStack;
  self->_alphaStack = v17;

  v19 = self->_alphaStack;
  if (!v19)
    goto LABEL_21;
  v20 = (MTLTexture *)-[MTLTexture newTextureViewWithPixelFormat:textureType:levels:slices:](v19, "newTextureViewWithPixelFormat:textureType:levels:slices:", -[MTLTexture pixelFormat](self->_alphaStack, "pixelFormat"), 2, 0, 1, 0, 1);
  alphaStackTexture2DView = self->_alphaStackTexture2DView;
  self->_alphaStackTexture2DView = v20;

  if (!self->_alphaStackTexture2DView)
    goto LABEL_21;
  v22 = (MTLTexture *)-[MTLDevice newTextureWithDescriptor:](self->_device, "newTextureWithDescriptor:", v9);
  mean_I = self->_mean_I;
  self->_mean_I = v22;

  if (!self->_mean_I)
    goto LABEL_21;
  v24 = (MTLTexture *)-[MTLDevice newTextureWithDescriptor:](self->_device, "newTextureWithDescriptor:", v11);
  mean_alpha = self->_mean_alpha;
  self->_mean_alpha = v24;

  if (!self->_mean_alpha)
    goto LABEL_21;
  v26 = (void *)-[MTLDevice newTextureWithDescriptor:](self->_device, "newTextureWithDescriptor:", v9);
  v45[0] = v26;
  v27 = (void *)-[MTLDevice newTextureWithDescriptor:](self->_device, "newTextureWithDescriptor:", v9);
  v45[1] = v27;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v45, 2);
  v28 = (NSArray *)objc_claimAutoreleasedReturnValue();
  var_I = self->_var_I;
  self->_var_I = v28;

  -[NSArray objectAtIndexedSubscript:](self->_var_I, "objectAtIndexedSubscript:", 0);
  v30 = objc_claimAutoreleasedReturnValue();
  if (!v30)
    goto LABEL_21;
  v31 = (void *)v30;
  -[NSArray objectAtIndexedSubscript:](self->_var_I, "objectAtIndexedSubscript:", 1);
  v32 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v32)
    goto LABEL_21;
  v33 = (MTLTexture *)-[MTLDevice newTextureWithDescriptor:](self->_device, "newTextureWithDescriptor:", v9);
  coefficients = self->_coefficients;
  self->_coefficients = v33;

  v35 = self->_coefficients;
  if (!v35)
    goto LABEL_21;
  v36 = (MTLTexture *)-[MTLTexture newTextureViewWithPixelFormat:textureType:levels:slices:](v35, "newTextureViewWithPixelFormat:textureType:levels:slices:", -[MTLTexture pixelFormat](self->_coefficients, "pixelFormat"), 2, 0, 1, 0, 1);
  coefficientsTexture2DView = self->_coefficientsTexture2DView;
  self->_coefficientsTexture2DView = v36;

  if (!self->_coefficientsTexture2DView)
    goto LABEL_21;
  v38 = (MTLTexture *)-[MTLDevice newTextureWithDescriptor:](self->_device, "newTextureWithDescriptor:", v11);
  constraints = self->_constraints;
  self->_constraints = v38;

  v40 = self->_constraints;
  if (!v40)
    goto LABEL_21;
  v41 = (MTLTexture *)-[MTLTexture newTextureViewWithPixelFormat:textureType:levels:slices:](v40, "newTextureViewWithPixelFormat:textureType:levels:slices:", -[MTLTexture pixelFormat](self->_constraints, "pixelFormat"), 2, 0, 1, 0, 1);
  constraintsTexture2DView = self->_constraintsTexture2DView;
  self->_constraintsTexture2DView = v41;

  if (!self->_constraintsTexture2DView)
    goto LABEL_21;
  v43 = 0;
LABEL_22:

  return v43;
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
  MTLTexture *coefficients;
  MTLTexture *coefficientsTexture2DView;
  MTLTexture *constraints;
  MTLTexture *constraintsTexture2DView;
  MTLComputePipelineState *nearestNeighborDownsamplingKernel;
  MTLComputePipelineState *computeInverted3DGuideCovarianceMatrixKernel;
  MTLComputePipelineState *compute3DCoefficientsKernel;
  MTLComputePipelineState *applyCoefficientsKernel;
  MTLComputePipelineState *applyCoefficientsSamplingKernel;

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

  nearestNeighborDownsamplingKernel = self->_nearestNeighborDownsamplingKernel;
  self->_nearestNeighborDownsamplingKernel = 0;

  computeInverted3DGuideCovarianceMatrixKernel = self->_computeInverted3DGuideCovarianceMatrixKernel;
  self->_computeInverted3DGuideCovarianceMatrixKernel = 0;

  compute3DCoefficientsKernel = self->_compute3DCoefficientsKernel;
  self->_compute3DCoefficientsKernel = 0;

  applyCoefficientsKernel = self->_applyCoefficientsKernel;
  self->_applyCoefficientsKernel = 0;

  applyCoefficientsSamplingKernel = self->_applyCoefficientsSamplingKernel;
  self->_applyCoefficientsSamplingKernel = 0;

}

- (void)dealloc
{
  objc_super v3;

  -[XMattingRGBFilter releaseResources](self, "releaseResources");
  v3.receiver = self;
  v3.super_class = (Class)XMattingRGBFilter;
  -[XMattingRGBFilter dealloc](&v3, sel_dealloc);
}

- (int)_compileShadersWithLibrary:(id)a3
{
  id v4;
  void *v5;
  MTLComputePipelineState *v6;
  MTLComputePipelineState *nearestNeighborDownsamplingKernel;
  void *v8;
  MTLComputePipelineState *v9;
  MTLComputePipelineState *computeInverted3DGuideCovarianceMatrixKernel;
  MTLComputePipelineState *v11;
  MTLComputePipelineState *compute3DCoefficientsKernel;
  MTLComputePipelineState *v13;
  MTLComputePipelineState *applyCoefficientsKernel;
  MTLComputePipelineState *v15;
  MTLComputePipelineState *applyCoefficientsSamplingKernel;
  int v17;

  v4 = a3;
  v5 = (void *)objc_msgSend(v4, "newFunctionWithName:", CFSTR("nearestNeighborDownsampling"));
  v6 = (MTLComputePipelineState *)-[MTLDevice newComputePipelineStateWithFunction:error:](self->_device, "newComputePipelineStateWithFunction:error:", v5, 0);
  nearestNeighborDownsamplingKernel = self->_nearestNeighborDownsamplingKernel;
  self->_nearestNeighborDownsamplingKernel = v6;

  if (!self->_nearestNeighborDownsamplingKernel)
    goto LABEL_8;
  v8 = (void *)objc_msgSend(v4, "newFunctionWithName:", CFSTR("computeInverted3DGuideCovarianceMatrix"));

  v9 = (MTLComputePipelineState *)-[MTLDevice newComputePipelineStateWithFunction:error:](self->_device, "newComputePipelineStateWithFunction:error:", v8, 0);
  computeInverted3DGuideCovarianceMatrixKernel = self->_computeInverted3DGuideCovarianceMatrixKernel;
  self->_computeInverted3DGuideCovarianceMatrixKernel = v9;

  if (!self->_computeInverted3DGuideCovarianceMatrixKernel)
    goto LABEL_9;
  v5 = (void *)objc_msgSend(v4, "newFunctionWithName:", CFSTR("compute3DCoefficients"));

  v11 = (MTLComputePipelineState *)-[MTLDevice newComputePipelineStateWithFunction:error:](self->_device, "newComputePipelineStateWithFunction:error:", v5, 0);
  compute3DCoefficientsKernel = self->_compute3DCoefficientsKernel;
  self->_compute3DCoefficientsKernel = v11;

  if (!self->_compute3DCoefficientsKernel)
  {
LABEL_8:
    v17 = -12786;
    goto LABEL_7;
  }
  v8 = (void *)objc_msgSend(v4, "newFunctionWithName:", CFSTR("applyCoefficients"));

  v13 = (MTLComputePipelineState *)-[MTLDevice newComputePipelineStateWithFunction:error:](self->_device, "newComputePipelineStateWithFunction:error:", v8, 0);
  applyCoefficientsKernel = self->_applyCoefficientsKernel;
  self->_applyCoefficientsKernel = v13;

  if (!self->_applyCoefficientsKernel)
  {
LABEL_9:
    v17 = -12786;
    v5 = v8;
    goto LABEL_7;
  }
  v5 = (void *)objc_msgSend(v4, "newFunctionWithName:", CFSTR("applyCoefficientsSampling"));

  v15 = (MTLComputePipelineState *)-[MTLDevice newComputePipelineStateWithFunction:error:](self->_device, "newComputePipelineStateWithFunction:error:", v5, 0);
  applyCoefficientsSamplingKernel = self->_applyCoefficientsSamplingKernel;
  self->_applyCoefficientsSamplingKernel = v15;

  if (!self->_applyCoefficientsSamplingKernel)
    goto LABEL_8;
  v17 = 0;
LABEL_7:

  return v17;
}

- (void)encodeNearestNeighborDownSamplingOn:(id)a3 inputTexture:(id)a4 outputTexture:(id)a5
{
  id v8;
  id v9;
  void *v10;
  int v11;
  int v12;
  _QWORD v13[3];
  _QWORD v14[3];

  v8 = a5;
  v9 = a4;
  objc_msgSend(a3, "computeCommandEncoder");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setComputePipelineState:", self->_nearestNeighborDownsamplingKernel);
  objc_msgSend(v10, "setTexture:atIndex:", v9, 0);

  objc_msgSend(v10, "setTexture:atIndex:", v8, 1);
  LODWORD(a3) = -[MTLComputePipelineState threadExecutionWidth](self->_nearestNeighborDownsamplingKernel, "threadExecutionWidth");
  v11 = (int)-[MTLComputePipelineState maxTotalThreadsPerThreadgroup](self->_nearestNeighborDownsamplingKernel, "maxTotalThreadsPerThreadgroup")/ (int)a3;
  v12 = (int)((_DWORD)a3 + objc_msgSend(v8, "width") - 1) / (int)a3;
  LODWORD(self) = objc_msgSend(v8, "height");

  v14[0] = v12;
  v14[1] = (v11 + (int)self - 1) / v11;
  v14[2] = 1;
  v13[0] = (int)a3;
  v13[1] = v11;
  v13[2] = 1;
  objc_msgSend(v10, "dispatchThreadgroups:threadsPerThreadgroup:", v14, v13);
  objc_msgSend(v10, "endEncoding");

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
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  int v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  int v43;
  uint64_t v44;
  int v45;
  void *v47;
  void *v48;
  void *v49;
  _QWORD v50[3];
  _QWORD v51[3];
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  _BYTE v56[128];
  uint64_t v57;

  v57 = *MEMORY[0x1E0C80C00];
  v14 = a3;
  v15 = a4;
  v16 = a5;
  v17 = a6;
  v18 = a7;
  v19 = a8;
  v47 = v18;
  if (!self->stateComputed)
  {
    v45 = -12782;
    goto LABEL_33;
  }
  if (objc_msgSend(v15, "textureType") != 3)
    goto LABEL_34;
  if (objc_msgSend(v16, "textureType") != 3)
    goto LABEL_34;
  if (objc_msgSend(v17, "textureType") != 3)
    goto LABEL_34;
  v20 = objc_msgSend(v15, "width");
  if (v20 != objc_msgSend(v16, "width"))
    goto LABEL_34;
  v21 = objc_msgSend(v15, "height");
  if (v21 != objc_msgSend(v16, "height"))
    goto LABEL_34;
  v22 = objc_msgSend(v15, "arrayLength");
  if (v22 != objc_msgSend(v16, "arrayLength"))
    goto LABEL_34;
  v23 = objc_msgSend(v15, "width");
  if (v23 != objc_msgSend(v17, "width"))
    goto LABEL_34;
  v24 = objc_msgSend(v15, "height");
  if (v24 != objc_msgSend(v17, "height"))
    goto LABEL_34;
  v25 = objc_msgSend(v15, "arrayLength");
  if (v25 != objc_msgSend(v17, "arrayLength") || objc_msgSend(v18, "count") != 2)
    goto LABEL_34;
  v48 = v19;
  v49 = v14;
  v54 = 0u;
  v55 = 0u;
  v52 = 0u;
  v53 = 0u;
  v26 = v18;
  v27 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v52, v56, 16);
  if (v27)
  {
    v28 = v27;
    v29 = *(_QWORD *)v53;
    while (2)
    {
      for (i = 0; i != v28; ++i)
      {
        if (*(_QWORD *)v53 != v29)
          objc_enumerationMutation(v26);
        v31 = *(void **)(*((_QWORD *)&v52 + 1) + 8 * i);
        v32 = objc_msgSend(v31, "width");
        if (v32 == objc_msgSend(v15, "width"))
        {
          v33 = objc_msgSend(v31, "height");
          if (v33 == objc_msgSend(v15, "height"))
          {
            v34 = objc_msgSend(v31, "arrayLength");
            if (v34 == objc_msgSend(v15, "arrayLength") && objc_msgSend(v31, "textureType") == 3)
              continue;
          }
        }
        v45 = -12780;
        v19 = v48;
        goto LABEL_31;
      }
      v28 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v52, v56, 16);
      if (v28)
        continue;
      break;
    }
  }

  v19 = v48;
  if (objc_msgSend(v48, "textureType") == 3)
  {
    v35 = objc_msgSend(v48, "width");
    v14 = v49;
    if (v35 == objc_msgSend(v15, "width"))
    {
      v36 = objc_msgSend(v48, "height");
      if (v36 == objc_msgSend(v15, "height"))
      {
        v37 = objc_msgSend(v48, "arrayLength");
        if (v37 == objc_msgSend(v15, "arrayLength"))
        {
          v38 = -[XMattingBoxTensorFilter encodeOnCommandBuffer:sourceTexture:destinationTexture:](self->boxTensorFilter, "encodeOnCommandBuffer:sourceTexture:destinationTexture:", v49, self->_alphaStack, self->_mean_alpha);
          if (v38)
          {
            v45 = v38;
            goto LABEL_33;
          }
          objc_msgSend(v49, "computeCommandEncoder");
          v39 = (void *)objc_claimAutoreleasedReturnValue();
          if (!v39)
          {
            v45 = -1;
            goto LABEL_33;
          }
          v40 = v39;
          objc_msgSend(v39, "setLabel:", CFSTR("compute3DCoefficientsKernel"));
          objc_msgSend(v40, "setComputePipelineState:", self->_compute3DCoefficientsKernel);
          objc_msgSend(v40, "setTexture:atIndex:", v15, 0);
          objc_msgSend(v40, "setTexture:atIndex:", v16, 1);
          objc_msgSend(v40, "setTexture:atIndex:", v17, 2);
          objc_msgSend(v40, "setTexture:atIndex:", self->_mean_alpha, 3);
          objc_msgSend(v26, "objectAtIndexedSubscript:", 0);
          v41 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v40, "setTexture:atIndex:", v41, 4);

          objc_msgSend(v26, "objectAtIndexedSubscript:", 1);
          v42 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v40, "setTexture:atIndex:", v42, 5);

          objc_msgSend(v40, "setTexture:atIndex:", v48, 6);
          objc_msgSend(v40, "setBytes:length:atIndex:", &self->config.spatialRadius, 4, 0);
          LODWORD(v42) = -[MTLComputePipelineState threadExecutionWidth](self->_compute3DCoefficientsKernel, "threadExecutionWidth");
          v43 = (int)-[MTLComputePipelineState maxTotalThreadsPerThreadgroup](self->_compute3DCoefficientsKernel, "maxTotalThreadsPerThreadgroup")/ (int)v42;
          v51[0] = (int)((_DWORD)v42 + objc_msgSend(v15, "width") - 1) / (int)v42;
          v51[1] = (int)(v43 + objc_msgSend(v15, "height") - 1) / v43;
          v51[2] = 1;
          v44 = v43;
          v19 = v48;
          v50[0] = (int)v42;
          v50[1] = v44;
          v50[2] = 1;
          objc_msgSend(v40, "dispatchThreadgroups:threadsPerThreadgroup:", v51, v50);
          objc_msgSend(v40, "endEncoding");
          -[XMattingBoxTensorFilter encodeOnCommandBuffer:sourceTexture:destinationTexture:](self->boxTensorFilter, "encodeOnCommandBuffer:sourceTexture:destinationTexture:", v49, v19, v19);
          v45 = 0;
          self->coefficientsComputed = 1;
          v26 = v40;
LABEL_31:

          goto LABEL_32;
        }
      }
    }
LABEL_34:
    v45 = -12780;
    goto LABEL_33;
  }
  v45 = -12780;
LABEL_32:
  v14 = v49;
LABEL_33:

  return v45;
}

- (int)encodeStateOn:(id)a3 colorGuide:(id)a4 disparityGuide:(id)a5 initialSegmentation:(id)a6 constraints:(id)a7
{
  id v11;
  id v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  NSArray *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t i;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  int v26;
  void *v27;
  void *v28;
  int v29;
  int v30;
  int v31;
  MTLTexture *constraintsTexture2DView;
  MTLTexture *constraints;
  id v35;
  _QWORD v36[3];
  _QWORD v37[3];
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  _BYTE v42[128];
  uint64_t v43;

  v43 = *MEMORY[0x1E0C80C00];
  v11 = a3;
  v35 = a4;
  v12 = a6;
  v13 = a7;
  if (-[MTLTexture textureType](self->_guideStack, "textureType") == 3
    && -[MTLTexture textureType](self->_mean_I, "textureType") == 3
    && (v14 = -[MTLTexture width](self->_guideStack, "width"), v14 == -[MTLTexture width](self->_mean_I, "width"))
    && (v15 = -[MTLTexture height](self->_guideStack, "height"), v15 == -[MTLTexture height](self->_mean_I, "height"))
    && (v16 = -[MTLTexture arrayLength](self->_guideStack, "arrayLength"),
        v16 == -[MTLTexture arrayLength](self->_mean_I, "arrayLength"))
    && -[NSArray count](self->_var_I, "count") == 2)
  {
    v40 = 0u;
    v41 = 0u;
    v38 = 0u;
    v39 = 0u;
    v17 = self->_var_I;
    v18 = -[NSArray countByEnumeratingWithState:objects:count:](v17, "countByEnumeratingWithState:objects:count:", &v38, v42, 16);
    if (v18)
    {
      v19 = v18;
      v20 = *(_QWORD *)v39;
      while (2)
      {
        for (i = 0; i != v19; ++i)
        {
          if (*(_QWORD *)v39 != v20)
            objc_enumerationMutation(v17);
          v22 = *(void **)(*((_QWORD *)&v38 + 1) + 8 * i);
          v23 = objc_msgSend(v22, "width");
          if (v23 == -[MTLTexture width](self->_guideStack, "width"))
          {
            v24 = objc_msgSend(v22, "height");
            if (v24 == -[MTLTexture height](self->_guideStack, "height"))
            {
              v25 = objc_msgSend(v22, "arrayLength");
              if (v25 == -[MTLTexture arrayLength](self->_guideStack, "arrayLength")
                && objc_msgSend(v22, "textureType") == 3)
              {
                continue;
              }
            }
          }
          v26 = -12780;
          goto LABEL_25;
        }
        v19 = -[NSArray countByEnumeratingWithState:objects:count:](v17, "countByEnumeratingWithState:objects:count:", &v38, v42, 16);
        if (v19)
          continue;
        break;
      }
    }

    -[XMattingRGBFilter encodeNearestNeighborDownSamplingOn:inputTexture:outputTexture:](self, "encodeNearestNeighborDownSamplingOn:inputTexture:outputTexture:", v11, v35, self->_guideStackTexture2DView);
    v26 = -[XMattingBoxTensorFilter encodeOnCommandBuffer:sourceTexture:destinationTexture:](self->boxTensorFilter, "encodeOnCommandBuffer:sourceTexture:destinationTexture:", v11, self->_guideStack, self->_mean_I);
    objc_msgSend(v11, "computeCommandEncoder");
    v17 = (NSArray *)objc_claimAutoreleasedReturnValue();
    -[NSArray setComputePipelineState:](v17, "setComputePipelineState:", self->_computeInverted3DGuideCovarianceMatrixKernel);
    -[NSArray setTexture:atIndex:](v17, "setTexture:atIndex:", self->_guideStack, 0);
    -[NSArray setTexture:atIndex:](v17, "setTexture:atIndex:", self->_mean_I, 1);
    -[NSArray objectAtIndexedSubscript:](self->_var_I, "objectAtIndexedSubscript:", 0);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSArray setTexture:atIndex:](v17, "setTexture:atIndex:", v27, 2);

    -[NSArray objectAtIndexedSubscript:](self->_var_I, "objectAtIndexedSubscript:", 1);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSArray setTexture:atIndex:](v17, "setTexture:atIndex:", v28, 3);

    -[NSArray setBytes:length:atIndex:](v17, "setBytes:length:atIndex:", &self->config.epsilon, 4, 0);
    -[NSArray setBytes:length:atIndex:](v17, "setBytes:length:atIndex:", &self->config.spatialRadius, 4, 1);
    LODWORD(v28) = -[MTLComputePipelineState threadExecutionWidth](self->_computeInverted3DGuideCovarianceMatrixKernel, "threadExecutionWidth");
    v29 = (int)-[MTLComputePipelineState maxTotalThreadsPerThreadgroup](self->_computeInverted3DGuideCovarianceMatrixKernel, "maxTotalThreadsPerThreadgroup")/ (int)v28;
    v30 = (int)((_DWORD)v28 + -[MTLTexture width](self->_guideStack, "width") - 1) / (int)v28;
    v31 = -[MTLTexture height](self->_guideStack, "height");
    v37[0] = v30;
    v37[1] = (v29 + v31 - 1) / v29;
    v37[2] = 1;
    v36[0] = (int)v28;
    v36[1] = v29;
    v36[2] = 1;
    -[NSArray dispatchThreadgroups:threadsPerThreadgroup:](v17, "dispatchThreadgroups:threadsPerThreadgroup:", v37, v36);
    -[NSArray endEncoding](v17, "endEncoding");
    if (v12)
      -[XMattingRGBFilter encodeNearestNeighborDownSamplingOn:inputTexture:outputTexture:](self, "encodeNearestNeighborDownSamplingOn:inputTexture:outputTexture:", v11, v12, self->_alphaStackTexture2DView);
    constraintsTexture2DView = self->_constraintsTexture2DView;
    if (v13)
    {
      -[XMattingRGBFilter encodeNearestNeighborDownSamplingOn:inputTexture:outputTexture:](self, "encodeNearestNeighborDownSamplingOn:inputTexture:outputTexture:", v11, v13, constraintsTexture2DView);
    }
    else
    {
      self->_constraintsTexture2DView = 0;

      constraints = self->_constraints;
      self->_constraints = 0;

    }
    self->stateComputed = 1;
LABEL_25:

  }
  else
  {
    v26 = -12780;
  }

  return v26;
}

- (int)encodeStepOn:(id)a3
{
  id v4;
  int v5;
  int v6;

  v4 = a3;
  v5 = -[XMattingRGBFilter encodeCoefficientsOn:guideStack:alphaStack:mean_I:var_I:coefficients:](self, "encodeCoefficientsOn:guideStack:alphaStack:mean_I:var_I:coefficients:", v4, self->_guideStack, self->_alphaStack, self->_mean_I, self->_var_I, self->_coefficients);
  if (!v5)
    v5 = -[XMattingRGBFilter encodeApplyCoefficientsOn:colorGuide:disparityGuide:constraints:destinationAlphaTexture:](self, "encodeApplyCoefficientsOn:colorGuide:disparityGuide:constraints:destinationAlphaTexture:", v4, self->_guideStackTexture2DView, 0, self->_constraintsTexture2DView, self->_alphaStackTexture2DView);
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
  MTLTexture *v17;
  MTLTexture *v18;
  uint64_t v19;
  uint64_t v20;
  _BOOL4 v21;
  uint64_t v22;
  uint64_t v23;
  _BOOL4 v24;
  id v25;
  void *v26;
  int v27;
  int v28;
  _QWORD *v29;
  _QWORD *v30;
  int v31;
  int v32;
  int v33;
  id v35;
  _QWORD v36[3];
  _QWORD v37[3];
  _QWORD v38[3];
  _QWORD v39[3];

  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  v17 = self->_coefficientsTexture2DView;
  v18 = v17;
  if (!self->coefficientsComputed)
  {
    v33 = -12782;
    goto LABEL_18;
  }
  if (-[MTLTexture textureType](v17, "textureType") != 2
    || objc_msgSend(v13, "textureType") != 2
    || v15 && objc_msgSend(v15, "textureType") != 2
    || objc_msgSend(v16, "textureType") != 2)
  {
    v33 = -12780;
    goto LABEL_18;
  }
  v19 = objc_msgSend(v13, "width");
  if (v19 == objc_msgSend(v16, "width"))
  {
    v20 = objc_msgSend(v13, "height");
    v21 = v20 != objc_msgSend(v16, "height");
  }
  else
  {
    v21 = 1;
  }
  v35 = v14;
  if (v15)
  {
    v22 = objc_msgSend(v15, "width");
    if (v22 != objc_msgSend(v13, "width"))
      goto LABEL_15;
    v23 = objc_msgSend(v15, "height");
    v24 = v23 != objc_msgSend(v13, "height");
  }
  else
  {
    v24 = 0;
  }
  if (!v21 && !v24)
  {
    v25 = v12;
    objc_msgSend(v12, "computeCommandEncoder");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "setComputePipelineState:", self->_applyCoefficientsKernel);
    objc_msgSend(v26, "setTexture:atIndex:", v18, 0);
    objc_msgSend(v26, "setTexture:atIndex:", v13, 1);
    objc_msgSend(v26, "setTexture:atIndex:", v15, 2);
    objc_msgSend(v26, "setTexture:atIndex:", v16, 3);
    v31 = -[MTLComputePipelineState threadExecutionWidth](self->_applyCoefficientsKernel, "threadExecutionWidth");
    v32 = (int)-[MTLComputePipelineState maxTotalThreadsPerThreadgroup](self->_applyCoefficientsKernel, "maxTotalThreadsPerThreadgroup")/ v31;
    v39[0] = (int)(v31 + objc_msgSend(v16, "width") - 1) / v31;
    v39[1] = (int)(v32 + objc_msgSend(v16, "height") - 1) / v32;
    v39[2] = 1;
    v38[0] = v31;
    v38[1] = v32;
    v38[2] = 1;
    v29 = v39;
    v30 = v38;
    goto LABEL_17;
  }
LABEL_15:
  v25 = v12;
  objc_msgSend(v12, "computeCommandEncoder");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "setComputePipelineState:", self->_applyCoefficientsSamplingKernel);
  objc_msgSend(v26, "setTexture:atIndex:", v18, 0);
  objc_msgSend(v26, "setTexture:atIndex:", v13, 1);
  objc_msgSend(v26, "setTexture:atIndex:", v15, 2);
  objc_msgSend(v26, "setTexture:atIndex:", v16, 3);
  v27 = -[MTLComputePipelineState threadExecutionWidth](self->_applyCoefficientsSamplingKernel, "threadExecutionWidth");
  v28 = (int)-[MTLComputePipelineState maxTotalThreadsPerThreadgroup](self->_applyCoefficientsSamplingKernel, "maxTotalThreadsPerThreadgroup")/ v27;
  v37[0] = (int)(v27 + objc_msgSend(v16, "width") - 1) / v27;
  v37[1] = (int)(v28 + objc_msgSend(v16, "height") - 1) / v28;
  v37[2] = 1;
  v36[0] = v27;
  v36[1] = v28;
  v36[2] = 1;
  v29 = v37;
  v30 = v36;
LABEL_17:
  objc_msgSend(v26, "dispatchThreadgroups:threadsPerThreadgroup:", v29, v30);
  objc_msgSend(v26, "endEncoding");

  v33 = 0;
  v14 = v35;
  v12 = v25;
LABEL_18:

  return v33;
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
  v16 = -[XMattingRGBFilter encodeStateOn:colorGuide:disparityGuide:initialSegmentation:constraints:](self, "encodeStateOn:colorGuide:disparityGuide:initialSegmentation:constraints:", v12, v13, v14, a4, 0);
  if (!v16)
  {
    v16 = -[XMattingRGBFilter encodeCoefficientsOn:guideStack:alphaStack:mean_I:var_I:coefficients:](self, "encodeCoefficientsOn:guideStack:alphaStack:mean_I:var_I:coefficients:", v12, self->_guideStack, self->_alphaStack, self->_mean_I, self->_var_I, self->_coefficients);
    if (!v16)
      v16 = -[XMattingRGBFilter encodeApplyCoefficientsOn:colorGuide:disparityGuide:constraints:destinationAlphaTexture:](self, "encodeApplyCoefficientsOn:colorGuide:disparityGuide:constraints:destinationAlphaTexture:", v12, v13, v14, 0, v15);
  }
  v17 = v16;

  return v17;
}

- (XMattingBoxTensorFilter)boxTensorFilter
{
  return (XMattingBoxTensorFilter *)objc_getProperty(self, a2, 160, 1);
}

- (void)setBoxTensorFilter:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 160);
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
  objc_storeStrong((id *)&self->_applyCoefficientsSamplingKernel, 0);
  objc_storeStrong((id *)&self->_applyCoefficientsKernel, 0);
  objc_storeStrong((id *)&self->_compute3DCoefficientsKernel, 0);
  objc_storeStrong((id *)&self->_computeInverted3DGuideCovarianceMatrixKernel, 0);
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
