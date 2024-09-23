@implementation BWStreamingCVAFilterRenderer

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    FigNote_AllowInternalDefaultLogs();
    fig_note_initialize_category_with_default_work_cf();
    fig_note_initialize_category_with_default_work_cf();
  }
}

- (BWStreamingCVAFilterRenderer)initWithCaptureDevice:(id)a3 studioAndContourRenderingEnabled:(BOOL)a4 stageRenderingEnabled:(BOOL)a5 depthDataSource:(int)a6 foregroundBlurEnabled:(BOOL)a7 commandQueue:(id)a8 priority:(unsigned int)a9 mirroredForMetadataAdjustment:(BOOL)a10 rotationDegreesForMetadataAdjustment:(int)a11 secondaryStreamingPersonSegmentationEnabled:(BOOL)a12
{
  _BOOL4 v15;
  BWStreamingCVAFilterRenderer *v18;
  NSObject *sharedContextQueue;
  BWSpringSimulation *v20;
  _QWORD block[5];
  objc_super v23;

  v15 = a5;
  v23.receiver = self;
  v23.super_class = (Class)BWStreamingCVAFilterRenderer;
  v18 = -[BWStreamingCVAFilterRenderer init](&v23, sel_init);
  if (v18)
  {
    v18->_sharedContextQueue = (OS_dispatch_queue *)dispatch_queue_create("com.apple.bwgraph.streaming-cva-renderer.context-queue", 0);
    v18->_notificationQueue = (OS_dispatch_queue *)FigDispatchQueueCreateWithPriority();
    v18->_commandQueue = (MTLCommandQueue *)a8;
    v18->_animator = -[BWStreamingCVAFilterRendererAnimator initWithEffectStatus:overCaptureEnabled:]([BWStreamingCVAFilterRendererAnimator alloc], "initWithEffectStatus:overCaptureEnabled:", objc_msgSend(a3, "shallowDepthOfFieldEffectStatus"), objc_msgSend(a3, "overCaptureEnabled"));
    v18->_previousForegroundSegmentationPixelBuffer = 0;
    sharedContextQueue = v18->_sharedContextQueue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __280__BWStreamingCVAFilterRenderer_initWithCaptureDevice_studioAndContourRenderingEnabled_stageRenderingEnabled_depthDataSource_foregroundBlurEnabled_commandQueue_priority_mirroredForMetadataAdjustment_rotationDegreesForMetadataAdjustment_secondaryStreamingPersonSegmentationEnabled___block_invoke;
    block[3] = &unk_1E491E720;
    block[4] = v18;
    dispatch_sync(sharedContextQueue, block);
    v18->_depthDataSource = a6;
    v18->_captureDevice = (BWFigVideoCaptureDevice *)a3;
    v18->_studioAndContourRenderingEnabled = a4;
    v18->_stageRenderingEnabled = v15;
    if (v15)
    {
      v20 = objc_alloc_init(BWSpringSimulation);
      v18->_stageProxyLiveRenderingSpringSimulation = v20;
      -[BWSpringSimulation resetWithInput:initialOutput:initialVelocity:](v20, "resetWithInput:initialOutput:initialVelocity:", 1.0, 0.0, 0.0);
      -[BWSpringSimulation setTension:](v18->_stageProxyLiveRenderingSpringSimulation, "setTension:", 800.0);
      -[BWSpringSimulation setFriction:](v18->_stageProxyLiveRenderingSpringSimulation, "setFriction:", 20.0);
    }
    v18->_objectVisibilityByID = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    v18->_objectVisibilityByIDLock._os_unfair_lock_opaque = 0;
    v18->_postprocessedFaces = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v18->_foregroundBlurEnabled = a7;
    v18->_mirroredForMetadataAdjustment = a10;
    v18->_rotationDegreesForMetadataAdjustment = a11;
    v18->_secondaryStreamingPersonSegmentationEnabled = a12;
  }
  return v18;
}

uint64_t __280__BWStreamingCVAFilterRenderer_initWithCaptureDevice_studioAndContourRenderingEnabled_stageRenderingEnabled_depthDataSource_foregroundBlurEnabled_commandQueue_priority_mirroredForMetadataAdjustment_rotationDegreesForMetadataAdjustment_secondaryStreamingPersonSegmentationEnabled___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 176), "isDepthAvailable");
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 24) = result;
  *(_DWORD *)(*(_QWORD *)(a1 + 32) + 56) = 0;
  *(_DWORD *)(*(_QWORD *)(a1 + 32) + 60) = 2143289344;
  return result;
}

- (void)dealloc
{
  NSObject *sharedContextQueue;
  __CVBuffer *mattingBuffer;
  __CVBuffer *previousForegroundSegmentationPixelBuffer;
  objc_super v6;
  _QWORD block[5];

  sharedContextQueue = self->_sharedContextQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __39__BWStreamingCVAFilterRenderer_dealloc__block_invoke;
  block[3] = &unk_1E491E720;
  block[4] = self;
  dispatch_sync(sharedContextQueue, block);

  mattingBuffer = self->_mattingBuffer;
  if (mattingBuffer)
    CFRelease(mattingBuffer);
  previousForegroundSegmentationPixelBuffer = self->_previousForegroundSegmentationPixelBuffer;
  if (previousForegroundSegmentationPixelBuffer)
    CFRelease(previousForegroundSegmentationPixelBuffer);

  v6.receiver = self;
  v6.super_class = (Class)BWStreamingCVAFilterRenderer;
  -[BWStreamingCVAFilterRenderer dealloc](&v6, sel_dealloc);
}

void __39__BWStreamingCVAFilterRenderer_dealloc__block_invoke(uint64_t a1)
{
  uint64_t v2;
  const void *v3;

  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(const void **)(v2 + 32);
  if (v3)
  {
    CFRelease(v3);
    *(_QWORD *)(*(_QWORD *)(a1 + 32) + 32) = 0;
    v2 = *(_QWORD *)(a1 + 32);
  }

}

- (void)setSimulatedAperture:(float)a3
{
  NSObject *sharedContextQueue;
  _QWORD v4[5];
  float v5;

  sharedContextQueue = self->_sharedContextQueue;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __53__BWStreamingCVAFilterRenderer_setSimulatedAperture___block_invoke;
  v4[3] = &unk_1E4920568;
  v4[4] = self;
  v5 = a3;
  dispatch_sync(sharedContextQueue, v4);
}

float __53__BWStreamingCVAFilterRenderer_setSimulatedAperture___block_invoke(uint64_t a1)
{
  float result;

  result = *(float *)(a1 + 40);
  *(float *)(*(_QWORD *)(a1 + 32) + 56) = result;
  return result;
}

- (float)simulatedAperture
{
  NSObject *sharedContextQueue;
  float v3;
  _QWORD v5[6];
  uint64_t v6;
  float *v7;
  uint64_t v8;
  int v9;

  v6 = 0;
  v7 = (float *)&v6;
  v8 = 0x2020000000;
  v9 = 0;
  sharedContextQueue = self->_sharedContextQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __49__BWStreamingCVAFilterRenderer_simulatedAperture__block_invoke;
  v5[3] = &unk_1E491E9A8;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(sharedContextQueue, v5);
  v3 = v7[6];
  _Block_object_dispose(&v6, 8);
  return v3;
}

