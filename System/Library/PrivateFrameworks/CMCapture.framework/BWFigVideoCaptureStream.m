@implementation BWFigVideoCaptureStream

- (NSDictionary)sensorIDDictionary
{
  return self->_sensorIDDictionary;
}

- (void)setDelegate:(id)a3
{
  self->_delegate = (BWFigVideoCaptureStreamDelegate *)a3;
}

- (BOOL)isCMIOZoomFactorSupported
{
  return -[NSDictionary objectForKeyedSubscript:](-[BWFigCaptureStream supportedProperties](self->_stream, "supportedProperties"), "objectForKeyedSubscript:", CFSTR("CMIOVideoZoomFactor")) != 0;
}

- (NSArray)supportedFormats
{
  return self->_supportedFormats;
}

- (float)pixelSize
{
  return self->_pixelSize;
}

- (BOOL)usePinholeCameraFocalLengthInIntrinsicMatrixCalculation
{
  return self->_usePinholeCameraFocalLengthInIntrinsicMatrixCalculation;
}

- (int)deviceType
{
  return self->_deviceType;
}

- (void)setStillImageCaptureDelegate:(id)a3
{
  self->_streamNotificationDispatchQueue = (OS_dispatch_queue *)a3;
}

- (BOOL)hasSphere
{
  return self->_sphereModeSelector != 0;
}

- (int)activeQuadraBinningFactor
{
  unsigned int active;
  id v4;

  active = -[BWFigVideoCaptureStream _activeFormatIndexWithNondisruptiveSwitching]((os_unfair_lock_s *)self);
  if ((active & 0x80000000) != 0)
    return -1;
  v4 = -[NSArray objectAtIndexedSubscript:](self->_supportedFormats, "objectAtIndexedSubscript:", active);
  return objc_msgSend((id)objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x1E0D07E98]), "intValue");
}

- (int)activeNondisruptiveSwitchingCommandID
{
  BWFigVideoCaptureStream *v2;
  os_unfair_lock_s *p_activeNondisruptiveSwitchingFormatIndexLock;

  v2 = self;
  p_activeNondisruptiveSwitchingFormatIndexLock = &self->_activeNondisruptiveSwitchingFormatIndexLock;
  os_unfair_lock_lock(&self->_activeNondisruptiveSwitchingFormatIndexLock);
  LODWORD(v2) = v2->_activeNondisruptiveSwitchingCommandID;
  os_unfair_lock_unlock(p_activeNondisruptiveSwitchingFormatIndexLock);
  return (int)v2;
}

- (void)setCompletedNondisruptiveSwitchingCommandID:(int)a3
{
  self->_completedNondisruptiveSwitchingCommandID = a3;
}

- (int)completedNondisruptiveSwitchingCommandID
{
  return self->_completedNondisruptiveSwitchingCommandID;
}

- (NSString)portType
{
  return self->_portType;
}

- (BOOL)streamingRequiredWhenConfiguredAsSlave
{
  return BYTE4(self->_synchronizedStreamsGroup);
}

- (void)setMasterToSlaveFrameRateRatio:(int)a3
{
  if (LODWORD(self->_synchronizedStreamsGroup) != a3)
  {
    LODWORD(self->_synchronizedStreamsGroup) = a3;
    -[BWFigVideoCaptureStream _updateMasterSlavePropertiesOnStream]((uint64_t)self);
    if (-[BWFigVideoCaptureStream suspendingSupported](self, "suspendingSupported"))
    {
      if (-[NSString isEqualToString:](self->_portType, "isEqualToString:", *MEMORY[0x1E0D05A40]))
        -[BWFigVideoCaptureStream _updateSuspendStateForInfraredDepthStream]((uint64_t)self);
    }
  }
}

- (BOOL)firmwareTimeMachineEnabledWhenConfiguredAsSlave
{
  return BYTE5(self->_synchronizedStreamsGroup);
}

- (int)masterToSlaveFrameRateRatio
{
  return (int)self->_synchronizedStreamsGroup;
}

- (float)streamingFrameRateForZoomPIPOverlay
{
  return self->_averageFrameRate;
}

- (uint64_t)_setHighlightRecoveryEnabled:(uint64_t)result
{
  char v2;
  uint64_t v3;
  uint64_t v4;

  if (result)
  {
    v2 = a2;
    v3 = result;
    if (*(_BYTE *)(result + 795))
      v4 = 0;
    else
      v4 = a2;
    result = objc_msgSend(*(id *)(result + 8), "setPropertyIfSupported:value:", *MEMORY[0x1E0D07570], objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v4));
    if (!(_DWORD)result)
      *(_BYTE *)(v3 + 796) = v2;
  }
  return result;
}

- (uint64_t)_updateMasterSlavePropertiesOnStream
{
  uint64_t v1;
  uint64_t v2;

  if (result)
  {
    v1 = result;
    if (*(_BYTE *)(result + 336))
    {
      -[BWFigVideoCaptureStream _setLowPowerSphereModeEnabled:](result, *(_BYTE *)(result + 756) == 0);
      v2 = 798;
    }
    else
    {
      if (objc_msgSend(*(id *)(result + 440), "lowPowerSphereModeEnabled"))
      {
        objc_msgSend(*(id *)(v1 + 440), "setLowPowerSphereModeEnabled:", 0);
        -[BWFigVideoCaptureStream _updateSphereMode](v1);
      }
      v2 = 797;
    }
    return -[BWFigVideoCaptureStream _setHighlightRecoveryEnabled:](v1, *(unsigned __int8 *)(v1 + v2));
  }
  return result;
}

- (BOOL)suspendingSupported
{
  return !BYTE4(self->_lastFaceDetectionEnabled) && LOBYTE(self->_stillImageBufferTimeMachineHandler) == 0;
}

- (void)setPreviewShift:(CGPoint)a3
{
  if (a3.x != *(double *)&self->_nondisruptiveSwitchingFormatSelector
    || a3.y != *(double *)&self->_mainFormatSIFRBinningFactor)
  {
    *(CGPoint *)&self->_nondisruptiveSwitchingFormatSelector = a3;
    -[BWFigVideoCaptureStreamDelegate captureStream:didUpdatePreviewShift:](self->_delegate, "captureStream:didUpdatePreviewShift:", self);
  }
}

- (void)_setLowPowerSphereModeEnabled:(uint64_t)a1
{
  if (a1)
  {
    if (objc_msgSend(*(id *)(a1 + 440), "lowPowerSphereModeEnabled") != (_DWORD)a2)
    {
      objc_msgSend(*(id *)(a1 + 440), "setLowPowerSphereModeEnabled:", a2);
      -[BWFigVideoCaptureStream _updateSphereMode](a1);
    }
  }
}

- (float)minimumFrameRate
{
  return self->_minimumFrameRate;
}

- (void)setSphereVideoEnabled:(BOOL)a3
{
  _BOOL8 v3;

  v3 = a3;
  -[BWSphereModeSelector setSphereVideoRecenteringEnabled:](self->_sphereModeSelector, "setSphereVideoRecenteringEnabled:", 0);
  -[BWSphereModeSelector setSphereVideoEnabled:](self->_sphereModeSelector, "setSphereVideoEnabled:", v3);
  -[BWFigVideoCaptureStream _updateSphereMode]((uint64_t)self);
}

- (__CFString)currentNonLowPowerSphereMode
{
  return -[BWSphereModeSelector currentNonLowPowerSphereMode](self->_sphereModeSelector, "currentNonLowPowerSphereMode");
}

- (NSArray)nondisruptiveSwitchingZoomFactors
{
  return (NSArray *)self->_zoomFactorToNondisruptiveSwitchingFormatIndexSIFRBinned;
}

- (float)baseZoomFactorAfterGDC
{
  float result;

  result = self->_baseZoomFactorAfterGDC;
  if (result == 0.0)
    return self->_baseZoomFactor;
  return result;
}

- (NSDictionary)zoomFactorToNondisruptiveSwitchingFormatIndexSIFRBinned
{
  return *(NSDictionary **)&self->_centerStageFramingMode;
}

- (int)setActiveNondisruptiveSwitchingFormatIndex:(int)a3
{
  uint64_t v3;
  uint64_t maximumSupportedFrameRate;
  uint64_t minimumFrameRate;
  uint64_t maximumFrameRate;

  v3 = *(_QWORD *)&a3;
  if (-[BWFigVideoCaptureStream isNondisruptiveFastSwitchingSupported](self, "isNondisruptiveFastSwitchingSupported"))
  {
    maximumSupportedFrameRate = (int)self->_maximumSupportedFrameRate;
    minimumFrameRate = (int)self->_minimumFrameRate;
    maximumFrameRate = (int)self->_maximumFrameRate;
  }
  else
  {
    maximumSupportedFrameRate = 0;
    minimumFrameRate = 0;
    maximumFrameRate = 0;
  }
  return -[BWFigVideoCaptureStream setActiveNondisruptiveSwitchingFormatIndex:maximumAllowedFrameRate:minimumFrameRate:maximumFrameRate:](self, "setActiveNondisruptiveSwitchingFormatIndex:maximumAllowedFrameRate:minimumFrameRate:maximumFrameRate:", v3, maximumSupportedFrameRate, minimumFrameRate, maximumFrameRate);
}

- (NSDictionary)zoomFactorToNondisruptiveSwitchingFormatIndexSIFRNonBinned
{
  return *(NSDictionary **)&self->_backgroundReplacementEnabled;
}

- (void)setBaseZoomFactorAfterGDC:(float)a3
{
  if (self->_baseZoomFactorAfterGDC != a3)
    self->_baseZoomFactorAfterGDC = a3;
}

- (BOOL)synchronizedStreamsEnabled
{
  return BYTE5(self->_lastFaceDetectionEnabled) & 1;
}

- (void)setMotionDataDeliveryEnabled:(BOOL)a3
{
  _BOOL4 v3;

  if (self->_motionDataDeliveryEnabled != a3)
  {
    v3 = a3;
    if (!-[BWFigCaptureStream setProperty:value:](self->_stream, "setProperty:value:", *MEMORY[0x1E0D07590], objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:")))self->_motionDataDeliveryEnabled = v3;
  }
}

- (void)setVideoHDRImageStatisticsEnabled:(BOOL)a3
{
  _BOOL8 v3;
  uint64_t v5;

  v3 = a3;
  v5 = *MEMORY[0x1E0D07558];
  if (-[NSDictionary objectForKeyedSubscript:](self->_supportedProperties, "objectForKeyedSubscript:", *MEMORY[0x1E0D07558]))
  {
    if (!-[BWFigCaptureStream setProperty:value:](self->_stream, "setProperty:value:", v5, objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v3)))self->_keypointDetectionConfigured = v3;
  }
}

- (void)setVideoHDRFusionEnabled:(BOOL)a3
{
  _BOOL8 v3;
  uint64_t v5;

  v3 = a3;
  v5 = *MEMORY[0x1E0D07550];
  if (-[NSDictionary objectForKeyedSubscript:](self->_supportedProperties, "objectForKeyedSubscript:", *MEMORY[0x1E0D07550]))
  {
    if (!-[BWFigCaptureStream setProperty:value:](self->_stream, "setProperty:value:", v5, objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v3)))HIBYTE(self->_keypointDetectionConfiguration) = v3;
  }
}

- (void)setVideoCaptureDimensions:(id)a3
{
  *($2825F4736939C4A6D3AD43837233062D *)&self->_timeLapseEnabled = a3;
}

- (void)setStillImageKeypointDetectionEnabled:(BOOL)a3
{
  if (a3)
    -[BWFigVideoCaptureStream _configureKeypointDetection]((uint64_t)self);
  BYTE2(self->_keypointDetectionConfiguration) = a3;
}

- (void)setPixelFormatIsTenBit:(BOOL)a3
{
  self->_keypointDetectionEnabled = a3;
}

- (void)setMultiBandNoiseReductionMode:(int)a3
{
  uint64_t v5;
  id v6;
  void *v7;
  uint64_t *v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  _QWORD v15[2];
  _QWORD v16[2];
  uint64_t v17;
  _QWORD v18[2];

  v18[1] = *MEMORY[0x1E0C80C00];
  v5 = *MEMORY[0x1E0D076D8];
  if (-[NSDictionary objectForKeyedSubscript:](self->_supportedProperties, "objectForKeyedSubscript:", *MEMORY[0x1E0D076D8])&& !-[NSString isEqualToString:](self->_portType, "isEqualToString:", *MEMORY[0x1E0D05A40]))
  {
    v6 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    if (a3 == 2)
    {
      v10 = *MEMORY[0x1E0D06FA0];
      v15[0] = *MEMORY[0x1E0D06F90];
      v15[1] = v10;
      v16[0] = MEMORY[0x1E0C9AAB0];
      v16[1] = MEMORY[0x1E0C9AAB0];
      v7 = (void *)MEMORY[0x1E0C99D80];
      v8 = v16;
      v9 = v15;
      v11 = 2;
    }
    else
    {
      if (a3 == 1)
      {
        v17 = *MEMORY[0x1E0D06F90];
        v18[0] = MEMORY[0x1E0C9AAB0];
        v7 = (void *)MEMORY[0x1E0C99D80];
        v8 = v18;
        v9 = &v17;
      }
      else
      {
        v13 = *MEMORY[0x1E0D06F90];
        v14 = MEMORY[0x1E0C9AAA0];
        v7 = (void *)MEMORY[0x1E0C99D80];
        v8 = &v14;
        v9 = &v13;
      }
      v11 = 1;
    }
    v12 = objc_msgSend(v7, "dictionaryWithObjects:forKeys:count:", v8, v9, v11);
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v12, *MEMORY[0x1E0D06FB0]);
    if (!-[BWFigCaptureStream setProperty:value:](self->_stream, "setProperty:value:", v5, v6))
      LODWORD(self->_stillImageNoiseAndSharpeningParameters) = a3;
  }
}

- (void)setMinimumSupportedFrameRate:(float)a3
{
  self->_minimumSupportedFrameRate = a3;
}

- (void)setMinimumFrameRate:(float)a3
{
  int v5;
  CMTime v6;

  v5 = -[BWFigCaptureStream setProperty:value:](self->_stream, "setProperty:value:", CFSTR("MinimumFrameRate"), objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", a3));
  if (v5)
  {
    if (v5 == -12780)
      objc_exception_throw((id)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Can't set min frame rate: because the frame rate is not in range (%d). Use -supportedFormats."), 4294954516), 0));
  }
  else if (self->_minimumFrameRate != a3)
  {
    self->_minimumFrameRate = a3;
    if (self->_started)
    {
      -[BWFigVideoCaptureStream maxExposureDuration](self, "maxExposureDuration");
      memset(&v6, 0, sizeof(v6));
      -[BWFigVideoCaptureStream _setMaxExposureDuration:]((id *)&self->super.isa, &v6, 0.0);
    }
  }
}

- (void)setMaximumSupportedFrameRate:(float)a3
{
  double v5;
  float v6;

  if (!-[BWFigCaptureStream streaming](self->_stream, "streaming"))
  {
    *(float *)&v5 = a3;
    -[BWFigCaptureStream setPropertyIfSupported:value:](self->_stream, "setPropertyIfSupported:value:", CFSTR("MaximumAllowedFrameRate"), objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v5));
LABEL_6:
    self->_maximumSupportedFrameRate = a3;
    return;
  }
  if (self->_maximumSupportedFrameRate == a3)
    goto LABEL_6;
  objc_msgSend(-[BWFigCaptureStream getPropertyIfSupported:error:](self->_stream, "getPropertyIfSupported:error:", CFSTR("MaximumAllowedFrameRate"), 0), "floatValue");
  if (v6 == a3)
    goto LABEL_6;
}

- (void)setMaxExposureDurationFrameworkOverride:(id *)a3
{
  __int128 v3;

  v3 = *(_OWORD *)&a3->var0;
  *(int64_t *)((char *)&self->_maxExposureDurationFrameworkOverride.value + 4) = a3->var3;
  *(_OWORD *)&self->_maxExposureDurationClientOverride.flags = v3;
}

- (void)setMaxExposureDurationClientOverride:(id *)a3
{
  __int128 v3;

  v3 = *(_OWORD *)&a3->var0;
  *(int64_t *)((char *)&self->_maxExposureDurationClientOverride.value + 4) = a3->var3;
  *(_OWORD *)&self->_digitalFlashEnabled = v3;
}

- (void)setMainToSIFRFrameRateRatio:(int)a3
{
  if (!-[BWFigCaptureStream setPropertyIfSupported:value:](self->_stream, "setPropertyIfSupported:value:", *MEMORY[0x1E0D07658], objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:")))LODWORD(self->_stillImageCaptureDelegateDispatchGroup) = a3;
}

- (void)setLowLightVideoEnabled:(BOOL)a3
{
  *(&self->_maxExposureDurationHasBeenSet + 1) = a3;
}

- (void)setKeypointDetectionEnabled:(BOOL)a3
{
  _BOOL8 v3;

  v3 = a3;
  if (-[NSDictionary objectForKeyedSubscript:](self->_supportedProperties, "objectForKeyedSubscript:", *MEMORY[0x1E0D075A0]))
  {
    if (v3)
      -[BWFigVideoCaptureStream _configureKeypointDetection]((uint64_t)self);
    if (!-[BWFigCaptureStream setProperty:value:](self->_stream, "setProperty:value:", *MEMORY[0x1E0D075A8], objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v3)))BYTE1(self->_keypointDetectionConfiguration) = v3;
  }
}

- (void)setHighlightRecoveryEnabledWhenConfiguredAsSlave:(BOOL)a3
{
  BYTE6(self->_keypointDetectionConfiguration) = a3;
}

- (void)setHighlightRecoveryEnabledWhenConfiguredAsMasterOrSingleStream:(BOOL)a3
{
  BYTE5(self->_keypointDetectionConfiguration) = a3;
  -[BWFigVideoCaptureStream _setHighlightRecoveryEnabled:]((uint64_t)self, a3);
}

- (void)setFocusBlurMapEnabled:(BOOL)a3
{
  _BOOL8 v3;
  uint64_t v5;

  v3 = a3;
  v5 = *MEMORY[0x1E0D07508];
  if (-[NSDictionary objectForKeyedSubscript:](self->_supportedProperties, "objectForKeyedSubscript:", *MEMORY[0x1E0D07508]))
  {
    if (!-[BWFigCaptureStream setProperty:value:](self->_stream, "setProperty:value:", v5, objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v3)))HIBYTE(self->_multiBandNoiseReductionMode) = v3;
  }
}

- (void)setEyeDetectionRequired:(BOOL)a3
{
  int v3;
  NSNumber **p_lastFaceDetectionEnabled;

  v3 = a3;
  p_lastFaceDetectionEnabled = &self->_lastFaceDetectionEnabled;
  os_unfair_lock_lock((os_unfair_lock_t)&self->_lastFaceDetectionEnabled);
  if (BYTE1(self->_faceDetectionConfiguration) != v3)
  {
    BYTE1(self->_faceDetectionConfiguration) = v3;
    -[BWFigVideoCaptureStream _propagateFaceAndObjectDetectionSettings]((uint64_t)self);
  }
  os_unfair_lock_unlock((os_unfair_lock_t)p_lastFaceDetectionEnabled);
}

- (void)setColorSpaceIsAppleLog:(BOOL)a3
{
  self->_stillImageKeypointDetectionEnabled = a3;
}

- (void)setAeMaxGain:(float)a3
{
  *(float *)&self->_maxExposureDurationFrameworkOverride.epoch = a3;
}

- (NSArray)supportedOutputs
{
  return self->_supportedOutputs;
}

- (unsigned)sensorInterfaceRawPixelFormat
{
  return self->_sensorInterfaceRawPixelFormat;
}

- (int)sourceNodeWillEmitVideoSampleBuffer:(opaqueCMSampleBuffer *)a3 drivesCameraControls:(BOOL)a4 deliversStills:(BOOL)a5
{
  _BOOL4 v5;
  _BOOL8 v6;
  int v9;
  __CVBuffer *ImageBuffer;
  uint32_t flags;
  CMTimeEpoch epoch;
  CMTime v14;
  CMTimeValue value;
  CMTimeScale timescale;
  uint64_t v17;

  v5 = a5;
  v6 = a4;
  v17 = *MEMORY[0x1E0C80C00];
  value = *MEMORY[0x1E0CA2E18];
  timescale = *(_DWORD *)(MEMORY[0x1E0CA2E18] + 8);
  if (a4)
  {
    if (-[BWFigVideoCaptureStream sphereEnabled](self, "sphereEnabled"))
      -[BWFigVideoCaptureStream _updateMotionDataStatus:]((uint64_t)self, a3);
    -[BWFigVideoCaptureStream _updateAutoFocusPositionSensorModeForSampleBuffer:](self, a3);
  }
  -[BWFigVideoCaptureStreamDelegate captureStream:willEmitVideoSampleBuffer:drivesCameraControls:](self->_delegate, "captureStream:willEmitVideoSampleBuffer:drivesCameraControls:", self, a3, v6);
  if (HIDWORD(self->_stillImageNoiseAndSharpeningParameters))
    objc_msgSend((id)CMGetAttachment(a3, (CFStringRef)*MEMORY[0x1E0D05CB0], 0), "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], *MEMORY[0x1E0D06EF8]);
  fvcs_removeSampleBufferPixelBufferMetadata(a3);
  v9 = figVideoCaptureStream_blackenFrameIfNecessary((uint64_t)self, a3);
  if (v9)
  {
    FigDebugAssert3();
  }
  else
  {
    if (self->_keypointDetectionEnabled
      && self->_ambientViewingEnvironment
      && !self->_stillImageKeypointDetectionEnabled)
    {
      ImageBuffer = CMSampleBufferGetImageBuffer(a3);
      CVBufferSetAttachment(ImageBuffer, (CFStringRef)*MEMORY[0x1E0CA8CC8], self->_ambientViewingEnvironment, kCVAttachmentMode_ShouldPropagate);
    }
    if (self->_timeMachine && v5)
      -[BWFigVideoCaptureStream _serviceTimeMachineWithSampleBuffer:]((uint64_t)self, a3);
    ++HIDWORD(self->_lastValidPTS.value);
    CMSampleBufferGetPresentationTimeStamp(&v14, a3);
    value = v14.value;
    flags = v14.flags;
    timescale = v14.timescale;
    if ((v14.flags & 1) != 0)
    {
      epoch = v14.epoch;
      if ((self->_averageFrameRateCalculationLock._os_unfair_lock_opaque & 1) == 0)
      {
        HIDWORD(self->_previewShiftAtBaseZoom.y) = timescale;
        *(_QWORD *)((char *)&self->_previewShiftAtBaseZoom.x + 4) = value;
        self->_averageFrameRateCalculationLock._os_unfair_lock_opaque = flags;
        *(_QWORD *)(&self->_averageFrameRateCalculationLock + 1) = epoch;
      }
      self->_firstValidPTS.flags = timescale;
      *(int64_t *)((char *)&self->_firstValidPTS.value + 4) = value;
      LODWORD(self->_firstValidPTS.epoch) = flags;
      *(int64_t *)((char *)&self->_firstValidPTS.epoch + 4) = epoch;
    }
  }
  return v9;
}

- (_DWORD)_updateAutoFocusPositionSensorModeForSampleBuffer:(_DWORD *)result
{
  _DWORD *v2;

  if (result)
  {
    v2 = result;
    result = (_DWORD *)objc_msgSend((id)CMGetAttachment(target, (CFStringRef)*MEMORY[0x1E0D05CB0], 0), "objectForKeyedSubscript:", *MEMORY[0x1E0D068B0]);
    if (result)
    {
      result = (_DWORD *)objc_msgSend(result, "intValue");
      v2[212] = (_DWORD)result;
    }
  }
  return result;
}

- (BOOL)sphereEnabled
{
  BWFigVideoCaptureStream *v2;
  os_unfair_lock_s *p_sphereLock;

  v2 = self;
  p_sphereLock = &self->_sphereLock;
  os_unfair_lock_lock(&self->_sphereLock);
  LOBYTE(v2) = v2->_sphereEnabled;
  os_unfair_lock_unlock(p_sphereLock);
  return (char)v2;
}

- (float)lensFNumber
{
  return self->_lensFNumber;
}

- (float)focalLength
{
  return self->_focalLength;
}

- (void)_updateMotionDataStatus:(uint64_t)a1
{
  void *v3;
  void *v4;
  unsigned int v5;
  int v6;

  if (a1)
  {
    v3 = (void *)CMGetAttachment(target, (CFStringRef)*MEMORY[0x1E0D05CB0], 0);
    if (v3 && (v4 = (void *)objc_msgSend(v3, "objectForKeyedSubscript:", *MEMORY[0x1E0D06B78])) != 0)
    {
      v5 = objc_msgSend(v4, "unsignedIntValue");
      if ((v5 & 9) != 0)
        LOBYTE(v6) = 1;
      else
        v6 = (v5 >> 1) & 1;
    }
    else
    {
      LOBYTE(v6) = 0;
    }
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 432));
    *(_BYTE *)(a1 + 437) = v6;
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 432));
  }
}

