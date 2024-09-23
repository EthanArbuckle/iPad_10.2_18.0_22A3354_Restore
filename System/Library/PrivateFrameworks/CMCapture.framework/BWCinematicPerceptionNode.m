@implementation BWCinematicPerceptionNode

+ (void)initialize
{
  objc_opt_class();
}

- (BWCinematicPerceptionNode)initWithConvEngineSupportWithCaptureDevice:(id)a3 scheduler:(id)a4 priority:(unsigned int)a5 depthInferenceEnabled:(BOOL)a6
{
  _BOOL4 v6;
  BWCinematicPerceptionNode *v8;
  BWCinematicPerceptionNode *v9;
  BWInferenceConfiguration *v10;
  NSObject *v11;
  uint64_t v12;
  BWNodeInputMediaConfiguration *v13;
  BWVideoFormatRequirements *v14;
  BWNodeOutputMediaConfiguration *v15;
  uint64_t v16;
  BWVideoFormatRequirements *v17;
  uint64_t v18;
  ADEspressoStereoV2InferenceDescriptor *v19;
  double v20;
  double v21;
  double v22;
  double v23;
  uint64_t v24;
  BWVideoFormatRequirements *v25;
  uint64_t Major;
  void *videoDepthConfiguration;
  uint64_t v28;
  BWCinematicPerceptionNode *v29;
  uint64_t v30;
  BWOpticalFlowInferenceConfiguration *v31;
  objc_super v33;
  BWVideoFormatRequirements *v34;
  uint64_t v35;
  BWVideoFormatRequirements *v36;
  uint64_t v37;
  _QWORD v38[2];

  v6 = a6;
  v38[1] = *MEMORY[0x1E0C80C00];
  v33.receiver = self;
  v33.super_class = (Class)BWCinematicPerceptionNode;
  v8 = -[BWInferenceNode initWithConvEngineSupportWithCaptureDevice:scheduler:priority:](&v33, sel_initWithConvEngineSupportWithCaptureDevice_scheduler_priority_, a3, a4, *(_QWORD *)&a5);
  v9 = v8;
  if (v8)
  {
    v8->_framesSinceLastDDR = 5;
    v10 = -[BWInferenceConfiguration initWithInferenceType:]([BWInferenceConfiguration alloc], "initWithInferenceType:", 150);
    -[BWInferenceConfiguration setPriority:](v10, "setPriority:", 6);
    if (!-[BWInferenceNode addInferenceOfType:version:configuration:](v9, "addInferenceOfType:version:configuration:", 150, BWInferenceVersionMakeMajor(1) & 0xFFFFFFFFFFFFLL, v10)&& !-[BWInferenceNode addInferenceOfType:version:configuration:](v9, "addInferenceOfType:version:configuration:", 151, BWInferenceVersionMakeMajor(1) & 0xFFFFFFFFFFFFLL, -[BWInferenceConfiguration initWithInferenceType:]([BWInferenceConfiguration alloc], "initWithInferenceType:", 151)))
    {
      v9->_humanPosePreventionSet = (NSSet *)(id)objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", &unk_1E49FBB98, 0);
      v11 = dispatch_semaphore_create(0);
      dispatch_semaphore_signal(v11);
      dispatch_semaphore_signal(v11);
      v9->_backpressureSemaphore = (OS_dispatch_semaphore *)v11;
      v9->_backpressureEvent = (MTLEvent *)-[BWInferenceEngine newMetalEvent](-[BWInferenceNode inferenceEngine](v9, "inferenceEngine"), "newMetalEvent");
      v9->_backpressureEventNumber = 0;
      v9->_videoDepthConfiguration = -[BWVideoDepthInferenceConfiguration initWithConcurrencyWidth:videoDepthLayout:captureDevice:backpressureEvent:]([BWVideoDepthInferenceConfiguration alloc], "initWithConcurrencyWidth:videoDepthLayout:captureDevice:backpressureEvent:", 2, 0, a3, v9->_backpressureEvent);
      v9->_depthInferenceEnabled = v6;
      if (v6)
      {
        v12 = 2
            * -[BWVideoDepthInferenceConfiguration concurrencyWidth](v9->_videoDepthConfiguration, "concurrencyWidth");
        v13 = objc_alloc_init(BWNodeInputMediaConfiguration);
        -[BWNodeInputMediaConfiguration setRetainedBufferCount:](v13, "setRetainedBufferCount:", 2);
        -[BWNodeInputMediaConfiguration setPassthroughMode:](v13, "setPassthroughMode:", 0);
        -[BWNodeInput setMediaConfiguration:forAttachedMediaKey:](v9->super.super._input, "setMediaConfiguration:forAttachedMediaKey:", v13, CFSTR("SynchronizedSlaveFrame"));
        v14 = objc_alloc_init(BWVideoFormatRequirements);
        v38[0] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[BWVideoDepthInferenceConfiguration outputPixelFormat](v9->_videoDepthConfiguration, "outputPixelFormat"));
        -[BWVideoFormatRequirements setSupportedPixelFormats:](v14, "setSupportedPixelFormats:", objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v38, 1));
        -[BWVideoFormatRequirements setWidth:](v14, "setWidth:", (int)-[BWVideoDepthInferenceConfiguration outputDimensions](v9->_videoDepthConfiguration, "outputDimensions"));
        -[BWVideoFormatRequirements setHeight:](v14, "setHeight:", -[BWVideoDepthInferenceConfiguration outputDimensions](v9->_videoDepthConfiguration, "outputDimensions") >> 32);
        v15 = objc_alloc_init(BWNodeOutputMediaConfiguration);
        -[BWNodeOutputMediaConfiguration setPassthroughMode:](v15, "setPassthroughMode:", 0);
        -[BWNodeOutputMediaConfiguration setProvidesPixelBufferPool:](v15, "setProvidesPixelBufferPool:", 1);
        -[BWNodeOutputMediaConfiguration setOwningNodeRetainedBufferCount:](v15, "setOwningNodeRetainedBufferCount:", v12);
        -[BWNodeOutputMediaConfiguration setFormatRequirements:](v15, "setFormatRequirements:", v14);
        -[BWNodeOutput setMediaConfiguration:forAttachedMediaKey:](v9->super.super._output, "setMediaConfiguration:forAttachedMediaKey:", v15, CFSTR("Depth"));
        v16 = -[BWVideoDepthInferenceConfiguration featuresDimensions](v9->_videoDepthConfiguration, "featuresDimensions");
        v17 = objc_alloc_init(BWVideoFormatRequirements);
        v37 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[BWVideoDepthInferenceConfiguration featuresPixelFormat](v9->_videoDepthConfiguration, "featuresPixelFormat"));
        -[BWVideoFormatRequirements setSupportedPixelFormats:](v17, "setSupportedPixelFormats:", objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v37, 1));
        -[BWVideoFormatRequirements setWidth:](v17, "setWidth:", (int)v16);
        -[BWVideoFormatRequirements setHeight:](v17, "setHeight:", v16 >> 32);
        v36 = v17;
        v9->_disparityFeaturesVideoFormat = (BWVideoFormat *)+[BWVideoFormat formatByResolvingRequirements:](BWVideoFormat, "formatByResolvingRequirements:", objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v36, 1));
        v18 = (int)v12;
        v9->_disparityFeaturesPool = -[BWPixelBufferPool initWithVideoFormat:capacity:name:memoryPool:]([BWPixelBufferPool alloc], "initWithVideoFormat:capacity:name:memoryPool:", v9->_disparityFeaturesVideoFormat, (int)v12, CFSTR("FusionTrackerNodeDisparityFeaturesPool"), -[BWNodeOutput memoryPool](v9->super.super._output, "memoryPool"));
        -[BWVideoDepthInferenceConfiguration featuresPixelFormat](v9->_videoDepthConfiguration, "featuresPixelFormat");
        v9->_initialDisparityFeaturesPixelBuffer = (__CVBuffer *)CreatePixelBuffer();
        v9->_previousDisparityFeaturesSampleBuffer = (opaqueCMSampleBuffer *)CreateSampleBuffer();
        v19 = -[BWVideoDepthInferenceConfiguration stereoV2inferenceDescriptor](v9->_videoDepthConfiguration, "stereoV2inferenceDescriptor");
        objc_msgSend((id)objc_msgSend((id)-[ADEspressoStereoV2InferenceDescriptor colorFeaturesOutput](v19, "colorFeaturesOutput"), "imageDescriptor"), "sizeForLayout:", 255);
        v21 = v20;
        v23 = v22;
        v24 = objc_msgSend((id)objc_msgSend((id)-[ADEspressoStereoV2InferenceDescriptor colorFeaturesOutput](v19, "colorFeaturesOutput"), "imageDescriptor"), "pixelFormat");
        v25 = objc_alloc_init(BWVideoFormatRequirements);
        v35 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v24);
        -[BWVideoFormatRequirements setSupportedPixelFormats:](v25, "setSupportedPixelFormats:", objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v35, 1));
        -[BWVideoFormatRequirements setWidth:](v25, "setWidth:", (unint64_t)v21);
        -[BWVideoFormatRequirements setHeight:](v25, "setHeight:", (unint64_t)v23);
        v34 = v25;
        v9->_colorFeaturesVideoFormat = (BWVideoFormat *)+[BWVideoFormat formatByResolvingRequirements:](BWVideoFormat, "formatByResolvingRequirements:", objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v34, 1));
        v9->_colorFeaturesPool = -[BWPixelBufferPool initWithVideoFormat:capacity:name:memoryPool:]([BWPixelBufferPool alloc], "initWithVideoFormat:capacity:name:memoryPool:", v9->_colorFeaturesVideoFormat, v18, CFSTR("FusionTrackerNodeColorFeaturesPool"), -[BWNodeOutput memoryPool](v9->super.super._output, "memoryPool"));
        v9->_initialColorFeaturesPixelBuffer = (__CVBuffer *)CreatePixelBuffer();
        v9->_previousColorFeaturesSampleBuffer = (opaqueCMSampleBuffer *)CreateSampleBuffer();
        objc_msgSend((id)objc_msgSend((id)-[ADEspressoStereoV2InferenceDescriptor temporalSmoothingCurrentFeaturesRatioMinInput](v19, "temporalSmoothingCurrentFeaturesRatioMinInput"), "imageDescriptor"), "pixelFormat");
        objc_msgSend((id)objc_msgSend((id)-[ADEspressoStereoV2InferenceDescriptor temporalSmoothingCurrentFeaturesRatioMinInput](v19, "temporalSmoothingCurrentFeaturesRatioMinInput"), "imageDescriptor"), "sizeForLayout:", 255);
        objc_msgSend((id)objc_msgSend((id)-[ADEspressoStereoV2InferenceDescriptor temporalSmoothingPreviousFeaturesRatioMinInput](v19, "temporalSmoothingPreviousFeaturesRatioMinInput"), "imageDescriptor"), "pixelFormat");
        objc_msgSend((id)objc_msgSend((id)-[ADEspressoStereoV2InferenceDescriptor temporalSmoothingPreviousFeaturesRatioMinInput](v19, "temporalSmoothingPreviousFeaturesRatioMinInput"), "imageDescriptor"), "sizeForLayout:", 255);
        v9->_currentFeaturesMinPixelBuffer = (__CVBuffer *)CreatePixelBuffer();
        v9->_previousFeaturesMinPixelBuffer = (__CVBuffer *)CreatePixelBuffer();
        v9->_currentFeaturesMinSampleBuffer = (opaqueCMSampleBuffer *)CreateSampleBuffer();
        v9->_previousFeaturesMinSampleBuffer = (opaqueCMSampleBuffer *)CreateSampleBuffer();
        CVPixelBufferLockBaseAddress(v9->_currentFeaturesMinPixelBuffer, 0);
        *(_WORD *)CVPixelBufferGetBaseAddress(v9->_currentFeaturesMinPixelBuffer) = 13517;
        CVPixelBufferUnlockBaseAddress(v9->_currentFeaturesMinPixelBuffer, 0);
        CVPixelBufferLockBaseAddress(v9->_previousFeaturesMinPixelBuffer, 0);
        *(_WORD *)CVPixelBufferGetBaseAddress(v9->_previousFeaturesMinPixelBuffer) = 0;
        CVPixelBufferUnlockBaseAddress(v9->_previousFeaturesMinPixelBuffer, 0);
        Major = BWInferenceVersionMakeMajor(1);
        videoDepthConfiguration = v9->_videoDepthConfiguration;
        v28 = Major & 0xFFFFFFFFFFFFLL;
        v29 = v9;
        v30 = 111;
      }
      else
      {
        v31 = -[BWInferenceConfiguration initWithInferenceType:]([BWOpticalFlowInferenceConfiguration alloc], "initWithInferenceType:", 117);
        -[BWOpticalFlowInferenceConfiguration setInputDimensions:](v31, "setInputDimensions:", -[BWVideoDepthInferenceConfiguration inputDimensions](v9->_videoDepthConfiguration, "inputDimensions"));
        -[BWOpticalFlowInferenceConfiguration setOutputDimensions:](v31, "setOutputDimensions:", -[BWVideoDepthInferenceConfiguration outputDimensions](v9->_videoDepthConfiguration, "outputDimensions"));
        -[BWOpticalFlowInferenceConfiguration setConcurrencyWidth:](v31, "setConcurrencyWidth:", 2);
        -[BWOpticalFlowInferenceConfiguration setAttachedMediaKeyForPropagatedColorInput:](v31, "setAttachedMediaKeyForPropagatedColorInput:", 0x1E49515B8);
        -[BWOpticalFlowInferenceConfiguration setPortType:](v31, "setPortType:", -[BWVideoDepthInferenceConfiguration portType](v9->_videoDepthConfiguration, "portType"));
        -[BWOpticalFlowInferenceConfiguration setForceIntermediateDimensions:](v31, "setForceIntermediateDimensions:", 0x17000000290);
        v28 = BWInferenceVersionMakeMajor(1) & 0xFFFFFFFFFFFFLL;
        v29 = v9;
        v30 = 117;
        videoDepthConfiguration = v31;
      }
      -[BWInferenceNode addInferenceOfType:version:configuration:](v29, "addInferenceOfType:version:configuration:", v30, v28, videoDepthConfiguration);
    }
  }
  return v9;
}

