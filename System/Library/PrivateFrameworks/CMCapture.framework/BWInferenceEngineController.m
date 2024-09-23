@implementation BWInferenceEngineController

- (BOOL)intermediateResourceTrackingAllowedForAttachedMediaKey:(id)a3
{
  return objc_msgSend(a3, "isEqualToString:", CFSTR("PrimaryFormat"));
}

- (id)inputInferenceVideoFormatForAttachedMediaKey:(id)a3
{
  uint64_t v5;

  if (!objc_msgSend(a3, "isEqualToString:", CFSTR("PrimaryFormat")))
    return 0;
  LODWORD(v5) = 0;
  return -[BWInferenceVideoFormat initWithUnderlyingFormat:isDeviceOriented:videoContentMode:includesInvalidContent:cropDescriptor:histogramRequest:rotationDegrees:]([BWInferenceVideoFormat alloc], "initWithUnderlyingFormat:isDeviceOriented:videoContentMode:includesInvalidContent:cropDescriptor:histogramRequest:rotationDegrees:", self->_inputFormat, 0, 0, 0, 0, 0, v5);
}

- (int)prepareWithPixelBufferPoolProvider:(id)a3
{
  int v5;
  int v6;

  v5 = -[BWInferenceEngine enableIntermediateBufferSharingWithNetworksLoadedFromPath:](self->_inferenceEngine, "enableIntermediateBufferSharingWithNetworksLoadedFromPath:", CFSTR("/System/Library/Frameworks/Vision.framework/"));
  if (v5)
  {
    v6 = v5;
    goto LABEL_6;
  }
  v6 = -[BWInferenceEngine prepareForInferenceWithFormatProvider:pixelBufferPoolProvider:](self->_inferenceEngine, "prepareForInferenceWithFormatProvider:pixelBufferPoolProvider:", self, a3);
  if (v6)
  {
LABEL_6:
    FigDebugAssert3();
    return v6;
  }
  self->_inferenceEnginePrepared = 1;
  return v6;
}

