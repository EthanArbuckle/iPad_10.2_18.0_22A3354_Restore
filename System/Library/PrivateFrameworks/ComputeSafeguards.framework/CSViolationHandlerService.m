@implementation CSViolationHandlerService

+ (void)run
{
  if (run_onceToken != -1)
    dispatch_once(&run_onceToken, &__block_literal_global_1);
}

void __32__CSViolationHandlerService_run__block_invoke()
{
  id v0;

  +[CSViolationHandlerService _sharedInstance](CSViolationHandlerService, "_sharedInstance");
  v0 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "_start");

}

+ (id)_sharedInstance
{
  if (_sharedInstance_onceToken != -1)
    dispatch_once(&_sharedInstance_onceToken, &__block_literal_global_2);
  return (id)_sharedInstance___sharedInstance;
}

void __44__CSViolationHandlerService__sharedInstance__block_invoke()
{
  id v0;
  void *v1;

  v0 = -[CSViolationHandlerService _init]([CSViolationHandlerService alloc], "_init");
  v1 = (void *)_sharedInstance___sharedInstance;
  _sharedInstance___sharedInstance = (uint64_t)v0;

}

- (id)_init
{
  CSViolationHandlerService *v2;
  uint64_t v3;
  OS_os_log *logger;
  NSObject *v5;
  dispatch_queue_t v6;
  OS_dispatch_queue *queue;
  CSViolationHandlerService *v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)CSViolationHandlerService;
  v2 = -[CSViolationHandlerService initWithMachServiceName:](&v10, sel_initWithMachServiceName_, CFSTR("com.apple.computesafeguards.violationhandler"));
  if (v2)
  {
    +[CSLogger logForCategory:](CSLogger, "logForCategory:", CFSTR("ViolationHandler"));
    v3 = objc_claimAutoreleasedReturnValue();
    logger = v2->_logger;
    v2->_logger = (OS_os_log *)v3;

    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = dispatch_queue_create("com.apple.computesafeguards.violationhandler", v5);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v6;

    -[CSViolationHandlerService setDelegate:](v2, "setDelegate:", v2);
    -[CSViolationHandlerService initializeHandlers](v2, "initializeHandlers");
    v8 = v2;
  }

  return v2;
}

- (void)_start
{
  NSObject *logger;
  uint8_t v4[16];

  logger = self->_logger;
  if (os_log_type_enabled(logger, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_2383F5000, logger, OS_LOG_TYPE_INFO, "Started CSViolationHandlerService", v4, 2u);
  }
  -[CSViolationHandlerService activate](self, "activate");
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v5;
  void *v6;
  NSObject *logger;
  NSObject *v8;
  _DWORD v10[2];
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  v5 = a4;
  objc_msgSend(MEMORY[0x24BDD1990], "interfaceWithProtocol:", &unk_256908510);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setExportedInterface:", v6);

  objc_msgSend(v5, "setExportedObject:", self);
  logger = self->_logger;
  if (os_log_type_enabled(logger, OS_LOG_TYPE_INFO))
  {
    v8 = logger;
    v10[0] = 67109120;
    v10[1] = objc_msgSend(v5, "processIdentifier");
    _os_log_impl(&dword_2383F5000, v8, OS_LOG_TYPE_INFO, "Accepted new connection from pid %d", (uint8_t *)v10, 8u);

  }
  objc_msgSend(v5, "resume");

  return 1;
}

- (void)initializeHandlers
{
  CSExcessiveCPUViolationHandler *v3;
  CSExcessiveCPUViolationHandler *cpuViolationHandler;

  +[CSExcessiveCPUViolationHandler sharedInstance](CSExcessiveCPUViolationHandler, "sharedInstance");
  v3 = (CSExcessiveCPUViolationHandler *)objc_claimAutoreleasedReturnValue();
  cpuViolationHandler = self->_cpuViolationHandler;
  self->_cpuViolationHandler = v3;

}

- (void)reportExcessiveCPUUseBy:(id)a3 pid:(unint64_t)a4 path:(id)a5 endTime:(mach_timespec)a6 observedValue:(int64_t)a7 observationWindow:(int64_t)a8 limitValue:(int64_t)a9 limitWindow:(int64_t)a10 fatal:(BOOL)a11
{
  id v16;
  id v17;
  NSObject *logger;
  uint64_t v19;
  uint8_t buf[4];
  id v22;
  __int16 v23;
  unint64_t v24;
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  v16 = a3;
  v17 = a5;
  logger = self->_logger;
  if (os_log_type_enabled(logger, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412546;
    v22 = v16;
    v23 = 2048;
    v24 = a4;
    _os_log_impl(&dword_2383F5000, logger, OS_LOG_TYPE_INFO, "Received CPU violation for process: %@, pid: %llu.", buf, 0x16u);
  }
  LOBYTE(v19) = a11;
  -[CSExcessiveCPUViolationHandler handleViolationByProcess:pid:path:endTime:observedValue:observationWindow:limitValue:limitWindow:fatal:](self->_cpuViolationHandler, "handleViolationByProcess:pid:path:endTime:observedValue:observationWindow:limitValue:limitWindow:fatal:", v16, a4, v17, a6, a7, a8, a9, a10, v19);

}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
  objc_storeStrong((id *)&self->_queue, a3);
}

- (OS_os_log)logger
{
  return self->_logger;
}

- (void)setLogger:(id)a3
{
  objc_storeStrong((id *)&self->_logger, a3);
}

- (CSExcessiveCPUViolationHandler)cpuViolationHandler
{
  return self->_cpuViolationHandler;
}

- (void)setCpuViolationHandler:(id)a3
{
  objc_storeStrong((id *)&self->_cpuViolationHandler, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cpuViolationHandler, 0);
  objc_storeStrong((id *)&self->_logger, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

@end
