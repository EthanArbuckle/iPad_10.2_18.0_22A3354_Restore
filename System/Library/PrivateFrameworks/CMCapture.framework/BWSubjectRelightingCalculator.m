@implementation BWSubjectRelightingCalculator

+ (void)initialize
{
  objc_opt_class();
}

- (BWSubjectRelightingCalculator)init
{
  BWSubjectRelightingCalculator *v2;
  NSObject *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)BWSubjectRelightingCalculator;
  v2 = -[BWSubjectRelightingCalculator init](&v5, sel_init);
  if (v2)
  {
    v3 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INTERACTIVE, 0);
    v2->_prepareQueue = (OS_dispatch_queue *)dispatch_queue_create("com.apple.bwgraph.subject-relighting-calculator-prepare", v3);
    v2->_calculationQueue = (OS_dispatch_queue *)FigDispatchQueueCreateWithPriority();
  }
  return v2;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)BWSubjectRelightingCalculator;
  -[BWSubjectRelightingCalculator dealloc](&v3, sel_dealloc);
}

- (void)prepareForVideoFormatAsync:(id)a3
{
  NSObject *prepareQueue;
  _QWORD v4[6];

  self->_startedPrepare = 1;
  prepareQueue = self->_prepareQueue;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __60__BWSubjectRelightingCalculator_prepareForVideoFormatAsync___block_invoke;
  v4[3] = &unk_1E491E748;
  v4[4] = a3;
  v4[5] = self;
  dispatch_async(prepareQueue, v4);
}

void __60__BWSubjectRelightingCalculator_prepareForVideoFormatAsync___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  BWVideoFormatRequirements *v4;
  uint64_t v5;
  BWVideoFormatRequirements *v6;
  _QWORD v7[2];

  v7[1] = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x1A858DD40]();
  v3 = *(id *)(a1 + 32);
  if ((unint64_t)objc_msgSend(v3, "width") >= 0x241)
  {
    v4 = objc_alloc_init(BWVideoFormatRequirements);
    -[BWVideoFormatRequirements setWidth:](v4, "setWidth:", 576);
    -[BWVideoFormatRequirements setHeight:](v4, "setHeight:", (int)FigCaptureRoundFloatToMultipleOf(2, (float)(unint64_t)(576 * objc_msgSend(*(id *)(a1 + 32), "height"))/ (float)(unint64_t)objc_msgSend(*(id *)(a1 + 32), "width")));
    v7[0] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", objc_msgSend(*(id *)(a1 + 32), "pixelFormat"));
    -[BWVideoFormatRequirements setSupportedPixelFormats:](v4, "setSupportedPixelFormats:", objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v7, 1));
    v6 = v4;
    v3 = +[BWVideoFormat formatByResolvingRequirements:](BWVideoFormat, "formatByResolvingRequirements:", objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v6, 1));
  }
  v5 = *(_QWORD *)(a1 + 40);
  if (!*(_QWORD *)(v5 + 32))
  {
    *(_QWORD *)(*(_QWORD *)(a1 + 40) + 32) = -[BWPhotoDecompressor initWithPoolSize:outputPixelFormat:outputLargestDimension:]([BWPhotoDecompressor alloc], "initWithPoolSize:outputPixelFormat:outputLargestDimension:", 1, objc_msgSend(*(id *)(a1 + 32), "pixelFormat"), 576);
    v5 = *(_QWORD *)(a1 + 40);
  }
  -[BWSubjectRelightingCalculator _setupSubjectRelightingStage](v5);
  -[BWSubjectRelightingCalculator _setupInferenceControllerWithInputVideoFormat:](*(_QWORD *)(a1 + 40), (uint64_t)v3);
  objc_autoreleasePoolPop(v2);
}

