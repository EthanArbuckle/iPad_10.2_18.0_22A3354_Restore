@implementation AVTARMaskRenderer

- (AVTARMaskRenderer)initWithOwner:(id)a3 presentationConfiguration:(id)a4 techniqueDidChangeHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  AVTARMaskRenderer *v11;
  NSObject *v12;
  uint64_t v13;
  id techniqueDidChangeHandler;
  id WeakRetained;
  void *v16;
  NSObject *v17;
  uint64_t v18;
  AVTMetalHelper *metalHelper;
  objc_super v21;
  uint64_t v22;
  _QWORD v23[2];

  v23[1] = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  v21.receiver = self;
  v21.super_class = (Class)AVTARMaskRenderer;
  v11 = -[AVTARMaskRenderer init](&v21, sel_init);
  if (v11)
  {
    if ((objc_msgSend(v9, "usesAR") & 1) == 0)
    {
      avt_default_log();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
        -[AVTARMaskRenderer initWithOwner:presentationConfiguration:techniqueDidChangeHandler:].cold.2();

    }
    objc_storeStrong((id *)&v11->_presentationConfiguration, a4);
    v11->_pipelineKind = 0;
    objc_storeWeak((id *)&v11->_owner, v8);
    objc_opt_class();
    v11->_ownerIsView = objc_opt_isKindOfClass() & 1;
    v13 = objc_msgSend(v10, "copy");
    techniqueDidChangeHandler = v11->_techniqueDidChangeHandler;
    v11->_techniqueDidChangeHandler = (id)v13;

    if (AVTDebugARMask_onceToken != -1)
      dispatch_once(&AVTDebugARMask_onceToken, &__block_literal_global_10);
    v11->_debugMode = AVTDebugARMask_debugMode;
    *(_WORD *)&v11->_writeID = 256;
    v11->_depthSmoothingFactor = 0.5;
    v11->_depthDataIsMirrored = 0;
    v11->_interfaceOrientation = 1;
    WeakRetained = objc_loadWeakRetained((id *)&v11->_owner);
    objc_msgSend(WeakRetained, "device");
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v16)
    {
      avt_default_log();
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
        -[AVTARMaskRenderer initWithOwner:presentationConfiguration:techniqueDidChangeHandler:].cold.1(v17);

    }
    v22 = *MEMORY[0x1E0CA8F58];
    v23[0] = &unk_1EA655960;
    CVMetalTextureCacheCreate(0, 0, v16, (CFDictionaryRef)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v23, &v22, 1), &v11->_textureCache);
    +[AVTMetalHelper helperForDevice:]((uint64_t)AVTMetalHelper, v16);
    v18 = objc_claimAutoreleasedReturnValue();
    metalHelper = v11->_metalHelper;
    v11->_metalHelper = (AVTMetalHelper *)v18;

  }
  return v11;
}

- (AVTARMaskRenderer)init
{
  -[AVTARMaskRenderer doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);

  return 0;
}

- (SCNTechnique)technique
{
  return self->_technique;
}

- (AVTPresentationConfiguration)presentationConfiguration
{
  return self->_presentationConfiguration;
}

- (void)setPresentationConfiguration:(id)a3
{
  AVTPresentationConfiguration *v5;
  AVTPresentationConfiguration *v6;
  NSObject *v7;

  v5 = (AVTPresentationConfiguration *)a3;
  v6 = v5;
  if (self->_presentationConfiguration != v5)
  {
    if (!-[AVTPresentationConfiguration usesAR](v5, "usesAR"))
    {
      avt_default_log();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
        -[AVTARMaskRenderer initWithOwner:presentationConfiguration:techniqueDidChangeHandler:].cold.2();

    }
    objc_storeStrong((id *)&self->_presentationConfiguration, a3);
    -[AVTARMaskRenderer reloadTechnique](self, "reloadTechnique");
  }

}

- (void)dealloc
{
  SCNTechnique *technique;
  __CVMetalTextureCache *textureCache;
  objc_super v5;

  technique = self->_technique;
  self->_technique = 0;

  (*((void (**)(void))self->_techniqueDidChangeHandler + 2))();
  textureCache = self->_textureCache;
  if (textureCache)
    CFRelease(textureCache);
  v5.receiver = self;
  v5.super_class = (Class)AVTARMaskRenderer;
  -[AVTARMaskRenderer dealloc](&v5, sel_dealloc);
}

- (void)updateMaskParametersAtTime:(double)a3
{
  float32x4_t v4;
  void *v5;
  AVTPresentationConfiguration *v6;

  if (self->_pipelineKind == 1
    && -[AVTPresentationConfiguration internalStyle](self->_presentationConfiguration, "internalStyle", a3) == 3)
  {
    v6 = self->_presentationConfiguration;
    -[AVTPresentationConfiguration shadableKeyColorComponents](v6, "shadableKeyColorComponents");
    if ((vmaxvq_u32((uint32x4_t)vmvnq_s8((int8x16_t)vceqq_f32(*(float32x4_t *)&self->_anon_108[8], v4))) & 0x80000000) != 0)
    {
      *(float32x4_t *)&self->_anon_108[8] = v4;
      objc_msgSend(MEMORY[0x1E0CB3B18], "avt_valueWithFloat4_usableWithKVCForSCNVector4:");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      -[SCNTechnique setObject:forKeyedSubscript:](self->_technique, "setObject:forKeyedSubscript:", v5, CFSTR("chromaKeyColor_symbol"));

    }
  }
}

