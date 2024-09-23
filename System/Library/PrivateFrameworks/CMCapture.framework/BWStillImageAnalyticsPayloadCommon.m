@implementation BWStillImageAnalyticsPayloadCommon

- (BWStillImageAnalyticsPayloadCommon)init
{
  BWStillImageAnalyticsPayloadCommon *v2;
  BWStillImageAnalyticsPayloadCommon *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)BWStillImageAnalyticsPayloadCommon;
  v2 = -[BWStillImageAnalyticsPayloadCommon init](&v5, sel_init);
  v3 = v2;
  if (v2)
    -[BWStillImageAnalyticsPayloadCommon reset](v2, "reset");
  return v3;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)BWStillImageAnalyticsPayloadCommon;
  -[BWStillImageAnalyticsPayloadCommon dealloc](&v3, sel_dealloc);
}

- (void)reset
{
  int32x4_t v3;

  self->_deferred = 0;
  *(_QWORD *)&self->_activeDeviceMask = 0;
  self->_captureType = 0;
  self->_captureFlags = 0;
  self->_sceneFlags = 0;
  *(_OWORD *)&self->_processingDuration = xmmword_1A32B1860;
  v3 = vdupq_n_s32(0x7F7FFFFFu);
  *(_QWORD *)&self->_alsRearLuxLevel = v3.i64[0];
  self->_sensorTemperature = 0x7FFFFFFF;
  *(int32x4_t *)&self->_lensTemperature = v3;
  *(_QWORD *)&self->_SNR = 2139095039;
  *(_DWORD *)&self->_livePhotoEnabled = 0;

  self->_clientApplicationID = 0;
  self->_portType = 0;
  *(_QWORD *)&self->_accelStandardDeviation = v3.i64[0];

  self->_apsSubjectDistance = 0;
  self->_practicalFocalLength = 0;

  self->_focusingMethod = 0;
  *(int32x4_t *)&self->_maxSphereTrackingError = v3;
  *(_QWORD *)&self->_minDistanceFromSphereEndStop = v3.i64[0];
  self->_afPowerConsumption = 3.4028e38;
  self->_depthAFStatus = 0x7FFFFFFF;
  *(_QWORD *)&self->_cameraPosture = 0;

  self->_sphereMode = 0;
  *(_QWORD *)&self->_apsMode = 0;
  *(_QWORD *)&self->_flashBrightnessRatio = v3.i64[0];
  self->_geometricDistortionCorrectionEnabled = 0;

  self->_geometricDistortionCorrectionSource = 0;
  *(_QWORD *)&self->_greenGhostMitigationBrightLightIsBrightScene = -1;
  *(_QWORD *)&self->_greenGhostMitigationLowLightExceedsMaxMaskAverage = -1;
  *(_QWORD *)&self->_greenGhostMitigationLowLightTripodMode = 0x7F7FFFFFFFFFFFFFLL;

  self->_timeOfFlightAssistedAutoFocusEstimatorData = 0;
  self->_leaderFollowerAutoFocusData = 0;
  self->_afDriverShortOccurred = 0;
  *(_QWORD *)&self->_deliveredDimensionWidth = 0;
  *(_QWORD *)&self->_formatMaxFrameRate = 0;
  *(_QWORD *)&self->_formatDimensionWidth = 0;
  *(_QWORD *)((char *)&self->_qualityPrioritization + 2) = 0;
  strcpy((char *)&self->_pixelFormat, "0000");
  self->_outputFileType = 0;
  self->_portraitRequested = 0;

  self->_portraitEffectStatus = 0;
  self->_constituentImageDeliveryDeviceTypes = 0;
  *(_WORD *)&self->_fastCapturePrioritizationEnabled = 0;
  self->_stfStillApplied = 0;
  *(_QWORD *)&self->_stfStillCorrectionStrength = 0;

  self->_timeOfFlightFlickerDetectionData = 0;
  self->_semanticSceneType = -1;
  self->_smartStyleCastType = -1;
  *(_QWORD *)&self->_smartStyleToneBias = 0;
  *(_QWORD *)((char *)&self->_smartStyleColorBias + 2) = 0;
  *(_QWORD *)&self->_swfrForegroundCorrectionDirection = 0;
  *(_QWORD *)&self->_swfrAnalyticsVersion = 0;
  *(_QWORD *)&self->_swfrForegroundCorrectionStrength = 0;

  self->_resolutionFlavor = 0;
  self->_awbStable = 0;
}

- (id)eventName
{
  return 0;
}

