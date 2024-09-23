@implementation BWStreamingSessionAnalyticsPayload

- (BWStreamingSessionAnalyticsPayload)init
{
  BWStreamingSessionAnalyticsPayload *v2;
  BWStreamingSessionAnalyticsPayload *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)BWStreamingSessionAnalyticsPayload;
  v2 = -[BWStreamingSessionAnalyticsPayload init](&v5, sel_init);
  v3 = v2;
  if (v2)
    -[BWStreamingSessionAnalyticsPayload reset](v2, "reset");
  return v3;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)BWStreamingSessionAnalyticsPayload;
  -[BWStreamingSessionAnalyticsPayload dealloc](&v3, sel_dealloc);
}

- (void)reset
{
  int32x4_t v3;

  *(_QWORD *)&self->_activeDeviceMask = 0;
  *(_QWORD *)&self->_devicePosition = 0;
  *(_QWORD *)&self->_streamingStartExifOrientation = 0;

  self->_clientApplicationID = 0;
  self->_sunburnDetectOccurred = 0;

  self->_degradedAutoFocusStatus = 0;
  self->_apsMaxDynamicGainDerate = 0;

  self->_apsMaxTopEndDynamicBuffer = 0;
  self->_numberOfSphereJitterDetectAttempts = 0;

  self->_numberOfSphereJitterDetects = 0;
  self->_actuatorVendor = 0;

  *(_OWORD *)&self->_longestButtonMashingEventAtRate0 = 0u;
  *(_OWORD *)&self->_numberOfButtonMashingCapturesAtRate0 = 0u;
  *(_OWORD *)&self->_numberOfBalancedPhotoCaptures = 0u;
  *(_OWORD *)&self->_sphereMode = 0u;
  v3 = vdupq_n_s32(0x7F7FFFFFu);
  *(int32x4_t *)&self->_structuredLightIdleTemperatureFirstReading = v3;
  *(_QWORD *)&self->_structuredLightActiveTemperatureAverage = v3.i64[0];
  self->_infaredSensorTemperatureAverage = 3.4028e38;

  self->_sensorTemperatureStats = 0;
  self->_infraredProjectorUptimeInMsForLowPowerSparse = -1;
  self->_infraredProjectorUptimeInMsForHighPowerSparse = -1;
  *(_QWORD *)&self->_averageSystemPressureLevel = 0;
  self->_timeToCriticalSystemPressureInMS = -1;
  self->_systemPressureFactors = 0;
  *(_WORD *)&self->_cinematicFramingSupported = 0;
  *(_QWORD *)&self->_cinematicFramingControlMode = 0xFFFFFFFFLL;
  *(_WORD *)&self->_backgroundBlurSupported = 0;
  self->_backgroundBlurTime = 0;
  self->_backgroundBlurApertureChanged = 0;
  self->_backgroundBlurAperture = -1.0;
  *(_WORD *)&self->_studioLightingSupported = 0;
  self->_studioLightingTime = 0;
  self->_studioLightingIntensityChanged = 0;
  self->_studioLightingIntensity = -1.0;
  self->_backgroundReplacementTime = 0;
  *(_WORD *)&self->_backgroundReplacementPixelBufferChanged = 0;
  *(_QWORD *)&self->_orientationPortraitTime = 0;
  *(_QWORD *)&self->_orientationFaceUpTime = 0;
  *(unsigned int *)((char *)&self->_orientationFaceDownTime + 3) = 0;
  *(_QWORD *)&self->_reactionsCount = 0;
  *(_QWORD *)((char *)&self->_reactionsEffectsEnabledTime + 2) = 0;
  *(_QWORD *)&self->_cinematicVideoAverageRenderingTime = 0x7F7FFFFF7F7FFFFFLL;
  *(_QWORD *)&self->_timeOfFlightAssistedAutoFocusStreamingTimeAt0FPS = 0;
  *(_QWORD *)&self->_timeOfFlightAssistedAutoFocusStreamingTimeAt8FPS = 0;
  *(_QWORD *)&self->_captureDeviceType = 0x7F7FFFFFFFFFFFFFLL;
  self->_depthFormatDimensionWidth = -1;
  *(_QWORD *)&self->_depthFormatDimensionHeight = 0xFFFFFFFFLL;
  *(_WORD *)&self->_depthDataFiltered = 0;
  self->_faceDrivenAFDisabledCount = -1;
  *(_QWORD *)&self->_faceDrivenAEDisabledCount = -1;
  *(_QWORD *)&self->_minLuxValue = 0x80000000800000;
  self->_averageLuxValue = 1.1755e-38;
  self->_photoFormat = 0;
  self->_thermalThrottledTime = 0;
  *(_QWORD *)&self->_continuityCameraClientDeviceClass = 0x3030303000000000;
  self->_highlightRecoveryEnabled = 0;
  self->_videoDimensions = 0;
  *(_QWORD *)&self->_minimumFrameRate = 0;
  *(_QWORD *)&self->_minimumSupportedFrameRate = 0;
  *(_QWORD *)((char *)&self->_maximumFrameRate + 1) = 0;
  self->_colorSpace = -1;
  self->_clientIsVOIP = 0;
}

- (id)eventName
{
  return CFSTR("com.apple.coremedia.camera.StreamingSession");
}

