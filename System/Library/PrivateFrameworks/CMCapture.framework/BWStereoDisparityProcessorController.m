@implementation BWStereoDisparityProcessorController

+ (BOOL)usesCustomProcessingFlow
{
  return 0;
}

- (BWStereoDisparityProcessorController)initWithConfiguration:(id)a3
{
  BWStereoDisparityProcessorController *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  id *p_isa;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)BWStereoDisparityProcessorController;
  v4 = -[BWStillImageProcessorController initWithName:type:configuration:](&v14, sel_initWithName_type_configuration_, CFSTR("StereoDisparity"), 8, a3);
  if (v4)
  {
    if (!objc_msgSend((id)objc_msgSend(a3, "sensorConfigurationsByPortType"), "count")
      || objc_msgSend(a3, "stillImageDepthDataType") != 2
      && objc_msgSend(a3, "stillImageDepthDataType") != 8)
    {
      goto LABEL_16;
    }
    if (-[FigCaptureCameraParameters disparityVersion](+[FigCaptureCameraParameters sharedInstance](FigCaptureCameraParameters, "sharedInstance"), "disparityVersion") < 5)goto LABEL_13;
    v5 = (void *)objc_msgSend(a3, "sensorConfigurationsByPortType");
    v6 = *MEMORY[0x1E0D05A28];
    v7 = objc_msgSend(v5, "objectForKeyedSubscript:", *MEMORY[0x1E0D05A28]);
    v8 = *MEMORY[0x1E0D05A18];
    if (v7 && objc_msgSend(v5, "objectForKeyedSubscript:", *MEMORY[0x1E0D05A18]))
    {
      p_isa = (id *)&v4->super.super.isa;
      v10 = v8;
      v11 = v6;
    }
    else
    {
      if (!objc_msgSend(v5, "objectForKeyedSubscript:", v8))
        goto LABEL_15;
      v12 = *MEMORY[0x1E0D05A30];
      if (!objc_msgSend(v5, "objectForKeyedSubscript:", *MEMORY[0x1E0D05A30]))
        goto LABEL_15;
      p_isa = (id *)&v4->super.super.isa;
      v10 = v12;
      v11 = v8;
    }
    if (!-[BWStereoDisparityProcessorController _loadFSDNetForReferencePortType:auxiliaryPortType:](p_isa, v10, v11))
    {
LABEL_13:
      if (!-[BWStereoDisparityProcessorController _loadSetupAndPrepareDisparityProcessorWithConfiguration:]((uint64_t)v4, a3))return v4;
LABEL_16:

      return 0;
    }
LABEL_15:
    FigDebugAssert3();
    goto LABEL_16;
  }
  return v4;
}

