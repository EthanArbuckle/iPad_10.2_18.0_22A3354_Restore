@implementation BWStreamingRaytracingSDOFRenderer

+ (void)initialize
{
  objc_opt_class();
}

- (BWStreamingRaytracingSDOFRenderer)initWithCaptureDevice:(id)a3 commandQueue:(id)a4 smartStyleRenderingEnabled:(BOOL)a5
{
  _BOOL4 v5;
  BWStreamingRaytracingSDOFRenderer *v8;
  BWVideoDepthInferenceConfiguration *v9;
  float v10;
  objc_super v12;

  v5 = a5;
  v12.receiver = self;
  v12.super_class = (Class)BWStreamingRaytracingSDOFRenderer;
  v8 = -[BWStreamingRaytracingSDOFRenderer init](&v12, sel_init);
  if (v8)
  {
    v9 = -[BWVideoDepthInferenceConfiguration initWithConcurrencyWidth:videoDepthLayout:captureDevice:backpressureEvent:]([BWVideoDepthInferenceConfiguration alloc], "initWithConcurrencyWidth:videoDepthLayout:captureDevice:backpressureEvent:", 1, 0, a3, 0);
    -[BWVideoDepthInferenceConfiguration networkBias](v9, "networkBias");
    v8->_networkBias = v10;
    v8->_captureDevice = (BWFigVideoCaptureDevice *)a3;
    v8->_commandQueue = (MTLCommandQueue *)a4;
    v8->_portTypeProvidingTuningParameters = -[BWVideoDepthInferenceConfiguration portType](v9, "portType");
    v8->_smartStyleRenderingEnabled = v5;
    if (v5)
      -[BWStreamingRaytracingSDOFRenderer _loadAndConfigureSmartStyleBundle]((uint64_t)v8);
  }
  return v8;
}

- (uint64_t)_loadAndConfigureSmartStyleBundle
{
  void *v2;
  uint64_t v3;
  objc_class *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  if (!a1)
    return 0;
  v2 = BWLoadProcessorBundle((uint64_t)CFSTR("SmartStyle"), 1);
  if (!v2)
    goto LABEL_10;
  v3 = objc_msgSend(v2, "classNamed:", objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("CMISmartStyleProcessorInputOutputV%d"), 1));
  *(_QWORD *)(a1 + 152) = v3;
  if (!v3)
    goto LABEL_10;
  v4 = (objc_class *)objc_msgSend(v2, "classNamed:", objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("CMISmartStyleProcessorV%d"), 1));
  *(_QWORD *)(a1 + 160) = v4;
  if (!v4
    || (v5 = (void *)objc_msgSend([v4 alloc], "initWithOptionalMetalCommandQueue:", *(_QWORD *)(a1 + 128)),
        (*(_QWORD *)(a1 + 144) = v5) == 0)
    || (objc_msgSend(v5, "setInstanceLabel:", CFSTR("StreamingSDOF")),
        v6 = objc_msgSend(*(id *)(a1 + 160), "getSmartStyleCoefficientsFilterType:", CFSTR("iir")),
        *(_QWORD *)(a1 + 168) = v6,
        objc_msgSend(*(id *)(a1 + 144), "setConfiguration:", objc_msgSend(*(id *)(a1 + 160), "getDefaultProcessorConfigurationForStreamingWithFilterType:", v6)), !objc_msgSend(*(id *)(a1 + 144), "configuration")))
  {
LABEL_10:
    v8 = 4294954510;
LABEL_14:

    *(_QWORD *)(a1 + 144) = 0;
    return v8;
  }
  *(_DWORD *)(a1 + 184) = objc_msgSend(*(id *)(a1 + 160), "getRequiredFilteredCoefficientsPixelBufferPoolSizeForFilterType:", *(_QWORD *)(a1 + 168));
  v7 = objc_msgSend(*(id *)(a1 + 144), "setup");
  if ((_DWORD)v7)
  {
    v8 = v7;
    fig_log_get_emitter();
LABEL_13:
    FigDebugAssert3();
    goto LABEL_14;
  }
  v8 = objc_msgSend(*(id *)(a1 + 144), "prepareToProcess:", 2);
  if ((_DWORD)v8)
  {
    fig_log_get_emitter();
    goto LABEL_13;
  }
  return v8;
}

- (void)dealloc
{
  __CVMetalTextureCache *textureCache;
  objc_super v4;

  textureCache = self->_textureCache;
  if (textureCache)
    CFRelease(textureCache);

  v4.receiver = self;
  v4.super_class = (Class)BWStreamingRaytracingSDOFRenderer;
  -[BWStreamingRaytracingSDOFRenderer dealloc](&v4, sel_dealloc);
}