- (uint64_t)_setupSubjectRelightingStage
{
  uint64_t v1;
  void *v2;
  void *v3;
  objc_class *v4;

  if (result)
  {
    v1 = result;
    result = -[FigCaptureCameraParameters nrfVersion](+[FigCaptureCameraParameters sharedInstance](FigCaptureCameraParameters, "sharedInstance"), "nrfVersion");
    if (!*(_QWORD *)(v1 + 64) && !*(_QWORD *)(v1 + 56))
    {
      v2 = BWLoadProcessorBundle((uint64_t)CFSTR("NRF"), result);
      if (v2)
      {
        v3 = v2;
        result = objc_msgSend(v2, "classNamed:", CFSTR("SubjectRelightingStage"));
        if (result)
        {
          v4 = (objc_class *)result;
          result = objc_msgSend(objc_alloc(MEMORY[0x1E0D08B28]), "initWithbundle:andOptionalCommandQueue:", v3, 0);
          *(_QWORD *)(v1 + 64) = result;
          if (result)
          {
            result = objc_msgSend([v4 alloc], "initWithMetalContext:", *(_QWORD *)(v1 + 64));
            *(_QWORD *)(v1 + 56) = result;
          }
        }
      }
      else
      {
        fig_log_get_emitter();
        return FigDebugAssert3();
      }
    }
  }
  return result;
}

