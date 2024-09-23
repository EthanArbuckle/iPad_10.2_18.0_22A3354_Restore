@implementation CMIWarpStage

- (CMIWarpStage)initWithOptionalCommandQueue:(id)a3 allocator:(id)a4
{
  id v6;
  id v7;
  CMIWarpStage *v8;
  FigMetalContext *v9;
  void *v10;
  uint64_t v11;
  FigMetalContext *metal;
  FigMetalContext *v13;
  int v14;
  CMIWarpStage *v15;
  CMIWarpStage *v16;
  objc_super v18;

  v6 = a3;
  v7 = a4;
  v18.receiver = self;
  v18.super_class = (Class)CMIWarpStage;
  v8 = -[CMIWarpStage init](&v18, sel_init);
  if (!v8)
    goto LABEL_5;
  v9 = [FigMetalContext alloc];
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = -[FigMetalContext initWithbundle:andOptionalCommandQueue:](v9, "initWithbundle:andOptionalCommandQueue:", v10, v6);
  metal = v8->_metal;
  v8->_metal = (FigMetalContext *)v11;

  v13 = v8->_metal;
  if (!v13
    || (-[FigMetalContext setAllocator:](v13, "setAllocator:", v7),
        v14 = -[CMIWarpStage _compileShaders](v8, "_compileShaders"),
        v15 = v8,
        v14))
  {
LABEL_5:
    fig_log_get_emitter();
    FigDebugAssert3();
    v15 = 0;
  }
  v16 = v15;

  return v16;
}

- (int)_compileShaders
{
  void *v3;
  MTLComputePipelineState *v4;
  MTLComputePipelineState *warpPipeline;
  MTLComputePipelineState *v6;
  MTLComputePipelineState *warpWithGDCPipeline;
  MTLComputePipelineState *v8;
  MTLComputePipelineState *gdcPipeline;
  MTLComputePipelineState *v10;
  MTLComputePipelineState *gdcYUVPipeline;
  MTLComputePipelineState *v12;
  MTLComputePipelineState *inverseGDCPipeline;
  MTLComputePipelineState *v14;
  MTLComputePipelineState *inverseGDCYUVPipeline;
  MTLComputePipelineState *v16;
  MTLComputePipelineState *simpleDemosaicPipeline;
  int v18;
  char v20;

  v3 = (void *)objc_opt_new();
  if (v3)
  {
    -[FigMetalContext computePipelineStateFor:constants:](self->_metal, "computePipelineStateFor:constants:", CFSTR("CMIWarpCompute"), 0);
    v4 = (MTLComputePipelineState *)objc_claimAutoreleasedReturnValue();
    warpPipeline = self->_warpPipeline;
    self->_warpPipeline = v4;

    if (self->_warpPipeline
      && (-[FigMetalContext computePipelineStateFor:constants:](self->_metal, "computePipelineStateFor:constants:", CFSTR("CMIWarpGDCCompute"), 0), v6 = (MTLComputePipelineState *)objc_claimAutoreleasedReturnValue(), warpWithGDCPipeline = self->_warpWithGDCPipeline, self->_warpWithGDCPipeline = v6, warpWithGDCPipeline, self->_warpWithGDCPipeline))
    {
      v20 = 0;
      objc_msgSend(v3, "setConstantValue:type:atIndex:", &v20, 53, 0);
      -[FigMetalContext computePipelineStateFor:constants:](self->_metal, "computePipelineStateFor:constants:", CFSTR("CMIGDCCompute"), v3);
      v8 = (MTLComputePipelineState *)objc_claimAutoreleasedReturnValue();
      gdcPipeline = self->_gdcPipeline;
      self->_gdcPipeline = v8;

      if (self->_gdcPipeline)
      {
        -[FigMetalContext computePipelineStateFor:constants:](self->_metal, "computePipelineStateFor:constants:", CFSTR("CMIGDCComputeYUV"), v3);
        v10 = (MTLComputePipelineState *)objc_claimAutoreleasedReturnValue();
        gdcYUVPipeline = self->_gdcYUVPipeline;
        self->_gdcYUVPipeline = v10;

        if (self->_gdcYUVPipeline)
        {
          v20 = 1;
          objc_msgSend(v3, "setConstantValue:type:atIndex:", &v20, 53, 0);
          -[FigMetalContext computePipelineStateFor:constants:](self->_metal, "computePipelineStateFor:constants:", CFSTR("CMIGDCCompute"), v3);
          v12 = (MTLComputePipelineState *)objc_claimAutoreleasedReturnValue();
          inverseGDCPipeline = self->_inverseGDCPipeline;
          self->_inverseGDCPipeline = v12;

          if (self->_inverseGDCPipeline)
          {
            -[FigMetalContext computePipelineStateFor:constants:](self->_metal, "computePipelineStateFor:constants:", CFSTR("CMIGDCComputeYUV"), v3);
            v14 = (MTLComputePipelineState *)objc_claimAutoreleasedReturnValue();
            inverseGDCYUVPipeline = self->_inverseGDCYUVPipeline;
            self->_inverseGDCYUVPipeline = v14;

            if (self->_inverseGDCYUVPipeline)
            {
              -[FigMetalContext computePipelineStateFor:constants:](self->_metal, "computePipelineStateFor:constants:", CFSTR("CMISimpleDemosaic"), 0);
              v16 = (MTLComputePipelineState *)objc_claimAutoreleasedReturnValue();
              simpleDemosaicPipeline = self->_simpleDemosaicPipeline;
              self->_simpleDemosaicPipeline = v16;

              if (self->_simpleDemosaicPipeline)
                goto LABEL_9;
            }
          }
        }
      }
      fig_log_get_emitter();
    }
    else
    {
      fig_log_get_emitter();
    }
    FigDebugAssert3();
    v18 = FigSignalErrorAt();
    goto LABEL_10;
  }
  fig_log_get_emitter();
  FigDebugAssert3();
LABEL_9:
  v18 = 0;
LABEL_10:

  return v18;
}