- (id)eventDictionary
{
  void *v3;
  uint64_t streamingStartExifOrientation;
  const __CFString *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  BWStreamingSessionAnalyticsPayload *v12;
  uint64_t v13;
  double v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  __CFString *v18;
  const __CFString *v19;
  id v20;
  void *v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  void *v25;
  uint64_t v26;
  void *v27;
  double v28;
  double v29;
  double v30;
  uint64_t v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  int continuityCameraClientDeviceClass;
  const __CFString *v40;
  const __CFString *v41;
  uint64_t v42;
  double v43;
  double v44;
  double v45;
  double v46;
  double v47;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  NSDictionary *obj;
  uint64_t v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  _BYTE v58[128];
  uint64_t v59;

  v59 = *MEMORY[0x1E0C80C00];
  v3 = (void *)objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", +[BWCoreAnalyticsReporter clientApplicationIDType:](BWCoreAnalyticsReporter, "clientApplicationIDType:", self->_clientApplicationID)), CFSTR("clientIDType"));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", self->_clientApplicationID, CFSTR("clientApplicationID"));
  if (self->_activeDeviceMask)
    objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:"), CFSTR("activeDeviceMask"));
  if (self->_deviceType)
    objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:"), CFSTR("deviceType"));
  if (self->_devicePosition)
    objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:"), CFSTR("devicePosition"));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", self->_startingCameraPosture), CFSTR("startingCameraPosture"));
  streamingStartExifOrientation = self->_streamingStartExifOrientation;
  if (streamingStartExifOrientation > 8)
    v5 = CFSTR("Landscape");
  else
    v5 = (const __CFString *)qword_1E4923DE8[streamingStartExifOrientation];
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("startingCameraOrientation"));
  if (self->_streamingTime)
    objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:"), CFSTR("streamingTime"));
  v6 = *MEMORY[0x1E0D05A18];
  objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[NSSet containsObject:](self->_sunburnDetectOccurred, "containsObject:", *MEMORY[0x1E0D05A18])), CFSTR("sunburnDetectOccurredWide"));
  v7 = *MEMORY[0x1E0D05A30];
  objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[NSSet containsObject:](self->_sunburnDetectOccurred, "containsObject:", *MEMORY[0x1E0D05A30])), CFSTR("sunburnDetectOccurredTele"));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", objc_msgSend(-[NSDictionary objectForKeyedSubscript:](self->_degradedAutoFocusStatus, "objectForKeyedSubscript:", v6), "intValue")), CFSTR("degradedAutoFocusStatusWide"));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", objc_msgSend(-[NSDictionary objectForKeyedSubscript:](self->_degradedAutoFocusStatus, "objectForKeyedSubscript:", v7), "intValue")), CFSTR("degradedAutoFocusStatusTele"));
  v8 = *MEMORY[0x1E0D05A28];
  objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", objc_msgSend(-[NSDictionary objectForKeyedSubscript:](self->_degradedAutoFocusStatus, "objectForKeyedSubscript:", *MEMORY[0x1E0D05A28]), "intValue")), CFSTR("degradedAutoFocusStatusSuperwide"));
  v9 = *MEMORY[0x1E0D05A38];
  objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", objc_msgSend(-[NSDictionary objectForKeyedSubscript:](self->_degradedAutoFocusStatus, "objectForKeyedSubscript:", *MEMORY[0x1E0D05A38]), "intValue")), CFSTR("degradedAutoFocusStatusFront"));
  v10 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(-[NSDictionary objectForKeyedSubscript:](self->_apsMaxDynamicGainDerate, "objectForKeyedSubscript:", v6), "floatValue");
  objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(v10, "numberWithFloat:"), CFSTR("apsMaxDynamicGainDerateWide"));
  v11 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(-[NSDictionary objectForKeyedSubscript:](self->_apsMaxTopEndDynamicBuffer, "objectForKeyedSubscript:", v6), "floatValue");
  objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(v11, "numberWithFloat:"), CFSTR("apsMaxTopEndDynamicBufferWide"));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", objc_msgSend(-[NSDictionary objectForKeyedSubscript:](self->_numberOfSphereJitterDetectAttempts, "objectForKeyedSubscript:", v6), "intValue")), CFSTR("numberOfSphereJitterDetectAttemptsWide"));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", objc_msgSend(-[NSDictionary objectForKeyedSubscript:](self->_numberOfSphereJitterDetectAttempts, "objectForKeyedSubscript:", v7), "intValue")), CFSTR("numberOfSphereJitterDetectAttemptsTele"));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", objc_msgSend(-[NSDictionary objectForKeyedSubscript:](self->_numberOfSphereJitterDetects, "objectForKeyedSubscript:", v6), "intValue")), CFSTR("numberOfSphereJitterDetectsWide"));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", objc_msgSend(-[NSDictionary objectForKeyedSubscript:](self->_numberOfSphereJitterDetects, "objectForKeyedSubscript:", v7), "intValue")), CFSTR("numberOfSphereJitterDetectsTele"));
  v53 = v6;
  objc_msgSend(v3, "setObject:forKeyedSubscript:", -[NSDictionary objectForKeyedSubscript:](self->_actuatorVendor, "objectForKeyedSubscript:", v6), CFSTR("actuatorVendorWide"));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", -[NSDictionary objectForKeyedSubscript:](self->_actuatorVendor, "objectForKeyedSubscript:", v7), CFSTR("actuatorVendorTele"));
  v51 = v8;
  objc_msgSend(v3, "setObject:forKeyedSubscript:", -[NSDictionary objectForKeyedSubscript:](self->_actuatorVendor, "objectForKeyedSubscript:", v8), CFSTR("actuatorVendorSuperWide"));
  v50 = v9;
  objc_msgSend(v3, "setObject:forKeyedSubscript:", -[NSDictionary objectForKeyedSubscript:](self->_actuatorVendor, "objectForKeyedSubscript:", v9), CFSTR("actuatorVendorFront"));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", self->_sphereMode, CFSTR("sphereMode"));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", self->_numberOfPhotoCaptures), CFSTR("numberOfPhotoCaptures"));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", self->_numberOfBurstPhotoCaptures), CFSTR("numberOfBurstPhotoCaptures"));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", self->_numberOfBalancedPhotoCaptures), CFSTR("numberOfBalancedPhotoCaptures"));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", self->_timeToFirstPhotoCapture), CFSTR("timeToFirstPhotoCapture"));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", self->_maxTimeSinceLastPhotoCapture), CFSTR("maxTimeSinceLastPhotoCapture"));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", self->_minTimeSinceLastPhotoCapture), CFSTR("minTimeSinceLastPhotoCapture"));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", self->_numberOfButtonMashingCapturesAtRate0), CFSTR("numberOfButtonMashingCapturesAtRate0"));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", self->_numberOfButtonMashingCapturesAtRate1), CFSTR("numberOfButtonMashingCapturesAtRate1"));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", self->_numberOfButtonMashingEventsAtRate0), CFSTR("numberOfButtonMashingEventsAtRate0"));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", self->_numberOfButtonMashingEventsAtRate1), CFSTR("numberOfButtonMashingEventsAtRate1"));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", self->_longestButtonMashingEventAtRate0), CFSTR("longestButtonMashingEventAtRate0"));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", self->_longestButtonMashingEventAtRate1), CFSTR("longestButtonMashingEventAtRate1"));
  if (self->_timeOfFlightCameraProjectorModeMask)
    objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:"), CFSTR("timeOfFlightCameraProjectorModeMask"));
  if (self->_timeOfFlightCameraUsageTypeMask)
    objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:"), CFSTR("timeOfFlightCameraUsageTypeMask"));
  if (self->_structuredLightIdleTemperatureFirstReading != 3.4028e38)
    objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:"), CFSTR("structuredLightIdleTemperatureFirstReading"));
  if (self->_structuredLightActiveTemperatureFirstReading != 3.4028e38)
    objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:"), CFSTR("structuredLightActiveTemperatureFirstReading"));
  if (self->_structuredLightActiveTemperatureLastReading != 3.4028e38)
    objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:"), CFSTR("structuredLightActiveTemperatureLastReading"));
  if (self->_structuredLightActiveTemperatureRange != 3.4028e38)
    objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:"), CFSTR("structuredLightActiveTemperatureRange"));
  if (self->_structuredLightActiveTemperatureAverage != 3.4028e38)
    objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:"), CFSTR("structuredLightActiveTemperatureAverage"));
  if (self->_infaredSensorTemperatureRange != 3.4028e38)
    objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:"), CFSTR("infaredSensorTemperatureRange"));
  if (self->_infaredSensorTemperatureAverage != 3.4028e38)
    objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:"), CFSTR("infaredSensorTemperatureAverage"));
  v56 = 0u;
  v57 = 0u;
  v54 = 0u;
  v55 = 0u;
  v12 = self;
  obj = self->_sensorTemperatureStats;
  v13 = -[NSDictionary countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v54, v58, 16);
  if (v13)
  {
    v15 = v13;
    v16 = *(_QWORD *)v55;
    v49 = *MEMORY[0x1E0D05A50];
    do
    {
      for (i = 0; i != v15; ++i)
      {
        if (*(_QWORD *)v55 != v16)
          objc_enumerationMutation(obj);
        v18 = *(__CFString **)(*((_QWORD *)&v54 + 1) + 8 * i);
        v19 = CFSTR("Wide");
        if ((-[__CFString isEqualToString:](v18, "isEqualToString:", v53) & 1) == 0)
        {
          v19 = CFSTR("Tele");
          if ((-[__CFString isEqualToString:](v18, "isEqualToString:", v7) & 1) == 0)
          {
            v19 = CFSTR("SuperWide");
            if ((-[__CFString isEqualToString:](v18, "isEqualToString:", v51) & 1) == 0)
            {
              v19 = CFSTR("Front");
              if ((-[__CFString isEqualToString:](v18, "isEqualToString:", v50) & 1) == 0)
              {
                if (-[__CFString isEqualToString:](v18, "isEqualToString:", v49))
                  v19 = CFSTR("FrontSuperWide");
                else
                  v19 = v18;
              }
            }
          }
        }
        v20 = -[NSDictionary objectForKeyedSubscript:](v12->_sensorTemperatureStats, "objectForKeyedSubscript:", v18);
        v21 = (void *)MEMORY[0x1E0CB37E8];
        objc_msgSend(v20, "max");
        v22 = objc_msgSend(v21, "numberWithDouble:");
        objc_msgSend(v3, "setObject:forKeyedSubscript:", v22, objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("sensorTemperature%@Max"), v19));
        v23 = (void *)MEMORY[0x1E0CB37E8];
        objc_msgSend(v20, "min");
        v24 = objc_msgSend(v23, "numberWithDouble:");
        objc_msgSend(v3, "setObject:forKeyedSubscript:", v24, objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("sensorTemperature%@Min"), v19));
        v25 = (void *)MEMORY[0x1E0CB37E8];
        objc_msgSend(v20, "average");
        v26 = objc_msgSend(v25, "numberWithDouble:");
        objc_msgSend(v3, "setObject:forKeyedSubscript:", v26, objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("sensorTemperature%@Average"), v19));
        v27 = (void *)MEMORY[0x1E0CB37E8];
        objc_msgSend(v20, "max");
        v29 = v28;
        objc_msgSend(v20, "min");
        v31 = objc_msgSend(v27, "numberWithDouble:", v29 - v30);
        objc_msgSend(v3, "setObject:forKeyedSubscript:", v31, objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("sensorTemperature%@Range"), v19));
      }
      v15 = -[NSDictionary countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v54, v58, 16);
    }
    while (v15);
  }
  if ((v12->_infraredProjectorUptimeInMsForLowPowerSparse & 0x8000000000000000) == 0)
    objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:"), CFSTR("infraredProjectorUptimeInMsForLowPowerSparse"));
  if ((v12->_infraredProjectorUptimeInMsForHighPowerSparse & 0x8000000000000000) == 0)
    objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:"), CFSTR("infraredProjectorUptimeInMsForHighPowerSparse"));
  *(float *)&v14 = v12->_averageSystemPressureLevel;
  objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v14), CFSTR("averageSystemPressureLevel"));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v12->_maxSystemPressureLevel), CFSTR("maxSystemPressureLevel"));
  if ((v12->_timeToCriticalSystemPressureInMS & 0x8000000000000000) == 0)
    objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:"), CFSTR("timeToCriticalSystemPressure"));
  if (v12->_systemPressureFactors)
    objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:"), CFSTR("systemPressureFactors"));
  if (v12->_cinematicFramingSupported)
  {
    objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v12->_cinematicFramingEnabled), CFSTR("isCinematicFramingEnabled"));
    objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v12->_cinematicFramingControlMode), CFSTR("cinematicFramingControlMode"));
    objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v12->_cinematicFramingTime), CFSTR("cinematicFramingTime"));
  }
  if (v12->_backgroundBlurSupported)
  {
    objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v12->_backgroundBlurEnabled), CFSTR("isBackgroundBlurEnabled"));
    objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v12->_backgroundBlurTime), CFSTR("backgroundBlurTime"));
    if (v12->_backgroundBlurTime)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v12->_backgroundBlurApertureChanged), CFSTR("backgroundBlurChanged"));
      *(float *)&v32 = v12->_backgroundBlurAperture;
      objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v32), CFSTR("backgroundBlurAperture"));
    }
  }
  if (v12->_studioLightingSupported)
  {
    objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v12->_studioLightingEnabled), CFSTR("isStudioLightingEnabled"));
    objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v12->_studioLightingTime), CFSTR("studioLightingTime"));
    if (v12->_studioLightingTime)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v12->_studioLightingIntensityChanged), CFSTR("studioLightingChanged"));
      *(float *)&v33 = v12->_studioLightingIntensity;
      objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v33), CFSTR("studioLightingIntensity"));
    }
  }
  if (v12->_orientationPortraitTime)
    objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:"), CFSTR("orientationPortraitTime"));
  if (v12->_orientationLandscapeTime)
    objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:"), CFSTR("orientationLandscapeTime"));
  if (v12->_orientationFaceUpTime)
    objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:"), CFSTR("orientationFaceUpTime"));
  if (v12->_orientationFaceDownTime)
    objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:"), CFSTR("orientationFaceDownTime"));
  if (v12->_reactionEffectsSupported)
  {
    objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v12->_reactionEffectsEnabled), CFSTR("reactionEffectsEnabled"));
    if (v12->_reactionEffectsEnabled)
      objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v12->_gesturesEnabled), CFSTR("gesturesEnabled"));
    objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v12->_reactionCount), CFSTR("reactionCount"));
  }
  if (v12->_reactionEffectsEnabledTime)
    objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:"), CFSTR("reactionEffectsEnabledTime"));
  if (v12->_gesturesEnabledTime)
    objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:"), CFSTR("gesturesEnabledTime"));
  if (v12->_backgroundReplacementSupported)
  {
    objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v12->_backgroundReplacementEnabled), CFSTR("isBackgroundReplacementEnabled"));
    objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v12->_backgroundReplacementTime), CFSTR("backgroundReplacementTime"));
    if (v12->_backgroundReplacementTime)
      objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v12->_backgroundReplacementPixelBufferChanged), CFSTR("backgroundReplacementChanged"));
  }
  objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v12->_cinematicVideoEnabled), CFSTR("cinematicVideoEnabled"));
  if (v12->_cinematicVideoEnabled)
  {
    *(float *)&v34 = v12->_cinematicVideoAverageRenderingTime;
    objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v34), CFSTR("cinematicVideoAverageRenderingTime"));
    *(float *)&v35 = v12->_cinematicVideoWorstCaseRenderingTime;
    objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v35), CFSTR("cinematicVideoWorstCaseRenderingTime"));
  }
  if (v12->_timeOfFlightAssistedAutoFocusStreamingTimeAt0FPS
    || v12->_timeOfFlightAssistedAutoFocusStreamingTimeAt1FPS
    || v12->_timeOfFlightAssistedAutoFocusStreamingTimeAt8FPS
    || v12->_timeOfFlightAssistedAutoFocusStreamingTimeAtOtherFPS)
  {
    objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:"), CFSTR("tofStreamingTime0FPS"));
    objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v12->_timeOfFlightAssistedAutoFocusStreamingTimeAt1FPS), CFSTR("tofStreamingTime1FPS"));
    objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v12->_timeOfFlightAssistedAutoFocusStreamingTimeAt8FPS), CFSTR("tofStreamingTime8FPS"));
    objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v12->_timeOfFlightAssistedAutoFocusStreamingTimeAtOtherFPS), CFSTR("tofStreamingTimeOtherFPS"));
  }
  objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v12->_captureDeviceType), CFSTR("captureDeviceType"));
  if (v12->_depthMaxFrameRate != 3.4028e38)
    objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:"), CFSTR("depthMaxFrameRate"));
  if (v12->_depthFormatDimensionWidth != -1)
    objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:"), CFSTR("depthFormatDimensionWidth"));
  if (v12->_depthFormatDimensionHeight != -1)
    objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:"), CFSTR("depthFormatDimensionHeight"));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", BWStringForOSType(v12->_depthPixelFormat), CFSTR("depthPixelFormat"));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v12->_depthDataFiltered), CFSTR("depthDataFiltered"));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v12->_faceDrivenAEAFEnabledByDefault), CFSTR("faceDrivenAEAFEnabledByDefault"));
  if (v12->_faceDrivenAEAFEnabledByDefault)
  {
    objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v12->_faceDrivenAFDisabledCount), CFSTR("faceDrivenAFDisabledCount"));
    objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v12->_faceDrivenAEDisabledCount), CFSTR("faceDrivenAEDisabledCount"));
    objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v12->_maxFacesDetected), CFSTR("maxFacesDetected"));
    *(float *)&v36 = v12->_minLuxValue;
    objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v36), CFSTR("minLuxValue"));
    *(float *)&v37 = v12->_maxLuxValue;
    objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v37), CFSTR("maxLuxValue"));
    *(float *)&v38 = v12->_averageLuxValue;
    objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v38), CFSTR("averageLuxValue"));
    objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v12->_photoFormat), CFSTR("photoFormat"));
  }
  continuityCameraClientDeviceClass = v12->_continuityCameraClientDeviceClass;
  v40 = CFSTR("AppleTV");
  if (continuityCameraClientDeviceClass != 4)
    v40 = 0;
  if (continuityCameraClientDeviceClass == 100)
    v41 = CFSTR("Mac");
  else
    v41 = v40;
  if (v41)
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v41, CFSTR("continuityCameraClientDeviceClass"));
  if (v12->_streamingTime)
  {
    if (v12->_thermalThrottledTime)
      v42 = MEMORY[0x1E0C9AAB0];
    else
      v42 = MEMORY[0x1E0C9AAA0];
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v42, CFSTR("thermalThrottled"));
    objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v12->_thermalThrottledTime), CFSTR("thermalThrottledTime"));
  }
  objc_msgSend(v3, "setObject:forKeyedSubscript:", BWStringForOSType(v12->_pixelFormat), CFSTR("pixelFormat"));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v12->_videoDimensions.width), CFSTR("videoDimensionsWidth"));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v12->_videoDimensions.height), CFSTR("videoDimensionsHeight"));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v12->_highlightRecoveryEnabled), CFSTR("highlightRecoveryEnabled"));
  *(float *)&v43 = v12->_minimumSupportedFrameRate;
  objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v43), CFSTR("minimumSupportedFrameRate"));
  *(float *)&v44 = v12->_maximumSupportedFrameRate;
  objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v44), CFSTR("maximumSupportedFrameRate"));
  *(float *)&v45 = v12->_minimumFrameRate;
  objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v45), CFSTR("minimumFrameRate"));
  *(float *)&v46 = v12->_maximumFrameRate;
  objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v46), CFSTR("maximumFrameRate"));
  *(float *)&v47 = v12->_fieldOfView;
  objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v47), CFSTR("fieldOfView"));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v12->_binned), CFSTR("binned"));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v12->_colorSpace), CFSTR("colorSpace"));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v12->_clientIsVOIP), CFSTR("clientIsVOIP"));
  return v3;
}