- (BOOL)hasFocus
{
  return self->_hasFocus;
}

- (BWFigVideoCaptureStream)initWithCaptureStream:(id)a3 parentDevice:(id)a4 attributes:(id)a5 sensorIDDictionary:(id)a6 synchronizedStreamsGroup:(id)a7 applicationID:(id)a8 clientAuditToken:(id *)a9 tccIdentity:(id)a10 mediaEnvironment:(id)a11 error:(int *)a12
{
  char *v18;
  void *v19;
  int v20;
  void *v21;
  int v22;
  void *v23;
  __int128 v24;
  __int128 v25;
  unint64_t v26;
  BOOL v27;
  int v28;
  uint64_t v29;
  float v30;
  void *v31;
  BWSphereModeSelector *v32;
  uint64_t v33;
  uint64_t v34;
  void *v35;
  int v36;
  id v37;
  int v38;
  void *v39;
  int v40;
  void *v41;
  float v42;
  float v43;
  float v44;
  float v45;
  void *v46;
  void *v47;
  int v48;
  int v49;
  int v50;
  uint64_t v51;
  void *v52;
  void *v53;
  uint64_t v54;
  uint64_t v55;
  void *v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t i;
  int v64;
  uint64_t v65;
  uint64_t v66;
  void *v67;
  uint64_t v68;
  uint64_t v69;
  __int128 v70;
  uint64_t v71;
  int v72;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  _OWORD v78[2];
  objc_super v79;
  int GravityFactor;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  _BYTE v85[128];
  uint64_t v86;

  v86 = *MEMORY[0x1E0C80C00];
  GravityFactor = 0;
  v79.receiver = self;
  v79.super_class = (Class)BWFigVideoCaptureStream;
  v18 = -[BWFigVideoCaptureStream init](&v79, sel_init);
  if (!v18)
    goto LABEL_62;
  if (a3)
  {
    *((_QWORD *)v18 + 1) = a3;
    *((_QWORD *)v18 + 4) = (id)objc_msgSend(a3, "portType");
    *((_QWORD *)v18 + 2) = a4;
    *((_QWORD *)v18 + 11) = (id)objc_msgSend(*((id *)v18 + 1), "supportedProperties");
    if (GravityFactor)
      goto LABEL_78;
    *((_QWORD *)v18 + 12) = objc_msgSend(*((id *)v18 + 1), "copyProperty:error:", CFSTR("SupportedFormatsArray"), &GravityFactor);
    if (GravityFactor)
      goto LABEL_78;
    *((_QWORD *)v18 + 18) = objc_msgSend(*((id *)v18 + 1), "copyPropertyIfSupported:error:", *MEMORY[0x1E0D076B8], &GravityFactor);
    if (GravityFactor)
      goto LABEL_78;
    v19 = (void *)objc_msgSend(*((id *)v18 + 1), "getPropertyIfSupported:error:", *MEMORY[0x1E0D07500], &GravityFactor);
    if (GravityFactor)
      goto LABEL_78;
    objc_msgSend(v19, "floatValue");
    *((_DWORD *)v18 + 67) = v20;
    v21 = (void *)objc_msgSend(*((id *)v18 + 1), "getPropertyIfSupported:error:", *MEMORY[0x1E0D075E8], &GravityFactor);
    if (GravityFactor)
      goto LABEL_78;
    objc_msgSend(v21, "floatValue");
    *((_DWORD *)v18 + 68) = v22;
    v23 = (void *)objc_msgSend(*((id *)v18 + 1), "getPropertyIfSupported:error:", *MEMORY[0x1E0D07548], &GravityFactor);
    if (GravityFactor)
      goto LABEL_78;
    if (v23)
      *((_QWORD *)v18 + 43) = (id)fvcs_ambientViewingEnvironment(objc_msgSend(v23, "intValue"));
    v24 = *(_OWORD *)&a9->var0[4];
    v78[0] = *(_OWORD *)a9->var0;
    v78[1] = v24;
    *((_DWORD *)v18 + 90) = FigCaptureGetPIDFromAuditToken(v78);
    *((_QWORD *)v18 + 46) = objc_msgSend(a8, "copy");
    v25 = *(_OWORD *)&a9->var0[4];
    *(_OWORD *)(v18 + 376) = *(_OWORD *)a9->var0;
    *(_OWORD *)(v18 + 392) = v25;
    *((_DWORD *)v18 + 102) = 0;
    *((_QWORD *)v18 + 52) = a10;
    *((_QWORD *)v18 + 53) = a11;
    *((_QWORD *)v18 + 40) = (id)objc_msgSend(a5, "objectForKeyedSubscript:", CFSTR("NonLocalizedName"));
    *((_DWORD *)v18 + 83) = objc_msgSend((id)objc_msgSend(a5, "objectForKeyedSubscript:", CFSTR("DeviceType")), "intValue");
    *((_QWORD *)v18 + 141) = (id)objc_msgSend(a5, "objectForKeyedSubscript:", CFSTR("UniqueID"));
    *((_QWORD *)v18 + 14) = 0xFFFFFFFFLL;
    *((_DWORD *)v18 + 30) = -1;
    *(_QWORD *)(v18 + 132) = -1;
    v26 = objc_msgSend((id)objc_msgSend(a7, "activePortTypes"), "count");
    v18[741] = v26 > 1;
    if (v26 > 1)
    {
      v27 = objc_msgSend((id)objc_msgSend(a7, "syncGroup"), "synchronizationMaster") == (_QWORD)a3;
      v28 = v18[741];
      v18[740] = v27;
      if (v28)
        v29 = objc_msgSend(a7, "syncGroup");
      else
        v29 = 0;
    }
    else
    {
      v29 = 0;
      v18[740] = 0;
    }
    *((_QWORD *)v18 + 93) = v29;
    *((_DWORD *)v18 + 108) = 0;
    *((_DWORD *)v18 + 88) = 0;
    *((_DWORD *)v18 + 120) = 0;
    if (objc_msgSend((id)objc_msgSend(*((id *)v18 + 18), "objectForKeyedSubscript:", *MEMORY[0x1E0D05B58]), "intValue")&& objc_msgSend((id)objc_msgSend(*((id *)v18 + 18), "objectForKeyedSubscript:", *MEMORY[0x1E0D05B50]), "intValue"))
    {
      v18[160] = 1;
    }
    objc_msgSend((id)objc_msgSend((id)objc_msgSend(a7, "baseZoomFactorsByPortType"), "objectForKeyedSubscript:", *((_QWORD *)v18 + 4)), "floatValue");
    if (v30 == 0.0)
      v30 = 1.0;
    *((float *)v18 + 46) = v30;
    if (v18[741])
    {
      v31 = (void *)objc_msgSend(*((id *)v18 + 1), "getProperty:error:", *MEMORY[0x1E0D077E0], &GravityFactor);
      if (GravityFactor)
        goto LABEL_78;
      *((_DWORD *)v18 + 188) = objc_msgSend((id)objc_msgSend(v31, "objectForKeyedSubscript:", *MEMORY[0x1E0D07CB0]), "intValue");
    }
    if (objc_msgSend((id)objc_msgSend(a5, "objectForKeyedSubscript:", CFSTR("Sphere")), "BOOLValue"))
    {
      v32 = [BWSphereModeSelector alloc];
      v33 = objc_msgSend((id)objc_msgSend(a5, "objectForKeyedSubscript:", CFSTR("SphereStillActivePreview")), "BOOLValue");
      v34 = objc_msgSend((id)objc_msgSend(a5, "objectForKeyedSubscript:", CFSTR("SphereVideo")), "BOOLValue");
      objc_msgSend((id)objc_msgSend(a5, "objectForKeyedSubscript:", CFSTR("SphereVideoMaxFrameRate")), "floatValue");
      *((_QWORD *)v18 + 55) = -[BWSphereModeSelector initWithStillActivePreviewSupported:sphereVideoSupported:sphereVideoMaxFrameRate:](v32, "initWithStillActivePreviewSupported:sphereVideoSupported:sphereVideoMaxFrameRate:", v33, v34);
      v35 = (void *)objc_msgSend(*((id *)v18 + 1), "getPropertyIfSupported:error:", *MEMORY[0x1E0D077D0], 0);
      v36 = objc_msgSend(v35, "containsObject:", *MEMORY[0x1E0D07A80]);
      if (v36)
        LOBYTE(v36) = objc_msgSend(v35, "containsObject:", *MEMORY[0x1E0D07A78]);
      v18[456] = v36;
    }
    *((_DWORD *)v18 + 115) = -1;
    *((_DWORD *)v18 + 117) = 3;
    v37 = a6;
    *((_QWORD *)v18 + 21) = v37;
    v18[152] = objc_msgSend((id)objc_msgSend(v37, "objectForKeyedSubscript:", CFSTR("usePinholeCameraFocalLengthInIntrinsicMatrixCalculation")), "BOOLValue");
    objc_msgSend((id)objc_msgSend(*((id *)v18 + 21), "objectForKeyedSubscript:", CFSTR("ExifFocalLengthMultiplier")), "floatValue");
    *((_DWORD *)v18 + 39) = v38;
    v39 = (void *)objc_msgSend(*((id *)v18 + 1), "getProperty:error:", *MEMORY[0x1E0D07708], &GravityFactor);
    v40 = GravityFactor;
    if (!GravityFactor)
    {
      v41 = v39;
      objc_msgSend(v39, "floatValue");
      if (v42 > 0.0)
      {
        objc_msgSend(v41, "floatValue");
        if (v43 < 100.0)
        {
          objc_msgSend(v41, "floatValue");
          *((float *)v18 + 65) = v44;
          if (v44 <= 0.0)
            v45 = 1.0;
          else
            v45 = 1.0 / v44;
          *((float *)v18 + 66) = v45;
          v46 = (void *)objc_msgSend(*((id *)v18 + 1), "getPropertyIfSupported:error:", *MEMORY[0x1E0D07748], &GravityFactor);
          if (v46)
          {
            v47 = v46;
            v48 = objc_msgSend((id)objc_msgSend(v46, "objectForKeyedSubscript:", *MEMORY[0x1E0D05BC8]), "intValue");
            v49 = objc_msgSend((id)objc_msgSend(v47, "objectForKeyedSubscript:", *MEMORY[0x1E0D05B90]), "intValue");
            *((_DWORD *)v18 + 233) = v48;
            *((_DWORD *)v18 + 234) = v49;
          }
          *((_QWORD *)v18 + 37) = objc_msgSend(*((id *)v18 + 1), "copyPropertyIfSupported:error:", *MEMORY[0x1E0D073E8], &GravityFactor);
          *((_QWORD *)v18 + 38) = objc_msgSend(*((id *)v18 + 1), "copyPropertyIfSupported:error:", *MEMORY[0x1E0D073E0], &GravityFactor);
          objc_msgSend((id)objc_msgSend(*((id *)v18 + 1), "getPropertyIfSupported:error:", *MEMORY[0x1E0D073D8], &GravityFactor), "floatValue");
          *((_DWORD *)v18 + 82) = v50;
          v51 = *MEMORY[0x1E0D073F8];
          if (objc_msgSend(*((id *)v18 + 11), "objectForKeyedSubscript:", *MEMORY[0x1E0D073F8]))
          {
            v52 = (void *)objc_msgSend(*((id *)v18 + 1), "copyProperty:error:", v51, &GravityFactor);
            *((_QWORD *)v18 + 35) = v52;
            v53 = BWInvertRowMajorViewMatrixData(v52);
          }
          else
          {
            *((_QWORD *)v18 + 35) = (id)objc_msgSend(a7, "cameraViewMatrixForPortType:", *((_QWORD *)v18 + 4));
            v53 = (void *)objc_msgSend(a7, "cameraPoseMatrixForPortType:", *((_QWORD *)v18 + 4));
          }
          *((_QWORD *)v18 + 39) = v53;
          if (objc_msgSend((id)objc_msgSend(a5, "objectForKeyedSubscript:", CFSTR("Focus")), "BOOLValue"))
          {
            GravityFactor = FigMotionGetGravityFactor(*((const __CFDictionary **)v18 + 18), *((CFDictionaryRef *)v18 + 21), (_DWORD *)v18 + 69);
            if (GravityFactor)
              goto LABEL_78;
          }
          *((_DWORD *)v18 + 184) = 0;
          v54 = *MEMORY[0x1E0D07568];
          if (objc_msgSend(*((id *)v18 + 11), "objectForKeyedSubscript:", *MEMORY[0x1E0D07568]))
          {
            GravityFactor = objc_msgSend(*((id *)v18 + 1), "setProperty:value:", v54, MEMORY[0x1E0C9AAA0]);
            if (GravityFactor)
              goto LABEL_78;
          }
          v55 = *MEMORY[0x1E0D07718];
          if (objc_msgSend(*((id *)v18 + 11), "objectForKeyedSubscript:", *MEMORY[0x1E0D07718])
            && (objc_msgSend(*((id *)v18 + 4), "isEqualToString:", *MEMORY[0x1E0D05A40]) & 1) == 0
            && (objc_msgSend((id)objc_msgSend(a5, "objectForKeyedSubscript:", CFSTR("RawBufferCompandingDisabled")), "BOOLValue") & 1) == 0)
          {
            GravityFactor = objc_msgSend(*((id *)v18 + 1), "setProperty:value:", v55, MEMORY[0x1E0C9AAB0]);
            if (GravityFactor)
              goto LABEL_78;
            v18[76] = 1;
          }
          v76 = 0u;
          v77 = 0u;
          v74 = 0u;
          v75 = 0u;
          v56 = (void *)*((_QWORD *)v18 + 12);
          v57 = objc_msgSend(v56, "countByEnumeratingWithState:objects:count:", &v74, v85, 16);
          v58 = *MEMORY[0x1E0D07EE8];
          if (v57)
          {
            v59 = v57;
            v60 = *(_QWORD *)v75;
            v61 = *MEMORY[0x1E0D07FF8];
            v62 = *MEMORY[0x1E0D07C98];
            while (2)
            {
              for (i = 0; i != v59; ++i)
              {
                if (*(_QWORD *)v75 != v60)
                  objc_enumerationMutation(v56);
                v64 = objc_msgSend((id)objc_msgSend((id)objc_msgSend((id)objc_msgSend(*(id *)(*((_QWORD *)&v74 + 1) + 8 * i), "objectForKeyedSubscript:", v58), "objectForKeyedSubscript:", v61), "objectForKeyedSubscript:", v62), "intValue");
                if (v64)
                {
                  if (v18[76])
                  {
                    if (v64 > 1735549491)
                    {
                      if (v64 == 1919379252)
                      {
                        v64 = 1919378232;
                      }
                      else if (v64 == 1735549492)
                      {
                        v64 = 1735549752;
                      }
                    }
                    else if (v64 == 1650943796)
                    {
                      v64 = 1650942776;
                    }
                    else if (v64 == 1734505012)
                    {
                      v64 = 1734501176;
                    }
                  }
                  *((_DWORD *)v18 + 20) = v64;
                  goto LABEL_59;
                }
              }
              v59 = objc_msgSend(v56, "countByEnumeratingWithState:objects:count:", &v74, v85, 16);
              if (v59)
                continue;
              break;
            }
          }
LABEL_59:
          *((_QWORD *)v18 + 13) = (id)objc_msgSend((id)objc_msgSend((id)objc_msgSend(*((id *)v18 + 12), "firstObject"), "objectForKeyedSubscript:", v58), "allKeys");
          v65 = *MEMORY[0x1E0D076D8];
          if (!objc_msgSend(*((id *)v18 + 11), "objectForKeyedSubscript:", *MEMORY[0x1E0D076D8]))
            goto LABEL_61;
          v66 = MEMORY[0x1E0C9AAA0];
          *((_QWORD *)v18 + 103) = -[BWNoiseReductionAndSharpeningParameters initWithPortType:sensorIDDictionary:]([BWNoiseReductionAndSharpeningParameters alloc], "initWithPortType:sensorIDDictionary:", *((_QWORD *)v18 + 4), *((_QWORD *)v18 + 21));
          v67 = (void *)*((_QWORD *)v18 + 1);
          v68 = *MEMORY[0x1E0D06FB0];
          v82 = v66;
          v83 = v68;
          v81 = *MEMORY[0x1E0D06F90];
          v84 = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v82, &v81, 1);
          GravityFactor = objc_msgSend(v67, "setProperty:value:", v65, objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v84, &v83, 1));
          if (!GravityFactor)
          {
LABEL_61:
            *(_OWORD *)(v18 + 1032) = *MEMORY[0x1E0C9D538];
            *((_DWORD *)v18 + 266) = 0;
            v69 = MEMORY[0x1E0CA2E18];
            v70 = *MEMORY[0x1E0CA2E18];
            *(_OWORD *)(v18 + 1068) = *MEMORY[0x1E0CA2E18];
            v71 = *(_QWORD *)(v69 + 16);
            *(_QWORD *)(v18 + 1084) = v71;
            *(_OWORD *)(v18 + 1092) = v70;
            *(_QWORD *)(v18 + 1108) = v71;
            *((_DWORD *)v18 + 279) = 0;
LABEL_62:
            v72 = GravityFactor;
            goto LABEL_63;
          }
LABEL_78:
          FigDebugAssert3();
          goto LABEL_62;
        }
      }
      v40 = -12783;
      GravityFactor = -12783;
    }
    *a12 = v40;
    goto LABEL_64;
  }
  v72 = FigSignalErrorAt();
  GravityFactor = v72;
LABEL_63:
  *a12 = v72;
  if (v72)
  {
LABEL_64:

    return 0;
  }
  return (BWFigVideoCaptureStream *)v18;
}

- (void)sourceNodeWillEmitDetectedFacesSampleBuffer:(opaqueCMSampleBuffer *)a3
{
  os_unfair_lock_s *p_cameraAccessLock;
  _BOOL4 blackenFramesForContinuityDisplayConnected;
  void *v7;
  void *v8;

  p_cameraAccessLock = &self->_cameraAccessLock;
  os_unfair_lock_lock(&self->_cameraAccessLock);
  if (self->_clientProcessHasAccessToCamera)
  {
    blackenFramesForContinuityDisplayConnected = self->_blackenFramesForContinuityDisplayConnected;
    os_unfair_lock_unlock(p_cameraAccessLock);
    if (!blackenFramesForContinuityDisplayConnected)
      return;
  }
  else
  {
    os_unfair_lock_unlock(p_cameraAccessLock);
  }
  v7 = (void *)CMGetAttachment(a3, (CFStringRef)*MEMORY[0x1E0D05CB0], 0);
  if (v7)
  {
    v8 = v7;
    objc_msgSend(v7, "setObject:forKeyedSubscript:", 0, *MEMORY[0x1E0D06998]);
    objc_msgSend(v8, "setObject:forKeyedSubscript:", 0, *MEMORY[0x1E0D069A0]);
  }
  else
  {
    FigDebugAssert3();
  }
}

- (NSString)nonLocalizedName
{
  return self->_nonLocalizedName;
}

- (void)setRawFocusScoresEnabled:(BOOL)a3
{
  _BOOL4 v3;
  uint64_t v5;
  uint64_t v6;
  _QWORD v7[2];

  v3 = a3;
  v7[1] = *MEMORY[0x1E0C80C00];
  v5 = *MEMORY[0x1E0D074B8];
  if (-[NSDictionary objectForKeyedSubscript:](self->_supportedProperties, "objectForKeyedSubscript:", *MEMORY[0x1E0D074B8]))
  {
    if (v3)
    {
      v7[0] = *MEMORY[0x1E0D070D0];
      v6 = objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v7, 1);
    }
    else
    {
      v6 = MEMORY[0x1E0C9AA60];
    }
    if (!-[BWFigCaptureStream setProperty:value:](self->_stream, "setProperty:value:", v5, v6))
      BYTE2(self->_multiBandNoiseReductionMode) = v3;
  }
}

- (void)setAeStatisticsEnabled:(BOOL)a3
{
  _BOOL8 v3;
  uint64_t v5;

  v3 = a3;
  v5 = *MEMORY[0x1E0D07328];
  if (-[NSDictionary objectForKeyedSubscript:](self->_supportedProperties, "objectForKeyedSubscript:", *MEMORY[0x1E0D07328]))
  {
    if (!-[BWFigCaptureStream setProperty:value:](self->_stream, "setProperty:value:", v5, objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v3)))BYTE1(self->_multiBandNoiseReductionMode) = v3;
  }
}

- (void)setMomentCaptureVideoRecordingAEMaxGain:(float)a3
{
  *((float *)&self->_maxExposureDurationFrameworkOverride.epoch + 1) = a3;
}

- (BOOL)sphereVideoSupported
{
  return -[BWSphereModeSelector sphereVideoSupported](self->_sphereModeSelector, "sphereVideoSupported");
}

- (void)setDepthDataDeliveryEnabled:(BOOL)a3
{
  -[BWSphereModeSelector setDepthDataDeliveryEnabled:](self->_sphereModeSelector, "setDepthDataDeliveryEnabled:", a3);
}

- (void)setAvoidsSphereRecentering:(BOOL)a3
{
  -[BWSphereModeSelector setAvoidsSphereRecentering:](self->_sphereModeSelector, "setAvoidsSphereRecentering:", a3);
}

- (NSDictionary)moduleInfo
{
  return self->_moduleInfo;
}

- (float)maximumFrameRate
{
  return self->_maximumFrameRate;
}

- (float)baseZoomFactor
{
  return self->_baseZoomFactor;
}

- (BWFigCaptureStream)stream
{
  return self->_stream;
}

- (NSData)cameraViewMatrixCalibratedForNarrowerFieldOfView
{
  return self->_cameraViewMatrixCalibratedForNarrowerFieldOfView;
}