- (void)updateMaskParametersWithRootJointNode:(id)a3
{
  objc_msgSend(a3, "simdWorldPosition");
  -[AVTARMaskRenderer _updateMaskParametersWithRootJointPivotPosition:](self, "_updateMaskParametersWithRootJointPivotPosition:");
}

- (void)updateMaskParametersWithRootJointNodes:(id)a3
{
  void *v4;
  double v5;
  double v6;

  objc_msgSend(a3, "firstObject");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "simdWorldPosition");
  v6 = v5;

  -[AVTARMaskRenderer _updateMaskParametersWithRootJointPivotPosition:](self, "_updateMaskParametersWithRootJointPivotPosition:", v6);
}

- (void)_updateMaskParametersWithRootJointPivotPosition:(AVTARMaskRenderer *)self
{
  __int128 v2;
  AVTRendererTechniqueSupport **p_owner;
  id WeakRetained;
  float32x4_t v6;
  id v7;
  int8x8_t v8;
  id v9;
  __int128 v10;
  id v11;
  void *v12;
  int8x16_t v13;
  int8x16_t v14;
  float v15;
  float64x2_t v16;
  float64_t v17;
  float64_t v18;
  double v19;
  void *v20;
  double v21;
  void *v22;
  double v23;
  void *v24;
  double v25;
  void *v26;
  double v27;
  void *v28;
  double v29;
  int8x8_t v30;
  float32x4_t v31;
  id v32[2];
  id v33[2];
  void *v34;

  if (self->_uniforms.headZ != (float)(*((float *)&v2 + 2) / -100.0))
  {
    self->_uniforms.headZ = *((float *)&v2 + 2) / -100.0;
    p_owner = &self->_owner;
    *(_OWORD *)v32 = v2;
    WeakRetained = objc_loadWeakRetained((id *)&self->_owner);
    objc_msgSend(WeakRetained, "avt_simdProjectPoint:", *(double *)v32);
    v31 = v6;

    v7 = objc_loadWeakRetained((id *)p_owner);
    objc_msgSend(v7, "avt_simdProjectPoint:", *(double *)vaddq_f32(*(float32x4_t *)v32, (float32x4_t)xmmword_1DD26A210).i64);
    v30 = v8;

    v9 = objc_loadWeakRetained((id *)p_owner);
    objc_msgSend(v9, "avt_simdProjectPoint:", *(double *)vaddq_f32(*(float32x4_t *)v32, (float32x4_t)xmmword_1DD26A220).i64);
    *(_OWORD *)v33 = v10;

    *(float32x2_t *)&self->_uniforms.shadowUVOffset = vsub_f32((float32x2_t)vext_s8(v30, (int8x8_t)v33[0], 4uLL), (float32x2_t)vrev64_s32(*(int32x2_t *)v31.f32));
    LODWORD(self->_uniforms.shadowMaskSizeV) = vsubq_f32(*(float32x4_t *)v33, v31).i32[1];
    *(_QWORD *)&self->_uniforms.neckU = v31.i64[0];
    LODWORD(v9) = self->_ownerIsView;
    v11 = objc_loadWeakRetained((id *)p_owner);
    v12 = v11;
    if ((_DWORD)v9)
    {
      objc_msgSend(v11, "avt_simdViewport");
      v14.i64[1] = v13.i64[1];
      v14.i64[0] = v13.i64[1];
      *(float32x4_t *)&self->_uniforms.shadowUVOffset = vdivq_f32(*(float32x4_t *)&self->_uniforms.shadowUVOffset, (float32x4_t)vextq_s8(v13, v14, 0xCuLL));
      v15 = self->_uniforms.neckV / *(float *)&v13.i32[3];
    }
    else
    {
      objc_msgSend(v11, "_backingSize");
      v17 = self->_uniforms.neckV / v16.f64[0];
      v16.f64[1] = v18;
      *(float32x4_t *)&self->_uniforms.shadowUVOffset = vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(vdivq_f64(vcvtq_f64_f32(*(float32x2_t *)&self->_uniforms.shadowUVOffset), v16)), vdivq_f64(vcvt_hight_f64_f32(*(float32x4_t *)&self->_uniforms.shadowUVOffset), v16));
      v15 = v17;
    }
    self->_uniforms.neckV = v15;

    *(float *)&v19 = self->_uniforms.headZ;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[SCNTechnique setObject:forKeyedSubscript:](self->_technique, "setObject:forKeyedSubscript:", v20, CFSTR("headZ_symbol"));

    *(float *)&v21 = self->_uniforms.neckU;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v21);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[SCNTechnique setObject:forKeyedSubscript:](self->_technique, "setObject:forKeyedSubscript:", v22, CFSTR("neckU_symbol"));

    *(float *)&v23 = self->_uniforms.neckV;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v23);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    -[SCNTechnique setObject:forKeyedSubscript:](self->_technique, "setObject:forKeyedSubscript:", v24, CFSTR("neckV_symbol"));

    *(float *)&v25 = self->_uniforms.shadowMaskSizeU;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v25);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    -[SCNTechnique setObject:forKeyedSubscript:](self->_technique, "setObject:forKeyedSubscript:", v26, CFSTR("shadowMaskSizeU_symbol"));

    *(float *)&v27 = self->_uniforms.shadowMaskSizeV;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v27);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    -[SCNTechnique setObject:forKeyedSubscript:](self->_technique, "setObject:forKeyedSubscript:", v28, CFSTR("shadowMaskSizeV_symbol"));

    *(float *)&v29 = self->_uniforms.shadowUVOffset;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v29);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    -[SCNTechnique setObject:forKeyedSubscript:](self->_technique, "setObject:forKeyedSubscript:", v34, CFSTR("shadowUVOffset_symbol"));

  }
}