- (uint64_t)_loadFSDNetForReferencePortType:(uint64_t)a3 auxiliaryPortType:
{
  void *v6;
  BWInferenceEngine *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  BWVideoFormatRequirements *v11;
  id v12;
  BWVideoFormatRequirements *v13;
  id v14;
  BWVideoFormatRequirements *v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  id v21;
  uint64_t v22;
  uint64_t v24;
  uint64_t v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _QWORD v30[2];
  _BYTE v31[128];
  _QWORD v32[3];
  _QWORD v33[3];
  BWVideoFormatRequirements *v34;
  BWVideoFormatRequirements *v35;
  _QWORD v36[3];

  v36[1] = *MEMORY[0x1E0C80C00];
  if (!a1)
    return 0;
  v6 = (void *)objc_msgSend(a1, "configuration");
  if (!objc_msgSend(v6, "inferenceScheduler") || !a2 || !a3)
  {
    FigDebugAssert3();
    return 4294954516;
  }

  a1[9] = 0;
  v7 = -[BWInferenceEngine initWithScheduler:priority:shareIntermediateBuffer:]([BWInferenceEngine alloc], "initWithScheduler:priority:shareIntermediateBuffer:", objc_msgSend(v6, "inferenceScheduler"), objc_msgSend(v6, "figThreadPriority"), 1);
  a1[8] = v7;
  if (!v7)
    return 0;
  v8 = (void *)objc_msgSend((id)objc_msgSend(v6, "sensorConfigurationsByPortType"), "objectForKeyedSubscript:", a2);
  v9 = -[FigCaptureCameraParameters fsdNetStereoImagesAlignmentForPortType:sensorIDString:](+[FigCaptureCameraParameters sharedInstance](FigCaptureCameraParameters, "sharedInstance"), "fsdNetStereoImagesAlignmentForPortType:sensorIDString:", objc_msgSend(v8, "portType"), objc_msgSend(v8, "sensorIDString"));
  if ((_DWORD)v9 == -1)
    return 4294954516;
  v10 = objc_msgSend(a1[8], "addInferenceOfType:version:configuration:", 108, BWInferenceVersionMakeMajor(1) & 0xFFFFFFFFFFFFLL, -[BWFastStereoDisparityConfiguration initWithInferenceType:fsdNetStereoImagesAlignment:disparityType:]([BWFastStereoDisparityConfiguration alloc], "initWithInferenceType:fsdNetStereoImagesAlignment:disparityType:", 108, v9, 2));
  if ((_DWORD)v10)
  {
    v22 = v10;
    FigDebugAssert3();
    return v22;
  }
  v24 = a2;
  v25 = a3;
  v11 = objc_alloc_init(BWVideoFormatRequirements);
  -[BWVideoFormatRequirements setWidth:](v11, "setWidth:", 768);
  -[BWVideoFormatRequirements setHeight:](v11, "setHeight:", 576);
  -[BWVideoFormatRequirements setSupportedPixelFormats:](v11, "setSupportedPixelFormats:", &unk_1E4A01040);
  -[BWVideoFormatRequirements setBytesPerRowAlignment:](v11, "setBytesPerRowAlignment:", 64);
  v36[0] = v11;
  v12 = +[BWVideoFormat formatByResolvingRequirements:](BWVideoFormat, "formatByResolvingRequirements:", objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v36, 1));
  v13 = objc_alloc_init(BWVideoFormatRequirements);
  -[BWVideoFormatRequirements setWidth:](v13, "setWidth:", 896);
  -[BWVideoFormatRequirements setHeight:](v13, "setHeight:", 704);
  -[BWVideoFormatRequirements setSupportedPixelFormats:](v13, "setSupportedPixelFormats:", &unk_1E4A01058);
  -[BWVideoFormatRequirements setBytesPerRowAlignment:](v13, "setBytesPerRowAlignment:", 64);
  v35 = v13;
  v14 = +[BWVideoFormat formatByResolvingRequirements:](BWVideoFormat, "formatByResolvingRequirements:", objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v35, 1));
  v15 = objc_alloc_init(BWVideoFormatRequirements);
  -[BWVideoFormatRequirements setWidth:](v15, "setWidth:", 768);
  -[BWVideoFormatRequirements setHeight:](v15, "setHeight:", 576);
  -[BWVideoFormatRequirements setSupportedPixelFormats:](v15, "setSupportedPixelFormats:", &unk_1E4A01070);
  -[BWVideoFormatRequirements setBytesPerRowAlignment:](v15, "setBytesPerRowAlignment:", 64);
  v34 = v15;
  v32[0] = 0x1E4951378;
  v32[1] = 0x1E4951398;
  v33[0] = v12;
  v33[1] = v14;
  v32[2] = 0x1E49513B8;
  v33[2] = +[BWVideoFormat formatByResolvingRequirements:](BWVideoFormat, "formatByResolvingRequirements:", objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v34, 1));
  v16 = (id)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v33, v32, 3);
  a1[13] = v16;
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v26, v31, 16);
  if (v17)
  {
    v18 = v17;
    v19 = *(_QWORD *)v27;
LABEL_10:
    v20 = 0;
    while (1)
    {
      if (*(_QWORD *)v27 != v19)
        objc_enumerationMutation(v16);
      if (objc_msgSend(a1[8], "prepareForInputVideoFormat:attachedMediaKey:", objc_msgSend(a1[13], "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v26 + 1) + 8 * v20)), *(_QWORD *)(*((_QWORD *)&v26 + 1) + 8 * v20)))return 0;
      if (v18 == ++v20)
      {
        v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v26, v31, 16);
        if (v18)
          goto LABEL_10;
        break;
      }
    }
  }
  if (objc_msgSend(a1[8], "prepareForInferenceWithFormatProvider:", a1))
    return 0;
  v21 = objc_alloc(MEMORY[0x1E0C99E60]);
  v30[0] = v24;
  v30[1] = v25;
  v22 = 0;
  a1[9] = (id)objc_msgSend(v21, "initWithArray:", objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v30, 2));
  return v22;
}

- (uint64_t)_loadSetupAndPrepareDisparityProcessorWithConfiguration:(uint64_t)result
{
  uint64_t v2;
  FigCaptureCameraParameters *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  BOOL v22;
  void *v23;
  int v24;
  _QWORD v25[2];
  BOOL v26;
  _BYTE v27[7];
  uint64_t v28;
  uint64_t v29;
  int v30;
  uint64_t v31;
  int v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  _QWORD v37[2];
  _QWORD v38[2];
  _BYTE v39[128];
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  if (result)
  {
    v2 = result;
    if (*(_QWORD *)(result + 56))
      return 0;
    v4 = +[FigCaptureCameraParameters sharedInstance](FigCaptureCameraParameters, "sharedInstance");
    result = -[FigCaptureCameraParameters stereoDisparityParameters](v4, "stereoDisparityParameters");
    if (result)
    {
      v5 = result;
      v6 = (void *)objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
      v33 = 0u;
      v34 = 0u;
      v35 = 0u;
      v36 = 0u;
      v7 = (void *)objc_msgSend(a2, "sensorConfigurationsByPortType");
      v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v33, v39, 16);
      if (v8)
      {
        v9 = v8;
        v10 = *(_QWORD *)v34;
        do
        {
          for (i = 0; i != v9; ++i)
          {
            if (*(_QWORD *)v34 != v10)
              objc_enumerationMutation(v7);
            objc_msgSend(v6, "setObject:forKeyedSubscript:", objc_msgSend((id)objc_msgSend((id)objc_msgSend(a2, "sensorConfigurationsByPortType"), "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v33 + 1) + 8 * i)), "cameraInfo"), *(_QWORD *)(*((_QWORD *)&v33 + 1) + 8 * i));
          }
          v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v33, v39, 16);
        }
        while (v9);
      }
      result = objc_msgSend(v6, "count");
      if (result)
      {
        v12 = *MEMORY[0x1E0D06140];
        v37[0] = *MEMORY[0x1E0D06188];
        v37[1] = v12;
        v38[0] = v5;
        v38[1] = v6;
        v13 = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v38, v37, 2);
        if (!v13)
          return 4294954510;
        v14 = v13;
        v15 = -[FigCaptureCameraParameters disparityVersion](v4, "disparityVersion");
        if (!(_DWORD)v15)
          return 4294954516;
        v16 = BWLoadProcessorBundle((uint64_t)CFSTR("Disparity"), v15);
        if (!v16)
          return 4294954510;
        v17 = (void *)objc_msgSend(objc_alloc((Class)objc_msgSend(v16, "principalClass")), "initWithCommandQueue:", objc_msgSend(a2, "metalCommandQueue"));
        *(_QWORD *)(v2 + 56) = v17;
        if (!v17)
          return 4294954510;
        objc_msgSend(v17, "setOptions:", v14);
        v18 = (int)objc_msgSend(a2, "inputDimensions");
        v19 = objc_msgSend(a2, "inputDimensions") >> 32;
        v20 = (int)objc_msgSend(a2, "disparityOutputDimensions");
        v21 = objc_msgSend(a2, "disparityOutputDimensions") >> 32;
        v22 = objc_msgSend(a2, "stillImageDepthDataType") == 8;
        v23 = *(void **)(v2 + 56);
        v25[0] = v18;
        v25[1] = v19;
        v26 = v22;
        memset(v27, 0, sizeof(v27));
        v28 = v20;
        v29 = v21;
        v30 = 1067030938;
        v31 = 0x1800000020;
        v32 = 0;
        objc_msgSend(v23, "setDisparityConfig:", v25);
        v24 = objc_msgSend(*(id *)(v2 + 56), "prepareToProcess:", 0);
        result = 0;
        if (v24)
          return 4294954510;
      }
    }
  }
  return result;
}

