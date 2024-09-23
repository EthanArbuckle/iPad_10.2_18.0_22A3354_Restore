@implementation BWCinematicFramingNode

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    FigNote_AllowInternalDefaultLogs();
    fig_note_initialize_category_with_default_work_cf();
    fig_note_initialize_category_with_default_work_cf();
  }
}

- (BWCinematicFramingNode)initWithOutputDimensions:(id)a3 cameraInfoByPortType:(id)a4 horizontalSensorBinningFactor:(int)a5 verticalSensorBinningFactor:(int)a6 deviceOrientationCorrectionEnabled:(BOOL)a7 stillImageCaptureEnabled:(BOOL)a8 objectMetadataIdentifiers:(id)a9 maxLossyCompressionLevel:(int)a10 portTypes:(id)a11 cinematicFramingControls:(id *)a12 cameraHasDistortionCoefficients:(BOOL)a13 cameraHasCalibrationValidMaxRadius:(BOOL)a14 centerStageMetadataDeliveryEnabled:(BOOL)a15 pipelineType:(unint64_t)a16
{
  _BOOL4 v16;
  BWCinematicFramingNode *v22;
  uint64_t v23;
  id v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  objc_super v30;

  v16 = a8;
  v30.receiver = self;
  v30.super_class = (Class)BWCinematicFramingNode;
  v22 = -[BWNode init](&v30, sel_init);
  v23 = (uint64_t)v22;
  if (v22)
  {
    v22->_outputDimensions = ($470D365275581EF16070F5A11344F73E)a3;
    v22->_cameraInfoByPortType = (NSDictionary *)a4;
    v24 = a11;
    *(_QWORD *)(v23 + 448) = v24;
    objc_msgSend((id)v23, "setSupportsConcurrentLiveInputCallbacks:", (unint64_t)objc_msgSend(v24, "count") > 1);
    *(_DWORD *)(v23 + 136) = 0;
    if ((a5 - 3) >= 0xFFFFFFFE && (*(_DWORD *)(v23 + 140) = a5, (a6 - 3) >= 0xFFFFFFFE))
    {
      *(_DWORD *)(v23 + 144) = a6;
      *(_DWORD *)(v23 + 444) = a10;
      *(_QWORD *)(v23 + 408) = objc_alloc_init(BWDeviceOrientationMonitor);
      *(_BYTE *)(v23 + 441) = a7;
      *(_QWORD *)(v23 + 96) = objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", objc_msgSend(a11, "count"));
      *(_QWORD *)(v23 + 512) = a16;
      -[BWCinematicFramingNode _addVideoCaptureInputsAndOutput](v23);
      *(_BYTE *)(v23 + 440) = v16;
      if (v16)
      {
        *(_DWORD *)(v23 + 316) = 0;
        *(_QWORD *)(v23 + 232) = 0;
        *(_OWORD *)(v23 + 200) = 0u;
        *(_OWORD *)(v23 + 216) = 0u;
        *(_OWORD *)(v23 + 168) = 0u;
        *(_OWORD *)(v23 + 184) = 0u;
        *(_QWORD *)(v23 + 304) = 0;
        *(_OWORD *)(v23 + 288) = 0u;
        *(_OWORD *)(v23 + 272) = 0u;
        *(_OWORD *)(v23 + 256) = 0u;
        *(_OWORD *)(v23 + 240) = 0u;
        *(_DWORD *)(v23 + 312) = 0;
      }
      if (a9)
      {
        *(_QWORD *)(v23 + 112) = objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", objc_msgSend(a11, "count"));
        -[BWCinematicFramingNode _addMetadaInputsAndOutputsWithObjectMetadataIdentifiers:](v23, (uint64_t)a9);
      }
      *(_DWORD *)(v23 + 436) = 5;
      v26 = *(_OWORD *)&a12->var3.origin.y;
      v25 = *(_OWORD *)&a12->var3.size.height;
      v27 = *(_OWORD *)&a12->var9;
      *(_OWORD *)(v23 + 376) = *(_OWORD *)&a12->var6;
      *(_OWORD *)(v23 + 392) = v27;
      *(_OWORD *)(v23 + 344) = v26;
      *(_OWORD *)(v23 + 360) = v25;
      *(_OWORD *)(v23 + 328) = *(_OWORD *)&a12->var0;
      *(_BYTE *)(v23 + 466) = a13;
      *(_BYTE *)(v23 + 467) = a14;
      *(_BYTE *)(v23 + 520) = a15;
      -[BWCinematicFramingNode _updateOutputRequirements](v23);
      *(_BYTE *)(v23 + 469) = 0;
      v28 = *(_OWORD *)(MEMORY[0x1E0C9D628] + 16);
      *(_OWORD *)(v23 + 472) = *MEMORY[0x1E0C9D628];
      *(_OWORD *)(v23 + 488) = v28;
      *(_QWORD *)(v23 + 504) = 0;
    }
    else
    {
      return 0;
    }
  }
  return (BWCinematicFramingNode *)v23;
}

