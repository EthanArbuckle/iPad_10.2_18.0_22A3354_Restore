@implementation FigCaptureSphereCalibrationContext

+ (void)initialize
{
  objc_opt_class();
}

+ (void)printDebugInfoForRawStreamCalibrationData:(id)a3
{
  _OWORD v3[4];
  int v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  v4 = 0;
  memset(v3, 0, sizeof(v3));
  objc_msgSend(a3, "getBytes:length:", v3, 68);
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
  uint64_t v15;
  int v16;
  uint64_t v17;
  uint64_t v18;
  float v19;
  float v20;
  float v21;
  unsigned int v22;
  float v23;
  unsigned int v24;
  float v25;
  uint64_t v26;
  BWAggdDataReporter *v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  BWSphereResonanceCalibrationAnalyticsPayload *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  _BOOL4 v40;
  float v41;
  float v42;
  float v43;
  float v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  unsigned int v53;
  _BYTE v54[128];
  uint64_t v55;

  v40 = a4;
  v55 = *MEMORY[0x1E0C80C00];
  if (a3)
  {
    v7 = +[BWAggdDataReporter sharedInstance](BWAggdDataReporter, "sharedInstance");
    objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", 0x1E4955D58), "doubleValue");
    -[BWAggdDataReporter reportCalibrationStatisticsWithTime:timeValue:attemptsField:attemptsValue:successField:successValue:magneticFieldMagnitudeField:magneticFieldMagnitudeValue:](v7, "reportCalibrationStatisticsWithTime:timeValue:attemptsField:attemptsValue:successField:successValue:magneticFieldMagnitudeField:magneticFieldMagnitudeValue:", CFSTR("com.apple.coremedia.camera.sph.fieldcal.time.s"), 0, 0, 0, 0, 0);
    v47 = 0u;
    v48 = 0u;
    v45 = 0u;
    v46 = 0u;
    v8 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v45, v54, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v46;
      v39 = *MEMORY[0x1E0D05A18];
      v37 = (uint64_t)a5;
      v38 = *MEMORY[0x1E0D05A30];
      do
      {
        for (i = 0; i != v9; ++i)
        {
          if (*(_QWORD *)v46 != v10)
            objc_enumerationMutation(a3);
          v12 = *(void **)(*((_QWORD *)&v45 + 1) + 8 * i);
          if ((objc_msgSend(v12, "isEqualToString:", 0x1E493BD98) & 1) != 0
            || objc_msgSend(v12, "isEqualToString:", 0x1E493BDB8))
          {
            v13 = objc_msgSend(a3, "objectForKeyedSubscript:", v12);
            if (v13)
            {
              v14 = (void *)v13;
              if (objc_msgSend(v12, "isEqualToString:", 0x1E493BD98))
                v15 = 1;
              else
                v15 = 2;
              v16 = objc_msgSend(v12, "isEqualToString:", 0x1E493BD98);
              v53 = 0;
              if (v16)
                v17 = v39;
              else
                v17 = v38;
              v51 = 0u;
              v52 = 0u;
              v49 = 0u;
              v50 = 0u;
              objc_msgSend(v14, "getBytes:length:", &v49, 68);
              v18 = *(_QWORD *)((char *)&v49 + 4);
              v20 = *((float *)&v50 + 3);
              v19 = *(float *)&v51;
              v21 = *((float *)&v49 + 3);
              v41 = *((float *)&v49 + 1);
              v42 = *(float *)&v50;
              v22 = DWORD2(v51);
              v23 = *((float *)&v51 + 1);
              v24 = DWORD2(v50);
              v25 = *((float *)&v50 + 1);
              v43 = *((float *)&v51 + 2);
              v44 = *((float *)&v50 + 2);
              v26 = v53;
              v27 = +[BWAggdDataReporter sharedInstance](BWAggdDataReporter, "sharedInstance");
              *(float *)&v28 = v41;
              *(float *)&v29 = v20;
              LODWORD(v30) = HIDWORD(v18);
              *(float *)&v31 = v19;
              *(float *)&v32 = v21;
              *(float *)&v33 = v42;
              *(float *)&v34 = v23;
              *(float *)&v35 = v25;
              -[BWAggdDataReporter reportSphereCalibrationForPosition:freqX:deltaFreqX:qX:deltaQX:gainX:freqY:deltaFreqY:qY:deltaQY:gainY:calibrationStatus:isValid:](v27, "reportSphereCalibrationForPosition:freqX:deltaFreqX:qX:deltaQX:gainX:freqY:deltaFreqY:qY:deltaQY:gainY:calibrationStatus:isValid:", v15, v26, v40, v28, v29, v30, v31, v32, v33, v34, v35, __PAIR64__(v24, v22));
              v36 = objc_alloc_init(BWSphereResonanceCalibrationAnalyticsPayload);
              -[BWSphereResonanceCalibrationAnalyticsPayload setMagneticFieldMagnitude:](v36, "setMagneticFieldMagnitude:", v37);
              -[BWSphereResonanceCalibrationAnalyticsPayload setPortType:](v36, "setPortType:", v17);
              -[BWSphereResonanceCalibrationAnalyticsPayload setCalibrationStatus:](v36, "setCalibrationStatus:", v26);
              -[BWSphereResonanceCalibrationAnalyticsPayload setSphereXAxisResonantFrequency:](v36, "setSphereXAxisResonantFrequency:", (int)v41);
              -[BWSphereResonanceCalibrationAnalyticsPayload setSphereYAxisResonantFrequency:](v36, "setSphereYAxisResonantFrequency:", (int)v42);
              -[BWSphereResonanceCalibrationAnalyticsPayload setDeltaSphereXAxisResonantFrequency:](v36, "setDeltaSphereXAxisResonantFrequency:", (int)v20);
              -[BWSphereResonanceCalibrationAnalyticsPayload setDeltaSphereYAxisResonantFrequency:](v36, "setDeltaSphereYAxisResonantFrequency:", (int)v23);
              -[BWSphereResonanceCalibrationAnalyticsPayload setSphereXAxisDampingCoefficient:](v36, "setSphereXAxisDampingCoefficient:", (int)*((float *)&v18 + 1));
              -[BWSphereResonanceCalibrationAnalyticsPayload setSphereYAxisDampingCoefficient:](v36, "setSphereYAxisDampingCoefficient:", (int)v25);
              -[BWSphereResonanceCalibrationAnalyticsPayload setDeltaSphereXAxisDampingCoefficient:](v36, "setDeltaSphereXAxisDampingCoefficient:", (int)v19);
              -[BWSphereResonanceCalibrationAnalyticsPayload setDeltaSphereYAxisDampingCoefficient:](v36, "setDeltaSphereYAxisDampingCoefficient:", (int)v43);
              -[BWSphereResonanceCalibrationAnalyticsPayload setSphereXAxisLoopGain:](v36, "setSphereXAxisLoopGain:", (int)v21);
              -[BWSphereResonanceCalibrationAnalyticsPayload setSphereYAxisLoopGain:](v36, "setSphereYAxisLoopGain:", (int)v44);
              -[BWCoreAnalyticsReporter sendEvent:](+[BWCoreAnalyticsReporter sharedInstance](BWCoreAnalyticsReporter, "sharedInstance"), "sendEvent:", v36);
            }
          }
        }
        v9 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v45, v54, 16);
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
  unsigned int v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v5 = 0;
  memset(v4, 0, sizeof(v4));
  objc_msgSend(a3, "getBytes:length:", v4, 68);
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
  _OWORD v20[2];
  unsigned int v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  if (a3)
  {
    v4 = (void *)objc_msgSend(MEMORY[0x1E0CB37A0], "string");
    v12 = 0u;
    v13 = 0u;
    v14 = 0u;
    v15 = 0u;
    v5 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v12, v22, 16);
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
              v21 = 0;
              memset(v20, 0, sizeof(v20));
              v18 = 0u;
              v19 = 0u;
              objc_msgSend(v10, "getBytes:length:", &v18, 68);
              v16 = *(_OWORD *)((char *)v20 + 12);
              v17 = WORD6(v20[1]);
              objc_msgSend(v4, "appendFormat:", CFSTR("%@, %d, %f, %f, %f, %f, %f, %f, %f, %f, %f, %f, %s, %d, "), v9, (unsigned __int16)v18, *((float *)&v18 + 1), *((float *)&v18 + 2), *((float *)&v18 + 3), *(float *)&v19, *((float *)&v19 + 1), *((float *)&v19 + 2), *((float *)&v19 + 3), *(float *)v20, *((float *)v20 + 1), *((float *)v20 + 2), &v16, v21);
            }
          }
        }
        v6 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v12, v22, 16);
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
  _OWORD v4[4];
  int v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  memset(v4, 0, sizeof(v4));
  v5 = a3 | 1;
  return (id)objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", v4, 68);
}

- (FigCaptureSphereCalibrationContext)initWithSupportedDeviceNames:(id)a3
{
  uint64_t CFPreferenceNumberWithDefault;
  uint64_t v6;
  uint64_t v7;
  objc_super v9;

  CFPreferenceNumberWithDefault = FigGetCFPreferenceNumberWithDefault();
  v6 = FigGetCFPreferenceNumberWithDefault();
  v7 = *MEMORY[0x1E0D07788];
  v9.receiver = self;
  v9.super_class = (Class)FigCaptureSphereCalibrationContext;
  return -[FigCaptureCalibrationContext initWithPreferenceString:withActivityName:withPropertyName:withExpectedDataSize:withInterval:withMinimumBatteryLevel:withInternalLogName:supportedDeviceNames:](&v9, sel_initWithPreferenceString_withActivityName_withPropertyName_withExpectedDataSize_withInterval_withMinimumBatteryLevel_withInternalLogName_supportedDeviceNames_, CFSTR("SphereCalibrationData"), CFSTR("com.apple.coremedia.sphere.calibration"), v7, 68, CFPreferenceNumberWithDefault, v6, CFSTR("spherecal"), a3);
}

@end