- (void)updateWithARFrame:(id)a3 fallBackDepthData:(id)a4 captureOrientation:(int64_t)a5 interfaceOrientation:(int64_t)a6 mirroredDepthData:(BOOL)a7
{
  _BOOL4 v7;
  id v12;
  MTLTexture *matteTexture;
  __CVBuffer *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  MTLTexture **p_lastCapturedDepth;
  unint64_t v21;
  size_t Height;
  size_t Width;
  unint64_t v24;
  ARFrame *v25;

  v7 = a7;
  v25 = (ARFrame *)a3;
  v12 = a4;
  if (self->_arFrame == v25)
    goto LABEL_21;
  objc_storeStrong((id *)&self->_arFrame, a3);
  matteTexture = self->_matteTexture;
  self->_matteTexture = 0;

  if (self->_depthDataIsMirrored != v7 || self->_interfaceOrientation != a6)
  {
    self->_depthDataIsMirrored = v7;
    self->_interfaceOrientation = a6;
    self->_isFirstFrame = 1;
  }
  v14 = -[ARFrame capturedImage](v25, "capturedImage");
  -[ARFrame capturedDepthData](v25, "capturedDepthData");
  v15 = objc_claimAutoreleasedReturnValue();
  v16 = (void *)v15;
  if (v15)
    v17 = (void *)v15;
  else
    v17 = v12;
  v18 = v17;

  AVTGetCapturedDepthTexture(v18, self->_textureCache);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  p_lastCapturedDepth = &self->_lastCapturedDepth;
  if (v19)
  {
    objc_storeStrong((id *)p_lastCapturedDepth, v19);
    v21 = objc_msgSend(v19, "width");
    Height = objc_msgSend(v19, "height");
    if (self->_capturedDataWidth == v21 && self->_capturedDataHeight == Height)
      goto LABEL_18;
    self->_capturedDataWidth = v21;
  }
  else
  {
    if (*p_lastCapturedDepth)
      goto LABEL_18;
    if (!v14)
      goto LABEL_18;
    Width = CVPixelBufferGetWidth(v14);
    Height = CVPixelBufferGetHeight(v14);
    if (self->_capturedDataWidth == Width && self->_capturedDataHeight == Height)
      goto LABEL_18;
    self->_capturedDataWidth = Width;
  }
  self->_capturedDataHeight = Height;
  self->_isFirstFrame = 1;
LABEL_18:
  v24 = -[ARFrame segmentationBuffer](v25, "segmentationBuffer") != 0;
  if (self->_pipelineKind != v24)
  {
    self->_pipelineKind = v24;
    -[AVTARMaskRenderer reloadTechnique](self, "reloadTechnique");
  }

LABEL_21:
}

- (void)updateWithDepthTexture:(id)a3 captureOrientation:(int64_t)a4 interfaceOrientation:(int64_t)a5 mirroredDepthData:(BOOL)a6
{
  _BOOL4 v6;
  MTLTexture *v10;
  MTLTexture *v11;
  ARFrame *arFrame;
  MTLTexture *matteTexture;
  unint64_t v14;
  unint64_t v15;
  MTLTexture *v16;

  v6 = a6;
  v10 = (MTLTexture *)a3;
  v11 = v10;
  if (v10 && self->_lastCapturedDepth != v10)
  {
    v16 = v10;
    arFrame = self->_arFrame;
    self->_arFrame = 0;

    matteTexture = self->_matteTexture;
    self->_matteTexture = 0;

    if (self->_pipelineKind)
    {
      self->_pipelineKind = 0;
      -[AVTARMaskRenderer reloadTechnique](self, "reloadTechnique");
    }
    if (self->_depthDataIsMirrored != v6 || self->_interfaceOrientation != a5)
    {
      self->_depthDataIsMirrored = v6;
      self->_interfaceOrientation = a5;
      self->_isFirstFrame = 1;
    }
    objc_storeStrong((id *)&self->_lastCapturedDepth, a3);
    v14 = -[MTLTexture width](v16, "width");
    v15 = -[MTLTexture height](v16, "height");
    v11 = v16;
    if (self->_capturedDataWidth != v14 || self->_capturedDataHeight != v15)
    {
      self->_capturedDataWidth = v14;
      self->_capturedDataHeight = v15;
      self->_isFirstFrame = 1;
    }
  }

}

- (MTLTexture)capturedDepth
{
  return self->_lastCapturedDepth;
}

- (void)setCapturedDepth:(id)a3
{
  MTLTexture *v5;
  unint64_t v6;
  unint64_t v7;
  MTLTexture *v8;

  v5 = (MTLTexture *)a3;
  if (self->_lastCapturedDepth != v5)
  {
    v8 = v5;
    objc_storeStrong((id *)&self->_lastCapturedDepth, a3);
    v6 = -[MTLTexture width](v8, "width");
    v7 = -[MTLTexture height](v8, "height");
    v5 = v8;
    if (self->_capturedDataWidth != v6 || self->_capturedDataHeight != v7)
    {
      self->_capturedDataWidth = v6;
      self->_capturedDataHeight = v7;
      self->_isFirstFrame = 1;
    }
  }

}