- (int)prepareForRenderingWithParameters:(id)a3 inputVideoFormat:(id)a4 inputMediaPropertiesByAttachedMediaKey:(id)a5
{
  FigMetalContext *v8;
  const __CFAllocator *v9;
  PTRenderRequest *v10;
  void *v11;
  void *v12;
  int v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  PTRenderPipeline *v18;
  PTRenderState *v19;
  int IsTenBit;
  int64_t v21;
  void *v22;
  BWPixelBufferPool *v23;
  int v24;
  uint64_t v26;
  _QWORD v27[2];

  v27[1] = *MEMORY[0x1E0C80C00];
  if (self->_metalContext)
  {
    v17 = 0;
    goto LABEL_25;
  }
  v8 = (FigMetalContext *)objc_msgSend(objc_alloc(MEMORY[0x1E0D08B28]), "initWithbundle:andOptionalCommandQueue:", objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class()), self->_commandQueue);
  self->_metalContext = v8;
  -[FigMetalContext setQueuePriority:](v8, "setQueuePriority:", 2);
  v9 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
  v26 = *MEMORY[0x1E0CA8F48];
  v27[0] = &unk_1E49F9BA0;
  if (CVMetalTextureCacheCreate(v9, (CFDictionaryRef)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v27, &v26, 1), (id)-[FigMetalContext device](self->_metalContext, "device"), 0, &self->_textureCache)|| !self->_textureCache)
  {
    fig_log_get_emitter();
    FigDebugAssert3();
    v17 = 0;
    v24 = -12786;
    goto LABEL_26;
  }
  v10 = (PTRenderRequest *)objc_msgSend(objc_alloc((Class)getPTRenderRequestClass()), "init");
  self->_ptRenderRequest = v10;
  if (!v10 || (v11 = (void *)objc_msgSend(a5, "objectForKeyedSubscript:", CFSTR("Depth"))) == 0)
  {
    fig_log_get_emitter();
    FigDebugAssert3();
    v17 = 0;
LABEL_30:
    v24 = -12780;
    goto LABEL_26;
  }
  v12 = (void *)objc_msgSend(v11, "resolvedVideoFormat");
  v13 = -[BWStreamingRaytracingSDOFRenderer createTextureDescriptorsWithColorVideoFormat:depthVideoFormat:]((uint64_t)self, a4, v12);
  if (v13)
  {
    v24 = v13;
    fig_log_get_emitter();
    FigDebugAssert3();
    v17 = 0;
    goto LABEL_26;
  }
  self->_disparityTextureWhileWaitingForCamera = (MTLTexture *)objc_msgSend((id)-[FigMetalContext device](self->_metalContext, "device"), "newTextureWithDescriptor:", self->_texDescDisparity);
  v14 = (void *)objc_msgSend(-[NSDictionary objectForKeyedSubscript:](-[BWFigVideoCaptureDevice sensorIDDictionaryByPortType](self->_captureDevice, "sensorIDDictionaryByPortType"), "objectForKeyedSubscript:", self->_portTypeProvidingTuningParameters), "valueForKeyPath:", CFSTR("CinematicVideoParameters.RenderVersion"));
  if (v14)
    v15 = (int)objc_msgSend(v14, "intValue");
  else
    v15 = objc_msgSend((id)getPTRenderPipelineClass(), "latestVersion");
  v16 = (void *)objc_msgSend(objc_alloc((Class)getPTRenderPipelineDescriptorClass()), "initWithDevice:version:colorSize:disparitySize:", -[FigMetalContext device](self->_metalContext, "device"), v15, (double)(unint64_t)objc_msgSend(a4, "width"), (double)(unint64_t)objc_msgSend(a4, "height"), (double)(unint64_t)objc_msgSend(v12, "width"), (double)(unint64_t)objc_msgSend(v12, "height"));
  v17 = v16;
  if (!v16
    || (objc_msgSend(v16, "setDebugRendering:", 0),
        v18 = (PTRenderPipeline *)objc_msgSend(objc_alloc((Class)getPTRenderPipelineClass()), "initWithDescriptor:", v17), (self->_ptRenderPipeline = v18) == 0)|| (v19 = (PTRenderState *)(id)-[PTRenderPipeline createRenderStateWithQuality:](v18, "createRenderStateWithQuality:", 0), (self->_ptRenderState = v19) == 0))
  {
LABEL_29:
    fig_log_get_emitter();
    FigDebugAssert3();
    goto LABEL_30;
  }
  self->_isFullRange = FigCapturePixelFormatIsFullRange(objc_msgSend(a4, "pixelFormat"));
  IsTenBit = FigCapturePixelFormatIsTenBit(objc_msgSend(a4, "pixelFormat"));
  self->_isTenBit = IsTenBit;
  v21 = 8;
  if (IsTenBit)
    v21 = 10;
  self->_YCbCrColorDepth = v21;
  self->_alignment = ($470D365275581EF16070F5A11344F73E)0x200000002;
  if (FigCapturePixelFormatGetCompressionType(objc_msgSend(a4, "pixelFormat")))
    self->_alignment = ($470D365275581EF16070F5A11344F73E)FigCapturePixelFormatTileAlignment(objc_msgSend(a4, "pixelFormat"));
  if (!self->_smartStyleRenderingEnabled || !self->_smartStyleCoefficientsFilterType)
  {
LABEL_25:
    v24 = 0;
    goto LABEL_26;
  }
  v22 = (void *)objc_msgSend(a5, "objectForKeyedSubscript:", 0x1E495B358);
  if (!v22)
    goto LABEL_29;
  v23 = -[BWPixelBufferPool initWithVideoFormat:capacity:name:memoryPool:]([BWPixelBufferPool alloc], "initWithVideoFormat:capacity:name:memoryPool:", objc_msgSend(v22, "resolvedVideoFormat"), self->_smartStyleFilteredCoefficientsPixelBufferPoolSize, CFSTR("Cinematic preview"), +[BWMemoryPool sharedMemoryPool](BWMemoryPool, "sharedMemoryPool"));
  self->_smartStyleCoefficientsPixelBufferPool = v23;
  if (v23)
    v24 = 0;
  else
    v24 = -12786;
