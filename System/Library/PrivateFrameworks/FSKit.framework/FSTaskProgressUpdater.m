@implementation FSTaskProgressUpdater

- (FSTaskProgressUpdater)initWithProgress:(id)a3
{
  id v5;
  FSTaskProgressUpdater *v6;
  FSTaskProgressUpdater *v7;
  OS_dispatch_source *timerSource;
  NSProgress *childProgress;
  objc_super v11;

  v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)FSTaskProgressUpdater;
  v6 = -[FSTaskProgressUpdater init](&v11, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_parentProgress, a3);
    timerSource = v7->_timerSource;
    v7->_timerSource = 0;

    childProgress = v7->_childProgress;
    v7->_childProgress = 0;

  }
  return v7;
}

+ (id)progressUpdaterWithProgress:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  v5 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithProgress:", v4);

  return v5;
}

- (id)startPhase:(id)a3 parentUnitCount:(int64_t)a4 phaseTotalCount:(int64_t)a5 completedCounter:(const unsigned int *)a6
{
  NSObject *v7;
  void *v8;
  NSProgress *v12;
  NSProgress *childProgress;
  OS_dispatch_source *v14;
  OS_dispatch_source *timerSource;
  NSObject *v16;
  dispatch_time_t v17;
  void *v18;
  NSObject *v19;
  id v20;
  _QWORD v22[4];
  id v23;
  const unsigned int *v24;

  if (self->_childProgress)
  {
    fskit_std_log();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT))
      -[FSTaskProgressUpdater startPhase:parentUnitCount:phaseTotalCount:completedCounter:].cold.1((uint64_t)self, v7);

    fs_errorForPOSIXError(22);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[NSProgress setLocalizedDescription:](self->_parentProgress, "setLocalizedDescription:", a3);
    objc_msgSend(MEMORY[0x24BDD1768], "progressWithTotalUnitCount:", a5);
    v12 = (NSProgress *)objc_claimAutoreleasedReturnValue();
    childProgress = self->_childProgress;
    self->_childProgress = v12;

    -[NSProgress addChild:withPendingUnitCount:](self->_parentProgress, "addChild:withPendingUnitCount:", self->_childProgress, a4);
    v14 = (OS_dispatch_source *)dispatch_source_create(MEMORY[0x24BDACA18], 0, 0, 0);
    timerSource = self->_timerSource;
    self->_timerSource = v14;

    v16 = self->_timerSource;
    if (v16)
    {
      v17 = dispatch_time(0, 1000000000);
      dispatch_source_set_timer(v16, v17, 0x3B9ACA00uLL, 0x5F5E100uLL);
      -[FSTaskProgressUpdater childProgress](self, "childProgress");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = self->_timerSource;
      v22[0] = MEMORY[0x24BDAC760];
      v22[1] = 3221225472;
      v22[2] = __85__FSTaskProgressUpdater_startPhase_parentUnitCount_phaseTotalCount_completedCounter___block_invoke;
      v22[3] = &unk_250C323B0;
      v23 = v18;
      v24 = a6;
      v20 = v18;
      dispatch_source_set_event_handler(v19, v22);
      dispatch_resume((dispatch_object_t)self->_timerSource);

    }
    v8 = 0;
  }
  return v8;
}

uint64_t __85__FSTaskProgressUpdater_startPhase_parentUnitCount_phaseTotalCount_completedCounter___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setCompletedUnitCount:", **(unsigned int **)(a1 + 40));
}

- (void)endPhase:(id)a3
{
  id v4;
  NSObject *timerSource;
  OS_dispatch_source *v6;
  NSProgress *childProgress;
  id v8;

  v4 = a3;
  if (self->_childProgress)
  {
    timerSource = self->_timerSource;
    v8 = v4;
    if (timerSource)
    {
      dispatch_source_cancel(timerSource);
      v6 = self->_timerSource;
      self->_timerSource = 0;

    }
    -[NSProgress setLocalizedDescription:](self->_parentProgress, "setLocalizedDescription:", v8);
    -[NSProgress setCompletedUnitCount:](self->_childProgress, "setCompletedUnitCount:", -[NSProgress totalUnitCount](self->_childProgress, "totalUnitCount"));
    childProgress = self->_childProgress;
    self->_childProgress = 0;

    v4 = v8;
  }

}

- (void)dealloc
{
  NSObject *timerSource;
  OS_dispatch_source *v4;
  objc_super v5;

  timerSource = self->_timerSource;
  if (timerSource)
  {
    dispatch_source_cancel(timerSource);
    v4 = self->_timerSource;
    self->_timerSource = 0;

  }
  v5.receiver = self;
  v5.super_class = (Class)FSTaskProgressUpdater;
  -[FSTaskProgressUpdater dealloc](&v5, sel_dealloc);
}

- (NSProgress)parentProgress
{
  return (NSProgress *)objc_getProperty(self, a2, 8, 1);
}

- (void)setParentProgress:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 8);
}

- (NSProgress)childProgress
{
  return (NSProgress *)objc_getProperty(self, a2, 16, 1);
}

- (void)setChildProgress:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (OS_dispatch_source)timerSource
{
  return (OS_dispatch_source *)objc_getProperty(self, a2, 24, 1);
}

- (void)setTimerSource:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 24);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_timerSource, 0);
  objc_storeStrong((id *)&self->_childProgress, 0);
  objc_storeStrong((id *)&self->_parentProgress, 0);
}

- (void)startPhase:(uint64_t)a1 parentUnitCount:(NSObject *)a2 phaseTotalCount:completedCounter:.cold.1(uint64_t a1, NSObject *a2)
{
  void *v3;
  int v4;
  const char *v5;
  __int16 v6;
  void *v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(a1 + 8), "localizedDescription");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = 136315394;
  v5 = "-[FSTaskProgressUpdater startPhase:parentUnitCount:phaseTotalCount:completedCounter:]";
  v6 = 2112;
  v7 = v3;
  _os_log_fault_impl(&dword_23B2A6000, a2, OS_LOG_TYPE_FAULT, "%s missing endPhase call for %@", (uint8_t *)&v4, 0x16u);

}

@end