- (BWInferenceEngineController)initWithConfiguration:(id)a3 contextName:(id)a4
{
  NSString *v6;
  BWInferenceEngine *v7;
  BWVideoFormat *v8;
  char v9;
  BWFaceSegmentsWithLandmarksInferenceConfiguration *v10;
  int v11;
  void *v12;
  uint64_t v13;
  unsigned int v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  uint64_t v18;
  uint64_t v19;
  id v20;
  unsigned int v21;
  uint64_t v22;
  uint64_t Major;
  uint64_t v24;
  BWPersonSemanticsConfiguration *v25;
  uint64_t v26;
  BWMattingV2InferenceConfiguration *v27;
  uint64_t v28;
  double v29;
  NSDictionary *v31;
  void *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t j;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  void *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  void *v43;
  BOOL v44;
  unsigned int v46;
  BWInferenceEngineController *v47;
  id v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  _QWORD v61[5];
  _QWORD v62[6];
  objc_super v63;
  _BYTE v64[128];
  _BYTE v65[128];
  _BYTE v66[128];
  uint64_t v67;

  v67 = *MEMORY[0x1E0C80C00];
  v6 = (NSString *)a4;
  self->_contextName = v6;
  v63.receiver = self;
  v63.super_class = (Class)BWInferenceEngineController;
  v48 = a3;
  v47 = -[BWStillImageProcessorController initWithName:type:configuration:](&v63, sel_initWithName_type_configuration_, objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@:%@"), CFSTR("InferenceEngineController"), v6), 3, a3);
  if (!v47)
  {
    FigDebugAssert3();
    goto LABEL_42;
  }
  if (!objc_msgSend(a3, "inferenceScheduler"))
    goto LABEL_42;
  v46 = objc_msgSend(a3, "figThreadPriority");
  v7 = -[BWInferenceEngine initWithScheduler:priority:shareIntermediateBuffer:]([BWInferenceEngine alloc], "initWithScheduler:priority:shareIntermediateBuffer:", objc_msgSend(a3, "inferenceScheduler"), v46, 1);
  v47->_inferenceEngine = v7;
  if (!v7)
    goto LABEL_42;
  if (!objc_msgSend((id)objc_msgSend(a3, "sensorConfigurationsByPortType"), "count"))
    goto LABEL_42;
  v8 = (BWVideoFormat *)(id)objc_msgSend(a3, "inputFormat");
  v47->_inputFormat = v8;
  if (!v8)
    goto LABEL_42;
  v9 = objc_msgSend(a3, "producesHighQualityInferencesFromZoomRegionWithLargeDigitalZoom");
  v47->_producesHighQualityInferencesFromZoomRegionWithLargeDigitalZoom = v9;
  v47->_appliesFinalCropRect = v9;
  if (objc_msgSend(a3, "enabledVisionInferences"))
  {
    v10 = -[BWFaceSegmentsWithLandmarksInferenceConfiguration initWithInferenceType:]([BWFaceSegmentsWithLandmarksInferenceConfiguration alloc], "initWithInferenceType:", 802);
    -[BWInferenceConfiguration setPriority:](v10, "setPriority:", v46);
    -[BWFaceSegmentsWithLandmarksInferenceConfiguration setIncludesInvalidContent:](v10, "setIncludesInvalidContent:", 0);
    -[BWLandmarksInferenceConfiguration setAlwaysExecuteForRedEyeReduction:](v10, "setAlwaysExecuteForRedEyeReduction:", 1);
    -[BWFaceSegmentsWithLandmarksInferenceConfiguration setDetectFacesInFullSizeInput:](v10, "setDetectFacesInFullSizeInput:", 1);
    -[BWLandmarksInferenceConfiguration setDetectLandmarksInFullSizeInput:](v10, "setDetectLandmarksInFullSizeInput:", 1);
    if ((objc_msgSend(a3, "enabledVisionInferences") & 0x10) != 0)
    {
      -[BWLandmarksInferenceConfiguration setMaximumNumberOfFaces:](v10, "setMaximumNumberOfFaces:", 4);
      -[BWLandmarksInferenceConfiguration setClampToLargestMaximumNumberOfFaces:](v10, "setClampToLargestMaximumNumberOfFaces:", 1);
      -[BWLandmarksInferenceConfiguration setConsiderISPRectsIfVisionFails:](v10, "setConsiderISPRectsIfVisionFails:", 1);
    }
    else
    {
      -[BWLandmarksInferenceConfiguration setMaximumNumberOfFaces:](v10, "setMaximumNumberOfFaces:", 3);
      -[BWFaceSegmentsWithLandmarksInferenceConfiguration setSkipSkinToneClassification:](v10, "setSkipSkinToneClassification:", 1);
    }
    -[BWFaceSegmentsWithLandmarksInferenceConfiguration setSkipFaceLandmarkDetection:](v10, "setSkipFaceLandmarkDetection:", (objc_msgSend(a3, "enabledVisionInferences") & 2) == 0);
    -[BWFaceSegmentsWithLandmarksInferenceConfiguration setSkipFoodAndDrinkDetection:](v10, "setSkipFoodAndDrinkDetection:", (objc_msgSend(a3, "enabledVisionInferences") & 8) == 0);
    -[BWVisionInferenceConfiguration setSuppressTimeOutFailure:](v10, "setSuppressTimeOutFailure:", objc_msgSend(a3, "suppressVisionTimeOutFailure"));
    v62[0] = 0;
    v62[1] = v62;
    v62[2] = 0x3052000000;
    v62[3] = __Block_byref_object_copy__4;
    v62[4] = __Block_byref_object_dispose__4;
    v62[5] = v47;
    v61[0] = MEMORY[0x1E0C809B0];
    v61[1] = 3221225472;
    v61[2] = __65__BWInferenceEngineController_initWithConfiguration_contextName___block_invoke;
    v61[3] = &unk_1E491F0E8;
    v61[4] = v62;
    -[BWVisionInferenceConfiguration setShouldPreventRequestForSampleBuffer:](v10, "setShouldPreventRequestForSampleBuffer:", v61);
    v11 = -[BWInferenceEngine addInferenceOfType:version:configuration:](v47->_inferenceEngine, "addInferenceOfType:version:configuration:", 802, -[BWLandmarksInferenceConfiguration landmarksInferenceVersion](v10, "landmarksInferenceVersion") & 0xFFFFFFFFFFFFLL, v10);
    _Block_object_dispose(v62, 8);
    if (v11)
      goto LABEL_42;
  }
  if (objc_msgSend((id)objc_msgSend(a3, "enabledInferenceMasks"), "count"))
  {
    v59 = 0u;
    v60 = 0u;
    v57 = 0u;
    v58 = 0u;
    v12 = (void *)objc_msgSend(a3, "enabledInferenceMasks");
    v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v57, v66, 16);
    v14 = 0;
    v15 = 0;
    if (v13)
    {
      v16 = *(_QWORD *)v58;
      do
      {
        for (i = 0; i != v13; ++i)
        {
          if (*(_QWORD *)v58 != v16)
            objc_enumerationMutation(v12);
          v18 = *(_QWORD *)(*((_QWORD *)&v57 + 1) + 8 * i);
          v19 = +[BWMattingV2InferenceConfiguration mattingOutputTypeForAttachedMediaKey:](BWMattingV2InferenceConfiguration, "mattingOutputTypeForAttachedMediaKey:", v18);
          if ((_DWORD)v19)
          {
            v20 = +[BWMattingV2InferenceConfiguration inputAttachedMediaKeyForMattingOutputType:](BWMattingV2InferenceConfiguration, "inputAttachedMediaKeyForMattingOutputType:", v19);
            v21 = +[BWPersonSemanticsConfiguration personSemanticForAttachedMediaKey:](BWPersonSemanticsConfiguration, "personSemanticForAttachedMediaKey:", v20);
            v14 |= v19;
            if (objc_msgSend((id)objc_msgSend(v48, "enabledInferenceMasks"), "containsObject:", v20))
              v14 |= +[BWMattingV2InferenceConfiguration mattingOutputTypeForAttachedMediaKey:](BWMattingV2InferenceConfiguration, "mattingOutputTypeForAttachedMediaKey:", objc_msgSend(v20, "stringByAppendingString:", CFSTR("Clone")));
          }
          else
          {
            v21 = +[BWPersonSemanticsConfiguration personSemanticForAttachedMediaKey:](BWPersonSemanticsConfiguration, "personSemanticForAttachedMediaKey:", v18);
          }
          v15 = v21 | v15;
        }
        v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v57, v66, 16);
      }
      while (v13);
    }
    v22 = objc_msgSend(v48, "personSemanticsVersion");
    Major = BWInferenceVersionMakeMajor(0);
    if ((_DWORD)v15)
    {
      v24 = BWInferenceVersionMakeMajor(3);
      if ((v15 & 0x40) != 0)
        v24 = BWInferenceVersionMakeMajor(4);
      if ((v15 & 0x80) == 0 || !(_DWORD)v22)
      {
LABEL_30:
        if ((_WORD)v24)
        {
          v25 = -[BWInferenceConfiguration initWithInferenceType:]([BWPersonSemanticsConfiguration alloc], "initWithInferenceType:", 104);
          -[BWPersonSemanticsConfiguration setEnabledSemantics:](v25, "setEnabledSemantics:", v15);
          -[BWInferenceConfiguration setPriority:](v25, "setPriority:", v46);
          -[BWPersonSemanticsConfiguration setAppliesFinalCropRect:](v25, "setAppliesFinalCropRect:", v47->_appliesFinalCropRect);
          if (!-[BWInferenceEngine addInferenceOfType:version:configuration:](v47->_inferenceEngine, "addInferenceOfType:version:configuration:", 104, v24 & 0xFFFFFFFFFFFFLL, v25))
          {
            v26 = objc_msgSend(v48, "mattingOutputValidContentDetectionEnabled") ? v14 | 0x100 : v14;
            if (!(_DWORD)v26)
              goto LABEL_40;
            v27 = -[BWInferenceConfiguration initWithInferenceType:]([BWMattingV2InferenceConfiguration alloc], "initWithInferenceType:", 201);
            -[BWMattingV2InferenceConfiguration setSensorConfigurationsByPortType:](v27, "setSensorConfigurationsByPortType:", objc_msgSend(v48, "sensorConfigurationsByPortType"));
            -[BWMattingV2InferenceConfiguration setEnabledMattes:](v27, "setEnabledMattes:", v26);
            v28 = objc_msgSend(v48, "fastMattingEnabled") ? 1 : 2;
            -[BWMattingV2InferenceConfiguration setTuningConfiguration:](v27, "setTuningConfiguration:", v28);
            -[BWInferenceConfiguration setPriority:](v27, "setPriority:", v46);
            LODWORD(v29) = 1.0;
            -[BWMattingV2InferenceConfiguration setMainImageDownscalingFactor:](v27, "setMainImageDownscalingFactor:", v29);
            -[BWMattingV2InferenceConfiguration setDepthDataDeliveryEnabled:](v27, "setDepthDataDeliveryEnabled:", 0);
            -[BWMattingV2InferenceConfiguration setMetalCommandQueue:](v27, "setMetalCommandQueue:", objc_msgSend(v48, "metalCommandQueue"));
            -[BWMattingV2InferenceConfiguration setSubmitWithoutSynchronization:](v27, "setSubmitWithoutSynchronization:", 0);
            -[BWMattingV2InferenceConfiguration setAppliesFinalCropRect:](v27, "setAppliesFinalCropRect:", v47->_appliesFinalCropRect);
            if (!-[BWInferenceEngine addInferenceOfType:version:configuration:](v47->_inferenceEngine, "addInferenceOfType:version:configuration:", 201, BWInferenceVersionMakeMajor(2) & 0xFFFFFFFFFFFFLL, v27))goto LABEL_40;
          }
        }
LABEL_42:

        return 0;
      }
      Major = BWInferenceVersionMakeMajor(v22);
    }
    v24 = Major;
    goto LABEL_30;
  }