LABEL_26:

  return v24;
}

- (uint64_t)createTextureDescriptorsWithColorVideoFormat:(void *)a3 depthVideoFormat:
{
  id *v5;
  int v6;
  __int128 v7;
  uint64_t v8;
  uint64_t v9;
  int v10;
  int v11;
  int v12;
  unsigned __int16 v13;
  int v14;
  unsigned __int16 v15;
  int v16;
  int v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  unint64_t v22;
  unint64_t v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  id v28;
  __int128 v29;
  unsigned __int16 v30;
  unsigned __int16 v31;

  if (!result)
    return result;
  v5 = (id *)result;
  v6 = objc_msgSend(a2, "pixelFormat");
  result = 4294954516;
  v8 = 589;
  v9 = 588;
  if (v6 <= 796423729)
  {
    *(_QWORD *)&v7 = 0x200000002;
    if (v6 > 762865199)
    {
      v29 = v7;
      if (v6 > 792225327)
      {
        if (v6 > 796419631)
        {
          if (v6 != 796419632)
          {
            if (v6 != 796419634)
            {
              v10 = 796423728;
              goto LABEL_44;
            }
LABEL_50:
            v8 = 589;
            v9 = 588;
            v16 = objc_msgSend(a3, "pixelFormat", 0x100000002, *((_QWORD *)&v7 + 1));
            goto LABEL_64;
          }
          goto LABEL_63;
        }
        if (v6 != 792225328)
        {
          v12 = 792229424;
          goto LABEL_55;
        }
LABEL_56:
        v8 = 30;
        v9 = 10;
        goto LABEL_63;
      }
      if (v6 > 762869295)
      {
        if (v6 == 762869296)
          goto LABEL_63;
        v13 = 30258;
      }
      else
      {
        if (v6 == 762865200)
          goto LABEL_63;
        v13 = 26162;
      }
      v11 = v13 | 0x2D780000;
LABEL_49:
      if (v6 != v11)
        return result;
      goto LABEL_50;
    }
    v29 = v7;
    if (v6 <= 645428783)
    {
      if (v6 <= 645424687)
      {
        if (v6 != 641230384)
        {
          v12 = 641234480;
          goto LABEL_55;
        }
        goto LABEL_56;
      }
      if (v6 == 645424688)
        goto LABEL_63;
      v15 = 26162;
      goto LABEL_41;
    }
    if (v6 <= 758670895)
    {
      if (v6 == 645428784)
        goto LABEL_63;
      v15 = 30258;
LABEL_41:
      v11 = v15 | 0x26780000;
      goto LABEL_49;
    }
    if (v6 == 758670896)
      goto LABEL_56;
    v12 = 758674992;
LABEL_55:
    if (v6 != v12)
      return result;
    goto LABEL_56;
  }
  if (v6 <= 2016686641)
  {
    *(_QWORD *)&v7 = 0x200000002;
    v29 = v7;
    if (v6 <= 1882468913)
    {
      if (v6 <= 875704437)
      {
        if (v6 == 796423730)
          goto LABEL_50;
        v12 = 875704422;
        goto LABEL_55;
      }
      if (v6 == 875704438)
        goto LABEL_56;
      v10 = 1882468912;
LABEL_44:
      if (v6 != v10)
        return result;
      goto LABEL_63;
    }
    if (v6 <= 1885745713)
    {
      if (v6 == 1882468914)
        goto LABEL_50;
      v10 = 1885745712;
      goto LABEL_44;
    }
    if (v6 == 1885745714)
      goto LABEL_50;
    v14 = 2016686640;
    goto LABEL_59;
  }
  *(_QWORD *)&v7 = 0x200000002;
  if (v6 <= 2084075055)
  {
    v29 = v7;
    if (v6 > 2019963441)
    {
      if (v6 != 2019963442)
      {
        v12 = 2084070960;
        goto LABEL_55;
      }
    }
    else if (v6 != 2016686642)
    {
      v14 = 2019963440;
LABEL_59:
      if (v6 != v14)
        return result;
      goto LABEL_62;
    }
    *(_QWORD *)&v7 = 0x100000002;
    v29 = v7;
LABEL_62:
    v8 = 578;
    v9 = 576;
    goto LABEL_63;
  }
  v29 = v7;
  if (v6 <= 2088265265)
  {
    if (v6 == 2084075056)
      goto LABEL_56;
    v10 = 2088265264;
    goto LABEL_44;
  }
  if (v6 == 2088269362)
    goto LABEL_50;
  if (v6 != 2088269360)
  {
    v11 = 2088265266;
    goto LABEL_49;
  }
LABEL_63:
  v16 = objc_msgSend(a3, "pixelFormat", v29);
LABEL_64:
  v17 = v16;
  result = 4294954516;
  if (v17 <= 1278226487)
  {
    if (v17 == 641230384 || v17 == 875704422 || v17 == 875704438)
    {
      v18 = 500;
LABEL_77:

      v19 = objc_msgSend(a2, "width");
      v20 = objc_msgSend(a2, "height");
      v21 = (void *)objc_msgSend(MEMORY[0x1E0CC6BB0], "texture2DDescriptorWithPixelFormat:width:height:mipmapped:", v9, v19, v20, 0);
      objc_msgSend(v21, "setUsage:", 3);
      v5[5] = v21;
      v22 = objc_msgSend(a2, "width") / (unint64_t)v30;
      v23 = objc_msgSend(a2, "height");
      v24 = (void *)objc_msgSend(MEMORY[0x1E0CC6BB0], "texture2DDescriptorWithPixelFormat:width:height:mipmapped:", v8, v22, v23 / v31, 0);
      objc_msgSend(v24, "setUsage:", 3);
      v5[6] = v24;
      v25 = objc_msgSend(a3, "width");
      v26 = objc_msgSend(a3, "height");
      v27 = (void *)objc_msgSend(MEMORY[0x1E0CC6BB0], "texture2DDescriptorWithPixelFormat:width:height:mipmapped:", v18, v25, v26, 0);
      objc_msgSend(v27, "setUsage:", 3);
      v28 = v27;
      result = 0;
      v5[7] = v28;
    }
  }
  else
  {
    if (v17 <= 1278226535)
    {
      if (v17 == 1278226488)
      {
        v18 = 10;
      }
      else
      {
        if (v17 != 1278226534)
          return result;
        v18 = 55;
      }
      goto LABEL_77;
    }
    if (v17 == 1751411059 || v17 == 1278226536)
    {
      v18 = 25;
      goto LABEL_77;
    }
  }
  return result;
}