- (void)dealloc
{
  opaqueCMFormatDescription *refFormatDescription;
  opaqueCMFormatDescription *auxFormatDescription;
  opaqueCMFormatDescription *disparityFormatDescription;
  objc_super v6;

  objc_msgSend((id)-[FigDisparityGenerator metalContext](self->_disparityProcessor, "metalContext"), "waitForIdle");
  -[BWStereoDisparityProcessorController reset](self, "reset");

  refFormatDescription = self->_refFormatDescription;
  if (refFormatDescription)
    CFRelease(refFormatDescription);
  auxFormatDescription = self->_auxFormatDescription;
  if (auxFormatDescription)
    CFRelease(auxFormatDescription);
  disparityFormatDescription = self->_disparityFormatDescription;
  if (disparityFormatDescription)
    CFRelease(disparityFormatDescription);

  v6.receiver = self;
  v6.super_class = (Class)BWStereoDisparityProcessorController;
  -[BWStillImageProcessorController dealloc](&v6, sel_dealloc);
}

- (unint64_t)type
{
  return 8;
}

- (void)inputReceivedNewInputData:(id)a3
{
  -[BWStillImageProcessorControllerRequest input](-[BWStillImageProcessorController currentRequest](self, "currentRequest", a3), "input");
  -[BWStillImageProcessorController currentRequestChanged](self, "currentRequestChanged");
}

- (int)processDisparityInferenceWithReferenceBuffer:(__CVBuffer *)a3 auxBuffer:(__CVBuffer *)a4 outputDisparityBuffer:(__CVBuffer *)a5
{
  BWStillImageProcessorControllerRequest *v8;
  opaqueCMSampleBuffer *v9;
  int v10;
  int v11;
  opaqueCMSampleBuffer *AttachedMedia;
  int v13;
  CMTime v15;
  CMTime v16;
  CFTypeRef v17;
  CFTypeRef cf;

  v17 = 0;
  cf = 0;
  v8 = -[BWStillImageProcessorController currentRequest](self, "currentRequest");
  v9 = (opaqueCMSampleBuffer *)-[BWStillImageProcessorControllerInput referenceSbuf](-[BWStillImageProcessorControllerRequest input](v8, "input"), "referenceSbuf");
  CMSampleBufferGetPresentationTimeStamp(&v16, v9);
  v10 = BWSampleBufferCreateFromPixelBuffer(a3, (uint64_t)&v16, (CFTypeRef *)&self->_refFormatDescription, (CMSampleBufferRef *)&cf);
  if (v10)
  {
    v13 = v10;
  }
  else
  {
    CMSampleBufferGetPresentationTimeStamp(&v15, v9);
    v11 = BWSampleBufferCreateFromPixelBuffer(a4, (uint64_t)&v15, (CFTypeRef *)&self->_auxFormatDescription, (CMSampleBufferRef *)&v17);
    if (v11
      || (BWSampleBufferSetAttachedMedia(v9, 0x1E4951378, (uint64_t)cf),
          BWSampleBufferSetAttachedMedia(v9, 0x1E4951398, (uint64_t)v17),
          -[BWStillImageProcessorControllerDelegate processorControllerWillProcessInferences:](-[BWStillImageProcessorControllerRequest delegate](v8, "delegate"), "processorControllerWillProcessInferences:", self), (v11 = -[BWInferenceEngine performInferencesOnSampleBuffer:attachingResultsToSampleBuffer:](self->_inferenceEngine, "performInferencesOnSampleBuffer:attachingResultsToSampleBuffer:", v9, v9)) != 0))
    {
      v13 = v11;
    }
    else
    {
      BWSampleBufferRemoveAttachedMedia(v9, 0x1E4951378);
      BWSampleBufferRemoveAttachedMedia(v9, 0x1E4951398);
      AttachedMedia = (opaqueCMSampleBuffer *)BWSampleBufferGetAttachedMedia(v9, 0x1E49513B8);
      if (AttachedMedia)
      {
        CMSampleBufferGetImageBuffer(AttachedMedia);
        v13 = CopyPixelBuffer();
        if (v13)
          FigDebugAssert3();
      }
      else
      {
        v13 = 0;
      }
    }
  }
  BWSampleBufferRemoveAttachedMedia(v9, 0x1E49513B8);
  BWSampleBufferRemoveAttachedMedia(v9, 0x1E4951378);
  BWSampleBufferRemoveAttachedMedia(v9, 0x1E4951398);
  if (cf)
    CFRelease(cf);
  if (v17)
    CFRelease(v17);
  return v13;
}

