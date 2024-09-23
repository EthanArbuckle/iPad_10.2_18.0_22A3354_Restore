@implementation BWStillImageFilterNode

- (void)didSelectFormat:(id)a3 forInput:(id)a4 forAttachedMediaKey:(id)a5
{
  int v9;
  id v10;
  objc_super v11;

  if (objc_msgSend(a5, "isEqualToString:", CFSTR("Depth")))
  {
    if (self->_portraitRenderQuality == 2)
    {
      self->_depthDataMapDimensions.width = 384;
      v9 = 288;
    }
    else
    {
      self->_depthDataMapDimensions.width = objc_msgSend(a3, "width");
      v9 = objc_msgSend(a3, "height");
    }
    self->_depthDataMapDimensions.height = v9;
  }
  v10 = -[BWNodeOutput mediaConfigurationForAttachedMediaKey:](self->super._output, "mediaConfigurationForAttachedMediaKey:", a5);
  if (objc_msgSend(a5, "isEqualToString:", CFSTR("PrimaryFormat")))
  {
    -[BWNodeOutput setFormat:](self->super._output, "setFormat:", a3);
  }
  else if (!v10 || objc_msgSend(v10, "passthroughMode"))
  {
    v11.receiver = self;
    v11.super_class = (Class)BWStillImageFilterNode;
    -[BWNode didSelectFormat:forInput:forAttachedMediaKey:](&v11, sel_didSelectFormat_forInput_forAttachedMediaKey_, a3, a4, a5);
  }
}

- (id)_initWithNodeConfiguration:(id)a3 sensorConfigurationsByPortType:(id)a4 statusDelegate:(id)a5 depthDataDeliveryEnabled:(BOOL)a6 personSegmentationEnabled:(BOOL)a7 refinedDepthEnabled:(BOOL)a8 portraitRenderQuality:(int)a9 targetAspectRatio:(float)a10 defaultPortType:(id)a11 defaultZoomFactor:(float)a12 backPressureDrivenPipelining:(BOOL)a13 renderResourceProvider:(id)a14
{
  _BOOL4 v14;
  _BOOL4 v15;
  _BOOL4 v16;
  BWStillImageFilterNode *v22;
  MTLCommandQueue *v23;
  _BOOL4 v24;
  void *v25;
  BWNodeInput *v26;
  BWVideoFormatRequirements *v27;
  BWNodeInputMediaConfiguration *v28;
  BWNodeInputMediaConfiguration *v29;
  BWVideoFormatRequirements *v30;
  BWVideoFormatRequirements *v31;
  BWNodeInputMediaConfiguration *v32;
  BWVideoFormatRequirements *v33;
  BWNodeOutput *v34;
  BWNodeOutputMediaConfiguration *v35;
  BWNodeOutputMediaConfiguration *v36;
  BWVideoFormatRequirements *v37;
  objc_super v39;

  v14 = a8;
  v15 = a7;
  v16 = a6;
  v39.receiver = self;
  v39.super_class = (Class)BWStillImageFilterNode;
  v22 = -[BWNode init](&v39, sel_init);
  if (v22)
  {
    v22->_nodeConfiguration = (BWStillImageNodeConfiguration *)a3;
    v22->_sensorConfigurationsByPortType = (NSDictionary *)a4;
    v22->_statusDelegate = (BWStillImageFilterStatusDelegate *)a5;
    v22->_targetAspectRatio = a10;
    v22->_defaultPortType = (NSString *)a11;
    v22->_defaultZoomFactor = a12;
    v22->_backPressureDrivenPipelining = a13;
    v22->_depthDataDeliveryEnabled = v16;
    v22->_portraitRenderQuality = a9;
    if (a9 == 2
      && VTPixelTransferSessionCreate((CFAllocatorRef)*MEMORY[0x1E0C9AE00], &v22->_portraitDownsamplingTransferSession))
    {
      fig_log_get_emitter();
      FigDebugAssert3();

      return 0;
    }
    else
    {
      if (objc_msgSend(a3, "metalCommandQueue"))
        v23 = (MTLCommandQueue *)(id)objc_msgSend(a3, "metalCommandQueue");
      else
        v23 = (MTLCommandQueue *)objc_msgSend((id)objc_msgSend(MEMORY[0x1E0D08B28], "metalDevice"), "newCommandQueue");
      v24 = v15;
      v22->_mtlCommandQueue = v23;
      if (FigCapturePlatformSupportsUniversalCompression())
        v25 = FigCapturePixelFormatsByAddingCompressedVariants(&unk_1E4A00B90, objc_msgSend(a3, "maxLossyCompressionLevel"));
      else
        v25 = &unk_1E4A00B90;
      v26 = -[BWNodeInput initWithMediaType:node:]([BWNodeInput alloc], "initWithMediaType:node:", 1986618469, v22);
      v27 = objc_alloc_init(BWVideoFormatRequirements);
      -[BWVideoFormatRequirements setSupportedPixelFormats:](v27, "setSupportedPixelFormats:", v25);
      -[BWNodeInput setFormatRequirements:](v26, "setFormatRequirements:", v27);
      -[BWNodeInput setPassthroughMode:](v26, "setPassthroughMode:", 1);
      -[BWNodeInput setDelayedBufferCount:](v26, "setDelayedBufferCount:", 1);
      if (v16)
      {
        v28 = objc_alloc_init(BWNodeInputMediaConfiguration);
        -[BWNodeInputMediaConfiguration setFormatRequirements:](v28, "setFormatRequirements:", objc_alloc_init(BWVideoFormatRequirements));
        -[BWNodeInputMediaConfiguration setPassthroughMode:](v28, "setPassthroughMode:", 1);
        -[BWNodeInputMediaConfiguration setDelayedBufferCount:](v28, "setDelayedBufferCount:", 1);
        -[BWNodeInput setMediaConfiguration:forAttachedMediaKey:](v26, "setMediaConfiguration:forAttachedMediaKey:", v28, CFSTR("Depth"));
      }
      if (v15)
      {
        v29 = objc_alloc_init(BWNodeInputMediaConfiguration);
        v30 = objc_alloc_init(BWVideoFormatRequirements);
        -[BWVideoFormatRequirements setSupportedPixelFormats:](v30, "setSupportedPixelFormats:", &unk_1E4A00BA8);
        v31 = v30;
        v24 = v15;
        -[BWNodeInputMediaConfiguration setFormatRequirements:](v29, "setFormatRequirements:", v31);
        -[BWNodeInputMediaConfiguration setPassthroughMode:](v29, "setPassthroughMode:", 1);
        -[BWNodeInputMediaConfiguration setDelayedBufferCount:](v29, "setDelayedBufferCount:", 1);
        -[BWNodeInput setMediaConfiguration:forAttachedMediaKey:](v26, "setMediaConfiguration:forAttachedMediaKey:", v29, 0x1E495AF38);
      }
      if (v14)
      {
        v32 = objc_alloc_init(BWNodeInputMediaConfiguration);
        v33 = objc_alloc_init(BWVideoFormatRequirements);
        -[BWVideoFormatRequirements setSupportedPixelFormats:](v33, "setSupportedPixelFormats:", &unk_1E4A00BC0);
        -[BWNodeInputMediaConfiguration setFormatRequirements:](v32, "setFormatRequirements:", v33);
        -[BWNodeInputMediaConfiguration setPassthroughMode:](v32, "setPassthroughMode:", 0);
        -[BWNodeInputMediaConfiguration setDelayedBufferCount:](v32, "setDelayedBufferCount:", 1);
        -[BWNodeInput setMediaConfiguration:forAttachedMediaKey:](v26, "setMediaConfiguration:forAttachedMediaKey:", v32, 0x1E495AF58);
      }
      -[BWNode addInput:](v22, "addInput:", v26);

      v34 = -[BWNodeOutput initWithMediaType:node:]([BWNodeOutput alloc], "initWithMediaType:node:", 1986618469, v22);
      -[BWVideoFormatRequirements setSupportedPixelFormats:](objc_alloc_init(BWVideoFormatRequirements), "setSupportedPixelFormats:", v25);
      -[BWNodeOutput setPassthroughMode:](v34, "setPassthroughMode:", 1);
      if (v16)
      {
        v35 = objc_alloc_init(BWNodeOutputMediaConfiguration);
        -[BWNodeOutputMediaConfiguration setFormatRequirements:](v35, "setFormatRequirements:", objc_alloc_init(BWVideoFormatRequirements));
        -[BWNodeOutputMediaConfiguration setPassthroughMode:](v35, "setPassthroughMode:", 1);
        -[BWNodeOutput setMediaConfiguration:forAttachedMediaKey:](v34, "setMediaConfiguration:forAttachedMediaKey:", v35, CFSTR("Depth"));
      }
      if (v24)
      {
        v36 = objc_alloc_init(BWNodeOutputMediaConfiguration);
        v37 = objc_alloc_init(BWVideoFormatRequirements);
        -[BWVideoFormatRequirements setSupportedPixelFormats:](v37, "setSupportedPixelFormats:", &unk_1E4A00BD8);
        -[BWNodeOutputMediaConfiguration setFormatRequirements:](v36, "setFormatRequirements:", v37);
        -[BWNodeOutputMediaConfiguration setPassthroughMode:](v36, "setPassthroughMode:", 1);
        -[BWNodeOutput setMediaConfiguration:forAttachedMediaKey:](v34, "setMediaConfiguration:forAttachedMediaKey:", v36, 0x1E495AF38);
      }
      -[BWNode addOutput:](v22, "addOutput:", v34);

      v22->_rendererProvider = (BWRendererResourceProvider *)a14;
      v22->_colorLookupCache = objc_alloc_init(BWColorLookupCache);
      objc_msgSend(a3, "figThreadPriority");
      v22->_emitQueue = (OS_dispatch_queue *)FigDispatchQueueCreateWithPriority();
    }
  }
  return v22;
}

- (id)nodeType
{
  return CFSTR("Effect");
}

- (BWStillImageFilterNode)initWithNodeConfiguration:(id)a3 sensorConfigurationsByPortType:(id)a4 statusDelegate:(id)a5 depthDataDeliveryEnabled:(BOOL)a6 personSegmentationEnabled:(BOOL)a7 refinedDepthEnabled:(BOOL)a8 portraitRenderQuality:(int)a9 targetAspectRatio:(float)a10 defaultPortType:(id)a11 defaultZoomFactor:(float)a12 backPressureDrivenPipelining:(BOOL)a13
{
  uint64_t v14;
  uint64_t v15;

  LOBYTE(v15) = a13;
  LODWORD(v14) = a9;
  return (BWStillImageFilterNode *)-[BWStillImageFilterNode _initWithNodeConfiguration:sensorConfigurationsByPortType:statusDelegate:depthDataDeliveryEnabled:personSegmentationEnabled:refinedDepthEnabled:portraitRenderQuality:targetAspectRatio:defaultPortType:defaultZoomFactor:backPressureDrivenPipelining:renderResourceProvider:](self, "_initWithNodeConfiguration:sensorConfigurationsByPortType:statusDelegate:depthDataDeliveryEnabled:personSegmentationEnabled:refinedDepthEnabled:portraitRenderQuality:targetAspectRatio:defaultPortType:defaultZoomFactor:backPressureDrivenPipelining:renderResourceProvider:", a3, a4, a5, a6, a7, a8, v14, a11, v15, self);
}