LABEL_40:
  if (objc_msgSend(v48, "smartCameraClassificationsEnabled")
    && -[BWInferenceEngine addInferenceOfType:version:configuration:](v47->_inferenceEngine, "addInferenceOfType:version:configuration:", 101, BWInferenceSmartCameraCurrentVersion() & 0xFFFFFFFFFFFFLL, -[BWInferenceConfiguration initWithInferenceType:]([BWInferenceConfiguration alloc], "initWithInferenceType:", 101))|| -[BWInferenceEngine prepareForInputVideoFormat:attachedMediaKey:](v47->_inferenceEngine, "prepareForInputVideoFormat:attachedMediaKey:", objc_msgSend(v48, "inputFormat"), CFSTR("PrimaryFormat")))
  {
    goto LABEL_42;
  }
  v31 = -[BWInferenceEngine providedVideoRequirementsByAttachedMediaKey](v47->_inferenceEngine, "providedVideoRequirementsByAttachedMediaKey");
  v32 = (void *)objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v55 = 0u;
  v56 = 0u;
  v53 = 0u;
  v54 = 0u;
  v33 = -[NSDictionary countByEnumeratingWithState:objects:count:](v31, "countByEnumeratingWithState:objects:count:", &v53, v65, 16);
  if (v33)
  {
    v34 = *(_QWORD *)v54;
    do
    {
      for (j = 0; j != v33; ++j)
      {
        if (*(_QWORD *)v54 != v34)
          objc_enumerationMutation(v31);
        v36 = *(_QWORD *)(*((_QWORD *)&v53 + 1) + 8 * j);
        v37 = objc_msgSend((id)objc_msgSend(-[NSDictionary objectForKeyedSubscript:](v31, "objectForKeyedSubscript:", v36), "videoFormat"), "underlyingVideoFormat");
        if (v37)
          objc_msgSend(v32, "setObject:forKeyedSubscript:", v37, v36);
      }
      v33 = -[NSDictionary countByEnumeratingWithState:objects:count:](v31, "countByEnumeratingWithState:objects:count:", &v53, v65, 16);
    }
    while (v33);
  }
  v38 = objc_msgSend(v32, "count");
  if (v38 != -[NSDictionary count](v31, "count"))
    goto LABEL_42;
  v51 = 0u;
  v52 = 0u;
  v49 = 0u;
  v50 = 0u;
  v39 = (void *)objc_msgSend(v48, "enabledInferenceMasks");
  v40 = objc_msgSend(v39, "countByEnumeratingWithState:objects:count:", &v49, v64, 16);
  if (v40)
  {
    v41 = *(_QWORD *)v50;
LABEL_57:
    v42 = 0;
    while (1)
    {
      if (*(_QWORD *)v50 != v41)
        objc_enumerationMutation(v39);
      v43 = *(void **)(*((_QWORD *)&v49 + 1) + 8 * v42);
      v44 = -[NSDictionary objectForKeyedSubscript:](v31, "objectForKeyedSubscript:", v43) == 0;
      if (!-[NSDictionary objectForKeyedSubscript:](v31, "objectForKeyedSubscript:", objc_msgSend(v43, "stringByAppendingString:", CFSTR("Clone")))&& v44)
      {
        goto LABEL_42;
      }
      if (v40 == ++v42)
      {
        v40 = objc_msgSend(v39, "countByEnumeratingWithState:objects:count:", &v49, v64, 16);
        if (v40)
          goto LABEL_57;
        break;
      }
    }
  }
  v47->_inferenceOutputFormatByAttachedMediaKey = (NSDictionary *)v32;
  if (v47->_producesHighQualityInferencesFromZoomRegionWithLargeDigitalZoom)
  {
    v47->_pixelTransferSessionByMediaKey = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    v47->_outputFormatDescriptionByAttachedMediaKey = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
  }
  return v47;
}

