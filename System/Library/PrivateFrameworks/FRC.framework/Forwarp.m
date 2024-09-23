@implementation Forwarp

- (Forwarp)initWithDevice:(id)a3 commmandQueue:(id)a4 mode:(unint64_t)a5
{
  Forwarp *v6;
  Forwarp *v7;
  float v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)Forwarp;
  v6 = -[FRCMetalBase initWithDevice:commmandQueue:](&v10, sel_initWithDevice_commmandQueue_, a3, a4);
  v7 = v6;
  if (v6)
  {
    v6->_synthesisMode = a5;
    v6->_isLiteSynthesis = a5 == 10;
    v8 = 0.1;
    if (a5 == 10)
      v8 = 0.5;
    v6->_errorTolerance = v8;
    v6->_filterErrorMapByGaussian = 1;
    -[Forwarp setupMetal](v6, "setupMetal");
  }
  return v7;
}

- (void)dealloc
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)Forwarp;
  -[Forwarp dealloc](&v2, sel_dealloc);
}

- (BOOL)setupMetal
{
  void *v3;
  MTLComputePipelineState *v4;
  MTLComputePipelineState *updateBest;
  int v6;
  const __CFString *v7;
  const __CFString *v8;
  MTLComputePipelineState *v9;
  MTLComputePipelineState *updateOutputFullWarp;
  MTLComputePipelineState *v11;
  MTLComputePipelineState *updateOutputFullWarpMinErrorOffset;
  MTLComputePipelineState *v13;
  MTLComputePipelineState *updateOutputLiteWarp;
  MTLComputePipelineState *v15;
  MTLComputePipelineState *initializeBest;
  MTLComputePipelineState *v17;
  MTLComputePipelineState *blendWarpedImages;
  MTLComputePipelineState *v19;
  MTLComputePipelineState *convert2Texture;
  MTLComputePipelineState *v21;
  MTLComputePipelineState *convert2TextureWithMask;
  const __CFString *v23;
  MTLComputePipelineState *v24;
  MTLComputePipelineState *errorMapDilation;
  unint64_t synthesisMode;
  MTLComputePipelineState *v27;
  MTLComputePipelineState *blendDCTexturesWithMasks;
  MTLComputePipelineState *v29;
  MTLComputePipelineState *blendWarpedImagesWithMaskAndFlowConsistency;
  MTLComputePipelineState *v31;
  MTLComputePipelineState *blendWarpedImagesWithMaskTextures;
  objc_class *v33;
  uint64_t v34;
  void *v35;
  unint64_t v36;
  MTLComputePipelineState *v37;
  MTLComputePipelineState *splattingKernel;
  MTLComputePipelineState *v39;
  MTLComputePipelineState *splattingNormalizationKernel;
  MTLComputePipelineState *v41;
  MTLComputePipelineState *warpAndBlendTextures;
  MTLComputePipelineState *v43;
  MTLComputePipelineState *warpAndBlendTexturesWithConsistency;
  char v46;
  __int16 v47;

  v3 = (void *)objc_opt_new();
  -[FRCMetalBase createKernel:](self, "createKernel:", CFSTR("updateBest"));
  v4 = (MTLComputePipelineState *)objc_claimAutoreleasedReturnValue();
  updateBest = self->_updateBest;
  self->_updateBest = v4;

  v47 = 256;
  v6 = -[MTLDevice supportsFamily:](self->super._device, "supportsFamily:", 1009);
  if (v6)
    v7 = CFSTR("updateOutputFloat");
  else
    v7 = CFSTR("updateOutput");
  if (v6)
    v8 = CFSTR("convertFloatBuffer2Texture");
  else
    v8 = CFSTR("convertFixedPointBuffer2Texture");
  objc_msgSend(v3, "setConstantValue:type:withName:", (char *)&v47 + 1, 53, CFSTR("fullWarpEnabled"));
  objc_msgSend(v3, "setConstantValue:type:withName:", &v47, 53, CFSTR("offsetPixelAlignedPositionWeight"));
  -[FRCMetalBase createKernel:constantValues:](self, "createKernel:constantValues:", v7, v3);
  v9 = (MTLComputePipelineState *)objc_claimAutoreleasedReturnValue();
  updateOutputFullWarp = self->_updateOutputFullWarp;
  self->_updateOutputFullWarp = v9;

  LOBYTE(v47) = 1;
  objc_msgSend(v3, "setConstantValue:type:withName:", &v47, 53, CFSTR("offsetPixelAlignedPositionWeight"));
  -[FRCMetalBase createKernel:constantValues:](self, "createKernel:constantValues:", v7, v3);
  v11 = (MTLComputePipelineState *)objc_claimAutoreleasedReturnValue();
  updateOutputFullWarpMinErrorOffset = self->_updateOutputFullWarpMinErrorOffset;
  self->_updateOutputFullWarpMinErrorOffset = v11;

  v47 = 0;
  objc_msgSend(v3, "setConstantValue:type:withName:", (char *)&v47 + 1, 53, CFSTR("fullWarpEnabled"));
  objc_msgSend(v3, "setConstantValue:type:withName:", &v47, 53, CFSTR("offsetPixelAlignedPositionWeight"));
  -[FRCMetalBase createKernel:constantValues:](self, "createKernel:constantValues:", v7, v3);
  v13 = (MTLComputePipelineState *)objc_claimAutoreleasedReturnValue();
  updateOutputLiteWarp = self->_updateOutputLiteWarp;
  self->_updateOutputLiteWarp = v13;

  -[FRCMetalBase createKernel:](self, "createKernel:", CFSTR("initializeBestBuffer"));
  v15 = (MTLComputePipelineState *)objc_claimAutoreleasedReturnValue();
  initializeBest = self->_initializeBest;
  self->_initializeBest = v15;

  -[FRCMetalBase createKernel:](self, "createKernel:", CFSTR("blendWarpedImagesWithErrorMap"));
  v17 = (MTLComputePipelineState *)objc_claimAutoreleasedReturnValue();
  blendWarpedImages = self->_blendWarpedImages;
  self->_blendWarpedImages = v17;

  v46 = 0;
  objc_msgSend(v3, "setConstantValue:type:withName:", &v46, 53, CFSTR("outputErrorMask"));
  -[FRCMetalBase createKernel:constantValues:](self, "createKernel:constantValues:", v8, v3);
  v19 = (MTLComputePipelineState *)objc_claimAutoreleasedReturnValue();
  convert2Texture = self->_convert2Texture;
  self->_convert2Texture = v19;

  v46 = 1;
  objc_msgSend(v3, "setConstantValue:type:withName:", &v46, 53, CFSTR("outputErrorMask"));
  -[FRCMetalBase createKernel:constantValues:](self, "createKernel:constantValues:", v8, v3);
  v21 = (MTLComputePipelineState *)objc_claimAutoreleasedReturnValue();
  convert2TextureWithMask = self->_convert2TextureWithMask;
  self->_convert2TextureWithMask = v21;

  if (-[MTLDevice supportsFamily:](self->super._device, "supportsFamily:", 1008))
  {
    self->_supportsSIMDShuffle = 1;
LABEL_10:
    v23 = CFSTR("dualErrorMapDilationSIMD");
    goto LABEL_12;
  }
  if (self->_supportsSIMDShuffle)
    goto LABEL_10;
  v23 = CFSTR("dualErrorMapDilation");
LABEL_12:
  -[FRCMetalBase createKernel:](self, "createKernel:", v23);
  v24 = (MTLComputePipelineState *)objc_claimAutoreleasedReturnValue();
  errorMapDilation = self->_errorMapDilation;
  self->_errorMapDilation = v24;

  synthesisMode = self->_synthesisMode;
  if (synthesisMode <= 1)
  {
    -[FRCMetalBase createKernel:](self, "createKernel:", CFSTR("blendDCTexturesWithMask"));
    v27 = (MTLComputePipelineState *)objc_claimAutoreleasedReturnValue();
    blendDCTexturesWithMasks = self->_blendDCTexturesWithMasks;
    self->_blendDCTexturesWithMasks = v27;

    synthesisMode = self->_synthesisMode;
  }
  if (synthesisMode == 2)
  {
    -[FRCMetalBase createKernel:](self, "createKernel:", CFSTR("blendWarpedImageWithErrorMapAndFlowConsistency"));
    v29 = (MTLComputePipelineState *)objc_claimAutoreleasedReturnValue();
    blendWarpedImagesWithMaskAndFlowConsistency = self->_blendWarpedImagesWithMaskAndFlowConsistency;
    self->_blendWarpedImagesWithMaskAndFlowConsistency = v29;

    -[FRCMetalBase createKernel:](self, "createKernel:", CFSTR("blendWarpedImagesWithErrorMapTextures"));
    v31 = (MTLComputePipelineState *)objc_claimAutoreleasedReturnValue();
    blendWarpedImagesWithMaskTextures = self->_blendWarpedImagesWithMaskTextures;
    self->_blendWarpedImagesWithMaskTextures = v31;

  }
  if (self->_filterErrorMapByGaussian)
  {
    if (self->_supportsSIMDShuffle)
    {
      -[FRCMetalBase createKernel:](self, "createKernel:", CFSTR("filter_error_map_SIMD"));
      v33 = (objc_class *)objc_claimAutoreleasedReturnValue();
      v34 = 144;
    }
    else
    {
      -[FRCMetalBase createKernel:](self, "createKernel:", CFSTR("filter_error_map"));
      v33 = (objc_class *)objc_claimAutoreleasedReturnValue();
      v34 = 136;
    }
  }
  else
  {
    -[FRCMetalBase createKernel:](self, "createKernel:", CFSTR("downsample_error_map"));
    v33 = (objc_class *)objc_claimAutoreleasedReturnValue();
    v34 = 176;
  }
  v35 = *(Class *)((char *)&self->super.super.isa + v34);
  *(Class *)((char *)&self->super.super.isa + v34) = v33;

  v36 = self->_synthesisMode;
  if (v36 == 2)
  {
    objc_msgSend(v3, "setConstantValue:type:withName:", &self->_filterErrorMapByGaussian, 53, CFSTR("filterErrorMapByGaussian"));
    -[FRCMetalBase createKernel:constantValues:](self, "createKernel:constantValues:", CFSTR("spalatting"), v3);
    v37 = (MTLComputePipelineState *)objc_claimAutoreleasedReturnValue();
    splattingKernel = self->_splattingKernel;
    self->_splattingKernel = v37;

    -[FRCMetalBase createKernel:](self, "createKernel:", CFSTR("normalizeSplattedOutput"));
    v39 = (MTLComputePipelineState *)objc_claimAutoreleasedReturnValue();
    splattingNormalizationKernel = self->_splattingNormalizationKernel;
    self->_splattingNormalizationKernel = v39;

    v36 = self->_synthesisMode;
  }
  if (v36 == 3)
  {
    -[FRCMetalBase createKernel:](self, "createKernel:", CFSTR("warpAndBlendWithErrorMap"));
    v41 = (MTLComputePipelineState *)objc_claimAutoreleasedReturnValue();
    warpAndBlendTextures = self->_warpAndBlendTextures;
    self->_warpAndBlendTextures = v41;

    -[FRCMetalBase createKernel:](self, "createKernel:", CFSTR("warpAndBlendImageWithErrorAndFlowConsistency"));
    v43 = (MTLComputePipelineState *)objc_claimAutoreleasedReturnValue();
    warpAndBlendTexturesWithConsistency = self->_warpAndBlendTexturesWithConsistency;
    self->_warpAndBlendTexturesWithConsistency = v43;

  }
  return 1;
}

