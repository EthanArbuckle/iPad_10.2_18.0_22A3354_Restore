@implementation _MFXTemporalScalingEffectNRS

- (_MFXTemporalScalingEffectNRS)initWithDevice:(id)a3 descriptor:(id)a4
{
  id v6;
  id v7;
  _MFXTemporalScalingEffectNRS *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  unint64_t outputWidth;
  unint64_t inputWidth;
  unint64_t inputHeight;
  float v17;
  float v18;
  float v19;
  float v20;
  float v21;
  _MFXTemporalScalingEffectNRS *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  id v27;
  uint64_t v28;
  MTLBuffer *internal_is_history_invalid;
  id v31;
  objc_super v32;

  v6 = a3;
  v7 = a4;
  v32.receiver = self;
  v32.super_class = (Class)_MFXTemporalScalingEffectNRS;
  v8 = -[_MTLFXEffect init](&v32, sel_init);
  v8->_executionMode = 1;
  v8->_colorTextureUsage = 1;
  v8->_depthTextureUsage = 1;
  v8->_motionTextureUsage = 1;
  v8->_reactiveTextureUsage = 1;
  v8->_colorTextureFormat = objc_msgSend(v7, "colorTextureFormat");
  v8->_depthTextureFormat = objc_msgSend(v7, "depthTextureFormat");
  v8->_motionTextureFormat = objc_msgSend(v7, "motionTextureFormat");
  v9 = objc_msgSend(v7, "outputTextureFormat");
  v10 = 115;
  if (v9)
    v10 = v9;
  v8->_outputTextureFormat = v10;
  v11 = objc_msgSend(v7, "inputWidth");
  v8->_inputWidth = v11;
  v8->_inputContentWidth = v11;
  v12 = objc_msgSend(v7, "inputHeight");
  v8->_inputHeight = v12;
  v8->_inputContentHeight = v12;
  v8->_outputWidth = objc_msgSend(v7, "outputWidth");
  v13 = objc_msgSend(v7, "outputHeight");
  v8->_outputHeight = v13;
  outputWidth = v8->_outputWidth;
  inputWidth = v8->_inputWidth;
  inputHeight = v8->_inputHeight;
  if ((objc_msgSend(v7, "isInputContentPropertiesEnabled") & 1) != 0)
  {
    objc_msgSend(v7, "inputContentMinScale");
    v8->_inputContentMinScale = v17;
    objc_msgSend(v7, "inputContentMaxScale");
  }
  else
  {
    v19 = (float)outputWidth / (float)inputWidth;
    v20 = (float)v13 / (float)inputHeight;
    v21 = fminf(v19, v20);
    v18 = fmaxf(v19, v20);
    v8->_inputContentMinScale = v21;
  }
  v8->_inputContentMaxScale = v18;
  if (v8->_inputContentMinScale >= 1.0 && v18 <= 2.0)
  {
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "pathForResource:ofType:", CFSTR("default"), CFSTR("metallib"));
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDBCF48], "URLWithString:", v24);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = 0;
    v26 = (void *)objc_msgSend(v6, "newLibraryWithURL:error:", v25, &v31);
    v27 = v31;

    v28 = objc_msgSend(v6, "newBufferWithLength:options:", 1, 32);
    internal_is_history_invalid = v8->_internal_is_history_invalid;
    v8->_internal_is_history_invalid = (MTLBuffer *)v28;

    -[_MFXTemporalScalingEffectNRS initExposureWithDevice:library:autoexposureEnabled:]((uint64_t)v8, v6, v26, objc_msgSend(v7, "isAutoExposureEnabled"));
    -[_MFXTemporalScalingEffectNRS initRenderResolutionPassesWithDevice:library:]((uint64_t)v8, v6, v26);
    -[_MFXTemporalScalingEffectNRS initOutputResolutionPassesWithDevice:library:]((uint64_t)v8, v6, v26);
    v8->_reset = 1;
    v22 = v8;

  }
  else
  {
    MTLReportFailure();
    v22 = 0;
  }

  return v22;
}

- (void)initExposureWithDevice:(void *)a3 library:(int)a4 autoexposureEnabled:
{
  id v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  id v20;

  v20 = a2;
  v7 = a3;
  if (a1)
  {
    *(_DWORD *)(a1 + 252) = 1065353216;
    *(_DWORD *)(a1 + 56) = 1040187392;
    v8 = objc_msgSend(v20, "newBufferWithLength:options:", 2, 0);
    v9 = *(void **)(a1 + 64);
    *(_QWORD *)(a1 + 64) = v8;

    v10 = objc_msgSend(v20, "newBufferWithLength:options:", 2, 0);
    v11 = *(void **)(a1 + 72);
    *(_QWORD *)(a1 + 72) = v10;

    *(_WORD *)objc_msgSend(*(id *)(a1 + 64), "contents") = 15360;
    *(_WORD *)objc_msgSend(*(id *)(a1 + 72), "contents") = 15360;
    if (a4)
    {
      computeKernel(v7, v20, CFSTR("luma_log_sum_nrs"), 0, 0, 0, 1);
      v12 = objc_claimAutoreleasedReturnValue();
      v13 = *(void **)(a1 + 88);
      *(_QWORD *)(a1 + 88) = v12;

      v14 = objc_msgSend(v20, "newBufferWithLength:options:", 0x2000, 0);
      v15 = *(void **)(a1 + 80);
      *(_QWORD *)(a1 + 80) = v14;

      v16 = (void *)objc_opt_new();
      objc_msgSend(v16, "setConstantValue:type:atIndex:", a1 + 56, 3, 9);
      computeKernel(v7, v20, CFSTR("luma_log_sum_to_exposure"), 0, v16, 0x400uLL, 1);
      v17 = objc_claimAutoreleasedReturnValue();
      v18 = *(void **)(a1 + 96);
      *(_QWORD *)(a1 + 96) = v17;

    }
    else
    {
      computeKernel(v7, v20, CFSTR("exposure_texture_to_buffer"), 0, 0, 0, 0);
      v19 = objc_claimAutoreleasedReturnValue();
      v16 = *(void **)(a1 + 104);
      *(_QWORD *)(a1 + 104) = v19;
    }

  }
}

