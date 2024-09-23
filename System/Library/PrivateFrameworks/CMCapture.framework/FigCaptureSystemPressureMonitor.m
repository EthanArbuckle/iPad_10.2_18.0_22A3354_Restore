@implementation FigCaptureSystemPressureMonitor

- (uint64_t)_callChangeHandler
{
  uint64_t v1;
  uint64_t v2;
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  uint64_t v9;
  uint64_t v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  if (result)
  {
    v2 = result;
    result = _FigIsCurrentDispatchQueue();
    if (!(_DWORD)result)
    {
      fig_log_get_emitter();
      v10 = v1;
      LODWORD(v9) = 0;
      result = FigDebugAssert3();
    }
    if (*(_QWORD *)(v2 + 8))
    {
      v3 = (void *)objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
      v11 = 0u;
      v12 = 0u;
      v13 = 0u;
      v14 = 0u;
      v4 = *(void **)(v2 + 160);
      v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
      if (v5)
      {
        v6 = v5;
        v7 = *(_QWORD *)v12;
        do
        {
          for (i = 0; i != v6; ++i)
          {
            if (*(_QWORD *)v12 != v7)
              objc_enumerationMutation(v4);
            objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", objc_msgSend((id)objc_msgSend(*(id *)(v2 + 160), "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * i), v9, v10), "systemPressureLevelFromImageSensorTemperature")), *(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * i));
          }
          v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
        }
        while (v6);
      }
      return (*(uint64_t (**)(void))(*(_QWORD *)(v2 + 8) + 16))();
    }
  }
  return result;
}

uint64_t __72__FigCaptureSystemPressureMonitor_callSystemPressureLevelChangedHandler__block_invoke(uint64_t a1)
{
  return -[FigCaptureSystemPressureMonitor _callChangeHandler](*(_QWORD *)(a1 + 32));
}

- (void)callSystemPressureLevelChangedHandler
{
  NSObject *systemPressureLevelChangedHandlerQueue;
  _QWORD block[5];

  systemPressureLevelChangedHandlerQueue = self->_systemPressureLevelChangedHandlerQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __72__FigCaptureSystemPressureMonitor_callSystemPressureLevelChangedHandler__block_invoke;
  block[3] = &unk_1E491E720;
  block[4] = self;
  dispatch_async(systemPressureLevelChangedHandlerQueue, block);
}

uint64_t __67__FigCaptureSystemPressureMonitor__registerForThermalNotifications__block_invoke(uint64_t a1)
{
  return -[FigCaptureSystemPressureMonitor _updateSystemPressureForThermalPressureAndCallChangeHandler:](*(_QWORD *)(a1 + 32), 1);
}

- (uint64_t)_updateSystemPressureForThermalPressureAndCallChangeHandler:(uint64_t)result
{
  uint64_t v3;
  uint64_t i;
  uint64_t state64;

  if (result)
  {
    v3 = result;
    if (!_FigIsCurrentDispatchQueue())
    {
      fig_log_get_emitter();
      FigDebugAssert3();
    }
    result = *(unsigned int *)(v3 + 24);
    if ((_DWORD)result)
    {
      state64 = 0;
      result = notify_get_state(result, &state64);
      if (!(_DWORD)result)
      {
        for (i = 0; i != 4; ++i)
        {
          if (state64 <= *(int *)(v3 + 4 * i + 28))
            break;
        }
        *(_DWORD *)(v3 + 48) = i;
        if (a2)
          return -[FigCaptureSystemPressureMonitor _callChangeHandler](v3);
      }
    }
  }
  return result;
}

+ (void)initialize
{
  objc_opt_class();
}