- (uint64_t)runWarpUsingTransform:(uint64_t)a3 inputLumaTex:(uint64_t)a4 inputChromaTex:(uint64_t)a5 outputLumaTex:(uint64_t)a6 outputChromaTex:
{
  uint64_t v6;

  v6 = objc_msgSend(a1, "runWarpUsingTransform:inputLumaTex:inputChromaTex:outputLumaTex:outputChromaTex:inputFrameGDCParams:outputFrameGDCParams:", a3, a4, a5, a6, 0, 0);
  if ((_DWORD)v6)
  {
    fig_log_get_emitter();
    FigDebugAssert3();
  }
  return v6;
}

- (uint64_t)runWarpUsingTransform:(__n128)a3 inputLumaTex:(__n128)a4 inputChromaTex:(uint64_t)a5 outputLumaTex:(void *)a6 outputChromaTex:(void *)a7 inputFrameGDCParams:(void *)a8 outputFrameGDCParams:(void *)a9
{
  id v17;
  id v18;
  id v19;
  _BOOL4 v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  id v28;
  int64x2_t v29;
  id v30;
  _QWORD v31[3];
  int64x2_t v32;
  uint64_t v33;
  _QWORD v34[3];
  id v35;
  _OWORD v36[4];

  v36[0] = a2;
  v36[1] = a3;
  v36[2] = a4;
  v30 = a6;
  v17 = a7;
  v18 = a8;
  v19 = a9;
  if (a11)
    v20 = a10 != 0;
  else
    v20 = 0;
  if ((a10 != 0) != (a11 != 0))
  {
    fig_log_get_emitter();
    FigDebugAssert3();
    v21 = 4294954516;
LABEL_19:
    v26 = v30;
    goto LABEL_14;
  }
  if (v20)
  {
    v35 = 0;
    v21 = +[CMIDistortionModel generateInverseScalingLUT:withGDCParams:metalCtx:](CMIDistortionModel, "generateInverseScalingLUT:withGDCParams:metalCtx:", &v35, a10, *(_QWORD *)(a1 + 8));
    v28 = v35;
    if ((_DWORD)v21)
    {
      fig_log_get_emitter();
      FigDebugAssert3();
      goto LABEL_18;
    }
  }
  else
  {
    v28 = 0;
  }
  objc_msgSend(*(id *)(a1 + 8), "commandQueue");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "commandBuffer");
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v23)
  {
    fig_log_get_emitter();
    FigDebugAssert3();
    v21 = FigSignalErrorAt();
LABEL_18:

    goto LABEL_19;
  }
  objc_msgSend(v23, "computeCommandEncoder");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "setImageblockWidth:height:", 32, 32);
  objc_msgSend(v24, "setBytes:length:atIndex:", v36, 48, 0);
  if (v20)
  {
    objc_msgSend(v24, "setComputePipelineState:", *(_QWORD *)(a1 + 24));
    objc_msgSend(v24, "setBytes:length:atIndex:", a10, 112, 1);
    objc_msgSend(v24, "setBytes:length:atIndex:", a11, 112, 2);
    v25 = v28;
    objc_msgSend(v24, "setTexture:atIndex:", v28, 2);
  }
  else
  {
    objc_msgSend(v24, "setComputePipelineState:", *(_QWORD *)(a1 + 16));
    v25 = v28;
  }
  v26 = v30;
  objc_msgSend(v24, "setTexture:atIndex:", v30, 0);
  objc_msgSend(v24, "setTexture:atIndex:", v18, 1);
  v34[0] = objc_msgSend(v18, "width");
  v34[1] = objc_msgSend(v18, "height");
  v34[2] = 1;
  v29 = vdupq_n_s64(0x20uLL);
  v32 = v29;
  v33 = 1;
  objc_msgSend(v24, "dispatchThreads:threadsPerThreadgroup:", v34, &v32);
  objc_msgSend(v24, "setTexture:atIndex:", v17, 0);
  objc_msgSend(v24, "setTexture:atIndex:", v19, 1);
  v31[0] = objc_msgSend(v17, "width");
  v31[1] = objc_msgSend(v17, "height");
  v31[2] = 1;
  v32 = v29;
  v33 = 1;
  objc_msgSend(v24, "dispatchThreads:threadsPerThreadgroup:", v31, &v32);
  objc_msgSend(v24, "endEncoding");
  objc_msgSend(v23, "commit");

  v21 = 0;