- (NSDictionary)sensorColorCalibrationData
{
  NSString *portType;
  NSString *v4;
  BOOL v5;
  NSDictionary *result;
  NSDictionary *v7;
  SEL v8;
  void *v9;
  NSDictionary **v10;
  int v11;
  NSDictionary *v12;
  NSDictionary *v13;
  NSDictionary *v14;
  NSDictionary *v15;

  v15 = 0;
  if (!self->_stream
    || ((portType = self->_portType, v4 = -[BWFigVideoCaptureStream sensorIDString](self, "sensorIDString"), portType)
      ? (v5 = v4 == 0)
      : (v5 = 1),
        v5))
  {
    FigDebugAssert3();
    return 0;
  }
  result = (NSDictionary *)objc_msgSend(-[FigCaptureCameraParameters sensorIDDictionaryForPortType:sensorIDString:](+[FigCaptureCameraParameters sharedInstance](FigCaptureCameraParameters, "sharedInstance"), "sensorIDDictionaryForPortType:sensorIDString:", portType, v4), "objectForKeyedSubscript:", CFSTR("ModuleConfig"));
  if (result)
  {
    v7 = result;
    result = (NSDictionary *)objc_msgSend(-[NSDictionary objectForKeyedSubscript:](result, "objectForKeyedSubscript:", CFSTR("AutoWhiteBalance")), "objectForKeyedSubscript:", CFSTR("IdealColorCalibrations"));
    v14 = result;
    if (result)
    {
      result = -[NSDictionary objectForKeyedSubscript:](v7, "objectForKeyedSubscript:", CFSTR("AutoWhiteBalance"));
      v13 = result;
      if (result)
      {
        result = -[BWFigCaptureStream getPropertyIfSupported:error:](self->_stream, "getPropertyIfSupported:error:", *MEMORY[0x1E0D07368], 0);
        v12 = result;
        if (result)
        {
          v8 = NSSelectorFromString(&CFSTR("getColorCalibrationsUsingIdealColorCalbrations:absoluteColorCalibrations:colorCalib"
                                           "rations:awbConfig:").isa);
          if ((objc_opt_respondsToSelector() & 1) != 0)
          {
            v11 = 0;
            v10 = &v15;
            v9 = (void *)objc_msgSend(MEMORY[0x1E0C99DB8], "invocationWithMethodSignature:", objc_msgSend(MEMORY[0x1E0D0CF08], "methodSignatureForSelector:", v8));
            objc_msgSend(v9, "setSelector:", v8);
            objc_msgSend(v9, "setTarget:", objc_opt_class());
            objc_msgSend(v9, "setArgument:atIndex:", &v14, 2);
            objc_msgSend(v9, "setArgument:atIndex:", &v12, 3);
            objc_msgSend(v9, "setArgument:atIndex:", &v10, 4);
            objc_msgSend(v9, "setArgument:atIndex:", &v13, 5);
            objc_msgSend(v9, "invoke");
            objc_msgSend(v9, "getReturnValue:", &v11);
            return v15;
          }
          return 0;
        }
      }
    }
  }
  return result;
}

- (NSString)sensorIDString
{
  return (NSString *)+[FigCaptureCameraParameters sensorIDStringFromModuleInfo:](FigCaptureCameraParameters, "sensorIDStringFromModuleInfo:", self->_moduleInfo);
}

- (CGPoint)opticalCenterOffset
{
  double v2;
  double v3;
  _QWORD v4[2];
  CGPoint result;

  objc_copyStruct(v4, &self->_opticalCenterOffset, 16, 1, 0);
  v2 = *(double *)v4;
  v3 = *(double *)&v4[1];
  result.y = v3;
  result.x = v2;
  return result;
}

- (CGPoint)opticalCenterOffsetInPhysicalSensorDimensions
{
  double v2;
  double v3;
  _QWORD v4[2];
  CGPoint result;

  objc_copyStruct(v4, &self->_opticalCenterOffsetInPhysicalSensorDimensions, 16, 1, 0);
  v2 = *(double *)v4;
  v3 = *(double *)&v4[1];
  result.y = v3;
  result.x = v2;
  return result;
}

- (BOOL)hasOpticalCenterOffsetCalibratedForNarrowerFieldOfView
{
  return self->_hasOpticalCenterOffsetCalibratedForNarrowerFieldOfView;
}

- (NSDictionary)geometricDistortionCoefficients
{
  return *(NSDictionary **)&self->_masterToSlaveFrameRateRatio;
}

- (NSDictionary)geometricDistortionCoefficientsCalibratedForNarrowerFieldOfView
{
  return self->_geometricDistortionCoefficients;
}

- (NSData)flashCalibrationData
{
  NSData *v3;
  NSData *v4;
  uint64_t v5;
  _DWORD *v6;
  NSString *portType;
  NSString *v8;
  uint64_t v9;

  v3 = -[BWFigCaptureStream getPropertyIfSupported:error:](self->_stream, "getPropertyIfSupported:error:", *MEMORY[0x1E0D074F0], 0);
  v4 = v3;
  if (v3)
  {
    v5 = -[NSData bytes](v3, "bytes");
    if (v5)
    {
      v6 = (_DWORD *)v5;
      if (-[NSString isEqualToString:](self->_portType, "isEqualToString:", *MEMORY[0x1E0D05A28]))
      {
        if (*v6 == 1)
        {
          portType = self->_portType;
          v8 = -[BWFigVideoCaptureStream sensorIDString](self, "sensorIDString");
          if (portType && v8)
          {
            v9 = objc_msgSend(-[FigCaptureCameraParameters sensorIDDictionaryForPortType:sensorIDString:](+[FigCaptureCameraParameters sharedInstance](FigCaptureCameraParameters, "sharedInstance"), "sensorIDDictionaryForPortType:sensorIDString:", portType, v8), "objectForKeyedSubscript:", CFSTR("ModuleConfig"));
            if (v9)
              objc_msgSend(MEMORY[0x1E0D0CF08], "calculateSTRBKeyFromWideCamera:moduleConfig:", v6, v9);
          }
          else
          {
            FigDebugAssert3();
          }
        }
      }
    }
  }
  return v4;
}

- (NSData)cameraViewMatrix
{
  return self->_cameraViewMatrix;
}

- (NSData)cameraPoseMatrix
{
  return self->_cameraPoseMatrix;
}

- (NSNumber)calibrationValidRadiusForNarrowerFieldOfView
{
  return self->_calibrationValidRadiusForNarrowerFieldOfView;
}

- (NSNumber)calibrationValidRadiusForFullFieldOfView
{
  return self->_calibrationValidRadiusForFullFieldOfView;
}

- (void)willBecomeSlaveStream
{
  -[BWStillImageTimeMachine suspendAndDrain](self->_timeMachine, "suspendAndDrain");
}

- (void)didBecomeSlaveStream
{
  self->_isSlave = 1;
  -[BWFigVideoCaptureStream _updateMasterSlavePropertiesOnStream]((uint64_t)self);
}

- (CGPoint)opticalCenterOffsetCalibratedForNarrowerFieldOfView
{
  double v2;
  double v3;
  _QWORD v4[2];
  CGPoint result;

  objc_copyStruct(v4, &self->_opticalCenterOffsetCalibratedForNarrowerFieldOfView, 16, 1, 0);
  v2 = *(double *)v4;
  v3 = *(double *)&v4[1];
  result.y = v3;
  result.x = v2;
  return result;
}

- (CGPoint)opticalCenterOffsetCalibratedForNarrowerFieldOfViewInPhysicalSensorDimensions
{
  double v2;
  double v3;
  _QWORD v4[2];
  CGPoint result;

  objc_copyStruct(v4, &self->_opticalCenterOffsetCalibratedForNarrowerFieldOfViewInPhysicalSensorDimensions, 16, 1, 0);
  v2 = *(double *)v4;
  v3 = *(double *)&v4[1];
  result.y = v3;
  result.x = v2;
  return result;
}

- (void)didBecomeMasterStream
{
  -[BWFigVideoCaptureStreamDelegate captureStream:didUpdatePreviewShift:](self->_delegate, "captureStream:didUpdatePreviewShift:", self, *MEMORY[0x1E0C9D538], *(double *)(MEMORY[0x1E0C9D538] + 8));
}

- (BOOL)videoHDRFusionEnabled
{
  return HIBYTE(self->_keypointDetectionConfiguration);
}

- (float)maximumSupportedFrameRate
{
  return self->_maximumSupportedFrameRate;
}

- (BOOL)enablesSphereWhenAvailable
{
  return -[BWSphereModeSelector enablesSphereWhenAvailable](self->_sphereModeSelector, "enablesSphereWhenAvailable");
}

- (void)setReactionEffectsEnabled:(BOOL)a3
{
  BYTE6(self->_centerStageRectOfInterest.size.width) = a3;
}

- (int)setActiveFormatIndex:(int)a3
{
  uint64_t v3;
  int fastSwitchingMainFormatIndex;
  int v6;
  int v7;
  int v8;
  id v9;
  float v10;
  float v11;
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  NSObject *v13;
  NSObject *v14;
  int v15;
  uint64_t v17;
  uint64_t v18;
  int v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  if (self->_activeFormatIndex == a3)
    return 0;
  v3 = *(_QWORD *)&a3;
  if (a3 < 0 || -[NSArray count](self->_supportedFormats, "count") <= a3)
    objc_exception_throw((id)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99858], CFSTR("Can't set active format index: because the specified format is outside the supported format range. Use -supportedFormats."), 0));
  fastSwitchingMainFormatIndex = self->_fastSwitchingMainFormatIndex;
  if (fastSwitchingMainFormatIndex < 0)
  {
    v8 = -[BWFigCaptureStream setProperty:value:](self->_stream, "setProperty:value:", CFSTR("FormatIndex"), objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v3));
    v19 = v8;
    if (!v8)
    {
      self->_activeFormatIndex = v3;
      goto LABEL_13;
    }
    v15 = v8;
LABEL_25:
    FigDebugAssert3();
    return v15;
  }
  if (self->_activeFastSwitchingMainFormatIndex != fastSwitchingMainFormatIndex
    && self->_activeFormatIndex != fastSwitchingMainFormatIndex)
  {
    v6 = -[BWFigCaptureStream setProperty:value:](self->_stream, "setProperty:value:", CFSTR("FormatIndex"), objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:"));
    if (v6)
    {
      v15 = v6;
      goto LABEL_25;
    }
    fastSwitchingMainFormatIndex = self->_fastSwitchingMainFormatIndex;
  }
  self->_activeFastSwitchingMainFormatIndex = fastSwitchingMainFormatIndex;
  self->_activeFormatIndex = v3;
  v7 = -[BWFigVideoCaptureStream setActiveNondisruptiveSwitchingFormatIndex:](self, "setActiveNondisruptiveSwitchingFormatIndex:", v3);
  v19 = v7;
  if (v7)
  {
    v15 = v7;
    goto LABEL_25;
  }
  LODWORD(v3) = self->_activeFormatIndex;
LABEL_13:
  v9 = -[NSArray objectAtIndexedSubscript:](self->_supportedFormats, "objectAtIndexedSubscript:", (int)v3);
  LODWORD(v10) = objc_msgSend((id)objc_msgSend(v9, "objectForKeyedSubscript:", *MEMORY[0x1E0D07ED0]), "intValue");
  LODWORD(v11) = objc_msgSend((id)objc_msgSend(v9, "objectForKeyedSubscript:", *MEMORY[0x1E0D07EC8]), "intValue");
  self->_aeMaxGain = v10;
  self->_momentCaptureVideoRecordingAEMaxGain = v11;
  -[BWFigVideoCaptureStream _recomputeOpticalCenterOffsets]((uint64_t)self);

  *(_QWORD *)&self->_masterToSlaveFrameRateRatio = -[BWFigCaptureStream copyPropertyIfSupported:error:](self->_stream, "copyPropertyIfSupported:error:", *MEMORY[0x1E0D07530], &v19);
  if (v19)
  {
    os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
    v19 = 0;
  }

  self->_geometricDistortionCoefficients = (NSDictionary *)-[BWFigCaptureStream copyPropertyIfSupported:error:](self->_stream, "copyPropertyIfSupported:error:", *MEMORY[0x1E0D07538], &v19);
  if (v19)
  {
    v13 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
    v19 = 0;
  }

  self->_cameraViewMatrixCalibratedForNarrowerFieldOfView = (NSData *)-[BWFigCaptureStream copyPropertyIfSupported:error:](self->_stream, "copyPropertyIfSupported:error:", *MEMORY[0x1E0D07400], &v19);
  if (v19)
  {
    v14 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
    v19 = 0;
  }
  -[BWFigVideoCaptureStreamDelegate captureStreamDidChangeActiveFormatIndex:](self->_delegate, "captureStreamDidChangeActiveFormatIndex:", self, v17, v18);
  return v19;
}

- (void)_recomputeOpticalCenterOffsets
{
  const __CFDictionary *v2;
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  double v4;
  uint64_t v5;
  uint64_t v6;
  const __CFDictionary *v7;
  double v8;
  uint64_t v9;
  uint64_t v10;
  char v11;
  NSObject *v12;
  __int128 v13;
  CGPoint point;
  int v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  if (a1)
  {
    v15 = 0;
    v13 = *MEMORY[0x1E0C9D538];
    point = (CGPoint)*MEMORY[0x1E0C9D538];
    v2 = (const __CFDictionary *)objc_msgSend(*(id *)(a1 + 8), "getPropertyIfSupported:error:", *MEMORY[0x1E0D076F0], 0);
    if (v2)
    {
      CGPointMakeWithDictionaryRepresentation(v2, &point);
    }
    else
    {
      os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
      fig_log_call_emit_and_clean_up_after_send_and_compose();
    }
    v4 = -[BWFigVideoCaptureStream _convertOpticalCenterToOpticalCenterOffset:error:](a1, 0, point.x, point.y);
    *(double *)(a1 + 192) = v4;
    *(_QWORD *)(a1 + 200) = v5;
    *(double *)(a1 + 208) = -[BWFigVideoCaptureStream _convertOpticalCenterOffsetToPhysicalSensorDimensions:](a1, v4);
    *(_QWORD *)(a1 + 216) = v6;
    v7 = (const __CFDictionary *)objc_msgSend(*(id *)(a1 + 8), "getPropertyIfSupported:error:", *MEMORY[0x1E0D076F8], &v15);
    if (v7)
    {
      CGPointMakeWithDictionaryRepresentation(v7, &point);
      v8 = -[BWFigVideoCaptureStream _convertOpticalCenterToOpticalCenterOffset:error:](a1, 0, point.x, point.y);
      *(double *)(a1 + 224) = v8;
      *(_QWORD *)(a1 + 232) = v9;
      *(double *)(a1 + 240) = -[BWFigVideoCaptureStream _convertOpticalCenterOffsetToPhysicalSensorDimensions:](a1, v8);
      *(_QWORD *)(a1 + 248) = v10;
      v11 = 1;
    }
    else
    {
      if (v15)
      {
        v12 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
        os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT);
        fig_log_call_emit_and_clean_up_after_send_and_compose();
      }
      v11 = 0;
      *(_OWORD *)(a1 + 224) = v13;
      *(_OWORD *)(a1 + 240) = v13;
    }
    *(_BYTE *)(a1 + 256) = v11;
  }
}

- (double)_convertOpticalCenterToOpticalCenterOffset:(double)a3 error:(double)a4
{
  double result;
  int v6;

  if (!a1)
    return 0.0;
  result = *MEMORY[0x1E0C9D538];
  v6 = *(_DWORD *)(a1 + 916);
  if (v6 >= 1 && *(int *)(a1 + 920) >= 1 && (a3 != result || a4 != *(double *)(MEMORY[0x1E0C9D538] + 8)))
    result = a3 - (double)v6 * 0.5;
  if (a2)
    *a2 = 0;
  return result;
}

- (double)_convertOpticalCenterOffsetToPhysicalSensorDimensions:(uint64_t)a1
{
  void *v3;
  char v4;
  unsigned int v5;
  int v6;
  int v7;

  if (!a1)
    return 0.0;
  v3 = (void *)objc_msgSend(*(id *)(a1 + 96), "objectAtIndexedSubscript:", (int)-[BWFigVideoCaptureStream _activeFormatIndexWithNondisruptiveSwitching]((os_unfair_lock_s *)a1));
  v4 = objc_msgSend((id)objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("VideoIsBinned")), "BOOLValue");
  v5 = objc_msgSend((id)objc_msgSend(v3, "objectForKeyedSubscript:", *MEMORY[0x1E0D07E98]), "intValue");
  if (v5 <= 1)
    v6 = 1;
  else
    v6 = v5;
  v7 = v6 << v4;
  if (v7 <= 1)
    v7 = 1;
  return a2 * (double)v7;
}

- (int)activeFormatIndex
{
  return self->_activeFormatIndex;
}

- (void)setFaceDetectionEnabled:(BOOL)a3
{
  int v3;
  NSNumber **p_lastFaceDetectionEnabled;

  v3 = a3;
  p_lastFaceDetectionEnabled = &self->_lastFaceDetectionEnabled;
  os_unfair_lock_lock((os_unfair_lock_t)&self->_lastFaceDetectionEnabled);
  if (LOBYTE(self->_faceDetectionConfiguration) != v3)
  {
    LOBYTE(self->_faceDetectionConfiguration) = v3;
    -[BWFigVideoCaptureStream _propagateFaceAndObjectDetectionSettings]((uint64_t)self);
  }
  os_unfair_lock_unlock((os_unfair_lock_t)p_lastFaceDetectionEnabled);
}

- (void)setFaceDetectionConfiguration:(id)a3
{
  NSNumber **p_lastFaceDetectionEnabled;

  p_lastFaceDetectionEnabled = &self->_lastFaceDetectionEnabled;
  os_unfair_lock_lock((os_unfair_lock_t)&self->_lastFaceDetectionEnabled);
  if ((objc_msgSend(*(id *)&self->_objectDetectionStartupDeferred, "isEqualToDictionary:", a3) & 1) == 0)
  {

    *(_QWORD *)&self->_objectDetectionStartupDeferred = objc_msgSend(a3, "copy");
    -[BWFigVideoCaptureStream _propagateFaceAndObjectDetectionSettings]((uint64_t)self);
  }
  os_unfair_lock_unlock((os_unfair_lock_t)p_lastFaceDetectionEnabled);
}

- (uint64_t)_propagateFaceAndObjectDetectionSettings
{
  uint64_t v1;
  int v2;
  uint64_t v3;
  void *v4;
  void *v5;
  _BOOL8 v6;
  id *v7;

  if (result)
  {
    v1 = result;
    v2 = *(unsigned __int8 *)(result + 688);
    v3 = *MEMORY[0x1E0D076E8];
    if (objc_msgSend(*(id *)(result + 88), "objectForKeyedSubscript:", *MEMORY[0x1E0D076E8]))
    {
      if (v2)
        v4 = (void *)MEMORY[0x1E0C9AA70];
      else
        v4 = -[BWFigVideoCaptureStream _captureStreamObjectDetectionConfiguration](v1);
      result = objc_msgSend(*(id *)(v1 + 712), "isEqualToDictionary:", v4);
      if ((result & 1) == 0)
      {
        v7 = (id *)(v1 + 712);
LABEL_16:
        objc_msgSend(*(id *)(v1 + 8), "setProperty:value:", v3, v4);

        result = v4;
        *v7 = (id)result;
      }
    }
    else
    {
      v3 = *MEMORY[0x1E0D074E0];
      result = objc_msgSend(*(id *)(v1 + 88), "objectForKeyedSubscript:", *MEMORY[0x1E0D074E0]);
      if (result)
      {
        v5 = -[BWFigVideoCaptureStream _captureStreamFaceDetectionConfiguration](v1);
        if ((objc_msgSend(*(id *)(v1 + 720), "isEqualToDictionary:", v5) & 1) == 0)
        {
          objc_msgSend(*(id *)(v1 + 8), "setProperty:value:", *MEMORY[0x1E0D074D8], v5);

          *(_QWORD *)(v1 + 720) = v5;
        }
        v6 = !v2 && (unint64_t)(*(_BYTE *)(v1 + 704) != 0);
        v4 = (void *)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v6);
        result = objc_msgSend(*(id *)(v1 + 728), "isEqualToNumber:", v4);
        if ((result & 1) == 0)
        {
          v7 = (id *)(v1 + 728);
          goto LABEL_16;
        }
      }
    }
  }
  return result;
}

- (void)_captureStreamObjectDetectionConfiguration
{
  void *v2;
  _BOOL4 v3;
  int v4;
  int v5;
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
  uint64_t v16;
  uint64_t v17;

  if (!a1)
    return 0;
  v2 = (void *)objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (objc_msgSend((id)objc_msgSend(*(id *)(a1 + 696), "objectForKeyedSubscript:", *MEMORY[0x1E0D06520]), "BOOLValue") & 1) != 0
    || *(_BYTE *)(a1 + 705) != 0;
  v4 = objc_msgSend((id)objc_msgSend(*(id *)(a1 + 696), "objectForKeyedSubscript:", *MEMORY[0x1E0D06518]), "BOOLValue");
  v5 = objc_msgSend((id)objc_msgSend(*(id *)(a1 + 696), "objectForKeyedSubscript:", *MEMORY[0x1E0D06530]), "BOOLValue");
  if (v3 | v4 | v5)
    v6 = 6;
  else
    v6 = 10;
  if ((objc_msgSend(*(id *)(a1 + 680), "containsObject:", *MEMORY[0x1E0D064A0]) & 1) != 0 || *(_BYTE *)(a1 + 704))
  {
    v7 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v6);
    objc_msgSend(v2, "setObject:forKeyedSubscript:", v7, *MEMORY[0x1E0D07068]);
  }
  if (objc_msgSend(*(id *)(a1 + 680), "containsObject:", *MEMORY[0x1E0D064B0]))
  {
    v8 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", (2 * v6));
    objc_msgSend(v2, "setObject:forKeyedSubscript:", v8, *MEMORY[0x1E0D07078]);
  }
  if (objc_msgSend(*(id *)(a1 + 680), "containsObject:", *MEMORY[0x1E0D064B8]))
  {
    v9 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v6);
    objc_msgSend(v2, "setObject:forKeyedSubscript:", v9, *MEMORY[0x1E0D07080]);
  }
  if (objc_msgSend(*(id *)(a1 + 680), "containsObject:", *MEMORY[0x1E0D06498]))
  {
    v10 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v6);
    objc_msgSend(v2, "setObject:forKeyedSubscript:", v10, *MEMORY[0x1E0D07060]);
  }
  if (objc_msgSend(*(id *)(a1 + 680), "containsObject:", *MEMORY[0x1E0D064A8]))
  {
    v11 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v6);
    objc_msgSend(v2, "setObject:forKeyedSubscript:", v11, *MEMORY[0x1E0D07070]);
  }
  if (objc_msgSend(*(id *)(a1 + 680), "containsObject:", *MEMORY[0x1E0D06488]))
  {
    v12 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v6);
    objc_msgSend(v2, "setObject:forKeyedSubscript:", v12, *MEMORY[0x1E0D07050]);
  }
  if (objc_msgSend(*(id *)(a1 + 680), "containsObject:", *MEMORY[0x1E0D06490]))
  {
    v13 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v6);
    objc_msgSend(v2, "setObject:forKeyedSubscript:", v13, *MEMORY[0x1E0D07058]);
  }
  if (objc_msgSend(*(id *)(a1 + 680), "containsObject:", *MEMORY[0x1E0D06478]))
  {
    v14 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v6);
    objc_msgSend(v2, "setObject:forKeyedSubscript:", v14, *MEMORY[0x1E0D07040]);
  }
  if (objc_msgSend(*(id *)(a1 + 680), "containsObject:", *MEMORY[0x1E0D06480]))
  {
    v15 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v6);
    objc_msgSend(v2, "setObject:forKeyedSubscript:", v15, *MEMORY[0x1E0D07048]);
  }
  if (objc_msgSend(*(id *)(a1 + 680), "containsObject:", *MEMORY[0x1E0D064C0]))
  {
    v16 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v6);
    objc_msgSend(v2, "setObject:forKeyedSubscript:", v16, *MEMORY[0x1E0D07088]);
  }
  if (objc_msgSend(*(id *)(a1 + 680), "containsObject:", *MEMORY[0x1E0D064C8]))
  {
    v17 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v6);
    objc_msgSend(v2, "setObject:forKeyedSubscript:", v17, *MEMORY[0x1E0D07090]);
    if (!v3)
    {
LABEL_31:
      if (!v5)
        goto LABEL_32;
      goto LABEL_36;
    }
  }
  else if (!v3)
  {
    goto LABEL_31;
  }
  objc_msgSend(v2, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], *MEMORY[0x1E0D07030]);
  if (!v5)
  {
LABEL_32:
    if (!v4)
      return v2;
    goto LABEL_37;
  }