float __49__BWStreamingCVAFilterRenderer_simulatedAperture__block_invoke(uint64_t a1)
{
  float result;

  result = *(float *)(*(_QWORD *)(a1 + 32) + 56);
  *(float *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (void)setPortraitLightingEffectStrength:(float)a3
{
  NSObject *sharedContextQueue;
  _QWORD v4[5];
  float v5;

  sharedContextQueue = self->_sharedContextQueue;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __66__BWStreamingCVAFilterRenderer_setPortraitLightingEffectStrength___block_invoke;
  v4[3] = &unk_1E4920568;
  v4[4] = self;
  v5 = a3;
  dispatch_sync(sharedContextQueue, v4);
}

float __66__BWStreamingCVAFilterRenderer_setPortraitLightingEffectStrength___block_invoke(uint64_t a1)
{
  float result;

  result = *(float *)(a1 + 40);
  *(float *)(*(_QWORD *)(a1 + 32) + 60) = result;
  return result;
}

- (float)portraitLightingEffectStrength
{
  NSObject *sharedContextQueue;
  float v3;
  _QWORD v5[6];
  uint64_t v6;
  float *v7;
  uint64_t v8;
  int v9;

  v6 = 0;
  v7 = (float *)&v6;
  v8 = 0x2020000000;
  v9 = 0;
  sharedContextQueue = self->_sharedContextQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __62__BWStreamingCVAFilterRenderer_portraitLightingEffectStrength__block_invoke;
  v5[3] = &unk_1E491E9A8;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(sharedContextQueue, v5);
  v3 = v7[6];
  _Block_object_dispose(&v6, 8);
  return v3;
}

float __62__BWStreamingCVAFilterRenderer_portraitLightingEffectStrength__block_invoke(uint64_t a1)
{
  float result;

  result = *(float *)(*(_QWORD *)(a1 + 32) + 60);
  *(float *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (signed)type
{
  return 0;
}

- (NSString)displayName
{
  return (NSString *)CFSTR("AppleCVA Renderer");
}

- (int)prepareForRenderingWithParameters:(id)a3 inputVideoFormat:(id)a4 inputMediaPropertiesByAttachedMediaKey:(id)a5
{
  uint64_t v5;
  int v10;
  uint64_t v11;
  void *v12;
  int v13;
  BWFigVideoCaptureStream *v14;
  _BOOL4 v15;
  float v16;
  float v17;
  void *ModelSpecificName;
  BOOL v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  size_t v24;
  size_t v25;
  int depthDataSource;
  unsigned int v27;
  uint64_t v28;
  uint64_t v30;
  uint64_t v31;
  CVAPortraitVideoPipeline *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  BWVideoFormatRequirements *v37;
  id v38;
  __CVBuffer *mattingBuffer;
  __CVBuffer **p_mattingBuffer;
  int v41;
  uint64_t v43;
  BOOL v44;
  uint64_t v45;
  __CVBuffer *v46;
  BOOL v47;
  char v48;
  char v49;
  char v50;
  char v51;
  uint64_t v52;
  id v53;
  uint64_t v54;
  uint64_t v55;
  BWVideoFormatRequirements *v56;
  _QWORD v57[4];
  _QWORD v58[5];

  v58[4] = *MEMORY[0x1E0C80C00];
  v53 = 0;
  if (!a3)
    goto LABEL_161;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    return 0;
  v10 = objc_msgSend(a3, "prepareForRenderingWithInputVideoFormat:", a4);
  if (!v10)
  {
LABEL_161:
    if (!self->_portraitVideoPipeline)
    {
      self->_hasSeenDepth = 0;
      *(_QWORD *)&self->_maxFramesWithoutDepth = 1;
      self->_hasSeenSegmentation = 0;
      *(_QWORD *)&self->_maxFramesWithoutSegmentation = 6;
      v11 = objc_msgSend((id)objc_msgSend(a5, "objectForKeyedSubscript:", CFSTR("Depth")), "resolvedVideoFormat");
      if (!a4)
        goto LABEL_69;
      v12 = (void *)v11;
      if (!self->_depthDataSource && !v11)
        goto LABEL_69;
      v13 = -[BWFigVideoCaptureDevice position](self->_captureDevice, "position");
      v14 = -[BWFigVideoCaptureDevice bravoSuperWideCaptureStream](self->_captureDevice, "bravoSuperWideCaptureStream");
      v15 = -[BWFigVideoCaptureDevice portraitAutoSuggestEnabled](self->_captureDevice, "portraitAutoSuggestEnabled");
      -[BWZoomCommandHandler requestedZoomFactorWithoutFudge](-[BWFigVideoCaptureDevice zoomCommandHandler](self->_captureDevice, "zoomCommandHandler"), "requestedZoomFactorWithoutFudge");
      v17 = v16;
      ModelSpecificName = (void *)FigCaptureGetModelSpecificName();
      if (objc_msgSend(ModelSpecificName, "hasPrefix:", CFSTR("N841")))
      {
        v19 = v13 == 2;
        v20 = 8;
        goto LABEL_16;
      }
      if (objc_msgSend(ModelSpecificName, "hasPrefix:", CFSTR("D321")))
      {
        v19 = v13 == 2;
        v20 = 4;
        goto LABEL_16;
      }
      if (objc_msgSend(ModelSpecificName, "hasPrefix:", CFSTR("D33")))
      {
        v19 = v13 == 2;
        v20 = 6;
        goto LABEL_16;
      }
      if (objc_msgSend(ModelSpecificName, "hasPrefix:", CFSTR("N104")))
      {
        v19 = v13 == 2;
        v20 = 18;
        goto LABEL_16;
      }
      if (objc_msgSend(ModelSpecificName, "hasPrefix:", CFSTR("D42")))
      {
        v43 = 12;
        if (v14)
          v43 = 13;
        v44 = v13 == 2;
        v45 = 14;
        goto LABEL_53;
      }
      if (objc_msgSend(ModelSpecificName, "hasPrefix:", CFSTR("D43")))
      {
        v43 = 15;
        if (v14)
          v43 = 16;
        v44 = v13 == 2;
        v45 = 17;
        goto LABEL_53;
      }
      if ((objc_msgSend(ModelSpecificName, "hasPrefix:", CFSTR("J317")) & 1) != 0
        || (objc_msgSend(ModelSpecificName, "hasPrefix:", CFSTR("J318")) & 1) != 0)
      {
LABEL_58:
        v21 = 10;
        goto LABEL_19;
      }
      if ((objc_msgSend(ModelSpecificName, "hasPrefix:", CFSTR("J320")) & 1) != 0
        || (objc_msgSend(ModelSpecificName, "hasPrefix:", CFSTR("J321")) & 1) != 0)
      {
LABEL_61:
        v21 = 11;
        goto LABEL_19;
      }
      if (objc_msgSend(ModelSpecificName, "hasPrefix:", CFSTR("D79")))
        goto LABEL_63;
      if ((objc_msgSend(ModelSpecificName, "hasPrefix:", CFSTR("J417")) & 1) != 0
        || (objc_msgSend(ModelSpecificName, "hasPrefix:", CFSTR("J418")) & 1) != 0)
      {
        goto LABEL_58;
      }
      if ((objc_msgSend(ModelSpecificName, "hasPrefix:", CFSTR("J420")) & 1) != 0
        || (objc_msgSend(ModelSpecificName, "hasPrefix:", CFSTR("J421")) & 1) != 0)
      {
        goto LABEL_61;
      }
      if (objc_msgSend(ModelSpecificName, "hasPrefix:", CFSTR("D52g"))
        || objc_msgSend(ModelSpecificName, "hasPrefix:", CFSTR("D53g")))
      {
        v19 = v13 == 2;
        v20 = 22;
        goto LABEL_16;
      }
      if (objc_msgSend(ModelSpecificName, "hasPrefix:", CFSTR("D53p")))
      {
        v47 = v14 == 0;
        v43 = 24;
LABEL_84:
        if (!v47)
          ++v43;
        v44 = v13 == 2;
        v45 = 26;
        goto LABEL_53;
      }
      if (objc_msgSend(ModelSpecificName, "hasPrefix:", CFSTR("D54p")))
      {
        v47 = v14 == 0;
        v43 = 27;
        goto LABEL_84;
      }
      if ((objc_msgSend(ModelSpecificName, "hasPrefix:", CFSTR("J517")) & 1) != 0
        || (objc_msgSend(ModelSpecificName, "hasPrefix:", CFSTR("J518")) & 1) != 0)
      {
        goto LABEL_58;
      }
      if ((objc_msgSend(ModelSpecificName, "hasPrefix:", CFSTR("J522")) & 1) != 0
        || (objc_msgSend(ModelSpecificName, "hasPrefix:", CFSTR("J523")) & 1) != 0)
      {
        goto LABEL_61;
      }
      if (objc_msgSend(ModelSpecificName, "hasPrefix:", CFSTR("D16"))
        || objc_msgSend(ModelSpecificName, "hasPrefix:", CFSTR("D17")))
      {
        v19 = v13 == 2;
        v20 = 29;
LABEL_16:
        if (v19)
          v21 = v20 + 1;
        else
          v21 = v20;
        goto LABEL_19;
      }
      if (objc_msgSend(ModelSpecificName, "hasPrefix:", CFSTR("D27"))
        || objc_msgSend(ModelSpecificName, "hasPrefix:", CFSTR("D28")))
      {
        if (v13 == 2)
          v21 = 37;
        else
          v21 = 38;
        goto LABEL_19;
      }
      if (objc_msgSend(ModelSpecificName, "hasPrefix:", CFSTR("D37"))
        || objc_msgSend(ModelSpecificName, "hasPrefix:", CFSTR("D38"))
        || objc_msgSend(ModelSpecificName, "hasPrefix:", CFSTR("D47"))
        || objc_msgSend(ModelSpecificName, "hasPrefix:", CFSTR("D48")))
      {
        if (v13 == 2)
          goto LABEL_104;
        if (!v15)
        {
          v44 = v17 == 4.0;
          v43 = 35;
          v45 = 34;
LABEL_53:
          if (v44)
            v21 = v45;
          else
            v21 = v43;
          goto LABEL_19;
        }
        goto LABEL_108;
      }
      if (objc_msgSend(ModelSpecificName, "hasPrefix:", CFSTR("D63"))
        || objc_msgSend(ModelSpecificName, "hasPrefix:", CFSTR("D64")))
      {
        v43 = 31;
        if (!v14)
          v43 = 32;
        v44 = v13 == 2;
        v45 = 30;
        goto LABEL_53;
      }
      if (objc_msgSend(ModelSpecificName, "hasPrefix:", CFSTR("D73"))
        || objc_msgSend(ModelSpecificName, "hasPrefix:", CFSTR("D74")))
      {
        v43 = 34;
        if (v17 == 4.0)
          v43 = 35;
        if (!v14)
          v43 = 36;
        if (v15)
          v43 = 39;
        v44 = v13 == 2;
        v45 = 33;
        goto LABEL_53;
      }
      if (objc_msgSend(ModelSpecificName, "hasPrefix:", CFSTR("D83"))
        || objc_msgSend(ModelSpecificName, "hasPrefix:", CFSTR("D84"))
        || objc_msgSend(ModelSpecificName, "hasPrefix:", CFSTR("D93"))
        || objc_msgSend(ModelSpecificName, "hasPrefix:", CFSTR("D94")))
      {
        if (v13 == 2)
        {
LABEL_104:
          if (v15)
            v21 = 49;
          else
            v21 = 33;
LABEL_19:
          v22 = objc_msgSend(MEMORY[0x1E0CFCDA8], "videoPipelinePropertiesForDevice:", v21);
          if (v22)
          {
            v23 = (void *)v22;
            v24 = objc_msgSend(a4, "width");
            v25 = objc_msgSend(a4, "height");
            objc_msgSend(v23, "setColorPixelBufferWidth:", v24);
            objc_msgSend(v23, "setColorPixelBufferHeight:", v25);
            objc_msgSend(v23, "setAlphaMattePixelBufferWidth:", v24);
            objc_msgSend(v23, "setAlphaMattePixelBufferHeight:", v25);
            depthDataSource = self->_depthDataSource;
            switch(depthDataSource)
            {
              case 2:
                goto LABEL_23;
              case 1:
                objc_msgSend(v23, "setFocusStatisticsXTileCount:", 24);
                objc_msgSend(v23, "setFocusStatisticsYTileCount:", 19);
                -[BWFigVideoCaptureStream focalLength](-[BWFigVideoCaptureDevice captureStream](self->_captureDevice, "captureStream"), "focalLength");
                objc_msgSend(v23, "setColorPixelBufferFocalLength_mm:");
                -[BWFigVideoCaptureStream pixelSize](-[BWFigVideoCaptureDevice captureStream](self->_captureDevice, "captureStream"), "pixelSize");
                objc_msgSend(v23, "setColorPixelBufferPixelSize_um:");
                -[BWFigVideoCaptureStream lensFNumber](-[BWFigVideoCaptureDevice captureStream](self->_captureDevice, "captureStream"), "lensFNumber");
                objc_msgSend(v23, "setColorPixelBufferFocalRatio:");
                break;
              case 0:
LABEL_23:
                objc_msgSend(v23, "setInputDisparityPixelBufferWidth:", objc_msgSend(v12, "width"));
                objc_msgSend(v23, "setInputDisparityPixelBufferHeight:", objc_msgSend(v12, "height"));
                break;
            }
            if (self->_foregroundBlurEnabled)
            {
              v27 = 1751411059;
            }
            else if (self->_depthDataSource == 2)
            {
              v27 = 1717855600;
            }
            else
            {
              v27 = 825306677;
            }
            self->_requiredDisparityFormat = v27;
            objc_msgSend(v23, "setInputDisparityPixelBufferPixelFormat:");
            if (self->_foregroundBlurEnabled && v13 == 2)
              v28 = 0;
            else
              v28 = objc_msgSend(v23, "inputToOutputDisparityPixelBufferRotation");
            objc_msgSend(v23, "setInputToOutputDisparityPixelBufferRotation:", v28);
            if (v13 == 2 && v15)
            {
              objc_msgSend(v23, "setOutputDisparityPixelBufferWidth:", objc_msgSend(v12, "height"));
              objc_msgSend(v23, "setOutputDisparityPixelBufferHeight:", objc_msgSend(v12, "width"));
              objc_msgSend(v23, "setInputToOutputDisparityPixelBufferRotation:", 1);
            }
            v30 = objc_msgSend(v23, "outputDisparityPixelBufferWidth");
            v31 = objc_msgSend(v23, "outputDisparityPixelBufferHeight");

            v32 = (CVAPortraitVideoPipeline *)(id)objc_msgSend(MEMORY[0x1E0CFCDA8], "portraitVideoPipelineWithProperties:commandQueue:notificationQueue:error:", v23, self->_commandQueue, self->_notificationQueue, &v53);
            self->_portraitVideoPipeline = v32;
            if (!v32)
            {
              LODWORD(v52) = 0;
              FigDebugAssert3();
              v41 = objc_msgSend(v53, "code", v52, v5);
              if (!v41)
                return v41;
              goto LABEL_70;
            }
            v57[0] = *MEMORY[0x1E0CA90E0];
            v58[0] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLong:", v30);
            v57[1] = *MEMORY[0x1E0CA8FD8];
            v33 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLong:", v31);
            v34 = *MEMORY[0x1E0CA9040];
            v58[1] = v33;
            v58[2] = &unk_1E4A00830;
            v35 = *MEMORY[0x1E0CA8FF0];
            v57[2] = v34;
            v57[3] = v35;
            v36 = MEMORY[0x1E0C9AA70];
            v58[3] = MEMORY[0x1E0C9AA70];
            v37 = -[BWVideoFormatRequirements initWithPixelBufferAttributes:]([BWVideoFormatRequirements alloc], "initWithPixelBufferAttributes:", objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v58, v57, 4));
            v56 = v37;
            v38 = +[BWVideoFormat formatByResolvingRequirements:](BWVideoFormat, "formatByResolvingRequirements:", objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v56, 1));

            self->_postprocessedDisparityBufferPool = -[BWPixelBufferPool initWithVideoFormat:capacity:name:memoryPool:]([BWPixelBufferPool alloc], "initWithVideoFormat:capacity:name:memoryPool:", v38, 4, CFSTR("Postprocessed Disparity Pool"), +[BWMemoryPool sharedMemoryPool](BWMemoryPool, "sharedMemoryPool"));
            p_mattingBuffer = &self->_mattingBuffer;
            mattingBuffer = self->_mattingBuffer;
            if (mattingBuffer)
            {
              CFRelease(mattingBuffer);
              *p_mattingBuffer = 0;
            }
            v54 = v35;
            v55 = v36;
            CVPixelBufferCreate(0, v24, v25, 0x4C303038u, (CFDictionaryRef)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v55, &v54, 1), &self->_mattingBuffer);
            if (*p_mattingBuffer)
              return 0;
          }
LABEL_69:
          FigDebugAssert3();
          v41 = -12780;
          goto LABEL_70;
        }
        if (!v15)
        {
          v43 = 34;
          if (v17 == 4.0)
            v43 = 35;
          v44 = v14 == 0;
          v45 = 36;
          goto LABEL_53;
        }
LABEL_108:
        v21 = 48;
        goto LABEL_19;
      }
      if (objc_msgSend(ModelSpecificName, "hasPrefix:", CFSTR("D49")))
      {
LABEL_63:
        v19 = v13 == 2;
        v20 = 20;
        goto LABEL_16;
      }
      if ((objc_msgSend(ModelSpecificName, "hasPrefix:", CFSTR("J617")) & 1) != 0)
      {
        if (v13 == 2)
          goto LABEL_58;
        if ((objc_msgSend(ModelSpecificName, "hasPrefix:", CFSTR("J620")) & 1) == 0)
          objc_msgSend(ModelSpecificName, "hasPrefix:", CFSTR("J621"));
      }
      else
      {
        v48 = objc_msgSend(ModelSpecificName, "hasPrefix:", CFSTR("J618"));
        if (v13 == 2 && (v48 & 1) != 0)
          goto LABEL_58;
        if ((objc_msgSend(ModelSpecificName, "hasPrefix:", CFSTR("J620")) & 1) != 0)
        {
          if (v13 == 2)
            goto LABEL_61;
        }
        else
        {
          v49 = objc_msgSend(ModelSpecificName, "hasPrefix:", CFSTR("J621"));
          if (v13 == 2 && (v49 & 1) != 0)
            goto LABEL_61;
        }
      }
      if ((objc_msgSend(ModelSpecificName, "hasPrefix:", CFSTR("J717")) & 1) != 0)
      {
        if (v13 != 2)
        {
          if ((objc_msgSend(ModelSpecificName, "hasPrefix:", CFSTR("J720")) & 1) == 0)
            objc_msgSend(ModelSpecificName, "hasPrefix:", CFSTR("J721"));
LABEL_158:
          objc_exception_throw((id)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99768], objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Failed to find CVAVideoPipelineDevice for modelSpecificName: %@, isFrontCamera: %d, zoomFactor %f"), ModelSpecificName, v13 == 2, v17), 0));
        }
      }
      else
      {
        v50 = objc_msgSend(ModelSpecificName, "hasPrefix:", CFSTR("J718"));
        if (v13 != 2 || (v50 & 1) == 0)
        {
          if ((objc_msgSend(ModelSpecificName, "hasPrefix:", CFSTR("J720")) & 1) != 0)
          {
            if (v13 != 2)
              goto LABEL_158;
          }
          else
          {
            v51 = objc_msgSend(ModelSpecificName, "hasPrefix:", CFSTR("J721"));
            if (v13 != 2 || (v51 & 1) == 0)
              goto LABEL_158;
          }
          v21 = 47;
          goto LABEL_19;
        }
      }
      v21 = 46;
      goto LABEL_19;
    }
    return 0;
  }
  v41 = v10;
LABEL_70:

  self->_portraitVideoPipeline = 0;
  v46 = self->_mattingBuffer;
  if (v46)
  {
    CFRelease(v46);
    self->_mattingBuffer = 0;
  }
  return v41;
}

- (void)renderUsingParameters:(id)a3 inputPixelBuffer:(__CVBuffer *)a4 inputSampleBuffer:(opaqueCMSampleBuffer *)a5 originalPixelBuffer:(__CVBuffer *)a6 processedPixelBuffer:(__CVBuffer *)a7 completionHandler:(id)a8
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  const void *v12;
  const void *v13;
  __CVBuffer *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  opaqueCMSampleBuffer *AttachedMedia;
  opaqueCMSampleBuffer *v20;
  __CVBuffer *ImageBuffer;
  opaqueCMSampleBuffer *v22;
  uint64_t v23;
  opaqueCMSampleBuffer *v24;
  CGSize v25;
  const __CFDictionary *v26;
  CGFloat v27;
  CGFloat v28;
  CGFloat v29;
  CGFloat v30;
  NSObject *v31;
  int CGRectIfPresent;
  int v33;
  const void *v34;
  const void *v35;
  uint64_t v36;
  int v37;
  _BOOL4 v38;
  int v39;
  int v40;
  uint64_t v41;
  int v42;
  uint64_t v43;
  uint64_t v44;
  void *v45;
  double v46;
  double v47;
  void *v48;
  int v49;
  int v50;
  double v51;
  double v52;
  double v53;
  double v54;
  CGFloat height;
  void *v56;
  uint64_t v57;
  double v58;
  void *v59;
  double v60;
  float v61;
  float v62;
  float v63;
  void *v64;
  unsigned int v65;
  unsigned int v66;
  unsigned int v67;
  unsigned int v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  float v72;
  float v73;
  float v74;
  float v75;
  float v76;
  _BOOL4 v77;
  void *v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t i;
  const __CFDictionary *v83;
  uint64_t v84;
  const void *v85;
  void *v86;
  int v87;
  int v88;
  id v89;
  uint64_t v90;
  uint64_t v91;
  id v92;
  __int16 v93;
  __int16 v94;
  __int16 v95;
  __int16 v96;
  __int16 v97;
  __int128 v98;
  CGSize v99;
  unsigned int v100;
  unsigned int v101;
  int v102;
  double v103;
  id v104;
  uint64_t v105;
  id v106;
  double v107;
  double v108;
  double v109;
  uint64_t v110;
  int v111;
  uint64_t v112;
  uint64_t v113;
  double v114;
  float v115;
  _BOOL4 v116;
  uint64_t v117;
  uint64_t v118;
  uint64_t v119;
  double v120;
  uint64_t v121;
  double v122;
  uint64_t v123;
  CGFloat x;
  void *v125;
  id v126;
  char v127;
  float v128;
  uint64_t v129;
  uint64_t v130;
  _DWORD *v131;
  void *v132;
  uint64_t v133;
  char v134;
  NSObject *v135;
  void *v136;
  uint64_t v137;
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  uint64_t v139;
  uint64_t v140;
  uint64_t v141;
  uint64_t v142;
  uint64_t v143;
  uint64_t v144;
  uint64_t v145;
  unsigned int v146;
  unsigned int v147;
  void *v148;
  uint64_t v149;
  int v150;
  int v151;
  uint64_t v152;
  double v153;
  double v154;
  int v155;
  void *v156;
  void *v157;
  void *v158;
  uint64_t v159;
  CVImageBufferRef v160;
  double v161;
  double width;
  CFTypeRef v163;
  uint64_t v164;
  char v165;
  CFTypeRef cf;
  uint64_t v167;
  uint64_t v168;
  unint64_t v169;
  __CVBuffer *pixelBuffer;
  uint64_t v171;
  CGSize v172;
  CGPoint v173;
  void *v174;
  _QWORD v175[7];
  int v176;
  char v177;
  char v178;
  char v179;
  _QWORD v180[6];
  _QWORD v181[5];
  _QWORD v182[5];
  os_log_type_t type[8];
  double v184;
  double v185;
  __int128 v186;
  __int128 v187;
  __int128 v188;
  __int128 v189;
  int v190;
  __int128 v191;
  CGSize v192;
  _QWORD block[13];
  uint64_t v194;
  uint64_t *v195;
  uint64_t v196;
  int v197;
  uint64_t v198;
  uint64_t *v199;
  uint64_t v200;
  int v201;
  uint64_t v202;
  uint64_t *v203;
  uint64_t v204;
  int v205;
  uint64_t v206;
  uint64_t *v207;
  uint64_t v208;
  char v209;
  uint64_t v210;
  uint64_t *v211;
  uint64_t v212;
  void (*v213)(uint64_t, uint64_t);
  void (*v214)(uint64_t);
  uint64_t v215;
  uint64_t v216;
  uint64_t *v217;
  uint64_t v218;
  int v219;
  uint64_t v220;
  uint64_t *v221;
  uint64_t v222;
  void (*v223)(uint64_t, uint64_t);
  void (*v224)(uint64_t);
  uint64_t v225;
  uint64_t v226;
  uint64_t *v227;
  uint64_t v228;
  int v229;
  CGRect rect;
  _QWORD v231[6];
  CGFloat v232;
  uint64_t v233;
  const __CFString *v234;
  _BYTE v235[128];
  CGRect v236;
  double v237;
  double v238;
  double v239;
  float v240;
  _QWORD v241[4];

  v9 = MEMORY[0x1E0C80A78](self, a2, a3, a4);
  v167 = v11;
  v168 = v10;
  v13 = v12;
  pixelBuffer = v14;
  v16 = v15;
  v17 = v9;
  v241[1] = *MEMORY[0x1E0C80C00];
  v232 = 0.0;
  v231[0] = 0;
  v231[1] = v231;
  v231[2] = 0x3052000000;
  v231[3] = __Block_byref_object_copy__19;
  v231[4] = __Block_byref_object_dispose__19;
  v231[5] = v9;
  v18 = (void *)CMGetAttachment(v12, (CFStringRef)*MEMORY[0x1E0D05CB0], 0);
  AttachedMedia = (opaqueCMSampleBuffer *)BWSampleBufferGetAttachedMedia(v13, (uint64_t)CFSTR("Depth"));
  v20 = AttachedMedia;
  if (AttachedMedia)
  {
    ImageBuffer = CMSampleBufferGetImageBuffer(AttachedMedia);
    if (CVPixelBufferGetPixelFormatType(ImageBuffer) != *(_DWORD *)(v17 + 120))
    {
      BWSampleBufferRemoveAttachedMedia(v13, (uint64_t)CFSTR("Depth"));
      ImageBuffer = 0;
      v20 = 0;
    }
  }
  else
  {
    ImageBuffer = 0;
  }
  if (*(_BYTE *)(v17 + 240))
  {
    v22 = (opaqueCMSampleBuffer *)BWSampleBufferGetAttachedMedia(v13, 0x1E495AF98);
    v23 = BWSampleBufferGetAttachedMedia(v13, 0x1E495AFD8);
  }
  else
  {
    v22 = (opaqueCMSampleBuffer *)BWSampleBufferGetAttachedMedia(v13, 0x1E495AF78);
    v23 = BWSampleBufferGetAttachedMedia(v13, 0x1E495AFB8);
  }
  v24 = (opaqueCMSampleBuffer *)v23;
  if (v22)
    cf = CMSampleBufferGetImageBuffer(v22);
  else
    cf = CMGetAttachment(v13, (CFStringRef)*MEMORY[0x1E0D05D90], 0);
  if (v24)
    v160 = CMSampleBufferGetImageBuffer(v24);
  else
    v160 = 0;
  v158 = (void *)objc_msgSend(v18, "objectForKeyedSubscript:", *MEMORY[0x1E0D06A80]);
  v25 = *(CGSize *)(MEMORY[0x1E0C9D628] + 16);
  rect.origin = (CGPoint)*MEMORY[0x1E0C9D628];
  rect.size = v25;
  if (v13)
  {
    v26 = (const __CFDictionary *)CMGetAttachment(v13, (CFStringRef)*MEMORY[0x1E0D05D10], 0);
    if (v26)
    {
      CGRectMakeWithDictionaryRepresentation(v26, &rect);
      CVPixelBufferGetWidth(pixelBuffer);
      CVPixelBufferGetHeight(pixelBuffer);
      FigCaptureMetadataUtilitiesDenormalizeCropRect(rect.origin.x, rect.origin.y, rect.size.width, rect.size.height);
      rect.origin.x = v27;
      rect.origin.y = v28;
      rect.size.width = v29;
      rect.size.height = v30;
    }
  }
  v226 = 0;
  v227 = &v226;
  v228 = 0x2020000000;
  v229 = 0;
  v220 = 0;
  v221 = &v220;
  v222 = 0x3052000000;
  v223 = __Block_byref_object_copy__19;
  v224 = __Block_byref_object_dispose__19;
  v225 = 0;
  v216 = 0;
  v217 = &v216;
  v218 = 0x2020000000;
  v219 = 0;
  v210 = 0;
  v211 = &v210;
  v212 = 0x3052000000;
  v213 = __Block_byref_object_copy__19;
  v214 = __Block_byref_object_dispose__19;
  v215 = 0;
  v206 = 0;
  v207 = &v206;
  v208 = 0x2020000000;
  v209 = 0;
  v202 = 0;
  v203 = &v202;
  v204 = 0x2020000000;
  v205 = 0;
  v198 = 0;
  v199 = &v198;
  v200 = 0x2020000000;
  v201 = 2143289344;
  v194 = 0;
  v195 = &v194;
  v196 = 0x2020000000;
  v197 = 0;
  v31 = *(NSObject **)(v17 + 8);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __148__BWStreamingCVAFilterRenderer_renderUsingParameters_inputPixelBuffer_inputSampleBuffer_originalPixelBuffer_processedPixelBuffer_completionHandler___block_invoke;
  block[3] = &unk_1E49216D0;
  block[5] = &v226;
  block[4] = v17;
  block[6] = &v220;
  block[7] = &v216;
  block[8] = &v210;
  block[9] = &v194;
  block[10] = &v206;
  block[11] = &v202;
  block[12] = &v198;
  dispatch_sync(v31, block);
  v165 = objc_msgSend((id)CMGetAttachment(v13, CFSTR("StructuredLightRecentlyOccluded"), 0), "BOOLValue");
  v172 = *(CGSize *)(MEMORY[0x1E0C9D648] + 16);
  v173 = (CGPoint)*MEMORY[0x1E0C9D648];
  v191 = *MEMORY[0x1E0C9D648];
  v192 = v172;
  CGRectIfPresent = FigCFDictionaryGetCGRectIfPresent();
  HIDWORD(v171) = ImageBuffer == 0;
  if (ImageBuffer)
  {
    *(_DWORD *)(v17 + 216) = 0;
    *(_BYTE *)(v17 + 209) = 1;
    if (v22)
    {
LABEL_19:
      v33 = 0;
      *(_DWORD *)(v17 + 228) = 0;
      *(_BYTE *)(v17 + 220) = 1;
      goto LABEL_22;
    }
  }
  else
  {
    ++*(_DWORD *)(v17 + 216);
    if (v22)
      goto LABEL_19;
  }
  v33 = *(_DWORD *)(v17 + 228) + 1;
  *(_DWORD *)(v17 + 228) = v33;
LABEL_22:
  if (v33 <= *(_DWORD *)(v17 + 224))
  {
    if (cf)
    {
      v35 = *(const void **)(v17 + 128);
      if (v35)
        CFRelease(v35);
      *(_QWORD *)(v17 + 128) = CFRetain(cf);
    }
  }
  else
  {
    v34 = *(const void **)(v17 + 128);
    if (v34)
      CFRelease(v34);
    *(_QWORD *)(v17 + 128) = 0;
  }
  if (v16)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
      goto LABEL_200;
  }
  v36 = objc_msgSend(v16, "colorFilter");
  v37 = *(_DWORD *)(v17 + 136);
  if (v37 == 2)
    goto LABEL_35;
  if (v37 == 1)
  {
    if (v158)
    {
      if (!CGRectIfPresent)
      {
LABEL_207:
        v85 = 0;
        v174 = 0;
        v86 = 0;
        v84 = 0;
        v171 = 0;
        goto LABEL_204;
      }
      goto LABEL_44;
    }
LABEL_200:
    v85 = 0;
    v174 = 0;
    v86 = 0;
    v84 = 0;
    v171 = 0;
    v87 = 0;
    goto LABEL_201;
  }
  if (v37)
  {
LABEL_44:
    HIDWORD(v171) = 0;
    goto LABEL_45;
  }
