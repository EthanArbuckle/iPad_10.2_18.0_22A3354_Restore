@implementation FigCaptureAutoFocusPositionSensorCalibrationContext

+ (void)initialize
{
  objc_opt_class();
}

+ (void)printDebugInfoForRawStreamCalibrationData:(id)a3
{
  _OWORD v3[7];
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  v4 = 0;
  memset(v3, 0, sizeof(v3));
  objc_msgSend(a3, "getBytes:length:", v3, 120);
}

- (void)reportLoggingWithCalibrationData:(id)a3 isValid:(BOOL)a4 magneticFieldMagnitude:(double)a5
{
  id v6;
  const __CFString *v7;
  BWAggdDataReporter *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  int v16;
  int v17;
  __int16 v18;
  __int16 v19;
  unsigned int v20;
  unsigned int v21;
  uint64_t v22;
  unsigned int v23;
  double currentAngleDelta;
  double previousAngleDelta;
  uint64_t *v26;
  char *v27;
  uint64_t *v28;
  char *v29;
  uint64_t *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  id v34;
  uint64_t v36;
  char *v37;
  unsigned int v38;
  int v39;
  __int16 v40;
  __int16 v41;
  unsigned int v42;
  unsigned int v43;
  unsigned int v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  uint64_t v59;
  _BYTE v60[128];
  uint64_t v61;

  v61 = *MEMORY[0x1E0C80C00];
  if (a3)
  {
    v6 = a3;
    if (a4)
      v7 = CFSTR("com.apple.coremedia.camera.aps.fieldcal.NumCalSuccesses");
    else
      v7 = 0;
    v8 = +[BWAggdDataReporter sharedInstance](BWAggdDataReporter, "sharedInstance");
    objc_msgSend((id)objc_msgSend(v6, "objectForKeyedSubscript:", 0x1E4955D58), "doubleValue");
    -[BWAggdDataReporter reportCalibrationStatisticsWithTime:timeValue:attemptsField:attemptsValue:successField:successValue:magneticFieldMagnitudeField:magneticFieldMagnitudeValue:](v8, "reportCalibrationStatisticsWithTime:timeValue:attemptsField:attemptsValue:successField:successValue:magneticFieldMagnitudeField:magneticFieldMagnitudeValue:", CFSTR("com.apple.coremedia.camera.aps.fieldcal.time"), CFSTR("com.apple.coremedia.camera.aps.fieldcal.NumCalAttempts"), 1, v7, 1, CFSTR("com.apple.coremedia.camera.aps.fieldcal.fieldMagnitude"));
    v50 = 0u;
    v51 = 0u;
    v48 = 0u;
    v49 = 0u;
    v9 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v48, v60, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v49;
      v33 = *(_QWORD *)v49;
      v34 = v6;
      do
      {
        v12 = 0;
        v36 = v10;
        do
        {
          if (*(_QWORD *)v49 != v11)
            objc_enumerationMutation(v6);
          v13 = *(void **)(*((_QWORD *)&v48 + 1) + 8 * v12);
          if ((objc_msgSend(v13, "isEqualToString:", 0x1E493BD98) & 1) != 0
            || objc_msgSend(v13, "isEqualToString:", 0x1E493BDB8))
          {
            v14 = objc_msgSend(v6, "objectForKeyedSubscript:", v13);
            if (v14)
            {
              v15 = (void *)v14;
              v16 = objc_msgSend(v13, "isEqualToString:", 0x1E493BD98);
              v59 = 0;
              if (v16)
                v17 = 1;
              else
                v17 = 2;
              v57 = 0u;
              v58 = 0u;
              v55 = 0u;
              v56 = 0u;
              v53 = 0u;
              v54 = 0u;
              v52 = 0u;
              objc_msgSend(v15, "getBytes:length:", &v52, 120);
              v18 = WORD2(v52);
              v19 = WORD3(v52);
              v20 = v56;
              v21 = DWORD2(v53);
              v22 = HIDWORD(v55);
              v40 = WORD5(v52);
              v39 = objc_msgSend((id)-[NSMutableDictionary objectForKeyedSubscript:](self->_iStopZEstimateDeltaHistory, "objectForKeyedSubscript:", v13), "lastPassingIStopZEstimateDelta");
              v38 = objc_msgSend((id)-[NSMutableDictionary objectForKeyedSubscript:](self->_iStopZEstimateDeltaHistory, "objectForKeyedSubscript:", v13), "currentIStopZEstimateDelta");
              v23 = objc_msgSend((id)-[NSMutableDictionary objectForKeyedSubscript:](self->_iStopZEstimateDeltaHistory, "objectForKeyedSubscript:", v13), "previousIStopZEstimateDelta");
              currentAngleDelta = self->_currentAngleDelta;
              previousAngleDelta = self->_previousAngleDelta;
              v46 = 0;
              v47 = 0;
              v45 = 0;
              v43 = v20;
              v44 = v17;
              v41 = v18;
              v42 = v21;
              if ((_WORD)v52)
              {
                LODWORD(v47) = (int)*((float *)&v58 + 1);
                HIDWORD(v47) = HIDWORD(v58);
                LODWORD(v46) = (int)*((float *)&v57 + 3);
                HIDWORD(v46) = (int)*((float *)&v58 + 2);
                HIDWORD(v45) = (int)*(float *)&v59;
                if ((unsigned __int16)v52 == 2)
                {
                  v26 = &v45;
                  v37 = (char *)&v47 + 4;
                  LODWORD(v45) = (int)*((float *)&v59 + 1);
                }
                else
                {
                  v26 = 0;
                  v37 = (char *)&v47 + 4;
                }
                v30 = &v47;
                v29 = (char *)&v46 + 4;
                v28 = &v46;
                v27 = (char *)&v45 + 4;
              }
              else
              {
                v27 = 0;
                v28 = 0;
                v29 = 0;
                v30 = 0;
                v37 = 0;
                v26 = 0;
              }
              BYTE1(v32) = BYTE1(v22) & 1;
              LOBYTE(v32) = a4;
              HIDWORD(v31) = v39;
              LOWORD(v31) = v40;
              -[BWAggdDataReporter reportAutoFocusPositionSensorCalibrationForPosition:iStopZEstimate:eSensorOutput:wSensorOutput:gravityZ:calibrationStatus:sensorTemp:successfulInfinityEndStopDelta:currentInfinityEndStopDelta:previousInfinityEndStopDelta:currentAngleDelta:previousAngleDelta:factoryCalibrationOffset:estimatedNeutralZ:deltaNeutralZFromNVM:estimatedSagZ:combinedSensorOutput:deltaSagFromNVM:isValid:dataWasRejectedByHistory:](+[BWAggdDataReporter sharedInstance](BWAggdDataReporter, "sharedInstance"), "reportAutoFocusPositionSensorCalibrationForPosition:iStopZEstimate:eSensorOutput:wSensorOutput:gravityZ:calibrationStatus:sensorTemp:successfulInfinityEndStopDelta:currentInfinityEndStopDelta:previousInfinityEndStopDelta:currentAngleDelta:previousAngleDelta:factoryCalibrationOffset:estimatedNeutralZ:deltaNeutralZFromNVM:estimatedSagZ:combinedSensorOutput:deltaSagFromNVM:isValid:dataWasRejectedByHistory:", v44, v42, v41, v19, v43, v22, v31, __PAIR64__(v23, v38), __PAIR64__((int)previousAngleDelta, (int)currentAngleDelta), v37, v30, v29, v28, v27,
                v26,
                v32);
              v11 = v33;
              v6 = v34;
              v10 = v36;
            }
          }
          ++v12;
        }
        while (v10 != v12);
        v10 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v48, v60, 16);
      }
      while (v10);
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
  _OWORD v4[3];
  __int128 v5;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v9 = 0;
  v7 = 0u;
  v8 = 0u;
  v5 = 0u;
  v6 = 0u;
  memset(v4, 0, sizeof(v4));
  objc_msgSend(a3, "getBytes:length:", v4, 120);
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
  int v11;
  uint64_t v12;
  uint64_t v13;
  float v14;
  float v15;
  float v16;
  float v17;
  uint64_t v18;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int16 v25;
  __int128 v26;
  __int128 v27;
  _OWORD v28[2];
  __int128 v29;
  __int128 v30;
  __int128 v31;
  float v32[4];
  _BYTE v33[128];
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  if (a3)
  {
    v4 = (void *)objc_msgSend(MEMORY[0x1E0CB37A0], "string");
    v20 = 0u;
    v21 = 0u;
    v22 = 0u;
    v23 = 0u;
    v5 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v20, v33, 16);
    if (v5)
    {
      v6 = v5;
      v7 = *(_QWORD *)v21;
      do
      {
        for (i = 0; i != v6; ++i)
        {
          if (*(_QWORD *)v21 != v7)
            objc_enumerationMutation(a3);
          v9 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * i);
          if ((objc_msgSend(v9, "isEqualToString:", 0x1E493BD98) & 1) != 0
            || objc_msgSend(v9, "isEqualToString:", 0x1E493BDB8))
          {
            v10 = (void *)objc_msgSend(a3, "objectForKeyedSubscript:", v9);
            if (v10)
            {
              *(_QWORD *)v32 = 0;
              v30 = 0u;
              v31 = 0u;
              v29 = 0u;
              v27 = 0u;
              memset(v28, 0, sizeof(v28));
              v26 = 0u;
              objc_msgSend(v10, "getBytes:length:", &v26, 120);
              v11 = (unsigned __int16)v26;
              v24 = *(_OWORD *)((char *)v28 + 8);
              v25 = WORD4(v28[1]);
              v12 = HIDWORD(v28[1]);
              objc_msgSend(v4, "appendFormat:", CFSTR("%@, %d, %d, %d, %d, %d, %d, %d, %d, %d, %d, %d, %d, %d, %d, "), v9, (unsigned __int16)v26, SWORD2(v26), SWORD3(v26), SWORD4(v26), SWORD5(v26), HIDWORD(v26), v27, SWORD2(v27), SWORD3(v27), DWORD2(v27), HIDWORD(v27), LODWORD(v28[0]), DWORD1(v28[0]), v29);
              if (v11)
              {
                v13 = *(_QWORD *)((char *)&v30 + 4);
                v14 = *((float *)&v31 + 2);
                v15 = *((float *)&v30 + 3);
                v16 = *((float *)&v31 + 1);
                v17 = v32[0];
                v18 = HIDWORD(v31);
                objc_msgSend(v4, "appendFormat:", CFSTR("%f, %f, %f, %f "), *((float *)&v29 + 1), *((float *)&v29 + 2), *((float *)&v29 + 3), *(float *)&v30);
                objc_msgSend(v4, "appendFormat:", CFSTR("%f, %f, "), *(float *)&v13, *((float *)&v13 + 1));
                objc_msgSend(v4, "appendFormat:", CFSTR("%f, %f, %f, %d, %f, "), v15, v14, v16, v18, v17);
                if (v11 == 2)
                  objc_msgSend(v4, "appendFormat:", CFSTR("%f, "), v32[1]);
              }
              objc_msgSend(v4, "appendFormat:", CFSTR("%s, %d, "), &v24, v12);
            }
          }
        }
        v6 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v20, v33, 16);
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
  __int128 v5;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v9 = 0;
  v7 = 0u;
  v8 = 0u;
  v5 = 0u;
  v6 = 0u;
  memset(v4, 0, sizeof(v4));
  HIDWORD(v5) = a3 | 1;
  return (id)objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", v4, 120);
}

