@implementation CalSignalSensor

- (CalSignalSensor)initWithSignal:(int)a3
{
  CalSignalSensor *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)CalSignalSensor;
  result = -[CalSignalSensor init](&v5, sel_init);
  if (result)
    result->_signal = a3;
  return result;
}

- (void)dealloc
{
  objc_super v3;

  -[CalSignalSensor _shutDownSource](self, "_shutDownSource");
  v3.receiver = self;
  v3.super_class = (Class)CalSignalSensor;
  -[CalSignalSensor dealloc](&v3, sel_dealloc);
}

- (id)description
{
  CalDescriptionBuilder *v3;
  void *v4;
  CalDescriptionBuilder *v5;
  CalSignalSensor *v6;
  void *v7;
  objc_super v9;

  v3 = [CalDescriptionBuilder alloc];
  v9.receiver = self;
  v9.super_class = (Class)CalSignalSensor;
  -[CalSignalSensor description](&v9, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[CalDescriptionBuilder initWithSuperclassDescription:](v3, "initWithSuperclassDescription:", v4);

  v6 = self;
  objc_sync_enter(v6);
  -[CalDescriptionBuilder setKey:withInt:](v5, "setKey:withInt:", CFSTR("signal"), -[CalSignalSensor signal](v6, "signal"));
  -[CalDescriptionBuilder setKey:withPointerAddress:](v5, "setKey:withPointerAddress:", CFSTR("source"), v6->_signalSource);
  objc_sync_exit(v6);

  -[CalDescriptionBuilder build](v5, "build");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (void)startSensor
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_1_0(&dword_18FC12000, v0, v1, "Signal sensor already started.  Will not start.  Sensor: [%@]", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

void __30__CalSignalSensor_startSensor__block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;

  +[CalFoundationLogSubsystem defaultCategory](CalFoundationLogSubsystem, "defaultCategory");
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
    __30__CalSignalSensor_startSensor__block_invoke_cold_1(a1, v2, v3, v4, v5, v6, v7, v8);

  objc_msgSend(*(id *)(a1 + 32), "fireBlock");
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = (void *)v9;
  if (v9)
    (*(void (**)(uint64_t, _QWORD))(v9 + 16))(v9, *(_QWORD *)(a1 + 32));

}

- (void)stopSensor
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_1_0(&dword_18FC12000, v0, v1, "Stopped signal sensor: [%@]", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

- (void)_shutDownSource
{
  NSObject *signalSource;
  OS_dispatch_source *v4;

  signalSource = self->_signalSource;
  if (signalSource)
  {
    dispatch_source_cancel(signalSource);
    v4 = self->_signalSource;
    self->_signalSource = 0;

  }
}

- (int)signal
{
  return self->_signal;
}

- (void)setSignal:(int)a3
{
  self->_signal = a3;
}

- (id)fireBlock
{
  return self->_fireBlock;
}

- (void)setFireBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_fireBlock, 0);
  objc_storeStrong((id *)&self->_signalSource, 0);
}

void __30__CalSignalSensor_startSensor__block_invoke_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1_0(&dword_18FC12000, a2, a3, "Received signal: [%lu]", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_4();
}

@end