- (id)eventDictionary
{
  void *v3;
  NSString *constituentImageDeliveryDeviceTypes;
  NSString *portType;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t imageExifOrientation;
  const __CFString *v11;
  NSString *sphereMode;
  NSString *geometricDistortionCorrectionSource;
  int greenGhostMitigationBrightLightIsBrightScene;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  int greenGhostMitigationBrightLightROIIsComputed;
  uint64_t v19;
  int greenGhostMitigationLowLightExceedsMaxMaskAverage;
  uint64_t v21;
  int greenGhostMitigationLowLightSkipRepair;
  uint64_t v23;
  int greenGhostMitigationLowLightTripodMode;
  uint64_t v25;
  NSDictionary *timeOfFlightAssistedAutoFocusEstimatorData;
  NSDictionary *leaderFollowerAutoFocusData;
  unsigned int v28;
  const __CFString *v29;
  unsigned int v30;
  const __CFString *v31;
  NSString *portraitEffectStatus;
  NSDictionary *timeOfFlightFlickerDetectionData;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  double v39;
  double v40;
  NSString *resolutionFlavor;

  v3 = (void *)objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", self->_numberOfFaces), CFSTR("numberOfFaces"));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", +[BWCoreAnalyticsReporter clientApplicationIDType:](BWCoreAnalyticsReporter, "clientApplicationIDType:", self->_clientApplicationID)), CFSTR("clientIDType"));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", self->_clientApplicationID, CFSTR("clientApplicationID"));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_livePhotoEnabled), CFSTR("livePhotoEnabled"));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_depthEnabled), CFSTR("depthEnabled"));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_timeLapse), CFSTR("timeLapse"));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_burst), CFSTR("burst"));
  if (self->_activeDeviceMask)
    objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:"), CFSTR("activeDeviceMask"));
  if (self->_devicePosition)
    objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:"), CFSTR("devicePosition"));
  constituentImageDeliveryDeviceTypes = self->_constituentImageDeliveryDeviceTypes;
  if (constituentImageDeliveryDeviceTypes)
    objc_msgSend(v3, "setObject:forKeyedSubscript:", constituentImageDeliveryDeviceTypes, CFSTR("constituentImageDeliveryDeviceTypes"));
  if (self->_captureType)
    objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:"), CFSTR("captureType"));
  if (self->_captureFlags)
    objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:"), CFSTR("captureFlags"));
  if (self->_sceneFlags)
    objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:"), CFSTR("sceneFlags"));
  if (self->_processingDuration != 0x7FFFFFFF)
    objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:"), CFSTR("processingDuration"));
  if (self->_streamingTime != -1)
    objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:"), CFSTR("streamingTime"));
  if (self->_luxLevel != 0x7FFFFFFF)
    objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:"), CFSTR("luxLevel"));
  if (self->_alsLuxLevel != 0x7FFFFFFF)
    objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:"), CFSTR("alsLuxLevel"));
  if (self->_alsRearLuxLevel != 3.4028e38)
    objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:"), CFSTR("alsRearLuxLevel"));
  if (self->_lensPosition != 3.4028e38)
    objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:"), CFSTR("lensPosition"));
  if (self->_sensorTemperature != 0x7FFFFFFF)
    objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:"), CFSTR("sensorTemperature"));
  if (self->_lensTemperature != 3.4028e38)
    objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:"), CFSTR("lensTemperature"));
  if (self->_exposureDuration != 3.4028e38)
    objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:"), CFSTR("exposureDuration"));
  if (self->_iso != 3.4028e38)
    objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:"), CFSTR("iso"));
  if (self->_normalizedSNR != 3.4028e38)
    objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:"), CFSTR("normalizedSNR"));
  if (self->_SNR != 3.4028e38)
    objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:"), CFSTR("SNR"));
  portType = self->_portType;
  if (portType)
    objc_msgSend(v3, "setObject:forKeyedSubscript:", portType, CFSTR("portType"));
  if (self->_accelStandardDeviation != 3.4028e38)
    objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:"), CFSTR("accelStd"));
  if (self->_gyroStandardDeviation != 3.4028e38)
    objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:"), CFSTR("gyroStd"));
  v6 = *MEMORY[0x1E0D05A18];
  objc_msgSend(v3, "setObject:forKeyedSubscript:", -[NSDictionary objectForKeyedSubscript:](self->_apsSubjectDistance, "objectForKeyedSubscript:", *MEMORY[0x1E0D05A18]), CFSTR("apsSubjectDistanceWide"));
  v7 = *MEMORY[0x1E0D05A30];
  objc_msgSend(v3, "setObject:forKeyedSubscript:", -[NSDictionary objectForKeyedSubscript:](self->_apsSubjectDistance, "objectForKeyedSubscript:", *MEMORY[0x1E0D05A30]), CFSTR("apsSubjectDistanceTele"));
  v8 = *MEMORY[0x1E0D05A28];
  objc_msgSend(v3, "setObject:forKeyedSubscript:", -[NSDictionary objectForKeyedSubscript:](self->_apsSubjectDistance, "objectForKeyedSubscript:", *MEMORY[0x1E0D05A28]), CFSTR("apsSubjectDistanceSuperwide"));
  v9 = *MEMORY[0x1E0D05A38];
  objc_msgSend(v3, "setObject:forKeyedSubscript:", -[NSDictionary objectForKeyedSubscript:](self->_apsSubjectDistance, "objectForKeyedSubscript:", *MEMORY[0x1E0D05A38]), CFSTR("apsSubjectDistanceFront"));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", -[NSDictionary objectForKeyedSubscript:](self->_practicalFocalLength, "objectForKeyedSubscript:", v6), CFSTR("apsPFLWide"));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", -[NSDictionary objectForKeyedSubscript:](self->_practicalFocalLength, "objectForKeyedSubscript:", v7), CFSTR("apsPFLTele"));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", -[NSDictionary objectForKeyedSubscript:](self->_practicalFocalLength, "objectForKeyedSubscript:", v8), CFSTR("apsPFLSuperwide"));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", -[NSDictionary objectForKeyedSubscript:](self->_practicalFocalLength, "objectForKeyedSubscript:", v9), CFSTR("apsPFLFront"));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", -[NSDictionary objectForKeyedSubscript:](self->_focusingMethod, "objectForKeyedSubscript:", v6), CFSTR("focusMethodWide"));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", -[NSDictionary objectForKeyedSubscript:](self->_focusingMethod, "objectForKeyedSubscript:", v7), CFSTR("focusMethodTele"));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", -[NSDictionary objectForKeyedSubscript:](self->_focusingMethod, "objectForKeyedSubscript:", v8), CFSTR("focusMethodSuperWide"));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", -[NSDictionary objectForKeyedSubscript:](self->_focusingMethod, "objectForKeyedSubscript:", v9), CFSTR("focusMethodFront"));
  if (self->_maxSphereTrackingError != 3.4028e38)
    objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:"), CFSTR("oisMaxTrackError"));
  if (self->_stdSphereTrackingError != 3.4028e38)
    objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:"), CFSTR("oisStdTrackError"));
  if (self->_maxAFTrackingError != 3.4028e38)
    objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:"), CFSTR("afMaxTrackError"));
  if (self->_stdAFTrackingError != 3.4028e38)
    objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:"), CFSTR("afStdTrackError"));
  if (self->_minDistanceFromSphereEndStop != 3.4028e38)
    objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:"), CFSTR("oisMinDistFromEndStop"));
  if (self->_spherePowerConsumption != 3.4028e38)
    objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:"), CFSTR("oisPower"));
  if (self->_afPowerConsumption != 3.4028e38)
    objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:"), CFSTR("afPower"));
  if (self->_depthAFStatus != 0x7FFFFFFF)
    objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:"), CFSTR("depthAFStatus"));
  if (self->_cameraPosture)
    objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:"), CFSTR("cameraPosture"));
  imageExifOrientation = self->_imageExifOrientation;
  if (imageExifOrientation > 8)
    v11 = CFSTR("Landscape");
  else
    v11 = (const __CFString *)qword_1E4923DE8[imageExifOrientation];
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v11, CFSTR("imageOrientation"));
  sphereMode = self->_sphereMode;
  if (sphereMode)
    objc_msgSend(v3, "setObject:forKeyedSubscript:", sphereMode, CFSTR("oisMode"));
  if (self->_apsMode)
    objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:"), CFSTR("afMode"));
  if (self->_timeSinceLastCaptureInSession)
    objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:"), CFSTR("timeSinceLastCaptureInSession"));
  if (self->_flashBrightnessRatio != 3.4028e38)
    objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:"), CFSTR("flashBrightnessRatio"));
  if (self->_effectiveIntegrationTime != 3.4028e38)
    objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:"), CFSTR("effectiveIntegrationTime"));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_geometricDistortionCorrectionEnabled), CFSTR("geometricDistortionCorrectionEnabled"));
  geometricDistortionCorrectionSource = self->_geometricDistortionCorrectionSource;
  if (geometricDistortionCorrectionSource)
    objc_msgSend(v3, "setObject:forKeyedSubscript:", geometricDistortionCorrectionSource, CFSTR("geometricDistortionCorrectionSource"));
  greenGhostMitigationBrightLightIsBrightScene = self->_greenGhostMitigationBrightLightIsBrightScene;
  v15 = MEMORY[0x1E0C9AAB0];
  v16 = MEMORY[0x1E0C9AAA0];
  if (greenGhostMitigationBrightLightIsBrightScene != -1)
  {
    if (greenGhostMitigationBrightLightIsBrightScene)
      v17 = MEMORY[0x1E0C9AAB0];
    else
      v17 = MEMORY[0x1E0C9AAA0];
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v17, CFSTR("greenGhostMitigationBrightLightIsBrightScene"));
  }
  greenGhostMitigationBrightLightROIIsComputed = self->_greenGhostMitigationBrightLightROIIsComputed;
  if (greenGhostMitigationBrightLightROIIsComputed != -1)
  {
    if (greenGhostMitigationBrightLightROIIsComputed)
      v19 = v15;
    else
      v19 = v16;
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v19, CFSTR("greenGhostMitigationBrightLightROIIsComputed"));
  }
  greenGhostMitigationLowLightExceedsMaxMaskAverage = self->_greenGhostMitigationLowLightExceedsMaxMaskAverage;
  if (greenGhostMitigationLowLightExceedsMaxMaskAverage != -1)
  {
    if (greenGhostMitigationLowLightExceedsMaxMaskAverage)
      v21 = v15;
    else
      v21 = v16;
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v21, CFSTR("greenGhostMitigationLowLightExceedsMaxMaskAverage"));
  }
  greenGhostMitigationLowLightSkipRepair = self->_greenGhostMitigationLowLightSkipRepair;
  if (greenGhostMitigationLowLightSkipRepair != -1)
  {
    if (greenGhostMitigationLowLightSkipRepair)
      v23 = v15;
    else
      v23 = v16;
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v23, CFSTR("greenGhostMitigationLowLightSkipRepair"));
  }
  greenGhostMitigationLowLightTripodMode = self->_greenGhostMitigationLowLightTripodMode;
  if (greenGhostMitigationLowLightTripodMode != -1)
  {
    if (greenGhostMitigationLowLightTripodMode)
      v25 = v15;
    else
      v25 = v16;
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v25, CFSTR("greenGhostMitigationLowLightTripodMode"));
  }
  if (self->_greenGhostMitigationLowLightMaskAverage != 3.4028e38)
    objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:"), CFSTR("greenGhostMitigationLowLightMaskAverage"));
  timeOfFlightAssistedAutoFocusEstimatorData = self->_timeOfFlightAssistedAutoFocusEstimatorData;
  if (timeOfFlightAssistedAutoFocusEstimatorData)
  {
    objc_msgSend(v3, "setObject:forKeyedSubscript:", -[NSDictionary objectForKeyedSubscript:](timeOfFlightAssistedAutoFocusEstimatorData, "objectForKeyedSubscript:", *MEMORY[0x1E0D07D50]), CFSTR("tofAFMeasuredDepth"));
    objc_msgSend(v3, "setObject:forKeyedSubscript:", -[NSDictionary objectForKeyedSubscript:](self->_timeOfFlightAssistedAutoFocusEstimatorData, "objectForKeyedSubscript:", *MEMORY[0x1E0D07D58]), CFSTR("tofAFPFLError"));
    objc_msgSend(v3, "setObject:forKeyedSubscript:", -[NSDictionary objectForKeyedSubscript:](self->_timeOfFlightAssistedAutoFocusEstimatorData, "objectForKeyedSubscript:", *MEMORY[0x1E0D07D68]), CFSTR("tofAFSensorConfidence"));
    objc_msgSend(v3, "setObject:forKeyedSubscript:", -[NSDictionary objectForKeyedSubscript:](self->_timeOfFlightAssistedAutoFocusEstimatorData, "objectForKeyedSubscript:", *MEMORY[0x1E0D07D38]), CFSTR("tofAFEstimatorCorrectionApplied"));
    objc_msgSend(v3, "setObject:forKeyedSubscript:", -[NSDictionary objectForKeyedSubscript:](self->_timeOfFlightAssistedAutoFocusEstimatorData, "objectForKeyedSubscript:", *MEMORY[0x1E0D07D60]), CFSTR("tofAFROIType"));
    objc_msgSend(v3, "setObject:forKeyedSubscript:", -[NSDictionary objectForKeyedSubscript:](self->_timeOfFlightAssistedAutoFocusEstimatorData, "objectForKeyedSubscript:", *MEMORY[0x1E0D07D30]), CFSTR("tofAFContainsBlindSpot"));
    objc_msgSend(v3, "setObject:forKeyedSubscript:", -[NSDictionary objectForKeyedSubscript:](self->_timeOfFlightAssistedAutoFocusEstimatorData, "objectForKeyedSubscript:", *MEMORY[0x1E0D07D40]), CFSTR("tofAFMSPMeasuredDepth"));
    objc_msgSend(v3, "setObject:forKeyedSubscript:", -[NSDictionary objectForKeyedSubscript:](self->_timeOfFlightAssistedAutoFocusEstimatorData, "objectForKeyedSubscript:", *MEMORY[0x1E0D07D48]), CFSTR("tofAFMSPSensorConfidence"));
  }
  leaderFollowerAutoFocusData = self->_leaderFollowerAutoFocusData;
  if (leaderFollowerAutoFocusData)
  {
    objc_msgSend(v3, "setObject:forKeyedSubscript:", -[NSDictionary objectForKeyedSubscript:](leaderFollowerAutoFocusData, "objectForKeyedSubscript:", *MEMORY[0x1E0D06630]), CFSTR("lfAFLeaderDepth"));
    objc_msgSend(v3, "setObject:forKeyedSubscript:", -[NSDictionary objectForKeyedSubscript:](self->_leaderFollowerAutoFocusData, "objectForKeyedSubscript:", *MEMORY[0x1E0D06650]), CFSTR("lfAFPFLError"));
    objc_msgSend(v3, "setObject:forKeyedSubscript:", -[NSDictionary objectForKeyedSubscript:](self->_leaderFollowerAutoFocusData, "objectForKeyedSubscript:", *MEMORY[0x1E0D06628]), CFSTR("lfAFLeaderDefocus"));
    objc_msgSend(v3, "setObject:forKeyedSubscript:", -[NSDictionary objectForKeyedSubscript:](self->_leaderFollowerAutoFocusData, "objectForKeyedSubscript:", *MEMORY[0x1E0D06640]), CFSTR("lfAFLeaderLensPosition"));
    objc_msgSend(v3, "setObject:forKeyedSubscript:", -[NSDictionary objectForKeyedSubscript:](self->_leaderFollowerAutoFocusData, "objectForKeyedSubscript:", *MEMORY[0x1E0D06638]), CFSTR("lfAFFocusMethod"));
    objc_msgSend(v3, "setObject:forKeyedSubscript:", -[NSDictionary objectForKeyedSubscript:](self->_leaderFollowerAutoFocusData, "objectForKeyedSubscript:", *MEMORY[0x1E0D06620]), CFSTR("lfAFLeaderConfidence"));
    objc_msgSend(v3, "setObject:forKeyedSubscript:", -[NSDictionary objectForKeyedSubscript:](self->_leaderFollowerAutoFocusData, "objectForKeyedSubscript:", *MEMORY[0x1E0D06648]), CFSTR("lfAFLeaderROIType"));
  }
  objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_afDriverShortOccurred), CFSTR("afDriverShortOccurred"));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", self->_formatDimensionWidth), CFSTR("formatDimensionWidth"));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", self->_formatDimensionHeight), CFSTR("formatDimensionHeight"));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", self->_deliveredDimensionWidth), CFSTR("deliveredDimensionWidth"));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", self->_deliveredDimensionHeight), CFSTR("deliveredDimensionHeight"));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", self->_formatMaxFrameRate), CFSTR("formatMaxFrameRate"));
  v28 = self->_qualityPrioritization - 1;
  if (v28 > 2)
    v29 = CFSTR("Invalid");
  else
    v29 = off_1E4923DD0[v28];
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v29, CFSTR("qualityPrioritization"));
  v30 = self->_clientRequestedQualityPrioritization - 1;
  if (v30 > 2)
    v31 = CFSTR("Invalid");
  else
    v31 = off_1E4923DD0[v30];
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v31, CFSTR("clientRequestedQualityPrioritization"));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_highQualityPhotoWithVideoFormatSupported), CFSTR("highQualityPhotoWithVideoFormatSupported"));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_photoFormat), CFSTR("photoFormat"));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%c%c%c%c"), HIBYTE(self->_pixelFormat), BYTE2(self->_pixelFormat), BYTE1(self->_pixelFormat), self->_pixelFormat), CFSTR("pixelFormat"));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_binned), CFSTR("binned"));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", self->_outputFileType), CFSTR("outputFileType"));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_portraitRequested), CFSTR("portraitRequested"));
  portraitEffectStatus = self->_portraitEffectStatus;
  if (portraitEffectStatus)
    objc_msgSend(v3, "setObject:forKeyedSubscript:", portraitEffectStatus, CFSTR("portraitEffectStatus"));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_fastCapturePrioritizationEnabled), CFSTR("fastCapturePrioritizationEnabled"));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_stfStillSupported), CFSTR("stfStillSupported"));
  if (self->_stfStillSupported)
  {
    objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_stfStillApplied), CFSTR("stfStillApplied"));
    if (self->_stfStillApplied)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", self->_stfStillCorrectionStrength), CFSTR("stfStillCorrectionStrength"));
      objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", self->_stfStillAnalyticsVersion), CFSTR("stfStillAnalyticsVersion"));
    }
  }
  timeOfFlightFlickerDetectionData = self->_timeOfFlightFlickerDetectionData;
  if (timeOfFlightFlickerDetectionData)
  {
    objc_msgSend(v3, "setObject:forKeyedSubscript:", -[NSDictionary objectForKeyedSubscript:](timeOfFlightFlickerDetectionData, "objectForKeyedSubscript:", *MEMORY[0x1E0D07E58]), CFSTR("tofFlickerDetectionStatus"));
    objc_msgSend(v3, "setObject:forKeyedSubscript:", -[NSDictionary objectForKeyedSubscript:](self->_timeOfFlightFlickerDetectionData, "objectForKeyedSubscript:", *MEMORY[0x1E0D07E50]), CFSTR("tofFlickerDetectionDC2ACRatio"));
    objc_msgSend(v3, "setObject:forKeyedSubscript:", -[NSDictionary objectForKeyedSubscript:](self->_timeOfFlightFlickerDetectionData, "objectForKeyedSubscript:", *MEMORY[0x1E0D07E48]), CFSTR("tofFlickerDetectionDC2ACConfidence"));
    objc_msgSend(v3, "setObject:forKeyedSubscript:", -[NSDictionary objectForKeyedSubscript:](self->_timeOfFlightFlickerDetectionData, "objectForKeyedSubscript:", *MEMORY[0x1E0D07E40]), CFSTR("tofFlickerDetectionCNISNR"));
    objc_msgSend(v3, "setObject:forKeyedSubscript:", -[NSDictionary objectForKeyedSubscript:](self->_timeOfFlightFlickerDetectionData, "objectForKeyedSubscript:", *MEMORY[0x1E0D07E38]), CFSTR("tofFlickerDetectionCNIRatio"));
    objc_msgSend(v3, "setObject:forKeyedSubscript:", -[NSDictionary objectForKeyedSubscript:](self->_timeOfFlightFlickerDetectionData, "objectForKeyedSubscript:", *MEMORY[0x1E0D07E28]), CFSTR("tofFlickerDetectionCNIChannelDiff"));
    objc_msgSend(v3, "setObject:forKeyedSubscript:", -[NSDictionary objectForKeyedSubscript:](self->_timeOfFlightFlickerDetectionData, "objectForKeyedSubscript:", *MEMORY[0x1E0D07E30]), CFSTR("tofFlickerDetectionCNIPeakIndDiff"));
  }
  if (self->_semanticStyleRenderingSupported)
  {
    objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", self->_semanticSceneType), CFSTR("semanticSceneType"));
    *(float *)&v34 = self->_semanticStyleToneBias;
    objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v34), CFSTR("semanticStyleToneBias"));
    *(float *)&v35 = self->_semanticStyleWarmthBias;
    objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v35), CFSTR("semanticStyleWarmthBias"));
  }
  if (self->_smartStyleRenderingSupported)
  {
    objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", self->_smartStyleCastType), CFSTR("smartStyleCastType"));
    *(float *)&v36 = self->_smartStyleToneBias;
    objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v36), CFSTR("smartStyleToneBias"));
    *(float *)&v37 = self->_smartStyleColorBias;
    objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v37), CFSTR("smartStyleColorBias"));
    *(float *)&v38 = self->_smartStyleIntensity;
    objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v38), CFSTR("smartStyleIntensity"));
  }
  objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_depthDataDeliveryEnabled), CFSTR("depthDataDeliveryEnabled"));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_swfrApplied), CFSTR("swfrApplied"));
  if (self->_swfrApplied)
  {
    objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", self->_swfrForegroundCorrectionStrength), CFSTR("swfrForegroundCorrectionStrength"));
    objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", self->_swfrBackgroundCorrectionStrength), CFSTR("swfrBackgroundCorrectionStrength"));
    *(float *)&v39 = self->_swfrForegroundCorrectionDirection;
    objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v39), CFSTR("swfrForegroundCorrectionDirection"));
    *(float *)&v40 = self->_swfrBackgroundCorrectionDirection;
    objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v40), CFSTR("swfrBackgroundCorrectionDirection"));
    objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", self->_swfrAnalyticsVersion), CFSTR("swfrAnalyticsVersion"));
  }
  objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", self->_redEyeReductionStatus), CFSTR("redEyeReductionStatus"));
  resolutionFlavor = self->_resolutionFlavor;
  if (resolutionFlavor)
    objc_msgSend(v3, "setObject:forKeyedSubscript:", resolutionFlavor, CFSTR("resolutionFlavor"));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_awbStable), CFSTR("awbStable"));
  return v3;
}