+ (void)setStatusForCalibrationData:(id)a3 status:(int)a4
{
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _OWORD v17[3];
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  uint64_t v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  if (a3)
  {
    v15 = 0u;
    v16 = 0u;
    v13 = 0u;
    v14 = 0u;
    v6 = (void *)objc_msgSend(a3, "allKeys");
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v23, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v14;
      do
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v14 != v9)
            objc_enumerationMutation(v6);
          v11 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * i);
          if ((objc_msgSend(v11, "isEqualToString:", 0x1E493BD98) & 1) != 0
            || objc_msgSend(v11, "isEqualToString:", 0x1E493BDB8))
          {
            v12 = (void *)objc_msgSend(a3, "objectForKeyedSubscript:", v11);
            v22 = 0;
            v20 = 0u;
            v21 = 0u;
            v18 = 0u;
            v19 = 0u;
            memset(v17, 0, sizeof(v17));
            objc_msgSend(v12, "getBytes:length:", v17, 120);
            if (LOWORD(v17[0]) <= 2u)
              HIDWORD(v18) = a4;
            objc_msgSend(a3, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", v17, 120), v11);
          }
        }
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v23, 16);
      }
      while (v8);
    }
  }
  else
  {
    fig_log_get_emitter();
    FigDebugAssert3();
  }
}

