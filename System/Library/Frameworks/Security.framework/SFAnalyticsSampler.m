@implementation SFAnalyticsSampler

- (SFAnalyticsSampler)initWithName:(id)a3 interval:(double)a4 block:(id)a5 clientClass:(Class)a6
{
  id v11;
  id v12;
  SFAnalyticsSampler *v13;
  NSObject *v14;
  NSObject *v15;
  SFAnalyticsSampler *v16;
  void *v17;
  id block;
  objc_super v20;
  uint8_t buf[4];
  Class v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v11 = a3;
  v12 = a5;
  v20.receiver = self;
  v20.super_class = (Class)SFAnalyticsSampler;
  v13 = -[SFAnalyticsSampler init](&v20, sel_init);
  if (!v13)
    goto LABEL_16;
  if ((-[objc_class isSubclassOfClass:](a6, "isSubclassOfClass:", objc_opt_class()) & 1) == 0)
  {
    secLogObjForScope("SecError");
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v22 = a6;
      _os_log_impl(&dword_18A900000, v15, OS_LOG_TYPE_DEFAULT, "SFAnalyticsSampler created without valid client class (%@)", buf, 0xCu);
    }

    goto LABEL_13;
  }
  if (v11)
  {
    if (a4 < 1.0)
    {
      if (!v12 || a4 != -1.0)
        goto LABEL_7;
      goto LABEL_15;
    }
    if (v12)
    {
LABEL_15:
      v13->_clientClass = a6;
      v17 = _Block_copy(v12);
      block = v13->_block;
      v13->_block = v17;

      objc_storeStrong((id *)&v13->_name, a3);
      v13->_samplingInterval = a4;
      -[SFAnalyticsSampler newTimer](v13, "newTimer");
LABEL_16:
      v16 = v13;
      goto LABEL_17;
    }
  }
LABEL_7:
  secLogObjForScope("SecError");
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_18A900000, v14, OS_LOG_TYPE_DEFAULT, "SFAnalyticsSampler created without proper data", buf, 2u);
  }

LABEL_13:
  v16 = 0;
LABEL_17:

  return v16;
}

- (void)newTimer
{
  double samplingInterval;

  if (self->_activeTimer)
    -[SFAnalyticsSampler pauseSampling](self, "pauseSampling");
  samplingInterval = self->_samplingInterval;
  self->_oncePerReport = samplingInterval == -1.0;
  if (samplingInterval == -1.0)
    -[SFAnalyticsSampler setupOnceTimer](self, "setupOnceTimer");
  else
    -[SFAnalyticsSampler setupPeriodicTimer](self, "setupPeriodicTimer");
}

- (void)setupOnceTimer
{
  NSObject *v3;
  _QWORD v4[4];
  id v5;
  id location;

  location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, self);
  dispatch_get_global_queue(0, 0);
  v3 = objc_claimAutoreleasedReturnValue();
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __36__SFAnalyticsSampler_setupOnceTimer__block_invoke;
  v4[3] = &unk_1E1FCDC70;
  objc_copyWeak(&v5, &location);
  notify_register_dispatch("com.apple.security.sfanalytics.samplers", &self->_notificationToken, v3, v4);

  self->_activeTimer = 1;
  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

- (void)setupPeriodicTimer
{
  NSObject *v3;
  OS_dispatch_source *v4;
  OS_dispatch_source *timer;
  NSObject *v6;
  dispatch_time_t v7;
  NSObject *v8;
  _QWORD v9[4];
  id v10;
  id location;

  dispatch_get_global_queue(0, 0);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = (OS_dispatch_source *)dispatch_source_create(MEMORY[0x1E0C80DD0], 0, 0, v3);
  timer = self->_timer;
  self->_timer = v4;

  v6 = self->_timer;
  v7 = dispatch_walltime(0, (uint64_t)(self->_samplingInterval * 1000000000.0));
  dispatch_source_set_timer(v6, v7, (unint64_t)(self->_samplingInterval * 1000000000.0), (unint64_t)(self->_samplingInterval * 1000000000.0 / 50.0));
  location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, self);
  v8 = self->_timer;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __40__SFAnalyticsSampler_setupPeriodicTimer__block_invoke;
  v9[3] = &unk_1E1FD8518;
  objc_copyWeak(&v10, &location);
  dispatch_source_set_event_handler(v8, v9);
  dispatch_resume((dispatch_object_t)self->_timer);
  self->_activeTimer = 1;
  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);
}

