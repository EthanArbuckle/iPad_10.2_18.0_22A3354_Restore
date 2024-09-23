@implementation CMISmartStylePixelBufferRendererV1

- (CMISmartStylePixelBufferRendererV1)initWithOptionalMetalCommandQueue:(id)a3 allocator:(id)a4
{
  id v6;
  id v7;
  CMISmartStylePixelBufferRendererV1 *v8;
  FigMetalContext *v9;
  void *v10;
  uint64_t v11;
  FigMetalContext *metalContext;
  FigMetalContext *v13;
  const __CFAllocator *v14;
  const __CFDictionary *v15;
  void *v16;
  CMISmartStyleMetalRendererV1 *v17;
  CMISmartStyleMetalRenderer *smartStyleMetalRenderer;
  CMISmartStylePixelBufferRendererV1 *v19;
  objc_super v21;
  uint64_t v22;
  _QWORD v23[2];

  v23[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v21.receiver = self;
  v21.super_class = (Class)CMISmartStylePixelBufferRendererV1;
  v8 = -[CMISmartStylePixelBufferRendererV1 init](&v21, sel_init);
  if (!v8)
    goto LABEL_7;
  v9 = [FigMetalContext alloc];
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = -[FigMetalContext initWithbundle:andOptionalCommandQueue:](v9, "initWithbundle:andOptionalCommandQueue:", v10, v6);
  metalContext = v8->_metalContext;
  v8->_metalContext = (FigMetalContext *)v11;

  v13 = v8->_metalContext;
  if (!v13)
    goto LABEL_7;
  -[FigMetalContext setAllocator:](v13, "setAllocator:", v7);
  -[FigMetalContext setAllowCommandBufferCommitsOnlyByForceCommit:](v8->_metalContext, "setAllowCommandBufferCommitsOnlyByForceCommit:", 1);
  v14 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
  v22 = *MEMORY[0x1E0CA8F48];
  v23[0] = &unk_1E9513A68;
  v15 = (const __CFDictionary *)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v23, &v22, 1);
  -[FigMetalContext device](v8->_metalContext, "device");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v14) = CVMetalTextureCacheCreate(v14, v15, v16, 0, &v8->_textureCache);

  if ((_DWORD)v14)
    goto LABEL_7;
  v17 = -[CMISmartStyleMetalRendererV1 initWithMetalContext:]([CMISmartStyleMetalRendererV1 alloc], "initWithMetalContext:", v8->_metalContext);
  smartStyleMetalRenderer = v8->_smartStyleMetalRenderer;
  v8->_smartStyleMetalRenderer = (CMISmartStyleMetalRenderer *)v17;

  if (v8->_smartStyleMetalRenderer)
  {
    v19 = v8;
  }
  else
  {
LABEL_7:
    FigDebugAssert3();
    v19 = 0;
  }

  return v19;
}

- (CMISmartStyle)inputStyle
{
  return (CMISmartStyle *)-[CMISmartStyleMetalRenderer inputStyle](self->_smartStyleMetalRenderer, "inputStyle");
}

- (void)setInputStyle:(id)a3
{
  -[CMISmartStyleMetalRenderer setInputStyle:](self->_smartStyleMetalRenderer, "setInputStyle:", a3);
}

- (NSString)castType
{
  void *v2;
  void *v3;

  -[CMISmartStyleMetalRenderer inputStyle](self->_smartStyleMetalRenderer, "inputStyle");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "castType");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (void)setCastType:(id)a3
{
  CMISmartStyleMetalRenderer *smartStyleMetalRenderer;
  id v4;
  id v5;

  smartStyleMetalRenderer = self->_smartStyleMetalRenderer;
  v4 = a3;
  -[CMISmartStyleMetalRenderer inputStyle](smartStyleMetalRenderer, "inputStyle");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setCastType:", v4);

}

- (float)castIntensity
{
  void *v2;
  float v3;
  float v4;

  -[CMISmartStyleMetalRenderer inputStyle](self->_smartStyleMetalRenderer, "inputStyle");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "castIntensity");
  v4 = v3;

  return v4;
}

- (void)setCastIntensity:(float)a3
{
  double v4;
  id v5;

  -[CMISmartStyleMetalRenderer inputStyle](self->_smartStyleMetalRenderer, "inputStyle");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  *(float *)&v4 = a3;
  objc_msgSend(v5, "setCastIntensity:", v4);

}

- (float)toneBias
{
  void *v2;
  float v3;
  float v4;

  -[CMISmartStyleMetalRenderer inputStyle](self->_smartStyleMetalRenderer, "inputStyle");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "toneBias");
  v4 = v3;

  return v4;
}

- (void)setToneBias:(float)a3
{
  double v4;
  id v5;

  -[CMISmartStyleMetalRenderer inputStyle](self->_smartStyleMetalRenderer, "inputStyle");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  *(float *)&v4 = a3;
  objc_msgSend(v5, "setToneBias:", v4);

}

- (float)colorBias
{
  void *v2;
  float v3;
  float v4;

  -[CMISmartStyleMetalRenderer inputStyle](self->_smartStyleMetalRenderer, "inputStyle");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "colorBias");
  v4 = v3;

  return v4;
}

- (void)setColorBias:(float)a3
{
  double v4;
  id v5;

  -[CMISmartStyleMetalRenderer inputStyle](self->_smartStyleMetalRenderer, "inputStyle");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  *(float *)&v4 = a3;
  objc_msgSend(v5, "setColorBias:", v4);

}

- (MTLCommandQueue)metalCommandQueue
{
  return -[FigMetalContext commandQueue](self->_metalContext, "commandQueue");
}

- (void)setMetalCommandQueue:(id)a3
{
  -[FigMetalContext setCommandQueue:](self->_metalContext, "setCommandQueue:", a3);
}

- (int)finishProcessing
{
  void *v3;

  -[FigMetalContext waitForIdle](self->_metalContext, "waitForIdle");
  -[CMISmartStyleMetalRenderer finishProcessing](self->_smartStyleMetalRenderer, "finishProcessing");
  -[FigMetalContext allocator](self->_metalContext, "allocator");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "usedSizeAll");

  return 0;
}

- (int)prepareToProcess:(unsigned int)a3
{
  uint64_t v3;
  int v5;

  v3 = *(_QWORD *)&a3;
  -[CMISmartStyleMetalRenderer setInstanceLabel:](self->_smartStyleMetalRenderer, "setInstanceLabel:", self->_instanceLabel);
  v5 = -[CMISmartStyleMetalRenderer prepareToProcess:](self->_smartStyleMetalRenderer, "prepareToProcess:", v3);
  if (v5)
    FigDebugAssert3();
  return v5;
}

- (int)prewarm
{
  return -[CMISmartStyleMetalRenderer prewarm](self->_smartStyleMetalRenderer, "prewarm");
}