- (BOOL)deferred
{
  return self->_deferred;
}

- (void)setDeferred:(BOOL)a3
{
  self->_deferred = a3;
}

- (int)activeDeviceMask
{
  return self->_activeDeviceMask;
}

- (void)setActiveDeviceMask:(int)a3
{
  self->_activeDeviceMask = a3;
}

- (int)devicePosition
{
  return self->_devicePosition;
}

- (void)setDevicePosition:(int)a3
{
  self->_devicePosition = a3;
}

- (NSString)constituentImageDeliveryDeviceTypes
{
  return self->_constituentImageDeliveryDeviceTypes;
}

- (void)setConstituentImageDeliveryDeviceTypes:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 24);
}

- (int)captureType
{
  return self->_captureType;
}

- (void)setCaptureType:(int)a3
{
  self->_captureType = a3;
}

- (unint64_t)captureFlags
{
  return self->_captureFlags;
}

- (void)setCaptureFlags:(unint64_t)a3
{
  self->_captureFlags = a3;
}

- (unint64_t)sceneFlags
{
  return self->_sceneFlags;
}

- (void)setSceneFlags:(unint64_t)a3
{
  self->_sceneFlags = a3;
}

- (int)processingDuration
{
  return self->_processingDuration;
}

- (void)setProcessingDuration:(int)a3
{
  self->_processingDuration = a3;
}

