@implementation FigCaptureCalibrationMonitor

+ (id)sharedInstance
{
  return (id)sFCCalibration;
}

- (id)autoFocusPositionSensorCalibrationData
{
  os_unfair_lock_s *p_calibrationLock;
  NSDictionary *v4;

  p_calibrationLock = &self->_calibrationLock;
  os_unfair_lock_lock(&self->_calibrationLock);
  v4 = -[FigCaptureCalibrationContext lastSuccessfulCalibrationData](self->_autoFocusPositionSensorCalibrationContext, "lastSuccessfulCalibrationData");
  os_unfair_lock_unlock(p_calibrationLock);
  return v4;
}

- (id)autoFocusCalibrationData
{
  os_unfair_lock_s *p_calibrationLock;
  NSDictionary *v4;

  p_calibrationLock = &self->_calibrationLock;
  os_unfair_lock_lock(&self->_calibrationLock);
  v4 = -[FigCaptureCalibrationContext lastSuccessfulCalibrationData](self->_autoFocusCalibrationContext, "lastSuccessfulCalibrationData");
  os_unfair_lock_unlock(p_calibrationLock);
  return v4;
}

- (id)apsSphereInteractionCalibrationData
{
  os_unfair_lock_s *p_calibrationLock;
  NSDictionary *v4;

  p_calibrationLock = &self->_calibrationLock;
  os_unfair_lock_lock(&self->_calibrationLock);
  v4 = -[FigCaptureCalibrationContext lastSuccessfulCalibrationData](self->_apsSphereInteractionCalibrationContext, "lastSuccessfulCalibrationData");
  os_unfair_lock_unlock(p_calibrationLock);
  return v4;
}

+ (void)initialize
{
  objc_opt_class();
}

+ (void)initializeSharedInstanceWithCaptureSourceBackings:(id)a3
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __82__FigCaptureCalibrationMonitor_initializeSharedInstanceWithCaptureSourceBackings___block_invoke;
  block[3] = &unk_1E491E720;
  block[4] = a3;
  if (initializeSharedInstanceWithCaptureSourceBackings__initSharedFCSCalibration != -1)
    dispatch_once(&initializeSharedInstanceWithCaptureSourceBackings__initSharedFCSCalibration, block);
}

_QWORD *__82__FigCaptureCalibrationMonitor_initializeSharedInstanceWithCaptureSourceBackings___block_invoke(uint64_t a1)
{
  _QWORD *result;

  result = -[FigCaptureCalibrationMonitor initWithCaptureSourceBackings:]([FigCaptureCalibrationMonitor alloc], *(void **)(a1 + 32));
  sFCCalibration = (uint64_t)result;
  return result;
}

- (_QWORD)initWithCaptureSourceBackings:(void *)a1
{
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  uint64_t v9;
  uint64_t v11;
  void *v12;
  double v13;
  uint64_t v14;
  const __CFString *v16;
  id obj;
  uint64_t v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  objc_super v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  if (!a1)
    return 0;
  v23.receiver = a1;
  v23.super_class = (Class)FigCaptureCalibrationMonitor;
  v3 = objc_msgSendSuper2(&v23, sel_init);
  if (v3)
  {
    v18 = (uint64_t)v3;
    v3[1] = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v19 = 0u;
    v20 = 0u;
    v21 = 0u;
    v22 = 0u;
    obj = (id)objc_msgSend(a2, "sourceInfoDictionaries");
    v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v19, v24, 16);
    if (v4)
    {
      v5 = v4;
      v6 = *(_QWORD *)v20;
      v16 = CFSTR("Sphere");
      do
      {
        for (i = 0; i != v5; ++i)
        {
          if (*(_QWORD *)v20 != v6)
            objc_enumerationMutation(obj);
          v8 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v19 + 1) + 8 * i), "objectForKeyedSubscript:", 0x1E493B8F8, v16);
          v9 = objc_msgSend((id)objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("DeviceType")), "intValue");
          if (v9 <= 0xA && ((1 << v9) & 0x4AC) != 0)
          {
            v11 = v9;
            if ((objc_msgSend((id)objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("Focus")), "BOOLValue") & 1) != 0
              || objc_msgSend((id)objc_msgSend(v8, "objectForKeyedSubscript:", v16), "BOOLValue"))
            {
              v12 = (void *)objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
              objc_msgSend(v12, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v11), CFSTR("DeviceType"));
              objc_msgSend(v12, "setObject:forKeyedSubscript:", objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("NonLocalizedName")), CFSTR("DeviceName"));
              objc_msgSend(v12, "setObject:forKeyedSubscript:", objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("Position")), CFSTR("DevicePosition"));
              objc_msgSend(v12, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0C99DE8], "array"), CFSTR("SupportedCalibrations"));
              objc_msgSend(*(id *)(v18 + 8), "addObject:", v12);
            }
          }
        }
        v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v19, v24, 16);
      }
      while (v5);
    }
    v3 = (_QWORD *)v18;
    *(_QWORD *)(v18 + 16) = dispatch_queue_create("com.apple.coremedia.apscal", 0);
    *(_QWORD *)(v18 + 24) = FigSimpleMutexCreate();
    FigGetCFPreferenceDoubleWithDefault();
    *(_DWORD *)(v18 + 80) = (int)v13;
    FigGetCFPreferenceDoubleWithDefault();
    *(_QWORD *)(v18 + 88) = v14;
    *(_DWORD *)(v18 + 72) = FigGetCFPreferenceNumberWithDefault();
    -[FigCaptureCalibrationMonitor _setupDuetTriggersAndScheduling](v18);
  }
  return v3;
}