- (void)renderUsingParameters:(id)a3 inputPixelBuffer:(__CVBuffer *)a4 inputSampleBuffer:(opaqueCMSampleBuffer *)a5 originalPixelBuffer:(__CVBuffer *)a6 processedPixelBuffer:(__CVBuffer *)a7 completionHandler:(id)a8
{
  void *v13;
  __int128 v14;
  _QWORD *v15;
  opaqueCMSampleBuffer *v16;
  void *PTTuningParametersClass;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  opaqueCMSampleBuffer *AttachedMedia;
  CFTypeRef v23;
  void *v24;
  void *disparityTextureWhileWaitingForCamera;
  __CVBuffer *ImageBuffer;
  void *v27;
  void *v28;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  size_t Width;
  size_t Height;
  $470D365275581EF16070F5A11344F73E alignment;
  float v43;
  uint64_t v44;
  double v45;
  float v46;
  int v47;
  float v48;
  int v49;
  float v50;
  int v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  PTRenderRequest *ptRenderRequest;
  void *v56;
  float64x2_t v57;
  _QWORD v58[5];
  _QWORD v59[4];
  double v60;
  double v61;
  float64x2_t v62;
  __int128 v63;
  __int128 v64;

  if (*MEMORY[0x1E0CA1FC0] == 1)
    kdebug_trace();
  v13 = (void *)CMGetAttachment(a5, (CFStringRef)*MEMORY[0x1E0D05CB0], 0);
  v14 = *(_OWORD *)(MEMORY[0x1E0C9D628] + 16);
  v63 = *MEMORY[0x1E0C9D628];
  v64 = v14;
  FigCFDictionaryGetCGRectIfPresent();
  v15 = (_QWORD *)MEMORY[0x1E0D06DE8];
  if (!self->_renderStateIsConfigured)
  {
    -[PTRenderState setSourceColorBitDepth:](self->_ptRenderState, "setSourceColorBitDepth:", LODWORD(self->_YCbCrColorDepth));
    v16 = a5;
    PTTuningParametersClass = (void *)getPTTuningParametersClass();
    -[PTRenderState setHwModelID:](self->_ptRenderState, "setHwModelID:", objc_msgSend(PTTuningParametersClass, "hwModelIDFromFigModelSpecificName:", FigCaptureGetModelSpecificName()));
    v18 = getPTTuningParametersClass();
    v19 = -[PTRenderState hwModelID](self->_ptRenderState, "hwModelID");
    v20 = objc_msgSend((id)objc_msgSend(v13, "objectForKeyedSubscript:", *v15), "intValue");
    v21 = (void *)v18;
    a5 = v16;
    objc_msgSend(v21, "noiseScaleFactorForHwModelID:sensorID:", v19, v20);
    -[PTRenderState setNoiseScaleFactor:](self->_ptRenderState, "setNoiseScaleFactor:");
    self->_renderStateIsConfigured = 1;
  }
  AttachedMedia = (opaqueCMSampleBuffer *)BWSampleBufferGetAttachedMedia(a5, (uint64_t)CFSTR("Depth"));
  v23 = CMGetAttachment(a5, CFSTR("CinematicVideoCinematographyMetadata"), 0);
  v24 = (void *)v23;
  if (v23 && AttachedMedia)
  {
LABEL_10:
    ImageBuffer = CMSampleBufferGetImageBuffer(AttachedMedia);
    disparityTextureWhileWaitingForCamera = -[BWStreamingRaytracingSDOFRenderer newTextureFromCacheUsingPixelBuffer:textureDescriptor:plane:]((uint64_t)self, ImageBuffer, self->_texDescDisparity, 0);

    self->_disparityTextureWhileWaitingForCamera = 0;
    goto LABEL_11;
  }
  disparityTextureWhileWaitingForCamera = self->_disparityTextureWhileWaitingForCamera;
  if (!disparityTextureWhileWaitingForCamera)
  {
    if (!AttachedMedia || !v23)
    {
      fig_log_get_emitter();
      goto LABEL_31;
    }
    goto LABEL_10;
  }
LABEL_11:
  v27 = -[BWStreamingRaytracingSDOFRenderer getPTTexture:]((uint64_t)self, a4);
  v28 = -[BWStreamingRaytracingSDOFRenderer getPTTexture:]((uint64_t)self, a7);
  v60 = 0.0;
  v61 = 0.0;
  __asm { FMOV            V0.2D, #1.0 }
  v57 = _Q0;
  v62 = _Q0;
  FigCFDictionaryGetCGRectIfPresent();
  -[PTRenderRequest setSourceColor:](self->_ptRenderRequest, "setSourceColor:", v27);
  -[PTRenderRequest setSourceDisparity:](self->_ptRenderRequest, "setSourceDisparity:", disparityTextureWhileWaitingForCamera);
  -[PTRenderRequest setDestinationColor:](self->_ptRenderRequest, "setDestinationColor:", v28);
  -[PTRenderRequest setRenderState:](self->_ptRenderRequest, "setRenderState:", self->_ptRenderState);
  -[PTRenderRequest setTotalSensorCropRectSize:](self->_ptRenderRequest, "setTotalSensorCropRectSize:", v64);
  *(float *)&v34 = (float)(int)objc_msgSend((id)objc_msgSend(v13, "objectForKeyedSubscript:", *MEMORY[0x1E0D06A70]), "intValue");
  -[PTRenderRequest setFocalLenIn35mmFilm:](self->_ptRenderRequest, "setFocalLenIn35mmFilm:", v34);
  -[PTRenderRequest setSensorID:](self->_ptRenderRequest, "setSensorID:", objc_msgSend((id)objc_msgSend(v13, "objectForKeyedSubscript:", *v15), "intValue"));
  -[PTRenderRequest setConversionGain:](self->_ptRenderRequest, "setConversionGain:", objc_msgSend((id)objc_msgSend(v13, "objectForKeyedSubscript:", *MEMORY[0x1E0D06960]), "intValue"));
  -[PTRenderRequest setReadNoise_1x:](self->_ptRenderRequest, "setReadNoise_1x:", objc_msgSend((id)objc_msgSend(v13, "objectForKeyedSubscript:", *MEMORY[0x1E0D06D48]), "intValue"));
  -[PTRenderRequest setReadNoise_8x:](self->_ptRenderRequest, "setReadNoise_8x:", objc_msgSend((id)objc_msgSend(v13, "objectForKeyedSubscript:", *MEMORY[0x1E0D06D50]), "intValue"));
  -[PTRenderRequest setAGC:](self->_ptRenderRequest, "setAGC:", objc_msgSend((id)objc_msgSend(v13, "objectForKeyedSubscript:", *MEMORY[0x1E0D067E0]), "intValue"));
  -[PTRenderRequest setFrameId:](self->_ptRenderRequest, "setFrameId:", arc4random());
  LODWORD(v35) = 0;
  if (!self->_disparityTextureWhileWaitingForCamera)
    objc_msgSend((id)objc_msgSend(v24, "objectForKeyedSubscript:", 0x1E4959DD8, v35), "floatValue");
  -[PTRenderRequest setAlphaLowLight:](self->_ptRenderRequest, "setAlphaLowLight:", v35);
  LODWORD(v36) = 0.5;
  if (!self->_disparityTextureWhileWaitingForCamera)
    objc_msgSend((id)objc_msgSend(v24, "objectForKeyedSubscript:", 0x1E4959DF8, v36), "floatValue");
  -[PTRenderRequest setFocusDisparity:](self->_ptRenderRequest, "setFocusDisparity:", v36);
  LODWORD(v37) = 4.5;
  if (!self->_disparityTextureWhileWaitingForCamera)
    objc_msgSend((id)objc_msgSend(v24, "objectForKeyedSubscript:", 0x1E4959DB8, v37), "floatValue");
  -[PTRenderRequest setFNumber:](self->_ptRenderRequest, "setFNumber:", v37);
  *(float *)&v38 = self->_networkBias;
  -[PTRenderRequest setNetworkBias:](self->_ptRenderRequest, "setNetworkBias:", v38);
  __asm { FMOV            V0.2S, #1.0 }
  -[PTRenderRequest setVisCropFactor:](self->_ptRenderRequest, "setVisCropFactor:", _D0);
  -[PTRenderRequest setVisCropFactorPreview:](self->_ptRenderRequest, "setVisCropFactorPreview:", COERCE_DOUBLE(vcvt_f32_f64(vdivq_f64(v57, v62))));
  Width = CVPixelBufferGetWidth(a4);
  Height = CVPixelBufferGetHeight(a4);
  alignment = self->_alignment;
  v43 = v60 * (double)Width;
  v44 = (int)FigCaptureFloorFloatToMultipleOf(alignment.width, v43);
  v45 = (double)Height;
  v46 = v61 * (double)Height;
  v47 = FigCaptureFloorFloatToMultipleOf(alignment.height, v46);
  v48 = v62.f64[0] * (double)Width;
  v49 = FigCaptureCeilFloatToMultipleOf(alignment.width, v48);
  v50 = v62.f64[1] * v45;
  v51 = FigCaptureCeilFloatToMultipleOf(alignment.height, v50);
  v52 = alignment.width;
  if ((v60 + v62.f64[0]) * (double)Width <= (double)(unint64_t)(v49 + v44))
    v52 = 0;
  v53 = v52 + v49;
  if ((v61 + v62.f64[1]) * v45 <= (double)(unint64_t)(v51 + (uint64_t)v47))
    v54 = 0;
  else
    v54 = *(uint64_t *)&alignment >> 32;
  ptRenderRequest = self->_ptRenderRequest;
  v59[0] = v44;
  v59[1] = v47;
  v59[2] = v53;
  v59[3] = v54 + v51;
  -[PTRenderRequest setScissorRect:](ptRenderRequest, "setScissorRect:", v59);
  if (self->_smartStyleRenderingEnabled && (BWSmartStyleRenderingShouldBeBypassed(a5) & 1) == 0)
    -[PTRenderRequest setIntegratedStyleCoefficientsTextureArray:](self->_ptRenderRequest, "setIntegratedStyleCoefficientsTextureArray:", -[BWStreamingRaytracingSDOFRenderer _runSmartStyleIntegrate:]((uint64_t)self, a5));
  if (!self->_disparityTextureWhileWaitingForCamera)

  v56 = (void *)objc_msgSend((id)-[FigMetalContext commandQueue](self->_metalContext, "commandQueue"), "commandBuffer");
  if (!-[PTRenderPipeline encodeRenderTo:withRenderRequest:](self->_ptRenderPipeline, "encodeRenderTo:withRenderRequest:", v56, self->_ptRenderRequest))
  {
    v58[0] = MEMORY[0x1E0C809B0];
    v58[1] = 3221225472;
    v58[2] = __153__BWStreamingRaytracingSDOFRenderer_renderUsingParameters_inputPixelBuffer_inputSampleBuffer_originalPixelBuffer_processedPixelBuffer_completionHandler___block_invoke;
    v58[3] = &unk_1E4922398;
    v58[4] = a8;
    objc_msgSend(v56, "addCompletedHandler:", v58);
    objc_msgSend(v56, "commit");
    return;
  }
  fig_log_get_emitter();
LABEL_31:
  FigDebugAssert3();
  (*((void (**)(id, _QWORD, _QWORD))a8 + 2))(a8, 0, 0);
}

- (id)newTextureFromCacheUsingPixelBuffer:(void *)a3 textureDescriptor:(size_t)a4 plane:
{
  __CVMetalTextureCache *v4;
  const __CFAllocator *v8;
  id Texture;
  id v10;
  id v11;
  CVMetalTextureRef image;
  _QWORD v14[2];
  _QWORD v15[3];

  v15[2] = *MEMORY[0x1E0C80C00];
  if (!a1)
    return 0;
  image = 0;
  v4 = *(__CVMetalTextureCache **)(a1 + 32);
  if (!v4)
  {
    fig_log_get_emitter();
LABEL_12:
    FigDebugAssert3();
    v10 = 0;
    goto LABEL_7;
  }
  v8 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
  v14[0] = *MEMORY[0x1E0CA8F58];
  v15[0] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(a3, "usage"));
  v14[1] = *MEMORY[0x1E0CA8F50];
  v15[1] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(a3, "storageMode"));
  if (CVMetalTextureCacheCreateTextureFromImage(v8, v4, a2, (CFDictionaryRef)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v15, v14, 2), (MTLPixelFormat)objc_msgSend(a3, "pixelFormat"), objc_msgSend(a3, "width"), objc_msgSend(a3, "height"), a4, &image)|| !image)
  {
    fig_log_get_emitter();
    goto LABEL_12;
  }
  Texture = CVMetalTextureGetTexture(image);
  v10 = Texture;
  if (Texture)
  {
    v11 = Texture;
  }
  else
  {
    fig_log_get_emitter();
    FigDebugAssert3();
  }