- (void)_addVideoCaptureInputsAndOutput
{
  void *v2;
  unint64_t v3;
  BWNodeInput *v4;
  BWVideoFormatRequirements *v5;
  BWVideoFormatRequirements *v6;
  BWNodeOutput *v7;

  if (a1)
  {
    v2 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    if (objc_msgSend(*(id *)(a1 + 448), "count"))
    {
      v3 = 0;
      do
      {
        v4 = -[BWNodeInput initWithMediaType:node:index:]([BWNodeInput alloc], "initWithMediaType:node:index:", 1986618469, a1, v3);
        v5 = objc_alloc_init(BWVideoFormatRequirements);
        -[BWVideoFormatRequirements setSupportedPixelFormats:](v5, "setSupportedPixelFormats:", FigCapturePixelFormatsByAddingCompressedVariants(&unk_1E4A00428, *(_DWORD *)(a1 + 444)));
        -[BWNodeInput setFormatRequirements:](v4, "setFormatRequirements:", v5);
        -[BWNodeInputMediaConfiguration setPassthroughMode:](-[BWNodeInput primaryMediaConfiguration](v4, "primaryMediaConfiguration"), "setPassthroughMode:", 0);
        -[BWNodeInput setDelayedBufferCount:](v4, "setDelayedBufferCount:", -[BWNodeInput delayedBufferCount](v4, "delayedBufferCount") + 1);
        objc_msgSend((id)a1, "addInput:", v4);
        objc_msgSend(*(id *)(a1 + 96), "setObject:forKeyedSubscript:", v4, objc_msgSend(*(id *)(a1 + 448), "objectAtIndexedSubscript:", v3));

        objc_msgSend(v2, "addObject:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v3++));
      }
      while (v3 < objc_msgSend(*(id *)(a1 + 448), "count"));
    }
    v7 = -[BWNodeOutput initWithMediaType:node:]([BWNodeOutput alloc], "initWithMediaType:node:", 1986618469, a1);
    v6 = objc_alloc_init(BWVideoFormatRequirements);
    -[BWVideoFormatRequirements setSupportedPixelFormats:](v6, "setSupportedPixelFormats:", -[BWCinematicFramingNode _supportedOutputPixelFormats](a1));
    -[BWNodeOutput setFormatRequirements:](v7, "setFormatRequirements:", v6);
    -[BWNodeOutputMediaConfiguration setPassthroughMode:](-[BWNodeOutput primaryMediaConfiguration](v7, "primaryMediaConfiguration"), "setPassthroughMode:", 0);
    *(_QWORD *)(a1 + 104) = v7;
    -[BWNodeOutputMediaConfiguration setIndexesOfInputsWhichDrivesThisOutput:](-[BWNodeOutput primaryMediaConfiguration](v7, "primaryMediaConfiguration"), "setIndexesOfInputsWhichDrivesThisOutput:", v2);
    if (*(_QWORD *)(a1 + 512) == 1)
      -[BWNodeOutput setOwningNodeRetainedBufferCount:](v7, "setOwningNodeRetainedBufferCount:", 3);
    objc_msgSend((id)a1, "addOutput:", v7);

  }
}

- (void)_addMetadaInputsAndOutputsWithObjectMetadataIdentifiers:(uint64_t)a1
{
  unint64_t v4;
  BWNodeInput *v5;
  BWNodeOutput *v6;

  if (a1)
  {
    if (objc_msgSend(*(id *)(a1 + 448), "count"))
    {
      v4 = 0;
      do
      {
        v5 = -[BWNodeInput initWithMediaType:node:index:]([BWNodeInput alloc], "initWithMediaType:node:index:", 1835365473, a1, objc_msgSend(*(id *)(a1 + 96), "count") + v4);
        objc_msgSend((id)a1, "addInput:", v5);
        objc_msgSend(*(id *)(a1 + 112), "setObject:forKeyedSubscript:", v5, objc_msgSend(*(id *)(a1 + 448), "objectAtIndexedSubscript:", v4));

        ++v4;
      }
      while (v4 < objc_msgSend(*(id *)(a1 + 448), "count"));
    }
    v6 = -[BWNodeOutput initWithMediaType:node:]([BWNodeOutput alloc], "initWithMediaType:node:", 1836016234, a1);
    -[BWNodeOutput setFormat:](v6, "setFormat:", +[BWMetadataObjectFormat formatWithMetadataIdentifiers:](BWMetadataObjectFormat, "formatWithMetadataIdentifiers:", a2));
    objc_msgSend((id)a1, "addOutput:", v6);
    *(_QWORD *)(a1 + 120) = v6;

  }
}

- (uint64_t)_updateOutputRequirements
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  void *v4;
  void *v5;
  _QWORD v6[2];

  v6[1] = *MEMORY[0x1E0C80C00];
  if (result)
  {
    v1 = result;
    v2 = objc_msgSend((id)objc_msgSend((id)objc_msgSend((id)objc_msgSend(*(id *)(result + 96), "allValues"), "objectAtIndexedSubscript:", 0), "videoFormat"), "colorSpaceProperties");
    if ((_DWORD)v2)
    {
      v6[0] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v2);
      v3 = objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v6, 1);
    }
    else
    {
      v3 = 0;
    }
    v4 = -[BWCinematicFramingNode _supportedOutputPixelFormats](v1);
    v5 = (void *)objc_msgSend(*(id *)(v1 + 104), "formatRequirements");
    objc_msgSend(v5, "setWidth:", *(int *)(v1 + 160));
    objc_msgSend(v5, "setHeight:", *(int *)(v1 + 164));
    objc_msgSend(v5, "setSupportedColorSpaceProperties:", v3);
    return objc_msgSend(v5, "setSupportedPixelFormats:", v4);
  }
  return result;
}

- (void)dealloc
{
  opaqueCMFormatDescription *outputFormatDescription;
  objc_super v4;

  -[VCProcessor purgeResources](self->_vcProcessor, "purgeResources");
  outputFormatDescription = self->_outputFormatDescription;
  if (outputFormatDescription)
    CFRelease(outputFormatDescription);
  if (self->_stillImageCaptureEnabled)
  {

  }
  v4.receiver = self;
  v4.super_class = (Class)BWCinematicFramingNode;
  -[BWNode dealloc](&v4, sel_dealloc);
}

- (id)nodeType
{
  return CFSTR("Effect");
}

- (id)nodeSubType
{
  return CFSTR("CinematicFraming");
}

- (void)prepareForCurrentConfigurationToBecomeLive
{
  objc_super v3;

  BWUtilitiesWarnIfInputFormatsMismatch(-[BWNode inputs](self, "inputs"), self->super._input);
  v3.receiver = self;
  v3.super_class = (Class)BWCinematicFramingNode;
  -[BWNode prepareForCurrentConfigurationToBecomeLive](&v3, sel_prepareForCurrentConfigurationToBecomeLive);
  -[BWCinematicFramingNode _initVirtualCameraProcessor]((uint64_t)self);
  -[BWDeviceOrientationMonitor start](self->_deviceOrientationMonitor, "start");
}

- (uint64_t)_initVirtualCameraProcessor
{
  uint64_t v1;
  void *v2;
  id v3;
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;

  if (result)
  {
    v1 = result;
    v2 = *(void **)(result + 320);
    if (v2)

    v3 = objc_alloc_init(MEMORY[0x1E0D10650]);
    *(_QWORD *)(v1 + 320) = v3;
    objc_msgSend(v3, "setOutputDimensions:", *(_QWORD *)(v1 + 160));
    objc_msgSend(*(id *)(v1 + 320), "setCameraInfoByPortType:", *(_QWORD *)(v1 + 152));
    if (objc_msgSend(*(id *)(v1 + 320), "setup")
      || objc_msgSend(*(id *)(v1 + 320), "prewarm"))
    {
      result = FigDebugAssert3();
      if (dword_1EE6BE998)
      {
        os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
        os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
        return fig_log_call_emit_and_clean_up_after_send_and_compose();
      }
    }
    else
    {
      objc_msgSend(*(id *)(v1 + 320), "setOrientationCorrectionEnabled:", *(unsigned __int8 *)(v1 + 441));
      return -[BWCinematicFramingNode _updateVCProcessorWithCinematicFramingControls](v1);
    }
  }
  return result;
}

- (void)configurationWithID:(int64_t)a3 updatedFormat:(id)a4 didBecomeLiveForInput:(id)a5
{
  os_unfair_lock_s *p_bufferServicingLock;
  BOOL *p_videoOutputFormatIsLive;
  int *v9;

  p_bufferServicingLock = &self->_bufferServicingLock;
  os_unfair_lock_lock(&self->_bufferServicingLock);
  p_videoOutputFormatIsLive = &self->_videoOutputFormatIsLive;
  if (!self->_videoOutputFormatIsLive
    && (objc_msgSend((id)-[NSMutableDictionary allValues](self->_videoCaptureInputsByPortType, "allValues"), "containsObject:", a5) & 1) != 0)
  {
    v9 = &OBJC_IVAR___BWCinematicFramingNode__videoCaptureOutput;
LABEL_7:
    objc_msgSend(*(id *)((char *)&self->super.super.isa + *v9), "makeConfiguredFormatLive");
    *p_videoOutputFormatIsLive = 1;
    goto LABEL_8;
  }
  p_videoOutputFormatIsLive = &self->_metadataOutputFormatIsLive;
  if (!self->_metadataOutputFormatIsLive
    && objc_msgSend((id)-[NSMutableDictionary allValues](self->_detectionMetadataInputsByPortType, "allValues"), "containsObject:", a5))
  {
    v9 = &OBJC_IVAR___BWCinematicFramingNode__detectionMetadataOutput;
    goto LABEL_7;
  }
LABEL_8:
  os_unfair_lock_unlock(p_bufferServicingLock);
}