- (void)_setupDuetTriggersAndScheduling
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  void *v16;
  void *v17;
  int v18;
  void *v19;
  uint64_t v20;
  void *v21;
  FigCaptureAutoFocusPositionSensorCalibrationContext *v22;
  FigCaptureAutoFocusCalibrationContext *v23;
  FigCaptureSphereCalibrationContext *v24;
  FigCaptureAPSSphereInteractionCalibrationContext *v25;
  FigCaptureSphereEndStopCalibrationContext *v26;
  int v27;
  uint64_t v28;
  uint64_t v29;
  unsigned int v30;
  _QWORD *v31;
  id obj;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  uint64_t v38;
  void *v39;
  uint64_t v40;
  _QWORD v41[5];
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  int v46;
  _BYTE v47[128];
  uint64_t v48;

  v48 = *MEMORY[0x1E0C80C00];
  if (a1)
  {
    v2 = a1;
    v46 = 0;
    v3 = objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v4 = objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v5 = objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v6 = objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v7 = objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v8 = objc_msgSend(+[BWFigCaptureDeviceVendor sharedCaptureDeviceVendor](BWFigCaptureDeviceVendor, "sharedCaptureDeviceVendor"), "registerClientWithPID:clientDescription:clientPriority:canStealFromClientsWithSamePriority:deviceSharingWithOtherClientsAllowed:deviceAvailabilityChangedHandler:", getpid(), CFSTR("FigCaptureCalibrationMonitor"), 2, 0, 0, 0);
    v39 = (void *)objc_msgSend(+[BWFigCaptureDeviceVendor sharedCaptureDeviceVendor](BWFigCaptureDeviceVendor, "sharedCaptureDeviceVendor"), "copyDeviceForClient:informClientWhenDeviceAvailableAgain:error:", v8, 0, &v46);
    if (v39)
    {
      v33 = (void *)v3;
      v34 = (void *)v4;
      v35 = (void *)v5;
      v36 = (void *)v6;
      v37 = (void *)v7;
      v30 = v8;
      v44 = 0u;
      v45 = 0u;
      v42 = 0u;
      v43 = 0u;
      v31 = (_QWORD *)v2;
      obj = *(id *)(v2 + 8);
      v40 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v42, v47, 16);
      if (v40)
      {
        v38 = *(_QWORD *)v43;
        v9 = *MEMORY[0x1E0D073B0];
        v10 = *MEMORY[0x1E0D07390];
        v11 = *MEMORY[0x1E0D07788];
        v12 = *MEMORY[0x1E0D073D0];
        v13 = *MEMORY[0x1E0D07790];
        while (2)
        {
          for (i = 0; i != v40; ++i)
          {
            if (*(_QWORD *)v43 != v38)
              objc_enumerationMutation(obj);
            v15 = *(void **)(*((_QWORD *)&v42 + 1) + 8 * i);
            v16 = (void *)objc_msgSend(+[BWFigCaptureDeviceVendor sharedCaptureDeviceVendor](BWFigCaptureDeviceVendor, "sharedCaptureDeviceVendor"), "copyStreamFromDevice:position:deviceType:deviceClientPriority:allowsStreamControlLoss:error:", v39, objc_msgSend((id)objc_msgSend(v15, "objectForKeyedSubscript:", CFSTR("DevicePosition")), "intValue"), objc_msgSend((id)objc_msgSend(v15, "objectForKeyedSubscript:", CFSTR("DeviceType")), "intValue"), 0, 0, &v46);
            v17 = v16;
            v18 = v46;
            if (v46)
            {
              fig_log_get_emitter();
              v29 = v1;
              LODWORD(v28) = v18;
              FigDebugAssert3();

              v2 = (uint64_t)v31;
              v8 = v30;
              goto LABEL_32;
            }
            objc_msgSend(v15, "setObject:forKeyedSubscript:", objc_msgSend(v16, "portType"), CFSTR("PortType"));
            v19 = (void *)objc_msgSend(v17, "supportedProperties");
            v20 = objc_msgSend(v15, "objectForKeyedSubscript:", CFSTR("DeviceName"));
            v21 = (void *)objc_msgSend(v15, "objectForKeyedSubscript:", CFSTR("SupportedCalibrations"));
            if (objc_msgSend(v19, "objectForKeyedSubscript:", v9))
            {
              objc_msgSend(v21, "addObject:", v9);
              objc_msgSend(v33, "addObject:", v20);
            }
            if (objc_msgSend(v19, "objectForKeyedSubscript:", v10))
            {
              objc_msgSend(v21, "addObject:", v10);
              objc_msgSend(v34, "addObject:", v20);
            }
            if (objc_msgSend(v19, "objectForKeyedSubscript:", v11))
            {
              objc_msgSend(v21, "addObject:", v11);
              objc_msgSend(v35, "addObject:", v20);
            }
            if (objc_msgSend(v19, "objectForKeyedSubscript:", v12))
            {
              objc_msgSend(v21, "addObject:", v12);
              objc_msgSend(v36, "addObject:", v20);
            }
            if (objc_msgSend(v19, "objectForKeyedSubscript:", v13))
            {
              objc_msgSend(v21, "addObject:", v13);
              objc_msgSend(v37, "addObject:", v20);
            }

          }
          v40 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v42, v47, 16);
          if (v40)
            continue;
          break;
        }
      }
      v2 = (uint64_t)v31;
      if (objc_msgSend(v33, "count"))
      {
        v22 = -[FigCaptureAutoFocusPositionSensorCalibrationContext initWithSupportedDeviceNames:]([FigCaptureAutoFocusPositionSensorCalibrationContext alloc], "initWithSupportedDeviceNames:", v33);
        v31[12] = v22;
        -[FigCaptureCalibrationMonitor _setupCalibrationForContext:]((uint64_t)v31, v22);
      }
      if (objc_msgSend(v34, "count"))
      {
        v23 = -[FigCaptureAutoFocusCalibrationContext initWithSupportedDeviceNames:]([FigCaptureAutoFocusCalibrationContext alloc], "initWithSupportedDeviceNames:", v34);
        v31[13] = v23;
        -[FigCaptureCalibrationMonitor _setupCalibrationForContext:]((uint64_t)v31, v23);
      }
      if (objc_msgSend(v35, "count"))
      {
        v24 = -[FigCaptureSphereCalibrationContext initWithSupportedDeviceNames:]([FigCaptureSphereCalibrationContext alloc], "initWithSupportedDeviceNames:", v35);
        v31[15] = v24;
        -[FigCaptureCalibrationMonitor _setupCalibrationForContext:]((uint64_t)v31, v24);
      }
      v8 = v30;
      if (objc_msgSend(v36, "count"))
      {
        v25 = -[FigCaptureAPSSphereInteractionCalibrationContext initWithSupportedDeviceNames:]([FigCaptureAPSSphereInteractionCalibrationContext alloc], "initWithSupportedDeviceNames:", v36);
        v31[14] = v25;
        -[FigCaptureCalibrationMonitor _setupCalibrationForContext:]((uint64_t)v31, v25);
      }
      if (objc_msgSend(v37, "count"))
      {
        v26 = -[FigCaptureSphereEndStopCalibrationContext initWithSupportedDeviceNames:]([FigCaptureSphereEndStopCalibrationContext alloc], "initWithSupportedDeviceNames:", v37);
        v31[16] = v26;
        -[FigCaptureCalibrationMonitor _setupCalibrationForContext:]((uint64_t)v31, v26);
      }
    }
    else
    {
      fig_log_get_emitter();
      v29 = v1;
      LODWORD(v28) = 0;
      FigDebugAssert3();
    }