- (FigCaptureSystemPressureMonitor)initWithPearlModuleType:(int)a3 sensorThermalLevelsByTemperatureByPortType:(id)a4
{
  char *v6;
  float v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  uint64_t v13;
  FigCaptureImageSensorTemperatureMonitor *v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  objc_super v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v20.receiver = self;
  v20.super_class = (Class)FigCaptureSystemPressureMonitor;
  v6 = -[FigCaptureSystemPressureMonitor init](&v20, sel_init);
  if (v6)
  {
    *((_QWORD *)v6 + 2) = FigDispatchQueueCreateWithPriority();
    *(_OWORD *)(v6 + 28) = xmmword_1A32B2260;
    *((_DWORD *)v6 + 11) = 40;
    *(_OWORD *)(v6 + 56) = xmmword_1A32B2260;
    *((_DWORD *)v6 + 18) = 40;
    *((_OWORD *)v6 + 5) = xmmword_1A32B2270;
    v7 = 61.0;
    *((_QWORD *)v6 + 12) = 0x426C000042480000;
    if (a3 == 2)
      v7 = 70.0;
    *((_DWORD *)v6 + 26) = 1112539136;
    *((float *)v6 + 27) = v7;
    *((_QWORD *)v6 + 14) = 0x42C6000042580000;
    v8 = MEMORY[0x1E0CA2E18];
    *(_OWORD *)(v6 + 136) = *MEMORY[0x1E0CA2E18];
    *((_QWORD *)v6 + 19) = *(_QWORD *)(v8 + 16);
    if (objc_msgSend(a4, "count"))
    {
      *((_QWORD *)v6 + 20) = objc_alloc_init(MEMORY[0x1E0C99E08]);
      v16 = 0u;
      v17 = 0u;
      v18 = 0u;
      v19 = 0u;
      v9 = objc_msgSend(a4, "countByEnumeratingWithState:objects:count:", &v16, v21, 16);
      if (v9)
      {
        v10 = v9;
        v11 = *(_QWORD *)v17;
        do
        {
          for (i = 0; i != v10; ++i)
          {
            if (*(_QWORD *)v17 != v11)
              objc_enumerationMutation(a4);
            v13 = *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * i);
            v14 = -[FigCaptureImageSensorTemperatureMonitor initWithPortType:sensorThermalLevelsByTemperature:]([FigCaptureImageSensorTemperatureMonitor alloc], "initWithPortType:sensorThermalLevelsByTemperature:", v13, objc_msgSend(a4, "objectForKeyedSubscript:", v13));
            objc_msgSend(*((id *)v6 + 20), "setObject:forKeyedSubscript:", v14, v13);

          }
          v10 = objc_msgSend(a4, "countByEnumeratingWithState:objects:count:", &v16, v21, 16);
        }
        while (v10);
      }
    }
    -[FigCaptureSystemPressureMonitor _registerForThermalNotifications]((uint64_t)v6);
    -[FigCaptureSystemPressureMonitor _registerForPeakPowerNotifications]((uint64_t)v6);
  }
  return (FigCaptureSystemPressureMonitor *)v6;
}

- (uint64_t)_registerForThermalNotifications
{
  const char *v1;
  NSObject *v2;
  _QWORD handler[5];

  if (result)
  {
    v1 = (const char *)*MEMORY[0x1E0C83A00];
    v2 = *(NSObject **)(result + 16);
    handler[0] = MEMORY[0x1E0C809B0];
    handler[1] = 3221225472;
    handler[2] = __67__FigCaptureSystemPressureMonitor__registerForThermalNotifications__block_invoke;
    handler[3] = &unk_1E491FB78;
    handler[4] = result;
    return notify_register_dispatch(v1, (int *)(result + 24), v2, handler);
  }
  return result;
}

- (uint64_t)_registerForPeakPowerNotifications
{
  NSObject *v1;
  _QWORD handler[5];

  if (result)
  {
    v1 = *(NSObject **)(result + 16);
    handler[0] = MEMORY[0x1E0C809B0];
    handler[1] = 3221225472;
    handler[2] = __69__FigCaptureSystemPressureMonitor__registerForPeakPowerNotifications__block_invoke;
    handler[3] = &unk_1E491FB78;
    handler[4] = result;
    return notify_register_dispatch("com.apple.system.peakpowerpressurelevel", (int *)(result + 52), v1, handler);
  }
  return result;
}

- (void)dealloc
{
  int thermalPressureNotificationToken;
  int peakPowerNotificationToken;
  NSObject *systemPressureLevelChangedHandlerQueue;
  objc_super v6;
  _QWORD block[5];

  thermalPressureNotificationToken = self->_thermalPressureNotificationToken;
  if (thermalPressureNotificationToken)
    notify_cancel(thermalPressureNotificationToken);
  peakPowerNotificationToken = self->_peakPowerNotificationToken;
  if (peakPowerNotificationToken)
    notify_cancel(peakPowerNotificationToken);
  systemPressureLevelChangedHandlerQueue = self->_systemPressureLevelChangedHandlerQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __42__FigCaptureSystemPressureMonitor_dealloc__block_invoke;
  block[3] = &unk_1E491E720;
  block[4] = self;
  dispatch_sync(systemPressureLevelChangedHandlerQueue, block);

  v6.receiver = self;
  v6.super_class = (Class)FigCaptureSystemPressureMonitor;
  -[FigCaptureSystemPressureMonitor dealloc](&v6, sel_dealloc);
}