+ (BOOL)usesCustomProcessingFlow
{
  return 0;
}

- (id)outputVideoFormatForAttachedMediaKey:(id)a3
{
  return -[NSDictionary objectForKeyedSubscript:](self->_inferenceOutputFormatByAttachedMediaKey, "objectForKeyedSubscript:", a3);
}

- (NSArray)providedAttachedMediaKeys
{
  return -[NSDictionary allKeys](self->_inferenceOutputFormatByAttachedMediaKey, "allKeys");
}

BOOL __65__BWInferenceEngineController_initWithConfiguration_contextName___block_invoke(uint64_t a1)
{
  char v1;
  _BOOL8 v2;
  _BOOL8 v3;

  v1 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "currentRequest"), "input"), "enabledVisionInferences");
  v2 = (v1 & 4) == 0;
  v3 = (v1 & 0x17) == 0;
  getVNDetectFaceRectanglesRequestClass();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    return v3;
  v3 = (v1 & 2) == 0;
  getVNDetectFaceLandmarksRequestClass();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    return v3;
  getVNGenerateFaceSegmentsRequestClass();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    getVNClassifyFaceAttributesRequestClass();
    objc_opt_class();
    v2 = (v1 & 0x10) == 0;
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      getVNRecognizeFoodAndDrinkRequestClass();
      objc_opt_class();
      return objc_opt_isKindOfClass() & ((v1 & 8) == 0);
    }
  }
  return v2;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)BWInferenceEngineController;
  -[BWStillImageProcessorController dealloc](&v3, sel_dealloc);
}