- (void)setFlipDepth:(BOOL)a3
{
  if (self->_depthDataIsMirrored != a3)
  {
    self->_depthDataIsMirrored = a3;
    self->_isFirstFrame = 1;
  }
}

- (void)initSharedResourcesIfNeededWithDestinationPixelFormat:(unint64_t)a3
{
  MTLRenderPassDescriptor *v4;
  MTLRenderPassDescriptor *currentRenderPassDescriptor;
  void *metalHelper;
  MTLRenderPipelineState *horizontalBlurPipelineState;
  void *v8;
  MTLRenderPipelineState *verticalBlurPipelineState;
  void *v10;
  MTLRenderPipelineState *generateMasksPipelineState;
  void *v12;
  MTLRenderPipelineState *debugCamDepthPipelineState;
  uint64_t v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  const __CFString *v19;
  const __CFString *v20;
  uint64_t v21;
  uint64_t v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  const __CFString *v27;
  const __CFString *v28;
  uint64_t v29;
  uint64_t v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  const __CFString *v35;
  const __CFString *v36;
  uint64_t v37;
  uint64_t v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  const __CFString *v43;
  const __CFString *v44;
  uint64_t v45;

  if (!self->_currentRenderPassDescriptor)
  {
    v4 = (MTLRenderPassDescriptor *)objc_alloc_init(MEMORY[0x1E0CC6B58]);
    currentRenderPassDescriptor = self->_currentRenderPassDescriptor;
    self->_currentRenderPassDescriptor = v4;

    metalHelper = self->_metalHelper;
    v39 = unk_1DD26A6A8;
    v40 = unk_1DD26A6B8;
    v41 = unk_1DD26A6C8;
    v42 = unk_1DD26A6D8;
    v38 = 115;
    v43 = CFSTR("AVT_fullscreen_quad_vertex");
    v44 = CFSTR("AVT_blurMaskX_high_fragment");
    v45 = 1;
    if (metalHelper)
    {
      -[AVTMetalHelper renderPipelineStateWithDescriptor:](metalHelper, (uint64_t)&v38);
      metalHelper = (void *)objc_claimAutoreleasedReturnValue();
    }
    horizontalBlurPipelineState = self->_horizontalBlurPipelineState;
    self->_horizontalBlurPipelineState = (MTLRenderPipelineState *)metalHelper;

    v8 = self->_metalHelper;
    v31 = unk_1DD26A6A8;
    v32 = unk_1DD26A6B8;
    v33 = unk_1DD26A6C8;
    v34 = unk_1DD26A6D8;
    v30 = 115;
    v35 = CFSTR("AVT_fullscreen_quad_vertex");
    v36 = CFSTR("AVT_blurMaskY_high_fragment");
    v37 = 1;
    if (v8)
    {
      -[AVTMetalHelper renderPipelineStateWithDescriptor:](v8, (uint64_t)&v30);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
    }
    verticalBlurPipelineState = self->_verticalBlurPipelineState;
    self->_verticalBlurPipelineState = (MTLRenderPipelineState *)v8;

    v10 = self->_metalHelper;
    v22 = 115;
    v23 = unk_1DD26A6A8;
    v24 = unk_1DD26A6B8;
    v25 = unk_1DD26A6C8;
    v26 = unk_1DD26A6D8;
    v27 = CFSTR("AVT_fullscreen_quad_orientation_vertex");
    v28 = CFSTR("AVT_mask_fragment");
    v29 = 1;
    if (v10)
    {
      -[AVTMetalHelper renderPipelineStateWithDescriptor:](v10, (uint64_t)&v22);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
    }
    generateMasksPipelineState = self->_generateMasksPipelineState;
    self->_generateMasksPipelineState = (MTLRenderPipelineState *)v10;

    if (self->_debugMode)
    {
      v12 = self->_metalHelper;
      v14 = 25;
      v15 = unk_1DD26A6A8;
      v16 = unk_1DD26A6B8;
      v17 = unk_1DD26A6C8;
      v18 = unk_1DD26A6D8;
      v19 = CFSTR("AVT_fullscreen_quad_orientation_vertex");
      v20 = CFSTR("AVT_dbg_camDepth");
      v21 = 1;
      if (v12)
      {
        -[AVTMetalHelper renderPipelineStateWithDescriptor:](v12, (uint64_t)&v14);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
      }
      debugCamDepthPipelineState = self->_debugCamDepthPipelineState;
      self->_debugCamDepthPipelineState = (MTLRenderPipelineState *)v12;

    }
  }
}

- (void)initPipelineKindSpecificResourcesIfNeededWithDestinationPixelFormat:(unint64_t)a3
{
  ARMatteGenerator *v4;
  ARMatteGenerator *matteGenerator;
  id v6;

  if (self->_pipelineKind == 1 && !self->_matteGenerator)
  {
    -[AVTMetalHelper device]((id *)&self->_metalHelper->super.isa);
    v6 = (id)objc_claimAutoreleasedReturnValue();
    v4 = (ARMatteGenerator *)objc_msgSend(objc_alloc(MEMORY[0x1E0C895D0]), "initWithDevice:matteResolution:useSmoothing:", v6, 1, 1);
    matteGenerator = self->_matteGenerator;
    self->_matteGenerator = v4;

  }
}

