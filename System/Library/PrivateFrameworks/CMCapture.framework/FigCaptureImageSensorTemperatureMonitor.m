@implementation FigCaptureImageSensorTemperatureMonitor

- (int)systemPressureLevelFromImageSensorTemperature
{
  return self->_currentSystemPressureFromImageSensorTemperature;
}

+ (void)initialize
{
  objc_opt_class();
}

- (FigCaptureImageSensorTemperatureMonitor)initWithPortType:(id)a3 sensorThermalLevelsByTemperature:(id)a4
{
  FigCaptureImageSensorTemperatureMonitor *v6;
  float v7;
  float v8;
  float v9;
  float v10;
  float v11;
  float v12;
  float v13;
  float v14;
  float v15;
  float v16;
  float v17;
  float v18;
  float v19;
  float v20;
  uint64_t v21;
  float v22;
  unsigned int i;
  float min;
  objc_super v26;

  v26.receiver = self;
  v26.super_class = (Class)FigCaptureImageSensorTemperatureMonitor;
  v6 = -[FigCaptureImageSensorTemperatureMonitor init](&v26, sel_init);
  if (v6)
  {
    if (a3 && a4)
    {
      v6->_portType = (NSString *)a3;
      objc_msgSend((id)objc_msgSend((id)objc_msgSend(a4, "objectForKeyedSubscript:", CFSTR("Nominal")), "objectForKeyedSubscript:", CFSTR("Min")), "floatValue");
      v8 = v7;
      objc_msgSend((id)objc_msgSend((id)objc_msgSend(a4, "objectForKeyedSubscript:", CFSTR("Nominal")), "objectForKeyedSubscript:", CFSTR("Max")), "floatValue");
      v6->_systemPressureLevelByImageSensorTemperature[0].min = v8;
      v6->_systemPressureLevelByImageSensorTemperature[0].max = v9;
      objc_msgSend((id)objc_msgSend((id)objc_msgSend(a4, "objectForKeyedSubscript:", CFSTR("Fair")), "objectForKeyedSubscript:", CFSTR("Min")), "floatValue");
      v11 = v10;
      objc_msgSend((id)objc_msgSend((id)objc_msgSend(a4, "objectForKeyedSubscript:", CFSTR("Fair")), "objectForKeyedSubscript:", CFSTR("Max")), "floatValue");
      v6->_systemPressureLevelByImageSensorTemperature[1].min = v11;
      v6->_systemPressureLevelByImageSensorTemperature[1].max = v12;
      objc_msgSend((id)objc_msgSend((id)objc_msgSend(a4, "objectForKeyedSubscript:", CFSTR("Serious")), "objectForKeyedSubscript:", CFSTR("Min")), "floatValue");
      v14 = v13;
      objc_msgSend((id)objc_msgSend((id)objc_msgSend(a4, "objectForKeyedSubscript:", CFSTR("Serious")), "objectForKeyedSubscript:", CFSTR("Max")), "floatValue");
      v6->_systemPressureLevelByImageSensorTemperature[2].min = v14;
      v6->_systemPressureLevelByImageSensorTemperature[2].max = v15;
      objc_msgSend((id)objc_msgSend((id)objc_msgSend(a4, "objectForKeyedSubscript:", CFSTR("Critical")), "objectForKeyedSubscript:", CFSTR("Min")), "floatValue");
      v17 = v16;
      objc_msgSend((id)objc_msgSend((id)objc_msgSend(a4, "objectForKeyedSubscript:", CFSTR("Critical")), "objectForKeyedSubscript:", CFSTR("Max")), "floatValue");
      v6->_systemPressureLevelByImageSensorTemperature[3].min = v17;
      v6->_systemPressureLevelByImageSensorTemperature[3].max = v18;
      objc_msgSend((id)objc_msgSend((id)objc_msgSend(a4, "objectForKeyedSubscript:", CFSTR("Shutdown")), "objectForKeyedSubscript:", CFSTR("Min")), "floatValue");
      v20 = v19;
      objc_msgSend((id)objc_msgSend((id)objc_msgSend(a4, "objectForKeyedSubscript:", CFSTR("Shutdown")), "objectForKeyedSubscript:", CFSTR("Max")), "floatValue");
      v21 = 0;
      v6->_systemPressureLevelByImageSensorTemperature[4].min = v20;
      v6->_systemPressureLevelByImageSensorTemperature[4].max = v22;
      for (i = -1; ; ++i)
      {
        min = v6->_systemPressureLevelByImageSensorTemperature[v21].min;
        if (min >= v6->_systemPressureLevelByImageSensorTemperature[v21].max
          || v21 * 8 && v6->_systemPressureLevelByImageSensorTemperature[i].max <= min)
        {
          break;
        }
        if (++v21 == 5)
          return v6;
      }
    }
    else
    {
      fig_log_get_emitter();
      FigDebugAssert3();
    }

    return 0;
  }
  return v6;
}

- (void)dealloc
{
  NSObject *nominalImageSensorTemperatureMonitorTimer;
  objc_super v4;

  if (self)
  {
    nominalImageSensorTemperatureMonitorTimer = self->_nominalImageSensorTemperatureMonitorTimer;
    if (nominalImageSensorTemperatureMonitorTimer)
      dispatch_source_cancel(nominalImageSensorTemperatureMonitorTimer);
  }

  v4.receiver = self;
  v4.super_class = (Class)FigCaptureImageSensorTemperatureMonitor;
  -[FigCaptureImageSensorTemperatureMonitor dealloc](&v4, sel_dealloc);
}