- (id)createBestBufferWidth:(unint64_t)a3 height:(unint64_t)a4
{
  return (id)-[MTLDevice newBufferWithLength:options:](self->super._device, "newBufferWithLength:options:", (4 * a3 * a4 + 4095) & 0xFFFFFFFFFFFFF000, 0);
}

- (id)createOutputBufferWidth:(unint64_t)a3 height:(unint64_t)a4 channels:(unint64_t)a5
{
  return (id)-[MTLDevice newBufferWithLength:options:](self->super._device, "newBufferWithLength:options:", (4* (a3 * ((a4 + 15) & 0x3FFFFFFFFFFFFFF0)+ a3 * ((a4 + 15) & 0x3FFFFFFFFFFFFFF0) * a5)+ 4095) & 0xFFFFFFFFFFFFF000, 0);
}

- (void)allocateBuffersWidth:(unint64_t)a3 height:(unint64_t)a4 channels:(unint64_t)a5 bestBuffer:(id *)a6 outputBuffer:(id *)a7
{
  -[Forwarp createBestBufferWidth:height:](self, "createBestBufferWidth:height:");
  *a6 = (id)objc_claimAutoreleasedReturnValue();
  -[Forwarp createOutputBufferWidth:height:channels:](self, "createOutputBufferWidth:height:channels:", a3, a4, a5);
  *a7 = (id)objc_claimAutoreleasedReturnValue();
}