- (void)inputReceivedNewData:(id)a3
{
  if (-[BWStillImageProcessorControllerRequest input](-[BWStillImageProcessorController currentRequest](self, "currentRequest"), "input") == a3)-[BWStillImageProcessorController currentRequestChanged](self, "currentRequestChanged");
}

- (BOOL)inferenceEnginePrepared
{
  return self->_inferenceEnginePrepared;
}

+ (__CVBuffer)inferenceMaskFromSbuf:(opaqueCMSampleBuffer *)a3 attachedMediaKey:(id)a4
{
  __CVBuffer *result;

  result = (__CVBuffer *)objc_msgSend(a1, "inferenceMaskSbufFromSbuf:attachedMediaKey:", a3, a4);
  if (result)
    return CMSampleBufferGetImageBuffer(result);
  return result;
}

+ (opaqueCMSampleBuffer)inferenceMaskSbufFromSbuf:(opaqueCMSampleBuffer *)a3 attachedMediaKey:(id)a4
{
  opaqueCMSampleBuffer *result;

  result = (opaqueCMSampleBuffer *)BWSampleBufferGetAttachedMedia(a3, (uint64_t)a4);
  if (!result)
    return (opaqueCMSampleBuffer *)BWSampleBufferGetAttachedMedia(a3, objc_msgSend(a4, "stringByAppendingString:", CFSTR("Clone")));
  return result;
}

+ (id)lowResPersonInstanceMasksFromSbuf:(opaqueCMSampleBuffer *)a3
{
  return BWInferenceGetLowResPersonInstanceMasksFromSampleBuffer(a3);
}

+ (id)lowResPersonInstanceConfidencesFromSbuf:(opaqueCMSampleBuffer *)a3
{
  return (id)BWInferenceGetAttachedInference(a3, 104, 0x1E4951338);
}

+ (id)lowResPersonInstanceBoundingBoxesFromSbuf:(opaqueCMSampleBuffer *)a3
{
  return (id)BWInferenceGetAttachedInference(a3, 104, 0x1E4951358);
}

+ (id)smartCameraClassificationsFromSbuf:(opaqueCMSampleBuffer *)a3
{
  return (id)objc_msgSend((id)BWInferenceGetAttachedInferenceResult(a3, 101), "inferences");
}

+ (id)skinToneClassificationsFromSbuf:(opaqueCMSampleBuffer *)a3
{
  return (id)BWInferenceGetAttachedInference(a3, 802, 0x1E4951158);
}

+ (id)faceObservationsFromSbuf:(opaqueCMSampleBuffer *)a3
{
  void *AttachedInference;

  AttachedInference = (void *)BWInferenceGetAttachedInference(a3, 802, 0x1E4951058);
  if (objc_msgSend(AttachedInference, "count"))
    return AttachedInference;
  else
    return (id)BWInferenceGetAttachedInference(a3, 802, (uint64_t)CFSTR("VisionFaceDetectionObservations"));
}

- (id)inputVideoFormatForAttachedMediaKey:(id)a3
{
  return 0;
}

- (void)reset
{
  -[NSMutableDictionary removeAllObjects](self->_pixelTransferSessionByMediaKey, "removeAllObjects");
  -[NSMutableDictionary removeAllObjects](self->_outputFormatDescriptionByAttachedMediaKey, "removeAllObjects");
}