- (FigCaptureAutoFocusPositionSensorCalibrationContext)initWithSupportedDeviceNames:(id)a3
{
  uint64_t CFPreferenceNumberWithDefault;
  uint64_t v6;
  uint64_t v7;
  FigCaptureAutoFocusPositionSensorCalibrationContext *v8;
  const __CFArray *v9;
  const __CFString *v10;
  const __CFString *v11;
  CFDictionaryRef v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  NSMutableArray *v17;
  NSDictionary *v18;
  objc_super v20;
  objc_super v21;
  objc_super v22;
  objc_super v23;
  _QWORD v24[4];

  v24[3] = *MEMORY[0x1E0C80C00];
  CFPreferenceNumberWithDefault = FigGetCFPreferenceNumberWithDefault();
  v6 = FigGetCFPreferenceNumberWithDefault();
  v7 = *MEMORY[0x1E0D073B0];
  v23.receiver = self;
  v23.super_class = (Class)FigCaptureAutoFocusPositionSensorCalibrationContext;
  v8 = -[FigCaptureCalibrationContext initWithPreferenceString:withActivityName:withPropertyName:withExpectedDataSize:withInterval:withMinimumBatteryLevel:withInternalLogName:supportedDeviceNames:](&v23, sel_initWithPreferenceString_withActivityName_withPropertyName_withExpectedDataSize_withInterval_withMinimumBatteryLevel_withInternalLogName_supportedDeviceNames_, CFSTR("AutoFocusPositionSensorCalibrationData"), CFSTR("com.apple.coremedia.aps.calibration"), v7, 120, CFPreferenceNumberWithDefault, v6, CFSTR("apscal"), a3);
  if (v8)
  {
    v24[0] = CFSTR("aps_cal_data");
    v24[1] = CFSTR("aps_cal_attempts");
    v24[2] = CFSTR("aps_cal_lastsuccess");
    v9 = (const __CFArray *)objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v24, 3);
    v10 = (const __CFString *)*MEMORY[0x1E0C9B260];
    v11 = (const __CFString *)*MEMORY[0x1E0C9B230];
    v12 = CFPreferencesCopyMultiple(v9, CFSTR("com.apple.cameracapture.volatile"), (CFStringRef)*MEMORY[0x1E0C9B260], (CFStringRef)*MEMORY[0x1E0C9B230]);
    if (-[__CFDictionary count](v12, "count"))
    {
      v13 = -[__CFDictionary objectForKeyedSubscript:](v12, "objectForKeyedSubscript:", CFSTR("aps_cal_data"));
      v14 = -[__CFDictionary objectForKeyedSubscript:](v12, "objectForKeyedSubscript:", CFSTR("aps_cal_lastsuccess"));
      if (v13)
      {
        v15 = (void *)v14;
        v22.receiver = v8;
        v22.super_class = (Class)FigCaptureAutoFocusPositionSensorCalibrationContext;
        -[FigCaptureCalibrationContext setLastSuccessfulCalibrationData:](&v22, sel_setLastSuccessfulCalibrationData_, v13);
        if (v15)
        {
          objc_msgSend(v15, "doubleValue");
          v21.receiver = v8;
          v21.super_class = (Class)FigCaptureAutoFocusPositionSensorCalibrationContext;
          -[FigCaptureCalibrationContext setLastSuccessfulCalibrationTimeStamp:](&v21, sel_setLastSuccessfulCalibrationTimeStamp_);
        }
      }
      v8->_shouldDeleteOldVersion = 1;
    }
    v16 = (void *)CFPreferencesCopyValue(CFSTR("AutoFocusPositionSensorCalibrationData"), CFSTR("com.apple.cameracapture.volatile"), v10, v11);
    v8->_maxHistoryBuffer = 2;
    v17 = (NSMutableArray *)objc_msgSend((id)objc_msgSend(v16, "objectForKeyedSubscript:", 0x1E4955DD8), "mutableCopy");
    v8->_calibrationDataHistoryQueue = v17;
    if (v17)
    {
      if (-[NSMutableArray count](v17, "count") > (unint64_t)v8->_maxHistoryBuffer)
        -[NSMutableArray removeObjectsInRange:](v8->_calibrationDataHistoryQueue, "removeObjectsInRange:", 0, -[NSMutableArray count](v8->_calibrationDataHistoryQueue, "count") - v8->_maxHistoryBuffer);
    }
    else
    {
      v8->_calibrationDataHistoryQueue = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v20.receiver = v8;
      v20.super_class = (Class)FigCaptureAutoFocusPositionSensorCalibrationContext;
      v18 = -[FigCaptureCalibrationContext lastSuccessfulCalibrationData](&v20, sel_lastSuccessfulCalibrationData);
      if (v18)
        -[NSMutableArray addObject:](v8->_calibrationDataHistoryQueue, "addObject:", v18);
    }
    v8->_maxIStopZEstimateDifference = 10;
    v8->_minCompassHeadingChange = 5;

    v8->_iStopZEstimateDeltaHistory = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
  }
  return v8;
}