+ (void)initialize
{
  objc_opt_class();
}

- (void)dealloc
{
  Class v3;
  __CVBuffer *faceAdjustedBlurMapFromStandardResolutionImage;
  opaqueCMSampleBuffer *blurredGainMapSbuf;
  CGImageMetadata *portraitStillImageAuxDepthMetadata;
  opaqueCMSampleBuffer *unstyledFullResolutionSbuf;
  opaqueCMSampleBuffer *styledFullResolutionSbuf;
  opaqueCMSampleBuffer *learnedCoefficientsSbuf;
  OpaqueVTPixelTransferSession *portraitDownsamplingTransferSession;
  objc_super v11;

  if (self)
  {
    if (-[BWStillImageNodeConfiguration deferredPhotoProcessorEnabled](self->_nodeConfiguration, "deferredPhotoProcessorEnabled"))
    {
      v3 = NSClassFromString(CFSTR("EspressoWrapper"));
      -[objc_class performSelector:](v3, "performSelector:", NSSelectorFromString(CFSTR("clearCache")));
    }

    self->_mtlCommandQueue = 0;
  }

  self->_rendererProvider = 0;
  faceAdjustedBlurMapFromStandardResolutionImage = self->_faceAdjustedBlurMapFromStandardResolutionImage;
  if (faceAdjustedBlurMapFromStandardResolutionImage)
    CFRelease(faceAdjustedBlurMapFromStandardResolutionImage);
  blurredGainMapSbuf = self->_blurredGainMapSbuf;
  if (blurredGainMapSbuf)
    CFRelease(blurredGainMapSbuf);

  portraitStillImageAuxDepthMetadata = self->_portraitStillImageAuxDepthMetadata;
  if (portraitStillImageAuxDepthMetadata)
    CFRelease(portraitStillImageAuxDepthMetadata);

  unstyledFullResolutionSbuf = self->_unstyledFullResolutionSbuf;
  if (unstyledFullResolutionSbuf)
    CFRelease(unstyledFullResolutionSbuf);
  styledFullResolutionSbuf = self->_styledFullResolutionSbuf;
  if (styledFullResolutionSbuf)
    CFRelease(styledFullResolutionSbuf);
  learnedCoefficientsSbuf = self->_learnedCoefficientsSbuf;
  if (learnedCoefficientsSbuf)
    CFRelease(learnedCoefficientsSbuf);

  portraitDownsamplingTransferSession = self->_portraitDownsamplingTransferSession;
  if (portraitDownsamplingTransferSession)
    CFRelease(portraitDownsamplingTransferSession);
  v11.receiver = self;
  v11.super_class = (Class)BWStillImageFilterNode;
  -[BWNode dealloc](&v11, sel_dealloc);
}

- (id)nodeSubType
{
  return CFSTR("StillImageFilter");
}

- (void)prepareForCurrentConfigurationToBecomeLive
{
  NSArray *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  BWNodeInput *v8;
  BOOL v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  objc_super v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v14.receiver = self;
  v14.super_class = (Class)BWStillImageFilterNode;
  -[BWNode prepareForCurrentConfigurationToBecomeLive](&v14, sel_prepareForCurrentConfigurationToBecomeLive);
  v12 = 0u;
  v13 = 0u;
  v10 = 0u;
  v11 = 0u;
  v3 = -[BWNode inputs](self, "inputs", 0);
  v4 = -[NSArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v10, v15, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v11;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v11 != v6)
          objc_enumerationMutation(v3);
        v8 = *(BWNodeInput **)(*((_QWORD *)&v10 + 1) + 8 * i);
        if (v8 != self->super._input)
          -[BWFormat isEqual:](-[BWNodeInput format](v8, "format"), "isEqual:", -[BWNodeInput format](self->super._input, "format"));
      }
      v5 = -[NSArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v10, v15, 16);
    }
    while (v5);
  }
  else if (!self)
  {
LABEL_14:
    -[BWStillImageFilterNode _ensureResources]((uint64_t)self);
    return;
  }
  v9 = BWDeviceSupportsDeferredPhotoProcessorPrewarming();
  if (!-[BWStillImageNodeConfiguration deferredPhotoProcessorEnabled](self->_nodeConfiguration, "deferredPhotoProcessorEnabled")|| !v9)
  {
    goto LABEL_14;
  }
}

- (uint64_t)_ensureResources
{
  uint64_t v2;
  BWRenderListProcessor *v3;
  uint64_t v4;
  uint64_t v5;
  double v6;
  id v7;
  uint64_t v8;
  int v9;
  void *v10;

  if (!a1)
    return 0;
  v2 = -[BWStillImageFilterNode _ensureOutputBufferPool](a1);
  if ((_DWORD)v2)
  {
    v4 = v2;
    fig_log_get_emitter();
    FigDebugAssert3();
    return v4;
  }
  if (!*(_QWORD *)(a1 + 152))
  {
    v3 = -[BWRenderListProcessor initWithRenderingPool:]([BWRenderListProcessor alloc], "initWithRenderingPool:", *(_QWORD *)(a1 + 392));
    *(_QWORD *)(a1 + 152) = v3;
    if (!v3)
      return 4294954510;
  }
  if (!*(_BYTE *)(a1 + 368) || *(_BYTE *)(a1 + 424))
    return 0;
  v5 = objc_msgSend((id)objc_msgSend(*(id *)(a1 + 104), "objectForKeyedSubscript:", *(_QWORD *)(a1 + 128)), "sensorIDDictionary");

  LODWORD(v6) = *(_DWORD *)(a1 + 136);
  v7 = +[FigCaptureCameraParameters sdofTuningParametersForSensorIDDictionary:zoomFactor:](FigCaptureCameraParameters, "sdofTuningParametersForSensorIDDictionary:zoomFactor:", v5, v6);
  *(_QWORD *)(a1 + 328) = v7;
  if (!v7)
    return 4294954513;
  *(_QWORD *)(a1 + 312) = *(id *)(a1 + 128);
  *(_DWORD *)(a1 + 320) = *(_DWORD *)(a1 + 136);
  v8 = objc_msgSend((id)objc_msgSend(*(id *)(a1 + 328), "objectForKeyedSubscript:", CFSTR("Version")), "intValue");
  *(_BYTE *)(a1 + 200) = objc_msgSend(*(id *)(a1 + 328), "objectForKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("HairNetV%d"), v8)) != 0;
  v9 = objc_msgSend(*(id *)(a1 + 96), "deferredPhotoProcessorEnabled");
  v10 = *(void **)(a1 + 160);
  if (v9)
  {
    objc_msgSend(v10, "provideStillImageCoreImageBlurMapRenderer");
    objc_msgSend(*(id *)(a1 + 208), "setRenderBlurMapToCVPixelBuffer:", objc_msgSend(*(id *)(a1 + 96), "optimizedEnhancedResolutionDepthPipelineEnabled"));
    objc_msgSend(*(id *)(a1 + 208), "prepareForRenderingWithParameters:inputVideoFormat:inputMediaPropertiesByAttachedMediaKey:", 0, *(_QWORD *)(a1 + 400), 0);
  }
  else
  {
    objc_msgSend(v10, "provideStillImageMetalSDOFRenderer");
    objc_msgSend(*(id *)(a1 + 160), "provideStillImageMetalBlurMapRenderer");
  }
  v4 = 0;
  *(_BYTE *)(a1 + 424) = 1;
  return v4;
}

- (uint64_t)_ensureOutputBufferPool
{
  uint64_t v1;
  BWVideoFormatRequirements *v2;
  BWVideoFormatRequirements *v3;
  int64_t v4;
  id v5;
  int v6;
  void *v7;
  uint64_t v8;
  int v9;
  int v10;
  BWVideoFormatRequirements *v11;
  uint64_t v12;
  BWVideoFormatRequirements *v13;
  uint64_t v14;
  uint64_t v15;
  BWPixelBufferPool *v16;
  uint64_t v17;
  BWVideoFormatRequirements *v18;
  uint64_t v19;
  uint64_t v20;
  BWVideoFormatRequirements *v21;
  uint64_t v22;
  _QWORD v23[2];

  v23[1] = *MEMORY[0x1E0C80C00];
  if (!result)
    return result;
  v1 = result;
  if (*(_QWORD *)(result + 392))
    return 0;
  v2 = -[BWVideoFormatRequirements initWithPixelBufferAttributes:]([BWVideoFormatRequirements alloc], "initWithPixelBufferAttributes:", objc_msgSend((id)objc_msgSend(*(id *)(result + 8), "videoFormat"), "pixelBufferAttributes"));
  v3 = v2;
  if (*(float *)(v1 + 120) != 0.0)
  {
    v4 = FigCaptureMetadataUtilitiesEnforceAspectRatioWithStillImageDimensions(-[BWVideoFormatRequirements width](v2, "width") | ((unint64_t)-[BWVideoFormatRequirements height](v2, "height") << 32), *(float *)(v1 + 120));
    -[BWVideoFormatRequirements setWidth:](v3, "setWidth:", (int)v4);
    -[BWVideoFormatRequirements setHeight:](v3, "setHeight:", v4 >> 32);
  }
  v23[0] = v3;
  v5 = +[BWVideoFormat formatByResolvingRequirements:](BWVideoFormat, "formatByResolvingRequirements:", objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v23, 1));
  if (*(_DWORD *)(v1 + 380) != 2)
  {
    v6 = objc_msgSend(*(id *)(v1 + 96), "optimizedEnhancedResolutionDepthPipelineEnabled");
    v7 = *(void **)(v1 + 96);
    if (v6)
    {
      *(_DWORD *)(v1 + 344) = objc_msgSend(v7, "deepFusionEnhancedResolutionDimensions");
      v8 = objc_msgSend(*(id *)(v1 + 96), "deepFusionEnhancedResolutionDimensions");
    }
    else
    {
      if (!FigCaptureVideoDimensionsAreValid(objc_msgSend(v7, "downgradedDeepFusionEnhancedResolutionDimensions")))
      {
        *(_DWORD *)(v1 + 344) = objc_msgSend(v5, "width");
        *(_DWORD *)(v1 + 348) = objc_msgSend(v5, "height");
        goto LABEL_7;
      }
      *(_DWORD *)(v1 + 344) = objc_msgSend(*(id *)(v1 + 96), "downgradedDeepFusionEnhancedResolutionDimensions");
      v8 = objc_msgSend(*(id *)(v1 + 96), "downgradedDeepFusionEnhancedResolutionDimensions");
    }
    *(_DWORD *)(v1 + 348) = HIDWORD(v8);
    v9 = objc_msgSend(v5, "width");
    v10 = objc_msgSend(v5, "height");
    *(_DWORD *)(v1 + 352) = v9;
    *(_DWORD *)(v1 + 356) = v10;
    goto LABEL_13;
  }
  *(_DWORD *)(v1 + 344) = 2016;
  *(_DWORD *)(v1 + 348) = 1512;
LABEL_7:
  *(_QWORD *)(v1 + 352) = *(_QWORD *)(v1 + 344);
LABEL_13:
  *(_DWORD *)(v1 + 360) = *(_DWORD *)(v1 + 352) / 2;
  *(_DWORD *)(v1 + 364) = *(_DWORD *)(v1 + 356) / 2;
  v11 = objc_alloc_init(BWVideoFormatRequirements);
  -[BWVideoFormatRequirements setWidth:](v11, "setWidth:", *(int *)(v1 + 352));
  -[BWVideoFormatRequirements setHeight:](v11, "setHeight:", *(int *)(v1 + 356));
  -[BWVideoFormatRequirements setSupportedPixelFormats:](v11, "setSupportedPixelFormats:", &unk_1E4A00BF0);
  -[BWVideoFormatRequirements setBytesPerRowAlignment:](v11, "setBytesPerRowAlignment:", 64);
  -[BWVideoFormatRequirements setPlaneAlignment:](v11, "setPlaneAlignment:", 64);
  -[BWVideoFormatRequirements setSupportedCacheModes:](v11, "setSupportedCacheModes:", +[BWVideoFormatRequirements cacheModesForOptimizedHWAccess](BWVideoFormatRequirements, "cacheModesForOptimizedHWAccess"));
  if (objc_msgSend(v5, "colorSpaceProperties"))
  {
    v22 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", objc_msgSend(v5, "colorSpaceProperties"));
    v12 = objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v22, 1);
  }
  else
  {
    v12 = 0;
  }
  -[BWVideoFormatRequirements setSupportedColorSpaceProperties:](v11, "setSupportedColorSpaceProperties:", v12);

  v21 = v11;
  *(_QWORD *)(v1 + 400) = +[BWVideoFormat formatByResolvingRequirements:](BWVideoFormat, "formatByResolvingRequirements:", objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v21, 1));

  v13 = objc_alloc_init(BWVideoFormatRequirements);
  -[BWVideoFormatRequirements setWidth:](v13, "setWidth:", *(int *)(v1 + 344));
  -[BWVideoFormatRequirements setHeight:](v13, "setHeight:", *(int *)(v1 + 348));
  v20 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", objc_msgSend(v5, "pixelFormat"));
  -[BWVideoFormatRequirements setSupportedPixelFormats:](v13, "setSupportedPixelFormats:", objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v20, 1));
  -[BWVideoFormatRequirements setBytesPerRowAlignment:](v13, "setBytesPerRowAlignment:", 64);
  -[BWVideoFormatRequirements setPlaneAlignment:](v13, "setPlaneAlignment:", 64);
  -[BWVideoFormatRequirements setSupportedCacheModes:](v13, "setSupportedCacheModes:", +[BWVideoFormatRequirements cacheModesForOptimizedHWAccess](BWVideoFormatRequirements, "cacheModesForOptimizedHWAccess"));
  if (objc_msgSend(v5, "colorSpaceProperties"))
  {
    v19 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", objc_msgSend(v5, "colorSpaceProperties"));
    v14 = objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v19, 1);
  }
  else
  {
    v14 = 0;
  }
  -[BWVideoFormatRequirements setSupportedColorSpaceProperties:](v13, "setSupportedColorSpaceProperties:", v14);

  v18 = v13;
  v15 = 1;
  *(_QWORD *)(v1 + 336) = +[BWVideoFormat formatByResolvingRequirements:](BWVideoFormat, "formatByResolvingRequirements:", objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v18, 1));

  if (!*(_BYTE *)(v1 + 140))
    v15 = objc_msgSend(*(id *)(v1 + 96), "deferredPhotoProcessorEnabled");
  LOBYTE(v17) = v15;
  v16 = -[BWPixelBufferPool initWithVideoFormat:capacity:name:clientProvidesPool:memoryPool:providesBackPressure:reportSlowBackPressureAllocations:]([BWPixelBufferPool alloc], "initWithVideoFormat:capacity:name:clientProvidesPool:memoryPool:providesBackPressure:reportSlowBackPressureAllocations:", *(_QWORD *)(v1 + 336), 2, CFSTR("Still Image Filter Processing Pool"), 0, objc_msgSend(*(id *)(v1 + 16), "memoryPool"), v15, v17);
  result = 0;
  *(_QWORD *)(v1 + 392) = v16;
  if (!v16)
  {
    fig_log_get_emitter();
    FigDebugAssert3();
    return FigSignalErrorAt();
  }
  return result;
}