- (int)deviceType
{
  return self->_deviceType;
}

- (void)setDeviceType:(int)a3
{
  self->_deviceType = a3;
}

- (int)devicePosition
{
  return self->_devicePosition;
}

- (void)setDevicePosition:(int)a3
{
  self->_devicePosition = a3;
}

- (int)startingCameraPosture
{
  return self->_startingCameraPosture;
}

- (void)setStartingCameraPosture:(int)a3
{
  self->_startingCameraPosture = a3;
}

- (int)streamingStartExifOrientation
{
  return self->_streamingStartExifOrientation;
}

- (void)setStreamingStartExifOrientation:(int)a3
{
  self->_streamingStartExifOrientation = a3;
}

- (unsigned)streamingTime
{
  return self->_streamingTime;
}

- (void)setStreamingTime:(unsigned int)a3
{
  self->_streamingTime = a3;
}

- (NSString)clientApplicationID
{
  return self->_clientApplicationID;
}

- (void)setClientApplicationID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (NSSet)sunburnDetectOccurred
{
  return self->_sunburnDetectOccurred;
}

- (void)setSunburnDetectOccurred:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 48);
}

- (NSDictionary)degradedAutoFocusStatus
{
  return self->_degradedAutoFocusStatus;
}

- (void)setDegradedAutoFocusStatus:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 56);
}