- (void)setSamplingInterval:(double)a3
{
  NSObject *v5;
  int v7;
  double v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  if (a3 >= 1.0 || a3 == -1.0)
  {
    self->_samplingInterval = a3;
    -[SFAnalyticsSampler newTimer](self, "newTimer");
  }
  else
  {
    secLogObjForScope("SecError");
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v7 = 134217984;
      v8 = a3;
      _os_log_impl(&dword_18A900000, v5, OS_LOG_TYPE_DEFAULT, "SFAnalyticsSampler: interval %f is not supported", (uint8_t *)&v7, 0xCu);
    }

  }
}

- (double)samplingInterval
{
  return self->_samplingInterval;
}

- (id)sampleNow
{
  void *v3;
  void *v4;

  (*((void (**)(void))self->_block + 2))();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[objc_class logger](self->_clientClass, "logger");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "logMetric:withName:oncePerReport:", v3, self->_name, self->_oncePerReport);

  return v3;
}

- (void)pauseSampling
{
  if (self->_activeTimer)
  {
    if (self->_oncePerReport)
    {
      notify_cancel(self->_notificationToken);
      self->_notificationToken = 0;
    }
    else
    {
      dispatch_source_cancel((dispatch_source_t)self->_timer);
    }
    self->_activeTimer = 0;
  }
}

- (void)dealloc
{
  objc_super v3;

  -[SFAnalyticsSampler pauseSampling](self, "pauseSampling");
  v3.receiver = self;
  v3.super_class = (Class)SFAnalyticsSampler;
  -[SFAnalyticsSampler dealloc](&v3, sel_dealloc);
}

- (NSString)name
{
  return self->_name;
}

- (BOOL)oncePerReport
{
  return self->_oncePerReport;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_block, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_timer, 0);
}

void __40__SFAnalyticsSampler_setupPeriodicTimer__block_invoke(uint64_t a1)
{
  id *WeakRetained;
  id *v2;
  NSObject *v3;
  void *v4;
  __int16 v5[8];

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  v2 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained[6], "logger");
    v3 = objc_claimAutoreleasedReturnValue();
    (*((void (**)(void))v2[4] + 2))();
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSObject logMetric:withName:oncePerReport:](v3, "logMetric:withName:oncePerReport:", v4, v2[3], *((unsigned __int8 *)v2 + 56));

  }
  else
  {
    secLogObjForScope("SFAnalyticsSampler");
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      v5[0] = 0;
      _os_log_impl(&dword_18A900000, v3, OS_LOG_TYPE_DEFAULT, "sampler went away before we could run its once-per-report block", (uint8_t *)v5, 2u);
    }
  }

}

void __36__SFAnalyticsSampler_setupOnceTimer__block_invoke(uint64_t a1, int a2)
{
  id *WeakRetained;
  id *v4;
  void *v5;
  void *v6;
  NSObject *v7;
  __int16 v8[8];

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  v4 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained[6], "logger");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(void))v4[4] + 2))();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "logMetric:withName:oncePerReport:", v6, v4[3], *((unsigned __int8 *)v4 + 56));

  }
  else
  {
    secLogObjForScope("SFAnalyticsSampler");
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v8[0] = 0;
      _os_log_impl(&dword_18A900000, v7, OS_LOG_TYPE_DEFAULT, "sampler went away before we could run its once-per-report block", (uint8_t *)v8, 2u);
    }

    notify_cancel(a2);
  }

}

@end