- (void)pushCalibrationDataToHistory:(id)a3 isRejected:(BOOL *)a4
{
  if (a4)
    *a4 = -[FigCaptureAutoFocusPositionSensorCalibrationContext _shouldRejectCalibrationData:](self, "_shouldRejectCalibrationData:", a3);
  -[FigCaptureAutoFocusPositionSensorCalibrationContext _pushToCalibrationHistoryQueue:](self, "_pushToCalibrationHistoryQueue:", a3);
}

- (id)calibrationDataHistory
{
  return (id)-[NSMutableArray copy](self->_calibrationDataHistoryQueue, "copy");
}

- (void)setLastSuccessfulCalibrationData:(id)a3
{
  const __CFString *v5;
  const __CFString *v6;
  objc_super v7;

  -[FigCaptureAutoFocusPositionSensorCalibrationContext _updateIStopZEstimateDelta:](self, a3);
  v7.receiver = self;
  v7.super_class = (Class)FigCaptureAutoFocusPositionSensorCalibrationContext;
  -[FigCaptureCalibrationContext setLastSuccessfulCalibrationData:](&v7, sel_setLastSuccessfulCalibrationData_, a3);
  if (self->_shouldDeleteOldVersion)
  {
    v5 = (const __CFString *)*MEMORY[0x1E0C9B260];
    v6 = (const __CFString *)*MEMORY[0x1E0C9B230];
    CFPreferencesSetValue(CFSTR("aps_cal_data"), 0, CFSTR("com.apple.cameracapture.volatile"), (CFStringRef)*MEMORY[0x1E0C9B260], (CFStringRef)*MEMORY[0x1E0C9B230]);
    CFPreferencesSetValue(CFSTR("aps_cal_attempts"), 0, CFSTR("com.apple.cameracapture.volatile"), v5, v6);
    CFPreferencesSetValue(CFSTR("aps_cal_lastsuccess"), 0, CFSTR("com.apple.cameracapture.volatile"), v5, v6);
    self->_shouldDeleteOldVersion = 0;
  }
}