- (void)reset
{
  -[FigDisparityGenerator setShouldComputeDisparityWhenCalibrationFails:](self->_disparityProcessor, "setShouldComputeDisparityWhenCalibrationFails:", 0);
  -[FigDisparityGenerator setEqualizeTeleGainToMatchReference:](self->_disparityProcessor, "setEqualizeTeleGainToMatchReference:", 0);
  -[FigDisparityGenerator setReferenceSampleBuffer:](self->_disparityProcessor, "setReferenceSampleBuffer:", 0);
  -[FigDisparityGenerator setAuxiliarySampleBuffer:](self->_disparityProcessor, "setAuxiliarySampleBuffer:", 0);
  -[FigDisparityGenerator setOutputShiftmap:](self->_disparityProcessor, "setOutputShiftmap:", 0);
  -[FigDisparityGenerator setDisparityInferenceProcessorDelegate:](self->_disparityProcessor, "setDisparityInferenceProcessorDelegate:", 0);
  -[FigDisparityGenerator setNormalizedReferenceCropRect:](self->_disparityProcessor, "setNormalizedReferenceCropRect:", *MEMORY[0x1E0C9D628], *(double *)(MEMORY[0x1E0C9D628] + 8), *(double *)(MEMORY[0x1E0C9D628] + 16), *(double *)(MEMORY[0x1E0C9D628] + 24));
}

- (id)requestForInput:(id)a3 delegate:(id)a4 errOut:(int *)a5
{
  BWStereoDisparityRequest *v6;
  int v7;

  v6 = -[BWStillImageProcessorControllerRequest initWithInput:delegate:]([BWStereoDisparityRequest alloc], "initWithInput:delegate:", a3, a4);
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
  BWStillImageProcessorControllerInput *v3;
  int v4;
  uint64_t v5;
  NSArray *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v3 = -[BWStillImageProcessorControllerRequest input](-[BWStillImageProcessorController currentRequest](self, "currentRequest"), "input");
  if (-[FigCaptureCameraParameters disparityVersion](+[FigCaptureCameraParameters sharedInstance](FigCaptureCameraParameters, "sharedInstance"), "disparityVersion") < 5|| (objc_msgSend((id)-[BWStillImageProcessorControllerInput expectedPortTypes](v3, "expectedPortTypes"), "isEqualToSet:", self->_currentInferenceEnginePortTypes) & 1) != 0)
  {
    return 0;
  }
  v5 = -[BWStillImageCaptureSettings masterPortType](-[BWStillImageProcessorControllerInput captureSettings](v3, "captureSettings"), "masterPortType");
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v6 = -[BWStillImageCaptureSettings portTypes](-[BWStillImageProcessorControllerInput captureSettings](v3, "captureSettings"), "portTypes");
  v7 = -[NSArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v14;
LABEL_6:
    v10 = 0;
    while (1)
    {
      if (*(_QWORD *)v14 != v9)
        objc_enumerationMutation(v6);
      v11 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * v10);
      if (!objc_msgSend(v11, "isEqualToString:", v5))
        break;
      if (v8 == ++v10)
      {
        v8 = -[NSArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
        if (v8)
          goto LABEL_6;
        goto LABEL_12;
      }
    }
  }
  else
  {
LABEL_12:
    v11 = 0;
  }
  v4 = -[BWStereoDisparityProcessorController _loadFSDNetForReferencePortType:auxiliaryPortType:]((id *)&self->super.super.isa, v5, (uint64_t)v11);
  if (v4)
    FigDebugAssert3();
  return v4;
}