- (void)dealloc
{
  opaqueCMFormatDescription *depthFormatDescription;
  __CVBuffer *initialColorFeaturesPixelBuffer;
  __CVBuffer *initialDisparityFeaturesPixelBuffer;
  opaqueCMSampleBuffer *previousColorFeaturesSampleBuffer;
  opaqueCMSampleBuffer *previousDisparityFeaturesSampleBuffer;
  __CVBuffer *currentFeaturesMinPixelBuffer;
  __CVBuffer *previousFeaturesMinPixelBuffer;
  opaqueCMSampleBuffer *currentFeaturesMinSampleBuffer;
  opaqueCMSampleBuffer *previousFeaturesMinSampleBuffer;
  objc_super v12;

  depthFormatDescription = self->_depthFormatDescription;
  if (depthFormatDescription)
    CFRelease(depthFormatDescription);
  initialColorFeaturesPixelBuffer = self->_initialColorFeaturesPixelBuffer;
  if (initialColorFeaturesPixelBuffer)
    CFRelease(initialColorFeaturesPixelBuffer);
  initialDisparityFeaturesPixelBuffer = self->_initialDisparityFeaturesPixelBuffer;
  if (initialDisparityFeaturesPixelBuffer)
    CFRelease(initialDisparityFeaturesPixelBuffer);
  previousColorFeaturesSampleBuffer = self->_previousColorFeaturesSampleBuffer;
  if (previousColorFeaturesSampleBuffer)
    CFRelease(previousColorFeaturesSampleBuffer);
  previousDisparityFeaturesSampleBuffer = self->_previousDisparityFeaturesSampleBuffer;
  if (previousDisparityFeaturesSampleBuffer)
    CFRelease(previousDisparityFeaturesSampleBuffer);
  currentFeaturesMinPixelBuffer = self->_currentFeaturesMinPixelBuffer;
  if (currentFeaturesMinPixelBuffer)
    CFRelease(currentFeaturesMinPixelBuffer);
  previousFeaturesMinPixelBuffer = self->_previousFeaturesMinPixelBuffer;
  if (previousFeaturesMinPixelBuffer)
    CFRelease(previousFeaturesMinPixelBuffer);
  currentFeaturesMinSampleBuffer = self->_currentFeaturesMinSampleBuffer;
  if (currentFeaturesMinSampleBuffer)
    CFRelease(currentFeaturesMinSampleBuffer);
  previousFeaturesMinSampleBuffer = self->_previousFeaturesMinSampleBuffer;
  if (previousFeaturesMinSampleBuffer)
    CFRelease(previousFeaturesMinSampleBuffer);
  v12.receiver = self;
  v12.super_class = (Class)BWCinematicPerceptionNode;
  -[BWInferenceNode dealloc](&v12, sel_dealloc);
}

