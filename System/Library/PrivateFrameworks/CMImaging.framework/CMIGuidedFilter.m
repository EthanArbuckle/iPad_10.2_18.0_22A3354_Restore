@implementation CMIGuidedFilter

- (CMIGuidedFilter)initWithOptionalCommandQueue:(id)a3 allocator:(id)a4
{
  id v6;
  id v7;
  CMIGuidedFilter *v8;
  FigMetalContext *v9;
  void *v10;
  uint64_t v11;
  FigMetalContext *metal;
  FigMetalContext *v13;
  uint64_t v14;
  MTLComputePipelineState *calculateCoefficientsPipelineState;
  uint64_t v16;
  MTLComputePipelineState *filterCoefficientsPipelineState;
  uint64_t v18;
  MTLComputePipelineState *applyCoefficientsPipelineState;
  CMIGuidedFilter *v20;
  objc_super v22;

  v6 = a3;
  v7 = a4;
  v22.receiver = self;
  v22.super_class = (Class)CMIGuidedFilter;
  v8 = -[CMIGuidedFilter init](&v22, sel_init);
  if (!v8)
    goto LABEL_8;
  v9 = [FigMetalContext alloc];
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = -[FigMetalContext initWithbundle:andOptionalCommandQueue:](v9, "initWithbundle:andOptionalCommandQueue:", v10, v6);
  metal = v8->_metal;
  v8->_metal = (FigMetalContext *)v11;

  v13 = v8->_metal;
  if (!v13)
    goto LABEL_8;
  -[FigMetalContext setAllocator:](v13, "setAllocator:", v7);
  -[FigMetalContext computePipelineStateFor:constants:](v8->_metal, "computePipelineStateFor:constants:", CFSTR("CMIGuidedFilterCalculateCoefficients"), 0);
  v14 = objc_claimAutoreleasedReturnValue();
  calculateCoefficientsPipelineState = v8->_calculateCoefficientsPipelineState;
  v8->_calculateCoefficientsPipelineState = (MTLComputePipelineState *)v14;

  if (!v8->_calculateCoefficientsPipelineState)
    goto LABEL_8;
  -[FigMetalContext computePipelineStateFor:constants:](v8->_metal, "computePipelineStateFor:constants:", CFSTR("CMIGuidedFilterFilterCoefficients"), 0);
  v16 = objc_claimAutoreleasedReturnValue();
  filterCoefficientsPipelineState = v8->_filterCoefficientsPipelineState;
  v8->_filterCoefficientsPipelineState = (MTLComputePipelineState *)v16;

  if (!v8->_filterCoefficientsPipelineState)
    goto LABEL_8;
  -[FigMetalContext computePipelineStateFor:constants:](v8->_metal, "computePipelineStateFor:constants:", CFSTR("CMIGuidedFilterApplyCoefficients"), 0);
  v18 = objc_claimAutoreleasedReturnValue();
  applyCoefficientsPipelineState = v8->_applyCoefficientsPipelineState;
  v8->_applyCoefficientsPipelineState = (MTLComputePipelineState *)v18;

  if (v8->_applyCoefficientsPipelineState)
  {
    v20 = v8;
  }
  else
  {
LABEL_8:
    FigDebugAssert3();
    v20 = 0;
  }

  return v20;
}

+ (BOOL)isSingleChannelTexture:(id)a3
{
  id v3;
  BOOL v4;

  v3 = a3;
  v4 = objc_msgSend(v3, "pixelFormat") == 25
    || objc_msgSend(v3, "pixelFormat") == 55
    || objc_msgSend(v3, "pixelFormat") == 10
    || objc_msgSend(v3, "pixelFormat") == 20;

  return v4;
}