LABEL_35:
  if ((v165 & 1) == 0 && *(_BYTE *)(v17 + 209))
  {
    v38 = ImageBuffer == 0;
    v40 = *(_DWORD *)(v17 + 212);
    v39 = *(_DWORD *)(v17 + 216);
    if (v39 <= v40)
      v38 = 0;
    HIDWORD(v171) = v38;
    if (v39 <= v40 && !ImageBuffer)
      goto LABEL_207;
  }
LABEL_45:
  if (v36)
  {
    v241[0] = v36;
    if (BWCIFilterArrayContainsFiltersRequiringSegmentation((void *)objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v241, 1)))
    {
      if (*(_BYTE *)(v17 + 220) && *(_DWORD *)(v17 + 228) <= *(_DWORD *)(v17 + 224))
      {
        if (!cf)
        {
          cf = *(CFTypeRef *)(v17 + 128);
          if (!cf)
          {
LABEL_203:
            v85 = 0;
            v174 = 0;
            v86 = 0;
            v84 = 0;
            LOBYTE(v171) = 0;
LABEL_204:
            v87 = 0;
            v134 = 0;
            v50 = -12780;
            goto LABEL_174;
          }
          if (dword_1EE6BE638)
          {
            LODWORD(v184) = 0;
            type[0] = OS_LOG_TYPE_DEFAULT;
            os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
            os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
            fig_log_call_emit_and_clean_up_after_send_and_compose();
          }
        }
      }
      else
      {
        HIDWORD(v171) = 1;
      }
    }
  }
  if (!v18 || !pixelBuffer || !v168)
    goto LABEL_202;
  if (!*(_QWORD *)(v17 + 96) || !*(_QWORD *)(v17 + 104))
  {
    FigDebugAssert3();
    v85 = 0;
    v174 = 0;
    v86 = 0;
    v84 = 0;
    LOBYTE(v171) = 0;
    v87 = 0;
    goto LABEL_194;
  }
  v163 = CMGetAttachment(v13, (CFStringRef)*MEMORY[0x1E0D05DD0], 0);
  v41 = objc_msgSend(v18, "objectForKeyedSubscript:", *MEMORY[0x1E0D06AA0]);
  v157 = (void *)objc_msgSend(v18, "objectForKeyedSubscript:", *MEMORY[0x1E0D06AA8]);
  v156 = (void *)objc_msgSend(v18, "objectForKeyedSubscript:", *MEMORY[0x1E0D06970]);
  v155 = objc_msgSend((id)CMGetAttachment(v13, CFSTR("SDOFFocusLocked"), 0), "intValue");
  v148 = (void *)objc_msgSend(v18, "objectForKeyedSubscript:", *MEMORY[0x1E0D08790]);
  if (objc_msgSend((id)objc_msgSend(v18, "objectForKeyedSubscript:", *MEMORY[0x1E0D067D0]), "intValue") == 4)
    v42 = *((_DWORD *)v217 + 6) + 1;
  else
    v42 = 0;
  *((_DWORD *)v217 + 6) = v42;
  v43 = objc_msgSend(*(id *)(v17 + 144), "shallowDepthOfFieldEffectStatus", v139, v143);
  v44 = v43;
  if (v43 > 0xE || ((1 << v43) & 0x6202) == 0)
    v163 = 0;
  v45 = (void *)CMGetAttachment(v13, CFSTR("BWShallowDepthOfFieldEffectPreviewStatusOverride"), 0);
  if (v45)
    v44 = objc_msgSend(v45, "intValue");
  LODWORD(v46) = *((_DWORD *)v227 + 6);
  LODWORD(v47) = *((_DWORD *)v203 + 6);
  v151 = *(_DWORD *)objc_msgSend(*(id *)(v17 + 176), "simulateNextFrameWithEffectStatus:portraitStability:clientSuppliedSimulatedAperture:", v44, v46, v47);
  v48 = (void *)objc_msgSend(v18, "objectForKeyedSubscript:", *MEMORY[0x1E0D06C40]);
  if (!v48)
    goto LABEL_202;
  objc_msgSend(v48, "floatValue");
  v150 = v49;
  v190 = 0;
  v50 = FigCaptureComputeImageGainFromMetadata();
  if (v50)
  {
    FigDebugAssert3();
    v85 = 0;
    v174 = 0;
    v86 = 0;
    v84 = 0;
    LOBYTE(v171) = 0;
    v87 = 0;
    v134 = 0;
    goto LABEL_174;
  }
  if ((objc_msgSend((id)objc_msgSend(v18, "objectForKeyedSubscript:", *MEMORY[0x1E0D06B78]), "unsignedIntValue") & 0xFFFFFFFB) != 0)
  {
    v51 = 0.0;
    v52 = 1.0;
    v161 = 0.0;
    v53 = 0.0;
    v153 = 0.0;
    v154 = 0.0;
    width = 1.0;
  }
  else
  {
    v240 = 0.0;
    v239 = 0.0;
    bzero(&v236, 0x14A0uLL);
    LODWORD(v184) = 0;
    v51 = 0.0;
    v52 = 1.0;
    if (FigMotionGetMotionDataFromISP((CFDictionaryRef)v18, (float64x2_t *)&v236, 0, 110, (int *)&v184, (float32x2_t *)&v239, 0, 0, 0))
    {
      v54 = 0.0;
      v53 = 0.0;
      height = 0.0;
      v161 = 0.0;
      width = 1.0;
    }
    else
    {
      v54 = 0.0;
      v53 = 0.0;
      height = 0.0;
      v161 = 0.0;
      width = 1.0;
      if (SLODWORD(v184) >= 1)
      {
        v51 = *((float *)&v239 + 1);
        v52 = v240;
        v161 = *(float *)&v239;
        width = v236.size.width;
        height = v236.size.height;
        v54 = v237;
        v53 = v238;
      }
    }
    v153 = height;
    v154 = v54;
  }
  v56 = (void *)objc_msgSend(v18, "objectForKeyedSubscript:", *MEMORY[0x1E0D06AD8]);
  v57 = objc_msgSend(v18, "objectForKeyedSubscript:", *MEMORY[0x1E0D06AE0]);
  v58 = 0.0;
  if (v56)
  {
    v59 = (void *)v57;
    v60 = 0.0;
    if (v57)
    {
      objc_msgSend(v56, "floatValue");
      v62 = v61;
      objc_msgSend(v59, "floatValue");
      v58 = v62;
      v60 = v63;
    }
  }
  else
  {
    v60 = 0.0;
  }
  v64 = (void *)CMGetAttachment(v20, (CFStringRef)*MEMORY[0x1E0D05C28], 0);
  objc_msgSend((id)objc_msgSend(v64, "objectForKeyedSubscript:", *MEMORY[0x1E0D063A8]), "floatValue");
  v66 = v65;
  objc_msgSend((id)objc_msgSend(v64, "objectForKeyedSubscript:", *MEMORY[0x1E0D063B0]), "floatValue");
  v68 = v67;
  if (!v16)
  {
    LODWORD(v171) = 0;
    v69 = 0;
    v71 = 0;
    v70 = 0;
    v73 = 1.0;
    goto LABEL_89;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
LABEL_202:
    FigDebugAssert3();
    goto LABEL_203;
  }
  v69 = objc_msgSend(v16, "renderingStrategy");
  v70 = objc_msgSend(v16, "foregroundColorLookupTable");
  v71 = objc_msgSend(v16, "backgroundColorLookupTable");
  if (!v71)
    v71 = objc_msgSend(v16, "foregroundColorLookupTable");
  objc_msgSend(v16, "interpolationFractionComplete");
  if (v72 >= 1.0 || (objc_msgSend(v16, "interpolationFractionComplete"), v73 = 0.0, v74 > 0.0))
  {
    objc_msgSend(v16, "interpolationFractionComplete");
    v73 = 1.0;
    if (v75 < 1.0)
    {
      objc_msgSend(v16, "interpolationFractionComplete");
      v73 = v76;
    }
  }
  v77 = v73 > 0.0;
  if (v73 >= 1.0)
    v77 = 0;
  LODWORD(v171) = v77;
