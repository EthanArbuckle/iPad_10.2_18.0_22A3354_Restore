@implementation WFGreenTeaLogger

- (WFGreenTeaLogger)init
{
  WFGreenTeaLogger *v2;
  WFGreenTeaLogger *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)WFGreenTeaLogger;
  v2 = -[WFGreenTeaLogger init](&v5, sel_init);
  if (v2)
  {
    v2->_logger = (ct_green_tea_logger_s *)ct_green_tea_logger_create();
    v3 = v2;
  }

  return v2;
}

- (void)dealloc
{
  objc_super v3;

  ct_green_tea_logger_destroy();
  v3.receiver = self;
  v3.super_class = (Class)WFGreenTeaLogger;
  -[WFGreenTeaLogger dealloc](&v3, sel_dealloc);
}

- (void)log:(id)a3
{
  id v4;
  NSObject *v5;
  NSObject *v6;
  int v7;
  id v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[WFGreenTeaLogger logger](self, "logger");
  getCTGreenTeaOsLogHandle();
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5 && os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    v7 = 138543362;
    v8 = v4;
    _os_log_impl(&dword_20BBAD000, v6, OS_LOG_TYPE_INFO, "%{public}@", (uint8_t *)&v7, 0xCu);
  }

}

- (ct_green_tea_logger_s)logger
{
  return self->_logger;
}

+ (id)sharedLogger
{
  if (sharedLogger_onceToken != -1)
    dispatch_once(&sharedLogger_onceToken, &__block_literal_global_3656);
  return (id)sharedLogger_sharedLogger;
}

+ (void)log:(id)a3
{
  id v3;
  id v4;

  v3 = a3;
  +[WFGreenTeaLogger sharedLogger](WFGreenTeaLogger, "sharedLogger");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "log:", v3);

}

void __32__WFGreenTeaLogger_sharedLogger__block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = objc_opt_new();
  v1 = (void *)sharedLogger_sharedLogger;
  sharedLogger_sharedLogger = v0;

}

@end