- (int)process
{
  size_t Width;
  size_t Height;
  unint64_t v5;
  int v6;
  int v7;
  int v8;
  int v9;
  int v10;
  double v11;
  double v12;
  double v13;
  void *v14;
  void *v15;
  double v16;
  float v17;
  int v18;
  void *v19;
  NSDictionary *inputMetadataDict;
  NSDictionary *inputLinearMetadataDict;
  __CVBuffer *inputPixelBuffer;
  __CVBuffer *inputLinearPixelBuffer;
  __CVBuffer *inputThumbnailPixelBuffer;
  __CVBuffer *inputGainMapPixelBuffer;
  __CVBuffer *inputPersonMaskPixelBuffer;
  __CVBuffer *inputSkinMaskPixelBuffer;
  __CVBuffer *inputSkyMaskPixelBuffer;
  __CVBuffer *outputPixelBuffer;
  __CVBuffer *outputGainMapPixelBuffer;
  __CVBuffer *outputSmallLightMapPixelBuffer;
  __CVBuffer *outputSmallLinearLightMapPixelBuffer;
  __CVBuffer *outputCodedLinearPixelBuffer;
  int v34;
  __CFString *tuningParameterVariant;
  void *v37;
  char v38;
  _QWORD v39[4];
  id v40;
  id location;
  int v42;
  int v43;

  Width = CVPixelBufferGetWidth(self->_inputPixelBuffer);
  Height = CVPixelBufferGetHeight(self->_inputPixelBuffer);
  if (self->_inputMetadataDict)
  {
    v5 = Height;
    v42 = 1065353216;
    v43 = 1065353216;
    v6 = +[CMISmartStyleUtilitiesV1 computeLinearImageExposureWithMetadata:outputBaseGain:outputBaselineExposure:](CMISmartStyleUtilitiesV1, "computeLinearImageExposureWithMetadata:outputBaseGain:outputBaselineExposure:", self->_inputLinearMetadataDict, &v43, &v42);
    if (v6)
    {
      v34 = v6;
    }
    else
    {
      +[CMISmartStyleUtilitiesV1 computeLinearImageEncodingGainWithMetadata:](CMISmartStyleUtilitiesV1, "computeLinearImageEncodingGainWithMetadata:", self->_inputLinearMetadataDict);
      v8 = v7;
      v9 = -[CMISmartStylePixelBufferRendererV1 _createGlobalToneCurveTexture](self, "_createGlobalToneCurveTexture");
      if (v9)
      {
        v34 = v9;
      }
      else
      {
        v10 = -[CMISmartStylePixelBufferRendererV1 _calculateROIShift](self, "_calculateROIShift");
        if (!v10)
        {
          -[CMISmartStyleMetalRenderer setInputGlobalToneCurveTexture:](self->_smartStyleMetalRenderer, "setInputGlobalToneCurveTexture:", self->_linearImageGlobalToneCurveTexture);
          LODWORD(v11) = v43;
          -[CMISmartStyleMetalRenderer setInputLinearBaseGain:](self->_smartStyleMetalRenderer, "setInputLinearBaseGain:", v11);
          LODWORD(v12) = v42;
          -[CMISmartStyleMetalRenderer setBaselineExposure:](self->_smartStyleMetalRenderer, "setBaselineExposure:", v12);
          LODWORD(v13) = v8;
          -[CMISmartStyleMetalRenderer setInputLinearEncodingGain:](self->_smartStyleMetalRenderer, "setInputLinearEncodingGain:", v13);
          -[CMISmartStyleMetalRenderer setSemanticStyleSceneType:](self->_smartStyleMetalRenderer, "setSemanticStyleSceneType:", self->_semanticStyleSceneType);
          -[CMISmartStyleMetalRenderer setTuningParameterVariant:](self->_smartStyleMetalRenderer, "setTuningParameterVariant:", self->_tuningParameterVariant);
          -[CMISmartStyleMetalRenderer setLogicalImageSize:](self->_smartStyleMetalRenderer, "setLogicalImageSize:", (double)Width, (double)v5);
          -[NSDictionary objectForKeyedSubscript:](self->_inputMetadataDict, "objectForKeyedSubscript:", *MEMORY[0x1E0D06920]);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          -[CMISmartStyleMetalRenderer setBrightnessValue:](self->_smartStyleMetalRenderer, "setBrightnessValue:", v14);

          -[NSDictionary objectForKeyedSubscript:](self->_inputMetadataDict, "objectForKeyedSubscript:", *MEMORY[0x1E0D06A40]);
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          v17 = 1.0;
          if (v15)
          {
            if (!self->_isStreaming)
            {
              tuningParameterVariant = (__CFString *)self->_tuningParameterVariant;
              if (tuningParameterVariant != CFSTR("SWFR") && tuningParameterVariant != CFSTR("DigitalFlash"))
              {
                -[NSDictionary objectForKeyedSubscript:](self->_inputMetadataDict, "objectForKeyedSubscript:", *MEMORY[0x1E0D06AE8]);
                v37 = (void *)objc_claimAutoreleasedReturnValue();
                v38 = objc_msgSend(v37, "BOOLValue");

                if ((v38 & 1) == 0)
                {
                  objc_msgSend(v15, "floatValue");
                  v17 = *(float *)&v16;
                }
              }
            }
          }
          *(float *)&v16 = v17;
          -[CMISmartStyleMetalRenderer setFaceBasedGlobalExposureBoostRatio:](self->_smartStyleMetalRenderer, "setFaceBasedGlobalExposureBoostRatio:", v16);
          v18 = -[CMISmartStyleMetalRenderer process](self->_smartStyleMetalRenderer, "process");
          if (v18)
          {
            v34 = v18;
            FigDebugAssert3();

          }
          else
          {
            -[FigMetalContext commandBuffer](self->_metalContext, "commandBuffer");
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v19, "setLabel:", CFSTR("smartStyle_waitForSchedule_"));
            inputMetadataDict = self->_inputMetadataDict;
            self->_inputMetadataDict = 0;

            inputLinearMetadataDict = self->_inputLinearMetadataDict;
            self->_inputLinearMetadataDict = 0;

            inputPixelBuffer = self->_inputPixelBuffer;
            if (inputPixelBuffer)
            {
              CFRelease(inputPixelBuffer);
              self->_inputPixelBuffer = 0;
            }
            inputLinearPixelBuffer = self->_inputLinearPixelBuffer;
            if (inputLinearPixelBuffer)
            {
              CFRelease(inputLinearPixelBuffer);
              self->_inputLinearPixelBuffer = 0;
            }
            inputThumbnailPixelBuffer = self->_inputThumbnailPixelBuffer;
            if (inputThumbnailPixelBuffer)
            {
              CFRelease(inputThumbnailPixelBuffer);
              self->_inputThumbnailPixelBuffer = 0;
            }
            inputGainMapPixelBuffer = self->_inputGainMapPixelBuffer;
            if (inputGainMapPixelBuffer)
            {
              CFRelease(inputGainMapPixelBuffer);
              self->_inputGainMapPixelBuffer = 0;
            }
            inputPersonMaskPixelBuffer = self->_inputPersonMaskPixelBuffer;
            if (inputPersonMaskPixelBuffer)
            {
              CFRelease(inputPersonMaskPixelBuffer);
              self->_inputPersonMaskPixelBuffer = 0;
            }
            inputSkinMaskPixelBuffer = self->_inputSkinMaskPixelBuffer;
            if (inputSkinMaskPixelBuffer)
            {
              CFRelease(inputSkinMaskPixelBuffer);
              self->_inputSkinMaskPixelBuffer = 0;
            }
            inputSkyMaskPixelBuffer = self->_inputSkyMaskPixelBuffer;
            if (inputSkyMaskPixelBuffer)
            {
              CFRelease(inputSkyMaskPixelBuffer);
              self->_inputSkyMaskPixelBuffer = 0;
            }
            outputPixelBuffer = self->_outputPixelBuffer;
            if (outputPixelBuffer)
            {
              CFRelease(outputPixelBuffer);
              self->_outputPixelBuffer = 0;
            }
            outputGainMapPixelBuffer = self->_outputGainMapPixelBuffer;
            if (outputGainMapPixelBuffer)
            {
              CFRelease(outputGainMapPixelBuffer);
              self->_outputGainMapPixelBuffer = 0;
            }
            outputSmallLightMapPixelBuffer = self->_outputSmallLightMapPixelBuffer;
            if (outputSmallLightMapPixelBuffer)
            {
              CFRelease(outputSmallLightMapPixelBuffer);
              self->_outputSmallLightMapPixelBuffer = 0;
            }
            outputSmallLinearLightMapPixelBuffer = self->_outputSmallLinearLightMapPixelBuffer;
            if (outputSmallLinearLightMapPixelBuffer)
            {
              CFRelease(outputSmallLinearLightMapPixelBuffer);
              self->_outputSmallLinearLightMapPixelBuffer = 0;
            }
            outputCodedLinearPixelBuffer = self->_outputCodedLinearPixelBuffer;
            if (outputCodedLinearPixelBuffer)
            {
              CFRelease(outputCodedLinearPixelBuffer);
              self->_outputCodedLinearPixelBuffer = 0;
            }
            objc_initWeak(&location, self);
            v39[0] = MEMORY[0x1E0C809B0];
            v39[1] = 3221225472;
            v39[2] = __45__CMISmartStylePixelBufferRendererV1_process__block_invoke;
            v39[3] = &unk_1E94EB000;
            objc_copyWeak(&v40, &location);
            objc_msgSend(v19, "addCompletedHandler:", v39);
            objc_destroyWeak(&v40);
            objc_destroyWeak(&location);
            -[FigMetalContext forceCommit](self->_metalContext, "forceCommit");
            ++self->_frameCount;

            return 0;
          }
          return v34;
        }
        v34 = v10;
      }
    }
    FigDebugAssert3();
    return v34;
  }
  FigDebugAssert3();
  return FigSignalErrorAt();
}