- (int)encodeToCommandBuffer:(id)a3 inputTexture:(id)a4 guideTexture:(id)a5 outputTexture:(id)a6 kernelRadius:(unint64_t)a7 epsilon:(float)a8
{
  id v14;
  id v15;
  id v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  void *v24;
  uint64_t v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  int v38;
  void *v40;
  int64x2_t v41;
  id v42;
  int64x2_t v43;
  uint64_t v44;
  _QWORD v45[3];
  int64x2_t v46;
  uint64_t v47;
  _QWORD v48[3];
  int64x2_t v49;
  uint64_t v50;
  _QWORD v51[3];
  BOOL v52;
  id v53;
  id v54;
  id v55;
  id v56;
  float v57;
  _QWORD v58[2];

  v42 = a3;
  v14 = a4;
  v15 = a5;
  v16 = a6;
  v58[0] = a7;
  v57 = a8;
  v55 = 0;
  v56 = 0;
  v53 = 0;
  v54 = 0;
  v17 = objc_msgSend(v14, "pixelFormat");
  if (v17 != objc_msgSend(v16, "pixelFormat"))
  {
    FigDebugAssert3();
    v38 = -12780;
    goto LABEL_9;
  }
  -[FigMetalContext allocator](self->_metal, "allocator");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = (void *)objc_msgSend(v18, "newTextureDescriptor");

  if (!v19)
  {
    FigDebugAssert3();
LABEL_13:
    v38 = -12786;
    goto LABEL_9;
  }
  objc_msgSend(v19, "desc");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "setTextureType:", 2);

  v21 = objc_msgSend(v15, "width");
  objc_msgSend(v19, "desc");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "setWidth:", v21);

  v23 = objc_msgSend(v15, "height");
  objc_msgSend(v19, "desc");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "setHeight:", v23);

  v25 = objc_msgSend(v14, "pixelFormat");
  objc_msgSend(v19, "desc");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "setPixelFormat:", v25);

  objc_msgSend(v19, "desc");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "setUsage:", 7);

  objc_msgSend(v19, "setLabel:", 0);
  -[FigMetalContext allocator](self->_metal, "allocator");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = (void *)objc_msgSend(v28, "newTextureWithDescriptor:", v19);
  v56 = v29;

  if (!v29)
    goto LABEL_12;
  objc_msgSend(v19, "setLabel:", 0);
  -[FigMetalContext allocator](self->_metal, "allocator");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = (void *)objc_msgSend(v30, "newTextureWithDescriptor:", v19);
  v54 = v31;

  if (!v31)
    goto LABEL_12;
  objc_msgSend(v19, "setLabel:", 0);
  -[FigMetalContext allocator](self->_metal, "allocator");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v33 = (void *)objc_msgSend(v32, "newTextureWithDescriptor:", v19);
  v55 = v33;

  if (!v33)
    goto LABEL_12;
  v40 = v33;
  objc_msgSend(v19, "setLabel:", 0);
  -[FigMetalContext allocator](self->_metal, "allocator");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v35 = (void *)objc_msgSend(v34, "newTextureWithDescriptor:", v19);
  v53 = v35;

  if (!v35
    || (v52 = +[CMIGuidedFilter isSingleChannelTexture:](CMIGuidedFilter, "isSingleChannelTexture:", v15),
        objc_msgSend(v42, "computeCommandEncoder"),
        (v36 = (void *)objc_claimAutoreleasedReturnValue()) == 0))
  {
LABEL_12:
    FigDebugAssert3();

    goto LABEL_13;
  }
  v37 = v36;
  objc_msgSend(v36, "setImageblockWidth:height:", 16, 16);
  objc_msgSend(v37, "setComputePipelineState:", self->_calculateCoefficientsPipelineState);
  objc_msgSend(v37, "setTexture:atIndex:", v14, 0);
  objc_msgSend(v37, "setTexture:atIndex:", v15, 1);
  objc_msgSend(v37, "setTexture:atIndex:", v29, 2);
  objc_msgSend(v37, "setTexture:atIndex:", v31, 3);
  objc_msgSend(v37, "setBytes:length:atIndex:", v58, 8, 0);
  objc_msgSend(v37, "setBytes:length:atIndex:", &v57, 4, 1);
  objc_msgSend(v37, "setBytes:length:atIndex:", &v52, 1, 2);
  v51[0] = objc_msgSend(v15, "width");
  v51[1] = objc_msgSend(v15, "height");
  v51[2] = 1;
  v41 = vdupq_n_s64(0x10uLL);
  v49 = v41;
  v50 = 1;
  objc_msgSend(v37, "dispatchThreads:threadsPerThreadgroup:", v51, &v49);
  objc_msgSend(v37, "setComputePipelineState:", self->_filterCoefficientsPipelineState);
  objc_msgSend(v37, "setTexture:atIndex:", v29, 0);
  objc_msgSend(v37, "setTexture:atIndex:", v31, 1);
  objc_msgSend(v37, "setTexture:atIndex:", v40, 2);
  objc_msgSend(v37, "setTexture:atIndex:", v35, 3);
  objc_msgSend(v37, "setBytes:length:atIndex:", v58, 8, 0);
  v48[0] = objc_msgSend(v15, "width");
  v48[1] = objc_msgSend(v15, "height");
  v48[2] = 1;
  v46 = v41;
  v47 = 1;
  objc_msgSend(v37, "dispatchThreads:threadsPerThreadgroup:", v48, &v46);
  objc_msgSend(v37, "setComputePipelineState:", self->_applyCoefficientsPipelineState);
  objc_msgSend(v37, "setTexture:atIndex:", v15, 0);
  objc_msgSend(v37, "setTexture:atIndex:", v40, 1);
  objc_msgSend(v37, "setTexture:atIndex:", v35, 2);
  objc_msgSend(v37, "setTexture:atIndex:", v16, 3);
  v45[0] = objc_msgSend(v16, "width");
  v45[1] = objc_msgSend(v16, "height");
  v45[2] = 1;
  v43 = v41;
  v44 = 1;
  objc_msgSend(v37, "dispatchThreads:threadsPerThreadgroup:", v45, &v43);
  objc_msgSend(v37, "endEncoding");

  v38 = 0;
LABEL_9:
  FigMetalDecRef(&v56);
  FigMetalDecRef(&v54);
  FigMetalDecRef(&v55);
  FigMetalDecRef(&v53);

  return v38;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_applyCoefficientsPipelineState, 0);
  objc_storeStrong((id *)&self->_filterCoefficientsPipelineState, 0);
  objc_storeStrong((id *)&self->_calculateCoefficientsPipelineState, 0);
  objc_storeStrong((id *)&self->_metal, 0);
}

@end