- (void)handleStillImagePrewarmWithSettings:(id)a3 forInput:(id)a4
{
  _BOOL4 v6;
  BOOL v7;
  NSObject *emitQueue;
  _QWORD v9[6];

  if (self)
  {
    v6 = BWDeviceSupportsDeferredPhotoProcessorPrewarming();
    if (-[BWStillImageNodeConfiguration deferredPhotoProcessorEnabled](self->_nodeConfiguration, "deferredPhotoProcessorEnabled"))
    {
      v7 = !v6;
    }
    else
    {
      v7 = 1;
    }
    if (!v7)
      -[BWStillImageFilterNode _ensureResources]((uint64_t)self);
    if (-[BWStillImageNodeConfiguration deferredPhotoProcessorEnabled](self->_nodeConfiguration, "deferredPhotoProcessorEnabled"))
    {
      BWLoadProcessorBundle((uint64_t)CFSTR("CCPortrait"), 0xFFFFFFFFLL);
    }
  }
  -[BWRenderListProcessor waitForAllProcessingToComplete](self->_renderListProcessor, "waitForAllProcessingToComplete", a3, a4);
  emitQueue = self->_emitQueue;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __71__BWStillImageFilterNode_handleStillImagePrewarmWithSettings_forInput___block_invoke;
  v9[3] = &unk_1E491E748;
  v9[4] = self;
  v9[5] = a3;
  dispatch_async(emitQueue, v9);
}

uint64_t __71__BWStillImageFilterNode_handleStillImagePrewarmWithSettings_forInput___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "emitStillImagePrewarmMessageWithSettings:", *(_QWORD *)(a1 + 40));
}