- (id)nodeType
{
  return CFSTR("Inference");
}

- (id)nodeSubType
{
  return CFSTR("FusionTracker");
}

- (void)prepareForCurrentConfigurationToBecomeLive
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)BWCinematicPerceptionNode;
  -[BWInferenceNode prepareForCurrentConfigurationToBecomeLive](&v4, sel_prepareForCurrentConfigurationToBecomeLive);
  v3 = (void *)objc_msgSend(objc_alloc((Class)getFTCinematicConfigClass()), "init");
  self->_cinematicTracker = (FTCinematicTracker *)objc_msgSend(objc_alloc((Class)getFTCinematicTrackerClass()), "initWithConfig:", v3);

}

- (void)didSelectFormat:(id)a3 forInput:(id)a4 forAttachedMediaKey:(id)a5
{
  BWInferenceVideoFormatRequirements *v9;
  objc_super v10;
  objc_super v11;
  BWInferenceVideoFormatRequirements *v12;
  _QWORD v13[2];

  v13[1] = *MEMORY[0x1E0C80C00];
  if (objc_msgSend(a5, "isEqualToString:", CFSTR("SynchronizedSlaveFrame")))
  {
    v9 = -[BWVideoFormatRequirements initWithPixelBufferAttributes:]([BWInferenceVideoFormatRequirements alloc], "initWithPixelBufferAttributes:", objc_msgSend(a3, "pixelBufferAttributes"));
    v13[0] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", objc_msgSend(a3, "colorSpaceProperties"));
    -[BWVideoFormatRequirements setSupportedColorSpaceProperties:](v9, "setSupportedColorSpaceProperties:", objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v13, 1));
    -[BWInferenceVideoFormatRequirements setIncludesInvalidContent:](v9, "setIncludesInvalidContent:", 0);
    v12 = v9;
    v11.receiver = self;
    v11.super_class = (Class)BWCinematicPerceptionNode;
    -[BWInferenceEngine prepareForInputInferenceVideoFormat:attachedMediaKey:](-[BWInferenceNode inferenceEngine](&v11, sel_inferenceEngine), "prepareForInputInferenceVideoFormat:attachedMediaKey:", +[BWInferenceVideoFormat formatByResolvingRequirements:](BWInferenceVideoFormat, "formatByResolvingRequirements:", objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v12, 1)), CFSTR("SynchronizedSlaveFrame"));
  }
  v10.receiver = self;
  v10.super_class = (Class)BWCinematicPerceptionNode;
  -[BWInferenceNode didSelectFormat:forInput:forAttachedMediaKey:](&v10, sel_didSelectFormat_forInput_forAttachedMediaKey_, a3, a4, a5);
}