- (void)updateWithImageSensorTemperature:(float)a3
{
  NSObject *nominalImageSensorTemperatureMonitorTimer;
  uint64_t currentSystemPressureFromImageSensorTemperature;
  $251C2428A496074035CACA7AAF3D55BD *v7;
  int v9;
  unsigned int v10;
  $251C2428A496074035CACA7AAF3D55BD *v11;

  if (self)
  {
    nominalImageSensorTemperatureMonitorTimer = self->_nominalImageSensorTemperatureMonitorTimer;
    if (nominalImageSensorTemperatureMonitorTimer)
      dispatch_source_cancel(nominalImageSensorTemperatureMonitorTimer);
  }
  currentSystemPressureFromImageSensorTemperature = self->_currentSystemPressureFromImageSensorTemperature;
  v7 = &self->_systemPressureLevelByImageSensorTemperature[currentSystemPressureFromImageSensorTemperature];
  if (v7->min > a3 || v7->max < a3)
  {
    v9 = v7->min <= a3 ? 1 : -1;
    v10 = currentSystemPressureFromImageSensorTemperature + v9;
    if ((currentSystemPressureFromImageSensorTemperature + v9) > 4)
      goto LABEL_17;
    do
    {
      v11 = &self->_systemPressureLevelByImageSensorTemperature[v10];
      if (v11->min <= a3 && v11->max >= a3)
        break;
      v10 += v9;
    }
    while (v10 < 5);
    if (v10 != (_DWORD)currentSystemPressureFromImageSensorTemperature)
LABEL_17:
      self->_currentSystemPressureFromImageSensorTemperature = v10;
  }
}

- (void)startMonitoringImageSensorTemperatureUntilNominalWithQueue:(id)a3 changeHandler:(id)a4
{
  OS_dispatch_source *v6;
  dispatch_time_t v7;
  NSObject *nominalImageSensorTemperatureMonitorTimer;
  uint64_t v9;
  NSObject *v10;
  _QWORD v11[6];
  _QWORD handler[6];
  _QWORD v13[5];
  uint64_t v14;

  if (!self->_nominalImageSensorTemperatureMonitorTimer)
  {
    v13[0] = 0;
    v13[1] = v13;
    v13[2] = 0x3052000000;
    v13[3] = __Block_byref_object_copy__40;
    v13[4] = __Block_byref_object_dispose__40;
    v14 = 0;
    v14 = objc_msgSend(a4, "copy");
    v6 = (OS_dispatch_source *)dispatch_source_create(MEMORY[0x1E0C80DD0], 0, 0, (dispatch_queue_t)a3);
    self->_nominalImageSensorTemperatureMonitorTimer = v6;
    v7 = dispatch_time(0, 30000000000);
    dispatch_source_set_timer((dispatch_source_t)v6, v7, 0x6FC23AC00uLL, 0xF4240uLL);
    nominalImageSensorTemperatureMonitorTimer = self->_nominalImageSensorTemperatureMonitorTimer;
    v9 = MEMORY[0x1E0C809B0];
    handler[0] = MEMORY[0x1E0C809B0];
    handler[1] = 3221225472;
    handler[2] = __116__FigCaptureImageSensorTemperatureMonitor_startMonitoringImageSensorTemperatureUntilNominalWithQueue_changeHandler___block_invoke;
    handler[3] = &unk_1E491F1A0;
    handler[4] = self;
    handler[5] = v13;
    dispatch_source_set_event_handler(nominalImageSensorTemperatureMonitorTimer, handler);
    v10 = self->_nominalImageSensorTemperatureMonitorTimer;
    v11[0] = v9;
    v11[1] = 3221225472;
    v11[2] = __116__FigCaptureImageSensorTemperatureMonitor_startMonitoringImageSensorTemperatureUntilNominalWithQueue_changeHandler___block_invoke_2;
    v11[3] = &unk_1E491E9A8;
    v11[4] = self;
    v11[5] = v13;
    dispatch_source_set_cancel_handler(v10, v11);
    dispatch_resume((dispatch_object_t)self->_nominalImageSensorTemperatureMonitorTimer);
    _Block_object_dispose(v13, 8);
  }
}

void __116__FigCaptureImageSensorTemperatureMonitor_startMonitoringImageSensorTemperatureUntilNominalWithQueue_changeHandler___block_invoke(uint64_t a1)
{
  uint64_t v2;
  NSObject *v3;

  *(_DWORD *)(*(_QWORD *)(a1 + 32) + 56) = 0;
  (*(void (**)(void))(*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40) + 16))();
  v2 = *(_QWORD *)(a1 + 32);
  if (v2)
  {
    v3 = *(NSObject **)(v2 + 64);
    if (v3)
      dispatch_source_cancel(v3);
  }
}

void __116__FigCaptureImageSensorTemperatureMonitor_startMonitoringImageSensorTemperatureUntilNominalWithQueue_changeHandler___block_invoke_2(uint64_t a1)
{

  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40) = 0;
  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 64) = 0;
}

@end
