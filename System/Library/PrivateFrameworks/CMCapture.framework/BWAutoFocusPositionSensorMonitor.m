@implementation BWAutoFocusPositionSensorMonitor

+ (void)initialize
{
  objc_opt_class();
}

+ (id)sharedInstance
{
  if (sharedInstance_initSharedAutoFocusPositionSensorMonitor != -1)
    dispatch_once(&sharedInstance_initSharedAutoFocusPositionSensorMonitor, &__block_literal_global_82);
  return (id)sharedInstance_sharedAutoFocusPositionSensorMonitor;
}

BWAutoFocusPositionSensorMonitor *__50__BWAutoFocusPositionSensorMonitor_sharedInstance__block_invoke()
{
  BWAutoFocusPositionSensorMonitor *result;

  result = objc_alloc_init(BWAutoFocusPositionSensorMonitor);
  sharedInstance_sharedAutoFocusPositionSensorMonitor = (uint64_t)result;
  return result;
}

+ (void)processAPSOffsetEstimatorInfo:(id)a3 portType:(id)a4
{
  -[BWAutoFocusPositionSensorMonitor processAPSOffsetEstimatorInfo:portType:]((uint64_t)+[BWAutoFocusPositionSensorMonitor sharedInstance](BWAutoFocusPositionSensorMonitor, "sharedInstance"), (uint64_t)a3, (uint64_t)a4);
}

- (void)processAPSOffsetEstimatorInfo:(uint64_t)a3 portType:
{
  NSObject *v3;
  _QWORD block[7];

  if (a1)
  {
    v3 = *(NSObject **)(a1 + 8);
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __75__BWAutoFocusPositionSensorMonitor_processAPSOffsetEstimatorInfo_portType___block_invoke;
    block[3] = &unk_1E491EB90;
    block[4] = a1;
    block[5] = a2;
    block[6] = a3;
    dispatch_async(v3, block);
  }
}

+ (void)logStillImageAPSStatistics:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  BOOL v7;

  v4 = objc_msgSend(a3, "objectForKeyedSubscript:", *MEMORY[0x1E0D068A8]);
  v5 = objc_msgSend(a3, "objectForKeyedSubscript:", *MEMORY[0x1E0D06E50]);
  v6 = objc_msgSend(a3, "objectForKeyedSubscript:", *MEMORY[0x1E0D069B0]);
  if (v4)
    v7 = v5 == 0;
  else
    v7 = 1;
  if (!v7 && v6 != 0)
    -[BWAutoFocusPositionSensorMonitor logStillImageAPSStatistics:]((uint64_t)+[BWAutoFocusPositionSensorMonitor sharedInstance](BWAutoFocusPositionSensorMonitor, "sharedInstance"), (uint64_t)a3);
}

- (void)logStillImageAPSStatistics:(uint64_t)a1
{
  NSObject *v2;
  _QWORD v3[6];

  if (a1)
  {
    v2 = *(NSObject **)(a1 + 8);
    v3[0] = MEMORY[0x1E0C809B0];
    v3[1] = 3221225472;
    v3[2] = __63__BWAutoFocusPositionSensorMonitor_logStillImageAPSStatistics___block_invoke;
    v3[3] = &unk_1E491E748;
    v3[4] = a1;
    v3[5] = a2;
    dispatch_async(v2, v3);
  }
}

+ (void)logVideoRecordingAPSStatistics:(BWAPSStatistics *)a3
{
  -[BWAutoFocusPositionSensorMonitor logVideoRecordingAPSStatistics:]((uint64_t)+[BWAutoFocusPositionSensorMonitor sharedInstance](BWAutoFocusPositionSensorMonitor, "sharedInstance"), (uint64_t)a3);
}

- (void)logVideoRecordingAPSStatistics:(uint64_t)a1
{
  NSObject *v2;
  _QWORD v3[6];

  if (a1)
  {
    v2 = *(NSObject **)(a1 + 8);
    v3[0] = MEMORY[0x1E0C809B0];
    v3[1] = 3221225472;
    v3[2] = __67__BWAutoFocusPositionSensorMonitor_logVideoRecordingAPSStatistics___block_invoke;
    v3[3] = &unk_1E491F158;
    v3[4] = a1;
    v3[5] = a2;
    dispatch_async(v2, v3);
  }
}

+ (void)clientHasBeenBackgrounded
{
  if (sShouldPostNotification == 1)
    -[BWAutoFocusPositionSensorMonitor clientHasBeenBackgrounded]((uint64_t)+[BWAutoFocusPositionSensorMonitor sharedInstance](BWAutoFocusPositionSensorMonitor, "sharedInstance"));
}

- (void)clientHasBeenBackgrounded
{
  NSObject *v1;
  _QWORD block[5];

  if (a1)
  {
    v1 = *(NSObject **)(a1 + 8);
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __61__BWAutoFocusPositionSensorMonitor_clientHasBeenBackgrounded__block_invoke;
    block[3] = &unk_1E491E720;
    block[4] = a1;
    dispatch_async(v1, block);
  }
}

- (BWAutoFocusPositionSensorMonitor)init
{
  BWAutoFocusPositionSensorMonitor *v2;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)BWAutoFocusPositionSensorMonitor;
  v2 = -[BWAutoFocusPositionSensorMonitor init](&v4, sel_init);
  if (v2)
    v2->_apsMonitorQueue = (OS_dispatch_queue *)FigDispatchQueueCreateWithPriority();
  return v2;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)BWAutoFocusPositionSensorMonitor;
  -[BWAutoFocusPositionSensorMonitor dealloc](&v3, sel_dealloc);
}

void __75__BWAutoFocusPositionSensorMonitor_processAPSOffsetEstimatorInfo_portType___block_invoke(uint64_t a1)
{
  -[BWAutoFocusPositionSensorMonitor _processAPSOffsetEstimatorInfo:portType:](*(_QWORD *)(a1 + 32), *(void **)(a1 + 40), *(void **)(a1 + 48));
}