- (BOOL)_attachISPDetectionsFromSampleBuffer:(void *)a3 toTrackingInput:(uint64_t)a4 withFrameTimestamp:
{
  uint64_t v7;
  void *v8;
  int v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t i;
  void *v19;
  const __CFDictionary *v20;
  CGSize v21;
  float v22;
  float v23;
  void *v24;
  float v25;
  uint64_t v26;
  int v27;
  BWFusionTrackerObservable *v28;
  char *v29;
  uint64_t v30;
  unint64_t v31;
  _BOOL8 v32;
  uint64_t v34;
  void *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  id obj;
  uint64_t v49;
  uint64_t v50;
  id v51;
  uint64_t v52;
  id v53;
  uint64_t v54;
  uint64_t v55;
  __int128 v56;
  uint64_t v57;
  CGRect rect;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  _BYTE v67[128];
  _BYTE v68[128];
  uint64_t v69;

  v69 = *MEMORY[0x1E0C80C00];
  if (!a1)
    return 0;
  v7 = a1;
  v53 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v8 = (void *)objc_msgSend((id)CMGetAttachment(a2, (CFStringRef)*MEMORY[0x1E0D05CB0], 0), "objectForKeyedSubscript:", *MEMORY[0x1E0D069A0]);
  v63 = 0u;
  v64 = 0u;
  v65 = 0u;
  v66 = 0u;
  obj = v8;
  v47 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v63, v68, 16);
  if (!v47)
    goto LABEL_44;
  v34 = v7;
  v35 = a3;
  v9 = 0;
  v45 = *MEMORY[0x1E0D064D0];
  v46 = *(_QWORD *)v64;
  v43 = *MEMORY[0x1E0D064B8];
  v44 = *MEMORY[0x1E0D064A0];
  v41 = *MEMORY[0x1E0D064A8];
  v42 = *MEMORY[0x1E0D06498];
  v39 = *MEMORY[0x1E0D06480];
  v40 = *MEMORY[0x1E0D06478];
  v37 = *MEMORY[0x1E0D06490];
  v38 = *MEMORY[0x1E0D06488];
  v36 = *MEMORY[0x1E0D064C8];
  v10 = *MEMORY[0x1E0D06D58];
  v54 = *MEMORY[0x1E0D06460];
  v55 = *MEMORY[0x1E0D06958];
  v50 = *MEMORY[0x1E0D06A48];
  v52 = *MEMORY[0x1E0D06468];
  v11 = MEMORY[0x1E0C9D628];
  do
  {
    v12 = 0;
    do
    {
      if (*(_QWORD *)v64 != v46)
        objc_enumerationMutation(obj);
      v13 = *(void **)(*((_QWORD *)&v63 + 1) + 8 * v12);
      v51 = (id)objc_msgSend((id)objc_msgSend(obj, "objectForKeyedSubscript:", v13, v34), "objectForKeyedSubscript:", v45);
      v49 = v12;
      if ((objc_msgSend(v13, "isEqualToString:", v44) & 1) != 0)
      {
        v14 = 1002;
      }
      else if ((objc_msgSend(v13, "isEqualToString:", v43) & 1) != 0)
      {
        v14 = 1001;
      }
      else if ((objc_msgSend(v13, "isEqualToString:", v42) & 1) != 0)
      {
        v14 = 1000;
      }
      else if ((objc_msgSend(v13, "isEqualToString:", v41) & 1) != 0)
      {
        v14 = 1003;
      }
      else if ((objc_msgSend(v13, "isEqualToString:", v40) & 1) != 0)
      {
        v14 = 2000;
      }
      else if ((objc_msgSend(v13, "isEqualToString:", v39) & 1) != 0)
      {
        v14 = 2001;
      }
      else if ((objc_msgSend(v13, "isEqualToString:", v38) & 1) != 0)
      {
        v14 = 3000;
      }
      else if ((objc_msgSend(v13, "isEqualToString:", v37) & 1) != 0)
      {
        v14 = 3001;
      }
      else
      {
        if ((objc_msgSend(v13, "isEqualToString:", v36) & 1) == 0)
        {
          objc_msgSend(v51, "count");
          goto LABEL_38;
        }
        v14 = 42001;
      }
      v61 = 0u;
      v62 = 0u;
      v59 = 0u;
      v60 = 0u;
      v15 = objc_msgSend(v51, "countByEnumeratingWithState:objects:count:", &v59, v67, 16);
      if (v15)
      {
        v16 = v15;
        v17 = *(_QWORD *)v60;
        do
        {
          for (i = 0; i != v16; ++i)
          {
            if (*(_QWORD *)v60 != v17)
              objc_enumerationMutation(v51);
            v19 = *(void **)(*((_QWORD *)&v59 + 1) + 8 * i);
            v20 = (const __CFDictionary *)objc_msgSend(v19, "objectForKeyedSubscript:", v10);
            v21 = *(CGSize *)(v11 + 16);
            rect.origin = *(CGPoint *)v11;
            rect.size = v21;
            if (v20)
            {
              CGRectMakeWithDictionaryRepresentation(v20, &rect);
              objc_msgSend((id)objc_msgSend(v19, "objectForKeyedSubscript:", v55), "floatValue");
              v23 = v22;
              v24 = (void *)objc_msgSend(v19, "objectForKeyedSubscript:", v54);
              if (v24 || (v24 = (void *)objc_msgSend(v19, "objectForKeyedSubscript:", v50)) != 0)
              {
                v25 = v23 / 1000.0;
                v26 = objc_msgSend(v24, "unsignedIntegerValue");
                v27 = objc_msgSend((id)objc_msgSend(v19, "objectForKeyedSubscript:", v52), "intValue");
                if (v27 > v9)
                  v9 = v27;
                v28 = [BWFusionTrackerObservable alloc];
                v56 = *(_OWORD *)a4;
                v57 = *(_QWORD *)(a4 + 16);
                v29 = -[BWFusionTrackerObservable initWithKind:box:confidence:timestamp:identifier:metadata:](v28, v14, &v56, v26, v19, rect.origin.x, rect.origin.y, rect.size.width, rect.size.height, v25);
                objc_msgSend(v53, "addObject:", v29);

              }
            }
          }
          v16 = objc_msgSend(v51, "countByEnumeratingWithState:objects:count:", &v59, v67, 16);
        }
        while (v16);
      }
LABEL_38:
      v12 = v49 + 1;
    }
    while (v49 + 1 != v47);
    v30 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v63, v68, 16);
    v47 = v30;
  }
  while (v30);
  v7 = v34;
  a3 = v35;
  if (v9 >= 1)
  {
    objc_msgSend(v35, "setDetectorDidRun:", 1);
    v31 = 0;
    *(_QWORD *)(v34 + 176) = 0;
    goto LABEL_46;
  }