- (void)renderSampleBuffer:(opaqueCMSampleBuffer *)a3 forInput:(id)a4
{
  BWStillImageFilterNode *v4;
  _BOOL4 v6;
  const __CFString *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  int v16;
  uint64_t v17;
  uint64_t i;
  char v19;
  int v20;
  int v21;
  _BOOL4 v22;
  _BOOL4 v23;
  opaqueCMSampleBuffer *v24;
  opaqueCMSampleBuffer *styledFullResolutionSbuf;
  opaqueCMSampleBuffer *unstyledFullResolutionSbuf;
  opaqueCMSampleBuffer *v27;
  opaqueCMSampleBuffer *learnedCoefficientsSbuf;
  opaqueCMSampleBuffer *AttachedMedia;
  opaqueCMSampleBuffer *v30;
  opaqueCMSampleBuffer *v31;
  const __CFString *v32;
  void *v33;
  float v34;
  void *v35;
  uint64_t v36;
  void *v37;
  uint64_t v38;
  _BOOL4 v39;
  opaqueCMSampleBuffer *v40;
  BWStillImageCoreImageBlurMapRenderer *coreImageBlurMapRenderer;
  CVImageBufferRef v42;
  int v43;
  int v44;
  void *v45;
  BWStillImageFilterNode *v46;
  NSDictionary *attachedMediaFromStandardResolutionImage;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t j;
  void *v52;
  __CVBuffer *faceAdjustedBlurMapFromStandardResolutionImage;
  CGImageMetadata *portraitStillImageAuxDepthMetadata;
  unint64_t v55;
  int v56;
  _BOOL4 v57;
  int v58;
  uint64_t v59;
  BOOL v60;
  int v61;
  NSObject *v62;
  NSError *blurMapRenderErrorFromStandardResolutionImage;
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  opaqueCMSampleBuffer *v65;
  unint64_t v66;
  opaqueCMSampleBuffer *v67;
  void *v68;
  char v69;
  opaqueCMSampleBuffer *v70;
  opaqueCMSampleBuffer *v71;
  opaqueCMSampleBuffer *v72;
  __CVBuffer *v73;
  opaqueCMSampleBuffer *v74;
  int height;
  size_t v76;
  float v77;
  void *v78;
  int v79;
  double v80;
  uint64_t v81;
  int v82;
  CVImageBufferRef ImageBuffer;
  CVImageBufferRef v84;
  BWRenderListProcessor *renderListProcessor;
  BWRenderList *renderList;
  int v87;
  opaqueCMSampleBuffer *v88;
  opaqueCMSampleBuffer *v89;
  opaqueCMSampleBuffer *v90;
  uint64_t v91;
  uint64_t v92;
  opaqueCMSampleBuffer *v93;
  const __CFString *key;
  void *v95;
  void *v96;
  void *v97;
  void *v98;
  void *v99;
  void *v100;
  opaqueCMSampleBuffer *target;
  opaqueCMSampleBuffer *cf;
  opaqueCMSampleBuffer *v103;
  char v104;
  void *v105;
  opaqueCMSampleBuffer *v106;
  _QWORD v107[9];
  int v108;
  char v109;
  char v110;
  char v111;
  char v112;
  os_log_type_t type;
  int v114;
  __int128 v115;
  __int128 v116;
  __int128 v117;
  __int128 v118;
  _QWORD v119[6];
  __int128 v120;
  __int128 v121;
  __int128 v122;
  __int128 v123;
  CMAttachmentBearerRef v124;
  _BYTE v125[128];
  _BYTE v126[128];
  uint64_t v127;

  v4 = self;
  v127 = *MEMORY[0x1E0C80C00];
  v124 = 0;
  if (!a3)
  {
    v97 = 0;
    v45 = 0;
    v87 = 2;
    v44 = -12780;
    goto LABEL_133;
  }
  if (self)
  {
    v6 = BWDeviceSupportsDeferredPhotoProcessorPrewarming();
    if (-[BWStillImageNodeConfiguration deferredPhotoProcessorEnabled](v4->_nodeConfiguration, "deferredPhotoProcessorEnabled")&& v6)
    {
      -[BWStillImageFilterNode _ensureResources]((uint64_t)v4);
    }
  }
  -[BWRenderListProcessor waitForAllProcessingToComplete](v4->_renderListProcessor, "waitForAllProcessingToComplete");
  v8 = (const __CFString *)*MEMORY[0x1E0D05CB0];
  v97 = (void *)CMGetAttachment(a3, (CFStringRef)*MEMORY[0x1E0D05CB0], 0);
  if (!v97 || (v9 = (void *)CMGetAttachment(a3, CFSTR("StillSettings"), 0)) == 0)
  {
    v45 = 0;
    v43 = 0;
    v44 = -12780;
    goto LABEL_125;
  }
  v10 = v9;
  key = v8;
  target = a3;
  v96 = (void *)objc_msgSend(v9, "captureSettings");
  v11 = (void *)objc_msgSend(v10, "requestedSettings");
  v98 = v10;
  v12 = (void *)objc_msgSend((id)objc_msgSend(v10, "processingSettings"), "photoManifest");
  v95 = (void *)objc_msgSend(v11, "originalImageFilters");
  v105 = v11;
  v99 = (void *)objc_msgSend(v11, "processedImageFilters");
  v120 = 0u;
  v121 = 0u;
  v122 = 0u;
  v123 = 0u;
  v13 = (void *)objc_msgSend(v12, "photoDescriptors");
  v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v120, v126, 16);
  if (v14)
  {
    v15 = v14;
    LODWORD(v8) = 0;
    v16 = 0;
    v17 = *(_QWORD *)v121;
    do
    {
      for (i = 0; i != v15; ++i)
      {
        if (*(_QWORD *)v121 != v17)
          objc_enumerationMutation(v13);
        v19 = objc_msgSend(*(id *)(*((_QWORD *)&v120 + 1) + 8 * i), "processingFlags");
        LODWORD(v8) = v8 | ((v19 & 4) >> 2);
        v16 |= (v19 & 8) >> 3;
      }
      v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v120, v126, 16);
    }
    while (v15);
  }
  else
  {
    LODWORD(v8) = 0;
    v16 = 0;
  }
  v20 = objc_msgSend((id)CMGetAttachment(target, CFSTR("StillImageBufferFrameType"), 0), "unsignedIntValue");
  v21 = BWStillImageProcessingFlagsForSampleBuffer(target) & 0x200040;
  v22 = -[BWStillImageNodeConfiguration optimizedEnhancedResolutionDepthPipelineEnabled](v4->_nodeConfiguration, "optimizedEnhancedResolutionDepthPipelineEnabled");
  v23 = v20 == 13;
  if (v22 && v23)
    v24 = target;
  else
    v24 = 0;
  if (v22 && v23)
    styledFullResolutionSbuf = 0;
  else
    styledFullResolutionSbuf = target;
  if (v20 == 40)
  {
    -[BWStillImageNodeConfiguration deferredPhotoProcessorEnabled](v4->_nodeConfiguration, "deferredPhotoProcessorEnabled");
    unstyledFullResolutionSbuf = v4->_unstyledFullResolutionSbuf;
    v4->_unstyledFullResolutionSbuf = target;
    CFRetain(target);
    if (unstyledFullResolutionSbuf)
      CFRelease(unstyledFullResolutionSbuf);
    v27 = v4->_unstyledFullResolutionSbuf;
    styledFullResolutionSbuf = v4->_styledFullResolutionSbuf;
  }
  else
  {
    v27 = styledFullResolutionSbuf;
  }
  if (v21 == 0x200000)
  {
    -[BWStillImageNodeConfiguration deferredPhotoProcessorEnabled](v4->_nodeConfiguration, "deferredPhotoProcessorEnabled");
    learnedCoefficientsSbuf = v4->_learnedCoefficientsSbuf;
    AttachedMedia = (opaqueCMSampleBuffer *)BWSampleBufferGetAttachedMedia(target, 0x1E495B2B8);
    v4->_learnedCoefficientsSbuf = AttachedMedia;
    if (AttachedMedia)
      CFRetain(AttachedMedia);
    if (learnedCoefficientsSbuf)
      CFRelease(learnedCoefficientsSbuf);
    v30 = v4->_styledFullResolutionSbuf;
    v4->_styledFullResolutionSbuf = target;
    CFRetain(target);
    if (v30)
      CFRelease(v30);
    styledFullResolutionSbuf = v4->_styledFullResolutionSbuf;
    v27 = v4->_unstyledFullResolutionSbuf;
  }
  cf = styledFullResolutionSbuf;
  v103 = v24;
  if (v24)
    v31 = v24;
  else
    v31 = v27;
  v32 = (const __CFString *)*MEMORY[0x1E0D086F0];
  v100 = (void *)CMGetAttachment(v31, (CFStringRef)*MEMORY[0x1E0D086F0], 0);
  if (v100)
  {
    objc_opt_class();
    v33 = v100;
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v33 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithDictionary:", v100);
      CMSetAttachment(v31, v32, v33, 1u);

    }
    objc_msgSend(v105, "simulatedAperture");
    if (v34 > 0.0)
    {
      v35 = (void *)MEMORY[0x1E0CB37E8];
      objc_msgSend(v105, "simulatedAperture");
      v36 = objc_msgSend(v35, "numberWithFloat:");
      objc_msgSend(v33, "setObject:forKeyedSubscript:", v36, *MEMORY[0x1E0D08360]);
    }
    objc_msgSend(v105, "portraitLightingEffectStrength");
    v37 = (void *)MEMORY[0x1E0CB37E8];
    objc_msgSend(v105, "portraitLightingEffectStrength");
    v38 = objc_msgSend(v37, "numberWithFloat:");
    objc_msgSend(v33, "setObject:forKeyedSubscript:", v38, *MEMORY[0x1E0D08668]);
  }
  v39 = -[BWStillImageNodeConfiguration optimizedEnhancedResolutionDepthPipelineEnabled](v4->_nodeConfiguration, "optimizedEnhancedResolutionDepthPipelineEnabled");
  v40 = cf;
  v106 = v27;
  if (!v39)
  {
LABEL_73:
    v43 = 0;
    if (!v40 || ((v27 == 0) & v16) != 0)
    {
      v44 = 0;
      goto LABEL_51;
    }
    if (objc_msgSend(v96, "captureType") == 3)
    {
      LOBYTE(v55) = 1;
    }
    else
    {
      if (objc_msgSend(v96, "captureType") != 10)
      {
        v104 = 0;
LABEL_81:
        v56 = BWCIFilterArrayContainsPortraitFilters(v99);
        v57 = BWCIFilterArrayOnlyContainsPortraitFilters(v99);
        v58 = objc_msgSend((id)objc_msgSend(v100, "objectForKeyedSubscript:", *MEMORY[0x1E0D08470]), "intValue");
        v59 = BWSampleBufferGetAttachedMedia(v31, (uint64_t)CFSTR("Depth"));
        if (v56)
        {
          if (v59)
            v60 = v58 == 1;
          else
            v60 = 0;
          v61 = v60;
        }
        else
        {
          v61 = 0;
        }
        if ((v16 & v57) != 1 || (v61 & 1) != 0)
        {
          blurMapRenderErrorFromStandardResolutionImage = v4->_blurMapRenderErrorFromStandardResolutionImage;
          if (blurMapRenderErrorFromStandardResolutionImage)
          {
            v43 = -[NSError code](blurMapRenderErrorFromStandardResolutionImage, "code");
            v114 = 0;
            type = OS_LOG_TYPE_DEFAULT;
            os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
            os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
            v27 = v106;
            fig_log_call_emit_and_clean_up_after_send_and_compose();

            v16 = 0;
            v4->_blurMapRenderErrorFromStandardResolutionImage = 0;
          }
          else
          {
            v43 = 0;
          }
          v65 = target;
        }
        else
        {
          v114 = 0;
          type = OS_LOG_TYPE_DEFAULT;
          v62 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
          os_log_type_enabled(v62, OS_LOG_TYPE_DEFAULT);
          v65 = target;
          v27 = v106;
          fig_log_call_emit_and_clean_up_after_send_and_compose();
          v16 = 0;
          v43 = -16809;
        }
        if (((v8 | v16) & 1) == 0)
        {
          v70 = v4->_unstyledFullResolutionSbuf;
          if (v70)
          {
            CFRelease(v70);
            v4->_unstyledFullResolutionSbuf = 0;
          }
          v71 = v4->_learnedCoefficientsSbuf;
          v45 = v98;
          if (v71)
          {
            CFRelease(v71);
            v4->_learnedCoefficientsSbuf = 0;
          }
          v72 = v4->_styledFullResolutionSbuf;
          if (v72)
          {
            CFRelease(v72);
            v4->_styledFullResolutionSbuf = 0;
          }
          -[BWStillImageFilterNode _emitSampleBufferAsync:]((uint64_t)v4, v65);
          LOBYTE(v8) = 0;
          goto LABEL_124;
        }
        v66 = BWPixelBufferDimensionsFromSampleBuffer(v65);
        -[BWStillImageFilterNode _prepareStillImageFilterRenderersForOriginalFilters:processedFilters:metadata:settings:inputDimensions:]((uint64_t)v4, v95, v99, v97, v98, v66);
        if ((v8 & 1) != 0)
        {
          v67 = cf;
          v68 = (void *)CFRetain(cf);
          v124 = v68;
          v69 = v104;
LABEL_119:
          if (!v68)
            goto LABEL_50;
          ImageBuffer = CMSampleBufferGetImageBuffer((CMSampleBufferRef)v68);
          if (ImageBuffer)
          {
            v84 = ImageBuffer;
            BWSampleBufferSetAttachedMedia(v124, 0x1E495B2B8, (uint64_t)v4->_learnedCoefficientsSbuf);
            CFRetain(v67);
            if (v106)
              CFRetain(v106);
            renderListProcessor = v4->_renderListProcessor;
            renderList = v4->_renderList;
            v107[0] = MEMORY[0x1E0C809B0];
            v107[1] = 3221225472;
            v107[2] = __54__BWStillImageFilterNode_renderSampleBuffer_forInput___block_invoke_58;
            v107[3] = &unk_1E4922A78;
            v109 = v8 & 1;
            v110 = v16 & 1;
            v111 = v61;
            v112 = v69;
            v45 = v98;
            v107[4] = v98;
            v107[5] = v4;
            v107[6] = v99;
            v107[7] = v67;
            v108 = v43;
            v107[8] = v106;
            -[BWRenderListProcessor processRenderList:inputPixelBuffer:inputSampleBuffer:resultHandler:](renderListProcessor, "processRenderList:inputPixelBuffer:inputSampleBuffer:resultHandler:", renderList, v84, v124, v107, v91, v92);
LABEL_124:
            v44 = 0;
            goto LABEL_125;
          }
          fig_log_get_emitter();
          FigDebugAssert3();
LABEL_146:
          v44 = -12780;
          goto LABEL_51;
        }
        v67 = cf;
        v69 = v104;
        if (v27)
        {
          if (v4->_portraitRenderQuality == 2)
          {
            v73 = CMSampleBufferGetImageBuffer(v27);
            if (!v73)
            {
              fig_log_get_emitter();
              FigDebugAssert3();
              LOBYTE(v8) = 0;
              goto LABEL_146;
            }
            v74 = v27;
            height = v4->_outputDimensions.height;
            v76 = CVPixelBufferGetHeight(v73);
            -[BWStillImageFilterNode _downsampleImageForSampleBuffer:outputSampleBuffer:dimensions:]((uint64_t)v4, v74, &v124, *(_QWORD *)&v4->_outputDimensions);
            if (!v124)
            {
              fig_log_get_emitter();
              FigDebugAssert3();
              LOBYTE(v8) = 0;
              goto LABEL_50;
            }
            v77 = (float)height / (float)v76;
            v78 = (void *)objc_msgSend(v97, "mutableCopy");
            v79 = 1;
            CMSetAttachment(v124, key, v78, 1u);
            *(float *)&v80 = v77;
            v81 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v80);
            objc_msgSend(v78, "setObject:forKeyedSubscript:", v81, *MEMORY[0x1E0D05FB0]);

            v69 = v104;
            goto LABEL_113;
          }
          BWCMSampleBufferCreateCopyIncludingMetadata(v27, (CMSampleBufferRef *)&v124);
        }
        v79 = 0;
LABEL_113:
        if (v61 && (v69 & 1) == 0)
          CMSetAttachment(cf, CFSTR("SDOFCustomRendered"), (CFTypeRef)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithShort:", 9), 1u);
        -[BWStillImageFilterNode _emitSampleBufferAsync:]((uint64_t)v4, cf);
        if (v79)
        {
          v82 = -[BWStillImageFilterNode _downsampleAttachedMediaForSampleBuffer:]((uint64_t)v4, v124);
          if (v82)
          {
            v44 = v82;
            fig_log_get_emitter();
            FigDebugAssert3();
            LOBYTE(v8) = 0;
            goto LABEL_51;
          }
        }
        v68 = (void *)v124;
        goto LABEL_119;
      }
      v55 = ((unint64_t)objc_msgSend(v96, "captureFlags") >> 20) & 1;
    }
    v104 = v55;
    goto LABEL_81;
  }
  if (!v103)
  {
    if (v27 && cf)
    {
      v93 = v31;
      v118 = 0u;
      v116 = 0u;
      v117 = 0u;
      v115 = 0u;
      v46 = v4;
      attachedMediaFromStandardResolutionImage = v4->_attachedMediaFromStandardResolutionImage;
      v48 = -[NSDictionary countByEnumeratingWithState:objects:count:](attachedMediaFromStandardResolutionImage, "countByEnumeratingWithState:objects:count:", &v115, v125, 16);
      if (v48)
      {
        v49 = v48;
        v50 = *(_QWORD *)v116;
        do
        {
          for (j = 0; j != v49; ++j)
          {
            if (*(_QWORD *)v116 != v50)
              objc_enumerationMutation(attachedMediaFromStandardResolutionImage);
            v52 = *(void **)(*((_QWORD *)&v115 + 1) + 8 * j);
            if ((objc_msgSend(v52, "isEqualToString:", 0x1E495B118) & 1) == 0)
            {
              BWSampleBufferSetAttachedMedia(cf, (uint64_t)v52, (uint64_t)-[NSDictionary objectForKeyedSubscript:](v46->_attachedMediaFromStandardResolutionImage, "objectForKeyedSubscript:", v52));
              v27 = v106;
              if (cf != v106)
                BWSampleBufferSetAttachedMedia(v106, (uint64_t)v52, (uint64_t)-[NSDictionary objectForKeyedSubscript:](v46->_attachedMediaFromStandardResolutionImage, "objectForKeyedSubscript:", v52));
            }
          }
          v49 = -[NSDictionary countByEnumeratingWithState:objects:count:](attachedMediaFromStandardResolutionImage, "countByEnumeratingWithState:objects:count:", &v115, v125, 16);
        }
        while (v49);
      }
      v4 = v46;
      sifn_mergeInferenceResults(cf, v46->_inferenceResultsFromStandardResolutionImage);
      if (cf != v27)
        sifn_mergeInferenceResults(v27, v46->_inferenceResultsFromStandardResolutionImage);
      CMSetAttachment(cf, CFSTR("PortraitStillImageAuxDepthMetadata"), v46->_portraitStillImageAuxDepthMetadata, 1u);
      CMSetAttachment(cf, CFSTR("PortraitStillImageFaceAdjustedBlurMap"), v46->_faceAdjustedBlurMapFromStandardResolutionImage, 1u);
      v27 = v106;
      v31 = v93;
      if (cf != v106)
      {
        CMSetAttachment(v106, CFSTR("PortraitStillImageAuxDepthMetadata"), v4->_portraitStillImageAuxDepthMetadata, 1u);
        CMSetAttachment(v106, CFSTR("PortraitStillImageFaceAdjustedBlurMap"), v4->_faceAdjustedBlurMapFromStandardResolutionImage, 1u);
      }
      faceAdjustedBlurMapFromStandardResolutionImage = v4->_faceAdjustedBlurMapFromStandardResolutionImage;
      if (faceAdjustedBlurMapFromStandardResolutionImage)
      {
        CFRelease(faceAdjustedBlurMapFromStandardResolutionImage);
        v4->_faceAdjustedBlurMapFromStandardResolutionImage = 0;
      }
      portraitStillImageAuxDepthMetadata = v4->_portraitStillImageAuxDepthMetadata;
      if (portraitStillImageAuxDepthMetadata)
      {
        CFRelease(portraitStillImageAuxDepthMetadata);
        v4->_portraitStillImageAuxDepthMetadata = 0;
      }

      v4->_attachedMediaFromStandardResolutionImage = 0;
      v4->_inferenceResultsFromStandardResolutionImage = 0;
      v40 = cf;
    }
    goto LABEL_73;
  }
  -[BWStillImageFilterStatusDelegate filterNodeDidReceiveStandardResolutionDeepFusionBuffer:error:](v4->_statusDelegate, "filterNodeDidReceiveStandardResolutionDeepFusionBuffer:error:", v4, 0);
  coreImageBlurMapRenderer = v4->_coreImageBlurMapRenderer;
  v42 = CMSampleBufferGetImageBuffer(target);
  v119[0] = MEMORY[0x1E0C809B0];
  v119[1] = 3221225472;
  v119[2] = __54__BWStillImageFilterNode_renderSampleBuffer_forInput___block_invoke;
  v119[3] = &unk_1E4922A50;
  v119[4] = v4;
  v119[5] = target;
  -[BWStillImageCoreImageBlurMapRenderer renderUsingParameters:inputPixelBuffer:inputSampleBuffer:originalPixelBuffer:processedPixelBuffer:completionHandler:](coreImageBlurMapRenderer, "renderUsingParameters:inputPixelBuffer:inputSampleBuffer:originalPixelBuffer:processedPixelBuffer:completionHandler:", 0, v42, target, 0, 0, v119);
  v43 = 0;