void __45__CMISmartStylePixelBufferRendererV1_process__block_invoke(uint64_t a1)
{
  CVMetalTextureCacheRef *WeakRetained;
  CVMetalTextureCacheRef *v2;

  WeakRetained = (CVMetalTextureCacheRef *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained && !*((_BYTE *)WeakRetained + 136))
  {
    v2 = WeakRetained;
    CVMetalTextureCacheFlush(WeakRetained[2], 0);
    WeakRetained = v2;
  }

}

- (int)purgeResources
{
  void *v3;
  void *v4;

  -[CMISmartStyleMetalRenderer purgeResources](self->_smartStyleMetalRenderer, "purgeResources");
  FigMetalDecRef((id *)&self->_linearImageGlobalToneCurveTexture);
  CVMetalTextureCacheFlush(self->_textureCache, 0);
  -[FigMetalContext allocator](self->_metalContext, "allocator");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "reset");

  -[FigMetalContext allocator](self->_metalContext, "allocator");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "purgeResources");

  return 0;
}

- (int)resetState
{
  return 0;
}

- (int)setup
{
  void *v3;
  uint64_t v4;
  int v5;

  -[FigMetalContext allocator](self->_metalContext, "allocator");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "memSize");

  if (v4)
  {
    -[CMISmartStyleMetalRenderer setUseLiveMetalAllocations:](self->_smartStyleMetalRenderer, "setUseLiveMetalAllocations:", self->_useLiveMetalAllocations);
    v5 = -[CMISmartStyleMetalRenderer setup](self->_smartStyleMetalRenderer, "setup");
    if (v5)
      FigDebugAssert3();
    return v5;
  }
  else
  {
    FigDebugAssert3();
    return FigSignalErrorAt();
  }
}

- (void)dealloc
{
  __CVMetalTextureCache *textureCache;
  void *v4;
  uint64_t v5;
  objc_super v6;

  -[CMISmartStylePixelBufferRendererV1 finishProcessing](self, "finishProcessing");
  -[CMISmartStylePixelBufferRendererV1 purgeResources](self, "purgeResources");
  textureCache = self->_textureCache;
  if (textureCache)
  {
    CFRelease(textureCache);
    self->_textureCache = 0;
  }
  -[FigMetalContext allocator](self->_metalContext, "allocator");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "usedSizeAll");

  if (v5)
    FigSignalErrorAt();
  v6.receiver = self;
  v6.super_class = (Class)CMISmartStylePixelBufferRendererV1;
  -[CMISmartStylePixelBufferRendererV1 dealloc](&v6, sel_dealloc);
}

- (void)setInputPixelBuffer:(__CVBuffer *)a3
{
  __CVBuffer *inputPixelBuffer;
  int v6;
  id v7;
  id v8;

  inputPixelBuffer = self->_inputPixelBuffer;
  if (inputPixelBuffer)
  {
    CFRelease(inputPixelBuffer);
    self->_inputPixelBuffer = 0;
  }
  if (a3)
  {
    self->_inputPixelBuffer = CVPixelBufferRetain(a3);
    v8 = 0;
    v6 = -[CMISmartStylePixelBufferRendererV1 _bindPixelBufferToTexture:usage:overrideMTLPixelFormatWithFormat:planeIndex:texturePtr:](self, "_bindPixelBufferToTexture:usage:overrideMTLPixelFormatWithFormat:planeIndex:texturePtr:", a3, 1, 0, 0, &v8);
    v7 = v8;
    if (v6)
      FigDebugAssert3();
    else
      -[CMISmartStyleMetalRenderer setInputImageTexture:](self->_smartStyleMetalRenderer, "setInputImageTexture:", v7);

  }
  else
  {
    FigDebugAssert3();
  }
}