LABEL_44:
  v31 = *(_QWORD *)(v7 + 176);
  if (v31 >= 5)
  {
    objc_msgSend(a3, "setDetectorDidRun:", 1);
    v31 = *(_QWORD *)(v7 + 176) % 5uLL;
    *(_QWORD *)(v7 + 176) = v31;
  }
LABEL_46:
  v32 = v31 == 4;
  objc_msgSend(a3, "setObservations:", v53);

  return v32;
}

- (void)handleDroppedSample:(id)a3 forInput:(id)a4
{
  objc_super v4;

  ++self->_framesSinceLastDDR;
  v4.receiver = self;
  v4.super_class = (Class)BWCinematicPerceptionNode;
  -[BWNode handleDroppedSample:forInput:](&v4, sel_handleDroppedSample_forInput_, a3, a4);
}

- (void)renderSampleBuffer:(opaqueCMSampleBuffer *)a3 forInput:(id)a4
{
  void *v7;
  const __CFDictionary *v8;
  void *v9;
  void *v10;
  void *v11;
  _BOOL8 v12;
  NSSet *humanPosePreventionSet;
  dispatch_time_t v14;
  id v15;
  void *v16;
  opaqueCMSampleBuffer *previousDisparityFeaturesSampleBuffer;
  opaqueCMSampleBuffer *previousColorFeaturesSampleBuffer;
  opaqueCMSampleBuffer *v19;
  _QWORD v20[5];
  objc_super v21;
  _QWORD v22[5];
  objc_super v23;
  objc_super v24;
  CMTime v25;
  CMTime v26;
  CMTime v27;

  v7 = (void *)objc_msgSend(objc_alloc((Class)getFTCinematicInputClass()), "init");
  v27 = *(CMTime *)*(_QWORD *)&MEMORY[0x1E0CA2E68];
  v8 = (const __CFDictionary *)CMGetAttachment(a3, (CFStringRef)*MEMORY[0x1E0D05D00], 0);
  if (v8)
    CMTimeMakeFromDictionary(&v27, v8);
  else
    CMSampleBufferGetPresentationTimeStamp(&v27, a3);
  v9 = (void *)CMGetAttachment(a3, CFSTR("CinematicVideoFocusRequest"), 0);
  if (v9)
  {
    v10 = v9;
    if ((BWIsFocusRequestForFixedPlaneFocus(v9) & 1) == 0)
    {
      v11 = BWCreateFTCinematicTapRequestFromFocusRequest(v10);
      objc_msgSend(v7, "setTapRequest:", v11);

    }
  }
  v26 = v27;
  objc_msgSend(v7, "setSourceFrameTimestamp:", &v26);
  v25 = v27;
  v12 = -[BWCinematicPerceptionNode _attachISPDetectionsFromSampleBuffer:toTrackingInput:withFrameTimestamp:]((uint64_t)self, a3, v7, (uint64_t)&v25);
  CMSetAttachment(a3, CFSTR("FusionTrackerInput"), (CFTypeRef)-[FTCinematicTracker computeTrackingStateForInput:](self->_cinematicTracker, "computeTrackingStateForInput:", v7), 1u);
  CMSetAttachment(a3, CFSTR("FTDetectorWillRun"), (CFTypeRef)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v12), 1u);

  if (v12)
  {
    v24.receiver = self;
    v24.super_class = (Class)BWCinematicPerceptionNode;
    -[BWInferenceNode setInferencesToSkip:](&v24, sel_setInferencesToSkip_, objc_msgSend(MEMORY[0x1E0C99E60], "set"));
  }
  else
  {
    humanPosePreventionSet = self->_humanPosePreventionSet;
    v23.receiver = self;
    v23.super_class = (Class)BWCinematicPerceptionNode;
    -[BWInferenceNode setInferencesToSkip:](&v23, sel_setInferencesToSkip_, humanPosePreventionSet);
  }
  v14 = dispatch_time(0, 1000000000);
  dispatch_semaphore_wait((dispatch_semaphore_t)self->_backpressureSemaphore, v14);
  v15 = -[BWInferenceEngine metalCommandBuffer](-[BWInferenceNode inferenceEngine](self, "inferenceEngine"), "metalCommandBuffer");
  v16 = v15;
  if (self->_depthInferenceEnabled)
  {
    if (!self->_previousColorFeaturesSampleBuffer)
      self->_previousColorFeaturesSampleBuffer = (opaqueCMSampleBuffer *)CreateSampleBuffer();
    previousDisparityFeaturesSampleBuffer = self->_previousDisparityFeaturesSampleBuffer;
    if (!previousDisparityFeaturesSampleBuffer)
    {
      previousDisparityFeaturesSampleBuffer = (opaqueCMSampleBuffer *)CreateSampleBuffer();
      self->_previousDisparityFeaturesSampleBuffer = previousDisparityFeaturesSampleBuffer;
    }
    BWSampleBufferSetAttachedMedia(a3, (uint64_t)CFSTR("depthFeaturesIn"), (uint64_t)previousDisparityFeaturesSampleBuffer);
    BWSampleBufferSetAttachedMedia(a3, (uint64_t)CFSTR("colorFeaturesIn"), (uint64_t)self->_previousColorFeaturesSampleBuffer);
    BWSampleBufferSetAttachedMedia(a3, (uint64_t)CFSTR("currentFeaturesMin"), (uint64_t)self->_currentFeaturesMinSampleBuffer);
    BWSampleBufferSetAttachedMedia(a3, (uint64_t)CFSTR("previousFeaturesMin"), (uint64_t)self->_previousFeaturesMinSampleBuffer);
    previousColorFeaturesSampleBuffer = self->_previousColorFeaturesSampleBuffer;
    if (previousColorFeaturesSampleBuffer)
    {
      CFRelease(previousColorFeaturesSampleBuffer);
      self->_previousColorFeaturesSampleBuffer = 0;
    }
    v19 = self->_previousDisparityFeaturesSampleBuffer;
    if (v19)
    {
      CFRelease(v19);
      self->_previousDisparityFeaturesSampleBuffer = 0;
    }
  }
  else
  {
    objc_msgSend(v15, "encodeWaitForEvent:value:", self->_backpressureEvent, self->_backpressureEventNumber);
    v22[0] = MEMORY[0x1E0C809B0];
    v22[1] = 3221225472;
    v22[2] = __57__BWCinematicPerceptionNode_renderSampleBuffer_forInput___block_invoke;
    v22[3] = &unk_1E4927388;
    v22[4] = self;
    objc_msgSend(v16, "addCompletedHandler:", v22);
    CMSetAttachment(a3, CFSTR("CinematicInferencesBackpressureEventNumber"), (CFTypeRef)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", self->_backpressureEventNumber), 1u);
    ++self->_backpressureEventNumber;
  }
  v21.receiver = self;
  v21.super_class = (Class)BWCinematicPerceptionNode;
  -[BWInferenceNode renderSampleBuffer:forInput:](&v21, sel_renderSampleBuffer_forInput_, a3, a4);
  if (self->_depthInferenceEnabled)
  {
    v20[0] = MEMORY[0x1E0C809B0];
    v20[1] = 3221225472;
    v20[2] = __57__BWCinematicPerceptionNode_renderSampleBuffer_forInput___block_invoke_2;
    v20[3] = &unk_1E4927388;
    v20[4] = self;
    objc_msgSend(v16, "addCompletedHandler:", v20);
  }
  objc_msgSend(v16, "commit");
  ++self->_framesSinceLastDDR;
}