LABEL_32:
    if (v46)
    {
      v27 = *MEMORY[0x1E0C807C0];
      v41[0] = MEMORY[0x1E0C809B0];
      v41[1] = 3221225472;
      v41[2] = __63__FigCaptureCalibrationMonitor__setupDuetTriggersAndScheduling__block_invoke;
      v41[3] = &unk_1E491E720;
      v41[4] = v2;
      -[FigCaptureCalibrationMonitor _setupActivityAndTriggers:interval:batteryLevel:calibrationBlock:isRepeating:](v2, "com.apple.coremedia.calibration.setup", v27, 50, v41, 0);
    }
    objc_msgSend(+[BWFigCaptureDeviceVendor sharedCaptureDeviceVendor](BWFigCaptureDeviceVendor, "sharedCaptureDeviceVendor", v28, v29), "takeBackDevice:forClient:informClientWhenDeviceAvailableAgain:prefersDeviceInvalidatedImmediately:", v39, v8, 0, 0);

  }
}

- (id)runAutoFocusPositionSensorCalibrationAndGetResultsForDeviceType:(int)a3 devicePosition:(int)a4
{
  NSObject *v7;
  NSObject *calibrationRunQueue;
  dispatch_time_t v9;
  uint64_t v10;
  void *v11;
  _QWORD v13[6];
  int v14;
  int v15;
  _QWORD v16[6];
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  void (*v20)(uint64_t, uint64_t);
  void (*v21)(uint64_t);
  uint64_t v22;
  _QWORD v23[2];
  _QWORD v24[3];

  v24[2] = *MEMORY[0x1E0C80C00];
  v7 = dispatch_semaphore_create(0);
  v17 = 0;
  v18 = &v17;
  v19 = 0x3052000000;
  v20 = __Block_byref_object_copy__13;
  v21 = __Block_byref_object_dispose__13;
  v22 = 0;
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __111__FigCaptureCalibrationMonitor_runAutoFocusPositionSensorCalibrationAndGetResultsForDeviceType_devicePosition___block_invoke;
  v16[3] = &unk_1E49203E8;
  v16[4] = v7;
  v16[5] = &v17;
  calibrationRunQueue = self->_calibrationRunQueue;
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __111__FigCaptureCalibrationMonitor_runAutoFocusPositionSensorCalibrationAndGetResultsForDeviceType_devicePosition___block_invoke_2;
  v13[3] = &unk_1E4920410;
  v14 = a3;
  v15 = a4;
  v13[4] = self;
  v13[5] = v16;
  dispatch_async(calibrationRunQueue, v13);
  v9 = dispatch_time(0, 5000000000);
  if (dispatch_semaphore_wait(v7, v9))
  {
    v23[0] = CFSTR("Result");
    v23[1] = CFSTR("StatusCode");
    v24[0] = MEMORY[0x1E0C9AAA0];
    v24[1] = &unk_1E49F8FA0;
    v10 = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v24, v23, 2);
    v18[5] = v10;
  }
  dispatch_release(v7);
  v11 = (void *)v18[5];
  _Block_object_dispose(&v17, 8);
  return v11;
}