- (void)setInputThumbnailPixelBuffer:(__CVBuffer *)a3
{
  __CVBuffer *inputThumbnailPixelBuffer;
  int v6;
  id v7;
  id v8;

  inputThumbnailPixelBuffer = self->_inputThumbnailPixelBuffer;
  if (inputThumbnailPixelBuffer)
  {
    CFRelease(inputThumbnailPixelBuffer);
    self->_inputThumbnailPixelBuffer = 0;
  }
  if (a3)
  {
    v8 = 0;
    v6 = -[CMISmartStylePixelBufferRendererV1 _bindPixelBufferToTexture:usage:overrideMTLPixelFormatWithFormat:planeIndex:texturePtr:](self, "_bindPixelBufferToTexture:usage:overrideMTLPixelFormatWithFormat:planeIndex:texturePtr:", a3, 1, 0, 0, &v8);
    v7 = v8;
    if (v6)
    {
      FigDebugAssert3();
    }
    else
    {
      self->_inputThumbnailPixelBuffer = CVPixelBufferRetain(a3);
      -[CMISmartStyleMetalRenderer setInputImageThumbnailTexture:](self->_smartStyleMetalRenderer, "setInputImageThumbnailTexture:", v7);
    }

  }
}

- (void)setInputLinearPixelBuffer:(__CVBuffer *)a3
{
  __CVBuffer *inputLinearPixelBuffer;
  int v6;
  id v7;
  int v8;
  int v9;
  id v10;
  int v11;
  id v12;
  id v13;
  id v14;
  id v15;

  inputLinearPixelBuffer = self->_inputLinearPixelBuffer;
  if (inputLinearPixelBuffer)
  {
    CFRelease(inputLinearPixelBuffer);
    self->_inputLinearPixelBuffer = 0;
  }
  if (a3)
  {
    self->_inputLinearPixelBuffer = CVPixelBufferRetain(a3);
    if (CVPixelBufferGetPixelFormatType(a3) == 1815491698)
    {
      v15 = 0;
      v6 = -[CMISmartStylePixelBufferRendererV1 _bindPixelBufferToTexture:usage:overrideMTLPixelFormatWithFormat:planeIndex:texturePtr:](self, "_bindPixelBufferToTexture:usage:overrideMTLPixelFormatWithFormat:planeIndex:texturePtr:", a3, 1, 110, 0, &v15);
      v7 = v15;
      if (v6)
        goto LABEL_17;
      goto LABEL_9;
    }
    if (CVPixelBufferGetPixelFormatType(a3) == 2019963440)
    {
      v14 = 0;
      v8 = -[CMISmartStylePixelBufferRendererV1 _bindPixelBufferToTexture:usage:overrideMTLPixelFormatWithFormat:planeIndex:texturePtr:](self, "_bindPixelBufferToTexture:usage:overrideMTLPixelFormatWithFormat:planeIndex:texturePtr:", a3, 1, 505, 0, &v14);
      v7 = v14;
      if (v8)
        goto LABEL_17;
LABEL_9:
      -[CMISmartStyleMetalRenderer setInputLinearImageTexture:](self->_smartStyleMetalRenderer, "setInputLinearImageTexture:", v7);
      goto LABEL_13;
    }
    v13 = 0;
    v9 = -[CMISmartStylePixelBufferRendererV1 _bindPixelBufferToTexture:usage:overrideMTLPixelFormatWithFormat:planeIndex:texturePtr:](self, "_bindPixelBufferToTexture:usage:overrideMTLPixelFormatWithFormat:planeIndex:texturePtr:", a3, 1, 25, 0, &v13);
    v10 = v13;
    if (!v9)
    {
      -[CMISmartStyleMetalRenderer setInputLinearImageLumaTexture:](self->_smartStyleMetalRenderer, "setInputLinearImageLumaTexture:", v10);
      v12 = v10;
      v11 = -[CMISmartStylePixelBufferRendererV1 _bindPixelBufferToTexture:usage:overrideMTLPixelFormatWithFormat:planeIndex:texturePtr:](self, "_bindPixelBufferToTexture:usage:overrideMTLPixelFormatWithFormat:planeIndex:texturePtr:", a3, 1, 65, 1, &v12);
      v7 = v12;

      if (v11)
      {
LABEL_17:
        FigDebugAssert3();
        goto LABEL_13;
      }
      -[CMISmartStyleMetalRenderer setInputLinearImageChromaTexture:](self->_smartStyleMetalRenderer, "setInputLinearImageChromaTexture:", v7);
LABEL_13:

      return;
    }
    FigDebugAssert3();

  }
  else
  {
    FigDebugAssert3();
  }
}

- (void)setInputGainMapPixelBuffer:(__CVBuffer *)a3
{
  __CVBuffer *inputGainMapPixelBuffer;
  int v6;
  id v7;
  id v8;

  inputGainMapPixelBuffer = self->_inputGainMapPixelBuffer;
  if (inputGainMapPixelBuffer)
  {
    CFRelease(inputGainMapPixelBuffer);
    self->_inputGainMapPixelBuffer = 0;
  }
  if (a3)
  {
    v8 = 0;
    v6 = -[CMISmartStylePixelBufferRendererV1 _bindPixelBufferToTexture:usage:overrideMTLPixelFormatWithFormat:planeIndex:texturePtr:](self, "_bindPixelBufferToTexture:usage:overrideMTLPixelFormatWithFormat:planeIndex:texturePtr:", a3, 1, 0, 0, &v8);
    v7 = v8;
    if (v6)
    {
      FigDebugAssert3();
    }
    else
    {
      self->_inputGainMapPixelBuffer = CVPixelBufferRetain(a3);
      -[CMISmartStyleMetalRenderer setInputGainMapTexture:](self->_smartStyleMetalRenderer, "setInputGainMapTexture:", v7);
    }

  }
}

- (void)setInputPersonMaskPixelBuffer:(__CVBuffer *)a3
{
  __CVBuffer *inputPersonMaskPixelBuffer;
  int v6;
  id v7;
  id v8;

  inputPersonMaskPixelBuffer = self->_inputPersonMaskPixelBuffer;
  if (inputPersonMaskPixelBuffer)
  {
    CFRelease(inputPersonMaskPixelBuffer);
    self->_inputPersonMaskPixelBuffer = 0;
  }
  if (a3)
  {
    v8 = 0;
    v6 = -[CMISmartStylePixelBufferRendererV1 _bindPixelBufferToTexture:usage:overrideMTLPixelFormatWithFormat:planeIndex:texturePtr:](self, "_bindPixelBufferToTexture:usage:overrideMTLPixelFormatWithFormat:planeIndex:texturePtr:", a3, 1, 0, 0, &v8);
    v7 = v8;
    if (v6)
    {
      FigDebugAssert3();
    }
    else
    {
      self->_inputPersonMaskPixelBuffer = CVPixelBufferRetain(a3);
      -[CMISmartStyleMetalRenderer setInputPersonMaskTexture:](self->_smartStyleMetalRenderer, "setInputPersonMaskTexture:", v7);
    }

  }
}