- (id)requestForInput:(id)a3 delegate:(id)a4 errOut:(int *)a5
{
  BWInferenceEngineControllerRequest *v6;
  int v7;

  v6 = -[BWStillImageProcessorControllerRequest initWithInput:delegate:]([BWInferenceEngineControllerRequest alloc], "initWithInput:delegate:", a3, a4);
  if (v6)
    v7 = 0;
  else
    v7 = -12786;
  if (a5)
    *a5 = v7;
  return v6;
}

- (int)prepare
{
  return 0;
}

- (int)process
{
  uint64_t v2;
  BWStillImageProcessorControllerRequest *v4;
  BWStillImageProcessorControllerInput *v5;
  BWInferenceEngine *inferenceEngine;
  opaqueCMSampleBuffer *v7;
  opaqueCMSampleBuffer *v8;
  __CVBuffer *ImageBuffer;
  IOSurfaceRef IOSurface;
  __IOSurface *v11;
  id v12;
  void *v13;
  double v14;
  double v15;
  double FinalCropRect;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  float v22;
  BOOL v24;
  uint64_t v25;
  _BOOL4 appliesFinalCropRect;
  char v27;
  NSDictionary *inferenceOutputFormatByAttachedMediaKey;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t i;
  uint64_t v33;
  const void *AttachedMedia;
  uint64_t v35;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  _BYTE v44[128];
  uint64_t v45;

  v45 = *MEMORY[0x1E0C80C00];
  v4 = -[BWStillImageProcessorController currentRequest](self, "currentRequest");
  v5 = -[BWStillImageProcessorControllerRequest input](v4, "input");
  inferenceEngine = self->_inferenceEngine;
  if (inferenceEngine
    && -[BWInferenceEngine isConfiguredForInference](inferenceEngine, "isConfiguredForInference")
    && self->_inferenceEnginePrepared
    && (v7 = (opaqueCMSampleBuffer *)-[BWStillImageProcessorControllerInput inferenceImage](v5, "inferenceImage")) != 0
    && (v8 = v7,
        ImageBuffer = CMSampleBufferGetImageBuffer(v7),
        (IOSurface = CVPixelBufferGetIOSurface(ImageBuffer)) != 0))
  {
    v11 = IOSurface;
    if (objc_msgSend((id)-[BWStillImageProcessorControllerInput enabledInferenceMasks](v5, "enabledInferenceMasks"), "count")|| (-[BWStillImageProcessorControllerInput smartCameraClassificationsEnabled](v5, "smartCameraClassificationsEnabled") & 1) != 0|| -[BWStillImageProcessorControllerInput enabledVisionInferences](v5, "enabledVisionInferences"))
    {
      IOSurfaceLock(v11, 5u, 0);
      IOSurfaceUnlock(v11, 5u, 0);
      v12 = -[BWInferenceEngineController _suppressedInferenceTypesForInput:](self, "_suppressedInferenceTypesForInput:", v5);
      v13 = (void *)CMGetAttachment(v8, (CFStringRef)*MEMORY[0x1E0D05CB0], 0);
      FinalCropRect = FigCaptureMetadataUtilitiesGetFinalCropRect();
      v18 = v17;
      v19 = v14;
      v20 = v15;
      if (v14 >= v15)
        v21 = v15;
      else
        v21 = v14;
      v22 = 1.0 / v21;
      v24 = v22 > 1.25 && self->_producesHighQualityInferencesFromZoomRegionWithLargeDigitalZoom;
      if (self->_appliesFinalCropRect && !v24)
        objc_msgSend(v13, "removeObjectForKey:", *MEMORY[0x1E0D05E68]);
      v25 = -[BWInferenceEngine performInferencesOnSampleBuffer:attachingResultsToSampleBuffer:skippingInferencesWithTypes:](self->_inferenceEngine, "performInferencesOnSampleBuffer:attachingResultsToSampleBuffer:skippingInferencesWithTypes:", v8, v8, v12);
      if ((_DWORD)v25)
      {
        v37 = v25;
        goto LABEL_42;
      }
      appliesFinalCropRect = self->_appliesFinalCropRect;
      v27 = !self->_appliesFinalCropRect || v24;
      if ((v27 & 1) == 0)
      {
        FigCFDictionarySetCGRect();
        appliesFinalCropRect = self->_appliesFinalCropRect;
      }
      if (appliesFinalCropRect && self->_producesHighQualityInferencesFromZoomRegionWithLargeDigitalZoom)
      {
        v42 = 0u;
        v43 = 0u;
        v40 = 0u;
        v41 = 0u;
        inferenceOutputFormatByAttachedMediaKey = self->_inferenceOutputFormatByAttachedMediaKey;
        v29 = -[NSDictionary countByEnumeratingWithState:objects:count:](inferenceOutputFormatByAttachedMediaKey, "countByEnumeratingWithState:objects:count:", &v40, v44, 16);
        if (v29)
        {
          v30 = v29;
          v31 = *(_QWORD *)v41;
          do
          {
            for (i = 0; i != v30; ++i)
            {
              if (*(_QWORD *)v41 != v31)
                objc_enumerationMutation(inferenceOutputFormatByAttachedMediaKey);
              v33 = *(_QWORD *)(*((_QWORD *)&v40 + 1) + 8 * i);
              AttachedMedia = (const void *)BWSampleBufferGetAttachedMedia(v8, v33);
              if (AttachedMedia)
              {
                if (v24)
                {
                  v35 = -[BWInferenceEngineController _unzoomAndBlackenBordersOnAttachedMediaSampleBuffer:inputSbuf:attachedMediaKey:finalCropRect:](self, "_unzoomAndBlackenBordersOnAttachedMediaSampleBuffer:inputSbuf:attachedMediaKey:finalCropRect:", AttachedMedia, v8, v33, FinalCropRect, v18, v19, v20);
                  if ((_DWORD)v35)
                  {
                    v37 = v35;
                    v39 = v2;
                    LODWORD(v38) = v35;
                    FigDebugAssert3();
                    goto LABEL_42;
                  }
                }
                else
                {
                  BWPropagateZoomInformationToAttachedMediaSampleBuffer(v8, AttachedMedia);
                }
              }
            }
            v30 = -[NSDictionary countByEnumeratingWithState:objects:count:](inferenceOutputFormatByAttachedMediaKey, "countByEnumeratingWithState:objects:count:", &v40, v44, 16);
          }
          while (v30);
        }
      }
    }
    v37 = 0;
  }
  else
  {
    v37 = 4294954516;
  }
LABEL_42:
  -[BWStillImageProcessorControllerDelegate processorController:didFinishProcessingSampleBuffer:type:processorInput:err:](-[BWStillImageProcessorControllerRequest delegate](v4, "delegate", v38, v39), "processorController:didFinishProcessingSampleBuffer:type:processorInput:err:", self, -[BWStillImageProcessorControllerInput inferenceImage](v5, "inferenceImage"), 16, v5, v37);
  return v37;
}