- (uint64_t)_setupInferenceControllerWithInputVideoFormat:(uint64_t)result
{
  void *v2;
  uint64_t v3;
  char *v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  BWInferenceEngineControllerConfiguration *v11;
  void *v12;
  BWInferenceEngineController *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  BWPixelBufferPool *v22;
  uint64_t v23;
  BWMemoryPool *v24;
  BWPixelBufferPool *v25;
  void *v26;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  NSDictionary *obj;
  char *v32;
  id v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  _BYTE v46[128];
  _BYTE v47[128];
  _BYTE v48[128];
  uint64_t v49;

  v49 = *MEMORY[0x1E0C80C00];
  if (result && !*(_QWORD *)(result + 40))
  {
    v28 = result;
    v2 = (void *)objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v42 = 0u;
    v43 = 0u;
    v44 = 0u;
    v45 = 0u;
    obj = -[FigCaptureCameraParameters cameraTuningParameters](+[FigCaptureCameraParameters sharedInstance](FigCaptureCameraParameters, "sharedInstance"), "cameraTuningParameters");
    v30 = -[NSDictionary countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v42, v48, 16);
    if (v30)
    {
      v29 = *(_QWORD *)v43;
      v3 = MEMORY[0x1E0C9AA70];
      do
      {
        v4 = 0;
        do
        {
          if (*(_QWORD *)v43 != v29)
            objc_enumerationMutation(obj);
          v32 = v4;
          v5 = *(void **)(*((_QWORD *)&v42 + 1) + 8 * (_QWORD)v4);
          if (objc_msgSend(v5, "containsString:", CFSTR("PortType")))
          {
            v6 = -[NSDictionary objectForKeyedSubscript:](obj, "objectForKeyedSubscript:", v5);
            v38 = 0u;
            v39 = 0u;
            v40 = 0u;
            v41 = 0u;
            v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v38, v47, 16);
            if (v7)
            {
              v8 = v7;
              v9 = *(_QWORD *)v39;
              do
              {
                for (i = 0; i != v8; ++i)
                {
                  if (*(_QWORD *)v39 != v9)
                    objc_enumerationMutation(v6);
                  objc_msgSend(v2, "setObject:forKeyedSubscript:", -[BWSensorConfiguration initWithPortType:sensorIDString:sensorIDDictionary:cameraInfo:]([BWSensorConfiguration alloc], "initWithPortType:sensorIDString:sensorIDDictionary:cameraInfo:", v5, *(_QWORD *)(*((_QWORD *)&v38 + 1) + 8 * i), objc_msgSend(v6, "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v38 + 1) + 8 * i)), v3), v5);
                }
                v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v38, v47, 16);
              }
              while (v8);
            }
          }
          ++v4;
        }
        while (v32 + 1 != (char *)v30);
        v30 = -[NSDictionary countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v42, v48, 16);
      }
      while (v30);
    }
    if (!objc_msgSend(v2, "count"))
      goto LABEL_31;
    v11 = objc_alloc_init(BWInferenceEngineControllerConfiguration);
    -[BWStillImageProcessorControllerConfiguration setSensorConfigurationsByPortType:](v11, "setSensorConfigurationsByPortType:", v2);
    -[BWInferenceEngineControllerConfiguration setInputFormat:](v11, "setInputFormat:", a2);
    -[BWStillImageProcessorControllerConfiguration setFigThreadPriority:](v11, "setFigThreadPriority:", 14);
    -[BWStillImageProcessorControllerConfiguration setInferenceScheduler:](v11, "setInferenceScheduler:", objc_alloc_init(BWInferenceScheduler));
    v12 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    objc_msgSend(v12, "addObject:", CFSTR("PersonSemanticsSkin"));
    objc_msgSend(v12, "addObject:", 0x1E49511B8);
    objc_msgSend(v12, "addObjectsFromArray:", BWInferenceLowResPersonInstanceMaskKeys());
    -[BWInferenceEngineControllerConfiguration setEnabledInferenceMasks:](v11, "setEnabledInferenceMasks:", v12);
    -[BWInferenceEngineControllerConfiguration setEnabledVisionInferences:](v11, "setEnabledVisionInferences:", 16);
    -[BWInferenceEngineControllerConfiguration setPersonSemanticsVersion:](v11, "setPersonSemanticsVersion:", -[FigCaptureCameraParameters personSemanticsVersion](+[FigCaptureCameraParameters sharedInstance](FigCaptureCameraParameters, "sharedInstance"), "personSemanticsVersion"));
    v13 = -[BWInferenceEngineController initWithConfiguration:contextName:]([BWInferenceEngineController alloc], "initWithConfiguration:contextName:", v11, CFSTR("SubjectRelightingCalculator"));
    v14 = v28;
    *(_QWORD *)(v28 + 40) = v13;
    if (v13)
    {
      v15 = (void *)objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
      v34 = 0u;
      v35 = 0u;
      v36 = 0u;
      v37 = 0u;
      v33 = (id)objc_msgSend(*(id *)(v28 + 40), "providedAttachedMediaKeys");
      v16 = objc_msgSend(v33, "countByEnumeratingWithState:objects:count:", &v34, v46, 16);
      if (v16)
      {
        v17 = v16;
        v18 = *(_QWORD *)v35;
LABEL_22:
        v19 = 0;
        while (1)
        {
          if (*(_QWORD *)v35 != v18)
            objc_enumerationMutation(v33);
          v20 = *(_QWORD *)(*((_QWORD *)&v34 + 1) + 8 * v19);
          result = objc_msgSend(*(id *)(v14 + 40), "outputVideoFormatForAttachedMediaKey:", v20);
          if (!result)
            break;
          v21 = result;
          v22 = [BWPixelBufferPool alloc];
          v23 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("NRF %@ Output Pool"), v20);
          v24 = +[BWMemoryPool sharedMemoryPool](BWMemoryPool, "sharedMemoryPool");
          v25 = v22;
          v14 = v28;
          result = -[BWPixelBufferPool initWithVideoFormat:capacity:name:memoryPool:](v25, "initWithVideoFormat:capacity:name:memoryPool:", v21, 1, v23, v24);
          if (!result)
            break;
          v26 = (void *)result;
          objc_msgSend(v15, "setObject:forKeyedSubscript:", result, v20);

          if (v17 == ++v19)
          {
            v17 = objc_msgSend(v33, "countByEnumeratingWithState:objects:count:", &v34, v46, 16);
            if (v17)
              goto LABEL_22;
            goto LABEL_29;
          }
        }
      }
      else
      {
LABEL_29:

        *(_QWORD *)(v14 + 48) = v15;
        return objc_msgSend(*(id *)(v14 + 40), "prepareWithPixelBufferPoolProvider:", v14);
      }
    }
    else
    {
LABEL_31:
      fig_log_get_emitter();
      return FigDebugAssert3();
    }
  }
  return result;
}