- (int)process
{
  BWStillImageProcessorControllerConfiguration *v3;
  BWStillImageProcessorControllerRequest *v4;
  __CVBuffer *v5;
  void *AttachedMedia;
  uint64_t v7;
  const __CFString *v8;
  const void *v9;
  const __CFString *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  double v23;
  double v24;
  __CVBuffer *ImageBuffer;
  int64_t v26;
  double x;
  double y;
  double width;
  double height;
  CGFloat v31;
  CGFloat v32;
  CGFloat v33;
  double v34;
  double v35;
  float v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  char v40;
  int v41;
  double MidX;
  double v43;
  double v44;
  double v45;
  double v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  unsigned int v51;
  unsigned int v52;
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  unsigned int v54;
  void *v55;
  id v56;
  CFTypeRef v57;
  CFTypeRef v58;
  uint64_t CopyIncludingMetadata;
  id v60;
  void *v61;
  unsigned int v62;
  uint64_t v63;
  double v64;
  CGFloat v65;
  double v66;
  CGFloat v67;
  double v68;
  CGFloat v69;
  double v70;
  CGFloat v71;
  uint64_t v72;
  const char *v73;
  id v74;
  void *v75;
  __CVBuffer *v76;
  CFTypeRef v77;
  uint64_t v78;
  void *v79;
  uint64_t v80;
  id v81;
  BWAggdDataReporter *v82;
  uint64_t v83;
  BWStillImageProcessorControllerDelegate *v84;
  BWStillImageProcessorControllerDelegate *v85;
  CMAttachmentBearerRef v87;
  CMAttachmentBearerRef v88;
  const void *v89;
  uint64_t v90;
  uint64_t v91;
  CFStringRef key;
  const __CFString *keya;
  __CVBuffer *v94;
  int CGRectIfPresent;
  unsigned int v96;
  id v97;
  CMSampleBufferRef sbuf;
  int v99[2];
  void *v100;
  BWStillImageProcessorControllerRequest *v101;
  BWStillImageProcessorControllerInput *v102;
  _BYTE v103[32];
  CFTypeRef v104;
  CMAttachmentBearerRef cf;
  CMAttachmentBearerRef target;
  _QWORD v107[5];
  CGRect v108;

  v107[2] = *MEMORY[0x1E0C80C00];
  cf = 0;
  target = 0;
  v104 = 0;
  v3 = -[BWStillImageProcessorController configuration](self, "configuration");
  v4 = -[BWStillImageProcessorController currentRequest](self, "currentRequest");
  v102 = -[BWStillImageProcessorControllerRequest input](v4, "input");
  v5 = (__CVBuffer *)-[BWStillImageProcessorControllerDelegate processorController:newOutputPixelBufferForProcessorInput:type:](-[BWStillImageProcessorControllerRequest delegate](v4, "delegate"), "processorController:newOutputPixelBufferForProcessorInput:type:", self, v102, 2001);
  if (!v5)
  {
    FigDebugAssert3();
    v22 = 4294954510;
    goto LABEL_72;
  }
  v101 = v4;
  if (-[BWStillImageProcessorControllerConfiguration stillImageDepthDataType](v3, "stillImageDepthDataType") == 2)
  {
    AttachedMedia = (void *)BWSampleBufferGetAttachedMedia((const void *)-[BWStillImageProcessorControllerInput referenceSbuf](v102, "referenceSbuf"), 0x1E495AED8);
    v7 = BWSampleBufferGetAttachedMedia((const void *)-[BWStillImageProcessorControllerInput auxiliarySbuf](v102, "auxiliarySbuf"), 0x1E495AED8);
  }
  else
  {
    if (-[BWStillImageProcessorControllerConfiguration stillImageDepthDataType](v3, "stillImageDepthDataType") != 8)goto LABEL_71;
    v94 = v5;
    *(_QWORD *)v99 = v3;
    v8 = (const __CFString *)-[BWStillImageProcessorControllerInput referenceSbuf](v102, "referenceSbuf");
    v9 = (const void *)-[BWStillImageProcessorControllerInput auxiliarySbuf](v102, "auxiliarySbuf");
    v10 = (const __CFString *)*MEMORY[0x1E0D05CB0];
    key = v8;
    v11 = (void *)CMGetAttachment(v8, (CFStringRef)*MEMORY[0x1E0D05CB0], 0);
    v12 = *MEMORY[0x1E0D06D00];
    v13 = objc_msgSend(v11, "objectForKeyedSubscript:", *MEMORY[0x1E0D06D00]);
    v14 = *MEMORY[0x1E0D06F48];
    v15 = objc_msgSend(v11, "objectForKeyedSubscript:", *MEMORY[0x1E0D06F48]);
    v16 = *MEMORY[0x1E0D06F50];
    objc_msgSend(v11, "setObject:forKeyedSubscript:", v15, *MEMORY[0x1E0D06F50]);
    v17 = *MEMORY[0x1E0D06F30];
    v18 = objc_msgSend(v11, "objectForKeyedSubscript:", *MEMORY[0x1E0D06F30]);
    v19 = *MEMORY[0x1E0D06F38];
    objc_msgSend(v11, "setObject:forKeyedSubscript:", v18, *MEMORY[0x1E0D06F38]);
    v20 = (void *)CMGetAttachment(v9, v10, 0);
    v21 = objc_msgSend(v20, "objectForKeyedSubscript:", v12);
    objc_msgSend(v20, "setObject:forKeyedSubscript:", objc_msgSend(v20, "objectForKeyedSubscript:", v14), v16);
    objc_msgSend(v20, "setObject:forKeyedSubscript:", objc_msgSend(v20, "objectForKeyedSubscript:", v17), v19);
    v22 = 4294954516;
    if (!v13)
    {
      v5 = v94;
      goto LABEL_69;
    }
    AttachedMedia = (void *)key;
    v5 = v94;
    v3 = *(BWStillImageProcessorControllerConfiguration **)v99;
    v4 = v101;
    if (!v21)
      goto LABEL_72;
    v107[0] = v13;
    v107[1] = v21;
    if (!objc_msgSend((id)objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v107, 2)), "isEqualToSet:", -[BWStillImageProcessorControllerInput expectedPortTypes](v102, "expectedPortTypes")))goto LABEL_72;
    v7 = (uint64_t)v9;
  }
  v22 = 4294954516;
  if (!AttachedMedia || !v7)
    goto LABEL_72;
  -[FigDisparityGenerator setShouldComputeDisparityWhenCalibrationFails:](self->_disparityProcessor, "setShouldComputeDisparityWhenCalibrationFails:", -[BWStillImageProcessorControllerConfiguration shouldComputeDisparityWhenCalibrationFails](v3, "shouldComputeDisparityWhenCalibrationFails"));
  -[FigDisparityGenerator setEqualizeTeleGainToMatchReference:](self->_disparityProcessor, "setEqualizeTeleGainToMatchReference:", -[BWStillImageProcessorControllerInput equalizeTeleGainToMatchReference](v102, "equalizeTeleGainToMatchReference"));
  -[FigDisparityGenerator setReferenceSampleBuffer:](self->_disparityProcessor, "setReferenceSampleBuffer:", AttachedMedia);
  -[FigDisparityGenerator setAuxiliarySampleBuffer:](self->_disparityProcessor, "setAuxiliarySampleBuffer:", v7);
  -[FigDisparityGenerator setOutputShiftmap:](self->_disparityProcessor, "setOutputShiftmap:", v5);
  -[FigDisparityGenerator setDisparityInferenceProcessorDelegate:](self->_disparityProcessor, "setDisparityInferenceProcessorDelegate:", self);
  keya = (const __CFString *)*MEMORY[0x1E0D05CB0];
  CMGetAttachment(AttachedMedia, (CFStringRef)*MEMORY[0x1E0D05CB0], 0);
  *(_OWORD *)v103 = *MEMORY[0x1E0C9D628];
  *(_OWORD *)&v103[16] = *(_OWORD *)(MEMORY[0x1E0C9D628] + 16);
  CGRectIfPresent = FigCFDictionaryGetCGRectIfPresent();
  if (!CGRectIfPresent)
  {
    v35 = 1.0;
    -[FigDisparityGenerator setNormalizedReferenceCropRect:](self->_disparityProcessor, "setNormalizedReferenceCropRect:", 0.0, 0.0, 1.0, 1.0);
    v40 = 0;
    goto LABEL_20;
  }
  v23 = (double)-[FigCaptureStillImageSettings outputWidth](-[BWStillImageSettings requestedSettings](-[BWStillImageProcessorControllerInput stillImageSettings](v102, "stillImageSettings"), "requestedSettings"), "outputWidth");
  v24 = v23
      / (double)-[FigCaptureStillImageSettings outputHeight](-[BWStillImageSettings requestedSettings](-[BWStillImageProcessorControllerInput stillImageSettings](v102, "stillImageSettings"), "requestedSettings"), "outputHeight");
  ImageBuffer = CMSampleBufferGetImageBuffer((CMSampleBufferRef)AttachedMedia);
  v26 = psn_pixelBufferDimensions(ImageBuffer);
  if ((-[BWStillImageProcessorControllerConfiguration zoomingDisparityAllowed](v3, "zoomingDisparityAllowed") & 1) != 0)
  {
    v108.origin.x = FigCaptureMetadataUtilitiesComputeDenormalizedStillImageCropRectForAttachedMedia((int)v26, v26 >> 32, *(CGFloat *)v103, *(CGFloat *)&v103[8], *(CGFloat *)&v103[16], *(CGFloat *)&v103[24], v24, 1.0);
    x = v108.origin.x;
    y = v108.origin.y;
    width = v108.size.width;
    height = v108.size.height;
    if (!CGRectIsNull(v108))
    {
      FigCaptureMetadataUtilitiesNormalizeCropRect(x, y, width, height);
      *(CGFloat *)v103 = v31;
      *(CGFloat *)&v103[8] = v32;
      *(CGFloat *)&v103[16] = v33;
      *(double *)&v103[24] = v34;
      v35 = 1.0 / v34;
      if (1.0 / v34 <= 2.5)
      {
        v40 = 0;
      }
      else
      {
        v36 = v35 / 2.5;
        *(_QWORD *)v103 = FigCaptureMetadataUtilitiesScaleRect(v31, v32, v33, v34, v36);
        *(_QWORD *)&v103[8] = v37;
        *(_QWORD *)&v103[16] = v38;
        *(_QWORD *)&v103[24] = v39;
        v40 = 1;
        v35 = 2.5;
      }
      goto LABEL_19;
    }
    FigDebugAssert3();
LABEL_71:
    v22 = 4294954516;
    goto LABEL_72;
  }
  v41 = FigCaptureMetadataUtilitiesEnforceAspectRatioWithStillImageDimensions(v26, v24);
  MidX = CGRectGetMidX(*(CGRect *)v103);
  CGRectGetMidY(*(CGRect *)v103);
  v43 = FigCaptureMetadataUtilitiesDenormalizedRectWithinBoundingDimensionsCenteredOnPoint(v26, v41, MidX);
  FigCaptureMetadataUtilitiesNormalizeCropRect(v43, v44, v45, v46);
  *(_QWORD *)v103 = v47;
  *(_QWORD *)&v103[8] = v48;
  *(_QWORD *)&v103[16] = v49;
  *(_QWORD *)&v103[24] = v50;
  v40 = 1;
  v35 = 1.0;