LABEL_89:
  objc_msgSend(*(id *)(v17 + 144), "updatePortraitSceneMonitoringRequiresStageThresholds:", (unint64_t)(v69 - 5) < 6);
  objc_msgSend(*(id *)(v17 + 200), "removeAllObjects");
  v188 = 0u;
  v189 = 0u;
  v186 = 0u;
  v187 = 0u;
  v78 = (void *)v221[5];
  v79 = objc_msgSend(v78, "countByEnumeratingWithState:objects:count:", &v186, v235, 16);
  v149 = v71;
  v169 = v69;
  v164 = v70;
  v152 = v41;
  if (v79)
  {
    v80 = *(_QWORD *)v187;
    v81 = *MEMORY[0x1E0D06D58];
    do
    {
      for (i = 0; i != v79; ++i)
      {
        if (*(_QWORD *)v187 != v80)
          objc_enumerationMutation(v78);
        v83 = (const __CFDictionary *)objc_msgSend(*(id *)(*((_QWORD *)&v186 + 1) + 8 * i), "objectForKeyedSubscript:", v81);
        if (v83)
        {
          v236.origin = v173;
          v236.size = v172;
          if (CGRectMakeWithDictionaryRepresentation(v83, &v236))
            objc_msgSend(*(id *)(v17 + 200), "addObject:", objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithBytes:objCType:", &v236, "{CGRect={CGPoint=dd}{CGSize=dd}}"));
        }
      }
      v79 = objc_msgSend(v78, "countByEnumeratingWithState:objects:count:", &v186, v235, 16);
    }
    while (v79);
  }
  v185 = 0.0;
  if (!HIDWORD(v171))
  {
    v236.origin.x = 0.0;
    v85 = (const void *)objc_msgSend(*(id *)(v17 + 104), "newPixelBuffer");
    if (!v85)
    {
      FigDebugAssert3();
      v85 = 0;
      v174 = 0;
      v86 = 0;
      v84 = 0;
      BYTE4(v171) = 0;
      v87 = 0;
      v134 = 0;
      LOBYTE(v171) = (_DWORD)v171 != 0;
      goto LABEL_195;
    }
    v88 = *(_DWORD *)(v17 + 136);
    if (v88)
    {
      if (v88 == 1)
      {
        v91 = objc_msgSend(v158, "bytes");
        v159 = objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytesNoCopy:length:freeWhenDone:", v91 + 40, 4096, 0);
        v92 = objc_alloc(MEMORY[0x1E0CFCD98]);
        v93 = *(_WORD *)(v91 + 14);
        v94 = *(_WORD *)(v91 + 16);
        v147 = *(unsigned __int16 *)(v91 + 22);
        v95 = *(_WORD *)(v91 + 24);
        v96 = *(_WORD *)(v91 + 18);
        v97 = *(_WORD *)(v91 + 20);
        v98 = v191;
        v99 = v192;
        v146 = *(_DWORD *)(v91 + 32);
        LODWORD(v91) = objc_msgSend(v157, "intValue");
        objc_msgSend(v156, "floatValue");
        v101 = v100;
        objc_msgSend(v148, "floatValue");
        LODWORD(v103) = v102;
        BYTE4(v145) = v155 > 0;
        LODWORD(v145) = v91;
        WORD2(v144) = (int)v99.height;
        WORD1(v144) = (int)v99.width;
        LOWORD(v144) = (int)*((double *)&v98 + 1);
        HIWORD(v141) = (int)*(double *)&v98;
        WORD2(v141) = v97;
        WORD1(v141) = v96;
        LOWORD(v141) = v95;
        v174 = (void *)objc_msgSend(v92, "initWithSourceColorPixelBuffer:segmentationPixelBuffer:focusTileData:focusTileXOffset:focusTileYOffset:focusTileWidth:focusTileHeight:focusMapWidth:focusMapHeight:totalSensorCropXOffset:totalSensorCropYOffset:totalSensorCropWidth:totalSensorCropHeight:phaseToBlurFactor:destinationDisparityPixelBuffer:focusRegion:focusRegionType:currentFocusPosition:lockFocalPlane:focusDistanceToMaxAllowedFocusDistanceRatio:sourceColorPixelBufferOrientation:sourceColorPixelBufferGravity:sourceColorPixelBufferGlobalMotion:facesArray:", pixelBuffer, cf, v159, v93, v94, v147, COERCE_DOUBLE(__PAIR64__(HIDWORD(v161), v146)), COERCE_DOUBLE(__PAIR64__(HIDWORD(v52), v101)), v103, width, v153, v154,
                         v53,
                         v141,
                         v144,
                         v85,
                         v152,
                         v145,
                         *(_QWORD *)&v161,
                         *(_QWORD *)&v51,
                         *(_QWORD *)&v52,
                         *(_QWORD *)&v58,
                         *(_QWORD *)&v60,
                         0,
                         *(_QWORD *)(v17 + 200));
      }
      else if (v88 == 2)
      {
        v89 = objc_alloc(MEMORY[0x1E0CFCD98]);
        v90 = objc_msgSend(v157, "intValue");
        objc_msgSend(v156, "floatValue");
        LOBYTE(v140) = v155 > 0;
        v174 = (void *)objc_msgSend(v89, "initWithSourceColorPixelBuffer:segmentationPixelBuffer:networkDisparityPixelBuffer:destinationDisparityPixelBuffer:focusRegion:focusRegionType:currentFocusPosition:lockFocalPlane:sourceColorPixelBufferOrientation:sourceColorPixelBufferGravity:sourceColorPixelBufferGlobalMotion:facesArray:disparityNormalizationMultiplier:disparityNormalizationOffset:", pixelBuffer, cf, ImageBuffer, v85, v152, v90, v140, *(_QWORD *)&v58, *(_QWORD *)&v60, 0, *(_QWORD *)(v17 + 200), 1065353216);
      }
      else
      {
        v174 = 0;
      }
    }
    else
    {
      v104 = objc_alloc(MEMORY[0x1E0CFCD98]);
      v105 = objc_msgSend(v157, "intValue");
      objc_msgSend(v156, "floatValue");
      v174 = (void *)objc_msgSend(v104, "initWithSourceColorPixelBuffer:fixedPointDisparityPixelBuffer:destinationDisparityPixelBuffer:focusRegion:focusRegionType:currentFocusPosition:lockFocalPlane:sourceColorPixelBufferOrientation:sourceColorPixelBufferGravity:sourceColorPixelBufferGlobalMotion:facesArray:disparityNormalizationMultiplier:disparityNormalizationOffset:", pixelBuffer, ImageBuffer, v85, v152, v105, v155 > 0, *(_QWORD *)&v58, *(_QWORD *)&v60, 0, *(_QWORD *)(v17 + 200), __PAIR64__(v68, v66));
    }
    v106 = objc_alloc(MEMORY[0x1E0CFCDA0]);
    v86 = (void *)objc_msgSend(v106, "initWithDisparityPostprocessingRequest:segmentationPixelBuffer:skinSegmentationPixelBuffer:primaryCaptureRect:destinationAlphaMattePixelBuffer:error:", v174, cf, v160, *(_QWORD *)(v17 + 112), &v236, rect.origin.x, rect.origin.y, rect.size.width, rect.size.height);
    v87 = 0;
    v239 = 0.0;
    v184 = 0.0;
    *(double *)type = 0.0;
    if (v169 > 9)
    {
      v110 = v164;
      goto LABEL_133;
    }
    v110 = v164;
    if (((1 << v169) & 0x2A0) == 0)
      goto LABEL_133;
    v111 = objc_msgSend(*(id *)(v17 + 144), "shallowDepthOfFieldStagePreviewStatus");
    v87 = v111;
    if (v111 != 2)
    {
      v112 = v169;
      switch(v169)
      {
        case 5uLL:
          v113 = 6;
          goto LABEL_118;
        case 7uLL:
          v113 = 8;
LABEL_118:
          v169 = v113;
          goto LABEL_122;
        case 9uLL:
          v112 = 10;
          break;
      }
      v169 = v112;
    }
LABEL_122:
    if ((_DWORD)v171 || *((_DWORD *)v195 + 6) == v111)
    {
      objc_msgSend(*(id *)(v17 + 168), "output");
      if (v107 <= 0.0)
        goto LABEL_133;
      objc_msgSend(*(id *)(v17 + 168), "output");
      HIDWORD(v108) = 1072651305;
      if (v107 >= 0.980000019)
        goto LABEL_133;
    }
    else
    {
      objc_msgSend(*(id *)(v17 + 168), "resetWithInput:initialOutput:initialVelocity:", 1.0, 0.0, 0.0);
    }
    objc_msgSend(*(id *)(v17 + 168), "update");
    objc_msgSend(*(id *)(v17 + 168), "output");
    v115 = v114;
    if (v115 > 0.98)
      v115 = 0.0;
    HIDWORD(v108) = 0;
    v107 = fmax(fmin(v115, 1.0), 0.0);
    v73 = v107;
    v116 = v73 > 0.0;
    if (v73 >= 1.0)
      v116 = 0;
    LODWORD(v171) = v116;
LABEL_133:
    if (v169 > 0xA)
    {
      v118 = 0;
    }
    else
    {
      if (((1 << v169) & 0x55F) != 0)
      {
        LODWORD(v108) = v190;
        LODWORD(v109) = v150;
        LODWORD(v107) = v151;
        v117 = objc_msgSend(MEMORY[0x1E0CFCDA8], "syntheticDepthOfFieldBackgroundRequestWithMattingRequest:simulatedFocalRatio:sourceColorGain:sourceColorLux:metadata:primaryCaptureRect:error:", v86, v18, &v239, v107, v108, v109, rect.origin.x, rect.origin.y, rect.size.width, rect.size.height);
      }
      else
      {
        v117 = objc_msgSend(MEMORY[0x1E0CFCDA8], "opaqueBackgroundRequestWithMattingRequest:error:", v86, &v239);
      }
      v118 = v117;
    }
    v119 = 0;
    if (v169 <= 9)
    {
      if (((1 << v169) & 0xA8) != 0)
      {
        if ((objc_opt_respondsToSelector() & 1) != 0)
        {
          LODWORD(v120) = *((_DWORD *)v199 + 6);
          v121 = objc_msgSend(MEMORY[0x1E0CFCDA8], "contourLightRequestWithFace:relightStyleStrength:error:", v163, &v184, v120);
        }
        else
        {
          v121 = objc_msgSend(MEMORY[0x1E0CFCDA8], "contourLightRequestWithFace:error:", v163, &v184);
        }
      }
      else
      {
        if (((1 << v169) & 0x202) == 0)
          goto LABEL_148;
        if ((objc_opt_respondsToSelector() & 1) != 0)
        {
          LODWORD(v122) = *((_DWORD *)v199 + 6);
          v121 = objc_msgSend(MEMORY[0x1E0CFCDA8], "studioLightRequestWithFace:relightStyleStrength:error:", v163, &v184, v122);
        }
        else
        {
          v121 = objc_msgSend(MEMORY[0x1E0CFCDA8], "studioLightRequestWithFace:error:", v163, &v184);
        }
      }
      v119 = v121;
    }
LABEL_148:
    v123 = 0;
    if (v169 > 0xA)
      goto LABEL_154;
    if (((1 << v169) & 0x555) != 0)
    {
      v123 = v149;
      if (!(v149 | v110))
      {
        v123 = 0;
        goto LABEL_154;
      }
    }
    else if (((1 << v169) & 0x280) == 0)
    {
      goto LABEL_154;
    }
    v123 = objc_msgSend(MEMORY[0x1E0CFCDA8], "colorCubeRequestWithBackgroundCube:foregroundCube:error:", v123, v110, type);
LABEL_154:
    x = v236.origin.x;
    if (!*(_QWORD *)&v236.origin.x)
    {
      x = v239;
      if (v239 == 0.0)
      {
        x = v184;
        if (v184 == 0.0)
        {
          x = *(double *)type;
          if (*(double *)type == 0.0)
          {
            v125 = (void *)objc_msgSend(MEMORY[0x1E0CFCDA8], "portraitRequestWithBackground:light:post:error:", v118, v119, v123, &v185);
            v84 = (uint64_t)v125;
            if (v125 && !v211[5])
            {
              v126 = v125;
              v211[5] = (uint64_t)v126;
            }
            if ((_DWORD)v171)
              objc_msgSend(MEMORY[0x1E0CFCDB0], "updateRequestWithLiveData:mattingRequest:faceKitProcessOutput:error:", v211[5], v86, v163, 0);
            goto LABEL_163;
          }
        }
      }
    }
    v232 = x;
    v84 = 0;
    BYTE4(v171) = 0;
LABEL_201:
    v134 = 0;
    v50 = 0;
    goto LABEL_174;
  }
  if (!v164)
  {
    v85 = 0;
    v174 = 0;
    v86 = 0;
    v84 = 0;
    v87 = 0;
    v134 = 0;
    v50 = 0;
    BYTE4(v171) = 1;
    LOBYTE(v171) = (_DWORD)v171 != 0;
    goto LABEL_174;
  }
  v84 = objc_msgSend(MEMORY[0x1E0CFCDA8], "colorCubePortraitGenericRequestForPortraitVideoPipeline:sourceColorPixelBuffer:cubeData:error:", *(_QWORD *)(v17 + 96), pixelBuffer, v164, &v185);
  v85 = 0;
  v174 = 0;
  v86 = 0;
  v87 = 0;
LABEL_163:
  if (v185 != 0.0)
  {
    v134 = 0;
    v50 = 0;
    v232 = v185;
    goto LABEL_174;
  }
  v127 = BYTE4(v171);
  if (!(_DWORD)v171)
    v127 = 1;
  v128 = 0.0;
  if ((v127 & 1) != 0 || *((_BYTE *)v207 + 24))
  {
    v129 = 0;
    v130 = v84;
    if (v84)
      goto LABEL_169;
    goto LABEL_184;
  }
  v130 = v211[5];
  v129 = v84;
  v128 = v73;
  if (!v130)
  {
LABEL_184:
    FigDebugAssert3();
LABEL_194:
    v134 = 0;
LABEL_195:
    v50 = -12786;
    goto LABEL_174;
  }
LABEL_169:
  v131 = (_DWORD *)MEMORY[0x1E0CA1FC0];
  if (*MEMORY[0x1E0CA1FC0] == 1)
  {
    kdebug_trace();
    if (*v131 == 1)
      kdebug_trace();
  }
  v132 = *(void **)(v17 + 96);
  v133 = objc_msgSend(*(id *)(v17 + 144), "portraitSceneMonitorUsesDisparityStatistics");
  v182[1] = 3221225472;
  v182[2] = __148__BWStreamingCVAFilterRenderer_renderUsingParameters_inputPixelBuffer_inputSampleBuffer_originalPixelBuffer_processedPixelBuffer_completionHandler___block_invoke_59;
  v182[3] = &unk_1E49216F8;
  v182[4] = v231;
  v180[5] = v231;
  v181[0] = MEMORY[0x1E0C809B0];
  v181[1] = 3221225472;
  v181[2] = __148__BWStreamingCVAFilterRenderer_renderUsingParameters_inputPixelBuffer_inputSampleBuffer_originalPixelBuffer_processedPixelBuffer_completionHandler___block_invoke_2;
  v181[3] = &unk_1E4921720;
  v181[4] = v231;
  v182[0] = MEMORY[0x1E0C809B0];
  v180[0] = MEMORY[0x1E0C809B0];
  v180[1] = 3221225472;
  v180[2] = __148__BWStreamingCVAFilterRenderer_renderUsingParameters_inputPixelBuffer_inputSampleBuffer_originalPixelBuffer_processedPixelBuffer_completionHandler___block_invoke_3;
  v180[3] = &unk_1E4921748;
  v180[4] = v167;
  if (objc_msgSend(v132, "renderWithRequest:requestTo:mixValue:destinationColorPixelBuffer:error:sceneMonitorUsesDisparityStatistics:disparityPostprocessingCompletionHandler:mattingCompletionHandler:portraitCompletionHandler:", v130, v129, v168, &v232, v133, v182, COERCE_DOUBLE((unint64_t)LODWORD(v128)), v181, v180))
  {
    LODWORD(v142) = 0;
    FigDebugAssert3();
    v134 = 0;
    v50 = objc_msgSend(*(id *)&v232, "code", v142, v8);
  }
  else
  {
    v50 = 0;
    v134 = 1;
  }
LABEL_174:
  v135 = *(NSObject **)(v17 + 8);
  v175[0] = MEMORY[0x1E0C809B0];
  v175[1] = 3221225472;
  v175[2] = __148__BWStreamingCVAFilterRenderer_renderUsingParameters_inputPixelBuffer_inputSampleBuffer_originalPixelBuffer_processedPixelBuffer_completionHandler___block_invoke_4;
  v175[3] = &unk_1E4921770;
  v177 = v165;
  v175[5] = v84;
  v175[6] = &v216;
  v176 = v87;
  v178 = v171;
  v175[4] = v17;
  v179 = BYTE4(v171);
  dispatch_sync(v135, v175);
  if ((v134 & 1) == 0)
  {
    if (v232 == 0.0 && v50)
    {
      v136 = (void *)MEMORY[0x1E0CB35C8];
      v233 = *MEMORY[0x1E0CB2D50];
      v234 = CFSTR("Streaming CVA rendering failure");
      v137 = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v234, &v233, 1);
      v232 = COERCE_DOUBLE(objc_msgSend(v136, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2F90], v50, v137));
    }
    if (v167)
      (*(void (**)(uint64_t, _QWORD))(v167 + 16))(v167, 0);
  }
  if (v85)
    CFRelease(v85);

  _Block_object_dispose(&v194, 8);
  _Block_object_dispose(&v198, 8);
  _Block_object_dispose(&v202, 8);
  _Block_object_dispose(&v206, 8);
  _Block_object_dispose(&v210, 8);
  _Block_object_dispose(&v216, 8);
  _Block_object_dispose(&v220, 8);
  _Block_object_dispose(&v226, 8);
  _Block_object_dispose(v231, 8);
}

