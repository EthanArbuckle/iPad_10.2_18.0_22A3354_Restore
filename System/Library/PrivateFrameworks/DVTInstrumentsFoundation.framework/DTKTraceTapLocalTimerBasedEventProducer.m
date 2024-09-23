@implementation DTKTraceTapLocalTimerBasedEventProducer

+ (BOOL)supportsConfig:(id)a3
{
  id v3;
  char v4;
  _QWORD v6[5];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  char v10;

  v3 = a3;
  v7 = 0;
  v8 = &v7;
  v9 = 0x2020000000;
  v10 = 0;
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = sub_222B8DE84;
  v6[3] = &unk_24EB295F0;
  v6[4] = &v7;
  objc_msgSend(v3, "enumerateTriggerConfigs:", v6);
  v4 = *((_BYTE *)v8 + 24);
  _Block_object_dispose(&v7, 8);

  return v4;
}

- (DTKTraceTapLocalTimerBasedEventProducer)init
{
  DTKTraceTapLocalTimerBasedEventProducer *v2;
  void *v3;
  dispatch_queue_t v4;
  OS_dispatch_queue *workQueue;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)DTKTraceTapLocalTimerBasedEventProducer;
  v2 = -[DTKTraceTapLocalTimerBasedEventProducer init](&v7, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x24BDD1760], "processInfo");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v2->_currentThermalState = objc_msgSend(v3, "thermalState");

    v4 = dispatch_queue_create("com.apple.dt.instruments.ktrace.localeventproducer", 0);
    workQueue = v2->_workQueue;
    v2->_workQueue = (OS_dispatch_queue *)v4;

    notify_register_check("com.apple.Metal.AGXEnableOSSignposts", &v2->_token);
  }
  return v2;
}

- (void)dealloc
{
  NSObject *timer;
  OS_dispatch_source *v4;
  objc_super v5;

  timer = self->_timer;
  if (timer)
  {
    dispatch_source_cancel(timer);
    v4 = self->_timer;
    self->_timer = 0;

  }
  v5.receiver = self;
  v5.super_class = (Class)DTKTraceTapLocalTimerBasedEventProducer;
  -[DTKTraceTapLocalTimerBasedEventProducer dealloc](&v5, sel_dealloc);
}

- (unint64_t)_processInfoThermalStateToCLTMPressureLevel:(int64_t)a3
{
  if ((unint64_t)(a3 - 1) >= 3)
    return 0;
  else
    return 10 * (a3 - 1) + 10;
}

- (void)_emitThermalState:(int64_t)a3 currentState:(int64_t)a4
{
  -[DTKTraceTapLocalTimerBasedEventProducer _processInfoThermalStateToCLTMPressureLevel:](self, "_processInfoThermalStateToCLTMPressureLevel:", a3);
  -[DTKTraceTapLocalTimerBasedEventProducer _processInfoThermalStateToCLTMPressureLevel:](self, "_processInfoThermalStateToCLTMPressureLevel:", a4);
  kdebug_trace();
  MEMORY[0x24BEDD108](MEMORY[0x24BE18E50], sel_logSignpostWithConditionStates);
}

- (void)start
{
  OS_dispatch_source *v3;
  OS_dispatch_source *timer;
  NSObject *v5;
  dispatch_time_t v6;
  NSObject *v7;
  _QWORD v8[4];
  id v9;
  id location;

  v3 = (OS_dispatch_source *)dispatch_source_create(MEMORY[0x24BDACA18], 0, 0, (dispatch_queue_t)self->_workQueue);
  timer = self->_timer;
  self->_timer = v3;

  v5 = self->_timer;
  v6 = dispatch_time(0, 100000000);
  dispatch_source_set_timer(v5, v6, 0x5F5E100uLL, 0xBEBC200uLL);
  objc_initWeak(&location, self);
  v7 = self->_timer;
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = sub_222B8E158;
  v8[3] = &unk_24EB28000;
  objc_copyWeak(&v9, &location);
  dispatch_source_set_event_handler(v7, v8);
  dispatch_resume((dispatch_object_t)self->_timer);
  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

- (void)stop
{
  void *v3;
  uint64_t v4;
  NSObject *timer;
  OS_dispatch_source *v6;

  objc_msgSend(MEMORY[0x24BDD1760], "processInfo");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "thermalState");

  -[DTKTraceTapLocalTimerBasedEventProducer _emitThermalState:currentState:](self, "_emitThermalState:currentState:", v4, v4);
  timer = self->_timer;
  if (timer)
  {
    dispatch_source_cancel(timer);
    v6 = self->_timer;
    self->_timer = 0;

  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_timer, 0);
  objc_storeStrong((id *)&self->_workQueue, 0);
}

@end
