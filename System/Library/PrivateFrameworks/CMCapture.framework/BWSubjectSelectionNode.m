@implementation BWSubjectSelectionNode

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    FigNote_AllowInternalDefaultLogs();
    fig_note_initialize_category_with_default_work_cf();
    fig_note_initialize_category_with_default_work_cf();
  }
}

- (BWSubjectSelectionNode)initWithOutputDimensions:(id)a3 cameraInfoByPortType:(id)a4 horizontalSensorBinningFactor:(int)a5 verticalSensorBinningFactor:(int)a6 deviceOrientationCorrectionEnabled:(BOOL)a7 portTypes:(id)a8 cameraHasDistortionCoefficients:(BOOL)a9 cameraHasCalibrationValidMaxRadius:(BOOL)a10 centerStageFramingMode:(int)a11 gazeSelectionEnabled:(BOOL)a12
{
  BWSubjectSelectionNode *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t i;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  objc_super v29;
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v29.receiver = self;
  v29.super_class = (Class)BWSubjectSelectionNode;
  v18 = -[BWNode init](&v29, sel_init);
  if (v18)
  {
    v18->_videoCaptureInputsByPortType = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    v18->_videoCaptureOutputsByPortType = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    v18->_portTypes = (NSArray *)a8;
    v18->_outputDimensions = ($470D365275581EF16070F5A11344F73E)a3;
    v18->_cameraInfoByPortType = (NSDictionary *)a4;
    if ((a5 - 3) < 0xFFFFFFFE)
      return 0;
    v18->_horizontalSensorBinningFactor = a5;
    if ((a6 - 3) < 0xFFFFFFFE)
    {
      return 0;
    }
    else
    {
      v18->_verticalSensorBinningFactor = a6;
      v18->_deviceOrientationCorrectionEnabled = a7;
      v18->_deviceOrientationMonitor = objc_alloc_init(BWDeviceOrientationMonitor);
      v27 = 0u;
      v28 = 0u;
      v25 = 0u;
      v26 = 0u;
      v19 = objc_msgSend(a8, "countByEnumeratingWithState:objects:count:", &v25, v30, 16);
      if (v19)
      {
        v20 = v19;
        v21 = 0;
        v22 = *(_QWORD *)v26;
        do
        {
          for (i = 0; i != v20; ++i)
          {
            if (*(_QWORD *)v26 != v22)
              objc_enumerationMutation(a8);
            -[BWSubjectSelectionNode _addInputAndOutputWithOutputDrivingInputIndex:mapToPortType:]((id *)&v18->super.super.isa, v21 + i, *(_QWORD *)(*((_QWORD *)&v25 + 1) + 8 * i));
          }
          v20 = objc_msgSend(a8, "countByEnumeratingWithState:objects:count:", &v25, v30, 16);
          v21 = (v21 + i);
        }
        while (v20);
      }
      v18->_minLuxLevelNeeded = 5;
      v18->_endOfDataInputsCount = 0;
      v18->_centerStageFramingMode = a11;
      v18->_cameraHasDistortionCoefficients = a9;
      v18->_cameraHasCalibrationValidMaxRadius = a10;
      v18->_gazeSelectionEnabled = a12;
    }
  }
  return v18;
}

- (void)_addInputAndOutputWithOutputDrivingInputIndex:(uint64_t)a3 mapToPortType:
{
  BWNodeInput *v6;
  BWNodeOutput *v7;

  if (a1)
  {
    v6 = -[BWNodeInput initWithMediaType:node:]([BWNodeInput alloc], "initWithMediaType:node:", 1986618469, a1);
    -[BWNodeInput setFormatRequirements:](v6, "setFormatRequirements:", objc_alloc_init(BWVideoFormatRequirements));
    -[BWNodeInput setPassthroughMode:](v6, "setPassthroughMode:", 1);
    objc_msgSend(a1, "addInput:", v6);
    objc_msgSend(a1[12], "setObject:forKeyedSubscript:", v6, a3);

    v7 = -[BWNodeOutput initWithMediaType:node:]([BWNodeOutput alloc], "initWithMediaType:node:", 1986618469, a1);
    -[BWNodeOutput setFormatRequirements:](v7, "setFormatRequirements:", objc_alloc_init(BWVideoFormatRequirements));
    -[BWNodeOutput setPassthroughMode:](v7, "setPassthroughMode:", 1);
    -[BWNodeOutput setIndexOfInputWhichDrivesThisOutput:](v7, "setIndexOfInputWhichDrivesThisOutput:", a2);
    objc_msgSend(a1, "addOutput:", v7);
    objc_msgSend(a1[13], "setObject:forKeyedSubscript:", v7, a3);

  }
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)BWSubjectSelectionNode;
  -[BWNode dealloc](&v3, sel_dealloc);
}