LABEL_19:
  -[FigDisparityGenerator setNormalizedReferenceCropRect:](self->_disparityProcessor, "setNormalizedReferenceCropRect:");
LABEL_20:
  v51 = -[FigDisparityGenerator process](self->_disparityProcessor, "process");
  v52 = v51;
  if (dword_1ECFE9A10)
  {
    v96 = v51;
    os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
    v52 = v96;
  }
  v54 = v52 & 0xFFFFFFFE;
  if (v52
    && (v54 != 2
     || !-[BWStillImageProcessorControllerConfiguration shouldComputeDisparityWhenCalibrationFails](v3, "shouldComputeDisparityWhenCalibrationFails")))
  {
    v57 = (CFTypeRef)-[BWStillImageProcessorControllerInput referenceSbuf](v102, "referenceSbuf", v90, v91);
    if (v57)
      v57 = CFRetain(v57);
    target = v57;
    v58 = (CFTypeRef)-[BWStillImageProcessorControllerInput auxiliarySbuf](v102, "auxiliarySbuf");
    if (v58)
      v58 = CFRetain(v58);
    cf = v58;
    goto LABEL_51;
  }
  objc_msgSend((id)-[FigDisparityGenerator metalContext](self->_disparityProcessor, "metalContext", v90, v91), "waitForSchedule");
  v55 = (void *)-[FigDisparityGenerator shiftMapMetadata](self->_disparityProcessor, "shiftMapMetadata");
  v100 = v55;
  if (v55)
    v56 = sdpc_depthMetadataAttachmentDictionaryFromStereoDisparityMetadata(v55, (CMAttachmentBearerRef)-[BWStillImageProcessorControllerInput referenceSbuf](v102, "referenceSbuf"), 1, v54 == 2);
  else
    v56 = 0;
  CopyIncludingMetadata = BWCMSampleBufferCreateCopyIncludingMetadata((CMSampleBufferRef)-[BWStillImageProcessorControllerInput referenceSbuf](v102, "referenceSbuf"), (CMSampleBufferRef *)&target);
  if ((_DWORD)CopyIncludingMetadata
    || (CopyIncludingMetadata = BWCMSampleBufferCreateCopyWithNewPixelBuffer((opaqueCMSampleBuffer *)target, v5, (CFTypeRef *)&self->_disparityFormatDescription, (CMSampleBufferRef *)&v104), (_DWORD)CopyIncludingMetadata))
  {
    v22 = CopyIncludingMetadata;
LABEL_69:
    v4 = v101;
    goto LABEL_72;
  }
  v60 = BWCMSampleBufferCopyReattachAndReturnMutableMetadata(v104);
  if (CGRectIfPresent)
  {
    v61 = v60;
    v62 = v52;
    if (v56)
      FigCaptureMetadataUtilitiesUpdateDepthDataMetadataForStillImageCropAndScale(v56, *(double *)v103, *(double *)&v103[8], *(double *)&v103[16], *(double *)&v103[24], v35);
    v63 = -[BWStillImageProcessorControllerConfiguration inputDimensions](v3, "inputDimensions");
    FigCaptureMetadataUtilitiesDenormalizeCropRect(*(double *)v103, *(double *)&v103[8], *(double *)&v103[16], *(double *)&v103[24]);
    v65 = v64;
    v67 = v66;
    v69 = v68;
    v71 = v70;
    v72 = -[BWStillImageProcessorControllerConfiguration disparityOutputDimensions](v3, "disparityOutputDimensions");
    FigCaptureMetadataUtilitiesUpdateMetadataForStillImageCrop(v61, v63, v72, v65, v67, v69, v71, *MEMORY[0x1E0C9D628], *(double *)(MEMORY[0x1E0C9D628] + 8), *(double *)(MEMORY[0x1E0C9D628] + 16), *(double *)(MEMORY[0x1E0C9D628] + 24));
    v52 = v62;
    if ((v40 & 1) == 0)
      FigCaptureMetadataUtilitiesPreventFurtherCropping(v61, v73);
  }
  BWSampleBufferSetAttachedMedia(target, (uint64_t)CFSTR("Depth"), (uint64_t)v104);
  if (-[FigDisparityGenerator disparityDiagnosticMetadata](self->_disparityProcessor, "disparityDiagnosticMetadata"))
    objc_msgSend((id)CMGetAttachment(target, keya, 0), "setObject:forKeyedSubscript:", -[FigDisparityGenerator disparityDiagnosticMetadata](self->_disparityProcessor, "disparityDiagnosticMetadata"), CFSTR("Disparity"));
  if (v56)
  {
    if ((-[BWStillImageCaptureSettings captureFlags](-[BWStillImageProcessorControllerInput captureSettings](v102, "captureSettings"), "captureFlags") & 0x4000000000) != 0&& v54 != 2)
    {
      sbuf = (CMSampleBufferRef)objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
      v97 = sdpc_depthMetadataAttachmentDictionaryFromStereoDisparityMetadata(v100, (CMAttachmentBearerRef)-[BWStillImageProcessorControllerInput referenceSbuf](v102, "referenceSbuf"), 1, 0);
      v74 = sdpc_depthMetadataAttachmentDictionaryFromStereoDisparityMetadata(v100, (CMAttachmentBearerRef)-[BWStillImageProcessorControllerInput auxiliarySbuf](v102, "auxiliarySbuf"), 0, 0);
      v75 = (void *)CMGetAttachment((CMAttachmentBearerRef)-[BWStillImageProcessorControllerInput referenceSbuf](v102, "referenceSbuf"), keya, 0);
      v76 = v5;
      v77 = CMGetAttachment((CMAttachmentBearerRef)-[BWStillImageProcessorControllerInput auxiliarySbuf](v102, "auxiliarySbuf"), keya, 0);
      v78 = *MEMORY[0x1E0D05D00];
      objc_msgSend(v97, "setObject:forKeyedSubscript:", objc_msgSend(v75, "objectForKeyedSubscript:", *MEMORY[0x1E0D05D00]), *MEMORY[0x1E0D05D00]);
      v79 = (void *)v77;
      v5 = v76;
      objc_msgSend(v74, "setObject:forKeyedSubscript:", objc_msgSend(v79, "objectForKeyedSubscript:", v78), v78);
      -[opaqueCMSampleBuffer setObject:forKeyedSubscript:](sbuf, "setObject:forKeyedSubscript:", v97, CFSTR("Primary"));
      -[opaqueCMSampleBuffer setObject:forKeyedSubscript:](sbuf, "setObject:forKeyedSubscript:", v74, CFSTR("Secondary"));
      CMSetAttachment(target, (CFStringRef)*MEMORY[0x1E0D08740], sbuf, 1u);
    }
    CMSetAttachment(target, (CFStringRef)*MEMORY[0x1E0D086F0], v56, 1u);
  }
  v4 = v101;
  if (!-[BWStillImageProcessorControllerInput emitAuxiliaryInput](v102, "emitAuxiliaryInput"))
    goto LABEL_51;
  v80 = BWCMSampleBufferCreateCopyIncludingMetadata((CMSampleBufferRef)-[BWStillImageProcessorControllerInput auxiliarySbuf](v102, "auxiliarySbuf"), (CMSampleBufferRef *)&cf);
  if (!(_DWORD)v80)
  {
    v81 = sdpc_depthMetadataAttachmentDictionaryFromStereoDisparityMetadata(v100, (CMAttachmentBearerRef)-[BWStillImageProcessorControllerInput auxiliarySbuf](v102, "auxiliarySbuf"), 0, v54 == 2);
    if (v81)
      CMSetAttachment(cf, (CFStringRef)*MEMORY[0x1E0D086F0], v81, 1u);
LABEL_51:
    v82 = +[BWAggdDataReporter sharedInstance](BWAggdDataReporter, "sharedInstance");
    if (v52 > 3)
      v83 = 4294949886;
    else
      v83 = dword_1A32B1660[v52];
    -[BWAggdDataReporter reportSDOFSampleBufferProcessorProcessingStatus:](v82, "reportSDOFSampleBufferProcessorProcessingStatus:", v83);
LABEL_55:
    v22 = 0;
    goto LABEL_56;
  }
  v22 = v80;