- (NSDictionary)apsMaxDynamicGainDerate
{
  return self->_apsMaxDynamicGainDerate;
}

- (void)setApsMaxDynamicGainDerate:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 64);
}

- (NSDictionary)apsMaxTopEndDynamicBuffer
{
  return self->_apsMaxTopEndDynamicBuffer;
}

- (void)setApsMaxTopEndDynamicBuffer:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 72);
}

- (NSDictionary)numberOfSphereJitterDetectAttempts
{
  return self->_numberOfSphereJitterDetectAttempts;
}

- (void)setNumberOfSphereJitterDetectAttempts:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 80);
}

- (NSDictionary)numberOfSphereJitterDetects
{
  return self->_numberOfSphereJitterDetects;
}

- (void)setNumberOfSphereJitterDetects:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 88);
}

- (NSDictionary)actuatorVendor
{
  return self->_actuatorVendor;
}

- (void)setActuatorVendor:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 96);
}

- (NSString)sphereMode
{
  return self->_sphereMode;
}

- (void)setSphereMode:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 104);
}

- (unsigned)numberOfPhotoCaptures
{
  return self->_numberOfPhotoCaptures;
}

- (void)setNumberOfPhotoCaptures:(unsigned int)a3
{
  self->_numberOfPhotoCaptures = a3;
}