- (void)initRenderResolutionPassesWithDevice:(void *)a3 library:
{
  id v5;
  id v6;
  int v7;
  int v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  id v28;
  void *v29;
  uint64_t v30;
  void *v31;
  id v32;
  id v33;
  char v34;
  char v35;
  char v36;

  v5 = a2;
  v6 = a3;
  if (a1)
  {
    v7 = objc_msgSend(v5, "supportsFamily:", 1004);
    v36 = v7;
    if ((v7 & 1) != 0)
      v8 = 0;
    else
      v8 = objc_msgSend(v5, "supportsFamily:", 1004);
    v35 = v8;
    v34 = objc_msgSend(v5, "supportsFamily:", 1001);
    objc_msgSend(MEMORY[0x24BDDD740], "texture2DDescriptorWithPixelFormat:width:height:mipmapped:", 115, *(_QWORD *)(a1 + 376), *(_QWORD *)(a1 + 384), 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v9;
    if (v8 | v7)
      v11 = 5;
    else
      v11 = 3;
    objc_msgSend(v9, "setUsage:", v11);
    objc_msgSend(v10, "setStorageMode:", 2);
    objc_msgSend(v10, "setCompressionMode:", 1);
    v12 = objc_msgSend(v5, "newTextureWithDescriptor:", v10);
    v13 = *(void **)(a1 + 112);
    *(_QWORD *)(a1 + 112) = v12;

    objc_msgSend(v10, "setPixelFormat:", 65);
    v14 = objc_msgSend(v5, "newTextureWithDescriptor:", v10);
    v15 = *(void **)(a1 + 120);
    *(_QWORD *)(a1 + 120) = v14;

    objc_msgSend(v10, "setPixelFormat:", 115);
    v16 = objc_msgSend(v5, "newTextureWithDescriptor:", v10);
    v17 = *(void **)(a1 + 128);
    *(_QWORD *)(a1 + 128) = v16;

    objc_msgSend(v10, "setPixelFormat:", 115);
    v18 = objc_msgSend(v5, "newTextureWithDescriptor:", v10);
    v19 = *(void **)(a1 + 136);
    *(_QWORD *)(a1 + 136) = v18;

    v20 = objc_msgSend(v5, "newTextureWithDescriptor:", v10);
    v21 = *(void **)(a1 + 144);
    *(_QWORD *)(a1 + 144) = v20;

    v22 = objc_msgSend(v5, "newTextureWithDescriptor:", v10);
    v23 = *(void **)(a1 + 152);
    *(_QWORD *)(a1 + 152) = v22;

    v24 = (void *)objc_opt_new();
    objc_msgSend(v24, "setConstantValue:type:atIndex:", &v35, 53, 0);
    objc_msgSend(v24, "setConstantValue:type:atIndex:", &v36, 53, 1);
    objc_msgSend(v24, "setConstantValue:type:atIndex:", &v34, 53, 2);
    if (v36)
    {
      v33 = 0;
      tileKernel(v6, v5, CFSTR("unified_low_resolution_tile"), &v33, v24, 512, v25, v26, 115, 65);
      v27 = objc_claimAutoreleasedReturnValue();
      v28 = v33;
      v29 = *(void **)(a1 + 168);
      *(_QWORD *)(a1 + 168) = v27;

    }
    else
    {
      v32 = 0;
      computeKernel(v6, v5, CFSTR("unified_low_resolution_tile"), &v32, v24, 0x200uLL, 1);
      v30 = objc_claimAutoreleasedReturnValue();
      v28 = v32;
      v31 = *(void **)(a1 + 160);
      *(_QWORD *)(a1 + 160) = v30;

      *(_BYTE *)(a1 + 176) = v35;
    }

  }
}

- (void)initOutputResolutionPassesWithDevice:(void *)a3 library:
{
  id v5;
  id v6;
  int v7;
  int v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  id v23;
  void *v24;
  uint64_t v25;
  void *v26;
  id v27;
  id v28;
  char v29;
  char v30;
  char v31;
  char v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  uint64_t v36;

  v5 = a2;
  v6 = a3;
  if (a1)
  {
    v7 = objc_msgSend(v5, "supportsFamily:", 1004);
    v32 = v7;
    if ((v7 & 1) != 0)
      v8 = 0;
    else
      v8 = objc_msgSend(v5, "supportsFamily:", 1004);
    v31 = v8;
    v30 = objc_msgSend(v5, "supportsFamily:", 1001);
    v36 = 0;
    v34 = 0u;
    v35 = 0u;
    v33 = 0u;
    MTLPixelFormatGetInfoForDevice();
    v29 = 0;
    v9 = 2;
    if (v8 | v7)
      v9 = 4;
    *(_QWORD *)(a1 + 288) = v9;
    objc_msgSend(MEMORY[0x24BDDD740], "texture2DDescriptorWithPixelFormat:width:height:mipmapped:", 115, *(_QWORD *)(a1 + 392), *(_QWORD *)(a1 + 400), 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setUsage:", *(_QWORD *)(a1 + 288) | 1);
    objc_msgSend(v10, "setStorageMode:", 2);
    objc_msgSend(v10, "setCompressionMode:", 1);
    v11 = objc_msgSend(v5, "newTextureWithDescriptor:", v10);
    v12 = *(void **)(a1 + 184);
    *(_QWORD *)(a1 + 184) = v11;

    v13 = objc_msgSend(v5, "newTextureWithDescriptor:", v10);
    v14 = *(void **)(a1 + 192);
    *(_QWORD *)(a1 + 192) = v13;

    v15 = objc_msgSend(v5, "newTextureWithDescriptor:", v10);
    v16 = *(void **)(a1 + 200);
    *(_QWORD *)(a1 + 200) = v15;

    v17 = objc_msgSend(v5, "newTextureWithDescriptor:", v10);
    v18 = *(void **)(a1 + 208);
    *(_QWORD *)(a1 + 208) = v17;

    *(_BYTE *)(a1 + 233) = 0;
    v19 = (void *)objc_opt_new();
    objc_msgSend(v19, "setConstantValue:type:atIndex:", &v31, 53, 0);
    objc_msgSend(v19, "setConstantValue:type:atIndex:", &v32, 53, 1);
    objc_msgSend(v19, "setConstantValue:type:atIndex:", &v30, 53, 2);
    objc_msgSend(v19, "setConstantValue:type:atIndex:", &v29, 53, 3);
    objc_msgSend(v19, "setConstantValue:type:atIndex:", a1 + 56, 3, 4);
    if (v32)
    {
      v28 = 0;
      tileKernel(v6, v5, CFSTR("unified_pass_tile"), &v28, v19, 512, v20, v21, 115, 115);
      v22 = objc_claimAutoreleasedReturnValue();
      v23 = v28;
      v24 = *(void **)(a1 + 224);
      *(_QWORD *)(a1 + 224) = v22;

    }
    else
    {
      v27 = 0;
      computeKernel(v6, v5, CFSTR("unified_pass_tile"), &v27, v19, 0x200uLL, 1);
      v25 = objc_claimAutoreleasedReturnValue();
      v23 = v27;
      v26 = *(void **)(a1 + 216);
      *(_QWORD *)(a1 + 216) = v25;

      *(_BYTE *)(a1 + 232) = v31;
    }

  }
}

- (void)setJitterOffsetX:(float)a3
{
  *(float *)self->_jitterOffset = a3;
}

- (float)jitterOffsetX
{
  uint64_t v2;
  float result;

  v2 = *(_QWORD *)self->_jitterOffset;
  LODWORD(result) = v2;
  return result;
}

- (void)setJitterOffsetY:(float)a3
{
  *(float *)&self->_jitterOffset[4] = a3;
}

- (float)jitterOffsetY
{
  return *(float *)&self->_jitterOffset[4];
}

- (void)setMotionVectorScaleX:(float)a3
{
  *(float *)self->_motionVectorScale = a3;
}

- (float)motionVectorScaleX
{
  uint64_t v2;
  float result;

  v2 = *(_QWORD *)self->_motionVectorScale;
  LODWORD(result) = v2;
  return result;
}

- (void)setMotionVectorScaleY:(float)a3
{
  *(float *)&self->_motionVectorScale[4] = a3;
}

- (float)motionVectorScaleY
{
  return *(float *)&self->_motionVectorScale[4];
}

- (void)setReversedDepth:(BOOL)a3
{
  self->_reversedDepth = a3;
}

- (BOOL)reversedDepth
{
  return self->_reversedDepth;
}

- (void)setJitterOffset:(CGPoint)a3
{
  CGFloat y;

  y = a3.y;
  *(float32x2_t *)self->_jitterOffset = vcvt_f32_f64((float64x2_t)a3);
}

- (CGPoint)jitterOffset
{
  float64x2_t v2;
  double v3;
  CGPoint result;

  v2 = vcvtq_f64_f32(*(float32x2_t *)self->_jitterOffset);
  v3 = v2.f64[1];
  result.x = v2.f64[0];
  result.y = v3;
  return result;
}

- (void)setMotionVectorScale:(CGPoint)a3
{
  CGFloat y;

  y = a3.y;
  *(float32x2_t *)self->_motionVectorScale = vcvt_f32_f64((float64x2_t)a3);
}

- (CGPoint)motionVectorScale
{
  float64x2_t v2;
  double v3;
  CGPoint result;

  v2 = vcvtq_f64_f32(*(float32x2_t *)self->_motionVectorScale);
  v3 = v2.f64[1];
  result.x = v2.f64[0];
  result.y = v3;
  return result;
}

- (void)encodeToCommandBuffer:(id)a3
{
  unint64_t inputContentWidth;
  unint64_t inputContentHeight;
  float inputContentMinScale;
  float inputContentMaxScale;
  float outputWidth;
  float outputHeight;
  float v10;
  float v11;
  void *v12;
  int v13;
  int v14;
  unint64_t v15;
  unint64_t v16;
  float32x2_t v17;
  float32x2_t v18;
  float32x2_t v19;
  float32x2_t v20;
  uint64_t v21;
  float v22;
  $345EA15B54670A3662C40A31A96CE5F5 *p_internalOutputResolution;
  int64_t outputTextureFormat;
  uint64_t v25;
  void *v26;
  $5EA42E1BDB25301322B628279FF2588C *p_internalRenderResolution;
  void *v28;
  uint64_t i;
  MTLTexture *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  uint64_t j;
  MTLRenderPipelineState **p_tileKernel;
  unint64_t inputWidth;
  unint64_t inputHeight;
  void *v44;
  uint64_t k;
  MTLTexture *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  MTLFence *fence;
  uint64_t m;
  unint64_t v58;
  unint64_t v59;
  MTLTexture *v60;
  MTLTexture *currHistory0;
  MTLTexture *v62;
  MTLTexture *v63;
  MTLTexture *currHistory1;
  MTLTexture *v65;
  MTLBuffer *v66;
  MTLBuffer *currExposure;
  double v68;
  double v69;
  MTLTexture *v70;
  id v71;
  __int128 v72;
  uint64_t v73;
  _QWORD v74[3];
  __int128 v75;
  uint64_t v76;
  __int128 v77;
  uint64_t v78;
  _QWORD v79[3];
  __int128 v80;
  uint64_t v81;
  _QWORD v82[4];
  MTLTexture *v83;
  float v84;
  _QWORD v85[2];
  _WORD v86[2];
  int64x2_t v87;
  uint64_t v88;
  int64x2_t v89;
  uint64_t v90;
  __int128 v91;
  uint64_t v92;
  int64x2_t v93;
  uint64_t v94;
  uint64_t v95;
  int64x2_t v96;
  __int128 v97;
  uint64_t v98;
  _BYTE v99[40];
  MTLTexture *v100;
  MTLTexture *v101;
  MTLTexture *v102;
  MTLTexture *v103;
  MTLTexture *v104;
  MTLTexture *v105;
  uint64_t v106;

  v106 = *MEMORY[0x24BDAC8D0];
  v71 = a3;
  -[_MTLFXEffect _beginEncode](self, "_beginEncode");
  if (MTLReportFailureTypeEnabled())
  {
    checkInputOutputTextures(self->_colorTexture, self->_depthTexture, self->_motionTexture, self->_outputTexture, self->_inputWidth, self->_inputHeight, self->_colorTextureFormat, self->_inputContentWidth, self->_inputContentHeight, self->_outputWidth, self->_outputHeight, self->_outputTextureFormat);
    inputContentWidth = self->_inputContentWidth;
    inputContentHeight = self->_inputContentHeight;
    inputContentMinScale = self->_inputContentMinScale;
    inputContentMaxScale = self->_inputContentMaxScale;
    outputWidth = (float)self->_outputWidth;
    outputHeight = (float)self->_outputHeight;
    v10 = fminf(outputWidth / (float)inputContentWidth, outputHeight / (float)inputContentHeight);
    if (v10 < inputContentMinScale)
    {
      v68 = v10;
      v69 = inputContentMinScale;
      MTLReportFailure();
    }
    v11 = fmaxf(outputWidth / (float)(inputContentWidth + 1), outputHeight / (float)(inputContentHeight + 1));
    if (v11 > inputContentMaxScale)
    {
      v68 = v11;
      v69 = inputContentMaxScale;
      MTLReportFailure();
    }
    if (-[MTLTexture storageMode](self->_outputTexture, "storageMode", *(_QWORD *)&v68, *(_QWORD *)&v69) != 2)
      MTLReportFailure();
  }
  MetalFxScopedSignpost::MetalFxScopedSignpost((MetalFxScopedSignpost *)v99, 0, (uint64_t)self, 0, 0, 0);
  if (MTLTraceEnabled())
  {
    objc_msgSend(v71, "globalTraceObjectID");
    kdebug_trace();
  }
  objc_msgSend(v71, "computeCommandEncoder");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[_MTLFXEffect _didCreateComputeCommandEncoder:forEncode:](self, "_didCreateComputeCommandEncoder:forEncode:", v12, self->super.super._encodeID);
  if (self->_fence)
    objc_msgSend(v12, "waitForFence:");
  if (self->_internalExposure.lumaLogSums)
  {
    v13 = self->_inputContentWidth;
    v14 = self->_inputContentHeight;
    WORD1(v100) = v14;
    LOWORD(v100) = v13;
    LODWORD(v85[0]) = v14 * v13;
    objc_msgSend(v12, "setComputePipelineState:", self->_internalExposure.lumaLogSumKernel);
    objc_msgSend(v12, "setTexture:atIndex:", self->_colorTexture, 0);
    objc_msgSend(v12, "setBytes:length:atIndex:", &v100, 4, 1);
    objc_msgSend(v12, "setBuffer:offset:atIndex:", self->_internalExposure.lumaLogSums, 0, 0);
    v97 = xmmword_23455A840;
    v98 = 1;
    v95 = -[MTLComputePipelineState threadExecutionWidth](self->_internalExposure.lumaLogSumKernel, "threadExecutionWidth");
    v96 = vdupq_n_s64(1uLL);
    objc_msgSend(v12, "dispatchThreadgroups:threadsPerThreadgroup:", &v97, &v95);
    objc_msgSend(v12, "setComputePipelineState:", self->_internalExposure.lumaLogSumToExposureKernel);
    objc_msgSend(v12, "setBuffer:offset:atIndex:", self->_internalExposure.lumaLogSums, 0, 0);
    objc_msgSend(v12, "setBytes:length:atIndex:", v85, 4, 1);
    objc_msgSend(v12, "setBuffer:offset:atIndex:", self->_internalExposure.currExposure, 0, 2);
    objc_msgSend(v12, "setBuffer:offset:atIndex:", self->_internalExposure.prevExposure, 0, 3);
    objc_msgSend(v12, "setBuffer:offset:atIndex:", self->_internal_is_history_invalid, 0, 4);
    objc_msgSend(v12, "setBytes:length:atIndex:", &self->_reset, 1, 5);
    v93 = vdupq_n_s64(1uLL);
    v94 = 1;
    v91 = xmmword_23455A850;
    v92 = 1;
    objc_msgSend(v12, "dispatchThreadgroups:threadsPerThreadgroup:", &v93, &v91);
  }
  else
  {
    objc_msgSend(v12, "setComputePipelineState:", self->_internalExposure.exposureToBufferKernel);
    objc_msgSend(v12, "setTexture:atIndex:", self->_exposureTexture, 0);
    objc_msgSend(v12, "setBuffer:offset:atIndex:", self->_internalExposure.currExposure, 0, 0);
    objc_msgSend(v12, "setBuffer:offset:atIndex:", self->_internalExposure.prevExposure, 0, 1);
    objc_msgSend(v12, "setBuffer:offset:atIndex:", self->_internal_is_history_invalid, 0, 2);
    objc_msgSend(v12, "setBytes:length:atIndex:", &self->_reset, 1, 3);
    v89 = vdupq_n_s64(1uLL);
    v90 = 1;
    v87 = v89;
    v88 = 1;
    objc_msgSend(v12, "dispatchThreads:threadsPerThreadgroup:", &v89, &v87);
  }
  v15 = self->_inputContentWidth;
  v16 = self->_inputContentHeight;
  v86[1] = v16;
  v86[0] = v15;
  v17.f32[0] = (float)v15;
  v17.f32[1] = (float)v16;
  v18 = vrecpe_f32(v17);
  v19 = vmul_f32(v18, vrecps_f32(v17, v18));
  v20 = vmul_f32(v19, vrecps_f32(v17, v19));
  v21 = *(_QWORD *)self->_jitterOffset;
  v85[0] = vmul_f32(*(float32x2_t *)self->_motionVectorScale, v20);
  v85[1] = v21;
  v22 = 1.0;
  if (!self->_reversedDepth)
    v22 = -1.0;
  v84 = v22;
  v70 = self->_outputTexture;
  p_internalOutputResolution = &self->_internalOutputResolution;
  if (self->_internalOutputResolution.emulateSRGB)
  {
    outputTextureFormat = self->_outputTextureFormat;
    if (outputTextureFormat > 70)
    {
      if (outputTextureFormat == 71)
      {
        v25 = 70;
        goto LABEL_28;
      }
      if (outputTextureFormat == 81)
      {
        v25 = 80;
        goto LABEL_28;
      }
    }
    else
    {
      if (outputTextureFormat == 11)
      {
        v25 = 10;
        goto LABEL_28;
      }
      if (outputTextureFormat == 31)
      {
        v25 = 30;
LABEL_28:
        v26 = (void *)-[MTLTexture newTextureViewWithPixelFormat:](v70, "newTextureViewWithPixelFormat:", v25);

        v82[0] = MEMORY[0x24BDAC760];
        v82[1] = 3221225472;
        v82[2] = __54___MFXTemporalScalingEffectNRS_encodeToCommandBuffer___block_invoke;
        v82[3] = &unk_2505A0500;
        v70 = v26;
        v83 = v70;
        objc_msgSend(v71, "addCompletedHandler:", v82);

        goto LABEL_29;
      }
    }
    v25 = 0;
    goto LABEL_28;
  }
LABEL_29:
  p_internalRenderResolution = &self->_internalRenderResolution;
  if (self->_internalRenderResolution.tileKernel)
  {
    if (v12)
    {
      objc_msgSend(v12, "endEncoding");

    }
    v100 = p_internalRenderResolution->colorRangeReduced;
    v101 = self->_internalRenderResolution.dilatedFlow;
    v102 = self->_internalRenderResolution.pixelData;
    v103 = self->_internalRenderResolution.variance0;
    v104 = self->_internalRenderResolution.variance1;
    v105 = self->_internalRenderResolution.variance2;
    objc_msgSend(MEMORY[0x24BDDD690], "renderPassDescriptor");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "setTileWidth:", 32);
    objc_msgSend(v28, "setTileHeight:", 16);
    objc_msgSend(v28, "setThreadgroupMemoryLength:", 10080);
    for (i = 0; i != 6; ++i)
    {
      v30 = *(&v100 + i);
      objc_msgSend(v28, "colorAttachments");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "objectAtIndexedSubscript:", i);
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "setLoadAction:", 0);

      objc_msgSend(v28, "colorAttachments");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v33, "objectAtIndexedSubscript:", i);
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v34, "setClearColor:", 0.0, 0.0, 0.0, 0.0);

      objc_msgSend(v28, "colorAttachments");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v35, "objectAtIndexedSubscript:", i);
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v36, "setStoreAction:", 1);

      objc_msgSend(v28, "colorAttachments");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v37, "objectAtIndexedSubscript:", i);
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v38, "setTexture:", v30);

    }
    objc_msgSend(v71, "renderCommandEncoderWithDescriptor:", v28);
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    -[_MTLFXEffect _didCreateRenderCommandEncoder:forEncode:](self, "_didCreateRenderCommandEncoder:forEncode:", v39, self->super.super._encodeID);
    objc_msgSend(v39, "setTileTexture:atIndex:", self->_colorTexture, 0);
    objc_msgSend(v39, "setTileTexture:atIndex:", self->_depthTexture, 1);
    objc_msgSend(v39, "setTileTexture:atIndex:", self->_motionTexture, 2);
    objc_msgSend(v39, "setTileBytes:length:atIndex:", &v84, 4, 0);
    objc_msgSend(v39, "setTileBytes:length:atIndex:", v85, 16, 1);
    objc_msgSend(v39, "setTileBytes:length:atIndex:", v86, 4, 2);
    objc_msgSend(v39, "setTileBytes:length:atIndex:", &self->_preExposure, 4, 3);
    objc_msgSend(v39, "setTileBuffer:offset:atIndex:", self->_internalExposure.currExposure, 0, 4);
    objc_msgSend(v39, "setTileBuffer:offset:atIndex:", self->_internal_is_history_invalid, 0, 6);
    objc_msgSend(v39, "setThreadgroupMemoryLength:offset:atIndex:", 5760, 0, 0);
    objc_msgSend(v39, "setThreadgroupMemoryLength:offset:atIndex:", 1440, 5760, 1);
    objc_msgSend(v39, "setThreadgroupMemoryLength:offset:atIndex:", 2880, 7200, 2);
    objc_msgSend(v39, "setRenderPipelineState:", self->_internalRenderResolution.tileKernel);
    v80 = xmmword_23455A860;
    v81 = 1;
    objc_msgSend(v39, "dispatchThreadsPerTile:", &v80);
    objc_msgSend(v39, "endEncoding");

    for (j = 40; j != -8; j -= 8)
    p_tileKernel = &self->_internalOutputResolution.tileKernel;
    if (!self->_internalOutputResolution.tileKernel)
    {
LABEL_37:
      objc_msgSend(v71, "computeCommandEncoder");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[_MTLFXEffect _didCreateComputeCommandEncoder:forEncode:](self, "_didCreateComputeCommandEncoder:forEncode:", v12, self->super.super._encodeID);
LABEL_51:
      v58 = self->_outputWidth;
      v59 = self->_outputHeight;
      objc_msgSend(v12, "setTexture:atIndex:", p_internalRenderResolution->colorRangeReduced, 0);
      objc_msgSend(v12, "setTexture:atIndex:", self->_internalRenderResolution.pixelData, 1);
      objc_msgSend(v12, "setTexture:atIndex:", self->_internalRenderResolution.dilatedFlow, 2);
      objc_msgSend(v12, "setTexture:atIndex:", p_internalOutputResolution->prevHistory0, 4);
      objc_msgSend(v12, "setTexture:atIndex:", self->_internalOutputResolution.prevHistory1, 5);
      objc_msgSend(v12, "setTexture:atIndex:", self->_internalOutputResolution.currHistory0, 6);
      objc_msgSend(v12, "setTexture:atIndex:", self->_internalOutputResolution.currHistory1, 7);
      objc_msgSend(v12, "setTexture:atIndex:", v70, 8);
      objc_msgSend(v12, "setTexture:atIndex:", self->_internalRenderResolution.variance0, 12);
      objc_msgSend(v12, "setTexture:atIndex:", self->_internalRenderResolution.variance1, 13);
      objc_msgSend(v12, "setTexture:atIndex:", self->_internalRenderResolution.variance2, 14);
      objc_msgSend(v12, "setBytes:length:atIndex:", v85, 16, 1);
      objc_msgSend(v12, "setBytes:length:atIndex:", v86, 4, 2);
      objc_msgSend(v12, "setBytes:length:atIndex:", &self->_preExposure, 4, 3);
      objc_msgSend(v12, "setBuffer:offset:atIndex:", self->_internalExposure.currExposure, 0, 4);
      objc_msgSend(v12, "setBuffer:offset:atIndex:", self->_internalExposure.prevExposure, 0, 5);
      objc_msgSend(v12, "setBuffer:offset:atIndex:", self->_internal_is_history_invalid, 0, 6);
      objc_msgSend(v12, "setThreadgroupMemoryLength:atIndex:", 3840, 0);
      objc_msgSend(v12, "setThreadgroupMemoryLength:atIndex:", 7680, 1);
      objc_msgSend(v12, "setThreadgroupMemoryLength:atIndex:", 7680, 2);
      if (self->_internalOutputResolution.kernelUsesImageblock)
        objc_msgSend(v12, "setImageblockWidth:height:", 32, 16);
      objc_msgSend(v12, "setComputePipelineState:", self->_internalOutputResolution.kernel);
      v74[0] = (v58 + 31) >> 5;
      v74[1] = (v59 + 15) >> 4;
      v74[2] = 1;
      v72 = xmmword_23455A860;
      v73 = 1;
      objc_msgSend(v12, "dispatchThreadgroups:threadsPerThreadgroup:", v74, &v72);
      if (self->_fence)
        objc_msgSend(v12, "updateFence:");
      if (v12)
      {
        objc_msgSend(v12, "endEncoding");

      }
      goto LABEL_57;
    }
  }
  else
  {
    inputWidth = self->_inputWidth;
    inputHeight = self->_inputHeight;
    objc_msgSend(v12, "setTexture:atIndex:", self->_colorTexture, 0);
    objc_msgSend(v12, "setTexture:atIndex:", self->_depthTexture, 1);
    objc_msgSend(v12, "setTexture:atIndex:", self->_motionTexture, 2);
    objc_msgSend(v12, "setTexture:atIndex:", p_internalRenderResolution->colorRangeReduced, 3);
    objc_msgSend(v12, "setTexture:atIndex:", self->_internalRenderResolution.dilatedFlow, 4);
    objc_msgSend(v12, "setTexture:atIndex:", self->_internalRenderResolution.pixelData, 5);
    objc_msgSend(v12, "setTexture:atIndex:", self->_internalRenderResolution.variance0, 6);
    objc_msgSend(v12, "setTexture:atIndex:", self->_internalRenderResolution.variance1, 7);
    objc_msgSend(v12, "setTexture:atIndex:", self->_internalRenderResolution.variance2, 8);
    objc_msgSend(v12, "setBytes:length:atIndex:", &v84, 4, 0);
    objc_msgSend(v12, "setBytes:length:atIndex:", v85, 16, 1);
    objc_msgSend(v12, "setBytes:length:atIndex:", v86, 4, 2);
    objc_msgSend(v12, "setBytes:length:atIndex:", &self->_preExposure, 4, 3);
    objc_msgSend(v12, "setBuffer:offset:atIndex:", self->_internalExposure.currExposure, 0, 4);
    objc_msgSend(v12, "setBuffer:offset:atIndex:", self->_internal_is_history_invalid, 0, 6);
    objc_msgSend(v12, "setThreadgroupMemoryLength:atIndex:", 5760, 0);
    objc_msgSend(v12, "setThreadgroupMemoryLength:atIndex:", 1440, 1);
    objc_msgSend(v12, "setThreadgroupMemoryLength:atIndex:", 2880, 2);
    if (self->_internalRenderResolution.kernelUsesImageblock)
      objc_msgSend(v12, "setImageblockWidth:height:", 32, 16);
    objc_msgSend(v12, "setComputePipelineState:", self->_internalRenderResolution.kernel);
    v79[0] = (inputWidth + 31) >> 5;
    v79[1] = (inputHeight + 15) >> 4;
    v79[2] = 1;
    v77 = xmmword_23455A860;
    v78 = 1;
    objc_msgSend(v12, "dispatchThreadgroups:threadsPerThreadgroup:", v79, &v77);
    p_tileKernel = &self->_internalOutputResolution.tileKernel;
    if (!self->_internalOutputResolution.tileKernel)
    {
      if (v12)
        goto LABEL_51;
      goto LABEL_37;
    }
    if (v12)
    {
      objc_msgSend(v12, "endEncoding");

    }
  }
  v100 = self->_internalOutputResolution.currHistory0;
  v101 = self->_internalOutputResolution.currHistory1;
  v102 = v70;
  objc_msgSend(MEMORY[0x24BDDD690], "renderPassDescriptor");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v44, "setTileWidth:", 32);
  objc_msgSend(v44, "setTileHeight:", 16);
  objc_msgSend(v44, "setThreadgroupMemoryLength:", 19200);
  for (k = 0; k != 3; ++k)
  {
    v46 = *(&v100 + k);
    objc_msgSend(v44, "colorAttachments");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v47, "objectAtIndexedSubscript:", k);
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v48, "setLoadAction:", 0);

    objc_msgSend(v44, "colorAttachments");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v49, "objectAtIndexedSubscript:", k);
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v50, "setClearColor:", 0.0, 0.0, 0.0, 0.0);

    objc_msgSend(v44, "colorAttachments");
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v51, "objectAtIndexedSubscript:", k);
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v52, "setStoreAction:", 1);

    objc_msgSend(v44, "colorAttachments");
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v53, "objectAtIndexedSubscript:", k);
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v54, "setTexture:", v46);

  }
  objc_msgSend(v71, "renderCommandEncoderWithDescriptor:", v44);
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  -[_MTLFXEffect _didCreateRenderCommandEncoder:forEncode:](self, "_didCreateRenderCommandEncoder:forEncode:", v55, self->super.super._encodeID);
  objc_msgSend(v55, "setTileTexture:atIndex:", p_internalRenderResolution->colorRangeReduced, 0);
  objc_msgSend(v55, "setTileTexture:atIndex:", self->_internalRenderResolution.pixelData, 1);
  objc_msgSend(v55, "setTileTexture:atIndex:", self->_internalRenderResolution.dilatedFlow, 2);
  objc_msgSend(v55, "setTileTexture:atIndex:", p_internalOutputResolution->prevHistory0, 4);
  objc_msgSend(v55, "setTileTexture:atIndex:", self->_internalOutputResolution.prevHistory1, 5);
  objc_msgSend(v55, "setTileTexture:atIndex:", self->_internalRenderResolution.variance0, 12);
  objc_msgSend(v55, "setTileTexture:atIndex:", self->_internalRenderResolution.variance1, 13);
  objc_msgSend(v55, "setTileTexture:atIndex:", self->_internalRenderResolution.variance2, 14);
  objc_msgSend(v55, "setTileBytes:length:atIndex:", v85, 16, 1);
  objc_msgSend(v55, "setTileBytes:length:atIndex:", v86, 4, 2);
  objc_msgSend(v55, "setTileBytes:length:atIndex:", &self->_preExposure, 4, 3);
  objc_msgSend(v55, "setTileBuffer:offset:atIndex:", self->_internalExposure.currExposure, 0, 4);
  objc_msgSend(v55, "setTileBuffer:offset:atIndex:", self->_internalExposure.prevExposure, 0, 5);
  objc_msgSend(v55, "setTileBuffer:offset:atIndex:", self->_internal_is_history_invalid, 0, 6);
  objc_msgSend(v55, "setThreadgroupMemoryLength:offset:atIndex:", 3840, 0, 0);
  objc_msgSend(v55, "setThreadgroupMemoryLength:offset:atIndex:", 7680, 3840, 1);
  objc_msgSend(v55, "setThreadgroupMemoryLength:offset:atIndex:", 7680, 11520, 2);
  objc_msgSend(v55, "setRenderPipelineState:", *p_tileKernel);
  v75 = xmmword_23455A860;
  v76 = 1;
  objc_msgSend(v55, "dispatchThreadsPerTile:", &v75);
  fence = self->_fence;
  if (fence)
    objc_msgSend(v55, "updateFence:afterStages:", fence, 2);
  objc_msgSend(v55, "endEncoding");

  for (m = 16; m != -8; m -= 8)