- (void)_processAPSOffsetEstimatorInfo:(void *)a3 portType:
{
  const __CFString *v6;
  const __CFString *v7;
  const __CFString *v8;
  const __CFString *v9;
  const __CFString *v10;
  void *v11;
  id v12;
  int v13;
  int v14;
  int v15;
  double v16;
  double v17;
  int v18;
  int v19;
  const __CFString *v20;
  const __CFString *v21;
  void *v22;
  const __CFString *v23;
  const __CFString *v24;
  void *value;

  if (a1)
  {
    if ((objc_msgSend(a3, "isEqualToString:", *MEMORY[0x1E0D05A18]) & 1) != 0)
    {
      v6 = CFSTR("BackHighMagneticFieldCount");
      v7 = CFSTR("BackLowMagneticFieldCount");
      v8 = CFSTR("BackFirstLowMagneticFieldTime");
    }
    else if ((objc_msgSend(a3, "isEqualToString:", *MEMORY[0x1E0D05A30]) & 1) != 0)
    {
      v6 = CFSTR("BackTelephotoHighMagneticFieldCount");
      v7 = CFSTR("BackTelephotoLowMagneticFieldCount");
      v8 = CFSTR("BackTelephotoFirstLowMagneticFieldTime");
    }
    else
    {
      if (!objc_msgSend(a3, "isEqualToString:", *MEMORY[0x1E0D05A28]))
      {
        value = 0;
        v11 = 0;
        goto LABEL_27;
      }
      v6 = CFSTR("BackSuperWideHighMagneticFieldCount");
      v7 = CFSTR("BackSuperWideLowMagneticFieldCount");
      v8 = CFSTR("BackSuperWideFirstLowMagneticFieldTime");
    }
    v21 = v8;
    v9 = (const __CFString *)*MEMORY[0x1E0C9B260];
    v10 = (const __CFString *)*MEMORY[0x1E0C9B230];
    v11 = (void *)CFPreferencesCopyValue(CFSTR("AutoFocusPositionSensorMonitorInfo"), CFSTR("com.apple.cameracapture.volatile"), (CFStringRef)*MEMORY[0x1E0C9B260], (CFStringRef)*MEMORY[0x1E0C9B230]);
    v24 = v7;
    if (v11)
      v12 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithDictionary:", v11);
    else
      v12 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    value = v12;
    v13 = objc_msgSend((id)objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("NumPostedNotifications")), "intValue");
    v14 = objc_msgSend((id)objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("LastNotificationTime")), "intValue");
    v23 = v6;
    v15 = objc_msgSend((id)objc_msgSend(v11, "objectForKeyedSubscript:", v6), "intValue");
    objc_msgSend((id)objc_msgSend(MEMORY[0x1E0C99D68], "date"), "timeIntervalSince1970");
    v17 = v16;
    if ((objc_msgSend((id)objc_msgSend(a2, "objectForKeyedSubscript:", *MEMORY[0x1E0D06330]), "intValue") & 2) != 0)
    {
      v22 = a2;
      if (v15 >= 9 && v17 - (double)v14 > (float)((float)(powf(5.0, (float)v13) * 1209600.0) / 5.0))
        sShouldPostNotification = 1;
      objc_msgSend(value, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", (v15 + 1)), v23);
      v20 = v24;
    }
    else
    {
      if (v13 <= 0 && v15 < 1)
        goto LABEL_26;
      v22 = a2;
      v18 = objc_msgSend((id)objc_msgSend(v11, "objectForKeyedSubscript:", v24), "intValue");
      if (!v18)
        objc_msgSend(value, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v17), v21);
      v19 = objc_msgSend((id)objc_msgSend(v11, "objectForKeyedSubscript:", v21), "intValue");
      objc_msgSend(value, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", (v18 + 1)), v24);
      if (v18 < 9
        || v17 - (double)v19 <= 86400.0
        || (objc_msgSend(value, "setObject:forKeyedSubscript:", &unk_1E49FAD10, v24),
            objc_msgSend(value, "setObject:forKeyedSubscript:", &unk_1E49FAD10, v23),
            -[BWAutoFocusPositionSensorMonitor _highMagneticFieldCountOfOtherCameras:portType:](a1, v11, a3)))
      {
LABEL_25:
        CFPreferencesSetValue(CFSTR("AutoFocusPositionSensorMonitorInfo"), value, CFSTR("com.apple.cameracapture.volatile"), v9, v10);
        CFPreferencesSynchronize(CFSTR("com.apple.cameracapture.volatile"), v9, v10);
        a2 = v22;
LABEL_26:
        -[BWAutoFocusPositionSensorMonitor _reportAPSOffsetEstimatorInfoToAggdAndCoreAnalytics:portType:](a1, a2, a3);
        -[BWAutoFocusPositionSensorMonitor _logAPSOffsetEstimatorInfo:portType:](a1, a2, a3);
LABEL_27:

        return;
      }
      objc_msgSend(value, "setObject:forKeyedSubscript:", &unk_1E49FAD10, CFSTR("NumPostedNotifications"));
      v20 = CFSTR("LastNotificationTime");
    }
    objc_msgSend(value, "setObject:forKeyedSubscript:", &unk_1E49FAD10, v20);
    goto LABEL_25;
  }
}

void __63__BWAutoFocusPositionSensorMonitor_logStillImageAPSStatistics___block_invoke(uint64_t a1)
{
  -[BWAutoFocusPositionSensorMonitor _reportStillImageAPSStatisticsToAggd:](*(_QWORD *)(a1 + 32), *(void **)(a1 + 40));
  -[BWAutoFocusPositionSensorMonitor _logStillImageAPSStatistics:](*(_QWORD *)(a1 + 32), *(void **)(a1 + 40));
}

- (uint64_t)_reportStillImageAPSStatisticsToAggd:(uint64_t)result
{
  void *v3;
  void *v4;
  uint64_t v5;
  BOOL v6;
  void *v8;
  uint64_t v9;
  int v10;
  int v11;
  int v12;
  int v13;
  int v14;
  int v15;
  int v16;
  int v17;
  uint64_t v18;
  int v19;
  int v20;
  uint64_t v21;
  BWAggdDataReporter *v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;

  if (result)
  {
    v3 = (void *)objc_msgSend(a2, "objectForKeyedSubscript:", *MEMORY[0x1E0D068A8]);
    v4 = (void *)objc_msgSend(a2, "objectForKeyedSubscript:", *MEMORY[0x1E0D06E50]);
    v5 = objc_msgSend(a2, "objectForKeyedSubscript:", *MEMORY[0x1E0D069B0]);
    if (v3)
      v6 = v4 == 0;
    else
      v6 = 1;
    if (v6 || v5 == 0)
    {
      fig_log_get_emitter();
      return FigDebugAssert3();
    }
    else
    {
      v8 = (void *)v5;
      v9 = objc_msgSend(a2, "objectForKeyedSubscript:", *MEMORY[0x1E0D06D00]);
      objc_msgSend((id)objc_msgSend(v3, "objectForKeyedSubscript:", *MEMORY[0x1E0D062D0]), "floatValue");
      v11 = v10;
      objc_msgSend((id)objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x1E0D07A20]), "floatValue");
      v13 = v12;
      objc_msgSend((id)objc_msgSend(v8, "objectForKeyedSubscript:", *MEMORY[0x1E0D06500]), "floatValue");
      v15 = v14;
      objc_msgSend((id)objc_msgSend(v8, "objectForKeyedSubscript:", *MEMORY[0x1E0D06508]), "floatValue");
      v17 = v16;
      v18 = objc_msgSend((id)objc_msgSend(a2, "objectForKeyedSubscript:", *MEMORY[0x1E0D06C30]), "intValue");
      objc_msgSend((id)objc_msgSend(a2, "objectForKeyedSubscript:", *MEMORY[0x1E0D06A88]), "floatValue");
      v20 = v19;
      v21 = objc_msgSend((id)objc_msgSend(a2, "objectForKeyedSubscript:", *MEMORY[0x1E0D06C40]), "intValue");
      v22 = +[BWAggdDataReporter sharedInstance](BWAggdDataReporter, "sharedInstance");
      LODWORD(v23) = v11;
      LODWORD(v24) = v13;
      LODWORD(v25) = v15;
      LODWORD(v26) = v17;
      LODWORD(v27) = v20;
      return -[BWAggdDataReporter reportStillImageAPSStatisticsForPortType:logicalFocusPosition:apsMotion:sphereMotion:accelMotion:gyroMotion:subjectDistance:luxLevel:](v22, "reportStillImageAPSStatisticsForPortType:logicalFocusPosition:apsMotion:sphereMotion:accelMotion:gyroMotion:subjectDistance:luxLevel:", v9, v18, v21, v23, v24, v25, v26, v27);
    }
  }
  return result;
}