- (void)setInputSkinMaskPixelBuffer:(__CVBuffer *)a3
{
  __CVBuffer *inputSkinMaskPixelBuffer;
  int v6;
  id v7;
  id v8;

  inputSkinMaskPixelBuffer = self->_inputSkinMaskPixelBuffer;
  if (inputSkinMaskPixelBuffer)
  {
    CFRelease(inputSkinMaskPixelBuffer);
    self->_inputSkinMaskPixelBuffer = 0;
  }
  if (a3)
  {
    v8 = 0;
    v6 = -[CMISmartStylePixelBufferRendererV1 _bindPixelBufferToTexture:usage:overrideMTLPixelFormatWithFormat:planeIndex:texturePtr:](self, "_bindPixelBufferToTexture:usage:overrideMTLPixelFormatWithFormat:planeIndex:texturePtr:", a3, 1, 0, 0, &v8);
    v7 = v8;
    if (v6)
    {
      FigDebugAssert3();
    }
    else
    {
      self->_inputSkinMaskPixelBuffer = CVPixelBufferRetain(a3);
      -[CMISmartStyleMetalRenderer setInputSkinMaskTexture:](self->_smartStyleMetalRenderer, "setInputSkinMaskTexture:", v7);
    }

  }
}

- (void)setInputSkyMaskPixelBuffer:(__CVBuffer *)a3
{
  __CVBuffer *inputSkyMaskPixelBuffer;
  int v6;
  id v7;
  id v8;

  inputSkyMaskPixelBuffer = self->_inputSkyMaskPixelBuffer;
  if (inputSkyMaskPixelBuffer)
  {
    CFRelease(inputSkyMaskPixelBuffer);
    self->_inputSkyMaskPixelBuffer = 0;
  }
  if (a3)
  {
    v8 = 0;
    v6 = -[CMISmartStylePixelBufferRendererV1 _bindPixelBufferToTexture:usage:overrideMTLPixelFormatWithFormat:planeIndex:texturePtr:](self, "_bindPixelBufferToTexture:usage:overrideMTLPixelFormatWithFormat:planeIndex:texturePtr:", a3, 1, 0, 0, &v8);
    v7 = v8;
    if (v6)
    {
      FigDebugAssert3();
    }
    else
    {
      self->_inputSkyMaskPixelBuffer = CVPixelBufferRetain(a3);
      -[CMISmartStyleMetalRenderer setInputSkyMaskTexture:](self->_smartStyleMetalRenderer, "setInputSkyMaskTexture:", v7);
    }

  }
}

- (void)setInputSRLCoefficientsBuf:(id)a3
{
  -[CMISmartStyleMetalRenderer setInputSRLCoefficientsBuf:](self->_smartStyleMetalRenderer, "setInputSRLCoefficientsBuf:", a3);
}

- (void)setInputSRLCurveParameter:(float)a3
{
  -[CMISmartStyleMetalRenderer setInputSRLCurveParameter:](self->_smartStyleMetalRenderer, "setInputSRLCurveParameter:");
}

- (void)setOutputPixelBuffer:(__CVBuffer *)a3
{
  __CVBuffer *outputPixelBuffer;
  int v6;
  id v7;
  id v8;

  outputPixelBuffer = self->_outputPixelBuffer;
  if (outputPixelBuffer)
  {
    CFRelease(outputPixelBuffer);
    self->_outputPixelBuffer = 0;
  }
  if (a3)
  {
    self->_outputPixelBuffer = CVPixelBufferRetain(a3);
    v8 = 0;
    v6 = -[CMISmartStylePixelBufferRendererV1 _bindPixelBufferToTexture:usage:overrideMTLPixelFormatWithFormat:planeIndex:texturePtr:](self, "_bindPixelBufferToTexture:usage:overrideMTLPixelFormatWithFormat:planeIndex:texturePtr:", a3, 65542, 0, 0, &v8);
    v7 = v8;
    if (v6)
      FigDebugAssert3();
    else
      -[CMISmartStyleMetalRenderer setOutputImageTexture:](self->_smartStyleMetalRenderer, "setOutputImageTexture:", v7);

  }
  else
  {
    FigDebugAssert3();
  }
}

- (void)setOutputGainMapPixelBuffer:(__CVBuffer *)a3
{
  __CVBuffer *outputGainMapPixelBuffer;
  int v6;
  id v7;
  id v8;

  outputGainMapPixelBuffer = self->_outputGainMapPixelBuffer;
  if (outputGainMapPixelBuffer)
  {
    CFRelease(outputGainMapPixelBuffer);
    self->_outputGainMapPixelBuffer = 0;
  }
  if (a3)
  {
    self->_outputGainMapPixelBuffer = CVPixelBufferRetain(a3);
    v8 = 0;
    v6 = -[CMISmartStylePixelBufferRendererV1 _bindPixelBufferToTexture:usage:overrideMTLPixelFormatWithFormat:planeIndex:texturePtr:](self, "_bindPixelBufferToTexture:usage:overrideMTLPixelFormatWithFormat:planeIndex:texturePtr:", a3, 65542, 0, 0, &v8);
    v7 = v8;
    if (v6)
      FigDebugAssert3();
    else
      -[CMISmartStyleMetalRenderer setOutputGainMapTexture:](self->_smartStyleMetalRenderer, "setOutputGainMapTexture:", v7);

  }
  else
  {
    FigDebugAssert3();
  }
}

- (void)setOutputSmallLightMapPixelBuffer:(__CVBuffer *)a3
{
  __CVBuffer *outputSmallLightMapPixelBuffer;
  int v6;
  id v7;
  id v8;

  outputSmallLightMapPixelBuffer = self->_outputSmallLightMapPixelBuffer;
  if (outputSmallLightMapPixelBuffer)
  {
    CFRelease(outputSmallLightMapPixelBuffer);
    self->_outputSmallLightMapPixelBuffer = 0;
  }
  if (a3)
  {
    v8 = 0;
    v6 = -[CMISmartStylePixelBufferRendererV1 _bindPixelBufferToTexture:usage:overrideMTLPixelFormatWithFormat:planeIndex:texturePtr:](self, "_bindPixelBufferToTexture:usage:overrideMTLPixelFormatWithFormat:planeIndex:texturePtr:", a3, 7, 0, 0, &v8);
    v7 = v8;
    if (v6)
    {
      FigDebugAssert3();
    }
    else
    {
      self->_outputSmallLightMapPixelBuffer = CVPixelBufferRetain(a3);
      -[CMISmartStyleMetalRenderer setOutputSmallLightMapTexture:](self->_smartStyleMetalRenderer, "setOutputSmallLightMapTexture:", v7);
    }

  }
}