LABEL_57:
  v60 = p_internalOutputResolution->prevHistory0;
  objc_storeStrong((id *)&self->_internalOutputResolution.prevHistory0, self->_internalOutputResolution.currHistory0);
  currHistory0 = self->_internalOutputResolution.currHistory0;
  self->_internalOutputResolution.currHistory0 = v60;
  v62 = v60;

  v63 = self->_internalOutputResolution.prevHistory1;
  objc_storeStrong((id *)&self->_internalOutputResolution.prevHistory1, self->_internalOutputResolution.currHistory1);
  currHistory1 = self->_internalOutputResolution.currHistory1;
  self->_internalOutputResolution.currHistory1 = v63;
  v65 = v63;

  v66 = self->_internalExposure.prevExposure;
  objc_storeStrong((id *)&self->_internalExposure.prevExposure, self->_internalExposure.currExposure);
  currExposure = self->_internalExposure.currExposure;
  self->_internalExposure.currExposure = v66;

  self->_reset = 0;
  MetalFxScopedSignpost::~MetalFxScopedSignpost((MetalFxScopedSignpost *)v99);

}

- (void)encodeToCommandQueue:(id)a3
{
  id v4;

  objc_msgSend(a3, "commandBuffer");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[_MFXTemporalScalingEffectNRS encodeToCommandBuffer:](self, "encodeToCommandBuffer:");
  objc_msgSend(v4, "commit");

}