- (void)allocateTexturesIfNeededWithDestinationPixelFormat:(unint64_t)a3 size:(CGSize)a4
{
  float v6;
  float v7;
  void *v8;
  MTLTexture *v9;
  MTLTexture *v10;
  MTLTexture *v11;
  MTLTexture *v12;
  MTLTexture *v13;
  MTLTexture *tmpMaskBlurTexture;
  id v15;

  if (a4.width != self->_renderSize.width || a4.height != self->_renderSize.height)
  {
    self->_renderSize = a4;
    self->_isFirstFrame = 1;
    v6 = (a4.width + 3.0) * 0.25;
    v7 = (a4.height + 3.0) * 0.25;
    -[AVTMetalHelper device]((id *)&self->_metalHelper->super.isa);
    v15 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CC6BB8], "texture2DDescriptorWithPixelFormat:width:height:mipmapped:", 115, (unint64_t)v6, (unint64_t)v7, 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setUsage:", 5);
    objc_msgSend(v8, "setResourceOptions:", 32);
    v9 = (MTLTexture *)objc_msgSend(v15, "newTextureWithDescriptor:", v8);
    v10 = self->_rawMaskTexture[0];
    self->_rawMaskTexture[0] = v9;

    v11 = (MTLTexture *)objc_msgSend(v15, "newTextureWithDescriptor:", v8);
    v12 = self->_rawMaskTexture[1];
    self->_rawMaskTexture[1] = v11;

    v13 = (MTLTexture *)objc_msgSend(v15, "newTextureWithDescriptor:", v8);
    tmpMaskBlurTexture = self->_tmpMaskBlurTexture;
    self->_tmpMaskBlurTexture = v13;

  }
}

- (id)_renderCommandEncoderWithCommandBuffer:(id)a3 renderTarget:(id)a4
{
  MTLRenderPassDescriptor *currentRenderPassDescriptor;
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;

  currentRenderPassDescriptor = self->_currentRenderPassDescriptor;
  v7 = a4;
  v8 = a3;
  -[MTLRenderPassDescriptor colorAttachments](currentRenderPassDescriptor, "colorAttachments");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "objectAtIndexedSubscript:", 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "setLoadAction:", 0);
  objc_msgSend(v10, "setTexture:", v7);

  objc_msgSend(v8, "renderCommandEncoderWithDescriptor:", self->_currentRenderPassDescriptor);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (id)_renderCommandEncoderWithCommandBuffer:(id)a3 renderTarget:(id)a4 shouldClear:(BOOL)a5 clearColor:(id)a6
{
  double var3;
  double var2;
  double var1;
  double var0;
  _BOOL4 v10;
  MTLRenderPassDescriptor *currentRenderPassDescriptor;
  id v14;
  id v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;

  var3 = a6.var3;
  var2 = a6.var2;
  var1 = a6.var1;
  var0 = a6.var0;
  v10 = a5;
  currentRenderPassDescriptor = self->_currentRenderPassDescriptor;
  v14 = a4;
  v15 = a3;
  -[MTLRenderPassDescriptor colorAttachments](currentRenderPassDescriptor, "colorAttachments");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "objectAtIndexedSubscript:", 0);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
    v18 = 2;
  else
    v18 = 0;
  objc_msgSend(v17, "setLoadAction:", v18);
  objc_msgSend(v17, "setClearColor:", var0, var1, var2, var3);
  objc_msgSend(v17, "setTexture:", v14);

  objc_msgSend(v15, "renderCommandEncoderWithDescriptor:", self->_currentRenderPassDescriptor);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  return v19;
}