- (unsigned)streamingTime
{
  return self->_streamingTime;
}

- (void)setStreamingTime:(unsigned int)a3
{
  self->_streamingTime = a3;
}

- (int)luxLevel
{
  return self->_luxLevel;
}

- (void)setLuxLevel:(int)a3
{
  self->_luxLevel = a3;
}

- (int)alsLuxLevel
{
  return self->_alsLuxLevel;
}

- (void)setAlsLuxLevel:(int)a3
{
  self->_alsLuxLevel = a3;
}

- (float)alsRearLuxLevel
{
  return self->_alsRearLuxLevel;
}

- (void)setAlsRearLuxLevel:(float)a3
{
  self->_alsRearLuxLevel = a3;
}

- (float)lensPosition
{
  return self->_lensPosition;
}

- (void)setLensPosition:(float)a3
{
  self->_lensPosition = a3;
}

- (int)sensorTemperature
{
  return self->_sensorTemperature;
}

- (void)setSensorTemperature:(int)a3
{
  self->_sensorTemperature = a3;
}

- (float)lensTemperature
{
  return self->_lensTemperature;
}

- (void)setLensTemperature:(float)a3
{
  self->_lensTemperature = a3;
}

- (float)exposureDuration
{
  return self->_exposureDuration;
}

- (void)setExposureDuration:(float)a3
{
  self->_exposureDuration = a3;
}