LABEL_50:
  v44 = 0;
LABEL_51:
  v45 = v98;
LABEL_125:
  if (v124)
    CFRelease(v124);
  if (!v44)
  {
    if (v8 & 1 | (v43 == 0))
      return;
    v87 = 1;
    v44 = v43;
    goto LABEL_140;
  }
  if (v45)
    v87 = objc_msgSend((id)objc_msgSend(v45, "processingSettings"), "expectedClientImageCount");
  else
    v87 = 2;
LABEL_133:
  v88 = v4->_unstyledFullResolutionSbuf;
  if (v88)
  {
    CFRelease(v88);
    v4->_unstyledFullResolutionSbuf = 0;
  }
  v89 = v4->_learnedCoefficientsSbuf;
  if (v89)
  {
    CFRelease(v89);
    v4->_learnedCoefficientsSbuf = 0;
  }
  v90 = v4->_styledFullResolutionSbuf;
  if (v90)
  {
    CFRelease(v90);
    v4->_styledFullResolutionSbuf = 0;
  }
  if (v87 >= 1)
LABEL_140:
    -[BWStillImageFilterNode _emitNodeErrorForErrorStatus:numberOfNodeErrors:stillImageSettings:metadata:]((uint64_t)v4, v44, v87, (uint64_t)v45, (uint64_t)v97);
}

void __54__BWStillImageFilterNode_renderSampleBuffer_forInput___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v4;
  const void *v6;
  CFTypeRef v7;
  const void *v8;
  CFTypeRef v9;
  uint64_t v10;
  const void *v11;
  const void *v12;

  v4 = *(_QWORD *)(a1 + 32);
  if (a3)
  {

    *(_QWORD *)(*(_QWORD *)(a1 + 32) + 216) = a3;
  }
  else
  {
    v6 = *(const void **)(v4 + 224);
    v7 = CMGetAttachment(*(CMAttachmentBearerRef *)(a1 + 40), CFSTR("PortraitStillImageFaceAdjustedBlurMap"), 0);
    *(_QWORD *)(*(_QWORD *)(a1 + 32) + 224) = v7;
    if (v7)
      CFRetain(v7);
    if (v6)
      CFRelease(v6);

    *(_QWORD *)(*(_QWORD *)(a1 + 32) + 240) = BWSampleBufferCopyDictionaryOfAttachedMedia(*(const void **)(a1 + 40));
    *(_QWORD *)(*(_QWORD *)(a1 + 32) + 248) = (id)CMGetAttachment(*(CMAttachmentBearerRef *)(a1 + 40), CFSTR("Inferences"), 0);
    v8 = *(const void **)(*(_QWORD *)(a1 + 32) + 256);
    v9 = CMGetAttachment(*(CMAttachmentBearerRef *)(a1 + 40), CFSTR("PortraitStillImageAuxDepthMetadata"), 0);
    *(_QWORD *)(*(_QWORD *)(a1 + 32) + 256) = v9;
    if (v9)
      CFRetain(v9);
    if (v8)
      CFRelease(v8);
    v10 = *(_QWORD *)(a1 + 32);
    v11 = *(const void **)(v10 + 232);
    v12 = (const void *)objc_msgSend(*(id *)(v10 + 240), "objectForKeyedSubscript:", 0x1E495B118);
    *(_QWORD *)(*(_QWORD *)(a1 + 32) + 232) = v12;
    if (v12)
      CFRetain(v12);
    if (v11)
      CFRelease(v11);
  }
}