- (id)startCalculationWithJPEGSampleBuffer:(opaqueCMSampleBuffer *)a3 stillImageRequestSettings:(id)a4 stillImageCaptureSettings:(id)a5
{
  uint64_t v5;
  BWSubjectRelightingCalculatorResult *v10;
  double v11;
  uint64_t v12;
  NSObject *prepareQueue;
  opaqueCMSampleBuffer *v14;
  opaqueCMSampleBuffer *v15;
  NSObject *calculationQueue;
  uint64_t v18;
  uint64_t v19;
  _QWORD v20[9];
  CMSampleBufferRef sampleBufferOut;
  _QWORD block[5];

  v10 = objc_alloc_init(BWSubjectRelightingCalculatorResult);
  if (!self->_startedPrepare)
  {
    fig_log_get_emitter();
    v19 = v5;
    LODWORD(v18) = 0;
LABEL_12:
    FigDebugAssert3();
    goto LABEL_13;
  }
  if (!BWSampleBufferHasDetectedFaces(a3, 0, 0, 0, 1, 0))
  {
LABEL_13:
    LODWORD(v11) = -1.0;
    -[BWSubjectRelightingCalculatorResult _completeWithRelightingRequired:curveParameter:](v10, "_completeWithRelightingRequired:curveParameter:", 0, v11, v18, v19);
    return v10;
  }
  v12 = MEMORY[0x1E0C809B0];
  if (!self->_waitedForPrepare)
  {
    prepareQueue = self->_prepareQueue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __122__BWSubjectRelightingCalculator_startCalculationWithJPEGSampleBuffer_stillImageRequestSettings_stillImageCaptureSettings___block_invoke;
    block[3] = &unk_1E491E720;
    block[4] = self;
    dispatch_sync(prepareQueue, block);
  }
  v14 = -[BWPhotoDecompressor newUncompressedSampleBufferFromSampleBuffer:](self->_jpegDecompressor, "newUncompressedSampleBufferFromSampleBuffer:", a3);
  if (!v14)
  {
    fig_log_get_emitter();
    v19 = v5;
    LODWORD(v18) = 0;
    goto LABEL_12;
  }
  v15 = v14;
  sampleBufferOut = 0;
  BWCMSampleBufferCreateCopyIncludingMetadata(v14, &sampleBufferOut);
  CFRelease(v15);
  if (!sampleBufferOut)
  {
    fig_log_get_emitter();
    v19 = v5;
    LODWORD(v18) = 0;
    goto LABEL_12;
  }
  calculationQueue = self->_calculationQueue;
  v20[0] = v12;
  v20[1] = 3221225472;
  v20[2] = __122__BWSubjectRelightingCalculator_startCalculationWithJPEGSampleBuffer_stillImageRequestSettings_stillImageCaptureSettings___block_invoke_2;
  v20[3] = &unk_1E49204C8;
  v20[7] = v10;
  v20[8] = sampleBufferOut;
  v20[4] = self;
  v20[5] = a4;
  v20[6] = a5;
  dispatch_async(calculationQueue, v20);
  return v10;
}

uint64_t __122__BWSubjectRelightingCalculator_startCalculationWithJPEGSampleBuffer_stillImageRequestSettings_stillImageCaptureSettings___block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(result + 32) + 25) = 1;
  return result;
}

void __122__BWSubjectRelightingCalculator_startCalculationWithJPEGSampleBuffer_stillImageRequestSettings_stillImageCaptureSettings___block_invoke_2(uint64_t a1)
{
  void *v2;
  double v3;
  float v4;
  const void *v5;

  v2 = (void *)MEMORY[0x1A858DD40]();
  v4 = -[BWSubjectRelightingCalculator _curveParameterForSampleBuffer:stillImageRequestSettings:stillImageCaptureSettings:](*(_QWORD *)(a1 + 32), *(void **)(a1 + 64), *(_QWORD *)(a1 + 40), *(void **)(a1 + 48));
  v5 = *(const void **)(a1 + 64);
  if (v5)
    CFRelease(v5);
  *(float *)&v3 = v4;
  objc_msgSend(*(id *)(a1 + 56), "_completeWithRelightingRequired:curveParameter:", v4 >= 0.0, v3);
  objc_autoreleasePoolPop(v2);
}