intptr_t __111__FigCaptureCalibrationMonitor_runAutoFocusPositionSensorCalibrationAndGetResultsForDeviceType_devicePosition___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  _QWORD v6[2];
  _QWORD v7[3];

  v7[2] = *MEMORY[0x1E0C80C00];
  v6[0] = CFSTR("Result");
  v6[1] = CFSTR("StatusCode");
  v7[0] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a2);
  v7[1] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", a3);
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40) = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v7, v6, 2);
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void __111__FigCaptureCalibrationMonitor_runAutoFocusPositionSensorCalibrationAndGetResultsForDeviceType_devicePosition___block_invoke_2(uint64_t a1)
{
  -[FigCaptureCalibrationMonitor _attemptToRunCalibrationForCalibrationContext:deviceType:devicePosition:disableHistoryChecking:resultsBlock:](*(_QWORD *)(a1 + 32), *(_QWORD *)(*(_QWORD *)(a1 + 32) + 96), *(_DWORD *)(a1 + 48), *(_DWORD *)(a1 + 52), 1, *(void **)(a1 + 40));
}

- (void)_attemptToRunCalibrationForCalibrationContext:(int)a3 deviceType:(int)a4 devicePosition:(char)a5 disableHistoryChecking:(void *)a6 resultsBlock:
{
  id v12;
  id v13;
  id v14;
  void *v15;
  uint64_t v16;
  void *v17;
  _QWORD v18[9];
  int v19;
  int v20;
  char v21;
  _QWORD v22[5];
  uint64_t v23;
  uint64_t *v24;
  uint64_t v25;
  void (*v26)(uint64_t, uint64_t);
  void (*v27)(uint64_t);
  id v28;

  if (a1)
  {
    pthread_mutex_lock(*(pthread_mutex_t **)(a1 + 24));
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 36));
    *(_BYTE *)(a1 + 32) = 0;
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 36));
    v23 = 0;
    v24 = &v23;
    v25 = 0x3052000000;
    v26 = __Block_byref_object_copy__13;
    v27 = __Block_byref_object_dispose__13;
    v28 = 0;
    v28 = objc_alloc_init(MEMORY[0x1E0CA5670]);
    v12 = objc_alloc_init(MEMORY[0x1E0CB3828]);
    v13 = objc_alloc_init(MEMORY[0x1E0CA5660]);
    v14 = objc_alloc_init(MEMORY[0x1E0CB3828]);
    v15 = (void *)objc_msgSend(a6, "copy");
    v16 = MEMORY[0x1E0C809B0];
    v22[0] = MEMORY[0x1E0C809B0];
    v22[1] = 3221225472;
    v22[2] = __140__FigCaptureCalibrationMonitor__attemptToRunCalibrationForCalibrationContext_deviceType_devicePosition_disableHistoryChecking_resultsBlock___block_invoke;
    v22[3] = &unk_1E4920460;
    v22[4] = a1;
    objc_msgSend(v13, "startActivityUpdatesToQueue:withHandler:", v14, v22);

    objc_msgSend(v12, "setMaxConcurrentOperationCount:", 1);
    *(_DWORD *)(a1 + 76) = 0;
    objc_msgSend((id)v24[5], "setDeviceMotionUpdateInterval:", 1.0);
    v17 = (void *)v24[5];
    v18[0] = v16;
    v18[1] = 3221225472;
    v18[2] = __140__FigCaptureCalibrationMonitor__attemptToRunCalibrationForCalibrationContext_deviceType_devicePosition_disableHistoryChecking_resultsBlock___block_invoke_2;
    v18[3] = &unk_1E4920488;
    v18[7] = v15;
    v18[8] = &v23;
    v18[4] = a1;
    v18[5] = a2;
    v19 = a3;
    v20 = a4;
    v21 = a5;
    v18[6] = v13;
    objc_msgSend(v17, "startDeviceMotionUpdatesUsingReferenceFrame:toQueue:withHandler:", 4, v12, v18);

    _Block_object_dispose(&v23, 8);
  }
}

- (id)sphereCalibrationData
{
  os_unfair_lock_s *p_calibrationLock;
  NSDictionary *v4;

  p_calibrationLock = &self->_calibrationLock;
  os_unfair_lock_lock(&self->_calibrationLock);
  v4 = -[FigCaptureCalibrationContext lastSuccessfulCalibrationData](self->_sphereCalibrationContext, "lastSuccessfulCalibrationData");
  os_unfair_lock_unlock(p_calibrationLock);
  return v4;
}

- (id)sphereEndStopCalibrationData
{
  os_unfair_lock_s *p_calibrationLock;
  NSDictionary *v4;

  p_calibrationLock = &self->_calibrationLock;
  os_unfair_lock_lock(&self->_calibrationLock);
  v4 = -[FigCaptureCalibrationContext lastSuccessfulCalibrationData](self->_sphereEndStopCalibrationContext, "lastSuccessfulCalibrationData");
  os_unfair_lock_unlock(p_calibrationLock);
  return v4;
}

- (os_unfair_lock_s)_calibrationShouldAbort
{
  os_unfair_lock_s *v1;
  os_unfair_lock_s *v2;

  v1 = a1;
  if (a1)
  {
    v2 = a1 + 9;
    os_unfair_lock_lock(a1 + 9);
    v1 = (os_unfair_lock_s *)(LOBYTE(v1[8]._os_unfair_lock_opaque) != 0);
    os_unfair_lock_unlock(v2);
  }
  return v1;
}

