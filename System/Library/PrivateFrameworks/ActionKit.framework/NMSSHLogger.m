@implementation NMSSHLogger

- (void)log:(id)a3 level:(unint64_t)a4 flag:(unint64_t)a5
{
  id v8;
  void *v9;
  NSObject *v10;
  _QWORD block[5];
  id v12;
  unint64_t v13;

  v8 = a3;
  if ((-[NMSSHLogger logLevel](self, "logLevel") & a5) != 0)
  {
    if (-[NMSSHLogger isEnabled](self, "isEnabled"))
    {
      -[NMSSHLogger logBlock](self, "logBlock");
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      if (v9)
      {
        -[NMSSHLogger loggerQueue](self, "loggerQueue");
        v10 = objc_claimAutoreleasedReturnValue();
        block[0] = MEMORY[0x24BDAC760];
        block[1] = 3221225472;
        block[2] = __30__NMSSHLogger_log_level_flag___block_invoke;
        block[3] = &unk_24F8B9F78;
        block[4] = self;
        v13 = a4;
        v12 = v8;
        dispatch_async(v10, block);

      }
    }
  }

}

- (void)logVerbose:(id)a3
{
  -[NMSSHLogger log:level:flag:](self, "log:level:flag:", a3, 15, 1);
}

- (void)logInfo:(id)a3
{
  -[NMSSHLogger log:level:flag:](self, "log:level:flag:", a3, 14, 2);
}

- (void)logWarn:(id)a3
{
  -[NMSSHLogger log:level:flag:](self, "log:level:flag:", a3, 12, 4);
}

- (void)logError:(id)a3
{
  -[NMSSHLogger log:level:flag:](self, "log:level:flag:", a3, 8, 8);
}

- (id)logBlock
{
  return self->_logBlock;
}

- (void)setLogBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (unint64_t)logLevel
{
  return self->_logLevel;
}

- (void)setLogLevel:(unint64_t)a3
{
  self->_logLevel = a3;
}

- (BOOL)isEnabled
{
  return self->_enabled;
}

- (void)setEnabled:(BOOL)a3
{
  self->_enabled = a3;
}

- (OS_dispatch_queue)loggerQueue
{
  return self->_loggerQueue;
}

- (void)setLoggerQueue:(id)a3
{
  objc_storeStrong((id *)&self->_loggerQueue, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_loggerQueue, 0);
  objc_storeStrong(&self->_logBlock, 0);
}

void __30__NMSSHLogger_log_level_flag___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void (**v4)(id, _QWORD, void *);

  objc_msgSend(*(id *)(a1 + 32), "logBlock");
  v4 = (void (**)(id, _QWORD, void *))objc_claimAutoreleasedReturnValue();
  v2 = *(_QWORD *)(a1 + 48);
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("NMSSH: %@"), *(_QWORD *)(a1 + 40));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4[2](v4, v2, v3);

}

+ (id)logger
{
  if (logger_onceToken != -1)
    dispatch_once(&logger_onceToken, &__block_literal_global_45165);
  return (id)logger_logger;
}

+ (id)sharedLogger
{
  return +[NMSSHLogger logger](NMSSHLogger, "logger");
}

void __21__NMSSHLogger_logger__block_invoke()
{
  NMSSHLogger *v0;
  void *v1;
  void *v2;
  dispatch_queue_t v3;

  v0 = objc_alloc_init(NMSSHLogger);
  v1 = (void *)logger_logger;
  logger_logger = (uint64_t)v0;

  objc_msgSend((id)logger_logger, "setEnabled:", 1);
  objc_msgSend((id)logger_logger, "setLogLevel:", 15);
  objc_msgSend((id)logger_logger, "setLogBlock:", &__block_literal_global_2);
  v2 = (void *)logger_logger;
  v3 = dispatch_queue_create("NMSSH.loggerQueue", 0);
  objc_msgSend(v2, "setLoggerQueue:", v3);

}

void __21__NMSSHLogger_logger__block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  NSLog(CFSTR("%@"), a3);
}

@end