- (id)nodeType
{
  return CFSTR("Effect");
}

- (id)nodeSubType
{
  return CFSTR("SubjectSelection");
}

- (void)prepareForCurrentConfigurationToBecomeLive
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)BWSubjectSelectionNode;
  -[BWNode prepareForCurrentConfigurationToBecomeLive](&v3, sel_prepareForCurrentConfigurationToBecomeLive);
  -[BWSubjectSelectionNode _initSubjectSelectionSession]((uint64_t)self);
  -[BWDeviceOrientationMonitor start](self->_deviceOrientationMonitor, "start");
}

- (uint64_t)_initSubjectSelectionSession
{
  uint64_t v1;
  void *v2;

  if (result)
  {
    v1 = result;

    v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D10648]), "initWithCurrentProcessIsCameraCaptureDaemon:", FigCaptureCurrentProcessIsCameracaptured() != 0);
    *(_QWORD *)(v1 + 144) = v2;
    objc_msgSend(v2, "setSingleSubjectSelection:", *(_DWORD *)(v1 + 184) != 0);
    return objc_msgSend(*(id *)(v1 + 144), "setEnableGazeSelection:", *(unsigned __int8 *)(v1 + 188));
  }
  return result;
}

- (void)didSelectFormat:(id)a3 forInput:(id)a4
{
  NSArray *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v5 = -[BWNode outputs](self, "outputs", a3, a4, 0);
  v6 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v11;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v11 != v8)
          objc_enumerationMutation(v5);
        objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * v9++), "setFormat:", a3);
      }
      while (v7 != v9);
      v7 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v7);
  }
}

- (void)configurationWithID:(int64_t)a3 updatedFormat:(id)a4 didBecomeLiveForInput:(id)a5
{
  objc_msgSend((id)-[NSMutableDictionary objectForKeyedSubscript:](self->_videoCaptureOutputsByPortType, "objectForKeyedSubscript:", BWUtilitiesGetPortTypeForInputFromInputByPortTypes((uint64_t)a5, self->_videoCaptureInputsByPortType)), "makeConfiguredFormatLive");
}

- (void)didReachEndOfDataForInput:(id)a3
{
  os_unfair_lock_s *p_bufferServicingLock;
  int *p_endOfDataInputsCount;
  unsigned int v7;
  uint64_t endOfDataInputsCount;

  p_bufferServicingLock = &self->_bufferServicingLock;
  os_unfair_lock_lock(&self->_bufferServicingLock);
  if (objc_msgSend((id)-[NSMutableDictionary allValues](self->_videoCaptureInputsByPortType, "allValues"), "containsObject:", a3))
  {
    p_endOfDataInputsCount = &self->_endOfDataInputsCount;
    do
      v7 = __ldxr((unsigned int *)p_endOfDataInputsCount);
    while (__stxr(v7 + 1, (unsigned int *)p_endOfDataInputsCount));
  }
  os_unfair_lock_unlock(p_bufferServicingLock);
  objc_msgSend((id)-[NSMutableDictionary objectForKeyedSubscript:](self->_videoCaptureOutputsByPortType, "objectForKeyedSubscript:", BWUtilitiesGetPortTypeForInputFromInputByPortTypes((uint64_t)a3, self->_videoCaptureInputsByPortType)), "markEndOfLiveOutput");
  endOfDataInputsCount = self->_endOfDataInputsCount;
  if (objc_msgSend((id)-[NSMutableDictionary allValues](self->_videoCaptureInputsByPortType, "allValues"), "count") == endOfDataInputsCount)
  {
    -[BWDeviceOrientationMonitor stop](self->_deviceOrientationMonitor, "stop");
    self->_endOfDataInputsCount = 0;
  }
}