- (void)encodeIntermediatePassesWithCommandBuffer:(id)a3 sceneColorTexture:(id)a4 sceneOnTopTexture:(id)a5 generatedMasksTexture:(id)a6 camDepthDebug:(id)a7
{
  id v12;
  unint64_t capturedDataHeight;
  unint64_t capturedDataWidth;
  unint64_t interfaceOrientation;
  id v16;
  id v17;
  unint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  MTLTexture *v22;
  MTLTexture *matteTexture;
  ARFrame *arFrame;
  void *v25;
  void *v26;
  void *v27;
  float depthSmoothingFactor;
  void *v29;
  void *v30;
  void *v31;
  id v32;
  void *v33;
  float v34;

  v12 = a3;
  v32 = a7;
  capturedDataWidth = self->_capturedDataWidth;
  capturedDataHeight = self->_capturedDataHeight;
  interfaceOrientation = self->_interfaceOrientation;
  v16 = a6;
  v17 = a5;
  v18 = AVTSceneKitTextureCoordinatesForCaptureDeviceTexture(a4, capturedDataWidth, capturedDataHeight, interfaceOrientation).n128_u64[0];
  *(_QWORD *)&self->_anon_108[24] = v18;
  *(_QWORD *)&self->_anon_108[32] = v19;
  *(_QWORD *)&self->_anon_108[40] = v20;
  *(_QWORD *)&self->_anon_108[48] = v21;
  if (self->_depthDataIsMirrored)
  {
    *((float *)&v18 + 1) = 1.0 - *((float *)&v18 + 1);
    *((float *)&v19 + 1) = 1.0 - *((float *)&v19 + 1);
    *(_QWORD *)&self->_anon_108[24] = v18;
    *(_QWORD *)&self->_anon_108[32] = v19;
    *((float *)&v20 + 1) = 1.0 - *((float *)&v20 + 1);
    *((float *)&v21 + 1) = 1.0 - *((float *)&v21 + 1);
    *(_QWORD *)&self->_anon_108[40] = v20;
    *(_QWORD *)&self->_anon_108[48] = v21;
  }
  if (self->_pipelineKind == 1 && self->_arFrame)
  {
    objc_msgSend(v12, "pushDebugGroup:", CFSTR("[AvatarKit] Matte generation"));
    -[ARMatteGenerator generateMatteFromFrame:commandBuffer:](self->_matteGenerator, "generateMatteFromFrame:commandBuffer:", self->_arFrame, v12);
    v22 = (MTLTexture *)objc_claimAutoreleasedReturnValue();
    matteTexture = self->_matteTexture;
    self->_matteTexture = v22;

    arFrame = self->_arFrame;
    self->_arFrame = 0;

    objc_msgSend(v12, "popDebugGroup");
  }
  -[MTLRenderPassDescriptor colorAttachments](self->_currentRenderPassDescriptor, "colorAttachments", v32);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "objectAtIndexedSubscript:", 0);
  v26 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v26, "setLoadAction:", 0);
  objc_msgSend(v26, "setStoreAction:", 1);
  objc_msgSend(v12, "pushDebugGroup:", CFSTR("[AvatarKit] Generate masks"));
  -[AVTARMaskRenderer _renderCommandEncoderWithCommandBuffer:renderTarget:](self, "_renderCommandEncoderWithCommandBuffer:renderTarget:", v12, self->_rawMaskTexture[self->_writeID]);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "setRenderPipelineState:", self->_generateMasksPipelineState);
  objc_msgSend(v27, "setVertexBytes:length:atIndex:", &self->_anon_108[24], 32, 0);
  objc_msgSend(v27, "setFragmentTexture:atIndex:", self->_lastCapturedDepth, 0);
  objc_msgSend(v27, "setFragmentTexture:atIndex:", self->_rawMaskTexture[!self->_writeID], 1);
  objc_msgSend(v27, "setFragmentTexture:atIndex:", v17, 2);

  if (self->_pipelineKind == 1)
    objc_msgSend(v27, "setFragmentTexture:atIndex:", self->_matteTexture, 3);
  depthSmoothingFactor = 0.0;
  if (!self->_isFirstFrame)
    depthSmoothingFactor = self->_depthSmoothingFactor;
  v34 = depthSmoothingFactor;
  objc_msgSend(v27, "setFragmentBytes:length:atIndex:", &self->_uniforms, 4, 0);
  objc_msgSend(v27, "setFragmentBytes:length:atIndex:", &v34, 4, 1);
  objc_msgSend(v27, "drawPrimitives:vertexStart:vertexCount:", 4, 0, 4);
  objc_msgSend(v27, "endEncoding");

  objc_msgSend(v12, "popDebugGroup");
  objc_msgSend(v12, "pushDebugGroup:", CFSTR("[AvatarKit] Blur masks"));
  -[AVTARMaskRenderer _renderCommandEncoderWithCommandBuffer:renderTarget:](self, "_renderCommandEncoderWithCommandBuffer:renderTarget:", v12, self->_tmpMaskBlurTexture);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "setRenderPipelineState:", self->_horizontalBlurPipelineState);
  objc_msgSend(v29, "setFragmentTexture:atIndex:", self->_rawMaskTexture[self->_writeID], 0);
  objc_msgSend(v29, "drawPrimitives:vertexStart:vertexCount:", 4, 0, 4);
  objc_msgSend(v29, "endEncoding");
  -[AVTARMaskRenderer _renderCommandEncoderWithCommandBuffer:renderTarget:](self, "_renderCommandEncoderWithCommandBuffer:renderTarget:", v12, v16);
  v30 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v30, "setRenderPipelineState:", self->_verticalBlurPipelineState);
  objc_msgSend(v30, "setFragmentTexture:atIndex:", self->_tmpMaskBlurTexture, 0);
  objc_msgSend(v30, "drawPrimitives:vertexStart:vertexCount:", 4, 0, 4);
  objc_msgSend(v30, "endEncoding");

  objc_msgSend(v12, "popDebugGroup");
  if (self->_debugMode)
  {
    objc_msgSend(v12, "pushDebugGroup:", CFSTR("[AvatarKit] Generate depth texture"));
    -[AVTARMaskRenderer _renderCommandEncoderWithCommandBuffer:renderTarget:](self, "_renderCommandEncoderWithCommandBuffer:renderTarget:", v12, v33);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "setRenderPipelineState:", self->_debugCamDepthPipelineState);
    objc_msgSend(v31, "setVertexBytes:length:atIndex:", &self->_anon_108[24], 32, 0);
    objc_msgSend(v31, "setFragmentTexture:atIndex:", self->_lastCapturedDepth, 0);
    objc_msgSend(v31, "drawPrimitives:vertexStart:vertexCount:", 4, 0, 4);
    objc_msgSend(v31, "endEncoding");

    objc_msgSend(v12, "popDebugGroup");
  }
  self->_writeID ^= 1u;
  self->_isFirstFrame = 0;

}

- (void)setClearWithCamera:(BOOL)a3 antialiasingMode:(unint64_t)a4
{
  self->_clearWithCamera = a3;
  self->_antialiasingMode = a4;
  -[AVTARMaskRenderer reloadTechnique](self, "reloadTechnique");
}