- (float)iso
{
  return self->_iso;
}

- (void)setIso:(float)a3
{
  self->_iso = a3;
}

- (float)normalizedSNR
{
  return self->_normalizedSNR;
}

- (void)setNormalizedSNR:(float)a3
{
  self->_normalizedSNR = a3;
}

- (float)SNR
{
  return self->_SNR;
}

- (void)setSNR:(float)a3
{
  self->_SNR = a3;
}

- (int)numberOfFaces
{
  return self->_numberOfFaces;
}

- (void)setNumberOfFaces:(int)a3
{
  self->_numberOfFaces = a3;
}

- (NSString)clientApplicationID
{
  return self->_clientApplicationID;
}

- (void)setClientApplicationID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 112);
}

- (BOOL)livePhotoEnabled
{
  return self->_livePhotoEnabled;
}

- (void)setLivePhotoEnabled:(BOOL)a3
{
  self->_livePhotoEnabled = a3;
}

- (BOOL)depthEnabled
{
  return self->_depthEnabled;
}

- (void)setDepthEnabled:(BOOL)a3
{
  self->_depthEnabled = a3;
}

- (BOOL)timeLapse
{
  return self->_timeLapse;
}

- (void)setTimeLapse:(BOOL)a3
{
  self->_timeLapse = a3;
}