- (unsigned)numberOfBurstPhotoCaptures
{
  return self->_numberOfBurstPhotoCaptures;
}

- (void)setNumberOfBurstPhotoCaptures:(unsigned int)a3
{
  self->_numberOfBurstPhotoCaptures = a3;
}

- (unsigned)numberOfBalancedPhotoCaptures
{
  return self->_numberOfBalancedPhotoCaptures;
}

- (void)setNumberOfBalancedPhotoCaptures:(unsigned int)a3
{
  self->_numberOfBalancedPhotoCaptures = a3;
}

- (unsigned)timeToFirstPhotoCapture
{
  return self->_timeToFirstPhotoCapture;
}

- (void)setTimeToFirstPhotoCapture:(unsigned int)a3
{
  self->_timeToFirstPhotoCapture = a3;
}

- (unsigned)maxTimeSinceLastPhotoCapture
{
  return self->_maxTimeSinceLastPhotoCapture;
}

- (void)setMaxTimeSinceLastPhotoCapture:(unsigned int)a3
{
  self->_maxTimeSinceLastPhotoCapture = a3;
}

- (unsigned)minTimeSinceLastPhotoCapture
{
  return self->_minTimeSinceLastPhotoCapture;
}

- (void)setMinTimeSinceLastPhotoCapture:(unsigned int)a3
{
  self->_minTimeSinceLastPhotoCapture = a3;
}

- (unsigned)numberOfButtonMashingCapturesAtRate0
{
  return self->_numberOfButtonMashingCapturesAtRate0;
}

- (void)setNumberOfButtonMashingCapturesAtRate0:(unsigned int)a3
{
  self->_numberOfButtonMashingCapturesAtRate0 = a3;
}

- (unsigned)numberOfButtonMashingCapturesAtRate1
{
  return self->_numberOfButtonMashingCapturesAtRate1;
}

- (void)setNumberOfButtonMashingCapturesAtRate1:(unsigned int)a3
{
  self->_numberOfButtonMashingCapturesAtRate1 = a3;
}

- (unsigned)numberOfButtonMashingEventsAtRate0
{
  return self->_numberOfButtonMashingEventsAtRate0;
}

- (void)setNumberOfButtonMashingEventsAtRate0:(unsigned int)a3
{
  self->_numberOfButtonMashingEventsAtRate0 = a3;
}

- (unsigned)numberOfButtonMashingEventsAtRate1
{
  return self->_numberOfButtonMashingEventsAtRate1;
}

- (void)setNumberOfButtonMashingEventsAtRate1:(unsigned int)a3
{
  self->_numberOfButtonMashingEventsAtRate1 = a3;
}

- (unsigned)longestButtonMashingEventAtRate0
{
  return self->_longestButtonMashingEventAtRate0;
}

- (void)setLongestButtonMashingEventAtRate0:(unsigned int)a3
{
  self->_longestButtonMashingEventAtRate0 = a3;
}

- (unsigned)longestButtonMashingEventAtRate1
{
  return self->_longestButtonMashingEventAtRate1;
}