void __42__FigCaptureSystemPressureMonitor_dealloc__block_invoke(uint64_t a1)
{

  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) = 0;
  *(_DWORD *)(*(_QWORD *)(a1 + 32) + 24) = 0;
  *(_DWORD *)(*(_QWORD *)(a1 + 32) + 52) = 0;
  -[FigCaptureSystemPressureMonitor _releasePearlProjectorPollingResources](*(_QWORD *)(a1 + 32));

}

- (void)_releasePearlProjectorPollingResources
{
  NSObject *v2;

  if (a1)
  {
    if (!_FigIsCurrentDispatchQueue())
    {
      fig_log_get_emitter();
      FigDebugAssert3();
    }
    v2 = *(NSObject **)(a1 + 128);
    if (v2)
      dispatch_source_cancel(v2);
  }
}

- (id)systemPressureLevelChangedHandler
{
  return self->_systemPressureLevelChangedHandler;
}

- (void)setSystemPressureLevelChangedHandler:(id)a3
{
  NSObject *systemPressureLevelChangedHandlerQueue;
  _QWORD v4[6];

  systemPressureLevelChangedHandlerQueue = self->_systemPressureLevelChangedHandlerQueue;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __72__FigCaptureSystemPressureMonitor_setSystemPressureLevelChangedHandler___block_invoke;
  v4[3] = &unk_1E491F098;
  v4[4] = self;
  v4[5] = a3;
  dispatch_sync(systemPressureLevelChangedHandlerQueue, v4);
}

uint64_t __72__FigCaptureSystemPressureMonitor_setSystemPressureLevelChangedHandler___block_invoke(uint64_t a1)
{

  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) = objc_msgSend(*(id *)(a1 + 40), "copy");
  -[FigCaptureSystemPressureMonitor _updateSystemPressureForPeakPowerAndCallChangeHandler:](*(_QWORD *)(a1 + 32), 0);
  return -[FigCaptureSystemPressureMonitor _updateSystemPressureForThermalPressureAndCallChangeHandler:](*(_QWORD *)(a1 + 32), 1);
}

- (uint64_t)_updateSystemPressureForPeakPowerAndCallChangeHandler:(uint64_t)result
{
  uint64_t v3;
  uint64_t i;
  uint64_t state64;

  if (result)
  {
    v3 = result;
    if (!_FigIsCurrentDispatchQueue())
    {
      fig_log_get_emitter();
      FigDebugAssert3();
    }
    result = *(unsigned int *)(v3 + 52);
    if ((_DWORD)result)
    {
      state64 = 0;
      result = notify_get_state(result, &state64);
      if (!(_DWORD)result)
      {
        for (i = 0; i != 4; ++i)
        {
          if (state64 <= *(int *)(v3 + 4 * i + 56))
            break;
        }
        *(_DWORD *)(v3 + 76) = i;
        if (a2)
          return -[FigCaptureSystemPressureMonitor _callChangeHandler](v3);
      }
    }
  }
  return result;
}

- (int)systemPressureLevelFromPearlProjector
{
  return self->_currentSystemPressureFromProjectorTemperature;
}

- (void)updateWithPearlProjectorTemperature:(float)a3
{
  NSObject *systemPressureLevelChangedHandlerQueue;
  _QWORD v4[5];
  float v5;

  systemPressureLevelChangedHandlerQueue = self->_systemPressureLevelChangedHandlerQueue;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __71__FigCaptureSystemPressureMonitor_updateWithPearlProjectorTemperature___block_invoke;
  v4[3] = &unk_1E4920568;
  v4[4] = self;
  v5 = a3;
  dispatch_async(systemPressureLevelChangedHandlerQueue, v4);
}