float __148__BWStreamingCVAFilterRenderer_renderUsingParameters_inputPixelBuffer_inputSampleBuffer_originalPixelBuffer_processedPixelBuffer_completionHandler___block_invoke(_QWORD *a1)
{
  float result;

  *(_DWORD *)(*(_QWORD *)(a1[5] + 8) + 24) = *(_DWORD *)(a1[4] + 48);
  *(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 40) = *(id *)(a1[4] + 72);
  *(_DWORD *)(*(_QWORD *)(a1[7] + 8) + 24) = *(_DWORD *)(a1[4] + 52);
  *(_QWORD *)(*(_QWORD *)(a1[8] + 8) + 40) = *(id *)(a1[4] + 80);
  *(_DWORD *)(*(_QWORD *)(a1[9] + 8) + 24) = *(_DWORD *)(a1[4] + 88);
  *(_BYTE *)(*(_QWORD *)(a1[10] + 8) + 24) = *(_BYTE *)(a1[4] + 65);
  *(_DWORD *)(*(_QWORD *)(a1[11] + 8) + 24) = *(_DWORD *)(a1[4] + 56);
  result = *(float *)(a1[4] + 60);
  *(float *)(*(_QWORD *)(a1[12] + 8) + 24) = result;
  return result;
}

void __148__BWStreamingCVAFilterRenderer_renderUsingParameters_inputPixelBuffer_inputSampleBuffer_originalPixelBuffer_processedPixelBuffer_completionHandler___block_invoke_59(uint64_t a1, uint64_t a2, void *a3)
{
  -[BWStreamingCVAFilterRenderer disparityPostprocessingRequest:didCompleteDisparityPostprocessingWithResult:](*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2, a3);
}