LABEL_14:

  return v21;
}

- (uint64_t)runWarpUsingTransform:(uint64_t)a3 inputTex:(uint64_t)a4 outputTex:
{
  uint64_t v4;

  v4 = objc_msgSend(a1, "runWarpUsingTransform:inputTex:outputTex:inputFrameGDCParams:outputFrameGDCParams:", a3, a4, 0, 0);
  if ((_DWORD)v4)
  {
    fig_log_get_emitter();
    FigDebugAssert3();
  }
  return v4;
}

- (uint64_t)runWarpUsingTransform:(__n128)a3 inputTex:(__n128)a4 outputTex:(uint64_t)a5 inputFrameGDCParams:(void *)a6 outputFrameGDCParams:(void *)a7
{
  id v13;
  id v14;
  _BOOL4 v15;
  uint64_t v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  int64x2_t v22;
  uint64_t v23;
  _QWORD v24[3];
  id v25;
  _OWORD v26[3];

  v26[0] = a2;
  v26[1] = a3;
  v26[2] = a4;
  v13 = a6;
  v14 = a7;
  if (a9)
    v15 = a8 != 0;
  else
    v15 = 0;
  if ((a8 != 0) == (a9 != 0))
  {
    if (v15)
    {
      v25 = 0;
      v16 = +[CMIDistortionModel generateInverseScalingLUT:withGDCParams:metalCtx:](CMIDistortionModel, "generateInverseScalingLUT:withGDCParams:metalCtx:", &v25, a8, *(_QWORD *)(a1 + 8));
      v17 = v25;
      if ((_DWORD)v16)
      {
        fig_log_get_emitter();
        FigDebugAssert3();
LABEL_17:

        goto LABEL_14;
      }
    }
    else
    {
      v17 = 0;
    }
    objc_msgSend(*(id *)(a1 + 8), "commandQueue");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "commandBuffer");
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v19)
    {
      fig_log_get_emitter();
      FigDebugAssert3();
      v16 = FigSignalErrorAt();
      goto LABEL_17;
    }
    objc_msgSend(v19, "computeCommandEncoder");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "setImageblockWidth:height:", 32, 32);
    objc_msgSend(v20, "setBytes:length:atIndex:", v26, 48, 0);
    if (v15)
    {
      objc_msgSend(v20, "setComputePipelineState:", *(_QWORD *)(a1 + 24));
      objc_msgSend(v20, "setBytes:length:atIndex:", a8, 112, 1);
      objc_msgSend(v20, "setBytes:length:atIndex:", a9, 112, 2);
      objc_msgSend(v20, "setTexture:atIndex:", v17, 2);
    }
    else
    {
      objc_msgSend(v20, "setComputePipelineState:", *(_QWORD *)(a1 + 16));
    }
    objc_msgSend(v20, "setTexture:atIndex:", v13, 0);
    objc_msgSend(v20, "setTexture:atIndex:", v14, 1);
    v24[0] = objc_msgSend(v14, "width");
    v24[1] = objc_msgSend(v14, "height");
    v24[2] = 1;
    v22 = vdupq_n_s64(0x20uLL);
    v23 = 1;
    objc_msgSend(v20, "dispatchThreads:threadsPerThreadgroup:", v24, &v22);
    objc_msgSend(v20, "endEncoding");
    objc_msgSend(v19, "commit");

    v16 = 0;
  }
  else
  {
    fig_log_get_emitter();
    FigDebugAssert3();
    v16 = 4294954516;
  }