- (void)renderSampleBuffer:(opaqueCMSampleBuffer *)a3 forInput:(id)a4
{
  uint64_t v4;
  os_unfair_lock_s *p_bufferServicingLock;
  void *v9;
  const __CFDictionary *v10;
  const __CFDictionary *Value;
  CFTypeRef v12;
  void *v13;
  const __CFDictionary *v14;
  const __CFDictionary *v15;
  __CVBuffer *ImageBuffer;
  size_t Width;
  size_t Height;
  NSDictionary *cameraInfoByPortType;
  int horizontalSensorBinningFactor;
  int verticalSensorBinningFactor;
  char cameraHasDistortionCoefficients;
  char cameraHasCalibrationValidMaxRadius;
  id v24;
  id v25;
  uint64_t v26;
  float v27;
  int v28;
  BOOL v29;
  uint64_t v30;
  id v31;
  BOOL v32;
  BOOL v33;
  id v34;
  double v35;
  double v36;
  double v37;
  id v38;
  id v39;
  SubjectSelectionSession *subjectSelectionSession;
  int v41;
  uint64_t v42;
  uint64_t v43;
  int v44;
  float32x2_t v45;
  int v46;
  CMTime v47;
  float64x2_t v48;
  CMTimeEpoch epoch;
  uint64_t v50;

  v50 = *MEMORY[0x1E0C80C00];
  p_bufferServicingLock = &self->_bufferServicingLock;
  os_unfair_lock_lock(&self->_bufferServicingLock);
  v9 = (void *)-[NSMutableDictionary objectForKeyedSubscript:](self->_videoCaptureOutputsByPortType, "objectForKeyedSubscript:", BWUtilitiesGetPortTypeForInputFromInputByPortTypes((uint64_t)a4, self->_videoCaptureInputsByPortType));
  v10 = (const __CFDictionary *)CMGetAttachment(a3, (CFStringRef)*MEMORY[0x1E0D05CB0], 0);
  Value = (const __CFDictionary *)CFDictionaryGetValue(v10, (const void *)*MEMORY[0x1E0D05D00]);
  memset(&v47, 0, sizeof(v47));
  CMTimeMakeFromDictionary(&v47, Value);
  v12 = CMGetAttachment(a3, CFSTR("OriginalCameraIntrinsicMatrix"), 0);
  if (!v12)
  {
    v43 = v4;
    LODWORD(v42) = 0;
LABEL_24:
    FigDebugAssert3();
    goto LABEL_21;
  }
  v13 = (void *)v12;
  v14 = (const __CFDictionary *)CMGetAttachment(a3, CFSTR("OriginalCameraIntrinsicMatrixReferenceDimensions"), 0);
  if (!v14)
  {
    v43 = v4;
    LODWORD(v42) = 0;
    goto LABEL_24;
  }
  v15 = v14;
  ImageBuffer = CMSampleBufferGetImageBuffer(a3);
  Width = CVPixelBufferGetWidth(ImageBuffer);
  Height = CVPixelBufferGetHeight(ImageBuffer);
  cameraInfoByPortType = self->_cameraInfoByPortType;
  horizontalSensorBinningFactor = self->_horizontalSensorBinningFactor;
  verticalSensorBinningFactor = self->_verticalSensorBinningFactor;
  cameraHasDistortionCoefficients = self->_cameraHasDistortionCoefficients;
  cameraHasCalibrationValidMaxRadius = self->_cameraHasCalibrationValidMaxRadius;
  v48 = *(float64x2_t *)&v47.value;
  epoch = v47.epoch;
  v24 = (id)FigCaptureCreateCalibrationDataDictionaryFromSampleBufferMetadataIncludeMaxRadius(v10, (__int128 *)&v48, cameraInfoByPortType, horizontalSensorBinningFactor, verticalSensorBinningFactor, v13, v15, 0, 0, cameraHasDistortionCoefficients, cameraHasCalibrationValidMaxRadius);
  if (!v24)
  {
    v43 = v4;
    LODWORD(v42) = 0;
LABEL_27:
    FigDebugAssert3();
    goto LABEL_21;
  }
  v25 = v24;
  if (objc_msgSend((id)-[__CFDictionary objectForKeyedSubscript:](v10, "objectForKeyedSubscript:", *MEMORY[0x1E0D06C40]), "intValue") >= self->_minLuxLevelNeeded)v26 = -[__CFDictionary objectForKeyedSubscript:](v10, "objectForKeyedSubscript:", *MEMORY[0x1E0D069A0]);
  else
    v26 = 0;
  v46 = 0;
  v45 = 0;
  v27 = (float)Width / (float)Height;
  v28 = 0;
  if ((objc_msgSend((id)-[__CFDictionary objectForKeyedSubscript:](v10, "objectForKeyedSubscript:", *MEMORY[0x1E0D06B78]), "unsignedIntValue") & 1) == 0)
  {
    bzero(&v48, 0x14A0uLL);
    v44 = 0;
    if (FigMotionGetMotionDataFromISP(v10, &v48, 0, 110, &v44, &v45, 0, 0, 0))
      v29 = 1;
    else
      v29 = v44 <= 0;
    v28 = !v29;
  }
  v30 = FigCaptureSensorIDFromSampleBufferMetadata(v10, self->_cameraInfoByPortType);
  v31 = objc_alloc(MEMORY[0x1E0D10630]);
  v32 = self->_cameraHasDistortionCoefficients;
  v33 = self->_cameraHasCalibrationValidMaxRadius;
  v48 = *(float64x2_t *)&v47.value;
  epoch = v47.epoch;
  BYTE1(v42) = v33;
  LOBYTE(v42) = v32;
  v34 = (id)objc_msgSend(v31, "initWithDetectedObjectsInfo:calibrationData:timestamp:aspectRatio:sensorID:filteredFaceIDs:filteredBodyIDs:calibrationDistortionCoefficientsSupported:calibrationValidMaxRadiusSupported:", v26, v25, &v48, v30, 0, 0, COERCE_DOUBLE(__PAIR64__(HIDWORD(v47.value), LODWORD(v27))), v42);
  if (v28)
  {
    LODWORD(v36) = v45.i32[1];
    LODWORD(v35) = v45.i32[0];
    LODWORD(v37) = v46;
    objc_msgSend(v34, "setGravityX:y:z:", v35, v36, v37);
  }
  v38 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  v39 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  subjectSelectionSession = self->_subjectSelectionSession;
  v48 = *(float64x2_t *)&v47.value;
  epoch = v47.epoch;
  v41 = -[SubjectSelectionSession processPixelBuffer:timestamp:detectedObjects:usedFaceIDs:usedBodyIDs:](subjectSelectionSession, "processPixelBuffer:timestamp:detectedObjects:usedFaceIDs:usedBodyIDs:", ImageBuffer, &v48, v26, v38, v39);
  if (v41)
  {
    v43 = v4;
    LODWORD(v42) = v41;
    goto LABEL_27;
  }
  if (objc_msgSend(v38, "count"))
    CMSetAttachment(a3, (CFStringRef)*MEMORY[0x1E0D05C08], v38, 1u);
  if (objc_msgSend(v39, "count"))
    CMSetAttachment(a3, (CFStringRef)*MEMORY[0x1E0D05C00], v39, 1u);
LABEL_21:
  objc_msgSend(v9, "emitSampleBuffer:", a3, v42, v43);
  os_unfair_lock_unlock(p_bufferServicingLock);
}

- (NSDictionary)videoCaptureInputsByPortType
{
  return &self->_videoCaptureInputsByPortType->super;
}

- (NSDictionary)videoCaptureOutputsByPortType
{
  return &self->_videoCaptureOutputsByPortType->super;
}

- (void)didChangeCenterStageFramingMode:(int)a3
{
  os_unfair_lock_s *p_bufferServicingLock;

  self->_centerStageFramingMode = a3;
  p_bufferServicingLock = &self->_bufferServicingLock;
  os_unfair_lock_lock(&self->_bufferServicingLock);
  -[SubjectSelectionSession setSingleSubjectSelection:](self->_subjectSelectionSession, "setSingleSubjectSelection:", self->_centerStageFramingMode != 0);
  os_unfair_lock_unlock(p_bufferServicingLock);
}

@end