LABEL_7:
  if (image)
    CFRelease(image);
  return v10;
}

- (void)getPTTexture:(uint64_t)a1
{
  id v4;
  id v5;
  void *v6;

  if (!a1)
    return 0;
  v4 = -[BWStreamingRaytracingSDOFRenderer newTextureFromCacheUsingPixelBuffer:textureDescriptor:plane:](a1, a2, *(void **)(a1 + 40), 0);
  v5 = -[BWStreamingRaytracingSDOFRenderer newTextureFromCacheUsingPixelBuffer:textureDescriptor:plane:](a1, a2, *(void **)(a1 + 48), 1uLL);
  v6 = (void *)objc_msgSend((id)getPTTextureClass(), "createYUV420:chroma:", v4, v5);
  objc_msgSend(v6, "setColorPrimaries:", CMGetAttachment(a2, (CFStringRef)*MEMORY[0x1E0CA8D68], 0));
  objc_msgSend(v6, "setTransferFunction:", CMGetAttachment(a2, (CFStringRef)*MEMORY[0x1E0CA8E98], 0));
  objc_msgSend(v6, "setYCbCrMatrix:", CMGetAttachment(a2, (CFStringRef)*MEMORY[0x1E0CA8EE8], 0));
  objc_msgSend(v6, "setYCbCrFullRange:", *(unsigned __int8 *)(a1 + 72));
  objc_msgSend(v6, "setYCbCrColorDepth:", *(_QWORD *)(a1 + 88));

  return v6;
}