- (void)updateBest:(id)a3 error:(id)a4 timeScale:(float)a5 best:(id)a6
{
  MTLCommandQueue *commandQueue;
  id v11;
  id v12;
  id v13;
  double v14;
  id v15;

  commandQueue = self->super._commandQueue;
  v11 = a6;
  v12 = a4;
  v13 = a3;
  -[MTLCommandQueue commandBuffer](commandQueue, "commandBuffer");
  v15 = (id)objc_claimAutoreleasedReturnValue();
  *(float *)&v14 = a5;
  -[Forwarp encodeUpdateBestToCommandBuffer:flow:error:timeScale:bestError:](self, "encodeUpdateBestToCommandBuffer:flow:error:timeScale:bestError:", v15, v13, v12, v11, v14);

  objc_msgSend(v15, "commit");
  objc_msgSend(v15, "waitUntilCompleted");

}

- (void)encodeInitialieBestToCommandBuffer:(id)a3 bestError:(id)a4
{
  id v6;
  id v7;
  unint64_t v8;
  void *v9;
  __int128 v10;
  uint64_t v11;
  unint64_t v12;
  int64x2_t v13;

  v6 = a4;
  v7 = a3;
  v8 = objc_msgSend(v6, "length");
  objc_msgSend(v7, "computeCommandEncoder");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "setComputePipelineState:", self->_initializeBest);
  objc_msgSend(v9, "setBuffer:offset:atIndex:", v6, 0, 0);

  v13 = vdupq_n_s64(1uLL);
  v10 = xmmword_1D428EAA0;
  v11 = 1;
  v12 = v8 >> 13;
  objc_msgSend(v9, "dispatchThreadgroups:threadsPerThreadgroup:", &v12, &v10);
  objc_msgSend(v9, "endEncoding");

}

- (void)encodeUpdateBestToCommandBuffer:(id)a3 flow:(id)a4 error:(id)a5 timeScale:(float)a6 bestError:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  void *v16;
  id v17;
  uint64_t v18;
  int64x2_t v19;
  uint64_t v20;
  _QWORD v21[3];

  v12 = a4;
  v13 = a5;
  v14 = a7;
  if (v12 && v13)
  {
    v15 = a3;
    -[Forwarp encodeInitialieBestToCommandBuffer:bestError:](self, "encodeInitialieBestToCommandBuffer:bestError:", v15, v14);
    objc_msgSend(v15, "computeCommandEncoder");
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    if (v16)
    {
      v17 = objc_retainAutorelease((id)-[MTLDevice newBufferWithLength:options:](self->super._device, "newBufferWithLength:options:", 8, 0));
      v18 = objc_msgSend(v17, "contents");
      *(float *)v18 = a6;
      *(_DWORD *)(v18 + 4) = self->_isLiteSynthesis;
      objc_msgSend(v16, "setComputePipelineState:", self->_updateBest);
      objc_msgSend(v16, "setTexture:atIndex:", v12, 0);
      objc_msgSend(v16, "setTexture:atIndex:", v13, 1);
      objc_msgSend(v16, "setBuffer:offset:atIndex:", v17, 0, 0);
      objc_msgSend(v16, "setBuffer:offset:atIndex:", v14, 0, 1);
      v21[0] = (unint64_t)(objc_msgSend(v13, "width") + 15) >> 4;
      v21[1] = (unint64_t)(objc_msgSend(v13, "height") + 15) >> 4;
      v21[2] = 1;
      v19 = vdupq_n_s64(0x10uLL);
      v20 = 1;
      objc_msgSend(v16, "dispatchThreadgroups:threadsPerThreadgroup:", v21, &v19);
      objc_msgSend(v16, "endEncoding");

    }
  }

}

- (void)updateOutput:(id)a3 flow:(id)a4 error:(id)a5 timeScale:(float)a6 fullWarp:(BOOL)a7 bestError:(id)a8 output:(id)a9
{
  _BOOL8 v10;
  MTLCommandQueue *commandQueue;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  double v22;
  id v23;

  v10 = a7;
  commandQueue = self->super._commandQueue;
  v17 = a9;
  v18 = a8;
  v19 = a5;
  v20 = a4;
  v21 = a3;
  -[MTLCommandQueue commandBuffer](commandQueue, "commandBuffer");
  v23 = (id)objc_claimAutoreleasedReturnValue();
  *(float *)&v22 = a6;
  -[Forwarp encodeUpdateOutputToCommandBuffer:input:flow:error:timeScale:fullWarp:bestError:output:](self, "encodeUpdateOutputToCommandBuffer:input:flow:error:timeScale:fullWarp:bestError:output:", v23, v21, v20, v19, v10, v18, v22, v17);

  objc_msgSend(v23, "commit");
  objc_msgSend(v23, "waitUntilCompleted");

}