- (uint64_t)_prepareStillImageFilterRenderersForOriginalFilters:(id)a3 processedFilters:(void *)a4 metadata:(void *)a5 settings:(uint64_t)a6 inputDimensions:
{
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  int v16;
  void *v17;
  void *v18;
  int v19;
  BWRenderList *v20;
  double FinalCropRect;
  CGFloat v22;
  CGFloat v23;
  CGFloat v24;
  double height;
  float v26;
  int v27;
  float v28;
  float v29;
  float v30;
  _BOOL4 v31;
  char v32;
  id v33;
  uint64_t v34;
  double v35;
  id v36;
  __int16 v37;
  uint64_t v38;
  CGRect v40;

  if (!result)
    return result;
  v10 = result;
  if (objc_msgSend(*(id *)(result + 96), "deferredPhotoProcessorEnabled"))
  {
    v11 = (void *)objc_msgSend(a3, "mutableCopy");
    if (objc_msgSend(a3, "count"))
    {
      v12 = 0;
      while (!objc_msgSend((id)objc_msgSend((id)objc_msgSend(a3, "objectAtIndex:", v12), "name"), "isEqualToString:", CFSTR("CIDepthEffect")))
      {
        if (objc_msgSend(a3, "count") <= (unint64_t)++v12)
          goto LABEL_10;
      }
      objc_msgSend(v11, "removeObjectAtIndex:", v12);
      objc_msgSend(v11, "insertObject:atIndex:", objc_msgSend(MEMORY[0x1E0C9DDB8], "filterWithName:", CFSTR("CIDepthEffectMakeBlurMap")), 0);
      objc_msgSend(v11, "addObject:", objc_msgSend(MEMORY[0x1E0C9DDB8], "filterWithName:", CFSTR("CIDepthEffectApplyBlurMap")));
    }
LABEL_10:
    v13 = a5;
    a3 = v11;
  }
  else
  {
    v13 = a5;
  }
  v38 = *(_QWORD *)(v10 + 144);
  v14 = (void *)objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", objc_msgSend(a2, "valueForKeyPath:", CFSTR("name")));
  v15 = (void *)objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", objc_msgSend(a3, "valueForKeyPath:", CFSTR("name")));
  result = objc_msgSend(v14, "isEqualToSet:", objc_msgSend(*(id *)(v10 + 144), "originalFilterNames"));
  if ((_DWORD)result)
  {
    result = objc_msgSend(v15, "isEqualToSet:", objc_msgSend(*(id *)(v10 + 144), "processedFilterNames"));
    v16 = result ^ 1;
  }
  else
  {
    v16 = 1;
  }
  v17 = v13;
  if (*(_BYTE *)(v10 + 368))
  {
    if ((unint64_t)objc_msgSend(*(id *)(v10 + 104), "count") < 2)
      v18 = *(void **)(v10 + 128);
    else
      v18 = (void *)objc_msgSend(a4, "objectForKeyedSubscript:", *MEMORY[0x1E0D06D00]);
    FinalCropRect = FigCaptureMetadataUtilitiesGetFinalCropRect();
    FigCaptureMetadataUtilitiesComputeDenormalizedStillImageCropRect((int)a6, a6 >> 32, FinalCropRect, v22, v23, v24, (double)objc_msgSend((id)objc_msgSend(v13, "requestedSettings"), "outputWidth")/ (double)objc_msgSend((id)objc_msgSend(v13, "requestedSettings"), "outputHeight"));
    height = v40.size.height;
    if (CGRectIsNull(v40))
      goto LABEL_49;
    v26 = (float)objc_msgSend((id)objc_msgSend(v13, "requestedSettings"), "outputHeight") / height;
    v27 = objc_msgSend((id)objc_msgSend(a4, "objectForKeyedSubscript:", *MEMORY[0x1E0D06D20]), "intValue");
    if (v27)
      v26 = v26 / (float)((float)v27 * 0.5);
    objc_msgSend((id)objc_msgSend(a4, "objectForKeyedSubscript:", *MEMORY[0x1E0D069C0]), "floatValue");
    if (v28 == 0.0)
      v28 = 1.0;
    v29 = fmaxf(v26 * v28, 1.0);
    result = objc_msgSend(v18, "isEqualToString:", *(_QWORD *)(v10 + 312));
    if ((_DWORD)result)
    {
      v30 = *(float *)(v10 + 320);
      v31 = v29 != v30;
      if (v38)
        v32 = v16;
      else
        v32 = 1;
      if ((v32 & 1) == 0 && v29 == v30)
        return result;
    }
    else
    {
      v31 = 1;
    }
    v33 = *(id *)(v10 + 312);

    *(_QWORD *)(v10 + 144) = 0;
    *(_QWORD *)(v10 + 312) = 0;

    *(_QWORD *)(v10 + 328) = 0;
    *(_DWORD *)(v10 + 320) = 0;
    *(_BYTE *)(v10 + 424) = 0;
    if (v31)
    {

      *(_QWORD *)(v10 + 176) = 0;
      *(_QWORD *)(v10 + 184) = 0;
    }
    v34 = objc_msgSend((id)objc_msgSend(*(id *)(v10 + 104), "objectForKeyedSubscript:", v18), "sensorIDDictionary");
    *(float *)&v35 = v29;
    v36 = +[FigCaptureCameraParameters sdofTuningParametersForSensorIDDictionary:zoomFactor:](FigCaptureCameraParameters, "sdofTuningParametersForSensorIDDictionary:zoomFactor:", v34, v35);
    *(_QWORD *)(v10 + 328) = v36;
    if (!v36)
    {
LABEL_49:
      fig_log_get_emitter();
      return FigDebugAssert3();
    }
    *(_QWORD *)(v10 + 312) = v18;
    *(float *)(v10 + 320) = v29;
    if (objc_msgSend(*(id *)(v10 + 96), "deferredPhotoProcessorEnabled"))
    {
      if (objc_msgSend(*(id *)(v10 + 96), "optimizedEnhancedResolutionDepthPipelineEnabled"))
        v37 = 3;
      else
        v37 = 2;
    }
    else
    {
      v37 = 1;
    }
    *(_QWORD *)(v10 + 144) = -[BWRenderList initWithResourceProvider:originalFilters:processedFilters:optimizationStrategy:stillImageSettings:]([BWRenderList alloc], "initWithResourceProvider:originalFilters:processedFilters:optimizationStrategy:stillImageSettings:", *(_QWORD *)(v10 + 160), a2, a3, v37, v17);
    if (*(_QWORD *)(v10 + 208))
    {
      if ((objc_msgSend(*(id *)(v10 + 96), "optimizedEnhancedResolutionDepthPipelineEnabled") & 1) == 0)
        objc_msgSend(*(id *)(v10 + 208), "setRenderBlurMapToCVPixelBuffer:", objc_msgSend(*(id *)(v10 + 144), "hasMetalColorCubeRenderer"));
    }
    v20 = *(BWRenderList **)(v10 + 144);
    return -[BWRenderList prepareWithParameters:forInputVideoFormat:inputMediaPropertiesByAttachedMediaKey:](v20, "prepareWithParameters:forInputVideoFormat:inputMediaPropertiesByAttachedMediaKey:", 0, *(_QWORD *)(v10 + 336), 0);
  }
  if (v38)
    v19 = v16;
  else
    v19 = 1;
  if (v19 == 1)
  {

    v20 = -[BWRenderList initWithResourceProvider:originalFilters:processedFilters:optimizationStrategy:stillImageSettings:]([BWRenderList alloc], "initWithResourceProvider:originalFilters:processedFilters:optimizationStrategy:stillImageSettings:", *(_QWORD *)(v10 + 160), a2, a3, 1, v13);
    *(_QWORD *)(v10 + 144) = v20;
    return -[BWRenderList prepareWithParameters:forInputVideoFormat:inputMediaPropertiesByAttachedMediaKey:](v20, "prepareWithParameters:forInputVideoFormat:inputMediaPropertiesByAttachedMediaKey:", 0, *(_QWORD *)(v10 + 336), 0);
  }
  return result;
}

- (uint64_t)_downsampleImageForSampleBuffer:(CFTypeRef *)a3 outputSampleBuffer:(uint64_t)a4 dimensions:
{
  int v6;
  __CVBuffer *ImageBuffer;
  CFTypeRef v11;
  CFTypeRef cf;
  CFTypeRef v13;

  if (!a1)
    return 0;
  v6 = 0;
  cf = 0;
  v13 = 0;
  v11 = 0;
  if (sbuf && a3)
  {
    ImageBuffer = CMSampleBufferGetImageBuffer(sbuf);
    if (ImageBuffer)
    {
      if (!-[BWStillImageFilterNode _downsamplePixelBuffer:outputPixelBuffer:dimensions:](a1, ImageBuffer, (CVPixelBufferRef *)&v11, a4)&& !BWCMSampleBufferCreateCopyWithNewPixelBuffer(sbuf, (__CVBuffer *)v11, &cf, (CMSampleBufferRef *)&v13))
      {
        v6 = 1;
        goto LABEL_8;
      }
      fig_log_get_emitter();
    }
    else
    {
      fig_log_get_emitter();
    }
    FigDebugAssert3();
    v6 = 0;
  }
LABEL_8:
  if (cf)
    CFRelease(cf);
  if (v11)
    CFRelease(v11);
  if (v6)
  {
    *a3 = v13;
  }
  else if (v13)
  {
    CFRelease(v13);
  }
  return 0;
}

- (void)_emitSampleBufferAsync:(uint64_t)a1
{
  NSObject *v4;
  _QWORD v5[6];

  if (a1)
  {
    if (cf)
    {
      CFRetain(cf);
      v4 = *(NSObject **)(a1 + 408);
      v5[0] = MEMORY[0x1E0C809B0];
      v5[1] = 3221225472;
      v5[2] = __49__BWStillImageFilterNode__emitSampleBufferAsync___block_invoke;
      v5[3] = &unk_1E491F158;
      v5[4] = a1;
      v5[5] = cf;
      dispatch_async(v4, v5);
    }
  }
}

- (uint64_t)_downsampleAttachedMediaForSampleBuffer:(uint64_t)a1
{
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  uint64_t v11;
  opaqueCMSampleBuffer *v12;
  int v13;
  int *v14;
  uint64_t v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  CFTypeRef v22[8];

  v22[6] = *(CFTypeRef *)MEMORY[0x1E0C80C00];
  if (!a1)
    return 0;
  if (a2)
  {
    v4 = (void *)BWSampleBufferCopyDictionaryOfAttachedMedia(a2);
    v17 = 0u;
    v18 = 0u;
    v19 = 0u;
    v20 = 0u;
    v22[0] = CFSTR("PersonSegmentationMask");
    v22[1] = CFSTR("PersonSemanticsHair");
    v22[2] = CFSTR("PersonSemanticsGlasses");
    v22[3] = CFSTR("RefinedDepth");
    v22[4] = CFSTR("Depth");
    v22[5] = CFSTR("GainMap");
    v5 = (void *)objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v22, 6);
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v18;
      while (2)
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v18 != v8)
            objc_enumerationMutation(v5);
          v10 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * i);
          v11 = objc_msgSend(v4, "objectForKeyedSubscript:", v10);
          if (v11)
          {
            v12 = (opaqueCMSampleBuffer *)v11;
            v22[0] = 0;
            v13 = objc_msgSend(v10, "isEqualToString:", CFSTR("Depth"));
            v14 = &OBJC_IVAR___BWStillImageFilterNode__maskDimensions;
            if (v13)
              v14 = &OBJC_IVAR___BWStillImageFilterNode__depthDataMapDimensions;
            -[BWStillImageFilterNode _downsampleImageForSampleBuffer:outputSampleBuffer:dimensions:](a1, v12, v22, *(_QWORD *)(a1 + *v14));
            if (!v22[0])
            {
              fig_log_get_emitter();
              FigDebugAssert3();
              goto LABEL_18;
            }
            BWSampleBufferSetAttachedMedia(a2, (uint64_t)v10, (uint64_t)v22[0]);
            if (v22[0])
              CFRelease(v22[0]);
          }
        }
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
        if (v7)
          continue;
        break;
      }
    }
LABEL_18:
    v15 = 0;
  }
  else
  {
    v4 = 0;
    v15 = 4294954516;
  }

  return v15;
}