- (void)didReachEndOfDataForInput:(id)a3
{
  os_unfair_lock_s *p_bufferServicingLock;
  int *p_endOfDataVideoInputsCount;
  unsigned int v7;
  signed int v8;
  uint64_t v9;
  uint64_t v10;
  int *p_endOfDataMetadataInputsCount;
  unsigned int v12;
  signed int v13;

  p_bufferServicingLock = &self->_bufferServicingLock;
  os_unfair_lock_lock(&self->_bufferServicingLock);
  if (objc_msgSend((id)-[NSMutableDictionary allValues](self->_videoCaptureInputsByPortType, "allValues"), "containsObject:", a3))
  {
    p_endOfDataVideoInputsCount = &self->_endOfDataVideoInputsCount;
    do
    {
      v7 = __ldxr((unsigned int *)p_endOfDataVideoInputsCount);
      v8 = v7 + 1;
    }
    while (__stxr(v8, (unsigned int *)p_endOfDataVideoInputsCount));
    v9 = 0;
    v10 = v8;
  }
  else if (objc_msgSend((id)-[NSMutableDictionary allValues](self->_detectionMetadataInputsByPortType, "allValues"), "containsObject:", a3))
  {
    p_endOfDataMetadataInputsCount = &self->_endOfDataMetadataInputsCount;
    do
    {
      v12 = __ldxr((unsigned int *)p_endOfDataMetadataInputsCount);
      v13 = v12 + 1;
    }
    while (__stxr(v13, (unsigned int *)p_endOfDataMetadataInputsCount));
    v10 = 0;
    v9 = v13;
  }
  else
  {
    v10 = 0;
    v9 = 0;
  }
  os_unfair_lock_unlock(p_bufferServicingLock);
  if (v10 == -[NSMutableDictionary count](self->_videoCaptureInputsByPortType, "count"))
  {
    -[BWDeviceOrientationMonitor stop](self->_deviceOrientationMonitor, "stop");
    -[BWNodeOutput markEndOfLiveOutput](self->_videoCaptureOutput, "markEndOfLiveOutput");
    -[BWCinematicFramingNode _reportCinematicFramingSessionCoreAnalyticsData]((uint64_t)self);
    self->_endOfDataVideoInputsCount = 0;
  }
  if (v9 == -[NSMutableDictionary count](self->_detectionMetadataInputsByPortType, "count"))
  {
    -[BWNodeOutput markEndOfLiveOutput](self->_detectionMetadataOutput, "markEndOfLiveOutput");
    self->_endOfDataMetadataInputsCount = 0;
  }
}

- (uint64_t)_reportCinematicFramingSessionCoreAnalyticsData
{
  uint64_t v1;
  BWCinematicFramingSessionAnalyticsPayload *v2;
  void *v3;
  id v4;
  unint64_t v5;

  if (result)
  {
    v1 = result;
    v2 = objc_alloc_init(BWCinematicFramingSessionAnalyticsPayload);
    -[BWCinematicFramingSessionAnalyticsPayload setCinematicFramingMaxPeopleDetected:](v2, "setCinematicFramingMaxPeopleDetected:", *(unsigned int *)(v1 + 416));
    v3 = (void *)objc_msgSend((id)objc_msgSend(*(id *)(v1 + 320), "framingSession"), "roiHeatMapCounts");
    v4 = objc_alloc_init(MEMORY[0x1E0CB37A0]);
    if (objc_msgSend(v3, "count"))
    {
      v5 = 0;
      do
      {
        objc_msgSend(v4, "appendString:", objc_msgSend((id)objc_msgSend(v3, "objectAtIndexedSubscript:", v5), "stringValue"));
        if (v5 != objc_msgSend(v3, "count") - 1)
          objc_msgSend(v4, "appendString:", CFSTR(","));
        ++v5;
      }
      while (objc_msgSend(v3, "count") > v5);
    }
    -[BWCinematicFramingSessionAnalyticsPayload setCinematicFramingROIHeatMap:](v2, "setCinematicFramingROIHeatMap:", v4);
    -[BWCinematicFramingSessionAnalyticsPayload setClientApplicationID:](v2, "setClientApplicationID:", *(_QWORD *)(v1 + 424));
    -[BWCinematicFramingSessionAnalyticsPayload setCinematicFramingControlMode:](v2, "setCinematicFramingControlMode:", *(unsigned int *)(v1 + 432));
    return -[BWCoreAnalyticsReporter sendEvent:](+[BWCoreAnalyticsReporter sharedInstance](BWCoreAnalyticsReporter, "sharedInstance"), "sendEvent:", v2);
  }
  return result;
}

- (void)didChangeCenterStageRectOfInterest:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  os_unfair_lock_s *p_bufferServicingLock;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  p_bufferServicingLock = &self->_bufferServicingLock;
  os_unfair_lock_lock(&self->_bufferServicingLock);
  -[VCProcessor setOutputROI:](self->_vcProcessor, "setOutputROI:", x, y, width, height);
  os_unfair_lock_unlock(p_bufferServicingLock);
}

- (void)didChangeCenterStageFramingMode:(int)a3
{
  uint64_t v3;
  os_unfair_lock_s *p_bufferServicingLock;

  v3 = *(_QWORD *)&a3;
  p_bufferServicingLock = &self->_bufferServicingLock;
  os_unfair_lock_lock(&self->_bufferServicingLock);
  objc_msgSend((id)-[VCProcessor framingSession](self->_vcProcessor, "framingSession"), "setFramingStyle:", v3);
  os_unfair_lock_unlock(p_bufferServicingLock);
}

- (void)didChangeCenterStageMetadataDeliveryEnabled:(BOOL)a3
{
  os_unfair_lock_s *p_bufferServicingLock;

  p_bufferServicingLock = &self->_bufferServicingLock;
  os_unfair_lock_lock(&self->_bufferServicingLock);
  self->_centerStageMetadataDeliveryEnabled = a3;
  os_unfair_lock_unlock(p_bufferServicingLock);
}

- (void)restrictCenterStageFieldOfViewToWide:(BOOL)a3
{
  os_unfair_lock_s *p_bufferServicingLock;

  p_bufferServicingLock = &self->_bufferServicingLock;
  os_unfair_lock_lock(&self->_bufferServicingLock);
  self->_cinematicFramingControls.fieldOfViewRestrictedToWide = a3;
  os_unfair_lock_unlock(p_bufferServicingLock);
}

- ($1981ABD3383123DE67D3222CA4FC2B97)cinematicFramingControls
{
  os_unfair_lock_s *p_bufferServicingLock;
  __int128 v6;
  __int128 v7;
  $1981ABD3383123DE67D3222CA4FC2B97 *result;

  p_bufferServicingLock = &self->_bufferServicingLock;
  os_unfair_lock_lock(&self->_bufferServicingLock);
  v6 = *(_OWORD *)&self->_cinematicFramingControls.panningAngleX;
  *(_OWORD *)&retstr->var3.size.height = *(_OWORD *)&self->_cinematicFramingControls.outputFramingRectOfInterest.size.height;
  *(_OWORD *)&retstr->var6 = v6;
  *(_OWORD *)&retstr->var9 = *(_OWORD *)&self->_cinematicFramingControls.defaultVirtualCameraRotationAngleX;
  v7 = *(_OWORD *)&self->_cinematicFramingControls.outputFramingRectOfInterest.origin.y;
  *(_OWORD *)&retstr->var0 = *(_OWORD *)&self->_cinematicFramingControls.autoFramingEnabled;
  *(_OWORD *)&retstr->var3.origin.y = v7;
  os_unfair_lock_unlock(p_bufferServicingLock);
  return result;
}