- (unint64_t)colorTextureUsage
{
  return self->_colorTextureUsage;
}

- (unint64_t)depthTextureUsage
{
  return self->_depthTextureUsage;
}

- (unint64_t)motionTextureUsage
{
  return self->_motionTextureUsage;
}

- (unint64_t)reactiveTextureUsage
{
  return self->_reactiveTextureUsage;
}

- (unint64_t)outputTextureUsage
{
  return self->_outputTextureUsage;
}

- (unint64_t)inputContentWidth
{
  return self->_inputContentWidth;
}

- (void)setInputContentWidth:(unint64_t)a3
{
  self->_inputContentWidth = a3;
}

- (unint64_t)inputContentHeight
{
  return self->_inputContentHeight;
}

- (void)setInputContentHeight:(unint64_t)a3
{
  self->_inputContentHeight = a3;
}

- (MTLTexture)colorTexture
{
  return self->_colorTexture;
}

- (void)setColorTexture:(id)a3
{
  objc_storeStrong((id *)&self->_colorTexture, a3);
}

- (MTLTexture)depthTexture
{
  return self->_depthTexture;
}

- (void)setDepthTexture:(id)a3
{
  objc_storeStrong((id *)&self->_depthTexture, a3);
}

- (MTLTexture)motionTexture
{
  return self->_motionTexture;
}