- (int)_unzoomAndBlackenBordersOnAttachedMediaSampleBuffer:(opaqueCMSampleBuffer *)a3 inputSbuf:(opaqueCMSampleBuffer *)a4 attachedMediaKey:(id)a5 finalCropRect:(CGRect)a6
{
  double height;
  double width;
  double y;
  double x;
  __CVBuffer *ImageBuffer;
  __CVBuffer *v14;
  uint64_t v15;
  __CVBuffer *v16;
  CFDictionaryRef DictionaryRepresentation;
  OpaqueVTPixelTransferSession *v18;
  OpaqueVTPixelTransferSession *v19;
  OSStatus v20;
  CFTypeRef v21;
  int v22;
  CFTypeRef cf;
  CGRect v25;

  height = a6.size.height;
  width = a6.size.width;
  y = a6.origin.y;
  x = a6.origin.x;
  cf = 0;
  ImageBuffer = CMSampleBufferGetImageBuffer(a3);
  if (!ImageBuffer)
    return -12780;
  v14 = ImageBuffer;
  psn_pixelBufferDimensions(ImageBuffer);
  v15 = -[BWStillImageProcessorControllerDelegate processorController:newOutputPixelBufferForProcessorInput:type:attachedMediaKey:](-[BWStillImageProcessorControllerRequest delegate](-[BWStillImageProcessorController currentRequest](self, "currentRequest"), "delegate"), "processorController:newOutputPixelBufferForProcessorInput:type:attachedMediaKey:", self, -[BWStillImageProcessorControllerRequest input](-[BWStillImageProcessorController currentRequest](self, "currentRequest"), "input"), -[BWStillImageProcessorControllerInput inferenceInputBufferType](-[BWStillImageProcessorControllerRequest input](-[BWStillImageProcessorController currentRequest](self, "currentRequest"), "input"), "inferenceInputBufferType"), a5);
  if (v15)
  {
    v16 = (__CVBuffer *)v15;
    FigCaptureMetadataUtilitiesDenormalizeCropRect(x, y, width, height);
    DictionaryRepresentation = CGRectCreateDictionaryRepresentation(v25);
    v18 = -[BWInferenceEngineController _ensurePixelTransferSessionForAttachedMediaKey:](self, "_ensurePixelTransferSessionForAttachedMediaKey:", a5);
    if (v18)
    {
      v19 = v18;
      v20 = VTSessionSetProperty(v18, (CFStringRef)*MEMORY[0x1E0CED7D0], DictionaryRepresentation);
      if (v20 || (v20 = VTPixelTransferSessionTransferImage(v19, v14, v16)) != 0)
      {
        v22 = v20;
      }
      else
      {
        v21 = (CFTypeRef)-[NSMutableDictionary objectForKeyedSubscript:](self->_outputFormatDescriptionByAttachedMediaKey, "objectForKeyedSubscript:", a5);
        if (v21)
          v21 = CFRetain(v21);
        cf = v21;
        BWSampleBufferSetAttachedMediaFromPixelBuffer(a4, (uint64_t)a5, v16, &cf, 0, 0, 1);
        -[NSMutableDictionary setObject:forKeyedSubscript:](self->_outputFormatDescriptionByAttachedMediaKey, "setObject:forKeyedSubscript:", cf, a5);
        v22 = 0;
      }
    }
    else
    {
      v22 = -12783;
    }
    CFRelease(v16);
    if (DictionaryRepresentation)
      CFRelease(DictionaryRepresentation);
  }
  else
  {
    v22 = -12786;
  }
  if (cf)
    CFRelease(cf);
  return v22;
}