- (void)setOutputSmallLinearLightMapPixelBuffer:(__CVBuffer *)a3
{
  __CVBuffer *outputSmallLinearLightMapPixelBuffer;
  int v6;
  id v7;
  id v8;

  outputSmallLinearLightMapPixelBuffer = self->_outputSmallLinearLightMapPixelBuffer;
  if (outputSmallLinearLightMapPixelBuffer)
  {
    CFRelease(outputSmallLinearLightMapPixelBuffer);
    self->_outputSmallLinearLightMapPixelBuffer = 0;
  }
  if (a3)
  {
    v8 = 0;
    v6 = -[CMISmartStylePixelBufferRendererV1 _bindPixelBufferToTexture:usage:overrideMTLPixelFormatWithFormat:planeIndex:texturePtr:](self, "_bindPixelBufferToTexture:usage:overrideMTLPixelFormatWithFormat:planeIndex:texturePtr:", a3, 7, 0, 0, &v8);
    v7 = v8;
    if (v6)
    {
      FigDebugAssert3();
    }
    else
    {
      self->_outputSmallLinearLightMapPixelBuffer = CVPixelBufferRetain(a3);
      -[CMISmartStyleMetalRenderer setOutputSmallLinearLightMapTexture:](self->_smartStyleMetalRenderer, "setOutputSmallLinearLightMapTexture:", v7);
    }

  }
}

- (void)setOutputCodedLinearPixelBuffer:(__CVBuffer *)a3
{
  __CVBuffer *outputCodedLinearPixelBuffer;
  int v6;
  id v7;
  id v8;

  outputCodedLinearPixelBuffer = self->_outputCodedLinearPixelBuffer;
  if (outputCodedLinearPixelBuffer)
  {
    CFRelease(outputCodedLinearPixelBuffer);
    self->_outputCodedLinearPixelBuffer = 0;
  }
  if (a3)
  {
    v8 = 0;
    v6 = -[CMISmartStylePixelBufferRendererV1 _bindPixelBufferToTexture:usage:overrideMTLPixelFormatWithFormat:planeIndex:texturePtr:](self, "_bindPixelBufferToTexture:usage:overrideMTLPixelFormatWithFormat:planeIndex:texturePtr:", a3, 65543, 0, 0, &v8);
    v7 = v8;
    if (v6)
    {
      FigDebugAssert3();
    }
    else
    {
      self->_outputCodedLinearPixelBuffer = CVPixelBufferRetain(a3);
      -[CMISmartStyleMetalRenderer setOutputCodedLinearTexture:](self->_smartStyleMetalRenderer, "setOutputCodedLinearTexture:", v7);
    }

  }
}

- (NSMutableDictionary)outputCodedLinearMetadata
{
  return (NSMutableDictionary *)-[CMISmartStyleMetalRenderer outputCodedLinearMetadata](self->_smartStyleMetalRenderer, "outputCodedLinearMetadata");
}

- (void)setOutputCodedLinearMetadata:(id)a3
{
  -[CMISmartStyleMetalRenderer setOutputCodedLinearMetadata:](self->_smartStyleMetalRenderer, "setOutputCodedLinearMetadata:", a3);
}

- (NSMutableDictionary)outputImageStatistics
{
  return (NSMutableDictionary *)-[CMISmartStyleMetalRenderer outputImageStatistics](self->_smartStyleMetalRenderer, "outputImageStatistics");
}

- (void)setOutputImageStatistics:(id)a3
{
  -[CMISmartStyleMetalRenderer setOutputImageStatistics:](self->_smartStyleMetalRenderer, "setOutputImageStatistics:", a3);
}

- (int)_calculateROIShift
{
  double Width;
  double Height;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  float v11;
  float v12;
  float v13;
  float v14;
  float v15;
  float v16;
  float v17;
  float v18;
  double v20;
  double v21;

  Width = (double)CVPixelBufferGetWidth(self->_inputPixelBuffer);
  Height = (double)CVPixelBufferGetHeight(self->_inputPixelBuffer);
  v5 = (double)CVPixelBufferGetWidth(self->_inputPersonMaskPixelBuffer);
  v6 = (double)CVPixelBufferGetHeight(self->_inputPersonMaskPixelBuffer);
  v7 = (double)CVPixelBufferGetWidth(self->_inputSkinMaskPixelBuffer);
  v8 = (double)CVPixelBufferGetHeight(self->_inputSkinMaskPixelBuffer);
  v9 = (double)CVPixelBufferGetWidth(self->_inputSkyMaskPixelBuffer);
  v10 = (double)CVPixelBufferGetHeight(self->_inputSkyMaskPixelBuffer);
  v21 = (double)CVPixelBufferGetWidth(self->_inputLinearPixelBuffer);
  v20 = (double)CVPixelBufferGetHeight(self->_inputLinearPixelBuffer);
  -[CMISmartStyleMetalRenderer setLogicalImageSize:](self->_smartStyleMetalRenderer, "setLogicalImageSize:", Width, Height);
  -[CMISmartStyleMetalRenderer setInputPersonMaskTextureMappedRegion:](self->_smartStyleMetalRenderer, "setInputPersonMaskTextureMappedRegion:", -self->_inputPersonMaskCropRect.origin.x, -self->_inputPersonMaskCropRect.origin.y, v5, v6);
  -[CMISmartStyleMetalRenderer setInputSkinMaskTextureMappedRegion:](self->_smartStyleMetalRenderer, "setInputSkinMaskTextureMappedRegion:", -self->_inputSkinMaskCropRect.origin.x, -self->_inputSkinMaskCropRect.origin.y, v7, v8);
  -[CMISmartStyleMetalRenderer setInputSkyMaskTextureMappedRegion:](self->_smartStyleMetalRenderer, "setInputSkyMaskTextureMappedRegion:", -self->_inputSkyMaskCropRect.origin.x, -self->_inputSkyMaskCropRect.origin.y, v9, v10);
  v11 = self->_inputPersonMaskCropRect.size.width / Width / v5;
  v12 = self->_inputPersonMaskCropRect.size.height / Height / v6;
  -[CMISmartStyleMetalRenderer setLogicalImageToInputPersonMaskScale:](self->_smartStyleMetalRenderer, "setLogicalImageToInputPersonMaskScale:", v11, v12);
  v13 = self->_inputSkinMaskCropRect.size.width / Width / v7;
  v14 = self->_inputSkinMaskCropRect.size.height / Height / v8;
  -[CMISmartStyleMetalRenderer setLogicalImageToInputSkinMaskScale:](self->_smartStyleMetalRenderer, "setLogicalImageToInputSkinMaskScale:", v13, v14);
  v15 = self->_inputSkyMaskCropRect.size.width / Width / v9;
  v16 = self->_inputSkyMaskCropRect.size.height / Height / v10;
  -[CMISmartStyleMetalRenderer setLogicalImageToInputSkyMaskScale:](self->_smartStyleMetalRenderer, "setLogicalImageToInputSkyMaskScale:", v15, v16);
  v17 = v21 / Width / v21;
  v18 = v20 / Height / v20;
  -[CMISmartStyleMetalRenderer setLogicalImageToInputLinearImageScale:](self->_smartStyleMetalRenderer, "setLogicalImageToInputLinearImageScale:", v17, v18);
  return 0;
}