- (void)_setupActivityAndTriggers:(int)a3 interval:(int)a4 batteryLevel:(void *)a5 calibrationBlock:(char)a6 isRepeating:
{
  void *v11;
  void *v12;
  _QWORD v13[6];
  int v14;
  int v15;
  char v16;

  if (a1)
  {
    v11 = (void *)objc_msgSend(a5, "copy");
    v12 = (void *)*MEMORY[0x1E0C80748];
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __109__FigCaptureCalibrationMonitor__setupActivityAndTriggers_interval_batteryLevel_calibrationBlock_isRepeating___block_invoke;
    v13[3] = &unk_1E4920438;
    v14 = a3;
    v15 = a4;
    v16 = a6;
    v13[4] = a1;
    v13[5] = v11;
    xpc_activity_register(a2, v12, v13);

  }
}

void __109__FigCaptureCalibrationMonitor__setupActivityAndTriggers_interval_batteryLevel_calibrationBlock_isRepeating___block_invoke(uint64_t a1, xpc_activity_t activity)
{
  xpc_activity_state_t state;
  xpc_object_t v5;
  xpc_object_t v6;
  void *v7;

  state = xpc_activity_get_state(activity);
  if (state == 2)
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }
  else if (!state)
  {
    v5 = -[FigCaptureCalibrationMonitor _createDefaultXPCSchedulingParametersWithInterval:batteryLevel:](*(_QWORD *)(a1 + 32), *(_DWORD *)(a1 + 48), *(_DWORD *)(a1 + 52));
    xpc_dictionary_set_BOOL(v5, (const char *)*MEMORY[0x1E0C80898], *(_BYTE *)(a1 + 56));
    v6 = xpc_activity_copy_criteria(activity);
    if (v6)
    {
      v7 = v6;
      if (!xpc_equal(v6, v5))
        xpc_activity_set_criteria(activity, v5);
      xpc_release(v7);
    }
    else
    {
      xpc_activity_set_criteria(activity, v5);
    }
    xpc_release(v5);
  }
}

- (xpc_object_t)_createDefaultXPCSchedulingParametersWithInterval:(int)a3 batteryLevel:
{
  xpc_object_t v5;
  xpc_object_t v6;
  id *v7;
  void *v8;
  id *v9;
  void *v10;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t v15;

  if (!a1)
    return 0;
  v5 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_int64(v5, (const char *)*MEMORY[0x1E0C807A8], a2);
  xpc_dictionary_set_string(v5, (const char *)*MEMORY[0x1E0C80878], (const char *)*MEMORY[0x1E0C80880]);
  xpc_dictionary_set_BOOL(v5, (const char *)*MEMORY[0x1E0C80738], 1);
  xpc_dictionary_set_BOOL(v5, (const char *)*MEMORY[0x1E0C808D8], 1);
  xpc_dictionary_set_string(v5, (const char *)*MEMORY[0x1E0C80768], (const char *)*MEMORY[0x1E0C80810]);
  v6 = xpc_dictionary_create(0, 0, 0);
  v12 = 0;
  v13 = &v12;
  v14 = 0x2020000000;
  v7 = (id *)get_DASCTSMinBatteryLevelKeySymbolLoc_ptr;
  v15 = get_DASCTSMinBatteryLevelKeySymbolLoc_ptr;
  if (!get_DASCTSMinBatteryLevelKeySymbolLoc_ptr)
  {
    v8 = (void *)DuetActivitySchedulerLibrary();
    v7 = (id *)dlsym(v8, "_DASCTSMinBatteryLevelKey");
    v13[3] = (uint64_t)v7;
    get_DASCTSMinBatteryLevelKeySymbolLoc_ptr = (uint64_t)v7;
  }
  _Block_object_dispose(&v12, 8);
  if (!v7)
    -[FigCaptureCalibrationMonitor _createDefaultXPCSchedulingParametersWithInterval:batteryLevel:].cold.1();
  xpc_dictionary_set_int64(v6, (const char *)objc_msgSend(*v7, "cStringUsingEncoding:", 4, v12), a3);
  v12 = 0;
  v13 = &v12;
  v14 = 0x2020000000;
  v9 = (id *)get_DASCTSMagneticInterferenceSensitivityKeySymbolLoc_ptr;
  v15 = get_DASCTSMagneticInterferenceSensitivityKeySymbolLoc_ptr;
  if (!get_DASCTSMagneticInterferenceSensitivityKeySymbolLoc_ptr)
  {
    v10 = (void *)DuetActivitySchedulerLibrary();
    v9 = (id *)dlsym(v10, "_DASCTSMagneticInterferenceSensitivityKey");
    v13[3] = (uint64_t)v9;
    get_DASCTSMagneticInterferenceSensitivityKeySymbolLoc_ptr = (uint64_t)v9;
  }
  _Block_object_dispose(&v12, 8);
  if (!v9)
    -[FigCaptureCalibrationMonitor _createDefaultXPCSchedulingParametersWithInterval:batteryLevel:].cold.2();
  xpc_dictionary_set_BOOL(v6, (const char *)objc_msgSend(*v9, "cStringUsingEncoding:", 4, v12), 1);
  xpc_dictionary_set_value(v5, (const char *)*MEMORY[0x1E0C80778], v6);
  xpc_release(v6);
  return v5;
}

