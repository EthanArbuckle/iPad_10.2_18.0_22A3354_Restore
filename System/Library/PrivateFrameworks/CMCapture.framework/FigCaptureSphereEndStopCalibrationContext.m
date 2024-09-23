@implementation FigCaptureSphereEndStopCalibrationContext

+ (void)initialize
{
  objc_opt_class();
}

+ (void)printDebugInfoForRawStreamCalibrationData:(id)a3
{
  _OWORD v3[4];
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  memset(v3, 0, 60);
  objc_msgSend(a3, "getBytes:length:", v3, 60);
}

- (void)reportLoggingWithCalibrationData:(id)a3 isValid:(BOOL)a4 magneticFieldMagnitude:(double)a5
{
  id v6;
  BWAggdDataReporter *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  int v15;
  int v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  BWSphereEndstopCalibrationAnalyticsPayload *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  id v29;
  uint64_t v31;
  uint64_t v32;
  unsigned int v33;
  unsigned int v34;
  uint64_t v35;
  unsigned int v36;
  unsigned int v37;
  unsigned int v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  _BYTE v45[28];
  _BYTE v46[128];
  uint64_t v47;

  v47 = *MEMORY[0x1E0C80C00];
  if (a3)
  {
    v6 = a3;
    v7 = +[BWAggdDataReporter sharedInstance](BWAggdDataReporter, "sharedInstance");
    objc_msgSend((id)objc_msgSend(v6, "objectForKeyedSubscript:", 0x1E4955D58), "doubleValue");
    -[BWAggdDataReporter reportCalibrationStatisticsWithTime:timeValue:attemptsField:attemptsValue:successField:successValue:magneticFieldMagnitudeField:magneticFieldMagnitudeValue:](v7, "reportCalibrationStatisticsWithTime:timeValue:attemptsField:attemptsValue:successField:successValue:magneticFieldMagnitudeField:magneticFieldMagnitudeValue:", CFSTR("com.apple.coremedia.camera.sph.endstopcal.time.s"), 0, 0, 0, 0, 0);
    v41 = 0u;
    v42 = 0u;
    v39 = 0u;
    v40 = 0u;
    v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v39, v46, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v40;
      v27 = *MEMORY[0x1E0D05A18];
      v26 = *MEMORY[0x1E0D05A30];
      v28 = *(_QWORD *)v40;
      v29 = v6;
      do
      {
        v11 = 0;
        v31 = v9;
        do
        {
          if (*(_QWORD *)v40 != v10)
            objc_enumerationMutation(v6);
          v12 = *(void **)(*((_QWORD *)&v39 + 1) + 8 * v11);
          if ((objc_msgSend(v12, "isEqualToString:", 0x1E493BD98) & 1) != 0
            || objc_msgSend(v12, "isEqualToString:", 0x1E493BDB8))
          {
            v13 = objc_msgSend(v6, "objectForKeyedSubscript:", v12);
            if (v13)
            {
              v14 = (void *)v13;
              if (objc_msgSend(v12, "isEqualToString:", 0x1E493BD98))
                v15 = 1;
              else
                v15 = 2;
              v34 = v15;
              v16 = objc_msgSend(v12, "isEqualToString:", 0x1E493BD98);
              *(_OWORD *)&v45[12] = 0u;
              v17 = v27;
              if (!v16)
                v17 = v26;
              v35 = v17;
              v44 = 0uLL;
              *(_OWORD *)v45 = 0uLL;
              v43 = 0uLL;
              objc_msgSend(v14, "getBytes:length:", &v43, 60);
              v19 = DWORD1(v43);
              v18 = DWORD2(v43);
              v20 = HIDWORD(v43);
              v32 = v44;
              v36 = *(_DWORD *)v45;
              v37 = DWORD1(v43) - DWORD2(v43);
              v38 = HIDWORD(v43) - v44;
              v33 = *(_DWORD *)&v45[24];
              LOBYTE(v25) = a4;
              v21 = HIDWORD(v44);
              v22 = DWORD2(v44);
              -[BWAggdDataReporter reportSphereEndStopCalibrationForPosition:oisPositiveX:oisNegativeX:oisPositiveY:oisNegativeY:maxPositiveXDriftFromNVM:maxNegativeXDriftFromNVM:maxPositiveYDriftFromNVM:maxNegativeYDriftFromNVM:sphereStrokeX:sphereStrokeY:calibrationStatus:isValid:](+[BWAggdDataReporter sharedInstance](BWAggdDataReporter, "sharedInstance"), "reportSphereEndStopCalibrationForPosition:oisPositiveX:oisNegativeX:oisPositiveY:oisNegativeY:maxPositiveXDriftFromNVM:maxNegativeXDriftFromNVM:maxPositiveYDriftFromNVM:maxNegativeYDriftFromNVM:sphereStrokeX:sphereStrokeY:calibrationStatus:isValid:", v34, DWORD1(v43), DWORD2(v43), HIDWORD(v43), v44, DWORD1(v44), *((_QWORD *)&v44 + 1), __PAIR64__(DWORD1(v43) - DWORD2(v43), *(unsigned int *)v45), __PAIR64__(*(unsigned int *)&v45[24], HIDWORD(v43) - (int)v44), v25);
              v23 = objc_alloc_init(BWSphereEndstopCalibrationAnalyticsPayload);
              -[BWSphereEndstopCalibrationAnalyticsPayload setMagneticFieldMagnitude:](v23, "setMagneticFieldMagnitude:", (uint64_t)a5);
              -[BWSphereEndstopCalibrationAnalyticsPayload setPortType:](v23, "setPortType:", v35);
              -[BWSphereEndstopCalibrationAnalyticsPayload setCalibrationStatus:](v23, "setCalibrationStatus:", v33);
              -[BWSphereEndstopCalibrationAnalyticsPayload setSphereXPosEndstop:](v23, "setSphereXPosEndstop:", v19);
              v24 = v18;
              v10 = v28;
              -[BWSphereEndstopCalibrationAnalyticsPayload setSphereXNegEndstop:](v23, "setSphereXNegEndstop:", v24);
              v6 = v29;
              -[BWSphereEndstopCalibrationAnalyticsPayload setSphereYPosEndstop:](v23, "setSphereYPosEndstop:", v20);
              v9 = v31;
              -[BWSphereEndstopCalibrationAnalyticsPayload setSphereYNegEndstop:](v23, "setSphereYNegEndstop:", v32);
              -[BWSphereEndstopCalibrationAnalyticsPayload setDeltaSphereXPosEndstop:](v23, "setDeltaSphereXPosEndstop:", HIDWORD(v32));
              -[BWSphereEndstopCalibrationAnalyticsPayload setDeltaSphereXNegEndstop:](v23, "setDeltaSphereXNegEndstop:", v22);
              -[BWSphereEndstopCalibrationAnalyticsPayload setDeltaSphereYPosEndstop:](v23, "setDeltaSphereYPosEndstop:", v21);
              -[BWSphereEndstopCalibrationAnalyticsPayload setDeltaSphereYNegEndstop:](v23, "setDeltaSphereYNegEndstop:", v36);
              -[BWSphereEndstopCalibrationAnalyticsPayload setSphereXStroke:](v23, "setSphereXStroke:", v37);
              -[BWSphereEndstopCalibrationAnalyticsPayload setSphereYStroke:](v23, "setSphereYStroke:", v38);
              -[BWCoreAnalyticsReporter sendEvent:](+[BWCoreAnalyticsReporter sharedInstance](BWCoreAnalyticsReporter, "sharedInstance"), "sendEvent:", v23);
            }
          }
          ++v11;
        }
        while (v9 != v11);
        v9 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v39, v46, 16);
      }
      while (v9);
    }
  }
  else
  {
    fig_log_get_emitter();
    FigDebugAssert3();
  }
}