LABEL_36:
  objc_msgSend(v2, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], *MEMORY[0x1E0D07038]);
  if (v4)
LABEL_37:
    objc_msgSend(v2, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], *MEMORY[0x1E0D07028]);
  return v2;
}

- (void)setObjectDetectionStartupDeferred:(BOOL)a3
{
  int v3;

  v3 = a3;
  if (!self->_started || !a3)
  {
    os_unfair_lock_lock((os_unfair_lock_t)&self->_lastFaceDetectionEnabled);
    if (LOBYTE(self->_detectedObjectTypes) != v3)
    {
      LOBYTE(self->_detectedObjectTypes) = v3;
      -[BWFigVideoCaptureStream _propagateFaceAndObjectDetectionSettings]((uint64_t)self);
    }
    os_unfair_lock_unlock((os_unfair_lock_t)&self->_lastFaceDetectionEnabled);
  }
}

- (void)setDetectedObjectTypes:(id)a3
{
  NSNumber **p_lastFaceDetectionEnabled;

  p_lastFaceDetectionEnabled = &self->_lastFaceDetectionEnabled;
  os_unfair_lock_lock((os_unfair_lock_t)&self->_lastFaceDetectionEnabled);
  if ((objc_msgSend(*(id *)&self->_lastDigitalFlashSphereOffsetOpticalCenter.y, "isEqualToSet:", a3) & 1) == 0)
  {

    *(_QWORD *)&self->_lastDigitalFlashSphereOffsetOpticalCenter.y = objc_msgSend(a3, "copy");
    -[BWFigVideoCaptureStream _propagateFaceAndObjectDetectionSettings]((uint64_t)self);
  }
  os_unfair_lock_unlock((os_unfair_lock_t)p_lastFaceDetectionEnabled);
}

- (void)setStudioLightingEnabled:(BOOL)a3
{
  BYTE5(self->_centerStageRectOfInterest.size.width) = a3;
}

- (void)setBackgroundBlurEnabled:(BOOL)a3
{
  BYTE4(self->_centerStageRectOfInterest.size.width) = a3;
}

- (void)setStreamingRequiredWhenConfiguredAsSlave:(BOOL)a3
{
  if (BYTE4(self->_synchronizedStreamsGroup) != a3)
  {
    BYTE4(self->_synchronizedStreamsGroup) = a3;
    -[BWFigVideoCaptureStream _updateMasterSlavePropertiesOnStream]((uint64_t)self);
  }
}

- (void)setFirmwareTimeMachineEnabledWhenConfiguredAsSlave:(BOOL)a3
{
  BYTE5(self->_synchronizedStreamsGroup) = a3;
}

- (BOOL)isSynchronizationMaster
{
  return BYTE4(self->_lastFaceDetectionEnabled);
}

- (BOOL)suspended
{
  return self->_suspended;
}

- (int)start
{
  return -[BWFigCaptureStream start](self->_stream, "start");
}

- (void)sourceNodeWillStartStreaming
{
  CMTime v3;

  if (LOBYTE(self->_stillImageBufferTimeMachineHandler))
  {
    *(_QWORD *)&self->_stillImageCaptureEnabled = FigDispatchQueueCreateWithPriority();
    self->_stillImageCaptureDelegate = (BWFigVideoCaptureStreamStillImageCaptureDelegate *)dispatch_group_create();
    -[BWFigCaptureStream registerForNotification:listener:callback:](self->_stream, "registerForNotification:listener:callback:", *MEMORY[0x1E0D07018], self, fvcs_handleStillImageCaptureFailureNotification);
    -[BWFigCaptureStream registerForNotification:listener:callback:](self->_stream, "registerForNotification:listener:callback:", *MEMORY[0x1E0D07008], self, fvcs_handleFlashNotification);
    -[BWFigCaptureStream registerForNotification:listener:callback:](self->_stream, "registerForNotification:listener:callback:", *MEMORY[0x1E0D06FE8], self, fvcs_handleFlashNotification);
    if (self->_timeMachineEnabled)
      self->_timeMachine = -[BWStillImageTimeMachine initWithCapacity:]([BWStillImageTimeMachine alloc], "initWithCapacity:", self->_timeMachineCapacity);
    if (-[BWSphereModeSelector enablesSphereWhenAvailable](self->_sphereModeSelector, "enablesSphereWhenAvailable"))
      -[BWFigVideoCaptureStream setMotionDataDeliveryEnabled:](self, "setMotionDataDeliveryEnabled:", 1);
  }
  -[BWFigVideoCaptureStream maxExposureDuration](self, "maxExposureDuration");
  memset(&v3, 0, sizeof(v3));
  -[BWFigVideoCaptureStream _setMaxExposureDuration:]((id *)&self->super.isa, &v3, 0.0);
  -[BWFigVideoCaptureStream _updateAETables]((uint64_t)self);
  *(_DWORD *)&self->_unifiedBracketingEnabled = 0;
  LOBYTE(self->_uniqueID) = 0;
  os_unfair_lock_lock((os_unfair_lock_t)&self->_lastFaceDetectionEnabled);
  -[BWFigVideoCaptureStream _propagateFaceAndObjectDetectionSettings]((uint64_t)self);
  os_unfair_lock_unlock((os_unfair_lock_t)&self->_lastFaceDetectionEnabled);
  -[NSDictionary setVideoStabilizationStrength:](self->_zoomFactorToNondisruptiveSwitchingFormatIndexSIFRNonBinned, "setVideoStabilizationStrength:", HIDWORD(self->_centerStageRectOfInterest.size.height));
  -[BWFigVideoCaptureStreamDelegate captureStreamWillStartStreaming:](self->_delegate, "captureStreamWillStartStreaming:", self);
  -[BWFigCaptureStream setStartStopDelegate:](self->_stream, "setStartStopDelegate:", self);
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)maxExposureDuration
{
  *retstr = *($3CC8671D27C23BF42ADDB32F2B5E48AE *)((char *)self + 852);
  if ((retstr->var2 & 1) == 0)
    *retstr = *($3CC8671D27C23BF42ADDB32F2B5E48AE *)((char *)self + 876);
  return self;
}

- (void)sourceNodeDidStartStreaming
{
  os_unfair_lock_s *p_streamStateLock;
  id v4;
  uint64_t deviceType;
  int64_t epoch;
  OS_tcc_identity *tccIdentity;
  NSString *mediaEnvironment;
  __int128 v9;
  _OWORD v10[2];

  p_streamStateLock = &self->_streamStateLock;
  os_unfair_lock_lock(&self->_streamStateLock);
  if (!self->_suspended)
  {
    v4 = +[BWCameraStreamingMonitor sharedCameraStreamingMonitor](BWCameraStreamingMonitor, "sharedCameraStreamingMonitor");
    deviceType = self->_deviceType;
    epoch = self->_lastValidPTS.epoch;
    tccIdentity = self->_tccIdentity;
    mediaEnvironment = self->_mediaEnvironment;
    v9 = *(_OWORD *)&self->_clientAuditToken.val[4];
    v10[0] = *(_OWORD *)self->_clientAuditToken.val;
    v10[1] = v9;
    objc_msgSend(v4, "setStreaming:deviceType:streamUniqueID:clientAuditToken:tccIdentity:mediaEnvironment:completionHandler:", 1, deviceType, epoch, v10, tccIdentity, mediaEnvironment, 0);
  }
  self->_started = 1;
  os_unfair_lock_unlock(p_streamStateLock);
  -[BWFigVideoCaptureStreamDelegate captureStreamDidStartStreaming:](self->_delegate, "captureStreamDidStartStreaming:", self);
}

- (void)setObjectDetector:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 816);
}

- (void)setFaceDetector:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 808);
}

- (uint64_t)_updateAETables
{
  uint64_t v1;
  uint64_t v2;

  if (result)
  {
    v1 = result;
    v2 = *MEMORY[0x1E0D07330];
    result = objc_msgSend(*(id *)(result + 88), "objectForKeyedSubscript:", *MEMORY[0x1E0D07330]);
    if (result)
      return objc_msgSend(*(id *)(v1 + 8), "setProperty:value:", v2, -[BWFigVideoCaptureStream _aeTables](v1));
  }
  return result;
}

- (id)_setMaxExposureDuration:(double)a3
{
  id *v4;
  CMTimeFlags flags;
  float v6;
  float v7;
  int32_t v8;
  float v9;
  CMTime v10;

  if (result)
  {
    v4 = result;
    flags = a2->flags;
    if ((flags & 1) == 0)
    {
      if (!*((_BYTE *)result + 900))
        return result;
      objc_msgSend(result, "minimumFrameRate");
      if (v6 <= 1.0)
      {
        v8 = 1;
      }
      else
      {
        objc_msgSend(v4, "minimumFrameRate");
        v8 = (int)v7;
      }
      CMTimeMake(&v10, 1, v8);
      HIDWORD(a3) = HIDWORD(v10.value);
      *a2 = v10;
    }
    *(float *)&a3 = (float)((float)a2->value / (float)a2->timescale) * 1000.0;
    v9 = ceilf(*(float *)&a3);
    if ((flags & 1) == 0)
      *(float *)&a3 = v9;
    result = (id *)objc_msgSend(v4[1], "setProperty:value:", *MEMORY[0x1E0D07688], objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", a3));
    if (!(_DWORD)result)
      *((_BYTE *)v4 + 900) = 1;
  }
  return result;
}

- (uint64_t)_aeTables
{
  uint64_t v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  void *v12;
  uint64_t v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  if (result)
  {
    if (*(_BYTE *)(result + 915))
    {
      v1 = 5;
    }
    else
    {
      if (*(_BYTE *)(result + 914))
      {
        v10 = 0u;
        v11 = 0u;
        v8 = 0u;
        v9 = 0u;
        v2 = (void *)objc_msgSend(*(id *)(result + 744), "activeStreams", 0);
        v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v8, v14, 16);
        if (v3)
        {
          v4 = v3;
          v5 = *(_QWORD *)v9;
          v6 = *MEMORY[0x1E0D05A30];
          while (2)
          {
            for (i = 0; i != v4; ++i)
            {
              if (*(_QWORD *)v9 != v5)
                objc_enumerationMutation(v2);
              if ((objc_msgSend((id)objc_msgSend(*(id *)(*((_QWORD *)&v8 + 1) + 8 * i), "portType"), "isEqualToString:", v6) & 1) != 0)
              {
                v1 = 6;
                goto LABEL_17;
              }
            }
            v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v8, v14, 16);
            v1 = 1;
            if (v4)
              continue;
            goto LABEL_17;
          }
        }
      }
      else if (!*(_BYTE *)(result + 913))
      {
        if (*(_BYTE *)(result + 840))
        {
          v1 = 2;
        }
        else
        {
          if (!*(_BYTE *)(result + 912))
            return 0;
          v1 = 3;
        }
        goto LABEL_17;
      }
      v1 = 1;
    }
LABEL_17:
    v12 = &unk_1E49F9258;
    v13 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v1);
    return objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v13, &v12, 1);
  }
  return result;
}

- (void)captureStreamDidStart
{
  -[BWFigVideoCaptureStream _logStreamingPowerEvent:]((uint64_t)self, 1);
}

- (void)_logStreamingPowerEvent:(uint64_t)a1
{
  char v2;
  int v4;
  const void *v5;
  int v6;
  uint64_t v7;
  uint64_t v8;
  float v9;
  int v10;
  const void *v11;
  int v12;
  uint64_t v13;
  uint64_t v14;
  float v15;
  __int128 v16[2];
  int v17;

  if (a1)
  {
    v2 = a2;
    if (a2)
    {
      memset(v16, 0, sizeof(v16));
      v17 = 0;
      LOBYTE(v16[0]) = *(_BYTE *)(a1 + 801);
      DWORD1(v16[0]) = *(_DWORD *)(a1 + 68);
      BYTE8(v16[0]) = *(_BYTE *)(a1 + 796);
      *(__int128 *)((char *)v16 + 12) = *(_OWORD *)(a1 + 916);
      BYTE12(v16[1]) = *(_BYTE *)(a1 + 980);
      *(_WORD *)((char *)&v16[1] + 13) = *(_WORD *)(a1 + 981);
      HIBYTE(v16[1]) = *(_BYTE *)(a1 + 984);
      LOBYTE(v17) = *(_BYTE *)(a1 + 940);
      v4 = *(_DWORD *)(a1 + 360);
      v5 = *(const void **)(a1 + 368);
      v6 = *(_DWORD *)(a1 + 332);
      v7 = *(_QWORD *)(a1 + 32);
      v8 = objc_msgSend(MEMORY[0x1E0C99D68], "date");
      objc_msgSend((id)a1, "averageFrameRate");
      FigCaptureLogCameraStreamingPowerEvent(v4, v5, v6, v2, v7, v8, objc_msgSend((id)a1, "continuityCameraIsWired"), objc_msgSend((id)a1, "isDeskCamActive"), v9, v16);
    }
    else
    {
      v10 = *(_DWORD *)(a1 + 360);
      v11 = *(const void **)(a1 + 368);
      v12 = *(_DWORD *)(a1 + 332);
      v13 = *(_QWORD *)(a1 + 32);
      v14 = objc_msgSend(MEMORY[0x1E0C99D68], "date");
      objc_msgSend((id)a1, "averageFrameRate");
      FigCaptureLogCameraStreamingPowerEvent(v10, v11, v12, v2, v13, v14, objc_msgSend((id)a1, "continuityCameraIsWired"), objc_msgSend((id)a1, "isDeskCamActive"), v15, 0);
    }
  }
}

- (NSString)uniqueID
{
  return (NSString *)self->_lastValidPTS.epoch;
}

- (BOOL)isDeskCamActive
{
  return self->_numberOfBuffersEmitted;
}

- (BOOL)continuityCameraIsWired
{
  return BYTE1(self->_numberOfBuffersEmitted);
}

- (float)averageFrameRate
{
  CGPoint *p_previewShiftAtBaseZoom;
  float v4;
  float Seconds;
  CMTime v7;
  CMTime lhs;
  CMTime time;

  p_previewShiftAtBaseZoom = &self->_previewShiftAtBaseZoom;
  os_unfair_lock_lock((os_unfair_lock_t)&self->_previewShiftAtBaseZoom);
  v4 = 0.0;
  if ((self->_firstValidPTS.epoch & 1) != 0 && (self->_averageFrameRateCalculationLock._os_unfair_lock_opaque & 1) != 0)
  {
    if (HIDWORD(self->_lastValidPTS.value))
    {
      lhs = *(CMTime *)((char *)&self->_firstValidPTS + 4);
      v7 = *(CMTime *)((char *)&self->_previewShiftAtBaseZoom.x + 4);
      CMTimeSubtract(&time, &lhs, &v7);
      Seconds = CMTimeGetSeconds(&time);
      if (Seconds != INFINITY)
        v4 = (float)HIDWORD(self->_lastValidPTS.value) / Seconds;
    }
  }
  os_unfair_lock_unlock((os_unfair_lock_t)p_previewShiftAtBaseZoom);
  if (v4 == INFINITY)
    return 0.0;
  else
    return v4;
}

- (void)setUsesStillFusionReferenceFramePTSForDidCaptureCallback:(BOOL)a3
{
  BYTE4(self->_largestStillImagePTS.epoch) = a3;
}

- (void)setTimeMachineEnabled:(BOOL)a3
{
  if (self->_started)
    objc_exception_throw((id)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99750], CFSTR("Can't invoke timeMachineEnabled: while streaming"), 0));
  self->_timeMachineEnabled = a3;
}

- (void)setCinematicFramingEnabled:(BOOL)a3
{
  _BOOL8 v3;

  v3 = a3;
  LOBYTE(self->_videoCaptureDimensions.height) = a3;
  if (-[NSDictionary objectForKeyedSubscript:](self->_supportedProperties, "objectForKeyedSubscript:", CFSTR("CMIOCinematicFramingEnabled")))
  {
    -[BWFigCaptureStream setPropertyIfSupported:value:](self->_stream, "setPropertyIfSupported:value:", CFSTR("CMIOCinematicFramingEnabled"), objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v3));
  }
}

- (void)setStillImageCaptureEnabled:(BOOL)a3
{
  if (self->_started)
    objc_exception_throw((id)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99750], CFSTR("Can't invoke setStillImageCaptureEnabled: while streaming"), 0));
  LOBYTE(self->_stillImageBufferTimeMachineHandler) = a3;
}

- (void)setReactionsInProgressChangedHandler:(id)a3
{
  -[BWFigCaptureStream setReactionsInProgressChangedHandler:](self->_stream, "setReactionsInProgressChangedHandler:", a3);
}

- (void)setVideoStabilizationStrength:(int)a3
{
  HIDWORD(self->_centerStageRectOfInterest.size.height) = a3;
}

- (void)setDigitalFlashEnabled:(BOOL)a3
{
  LOBYTE(self->_band0StrengthModulation) = a3;
}

- (void)setOverCaptureEnabled:(BOOL)a3
{
  -[BWSphereModeSelector setOverCaptureEnabled:](self->_sphereModeSelector, "setOverCaptureEnabled:", a3);
}

- (void)setEnablesSphereWhenAvailable:(BOOL)a3
{
  -[BWSphereModeSelector setEnablesSphereWhenAvailable:](self->_sphereModeSelector, "setEnablesSphereWhenAvailable:", a3);
  -[BWFigVideoCaptureStream _updateSphereMode]((uint64_t)self);
}

- (void)setUnifiedBracketingEnabled:(BOOL)a3
{
  if (LOBYTE(self->_multiBandNoiseReductionMode) != a3)
    LOBYTE(self->_multiBandNoiseReductionMode) = a3;
}

- (void)setZeroShutterLagEnabled:(BOOL)a3
{
  if (BYTE1(self->_band0StrengthModulation) != a3)
  {
    BYTE1(self->_band0StrengthModulation) = a3;
    -[BWSphereModeSelector setZeroShutterLagEnabled:](self->_sphereModeSelector, "setZeroShutterLagEnabled:");
  }
}

- (void)setCinematicVideoEnabled:(BOOL)a3
{
  *(&self->_maxExposureDurationHasBeenSet + 2) = a3;
}

- (void)setVariableFrameRateVideoEnabled:(BOOL)a3
{
  *(&self->_maxExposureDurationHasBeenSet + 3) = a3;
  -[BWSphereModeSelector setVariableFrameRateVideoEnabled:](self->_sphereModeSelector, "setVariableFrameRateVideoEnabled:");
}

- (void)setStreamingFrameRateForZoomPIPOverlay:(float)a3
{
  self->_averageFrameRate = a3;
}

- (void)setContinuityCameraIsWired:(BOOL)a3
{
  BYTE1(self->_numberOfBuffersEmitted) = a3;
}

- (void)setContinuityCameraClientDeviceClass:(int)a3
{
  HIDWORD(self->_uniqueID) = a3;
}

- (void)willBecomeMasterStream
{
  self->_isSlave = 0;
  -[BWStillImageTimeMachine resume](self->_timeMachine, "resume");
  -[BWFigVideoCaptureStream _updateMasterSlavePropertiesOnStream]((uint64_t)self);
}

- (void)setBaseZoomFactor:(float)a3
{
  self->_baseZoomFactor = a3;
}

- (void)setMaximumFrameRate:(float)a3
{
  int v5;
  double v6;

  v5 = -[BWFigCaptureStream setProperty:value:](self->_stream, "setProperty:value:", CFSTR("MaximumFrameRate"), objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", a3));
  if (v5)
  {
    if (v5 == -12780)
      objc_exception_throw((id)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Can't set max frame rate: because the frame rate is not in range (%d). Use -supportedFormats."), 4294954516), 0));
  }
  else
  {
    self->_maximumFrameRate = a3;
    *(float *)&v6 = a3;
    -[BWSphereModeSelector setMaximumFrameRate:](self->_sphereModeSelector, "setMaximumFrameRate:", v6);
    -[BWFigVideoCaptureStream _updateSphereMode]((uint64_t)self);
  }
}

- (void)_updateSphereMode
{
  void *v2;
  void *v3;
  char v4;

  if (a1)
  {
    v2 = *(void **)(a1 + 440);
    if (!v2)
    {
      v4 = 0;
      goto LABEL_8;
    }
    v3 = (void *)objc_msgSend(v2, "currentSphereMode");
    if ((objc_msgSend(v3, "isEqualToString:", *(_QWORD *)(a1 + 448)) & 1) != 0)
    {
LABEL_6:
      v4 = objc_msgSend(v3, "isEqualToString:", *MEMORY[0x1E0D07A58]) ^ 1;
LABEL_8:
      os_unfair_lock_lock((os_unfair_lock_t)(a1 + 432));
      *(_BYTE *)(a1 + 436) = v4;
      os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 432));
      return;
    }
    if (!objc_msgSend(*(id *)(a1 + 8), "setProperty:value:", *MEMORY[0x1E0D077A0], v3))
    {

      *(_QWORD *)(a1 + 448) = v3;
      goto LABEL_6;
    }
    FigDebugAssert3();
  }
}

- (void)setSphereThermalLevel:(int)a3
{
  -[BWSphereModeSelector setSystemThermalLevel:](self->_sphereModeSelector, "setSystemThermalLevel:", *(_QWORD *)&a3);
  -[BWFigVideoCaptureStream _updateSphereMode]((uint64_t)self);
}

- (OS_tcc_identity)tccIdentity
{
  return self->_tccIdentity;
}

- (NSString)mediaEnvironment
{
  return self->_mediaEnvironment;
}

- (void)setHighlightRecoverySuspended:(BOOL)a3
{
  _BOOL8 v5;

  if (BYTE4(self->_keypointDetectionConfiguration))
    v5 = !a3;
  else
    v5 = 0;
  if (!-[BWFigCaptureStream setPropertyIfSupported:value:](self->_stream, "setPropertyIfSupported:value:", *MEMORY[0x1E0D07570], objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v5)))BYTE3(self->_keypointDetectionConfiguration) = a3;
}