- (void)disparityPostprocessingRequest:(void *)a3 didCompleteDisparityPostprocessingWithResult:
{
  _DWORD *v5;
  NSObject *v6;
  int v7;
  int v8;
  void *v9;
  int v10;
  int v11;
  int v12;
  int v13;
  int v14;
  int v15;
  uint64_t v16;
  int v17;
  int v18;
  int v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  _QWORD v26[8];
  uint64_t v27;
  uint64_t *v28;
  uint64_t v29;
  void (*v30)(uint64_t, uint64_t);
  void (*v31)(uint64_t);
  uint64_t v32;
  uint64_t v33;
  uint64_t *v34;
  uint64_t v35;
  char v36;

  if (a1)
  {
    v5 = (_DWORD *)MEMORY[0x1E0CA1FC0];
    if (*MEMORY[0x1E0CA1FC0] == 1)
    {
      objc_msgSend(a3, "postprocessedDisparityPixelBuffer");
      kdebug_trace();
      if (*v5 == 1)
      {
        objc_msgSend(a3, "postprocessedDisparityPixelBuffer");
        kdebug_trace();
      }
    }
    v33 = 0;
    v34 = &v33;
    v35 = 0x2020000000;
    v36 = 0;
    v27 = 0;
    v28 = &v27;
    v29 = 0x3052000000;
    v30 = __Block_byref_object_copy__19;
    v31 = __Block_byref_object_dispose__19;
    v32 = MEMORY[0x1E0C9AA60];
    v6 = *(NSObject **)(a1 + 8);
    v26[0] = MEMORY[0x1E0C809B0];
    v26[1] = 3221225472;
    v26[2] = __108__BWStreamingCVAFilterRenderer_disparityPostprocessingRequest_didCompleteDisparityPostprocessingWithResult___block_invoke;
    v26[3] = &unk_1E49217E8;
    v26[4] = a1;
    v26[5] = a3;
    v26[6] = &v33;
    v26[7] = &v27;
    dispatch_sync(v6, v26);
    objc_msgSend(a3, "personSegmentationRatio");
    v8 = v7;
    v9 = *(void **)(a1 + 144);
    objc_msgSend(a3, "backgroundDisparitySum");
    v11 = v10;
    objc_msgSend(a3, "invalidDisparityRatio");
    v13 = v12;
    objc_msgSend(a3, "closeCanonicalDisparityAverage");
    v15 = v14;
    v16 = objc_msgSend(a3, "faceCanonicalDisparityAverage");
    objc_msgSend(a3, "erodedForegroundRatio");
    v18 = v17;
    objc_msgSend(a3, "foregroundRatio");
    LODWORD(v20) = v19;
    LODWORD(v21) = v11;
    LODWORD(v22) = v13;
    LODWORD(v23) = v15;
    LODWORD(v24) = v18;
    LODWORD(v25) = v8;
    objc_msgSend(v9, "updateSDOFBackgroundShiftSum:invalidShiftRatio:closeCanonicalDisparityAverage:faceCanonicalDisparityAverages:erodedForegroundRatio:foregroundRatio:occluded:faces:personSegmentationRatio:", v16, *((unsigned __int8 *)v34 + 24), v28[5], v21, v22, v23, v24, v20, v25);

    _Block_object_dispose(&v27, 8);
    _Block_object_dispose(&v33, 8);
  }
}