- (void)encodeUpdateOutputToCommandBuffer:(id)a3 input:(id)a4 flow:(id)a5 error:(id)a6 timeScale:(float)a7 fullWarp:(BOOL)a8 bestError:(id)a9 output:(id)a10
{
  _BOOL4 v11;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  void *v23;
  void *v24;
  id v25;
  uint64_t v26;
  BOOL v27;
  float v28;
  int *v29;
  int64x2_t v30;
  uint64_t v31;
  _QWORD v32[3];

  v11 = a8;
  v17 = a4;
  v18 = a5;
  v19 = a6;
  v20 = a9;
  v21 = a10;
  if (v17 && v18 && v19)
  {
    v22 = a3;
    objc_msgSend(v22, "blitCommandEncoder");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "fillBuffer:range:value:", v21, 0, objc_msgSend(v21, "length"), 0);
    objc_msgSend(v23, "endEncoding");
    objc_msgSend(v22, "computeCommandEncoder");
    v24 = (void *)objc_claimAutoreleasedReturnValue();

    if (v24)
    {
      v25 = objc_retainAutorelease((id)-[MTLDevice newBufferWithLength:options:](self->super._device, "newBufferWithLength:options:", 20, 0));
      v26 = objc_msgSend(v25, "contents");
      *(float *)v26 = a7;
      *(_DWORD *)(v26 + 4) = v11;
      *(_DWORD *)(v26 + 8) = self->_isLiteSynthesis;
      *(float *)(v26 + 12) = self->_errorTolerance;
      v27 = !self->_limitBilinearInterpolation;
      v28 = 0.0001;
      if (!self->_limitBilinearInterpolation)
        v28 = 0.0;
      *(float *)(v26 + 16) = v28;
      v29 = &OBJC_IVAR___Forwarp__updateOutputFullWarpMinErrorOffset;
      if (v27)
        v29 = &OBJC_IVAR___Forwarp__updateOutputFullWarp;
      if (!v11)
        v29 = &OBJC_IVAR___Forwarp__updateOutputLiteWarp;
      objc_msgSend(v24, "setComputePipelineState:", *(Class *)((char *)&self->super.super.isa + *v29));
      objc_msgSend(v24, "setTexture:atIndex:", v17, 0);
      objc_msgSend(v24, "setTexture:atIndex:", v18, 1);
      objc_msgSend(v24, "setTexture:atIndex:", v19, 2);
      objc_msgSend(v24, "setBuffer:offset:atIndex:", v25, 0, 0);
      objc_msgSend(v24, "setBuffer:offset:atIndex:", v20, 0, 1);
      objc_msgSend(v24, "setBuffer:offset:atIndex:", v21, 0, 2);
      v32[0] = (unint64_t)(objc_msgSend(v19, "width") + 15) >> 4;
      v32[1] = (unint64_t)(objc_msgSend(v19, "height") + 15) >> 4;
      v32[2] = 1;
      v30 = vdupq_n_s64(0x10uLL);
      v31 = 1;
      objc_msgSend(v24, "dispatchThreadgroups:threadsPerThreadgroup:", v32, &v30);
      objc_msgSend(v24, "endEncoding");

    }
  }

}

- (void)encodeNormalizationToCommandBuffer:(id)a3 fromBuffer:(id)a4 toTexture:(id)a5 inputSize:(id *)a6
{
  id v10;
  id v11;
  void *v12;
  id v13;
  _DWORD *v14;
  int var0;
  uint64_t v16;
  int *v17;
  int64x2_t v18;
  uint64_t v19;
  _QWORD v20[3];

  v10 = a4;
  v11 = a5;
  objc_msgSend(a3, "computeCommandEncoder");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    v13 = objc_retainAutorelease((id)-[MTLDevice newBufferWithLength:options:](self->super._device, "newBufferWithLength:options:", 8, 0));
    v14 = (_DWORD *)objc_msgSend(v13, "contents");
    var0 = a6->var0;
    *v14 = a6->var0;
    LODWORD(v16) = var0;
    HIDWORD(v16) = a6->var1;
    *(_QWORD *)v14 = v16;
    if (self->_createOcclusionMask)
      v17 = &OBJC_IVAR___Forwarp__convert2TextureWithMask;
    else
      v17 = &OBJC_IVAR___Forwarp__convert2Texture;
    objc_msgSend(v12, "setComputePipelineState:", *(Class *)((char *)&self->super.super.isa + *v17));
    objc_msgSend(v12, "setBuffer:offset:atIndex:", v10, 0, 0);
    objc_msgSend(v12, "setTexture:atIndex:", v11, 0);
    objc_msgSend(v12, "setBuffer:offset:atIndex:", v13, 0, 1);
    v20[0] = (unint64_t)(objc_msgSend(v11, "width") + 15) >> 4;
    v20[1] = (unint64_t)(objc_msgSend(v11, "height") + 15) >> 4;
    v20[2] = 1;
    v18 = vdupq_n_s64(0x10uLL);
    v19 = 1;
    objc_msgSend(v12, "dispatchThreadgroups:threadsPerThreadgroup:", v20, &v18);
    objc_msgSend(v12, "endEncoding");

  }
}

- (void)encodeToCommandBuffer:(id)a3 input:(id)a4 flow:(id)a5 error:(id)a6 timeScale:(float)a7 fullWarp:(BOOL)a8 bestError:(id)a9 outputBuffer:(id)a10
{
  _BOOL8 v11;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  double v22;
  id v23;

  v11 = a8;
  v23 = a3;
  v17 = a4;
  v18 = a5;
  v19 = a6;
  v20 = a9;
  v21 = a10;
  if (v11)
  {
    *(float *)&v22 = a7;
    -[Forwarp encodeUpdateBestToCommandBuffer:flow:error:timeScale:bestError:](self, "encodeUpdateBestToCommandBuffer:flow:error:timeScale:bestError:", v23, v18, v19, v20, v22);
  }
  *(float *)&v22 = a7;
  -[Forwarp encodeUpdateOutputToCommandBuffer:input:flow:error:timeScale:fullWarp:bestError:output:](self, "encodeUpdateOutputToCommandBuffer:input:flow:error:timeScale:fullWarp:bestError:output:", v23, v17, v18, v19, v11, v20, v22, v21);

}