- (void)_logStillImageAPSStatistics:(uint64_t)a1
{
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  BOOL v7;
  void *v9;
  void *LogFile;
  uint64_t v11;
  id v12;
  uint64_t v13;
  id v14;
  float v15;
  float v16;
  float v17;
  float v18;
  float v19;
  float v20;
  float v21;
  void *v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t i;
  void *v28;
  void *v29;
  uint64_t v30;
  BOOL v31;
  void *v32;
  void *v33;
  uint64_t v34;
  uint64_t v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  _BYTE v41[128];
  uint64_t v42;

  v42 = *MEMORY[0x1E0C80C00];
  if (a1 && MGGetBoolAnswer())
  {
    v36 = *MEMORY[0x1E0D068A8];
    v3 = (void *)objc_msgSend(a2, "objectForKeyedSubscript:");
    v4 = *MEMORY[0x1E0D06E50];
    v5 = (void *)objc_msgSend(a2, "objectForKeyedSubscript:", *MEMORY[0x1E0D06E50]);
    v6 = objc_msgSend(a2, "objectForKeyedSubscript:", *MEMORY[0x1E0D069B0]);
    if (v3)
      v7 = v5 == 0;
    else
      v7 = 1;
    if (v7 || v6 == 0)
    {
      fig_log_get_emitter();
      FigDebugAssert3();
    }
    else
    {
      v9 = (void *)v6;
      LogFile = -[BWAutoFocusPositionSensorMonitor _getLogFileHandle](a1);
      if (LogFile)
      {
        v33 = LogFile;
        v11 = objc_msgSend(a2, "objectForKeyedSubscript:", *MEMORY[0x1E0D06D00]);
        v12 = objc_alloc_init(MEMORY[0x1E0CB3578]);
        objc_msgSend(v12, "setDateFormat:", CFSTR("HH:mm:ss"));
        v13 = objc_msgSend(v12, "stringFromDate:", objc_msgSend(MEMORY[0x1E0C99D68], "date"));

        v14 = objc_alloc_init(MEMORY[0x1E0CB37A0]);
        objc_msgSend(v14, "appendFormat:", CFSTR("%@ "), v13);
        objc_msgSend(v14, "appendFormat:", CFSTR("Photo, "));
        v34 = v11;
        objc_msgSend(v14, "appendFormat:", CFSTR("%@, "), v11);
        objc_msgSend(v14, "appendFormat:", CFSTR("<FocusPos>%d</FocusPos>, "), objc_msgSend((id)objc_msgSend(a2, "objectForKeyedSubscript:", *MEMORY[0x1E0D06C30]), "intValue"));
        objc_msgSend(v14, "appendFormat:", CFSTR("<Lux>%d</Lux>, "), objc_msgSend((id)objc_msgSend(a2, "objectForKeyedSubscript:", *MEMORY[0x1E0D06C40]), "intValue"));
        objc_msgSend((id)objc_msgSend(a2, "objectForKeyedSubscript:", *MEMORY[0x1E0D06A88]), "floatValue");
        objc_msgSend(v14, "appendFormat:", CFSTR("<SubjectDistance>%f</SubjectDistance>, "), v15);
        objc_msgSend((id)objc_msgSend(v9, "objectForKeyedSubscript:", *MEMORY[0x1E0D06500]), "floatValue");
        objc_msgSend(v14, "appendFormat:", CFSTR("<AccelStd>%f</AccelStd>, "), v16);
        objc_msgSend((id)objc_msgSend(v9, "objectForKeyedSubscript:", *MEMORY[0x1E0D064E0]), "floatValue");
        objc_msgSend(v14, "appendFormat:", CFSTR("<AccelMax>%f</AccelMax>, "), v17);
        objc_msgSend((id)objc_msgSend(v9, "objectForKeyedSubscript:", *MEMORY[0x1E0D064F0]), "floatValue");
        objc_msgSend(v14, "appendFormat:", CFSTR("<AccelMin>%f</AccelMin>, "), v18);
        objc_msgSend((id)objc_msgSend(v9, "objectForKeyedSubscript:", *MEMORY[0x1E0D06508]), "floatValue");
        objc_msgSend(v14, "appendFormat:", CFSTR("<GyroStd>%f</GyroStd>, "), v19);
        objc_msgSend((id)objc_msgSend(v9, "objectForKeyedSubscript:", *MEMORY[0x1E0D064E8]), "floatValue");
        objc_msgSend(v14, "appendFormat:", CFSTR("<GyroMax>%f</GyroMax>, "), v20);
        objc_msgSend((id)objc_msgSend(v9, "objectForKeyedSubscript:", *MEMORY[0x1E0D064F8]), "floatValue");
        objc_msgSend(v14, "appendFormat:", CFSTR("<GyroMin>%f</GyroMin>, "), v21);
        -[BWAutoFocusPositionSensorMonitor _appendApsMotionData:sphereMotionData:toDataString:](a1, v3, v5, v14);
        v22 = (void *)objc_msgSend(a2, "objectForKeyedSubscript:", *MEMORY[0x1E0D06ED8]);
        v37 = 0u;
        v38 = 0u;
        v39 = 0u;
        v40 = 0u;
        v23 = (void *)objc_msgSend(v22, "allKeys");
        v24 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v37, v41, 16);
        if (v24)
        {
          v25 = v24;
          v26 = *(_QWORD *)v38;
          do
          {
            for (i = 0; i != v25; ++i)
            {
              if (*(_QWORD *)v38 != v26)
                objc_enumerationMutation(v23);
              v28 = (void *)objc_msgSend(v22, "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v37 + 1) + 8 * i));
              v29 = (void *)objc_msgSend(v28, "objectForKeyedSubscript:", v36);
              v30 = objc_msgSend(v28, "objectForKeyedSubscript:", v4);
              if (v29)
                v31 = v30 == 0;
              else
                v31 = 1;
              if (!v31)
              {
                v32 = (void *)v30;
                objc_msgSend(v14, "appendFormat:", CFSTR("SlaveCamera (%@), "), v34);
                -[BWAutoFocusPositionSensorMonitor _appendApsMotionData:sphereMotionData:toDataString:](a1, v29, v32, v14);
              }
            }
            v25 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v37, v41, 16);
          }
          while (v25);
        }
        objc_msgSend(v14, "appendString:", CFSTR("\n"));
        objc_msgSend(v33, "writeData:", objc_msgSend(v14, "dataUsingEncoding:", 4));
        objc_msgSend(v33, "closeFile");

      }
    }
  }
}