void __54__BWStillImageFilterNode_renderSampleBuffer_forInput___block_invoke_58(uint64_t a1, unint64_t a2, void *target, void *a4)
{
  int v8;
  int v9;
  _BOOL4 v10;
  uint64_t v11;
  int v12;
  uint64_t v13;
  unsigned int v14;
  int v15;
  __CFString **v16;
  int v17;
  void *v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t i;
  uint64_t v24;
  int v25;
  uint64_t v26;
  int v27;
  int v28;
  uint64_t v29;
  const void *AttachedMedia;
  int v31;
  int v32;
  int v33;
  uint64_t v34;
  const void *v35;
  const void *v36;
  int v37;
  int v38;
  CFTypeRef v39;
  int v40;
  int v41;
  _QWORD *v42;
  const void *v43;
  const void *v44;
  const void *v45;
  const void *v46;
  const void *v47;
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  unsigned int v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  os_log_type_t type;
  int v55;
  _BYTE v56[128];
  CMSampleBufferRef sampleBufferOut;
  const __CFString *v58;
  const __CFString *v59;
  __CFString *v60;
  const __CFString *v61;
  __CFString *v62;
  uint64_t v63;

  v63 = *MEMORY[0x1E0C80C00];
  v8 = objc_msgSend((id)CMGetAttachment(target, CFSTR("StillImageProcessingFlags"), 0), "unsignedIntValue");
  v9 = BWIsSmartStyleAllowedForAdjustedImage(*(void **)(a1 + 32));
  if (v9)
    v10 = objc_msgSend(a4, "code") == -2;
  else
    v10 = 0;
  v11 = BWStillImageProcessingFlagsForSampleBuffer(*(const void **)(a1 + 56));
  v12 = v8 | 0x800000;
  if (!v10)
    v12 = v8;
  if (a4 && !v10)
  {
    v38 = objc_msgSend(a4, "code");
    v55 = 0;
    type = OS_LOG_TYPE_DEFAULT;
    os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    v37 = 1;
    fig_log_call_emit_and_clean_up_after_send_and_compose();
    v25 = 0;
    LODWORD(v26) = 0;
    if (v38)
      goto LABEL_61;
    goto LABEL_57;
  }
  if (!target)
  {
    v25 = 0;
    LODWORD(v26) = 0;
    v38 = -12786;
    goto LABEL_60;
  }
  if (a2 == 1)
  {
    if (*(_BYTE *)(a1 + 76))
    {
      v13 = v12 | 4u;
      sampleBufferOut = 0;
      if (*(_BYTE *)(a1 + 77))
        BWCMSampleBufferCreateCopyIncludingMetadata((CMSampleBufferRef)target, &sampleBufferOut);
      else
        sampleBufferOut = (CMSampleBufferRef)CFRetain(target);
      if (*(_BYTE *)(a1 + 78) && !*(_BYTE *)(a1 + 79))
        CMSetAttachment(sampleBufferOut, CFSTR("SDOFCustomRendered"), (CFTypeRef)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithShort:", 9), 1u);
      CMSetAttachment(sampleBufferOut, CFSTR("StillImageProcessingFlags"), (CFTypeRef)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v13), 1u);
      -[BWStillImageFilterNode _emitSampleBufferAsync:](*(_QWORD *)(a1 + 40), sampleBufferOut);
      if (sampleBufferOut)
        CFRelease(sampleBufferOut);
      LODWORD(v26) = 0;
      v25 = 1;
      goto LABEL_57;
    }
    goto LABEL_28;
  }
  if ((a2 & 2) == 0)
  {
LABEL_56:
    v25 = 0;
    v26 = (a2 >> 1) & 1;
    if (a2)
      goto LABEL_57;
    v38 = -12780;
LABEL_60:
    v37 = 1;
    goto LABEL_61;
  }
  if (*(_BYTE *)(a1 + 77))
  {
    v14 = v11 & 0x800000;
    v15 = v12 | (4 * (a2 & 1));
    v16 = kBWNodeSampleBufferAttachmentKey_OriginalCameraIntrinsicMatrixReferenceDimensions;
    if (*(_BYTE *)(a1 + 78))
    {
      v49 = v11 & 0x800000;
      v17 = v15 | 0x48;
      if (*(_DWORD *)(*(_QWORD *)(a1 + 40) + 380))
      {
        v52 = 0u;
        v53 = 0u;
        v50 = 0u;
        v51 = 0u;
        sampleBufferOut = (CMSampleBufferRef)CFSTR("PersonSegmentationMask");
        v58 = CFSTR("PersonSemanticsHair");
        v59 = CFSTR("PersonSemanticsGlasses");
        v60 = CFSTR("RefinedDepth");
        v61 = CFSTR("Depth");
        v62 = CFSTR("GainMap");
        v18 = (void *)objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &sampleBufferOut, 6);
        sampleBufferOut = (CMSampleBufferRef)CFSTR("PersonSemanticsSkin");
        v58 = CFSTR("PersonSemanticsTeeth");
        v19 = (void *)objc_msgSend(v18, "arrayByAddingObjectsFromArray:", objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &sampleBufferOut, 2));
        v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v50, v56, 16);
        if (v20)
        {
          v21 = v20;
          v22 = *(_QWORD *)v51;
          do
          {
            for (i = 0; i != v21; ++i)
            {
              if (*(_QWORD *)v51 != v22)
                objc_enumerationMutation(v19);
              BWSampleBufferRemoveAttachedMedia(target, *(_QWORD *)(*((_QWORD *)&v50 + 1) + 8 * i));
            }
            v21 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v50, v56, 16);
          }
          while (v21);
        }
      }
      if (*(_BYTE *)(a1 + 79))
        v24 = 7;
      else
        v24 = 8;
      CMSetAttachment(target, CFSTR("SDOFCustomRendered"), (CFTypeRef)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithShort:", v24), 1u);
      v16 = kBWNodeSampleBufferAttachmentKey_OriginalCameraIntrinsicMatrixReferenceDimensions;
      v14 = v49;
    }
    else
    {
      v17 = v15 | 8;
    }
    v27 = v10 | (v14 >> 23);
    v28 = BWCIFilterArrayContainsPortraitEffectStageFilters(*(void **)(a1 + 48), 1);
    v29 = (uint64_t)v16[79];
    AttachedMedia = (const void *)BWSampleBufferGetAttachedMedia(target, v29);
    if ((objc_msgSend((id)objc_msgSend((id)CMGetAttachment(AttachedMedia, (CFStringRef)*MEMORY[0x1E0D05CB0], 0), "objectForKeyedSubscript:", *MEMORY[0x1E0D05F08]), "intValue") & 0xFFFE0000) != 0)v31 = v28;
    else
      v31 = 0;
    if (v31 == 1)
      BWSampleBufferRemoveAttachedMedia(target, v29);
    v32 = v17 | 0x200000;
    if (v27)
      v32 = v17;
    if (v9)
      v33 = v32;
    else
      v33 = v17;
    v34 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 232);
    if (v34)
      goto LABEL_51;
    v35 = (const void *)BWSampleBufferGetAttachedMedia(target, 0x1E495B118);
    if (v35)
      v35 = CFRetain(v35);
    *(_QWORD *)(*(_QWORD *)(a1 + 40) + 232) = v35;
    v34 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 232);
    if (v34)
    {
LABEL_51:
      if ((v31 & 1) == 0)
        BWSampleBufferSetAttachedMedia(target, v29, v34);
      BWSampleBufferRemoveAttachedMedia(target, 0x1E495B118);
      v36 = *(const void **)(*(_QWORD *)(a1 + 40) + 232);
      if (v36)
      {
        CFRelease(v36);
        *(_QWORD *)(*(_QWORD *)(a1 + 40) + 232) = 0;
      }
    }
    BWStillImageSetProcessingFlagsForSampleBuffer(target, v33);
    -[BWStillImageFilterNode _emitSampleBufferAsync:](*(_QWORD *)(a1 + 40), target);
    goto LABEL_56;
  }
LABEL_28:
  v25 = 0;
  LODWORD(v26) = 0;
LABEL_57:
  if (!*(_DWORD *)(a1 + 72))
    goto LABEL_71;
  v37 = 0;
  v38 = 0;
LABEL_61:
  v39 = CMGetAttachment(target, (CFStringRef)*MEMORY[0x1E0D05CB0], 0);
  if (v37 && *(_BYTE *)(a1 + 76) && !v25)
    -[BWStillImageFilterNode _emitNodeErrorForErrorStatus:numberOfNodeErrors:stillImageSettings:metadata:](*(_QWORD *)(a1 + 40), v38, 1, *(_QWORD *)(a1 + 32), (uint64_t)v39);
  v40 = v26 ^ 1;
  if (!*(_BYTE *)(a1 + 77))
    v40 = 0;
  if ((v37 & v40) == 1)
    -[BWStillImageFilterNode _emitNodeErrorForErrorStatus:numberOfNodeErrors:stillImageSettings:metadata:](*(_QWORD *)(a1 + 40), v38, 1, *(_QWORD *)(a1 + 32), (uint64_t)v39);
  v41 = *(_DWORD *)(a1 + 72);
  if (v41)
    -[BWStillImageFilterNode _emitNodeErrorForErrorStatus:numberOfNodeErrors:stillImageSettings:metadata:](*(_QWORD *)(a1 + 40), v41, 1, *(_QWORD *)(a1 + 32), (uint64_t)v39);
LABEL_71:
  v42 = *(_QWORD **)(a1 + 40);
  v43 = (const void *)v42[35];
  if (v43)
  {
    CFRelease(v43);
    *(_QWORD *)(*(_QWORD *)(a1 + 40) + 280) = 0;
    v42 = *(_QWORD **)(a1 + 40);
  }
  v44 = (const void *)v42[37];
  if (v44)
  {
    CFRelease(v44);
    *(_QWORD *)(*(_QWORD *)(a1 + 40) + 296) = 0;
    v42 = *(_QWORD **)(a1 + 40);
  }
  v45 = (const void *)v42[36];
  if (v45)
  {
    CFRelease(v45);
    *(_QWORD *)(*(_QWORD *)(a1 + 40) + 288) = 0;
  }
  v46 = *(const void **)(a1 + 56);
  if (v46)
    CFRelease(v46);
  v47 = *(const void **)(a1 + 64);
  if (v47)
    CFRelease(v47);
}

- (void)_emitNodeErrorForErrorStatus:(int)a3 numberOfNodeErrors:(uint64_t)a4 stillImageSettings:(uint64_t)a5 metadata:
{
  NSObject *v5;
  _QWORD v6[7];
  int v7;
  int v8;

  if (a1)
  {
    v5 = *(NSObject **)(a1 + 408);
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __102__BWStillImageFilterNode__emitNodeErrorForErrorStatus_numberOfNodeErrors_stillImageSettings_metadata___block_invoke;
    v6[3] = &unk_1E4922AA0;
    v7 = a3;
    v8 = a2;
    v6[4] = a1;
    v6[5] = a4;
    v6[6] = a5;
    dispatch_async(v5, v6);
  }
}

- (void)handleNodeError:(id)a3 forInput:(id)a4
{
  NSObject *emitQueue;
  _QWORD v7[6];

  if (-[BWStillImageNodeConfiguration optimizedEnhancedResolutionDepthPipelineEnabled](self->_nodeConfiguration, "optimizedEnhancedResolutionDepthPipelineEnabled", a3, a4))
  {
    -[BWStillImageFilterStatusDelegate filterNodeDidReceiveStandardResolutionDeepFusionBuffer:error:](self->_statusDelegate, "filterNodeDidReceiveStandardResolutionDeepFusionBuffer:error:", 0, objc_msgSend(a3, "errorCode"));
  }
  -[BWRenderListProcessor waitForAllProcessingToComplete](self->_renderListProcessor, "waitForAllProcessingToComplete");
  emitQueue = self->_emitQueue;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __51__BWStillImageFilterNode_handleNodeError_forInput___block_invoke;
  v7[3] = &unk_1E491E748;
  v7[4] = a3;
  v7[5] = self;
  dispatch_async(emitQueue, v7);
}