- (uint64_t)_runSmartStyleIntegrate:(uint64_t)a1
{
  CFTypeRef v4;
  CFTypeRef v5;
  opaqueCMSampleBuffer *AttachedMedia;
  uint64_t v7;
  opaqueCMSampleBuffer *v8;
  CVImageBufferRef ImageBuffer;
  CVImageBufferRef v10;
  CVImageBufferRef v11;
  CVImageBufferRef v12;
  opaqueCMSampleBuffer *v13;
  void *v14;
  uint64_t v15;
  const void *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  __int128 v21;
  uint64_t v22;
  __int128 v23;
  uint64_t v24;

  if (!a1)
    return 0;
  if (!sbuf)
    goto LABEL_20;
  if (!CMSampleBufferGetImageBuffer(sbuf))
    goto LABEL_20;
  v4 = CMGetAttachment(sbuf, (CFStringRef)*MEMORY[0x1E0D05CB0], 0);
  if (!v4)
    goto LABEL_20;
  v5 = v4;
  AttachedMedia = (opaqueCMSampleBuffer *)BWSampleBufferGetAttachedMedia(sbuf, 0x1E495B3B8);
  if (!AttachedMedia)
    goto LABEL_25;
  v7 = BWSampleBufferGetAttachedMedia(sbuf, 0x1E495B358);
  if (!v7)
  {
LABEL_21:
    v19 = 0;
    AttachedMedia = 0;
    goto LABEL_18;
  }
  v8 = (opaqueCMSampleBuffer *)v7;
  ImageBuffer = CMSampleBufferGetImageBuffer(AttachedMedia);
  if (!ImageBuffer || (v10 = ImageBuffer, (v11 = CMSampleBufferGetImageBuffer(v8)) == 0))
  {
LABEL_20:
    fig_log_get_emitter();
    FigDebugAssert3();
    goto LABEL_21;
  }
  v12 = v11;
  v13 = (opaqueCMSampleBuffer *)objc_opt_new();
  AttachedMedia = v13;
  if (!v13)
  {
    fig_log_get_emitter();
LABEL_24:
    FigDebugAssert3();
    goto LABEL_25;
  }
  -[opaqueCMSampleBuffer setInputUnstyledThumbnailPixelBuffer:](v13, "setInputUnstyledThumbnailPixelBuffer:", v10);
  -[opaqueCMSampleBuffer setInputMetadataDict:](AttachedMedia, "setInputMetadataDict:", v5);
  if (!*(_QWORD *)(a1 + 168))
  {
    -[opaqueCMSampleBuffer setInputStyleCoefficientsPixelBuffer:](AttachedMedia, "setInputStyleCoefficientsPixelBuffer:", v12);
    goto LABEL_16;
  }
  v23 = 0uLL;
  v24 = 0;
  -[BWStreamingRaytracingSDOFRenderer _getSampleBufferPresentationTimeStamp:](sbuf, (CMTime *)a1, (uint64_t)&v23);
  if ((BYTE12(v23) & 1) == 0)
  {
LABEL_25:
    v19 = 0;
    goto LABEL_18;
  }
  v14 = (void *)objc_msgSend(*(id *)(a1 + 144), "utilities");
  v21 = v23;
  v22 = v24;
  if (objc_msgSend(v14, "enqueueCoefficientsForFiltering:withMetadata:pts:", v12, v5, &v21))
    goto LABEL_23;
  v15 = objc_msgSend(*(id *)(a1 + 176), "newPixelBuffer");
  if (!v15)
    goto LABEL_23;
  v16 = (const void *)v15;
  v17 = (void *)objc_msgSend(*(id *)(a1 + 144), "utilities");
  v18 = *(_QWORD *)(a1 + 168);
  v21 = v23;
  v22 = v24;
  objc_msgSend(v17, "filterCoefficientsForFrameWithMetadata:pts:filterType:toPixelBuffer:", v5, &v21, v18, v16);
  -[opaqueCMSampleBuffer setInputStyleCoefficientsPixelBuffer:](AttachedMedia, "setInputStyleCoefficientsPixelBuffer:", v16);
  CFRelease(v16);
LABEL_16:
  objc_msgSend(*(id *)(a1 + 144), "setInputOutput:", AttachedMedia);
  if (objc_msgSend(*(id *)(a1 + 144), "process"))
  {
LABEL_23:
    fig_log_get_emitter();
    goto LABEL_24;
  }
  v19 = objc_msgSend(*(id *)(a1 + 144), "outputIntegratedStyleCoefficientsTexture");
LABEL_18:

  return v19;
}