- (BOOL)burst
{
  return self->_burst;
}

- (void)setBurst:(BOOL)a3
{
  self->_burst = a3;
}

- (NSString)portType
{
  return self->_portType;
}

- (void)setPortType:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 128);
}

- (float)accelStandardDeviation
{
  return self->_accelStandardDeviation;
}

- (void)setAccelStandardDeviation:(float)a3
{
  self->_accelStandardDeviation = a3;
}

- (float)gyroStandardDeviation
{
  return self->_gyroStandardDeviation;
}

- (void)setGyroStandardDeviation:(float)a3
{
  self->_gyroStandardDeviation = a3;
}

- (NSDictionary)apsSubjectDistance
{
  return self->_apsSubjectDistance;
}

- (void)setApsSubjectDistance:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 144);
}

- (NSDictionary)practicalFocalLength
{
  return self->_practicalFocalLength;
}

- (void)setPracticalFocalLength:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 152);
}

- (NSDictionary)focusingMethod
{
  return self->_focusingMethod;
}

- (void)setFocusingMethod:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 160);
}

- (float)maxSphereTrackingError
{
  return self->_maxSphereTrackingError;
}

- (void)setMaxSphereTrackingError:(float)a3
{
  self->_maxSphereTrackingError = a3;
}

- (float)stdSphereTrackingError
{
  return self->_stdSphereTrackingError;
}

- (void)setStdSphereTrackingError:(float)a3
{
  self->_stdSphereTrackingError = a3;
}

- (float)maxAFTrackingError
{
  return self->_maxAFTrackingError;
}

- (void)setMaxAFTrackingError:(float)a3
{
  self->_maxAFTrackingError = a3;
}

- (float)stdAFTrackingError
{
  return self->_stdAFTrackingError;
}

- (void)setStdAFTrackingError:(float)a3
{
  self->_stdAFTrackingError = a3;
}

- (float)minDistanceFromSphereEndStop
{
  return self->_minDistanceFromSphereEndStop;
}

- (void)setMinDistanceFromSphereEndStop:(float)a3
{
  self->_minDistanceFromSphereEndStop = a3;
}

- (float)spherePowerConsumption
{
  return self->_spherePowerConsumption;
}

- (void)setSpherePowerConsumption:(float)a3
{
  self->_spherePowerConsumption = a3;
}

- (float)afPowerConsumption
{
  return self->_afPowerConsumption;
}

- (void)setAfPowerConsumption:(float)a3
{
  self->_afPowerConsumption = a3;
}

- (unsigned)depthAFStatus
{
  return self->_depthAFStatus;
}

- (void)setDepthAFStatus:(unsigned int)a3
{
  self->_depthAFStatus = a3;
}

- (unsigned)cameraPosture
{
  return self->_cameraPosture;
}

- (void)setCameraPosture:(unsigned int)a3
{
  self->_cameraPosture = a3;
}

- (int)imageExifOrientation
{
  return self->_imageExifOrientation;
}

- (void)setImageExifOrientation:(int)a3
{
  self->_imageExifOrientation = a3;
}

- (NSString)sphereMode
{
  return self->_sphereMode;
}

- (void)setSphereMode:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 208);
}

- (unsigned)apsMode
{
  return self->_apsMode;
}

- (void)setApsMode:(unsigned int)a3
{
  self->_apsMode = a3;
}