- (int)_createGlobalToneCurveTexture
{
  id v3;
  unsigned __int16 *v4;
  unsigned int v6;
  uint64_t v7;
  uint64_t v8;
  double v9;
  unsigned __int16 *v10;
  double v11;
  float v12;
  uint64_t v18;
  uint64_t v19;
  _BYTE *v20;
  unint64_t v21;
  double v22;
  unsigned __int16 *v23;
  float *v24;
  unsigned int v25;
  float v26;
  float v27;
  uint64_t i;
  float v29;
  int v30;
  int v31;
  MTLTexture *linearImageGlobalToneCurveTexture;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  MTLTexture *v44;
  MTLTexture *v45;
  int v46;
  _BYTE v48[24];
  __int128 v49;
  uint64_t v50;
  _BYTE v51[512];
  uint64_t v52;

  v52 = *MEMORY[0x1E0C80C00];
  -[NSDictionary objectForKeyedSubscript:](self->_inputMetadataDict, "objectForKeyedSubscript:", *MEMORY[0x1E0D06AF0]);
  v3 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v4 = (unsigned __int16 *)objc_msgSend(v3, "bytes");
  if (v4 && (v6 = *v4, v6 > 0x40))
  {
    v7 = v6 - 1;
    if (v6 == 257)
    {
      v8 = 0;
      LOWORD(_D0) = v4[256];
      v9 = (double)*(unint64_t *)&_D0;
      v10 = v4 + 1;
      do
      {
        LOWORD(_D0) = v10[v8];
        v11 = (double)*(unint64_t *)&_D0 / v9;
        if (v11 >= 0.0404499993)
        {
          v12 = (v11 + 0.0549999997) / 1.05499995;
          _D0 = powf(v12, 2.4);
        }
        else
        {
          _D0 = v11 / 12.9200001;
        }
        __asm { FCVT            H0, D0 }
        *(_WORD *)&v51[v8 * 2] = _H0;
        ++v8;
      }
      while (v8 != 256);
    }
    else
    {
      v18 = MEMORY[0x1E0C80A78]();
      v20 = &v48[-v19];
      LOWORD(v21) = *(_WORD *)(v18 + 2 * (int)v7);
      v22 = (double)v21;
      v23 = (unsigned __int16 *)(v18 + 2);
      v24 = (float *)&v48[-v19];
      do
      {
        v25 = *v23++;
        v26 = (double)v25 / v22;
        if (v26 >= 0.04045)
          v27 = powf((float)(v26 + 0.055) / 1.055, 2.4);
        else
          v27 = v26 / 12.92;
        *v24++ = v27;
        --v7;
      }
      while (v7);
      for (i = 0; i != 256; ++i)
      {
        v29 = (float)((float)(int)(v6 - 2) * (float)(int)i) / 255.0;
        v30 = vcvtms_s32_f32(v29);
        v31 = v30 & ~(v30 >> 31);
        if (v31 >= (int)(v6 - 3))
          v31 = v6 - 3;
        _S1 = *(float *)&v20[4 * v31]
            + (float)((float)(*(float *)&v20[4 * v31 + 4] - *(float *)&v20[4 * v31]) * (float)(v29 - (float)v31));
        __asm { FCVT            H1, S1 }
        *(_WORD *)&v51[2 * i] = LOWORD(_S1);
      }
    }
    linearImageGlobalToneCurveTexture = self->_linearImageGlobalToneCurveTexture;
    if (linearImageGlobalToneCurveTexture)
    {
      v34 = 0;
    }
    else
    {
      -[FigMetalContext allocator](self->_metalContext, "allocator");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      v34 = (void *)objc_msgSend(v35, "newTextureDescriptor");

      if (!v34)
      {
        FigDebugAssert3();
        v46 = FigSignalErrorAt();
        goto LABEL_24;
      }
      objc_msgSend(v34, "setLabel:", CFSTR("SmartStyle_GTCTexture_"));
      objc_msgSend(v34, "desc");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v36, "setTextureType:", 2);

      objc_msgSend(v34, "desc");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v37, "setPixelFormat:", 25);

      objc_msgSend(v34, "desc");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v38, "setWidth:", 256);

      objc_msgSend(v34, "desc");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v39, "setHeight:", 1);

      objc_msgSend(v34, "desc");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v40, "setDepth:", 1);

      objc_msgSend(v34, "desc");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v41, "setUsage:", 7);

      -[FigMetalContext device](self->_metalContext, "device");
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v34, "desc");
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      v44 = (MTLTexture *)objc_msgSend(v42, "newTextureWithDescriptor:", v43);
      v45 = self->_linearImageGlobalToneCurveTexture;
      self->_linearImageGlobalToneCurveTexture = v44;

      linearImageGlobalToneCurveTexture = self->_linearImageGlobalToneCurveTexture;
      if (!linearImageGlobalToneCurveTexture)
      {
        FigDebugAssert3();
        v46 = FigSignalErrorAt();

        goto LABEL_24;
      }
    }
    memset(v48, 0, sizeof(v48));
    v49 = xmmword_1D3305330;
    v50 = 1;
    -[MTLTexture replaceRegion:mipmapLevel:withBytes:bytesPerRow:](linearImageGlobalToneCurveTexture, "replaceRegion:mipmapLevel:withBytes:bytesPerRow:", v48, 0, v51, 512);

    v46 = 0;
  }
  else
  {
    FigDebugAssert3();
    v46 = 2;
  }
LABEL_24:

  return v46;
}

- (int)_bindPixelBufferToTexture:(__CVBuffer *)a3 usage:(unint64_t)a4 overrideMTLPixelFormatWithFormat:(unint64_t)a5 planeIndex:(int)a6 texturePtr:(id *)a7
{
  MTLPixelFormat MTLPixelFormatForCVPixelBuffer;
  const __CFAllocator *v13;
  __CVMetalTextureCache *textureCache;
  void *v15;
  const __CFDictionary *v16;
  size_t Width;
  size_t Height;
  CVReturn v19;
  id v20;
  int v21;
  __int16 v23;
  CVMetalTextureRef image;
  uint64_t v25;
  _QWORD v26[2];

  v26[1] = *MEMORY[0x1E0C80C00];
  image = 0;
  v23 = 257;
  if (a5)
  {
    MTLPixelFormatForCVPixelBuffer = a5;
    v23 = 0;
  }
  else
  {
    MTLPixelFormatForCVPixelBuffer = getMTLPixelFormatForCVPixelBuffer(a3, (char *)&v23 + 1, &v23);
    if (MTLPixelFormatForCVPixelBuffer == MTLPixelFormatInvalid)
      goto LABEL_10;
  }
  v13 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
  textureCache = self->_textureCache;
  v25 = *MEMORY[0x1E0CA8F58];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a4);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v26[0] = v15;
  v16 = (const __CFDictionary *)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v26, &v25, 1);
  Width = CVPixelBufferGetWidth(a3);
  Height = CVPixelBufferGetHeight(a3);
  v19 = CVMetalTextureCacheCreateTextureFromImage(v13, textureCache, a3, v16, MTLPixelFormatForCVPixelBuffer, Width, Height, a6, &image);

  if (!v19)
  {
    CVMetalTextureGetTexture(image);
    v20 = (id)objc_claimAutoreleasedReturnValue();
    *a7 = v20;
    if (v20)
    {
      SSRAttachColorManagementMetadata(v20, a3, HIBYTE(v23), v23);
      v21 = 0;
      goto LABEL_7;
    }
  }