- (void)setMotionTexture:(id)a3
{
  objc_storeStrong((id *)&self->_motionTexture, a3);
}

- (MTLTexture)outputTexture
{
  return self->_outputTexture;
}

- (void)setOutputTexture:(id)a3
{
  objc_storeStrong((id *)&self->_outputTexture, a3);
}

- (BOOL)reset
{
  return self->_reset;
}

- (void)setReset:(BOOL)a3
{
  self->_reset = a3;
}

- (BOOL)isDepthReversed
{
  return self->_reversedDepth;
}

- (void)setDepthReversed:(BOOL)a3
{
  self->_reversedDepth = a3;
}

- (unint64_t)colorTextureFormat
{
  return self->_colorTextureFormat;
}

- (unint64_t)depthTextureFormat
{
  return self->_depthTextureFormat;
}

- (unint64_t)motionTextureFormat
{
  return self->_motionTextureFormat;
}

- (unint64_t)outputTextureFormat
{
  return self->_outputTextureFormat;
}

- (unint64_t)inputWidth
{
  return self->_inputWidth;
}

- (unint64_t)inputHeight
{
  return self->_inputHeight;
}

- (unint64_t)outputWidth
{
  return self->_outputWidth;
}

- (unint64_t)outputHeight
{
  return self->_outputHeight;
}