uint64_t __153__BWStreamingRaytracingSDOFRenderer_renderUsingParameters_inputPixelBuffer_inputSampleBuffer_originalPixelBuffer_processedPixelBuffer_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  if (objc_msgSend(a2, "error"))
    objc_msgSend((id)objc_msgSend(a2, "error"), "description");
  if (*MEMORY[0x1E0CA1FC0] == 1)
    kdebug_trace();
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (signed)type
{
  return 0;
}

- (BOOL)supportsAnimation
{
  return 0;
}

- (BOOL)adjustsMetadata
{
  return 0;
}

- (NSString)displayName
{
  return (NSString *)CFSTR("Raytracing SDOF Renderer");
}

- (CMTime)_getSampleBufferPresentationTimeStamp:(uint64_t)a3@<X8>
{
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  CMTime v9;

  if (result)
  {
    v5 = MEMORY[0x1E0CA2E18];
    *(_OWORD *)a3 = *MEMORY[0x1E0CA2E18];
    *(_QWORD *)(a3 + 16) = *(_QWORD *)(v5 + 16);
    if (target)
    {
      v6 = (void *)CMGetAttachment(target, (CFStringRef)*MEMORY[0x1E0D05CB0], 0);
      if (v6
        && (v7 = v6, v8 = *MEMORY[0x1E0D05D00], objc_msgSend(v6, "objectForKeyedSubscript:", *MEMORY[0x1E0D05D00])))
      {
        result = CMTimeMakeFromDictionary(&v9, (CFDictionaryRef)objc_msgSend(v7, "objectForKeyedSubscript:", v8));
      }
      else
      {
        result = CMSampleBufferGetPresentationTimeStamp(&v9, (CMSampleBufferRef)target);
      }
      *(CMTime *)a3 = v9;
    }
    else
    {
      fig_log_get_emitter();
      return (CMTime *)FigDebugAssert3();
    }
  }
  else
  {
    *(_QWORD *)a3 = 0;
    *(_QWORD *)(a3 + 8) = 0;
    *(_QWORD *)(a3 + 16) = 0;
  }
  return result;
}

@end