- (void)setCinematicFramingControls:(id *)a3
{
  os_unfair_lock_s *p_bufferServicingLock;
  __int128 v6;
  __int128 v7;
  __int128 v8;

  p_bufferServicingLock = &self->_bufferServicingLock;
  os_unfair_lock_lock(&self->_bufferServicingLock);
  *(_OWORD *)&self->_cinematicFramingControls.autoFramingEnabled = *(_OWORD *)&a3->var0;
  v6 = *(_OWORD *)&a3->var9;
  v8 = *(_OWORD *)&a3->var3.origin.y;
  v7 = *(_OWORD *)&a3->var3.size.height;
  *(_OWORD *)&self->_cinematicFramingControls.panningAngleX = *(_OWORD *)&a3->var6;
  *(_OWORD *)&self->_cinematicFramingControls.defaultVirtualCameraRotationAngleX = v6;
  *(_OWORD *)&self->_cinematicFramingControls.outputFramingRectOfInterest.origin.y = v8;
  *(_OWORD *)&self->_cinematicFramingControls.outputFramingRectOfInterest.size.height = v7;
  -[BWCinematicFramingNode _updateVCProcessorWithCinematicFramingControls]((uint64_t)self);
  os_unfair_lock_unlock(p_bufferServicingLock);
}

- (uint64_t)_updateVCProcessorWithCinematicFramingControls
{
  uint64_t v1;
  double v2;
  double v3;
  double v4;

  if (result)
  {
    v1 = result;
    objc_msgSend(*(id *)(result + 320), "setAutoFramingEnabled:", *(unsigned __int8 *)(result + 328));
    objc_msgSend(*(id *)(v1 + 320), "setFisheyeEffectEnabled:", *(unsigned __int8 *)(v1 + 329));
    objc_msgSend(*(id *)(v1 + 320), "setOutputCameraDefaultRotation:", COERCE_DOUBLE(vcvt_f32_f64(vdivq_f64(vmulq_f64(vcvtq_f64_f32(*(float32x2_t *)(v1 + 392)), (float64x2_t)vdupq_n_s64(0x400921FB54442D18uLL)), (float64x2_t)vdupq_n_s64(0x4066800000000000uLL)))));
    if (*(_BYTE *)(v1 + 328))
    {
      objc_msgSend(*(id *)(v1 + 320), "setOutputROI:", *(double *)(v1 + 336), *(double *)(v1 + 344), *(double *)(v1 + 352), *(double *)(v1 + 360));
      return objc_msgSend((id)objc_msgSend(*(id *)(v1 + 320), "framingSession"), "setFramingStyle:", *(unsigned int *)(v1 + 368));
    }
    else
    {
      objc_msgSend(*(id *)(v1 + 320), "setOutputROI:", 0.0, 0.0, 1.0, 1.0);
      v2 = *(double *)(v1 + 376);
      objc_msgSend((id)objc_msgSend(*(id *)(v1 + 320), "outputCamera"), "setRotation:", v2);
      LODWORD(v3) = *(_DWORD *)(v1 + 372);
      objc_msgSend(*(id *)(v1 + 320), "setVideoZoomFactor:", v3);
      v4 = *(double *)(v1 + 384);
      *(float *)&v4 = v4;
      return objc_msgSend(*(id *)(v1 + 320), "setManualFramingDefaultVideoZoomFactor:", v4);
    }
  }
  return result;
}

- (BOOL)cinematicFramingControlsSuspended
{
  BWCinematicFramingNode *v2;
  os_unfair_lock_s *p_bufferServicingLock;

  v2 = self;
  p_bufferServicingLock = &self->_bufferServicingLock;
  os_unfair_lock_lock(&self->_bufferServicingLock);
  LOBYTE(v2) = v2->_cinematicFramingControlsSuspended;
  os_unfair_lock_unlock(p_bufferServicingLock);
  return (char)v2;
}

- (void)setCinematicFramingControlsSuspended:(BOOL)a3
{
  os_unfair_lock_s *p_bufferServicingLock;

  p_bufferServicingLock = &self->_bufferServicingLock;
  os_unfair_lock_lock(&self->_bufferServicingLock);
  self->_cinematicFramingControlsSuspended = a3;
  os_unfair_lock_unlock(p_bufferServicingLock);
}

- (BOOL)isRegionOfInterestForCameraControlsFeedbackEnabled
{
  return self->_regionOfInterestForCameraControlsEnabled;
}

- (void)setRegionOfInterestForCameraControlsFeedbackEnabled:(BOOL)a3
{
  self->_regionOfInterestForCameraControlsEnabled = a3;
}

- (void)startPanningAtPoint:(CGPoint)a3
{
  double y;
  double x;
  os_unfair_lock_s *p_bufferServicingLock;

  y = a3.y;
  x = a3.x;
  p_bufferServicingLock = &self->_bufferServicingLock;
  os_unfair_lock_lock(&self->_bufferServicingLock);
  -[VCProcessor startRotatingFromPoint:](self->_vcProcessor, "startRotatingFromPoint:", x, y);
  os_unfair_lock_unlock(p_bufferServicingLock);
}

- (void)panWithTranslation:(CGPoint)a3
{
  double y;
  double x;
  os_unfair_lock_s *p_bufferServicingLock;

  y = a3.y;
  x = a3.x;
  p_bufferServicingLock = &self->_bufferServicingLock;
  os_unfair_lock_lock(&self->_bufferServicingLock);
  -[VCProcessor continueRotatingToPoint:](self->_vcProcessor, "continueRotatingToPoint:", x, y);
  os_unfair_lock_unlock(p_bufferServicingLock);
}

- (void)performOneShotFraming
{
  os_unfair_lock_s *p_bufferServicingLock;

  p_bufferServicingLock = &self->_bufferServicingLock;
  os_unfair_lock_lock(&self->_bufferServicingLock);
  -[VCProcessor adjustToFrameCurrentScene](self->_vcProcessor, "adjustToFrameCurrentScene");
  os_unfair_lock_unlock(p_bufferServicingLock);
  self->_oneShotFramingInFlight = 1;
}

- (void)resetFraming
{
  os_unfair_lock_s *p_bufferServicingLock;

  p_bufferServicingLock = &self->_bufferServicingLock;
  os_unfair_lock_lock(&self->_bufferServicingLock);
  -[VCProcessor resetOutputCamera](self->_vcProcessor, "resetOutputCamera");
  os_unfair_lock_unlock(p_bufferServicingLock);
  self->_outputCameraResetInFlight = 1;
}

- (double)manualFramingVideoZoomFactor
{
  os_unfair_lock_s *p_bufferServicingLock;
  float v4;
  double v5;

  p_bufferServicingLock = &self->_bufferServicingLock;
  os_unfair_lock_lock(&self->_bufferServicingLock);
  -[VCProcessor videoZoomFactor](self->_vcProcessor, "videoZoomFactor");
  v5 = v4;
  os_unfair_lock_unlock(p_bufferServicingLock);
  return v5;
}