- (void)encodeToCommandBuffer:(id)a3 input:(id)a4 flow:(id)a5 error:(id)a6 timeScale:(float)a7 fullWarp:(BOOL)a8 bestError:(id)a9 output:(id)a10 destination:(id)a11
{
  _BOOL8 v12;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;
  double v25;
  void *v26;
  _QWORD v27[3];

  v12 = a8;
  v18 = a3;
  v19 = a4;
  v20 = a5;
  v21 = a6;
  v22 = a9;
  v23 = a10;
  v24 = a11;
  v26 = v24;
  if (v19 && v20 && v21 && v24)
  {
    if (self->_linearSplatting)
    {
      *(float *)&v25 = a7;
      -[Forwarp encodeLinearSplattingToCommandBuffer:input:flow:error:splatBuffer:outputTexture:timeScale:](self, "encodeLinearSplattingToCommandBuffer:input:flow:error:splatBuffer:outputTexture:timeScale:", v18, v19, v20, v21, v23, v24, v25);
    }
    else
    {
      *(float *)&v25 = a7;
      -[Forwarp encodeToCommandBuffer:input:flow:error:timeScale:fullWarp:bestError:outputBuffer:](self, "encodeToCommandBuffer:input:flow:error:timeScale:fullWarp:bestError:outputBuffer:", v18, v19, v20, v21, v12, v22, v25, v23);
      if (!self->_isLiteSynthesis)
      {
        v27[0] = objc_msgSend(v19, "width");
        v27[1] = objc_msgSend(v19, "height");
        v27[2] = objc_msgSend(v19, "depth");
        -[Forwarp encodeNormalizationToCommandBuffer:fromBuffer:toTexture:inputSize:](self, "encodeNormalizationToCommandBuffer:fromBuffer:toTexture:inputSize:", v18, v23, v26, v27);
      }
    }
  }
  else
  {
    NSLog(CFSTR("Error : Input / Output Textures cannot be nil\n"));
  }

}

- (void)encodeBlendWarpedFeaturesWithErrorMaskToCommandBuffer:(id)a3 first:(id)a4 second:(id)a5 timeScale:(float)a6 destination:(id)a7
{
  id v12;
  id v13;
  id v14;
  void *v15;
  void *v16;
  int64x2_t v17;
  uint64_t v18;
  _QWORD v19[3];
  float v20;

  v12 = a4;
  v13 = a5;
  v20 = a6;
  v14 = a7;
  objc_msgSend(a3, "computeCommandEncoder");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = v15;
  if (v15)
  {
    objc_msgSend(v15, "setComputePipelineState:", self->_blendWarpedImages);
    objc_msgSend(v16, "setTexture:atIndex:", v12, 0);
    objc_msgSend(v16, "setTexture:atIndex:", v13, 1);
    objc_msgSend(v16, "setTexture:atIndex:", v14, 2);
    objc_msgSend(v16, "setBytes:length:atIndex:", &v20, 4, 0);
    v19[0] = (unint64_t)(objc_msgSend(v14, "width") + 15) >> 4;
    v19[1] = (unint64_t)(objc_msgSend(v14, "height") + 15) >> 4;
    v19[2] = 1;
    v17 = vdupq_n_s64(0x10uLL);
    v18 = 1;
    objc_msgSend(v16, "dispatchThreadgroups:threadsPerThreadgroup:", v19, &v17);
    objc_msgSend(v16, "endEncoding");
  }

}

- (void)encodeBlendWarpedFeaturesWithErrorMaskToCommandBuffer:(id)a3 first:(id)a4 second:(id)a5 forwardErrorMap:(id)a6 backwardErrorMap:(id)a7 forwarpConsistency:(id)a8 backwardConsistency:(id)a9 timeScale:(float)a10 destination:(id)a11
{
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;
  void *v25;
  float v26;
  float v27;
  int *v28;
  uint64_t v29;
  int64x2_t v30;
  uint64_t v31;
  _QWORD v32[3];
  _DWORD v33[3];

  v18 = a4;
  v19 = a5;
  v20 = a6;
  v21 = a7;
  v22 = a8;
  v23 = a9;
  v24 = a11;
  objc_msgSend(a3, "computeCommandEncoder");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  if (v25)
  {
    *(float *)v33 = a10;
    v26 = (float)(unint64_t)objc_msgSend(v20, "width");
    *(float *)&v33[2] = v26 / (float)(unint64_t)objc_msgSend(v18, "width");
    v27 = (float)(unint64_t)objc_msgSend(v18, "width");
    *(float *)&v33[1] = v27 / (float)(unint64_t)objc_msgSend(v20, "width");
    objc_msgSend(v25, "setBytes:length:atIndex:", v33, 12, 0);
    objc_msgSend(v25, "setTexture:atIndex:", v18, 0);
    objc_msgSend(v25, "setTexture:atIndex:", v19, 1);
    objc_msgSend(v25, "setTexture:atIndex:", v20, 2);
    objc_msgSend(v25, "setTexture:atIndex:", v21, 3);
    v28 = &OBJC_IVAR___Forwarp__blendWarpedImagesWithMaskTextures;
    v29 = 4;
    if (v22 && v23)
    {
      objc_msgSend(v25, "setTexture:atIndex:", v22, 4);
      objc_msgSend(v25, "setTexture:atIndex:", v23, 5);
      v28 = &OBJC_IVAR___Forwarp__blendWarpedImagesWithMaskAndFlowConsistency;
      v29 = 6;
    }
    objc_msgSend(v25, "setComputePipelineState:", *(Class *)((char *)&self->super.super.isa + *v28));
    objc_msgSend(v25, "setTexture:atIndex:", v24, v29);
    v32[0] = (unint64_t)(objc_msgSend(v24, "width") + 15) >> 4;
    v32[1] = (unint64_t)(objc_msgSend(v24, "height") + 15) >> 4;
    v32[2] = 1;
    v30 = vdupq_n_s64(0x10uLL);
    v31 = 1;
    objc_msgSend(v25, "dispatchThreadgroups:threadsPerThreadgroup:", v32, &v30);
    objc_msgSend(v25, "endEncoding");
  }

}