- (void)setLongestButtonMashingEventAtRate1:(unsigned int)a3
{
  self->_longestButtonMashingEventAtRate1 = a3;
}

- (unsigned)timeOfFlightCameraProjectorModeMask
{
  return self->_timeOfFlightCameraProjectorModeMask;
}

- (void)setTimeOfFlightCameraProjectorModeMask:(unsigned int)a3
{
  self->_timeOfFlightCameraProjectorModeMask = a3;
}

- (unsigned)timeOfFlightCameraUsageTypeMask
{
  return self->_timeOfFlightCameraUsageTypeMask;
}

- (void)setTimeOfFlightCameraUsageTypeMask:(unsigned int)a3
{
  self->_timeOfFlightCameraUsageTypeMask = a3;
}

- (float)structuredLightIdleTemperatureFirstReading
{
  return self->_structuredLightIdleTemperatureFirstReading;
}

- (void)setStructuredLightIdleTemperatureFirstReading:(float)a3
{
  self->_structuredLightIdleTemperatureFirstReading = a3;
}

- (float)structuredLightActiveTemperatureFirstReading
{
  return self->_structuredLightActiveTemperatureFirstReading;
}

- (void)setStructuredLightActiveTemperatureFirstReading:(float)a3
{
  self->_structuredLightActiveTemperatureFirstReading = a3;
}

- (float)structuredLightActiveTemperatureLastReading
{
  return self->_structuredLightActiveTemperatureLastReading;
}

- (void)setStructuredLightActiveTemperatureLastReading:(float)a3
{
  self->_structuredLightActiveTemperatureLastReading = a3;
}

- (float)structuredLightActiveTemperatureRange
{
  return self->_structuredLightActiveTemperatureRange;
}

- (void)setStructuredLightActiveTemperatureRange:(float)a3
{
  self->_structuredLightActiveTemperatureRange = a3;
}

- (float)structuredLightActiveTemperatureAverage
{
  return self->_structuredLightActiveTemperatureAverage;
}

- (void)setStructuredLightActiveTemperatureAverage:(float)a3
{
  self->_structuredLightActiveTemperatureAverage = a3;
}

- (float)infaredSensorTemperatureRange
{
  return self->_infaredSensorTemperatureRange;
}

- (void)setInfaredSensorTemperatureRange:(float)a3
{
  self->_infaredSensorTemperatureRange = a3;
}

- (float)infaredSensorTemperatureAverage
{
  return self->_infaredSensorTemperatureAverage;
}

- (void)setInfaredSensorTemperatureAverage:(float)a3
{
  self->_infaredSensorTemperatureAverage = a3;
}

- (NSDictionary)sensorTemperatureStats
{
  return self->_sensorTemperatureStats;
}

- (void)setSensorTemperatureStats:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 200);
}

- (int64_t)infraredProjectorUptimeInMsForLowPowerSparse
{
  return self->_infraredProjectorUptimeInMsForLowPowerSparse;
}

- (void)setInfraredProjectorUptimeInMsForLowPowerSparse:(int64_t)a3
{
  self->_infraredProjectorUptimeInMsForLowPowerSparse = a3;
}

- (int64_t)infraredProjectorUptimeInMsForHighPowerSparse
{
  return self->_infraredProjectorUptimeInMsForHighPowerSparse;
}

- (void)setInfraredProjectorUptimeInMsForHighPowerSparse:(int64_t)a3
{
  self->_infraredProjectorUptimeInMsForHighPowerSparse = a3;
}

- (BOOL)cinematicFramingSupported
{
  return self->_cinematicFramingSupported;
}

- (void)setCinematicFramingSupported:(BOOL)a3
{
  self->_cinematicFramingSupported = a3;
}

- (BOOL)cinematicFramingEnabled
{
  return self->_cinematicFramingEnabled;
}

- (void)setCinematicFramingEnabled:(BOOL)a3
{
  self->_cinematicFramingEnabled = a3;
}

- (unsigned)cinematicFramingControlMode
{
  return self->_cinematicFramingControlMode;
}

- (void)setCinematicFramingControlMode:(unsigned int)a3
{
  self->_cinematicFramingControlMode = a3;
}

- (unsigned)cinematicFramingTime
{
  return self->_cinematicFramingTime;
}

- (void)setCinematicFramingTime:(unsigned int)a3
{
  self->_cinematicFramingTime = a3;
}

- (BOOL)backgroundBlurSupported
{
  return self->_backgroundBlurSupported;
}

- (void)setBackgroundBlurSupported:(BOOL)a3
{
  self->_backgroundBlurSupported = a3;
}

- (BOOL)backgroundBlurEnabled
{
  return self->_backgroundBlurEnabled;
}

- (void)setBackgroundBlurEnabled:(BOOL)a3
{
  self->_backgroundBlurEnabled = a3;
}

- (unsigned)backgroundBlurTime
{
  return self->_backgroundBlurTime;
}

- (void)setBackgroundBlurTime:(unsigned int)a3
{
  self->_backgroundBlurTime = a3;
}

- (BOOL)backgroundBlurApertureChanged
{
  return self->_backgroundBlurApertureChanged;
}

- (void)setBackgroundBlurApertureChanged:(BOOL)a3
{
  self->_backgroundBlurApertureChanged = a3;
}

- (float)backgroundBlurAperture
{
  return self->_backgroundBlurAperture;
}

- (void)setBackgroundBlurAperture:(float)a3
{
  self->_backgroundBlurAperture = a3;
}

- (BOOL)studioLightingSupported
{
  return self->_studioLightingSupported;
}

- (void)setStudioLightingSupported:(BOOL)a3
{
  self->_studioLightingSupported = a3;
}

- (BOOL)studioLightingEnabled
{
  return self->_studioLightingEnabled;
}

- (void)setStudioLightingEnabled:(BOOL)a3
{
  self->_studioLightingEnabled = a3;
}

- (unsigned)studioLightingTime
{
  return self->_studioLightingTime;
}

- (void)setStudioLightingTime:(unsigned int)a3
{
  self->_studioLightingTime = a3;
}

- (BOOL)studioLightingIntensityChanged
{
  return self->_studioLightingIntensityChanged;
}

- (void)setStudioLightingIntensityChanged:(BOOL)a3
{
  self->_studioLightingIntensityChanged = a3;
}