- (void)_setupCalibrationForContext:(uint64_t)a1
{
  _QWORD v2[7];
  _QWORD v3[6];

  if (a1)
  {
    v3[0] = 0;
    v3[1] = v3;
    v3[2] = 0x3052000000;
    v3[3] = __Block_byref_object_copy__13;
    v3[4] = __Block_byref_object_dispose__13;
    v3[5] = a1;
    v2[0] = MEMORY[0x1E0C809B0];
    v2[1] = 3221225472;
    v2[2] = __60__FigCaptureCalibrationMonitor__setupCalibrationForContext___block_invoke;
    v2[3] = &unk_1E491F458;
    v2[5] = a2;
    v2[6] = v3;
    v2[4] = a1;
    -[FigCaptureCalibrationMonitor _setupRepeatingCalibrationScheduling:withCalibrationBlock:](a1, a2, v2);
    _Block_object_dispose(v3, 8);
  }
}

uint64_t __63__FigCaptureCalibrationMonitor__setupDuetTriggersAndScheduling__block_invoke(uint64_t a1)
{
  return -[FigCaptureCalibrationMonitor _setupDuetTriggersAndScheduling](*(_QWORD *)(a1 + 32));
}

- (void)_setupRepeatingCalibrationScheduling:(void *)a3 withCalibrationBlock:
{
  if (a1)
    -[FigCaptureCalibrationMonitor _setupActivityAndTriggers:interval:batteryLevel:calibrationBlock:isRepeating:](a1, (const char *)objc_msgSend((id)objc_msgSend(a2, "activityName"), "cStringUsingEncoding:", 134217984), objc_msgSend(a2, "interval"), objc_msgSend(a2, "minimumBatteryLevelToRun"), a3, 1);
}

void __140__FigCaptureCalibrationMonitor__attemptToRunCalibrationForCalibrationContext_deviceType_devicePosition_disableHistoryChecking_resultsBlock___block_invoke(uint64_t a1, void *a2)
{
  if ((objc_msgSend(a2, "stationary") & 1) == 0)
    -[FigCaptureCalibrationMonitor _notifyOfDeviceMotion](*(_QWORD *)(a1 + 32));
}

- (void)_notifyOfDeviceMotion
{
  os_unfair_lock_s *v2;

  if (a1)
  {
    v2 = (os_unfair_lock_s *)(a1 + 36);
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 36));
    *(_BYTE *)(a1 + 32) = 1;
    os_unfair_lock_unlock(v2);
  }
}

uint64_t __140__FigCaptureCalibrationMonitor__attemptToRunCalibrationForCalibrationContext_deviceType_devicePosition_disableHistoryChecking_resultsBlock___block_invoke_2(uint64_t result, void *a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v5;
  uint64_t v6;
  double v7;
  uint64_t v8;
  _QWORD *v9;
  uint64_t v10;
  int v11;
  uint64_t v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  int v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  unsigned int v36;
  unsigned __int8 v37;

  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(result + 64) + 8) + 40))
    return result;
  v3 = a3;
  v5 = result;
  v37 = 0;
  v36 = 0;
  v6 = *(_QWORD *)(result + 32);
  if (v6)
    v7 = *(double *)(v6 + 88);
  else
    v7 = 0.0;
  if (a2)
  {
    objc_msgSend(a2, "magneticField");
    objc_msgSend(a2, "magneticField");
    objc_msgSend(a2, "magneticField");
    objc_msgSend(a2, "magneticField");
    objc_msgSend(a2, "magneticField");
    objc_msgSend(a2, "magneticField");
    *(double *)(*(_QWORD *)(v5 + 32) + 64) = sqrt(*((double *)&v30 + 1) * *((double *)&v28 + 1)+ *(double *)&v34 * *(double *)&v32+ *(double *)&v27 * *(double *)&v25);
    v8 = *(_QWORD *)(v5 + 32);
    objc_msgSend(a2, "magneticField");
    *(_OWORD *)(v8 + 40) = v22;
    *(_QWORD *)(v8 + 56) = v23;
    objc_msgSend(a2, "magneticField");
    if (!v3 && DWORD2(v21) != -1)
    {
      LOBYTE(v3) = 0;
      goto LABEL_14;
    }
    result = objc_msgSend(a2, "magneticField");
    if (DWORD2(v19) == -1)
    {
      v10 = *(_QWORD *)(v5 + 32);
      v11 = *(_DWORD *)(v10 + 76);
      if (v11 <= 1)
      {
        *(_DWORD *)(v10 + 76) = v11 + 1;
        return result;
      }
    }
  }
  else
  {
    v34 = 0u;
    v35 = 0u;
    v32 = 0u;
    v33 = 0u;
    v30 = 0u;
    v31 = 0u;
    v28 = 0u;
    v29 = 0u;
    v26 = 0u;
    v27 = 0u;
    v24 = 0u;
    v25 = 0u;
    *(_QWORD *)(v6 + 64) = 0;
    v9 = *(_QWORD **)(result + 32);
    v22 = 0u;
    v23 = 0u;
    v9[6] = 0;
    v9[7] = 0;
    v9[5] = 0;
    v20 = 0u;
    v21 = 0u;
    if (!a3)
      goto LABEL_14;
    v18 = 0uLL;
    v19 = 0uLL;
  }
  LOBYTE(v3) = 1;