- (float)_curveParameterForSampleBuffer:(uint64_t)a3 stillImageRequestSettings:(void *)a4 stillImageCaptureSettings:
{
  BWSubjectRelightingInferences *v7;

  if (!a1)
    return 0.0;
  v7 = -[BWSubjectRelightingCalculator _runInferencesOnSampleBuffer:stillImageRequestSettings:stillImageCaptureSettings:](a1, a2, a3, (uint64_t)a4);
  return -[BWSubjectRelightingCalculator _runSubjectRelightingWithInferences:sampleBuffer:stillImageCaptureType:stillImageCaptureFlags:](a1, v7, a2, objc_msgSend(a4, "captureType"), objc_msgSend(a4, "captureFlags"));
}

- (__CVBuffer)processorController:(id)a3 newOutputPixelBufferForProcessorInput:(id)a4 type:(unint64_t)a5
{
  return 0;
}

- (id)preparedOutputPixelBufferPoolForAttachedMediaKey:(id)a3 format:(id)a4
{
  return -[NSDictionary objectForKeyedSubscript:](self->_inferenceOutputPoolsByAttachedMediaKey, "objectForKeyedSubscript:", a3, a4);
}

- (BWSubjectRelightingInferences)_runInferencesOnSampleBuffer:(uint64_t)a3 stillImageRequestSettings:(uint64_t)a4 stillImageCaptureSettings:
{
  BWSubjectRelightingInferences *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  BWInferenceEngineControllerInput *v13;
  CFTypeRef v14;
  void *v15;
  void *v16;

  if (!a1)
    return 0;
  v8 = objc_alloc_init(BWSubjectRelightingInferences);
  v9 = *(void **)(a1 + 40);
  v10 = (void *)CMGetAttachment(a2, (CFStringRef)*MEMORY[0x1E0D05CB0], 0);
  v11 = objc_msgSend(v10, "objectForKeyedSubscript:", *MEMORY[0x1E0D06D00]);
  if (!a2 || (v12 = v11, !CMSampleBufferGetImageBuffer((CMSampleBufferRef)a2)))
  {
    fig_log_get_emitter();
    FigDebugAssert3();
    v13 = 0;
LABEL_10:
    v8 = 0;
    goto LABEL_11;
  }
  v13 = -[BWInferenceEngineControllerInput initWithSettings:portType:]([BWInferenceEngineControllerInput alloc], "initWithSettings:portType:", -[BWStillImageSettings initWithRequestedSettings:captureSettings:processingSettings:]([BWStillImageSettings alloc], "initWithRequestedSettings:captureSettings:processingSettings:", a3, a4, -[BWStillImageProcessingSettings initWithPhotoManifest:processIntelligentDistortionCorrection:]([BWStillImageProcessingSettings alloc], "initWithPhotoManifest:processIntelligentDistortionCorrection:", objc_alloc_init(BWPhotoManifest), 0)), v12);
  v14 = CMGetAttachment(a2, CFSTR("UprightExifOrientation"), 0);
  if (v14)
    v15 = (void *)v14;
  else
    v15 = &unk_1E49F8FD0;
  objc_msgSend(v10, "setObject:forKeyedSubscript:", v15, *MEMORY[0x1E0D05E50]);
  -[BWInferenceEngineControllerInput addInferenceImage:](v13, "addInferenceImage:", a2);
  v16 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  objc_msgSend(v16, "addObject:", CFSTR("PersonSemanticsSkin"));
  objc_msgSend(v16, "addObject:", 0x1E49511B8);
  objc_msgSend(v16, "addObjectsFromArray:", BWInferenceLowResPersonInstanceMaskKeys());
  -[BWInferenceEngineControllerInput setEnabledInferenceMasks:](v13, "setEnabledInferenceMasks:", v16);
  -[BWInferenceEngineControllerInput setEnabledVisionInferences:](v13, "setEnabledVisionInferences:", 16);
  if (objc_msgSend(v9, "enqueueInputForProcessing:delegate:", v13, a1))
  {
    fig_log_get_emitter();
    FigDebugAssert3();
    goto LABEL_10;
  }
  -[BWSubjectRelightingInferences setSkinMask:](v8, "setSkinMask:", objc_msgSend((id)objc_opt_class(), "inferenceMaskFromSbuf:attachedMediaKey:", a2, CFSTR("PersonSemanticsSkin")));
  -[BWSubjectRelightingInferences setPersonMask:](v8, "setPersonMask:", objc_msgSend((id)objc_opt_class(), "inferenceMaskFromSbuf:attachedMediaKey:", a2, 0x1E49511B8));
  -[BWSubjectRelightingInferences setLowResPersonInstanceMasks:](v8, "setLowResPersonInstanceMasks:", objc_msgSend((id)objc_opt_class(), "lowResPersonInstanceMasksFromSbuf:", a2));
  -[BWSubjectRelightingInferences setLowResPersonInstanceConfidences:](v8, "setLowResPersonInstanceConfidences:", objc_msgSend((id)objc_opt_class(), "lowResPersonInstanceConfidencesFromSbuf:", a2));
  -[BWSubjectRelightingInferences setLowResPersonInstanceBoundingBoxes:](v8, "setLowResPersonInstanceBoundingBoxes:", objc_msgSend((id)objc_opt_class(), "lowResPersonInstanceBoundingBoxesFromSbuf:", a2));
  -[BWSubjectRelightingInferences setSkinToneClassificationsForFaces:](v8, "setSkinToneClassificationsForFaces:", objc_msgSend((id)objc_opt_class(), "skinToneClassificationsFromSbuf:", a2));
LABEL_11:

  return v8;
}