- (float)studioLightingIntensity
{
  return self->_studioLightingIntensity;
}

- (void)setStudioLightingIntensity:(float)a3
{
  self->_studioLightingIntensity = a3;
}

- (unsigned)orientationPortraitTime
{
  return self->_orientationPortraitTime;
}

- (void)setOrientationPortraitTime:(unsigned int)a3
{
  self->_orientationPortraitTime = a3;
}

- (unsigned)orientationLandscapeTime
{
  return self->_orientationLandscapeTime;
}

- (void)setOrientationLandscapeTime:(unsigned int)a3
{
  self->_orientationLandscapeTime = a3;
}

- (unsigned)orientationFaceUpTime
{
  return self->_orientationFaceUpTime;
}

- (void)setOrientationFaceUpTime:(unsigned int)a3
{
  self->_orientationFaceUpTime = a3;
}

- (unsigned)orientationFaceDownTime
{
  return self->_orientationFaceDownTime;
}

- (void)setOrientationFaceDownTime:(unsigned int)a3
{
  self->_orientationFaceDownTime = a3;
}

- (BOOL)reactionEffectsSupported
{
  return self->_reactionEffectsSupported;
}

- (void)setReactionEffectsSupported:(BOOL)a3
{
  self->_reactionEffectsSupported = a3;
}

- (BOOL)reactionEffectsEnabled
{
  return self->_reactionEffectsEnabled;
}

- (void)setReactionEffectsEnabled:(BOOL)a3
{
  self->_reactionEffectsEnabled = a3;
}

- (BOOL)gesturesEnabled
{
  return self->_gesturesEnabled;
}

- (void)setGesturesEnabled:(BOOL)a3
{
  self->_gesturesEnabled = a3;
}

- (unsigned)reactionCount
{
  return self->_reactionCount;
}

- (void)setReactionCount:(unsigned int)a3
{
  self->_reactionCount = a3;
}

- (unsigned)reactionEffectsEnabledTime
{
  return self->_reactionEffectsEnabledTime;
}

- (void)setReactionEffectsEnabledTime:(unsigned int)a3
{
  self->_reactionEffectsEnabledTime = a3;
}

- (unsigned)gesturesEnabledTime
{
  return self->_gesturesEnabledTime;
}

- (void)setGesturesEnabledTime:(unsigned int)a3
{
  self->_gesturesEnabledTime = a3;
}

- (BOOL)backgroundReplacementSupported
{
  return self->_backgroundReplacementSupported;
}

- (void)setBackgroundReplacementSupported:(BOOL)a3
{
  self->_backgroundReplacementSupported = a3;
}

- (BOOL)backgroundReplacementEnabled
{
  return self->_backgroundReplacementEnabled;
}

- (void)setBackgroundReplacementEnabled:(BOOL)a3
{
  self->_backgroundReplacementEnabled = a3;
}

- (unsigned)backgroundReplacementTime
{
  return self->_backgroundReplacementTime;
}

- (void)setBackgroundReplacementTime:(unsigned int)a3
{
  self->_backgroundReplacementTime = a3;
}

- (BOOL)backgroundReplacementPixelBufferChanged
{
  return self->_backgroundReplacementPixelBufferChanged;
}

- (void)setBackgroundReplacementPixelBufferChanged:(BOOL)a3
{
  self->_backgroundReplacementPixelBufferChanged = a3;
}

- (BOOL)cinematicVideoEnabled
{
  return self->_cinematicVideoEnabled;
}

- (void)setCinematicVideoEnabled:(BOOL)a3
{
  self->_cinematicVideoEnabled = a3;
}

- (float)cinematicVideoAverageRenderingTime
{
  return self->_cinematicVideoAverageRenderingTime;
}

- (void)setCinematicVideoAverageRenderingTime:(float)a3
{
  self->_cinematicVideoAverageRenderingTime = a3;
}

- (float)cinematicVideoWorstCaseRenderingTime
{
  return self->_cinematicVideoWorstCaseRenderingTime;
}

- (void)setCinematicVideoWorstCaseRenderingTime:(float)a3
{
  self->_cinematicVideoWorstCaseRenderingTime = a3;
}

- (unsigned)timeOfFlightAssistedAutoFocusStreamingTimeAt0FPS
{
  return self->_timeOfFlightAssistedAutoFocusStreamingTimeAt0FPS;
}

- (void)setTimeOfFlightAssistedAutoFocusStreamingTimeAt0FPS:(unsigned int)a3
{
  self->_timeOfFlightAssistedAutoFocusStreamingTimeAt0FPS = a3;
}

- (unsigned)timeOfFlightAssistedAutoFocusStreamingTimeAt1FPS
{
  return self->_timeOfFlightAssistedAutoFocusStreamingTimeAt1FPS;
}

- (void)setTimeOfFlightAssistedAutoFocusStreamingTimeAt1FPS:(unsigned int)a3
{
  self->_timeOfFlightAssistedAutoFocusStreamingTimeAt1FPS = a3;
}

- (unsigned)timeOfFlightAssistedAutoFocusStreamingTimeAt8FPS
{
  return self->_timeOfFlightAssistedAutoFocusStreamingTimeAt8FPS;
}

- (void)setTimeOfFlightAssistedAutoFocusStreamingTimeAt8FPS:(unsigned int)a3
{
  self->_timeOfFlightAssistedAutoFocusStreamingTimeAt8FPS = a3;
}

- (unsigned)timeOfFlightAssistedAutoFocusStreamingTimeAtOtherFPS
{
  return self->_timeOfFlightAssistedAutoFocusStreamingTimeAtOtherFPS;
}

- (void)setTimeOfFlightAssistedAutoFocusStreamingTimeAtOtherFPS:(unsigned int)a3
{
  self->_timeOfFlightAssistedAutoFocusStreamingTimeAtOtherFPS = a3;
}

- (unsigned)captureDeviceType
{
  return self->_captureDeviceType;
}

- (void)setCaptureDeviceType:(unsigned int)a3
{
  self->_captureDeviceType = a3;
}

- (float)depthMaxFrameRate
{
  return self->_depthMaxFrameRate;
}

- (void)setDepthMaxFrameRate:(float)a3
{
  self->_depthMaxFrameRate = a3;
}

- (unsigned)depthFormatDimensionWidth
{
  return self->_depthFormatDimensionWidth;
}