- (void)encodeErrorMapDilationToCommandBuffer:(id)a3 forwardSource:(id)a4 backwardSource:(id)a5 forwardDestination:(id)a6 backwardDestination:(id)a7 minimumAdjacentHoleCount:(unsigned int)a8 maximumHoleValue:(float)a9
{
  id v16;
  id v17;
  id v18;
  id v19;
  void *v20;
  id v21;
  uint64_t v22;
  _BOOL4 supportsSIMDShuffle;
  uint64_t v24;
  BOOL v25;
  uint64_t v26;
  uint64_t v27;
  char v28;
  char v29;
  _QWORD v30[3];
  _QWORD v31[3];

  v16 = a4;
  v17 = a5;
  v18 = a6;
  v19 = a7;
  objc_msgSend(a3, "computeCommandEncoder");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  if (v20)
  {
    v21 = objc_retainAutorelease((id)-[MTLDevice newBufferWithLength:options:](self->super._device, "newBufferWithLength:options:", 8, 0));
    v22 = objc_msgSend(v21, "contents");
    *(float *)(v22 + 4) = a9;
    *(_DWORD *)v22 = a8;
    objc_msgSend(v20, "setComputePipelineState:", self->_errorMapDilation);
    objc_msgSend(v20, "setTexture:atIndex:", v16, 0);
    objc_msgSend(v20, "setTexture:atIndex:", v17, 1);
    objc_msgSend(v20, "setTexture:atIndex:", v18, 2);
    objc_msgSend(v20, "setTexture:atIndex:", v19, 3);
    objc_msgSend(v20, "setBuffer:offset:atIndex:", v21, 0, 0);
    supportsSIMDShuffle = self->_supportsSIMDShuffle;
    v24 = objc_msgSend(v16, "width");
    v25 = !supportsSIMDShuffle;
    if (supportsSIMDShuffle)
      v26 = 4;
    else
      v26 = 16;
    if (v25)
      v27 = 16;
    else
      v27 = 32;
    if (v25)
      v28 = 4;
    else
      v28 = 2;
    if (v25)
      v29 = 4;
    else
      v29 = 5;
    v31[0] = (unint64_t)(v24 + v26 - 1) >> v28;
    v31[1] = (unint64_t)(v27 + objc_msgSend(v16, "height") - 1) >> v29;
    v31[2] = 1;
    v30[0] = v26;
    v30[1] = v27;
    v30[2] = 1;
    objc_msgSend(v20, "dispatchThreadgroups:threadsPerThreadgroup:", v31, v30);
    objc_msgSend(v20, "endEncoding");

  }
}

- (void)encodeBlendTexturesToCommandBuffer:(id)a3 firstWarpedTexture:(id)a4 secondWarpedTexture:(id)a5 forwardErrorMap:(id)a6 backwardErrorMap:(id)a7 synthesizedTexture:(id)a8 timeScale:(float)a9 synthesizedImageWeight:(float)a10 destination:(id)a11
{
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;
  void *v25;
  void *v26;
  int64x2_t v27;
  uint64_t v28;
  _QWORD v29[3];
  _DWORD v30[2];

  v19 = a4;
  v20 = a5;
  v21 = a6;
  v22 = a7;
  v23 = a8;
  v24 = a11;
  objc_msgSend(a3, "computeCommandEncoder");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = v25;
  if (v25)
  {
    objc_msgSend(v25, "setComputePipelineState:", self->_blendDCTexturesWithMasks);
    objc_msgSend(v26, "setTexture:atIndex:", v19, 0);
    objc_msgSend(v26, "setTexture:atIndex:", v20, 1);
    objc_msgSend(v26, "setTexture:atIndex:", v21, 2);
    objc_msgSend(v26, "setTexture:atIndex:", v22, 3);
    objc_msgSend(v26, "setTexture:atIndex:", v23, 4);
    objc_msgSend(v26, "setTexture:atIndex:", v24, 5);
    *(float *)v30 = a9;
    *(float *)&v30[1] = a10;
    objc_msgSend(v26, "setBytes:length:atIndex:", v30, 8, 0);
    v29[0] = (unint64_t)(objc_msgSend(v24, "width") + 15) >> 4;
    v29[1] = (unint64_t)(objc_msgSend(v24, "height") + 15) >> 4;
    v29[2] = 1;
    v27 = vdupq_n_s64(0x10uLL);
    v28 = 1;
    objc_msgSend(v26, "dispatchThreadgroups:threadsPerThreadgroup:", v29, &v27);
    objc_msgSend(v26, "endEncoding");
  }

}

- (void)encodeErrorMapFilteringToCommandBuffer:(id)a3 source:(id)a4 destination:(id)a5
{
  if (self->_filterErrorMapByGaussian)
    -[Forwarp encodeErrorMapFilteringWithGaussianToCommandBuffer:source:destination:](self, "encodeErrorMapFilteringWithGaussianToCommandBuffer:source:destination:", a3, a4, a5);
  else
    -[Forwarp encodeErrorDownsampleToCommandBuffer:source:destination:](self, "encodeErrorDownsampleToCommandBuffer:source:destination:", a3, a4, a5);
}

- (void)encodeErrorMapFilteringWithGaussianToCommandBuffer:(id)a3 source:(id)a4 destination:(id)a5
{
  id v8;
  id v9;
  id v10;
  MTLBuffer *v11;
  MTLBuffer *gaussian3x3CoefficientBuffer;
  uint64_t v13;
  void *v14;
  void *v15;
  int *v16;
  __int128 v17;
  uint64_t v18;
  _QWORD v19[3];

  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (!self->_gaussian3x3CoefficientBuffer)
  {
    v11 = (MTLBuffer *)-[MTLDevice newBufferWithLength:options:](self->super._device, "newBufferWithLength:options:", 18, 0);
    gaussian3x3CoefficientBuffer = self->_gaussian3x3CoefficientBuffer;
    self->_gaussian3x3CoefficientBuffer = v11;

    v13 = -[MTLBuffer contents](self->_gaussian3x3CoefficientBuffer, "contents");
    *(_WORD *)(v13 + 16) = 11087;
    *(_OWORD *)v13 = Gaussian3x3FilterCoeffients_0;
  }
  objc_msgSend(v8, "computeCommandEncoder");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = v14;
  if (self->_supportsSIMDShuffle)
    v16 = &OBJC_IVAR___Forwarp__gaussian3x3FilterSIMDKernel;
  else
    v16 = &OBJC_IVAR___Forwarp__gaussian3x3FilterKernel;
  objc_msgSend(v14, "setComputePipelineState:", *(Class *)((char *)&self->super.super.isa + *v16));
  objc_msgSend(v15, "setTexture:atIndex:", v9, 0);
  objc_msgSend(v15, "setTexture:atIndex:", v10, 1);
  objc_msgSend(v15, "setBuffer:offset:atIndex:", self->_gaussian3x3CoefficientBuffer, 0, 0);
  v19[0] = (unint64_t)(objc_msgSend(v10, "width") + 3) >> 2;
  v19[1] = (unint64_t)(objc_msgSend(v10, "height") + 31) >> 5;
  v19[2] = 1;
  v17 = xmmword_1D428E600;
  v18 = 1;
  objc_msgSend(v15, "dispatchThreadgroups:threadsPerThreadgroup:", v19, &v17);
  objc_msgSend(v15, "endEncoding");

}