void __67__BWAutoFocusPositionSensorMonitor_logVideoRecordingAPSStatistics___block_invoke(uint64_t a1)
{
  -[BWAutoFocusPositionSensorMonitor _reportVideoRecordingAPSStatisticsToAggd:](*(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
  -[BWAutoFocusPositionSensorMonitor _logVideoRecordingAPSStatistics:](*(_QWORD *)(a1 + 32), *(float **)(a1 + 40));
}

- (uint64_t)_reportVideoRecordingAPSStatisticsToAggd:(uint64_t)result
{
  BWAggdDataReporter *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;

  if (result)
  {
    if (a2)
    {
      v3 = +[BWAggdDataReporter sharedInstance](BWAggdDataReporter, "sharedInstance");
      LODWORD(v4) = *(_DWORD *)a2;
      LODWORD(v5) = *(_DWORD *)(a2 + 4);
      LODWORD(v6) = *(_DWORD *)(a2 + 24);
      LODWORD(v7) = *(_DWORD *)(a2 + 28);
      LODWORD(v8) = *(_DWORD *)(a2 + 12);
      LODWORD(v9) = *(_DWORD *)(a2 + 36);
      LODWORD(v10) = *(_DWORD *)(a2 + 48);
      LODWORD(v11) = *(_DWORD *)(a2 + 60);
      LODWORD(v14) = *(_DWORD *)(a2 + 20);
      HIDWORD(v14) = *(_DWORD *)(a2 + 44);
      LODWORD(v13) = *(_DWORD *)(a2 + 16);
      HIDWORD(v13) = *(_DWORD *)(a2 + 40);
      LODWORD(v12) = *(_DWORD *)(a2 + 8);
      HIDWORD(v12) = *(_DWORD *)(a2 + 32);
      return -[BWAggdDataReporter reportVideoRecordingAPSStatistics:stdDataFromAPSForTele:stdDataFromSphereForWide:stdDataFromSphereForTele:stdDataFromAccel:stdDataFromGyro:maxDataFromAPSForWide:maxDataFromAPSForTele:minDataFromAPSForWide:minDataFromAPSForTele:maxDataFromSphereForWide:maxDataFromSphereForTele:minDataFromSphereForWide:minDataFromSphereForTele:maxDataFromAccel:minDataFromAccel:maxDataFromGyro:minDataFromGyro:](v3, "reportVideoRecordingAPSStatistics:stdDataFromAPSForTele:stdDataFromSphereForWide:stdDataFromSphereForTele:stdDataFromAccel:stdDataFromGyro:maxDataFromAPSForWide:maxDataFromAPSForTele:minDataFromAPSForWide:minDataFromAPSForTele:maxDataFromSphereForWide:maxDataFromSphereForTele:minDataFromSphereForWide:minDataFromSphereForTele:maxDataFromAccel:minDataFromAccel:maxDataFromGyro:minDataFromGyro:", v4, v6, v8, v9, v10, v11, v5, v7, v12, v13, v14, *(_QWORD *)(a2 + 52), *(_QWORD *)(a2 + 64));
    }
    else
    {
      fig_log_get_emitter();
      return FigDebugAssert3();
    }
  }
  return result;
}

- (void)_logVideoRecordingAPSStatistics:(uint64_t)a1
{
  void *LogFile;
  void *v5;
  id v6;
  uint64_t v7;
  id v8;

  if (a1 && MGGetBoolAnswer())
  {
    if (a2)
    {
      LogFile = -[BWAutoFocusPositionSensorMonitor _getLogFileHandle](a1);
      if (LogFile)
      {
        v5 = LogFile;
        v6 = objc_alloc_init(MEMORY[0x1E0CB3578]);
        objc_msgSend(v6, "setDateFormat:", CFSTR("HH:mm:ss"));
        v7 = objc_msgSend(v6, "stringFromDate:", objc_msgSend(MEMORY[0x1E0C99D68], "date"));

        v8 = objc_alloc_init(MEMORY[0x1E0CB37A0]);
        objc_msgSend(v8, "appendFormat:", CFSTR("%@ "), v7);
        objc_msgSend(v8, "appendFormat:", CFSTR("Video, "));
        objc_msgSend(v8, "appendFormat:", CFSTR("<AccelStd>%f</AccelStd>, "), a2[12]);
        objc_msgSend(v8, "appendFormat:", CFSTR("<AccelMax>%f</AccelMax>, "), a2[13]);
        objc_msgSend(v8, "appendFormat:", CFSTR("<AccelMin>%f</AccelMin>, "), a2[14]);
        objc_msgSend(v8, "appendFormat:", CFSTR("<GyroStd>%f</GyroStd>, "), a2[15]);
        objc_msgSend(v8, "appendFormat:", CFSTR("<GyroMax>%f</GyroMax>, "), a2[16]);
        objc_msgSend(v8, "appendFormat:", CFSTR("<GyroMin>%f</GyroMin>, "), a2[17]);
        objc_msgSend(v8, "appendFormat:", CFSTR("PortTypeBack, "));
        objc_msgSend(v8, "appendFormat:", CFSTR("<AFStd>%f</AFStd>, "), *a2);
        objc_msgSend(v8, "appendFormat:", CFSTR("<AFMax>%f</AFMax>, "), a2[1]);
        objc_msgSend(v8, "appendFormat:", CFSTR("<AFMin>%f</AFMin>, "), a2[2]);
        objc_msgSend(v8, "appendFormat:", CFSTR("<OISStd>%f</OISStd>, "), a2[3]);
        objc_msgSend(v8, "appendFormat:", CFSTR("<OISMax>%f</OISMax>, "), a2[4]);
        objc_msgSend(v8, "appendFormat:", CFSTR("<OISMin>%f</OISMin>, "), a2[5]);
        objc_msgSend(v8, "appendFormat:", CFSTR("PortTypeBackTele, "));
        objc_msgSend(v8, "appendFormat:", CFSTR("<AFStd>%f</AFStd>, "), a2[6]);
        objc_msgSend(v8, "appendFormat:", CFSTR("<AFMax>%f</AFMax>, "), a2[7]);
        objc_msgSend(v8, "appendFormat:", CFSTR("<AFMin>%f</AFMin>, "), a2[8]);
        objc_msgSend(v8, "appendFormat:", CFSTR("<OISStd>%f</OISStd>, "), a2[9]);
        objc_msgSend(v8, "appendFormat:", CFSTR("<OISMax>%f</OISMax>, "), a2[10]);
        objc_msgSend(v8, "appendFormat:", CFSTR("<OISMin>%f</OISMin>, "), a2[11]);
        objc_msgSend(v8, "appendString:", CFSTR("\n"));
        objc_msgSend(v5, "writeData:", objc_msgSend(v8, "dataUsingEncoding:", 4));
        objc_msgSend(v5, "closeFile");

      }
    }
    else
    {
      fig_log_get_emitter();
      FigDebugAssert3();
    }
  }
}

void __61__BWAutoFocusPositionSensorMonitor_clientHasBeenBackgrounded__block_invoke(uint64_t a1)
{
  dispatch_time_t v2;
  uint64_t v3;
  NSObject *v4;
  _QWORD block[5];

  if (!*(_QWORD *)(*(_QWORD *)(a1 + 32) + 16))
    *(_QWORD *)(*(_QWORD *)(a1 + 32) + 16) = +[FigCaptureDisplayLayoutMonitor sharedDisplayLayoutMonitor](FigCaptureDisplayLayoutMonitor, "sharedDisplayLayoutMonitor");
  v2 = dispatch_time(0, 500000000);
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(NSObject **)(v3 + 8);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __61__BWAutoFocusPositionSensorMonitor_clientHasBeenBackgrounded__block_invoke_2;
  block[3] = &unk_1E491E720;
  block[4] = v3;
  dispatch_after(v2, v4, block);
}

void __61__BWAutoFocusPositionSensorMonitor_clientHasBeenBackgrounded__block_invoke_2(uint64_t a1)
{
  if (sShouldPostNotification == 1)
  {
    if (objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "isOnHomeScreen"))
    {
      sShouldPostNotification = 0;
      -[BWAutoFocusPositionSensorMonitor _postMagneticDetectionUserNotification](*(_QWORD *)(a1 + 32));
    }
  }
}

- (void)_postMagneticDetectionUserNotification
{
  const __CFString *v1;
  const __CFString *v2;
  void *v3;
  id v4;
  void *v5;
  int v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  const __CFDictionary *v12;
  CFUserNotificationRef v13;
  CFUserNotificationRef v14;
  NSObject *global_queue;
  _QWORD v16[5];
  _QWORD v17[3];
  _QWORD v18[4];

  v18[3] = *MEMORY[0x1E0C80C00];
  if (a1)
  {
    v1 = (const __CFString *)*MEMORY[0x1E0C9B260];
    v2 = (const __CFString *)*MEMORY[0x1E0C9B230];
    v3 = (void *)CFPreferencesCopyValue(CFSTR("AutoFocusPositionSensorMonitorInfo"), CFSTR("com.apple.cameracapture.volatile"), (CFStringRef)*MEMORY[0x1E0C9B260], (CFStringRef)*MEMORY[0x1E0C9B230]);
    if (v3)
      v4 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithDictionary:", v3);
    else
      v4 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    v5 = v4;
    v6 = objc_msgSend((id)objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("NumPostedNotifications")), "intValue");
    objc_msgSend(v5, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", (v6 + 1)), CFSTR("NumPostedNotifications"));
    objc_msgSend((id)objc_msgSend(MEMORY[0x1E0C99D68], "date"), "timeIntervalSince1970");
    objc_msgSend(v5, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:"), CFSTR("LastNotificationTime"));
    objc_msgSend(v5, "setObject:forKeyedSubscript:", &unk_1E49FAD10, CFSTR("BackHighMagneticFieldCount"));
    objc_msgSend(v5, "setObject:forKeyedSubscript:", &unk_1E49FAD10, CFSTR("BackTelephotoHighMagneticFieldCount"));
    objc_msgSend(v5, "setObject:forKeyedSubscript:", &unk_1E49FAD10, CFSTR("BackSuperWideHighMagneticFieldCount"));
    objc_msgSend(v5, "setObject:forKeyedSubscript:", &unk_1E49FAD10, CFSTR("BackLowMagneticFieldCount"));
    objc_msgSend(v5, "setObject:forKeyedSubscript:", &unk_1E49FAD10, CFSTR("BackTelephotoLowMagneticFieldCount"));
    objc_msgSend(v5, "setObject:forKeyedSubscript:", &unk_1E49FAD10, CFSTR("BackSuperWideLowMagneticFieldCount"));
    CFPreferencesSetValue(CFSTR("AutoFocusPositionSensorMonitorInfo"), v5, CFSTR("com.apple.cameracapture.volatile"), v1, v2);
    CFPreferencesSynchronize(CFSTR("com.apple.cameracapture.volatile"), v1, v2);
    v7 = (void *)objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.Celestial"));
    v8 = objc_msgSend(v7, "localizedStringForKey:value:table:", CFSTR("OK"), &stru_1E4928818, CFSTR("MagneticNotification"));
    v9 = objc_msgSend(v7, "localizedStringForKey:value:table:", CFSTR("Learn More"), &stru_1E4928818, CFSTR("MagneticNotification"));
    v10 = objc_msgSend(v7, "localizedStringForKey:value:table:", CFSTR("Alert Message"), &stru_1E4928818, CFSTR("MagneticNotification"));
    v11 = *MEMORY[0x1E0C9B830];
    v17[0] = *MEMORY[0x1E0C9B838];
    v17[1] = v11;
    v18[0] = v8;
    v18[1] = v9;
    v17[2] = *MEMORY[0x1E0C9B810];
    v18[2] = v10;
    v12 = (const __CFDictionary *)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v18, v17, 3);
    v13 = CFUserNotificationCreate((CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0.0, 0, 0, v12);
    if (v13)
    {
      v14 = v13;
      global_queue = dispatch_get_global_queue(0, 0);
      v16[0] = MEMORY[0x1E0C809B0];
      v16[1] = 3221225472;
      v16[2] = __74__BWAutoFocusPositionSensorMonitor__postMagneticDetectionUserNotification__block_invoke;
      v16[3] = &__block_descriptor_40_e5_v8__0l;
      v16[4] = v14;
      dispatch_async(global_queue, v16);
    }

  }
}

- (uint64_t)_highMagneticFieldCountOfOtherCameras:(void *)a3 portType:
{
  const __CFString *v5;
  const __CFString *v6;
  int v7;

  if (result)
  {
    if ((objc_msgSend(a3, "isEqualToString:", *MEMORY[0x1E0D05A18]) & 1) != 0)
    {
      v5 = CFSTR("BackSuperWideHighMagneticFieldCount");
      v6 = CFSTR("BackTelephotoHighMagneticFieldCount");
    }
    else
    {
      if ((objc_msgSend(a3, "isEqualToString:", *MEMORY[0x1E0D05A30]) & 1) != 0)
      {
        v5 = CFSTR("BackSuperWideHighMagneticFieldCount");
      }
      else
      {
        result = objc_msgSend(a3, "isEqualToString:", *MEMORY[0x1E0D05A28]);
        if (!(_DWORD)result)
          return result;
        v5 = CFSTR("BackTelephotoHighMagneticFieldCount");
      }
      v6 = CFSTR("BackHighMagneticFieldCount");
    }
    v7 = objc_msgSend((id)objc_msgSend(a2, "objectForKeyedSubscript:", v6), "intValue");
    return objc_msgSend((id)objc_msgSend(a2, "objectForKeyedSubscript:", v5), "intValue") + v7;
  }
  return result;
}

- (void)_reportAPSOffsetEstimatorInfoToAggdAndCoreAnalytics:(void *)a3 portType:
{
  int v5;
  int v6;
  int v7;
  int v8;
  float v9;
  float v10;
  int v11;
  int v12;
  int v13;
  int v14;
  int v15;
  int v16;
  unsigned int v17;
  uint64_t v18;
  int v19;
  const __CFString *v20;
  int v21;
  uint64_t v22;
  int v23;
  uint64_t v24;
  uint64_t v25;
  float v26;
  float v27;
  BWAggdDataReporter *v28;
  float v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  BWStartupCalibrationAnalyticsPayload *v37;
  double v38;
  double v39;
  double v40;
  double v41;
  void *v42;
  uint64_t v43;
  uint64_t v44;
  unsigned int v45;
  unsigned int v46;
  unsigned int v47;
  unsigned int v48;
  void *v49;
  _BOOL4 v50;
  _BOOL4 v51;
  _BOOL4 v52;
  id v53;

  if (a1)
  {
    if (a2)
    {
      objc_msgSend((id)objc_msgSend(a2, "objectForKeyedSubscript:", *MEMORY[0x1E0D06338]), "floatValue");
      v6 = v5;
      objc_msgSend((id)objc_msgSend(a2, "objectForKeyedSubscript:", *MEMORY[0x1E0D06340]), "floatValue");
      v8 = v7;
      objc_msgSend((id)objc_msgSend(a2, "objectForKeyedSubscript:", *MEMORY[0x1E0D062F0]), "floatValue");
      v10 = v9;
      objc_msgSend((id)objc_msgSend(a2, "objectForKeyedSubscript:", *MEMORY[0x1E0D06300]), "floatValue");
      v12 = v11;
      objc_msgSend((id)objc_msgSend(a2, "objectForKeyedSubscript:", *MEMORY[0x1E0D06308]), "floatValue");
      v14 = v13;
      objc_msgSend((id)objc_msgSend(a2, "objectForKeyedSubscript:", *MEMORY[0x1E0D062F8]), "floatValue");
      v16 = v15;
      v17 = objc_msgSend((id)objc_msgSend(a2, "objectForKeyedSubscript:", *MEMORY[0x1E0D06330]), "intValue");
      v18 = objc_msgSend((id)objc_msgSend(a2, "objectForKeyedSubscript:", *MEMORY[0x1E0D06348]), "intValue");
      v19 = objc_msgSend((id)objc_msgSend(a2, "objectForKeyedSubscript:", *MEMORY[0x1E0D062D8]), "intValue");
      v53 = (id)CFPreferencesCopyValue(CFSTR("AutoFocusPositionSensorMonitorInfo"), CFSTR("com.apple.cameracapture.volatile"), (CFStringRef)*MEMORY[0x1E0C9B260], (CFStringRef)*MEMORY[0x1E0C9B230]);
      v49 = a3;
      if ((objc_msgSend(a3, "isEqualToString:", *MEMORY[0x1E0D05A18]) & 1) != 0)
      {
        v20 = CFSTR("BackLastSessionOffset");
      }
      else if (objc_msgSend(a3, "isEqualToString:", *MEMORY[0x1E0D05A28]))
      {
        v20 = CFSTR("BackSuperWideLastSessionOffset");
      }
      else
      {
        v20 = CFSTR("BackTelephotoLastSessionOffset");
      }
      v21 = (v17 >> 7) & 1;
      v22 = (v17 >> 1) & 1;
      v23 = (v17 >> 6) & 1;
      v51 = v19 == 6;
      v52 = v19 == 1;
      v46 = (v17 >> 4) & 1;
      v47 = (v17 >> 5) & 1;
      v45 = (v17 >> 3) & 1;
      v50 = v17 == 0;
      v24 = (v17 >> 2) & 1;
      v25 = (v17 >> 9) & 1;
      v48 = v25;
      objc_msgSend((id)objc_msgSend(v53, "objectForKeyedSubscript:", v20), "floatValue");
      v27 = v26;
      v28 = +[BWAggdDataReporter sharedInstance](BWAggdDataReporter, "sharedInstance");
      v29 = v10 - v27;
      BYTE1(v44) = v52;
      LOBYTE(v44) = v51;
      HIDWORD(v43) = v18;
      BYTE3(v43) = v50;
      BYTE2(v43) = v21;
      BYTE1(v43) = v22;
      LOBYTE(v43) = v23;
      LODWORD(v30) = v6;
      LODWORD(v31) = v8;
      *(float *)&v32 = v10;
      LODWORD(v33) = v12;
      LODWORD(v34) = v14;
      LODWORD(v35) = v16;
      *(float *)&v36 = v29;
      -[BWAggdDataReporter reportAPSOffsetEstimatorForPortType:accelMotion:gyroMotion:inSessionOffset:deltaOffsetFC:deltaOffsetMI:deltaOffsetFATP:deltaOffsetLastSession:errorHeadroomViolated:errorConvergenceFailed:errorMotionTooLarge:errorConfidenceTooLow:errorOffsetTooLarge:errorDeltaTooLarge:errorSaturated:errorCouldNotRun:successRun:startAPSVoltage:modeGCOL:modeOL:](v28, "reportAPSOffsetEstimatorForPortType:accelMotion:gyroMotion:inSessionOffset:deltaOffsetFC:deltaOffsetMI:deltaOffsetFATP:deltaOffsetLastSession:errorHeadroomViolated:errorConvergenceFailed:errorMotionTooLarge:errorConfidenceTooLow:errorOffsetTooLarge:errorDeltaTooLarge:errorSaturated:errorCouldNotRun:successRun:startAPSVoltage:modeGCOL:modeOL:", v49, v25, v24, v45, v46, v47, v30, v31, v32, v33, v34, v35, v36, v43, v44);
      v37 = objc_alloc_init(BWStartupCalibrationAnalyticsPayload);
      -[BWStartupCalibrationAnalyticsPayload setPortType:](v37, "setPortType:", v49);
      LODWORD(v38) = v6;
      -[BWStartupCalibrationAnalyticsPayload setAccelStandardDeviation:](v37, "setAccelStandardDeviation:", v38);
      LODWORD(v39) = v8;
      -[BWStartupCalibrationAnalyticsPayload setGyroStandardDeviation:](v37, "setGyroStandardDeviation:", v39);
      *(float *)&v40 = v10;
      -[BWStartupCalibrationAnalyticsPayload setSessionOffset:](v37, "setSessionOffset:", v40);
      *(float *)&v41 = v29;
      -[BWStartupCalibrationAnalyticsPayload setDeltaOffset:](v37, "setDeltaOffset:", v41);
      -[BWStartupCalibrationAnalyticsPayload setApsVoltage:](v37, "setApsVoltage:", v18);
      -[BWStartupCalibrationAnalyticsPayload setHeadroomErrorOccurred:](v37, "setHeadroomErrorOccurred:", v48);
      -[BWStartupCalibrationAnalyticsPayload setConvergeErrorOccurred:](v37, "setConvergeErrorOccurred:", v24);
      -[BWStartupCalibrationAnalyticsPayload setMotionErrorOccurred:](v37, "setMotionErrorOccurred:", v45);
      -[BWStartupCalibrationAnalyticsPayload setConfidenceErrorOccurred:](v37, "setConfidenceErrorOccurred:", v46);
      -[BWStartupCalibrationAnalyticsPayload setLargeOffsetErrorOccurred:](v37, "setLargeOffsetErrorOccurred:", v47);
      -[BWStartupCalibrationAnalyticsPayload setSaturationErrorOccurred:](v37, "setSaturationErrorOccurred:", v22);
      -[BWStartupCalibrationAnalyticsPayload setSuccess:](v37, "setSuccess:", v50);
      -[BWStartupCalibrationAnalyticsPayload setGcolEntry:](v37, "setGcolEntry:", v51);
      -[BWStartupCalibrationAnalyticsPayload setClosedLoopEntry:](v37, "setClosedLoopEntry:", v52);
      objc_msgSend((id)objc_msgSend(a2, "objectForKeyedSubscript:", *MEMORY[0x1E0D06328]), "floatValue");
      -[BWStartupCalibrationAnalyticsPayload setMaxAcceleration:](v37, "setMaxAcceleration:");
      objc_msgSend((id)objc_msgSend(a2, "objectForKeyedSubscript:", *MEMORY[0x1E0D062E8]), "floatValue");
      -[BWStartupCalibrationAnalyticsPayload setDeltaAcceleration:](v37, "setDeltaAcceleration:");
      objc_msgSend((id)objc_msgSend(a2, "objectForKeyedSubscript:", *MEMORY[0x1E0D06310]), "floatValue");
      -[BWStartupCalibrationAnalyticsPayload setGravityX:](v37, "setGravityX:");
      objc_msgSend((id)objc_msgSend(a2, "objectForKeyedSubscript:", *MEMORY[0x1E0D06318]), "floatValue");
      -[BWStartupCalibrationAnalyticsPayload setGravityY:](v37, "setGravityY:");
      objc_msgSend((id)objc_msgSend(a2, "objectForKeyedSubscript:", *MEMORY[0x1E0D06320]), "floatValue");
      -[BWStartupCalibrationAnalyticsPayload setGravityZ:](v37, "setGravityZ:");
      objc_msgSend((id)objc_msgSend(a2, "objectForKeyedSubscript:", *MEMORY[0x1E0D062E0]), "floatValue");
      -[BWStartupCalibrationAnalyticsPayload setCompletionTime:](v37, "setCompletionTime:");
      -[BWCoreAnalyticsReporter sendEvent:](+[BWCoreAnalyticsReporter sharedInstance](BWCoreAnalyticsReporter, "sharedInstance"), "sendEvent:", v37);
      v42 = v53;
    }
    else
    {
      fig_log_get_emitter();
      FigDebugAssert3();
      v42 = 0;
    }

  }
}

- (void)_logAPSOffsetEstimatorInfo:(void *)a3 portType:
{
  void *LogFile;
  void *v7;
  id v8;
  uint64_t v9;
  id v10;
  float v11;
  float v12;
  float v13;
  float v14;
  float v15;
  const __CFString *v16;
  const __CFString *v17;
  void *v18;
  const __CFString *v19;
  float v20;
  uint64_t v21;
  id v22;
  double v23;
  void *value;

  if (a1)
  {
    if (MGGetBoolAnswer())
    {
      if (a2)
      {
        LogFile = -[BWAutoFocusPositionSensorMonitor _getLogFileHandle](a1);
        if (LogFile)
        {
          v7 = LogFile;
          v8 = objc_alloc_init(MEMORY[0x1E0CB3578]);
          objc_msgSend(v8, "setDateFormat:", CFSTR("HH:mm:ss"));
          v9 = objc_msgSend(v8, "stringFromDate:", objc_msgSend(MEMORY[0x1E0C99D68], "date"));

          v10 = objc_alloc_init(MEMORY[0x1E0CB37A0]);
          objc_msgSend(v10, "appendFormat:", CFSTR("%@, "), v9);
          objc_msgSend(v10, "appendFormat:", CFSTR("OffsetEstimatorInfo, "));
          objc_msgSend(v10, "appendFormat:", CFSTR("%@, "), a3);
          objc_msgSend((id)objc_msgSend(a2, "objectForKeyedSubscript:", *MEMORY[0x1E0D062F0]), "floatValue");
          v12 = v11;
          objc_msgSend(v10, "appendFormat:", CFSTR("<InSessionOffset>%f</InSessionOffset>, "), v11);
          objc_msgSend((id)objc_msgSend(a2, "objectForKeyedSubscript:", *MEMORY[0x1E0D06300]), "floatValue");
          objc_msgSend(v10, "appendFormat:", CFSTR("<DeltaOffsetFC>%f</DeltaOffsetFC>, "), v13);
          objc_msgSend((id)objc_msgSend(a2, "objectForKeyedSubscript:", *MEMORY[0x1E0D06308]), "floatValue");
          objc_msgSend(v10, "appendFormat:", CFSTR("<DeltaOffsetMI>%f</DeltaOffsetMI>, "), v14);
          objc_msgSend((id)objc_msgSend(a2, "objectForKeyedSubscript:", *MEMORY[0x1E0D062F8]), "floatValue");
          objc_msgSend(v10, "appendFormat:", CFSTR("<DeltaOffsetFATP>%f</DeltaOffsetFATP>, "), v15);
          v16 = (const __CFString *)*MEMORY[0x1E0C9B260];
          v17 = (const __CFString *)*MEMORY[0x1E0C9B230];
          v18 = (void *)CFPreferencesCopyValue(CFSTR("AutoFocusPositionSensorMonitorInfo"), CFSTR("com.apple.cameracapture.volatile"), (CFStringRef)*MEMORY[0x1E0C9B260], (CFStringRef)*MEMORY[0x1E0C9B230]);
          if ((objc_msgSend(a3, "isEqualToString:", *MEMORY[0x1E0D05A18]) & 1) != 0)
          {
            v19 = CFSTR("BackLastSessionOffset");
          }
          else if (objc_msgSend(a3, "isEqualToString:", *MEMORY[0x1E0D05A28]))
          {
            v19 = CFSTR("BackSuperWideLastSessionOffset");
          }
          else
          {
            v19 = CFSTR("BackTelephotoLastSessionOffset");
          }
          objc_msgSend((id)objc_msgSend(v18, "objectForKeyedSubscript:", v19), "floatValue");
          objc_msgSend(v10, "appendFormat:", CFSTR("<DeltaOffsetLastSession>%f</DeltaOffsetLastSession>, "), (float)(v12 - v20));
          v21 = *MEMORY[0x1E0D06330];
          if (objc_msgSend((id)objc_msgSend(a2, "objectForKeyedSubscript:", *MEMORY[0x1E0D06330]), "intValue"))
          {
            value = 0;
          }
          else
          {
            if (v18)
              v22 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithDictionary:", v18);
            else
              v22 = objc_alloc_init(MEMORY[0x1E0C99E08]);
            value = v22;
            *(float *)&v23 = v12;
            objc_msgSend(v22, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v23), v19);
            CFPreferencesSetValue(CFSTR("AutoFocusPositionSensorMonitorInfo"), value, CFSTR("com.apple.cameracapture.volatile"), v16, v17);
            CFPreferencesSynchronize(CFSTR("com.apple.cameracapture.volatile"), v16, v17);
          }
          objc_msgSend(v10, "appendFormat:", CFSTR("<InSessionStatus>%d</InSessionStatus>, "), objc_msgSend((id)objc_msgSend(a2, "objectForKeyedSubscript:", v21), "intValue"));
          objc_msgSend(v10, "appendFormat:", CFSTR("<StartupAPSVoltage>%d</StartupAPSVoltage>, "), objc_msgSend((id)objc_msgSend(a2, "objectForKeyedSubscript:", *MEMORY[0x1E0D06348]), "intValue"));
          objc_msgSend(v10, "appendFormat:", CFSTR("<AFMode>%d</AFMode>"), objc_msgSend((id)objc_msgSend(a2, "objectForKeyedSubscript:", *MEMORY[0x1E0D062D8]), "intValue"));
          objc_msgSend(v10, "appendString:", CFSTR("\n"));
          objc_msgSend(v7, "writeData:", objc_msgSend(v10, "dataUsingEncoding:", 4));
          objc_msgSend(v7, "closeFile");

          goto LABEL_17;
        }
      }
      else
      {
        fig_log_get_emitter();
        FigDebugAssert3();
      }
    }
    value = 0;
    v18 = 0;
LABEL_17:

  }
}

void __74__BWAutoFocusPositionSensorMonitor__postMagneticDetectionUserNotification__block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  CFOptionFlags responseFlags;

  v2 = (void *)MEMORY[0x1A858DD40]();
  responseFlags = 0;
  CFUserNotificationReceiveResponse(*(CFUserNotificationRef *)(a1 + 32), 0.0, &responseFlags);
  if (responseFlags == 1)
  {
    v3 = objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", CFSTR("https://support.apple.com/HT208747"));
    objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CA5878], "defaultWorkspace"), "openURL:", v3);
  }
  CFRelease(*(CFTypeRef *)(a1 + 32));
  objc_autoreleasePoolPop(v2);
}