- (float)inputContentMinScale
{
  return self->_inputContentMinScale;
}

- (float)inputContentMaxScale
{
  return self->_inputContentMaxScale;
}

- (MTLFence)fence
{
  return self->_fence;
}

- (void)setFence:(id)a3
{
  objc_storeStrong((id *)&self->_fence, a3);
}

- (CGPoint)previousJitterOffset
{
  double x;
  double y;
  CGPoint result;

  x = self->_previousJitterOffset.x;
  y = self->_previousJitterOffset.y;
  result.y = y;
  result.x = x;
  return result;
}

- (void)setPreviousJitterOffset:(CGPoint)a3
{
  self->_previousJitterOffset = a3;
}

- (MTLTexture)exposureTexture
{
  return self->_exposureTexture;
}

- (void)setExposureTexture:(id)a3
{
  objc_storeStrong((id *)&self->_exposureTexture, a3);
}

- (float)preExposure
{
  return self->_preExposure;
}

- (void)setPreExposure:(float)a3
{
  self->_preExposure = a3;
}

- (__n128)currentWorldToViewMatrix
{
  return a1[29];
}

- (__n128)setCurrentWorldToViewMatrix:(__n128)a3
{
  result[29] = a2;
  result[30] = a3;
  result[31] = a4;
  result[32] = a5;
  return result;
}