- (float)maxEIT
{
  int64_t v3;
  int32_t maximumSupportedFrameRate;
  _BYTE v6[64];

  memset(&v6[32], 0, 24);
  if (!self || (-[BWFigVideoCaptureStream maxExposureDuration](self, "maxExposureDuration"), (v6[44] & 1) == 0))
  {
    if (self->_started)
    {
      v3 = (int)objc_msgSend(-[BWFigCaptureStream getProperty:error:](self->_stream, "getProperty:error:", *MEMORY[0x1E0D07688], 0), "intValue");
      maximumSupportedFrameRate = 1000;
    }
    else
    {
      maximumSupportedFrameRate = (int)self->_maximumSupportedFrameRate;
      v3 = 1;
    }
    CMTimeMake((CMTime *)v6, v3, maximumSupportedFrameRate);
    *(CMTime *)&v6[32] = *(CMTime *)v6;
  }
  *(CMTime *)v6 = *(CMTime *)&v6[32];
  return CMTimeGetSeconds((CMTime *)v6) * *(float *)&self->_maxExposureDurationFrameworkOverride.epoch;
}

- (BOOL)started
{
  return self->_started;
}

- (uint64_t)_updateSuspendStateForInfraredDepthStream
{
  _DWORD *v1;
  unsigned int v2;
  uint64_t v3;

  if (result)
  {
    v1 = (_DWORD *)result;
    v2 = objc_msgSend((id)objc_msgSend(*(id *)(result + 8), "getPropertyIfSupported:error:", *MEMORY[0x1E0D077C0], 0), "BOOLValue") ^ 1;
    if (v1[188] == 0x7FFFFFFF)
      v3 = v2;
    else
      v3 = 0;
    return objc_msgSend(v1, "setSuspended:", v3);
  }
  return result;
}

- (int)setSuspended:(BOOL)a3
{
  _BOOL4 v3;
  uint64_t v5;
  id v6;
  void *v7;
  NSDictionary *v8;
  NSArray *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  id v17;
  uint64_t deviceType;
  int64_t epoch;
  OS_tcc_identity *tccIdentity;
  NSString *mediaEnvironment;
  __int128 v22;
  _BOOL4 clientProcessHasAccessToCamera;
  id v24;
  uint64_t v25;
  int64_t v26;
  OS_tcc_identity *v27;
  NSString *v28;
  __int128 v29;
  uint64_t v31;
  _BOOL4 v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  int v42;
  _BYTE v43[128];
  uint64_t v44;

  v3 = a3;
  v44 = *MEMORY[0x1E0C80C00];
  v42 = 0;
  if (!-[BWFigVideoCaptureStream suspendingSupported](self, "suspendingSupported"))
  {
    FigDebugAssert3();
    return -12782;
  }
  if (self->_suspended != v3)
  {
    if (self->_started)
    {
      v5 = *(_QWORD *)&self->_faceAndObjectDetectionLock._os_unfair_lock_opaque;
      if (v3)
      {

        self->_cachedVideoOutputsEnabled = (NSDictionary *)-[BWFigCaptureStream copyProperty:error:](self->_stream, "copyProperty:error:", *MEMORY[0x1E0D078A8], &v42);
        if (!v42)
        {
          v6 = -[BWFigCaptureStream getProperty:error:](self->_stream, "getProperty:error:", *MEMORY[0x1E0D07888], &v42);
          if (!v42)
          {
            v7 = v6;
            v31 = v5;
            v32 = v3;
            v8 = (NSDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
            v38 = 0u;
            v39 = 0u;
            v40 = 0u;
            v41 = 0u;
            v9 = -[NSDictionary allKeys](self->_cachedVideoOutputsEnabled, "allKeys");
            v10 = -[NSArray countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v38, v43, 16);
            if (v10)
            {
              v11 = v10;
              v12 = *(_QWORD *)v39;
              v13 = *MEMORY[0x1E0D07F68];
              v14 = *MEMORY[0x1E0D08000];
              v35 = *MEMORY[0x1E0D07F90];
              v34 = *MEMORY[0x1E0D07F40];
              v33 = *MEMORY[0x1E0D07F20];
              do
              {
                for (i = 0; i != v11; ++i)
                {
                  if (*(_QWORD *)v39 != v12)
                    objc_enumerationMutation(v9);
                  v16 = *(void **)(*((_QWORD *)&v38 + 1) + 8 * i);
                  if (objc_msgSend(-[NSDictionary objectForKeyedSubscript:](self->_cachedVideoOutputsEnabled, "objectForKeyedSubscript:", v16), "BOOLValue"))
                  {
                    -[NSDictionary setObject:forKeyedSubscript:](v8, "setObject:forKeyedSubscript:", (id)objc_msgSend((id)objc_msgSend(v7, "objectForKeyedSubscript:", v16), "mutableCopy"), v16);
                    objc_msgSend(-[NSDictionary objectForKeyedSubscript:](v8, "objectForKeyedSubscript:", v16), "setObject:forKeyedSubscript:", 0, v13);
                    if (objc_msgSend(v16, "isEqualToString:", v14))
                    {
                      objc_msgSend(-[NSDictionary objectForKeyedSubscript:](v8, "objectForKeyedSubscript:", v16), "setObject:forKeyedSubscript:", 0, v35);
                      objc_msgSend(-[NSDictionary objectForKeyedSubscript:](v8, "objectForKeyedSubscript:", v16), "setObject:forKeyedSubscript:", 0, v34);
                      objc_msgSend(-[NSDictionary objectForKeyedSubscript:](v8, "objectForKeyedSubscript:", v16), "setObject:forKeyedSubscript:", 0, v33);
                    }
                  }
                }
                v11 = -[NSArray countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v38, v43, 16);
              }
              while (v11);
            }

            self->_cachedVideoOutputConfigurations = v8;
            if (!v31)
              -[BWFigVideoCaptureStreamDelegate captureStreamWillStopStreaming:](self->_delegate, "captureStreamWillStopStreaming:", self);
            v42 = -[BWFigCaptureStream stop](self->_stream, "stop");
            v3 = v32;
            if (!v42)
            {
              if (!v31)
                -[BWFigVideoCaptureStreamDelegate captureStreamDidStopStreaming:](self->_delegate, "captureStreamDidStopStreaming:", self);
              self->_streamHasBeenSuspended = 1;
              goto LABEL_31;
            }
          }
        }
LABEL_39:
        FigDebugAssert3();
        return v42;
      }
      if (self->_streamHasBeenSuspended)
      {
        v42 = -[BWFigCaptureStream setProperty:value:](self->_stream, "setProperty:value:", *MEMORY[0x1E0D07888], self->_cachedVideoOutputConfigurations);
        if (v42)
          goto LABEL_39;
        v42 = -[BWFigCaptureStream setProperty:value:](self->_stream, "setProperty:value:", *MEMORY[0x1E0D078A8], self->_cachedVideoOutputsEnabled);
        if (v42)
          goto LABEL_39;
      }
      if (v5)
      {
        v42 = -[BWFigVideoCaptureStream start](self, "start");
        if (v42)
          goto LABEL_39;
      }
      else
      {
        -[BWFigVideoCaptureStreamDelegate captureStreamWillStartStreaming:](self->_delegate, "captureStreamWillStartStreaming:", self);
        v42 = -[BWFigVideoCaptureStream start](self, "start");
        if (v42)
          goto LABEL_39;
        -[BWFigVideoCaptureStreamDelegate captureStreamDidStartStreaming:](self->_delegate, "captureStreamDidStartStreaming:", self);
      }
    }
LABEL_31:
    os_unfair_lock_lock(&self->_streamStateLock);
    if (self->_started)
    {
      if (v3)
      {
        v17 = +[BWCameraStreamingMonitor sharedCameraStreamingMonitor](BWCameraStreamingMonitor, "sharedCameraStreamingMonitor");
        deviceType = self->_deviceType;
        epoch = self->_lastValidPTS.epoch;
        tccIdentity = self->_tccIdentity;
        mediaEnvironment = self->_mediaEnvironment;
        v22 = *(_OWORD *)&self->_clientAuditToken.val[4];
        v36 = *(_OWORD *)self->_clientAuditToken.val;
        v37 = v22;
        objc_msgSend(v17, "setStreaming:deviceType:streamUniqueID:clientAuditToken:tccIdentity:mediaEnvironment:completionHandler:", 0, deviceType, epoch, &v36, tccIdentity, mediaEnvironment, 0);
      }
      else
      {
        os_unfair_lock_lock(&self->_cameraAccessLock);
        clientProcessHasAccessToCamera = self->_clientProcessHasAccessToCamera;
        os_unfair_lock_unlock(&self->_cameraAccessLock);
        if (clientProcessHasAccessToCamera)
        {
          v24 = +[BWCameraStreamingMonitor sharedCameraStreamingMonitor](BWCameraStreamingMonitor, "sharedCameraStreamingMonitor");
          v25 = self->_deviceType;
          v26 = self->_lastValidPTS.epoch;
          v27 = self->_tccIdentity;
          v28 = self->_mediaEnvironment;
          v29 = *(_OWORD *)&self->_clientAuditToken.val[4];
          v36 = *(_OWORD *)self->_clientAuditToken.val;
          v37 = v29;
          objc_msgSend(v24, "setStreaming:deviceType:streamUniqueID:clientAuditToken:tccIdentity:mediaEnvironment:completionHandler:", 1, v25, v26, &v36, v27, v28, 0);
        }
      }
    }
    self->_suspended = v3;
    os_unfair_lock_unlock(&self->_streamStateLock);
  }
  return v42;
}

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    FigNote_AllowInternalDefaultLogs();
    fig_note_initialize_category_with_default_work_cf();
    fig_note_initialize_category_with_default_work_cf();
  }
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)BWFigVideoCaptureStream;
  -[BWFigVideoCaptureStream dealloc](&v3, sel_dealloc);
}

- (NSString)description
{
  void *v3;
  uint64_t v4;
  const char *v5;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = objc_opt_class();
  return (NSString *)objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p> %@"), v4, self, BWPortTypeToDisplayString(self->_portType, v5));
}

- (void)captureStreamDidStop
{
  -[BWFigVideoCaptureStream _logStreamingPowerEvent:]((uint64_t)self, 0);
}

- (void)updateClientAuditToken:(id *)a3
{
  os_unfair_lock_s *p_streamStateLock;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  id v10;
  uint64_t deviceType;
  int64_t epoch;
  OS_tcc_identity *tccIdentity;
  NSString *mediaEnvironment;
  id v15;
  uint64_t v16;
  int64_t v17;
  OS_tcc_identity *v18;
  NSString *v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  p_streamStateLock = &self->_streamStateLock;
  os_unfair_lock_lock(&self->_streamStateLock);
  v6 = *(_OWORD *)&self->_clientAuditToken.val[4];
  v24 = *(_OWORD *)self->_clientAuditToken.val;
  v25 = v6;
  v7 = *(_OWORD *)&a3->var0[4];
  *(_OWORD *)self->_clientAuditToken.val = *(_OWORD *)a3->var0;
  *(_OWORD *)&self->_clientAuditToken.val[4] = v7;
  v8 = *(_OWORD *)&a3->var0[4];
  v22 = *(_OWORD *)a3->var0;
  v23 = v8;
  self->_clientPID = FigCaptureGetPIDFromAuditToken(&v22);
  v9 = *(_OWORD *)&self->_clientAuditToken.val[4];
  v22 = *(_OWORD *)self->_clientAuditToken.val;
  v23 = v9;
  if (self->_started && !self->_suspended)
  {
    v10 = +[BWCameraStreamingMonitor sharedCameraStreamingMonitor](BWCameraStreamingMonitor, "sharedCameraStreamingMonitor");
    deviceType = self->_deviceType;
    epoch = self->_lastValidPTS.epoch;
    tccIdentity = self->_tccIdentity;
    mediaEnvironment = self->_mediaEnvironment;
    v20 = v22;
    v21 = v23;
    objc_msgSend(v10, "setStreaming:deviceType:streamUniqueID:clientAuditToken:tccIdentity:mediaEnvironment:completionHandler:", 1, deviceType, epoch, &v20, tccIdentity, mediaEnvironment, 0);
    v15 = +[BWCameraStreamingMonitor sharedCameraStreamingMonitor](BWCameraStreamingMonitor, "sharedCameraStreamingMonitor");
    v16 = self->_deviceType;
    v17 = self->_lastValidPTS.epoch;
    v18 = self->_tccIdentity;
    v19 = self->_mediaEnvironment;
    v20 = v24;
    v21 = v25;
    objc_msgSend(v15, "setStreaming:deviceType:streamUniqueID:clientAuditToken:tccIdentity:mediaEnvironment:completionHandler:", 0, v16, v17, &v20, v18, v19, 0);
  }
  os_unfair_lock_unlock(p_streamStateLock);
}

- (float)exifFocalLengthMultiplier
{
  return self->_exifFocalLengthMultiplier;
}

- (uint64_t)_activeFormatIndexWithNondisruptiveSwitching
{
  os_unfair_lock_s *v2;
  uint64_t os_unfair_lock_opaque;

  if (!a1)
    return 0;
  v2 = a1 + 29;
  os_unfair_lock_lock(a1 + 29);
  os_unfair_lock_opaque = a1[30]._os_unfair_lock_opaque;
  if ((os_unfair_lock_opaque & 0x80000000) != 0)
    os_unfair_lock_opaque = a1[28]._os_unfair_lock_opaque;
  os_unfair_lock_unlock(v2);
  return os_unfair_lock_opaque;
}

- (int)setActiveNondisruptiveSwitchingFormatIndex:(int)a3 maximumAllowedFrameRate:(int)a4 minimumFrameRate:(int)a5 maximumFrameRate:(int)a6
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  int fastSwitchingMainFormatIndex;
  unsigned int activeFormatIndex;
  int activeNondisruptiveSwitchingFormatIndex;
  int activeFastSwitchingMainFormatIndex;
  int v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  int v23;
  id v24;
  int v25;
  NSObject *v26;
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  CGPoint v29;

  if (self->_activeFormatIndex < 0)
    return -12782;
  v6 = *(_QWORD *)&a6;
  v7 = *(_QWORD *)&a5;
  v8 = *(_QWORD *)&a4;
  v9 = *(_QWORD *)&a3;
  if (a3 > -2)
  {
    os_unfair_lock_lock(&self->_activeNondisruptiveSwitchingFormatIndexLock);
    if ((_DWORD)v9 == -1)
    {
      fastSwitchingMainFormatIndex = self->_fastSwitchingMainFormatIndex;
      if (fastSwitchingMainFormatIndex < 0)
      {
        v9 = 0xFFFFFFFFLL;
      }
      else
      {
        activeFormatIndex = self->_activeFormatIndex;
        if (fastSwitchingMainFormatIndex == activeFormatIndex)
          v9 = 0xFFFFFFFFLL;
        else
          v9 = activeFormatIndex;
      }
    }
  }
  else
  {
    if (-[NSArray count](self->_supportedFormats, "count") <= a3)
      objc_exception_throw((id)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99858], CFSTR("Can't set active nondisruptive switching format index: because the specified format is outside the supported format range. Use -supportedNondisruptiveSwitchingFormats."), 0));
    os_unfair_lock_lock(&self->_activeNondisruptiveSwitchingFormatIndexLock);
  }
  activeNondisruptiveSwitchingFormatIndex = self->_activeNondisruptiveSwitchingFormatIndex;
  if ((_DWORD)v9 == activeNondisruptiveSwitchingFormatIndex)
    goto LABEL_16;
  if (activeNondisruptiveSwitchingFormatIndex != -1)
    goto LABEL_17;
  activeFastSwitchingMainFormatIndex = self->_activeFastSwitchingMainFormatIndex;
  if (activeFastSwitchingMainFormatIndex < 0)
    activeFastSwitchingMainFormatIndex = self->_activeFormatIndex;
  if ((_DWORD)v9 == activeFastSwitchingMainFormatIndex)
  {
LABEL_16:
    v15 = 0;
  }
  else
  {
LABEL_17:
    if ((_DWORD)v9 == -1)
      v16 = *MEMORY[0x1E0C9B0D0];
    else
      v16 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v9);
    v17 = (self->_activeNondisruptiveSwitchingCommandID + 1);
    v18 = (void *)objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    objc_msgSend(v18, "setObject:forKeyedSubscript:", v16, *MEMORY[0x1E0D05B00]);
    v19 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v17);
    objc_msgSend(v18, "setObject:forKeyedSubscript:", v19, *MEMORY[0x1E0D05AD0]);
    if ((_DWORD)v8 && (_DWORD)v7 && (_DWORD)v6)
    {
      v20 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v8);
      objc_msgSend(v18, "setObject:forKeyedSubscript:", v20, *MEMORY[0x1E0D05B38]);
      v21 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v7);
      objc_msgSend(v18, "setObject:forKeyedSubscript:", v21, *MEMORY[0x1E0D05B48]);
      v22 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v6);
      objc_msgSend(v18, "setObject:forKeyedSubscript:", v22, *MEMORY[0x1E0D05B40]);
    }
    v23 = v9;
    if ((_DWORD)v9 == -1)
      v23 = self->_activeFormatIndex;
    v24 = -[NSArray objectAtIndexedSubscript:](self->_supportedFormats, "objectAtIndexedSubscript:", v23);
    if (objc_msgSend((id)objc_msgSend(v24, "objectForKeyedSubscript:", *MEMORY[0x1E0D07EB0]), "BOOLValue"))
    {
      v29.x = FigCaptureMetadataUtilitiesDenormalizePoint(self->_previewShift.x, self->_previewShift.y, (double)self->_sensorDimensions.height);
      objc_msgSend(v18, "setObject:forKeyedSubscript:", CGPointCreateDictionaryRepresentation(v29), *MEMORY[0x1E0D05B70]);
    }
    v25 = -[BWFigCaptureStream setProperty:value:](self->_stream, "setProperty:value:", *MEMORY[0x1E0D076E0], v18);
    if (v25)
    {
      v15 = v25;
      FigDebugAssert3();
      os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
      fig_log_call_emit_and_clean_up_after_send_and_compose();
    }
    else
    {
      if (dword_1ECFE9490)
      {
        v26 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
        os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT);
        fig_log_call_emit_and_clean_up_after_send_and_compose();
      }
      v15 = 0;
      self->_activeNondisruptiveSwitchingFormatIndex = v9;
      self->_activeNondisruptiveSwitchingCommandID = v17;
    }
  }
  os_unfair_lock_unlock(&self->_activeNondisruptiveSwitchingFormatIndexLock);
  return v15;
}

- (int)synchronizedStreamsGroupDidUpdateActiveNondisruptiveSwitchingFormatIndex:(int)a3 activeNondisruptiveSwitchingCommandID:(int)a4 maximumAllowedFrameRate:(int)a5 minimumFrameRate:(int)a6 maximumFrameRate:(int)a7
{
  os_unfair_lock_s *p_activeNondisruptiveSwitchingFormatIndexLock;
  int result;

  if (self->_activeFormatIndex < 0)
    return -12782;
  p_activeNondisruptiveSwitchingFormatIndexLock = &self->_activeNondisruptiveSwitchingFormatIndexLock;
  os_unfair_lock_lock(&self->_activeNondisruptiveSwitchingFormatIndexLock);
  self->_activeNondisruptiveSwitchingFormatIndex = a3;
  self->_activeNondisruptiveSwitchingCommandID = a4;
  os_unfair_lock_unlock(p_activeNondisruptiveSwitchingFormatIndexLock);
  result = 0;
  if (a5 && a6 && a7)
  {
    result = -[BWFigVideoCaptureStream isNondisruptiveFastSwitchingSupported](self, "isNondisruptiveFastSwitchingSupported");
    if (result)
    {
      result = 0;
      self->_maximumSupportedFrameRate = (float)a5;
      self->_minimumFrameRate = (float)a6;
      self->_maximumFrameRate = (float)a7;
    }
  }
  return result;
}

- (int)activeNondisruptiveSwitchingFormatIndex
{
  BWFigVideoCaptureStream *v2;
  os_unfair_lock_s *p_activeNondisruptiveSwitchingFormatIndexLock;

  v2 = self;
  p_activeNondisruptiveSwitchingFormatIndexLock = &self->_activeNondisruptiveSwitchingFormatIndexLock;
  os_unfair_lock_lock(&self->_activeNondisruptiveSwitchingFormatIndexLock);
  LODWORD(v2) = v2->_activeNondisruptiveSwitchingFormatIndex;
  os_unfair_lock_unlock(p_activeNondisruptiveSwitchingFormatIndexLock);
  return (int)v2;
}

- ($2825F4736939C4A6D3AD43837233062D)activeSensorDimensions
{
  unsigned int v3;
  id v4;
  float aeMaxGain;
  uint64_t momentCaptureVideoRecordingAEMaxGain_low;

  v3 = -[BWFigVideoCaptureStream activeNondisruptiveSwitchingFormatIndex](self, "activeNondisruptiveSwitchingFormatIndex");
  if ((v3 & 0x80000000) != 0)
  {
    aeMaxGain = self->_aeMaxGain;
    momentCaptureVideoRecordingAEMaxGain_low = LODWORD(self->_momentCaptureVideoRecordingAEMaxGain);
  }
  else
  {
    v4 = -[NSArray objectAtIndexedSubscript:](self->_supportedFormats, "objectAtIndexedSubscript:", v3);
    LODWORD(aeMaxGain) = objc_msgSend((id)objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x1E0D07ED0]), "intValue");
    momentCaptureVideoRecordingAEMaxGain_low = objc_msgSend((id)objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x1E0D07EC8]), "intValue");
  }
  return ($2825F4736939C4A6D3AD43837233062D)(LODWORD(aeMaxGain) | (unint64_t)(momentCaptureVideoRecordingAEMaxGain_low << 32));
}