- (void)_updateIStopZEstimateDelta:(void *)result
{
  uint64_t v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  BOOL v11;
  void *v12;
  int v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  uint64_t v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  uint64_t v33;
  _BYTE v34[128];
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  if (result)
  {
    if (a2)
    {
      v3 = (uint64_t)result;
      v4 = (void *)objc_msgSend(result, "lastSuccessfulCalibrationData");
      v14 = 0u;
      v15 = 0u;
      v16 = 0u;
      v17 = 0u;
      result = (void *)objc_msgSend(a2, "countByEnumeratingWithState:objects:count:", &v14, v34, 16);
      if (result)
      {
        v5 = result;
        v6 = *(_QWORD *)v15;
        do
        {
          v7 = 0;
          do
          {
            if (*(_QWORD *)v15 != v6)
              objc_enumerationMutation(a2);
            v8 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * (_QWORD)v7);
            if ((objc_msgSend(v8, "isEqualToString:", 0x1E493BD98) & 1) != 0
              || objc_msgSend(v8, "isEqualToString:", 0x1E493BDB8))
            {
              v9 = (void *)objc_msgSend(v4, "objectForKeyedSubscript:", v8);
              v10 = objc_msgSend(a2, "objectForKeyedSubscript:", v8);
              if (v9)
                v11 = v10 == 0;
              else
                v11 = 1;
              if (!v11)
              {
                v12 = (void *)v10;
                v33 = 0;
                v31 = 0u;
                v32 = 0u;
                v29 = 0u;
                v30 = 0u;
                v27 = 0u;
                v28 = 0u;
                v26 = 0u;
                objc_msgSend(v9, "getBytes:length:", &v26, 120);
                v25 = 0;
                v23 = 0u;
                v24 = 0u;
                v21 = 0u;
                v22 = 0u;
                v19 = 0u;
                v20 = 0u;
                v18 = 0u;
                objc_msgSend(v12, "getBytes:length:", &v18, 120);
                LODWORD(v12) = DWORD2(v27);
                v13 = DWORD2(v19);
                -[FigCaptureAutoFocusPositionSensorCalibrationContext _ensureIStopZEstimateDeltasForKey:](v3, (uint64_t)v8);
                objc_msgSend((id)objc_msgSend(*(id *)(v3 + 112), "objectForKeyedSubscript:", v8), "setLastPassingIStopZEstimateDelta:", (v13 - (_DWORD)v12));
              }
            }
            v7 = (char *)v7 + 1;
          }
          while (v5 != v7);
          result = (void *)objc_msgSend(a2, "countByEnumeratingWithState:objects:count:", &v14, v34, 16);
          v5 = result;
        }
        while (result);
      }
    }
    else
    {
      fig_log_get_emitter();
      return (void *)FigDebugAssert3();
    }
  }
  return result;
}

