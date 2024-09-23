@implementation TDLogger

+ (id)logger
{
  return objc_alloc_init((Class)a1);
}

- (TDLogger)init
{
  TDLogger *v2;
  TDLogger *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)TDLogger;
  v2 = -[TDLogger init](&v5, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_verbosity = 1;
    if (getenv("CoreUI_LogDistill"))
      v3->_verbosity = 3;
    else
      v3->_loggingQueue = (OS_dispatch_queue *)dispatch_queue_create("com.apple.CoreThemeDefinition.logger", 0);
  }
  return v3;
}

+ (id)defaultLogger
{
  if (defaultLogger_onceToken != -1)
    dispatch_once(&defaultLogger_onceToken, &__block_literal_global_6);
  return (id)defaultLogger_instance;
}

TDLogger *__25__TDLogger_defaultLogger__block_invoke()
{
  TDLogger *result;

  result = objc_alloc_init(TDLogger);
  defaultLogger_instance = (uint64_t)result;
  return result;
}

- (void)setVerbosity:(int)a3
{
  if (self->_verbosity != a3)
    self->_verbosity = a3;
}

- (int)verbosity
{
  if (self->_logMaxVerbosity)
    return 3;
  else
    return self->_verbosity;
}

- (void)dealloc
{
  NSObject *loggingQueue;
  objc_super v4;

  loggingQueue = self->_loggingQueue;
  if (loggingQueue)
    dispatch_release(loggingQueue);
  v4.receiver = self;
  v4.super_class = (Class)TDLogger;
  -[TDLogger dealloc](&v4, sel_dealloc);
}

- (void)logMessage:(id)a3 whenVerbosity:(int)a4
{
  NSObject *loggingQueue;
  _QWORD block[5];

  if (-[TDLogger verbosity](self, "verbosity") >= a4)
  {
    loggingQueue = self->_loggingQueue;
    if (loggingQueue)
    {
      block[0] = MEMORY[0x24BDAC760];
      block[1] = 3221225472;
      block[2] = __37__TDLogger_logMessage_whenVerbosity___block_invoke;
      block[3] = &unk_24EF2C6D0;
      block[4] = a3;
      dispatch_async(loggingQueue, block);
    }
    else
    {
      NSLog(CFSTR("Distill: %@"), a3);
    }
  }
}

uint64_t __37__TDLogger_logMessage_whenVerbosity___block_invoke(uint64_t a1)
{
  return puts((const char *)objc_msgSend(*(id *)(a1 + 32), "UTF8String"));
}

- (void)logExtra:(id)a3
{
  -[TDLogger logMessage:whenVerbosity:](self, "logMessage:whenVerbosity:", a3, 3);
}

- (void)logInfo:(id)a3
{
  -[TDLogger logMessage:whenVerbosity:](self, "logMessage:whenVerbosity:", a3, 2);
}

- (void)logWarning:(id)a3
{
  -[TDLogger logMessage:whenVerbosity:](self, "logMessage:whenVerbosity:", a3, 1);
}

- (void)logError:(id)a3
{
  -[TDLogger logMessage:whenVerbosity:](self, "logMessage:whenVerbosity:", a3, 0);
}

- (void)logExtraWithFormat:(id)a3
{
  void *v4;
  uint64_t v5;

  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithFormat:arguments:", a3, &v5);
  -[TDLogger logExtra:](self, "logExtra:", v4);

}

- (void)logInfoWithFormat:(id)a3
{
  void *v4;
  uint64_t v5;

  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithFormat:arguments:", a3, &v5);
  -[TDLogger logInfo:](self, "logInfo:", v4);

}

- (void)logWarningWithFormat:(id)a3
{
  void *v4;
  uint64_t v5;

  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithFormat:arguments:", a3, &v5);
  -[TDLogger logWarning:](self, "logWarning:", v4);

}

- (void)logErrorWithFormat:(id)a3
{
  void *v4;
  uint64_t v5;

  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithFormat:arguments:", a3, &v5);
  -[TDLogger logError:](self, "logError:", v4);

}

- (BOOL)isVerbosityLogErrorsOnly
{
  return self->_logMaxVerbosity != 1 && -[TDLogger verbosity](self, "verbosity") == 0;
}

- (BOOL)isVerbosityLogWarningsAndErrors
{
  return self->_logMaxVerbosity != 1 && -[TDLogger verbosity](self, "verbosity") == 1;
}

- (BOOL)isVerbosityLogEverything
{
  return self->_logMaxVerbosity == 1 || -[TDLogger verbosity](self, "verbosity") == 3;
}

- (void)waitForLoggingToComplete
{
  NSObject *loggingQueue;

  loggingQueue = self->_loggingQueue;
  if (loggingQueue)
    dispatch_sync(loggingQueue, &__block_literal_global_8);
}

@end