- (void)encodeErrorDownsampleToCommandBuffer:(id)a3 source:(id)a4 destination:(id)a5
{
  id v8;
  id v9;
  void *v10;
  unint64_t v11;
  uint64_t v12;
  int64x2_t v13;
  uint64_t v14;
  _QWORD v15[3];

  v8 = a5;
  v9 = a4;
  objc_msgSend(a3, "computeCommandEncoder");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setComputePipelineState:", self->_errorMapDownsampleKernel);
  objc_msgSend(v10, "setTexture:atIndex:", v9, 0);

  objc_msgSend(v10, "setTexture:atIndex:", v8, 1);
  v11 = (unint64_t)(objc_msgSend(v8, "width") + 15) >> 4;
  v12 = objc_msgSend(v8, "height");

  v15[0] = v11;
  v15[1] = (unint64_t)(v12 + 15) >> 4;
  v15[2] = 1;
  v13 = vdupq_n_s64(0x10uLL);
  v14 = 1;
  objc_msgSend(v10, "dispatchThreadgroups:threadsPerThreadgroup:", v15, &v13);
  objc_msgSend(v10, "endEncoding");

}

- (void)encodeLinearSplattingToCommandBuffer:(id)a3 input:(id)a4 flow:(id)a5 error:(id)a6 splatBuffer:(id)a7 outputTexture:(id)a8 timeScale:(float)a9
{
  id v16;
  id v17;
  double v18;
  id v19;

  v16 = a8;
  v17 = a7;
  v19 = a3;
  *(float *)&v18 = a9;
  -[Forwarp encodeSplattingToCommandBuffer:input:flow:error:outputBuffer:timeScale:](self, "encodeSplattingToCommandBuffer:input:flow:error:outputBuffer:timeScale:", v19, a4, a5, a6, v17, v18);
  -[Forwarp encodeSplattingNormalizationToCommandBuffer:splattingBuffer:outputTexture:](self, "encodeSplattingNormalizationToCommandBuffer:splattingBuffer:outputTexture:", v19, v17, v16);

}

- (void)encodeSplattingToCommandBuffer:(id)a3 input:(id)a4 flow:(id)a5 error:(id)a6 outputBuffer:(id)a7 timeScale:(float)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  void *v19;
  void *v20;
  id v21;
  float *v22;
  unint64_t v23;
  uint64_t v24;
  int64x2_t v25;
  uint64_t v26;
  _QWORD v27[3];

  v14 = a7;
  v15 = a6;
  v16 = a5;
  v17 = a4;
  v18 = a3;
  objc_msgSend(v18, "blitCommandEncoder");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "fillBuffer:range:value:", v14, 0, objc_msgSend(v14, "length"), 0);
  objc_msgSend(v19, "endEncoding");
  objc_msgSend(v18, "computeCommandEncoder");
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  v21 = objc_retainAutorelease((id)-[MTLDevice newBufferWithLength:options:](self->super._device, "newBufferWithLength:options:", 20, 0));
  v22 = (float *)objc_msgSend(v21, "contents");
  *v22 = a8;
  v22[3] = self->_errorTolerance;
  objc_msgSend(v20, "setComputePipelineState:", self->_splattingKernel);
  objc_msgSend(v20, "setTexture:atIndex:", v17, 0);
  objc_msgSend(v20, "setTexture:atIndex:", v16, 1);

  objc_msgSend(v20, "setTexture:atIndex:", v15, 2);
  objc_msgSend(v20, "setBuffer:offset:atIndex:", v21, 0, 0);
  objc_msgSend(v20, "setBuffer:offset:atIndex:", v14, 0, 1);

  v23 = (unint64_t)(objc_msgSend(v17, "width") + 15) >> 4;
  v24 = objc_msgSend(v17, "height");

  v27[0] = v23;
  v27[1] = (unint64_t)(v24 + 15) >> 4;
  v27[2] = 1;
  v25 = vdupq_n_s64(0x10uLL);
  v26 = 1;
  objc_msgSend(v20, "dispatchThreadgroups:threadsPerThreadgroup:", v27, &v25);
  objc_msgSend(v20, "endEncoding");

}

- (void)encodeSplattingNormalizationToCommandBuffer:(id)a3 splattingBuffer:(id)a4 outputTexture:(id)a5
{
  id v8;
  id v9;
  void *v10;
  unint64_t v11;
  uint64_t v12;
  int64x2_t v13;
  uint64_t v14;
  _QWORD v15[3];

  v8 = a5;
  v9 = a4;
  objc_msgSend(a3, "computeCommandEncoder");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setComputePipelineState:", self->_splattingNormalizationKernel);
  objc_msgSend(v10, "setBuffer:offset:atIndex:", v9, 0, 0);

  objc_msgSend(v10, "setTexture:atIndex:", v8, 0);
  v11 = (unint64_t)(objc_msgSend(v8, "width") + 15) >> 4;
  v12 = objc_msgSend(v8, "height");

  v15[0] = v11;
  v15[1] = (unint64_t)(v12 + 15) >> 4;
  v15[2] = 1;
  v13 = vdupq_n_s64(0x10uLL);
  v14 = 1;
  objc_msgSend(v10, "dispatchThreadgroups:threadsPerThreadgroup:", v15, &v13);
  objc_msgSend(v10, "endEncoding");

}