- (void)setDepthFormatDimensionWidth:(unsigned int)a3
{
  self->_depthFormatDimensionWidth = a3;
}

- (unsigned)depthFormatDimensionHeight
{
  return self->_depthFormatDimensionHeight;
}

- (void)setDepthFormatDimensionHeight:(unsigned int)a3
{
  self->_depthFormatDimensionHeight = a3;
}

- (unsigned)depthPixelFormat
{
  return self->_depthPixelFormat;
}

- (void)setDepthPixelFormat:(unsigned int)a3
{
  self->_depthPixelFormat = a3;
}

- (BOOL)depthDataFiltered
{
  return self->_depthDataFiltered;
}

- (void)setDepthDataFiltered:(BOOL)a3
{
  self->_depthDataFiltered = a3;
}

- (BOOL)faceDrivenAEAFEnabledByDefault
{
  return self->_faceDrivenAEAFEnabledByDefault;
}

- (void)setFaceDrivenAEAFEnabledByDefault:(BOOL)a3
{
  self->_faceDrivenAEAFEnabledByDefault = a3;
}

- (unsigned)faceDrivenAFDisabledCount
{
  return self->_faceDrivenAFDisabledCount;
}

- (void)setFaceDrivenAFDisabledCount:(unsigned int)a3
{
  self->_faceDrivenAFDisabledCount = a3;
}

- (unsigned)faceDrivenAEDisabledCount
{
  return self->_faceDrivenAEDisabledCount;
}

- (void)setFaceDrivenAEDisabledCount:(unsigned int)a3
{
  self->_faceDrivenAEDisabledCount = a3;
}

- (unsigned)maxFacesDetected
{
  return self->_maxFacesDetected;
}

- (void)setMaxFacesDetected:(unsigned int)a3
{
  self->_maxFacesDetected = a3;
}

- (float)minLuxValue
{
  return self->_minLuxValue;
}

- (void)setMinLuxValue:(float)a3
{
  self->_minLuxValue = a3;
}

- (float)maxLuxValue
{
  return self->_maxLuxValue;
}

- (void)setMaxLuxValue:(float)a3
{
  self->_maxLuxValue = a3;
}

- (float)averageLuxValue
{
  return self->_averageLuxValue;
}

- (void)setAverageLuxValue:(float)a3
{
  self->_averageLuxValue = a3;
}

- (BOOL)isPhotoFormat
{
  return self->_photoFormat;
}

- (void)setPhotoFormat:(BOOL)a3
{
  self->_photoFormat = a3;
}

- (int)continuityCameraClientDeviceClass
{
  return self->_continuityCameraClientDeviceClass;
}

- (void)setContinuityCameraClientDeviceClass:(int)a3
{
  self->_continuityCameraClientDeviceClass = a3;
}

- (unsigned)thermalThrottledTime
{
  return self->_thermalThrottledTime;
}

- (void)setThermalThrottledTime:(unsigned int)a3
{
  self->_thermalThrottledTime = a3;
}

- (unsigned)pixelFormat
{
  return self->_pixelFormat;
}

- (void)setPixelFormat:(unsigned int)a3
{
  self->_pixelFormat = a3;
}

- ($2825F4736939C4A6D3AD43837233062D)videoDimensions
{
  return ($2825F4736939C4A6D3AD43837233062D)self->_videoDimensions;
}

- (void)setVideoDimensions:(id)a3
{
  self->_videoDimensions = ($470D365275581EF16070F5A11344F73E)a3;
}

- (BOOL)highlightRecoveryEnabled
{
  return self->_highlightRecoveryEnabled;
}

- (void)setHighlightRecoveryEnabled:(BOOL)a3
{
  self->_highlightRecoveryEnabled = a3;
}

- (float)minimumSupportedFrameRate
{
  return self->_minimumSupportedFrameRate;
}

- (void)setMinimumSupportedFrameRate:(float)a3
{
  self->_minimumSupportedFrameRate = a3;
}

- (float)maximumSupportedFrameRate
{
  return self->_maximumSupportedFrameRate;
}

- (void)setMaximumSupportedFrameRate:(float)a3
{
  self->_maximumSupportedFrameRate = a3;
}

- (float)minimumFrameRate
{
  return self->_minimumFrameRate;
}

- (void)setMinimumFrameRate:(float)a3
{
  self->_minimumFrameRate = a3;
}

- (float)maximumFrameRate
{
  return self->_maximumFrameRate;
}

- (void)setMaximumFrameRate:(float)a3
{
  self->_maximumFrameRate = a3;
}

- (float)fieldOfView
{
  return self->_fieldOfView;
}

- (void)setFieldOfView:(float)a3
{
  self->_fieldOfView = a3;
}

- (BOOL)binned
{
  return self->_binned;
}

- (void)setBinned:(BOOL)a3
{
  self->_binned = a3;
}

- (int)colorSpace
{
  return self->_colorSpace;
}

- (void)setColorSpace:(int)a3
{
  self->_colorSpace = a3;
}

- (BOOL)clientIsVOIP
{
  return self->_clientIsVOIP;
}

- (void)setClientIsVOIP:(BOOL)a3
{
  self->_clientIsVOIP = a3;
}

- (unsigned)activeDeviceMask
{
  return self->_activeDeviceMask;
}

- (void)setActiveDeviceMask:(unsigned int)a3
{
  self->_activeDeviceMask = a3;
}

- (float)averageSystemPressureLevel
{
  return self->_averageSystemPressureLevel;
}

- (void)setAverageSystemPressureLevel:(float)a3
{
  self->_averageSystemPressureLevel = a3;
}

- (int)maxSystemPressureLevel
{
  return self->_maxSystemPressureLevel;
}

- (void)setMaxSystemPressureLevel:(int)a3
{
  self->_maxSystemPressureLevel = a3;
}

- (int64_t)timeToCriticalSystemPressureInMS
{
  return self->_timeToCriticalSystemPressureInMS;
}

- (void)setTimeToCriticalSystemPressureInMS:(int64_t)a3
{
  self->_timeToCriticalSystemPressureInMS = a3;
}

- (unsigned)systemPressureFactors
{
  return self->_systemPressureFactors;
}

- (void)setSystemPressureFactors:(unsigned int)a3
{
  self->_systemPressureFactors = a3;
}

@end