- (void)setMaximumFrameRateForSensorRawOutputBufferPoolRequirements:(float)a3
{
  -[BWFigCaptureStream setPropertyIfSupported:value:](self->_stream, "setPropertyIfSupported:value:", *MEMORY[0x1E0D07698], objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:"));
  self->_maximumFrameRateForSensorRawOutputBufferPoolRequirements = a3;
}

- (float)maximumFrameRateForSensorRawOutputBufferPoolRequirements
{
  return self->_maximumFrameRateForSensorRawOutputBufferPoolRequirements;
}

- (BOOL)rawBufferCompandingEnabled
{
  return self->_rawBufferCompandingEnabled;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)updateMaxExposureDurationClientOverride:(SEL)a3
{
  $3CC8671D27C23BF42ADDB32F2B5E48AE *v6;
  unsigned int *p_var2;
  __int128 v8;
  uint64_t v9;
  CMTime v10;
  CMTime time1;

  if (LOBYTE(self[1].var0)
    && (v6 = self,
        p_var2 = &self[35].var2,
        time1 = *(CMTime *)a4,
        v10 = *(CMTime *)((char *)self + 852),
        self = ($3CC8671D27C23BF42ADDB32F2B5E48AE *)CMTimeCompare(&time1, &v10),
        (_DWORD)self))
  {
    v8 = *(_OWORD *)&a4->var0;
    *((_QWORD *)p_var2 + 2) = a4->var3;
    *(_OWORD *)p_var2 = v8;
    *(_QWORD *)&retstr->var1 = 0;
    retstr->var3 = 0;
    retstr->var0 = 0;
    -[$3CC8671D27C23BF42ADDB32F2B5E48AE maxExposureDuration](v6, "maxExposureDuration");
    return ($3CC8671D27C23BF42ADDB32F2B5E48AE *)-[BWFigVideoCaptureStream _setMaxExposureDuration:]((id *)v6, &time1, *(double *)&retstr->var0);
  }
  else
  {
    v9 = MEMORY[0x1E0CA2E10];
    *(_OWORD *)&retstr->var0 = *MEMORY[0x1E0CA2E10];
    retstr->var3 = *(_QWORD *)(v9 + 16);
  }
  return self;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)updateMaxExposureDuration
{
  id *v3;
  CMTime v5;

  retstr->var0 = 0;
  *(_QWORD *)&retstr->var1 = 0;
  retstr->var3 = 0;
  if (self)
  {
    v3 = (id *)self;
    -[$3CC8671D27C23BF42ADDB32F2B5E48AE maxExposureDuration](self, "maxExposureDuration");
    return ($3CC8671D27C23BF42ADDB32F2B5E48AE *)-[BWFigVideoCaptureStream _setMaxExposureDuration:](v3, &v5, *(double *)&retstr->var0);
  }
  return self;
}

- (void)setTemporalNoiseReductionConfigurationBand0Enabled:(BOOL)a3 rawEnabled:(BOOL)a4 modulation:(int)a5 adaptiveOverscanEnabled:(BOOL)a6 strengthHighEnabled:(BOOL)a7
{
  _BOOL8 v7;
  _BOOL8 v8;
  uint64_t v9;
  _BOOL8 v10;
  _BOOL8 v11;
  NSDictionary *v13;
  uint64_t v14;
  id v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  int v22;
  FigCaptureCameraParameters *v23;
  NSDictionary *v24;
  int height_high;
  __CFString *v26;
  __CFString *v27;
  id v28;
  uint64_t v29;
  void *v30;
  int v31;
  int v32;
  int v33;
  int v34;
  double v35;
  double v36;
  uint64_t v37;
  _QWORD v38[2];
  _QWORD v39[3];

  v7 = a7;
  v8 = a6;
  v9 = *(_QWORD *)&a5;
  v10 = a4;
  v11 = a3;
  v39[2] = *MEMORY[0x1E0C80C00];
  v13 = -[BWFigCaptureStream supportedProperties](self->_stream, "supportedProperties");
  v14 = *MEMORY[0x1E0D077F0];
  if (-[NSDictionary objectForKeyedSubscript:](v13, "objectForKeyedSubscript:", *MEMORY[0x1E0D077F0]))
  {
    v15 = -[BWFigCaptureStream getProperty:error:](self->_stream, "getProperty:error:", v14, 0);
    v16 = (void *)objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v17 = *MEMORY[0x1E0D07CD8];
    if (objc_msgSend(v15, "containsObject:", *MEMORY[0x1E0D07CD8]))
      objc_msgSend(v16, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v11), v17);
    v18 = *MEMORY[0x1E0D07CF8];
    if (objc_msgSend(v15, "containsObject:", *MEMORY[0x1E0D07CF8]))
      objc_msgSend(v16, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v10), v18);
    v19 = *MEMORY[0x1E0D07D00];
    if (objc_msgSend(v15, "containsObject:", *MEMORY[0x1E0D07D00]))
      objc_msgSend(v16, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v7), v19);
    v20 = *MEMORY[0x1E0D07CE0];
    if (objc_msgSend(v15, "containsObject:", *MEMORY[0x1E0D07CE0]))
      objc_msgSend(v16, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v9), v20);
    v21 = *MEMORY[0x1E0D07CE8];
    v22 = objc_msgSend(v15, "containsObject:", *MEMORY[0x1E0D07CE8]);
    if ((_DWORD)v9)
    {
      if (v22)
      {
        v23 = +[FigCaptureCameraParameters sharedInstance](FigCaptureCameraParameters, "sharedInstance");
        v24 = -[NSDictionary objectForKeyedSubscript:](self->_sensorIDDictionary, "objectForKeyedSubscript:", CFSTR("TemporalNoiseReductionParameters"));
        if (v24
          || (v24 = -[FigCaptureCameraParameters temporalNoiseReductionParameters](v23, "temporalNoiseReductionParameters")) != 0)
        {
          height_high = HIDWORD(self->_centerStageRectOfInterest.size.height);
          v26 = height_high <= 2
              ? CFSTR("Band0StrengthModulationEnterThreshold")
              : CFSTR("ActionCamBand0StrengthModulationEnterThreshold");
          v27 = height_high <= 2
              ? CFSTR("Band0StrengthModulationExitThreshold")
              : CFSTR("ActionCamBand0StrengthModulationExitThreshold");
          v28 = -[NSDictionary objectForKeyedSubscript:](v24, "objectForKeyedSubscript:", v26);
          v29 = -[NSDictionary objectForKeyedSubscript:](v24, "objectForKeyedSubscript:", v27);
          if (v29)
          {
            if (v28)
            {
              v30 = (void *)v29;
              objc_msgSend(v28, "floatValue");
              v32 = v31;
              objc_msgSend(v30, "floatValue");
              v34 = v33;
              v38[0] = *MEMORY[0x1E0D07CC8];
              LODWORD(v35) = v32;
              v39[0] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v35);
              v38[1] = *MEMORY[0x1E0D07CD0];
              LODWORD(v36) = v34;
              v39[1] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v36);
              objc_msgSend(v16, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v39, v38, 2), v21);
            }
          }
        }
      }
    }
    v37 = *MEMORY[0x1E0D07CF0];
    if (objc_msgSend(v15, "containsObject:", *MEMORY[0x1E0D07CF0]))
      objc_msgSend(v16, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v8), v37);
    if (!-[BWFigCaptureStream setProperty:value:](self->_stream, "setProperty:value:", *MEMORY[0x1E0D077E8], v16))
      HIDWORD(self->_stillImageNoiseAndSharpeningParameters) = v9;
  }
}

- (__CFString)currentSphereMode
{
  return -[BWSphereModeSelector currentSphereMode](self->_sphereModeSelector, "currentSphereMode");
}

- (BOOL)avoidsSphereRecentering
{
  return -[BWSphereModeSelector avoidsSphereRecentering](self->_sphereModeSelector, "avoidsSphereRecentering");
}

- (BOOL)sphereVideoEnabled
{
  return -[BWSphereModeSelector sphereVideoEnabled](self->_sphereModeSelector, "sphereVideoEnabled");
}

- (BOOL)depthDataDeliveryEnabled
{
  return -[BWSphereModeSelector depthDataDeliveryEnabled](self->_sphereModeSelector, "depthDataDeliveryEnabled");
}

- (BOOL)motionDataDeliveryEnabled
{
  return self->_motionDataDeliveryEnabled == 1;
}

- (BOOL)motionDataInvalid
{
  BWFigVideoCaptureStream *v2;
  os_unfair_lock_s *p_sphereLock;

  v2 = self;
  p_sphereLock = &self->_sphereLock;
  os_unfair_lock_lock(&self->_sphereLock);
  LOBYTE(v2) = v2->_motionDataInvalid;
  os_unfair_lock_unlock(p_sphereLock);
  return (char)v2;
}

- (int)sphereThermalLevel
{
  return -[BWSphereModeSelector systemThermalLevel](self->_sphereModeSelector, "systemThermalLevel");
}

- (void)setIsStationary:(BOOL)a3
{
  BWSphereModeSelector *sphereModeSelector;
  _BOOL8 v5;

  self->_isStationary = a3;
  sphereModeSelector = self->_sphereModeSelector;
  if (sphereModeSelector)
  {
    v5 = a3;
    if (-[BWSphereModeSelector tripodModeEnabled](sphereModeSelector, "tripodModeEnabled") != a3)
    {
      -[BWSphereModeSelector setTripodModeEnabled:](self->_sphereModeSelector, "setTripodModeEnabled:", v5);
      -[BWFigVideoCaptureStream _updateSphereMode]((uint64_t)self);
    }
  }
}

- (BOOL)isStationary
{
  return self->_isStationary;
}

- (BOOL)faceDetectionEnabled
{
  return (BOOL)self->_faceDetectionConfiguration;
}

- (BOOL)eyeDetectionRequired
{
  return BYTE1(self->_faceDetectionConfiguration);
}

- (NSDictionary)faceDetectionConfiguration
{
  NSNumber **p_lastFaceDetectionEnabled;
  NSDictionary *v4;

  p_lastFaceDetectionEnabled = &self->_lastFaceDetectionEnabled;
  os_unfair_lock_lock((os_unfair_lock_t)&self->_lastFaceDetectionEnabled);
  v4 = (NSDictionary *)(id)objc_msgSend(*(id *)&self->_objectDetectionStartupDeferred, "copy");
  os_unfair_lock_unlock((os_unfair_lock_t)p_lastFaceDetectionEnabled);
  return v4;
}

- (NSSet)detectedObjectTypes
{
  return (NSSet *)(id)objc_msgSend(*(id *)&self->_lastDigitalFlashSphereOffsetOpticalCenter.y, "copy");
}

- (BOOL)objectDetectionStartupDeferred
{
  return (BOOL)self->_detectedObjectTypes;
}

- (void)_captureStreamFaceDetectionConfiguration
{
  void *v2;
  uint64_t v3;
  _BOOL4 v4;
  uint64_t v5;
  int v6;
  void *v7;
  uint64_t v8;
  int v9;
  int v10;
  uint64_t v11;

  if (!a1)
    return 0;
  v2 = (void *)objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = *MEMORY[0x1E0D06520];
  v4 = (objc_msgSend((id)objc_msgSend(*(id *)(a1 + 696), "objectForKeyedSubscript:", *MEMORY[0x1E0D06520]), "BOOLValue") & 1) == 0
    && *(_BYTE *)(a1 + 705) == 0;
  v5 = *MEMORY[0x1E0D06518];
  v6 = objc_msgSend((id)objc_msgSend(*(id *)(a1 + 696), "objectForKeyedSubscript:", *MEMORY[0x1E0D06518]), "BOOLValue");
  v7 = *(void **)(a1 + 696);
  v8 = *MEMORY[0x1E0D06530];
  v9 = objc_msgSend((id)objc_msgSend(v7, "objectForKeyedSubscript:", *MEMORY[0x1E0D06530]), "BOOLValue");
  v10 = v9;
  if (v4)
  {
    if (!v9)
      goto LABEL_7;
LABEL_10:
    objc_msgSend(v2, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], v8);
    if (v6)
      goto LABEL_8;
    goto LABEL_11;
  }
  objc_msgSend(v2, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], v3);
  if (v10)
    goto LABEL_10;
LABEL_7:
  if (v6)
  {
LABEL_8:
    objc_msgSend(v2, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], v5);
LABEL_12:
    v11 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", 6);
    objc_msgSend(v2, "setObject:forKeyedSubscript:", v11, *MEMORY[0x1E0D06528]);
    return v2;
  }
LABEL_11:
  if ((!v4 | v10) == 1)
    goto LABEL_12;
  return v2;
}

- (int)stop
{
  int v3;
  uint64_t v4;

  v3 = objc_msgSend(*(id *)&self->_faceAndObjectDetectionLock._os_unfair_lock_opaque, "stopSupported");
  v4 = 8;
  if (v3)
    v4 = 744;
  return objc_msgSend(*(id *)((char *)&self->super.isa + v4), "stop");
}

- (void)sourceNodeFailedToStartStreaming
{
  -[BWFigVideoCaptureStreamDelegate captureStreamFailedToStartStreaming:](self->_delegate, "captureStreamFailedToStartStreaming:", self);
}

- (void)sourceNodeWillStopStreaming
{
  os_unfair_lock_s *p_streamStateLock;
  id v4;
  uint64_t deviceType;
  int64_t epoch;
  OS_tcc_identity *tccIdentity;
  NSString *mediaEnvironment;
  __int128 v9;
  _OWORD v10[2];

  p_streamStateLock = &self->_streamStateLock;
  os_unfair_lock_lock(&self->_streamStateLock);
  if (!self->_suspended)
  {
    v4 = +[BWCameraStreamingMonitor sharedCameraStreamingMonitor](BWCameraStreamingMonitor, "sharedCameraStreamingMonitor");
    deviceType = self->_deviceType;
    epoch = self->_lastValidPTS.epoch;
    tccIdentity = self->_tccIdentity;
    mediaEnvironment = self->_mediaEnvironment;
    v9 = *(_OWORD *)&self->_clientAuditToken.val[4];
    v10[0] = *(_OWORD *)self->_clientAuditToken.val;
    v10[1] = v9;
    objc_msgSend(v4, "setStreaming:deviceType:streamUniqueID:clientAuditToken:tccIdentity:mediaEnvironment:completionHandler:", 0, deviceType, epoch, v10, tccIdentity, mediaEnvironment, 0);
  }
  os_unfair_lock_unlock(p_streamStateLock);
  -[BWFigVideoCaptureStreamDelegate captureStreamWillStopStreaming:](self->_delegate, "captureStreamWillStopStreaming:", self);
}

- (void)sourceNodeDidStopStreaming:(BOOL)a3
{
  NSObject *stillImageCaptureDelegate;
  BWFigVideoCaptureStreamStillImageCaptureDelegate *v6;

  self->_started = 0;

  self->_timeMachine = 0;
  if (LOBYTE(self->_stillImageBufferTimeMachineHandler))
  {
    -[BWFigVideoCaptureStream _resetStillImageCaptureState]((uint64_t)self);
    -[BWFigCaptureStream unregisterForNotification:listener:](self->_stream, "unregisterForNotification:listener:", *MEMORY[0x1E0D07008], self);
    -[BWFigCaptureStream unregisterForNotification:listener:](self->_stream, "unregisterForNotification:listener:", *MEMORY[0x1E0D06FE8], self);
    -[BWFigCaptureStream unregisterForNotification:listener:](self->_stream, "unregisterForNotification:listener:", *MEMORY[0x1E0D07018], self);
    stillImageCaptureDelegate = self->_stillImageCaptureDelegate;
    if (stillImageCaptureDelegate)
    {
      dispatch_group_wait(stillImageCaptureDelegate, 0xFFFFFFFFFFFFFFFFLL);
      v6 = self->_stillImageCaptureDelegate;
    }
    else
    {
      v6 = 0;
    }

    self->_stillImageCaptureDelegate = 0;
    *(_QWORD *)&self->_stillImageCaptureEnabled = 0;
  }
  -[BWFigVideoCaptureStreamDelegate captureStreamDidStopStreaming:](self->_delegate, "captureStreamDidStopStreaming:", self);
  if (!a3)
    -[BWFigVideoCaptureStream resignStreamStartStopDelegate](self, "resignStreamStartStopDelegate");
}

- (void)_resetStillImageCaptureState
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  id v6;

  if (a1)
  {
    objc_msgSend(*(id *)(a1 + 472), "resume");
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 480));
    *(_BYTE *)(a1 + 484) = 0;
    v2 = *(void **)(a1 + 488);
    v3 = *(void **)(a1 + 496);
    *(_QWORD *)(a1 + 488) = 0;
    *(_QWORD *)(a1 + 496) = 0;
    v4 = *(void **)(a1 + 560);
    *(_QWORD *)(a1 + 560) = 0;
    v5 = MEMORY[0x1E0CA2E18];
    *(_OWORD *)(a1 + 568) = *MEMORY[0x1E0CA2E18];
    *(_QWORD *)(a1 + 584) = *(_QWORD *)(v5 + 16);
    *(_QWORD *)(a1 + 592) = 0;
    *(_DWORD *)(a1 + 600) = 0;
    v6 = *(id *)(a1 + 656);
    *(_QWORD *)(a1 + 656) = 0;
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 480));

  }
}

- (void)resignStreamStartStopDelegate
{
  -[BWFigCaptureStream setStartStopDelegate:](self->_stream, "setStartStopDelegate:", 0);
}

- (void)_serviceTimeMachineWithSampleBuffer:(uint64_t)a1
{
  os_unfair_lock_s *v4;
  int v5;
  CFTypeRef cf;

  if (a1)
  {
    v4 = (os_unfair_lock_s *)(a1 + 480);
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 480));
    if (!*(_BYTE *)(a1 + 484))
    {
LABEL_6:
      os_unfair_lock_unlock(v4);
      objc_msgSend(*(id *)(a1 + 472), "insertFrame:", a2);
      return;
    }
    if (!+[BWStillImageTimeMachine afComplete:](BWStillImageTimeMachine, "afComplete:", a2))
    {
      v5 = *(_DWORD *)(a1 + 592);
      if (v5 < 30)
      {
        *(_DWORD *)(a1 + 592) = v5 + 1;
        goto LABEL_6;
      }
    }
    *(_BYTE *)(a1 + 484) = 0;
    os_unfair_lock_unlock(v4);
    objc_msgSend(*(id *)(a1 + 472), "drain");
    cf = 0;
    BWCMSampleBufferCreateCopyIncludingMetadata(a2, (CMSampleBufferRef *)&cf);
    -[BWFigVideoCaptureStream _handleStillImageSampleBuffer:withError:fromTimeMachine:](a1, (void *)cf, 0, 1);
    if (cf)
      CFRelease(cf);
  }
}

- (void)sourceNodeWillDiscardVideoSampleBuffer:(opaqueCMSampleBuffer *)a3
{
  -[BWFigVideoCaptureStreamDelegate captureStream:willDiscardVideoSampleBuffer:](self->_delegate, "captureStream:willDiscardVideoSampleBuffer:", self, a3);
}

- (BOOL)sourceNodeShouldDiscardStillImageSampleBuffer:(opaqueCMSampleBuffer *)a3 sensorRawOutput:(BOOL)a4
{
  _BOOL4 v4;
  os_unfair_lock_s *p_stillImageCaptureStateLock;
  int epoch_high;
  id v9;
  void *v10;
  const __CFString *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  unint64_t v16;
  void *v17;
  BOOL v18;
  uint64_t v20;
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  id v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t i;
  uint64_t v27;
  NSObject *v28;
  unsigned int v29;
  const char *v30;
  unsigned int v31;
  uint64_t v32;
  NSObject *v33;
  uint64_t v34;
  uint64_t v35;
  BWFigVideoCaptureStream *v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  os_log_type_t type;
  unsigned int v42;
  _BYTE v43[128];
  int v44;
  const char *v45;
  __int16 v46;
  uint64_t v47;
  __int16 v48;
  uint64_t v49;
  uint64_t v50;

  v4 = a4;
  v50 = *MEMORY[0x1E0C80C00];
  p_stillImageCaptureStateLock = &self->_stillImageCaptureStateLock;
  os_unfair_lock_lock(&self->_stillImageCaptureStateLock);
  epoch_high = HIDWORD(self->_stillCaptureReferenceFramePTS.epoch);
  os_unfair_lock_unlock(p_stillImageCaptureStateLock);
  if (!epoch_high)
    return 1;
  -[BWFigVideoCaptureStream _addBracketecCaptureSequenceNumberToMetadataIfNeededForStillImageSampleBuffer:]((uint64_t)self, a3);
  if (!-[NSString isEqualToString:](self->_portType, "isEqualToString:", *MEMORY[0x1E0D05A40]))
  {
    v9 = -[BWStillImageCaptureStreamSettings captureFrameInfoForFrame:](self->_activeResolvedStillImageCaptureStreamSettings, "captureFrameInfoForFrame:", a3);
    if (v9)
    {
      v10 = v9;
      v11 = (const __CFString *)*MEMORY[0x1E0D05CB0];
      v12 = (void *)CMGetAttachment(a3, (CFStringRef)*MEMORY[0x1E0D05CB0], 0);
      if (objc_msgSend((id)objc_msgSend(v12, "objectForKeyedSubscript:", *MEMORY[0x1E0D06D80]), "BOOLValue"))v13 = objc_msgSend(v10, "sifrFlags");
      else
        v13 = objc_msgSend(v10, "mainFlags");
      v16 = 0x3000000000000000;
      if (v4)
        v16 = 0xC000000000000000;
      if ((v13 & v16) != 0)
      {
        if ((v13 & 0xF000000000000000 & ((v13 & 0xF000000000000000) - 1)) != 0)
        {
          v17 = (void *)objc_msgSend(v12, "mutableCopy");
          CMSetAttachment(a3, v11, v17, 1u);

        }
        return 0;
      }
      return 1;
    }
    if (v4)
    {
      v14 = (void *)CMGetAttachment(a3, (CFStringRef)*MEMORY[0x1E0D05CB0], 0);
      v15 = *MEMORY[0x1E0D06F00];
      if (objc_msgSend(v14, "objectForKeyedSubscript:", *MEMORY[0x1E0D06F00]))
        objc_msgSend((id)objc_msgSend(v14, "objectForKeyedSubscript:", v15), "intValue");
      v20 = *MEMORY[0x1E0D06910];
      if (objc_msgSend(v14, "objectForKeyedSubscript:", *MEMORY[0x1E0D06910]))
        objc_msgSend((id)objc_msgSend(v14, "objectForKeyedSubscript:", v20), "intValue");
      if (dword_1ECFE9490)
      {
        v42 = 0;
        type = OS_LOG_TYPE_DEFAULT;
        os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
        os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
        fig_log_call_emit_and_clean_up_after_send_and_compose();
      }
      if (objc_msgSend(-[BWStillImageCaptureStreamSettings captureFrameInfos](self->_activeResolvedStillImageCaptureStreamSettings, "captureFrameInfos", v34, v35), "count"))
      {
        v39 = 0u;
        v40 = 0u;
        v37 = 0u;
        v38 = 0u;
        v22 = -[BWStillImageCaptureStreamSettings captureFrameInfos](self->_activeResolvedStillImageCaptureStreamSettings, "captureFrameInfos");
        v23 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v37, v43, 16);
        if (v23)
        {
          v24 = v23;
          v36 = self;
          v25 = *(_QWORD *)v38;
          do
          {
            for (i = 0; i != v24; ++i)
            {
              if (*(_QWORD *)v38 != v25)
                objc_enumerationMutation(v22);
              if (dword_1ECFE9490)
              {
                v27 = *(_QWORD *)(*((_QWORD *)&v37 + 1) + 8 * i);
                v42 = 0;
                type = OS_LOG_TYPE_DEFAULT;
                v28 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
                v29 = v42;
                if (os_log_type_enabled(v28, type))
                  v31 = v29;
                else
                  v31 = v29 & 0xFFFFFFFE;
                if (v31)
                {
                  v32 = BWPortTypeToDisplayString(v36->_portType, v30);
                  v44 = 136315650;
                  v45 = "-[BWFigVideoCaptureStream sourceNodeShouldDiscardStillImageSampleBuffer:sensorRawOutput:]";
                  v46 = 2114;
                  v47 = v32;
                  v48 = 2114;
                  v49 = v27;
                  _os_log_send_and_compose_impl();
                }
                fig_log_call_emit_and_clean_up_after_send_and_compose();
              }
            }
            v24 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v37, v43, 16);
          }
          while (v24);
        }
      }
      else if (dword_1ECFE9490)
      {
        v42 = 0;
        type = OS_LOG_TYPE_DEFAULT;
        v33 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
        os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT);
        v18 = 1;
        fig_log_call_emit_and_clean_up_after_send_and_compose();
        return v18;
      }
      return 1;
    }
  }
  return 0;
}