uint64_t __71__FigCaptureSystemPressureMonitor_updateWithPearlProjectorTemperature___block_invoke(uint64_t a1)
{
  -[FigCaptureSystemPressureMonitor _releasePearlProjectorPollingResources](*(_QWORD *)(a1 + 32));
  return -[FigCaptureSystemPressureMonitor _updateWithPearlProjectorTemperature:](*(_QWORD *)(a1 + 32), *(float *)(a1 + 40));
}

- (uint64_t)_updateWithPearlProjectorTemperature:(uint64_t)result
{
  uint64_t v3;
  uint64_t v4;
  float *v5;
  int v7;
  unsigned int v8;
  float *v9;

  if (result)
  {
    v3 = result;
    result = _FigIsCurrentDispatchQueue();
    if (!(_DWORD)result)
    {
      fig_log_get_emitter();
      result = FigDebugAssert3();
    }
    v4 = *(int *)(v3 + 120);
    v5 = (float *)(v3 + 80 + 8 * v4);
    if (*v5 > a2 || v5[1] < a2)
    {
      v7 = *v5 <= a2 ? 1 : -1;
      v8 = v4 + v7;
      if ((v4 + v7) > 4)
        goto LABEL_17;
      do
      {
        v9 = (float *)(v3 + 80 + 8 * v8);
        if (*v9 <= a2 && v9[1] >= a2)
          break;
        v8 += v7;
      }
      while (v8 < 5);
      if (v8 != (_DWORD)v4)
      {
LABEL_17:
        *(_DWORD *)(v3 + 120) = v8;
        return -[FigCaptureSystemPressureMonitor _callChangeHandler](v3);
      }
    }
  }
  return result;
}

- (void)startMonitoringPearlProjectorTemperatureUntilNominal
{
  OS_dispatch_source *v3;
  dispatch_time_t v4;
  OpaqueCMClock *HostTimeClock;
  uint64_t v6;
  NSObject *pearlPollTimer;
  NSObject *v8;
  _QWORD v9[5];
  _QWORD handler[5];
  CMTime rhs;
  CMTime lhs;
  CMTime v13;

  if (!self->_pearlPollTimer)
  {
    v3 = (OS_dispatch_source *)dispatch_source_create(MEMORY[0x1E0C80DD0], 0, 0, (dispatch_queue_t)self->_systemPressureLevelChangedHandlerQueue);
    self->_pearlPollTimer = v3;
    v4 = dispatch_time(0, 2000000000);
    dispatch_source_set_timer((dispatch_source_t)v3, v4, 0x77359400uLL, 0xF4240uLL);
    HostTimeClock = CMClockGetHostTimeClock();
    CMClockGetTime(&lhs, HostTimeClock);
    CMTimeMake(&rhs, 60, 1);
    CMTimeAdd(&v13, &lhs, &rhs);
    self->_pollingTimerStopTime = ($95D729B680665BEAEFA1D6FCA8238556)v13;
    v6 = MEMORY[0x1E0C809B0];
    pearlPollTimer = self->_pearlPollTimer;
    handler[0] = MEMORY[0x1E0C809B0];
    handler[1] = 3221225472;
    handler[2] = __87__FigCaptureSystemPressureMonitor_startMonitoringPearlProjectorTemperatureUntilNominal__block_invoke;
    handler[3] = &unk_1E491E720;
    handler[4] = self;
    dispatch_source_set_event_handler(pearlPollTimer, handler);
    v8 = self->_pearlPollTimer;
    v9[0] = v6;
    v9[1] = 3221225472;
    v9[2] = __87__FigCaptureSystemPressureMonitor_startMonitoringPearlProjectorTemperatureUntilNominal__block_invoke_2;
    v9[3] = &unk_1E491E720;
    v9[4] = self;
    dispatch_source_set_cancel_handler(v8, v9);
    dispatch_resume((dispatch_object_t)self->_pearlPollTimer);
  }
}