uint64_t __148__BWStreamingCVAFilterRenderer_renderUsingParameters_inputPixelBuffer_inputSampleBuffer_originalPixelBuffer_processedPixelBuffer_completionHandler___block_invoke_2(uint64_t a1)
{
  return -[BWStreamingCVAFilterRenderer mattingRequest:didCompleteMattingWithResult:](*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8)
                                                                                                + 40));
}

- (uint64_t)mattingRequest:(uint64_t)result didCompleteMattingWithResult:
{
  _DWORD *v1;

  if (result)
  {
    v1 = (_DWORD *)MEMORY[0x1E0CA1FC0];
    if (*MEMORY[0x1E0CA1FC0] == 1)
    {
      result = kdebug_trace();
      if (*v1 == 1)
        return kdebug_trace();
    }
  }
  return result;
}

void __148__BWStreamingCVAFilterRenderer_renderUsingParameters_inputPixelBuffer_inputSampleBuffer_originalPixelBuffer_processedPixelBuffer_completionHandler___block_invoke_3(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  -[BWStreamingCVAFilterRenderer portraitRequest:didCompletePortraitWithResult:completionHandler:](*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2, a4, *(_QWORD *)(a1 + 32));
}

- (void)portraitRequest:(void *)a3 didCompletePortraitWithResult:(uint64_t)a4 completionHandler:
{
  _DWORD *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  NSObject *v11;
  _QWORD block[6];
  uint64_t v13;
  _QWORD v14[2];

  v14[1] = *MEMORY[0x1E0C80C00];
  if (a1)
  {
    v7 = (_DWORD *)MEMORY[0x1E0CA1FC0];
    if (*MEMORY[0x1E0CA1FC0] == 1)
    {
      kdebug_trace();
      if (*v7 == 1)
        kdebug_trace();
    }
    if (objc_msgSend(a3, "portraitPixelBuffer"))
    {
      v8 = 0;
      v9 = 2;
    }
    else
    {
      v10 = *MEMORY[0x1E0CB2F90];
      v13 = *MEMORY[0x1E0CB2D50];
      v14[0] = CFSTR("Portrait rendering request provided no result");
      v8 = objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", v10, -12780, objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v14, &v13, 1));
      v9 = 0;
    }
    v11 = *(NSObject **)(a1 + 8);
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __96__BWStreamingCVAFilterRenderer_portraitRequest_didCompletePortraitWithResult_completionHandler___block_invoke;
    block[3] = &unk_1E491E748;
    block[4] = a1;
    block[5] = a3;
    dispatch_sync(v11, block);
    if (a4)
      (*(void (**)(uint64_t, uint64_t, uint64_t))(a4 + 16))(a4, v9, v8);
  }
}

id __148__BWStreamingCVAFilterRenderer_renderUsingParameters_inputPixelBuffer_inputSampleBuffer_originalPixelBuffer_processedPixelBuffer_completionHandler___block_invoke_4(uint64_t a1)
{
  id result;

  result = (id)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 176), "isDepthAvailable");
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 24) = (_BYTE)result;
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 64) = *(_BYTE *)(a1 + 60);
  *(_DWORD *)(*(_QWORD *)(a1 + 32) + 52) = *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24);
  *(_DWORD *)(*(_QWORD *)(a1 + 32) + 88) = *(_DWORD *)(a1 + 56);
  if (!*(_BYTE *)(a1 + 61))
  {

    result = *(id *)(a1 + 40);
    *(_QWORD *)(*(_QWORD *)(a1 + 32) + 80) = result;
    *(_BYTE *)(*(_QWORD *)(a1 + 32) + 65) = *(_BYTE *)(a1 + 62);
  }
  return result;
}

- (BOOL)supportsAnimation
{
  return 1;
}

- (BOOL)adjustsMetadata
{
  return 1;
}

- (void)adjustMetadataOfSampleBuffer:(opaqueCMSampleBuffer *)a3
{
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  NSObject *sharedContextQueue;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  uint64_t v15;
  const void *v16;
  uint64_t v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _QWORD v22[11];
  _QWORD block[11];
  _QWORD v24[3];
  int rotationDegreesForMetadataAdjustment;
  _QWORD v26[3];
  BOOL mirroredForMetadataAdjustment;
  _QWORD v28[3];
  char v29;
  _QWORD v30[3];
  int v31;
  _QWORD v32[3];
  int v33;
  uint64_t v34;
  uint64_t *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t *v39;
  uint64_t v40;
  char v41;
  _BYTE v42[128];
  uint64_t v43;

  v43 = *MEMORY[0x1E0C80C00];
  v4 = (void *)CMGetAttachment(a3, (CFStringRef)*MEMORY[0x1E0D05CB0], 0);
  v17 = *MEMORY[0x1E0D069A0];
  v5 = (void *)objc_msgSend(v4, "objectForKeyedSubscript:");
  v6 = (void *)objc_msgSend(v5, "objectForKeyedSubscript:", *MEMORY[0x1E0D064A0]);
  v7 = *MEMORY[0x1E0D064D0];
  v8 = (void *)objc_msgSend(v6, "objectForKeyedSubscript:", *MEMORY[0x1E0D064D0]);
  if (!v8)
    v8 = (void *)objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x1E0D06998]);
  v38 = 0;
  v39 = &v38;
  v40 = 0x2020000000;
  v41 = 0;
  v34 = 0;
  v35 = &v34;
  v36 = 0x2020000000;
  v37 = 0;
  v32[0] = 0;
  v32[1] = v32;
  v32[2] = 0x2020000000;
  v33 = 0;
  v30[0] = 0;
  v30[1] = v30;
  v30[2] = 0x2020000000;
  v31 = 0;
  v28[0] = 0;
  v28[1] = v28;
  v28[2] = 0x2020000000;
  v29 = 0;
  v26[0] = 0;
  v26[1] = v26;
  v26[2] = 0x2020000000;
  mirroredForMetadataAdjustment = self->_mirroredForMetadataAdjustment;
  v24[0] = 0;
  v24[1] = v24;
  v24[2] = 0x2020000000;
  rotationDegreesForMetadataAdjustment = self->_rotationDegreesForMetadataAdjustment;
  -[BWStreamingCVAFilterRenderer _removeFaceVisibilityForFacesMissingFromDetectedFaces:]((uint64_t)self, v8);
  v9 = MEMORY[0x1E0C809B0];
  sharedContextQueue = self->_sharedContextQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __61__BWStreamingCVAFilterRenderer_adjustMetadataOfSampleBuffer___block_invoke;
  block[3] = &unk_1E4921798;
  block[6] = &v38;
  block[7] = &v34;
  block[8] = v32;
  block[9] = v30;
  block[10] = v28;
  block[4] = self;
  block[5] = v8;
  dispatch_sync(sharedContextQueue, block);
  if (objc_msgSend(v8, "count"))
  {
    if (*((_BYTE *)v39 + 24))
    {
      if (v35[3])
      {
        v22[0] = v9;
        v22[1] = 3221225472;
        v22[2] = __61__BWStreamingCVAFilterRenderer_adjustMetadataOfSampleBuffer___block_invoke_2;
        v22[3] = &unk_1E49217C0;
        v22[4] = self;
        v22[5] = v28;
        v22[6] = v32;
        v22[7] = v30;
        v22[8] = &v34;
        v22[9] = v26;
        v22[10] = v24;
        v11 = objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithBlock:", v22);
        if (!CVPixelBufferLockBaseAddress((CVPixelBufferRef)v35[3], 1uLL))
        {
          if (v5)
          {
            v20 = 0u;
            v21 = 0u;
            v18 = 0u;
            v19 = 0u;
            v12 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v18, v42, 16);
            if (v12)
            {
              v13 = *(_QWORD *)v19;
              do
              {
                for (i = 0; i != v12; ++i)
                {
                  if (*(_QWORD *)v19 != v13)
                    objc_enumerationMutation(v5);
                  objc_msgSend((id)objc_msgSend(v5, "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * i)), "setObject:forKeyedSubscript:", objc_msgSend((id)objc_msgSend((id)objc_msgSend(v5, "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * i)), "objectForKeyedSubscript:", v7), "filteredArrayUsingPredicate:", v11), v7);
                }
                v12 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v18, v42, 16);
              }
              while (v12);
            }
            objc_msgSend(v4, "setObject:forKeyedSubscript:", v5, v17);
          }
          else
          {
            v15 = objc_msgSend(v8, "filteredArrayUsingPredicate:", v11);
            objc_msgSend(v4, "setObject:forKeyedSubscript:", v15, *MEMORY[0x1E0D06998]);
          }
          CVPixelBufferUnlockBaseAddress((CVPixelBufferRef)v35[3], 1uLL);
        }
      }
    }
  }
  v16 = (const void *)v35[3];
  if (v16)
    CFRelease(v16);
  _Block_object_dispose(v24, 8);
  _Block_object_dispose(v26, 8);
  _Block_object_dispose(v28, 8);
  _Block_object_dispose(v30, 8);
  _Block_object_dispose(v32, 8);
  _Block_object_dispose(&v34, 8);
  _Block_object_dispose(&v38, 8);
}

