@implementation AVNewsWidgetPlayerBehavior

- (AVNewsWidgetPlayerBehavior)init
{
  AVNewsWidgetPlayerBehavior *v2;
  NSObject *v3;
  objc_class *v4;
  void *v5;
  objc_super v7;
  uint8_t buf[4];
  const char *v9;
  __int16 v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v7.receiver = self;
  v7.super_class = (Class)AVNewsWidgetPlayerBehavior;
  v2 = -[AVNewsWidgetPlayerBehavior init](&v7, sel_init);
  _AVLog();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4 = (objc_class *)objc_opt_class();
    NSStringFromClass(v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 136315394;
    v9 = "-[AVNewsWidgetPlayerBehavior init]";
    v10 = 2112;
    v11 = v5;
    _os_log_impl(&dword_1AC4B1000, v3, OS_LOG_TYPE_DEFAULT, "%s subclass: %@", buf, 0x16u);

  }
  return v2;
}

- (void)dealloc
{
  NSObject *v3;
  objc_super v4;
  uint8_t buf[4];
  const char *v6;
  __int16 v7;
  int v8;
  __int16 v9;
  AVNewsWidgetPlayerBehavior *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  _AVLog();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315650;
    v6 = "-[AVNewsWidgetPlayerBehavior dealloc]";
    v7 = 1024;
    v8 = 40;
    v9 = 2048;
    v10 = self;
    _os_log_impl(&dword_1AC4B1000, v3, OS_LOG_TYPE_DEFAULT, "%s %d %p", buf, 0x1Cu);
  }

  v4.receiver = self;
  v4.super_class = (Class)AVNewsWidgetPlayerBehavior;
  -[AVNewsWidgetPlayerBehavior dealloc](&v4, sel_dealloc);
}

- (id)playerForContentTransitionType:(int64_t)a3
{
  return 0;
}

- (AVNewsWidgetPlayerBehaviorContext)behaviorContext
{
  return (AVNewsWidgetPlayerBehaviorContext *)objc_loadWeakRetained((id *)&self->_behaviorContext);
}

- (void)setBehaviorContext:(id)a3
{
  objc_storeWeak((id *)&self->_behaviorContext, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_behaviorContext);
}

+ (Class)behaviorContextClass
{
  return (Class)objc_opt_class();
}

@end
