@implementation SFAnalyticsActivityTracker

- (SFAnalyticsActivityTracker)initWithName:(id)a3 clientClass:(Class)a4
{
  id v7;
  SFAnalyticsActivityTracker *v8;
  NSObject *v9;
  dispatch_queue_t v10;
  OS_dispatch_queue *queue;
  NSNumber *measurement;
  SFAnalyticsActivityTracker *v13;
  NSObject *v14;
  objc_super v16;
  uint8_t buf[16];

  v7 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    && (-[objc_class isSubclassOfClass:](a4, "isSubclassOfClass:", objc_opt_class()) & 1) != 0)
  {
    v16.receiver = self;
    v16.super_class = (Class)SFAnalyticsActivityTracker;
    v8 = -[SFAnalyticsActivityTracker init](&v16, sel_init);
    if (v8)
    {
      dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
      v9 = objc_claimAutoreleasedReturnValue();
      v10 = dispatch_queue_create("SFAnalyticsActivityTracker queue", v9);
      queue = v8->_queue;
      v8->_queue = (OS_dispatch_queue *)v10;

      objc_storeStrong((id *)&v8->_name, a3);
      v8->_clientClass = a4;
      measurement = v8->_measurement;
      v8->_measurement = 0;

      v8->_canceled = 0;
      v8->_start = 0;
    }
    self = v8;
    v13 = self;
  }
  else
  {
    secLogObjForScope("SecError");
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_18A900000, v14, OS_LOG_TYPE_DEFAULT, "Cannot instantiate SFActivityTracker without name and client class", buf, 2u);
    }

    v13 = 0;
  }

  return v13;
}

- (void)performAction:(id)a3
{
  id v4;
  NSObject *queue;
  id v6;
  _QWORD block[4];
  id v8;

  v4 = a3;
  -[SFAnalyticsActivityTracker start](self, "start");
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __44__SFAnalyticsActivityTracker_performAction___block_invoke;
  block[3] = &unk_1E1FCBB98;
  v8 = v4;
  v6 = v4;
  dispatch_sync(queue, block);
  -[SFAnalyticsActivityTracker stop](self, "stop");

}

- (void)start
{
  void *v4;

  if (!self->_canceled)
  {
    if (self->_start)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SFAnalyticsActivityTracker.m"), 77, CFSTR("SFAnalyticsActivityTracker user called start twice"));

    }
    self->_start = mach_absolute_time();
  }
}

- (void)stop
{
  uint64_t v4;
  uint64_t v5;
  void *v6;
  double v7;
  NSNumber *v8;
  NSNumber *measurement;
  void *v10;

  v4 = mach_absolute_time();
  if (!self->_canceled)
  {
    v5 = v4;
    if (!self->_start)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SFAnalyticsActivityTracker.m"), 89, CFSTR("SFAnalyticsActivityTracker user called stop w/o calling start"));

    }
    if (!dword_1EDF7A99C)
      mach_timebase_info((mach_timebase_info_t)&stop_sTimebaseInfo);
    v6 = (void *)MEMORY[0x1E0CB37E8];
    -[NSNumber doubleValue](self->_measurement, "doubleValue");
    objc_msgSend(v6, "numberWithDouble:", v7+ (float)((float)((float)stop_sTimebaseInfo / (float)dword_1EDF7A99C)* (float)(v5 - self->_start)));
    v8 = (NSNumber *)objc_claimAutoreleasedReturnValue();
    measurement = self->_measurement;
    self->_measurement = v8;

  }
  self->_start = 0;
}

- (void)stopWithEvent:(id)a3 result:(id)a4
{
  id v6;
  id v7;
  id v8;

  v6 = a4;
  v7 = a3;
  -[SFAnalyticsActivityTracker stop](self, "stop");
  -[objc_class logger](self->_clientClass, "logger");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "logResultForEvent:hardFailure:result:", v7, 0, v6);

}

- (void)cancel
{
  self->_canceled = 1;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  if (self->_start)
    -[SFAnalyticsActivityTracker stop](self, "stop");
  if (!self->_canceled && self->_measurement)
  {
    -[objc_class logger](self->_clientClass, "logger");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "logMetric:withName:", self->_measurement, self->_name);

  }
  v4.receiver = self;
  v4.super_class = (Class)SFAnalyticsActivityTracker;
  -[SFAnalyticsActivityTracker dealloc](&v4, sel_dealloc);
}

- (NSNumber)measurement
{
  return (NSNumber *)objc_getProperty(self, a2, 48, 1);
}

- (void)setMeasurement:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 48);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_measurement, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

uint64_t __44__SFAnalyticsActivityTracker_performAction___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

@end