- (uint64_t)_ensureIStopZEstimateDeltasForKey:(uint64_t)result
{
  uint64_t v3;

  if (result)
  {
    v3 = result;
    result = objc_msgSend(*(id *)(result + 112), "objectForKeyedSubscript:", a2);
    if (!result)
      return objc_msgSend(*(id *)(v3 + 112), "setObject:forKeyedSubscript:", objc_alloc_init(FigCaptureAutoFocusPositionSensorCalibrationIStopZEstimateDeltaHistory), a2);
  }
  return result;
}

- (id)_initForUnitTests
{
  FigCaptureAutoFocusPositionSensorCalibrationContext *v2;
  FigCaptureAutoFocusPositionSensorCalibrationContext *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)FigCaptureAutoFocusPositionSensorCalibrationContext;
  v2 = -[FigCaptureCalibrationContext initWithPreferenceString:withActivityName:withPropertyName:withExpectedDataSize:withInterval:withMinimumBatteryLevel:withInternalLogName:supportedDeviceNames:](&v5, sel_initWithPreferenceString_withActivityName_withPropertyName_withExpectedDataSize_withInterval_withMinimumBatteryLevel_withInternalLogName_supportedDeviceNames_, CFSTR("fakeprefstring"), 0, 0, 0, 0, 0, 0, 0);
  v3 = v2;
  if (v2)
  {
    v2->_maxHistoryBuffer = 2;
    v2->_maxIStopZEstimateDifference = 10;
    v2->_minCompassHeadingChange = 5;
    v2->_calibrationDataHistoryQueue = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v3->_iStopZEstimateDeltaHistory = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
  }
  return v3;
}

- (void)_pushToCalibrationHistoryQueue:(id)a3
{
  -[NSMutableArray addObject:](self->_calibrationDataHistoryQueue, "addObject:", a3);
  if (-[NSMutableArray count](self->_calibrationDataHistoryQueue, "count") > (unint64_t)self->_maxHistoryBuffer)
    -[NSMutableArray removeObjectsInRange:](self->_calibrationDataHistoryQueue, "removeObjectsInRange:", 0, -[NSMutableArray count](self->_calibrationDataHistoryQueue, "count") - self->_maxHistoryBuffer);
}

- (BOOL)_shouldRejectCalibrationData:(id)a3
{
  NSMutableArray *calibrationDataHistoryQueue;
  BOOL v7;

  if (self->_disableHistoryChecking)
    return 0;
  calibrationDataHistoryQueue = self->_calibrationDataHistoryQueue;
  v7 = -[FigCaptureAutoFocusPositionSensorCalibrationContext _calibrationDataIsWithinIStopZEstimateLimits:basedOnCalibrationHistory:](self, "_calibrationDataIsWithinIStopZEstimateLimits:basedOnCalibrationHistory:", a3, calibrationDataHistoryQueue);
  return v7 & -[FigCaptureAutoFocusPositionSensorCalibrationContext _calibrationDataCompassHeadingHasMovedPastMinimum:basedOnCalibrationHistory:](self, "_calibrationDataCompassHeadingHasMovedPastMinimum:basedOnCalibrationHistory:", a3, calibrationDataHistoryQueue) ^ 1;
}