- (OpaqueVTPixelTransferSession)_ensurePixelTransferSessionForAttachedMediaKey:(id)a3
{
  OpaqueVTPixelTransferSession *v5;
  OSStatus v6;
  VTPixelTransferSessionRef pixelTransferSessionOut;

  v5 = (OpaqueVTPixelTransferSession *)-[NSMutableDictionary objectForKeyedSubscript:](self->_pixelTransferSessionByMediaKey, "objectForKeyedSubscript:");
  pixelTransferSessionOut = v5;
  if (!v5)
  {
    v6 = VTPixelTransferSessionCreate((CFAllocatorRef)*MEMORY[0x1E0C9AE00], &pixelTransferSessionOut);
    v5 = pixelTransferSessionOut;
    if (!v6)
    {
      -[NSMutableDictionary setObject:forKeyedSubscript:](self->_pixelTransferSessionByMediaKey, "setObject:forKeyedSubscript:", pixelTransferSessionOut, a3);
      if (pixelTransferSessionOut)
      {
        CFRelease(pixelTransferSessionOut);
        return pixelTransferSessionOut;
      }
      else
      {
        return 0;
      }
    }
  }
  return v5;
}

- (id)_suppressedInferenceTypesForInput:(id)a3
{
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  char v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = (void *)objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v5 = (void *)objc_msgSend(a3, "enabledInferenceMasks", 0);
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v6)
  {
    v7 = v6;
    v8 = 0;
    v9 = *(_QWORD *)v14;
LABEL_3:
    v10 = 0;
    while (1)
    {
      if (*(_QWORD *)v14 != v9)
        objc_enumerationMutation(v5);
      v11 = *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * v10);
      if (+[BWMattingV2InferenceConfiguration mattingOutputTypeForAttachedMediaKey:](BWMattingV2InferenceConfiguration, "mattingOutputTypeForAttachedMediaKey:", v11))
      {
        break;
      }
      v8 |= +[BWPersonSemanticsConfiguration personSemanticForAttachedMediaKey:](BWPersonSemanticsConfiguration, "personSemanticForAttachedMediaKey:", v11) != 0;
      if (v7 == ++v10)
      {
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
        if (v7)
          goto LABEL_3;
        if ((v8 & 1) != 0)
          goto LABEL_11;
        goto LABEL_10;
      }
    }
  }
  else
  {
LABEL_10:
    objc_msgSend(v4, "addObject:", &unk_1E49F8478);
LABEL_11:
    objc_msgSend(v4, "addObject:", &unk_1E49F8490);
  }
  if ((objc_msgSend(a3, "smartCameraClassificationsEnabled") & 1) == 0)
    objc_msgSend(v4, "addObject:", &unk_1E49F84A8);
  if (!objc_msgSend(a3, "enabledVisionInferences"))
    objc_msgSend(v4, "addObject:", &unk_1E49F84C0);
  if (objc_msgSend(v4, "containsObject:", &unk_1E49F8490)
    && (objc_msgSend(v4, "containsObject:", &unk_1E49F8478) & 1) == 0)
  {
    objc_msgSend(v4, "removeObject:", &unk_1E49F8490);
  }
  objc_msgSend(v4, "count");
  return v4;
}

@end