uint64_t __51__BWStillImageFilterNode_handleNodeError_forInput___block_invoke(uint64_t a1)
{
  uint64_t result;
  int v3;

  result = objc_msgSend((id)objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "stillImageSettings"), "processingSettings"), "expectedClientImageCount");
  if ((int)result >= 1)
  {
    v3 = 0;
    do
    {
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 16), "emitNodeError:", *(_QWORD *)(a1 + 32));
      ++v3;
      result = objc_msgSend((id)objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "stillImageSettings"), "processingSettings"), "expectedClientImageCount");
    }
    while (v3 < (int)result);
  }
  return result;
}

- (void)didReachEndOfDataForInput:(id)a3
{
  NSObject *emitQueue;
  _QWORD block[5];

  -[BWRenderListProcessor waitForAllProcessingToComplete](self->_renderListProcessor, "waitForAllProcessingToComplete", a3);
  emitQueue = self->_emitQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __52__BWStillImageFilterNode_didReachEndOfDataForInput___block_invoke;
  block[3] = &unk_1E491E720;
  block[4] = self;
  dispatch_async(emitQueue, block);

  self->_mtlCommandQueue = 0;
}

uint64_t __52__BWStillImageFilterNode_didReachEndOfDataForInput___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "markEndOfLiveOutput");
}

- (void)setSmartStyleRenderingVersion:(int)a3
{
  self->_smartStyleRenderingVersion = a3;
}

- (int)smartStyleRenderingVersion
{
  return self->_smartStyleRenderingVersion;
}

- (uint64_t)_downsamplePixelBuffer:(CVPixelBufferRef *)a3 outputPixelBuffer:(uint64_t)a4 dimensions:
{
  void *v5;
  uint64_t v6;
  uint64_t v10;
  uint64_t v11;
  const __CFAllocator *v12;
  OSType PixelFormatType;
  uint64_t v14;
  OSType v15;
  CVPixelBufferRef pixelBufferOut;

  if (!a1)
    return 0;
  v5 = 0;
  pixelBufferOut = 0;
  v6 = 4294954516;
  if (a2 && a3)
  {
    v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithDictionary:", CVPixelBufferGetAttributes());
    if (v5)
    {
      v10 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", a4);
      objc_msgSend(v5, "setObject:forKeyedSubscript:", v10, *MEMORY[0x1E0CA90E0]);
      v11 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", HIDWORD(a4));
      objc_msgSend(v5, "setObject:forKeyedSubscript:", v11, *MEMORY[0x1E0CA8FD8]);
      v12 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
      PixelFormatType = CVPixelBufferGetPixelFormatType(a2);
      v14 = CVPixelBufferCreate(v12, (int)a4, a4 >> 32, PixelFormatType, (CFDictionaryRef)v5, &pixelBufferOut);
      if (!(_DWORD)v14)
      {
        v15 = CVPixelBufferGetPixelFormatType(a2);
        if (FigDepthFormatIsDepth(v15) || FigDepthFormatIsDisparity(v15))
        {
          v14 = FigDepthScaleBuffer(a2, pixelBufferOut);
          if (!(_DWORD)v14)
          {
LABEL_9:

            v6 = 0;
            *a3 = pixelBufferOut;
            return v6;
          }
        }
        else
        {
          v14 = VTSessionSetProperty(*(VTSessionRef *)(a1 + 384), (CFStringRef)*MEMORY[0x1E0CED848], (CFTypeRef)*MEMORY[0x1E0CEDB40]);
          if (!(_DWORD)v14)
          {
            v14 = VTPixelTransferSessionTransferImage(*(VTPixelTransferSessionRef *)(a1 + 384), a2, pixelBufferOut);
            if (!(_DWORD)v14)
              goto LABEL_9;
          }
        }
      }
      v6 = v14;
      fig_log_get_emitter();
      FigDebugAssert3();
    }
    else
    {
      fig_log_get_emitter();
      FigDebugAssert3();
      v6 = 4294954510;
    }
  }

  if (pixelBufferOut)
    CFRelease(pixelBufferOut);
  return v6;
}

void __49__BWStillImageFilterNode__emitSampleBufferAsync___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "emitSampleBuffer:", *(_QWORD *)(a1 + 40));
  CFRelease(*(CFTypeRef *)(a1 + 40));
}

void __102__BWStillImageFilterNode__emitNodeErrorForErrorStatus_numberOfNodeErrors_stillImageSettings_metadata___block_invoke(uint64_t a1)
{
  int v2;
  id v3;

  if (*(int *)(a1 + 56) >= 1)
  {
    v2 = 0;
    do
    {
      v3 = +[BWNodeError newError:sourceNode:stillImageSettings:metadata:](BWNodeError, "newError:sourceNode:stillImageSettings:metadata:", *(unsigned int *)(a1 + 60), *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "emitNodeError:", v3);

      ++v2;
    }
    while (v2 < *(_DWORD *)(a1 + 56));
  }
}

- (id)provideStreamingSDOFFilterRenderer
{
  return 0;
}

- (uint64_t)_provideCIContext
{
  uint64_t v1;
  int v2;

  if (result)
  {
    v1 = result;
    result = *(_QWORD *)(result + 168);
    if (!result)
    {
      v2 = 0;
      *(_QWORD *)(v1 + 168) = +[BWCoreImageFilterRenderer context:deferredPhotoProcessorEnabled:err:](BWCoreImageFilterRenderer, "context:deferredPhotoProcessorEnabled:err:", *(unsigned __int8 *)(v1 + 368), objc_msgSend(*(id *)(v1 + 96), "deferredPhotoProcessorEnabled"), &v2);
      if (objc_msgSend(*(id *)(v1 + 96), "deferredPhotoProcessorEnabled"))
      {
        objc_msgSend(*(id *)(v1 + 168), "loadArchiveWithName:fromURL:", CFSTR("ccportrait_archive"), objc_msgSend(BWLoadProcessorBundle((uint64_t)CFSTR("CCPortrait"), 0xFFFFFFFFLL), "bundleURL"));
        objc_msgSend(*(id *)(v1 + 168), "loadArchive:", *MEMORY[0x1E0C9E2A8]);
      }
      if (v2)
      {
        fig_log_get_emitter();
        FigDebugAssert3();
      }
      return *(_QWORD *)(v1 + 168);
    }
  }
  return result;
}

- (id)provideCoreImageFilterRenderer
{
  return -[BWCoreImageFilterRenderer initForRenderingWithDepth:context:portraitRenderQuality:hairnetEnabled:metalCommandQueue:figThreadPriority:]([BWCoreImageFilterRenderer alloc], "initForRenderingWithDepth:context:portraitRenderQuality:hairnetEnabled:metalCommandQueue:figThreadPriority:", self->_depthDataDeliveryEnabled, -[BWStillImageFilterNode _provideCIContext]((uint64_t)self), self->_portraitRenderQuality, self->_hairnetEnabled, self->_mtlCommandQueue, -[BWStillImageNodeConfiguration figThreadPriority](self->_nodeConfiguration, "figThreadPriority"));
}

- (id)provideStillImageMetalSDOFRenderer
{
  BWStillImageMetalSDOFRenderer *metalSDOFRenderer;

  metalSDOFRenderer = self->_metalSDOFRenderer;
  if (!metalSDOFRenderer)
  {
    metalSDOFRenderer = -[BWStillImageMetalSDOFRenderer initWithSDOFRenderingTuningParameters:imageDimensions:depthDataMapDimensions:portraitRenderQuality:metalCommandQueue:]([BWStillImageMetalSDOFRenderer alloc], "initWithSDOFRenderingTuningParameters:imageDimensions:depthDataMapDimensions:portraitRenderQuality:metalCommandQueue:", self->_currentSDOFRenderingParameters, *(_QWORD *)&self->_outputDimensions, *(_QWORD *)&self->_depthDataMapDimensions, self->_portraitRenderQuality, self->_mtlCommandQueue);
    self->_metalSDOFRenderer = metalSDOFRenderer;
  }
  return metalSDOFRenderer;
}

- (id)provideStillImageMetalBlurMapRenderer
{
  BWStillImageMetalBlurMapRenderer *metalBlurMapRenderer;

  metalBlurMapRenderer = self->_metalBlurMapRenderer;
  if (!metalBlurMapRenderer)
  {
    metalBlurMapRenderer = -[BWStillImageMetalBlurMapRenderer initWithSDOFRenderingTuningParameters:imageDimensions:depthDataMapDimensions:portraitRenderQuality:metalCommandQueue:backPressureDrivenPipelining:]([BWStillImageMetalBlurMapRenderer alloc], "initWithSDOFRenderingTuningParameters:imageDimensions:depthDataMapDimensions:portraitRenderQuality:metalCommandQueue:backPressureDrivenPipelining:", self->_currentSDOFRenderingParameters, *(_QWORD *)&self->_outputDimensions, *(_QWORD *)&self->_depthDataMapDimensions, self->_portraitRenderQuality, self->_mtlCommandQueue, self->_backPressureDrivenPipelining);
    self->_metalBlurMapRenderer = metalBlurMapRenderer;
  }
  return metalBlurMapRenderer;
}

- (id)provideApplySmartStyleRenderer
{
  BWApplySmartStyleRenderer *applySmartStyleRenderer;

  applySmartStyleRenderer = self->_applySmartStyleRenderer;
  if (!applySmartStyleRenderer)
  {
    if (self->_smartStyleRenderingVersion < 1)
    {
      applySmartStyleRenderer = 0;
    }
    else
    {
      applySmartStyleRenderer = -[BWApplySmartStyleRenderer initWithMetalCommandQueue:smartStyleRenderingVersion:]([BWApplySmartStyleRenderer alloc], "initWithMetalCommandQueue:smartStyleRenderingVersion:", self->_mtlCommandQueue, self->_smartStyleRenderingVersion);
      self->_applySmartStyleRenderer = applySmartStyleRenderer;
    }
  }
  return applySmartStyleRenderer;
}

- (id)provideMetalFilterRenderer
{
  BWMetalColorCubeRenderer *metalFilterRenderer;

  metalFilterRenderer = self->_metalFilterRenderer;
  if (!metalFilterRenderer)
  {
    metalFilterRenderer = -[BWMetalColorCubeRenderer initWithMetalCommandQueue:mixInGammaDomain:]([BWMetalColorCubeRenderer alloc], "initWithMetalCommandQueue:mixInGammaDomain:", self->_mtlCommandQueue, 0);
    self->_metalFilterRenderer = metalFilterRenderer;
  }
  return metalFilterRenderer;
}

- (id)provideStillImageCoreImageBlurMapRenderer
{
  BWStillImageCoreImageBlurMapRenderer *coreImageBlurMapRenderer;

  coreImageBlurMapRenderer = self->_coreImageBlurMapRenderer;
  if (!coreImageBlurMapRenderer)
  {
    coreImageBlurMapRenderer = -[BWStillImageCoreImageBlurMapRenderer initForRenderingWithContext:hairnetEnabled:]([BWStillImageCoreImageBlurMapRenderer alloc], "initForRenderingWithContext:hairnetEnabled:", -[BWStillImageFilterNode _provideCIContext]((uint64_t)self), self->_hairnetEnabled);
    self->_coreImageBlurMapRenderer = coreImageBlurMapRenderer;
  }
  return coreImageBlurMapRenderer;
}

- (id)provideColorLookupCache
{
  return self->_colorLookupCache;
}

@end