- (BOOL)_calibrationDataIsWithinIStopZEstimateLimits:(id)a3 basedOnCalibrationHistory:(id)a4
{
  FigCaptureAutoFocusPositionSensorCalibrationContext *v6;
  int v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v18;
  uint64_t v19;
  int v20;
  BOOL v21;
  int v24;
  id obj;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  BOOL v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  uint64_t v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  uint64_t v54;
  _BYTE v55[128];
  _BYTE v56[128];
  uint64_t v57;

  v57 = *MEMORY[0x1E0C80C00];
  if (objc_msgSend(a4, "count") == self->_maxHistoryBuffer)
  {
    v6 = self;
    v37 = 0u;
    v38 = 0u;
    v35 = 0u;
    v36 = 0u;
    v27 = objc_msgSend(a4, "countByEnumeratingWithState:objects:count:", &v35, v56, 16);
    if (v27)
    {
      v30 = 0;
      v7 = 0;
      obj = a4;
      v26 = *(_QWORD *)v36;
      do
      {
        v8 = 0;
        v24 = v7;
        do
        {
          if (*(_QWORD *)v36 != v26)
            objc_enumerationMutation(obj);
          v28 = v8;
          v9 = *(void **)(*((_QWORD *)&v35 + 1) + 8 * v8);
          v31 = 0u;
          v32 = 0u;
          v33 = 0u;
          v34 = 0u;
          v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v31, v55, 16);
          if (v10)
          {
            v11 = v10;
            v12 = *(_QWORD *)v32;
            do
            {
              for (i = 0; i != v11; ++i)
              {
                if (*(_QWORD *)v32 != v12)
                  objc_enumerationMutation(v9);
                v14 = *(void **)(*((_QWORD *)&v31 + 1) + 8 * i);
                if ((objc_msgSend(v14, "isEqualToString:", 0x1E493BD98) & 1) != 0
                  || objc_msgSend(v14, "isEqualToString:", 0x1E493BDB8))
                {
                  v15 = (void *)objc_msgSend(v9, "objectForKeyedSubscript:", v14);
                  v16 = objc_msgSend(a3, "objectForKeyedSubscript:", v14);
                  if (v15 && v16 != 0)
                  {
                    v18 = (void *)v16;
                    v54 = 0;
                    v52 = 0u;
                    v53 = 0u;
                    v50 = 0u;
                    v51 = 0u;
                    v48 = 0u;
                    v49 = 0u;
                    v47 = 0u;
                    objc_msgSend(v15, "getBytes:length:", &v47, 120);
                    v46 = 0;
                    v44 = 0u;
                    v45 = 0u;
                    v42 = 0u;
                    v43 = 0u;
                    v40 = 0u;
                    v41 = 0u;
                    v39 = 0u;
                    objc_msgSend(v18, "getBytes:length:", &v39, 120);
                    v19 = (DWORD2(v40) - DWORD2(v48));
                    if ((int)v19 / 255 >= 0)
                      v20 = (int)v19 / 255;
                    else
                      v20 = (int)v19 / -255;
                    -[FigCaptureAutoFocusPositionSensorCalibrationContext _ensureIStopZEstimateDeltasForKey:]((uint64_t)v6, (uint64_t)v14);
                    if (v7 == 1)
                    {
                      objc_msgSend((id)-[NSMutableDictionary objectForKeyedSubscript:](v6->_iStopZEstimateDeltaHistory, "objectForKeyedSubscript:", v14), "setCurrentIStopZEstimateDelta:", v19);
                    }
                    else if (!v7)
                    {
                      objc_msgSend((id)-[NSMutableDictionary objectForKeyedSubscript:](v6->_iStopZEstimateDeltaHistory, "objectForKeyedSubscript:", v14), "setPreviousIStopZEstimateDelta:", v19);
                    }
                    v21 = v30 || v20 > v6->_maxIStopZEstimateDifference;
                    v30 = v21;
                  }
                }
              }
              v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v31, v55, 16);
            }
            while (v11);
          }
          ++v7;
          v8 = v28 + 1;
        }
        while (v28 + 1 != v27);
        v7 = v24 + v27;
        v27 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v35, v56, 16);
      }
      while (v27);
    }
    else
    {
      v30 = 0;
    }
    return !v30;
  }
  else
  {
    return 0;
  }
}