+ (unsigned)calibrationStatusFromRawStreamCalibrationData:(id)a3
{
  _OWORD v4[4];
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  memset(v4, 0, 60);
  objc_msgSend(a3, "getBytes:length:", v4, 60);
  return DWORD2(v4[3]);
}

+ (id)calibrationDataStringForInternalLogging:(id)a3
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int16 v17;
  __int128 v18;
  __int128 v19;
  _DWORD v20[7];
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  if (a3)
  {
    v4 = (void *)objc_msgSend(MEMORY[0x1E0CB37A0], "string");
    v12 = 0u;
    v13 = 0u;
    v14 = 0u;
    v15 = 0u;
    v5 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v12, v21, 16);
    if (v5)
    {
      v6 = v5;
      v7 = *(_QWORD *)v13;
      do
      {
        for (i = 0; i != v6; ++i)
        {
          if (*(_QWORD *)v13 != v7)
            objc_enumerationMutation(a3);
          v9 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * i);
          if ((objc_msgSend(v9, "isEqualToString:", 0x1E493BD98) & 1) != 0
            || objc_msgSend(v9, "isEqualToString:", 0x1E493BDB8))
          {
            v10 = (void *)objc_msgSend(a3, "objectForKeyedSubscript:", v9);
            if (v10)
            {
              v19 = 0u;
              memset(v20, 0, sizeof(v20));
              v18 = 0u;
              objc_msgSend(v10, "getBytes:length:", &v18, 60);
              v16 = *(_OWORD *)&v20[1];
              v17 = v20[5];
              objc_msgSend(v4, "appendFormat:", CFSTR("%@, %d, %d, %d, %d, %d, %d, %d, %d, %d, %s, %d, "), v9, (unsigned __int16)v18, DWORD1(v18), DWORD2(v18), HIDWORD(v18), v19, DWORD1(v19), DWORD2(v19), HIDWORD(v19), v20[0], &v16, v20[6]);
            }
          }
        }
        v6 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v12, v21, 16);
      }
      while (v6);
    }
  }
  else
  {
    fig_log_get_emitter();
    FigDebugAssert3();
    return 0;
  }
  return v4;
}

+ (id)createRawStreamCalibrationDataWithFailureReasons:(int)a3
{
  _OWORD v4[3];
  uint64_t v5;
  int v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v5 = 0;
  memset(v4, 0, sizeof(v4));
  v6 = a3 | 1;
  return (id)objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", v4, 60);
}

- (FigCaptureSphereEndStopCalibrationContext)initWithSupportedDeviceNames:(id)a3
{
  uint64_t CFPreferenceNumberWithDefault;
  uint64_t v6;
  uint64_t v7;
  objc_super v9;

  CFPreferenceNumberWithDefault = FigGetCFPreferenceNumberWithDefault();
  v6 = FigGetCFPreferenceNumberWithDefault();
  v7 = *MEMORY[0x1E0D07790];
  v9.receiver = self;
  v9.super_class = (Class)FigCaptureSphereEndStopCalibrationContext;
  return -[FigCaptureCalibrationContext initWithPreferenceString:withActivityName:withPropertyName:withExpectedDataSize:withInterval:withMinimumBatteryLevel:withInternalLogName:supportedDeviceNames:](&v9, sel_initWithPreferenceString_withActivityName_withPropertyName_withExpectedDataSize_withInterval_withMinimumBatteryLevel_withInternalLogName_supportedDeviceNames_, CFSTR("SphereEndStopCalibrationData"), CFSTR("com.apple.coremedia.sphereendstop.calibration"), v7, 60, CFPreferenceNumberWithDefault, v6, CFSTR("sphereendstopcal"), a3);
}

@end