void __87__FigCaptureSystemPressureMonitor_startMonitoringPearlProjectorTemperatureUntilNominal__block_invoke(uint64_t a1)
{
  float v2;
  OpaqueCMClock *HostTimeClock;
  uint64_t v4;
  CMTime v5;
  CMTime time1;
  int v7;

  v7 = 0;
  objc_msgSend(+[BWFigCaptureDeviceVendor sharedCaptureDeviceVendor](BWFigCaptureDeviceVendor, "sharedCaptureDeviceVendor"), "structuredLightProjectorStandbyTemperatureWithError:", &v7);
  if (!v7)
    -[FigCaptureSystemPressureMonitor _updateWithPearlProjectorTemperature:](*(_QWORD *)(a1 + 32), v2);
  HostTimeClock = CMClockGetHostTimeClock();
  CMClockGetTime(&time1, HostTimeClock);
  v5 = *(CMTime *)(*(_QWORD *)(a1 + 32) + 136);
  if (CMTimeCompare(&time1, &v5) >= 1)
  {
    *(_DWORD *)(*(_QWORD *)(a1 + 32) + 120) = 0;
    -[FigCaptureSystemPressureMonitor _callChangeHandler](*(_QWORD *)(a1 + 32));
  }
  v4 = *(_QWORD *)(a1 + 32);
  if (!*(_DWORD *)(v4 + 120))
    -[FigCaptureSystemPressureMonitor _releasePearlProjectorPollingResources](v4);
}

void __87__FigCaptureSystemPressureMonitor_startMonitoringPearlProjectorTemperatureUntilNominal__block_invoke_2(uint64_t a1)
{

  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 128) = 0;
}

- (int)systemPressureLevelFromImageSensorWithPortType:(id)a3
{
  return objc_msgSend((id)-[NSMutableDictionary objectForKeyedSubscript:](self->_imageSensorTemperatureMonitorByPortType, "objectForKeyedSubscript:", a3), "systemPressureLevelFromImageSensorTemperature");
}

- (void)updateWithPortType:(id)a3 imageSensorTemperature:(float)a4
{
  NSObject *systemPressureLevelChangedHandlerQueue;
  _QWORD block[6];
  float v6;

  systemPressureLevelChangedHandlerQueue = self->_systemPressureLevelChangedHandlerQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __77__FigCaptureSystemPressureMonitor_updateWithPortType_imageSensorTemperature___block_invoke;
  block[3] = &unk_1E491EEF8;
  block[4] = self;
  block[5] = a3;
  v6 = a4;
  dispatch_async(systemPressureLevelChangedHandlerQueue, block);
}

uint64_t __77__FigCaptureSystemPressureMonitor_updateWithPortType_imageSensorTemperature___block_invoke(uint64_t a1)
{
  void *v2;
  double v3;

  v2 = (void *)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 160), "objectForKeyedSubscript:", *(_QWORD *)(a1 + 40));
  LODWORD(v3) = *(_DWORD *)(a1 + 48);
  objc_msgSend(v2, "updateWithImageSensorTemperature:", v3);
  return -[FigCaptureSystemPressureMonitor _callChangeHandler](*(_QWORD *)(a1 + 32));
}

- (void)startMonitoringImageSensorTemperatureUntilNominalWithPortType:(id)a3
{
  void *v4;
  OS_dispatch_queue *systemPressureLevelChangedHandlerQueue;
  _QWORD v6[5];

  v4 = (void *)-[NSMutableDictionary objectForKeyedSubscript:](self->_imageSensorTemperatureMonitorByPortType, "objectForKeyedSubscript:", a3);
  systemPressureLevelChangedHandlerQueue = self->_systemPressureLevelChangedHandlerQueue;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __97__FigCaptureSystemPressureMonitor_startMonitoringImageSensorTemperatureUntilNominalWithPortType___block_invoke;
  v6[3] = &unk_1E491E720;
  v6[4] = self;
  objc_msgSend(v4, "startMonitoringImageSensorTemperatureUntilNominalWithQueue:changeHandler:", systemPressureLevelChangedHandlerQueue, v6);
}

uint64_t __97__FigCaptureSystemPressureMonitor_startMonitoringImageSensorTemperatureUntilNominalWithPortType___block_invoke(uint64_t a1)
{
  return -[FigCaptureSystemPressureMonitor _callChangeHandler](*(_QWORD *)(a1 + 32));
}

uint64_t __69__FigCaptureSystemPressureMonitor__registerForPeakPowerNotifications__block_invoke(uint64_t a1)
{
  return -[FigCaptureSystemPressureMonitor _updateSystemPressureForPeakPowerAndCallChangeHandler:](*(_QWORD *)(a1 + 32), 1);
}

@end