- (uint64_t)_addBracketecCaptureSequenceNumberToMetadataIfNeededForStillImageSampleBuffer:(uint64_t)result
{
  uint64_t v3;
  void *v4;
  uint64_t v5;
  int v6;
  void *v7;

  if (result)
  {
    v3 = result;
    result = objc_msgSend(*(id *)(result + 496), "captureType");
    if ((_DWORD)result == 2)
    {
      v4 = (void *)CMGetAttachment(a2, (CFStringRef)*MEMORY[0x1E0D05CB0], 0);
      if ((objc_msgSend(*(id *)(v3 + 496), "captureFlags") & 8) != 0)
      {
        v6 = objc_msgSend((id)objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x1E0D06AE8]), "BOOLValue");
        v5 = *MEMORY[0x1E0D06910];
        if (v6)
        {
          v7 = &unk_1E49F9228;
          return objc_msgSend(v4, "setObject:forKeyedSubscript:", v7, v5);
        }
      }
      else
      {
        result = objc_msgSend((id)objc_msgSend(*(id *)(v3 + 496), "unifiedBracketedCaptureParams"), "count");
        if (!result)
          return result;
        v5 = *MEMORY[0x1E0D06910];
      }
      v7 = &unk_1E49F9240;
      return objc_msgSend(v4, "setObject:forKeyedSubscript:", v7, v5);
    }
  }
  return result;
}

- (int)sourceNodeWillEmitStillImageSampleBuffer:(opaqueCMSampleBuffer *)a3
{
  return -[BWFigVideoCaptureStream _handleStillImageSampleBuffer:withError:fromTimeMachine:]((uint64_t)self, a3, 0, 0);
}

- (uint64_t)_handleStillImageSampleBuffer:(uint64_t)a3 withError:(uint64_t)a4 fromTimeMachine:
{
  int v8;
  void *v9;
  int v10;
  int v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  unint64_t v15;
  uint64_t v16;
  uint64_t v17;
  const __CFString *v18;
  CFTypeRef v19;
  CFTypeRef v20;
  void *v21;
  uint64_t v22;
  const void *v23;
  unsigned int v24;
  BOOL v25;
  int v26;
  unint64_t v27;
  BOOL v28;
  int v29;
  void *v30;
  void *v31;
  double v32;
  const __CFAllocator *v33;
  CFDictionaryRef v34;
  id v35;
  CMTimeEpoch v36;
  __int128 v37;
  void *v38;
  void *v39;
  int v40;
  char v41;
  char v42;
  CMTimeFlags flags;
  CMTimeEpoch epoch;
  CMTimeFlags v45;
  uint64_t v46;
  CMTimeFlags v47;
  uint64_t v48;
  unint64_t v49;
  int v50;
  void *v51;
  void *v52;
  _OWORD *v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  id v57;
  void *v58;
  void *v59;
  uint64_t v61;
  uint64_t v62;
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  int v64;
  void *v65;
  int v66;
  unsigned int v67;
  int v68;
  unsigned int v69;
  unsigned int v70;
  int v71;
  _QWORD v72[3];
  CMTime v73;
  CMTime v74;
  os_log_type_t type;
  unsigned int v76;
  unint64_t v77;
  CMTime time2;
  CMTime time;
  uint64_t v80;

  v80 = *MEMORY[0x1E0C80C00];
  if (!a1)
    return 0;
  v8 = objc_msgSend(*(id *)(a1 + 32), "isEqualToString:", objc_msgSend(*(id *)(a1 + 488), "masterPortType"));
  if ((_DWORD)a4)
    objc_msgSend(*(id *)(a1 + 632), "captureStreamWillBeginStillImageCapture:", a1);
  v9 = (void *)CMGetAttachment(a2, (CFStringRef)*MEMORY[0x1E0D05CB0], 0);
  os_unfair_lock_lock((os_unfair_lock_t)(a1 + 480));
  v10 = *(_DWORD *)(a1 + 596);
  if (!v10)
  {
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 480));
    return 4294954516;
  }
  v11 = *(_DWORD *)(a1 + 600);
  v71 = v11 + 1;
  *(_DWORD *)(a1 + 600) = v11 + 1;
  os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 480));
  if (a2)
  {
    v77 = 0;
    v12 = (void *)objc_msgSend(*(id *)(a1 + 496), "captureFrameInfoForFrame:", a2);
    if (v12)
    {
      v13 = objc_msgSend((id)objc_msgSend(v9, "objectForKeyedSubscript:", *MEMORY[0x1E0D06D80]), "BOOLValue")? objc_msgSend(v12, "sifrFlags"): objc_msgSend(v12, "mainFlags");
      v15 = v13;
      v77 = v13;
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0
        && objc_msgSend(v12, "isNoLongErrorRecoveryFrame")
        && objc_msgSend(*(id *)(a1 + 496), "isUnifiedBracketingErrorRecoveryFrame:isReferenceFrame:", a2, (v15 >> 4) & 1))
      {
        v77 = v15 & 0xFFFFFFFFFFFFFFEFLL;
      }
    }
    if (*(int *)(a1 + 648) >= 2)
    {
      v16 = *MEMORY[0x1E0D06F00];
      if (objc_msgSend(v9, "objectForKeyedSubscript:", *MEMORY[0x1E0D06F00]))
      {
        if (CMGetAttachment(a2, (CFStringRef)*MEMORY[0x1E0D05CA8], 0))
        {
          v64 = v8;
          v67 = a3;
          if (!*(_QWORD *)(a1 + 656))
            *(_QWORD *)(a1 + 656) = objc_alloc_init(MEMORY[0x1E0C99E08]);
          v17 = objc_msgSend((id)objc_msgSend(v9, "objectForKeyedSubscript:", v16), "intValue");
          v18 = (const __CFString *)*MEMORY[0x1E0D05D48];
          v19 = CMGetAttachment(a2, (CFStringRef)*MEMORY[0x1E0D05D48], 0);
          if (v19)
          {
            v20 = v19;
            v21 = (void *)objc_msgSend(v9, "objectForKeyedSubscript:", *MEMORY[0x1E0D06D88]);
            if (objc_msgSend((id)objc_msgSend(v21, "objectForKeyedSubscript:", *MEMORY[0x1E0D06D90]), "BOOLValue"))v22 = (v17 - 1);
            else
              v22 = (v17 + 1);
            objc_msgSend(*(id *)(a1 + 656), "setObject:forKeyedSubscript:", v20, objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v22));
            goto LABEL_27;
          }
          v23 = (const void *)objc_msgSend(*(id *)(a1 + 656), "objectForKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v17));
          if (v23)
          {
            CMSetAttachment(a2, v18, v23, 1u);
LABEL_27:
            a3 = v67;
            v8 = v64;
            goto LABEL_28;
          }
          v76 = 0;
          type = OS_LOG_TYPE_DEFAULT;
          os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
          os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
          a3 = v67;
          fig_log_call_emit_and_clean_up_after_send_and_compose();
        }
      }
    }
LABEL_28:
    if ((objc_msgSend(*(id *)(a1 + 496), "referenceFrameIndex", v61, v62) & 0x80000000) != 0)
    {
      if ((int)objc_msgSend(*(id *)(a1 + 488), "timeMachineReferenceFrameBracketedCaptureSequenceNumber") < 1)
      {
        v24 = 0;
        goto LABEL_38;
      }
      v25 = v11 == objc_msgSend(*(id *)(a1 + 488), "timeMachineReferenceFrameBracketedCaptureSequenceNumber")- 1;
    }
    else
    {
      if (v12)
      {
        v24 = (v77 >> 4) & 1;
        goto LABEL_38;
      }
      v25 = v11 == objc_msgSend(*(id *)(a1 + 496), "referenceFrameIndex");
    }
    v24 = v25;
LABEL_38:
    BWAddStillImageCaptureFrameMetadataToSampleBuffer(a2, *(void **)(a1 + 496), v24, (uint64_t *)&v77);
    v26 = objc_msgSend(*(id *)(a1 + 496), "captureType");
    v27 = objc_msgSend((id)objc_msgSend(*(id *)(a1 + 488), "captureStreamSettings"), "count");
    if (*(_QWORD *)(a1 + 632))
    {
      if (*(_BYTE *)(a1 + 556))
        v28 = 1;
      else
        v28 = v27 > 1;
      v29 = v28;
    }
    else
    {
      v29 = 0;
    }
    memset(&v74, 0, sizeof(v74));
    CMSampleBufferGetPresentationTimeStamp(&v74, (CMSampleBufferRef)a2);
    if ((v29 & v8) != 1)
      goto LABEL_73;
    if (objc_msgSend((id)objc_msgSend(v9, "objectForKeyedSubscript:", *MEMORY[0x1E0D06D10]), "BOOLValue"))
    {
      v30 = *(void **)(a1 + 632);
      time = v74;
      objc_msgSend(v30, "captureStream:didCapturePreBracketedEV0ImageWithPTS:", a1, &time);
      if ((v24 & 1) == 0)
        goto LABEL_68;
      goto LABEL_67;
    }
    if (v26 == 3)
    {
      v31 = (void *)objc_msgSend(v9, "objectForKeyedSubscript:", *MEMORY[0x1E0D06038]);
      if (v31)
      {
        objc_msgSend(v31, "doubleValue");
        if (v32 == 0.0)
        {
          *(CMTime *)(a1 + 568) = v74;
          if ((v24 & 1) == 0)
            goto LABEL_73;
          goto LABEL_67;
        }
      }
    }
    else if ((v26 & 0xFFFFFFFE) == 4)
    {
      v68 = objc_msgSend((id)objc_msgSend(v9, "objectForKeyedSubscript:", *MEMORY[0x1E0D06910]), "intValue");
      if ((objc_msgSend(*(id *)(a1 + 488), "captureType") != 5
         || v68 != objc_msgSend(*(id *)(a1 + 488), "bracketedCaptureSequenceNumberForOISLongExposure"))
        && (objc_msgSend(*(id *)(a1 + 488), "captureFlags") & 0x2000) == 0)
      {
        v69 = a3;
        v65 = (void *)objc_msgSend(v9, "mutableCopy");
        v33 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
        time = v74;
        v34 = CMTimeCopyAsDictionary(&time, v33);
        objc_msgSend(v65, "setObject:forKeyedSubscript:", v34, *MEMORY[0x1E0D05D00]);

        v35 = *(id *)(a1 + 560);
        if (!v35)
        {
          v35 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
          *(_QWORD *)(a1 + 560) = v35;
        }
        objc_msgSend(v35, "addObject:", v65);

        a3 = v69;
        if ((v24 & 1) == 0)
        {
LABEL_73:
          v40 = v71;
          if (v71 < v10
            || !*(_QWORD *)(a1 + 632)
            || ((v41 = objc_msgSend((id)objc_msgSend(v9, "objectForKeyedSubscript:", *MEMORY[0x1E0D06A60]), "BOOLValue"),
                 v26 == 11)
              ? (v42 = 1)
              : (v42 = v41),
                v40 = v71,
                ((v42 | v8 ^ 1) & 1) != 0))
          {
LABEL_98:
            v53 = (_OWORD *)(a1 + 532);
            if ((*(_BYTE *)(a1 + 544) & 1) == 0
              || (time = v74,
                  *(_OWORD *)&time2.value = *v53,
                  time2.epoch = *(_QWORD *)(a1 + 548),
                  CMTimeCompare(&time, &time2) >= 1))
            {
              *v53 = *(_OWORD *)&v74.value;
              *(_QWORD *)(a1 + 548) = v74.epoch;
            }
            if (objc_msgSend(*(id *)(a1 + 496), "adaptiveBracketingParameters"))
            {
              v54 = objc_msgSend(*(id *)(a1 + 496), "adaptiveBracketingGroupCaptureCount");
              if ((int)v54 < 1)
              {
                objc_msgSend(*(id *)(a1 + 176), "captureStream:willEmitStillImageSampleBuffer:fromTimeMachine:", a1, a2, a4);
                if ((a4 & 1) == 0)
                  goto LABEL_110;
              }
              else
              {
                v55 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v54);
                objc_msgSend(v9, "setObject:forKeyedSubscript:", v55, *MEMORY[0x1E0D05DF8]);
                objc_msgSend(*(id *)(a1 + 176), "captureStream:willEmitStillImageSampleBuffer:fromTimeMachine:", a1, a2, a4);
                if ((a4 & 1) == 0)
                {
                  v73 = v74;
                  objc_msgSend(*(id *)(a1 + 496), "setAdaptiveBracketingLastFramePTS:", &v73);
LABEL_110:
                  fvcs_removeSampleBufferPixelBufferMetadata((opaqueCMSampleBuffer *)a2);
                  v14 = figVideoCaptureStream_blackenFrameIfNecessary(a1, a2);
                  goto LABEL_111;
                }
              }
            }
            else
            {
              objc_msgSend(*(id *)(a1 + 176), "captureStream:willEmitStillImageSampleBuffer:fromTimeMachine:", a1, a2, a4);
              if (!(_DWORD)a4)
                goto LABEL_110;
            }
            v56 = *(_QWORD *)(a1 + 608);
            if (v56)
              (*(void (**)(uint64_t, void *))(v56 + 16))(v56, a2);
            v14 = 0;
            goto LABEL_111;
          }
          v66 = v8;
          v70 = a3;
          time2.value = v74.value;
          flags = v74.flags;
          time2.timescale = v74.timescale;
          epoch = v74.epoch;
          if (!v29)
            goto LABEL_93;
          if ((objc_msgSend(*(id *)(a1 + 488), "captureFlags") & 0x2000) != 0)
          {
            v47 = *(_DWORD *)(a1 + 580);
            if ((v47 & 1) != 0)
            {
              time2.value = *(_QWORD *)(a1 + 568);
              time2.timescale = *(_DWORD *)(a1 + 576);
              epoch = *(_QWORD *)(a1 + 584);
              flags = v47;
            }
            v48 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", objc_msgSend(*(id *)(a1 + 488), "timeMachineReferenceFrameBracketedCaptureSequenceNumber"));
          }
          else
          {
            if (v26 == 3)
            {
              v45 = *(_DWORD *)(a1 + 580);
              if ((v45 & 1) != 0)
              {
                v46 = 0;
                time2.value = *(_QWORD *)(a1 + 568);
                time2.timescale = *(_DWORD *)(a1 + 576);
                epoch = *(_QWORD *)(a1 + 584);
                flags = v45;
LABEL_97:
                *(CMTime *)(a1 + 508) = v74;
                *(_DWORD *)(a1 + 504) = v26;
                v52 = *(void **)(a1 + 632);
                time.value = time2.value;
                time.timescale = time2.timescale;
                time.flags = flags;
                time.epoch = epoch;
                objc_msgSend(v52, "captureStream:didCaptureReferenceFrameWithPTS:referenceFrameBracketedCaptureSequenceNumber:", a1, &time, v46);
                a3 = v70;
                v8 = v66;
                goto LABEL_98;
              }
LABEL_93:
              v46 = 0;
              goto LABEL_97;
            }
            if ((v26 & 0xFFFFFFFE) != 4)
              goto LABEL_93;
            v76 = -1;
            if (FigCaptureReferenceFrameSelection(*(const __CFArray **)(a1 + 560), (int *)&v76)
              || (v49 = v76, (v76 & 0x80000000) != 0)
              || objc_msgSend(*(id *)(a1 + 560), "count") <= v49)
            {
              v50 = objc_msgSend(*(id *)(a1 + 560), "count") - 1;
              v76 = v50;
            }
            else
            {
              v50 = v76;
            }
            v51 = (void *)objc_msgSend(*(id *)(a1 + 560), "objectAtIndexedSubscript:", v50);
            CMTimeMakeFromDictionary(&time, (CFDictionaryRef)objc_msgSend(v51, "objectForKeyedSubscript:", *MEMORY[0x1E0D05D00]));
            time2.value = time.value;
            flags = time.flags;
            time2.timescale = time.timescale;
            epoch = time.epoch;
            v48 = objc_msgSend(v51, "objectForKeyedSubscript:", *MEMORY[0x1E0D06910]);
          }
          v46 = v48;
          v40 = v71;
          goto LABEL_97;
        }
        goto LABEL_67;
      }
    }
    else if (v26 == 2)
    {
      if ((objc_msgSend((id)objc_msgSend(v9, "objectForKeyedSubscript:", *MEMORY[0x1E0D06AE8]), "BOOLValue") & 1) == 0)
        goto LABEL_73;
      goto LABEL_67;
    }
    if (!v24)
    {
LABEL_68:
      if (v26 == 10
        && objc_msgSend(*(id *)(a1 + 488), "deliverOriginalImage")
        && (objc_msgSend(*(id *)(a1 + 496), "captureFlags") & 0x40000) != 0
        && (v77 & 0x20) != 0)
      {
        v39 = *(void **)(a1 + 632);
        time = v74;
        objc_msgSend(v39, "captureStream:didCapturePreBracketedEV0ImageWithPTS:", a1, &time);
      }
      goto LABEL_73;
    }
LABEL_67:
    v36 = v74.epoch;
    *(_QWORD *)(a1 + 584) = v74.epoch;
    v37 = *(_OWORD *)&v74.value;
    *(_OWORD *)(a1 + 568) = *(_OWORD *)&v74.value;
    v38 = *(void **)(a1 + 632);
    *(_OWORD *)&time.value = v37;
    time.epoch = v36;
    objc_msgSend(v38, "captureStream:didCaptureReferenceFrameWithPTS:referenceFrameBracketedCaptureSequenceNumber:", a1, &time, 0);
    goto LABEL_68;
  }
  v14 = 4294954516;
  v40 = v11 + 1;
LABEL_111:
  if (v40 >= v10)
  {
    v57 = *(id *)(a1 + 496);
    -[BWFigVideoCaptureStream _resetStillImageCaptureState](a1);
    v58 = *(void **)(a1 + 176);
    time = *(CMTime *)(a1 + 532);
    objc_msgSend(v58, "captureStream:didCompleteStillImageCaptureWithPTS:error:", a1, &time, a3);
    if (a2 && objc_msgSend(v57, "reachedEndOfAdaptiveBracketing"))
    {
      if (v8)
      {
        v59 = *(void **)(a1 + 632);
        if (v57)
          objc_msgSend(v57, "adaptiveBracketingLastFramePTS");
        else
          memset(v72, 0, sizeof(v72));
        objc_msgSend(v59, "captureStream:didCaptureReferenceFrameWithPTS:referenceFrameBracketedCaptureSequenceNumber:", a1, v72, 0);
      }
      CMSetAttachment(a2, (CFStringRef)*MEMORY[0x1E0D08708], MEMORY[0x1E0C9AAB0], 1u);
    }
    if (!objc_msgSend(v57, "adaptiveBracketingParameters")
      || objc_msgSend(v57, "reachedEndOfAdaptiveBracketing"))
    {
      objc_msgSend(*(id *)(a1 + 632), "captureStreamDidCompleteStillImageCapture:", a1);
    }

  }
  return v14;
}

- (void)sourceNodeWillEmitStillImageQuadraBufferProcessingError:(int)a3
{
  -[BWFigVideoCaptureStream _handleStillImageSampleBuffer:withError:fromTimeMachine:]((uint64_t)self, 0, *(uint64_t *)&a3, 0);
}

- (int)sourceNodeWillEmitDepthSampleBuffer:(opaqueCMSampleBuffer *)a3
{
  -[BWFigVideoCaptureStreamDelegate captureStream:willEmitDepthSampleBuffer:](self->_delegate, "captureStream:willEmitDepthSampleBuffer:", self, a3);
  return figVideoCaptureStream_blackenFrameIfNecessary((uint64_t)self, a3);
}

- (int)sourceNodeWillEmitPointCloudSampleBuffer:(opaqueCMSampleBuffer *)a3
{
  -[BWFigVideoCaptureStreamDelegate captureStream:willEmitPointCloudSampleBuffer:](self->_delegate, "captureStream:willEmitPointCloudSampleBuffer:", self, a3);
  return figVideoCaptureStream_blackenFrameIfNecessary((uint64_t)self, a3);
}

- (void)sourceNodeDidDropFrameWithPTS:(id *)a3
{
  BWFigVideoCaptureStreamDelegate *delegate;
  $3CC8671D27C23BF42ADDB32F2B5E48AE v5;

  delegate = self->_delegate;
  v5 = *a3;
  -[BWFigVideoCaptureStreamDelegate captureStream:didDropVideoSampleBufferWithPTS:](delegate, "captureStream:didDropVideoSampleBufferWithPTS:", self, &v5);
}

- (BOOL)stillImageCaptureEnabled
{
  return (BOOL)self->_stillImageBufferTimeMachineHandler;
}

- (int)timeMachineCapacity
{
  return self->_timeMachineCapacity;
}

- (BOOL)timeMachineEnabled
{
  return self->_timeMachineEnabled;
}

- (void)setStillImageBufferTimeMachineHandler:(id)a3
{
  id v3;

  v3 = *(id *)&self->_receivedImagesOrErrorsForCaptureStillImageNow;
  if (v3 != a3)
  {

    *(_QWORD *)&self->_receivedImagesOrErrorsForCaptureStillImageNow = objc_msgSend(a3, "copy");
  }
}

- (id)stillImageBufferTimeMachineHandler
{
  return *(id *)&self->_receivedImagesOrErrorsForCaptureStillImageNow;
}

- (void)captureStillImageFromTimeMachineWithStillImageSettings:(id)a3
{
  opaqueCMSampleBuffer *v4;
  opaqueCMSampleBuffer *v5;

  if (self->_timeMachine)
  {
    -[BWFigVideoCaptureStream _prepareForStillImageCaptureWithStillImageSettings:fromCMTimeMachine:]((uint64_t)self, a3, 1);
    v4 = -[BWStillImageTimeMachine copyBestFrame](self->_timeMachine, "copyBestFrame");
    if (v4)
    {
      v5 = v4;
      -[BWStillImageTimeMachine drain](self->_timeMachine, "drain");
      -[BWFigVideoCaptureStream _handleStillImageSampleBuffer:withError:fromTimeMachine:]((uint64_t)self, v5, 0, 1);
      CFRelease(v5);
    }
    else
    {
      os_unfair_lock_lock(&self->_stillImageCaptureStateLock);
      self->_grabNextFrame = 1;
      os_unfair_lock_unlock(&self->_stillImageCaptureStateLock);
    }
  }
  else
  {
    FigDebugAssert3();
  }
}

- (void)_prepareForStillImageCaptureWithStillImageSettings:(char)a3 fromCMTimeMachine:
{
  if (a1)
  {
    *(_QWORD *)(a1 + 488) = a2;
    *(_QWORD *)(a1 + 496) = (id)objc_msgSend(a2, "captureStreamSettingsForPortType:", *(_QWORD *)(a1 + 32));
    if ((a3 & 1) == 0)
      objc_msgSend(*(id *)(a1 + 472), "suspendAndDrain");
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 480));
    *(_DWORD *)(a1 + 596) = objc_msgSend(*(id *)(a1 + 496), "expectedFrameCaptureCount");
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 480));
  }
}

- (void)prepareForStillImageCaptureFromFirmwareWithStillImageSettings:(id)a3
{
  -[BWFigVideoCaptureStream _prepareForStillImageCaptureWithStillImageSettings:fromCMTimeMachine:]((uint64_t)self, a3, 0);
}

- (void)willCaptureStillImageFromFirmware
{
  int v3;
  int v4;

  v3 = -[BWStillImageCaptureStreamSettings captureType](self->_activeResolvedStillImageCaptureStreamSettings, "captureType");
  v4 = -[BWStillImageCaptureStreamSettings adaptiveBracketingGroupCaptureCount](self->_activeResolvedStillImageCaptureStreamSettings, "adaptiveBracketingGroupCaptureCount");
  if (v3 != 2 && v4 <= 1)
    -[OS_dispatch_queue captureStreamWillBeginStillImageCapture:](self->_streamNotificationDispatchQueue, "captureStreamWillBeginStillImageCapture:", self);
}