LABEL_14:
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(v5 + 64) + 8) + 40), "stopDeviceMotionUpdates");
  v12 = *(_QWORD *)(v5 + 32);
  if ((v3 & 1) != 0 || *(double *)(v12 + 64) >= v7)
  {
    v13 = 0;
    ++*(_DWORD *)(v12 + 72);
    v15 = *(_QWORD *)(v5 + 32);
    if (*(double *)(v15 + 64) >= v7)
      LODWORD(v14) = 2;
    else
      LODWORD(v14) = 128;
  }
  else
  {
    v17 = 0;
    v13 = -[FigCaptureCalibrationMonitor _runAndCreateDictionaryForCalibrationContext:deviceType:devicePosition:errors:](v12, *(void **)(v5 + 40), *(_DWORD *)(v5 + 72), *(_DWORD *)(v5 + 76), &v17);
    LODWORD(v14) = v17;
    *(_DWORD *)(*(_QWORD *)(v5 + 32) + 72) = 0;
    v15 = *(_QWORD *)(v5 + 32);
  }
  if (-[FigCaptureCalibrationMonitor _calibrationShouldAbort]((os_unfair_lock_s *)v15))
    v14 = v14 | 0x20;
  else
    v14 = v14;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(*(id *)(v5 + 40), "setDisableHistoryChecking:", *(unsigned __int8 *)(v5 + 80));
  objc_msgSend(*(id *)(v5 + 40), "updateWithNewCalibrationData:orExternalErrors:magneticFieldAttempts:magneticField:isCalibrationValid:calibrationStatus:", v13, v14, *(unsigned int *)(*(_QWORD *)(v5 + 32) + 72), &v37, &v36, *(double *)(*(_QWORD *)(v5 + 32) + 40), *(double *)(*(_QWORD *)(v5 + 32) + 48), *(double *)(*(_QWORD *)(v5 + 32) + 56));
  v16 = *(_QWORD *)(v5 + 56);
  if (v16)
    (*(void (**)(uint64_t, _QWORD, _QWORD))(v16 + 16))(v16, v37, v36);
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(*(id *)(v5 + 40), "setDisableHistoryChecking:", 0);

  objc_msgSend(*(id *)(v5 + 48), "stopActivityUpdates");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(v5 + 64) + 8) + 40) = 0;
  return pthread_mutex_unlock(*(pthread_mutex_t **)(*(_QWORD *)(v5 + 32) + 24));
}

- (id)_runAndCreateDictionaryForCalibrationContext:(int)a3 deviceType:(int)a4 devicePosition:(int *)a5 errors:
{
  uint64_t v8;
  void *v9;
  void *v10;
  BOOL v11;
  int v12;
  uint64_t v13;
  void *v14;
  int v15;
  int v16;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t i;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  void *v27;
  uint64_t v28;
  int v29;
  int v30;
  unsigned int v31;
  unsigned int v33;
  void *v34;
  int v35;
  uint64_t v36;
  id v37;
  id obj;
  uint64_t v41;
  int v42;
  uint64_t v43;
  int v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  _BYTE v53[128];
  _BYTE v54[128];
  uint64_t v55;

  v55 = *MEMORY[0x1E0C80C00];
  if (!a1)
    return 0;
  v8 = objc_msgSend(+[BWFigCaptureDeviceVendor sharedCaptureDeviceVendor](BWFigCaptureDeviceVendor, "sharedCaptureDeviceVendor"), "registerClientWithPID:clientDescription:clientPriority:canStealFromClientsWithSamePriority:deviceSharingWithOtherClientsAllowed:deviceAvailabilityChangedHandler:", getpid(), CFSTR("FigCaptureCalibrationMonitor"), 2, 0, 0, 0);
  v9 = (void *)objc_msgSend(+[BWFigCaptureDeviceVendor sharedCaptureDeviceVendor](BWFigCaptureDeviceVendor, "sharedCaptureDeviceVendor"), "copyDeviceForClient:informClientWhenDeviceAvailableAgain:error:", v8, 0, 0);
  if (!v9)
  {
    v10 = 0;
    v29 = 64;

    goto LABEL_56;
  }
  v34 = v9;
  v10 = (void *)objc_msgSend(+[BWFigCaptureDeviceVendor sharedCaptureDeviceVendor](BWFigCaptureDeviceVendor, "sharedCaptureDeviceVendor"), "copyStreamsFromDevice:positions:deviceTypes:deviceClientPriority:allowsStreamControlLoss:error:", v9, &unk_1E4A006C8, &unk_1E4A006E0, 0, 0, 0);
  if (!v10)
  {
    fig_log_get_emitter();
    FigDebugAssert3();
    v29 = 0;
    v37 = 0;
LABEL_46:
    if (a5)
      goto LABEL_57;
    goto LABEL_58;
  }
  v37 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v49 = 0u;
  v50 = 0u;
  v51 = 0u;
  v52 = 0u;
  obj = *(id *)(a1 + 8);
  v41 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v49, v54, 16);
  if (!v41)
  {
    v29 = 0;
    goto LABEL_46;
  }
  v33 = v8;
  v35 = 0;
  v43 = *(_QWORD *)v50;
  if (a3)
    v11 = a4 == 0;
  else
    v11 = 1;
  v12 = !v11;
  v42 = v12;
  v36 = *MEMORY[0x1E0D073B0];
