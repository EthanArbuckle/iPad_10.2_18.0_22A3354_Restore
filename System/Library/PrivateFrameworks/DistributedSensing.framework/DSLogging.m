@implementation DSLogging

+ (id)sharedInstance
{
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __27__DSLogging_sharedInstance__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedInstance_onceToken_0 != -1)
    dispatch_once(&sharedInstance_onceToken_0, block);
  return (id)sharedInstance_Obj;
}

void __27__DSLogging_sharedInstance__block_invoke(uint64_t a1)
{
  id v1;
  void *v2;

  v1 = objc_alloc_init(*(Class *)(a1 + 32));
  v2 = (void *)sharedInstance_Obj;
  sharedInstance_Obj = (uint64_t)v1;

}

- (DSLogging)init
{
  DSLogging *v2;
  os_log_t v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)DSLogging;
  v2 = -[DSLogging init](&v5, sel_init);
  if (v2)
  {
    v3 = os_log_create("com.apple.distributedsensing", "SpatialAudio");
    -[DSLogging setDsLogger:](v2, "setDsLogger:", v3);

  }
  return v2;
}

- (OS_os_log)dsLogger
{
  return self->_dsLogger;
}

- (void)setDsLogger:(id)a3
{
  objc_storeStrong((id *)&self->_dsLogger, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dsLogger, 0);
}

@end