- (void)reloadTechnique
{
  id *v3;
  uint64_t v4;
  id *v5;
  id *v6;
  const __CFString *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  unint64_t antialiasingMode;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  const __CFString *v26;
  id v27;
  void *v28;
  void *v29;
  id v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  id v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  id v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  id v47;
  void *v48;
  void *v49;
  void *v50;
  SCNTechnique *v51;
  SCNTechnique *technique;
  void *v53;
  void *v54;
  uint64_t v55;
  void *v56;
  void *v57;
  void *v58;
  id v59;
  void *v60;
  void *v61;
  _QWORD v62[5];
  id v63;
  id location;
  id v65;
  id v66;

  +[AVTResourceLocator sharedResourceLocator]();
  v3 = (id *)objc_claimAutoreleasedReturnValue();
  -[AVTResourceLocator urlForFrameworkResourceAtPath:isDirectory:](v3, (uint64_t)CFSTR("SimplePassTechnique.json"), 0);
  v4 = objc_claimAutoreleasedReturnValue();

  +[AVTResourceLocator sharedResourceLocator]();
  v5 = (id *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (self->_debugMode)
    v7 = CFSTR("ARMaskTechniqueDbg.json");
  else
    v7 = CFSTR("ARMaskTechnique.json");
  -[AVTResourceLocator urlForFrameworkResourceAtPath:isDirectory:](v5, (uint64_t)v7, 0);
  v8 = objc_claimAutoreleasedReturnValue();

  v9 = (void *)MEMORY[0x1E0CB36D8];
  v61 = (void *)v4;
  objc_msgSend(MEMORY[0x1E0C99D50], "dataWithContentsOfURL:", v4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v66 = 0;
  objc_msgSend(v9, "JSONObjectWithData:options:error:", v10, 1, &v66);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v66;

  v13 = (void *)MEMORY[0x1E0CB36D8];
  v60 = (void *)v8;
  objc_msgSend(MEMORY[0x1E0C99D50], "dataWithContentsOfURL:", v8);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v65 = v12;
  objc_msgSend(v13, "JSONObjectWithData:options:error:", v14, 1, &v65);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v59 = v65;

  objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("passes"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "objectForKeyedSubscript:", CFSTR("passes"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  antialiasingMode = self->_antialiasingMode;
  if (antialiasingMode == 1)
    v19 = 2;
  else
    v19 = 1;
  if (antialiasingMode == 2)
    v20 = 4;
  else
    v20 = v19;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "objectForKeyedSubscript:", CFSTR("ScenePass"));
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "setObject:forKeyedSubscript:", v21, CFSTR("samples"));

  if (self->_pipelineKind == 1)
  {
    objc_msgSend(v17, "objectForKeyedSubscript:", CFSTR("CompositePass"));
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    if (-[AVTPresentationConfiguration internalStyle](self->_presentationConfiguration, "internalStyle") == 3)
    {
      objc_msgSend(v15, "objectForKeyedSubscript:", CFSTR("symbols"));
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "setObject:forKeyedSubscript:", &unk_1EA6BFCC0, CFSTR("chromaKeyColor_symbol"));

      objc_msgSend(v23, "objectForKeyedSubscript:", CFSTR("inputs"));
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "setObject:forKeyedSubscript:", CFSTR("chromaKeyColor_symbol"), CFSTR("chromaKeyColor"));

      v26 = CFSTR("AVT_composite_fragment_matte_chroma_key");
    }
    else
    {
      v26 = CFSTR("AVT_composite_fragment_matte");
    }
    objc_msgSend(v23, "setObject:forKeyedSubscript:", v26, CFSTR("metalFragmentShader"));

  }
  v27 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v28 = (void *)objc_msgSend(v16, "mutableCopy");
  v29 = v28;
  if (v28)
    v30 = v28;
  else
    v30 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v31 = v30;

  v57 = v17;
  objc_msgSend(v31, "addEntriesFromDictionary:", v17);
  objc_msgSend(v27, "setObject:forKeyedSubscript:", v31, CFSTR("passes"));
  objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("sequence"));
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v33 = (void *)objc_msgSend(v32, "mutableCopy");
  v34 = v33;
  if (v33)
    v35 = v33;
  else
    v35 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v36 = v35;

  objc_msgSend(v15, "objectForKeyedSubscript:", CFSTR("sequence"));
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "addObjectsFromArray:", v37);

  objc_msgSend(v27, "setObject:forKeyedSubscript:", v36, CFSTR("sequence"));
  objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("targets"));
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  v39 = (void *)objc_msgSend(v38, "mutableCopy");
  v40 = v39;
  v58 = v16;
  if (v39)
    v41 = v39;
  else
    v41 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v42 = v41;

  objc_msgSend(v15, "objectForKeyedSubscript:", CFSTR("targets"));
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v42, "addEntriesFromDictionary:", v43);

  objc_msgSend(v27, "setObject:forKeyedSubscript:", v42, CFSTR("targets"));
  objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("symbols"));
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  v45 = (void *)objc_msgSend(v44, "mutableCopy");
  v46 = v45;
  if (v45)
    v47 = v45;
  else
    v47 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v48 = v47;

  objc_msgSend(v15, "objectForKeyedSubscript:", CFSTR("symbols"));
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v48, "addEntriesFromDictionary:", v49);

  objc_msgSend(v27, "setObject:forKeyedSubscript:", v48, CFSTR("symbols"));
  if (!self->_clearWithCamera && !self->_debugMode)
  {
    objc_msgSend(v31, "objectForKeyedSubscript:", CFSTR("CompositePass"));
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v50, "removeObjectForKey:", CFSTR("colorStates"));

  }
  objc_msgSend(MEMORY[0x1E0CD5A30], "techniqueWithDictionary:", v27);
  v51 = (SCNTechnique *)objc_claimAutoreleasedReturnValue();
  technique = self->_technique;
  self->_technique = v51;

  -[AVTMetalHelper library]((os_unfair_lock_s *)self->_metalHelper);
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  -[SCNTechnique setLibrary:](self->_technique, "setLibrary:", v53);

  objc_msgSend(v27, "objectForKeyedSubscript:", CFSTR("sequence"));
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  v55 = objc_msgSend(v54, "indexOfObject:", CFSTR("CustomPass"));

  -[SCNTechnique passAtIndex:](self->_technique, "passAtIndex:", v55);
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  objc_initWeak(&location, self);
  v62[0] = MEMORY[0x1E0C809B0];
  v62[1] = 3221225472;
  v62[2] = __36__AVTARMaskRenderer_reloadTechnique__block_invoke;
  v62[3] = &unk_1EA61EA70;
  objc_copyWeak(&v63, &location);
  v62[4] = self;
  objc_msgSend(v56, "setExecutionHandler:", v62);
  self->_isFirstFrame = 1;
  (*((void (**)(void))self->_techniqueDidChangeHandler + 2))();
  objc_destroyWeak(&v63);
  objc_destroyWeak(&location);

}