LABEL_14:

  return v16;
}

- (int)runGDC:(id)a3 outputTex:(id)a4 warpConfig:(CMIWarpConfig *)a5 gdcParams:(id *)a6 inverseGDC:(BOOL)a7
{
  _BOOL4 v7;
  id v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  int v18;
  int64x2_t v20;
  uint64_t v21;
  _QWORD v22[3];

  v7 = a7;
  v12 = a3;
  v13 = a4;
  if (a6)
  {
    -[FigMetalContext commandQueue](self->_metal, "commandQueue");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "commandBuffer");
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    if (v15)
    {
      objc_msgSend(v15, "computeCommandEncoder");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "setImageblockWidth:height:", 32, 32);
      v17 = 40;
      if (!v7)
        v17 = 32;
      objc_msgSend(v16, "setComputePipelineState:", *(Class *)((char *)&self->super.isa + v17));
      objc_msgSend(v16, "setBytes:length:atIndex:", a5, 20, 0);
      objc_msgSend(v16, "setBytes:length:atIndex:", a6, 112, 1);
      objc_msgSend(v16, "setTexture:atIndex:", v12, 0);
      objc_msgSend(v16, "setTexture:atIndex:", v13, 1);
      v22[0] = objc_msgSend(v13, "width");
      v22[1] = objc_msgSend(v13, "height");
      v22[2] = 1;
      v20 = vdupq_n_s64(0x20uLL);
      v21 = 1;
      objc_msgSend(v16, "dispatchThreads:threadsPerThreadgroup:", v22, &v20);
      objc_msgSend(v16, "endEncoding");
      objc_msgSend(v15, "commit");

      v18 = 0;
    }
    else
    {
      fig_log_get_emitter();
      FigDebugAssert3();
      v18 = FigSignalErrorAt();
    }
  }
  else
  {
    fig_log_get_emitter();
    FigDebugAssert3();
    v18 = -12780;
  }

  return v18;
}

- (int)runGDCWithInputLuma:(id)a3 inputChromaTex:(id)a4 outputLumaTex:(id)a5 outputChromaTex:(id)a6 warpConfig:(CMIWarpConfig *)a7 gdcParams:(id *)a8 inverseGDC:(BOOL)a9
{
  id v15;
  id v16;
  id v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  unint64_t v23;
  int v24;
  int64x2_t v26;
  uint64_t v27;
  _QWORD v28[3];

  v15 = a3;
  v16 = a4;
  v17 = a5;
  v18 = a6;
  if (a7 && a8)
  {
    -[FigMetalContext commandQueue](self->_metal, "commandQueue");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "commandBuffer");
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    if (v20)
    {
      objc_msgSend(v20, "computeCommandEncoder");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "setImageblockWidth:height:", 32, 32);
      v22 = 48;
      if (a9)
        v22 = 56;
      objc_msgSend(v21, "setComputePipelineState:", *(Class *)((char *)&self->super.isa + v22));
      objc_msgSend(v21, "setBytes:length:atIndex:", a7, 20, 0);
      objc_msgSend(v21, "setBytes:length:atIndex:", a8, 112, 1);
      objc_msgSend(v21, "setTexture:atIndex:", v15, 0);
      objc_msgSend(v21, "setTexture:atIndex:", v16, 1);
      objc_msgSend(v21, "setTexture:atIndex:", v17, 2);
      objc_msgSend(v21, "setTexture:atIndex:", v18, 3);
      v23 = (unint64_t)*((unsigned __int16 *)a7 + 9) >> 1;
      v28[0] = (unint64_t)*((unsigned __int16 *)a7 + 8) >> 1;
      v28[1] = v23;
      v28[2] = 1;
      v26 = vdupq_n_s64(0x10uLL);
      v27 = 1;
      objc_msgSend(v21, "dispatchThreads:threadsPerThreadgroup:", v28, &v26);
      objc_msgSend(v21, "endEncoding");
      objc_msgSend(v20, "commit");

      v24 = 0;
    }
    else
    {
      fig_log_get_emitter();
      FigDebugAssert3();
      v24 = FigSignalErrorAt();
    }
  }
  else
  {
    fig_log_get_emitter();
    FigDebugAssert3();
    v24 = -12780;
  }

  return v24;
}