- (void)_getLogFileHandle
{
  id v1;
  uint64_t v2;
  const __CFString *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v10;

  if (!a1)
    return 0;
  v10 = 0;
  v1 = objc_alloc_init(MEMORY[0x1E0CB3578]);
  objc_msgSend(v1, "setTimeZone:", objc_msgSend(MEMORY[0x1E0C99E80], "localTimeZone"));
  objc_msgSend(v1, "setDateFormat:", CFSTR("yyyy-MM-dd"));
  v2 = objc_msgSend(v1, "stringFromDate:", objc_msgSend(MEMORY[0x1E0C99D68], "date"));
  if (FigCaptureCameracapturedEnabled())
    v3 = CFSTR("cameracaptured");
  else
    v3 = CFSTR("mediaserverd");
  v4 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@-capture-NOT-A-CRASH.afdebug-%@.txt"), v3, v2);
  v5 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("/private/var/mobile/Library/Logs/CrashReporter/%@"), v3);
  objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager"), "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", v5, 1, 0, &v10);
  v6 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@/%@"), v5, v4);
  if (!v10)
  {
    v7 = v6;
    if ((objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager"), "fileExistsAtPath:", v6) & 1) == 0)
      objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager"), "createFileAtPath:contents:attributes:", v7, 0, 0);
    v8 = (void *)objc_msgSend(MEMORY[0x1E0CB3608], "fileHandleForUpdatingAtPath:", v7);
    if (objc_msgSend(v8, "seekToEndOfFile") < 200001)
      goto LABEL_11;
    objc_msgSend(v8, "closeFile");
  }
  v8 = 0;
LABEL_11:

  return v8;
}

- (uint64_t)_appendApsMotionData:(void *)a3 sphereMotionData:(void *)a4 toDataString:
{
  float v7;
  float v8;
  float v9;
  float v10;
  float v11;
  float v12;

  if (result)
  {
    objc_msgSend((id)objc_msgSend(a2, "objectForKeyedSubscript:", *MEMORY[0x1E0D062D0]), "floatValue");
    objc_msgSend(a4, "appendFormat:", CFSTR("<AFStd>%f</AFStd>, "), v7);
    objc_msgSend((id)objc_msgSend(a2, "objectForKeyedSubscript:", *MEMORY[0x1E0D062C0]), "floatValue");
    objc_msgSend(a4, "appendFormat:", CFSTR("<AFMax>%f</AFMax>, "), v8);
    objc_msgSend((id)objc_msgSend(a2, "objectForKeyedSubscript:", *MEMORY[0x1E0D062C8]), "floatValue");
    objc_msgSend(a4, "appendFormat:", CFSTR("<AFMin>%f</AFMin>, "), v9);
    objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", *MEMORY[0x1E0D07A20]), "floatValue");
    objc_msgSend(a4, "appendFormat:", CFSTR("<OISStd>%f</OISStd>, "), v10);
    objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", *MEMORY[0x1E0D07A10]), "floatValue");
    objc_msgSend(a4, "appendFormat:", CFSTR("<OISMax>%f</OISMax>, "), v11);
    objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", *MEMORY[0x1E0D07A18]), "floatValue");
    return objc_msgSend(a4, "appendFormat:", CFSTR("<OISMin>%f</OISMin>, "), v12);
  }
  return result;
}

@end