- (unsigned)timeSinceLastCaptureInSession
{
  return self->_timeSinceLastCaptureInSession;
}

- (void)setTimeSinceLastCaptureInSession:(unsigned int)a3
{
  self->_timeSinceLastCaptureInSession = a3;
}

- (float)flashBrightnessRatio
{
  return self->_flashBrightnessRatio;
}

- (void)setFlashBrightnessRatio:(float)a3
{
  self->_flashBrightnessRatio = a3;
}

- (float)effectiveIntegrationTime
{
  return self->_effectiveIntegrationTime;
}

- (void)setEffectiveIntegrationTime:(float)a3
{
  self->_effectiveIntegrationTime = a3;
}

- (BOOL)geometricDistortionCorrectionEnabled
{
  return self->_geometricDistortionCorrectionEnabled;
}

- (void)setGeometricDistortionCorrectionEnabled:(BOOL)a3
{
  self->_geometricDistortionCorrectionEnabled = a3;
}

- (NSString)geometricDistortionCorrectionSource
{
  return self->_geometricDistortionCorrectionSource;
}

- (void)setGeometricDistortionCorrectionSource:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 240);
}

- (int)greenGhostMitigationBrightLightIsBrightScene
{
  return self->_greenGhostMitigationBrightLightIsBrightScene;
}

- (void)setGreenGhostMitigationBrightLightIsBrightScene:(int)a3
{
  self->_greenGhostMitigationBrightLightIsBrightScene = a3;
}

- (int)greenGhostMitigationBrightLightROIIsComputed
{
  return self->_greenGhostMitigationBrightLightROIIsComputed;
}

- (void)setGreenGhostMitigationBrightLightROIIsComputed:(int)a3
{
  self->_greenGhostMitigationBrightLightROIIsComputed = a3;
}

- (int)greenGhostMitigationLowLightExceedsMaxMaskAverage
{
  return self->_greenGhostMitigationLowLightExceedsMaxMaskAverage;
}

- (void)setGreenGhostMitigationLowLightExceedsMaxMaskAverage:(int)a3
{
  self->_greenGhostMitigationLowLightExceedsMaxMaskAverage = a3;
}

- (int)greenGhostMitigationLowLightSkipRepair
{
  return self->_greenGhostMitigationLowLightSkipRepair;
}

- (void)setGreenGhostMitigationLowLightSkipRepair:(int)a3
{
  self->_greenGhostMitigationLowLightSkipRepair = a3;
}

- (int)greenGhostMitigationLowLightTripodMode
{
  return self->_greenGhostMitigationLowLightTripodMode;
}

- (void)setGreenGhostMitigationLowLightTripodMode:(int)a3
{
  self->_greenGhostMitigationLowLightTripodMode = a3;
}

- (float)greenGhostMitigationLowLightMaskAverage
{
  return self->_greenGhostMitigationLowLightMaskAverage;
}

- (void)setGreenGhostMitigationLowLightMaskAverage:(float)a3
{
  self->_greenGhostMitigationLowLightMaskAverage = a3;
}

- (NSDictionary)timeOfFlightAssistedAutoFocusEstimatorData
{
  return self->_timeOfFlightAssistedAutoFocusEstimatorData;
}

- (void)setTimeOfFlightAssistedAutoFocusEstimatorData:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 272);
}

- (NSDictionary)leaderFollowerAutoFocusData
{
  return self->_leaderFollowerAutoFocusData;
}

- (void)setLeaderFollowerAutoFocusData:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 288);
}

- (BOOL)afDriverShortOccurred
{
  return self->_afDriverShortOccurred;
}

- (void)setAfDriverShortOccurred:(BOOL)a3
{
  self->_afDriverShortOccurred = a3;
}

- (int)formatDimensionWidth
{
  return self->_formatDimensionWidth;
}

- (void)setFormatDimensionWidth:(int)a3
{
  self->_formatDimensionWidth = a3;
}

- (int)formatDimensionHeight
{
  return self->_formatDimensionHeight;
}

- (void)setFormatDimensionHeight:(int)a3
{
  self->_formatDimensionHeight = a3;
}

- (int)deliveredDimensionWidth
{
  return self->_deliveredDimensionWidth;
}

- (void)setDeliveredDimensionWidth:(int)a3
{
  self->_deliveredDimensionWidth = a3;
}

- (int)deliveredDimensionHeight
{
  return self->_deliveredDimensionHeight;
}

- (void)setDeliveredDimensionHeight:(int)a3
{
  self->_deliveredDimensionHeight = a3;
}

- (int)formatMaxFrameRate
{
  return self->_formatMaxFrameRate;
}

- (void)setFormatMaxFrameRate:(int)a3
{
  self->_formatMaxFrameRate = a3;
}

- (int)qualityPrioritization
{
  return self->_qualityPrioritization;
}

- (void)setQualityPrioritization:(int)a3
{
  self->_qualityPrioritization = a3;
}

- (int)clientRequestedQualityPrioritization
{
  return self->_clientRequestedQualityPrioritization;
}

- (void)setClientRequestedQualityPrioritization:(int)a3
{
  self->_clientRequestedQualityPrioritization = a3;
}

- (BOOL)highQualityPhotoWithVideoFormatSupported
{
  return self->_highQualityPhotoWithVideoFormatSupported;
}

- (void)setHighQualityPhotoWithVideoFormatSupported:(BOOL)a3
{
  self->_highQualityPhotoWithVideoFormatSupported = a3;
}

- (BOOL)photoFormat
{
  return self->_photoFormat;
}

- (void)setPhotoFormat:(BOOL)a3
{
  self->_photoFormat = a3;
}

- (unsigned)pixelFormat
{
  return self->_pixelFormat;
}

- (void)setPixelFormat:(unsigned int)a3
{
  self->_pixelFormat = a3;
}

- (BOOL)binned
{
  return self->_binned;
}

- (void)setBinned:(BOOL)a3
{
  self->_binned = a3;
}