intptr_t __57__BWCinematicPerceptionNode_renderSampleBuffer_forInput___block_invoke(uint64_t a1)
{
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(*(_QWORD *)(a1 + 32) + 200));
}

intptr_t __57__BWCinematicPerceptionNode_renderSampleBuffer_forInput___block_invoke_2(uint64_t a1)
{
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(*(_QWORD *)(a1 + 32) + 200));
}

- (void)willEmitSampleBufferAlways:(opaqueCMSampleBuffer *)a3
{
  opaqueCMSampleBuffer *AttachedMedia;
  __CVBuffer *ImageBuffer;
  __CVBuffer *v7;
  __CVBuffer *v8;
  int v9;
  const __CFString *v10;
  void *v11;
  void *v12;
  opaqueCMSampleBuffer *v13;
  opaqueCMSampleBuffer *v14;
  void *v15;
  CMTime v16;
  CMTime v17;
  CMAttachmentBearerRef target;

  target = 0;
  if (!self->_depthInferenceEnabled)
    goto LABEL_14;
  memset(&v17, 0, sizeof(v17));
  CMSampleBufferGetPresentationTimeStamp(&v17, a3);
  AttachedMedia = (opaqueCMSampleBuffer *)BWSampleBufferGetAttachedMedia(a3, (uint64_t)CFSTR("Depth"));
  if (AttachedMedia)
  {
    ImageBuffer = CMSampleBufferGetImageBuffer(AttachedMedia);
    v16 = v17;
    if (BWSampleBufferCreateFromPixelBuffer(ImageBuffer, (uint64_t)&v16, (CFTypeRef *)&self->_depthFormatDescription, (CMSampleBufferRef *)&target))goto LABEL_11;
LABEL_7:
    v10 = (const __CFString *)*MEMORY[0x1E0D05CB0];
    v11 = (void *)CMGetAttachment(a3, (CFStringRef)*MEMORY[0x1E0D05CB0], 0);
    v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", 2);
    objc_msgSend(v12, "setObject:forKeyedSubscript:", objc_msgSend(v11, "objectForKeyedSubscript:", *MEMORY[0x1E0D06D00]), *MEMORY[0x1E0D06D00]);
    objc_msgSend(v12, "setObject:forKeyedSubscript:", objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("MirroredHorizontal")), CFSTR("MirroredHorizontal"));
    CMSetAttachment(target, v10, v12, 1u);

    BWSampleBufferSetAttachedMedia(a3, (uint64_t)CFSTR("Depth"), (uint64_t)target);
    v13 = (opaqueCMSampleBuffer *)BWSampleBufferGetAttachedMedia(a3, (uint64_t)CFSTR("depthFeaturesOut"));
    self->_previousDisparityFeaturesSampleBuffer = v13;
    if (v13)
      CFRetain(v13);
    v14 = (opaqueCMSampleBuffer *)BWSampleBufferGetAttachedMedia(a3, (uint64_t)CFSTR("colorFeaturesOut"));
    self->_previousColorFeaturesSampleBuffer = v14;
    if (v14)
      CFRetain(v14);
    goto LABEL_11;
  }
  v7 = (__CVBuffer *)objc_msgSend((id)objc_msgSend(-[BWNodeOutput mediaPropertiesForAttachedMediaKey:](self->super.super._output, "mediaPropertiesForAttachedMediaKey:", CFSTR("Depth")), "livePixelBufferPool"), "newPixelBuffer");
  if (v7)
  {
    v8 = v7;
    v16 = v17;
    v9 = BWSampleBufferCreateFromPixelBuffer(v7, (uint64_t)&v16, (CFTypeRef *)&self->_depthFormatDescription, (CMSampleBufferRef *)&target);
    CFRelease(v8);
    if (!v9)
      goto LABEL_7;
  }