- (uint64_t)runWarpUsingTransform:(__n128)a3 inputBayerTex:(__n128)a4 firstPix:(uint64_t)a5 outputRGBTex:(void *)a6
{
  id v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  int64x2_t v30;
  uint64_t v31;
  _QWORD v32[3];
  int64x2_t v33;
  uint64_t v34;
  _QWORD v35[3];
  id v36;
  int v37;
  _OWORD v38[4];

  v38[0] = a2;
  v38[1] = a3;
  v38[2] = a4;
  v11 = a6;
  v12 = a8;
  v36 = 0;
  v37 = a7;
  objc_msgSend(*(id *)(a1 + 8), "allocator");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (void *)objc_msgSend(v13, "newTextureDescriptor");

  if (!v14)
    goto LABEL_7;
  objc_msgSend(v14, "desc");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setTextureType:", 2);

  v16 = objc_msgSend(v11, "width");
  objc_msgSend(v14, "desc");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setWidth:", v16);

  v18 = objc_msgSend(v11, "height");
  objc_msgSend(v14, "desc");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "setHeight:", v18);

  objc_msgSend(v14, "desc");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "setUsage:", 3);

  objc_msgSend(v14, "desc");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "setPixelFormat:", 115);

  objc_msgSend(v14, "setLabel:", 0);
  objc_msgSend(*(id *)(a1 + 8), "allocator");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = (void *)objc_msgSend(v22, "newTextureWithDescriptor:", v14);
  v36 = v23;

  if (!v23)
    goto LABEL_7;
  objc_msgSend(*(id *)(a1 + 8), "commandQueue");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "commandBuffer");
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  if (v25)
  {
    objc_msgSend(v25, "computeCommandEncoder");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    if (v26)
    {
      v27 = v26;
      objc_msgSend(v26, "setImageblockWidth:height:", 32, 32);
      objc_msgSend(v27, "setComputePipelineState:", *(_QWORD *)(a1 + 64));
      objc_msgSend(v27, "setTexture:atIndex:", v11, 0);
      objc_msgSend(v27, "setTexture:atIndex:", v23, 1);
      objc_msgSend(v27, "setBytes:length:atIndex:", &v37, 4, 0);
      v35[0] = (unint64_t)objc_msgSend(v11, "width") >> 1;
      v35[1] = (unint64_t)objc_msgSend(v11, "height") >> 1;
      v35[2] = 1;
      v33 = vdupq_n_s64(0x10uLL);
      v34 = 1;
      objc_msgSend(v27, "dispatchThreads:threadsPerThreadgroup:", v35, &v33);
      objc_msgSend(v27, "setImageblockWidth:height:", 32, 32);
      objc_msgSend(v27, "setComputePipelineState:", *(_QWORD *)(a1 + 16));
      objc_msgSend(v27, "setBytes:length:atIndex:", v38, 48, 0);
      objc_msgSend(v27, "setTexture:atIndex:", v23, 0);
      objc_msgSend(v27, "setTexture:atIndex:", v12, 1);
      v32[0] = objc_msgSend(v12, "width");
      v32[1] = objc_msgSend(v12, "height");
      v32[2] = 1;
      v30 = vdupq_n_s64(0x20uLL);
      v31 = 1;
      objc_msgSend(v27, "dispatchThreads:threadsPerThreadgroup:", v32, &v30);
      objc_msgSend(v27, "endEncoding");
      objc_msgSend(v25, "commit");

      v28 = 0;
    }
    else
    {
      fig_log_get_emitter();
      FigDebugAssert3();
      v28 = FigSignalErrorAt();

    }
  }
  else
  {
LABEL_7:
    fig_log_get_emitter();
    FigDebugAssert3();
    v28 = FigSignalErrorAt();
  }
  FigMetalDecRef(&v36);

  return v28;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_simpleDemosaicPipeline, 0);
  objc_storeStrong((id *)&self->_inverseGDCYUVPipeline, 0);
  objc_storeStrong((id *)&self->_gdcYUVPipeline, 0);
  objc_storeStrong((id *)&self->_inverseGDCPipeline, 0);
  objc_storeStrong((id *)&self->_gdcPipeline, 0);
  objc_storeStrong((id *)&self->_warpWithGDCPipeline, 0);
  objc_storeStrong((id *)&self->_warpPipeline, 0);
  objc_storeStrong((id *)&self->_metal, 0);
}

@end