- (void)_removeFaceVisibilityForFacesMissingFromDetectedFaces:(uint64_t)a1
{
  os_unfair_lock_s *v4;
  void *DeepCopy;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  os_unfair_lock_s *lock;
  uint64_t v17;
  void *v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  if (a1 && a2)
  {
    v4 = (os_unfair_lock_s *)(a1 + 192);
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 192));
    v17 = a1;
    DeepCopy = (void *)CFPropertyListCreateDeepCopy((CFAllocatorRef)*MEMORY[0x1E0C9AE00], (CFPropertyListRef)objc_msgSend(*(id *)(a1 + 184), "allKeys"), 0);
    lock = v4;
    os_unfair_lock_unlock(v4);
    v18 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v23 = 0u;
    v24 = 0u;
    v25 = 0u;
    v26 = 0u;
    v6 = objc_msgSend(DeepCopy, "countByEnumeratingWithState:objects:count:", &v23, v28, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v24;
      v9 = *MEMORY[0x1E0D06A48];
      do
      {
        v10 = 0;
        do
        {
          if (*(_QWORD *)v24 != v8)
            objc_enumerationMutation(DeepCopy);
          v11 = *(_QWORD *)(*((_QWORD *)&v23 + 1) + 8 * v10);
          v19 = 0u;
          v20 = 0u;
          v21 = 0u;
          v22 = 0u;
          v12 = objc_msgSend(a2, "countByEnumeratingWithState:objects:count:", &v19, v27, 16);
          if (v12)
          {
            v13 = v12;
            v14 = *(_QWORD *)v20;
LABEL_10:
            v15 = 0;
            while (1)
            {
              if (*(_QWORD *)v20 != v14)
                objc_enumerationMutation(a2);
              if ((objc_msgSend((id)objc_msgSend(*(id *)(*((_QWORD *)&v19 + 1) + 8 * v15), "objectForKeyedSubscript:", v9), "isEqualToNumber:", v11) & 1) != 0)break;
              if (v13 == ++v15)
              {
                v13 = objc_msgSend(a2, "countByEnumeratingWithState:objects:count:", &v19, v27, 16);
                if (v13)
                  goto LABEL_10;
                goto LABEL_16;
              }
            }
          }
          else
          {
LABEL_16:
            objc_msgSend(v18, "addObject:", v11);
          }
          ++v10;
        }
        while (v10 != v7);
        v7 = objc_msgSend(DeepCopy, "countByEnumeratingWithState:objects:count:", &v23, v28, 16);
      }
      while (v7);
    }

    os_unfair_lock_lock(lock);
    objc_msgSend(*(id *)(v17 + 184), "removeObjectsForKeys:", v18);
    os_unfair_lock_unlock(lock);
  }
}

id __61__BWStreamingCVAFilterRenderer_adjustMetadataOfSampleBuffer___block_invoke(uint64_t a1)
{
  CFTypeRef v2;
  uint64_t v3;
  id result;

  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = *(_BYTE *)(*(_QWORD *)(a1 + 32) + 24);
  v2 = *(CFTypeRef *)(*(_QWORD *)(a1 + 32) + 32);
  if (v2)
    v2 = CFRetain(v2);
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = v2;
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) = *(_DWORD *)(*(_QWORD *)(a1 + 32) + 40);
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24) = *(_DWORD *)(*(_QWORD *)(a1 + 32) + 44);
  v3 = *(_QWORD *)(a1 + 32);
  if (*(_DWORD *)(v3 + 136) == 1)
  {
    *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24) = 1048576000;
    v3 = *(_QWORD *)(a1 + 32);
  }
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 24) = *(_DWORD *)(v3 + 52) > 2;

  result = *(id *)(a1 + 40);
  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 72) = result;
  return result;
}

uint64_t __61__BWStreamingCVAFilterRenderer_adjustMetadataOfSampleBuffer___block_invoke_2(_QWORD *a1, void *a2)
{
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  int v14;
  float v15;
  uint64_t v21;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  CGFloat v32[3];
  __int16 v33;
  __int128 v34;
  CGFloat v35[3];
  __int16 v36;
  __int128 v37;
  CGFloat v38[3];
  __int16 v39;

  v4 = objc_msgSend(a2, "objectForKeyedSubscript:", *MEMORY[0x1E0D06460]);
  v5 = v4;
  if (v4 || (v5 = objc_msgSend(a2, "objectForKeyedSubscript:", *MEMORY[0x1E0D06A48])) != 0)
  {
    v6 = (void *)objc_msgSend(*(id *)(a1[4] + 184), "objectForKeyedSubscript:", v5);
    v7 = v6;
    if (!*(_BYTE *)(*(_QWORD *)(a1[5] + 8) + 24))
      return objc_msgSend(v6, "BOOLValue");
    _S0 = *(float *)(*(_QWORD *)(a1[6] + 8) + 24) - *(float *)(*(_QWORD *)(a1[7] + 8) + 24);
    __asm { FCVT            H8, S0 }
    if (v6)
    {
      v14 = objc_msgSend(v6, "BOOLValue");
      v15 = 0.049988;
      if (v14)
        v15 = -0.049988;
      __asm { FCVT            S1, H8 }
      _S0 = v15 + _S1;
      __asm { FCVT            H8, S0 }
    }
    v39 = 0;
    v29 = *MEMORY[0x1E0C9D648];
    v30 = *(_OWORD *)(MEMORY[0x1E0C9D648] + 16);
    v37 = *MEMORY[0x1E0C9D648];
    *(_OWORD *)v38 = v30;
    if (!FigCFDictionaryGetCGRectIfPresent())
    {
      if (v4)
      {
LABEL_27:
        v21 = 1;
        goto LABEL_30;
      }
      v36 = 0;
      v34 = v29;
      *(_OWORD *)v35 = v30;
LABEL_17:
      if (!FigCFDictionaryGetCGRectIfPresent())
      {
        v33 = 0;
        v31 = v29;
        *(_OWORD *)v32 = v30;
        goto LABEL_24;
      }
      if (scfr_averageForegroundDisparityForRect(*(__CVBuffer **)(*(_QWORD *)(a1[8] + 8) + 24), &v36, *(unsigned __int8 *)(*(_QWORD *)(a1[9] + 8) + 24), *(_DWORD *)(*(_QWORD *)(a1[10] + 8) + 24), *(CGFloat *)&v34, *((CGFloat *)&v34 + 1), v35[0], v35[1]))
      {
        _H0 = v36;
        __asm
        {
          FCVT            S1, H8
          FCVT            S0, H0
        }
        v33 = 0;
        v31 = v29;
        *(_OWORD *)v32 = v30;
        if (_S0 <= _S1)
          goto LABEL_28;
        goto LABEL_24;
      }
      v33 = 0;
      v31 = v29;
      *(_OWORD *)v32 = v30;
      if (objc_msgSend(v7, "BOOLValue"))
      {
LABEL_24:
        if (FigCFDictionaryGetCGRectIfPresent())
        {
          if (scfr_averageForegroundDisparityForRect(*(__CVBuffer **)(*(_QWORD *)(a1[8] + 8) + 24), &v33, *(unsigned __int8 *)(*(_QWORD *)(a1[9] + 8) + 24), *(_DWORD *)(*(_QWORD *)(a1[10] + 8) + 24), *(CGFloat *)&v31, *((CGFloat *)&v31 + 1), v32[0], v32[1]))
          {
            _H0 = v33;
            __asm
            {
              FCVT            S1, H8
              FCVT            S0, H0
            }
            v21 = _S0 > _S1;
          }
          else
          {
            v21 = objc_msgSend(v7, "BOOLValue");
          }
          goto LABEL_30;
        }
        goto LABEL_27;
      }
LABEL_28:
      v21 = 0;
      goto LABEL_30;
    }
    if (scfr_averageForegroundDisparityForRect(*(__CVBuffer **)(*(_QWORD *)(a1[8] + 8) + 24), &v39, *(unsigned __int8 *)(*(_QWORD *)(a1[9] + 8) + 24), *(_DWORD *)(*(_QWORD *)(a1[10] + 8) + 24), *(CGFloat *)&v37, *((CGFloat *)&v37 + 1), v38[0], v38[1]))
    {
      _H0 = v39;
      __asm
      {
        FCVT            S1, H8
        FCVT            S0, H0
      }
      v21 = _S0 > _S1;
      if (!v4)
      {
LABEL_16:
        v36 = 0;
        v34 = v29;
        *(_OWORD *)v35 = v30;
        if ((v21 & 1) == 0)
          goto LABEL_28;
        goto LABEL_17;
      }
    }
    else
    {
      v21 = objc_msgSend(v7, "BOOLValue");
      if (!v4)
        goto LABEL_16;
    }
LABEL_30:
    os_unfair_lock_lock((os_unfair_lock_t)(a1[4] + 192));
    objc_msgSend(*(id *)(a1[4] + 184), "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v21), v5);
    os_unfair_lock_unlock((os_unfair_lock_t)(a1[4] + 192));
    return v21;
  }
  return 1;
}

id __108__BWStreamingCVAFilterRenderer_disparityPostprocessingRequest_didCompleteDisparityPostprocessingWithResult___block_invoke(uint64_t a1)
{
  const void *v2;
  CFTypeRef v3;
  int v4;
  int v5;
  id result;

  v2 = *(const void **)(*(_QWORD *)(a1 + 32) + 32);
  if (v2)
  {
    CFRelease(v2);
    *(_QWORD *)(*(_QWORD *)(a1 + 32) + 32) = 0;
  }
  v3 = (CFTypeRef)objc_msgSend(*(id *)(a1 + 40), "postprocessedDisparityPixelBuffer");
  if (v3)
    v3 = CFRetain(v3);
  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 32) = v3;
  objc_msgSend(*(id *)(a1 + 40), "focusDisparity");
  *(_DWORD *)(*(_QWORD *)(a1 + 32) + 40) = v4;
  objc_msgSend(*(id *)(a1 + 40), "deltaCanonicalDisparity");
  *(_DWORD *)(*(_QWORD *)(a1 + 32) + 44) = v5;
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = *(_BYTE *)(*(_QWORD *)(a1 + 32) + 64);
  result = *(id *)(*(_QWORD *)(a1 + 32) + 72);
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40) = result;
  return result;
}

uint64_t __96__BWStreamingCVAFilterRenderer_portraitRequest_didCompletePortraitWithResult_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t result;
  int v3;

  result = objc_msgSend(*(id *)(a1 + 40), "portraitStability");
  *(_DWORD *)(*(_QWORD *)(a1 + 32) + 48) = v3;
  return result;
}

- (BOOL)studioAndContourRenderingEnabled
{
  return self->_studioAndContourRenderingEnabled;
}

- (BOOL)stageRenderingEnabled
{
  return self->_stageRenderingEnabled;
}

@end