- (void)encodeWarpAndBlendFeaturesWithErrorMaskToCommandBuffer:(id)a3 first:(id)a4 second:(id)a5 forwardFlow:(id)a6 backwardFlow:(id)a7 forwardErrorMap:(id)a8 backwardErrorMap:(id)a9 forwarpConsistency:(id)a10 backwardConsistency:(id)a11 timeScale:(float)a12 destination:(id)a13
{
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;
  id v25;
  id v26;
  id v27;
  void *v28;
  float v29;
  float v30;
  int *v31;
  uint64_t v32;
  id v33;
  int64x2_t v35;
  uint64_t v36;
  _QWORD v37[3];
  _DWORD v38[3];

  v19 = a4;
  v20 = a5;
  v21 = a6;
  v22 = a7;
  v23 = a8;
  v24 = a9;
  v25 = a10;
  v26 = a11;
  v27 = a13;
  objc_msgSend(a3, "computeCommandEncoder");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  if (v28)
  {
    *(float *)v38 = a12;
    v29 = (float)(unint64_t)objc_msgSend(v23, "width");
    *(float *)&v38[2] = v29 / (float)(unint64_t)objc_msgSend(v19, "width");
    v30 = (float)(unint64_t)objc_msgSend(v19, "width");
    *(float *)&v38[1] = v30 / (float)(unint64_t)objc_msgSend(v23, "width");
    objc_msgSend(v28, "setBytes:length:atIndex:", v38, 12, 0);
    objc_msgSend(v28, "setTexture:atIndex:", v19, 0);
    v33 = v20;
    objc_msgSend(v28, "setTexture:atIndex:", v20, 1);
    objc_msgSend(v28, "setTexture:atIndex:", v21, 2);
    objc_msgSend(v28, "setTexture:atIndex:", v22, 3);
    objc_msgSend(v28, "setTexture:atIndex:", v23, 4);
    objc_msgSend(v28, "setTexture:atIndex:", v24, 5);
    v31 = &OBJC_IVAR___Forwarp__warpAndBlendTextures;
    v32 = 6;
    if (v25 && v26)
    {
      objc_msgSend(v28, "setTexture:atIndex:", v25, 6);
      objc_msgSend(v28, "setTexture:atIndex:", v26, 7);
      v31 = &OBJC_IVAR___Forwarp__warpAndBlendTexturesWithConsistency;
      v32 = 8;
    }
    objc_msgSend(v28, "setTexture:atIndex:", v27, v32);
    objc_msgSend(v28, "setComputePipelineState:", *(Class *)((char *)&self->super.super.isa + *v31));
    v37[0] = (unint64_t)(objc_msgSend(v27, "width") + 15) >> 4;
    v37[1] = (unint64_t)(objc_msgSend(v27, "height") + 15) >> 4;
    v37[2] = 1;
    v35 = vdupq_n_s64(0x10uLL);
    v36 = 1;
    objc_msgSend(v28, "dispatchThreadgroups:threadsPerThreadgroup:", v37, &v35);
    objc_msgSend(v28, "endEncoding");
    v20 = v33;
  }

}

- (BOOL)isLiteSynthesis
{
  return self->_isLiteSynthesis;
}

- (void)setIsLiteSynthesis:(BOOL)a3
{
  self->_isLiteSynthesis = a3;
}

- (float)errorTolerance
{
  return self->_errorTolerance;
}

- (void)setErrorTolerance:(float)a3
{
  self->_errorTolerance = a3;
}

- (BOOL)createOcclusionMask
{
  return self->_createOcclusionMask;
}

- (void)setCreateOcclusionMask:(BOOL)a3
{
  self->_createOcclusionMask = a3;
}

- (BOOL)linearSplatting
{
  return self->_linearSplatting;
}

- (void)setLinearSplatting:(BOOL)a3
{
  self->_linearSplatting = a3;
}

- (BOOL)filterErrorMapByGaussian
{
  return self->_filterErrorMapByGaussian;
}

- (BOOL)limitBilinearInterpolation
{
  return self->_limitBilinearInterpolation;
}

- (void)setLimitBilinearInterpolation:(BOOL)a3
{
  self->_limitBilinearInterpolation = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_warpAndBlendTexturesWithConsistency, 0);
  objc_storeStrong((id *)&self->_warpAndBlendTextures, 0);
  objc_storeStrong((id *)&self->_errorMapDownsampleKernel, 0);
  objc_storeStrong((id *)&self->_splattingNormalizationKernel, 0);
  objc_storeStrong((id *)&self->_splattingKernel, 0);
  objc_storeStrong((id *)&self->_gaussian3x3CoefficientBuffer, 0);
  objc_storeStrong((id *)&self->_gaussian3x3FilterSIMDKernel, 0);
  objc_storeStrong((id *)&self->_gaussian3x3FilterKernel, 0);
  objc_storeStrong((id *)&self->_blendWarpedImagesWithMaskAndFlowConsistency, 0);
  objc_storeStrong((id *)&self->_blendDCTexturesWithMasks, 0);
  objc_storeStrong((id *)&self->_errorMapDilation, 0);
  objc_storeStrong((id *)&self->_convert2TextureWithMask, 0);
  objc_storeStrong((id *)&self->_blendWarpedImagesWithMaskTextures, 0);
  objc_storeStrong((id *)&self->_blendWarpedImages, 0);
  objc_storeStrong((id *)&self->_initializeBest, 0);
  objc_storeStrong((id *)&self->_convert2Texture, 0);
  objc_storeStrong((id *)&self->_updateOutputLiteWarp, 0);
  objc_storeStrong((id *)&self->_updateOutputFullWarpMinErrorOffset, 0);
  objc_storeStrong((id *)&self->_updateOutputFullWarp, 0);
  objc_storeStrong((id *)&self->_updateBest, 0);
}

@end