- (unsigned)outputFileType
{
  return self->_outputFileType;
}

- (void)setOutputFileType:(unsigned int)a3
{
  self->_outputFileType = a3;
}

- (BOOL)portraitRequested
{
  return self->_portraitRequested;
}

- (void)setPortraitRequested:(BOOL)a3
{
  self->_portraitRequested = a3;
}

- (NSString)portraitEffectStatus
{
  return self->_portraitEffectStatus;
}

- (void)setPortraitEffectStatus:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 352);
}

- (BOOL)fastCapturePrioritizationEnabled
{
  return self->_fastCapturePrioritizationEnabled;
}

- (void)setFastCapturePrioritizationEnabled:(BOOL)a3
{
  self->_fastCapturePrioritizationEnabled = a3;
}

- (int)stfStillCorrectionStrength
{
  return self->_stfStillCorrectionStrength;
}

- (void)setStfStillCorrectionStrength:(int)a3
{
  self->_stfStillCorrectionStrength = a3;
}

- (BOOL)stfStillSupported
{
  return self->_stfStillSupported;
}

- (void)setStfStillSupported:(BOOL)a3
{
  self->_stfStillSupported = a3;
}

- (BOOL)stfStillApplied
{
  return self->_stfStillApplied;
}

- (void)setStfStillApplied:(BOOL)a3
{
  self->_stfStillApplied = a3;
}

- (unsigned)stfStillAnalyticsVersion
{
  return self->_stfStillAnalyticsVersion;
}

- (void)setStfStillAnalyticsVersion:(unsigned int)a3
{
  self->_stfStillAnalyticsVersion = a3;
}

- (NSDictionary)timeOfFlightFlickerDetectionData
{
  return self->_timeOfFlightFlickerDetectionData;
}

- (void)setTimeOfFlightFlickerDetectionData:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 280);
}

- (BOOL)semanticStyleRenderingSupported
{
  return self->_semanticStyleRenderingSupported;
}

- (void)setSemanticStyleRenderingSupported:(BOOL)a3
{
  self->_semanticStyleRenderingSupported = a3;
}

- (int)semanticSceneType
{
  return self->_semanticSceneType;
}

- (void)setSemanticSceneType:(int)a3
{
  self->_semanticSceneType = a3;
}

- (float)semanticStyleToneBias
{
  return self->_semanticStyleToneBias;
}

- (void)setSemanticStyleToneBias:(float)a3
{
  self->_semanticStyleToneBias = a3;
}

- (float)semanticStyleWarmthBias
{
  return self->_semanticStyleWarmthBias;
}

- (void)setSemanticStyleWarmthBias:(float)a3
{
  self->_semanticStyleWarmthBias = a3;
}

- (BOOL)smartStyleRenderingSupported
{
  return self->_smartStyleRenderingSupported;
}

- (void)setSmartStyleRenderingSupported:(BOOL)a3
{
  self->_smartStyleRenderingSupported = a3;
}

- (float)smartStyleToneBias
{
  return self->_smartStyleToneBias;
}

- (void)setSmartStyleToneBias:(float)a3
{
  self->_smartStyleToneBias = a3;
}

- (float)smartStyleColorBias
{
  return self->_smartStyleColorBias;
}

- (void)setSmartStyleColorBias:(float)a3
{
  self->_smartStyleColorBias = a3;
}

- (float)smartStyleIntensity
{
  return self->_smartStyleIntensity;
}

- (void)setSmartStyleIntensity:(float)a3
{
  self->_smartStyleIntensity = a3;
}

- (BOOL)depthDataDeliveryEnabled
{
  return self->_depthDataDeliveryEnabled;
}

- (void)setDepthDataDeliveryEnabled:(BOOL)a3
{
  self->_depthDataDeliveryEnabled = a3;
}

- (BOOL)swfrApplied
{
  return self->_swfrApplied;
}

- (void)setSwfrApplied:(BOOL)a3
{
  self->_swfrApplied = a3;
}

- (int)swfrForegroundCorrectionStrength
{
  return self->_swfrForegroundCorrectionStrength;
}

- (void)setSwfrForegroundCorrectionStrength:(int)a3
{
  self->_swfrForegroundCorrectionStrength = a3;
}

- (int)swfrBackgroundCorrectionStrength
{
  return self->_swfrBackgroundCorrectionStrength;
}

- (void)setSwfrBackgroundCorrectionStrength:(int)a3
{
  self->_swfrBackgroundCorrectionStrength = a3;
}

- (float)swfrForegroundCorrectionDirection
{
  return self->_swfrForegroundCorrectionDirection;
}

- (void)setSwfrForegroundCorrectionDirection:(float)a3
{
  self->_swfrForegroundCorrectionDirection = a3;
}

- (float)swfrBackgroundCorrectionDirection
{
  return self->_swfrBackgroundCorrectionDirection;
}

- (void)setSwfrBackgroundCorrectionDirection:(float)a3
{
  self->_swfrBackgroundCorrectionDirection = a3;
}

- (unsigned)swfrAnalyticsVersion
{
  return self->_swfrAnalyticsVersion;
}

- (void)setSwfrAnalyticsVersion:(unsigned int)a3
{
  self->_swfrAnalyticsVersion = a3;
}

- (int)redEyeReductionStatus
{
  return self->_redEyeReductionStatus;
}

- (void)setRedEyeReductionStatus:(int)a3
{
  self->_redEyeReductionStatus = a3;
}

- (NSString)resolutionFlavor
{
  return self->_resolutionFlavor;
}

- (void)setResolutionFlavor:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 440);
}

- (BOOL)awbStable
{
  return self->_awbStable;
}

- (void)setAwbStable:(BOOL)a3
{
  self->_awbStable = a3;
}

- (int)smartStyleCastType
{
  return self->_smartStyleCastType;
}

- (void)setSmartStyleCastType:(int)a3
{
  self->_smartStyleCastType = a3;
}

@end
