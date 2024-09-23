@implementation TKPowerMonitor

- (TKPowerMonitor)init
{
  TKPowerMonitor *v2;
  TKPowerMonitor *v3;
  dispatch_queue_t v4;
  OS_dispatch_queue *queue;
  NSObject *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)TKPowerMonitor;
  v2 = -[TKPowerMonitor init](&v8, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_awaken = 1;
    v4 = dispatch_queue_create("com.apple.ctk.pmon", 0);
    queue = v3->_queue;
    v3->_queue = (OS_dispatch_queue *)v4;

    TK_LOG_token_0();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
      -[TKPowerMonitor init].cold.1();

  }
  return v3;
}

+ (id)defaultMonitor
{
  if (defaultMonitor_onceToken != -1)
    dispatch_once(&defaultMonitor_onceToken, &__block_literal_global_5);
  return (id)defaultMonitor_monitor;
}

void __32__TKPowerMonitor_defaultMonitor__block_invoke()
{
  TKPowerMonitor *v0;
  void *v1;

  v0 = objc_alloc_init(TKPowerMonitor);
  v1 = (void *)defaultMonitor_monitor;
  defaultMonitor_monitor = (uint64_t)v0;

}

- (unsigned)kernelPort
{
  return self->_kernelPort;
}

- (void)setKernelPort:(unsigned int)a3
{
  self->_kernelPort = a3;
}

- (BOOL)awaken
{
  return self->_awaken;
}

- (void)setAwaken:(BOOL)a3
{
  self->_awaken = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
}

- (void)init
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_3(&dword_1B9768000, v0, v1, "port for pm notifications registered", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_8();
}

@end