- (BOOL)_calibrationDataCompassHeadingHasMovedPastMinimum:(id)a3 basedOnCalibrationHistory:(id)a4
{
  uint64_t v7;
  BOOL v8;
  void *v9;
  id v10;
  void *v11;
  uint64_t v12;
  void *v13;
  double v14;
  double v15;
  double v16;
  int *v17;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;

  if (objc_msgSend(a4, "count") == self->_maxHistoryBuffer)
  {
    if (objc_msgSend(a4, "count"))
    {
      v7 = 0;
      v8 = 0;
      while (1)
      {
        v9 = (void *)objc_msgSend(a4, "objectAtIndexedSubscript:", v7);
        v10 = a3;
        if (v7 != objc_msgSend(a4, "count") - 1)
          v10 = (id)objc_msgSend(a4, "objectAtIndexedSubscript:", v7 + 1);
        v11 = (void *)objc_msgSend(v9, "objectForKeyedSubscript:", 0x1E4955DB8);
        v12 = objc_msgSend(v10, "objectForKeyedSubscript:", 0x1E4955DB8);
        if (!v11)
          goto LABEL_17;
        v13 = (void *)v12;
        if (!v12)
          goto LABEL_17;
        v23 = 0.0;
        v24 = 0.0;
        v25 = 0.0;
        objc_msgSend(v11, "getBytes:length:", &v23, 24);
        v20 = 0.0;
        v21 = 0.0;
        v22 = 0.0;
        objc_msgSend(v13, "getBytes:length:", &v20, 24);
        v14 = sqrt(v24 * v24 + v23 * v23 + v25 * v25);
        v15 = sqrt(v21 * v21 + v20 * v20 + v22 * v22);
        v16 = acos(v24 / v14 * (v21 / v15) + v20 / v15 * (v23 / v14) + v22 / v15 * (v25 / v14)) * 57.2957795;
        if (!(_DWORD)v7)
          break;
        if ((_DWORD)v7 == 1)
        {
          v17 = &OBJC_IVAR___FigCaptureAutoFocusPositionSensorCalibrationContext__currentAngleDelta;
LABEL_12:
          *(double *)((char *)&self->super.super.isa + *v17) = v16;
        }
        v8 = v8 || v16 < (double)self->_minCompassHeadingChange;
LABEL_17:
        if (objc_msgSend(a4, "count") <= (unint64_t)++v7)
          return !v8;
      }
      v17 = &OBJC_IVAR___FigCaptureAutoFocusPositionSensorCalibrationContext__previousAngleDelta;
      goto LABEL_12;
    }
    v8 = 0;
    return !v8;
  }
  else
  {
    return 0;
  }
}

- (int)passingIStopZEstimateDeltaForPosition:(id)a3
{
  return objc_msgSend((id)-[NSMutableDictionary objectForKeyedSubscript:](self->_iStopZEstimateDeltaHistory, "objectForKeyedSubscript:", a3), "lastPassingIStopZEstimateDelta");
}

- (int)previousIStopZEstimateDeltaForPosition:(id)a3
{
  return objc_msgSend((id)-[NSMutableDictionary objectForKeyedSubscript:](self->_iStopZEstimateDeltaHistory, "objectForKeyedSubscript:", a3), "previousIStopZEstimateDelta");
}

- (int)currentIStopZEstimateDeltaForPosition:(id)a3
{
  return objc_msgSend((id)-[NSMutableDictionary objectForKeyedSubscript:](self->_iStopZEstimateDeltaHistory, "objectForKeyedSubscript:", a3), "currentIStopZEstimateDelta");
}

- (double)previousAngleDelta
{
  return self->_previousAngleDelta;
}

- (double)currentAngleDelta
{
  return self->_currentAngleDelta;
}

- (BOOL)disableHistoryChecking
{
  return self->_disableHistoryChecking;
}

- (void)setDisableHistoryChecking:(BOOL)a3
{
  self->_disableHistoryChecking = a3;
}

@end