LABEL_12:
  v13 = 0;
  while (1)
  {
    if (*(_QWORD *)v50 != v43)
      objc_enumerationMutation(obj);
    v14 = *(void **)(*((_QWORD *)&v49 + 1) + 8 * v13);
    v15 = objc_msgSend((id)objc_msgSend(v14, "objectForKeyedSubscript:", CFSTR("DeviceType")), "intValue");
    v16 = objc_msgSend((id)objc_msgSend(v14, "objectForKeyedSubscript:", CFSTR("DevicePosition")), "intValue");
    if (!v42)
      break;
    if (v15 == a3 && v16 == a4)
      break;
LABEL_40:
    if (++v13 == v41)
    {
      v41 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v49, v54, 16);
      if (!v41)
      {
        v9 = v34;
        v29 = v35;
        if (v35)
          goto LABEL_49;
        v8 = v33;
        if (a5)
          goto LABEL_57;
        goto LABEL_58;
      }
      goto LABEL_12;
    }
  }
  v47 = 0u;
  v48 = 0u;
  v45 = 0u;
  v46 = 0u;
  v18 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v45, v53, 16);
  if (!v18)
    goto LABEL_48;
  v19 = v18;
  v20 = *(_QWORD *)v46;
  while (2)
  {
    for (i = 0; i != v19; ++i)
    {
      if (*(_QWORD *)v46 != v20)
        objc_enumerationMutation(v10);
      v22 = *(void **)(*((_QWORD *)&v45 + 1) + 8 * i);
      v23 = objc_msgSend(v22, "portType");
      if (v23 == objc_msgSend(v14, "objectForKeyedSubscript:", CFSTR("PortType")))
      {
        if (!v22)
          goto LABEL_48;
        v24 = objc_msgSend(v14, "objectForKeyedSubscript:", CFSTR("DeviceName"));
        if (objc_msgSend((id)objc_msgSend(v14, "objectForKeyedSubscript:", CFSTR("SupportedCalibrations")), "containsObject:", objc_msgSend(a2, "propertyName")))
        {
          if (objc_msgSend((id)objc_msgSend(a2, "propertyName"), "isEqualToString:", v36))
          {
            v25 = objc_msgSend((id)objc_msgSend(a2, "lastSuccessfulCalibrationData"), "objectForKeyedSubscript:", v24);
            if (v25)
              objc_msgSend(v22, "setProperty:value:", objc_msgSend(a2, "propertyName"), v25);
          }
          v44 = 0;
          v26 = (void *)objc_msgSend(v22, "getProperty:error:", objc_msgSend(a2, "propertyName"), &v44);
          if (v44)
          {
            v9 = v34;
            v8 = v33;
            v30 = v35;
            if (v44 == -12688)
              v31 = 64;
            else
              v31 = 0x80000000;
            goto LABEL_54;
          }
          v27 = v26;
          v28 = objc_msgSend(v26, "length");
          if (v28 != objc_msgSend(a2, "expectedDataSize"))
          {
            v31 = 0x80000000;
            v9 = v34;
            v8 = v33;
            v30 = v35;
LABEL_54:
            v29 = v30 | v31;
            goto LABEL_55;
          }
          if (v27)
          {
            objc_msgSend((id)objc_opt_class(), "printDebugInfoForRawStreamCalibrationData:", v27);
            objc_msgSend(v37, "setObject:forKeyedSubscript:", v27, v24);
          }
          else
          {
            v35 |= 0x80000000;
          }
        }
        goto LABEL_40;
      }
    }
    v19 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v45, v53, 16);
    if (v19)
      continue;
    break;
  }
LABEL_48:
  v29 = v35 | 0x40;
  v9 = v34;
LABEL_49:
  v8 = v33;
LABEL_55:

LABEL_56:
  v37 = 0;
  if (a5)
LABEL_57:
    *a5 = v29;
LABEL_58:

  objc_msgSend(+[BWFigCaptureDeviceVendor sharedCaptureDeviceVendor](BWFigCaptureDeviceVendor, "sharedCaptureDeviceVendor"), "takeBackDevice:forClient:informClientWhenDeviceAvailableAgain:prefersDeviceInvalidatedImmediately:", v9, v8, 0, 0);
  return v37;
}

void __60__FigCaptureCalibrationMonitor__setupCalibrationForContext___block_invoke(uint64_t a1)
{
  NSObject *v1;
  _QWORD v2[4];
  __int128 v3;

  v1 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 16);
  v2[0] = MEMORY[0x1E0C809B0];
  v2[1] = 3221225472;
  v2[2] = __60__FigCaptureCalibrationMonitor__setupCalibrationForContext___block_invoke_2;
  v2[3] = &unk_1E491E9A8;
  v3 = *(_OWORD *)(a1 + 40);
  dispatch_async(v1, v2);
}

void __60__FigCaptureCalibrationMonitor__setupCalibrationForContext___block_invoke_2(uint64_t a1)
{
  -[FigCaptureCalibrationMonitor _attemptToRunCalibrationForCalibrationContext:deviceType:devicePosition:disableHistoryChecking:resultsBlock:](*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), *(_QWORD *)(a1 + 32), 0, 0, 0, 0);
}

- (void)_createDefaultXPCSchedulingParametersWithInterval:batteryLevel:.cold.1()
{
  void *v0;

  v0 = (void *)objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "NSString *get_DASCTSMinBatteryLevelKey(void)"), CFSTR("FigCaptureCalibrationMonitor.m"), 50, CFSTR("%s"), dlerror());
  __break(1u);
}

- (void)_createDefaultXPCSchedulingParametersWithInterval:batteryLevel:.cold.2()
{
  void *v0;

  v0 = (void *)objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "NSString *get_DASCTSMagneticInterferenceSensitivityKey(void)"), CFSTR("FigCaptureCalibrationMonitor.m"), 49, CFSTR("%s"), dlerror());
  __break(1u);
}

@end