- (void)failedToCaptureStillImageFromFirmwareWithError:(int)a3
{
  -[OS_dispatch_queue captureStream:stillImageCaptureError:](self->_streamNotificationDispatchQueue, "captureStream:stillImageCaptureError:", self, *(_QWORD *)&a3);
  -[BWFigVideoCaptureStream _resetStillImageCaptureState]((uint64_t)self);
}

- (int)activeStillImageCaptureType
{
  return -[BWStillImageCaptureStreamSettings captureType](self->_activeResolvedStillImageCaptureStreamSettings, "captureType");
}

- (float)activeStillImageScaleFactor
{
  float result;

  -[BWStillImageCaptureSettings scaleFactor](self->_activeResolvedStillImageCaptureSettings, "scaleFactor");
  return result;
}

- (BOOL)providesPreBracketedEV0
{
  return -[BWStillImageCaptureStreamSettings expectPreBracketFrame](self->_activeResolvedStillImageCaptureStreamSettings, "expectPreBracketFrame");
}

- (BOOL)clientProcessHasAccessToCamera
{
  BWFigVideoCaptureStream *v2;
  os_unfair_lock_s *p_cameraAccessLock;

  v2 = self;
  p_cameraAccessLock = &self->_cameraAccessLock;
  os_unfair_lock_lock(&self->_cameraAccessLock);
  LOBYTE(v2) = v2->_clientProcessHasAccessToCamera;
  os_unfair_lock_unlock(p_cameraAccessLock);
  return (char)v2;
}

- (void)setBlackenFramesForContinuityDisplayConnected:(BOOL)a3
{
  int v3;
  os_unfair_lock_s *p_cameraAccessLock;
  int blackenFramesForContinuityDisplayConnected;
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;

  v3 = a3;
  p_cameraAccessLock = &self->_cameraAccessLock;
  os_unfair_lock_lock(&self->_cameraAccessLock);
  blackenFramesForContinuityDisplayConnected = self->_blackenFramesForContinuityDisplayConnected;
  self->_blackenFramesForContinuityDisplayConnected = v3;
  if (blackenFramesForContinuityDisplayConnected != v3)
  {
    if (v3)
    {
      if (dword_1ECFE9490)
        goto LABEL_6;
    }
    else if (dword_1ECFE9490)
    {
LABEL_6:
      os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
      fig_log_call_emit_and_clean_up_after_send_and_compose();
    }
  }
  os_unfair_lock_unlock(p_cameraAccessLock);
}

- (BOOL)blackenFramesForContinuityDisplayConnected
{
  BWFigVideoCaptureStream *v2;
  os_unfair_lock_s *p_cameraAccessLock;

  v2 = self;
  p_cameraAccessLock = &self->_cameraAccessLock;
  os_unfair_lock_lock(&self->_cameraAccessLock);
  LOBYTE(v2) = v2->_blackenFramesForContinuityDisplayConnected;
  os_unfair_lock_unlock(p_cameraAccessLock);
  return (char)v2;
}

- (id)noiseReductionAndSharpeningConfigurationForType:(int)a3 gain:(float)a4 qSub:(BOOL)a5
{
  return (id)-[BWObjectDetector noiseReductionAndSharpeningConfigurationForType:gain:qSub:](self->_objectDetector, "noiseReductionAndSharpeningConfigurationForType:gain:qSub:", *(_QWORD *)&a3, a5);
}

- (id)noiseReductionAndSharpeningConfigurationForType:(int)a3 gain:(float)a4
{
  return -[BWFigVideoCaptureStream noiseReductionAndSharpeningConfigurationForType:gain:qSub:](self, "noiseReductionAndSharpeningConfigurationForType:gain:qSub:", *(_QWORD *)&a3, 0);
}

- (uint64_t)_configureKeypointDetection
{
  uint64_t v1;
  void *v2;
  uint64_t v3;

  if (result)
  {
    v1 = result;
    if (!*(_BYTE *)(result + 792))
    {
      v2 = *(void **)(result + 8);
      if (*(_QWORD *)(v1 + 784))
        v3 = *(_QWORD *)(v1 + 784);
      else
        v3 = MEMORY[0x1E0C9AA70];
      result = objc_msgSend(v2, "setProperty:value:", *MEMORY[0x1E0D075A0], v3);
      if (!(_DWORD)result)
        *(_BYTE *)(v1 + 792) = 1;
    }
  }
  return result;
}

- (BOOL)keypointDetectionEnabled
{
  return BYTE1(self->_keypointDetectionConfiguration);
}

- (BOOL)stillImageKeypointDetectionEnabled
{
  return BYTE2(self->_keypointDetectionConfiguration);
}

- (int)mainToSIFRFrameRateRatio
{
  return (int)self->_stillImageCaptureDelegateDispatchGroup;
}

- (BOOL)highlightRecoverySuspended
{
  return BYTE3(self->_keypointDetectionConfiguration);
}

- (BOOL)highlightRecoveryEnabled
{
  return BYTE4(self->_keypointDetectionConfiguration);
}

- (BOOL)highlightRecoveryEnabledWhenConfiguredAsMasterOrSingleStream
{
  return BYTE5(self->_keypointDetectionConfiguration);
}

- (BOOL)highlightRecoveryEnabledWhenConfiguredAsSlave
{
  return BYTE6(self->_keypointDetectionConfiguration);
}

- (BOOL)unifiedBracketingEnabled
{
  return self->_multiBandNoiseReductionMode;
}

- (BOOL)aeStatisticsEnabled
{
  return BYTE1(self->_multiBandNoiseReductionMode);
}

- (BOOL)rawFocusScoresEnabled
{
  return BYTE2(self->_multiBandNoiseReductionMode);
}

- (BOOL)focusBlurMapEnabled
{
  return HIBYTE(self->_multiBandNoiseReductionMode);
}

- (BOOL)zeroShutterLagEnabled
{
  return BYTE1(self->_band0StrengthModulation);
}

- (BOOL)overCaptureEnabled
{
  return -[BWSphereModeSelector overCaptureEnabled](self->_sphereModeSelector, "overCaptureEnabled");
}

- (BOOL)variableFrameRateVideoEnabled
{
  return *(&self->_maxExposureDurationHasBeenSet + 3);
}

- (void)setVisionDataSuspended:(BOOL)a3
{
  -[BWFigCaptureStream setProperty:value:](self->_stream, "setProperty:value:", *MEMORY[0x1E0D078C8], objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a3));
}

- (void)setRuntimeUpdates:(id)a3
{
  -[BWFigCaptureStream setProperty:value:](self->_stream, "setProperty:value:", *MEMORY[0x1E0D078C0], a3);
}

- (void)triggerVisionDataBurst
{
  -[BWFigCaptureStream sendCommandProperty:](self->_stream, "sendCommandProperty:", *MEMORY[0x1E0D07848]);
}

- (void)setVisionDataKeypointDetectionThreshold:(float)a3
{
  -[BWFigCaptureStream setProperty:value:](self->_stream, "setProperty:value:", *MEMORY[0x1E0D078B8], objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:"));
}

- (BOOL)videoHDRImageStatisticsEnabled
{
  return self->_keypointDetectionConfigured;
}

- ($2825F4736939C4A6D3AD43837233062D)physicalSensorDimensions
{
  $2825F4736939C4A6D3AD43837233062D *p_aeMaxGain;

  if (self->_sensorDimensions.height < 1 || self->_videoCaptureDimensions.width <= 0)
    p_aeMaxGain = ($2825F4736939C4A6D3AD43837233062D *)&self->_aeMaxGain;
  else
    p_aeMaxGain = ($2825F4736939C4A6D3AD43837233062D *)&self->_sensorDimensions.height;
  return *p_aeMaxGain;
}

- (BOOL)cinematicFramingEnabled
{
  return self->_videoCaptureDimensions.height;
}

- (void)setCenterStageRectOfInterest:(CGRect)a3
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  CFDictionaryRef DictionaryRepresentation;
  CGRect v9;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  self->_physicalSensorDimensions = *($470D365275581EF16070F5A11344F73E *)&a3.origin.x;
  *(CGFloat *)&self->_cinematicFramingEnabled = a3.origin.y;
  self->_centerStageRectOfInterest.origin.x = a3.size.width;
  self->_centerStageRectOfInterest.origin.y = a3.size.height;
  if (-[NSDictionary objectForKeyedSubscript:](self->_supportedProperties, "objectForKeyedSubscript:", CFSTR("CMIOCinematicFramingEnabled")))
  {
    v9.origin.x = x;
    v9.origin.y = y;
    v9.size.width = width;
    v9.size.height = height;
    DictionaryRepresentation = CGRectCreateDictionaryRepresentation(v9);
    -[BWFigCaptureStream setPropertyIfSupported:value:](self->_stream, "setPropertyIfSupported:value:", CFSTR("CMIOCenterStageRectOfInterest"), DictionaryRepresentation);
    if (DictionaryRepresentation)
      CFRelease(DictionaryRepresentation);
  }
}

- (CGRect)centerStageRectOfInterest
{
  double v2;
  double v3;
  double x;
  double y;
  CGRect result;

  v2 = *(double *)&self->_physicalSensorDimensions;
  v3 = *(double *)&self->_cinematicFramingEnabled;
  x = self->_centerStageRectOfInterest.origin.x;
  y = self->_centerStageRectOfInterest.origin.y;
  result.size.height = y;
  result.size.width = x;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

- (void)setCenterStageFramingMode:(int)a3
{
  LODWORD(self->_centerStageRectOfInterest.size.width) = a3;
}

- (int)centerStageFramingMode
{
  return LODWORD(self->_centerStageRectOfInterest.size.width);
}

- (BOOL)backgroundBlurEnabled
{
  return BYTE4(self->_centerStageRectOfInterest.size.width);
}

- (BOOL)studioLightingEnabled
{
  return BYTE5(self->_centerStageRectOfInterest.size.width);
}

- (BOOL)reactionEffectsEnabled
{
  return BYTE6(self->_centerStageRectOfInterest.size.width);
}

- (void)setGesturesEnabled:(BOOL)a3
{
  HIBYTE(self->_centerStageRectOfInterest.size.width) = a3;
}

- (BOOL)gesturesEnabled
{
  return HIBYTE(self->_centerStageRectOfInterest.size.width);
}

- (void)setBackgroundReplacementEnabled:(BOOL)a3
{
  LOBYTE(self->_centerStageRectOfInterest.size.height) = a3;
}

- (BOOL)backgroundReplacementEnabled
{
  return LOBYTE(self->_centerStageRectOfInterest.size.height);
}

- (void)setDeskCamActive:(BOOL)a3
{
  if (LOBYTE(self->_videoCaptureDimensions.height) && self->_started && !self->_suspended)
  {
    -[BWFigVideoCaptureStream _logStreamingPowerEvent:]((uint64_t)self, 0);
    LOBYTE(self->_numberOfBuffersEmitted) = a3;
    -[BWFigVideoCaptureStream _logStreamingPowerEvent:]((uint64_t)self, 1);
  }
  else
  {
    LOBYTE(self->_numberOfBuffersEmitted) = a3;
  }
}

- (void)setCmioZoomFactor:(float)a3
{
  if (-[BWFigCaptureStream setPropertyIfSupported:value:](self->_stream, "setPropertyIfSupported:value:", CFSTR("CMIOVideoZoomFactor"), objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:")))
  {
    FigDebugAssert3();
  }
}

- (float)cmioZoomFactor
{
  float result;
  int v3;

  v3 = 0;
  objc_msgSend(-[BWFigCaptureStream getPropertyIfSupported:error:](self->_stream, "getPropertyIfSupported:error:", CFSTR("CMIOVideoZoomFactor"), &v3), "floatValue");
  return result;
}

- (void)setZoomFactorToNondisruptiveSwitchingFormatIndexSIFRBinned:(id)a3 zoomFactorToNondisruptiveSwitchingFormatIndexSIFRNonBinned:(id)a4 ultraHighResolutionNondisruptiveStreamingFormatIndex:(int)a5 mainFormatSIFRBinningFactor:(int)a6 quadraSubPixelSwitchingParameters:(id)a7
{
  uint64_t v8;
  uint64_t v9;
  id v13;
  void *v14;
  float v15;
  BWNondisruptiveSwitchingFormatSelector *v16;
  double v17;

  v8 = *(_QWORD *)&a6;
  v9 = *(_QWORD *)&a5;

  *(_QWORD *)&self->_centerStageFramingMode = a3;
  *(_QWORD *)&self->_backgroundReplacementEnabled = a4;
  LODWORD(self->_nondisruptiveSwitchingZoomFactors) = v8;
  if ((_DWORD)v8 == 2)
    v13 = a3;
  else
    v13 = a4;
  v14 = (void *)objc_msgSend((id)objc_msgSend(v13, "allKeys"), "sortedArrayUsingSelector:", sel_compare_);
  objc_msgSend((id)objc_msgSend(v14, "firstObject"), "floatValue");
  if (v15 == self->_baseZoomFactor)
  {
    if ((unint64_t)objc_msgSend(v14, "count") < 2)
      v14 = 0;
    else
      v14 = (void *)objc_msgSend(v14, "subarrayWithRange:", 1, objc_msgSend(v14, "count") - 1);
  }

  self->_zoomFactorToNondisruptiveSwitchingFormatIndexSIFRBinned = (NSDictionary *)v14;
  self->_zoomFactorToNondisruptiveSwitchingFormatIndexSIFRNonBinned = 0;
  if (*(_QWORD *)&self->_centerStageFramingMode || *(_QWORD *)&self->_backgroundReplacementEnabled)
  {
    v16 = [BWNondisruptiveSwitchingFormatSelector alloc];
    *(float *)&v17 = self->_baseZoomFactor;
    self->_zoomFactorToNondisruptiveSwitchingFormatIndexSIFRNonBinned = (NSDictionary *)-[BWNondisruptiveSwitchingFormatSelector initWithPortType:quadraSubPixelSwitchingParameters:baseZoomFactor:zoomFactorToNondisruptiveSwitchingFormatIndexSIFRBinned:zoomFactorToNondisruptiveSwitchingFormatIndexSIFRNonBinned:ultraHighResolutionNondisruptiveStreamingFormatIndex:mainFormatSIFRBinningFactor:](v16, "initWithPortType:quadraSubPixelSwitchingParameters:baseZoomFactor:zoomFactorToNondisruptiveSwitchingFormatIndexSIFRBinned:zoomFactorToNondisruptiveSwitchingFormatIndexSIFRNonBinned:ultraHighResolutionNondisruptiveStreamingFormatIndex:mainFormatSIFRBinningFactor:", self->_portType, a7, *(_QWORD *)&self->_centerStageFramingMode, *(_QWORD *)&self->_backgroundReplacementEnabled, v9, v8, v17);
  }
}

- (void)serviceNondisruptiveSwitchingFormatForZoomFactor:(float)a3 frameStatistics:(id)a4 imageControlMode:(int)a5 stillImageDigitalFlashMode:(int)a6 isStationary:(BOOL)a7 binnedSIFROnSecondaryStreamAllowed:(BOOL)a8 ignoreZoomFactorAndQuadraSubPixelSceneMonitoring:(BOOL)a9 ultraHighResolutionZeroShutterLagEnabled:(BOOL)a10
{
  uint64_t v10;

  if (*(_QWORD *)&self->_centerStageFramingMode || *(_QWORD *)&self->_backgroundReplacementEnabled)
  {
    BYTE1(v10) = a10;
    LOBYTE(v10) = a9;
    -[BWFigVideoCaptureStream setActiveNondisruptiveSwitchingFormatIndex:](self, "setActiveNondisruptiveSwitchingFormatIndex:", -[NSDictionary formatIndexForZoomFactor:frameStatistics:imageControlMode:stillImageDigitalFlashMode:isStationary:isSecondaryStream:binnedSIFROnSecondaryStreamAllowed:ignoreZoomFactorAndQuadraSubPixelSceneMonitoring:ultraHighResolutionZeroShutterLagEnabled:](self->_zoomFactorToNondisruptiveSwitchingFormatIndexSIFRNonBinned, "formatIndexForZoomFactor:frameStatistics:imageControlMode:stillImageDigitalFlashMode:isStationary:isSecondaryStream:binnedSIFROnSecondaryStreamAllowed:ignoreZoomFactorAndQuadraSubPixelSceneMonitoring:ultraHighResolutionZeroShutterLagEnabled:", a4, *(_QWORD *)&a5, *(_QWORD *)&a6, a7, self->_isSlave, a8, v10));
  }
  else
  {
    FigDebugAssert3();
  }
}

- (CGPoint)previewShift
{
  BWNondisruptiveSwitchingFormatSelector *nondisruptiveSwitchingFormatSelector;
  double v3;
  CGPoint result;

  nondisruptiveSwitchingFormatSelector = self->_nondisruptiveSwitchingFormatSelector;
  v3 = *(double *)&self->_mainFormatSIFRBinningFactor;
  result.y = v3;
  result.x = *(double *)&nondisruptiveSwitchingFormatSelector;
  return result;
}

- (BOOL)isMultipleSensorRawBufferPoolsSupported
{
  NSDictionary *v2;

  v2 = -[BWFigCaptureStream supportedProperties](self->_stream, "supportedProperties");
  return -[NSDictionary objectForKeyedSubscript:](v2, "objectForKeyedSubscript:", *MEMORY[0x1E0D07760]) != 0;
}

- (BOOL)isNondisruptiveFastSwitchingSupported
{
  NSDictionary *v2;

  v2 = -[BWFigCaptureStream supportedProperties](self->_stream, "supportedProperties");
  return -[NSDictionary objectForKeyedSubscript:](v2, "objectForKeyedSubscript:", *MEMORY[0x1E0D07698]) != 0;
}

- (BWSecureMetadataOutputConfigurator)secureMetadataOutputConfigurator
{
  BWSecureMetadataOutputConfigurator *result;

  result = *(BWSecureMetadataOutputConfigurator **)&self->_deskCamActive;
  if (!result)
  {
    result = objc_alloc_init(BWSecureMetadataOutputConfigurator);
    *(_QWORD *)&self->_deskCamActive = result;
  }
  return result;
}

- (void)performReactionEffect:(id)a3
{
  -[BWFigCaptureStream enqueueReactionEffect:](self->_stream, "enqueueReactionEffect:", a3);
}

- (unsigned)reactionCount
{
  return 0;
}

- (BWFigVideoCaptureStreamDelegate)delegate
{
  return self->_delegate;
}

- (float)pixelsPerMicron
{
  return self->_pixelsPerMicron;
}

- (float)gravityFactor
{
  return self->_gravityFactor;
}

- (float)calibratedRotationAngle
{
  return self->_calibratedRotationAngle;
}

- (float)minimumSupportedFrameRate
{
  return self->_minimumSupportedFrameRate;
}

- (float)aeMaxGain
{
  return *(float *)&self->_maxExposureDurationFrameworkOverride.epoch;
}

- (float)momentCaptureVideoRecordingAEMaxGain
{
  return *((float *)&self->_maxExposureDurationFrameworkOverride.epoch + 1);
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)maxExposureDurationClientOverride
{
  *retstr = *($3CC8671D27C23BF42ADDB32F2B5E48AE *)((char *)self + 852);
  return self;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)maxExposureDurationFrameworkOverride
{
  *retstr = *($3CC8671D27C23BF42ADDB32F2B5E48AE *)((char *)self + 876);
  return self;
}

- (BWFigVideoCaptureStreamStillImageCaptureDelegate)stillImageCaptureDelegate
{
  return self->_streamNotificationDispatchQueue;
}

- (BOOL)usesStillFusionReferenceFramePTSForDidCaptureCallback
{
  return BYTE4(self->_largestStillImagePTS.epoch);
}

- (int)lastStillImageCaptureType
{
  return self->_lastStillImageCaptureType;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)lastStillImagePTS
{
  *(_OWORD *)&retstr->var0 = *(_OWORD *)((char *)&self[21].var0 + 4);
  retstr->var3 = *(int64_t *)((char *)&self[21].var3 + 4);
  return self;
}

- ($115C4C562B26FF47E01F9F4EA65B5887)clientAuditToken
{
  __int128 v3;

  v3 = *(_OWORD *)&self[12].var0[2];
  *(_OWORD *)retstr->var0 = *(_OWORD *)&self[11].var0[6];
  *(_OWORD *)&retstr->var0[4] = v3;
  return self;
}

- (BOOL)digitalFlashEnabled
{
  return self->_band0StrengthModulation;
}

- (BWFaceDetector)faceDetector
{
  return *(BWFaceDetector **)&self->_videoHDRImageStatisticsEnabled;
}

- (BWObjectDetector)objectDetector
{
  return self->_faceDetector;
}

- (BOOL)timeLapseEnabled
{
  return self->_maxExposureDurationHasBeenSet;
}

- (void)setTimeLapseEnabled:(BOOL)a3
{
  self->_maxExposureDurationHasBeenSet = a3;
}

- (BOOL)lowLightVideoEnabled
{
  return *(&self->_maxExposureDurationHasBeenSet + 1);
}

- (BOOL)cinematicVideoEnabled
{
  return *(&self->_maxExposureDurationHasBeenSet + 2);
}

- (int)autoFocusPositionSensorMode
{
  return *(_DWORD *)&self->_unifiedBracketingEnabled;
}

- (BOOL)pixelFormatIsTenBit
{
  return self->_keypointDetectionEnabled;
}

- (BOOL)colorSpaceIsAppleLog
{
  return self->_stillImageKeypointDetectionEnabled;
}

- ($2825F4736939C4A6D3AD43837233062D)videoCaptureDimensions
{
  return *($2825F4736939C4A6D3AD43837233062D *)&self->_timeLapseEnabled;
}

- ($2825F4736939C4A6D3AD43837233062D)sensorDimensions
{
  return *($2825F4736939C4A6D3AD43837233062D *)&self->_aeMaxGain;
}

- (void)setSensorDimensions:(id)a3
{
  *($2825F4736939C4A6D3AD43837233062D *)&self->_aeMaxGain = a3;
}

- (int)continuityCameraClientDeviceClass
{
  return HIDWORD(self->_uniqueID);
}

- (int)videoStabilizationStrength
{
  return HIDWORD(self->_centerStageRectOfInterest.size.height);
}

- (CGPoint)previewShiftAtBaseZoom
{
  double v2;
  double v3;
  _QWORD v4[2];
  CGPoint result;

  objc_copyStruct(v4, &self->_previewShift, 16, 1, 0);
  v2 = *(double *)v4;
  v3 = *(double *)&v4[1];
  result.y = v3;
  result.x = v2;
  return result;
}

- (void)setPreviewShiftAtBaseZoom:(CGPoint)a3
{
  CGPoint v3;

  v3 = a3;
  objc_copyStruct(&self->_previewShift, &v3, 16, 1, 0);
}

- (int)fastSwitchingMainFormatIndex
{
  return self->_fastSwitchingMainFormatIndex;
}

- (void)setFastSwitchingMainFormatIndex:(int)a3
{
  self->_fastSwitchingMainFormatIndex = a3;
}

- (int)multiBandNoiseReductionMode
{
  return (int)self->_stillImageNoiseAndSharpeningParameters;
}

- (void)setPhysicalSensorDimensions:(id)a3
{
  *($2825F4736939C4A6D3AD43837233062D *)&self->_sensorDimensions.height = a3;
}

@end