LABEL_10:
  FigDebugAssert3();
  v21 = FigSignalErrorAt();
LABEL_7:
  if (image)
    CFRelease(image);
  return v21;
}

- (NSString)instanceLabel
{
  return self->_instanceLabel;
}

- (void)setInstanceLabel:(id)a3
{
  objc_storeStrong((id *)&self->_instanceLabel, a3);
}

- (CMISmartStyleMetalRenderer)metalRenderer
{
  return self->_smartStyleMetalRenderer;
}

- (__CVBuffer)inputPixelBuffer
{
  return self->_inputPixelBuffer;
}

- (__CVBuffer)inputThumbnailPixelBuffer
{
  return self->_inputThumbnailPixelBuffer;
}

- (NSDictionary)inputMetadataDict
{
  return self->_inputMetadataDict;
}

- (void)setInputMetadataDict:(id)a3
{
  objc_storeStrong((id *)&self->_inputMetadataDict, a3);
}

- (NSDictionary)inputLinearMetadataDict
{
  return self->_inputLinearMetadataDict;
}

- (void)setInputLinearMetadataDict:(id)a3
{
  objc_storeStrong((id *)&self->_inputLinearMetadataDict, a3);
}

- (__CVBuffer)inputLinearPixelBuffer
{
  return self->_inputLinearPixelBuffer;
}

- (__CVBuffer)inputGainMapPixelBuffer
{
  return self->_inputGainMapPixelBuffer;
}

- (__CVBuffer)inputPersonMaskPixelBuffer
{
  return self->_inputPersonMaskPixelBuffer;
}

- (CGRect)inputPersonMaskCropRect
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_inputPersonMaskCropRect.origin.x;
  y = self->_inputPersonMaskCropRect.origin.y;
  width = self->_inputPersonMaskCropRect.size.width;
  height = self->_inputPersonMaskCropRect.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (void)setInputPersonMaskCropRect:(CGRect)a3
{
  self->_inputPersonMaskCropRect = a3;
}

- (__CVBuffer)inputSkinMaskPixelBuffer
{
  return self->_inputSkinMaskPixelBuffer;
}

- (CGRect)inputSkinMaskCropRect
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_inputSkinMaskCropRect.origin.x;
  y = self->_inputSkinMaskCropRect.origin.y;
  width = self->_inputSkinMaskCropRect.size.width;
  height = self->_inputSkinMaskCropRect.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (void)setInputSkinMaskCropRect:(CGRect)a3
{
  self->_inputSkinMaskCropRect = a3;
}

- (__CVBuffer)inputSkyMaskPixelBuffer
{
  return self->_inputSkyMaskPixelBuffer;
}

- (CGRect)inputSkyMaskCropRect
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_inputSkyMaskCropRect.origin.x;
  y = self->_inputSkyMaskCropRect.origin.y;
  width = self->_inputSkyMaskCropRect.size.width;
  height = self->_inputSkyMaskCropRect.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (void)setInputSkyMaskCropRect:(CGRect)a3
{
  self->_inputSkyMaskCropRect = a3;
}

- (MTLBuffer)inputSRLCoefficientsBuf
{
  return self->_inputSRLCoefficientsBuf;
}

- (float)inputSRLCurveParameter
{
  return self->_inputSRLCurveParameter;
}

- (int)semanticStyleSceneType
{
  return self->_semanticStyleSceneType;
}

- (void)setSemanticStyleSceneType:(int)a3
{
  self->_semanticStyleSceneType = a3;
}

- (NSString)tuningParameterVariant
{
  return self->_tuningParameterVariant;
}

- (void)setTuningParameterVariant:(id)a3
{
  objc_storeStrong((id *)&self->_tuningParameterVariant, a3);
}

- (BOOL)isStreaming
{
  return self->_isStreaming;
}

- (void)setIsStreaming:(BOOL)a3
{
  self->_isStreaming = a3;
}

- (__CVBuffer)outputPixelBuffer
{
  return self->_outputPixelBuffer;
}

- (__CVBuffer)outputGainMapPixelBuffer
{
  return self->_outputGainMapPixelBuffer;
}

- (__CVBuffer)outputSmallLightMapPixelBuffer
{
  return self->_outputSmallLightMapPixelBuffer;
}

- (__CVBuffer)outputSmallLinearLightMapPixelBuffer
{
  return self->_outputSmallLinearLightMapPixelBuffer;
}

- (__CVBuffer)outputCodedLinearPixelBuffer
{
  return self->_outputCodedLinearPixelBuffer;
}

- (NSDictionary)cameraInfoByPortType
{
  return self->_cameraInfoByPortType;
}

- (void)setCameraInfoByPortType:(id)a3
{
  objc_storeStrong((id *)&self->_cameraInfoByPortType, a3);
}

- (NSDictionary)tuningParameters
{
  return self->_tuningParameters;
}

- (void)setTuningParameters:(id)a3
{
  objc_storeStrong((id *)&self->_tuningParameters, a3);
}

- (BOOL)useLiveMetalAllocations
{
  return self->_useLiveMetalAllocations;
}

- (void)setUseLiveMetalAllocations:(BOOL)a3
{
  self->_useLiveMetalAllocations = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tuningParameters, 0);
  objc_storeStrong((id *)&self->_cameraInfoByPortType, 0);
  objc_storeStrong((id *)&self->_outputCodedLinearMetadata, 0);
  objc_storeStrong((id *)&self->_tuningParameterVariant, 0);
  objc_storeStrong((id *)&self->_inputSRLCoefficientsBuf, 0);
  objc_storeStrong((id *)&self->_instanceLabel, 0);
  objc_storeStrong((id *)&self->_smartStyleMetalRenderer, 0);
  objc_storeStrong((id *)&self->_linearImageGlobalToneCurveTexture, 0);
  objc_storeStrong((id *)&self->_inputLinearMetadataDict, 0);
  objc_storeStrong((id *)&self->_inputMetadataDict, 0);
  objc_storeStrong((id *)&self->_metalContext, 0);
}

@end