LABEL_11:
  if (self->_depthInferenceEnabled)
  {
    BWSampleBufferRemoveAttachedMedia(a3, (uint64_t)CFSTR("espressoOutput"));
    BWSampleBufferRemoveAttachedMedia(a3, (uint64_t)CFSTR("colorFeaturesIn"));
    BWSampleBufferRemoveAttachedMedia(a3, (uint64_t)CFSTR("colorFeaturesOut"));
    BWSampleBufferRemoveAttachedMedia(a3, (uint64_t)CFSTR("depthFeaturesIn"));
    BWSampleBufferRemoveAttachedMedia(a3, (uint64_t)CFSTR("depthFeaturesOut"));
    BWSampleBufferRemoveAttachedMedia(a3, (uint64_t)CFSTR("refIntermediate"));
    BWSampleBufferRemoveAttachedMedia(a3, (uint64_t)CFSTR("auxIntermediate"));
    BWSampleBufferRemoveAttachedMedia(a3, (uint64_t)CFSTR("currentFeaturesMin"));
    BWSampleBufferRemoveAttachedMedia(a3, (uint64_t)CFSTR("previousFeaturesMin"));
    BWSampleBufferRemoveAttachedMedia(a3, (uint64_t)CFSTR("SynchronizedSlaveFrame"));
    if (target)
      CFRelease(target);
  }
LABEL_14:
  v15 = (void *)CMGetAttachment(a3, CFSTR("FusionTrackerInput"), 0);
  if ((objc_msgSend((id)objc_msgSend(v15, "highPriorityTrackerState"), "completed") & 1) == 0)
    objc_msgSend((id)objc_msgSend(v15, "highPriorityTrackerState"), "abort");
  CMSetAttachment(a3, CFSTR("FTCinematicTrackingResult"), (CFTypeRef)objc_msgSend(v15, "commit"), 1u);
}

- (BOOL)intermediateResourceTrackingAllowedForAttachedMediaKey:(id)a3
{
  if ((objc_msgSend(a3, "isEqualToString:", CFSTR("PrimaryFormat")) & 1) != 0)
    return 1;
  else
    return objc_msgSend(a3, "isEqualToString:", CFSTR("SynchronizedSlaveFrame"));
}