- (void)setManualFramingVideoZoomFactor:(double)a3
{
  os_unfair_lock_s *p_bufferServicingLock;
  double v6;
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;

  p_bufferServicingLock = &self->_bufferServicingLock;
  os_unfair_lock_lock(&self->_bufferServicingLock);
  if (self->_cinematicFramingControlsSuspended)
  {
    if (dword_1EE6BE998)
    {
      os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
      fig_log_call_emit_and_clean_up_after_send_and_compose();
    }
  }
  else
  {
    *(float *)&v6 = a3;
    -[VCProcessor setVideoZoomFactor:](self->_vcProcessor, "setVideoZoomFactor:", v6);
  }
  os_unfair_lock_unlock(p_bufferServicingLock);
}

- (void)setRegionOfInterestForCameraControlsChangedHandler:(id)a3
{

  self->_regionOfInterestForCameraControlsChangedHandler = (id)objc_msgSend(a3, "copy");
}

- (id)regionOfInterestForCameraControlsChangedHandler
{
  return self->_regionOfInterestForCameraControlsChangedHandler;
}

- (void)renderSampleBuffer:(opaqueCMSampleBuffer *)a3 forInput:(id)a4
{
  void *v4;
  os_unfair_lock_s *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  os_unfair_lock_s *v11;
  int v12;
  int v13;
  int v14;
  void *v15;
  void *v16;
  int CopyWithNewPixelBuffer;
  const __CFDictionary *v18;
  const __CFDictionary *Value;
  CFTypeRef v20;
  void *v21;
  __CVBuffer *ImageBuffer;
  size_t Width;
  size_t Height;
  void *v25;
  int v26;
  int v27;
  char v28;
  char v29;
  __CVBuffer *v30;
  int v31;
  BOOL v32;
  float v33;
  os_unfair_lock_s *v34;
  CFTypeRef v35;
  CFTypeRef v36;
  uint64_t v37;
  id v38;
  char v39;
  char v40;
  const __CFDictionary *v41;
  double v42;
  double v43;
  double v44;
  void *v45;
  _BOOL4 v46;
  char IsExtensionDeviceType;
  const __CFString *v48;
  const void *v49;
  int v50;
  int v51;
  double v52;
  double v53;
  double v54;
  double v55;
  double v56;
  double v57;
  double v58;
  double v59;
  double v60;
  double v61;
  unint64_t v62;
  CFDictionaryRef v63;
  const __CFDictionary *v64;
  const __CFDictionary *v65;
  void *v66;
  CGColorSpaceRef ColorSpaceFromAttachments;
  const __CFString *v68;
  void *v69;
  const __CFString *v70;
  void *v71;
  int v72;
  int v73;
  float64_t v74;
  uint64_t v75;
  int v76;
  int v77;
  uint64_t v78;
  uint64_t v79;
  const void *v80;
  const __CFString *v81;
  int v82;
  int v83;
  float64_t v84;
  uint64_t v85;
  int v86;
  uint64_t v87;
  unsigned int v88;
  unsigned int v89;
  unsigned int v90;
  void *v91;
  void *v92;
  double v93;
  double v94;
  double v95;
  double v96;
  int v97;
  CFTypeRef v98;
  __CVBuffer *v99;
  id v100;
  uint64_t v101;
  int v102;
  uint64_t v103;
  void *v104;
  CMAttachmentBearerRef target;
  __CVBuffer *v106;
  void *PortTypeForInputFromInputByPortTypes;
  CMTime v108;
  int v109;
  float32x2_t v110;
  int v111;
  CMTime v112;
  CFTypeRef cf;
  float64x2_t v114;
  __int128 v115;
  __int128 v116;
  __int128 v117;
  uint64_t v118;

  v5 = (os_unfair_lock_s *)MEMORY[0x1E0C80A78](self, a2, a3, a4);
  v7 = v6;
  v9 = v8;
  v10 = (uint64_t)v5;
  v118 = *MEMORY[0x1E0C80C00];
  v11 = v5 + 34;
  os_unfair_lock_lock(v5 + 34);
  cf = 0;
  v12 = objc_msgSend((id)objc_msgSend(*(id *)(v10 + 96), "allValues"), "containsObject:", v7);
  v13 = objc_msgSend((id)objc_msgSend(*(id *)(v10 + 112), "allValues"), "containsObject:", v7);
  v14 = v13;
  if ((v12 & 1) == 0 && !v13)
  {
    CopyWithNewPixelBuffer = 0;
    v18 = 0;
    goto LABEL_67;
  }
  v15 = (void *)CMGetAttachment(v9, (CFStringRef)*MEMORY[0x1E0D05CB0], 0);
  if (v12)
  {
    v4 = *(void **)(v10 + 104);
    PortTypeForInputFromInputByPortTypes = (void *)BWUtilitiesGetPortTypeForInputFromInputByPortTypes((uint64_t)v7, *(void **)(v10 + 96));
    if ((unint64_t)objc_msgSend(*(id *)(v10 + 96), "count") >= 2)
    {
      v16 = (void *)objc_msgSend(v15, "objectForKeyedSubscript:", *MEMORY[0x1E0D06EB8]);
      if (v16)
      {
        if ((objc_msgSend(v16, "BOOLValue") & 1) == 0)
          goto LABEL_7;
      }
    }
  }
  else
  {
    if (!v14)
    {
      CopyWithNewPixelBuffer = 0;
      v18 = 0;
      v4 = 0;
      goto LABEL_67;
    }
    PortTypeForInputFromInputByPortTypes = 0;
    v4 = *(void **)(v10 + 120);
  }
  if (!v4)
  {
LABEL_7:
    CopyWithNewPixelBuffer = 0;
    v18 = 0;
    goto LABEL_67;
  }
  Value = (const __CFDictionary *)CFDictionaryGetValue((CFDictionaryRef)v15, (const void *)*MEMORY[0x1E0D05D00]);
  memset(&v112, 0, sizeof(v112));
  CMTimeMakeFromDictionary(&v112, Value);
  if ((v12 & 1) == 0)
  {
    v18 = 0;
    v30 = 0;
    goto LABEL_60;
  }
  v20 = CMGetAttachment(v9, CFSTR("OriginalCameraIntrinsicMatrix"), 0);
  if (!v20)
  {
    FigDebugAssert3();
    goto LABEL_7;
  }
  v21 = (void *)v20;
  v18 = (const __CFDictionary *)CMGetAttachment(v9, CFSTR("OriginalCameraIntrinsicMatrixReferenceDimensions"), 0);
  if (v18)
  {
    v106 = (__CVBuffer *)objc_msgSend((id)objc_msgSend((id)objc_msgSend((id)objc_msgSend((id)v10, "output"), "primaryMediaProperties"), "livePixelBufferPool"), "newPixelBuffer");
    if (v106)
    {
      v102 = v14;
      v104 = v4;
      ImageBuffer = CMSampleBufferGetImageBuffer((CMSampleBufferRef)v9);
      Width = CVPixelBufferGetWidth(ImageBuffer);
      Height = CVPixelBufferGetHeight(ImageBuffer);
      v25 = *(void **)(v10 + 152);
      v26 = *(_DWORD *)(v10 + 140);
      v27 = *(_DWORD *)(v10 + 144);
      v28 = *(_BYTE *)(v10 + 466);
      v29 = *(_BYTE *)(v10 + 467);
      v114 = *(float64x2_t *)&v112.value;
      *(_QWORD *)&v115 = v112.epoch;
      v18 = (const __CFDictionary *)(id)FigCaptureCreateCalibrationDataDictionaryFromSampleBufferMetadataIncludeMaxRadius(v15, (__int128 *)&v114, v25, v26, v27, v21, v18, 0, 0, v28, v29);
      if (v18)
      {
        if (objc_msgSend((id)objc_msgSend(v15, "objectForKeyedSubscript:", *MEMORY[0x1E0D06C40]), "intValue") >= *(_DWORD *)(v10 + 436))v103 = objc_msgSend(v15, "objectForKeyedSubscript:", *MEMORY[0x1E0D069A0]);
        else
          v103 = 0;
        v111 = 0;
        v110 = 0;
        v31 = 0;
        if ((objc_msgSend((id)objc_msgSend(v15, "objectForKeyedSubscript:", *MEMORY[0x1E0D06B78]), "unsignedIntValue") & 1) == 0)
        {
          bzero(&v114, 0x14A0uLL);
          v109 = 0;
          if (FigMotionGetMotionDataFromISP((CFDictionaryRef)v15, &v114, 0, 110, &v109, &v110, 0, 0, 0))v32 = 1;
          else
            v32 = v109 <= 0;
          v31 = !v32;
        }
        target = v9;
        v33 = (float)Width / (float)Height;
        v34 = v11;
        if (*(_BYTE *)(v10 + 328))
        {
          v35 = CMGetAttachment(target, (CFStringRef)*MEMORY[0x1E0D05C08], 0);
          v36 = CMGetAttachment(target, (CFStringRef)*MEMORY[0x1E0D05C00], 0);
        }
        else
        {
          v36 = 0;
          v35 = 0;
        }
        v37 = FigCaptureSensorIDFromSampleBufferMetadata(v15, *(void **)(v10 + 152));
        v38 = objc_alloc(MEMORY[0x1E0D10630]);
        v39 = *(_BYTE *)(v10 + 466);
        v40 = *(_BYTE *)(v10 + 467);
        v114 = *(float64x2_t *)&v112.value;
        *(_QWORD *)&v115 = v112.epoch;
        BYTE1(v101) = v40;
        LOBYTE(v101) = v39;
        v41 = (const __CFDictionary *)objc_msgSend(v38, "initWithDetectedObjectsInfo:calibrationData:timestamp:aspectRatio:sensorID:filteredFaceIDs:filteredBodyIDs:calibrationDistortionCoefficientsSupported:calibrationValidMaxRadiusSupported:", v103, v18, &v114, v37, v35, v36, COERCE_DOUBLE(__PAIR64__(HIDWORD(v112.value), LODWORD(v33))), v101);
        v18 = v41;
        if (v41)
        {
          v11 = v34;
          if (v31)
          {
            LODWORD(v43) = v110.i32[1];
            LODWORD(v42) = v110.i32[0];
            LODWORD(v44) = v111;
            -[__CFDictionary setGravityX:y:z:](v41, "setGravityX:y:z:", v42, v43, v44);
          }
          -[__CFDictionary setDeviceToCameraSpaceTransform:](v18, "setDeviceToCameraSpaceTransform:", -[BWCinematicFramingNode _getDeviceToCameraSpaceTransform:](v10, v15));
          -[__CFDictionary setPortType:](v18, "setPortType:", PortTypeForInputFromInputByPortTypes);
          -[__CFDictionary setCameraOrientation:](v18, "setCameraOrientation:", objc_msgSend(*(id *)(v10 + 408), "mostRecentPortraitLandscapeOrientation"));
          v45 = (void *)objc_msgSend(*(id *)(v10 + 152), "objectForKeyedSubscript:", PortTypeForInputFromInputByPortTypes);
          objc_msgSend((id)objc_msgSend(v45, "objectForKeyedSubscript:", *MEMORY[0x1E0D058C8]), "floatValue");
          -[__CFDictionary setAdditionalInputCameraRotation:](v18, "setAdditionalInputCameraRotation:");
          v46 = BWCaptureDevicePositionFromPortType(PortTypeForInputFromInputByPortTypes) == 2;
          IsExtensionDeviceType = BWDeviceTypeIsExtensionDeviceType(objc_msgSend((id)objc_msgSend(v15, "objectForKeyedSubscript:", *MEMORY[0x1E0D069B8]), "integerValue"));
          -[__CFDictionary setFrontCameraHas180DegreesRotation:](v18, "setFrontCameraHas180DegreesRotation:", FigCaptureCameraRequires180DegreesRotation(v46, IsExtensionDeviceType));
          v48 = (const __CFString *)*MEMORY[0x1E0D06F48];
          v49 = (const void *)objc_msgSend(v15, "objectForKeyedSubscript:", *MEMORY[0x1E0D06F48]);
          v9 = (void *)target;
          if (v49)
            CVBufferSetAttachment(ImageBuffer, v48, v49, kCVAttachmentMode_ShouldPropagate);
          objc_msgSend(*(id *)(v10 + 320), "setInputPixelBuffer:", ImageBuffer);
          objc_msgSend(*(id *)(v10 + 320), "setInputMetadata:", v18);
          v30 = v106;
          objc_msgSend(*(id *)(v10 + 320), "setOutputPixelBuffer:", v106);
          v50 = objc_msgSend(*(id *)(v10 + 320), "process");
          if (v50)
          {
            CopyWithNewPixelBuffer = v50;
          }
          else
          {
            v51 = objc_msgSend(*(id *)(v10 + 320), "finishProcessing");
            if (!v51)
            {
              if (*(_QWORD *)(v10 + 512) == 1)
              {
                if (*(_BYTE *)(v10 + 469) && *(_QWORD *)(v10 + 504))
                {
                  objc_msgSend(MEMORY[0x1E0D10650], "warpCGRect:fromCamera:toCamera:", objc_msgSend(*(id *)(v10 + 320), "outputCamera"), objc_msgSend(*(id *)(v10 + 320), "inputCamera"), 0.0, 0.0, 1.0, 1.0);
                  v53 = v52;
                  v55 = v54;
                  v57 = v56;
                  v59 = v58 * (double)(unint64_t)objc_msgSend((id)objc_msgSend(v7, "videoFormat"), "width");
                  v60 = v53 * (double)(unint64_t)objc_msgSend((id)objc_msgSend(v7, "videoFormat"), "height");
                  v61 = v55 * (double)(unint64_t)objc_msgSend((id)objc_msgSend(v7, "videoFormat"), "width");
                  v62 = objc_msgSend((id)objc_msgSend(v7, "videoFormat"), "height");
                  *(double *)(v10 + 472) = v59;
                  *(double *)(v10 + 480) = v60;
                  *(double *)(v10 + 488) = v61;
                  *(double *)(v10 + 496) = v57 * (double)v62;
                  (*(void (**)(void))(*(_QWORD *)(v10 + 504) + 16))();
                }
                v63 = CVBufferCopyAttachments(ImageBuffer, kCVAttachmentMode_ShouldPropagate);
                if (v63)
                {
                  v64 = (const __CFDictionary *)CFAutorelease(v63);
                  if (v64)
                  {
                    v65 = v64;
                    v66 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithDictionary:", v64);
                    ColorSpaceFromAttachments = CVImageBufferCreateColorSpaceFromAttachments(v65);
                    objc_msgSend(v66, "setObject:forKeyedSubscript:", ColorSpaceFromAttachments, *MEMORY[0x1E0CA8CD8]);

                    CVBufferSetAttachments(v106, (CFDictionaryRef)v66, kCVAttachmentMode_ShouldPropagate);
                  }
                }
              }
              v68 = (const __CFString *)*MEMORY[0x1E0D05C10];
              v69 = (void *)MEMORY[0x1E0CB37E8];
              objc_msgSend((id)objc_msgSend(*(id *)(v10 + 320), "outputCamera"), "focalLength");
              CMSetAttachment(target, v68, (CFTypeRef)objc_msgSend(v69, "numberWithFloat:"), 1u);
              if (!*(_BYTE *)(v10 + 520))
                goto LABEL_48;
              v70 = (const __CFString *)*MEMORY[0x1E0D05BF8];
              v71 = (void *)MEMORY[0x1E0CB37E8];
              objc_msgSend((id)objc_msgSend(*(id *)(v10 + 320), "outputCamera"), "stereographicFisheyeStrength");
              CMSetAttachment(target, v70, (CFTypeRef)objc_msgSend(v71, "numberWithFloat:"), 1u);
              v116 = 0u;
              v117 = 0u;
              v114 = 0u;
              v115 = 0u;
              objc_msgSend(*(id *)(v10 + 320), "getPhysicalCameraToVirtualCameraTransform");
              LODWORD(v114.f64[1]) = v72;
              DWORD2(v115) = v73;
              v114.f64[0] = v74;
              *(_QWORD *)&v115 = v75;
              DWORD2(v116) = v76;
              DWORD2(v117) = v77;
              *(_QWORD *)&v116 = v78;
              *(_QWORD *)&v117 = v79;
              v80 = (const void *)objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", &v114, 64);
              CMSetAttachment(target, (CFStringRef)*MEMORY[0x1E0D05BF0], v80, 1u);
              if (*(_BYTE *)(v10 + 520))
              {
                v81 = (const __CFString *)*MEMORY[0x1E0CA2638];
              }
              else
              {
LABEL_48:
                v81 = (const __CFString *)*MEMORY[0x1E0CA2638];
                if (!CMGetAttachment(target, (CFStringRef)*MEMORY[0x1E0CA2638], 0))
                {
LABEL_50:
                  v30 = v106;
                  if (!*(_BYTE *)(v10 + 328))
                  {
                    CMRemoveAttachment(target, (CFStringRef)*MEMORY[0x1E0D05C08]);
                    CMRemoveAttachment(target, (CFStringRef)*MEMORY[0x1E0D05C00]);
                  }
                  v88 = objc_msgSend((id)-[__CFDictionary faceDetections](v18, "faceDetections"), "count");
                  v89 = objc_msgSend((id)-[__CFDictionary bodyDetections](v18, "bodyDetections"), "count");
                  if (v89 <= v88)
                    v90 = v88;
                  else
                    v90 = v89;
                  v14 = v102;
                  if (v90 > *(_DWORD *)(v10 + 416))
                    *(_DWORD *)(v10 + 416) = v90;
                  if (*(_BYTE *)(v10 + 440))
                  {
                    v91 = (void *)objc_msgSend(*(id *)(v10 + 320), "inputCamera");
                    v92 = (void *)objc_msgSend(*(id *)(v10 + 320), "outputCamera");
                    objc_msgSend(*(id *)(v10 + 320), "outputROI");
                    v114 = *(float64x2_t *)&v112.value;
                    *(_QWORD *)&v115 = v112.epoch;
                    -[BWCinematicFramingNode _saveCameraStatesForStillImageCaptureRequestsWithInputCamera:outputCamera:outputROI:pts:]((os_unfair_lock_s *)v10, v91, v92, &v114, v93, v94, v95, v96);
                  }
                  v4 = v104;
LABEL_60:
                  v97 = *(unsigned __int8 *)(v10 + 328);
                  if (v14)
                  {
                    FigCaptureCinematicFramingUpdateSampleBufferMetadata(*(void **)(v10 + 320), v9, v97 == 0);
                    CopyWithNewPixelBuffer = 0;
                    v98 = v9;
                  }
                  else
                  {
                    CopyWithNewPixelBuffer = BWCMSampleBufferCreateCopyWithNewPixelBuffer((opaqueCMSampleBuffer *)v9, v30, (CFTypeRef *)(v10 + 128), (CMSampleBufferRef *)&cf);
                    if (!cf)
                      goto LABEL_65;
                    v99 = CMSampleBufferGetImageBuffer((CMSampleBufferRef)v9);
                    CVBufferPropagateAttachments(v99, v30);
                    FigCaptureCinematicFramingUpdateSampleBufferMetadata(*(void **)(v10 + 320), cf, v97 == 0);
                    v98 = cf;
                  }
                  objc_msgSend(v4, "emitSampleBuffer:", v98);
LABEL_65:
                  if (!v30)
                    goto LABEL_67;
                  goto LABEL_66;
                }
              }
              v115 = 0u;
              v116 = 0u;
              v114 = 0u;
              objc_msgSend((id)objc_msgSend(*(id *)(v10 + 320), "outputCamera"), "intrinsicMatrix");
              LODWORD(v114.f64[1]) = v82;
              DWORD2(v115) = v83;
              v114.f64[0] = v84;
              *(_QWORD *)&v115 = v85;
              DWORD2(v116) = v86;
              *(_QWORD *)&v116 = v87;
              CMSetAttachment(target, v81, (CFTypeRef)objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", &v114, 48), 1u);
              goto LABEL_50;
            }
            CopyWithNewPixelBuffer = v51;
          }
          FigDebugAssert3();
          v4 = v104;
LABEL_66:
          CFRelease(v30);
          goto LABEL_67;
        }
        FigDebugAssert3();
        CopyWithNewPixelBuffer = -12783;
        v11 = v34;
        v9 = (void *)target;
      }
      else
      {
        FigDebugAssert3();
        CopyWithNewPixelBuffer = -12784;
      }
      v4 = v104;
      v30 = v106;
      goto LABEL_66;
    }
    v18 = 0;
    CopyWithNewPixelBuffer = -12786;
  }
  else
  {
    FigDebugAssert3();
    CopyWithNewPixelBuffer = 0;
  }
LABEL_67:
  if (cf)
    CFRelease(cf);

  if (CopyWithNewPixelBuffer)
  {
    CMSampleBufferGetPresentationTimeStamp(&v108, (CMSampleBufferRef)v9);
    v100 = +[BWDroppedSample newDroppedSampleWithReason:pts:](BWDroppedSample, "newDroppedSampleWithReason:pts:", 0x1E494F158, &v108);
    objc_msgSend(v4, "emitDroppedSample:", v100);

  }
  os_unfair_lock_unlock(v11);
}

- (double)_getDeviceToCameraSpaceTransform:(uint64_t)a1
{
  uint64_t v3;
  void *v4;
  int v5;
  void *v6;
  char IsExtensionDeviceType;
  int v8;
  __int128 *v9;
  __int128 v10;

  if (a1)
  {
    v3 = *MEMORY[0x1E0D06D00];
    v4 = (void *)objc_msgSend(a2, "objectForKeyedSubscript:", *MEMORY[0x1E0D06D00]);
    if ((objc_msgSend(v4, "isEqualToString:", *MEMORY[0x1E0D05A38]) & 1) != 0)
    {
      v5 = 1;
    }
    else
    {
      v6 = (void *)objc_msgSend(a2, "objectForKeyedSubscript:", v3);
      v5 = objc_msgSend(v6, "isEqualToString:", *MEMORY[0x1E0D05A50]);
    }
    IsExtensionDeviceType = BWDeviceTypeIsExtensionDeviceType(objc_msgSend((id)objc_msgSend(a2, "objectForKeyedSubscript:", *MEMORY[0x1E0D069B8]), "integerValue"));
    if (v5)
    {
      v8 = FigCaptureCameraRequires180DegreesRotation(1, IsExtensionDeviceType);
      v9 = (__int128 *)&_PromotedConst;
      if (!v8)
        v9 = (__int128 *)&_PromotedConst_229;
    }
    else
    {
      v9 = &_PromotedConst_230;
    }
    v10 = *v9;
  }
  else
  {
    *(_QWORD *)&v10 = 0;
  }
  return *(double *)&v10;
}

- (void)_saveCameraStatesForStillImageCaptureRequestsWithInputCamera:(void *)a3 outputCamera:(_QWORD *)a4 outputROI:(double)a5 pts:(double)a6
{
  uint64_t v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  __int128 v21;
  uint64_t v22;

  if (a1)
  {
    os_unfair_lock_lock(a1 + 79);
    v16 = (uint64_t)&a1[18 * a1[78]._os_unfair_lock_opaque + 42];
    v17 = *(void **)(v16 + 8);
    if (*(_QWORD *)v16)

    if (v17)
    v18 = objc_msgSend(a2, "copy", *a4, a4[1], a4[2]);
    v19 = objc_msgSend(a3, "copy");
    v20 = (uint64_t)&a1[18 * a1[78]._os_unfair_lock_opaque + 42];
    *(_QWORD *)v20 = v18;
    *(_QWORD *)(v20 + 8) = v19;
    *(_QWORD *)(v20 + 32) = v22;
    *(_OWORD *)(v20 + 16) = v21;
    *(double *)(v20 + 40) = a5;
    *(double *)(v20 + 48) = a6;
    *(double *)(v20 + 56) = a7;
    *(double *)(v20 + 64) = a8;
    a1[78]._os_unfair_lock_opaque = (a1[78]._os_unfair_lock_opaque & 1) == 0;
    os_unfair_lock_unlock(a1 + 79);
  }
}

- (void)handleDroppedSample:(id)a3 forInput:(id)a4
{
  BWUtilitiesGetPortTypeForInputFromInputByPortTypes((uint64_t)a4, self->_videoCaptureInputsByPortType);
}

- (id)copyCameraStatesForPTS:(id *)a3
{
  os_unfair_lock_s *p_stillCaptureQueueLock;
  uint64_t v6;
  VCCamera *v7;
  VCCamera *v8;
  int64_t var0;
  double v10;
  unint64_t v11;
  char v12;
  double v13;
  double v14;
  double v15;
  char v16;
  $BA83D5229CE839240D54103C1553A120 *v17;
  VCCamera *inputCamera;
  VCCamera *outputCamera;
  int64_t value;
  CGFloat y;
  CGFloat x;
  CGFloat height;
  CGFloat width;
  uint64_t v25;
  BOOL v26;
  double *v27;

  p_stillCaptureQueueLock = &self->_stillCaptureQueueLock;
  os_unfair_lock_lock(&self->_stillCaptureQueueLock);
  v6 = 0;
  v7 = 0;
  v8 = 0;
  var0 = a3->var0;
  v10 = 0.0;
  v11 = 0x7FFFFFFFFFFFFFFFLL;
  v12 = 1;
  v13 = 0.0;
  v14 = 0.0;
  v15 = 0.0;
  while (1)
  {
    v16 = v12;
    v17 = &self->_stillCaptureQueue[v6];
    inputCamera = v17->inputCamera;
    outputCamera = v17->outputCamera;
    value = v17->pts.value;
    x = v17->outputROI.origin.x;
    y = v17->outputROI.origin.y;
    width = v17->outputROI.size.width;
    height = v17->outputROI.size.height;
    v25 = var0 - value;
    if (var0 == value)
      break;
    if (v25 < 0)
      v25 = value - var0;
    if (v11 > v25)
    {
      v8 = inputCamera;
      v7 = outputCamera;
      v15 = x;
      v14 = y;
      v13 = width;
      v10 = height;
      v11 = v25;
    }
    v12 = 0;
    v6 = 1;
    if ((v16 & 1) == 0)
      goto LABEL_10;
  }
  v8 = inputCamera;
  v7 = outputCamera;
  v15 = x;
  v14 = y;
  v13 = width;
  v10 = height;
LABEL_10:
  if (v8)
    v26 = v7 == 0;
  else
    v26 = 1;
  if (v26)
    return 0;
  v27 = -[VirtualCameraWarpingStates initWithInputCamera:outputCamera:outputROI:]([VirtualCameraWarpingStates alloc], v8, v7, v15, v14, v13, v10);
  os_unfair_lock_unlock(p_stillCaptureQueueLock);
  return v27;
}

- (void)_supportedOutputPixelFormats
{
  void *v2;
  int v3;
  char IsFullRange;
  _QWORD v6[4];
  char v7;

  if (!a1)
    return 0;
  v2 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithArray:", FigCapturePixelFormatsByAddingCompressedVariants(&unk_1E4A00428, *(_DWORD *)(a1 + 444)));
  v3 = objc_msgSend((id)objc_msgSend((id)objc_msgSend((id)objc_msgSend(*(id *)(a1 + 96), "allValues"), "objectAtIndexedSubscript:", 0), "videoFormat"), "pixelFormat");
  if (v3)
  {
    IsFullRange = FigCapturePixelFormatIsFullRange(v3);
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __54__BWCinematicFramingNode__supportedOutputPixelFormats__block_invoke;
    v6[3] = &__block_descriptor_33_e35_B24__0__NSNumber_8__NSDictionary_16l;
    v7 = IsFullRange;
    objc_msgSend(v2, "filterUsingPredicate:", objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithBlock:", v6));
  }
  return v2;
}

BOOL __54__BWCinematicFramingNode__supportedOutputPixelFormats__block_invoke(uint64_t a1, void *a2)
{
  return *(unsigned __int8 *)(a1 + 32) == FigCapturePixelFormatIsFullRange(objc_msgSend(a2, "intValue"));
}

- (NSDictionary)videoCaptureInputsByPortType
{
  return &self->_videoCaptureInputsByPortType->super;
}

- (BWNodeOutput)videoCaptureOutput
{
  return self->_videoCaptureOutput;
}

- (NSDictionary)detectionMetadataInputsByPortType
{
  return &self->_detectionMetadataInputsByPortType->super;
}

- (BWNodeOutput)detectionMetadataOutput
{
  return self->_detectionMetadataOutput;
}

- (NSString)clientApplicationID
{
  return self->_clientApplicationID;
}

- (void)setClientApplicationID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 424);
}

- (unsigned)cinematicFramingControlMode
{
  return self->_cinematicFramingControlMode;
}

- (void)setCinematicFramingControlMode:(unsigned int)a3
{
  self->_cinematicFramingControlMode = a3;
}

- (CGRect)regionOfInterestForCameraControls
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_regionOfInterestForCameraControls.origin.x;
  y = self->_regionOfInterestForCameraControls.origin.y;
  width = self->_regionOfInterestForCameraControls.size.width;
  height = self->_regionOfInterestForCameraControls.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

@end