- (__n128)currentViewToClipMatrix
{
  return a1[33];
}

- (__n128)setCurrentViewToClipMatrix:(__n128)a3
{
  result[33] = a2;
  result[34] = a3;
  result[35] = a4;
  result[36] = a5;
  return result;
}

- (__n128)previousWorldToViewMatrix
{
  return a1[37];
}

- (__n128)setPreviousWorldToViewMatrix:(__n128)a3
{
  result[37] = a2;
  result[38] = a3;
  result[39] = a4;
  result[40] = a5;
  return result;
}

- (__n128)previousViewToClipMatrix
{
  return a1[41];
}

- (__n128)setPreviousViewToClipMatrix:(__n128)a3
{
  result[41] = a2;
  result[42] = a3;
  result[43] = a4;
  result[44] = a5;
  return result;
}

- (MTLTexture)debugTexture
{
  return self->_debugTexture;
}

- (void)setDebugTexture:(id)a3
{
  objc_storeStrong((id *)&self->_debugTexture, a3);
}

- (MTLTexture)reactiveMaskTexture
{
  return self->_reactiveMaskTexture;
}

- (void)setReactiveMaskTexture:(id)a3
{
  objc_storeStrong((id *)&self->_reactiveMaskTexture, a3);
}

- (unint64_t)executionMode
{
  return self->_executionMode;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_reactiveMaskTexture, 0);
  objc_storeStrong((id *)&self->_debugTexture, 0);
  objc_storeStrong((id *)&self->_exposureTexture, 0);
  objc_storeStrong((id *)&self->_fence, 0);
  objc_storeStrong((id *)&self->_outputTexture, 0);
  objc_storeStrong((id *)&self->_motionTexture, 0);
  objc_storeStrong((id *)&self->_depthTexture, 0);
  objc_storeStrong((id *)&self->_colorTexture, 0);

  objc_storeStrong((id *)&self->_internal_is_history_invalid, 0);
}

- (id).cxx_construct
{
  *((_OWORD *)self + 4) = 0u;
  *((_OWORD *)self + 5) = 0u;
  *((_OWORD *)self + 6) = 0u;
  *((_OWORD *)self + 9) = 0u;
  *((_OWORD *)self + 10) = 0u;
  *((_OWORD *)self + 7) = 0u;
  *((_OWORD *)self + 8) = 0u;
  *(_OWORD *)((char *)self + 184) = 0u;
  *(_OWORD *)((char *)self + 200) = 0u;
  *(_OWORD *)((char *)self + 216) = 0u;
  return self;
}

@end