- (id)inputVideoFormatForAttachedMediaKey:(id)a3
{
  uint64_t v5;
  ADEspressoStereoV2InferenceDescriptor *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  BWVideoFormatRequirements *v12;
  void *v13;
  BWVideoFormatRequirements **v14;
  ADEspressoStereoV2InferenceDescriptor *v15;
  double v16;
  double v17;
  double v18;
  double v19;
  BWVideoFormatRequirements *v20;
  objc_super v21;
  BWVideoFormatRequirements *v22;
  uint64_t v23;
  BWVideoFormatRequirements *v24;
  _QWORD v25[2];

  v25[1] = *MEMORY[0x1E0C80C00];
  if ((objc_msgSend(a3, "isEqualToString:", CFSTR("colorFeaturesIn")) & 1) != 0
    || objc_msgSend(a3, "isEqualToString:", CFSTR("colorFeaturesOut")))
  {
    v5 = 248;
    return *(Class *)((char *)&self->super.super.super.isa + v5);
  }
  if ((objc_msgSend(a3, "isEqualToString:", CFSTR("depthFeaturesIn")) & 1) != 0
    || objc_msgSend(a3, "isEqualToString:", CFSTR("depthFeaturesOut")))
  {
    v5 = 240;
    return *(Class *)((char *)&self->super.super.super.isa + v5);
  }
  if (objc_msgSend(a3, "isEqualToString:", CFSTR("currentFeaturesMin")))
  {
    v7 = -[BWVideoDepthInferenceConfiguration stereoV2inferenceDescriptor](self->_videoDepthConfiguration, "stereoV2inferenceDescriptor");
    objc_msgSend((id)objc_msgSend((id)-[ADEspressoStereoV2InferenceDescriptor temporalSmoothingCurrentFeaturesRatioMinInput](v7, "temporalSmoothingCurrentFeaturesRatioMinInput"), "imageDescriptor"), "sizeForLayout:", 255);
    v9 = v8;
    v11 = v10;
    v12 = objc_alloc_init(BWVideoFormatRequirements);
    -[BWVideoFormatRequirements setWidth:](v12, "setWidth:", (unint64_t)v9);
    -[BWVideoFormatRequirements setHeight:](v12, "setHeight:", (unint64_t)v11);
    v25[0] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", objc_msgSend((id)objc_msgSend((id)-[ADEspressoStereoV2InferenceDescriptor temporalSmoothingCurrentFeaturesRatioMinInput](v7, "temporalSmoothingCurrentFeaturesRatioMinInput"), "imageDescriptor"), "pixelFormat"));
    -[BWVideoFormatRequirements setSupportedPixelFormats:](v12, "setSupportedPixelFormats:", objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v25, 1));
    -[BWVideoFormatRequirements setBytesPerRowAlignment:](v12, "setBytesPerRowAlignment:", 64);
    v24 = v12;
    v13 = (void *)MEMORY[0x1E0C99D20];
    v14 = &v24;
    return +[BWVideoFormat formatByResolvingRequirements:](BWVideoFormat, "formatByResolvingRequirements:", objc_msgSend(v13, "arrayWithObjects:count:", v14, 1));
  }
  if (objc_msgSend(a3, "isEqualToString:", CFSTR("previousFeaturesMin")))
  {
    v15 = -[BWVideoDepthInferenceConfiguration stereoV2inferenceDescriptor](self->_videoDepthConfiguration, "stereoV2inferenceDescriptor");
    objc_msgSend((id)objc_msgSend((id)-[ADEspressoStereoV2InferenceDescriptor temporalSmoothingPreviousFeaturesRatioMinInput](v15, "temporalSmoothingPreviousFeaturesRatioMinInput"), "imageDescriptor"), "sizeForLayout:", 255);
    v17 = v16;
    v19 = v18;
    v20 = objc_alloc_init(BWVideoFormatRequirements);
    -[BWVideoFormatRequirements setWidth:](v20, "setWidth:", (unint64_t)v17);
    -[BWVideoFormatRequirements setHeight:](v20, "setHeight:", (unint64_t)v19);
    v23 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", objc_msgSend((id)objc_msgSend((id)-[ADEspressoStereoV2InferenceDescriptor temporalSmoothingPreviousFeaturesRatioMinInput](v15, "temporalSmoothingPreviousFeaturesRatioMinInput"), "imageDescriptor"), "pixelFormat"));
    -[BWVideoFormatRequirements setSupportedPixelFormats:](v20, "setSupportedPixelFormats:", objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v23, 1));
    -[BWVideoFormatRequirements setBytesPerRowAlignment:](v20, "setBytesPerRowAlignment:", 64);
    v22 = v20;
    v13 = (void *)MEMORY[0x1E0C99D20];
    v14 = &v22;
    return +[BWVideoFormat formatByResolvingRequirements:](BWVideoFormat, "formatByResolvingRequirements:", objc_msgSend(v13, "arrayWithObjects:count:", v14, 1));
  }
  v21.receiver = self;
  v21.super_class = (Class)BWCinematicPerceptionNode;
  return -[BWInferenceNode inputVideoFormatForAttachedMediaKey:](&v21, sel_inputVideoFormatForAttachedMediaKey_, a3);
}

- (id)preparedOutputPixelBufferPoolForAttachedMediaKey:(id)a3 format:(id)a4
{
  BWNodeOutput *output;
  const __CFString *v7;
  uint64_t v8;

  if (!objc_msgSend(a3, "isEqualToString:", CFSTR("Depth"), a4))
  {
    if (objc_msgSend(a3, "isEqualToString:", CFSTR("colorFeaturesOut")))
    {
      v8 = 264;
    }
    else
    {
      if (!objc_msgSend(a3, "isEqualToString:", CFSTR("depthFeaturesOut")))
      {
        output = self->super.super._output;
        v7 = (const __CFString *)a3;
        return (id)objc_msgSend(-[BWNodeOutput mediaPropertiesForAttachedMediaKey:](output, "mediaPropertiesForAttachedMediaKey:", v7), "preparedPixelBufferPool");
      }
      v8 = 256;
    }
    return *(Class *)((char *)&self->super.super.super.isa + v8);
  }
  output = self->super.super._output;
  v7 = CFSTR("Depth");
  return (id)objc_msgSend(-[BWNodeOutput mediaPropertiesForAttachedMediaKey:](output, "mediaPropertiesForAttachedMediaKey:", v7), "preparedPixelBufferPool");
}

- (BWVideoDepthInferenceConfiguration)videoDepthConfiguration
{
  return self->_videoDepthConfiguration;
}

@end