void __36__AVTARMaskRenderer_reloadTechnique__block_invoke(uint64_t a1, void *a2)
{
  _BYTE *WeakRetained;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(v9, "inputTextureWithName:", CFSTR("sceneColorTexture_target"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "inputTextureWithName:", CFSTR("sceneOnTopTexture_target"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "width") && objc_msgSend(v4, "height"))
  {
    objc_msgSend(*(id *)(a1 + 32), "initSharedResourcesIfNeededWithDestinationPixelFormat:", 0);
    objc_msgSend(*(id *)(a1 + 32), "initPipelineKindSpecificResourcesIfNeededWithDestinationPixelFormat:", 0);
    objc_msgSend(*(id *)(a1 + 32), "allocateTexturesIfNeededWithDestinationPixelFormat:size:", 0, (double)(unint64_t)objc_msgSend(v4, "width"), (double)(unint64_t)objc_msgSend(v4, "height"));
    objc_msgSend(v9, "commandBuffer");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "outputTextureWithName:", CFSTR("mask_target"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (WeakRetained[42])
    {
      objc_msgSend(v9, "outputTextureWithName:", CFSTR("camDepth_target"));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v8 = 0;
    }
    objc_msgSend(WeakRetained, "encodeIntermediatePassesWithCommandBuffer:sceneColorTexture:sceneOnTopTexture:generatedMasksTexture:camDepthDebug:", v6, v4, v5, v7, v8);

  }
}

- (float)depthSmoothingFactor
{
  return self->_depthSmoothingFactor;
}

- (void)setDepthSmoothingFactor:(float)a3
{
  self->_depthSmoothingFactor = a3;
}

- (BOOL)flipDepth
{
  return self->_flipDepth;
}

- (void).cxx_destruct
{
  uint64_t i;

  objc_storeStrong(&self->_techniqueDidChangeHandler, 0);
  objc_storeStrong((id *)&self->_technique, 0);
  objc_storeStrong((id *)&self->_debugCamDepthPipelineState, 0);
  objc_storeStrong((id *)&self->_debugVisualizationPipelineState, 0);
  objc_storeStrong((id *)&self->_verticalBlurPipelineState, 0);
  objc_storeStrong((id *)&self->_horizontalBlurPipelineState, 0);
  objc_storeStrong((id *)&self->_generateMasksPipelineState, 0);
  objc_storeStrong((id *)&self->_currentRenderPassDescriptor, 0);
  objc_storeStrong((id *)&self->_metalHelper, 0);
  objc_storeStrong((id *)&self->_tmpMaskBlurTexture, 0);
  for (i = 0; i != -2; --i)
    objc_storeStrong((id *)&self->_rawMaskTexture[i + 1], 0);
  objc_storeStrong((id *)&self->_lastCapturedDepth, 0);
  objc_storeStrong((id *)&self->_matteTexture, 0);
  objc_storeStrong((id *)&self->_matteGenerator, 0);
  objc_storeStrong((id *)&self->_arFrame, 0);
  objc_storeStrong((id *)&self->_presentationConfiguration, 0);
  objc_destroyWeak((id *)&self->_owner);
}

- (void)initWithOwner:(os_log_t)log presentationConfiguration:techniqueDidChangeHandler:.cold.1(os_log_t log)
{
  int v1;
  const char *v2;
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  v1 = 136315138;
  v2 = "device";
  OUTLINED_FUNCTION_1_0();
}

- (void)initWithOwner:presentationConfiguration:techniqueDidChangeHandler:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_2_2();
  OUTLINED_FUNCTION_0_3(&dword_1DD1FA000, v0, v1, "Error: Condition '%s' failed. Invalid presentation configuration %@", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_1_0();
}

@end
