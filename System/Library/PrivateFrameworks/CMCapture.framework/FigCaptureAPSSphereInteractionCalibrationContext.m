@implementation FigCaptureAPSSphereInteractionCalibrationContext

+ (void)initialize
{
  objc_opt_class();
}

+ (void)printDebugInfoForRawStreamCalibrationData:(id)a3
{
  _OWORD v3[5];
  int v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  v4 = 0;
  memset(v3, 0, sizeof(v3));
  objc_msgSend(a3, "getBytes:length:", v3, 84);
}

- (void)reportLoggingWithCalibrationData:(id)a3 isValid:(BOOL)a4 magneticFieldMagnitude:(double)a5
{
  BWAggdDataReporter *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  uint64_t v13;
  void *v14;
  int v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  float v19;
  float v20;
  uint64_t v21;
  BWAggdDataReporter *v22;
  double v23;
  double v24;
  double v25;
  double v26;
  BWSphereInteractionCalibrationAnalyticsPayload *v27;
  uint64_t v28;
  uint64_t v29;
  _BOOL4 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  _OWORD v35[2];
  __int128 v36;
  __int128 v37;
  __int128 v38;
  unsigned int v39;
  _BYTE v40[128];
  uint64_t v41;

  v30 = a4;
  v41 = *MEMORY[0x1E0C80C00];
  if (a3)
  {
    v7 = +[BWAggdDataReporter sharedInstance](BWAggdDataReporter, "sharedInstance");
    objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", 0x1E4955D58), "doubleValue");
    -[BWAggdDataReporter reportCalibrationStatisticsWithTime:timeValue:attemptsField:attemptsValue:successField:successValue:magneticFieldMagnitudeField:magneticFieldMagnitudeValue:](v7, "reportCalibrationStatisticsWithTime:timeValue:attemptsField:attemptsValue:successField:successValue:magneticFieldMagnitudeField:magneticFieldMagnitudeValue:", CFSTR("com.apple.coremedia.camera.aps.sphcal.time.s"), 0, 0, 0, 0, 0);
    v33 = 0u;
    v34 = 0u;
    v31 = 0u;
    v32 = 0u;
    v8 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v31, v40, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v32;
      v29 = *MEMORY[0x1E0D05A18];
      v28 = *MEMORY[0x1E0D05A30];
      do
      {
        for (i = 0; i != v9; ++i)
        {
          if (*(_QWORD *)v32 != v10)
            objc_enumerationMutation(a3);
          v12 = *(void **)(*((_QWORD *)&v31 + 1) + 8 * i);
          if ((objc_msgSend(v12, "isEqualToString:", 0x1E493BD98) & 1) != 0
            || objc_msgSend(v12, "isEqualToString:", 0x1E493BDB8))
          {
            v13 = objc_msgSend(a3, "objectForKeyedSubscript:", v12);
            if (v13)
            {
              v14 = (void *)v13;
              v15 = objc_msgSend(v12, "isEqualToString:", 0x1E493BD98);
              v39 = 0;
              if (v15)
                v16 = 1;
              else
                v16 = 2;
              v37 = 0u;
              v38 = 0u;
              v36 = 0u;
              memset(v35, 0, sizeof(v35));
              if (objc_msgSend(v12, "isEqualToString:", 0x1E493BD98))
                v17 = v29;
              else
                v17 = v28;
              objc_msgSend(v14, "getBytes:length:", v35, 84);
              v18 = *(_QWORD *)((char *)&v37 + 4);
              v19 = *((float *)&v36 + 3);
              v20 = *(float *)&v37;
              v21 = v39;
              v22 = +[BWAggdDataReporter sharedInstance](BWAggdDataReporter, "sharedInstance");
              LODWORD(v23) = v18;
              *(float *)&v24 = v19;
              LODWORD(v25) = HIDWORD(v18);
              *(float *)&v26 = v20;
              -[BWAggdDataReporter reportAPSSphereInteractionCalibrationForPosition:residualErrorNeutral:calibrationZHeightNeutral:residualErrorMacro:calibrationZHeightMacro:calibrationStatus:isValid:](v22, "reportAPSSphereInteractionCalibrationForPosition:residualErrorNeutral:calibrationZHeightNeutral:residualErrorMacro:calibrationZHeightMacro:calibrationStatus:isValid:", v16, v21, v30, v23, v24, v25, v26);
              v27 = objc_alloc_init(BWSphereInteractionCalibrationAnalyticsPayload);
              -[BWSphereInteractionCalibrationAnalyticsPayload setMagneticFieldMagnitude:](v27, "setMagneticFieldMagnitude:", (uint64_t)a5);
              -[BWSphereInteractionCalibrationAnalyticsPayload setPortType:](v27, "setPortType:", v17);
              -[BWSphereInteractionCalibrationAnalyticsPayload setCalibrationStatus:](v27, "setCalibrationStatus:", v21);
              -[BWSphereInteractionCalibrationAnalyticsPayload setSphereNeutralPositionError:](v27, "setSphereNeutralPositionError:", (int)*(float *)&v18);
              -[BWSphereInteractionCalibrationAnalyticsPayload setSphereNeutralPosition:](v27, "setSphereNeutralPosition:", (int)v19);
              -[BWSphereInteractionCalibrationAnalyticsPayload setSphereMacroPositionError:](v27, "setSphereMacroPositionError:", (int)*((float *)&v18 + 1));
              -[BWSphereInteractionCalibrationAnalyticsPayload setSphereMacroPosition:](v27, "setSphereMacroPosition:", (int)v20);
              -[BWCoreAnalyticsReporter sendEvent:](+[BWCoreAnalyticsReporter sharedInstance](BWCoreAnalyticsReporter, "sharedInstance"), "sendEvent:", v27);
            }
          }
        }
        v9 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v31, v40, 16);
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
  _OWORD v4[5];
  unsigned int v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v5 = 0;
  memset(v4, 0, sizeof(v4));
  objc_msgSend(a3, "getBytes:length:", v4, 84);
  return v5;
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
  __int128 v20;
  _OWORD v21[2];
  unsigned int v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  if (a3)
  {
    v4 = (void *)objc_msgSend(MEMORY[0x1E0CB37A0], "string");
    v12 = 0u;
    v13 = 0u;
    v14 = 0u;
    v15 = 0u;
    v5 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v12, v23, 16);
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
              v22 = 0;
              memset(v21, 0, sizeof(v21));
              v19 = 0u;
              v20 = 0u;
              v18 = 0u;
              objc_msgSend(v10, "getBytes:length:", &v18, 84);
              v16 = *(_OWORD *)((char *)v21 + 12);
              v17 = WORD6(v21[1]);
              objc_msgSend(v4, "appendFormat:", CFSTR("%@, %d, %f, %f, %f, %f, %f, %f, %f, %f, %f, %f, %f, %f, %f, %f, %s, %d, "), v9, (unsigned __int16)v18, *((float *)&v18 + 1), *((float *)&v18 + 2), *((float *)&v18 + 3), *(float *)&v19, *((float *)&v19 + 1), *((float *)&v19 + 2), *((float *)&v19 + 3), *(float *)&v20, *((float *)&v20 + 1), *((float *)&v20 + 2), *((float *)&v20 + 3), *(float *)v21, *((float *)v21 + 1), *((float *)v21 + 2),
                &v16,
                v22);
            }
          }
        }
        v6 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v12, v23, 16);
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
  _OWORD v4[5];
  int v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  memset(v4, 0, sizeof(v4));
  v5 = a3 | 1;
  return (id)objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", v4, 84);
}

- (FigCaptureAPSSphereInteractionCalibrationContext)initWithSupportedDeviceNames:(id)a3
{
  uint64_t CFPreferenceNumberWithDefault;
  uint64_t v6;
  uint64_t v7;
  objc_super v9;

  CFPreferenceNumberWithDefault = FigGetCFPreferenceNumberWithDefault();
  v6 = FigGetCFPreferenceNumberWithDefault();
  v7 = *MEMORY[0x1E0D073D0];
  v9.receiver = self;
  v9.super_class = (Class)FigCaptureAPSSphereInteractionCalibrationContext;
  return -[FigCaptureCalibrationContext initWithPreferenceString:withActivityName:withPropertyName:withExpectedDataSize:withInterval:withMinimumBatteryLevel:withInternalLogName:supportedDeviceNames:](&v9, sel_initWithPreferenceString_withActivityName_withPropertyName_withExpectedDataSize_withInterval_withMinimumBatteryLevel_withInternalLogName_supportedDeviceNames_, CFSTR("APSSphereInteractionCalibrationData"), CFSTR("com.apple.coremedia.apssphere.calibration"), v7, 84, CFPreferenceNumberWithDefault, v6, CFSTR("apsspherecal"), a3);
}

@end
