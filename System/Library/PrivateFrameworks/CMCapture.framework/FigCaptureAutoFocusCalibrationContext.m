@implementation FigCaptureAutoFocusCalibrationContext

+ (void)initialize
{
  objc_opt_class();
}

+ (void)printDebugInfoForRawStreamCalibrationData:(id)a3
{
  _OWORD v3[4];
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  memset(v3, 0, sizeof(v3));
  objc_msgSend(a3, "getBytes:length:", v3, 64);
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
  uint64_t *v23;
  char *v24;
  uint64_t *v25;
  char *v26;
  BWAFResonanceCalibrationAnalyticsPayload *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  id v33;
  uint64_t v35;
  unsigned int v36;
  unsigned int v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  _BYTE v49[128];
  uint64_t v50;

  v50 = *MEMORY[0x1E0C80C00];
  if (a3)
  {
    v6 = a3;
    v7 = +[BWAggdDataReporter sharedInstance](BWAggdDataReporter, "sharedInstance");
    objc_msgSend((id)objc_msgSend(v6, "objectForKeyedSubscript:", 0x1E4955D58), "doubleValue");
    -[BWAggdDataReporter reportCalibrationStatisticsWithTime:timeValue:attemptsField:attemptsValue:successField:successValue:magneticFieldMagnitudeField:magneticFieldMagnitudeValue:](v7, "reportCalibrationStatisticsWithTime:timeValue:attemptsField:attemptsValue:successField:successValue:magneticFieldMagnitudeField:magneticFieldMagnitudeValue:", CFSTR("com.apple.coremedia.camera.af.fieldcal.time.s"), 0, 0, 0, 0, 0);
    v43 = 0u;
    v44 = 0u;
    v41 = 0u;
    v42 = 0u;
    v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v41, v49, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v42;
      v31 = *MEMORY[0x1E0D05A18];
      v30 = *MEMORY[0x1E0D05A30];
      v32 = *(_QWORD *)v42;
      v33 = v6;
      do
      {
        v11 = 0;
        v35 = v9;
        do
        {
          if (*(_QWORD *)v42 != v10)
            objc_enumerationMutation(v6);
          v12 = *(void **)(*((_QWORD *)&v41 + 1) + 8 * v11);
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
              v37 = v15;
              v16 = objc_msgSend(v12, "isEqualToString:", 0x1E493BD98);
              v17 = v31;
              if (!v16)
                v17 = v30;
              v38 = v17;
              v47 = 0u;
              v48 = 0u;
              v45 = 0u;
              v46 = 0u;
              objc_msgSend(v14, "getBytes:length:", &v45, 64);
              v18 = (int)*((float *)&v45 + 1);
              v19 = (int)*(float *)&v46;
              v20 = (int)*((float *)&v45 + 2);
              v21 = (int)*((float *)&v46 + 1);
              v22 = (int)*((float *)&v45 + 3);
              v39 = 0;
              v40 = 0;
              v36 = HIDWORD(v47);
              if ((unsigned __int16)v45 == 1)
              {
                LODWORD(v40) = (int)(*((float *)&v48 + 1) * 10000.0);
                HIDWORD(v40) = (int)(*(float *)&v48 * 10000.0);
                LODWORD(v39) = (int)(*((float *)&v48 + 3) * 10000.0);
                HIDWORD(v39) = (int)(*((float *)&v48 + 2) * 10000.0);
                v23 = &v39;
                v24 = (char *)&v39 + 4;
                v25 = &v40;
                v26 = (char *)&v40 + 4;
              }
              else
              {
                v26 = 0;
                v25 = 0;
                v24 = 0;
                v23 = 0;
              }
              LOBYTE(v29) = a4;
              LODWORD(v28) = HIDWORD(v47);
              -[BWAggdDataReporter reportAutoFocusCalibrationForPosition:freqZ:deltaFreqZ:qZ:deltaQZ:gainZ:calibrationStatus:gelModelCoefficientD1:gelModelCoefficientD2:gelModelCoefficientP1:gelModelCoefficientP2:isValid:](+[BWAggdDataReporter sharedInstance](BWAggdDataReporter, "sharedInstance"), "reportAutoFocusCalibrationForPosition:freqZ:deltaFreqZ:qZ:deltaQZ:gainZ:calibrationStatus:gelModelCoefficientD1:gelModelCoefficientD2:gelModelCoefficientP1:gelModelCoefficientP2:isValid:", v37, v18, v19, v20, v21, v22, v28, v26, v25, v24, v23, v29);
              v27 = objc_alloc_init(BWAFResonanceCalibrationAnalyticsPayload);
              -[BWAFResonanceCalibrationAnalyticsPayload setMagneticFieldMagnitude:](v27, "setMagneticFieldMagnitude:", (uint64_t)a5);
              -[BWAFResonanceCalibrationAnalyticsPayload setPortType:](v27, "setPortType:", v38);
              -[BWAFResonanceCalibrationAnalyticsPayload setCalibrationStatus:](v27, "setCalibrationStatus:", v36);
              -[BWAFResonanceCalibrationAnalyticsPayload setAfAxisResonantFreq:](v27, "setAfAxisResonantFreq:", v18);
              -[BWAFResonanceCalibrationAnalyticsPayload setDeltaAFAxisResonantFreq:](v27, "setDeltaAFAxisResonantFreq:", v19);
              -[BWAFResonanceCalibrationAnalyticsPayload setAfAxisDampingCoefficient:](v27, "setAfAxisDampingCoefficient:", v20);
              -[BWAFResonanceCalibrationAnalyticsPayload setDeltaAFAxisDampingCoefficient:](v27, "setDeltaAFAxisDampingCoefficient:", v21);
              -[BWAFResonanceCalibrationAnalyticsPayload setAfLoopGain:](v27, "setAfLoopGain:", v22);
              -[BWAFResonanceCalibrationAnalyticsPayload setAfGelModelD1Coefficient:](v27, "setAfGelModelD1Coefficient:", HIDWORD(v40));
              -[BWAFResonanceCalibrationAnalyticsPayload setAfGelModelD2Coefficient:](v27, "setAfGelModelD2Coefficient:", v40);
              -[BWAFResonanceCalibrationAnalyticsPayload setAfGelModelP1Coefficient:](v27, "setAfGelModelP1Coefficient:", HIDWORD(v39));
              -[BWAFResonanceCalibrationAnalyticsPayload setAfGelModelP2Coefficient:](v27, "setAfGelModelP2Coefficient:", v39);
              -[BWCoreAnalyticsReporter sendEvent:](+[BWCoreAnalyticsReporter sharedInstance](BWCoreAnalyticsReporter, "sharedInstance"), "sendEvent:", v27);
              v10 = v32;
              v6 = v33;
              v9 = v35;
            }
          }
          ++v11;
        }
        while (v9 != v11);
        v9 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v41, v49, 16);
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
  _OWORD v4[2];
  __int128 v5;
  __int128 v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v5 = 0u;
  v6 = 0u;
  memset(v4, 0, sizeof(v4));
  objc_msgSend(a3, "getBytes:length:", v4, 64);
  return HIDWORD(v5);
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
  uint64_t v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int16 v18;
  _OWORD v19[3];
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  if (a3)
  {
    v4 = (void *)objc_msgSend(MEMORY[0x1E0CB37A0], "string");
    v13 = 0u;
    v14 = 0u;
    v15 = 0u;
    v16 = 0u;
    v5 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v13, v21, 16);
    if (v5)
    {
      v6 = v5;
      v7 = *(_QWORD *)v14;
      do
      {
        for (i = 0; i != v6; ++i)
        {
          if (*(_QWORD *)v14 != v7)
            objc_enumerationMutation(a3);
          v9 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * i);
          if ((objc_msgSend(v9, "isEqualToString:", 0x1E493BD98) & 1) != 0
            || objc_msgSend(v9, "isEqualToString:", 0x1E493BDB8))
          {
            v10 = (void *)objc_msgSend(a3, "objectForKeyedSubscript:", v9);
            if (v10)
            {
              v20 = 0u;
              memset(v19, 0, sizeof(v19));
              objc_msgSend(v10, "getBytes:length:", v19, 64);
              v11 = LOWORD(v19[0]);
              v17 = *(_OWORD *)((char *)&v19[1] + 8);
              v18 = WORD4(v19[2]);
              objc_msgSend(v4, "appendFormat:", CFSTR("%@, %d, %f, %f, %f, %f, %f, %s, %d, "), v9, LOWORD(v19[0]), *((float *)v19 + 1), *((float *)v19 + 2), *((float *)v19 + 3), *(float *)&v19[1], *((float *)&v19[1] + 1), &v17, HIDWORD(v19[2]));
              if (v11 == 1)
                objc_msgSend(v4, "appendFormat:", CFSTR("%f, %f, %f, %f "), *(float *)&v20, *((float *)&v20 + 1), *((float *)&v20 + 2), *((float *)&v20 + 3));
            }
          }
        }
        v6 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v13, v21, 16);
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
  _OWORD v4[2];
  __int128 v5;
  __int128 v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v5 = 0u;
  v6 = 0u;
  memset(v4, 0, sizeof(v4));
  HIDWORD(v5) = a3 | 1;
  return (id)objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", v4, 64);
}

- (FigCaptureAutoFocusCalibrationContext)initWithSupportedDeviceNames:(id)a3
{
  uint64_t CFPreferenceNumberWithDefault;
  uint64_t v6;
  uint64_t v7;
  objc_super v9;

  CFPreferenceNumberWithDefault = FigGetCFPreferenceNumberWithDefault();
  v6 = FigGetCFPreferenceNumberWithDefault();
  v7 = *MEMORY[0x1E0D07390];
  v9.receiver = self;
  v9.super_class = (Class)FigCaptureAutoFocusCalibrationContext;
  return -[FigCaptureCalibrationContext initWithPreferenceString:withActivityName:withPropertyName:withExpectedDataSize:withInterval:withMinimumBatteryLevel:withInternalLogName:supportedDeviceNames:](&v9, sel_initWithPreferenceString_withActivityName_withPropertyName_withExpectedDataSize_withInterval_withMinimumBatteryLevel_withInternalLogName_supportedDeviceNames_, CFSTR("AutoFocusCalibrationData"), CFSTR("com.apple.coremedia.af.calibration"), v7, 64, CFPreferenceNumberWithDefault, v6, CFSTR("afcal"), a3);
}

@end
