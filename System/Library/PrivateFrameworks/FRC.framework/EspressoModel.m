@implementation EspressoModel

- (EspressoModel)initWithModelName:(id)a3 usage:(int64_t)a4
{
  EspressoModel *v4;
  EspressoModel *v5;

  v4 = self;
  if (a4 == -1)
  {
    v5 = 0;
  }
  else
  {
    self->_usage = a4;
    v4 = -[EspressoModel initWithModelName:configuration:](self, "initWithModelName:configuration:", a3, getConfigurationName(a4));
    v5 = v4;
  }

  return v5;
}

- (EspressoModel)initWithModelName:(id)a3 configuration:(const char *)a4
{
  void *v6;
  EspressoModel *v7;
  EspressoModel *v8;
  EspressoModel *v9;
  objc_super v11;

  objc_msgSend(a3, "stringByAppendingFormat:", CFSTR(".espresso.net"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v11.receiver = self;
  v11.super_class = (Class)EspressoModel;
  v7 = -[EspressoModel init](&v11, sel_init);
  v8 = v7;
  if (!v7)
    goto LABEL_6;
  if (!-[EspressoModel initContextWithFile:engine:configuration:usePreCompiled:](v7, "initContextWithFile:engine:configuration:usePreCompiled:", v6, 10007, a4, 1))
  {
    -[EspressoModel freeContext](v8, "freeContext");
    NSLog(CFSTR("Using ANE runtime compilation"));
    if (!-[EspressoModel initContextWithFile:engine:configuration:usePreCompiled:](v8, "initContextWithFile:engine:configuration:usePreCompiled:", v6, 10007, a4, 0))
    {
      NSLog(CFSTR("[EpsressoModel] Cannot load Net file %@. Configuration: %s\n"), v6, a4);
LABEL_6:
      v9 = 0;
      goto LABEL_7;
    }
  }
  v9 = v8;
LABEL_7:

  return v9;
}

- (id)initMPSWithModelName:(id)a3 usage:(int64_t)a4
{
  void *v6;
  EspressoModel *v7;
  EspressoModel *v8;
  objc_super v10;

  self->_usage = a4;
  objc_msgSend(a3, "stringByAppendingFormat:", CFSTR(".espresso.net"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v10.receiver = self;
  v10.super_class = (Class)EspressoModel;
  v7 = -[EspressoModel init](&v10, sel_init);
  if (v7
    && -[EspressoModel initContextWithFile:engine:configuration:usePreCompiled:](v7, "initContextWithFile:engine:configuration:usePreCompiled:", v6, 5, getConfigurationName(a4), 0))
  {
    v8 = v7;
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (BOOL)initContextWithFile:(id)a3 engine:(int)a4 configuration:(const char *)a5 usePreCompiled:(BOOL)a6
{
  _BOOL4 v6;
  id v10;
  OS_dispatch_queue *v11;
  OS_dispatch_queue *callbackQueue;
  void *context;
  void *plan;
  const __CFString *v15;
  BOOL v16;

  v6 = a6;
  v10 = a3;
  v11 = (OS_dispatch_queue *)dispatch_queue_create("callback queue", 0);
  callbackQueue = self->_callbackQueue;
  self->_callbackQueue = v11;

  context = (void *)espresso_create_context();
  self->_context = context;
  if (!context)
  {
    NSLog(CFSTR("[EpsressoModel] Error failed to create a context\n"));
LABEL_12:
    v16 = 0;
    goto LABEL_13;
  }
  plan = (void *)espresso_create_plan();
  self->_plan = plan;
  if (!plan)
  {
    NSLog(CFSTR("[EspressoModel] Error failed to create a plan\n"));
    goto LABEL_12;
  }
  if (v6)
    v15 = CFSTR("Networks");
  else
    v15 = CFSTR("NetworksOrig");
  if (-[EspressoModel loadModel:from:](self, "loadModel:from:", v10, v15))
    goto LABEL_12;
  if (!-[EspressoModel buildModelWithConfiguration:](self, "buildModelWithConfiguration:", a5))
  {
    NSLog(CFSTR("[EspressoModel] build failure : %@. Configuration: %s"), v10, a5);
    goto LABEL_12;
  }
  self->_engine = a4;
  v16 = 1;
LABEL_13:

  return v16;
}

- (void)freeContext
{
  OS_dispatch_queue *callbackQueue;

  if (self->_plan)
    espresso_plan_destroy();
  if (self->_context)
    espresso_context_destroy();
  self->_context = 0;
  self->_plan = 0;
  callbackQueue = self->_callbackQueue;
  self->_callbackQueue = 0;

}

- (BOOL)buildModelWithConfiguration:(const char *)a3
{
  if (a3 && espresso_network_select_configuration())
  {
    NSLog(CFSTR("Error ! Invalid configuration\n"));
    return 0;
  }
  if (espresso_plan_build())
  {
    NSLog(CFSTR("Plan Build Failed\n"));
    return 0;
  }
  return 1;
}

- (int)loadModel:(id)a3 from:(id)a4
{
  void *v5;
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  int v11;

  v5 = (void *)MEMORY[0x1E0CB34D0];
  v6 = a4;
  v7 = a3;
  objc_msgSend(v5, "bundleForClass:", objc_opt_class());
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "pathForResource:ofType:inDirectory:", v7, 0, v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    v10 = objc_retainAutorelease(v9);
    objc_msgSend(v10, "cStringUsingEncoding:", objc_msgSend(MEMORY[0x1E0CB3940], "defaultCStringEncoding"));
    v11 = espresso_plan_add_network();
  }
  else
  {
    v11 = -1;
  }

  return v11;
}

- (void)dealloc
{
  objc_super v3;

  if (self->_plan)
    espresso_plan_destroy();
  if (self->_context)
    espresso_context_destroy();
  self->_context = 0;
  self->_plan = 0;
  v3.receiver = self;
  v3.super_class = (Class)EspressoModel;
  -[EspressoModel dealloc](&v3, sel_dealloc);
}

- (BOOL)switchUsage:(int64_t)a3
{
  if (a3 == -1)
    return 0;
  if (self->_usage == a3)
    return 1;
  if (espresso_plan_build_clean())
  {
    NSLog(CFSTR("Failed to clean Plan\n"));
    return 0;
  }
  self->_usage = a3;
  return -[EspressoModel buildModelWithConfiguration:](self, "buildModelWithConfiguration:", getConfigurationName(a3));
}

- (int64_t)usage
{
  return self->_usage;
}

- (void)setUsage:(int64_t)a3
{
  self->_usage = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_callbackQueue, 0);
}

@end