- (float)_runSubjectRelightingWithInferences:(void *)target sampleBuffer:(int)a4 stillImageCaptureType:(char)a5 stillImageCaptureFlags:
{
  uint64_t v5;
  void *v11;
  __CVBuffer *ImageBuffer;
  __CVBuffer *v13;
  int v14;
  int v15;
  int v16;
  int v17;
  void *v18;
  int v19;
  int v20;
  void *v21;
  uint64_t v22;
  __CFString *v23;
  float v24;
  int v25;
  const __CFString *v26;
  const __CFString *v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  double v36;
  double v37;
  int v38;
  int v39;
  float v40;
  int v42;
  uint64_t v43;
  uint64_t v44;
  double Width;
  double Height;

  if (!a1)
    return 0.0;
  v11 = (void *)CMGetAttachment(target, (CFStringRef)*MEMORY[0x1E0D05CB0], 0);
  ImageBuffer = CMSampleBufferGetImageBuffer((CMSampleBufferRef)target);
  if (!ImageBuffer)
    goto LABEL_29;
  v13 = ImageBuffer;
  Width = (double)CVPixelBufferGetWidth(ImageBuffer);
  Height = (double)CVPixelBufferGetHeight(v13);
  FigCFDictionaryGetCGRectIfPresent();
  objc_msgSend((id)objc_msgSend(v11, "objectForKeyedSubscript:", *MEMORY[0x1E0D06A10]), "floatValue");
  v15 = v14;
  objc_msgSend((id)objc_msgSend(v11, "objectForKeyedSubscript:", *MEMORY[0x1E0D06A40]), "floatValue");
  v17 = v16;
  v18 = (void *)CMGetAttachment(target, CFSTR("UprightExifOrientation"), 0);
  v19 = objc_msgSend(v18, "intValue");
  v20 = v18 ? v19 : 1;
  v21 = (void *)objc_msgSend((id)objc_msgSend((id)objc_msgSend(-[FigCaptureCameraParameters sensorIDDictionaryForPortType:sensorIDString:](+[FigCaptureCameraParameters sharedInstance](FigCaptureCameraParameters, "sharedInstance"), "sensorIDDictionaryForPortType:sensorIDString:", objc_msgSend(v11, "objectForKeyedSubscript:", *MEMORY[0x1E0D06D00]), +[FigCaptureCameraParameters sensorIDStringFromMetadata:](FigCaptureCameraParameters, "sensorIDStringFromMetadata:", v11)), "objectForKeyedSubscript:", CFSTR("NRFParameters")), "objectForKeyedSubscript:", CFSTR("NRFParameters")), "objectForKeyedSubscript:", CFSTR("ToneMapping"));
  v22 = *MEMORY[0x1E0D06D20];
  switch(a4)
  {
    case 10:
      v23 = objc_msgSend((id)objc_msgSend(v11, "objectForKeyedSubscript:", v22), "intValue") == 1
          ? CFSTR("DefaultUBModeQuadraParameters")
          : CFSTR("DefaultUBModeParameters");
      break;
    case 11:
      objc_msgSend((id)objc_msgSend(v11, "objectForKeyedSubscript:", v22), "intValue");
      fig_log_get_emitter();
      v44 = v5;
      LODWORD(v43) = 0;
      goto LABEL_14;
    case 12:
      objc_msgSend((id)objc_msgSend(v11, "objectForKeyedSubscript:", v22), "intValue");
      v23 = CFSTR("DefaultUBModeParameters");
      break;
    default:
      v25 = objc_msgSend((id)objc_msgSend(v11, "objectForKeyedSubscript:", v22), "intValue");
      v26 = CFSTR("SingleImageParametersForLearnedNR");
      if ((a5 & 0x80) == 0)
        v26 = CFSTR("SingleImageParameters");
      v27 = CFSTR("SingleImageQuadraParameters");
      if (a5 < 0)
        v27 = CFSTR("SingleImageParametersForQuadraLearnedNR");
      v23 = (__CFString *)(v25 == 1 ? v27 : v26);
      break;
  }
  v28 = objc_msgSend((id)objc_msgSend(v21, "objectForKeyedSubscript:", v23), "objectForKeyedSubscript:", CFSTR("SRLv2"));
  if (!v28)
  {
LABEL_29:
    fig_log_get_emitter();
    v44 = v5;
    LODWORD(v43) = 0;
    goto LABEL_14;
  }
  v29 = v28;
  v30 = *(void **)(a1 + 56);
  v31 = objc_msgSend(a2, "skinMask");
  v32 = objc_msgSend(a2, "personMask");
  v33 = objc_msgSend(a2, "lowResPersonInstanceMasks");
  v34 = objc_msgSend(a2, "lowResPersonInstanceConfidences");
  v35 = objc_msgSend(a2, "skinToneClassificationsForFaces");
  LODWORD(v43) = v20;
  LODWORD(v36) = v15;
  LODWORD(v37) = v17;
  v38 = objc_msgSend(v30, "runSRLForLivePhotosWithInputBuffer:skinMask:personMask:instanceMasks:instanceMaskConfidences:skinToneClassification:validROI:expBias:faceExpRatio:exifOrientation:srlV2Plist:", v13, v31, v32, v33, v34, v35, 0.0, 0.0, Width, Height, v36, v37, v43, v29);
  if (!v38)
  {
    v39 = objc_msgSend(*(id *)(a1 + 56), "mitigationNeeded");
    objc_msgSend(*(id *)(a1 + 56), "curveParameter");
    if (v39)
      v24 = v40;
    else
      v24 = -1.0;
    goto LABEL_27;
  }
  v42 = v38;
  fig_log_get_emitter();
  v44 = v5;
  LODWORD(v43) = v42;
LABEL_14:
  FigDebugAssert3();
  v24 = -1.0;
LABEL_27:
  objc_msgSend(*(id *)(a1 + 56), "reset", v43, v44);
  return v24;
}

@end