LABEL_72:
  v87 = target;
  if (!target)
  {
    v87 = (CMAttachmentBearerRef)-[BWStillImageProcessorControllerInput referenceSbuf](v102, "referenceSbuf");
    if (v87)
      v87 = CFRetain(v87);
  }
  target = v87;
  v88 = cf;
  if (!cf)
  {
    v89 = (const void *)-[BWStillImageProcessorControllerInput auxiliarySbuf](v102, "auxiliarySbuf");
    if (v89)
      v88 = CFRetain(v89);
    else
      v88 = 0;
    v87 = target;
  }
  cf = v88;
  if (v87 && (v88 || (-[BWStillImageProcessorControllerInput emitAuxiliaryInput](v102, "emitAuxiliaryInput") & 1) == 0))
    goto LABEL_55;
LABEL_56:
  CMSetAttachment(target, CFSTR("NonProcessedReferenceFrame"), MEMORY[0x1E0C9AAB0], 1u);
  v84 = -[BWStillImageProcessorControllerRequest delegate](v4, "delegate");
  -[BWStillImageProcessorControllerDelegate processorController:didFinishProcessingSampleBuffer:type:processorInput:err:](v84, "processorController:didFinishProcessingSampleBuffer:type:processorInput:err:", self, target, 20, v102, v22);
  if (-[BWStillImageProcessorControllerInput emitAuxiliaryInput](v102, "emitAuxiliaryInput"))
  {
    CMSetAttachment(cf, CFSTR("NonProcessedReferenceFrame"), MEMORY[0x1E0C9AAB0], 1u);
    v85 = -[BWStillImageProcessorControllerRequest delegate](v4, "delegate");
    -[BWStillImageProcessorControllerDelegate processorController:didFinishProcessingSampleBuffer:type:processorInput:err:](v85, "processorController:didFinishProcessingSampleBuffer:type:processorInput:err:", self, cf, 20, v102, v22);
  }
  if (target)
    CFRelease(target);
  if (cf)
    CFRelease(cf);
  if (v104)
    CFRelease(v104);
  if (v5)
    CFRelease(v5);
  return v22;
}

- (id)inputVideoFormatForAttachedMediaKey:(id)a3
{
  return -[NSDictionary objectForKeyedSubscript:](self->_videoFormatByAttachedMediaKey, "objectForKeyedSubscript:", a3);
}

- (id)inputInferenceVideoFormatForAttachedMediaKey:(id)a3
{
  return 0;
}

- (id)outputVideoFormatForAttachedMediaKey:(id)a3
{
  return -[NSDictionary objectForKeyedSubscript:](self->_videoFormatByAttachedMediaKey, "objectForKeyedSubscript:", a3);
}

- (BOOL)intermediateResourceTrackingAllowedForAttachedMediaKey:(id)a3
{
  return 0;
}

@end
