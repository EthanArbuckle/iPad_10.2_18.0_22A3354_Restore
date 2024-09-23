@implementation CLDispatchTimerScheduler

- (void)dealloc
{
  NSObject *source;
  OS_dispatch_source *v4;
  objc_super v5;

  source = self->_source;
  if (source)
  {
    dispatch_source_cancel(source);
    v4 = self->_source;
    self->_source = 0;

  }
  v5.receiver = self;
  v5.super_class = (Class)CLDispatchTimerScheduler;
  -[CLDispatchTimerScheduler dealloc](&v5, sel_dealloc);
}

- (CLDispatchTimerScheduler)initWithDispatchSilo:(id)a3
{
  id v4;
  id v5;
  void *v6;
  NSObject *v7;
  dispatch_source_t v8;
  void *v9;
  id v10;
  uint64_t v12;
  uint64_t v13;
  void (*v14)(uint64_t);
  void *v15;
  id v16;
  id v17;
  id from;
  id location;
  objc_super v20;

  v4 = a3;
  objc_msgSend(v4, "inPermissiveMode");
  v20.receiver = self;
  v20.super_class = (Class)CLDispatchTimerScheduler;
  v5 = -[CLDispatchTimerScheduler init](&v20, sel_init);
  if (v5)
  {
    objc_initWeak(&location, v5);
    objc_initWeak(&from, v4);
    v12 = MEMORY[0x1E0C809B0];
    v13 = 3221225472;
    v14 = sub_1A19FBAD4;
    v15 = &unk_1E45FBAD0;
    objc_copyWeak(&v16, &from);
    objc_copyWeak(&v17, &location);
    v6 = _Block_copy(&v12);
    objc_msgSend(v4, "queue", v12, v13, v14, v15);
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = dispatch_source_create(MEMORY[0x1E0C80DD0], 2uLL, 0, v7);
    v9 = (void *)*((_QWORD *)v5 + 2);
    *((_QWORD *)v5 + 2) = v8;

    dispatch_set_context(*((dispatch_object_t *)v5 + 2), (void *)objc_msgSend(v6, "copy"));
    dispatch_set_finalizer_f(*((dispatch_object_t *)v5 + 2), j__objc_release);
    dispatch_source_set_event_handler_f(*((dispatch_source_t *)v5 + 2), (dispatch_function_t)sub_1A19F6EA4);
    objc_msgSend(v5, "reflectNextFireDelay:fireInterval:", 1.79769313e308, 1.79769313e308);
    dispatch_resume(*((dispatch_object_t *)v5 + 2));
    v10 = v5;

    objc_destroyWeak(&v17);
    objc_destroyWeak(&v16);
    objc_destroyWeak(&from);
    objc_destroyWeak(&location);
  }

  return (CLDispatchTimerScheduler *)v5;
}

- (void)reflectNextFireDelay:(double)a3 fireInterval:(double)a4
{
  NSObject *source;
  dispatch_time_t v7;
  uint64_t v8;

  source = self->_source;
  if (!source)
    __assert_rtn("-[CLDispatchTimerScheduler reflectNextFireDelay:fireInterval:]", "CLDispatchSilo.m", 132, "_source");
  if (a3 == 1.79769313e308)
  {
    v7 = -1;
  }
  else
  {
    v7 = dispatch_time(0x8000000000000000, (uint64_t)(a3 * 1000000000.0));
    source = self->_source;
  }
  if (a4 == 1.79769313e308)
    v8 = -1;
  else
    v8 = (unint64_t)(a4 * 1000000000.0);
  dispatch_source_set_timer(source, v7, v8, 0);
}

- (CLTimer)timer
{
  return (CLTimer *)objc_loadWeakRetained((id *)&self->timer);
}

- (void)setTimer:(id)a3
{
  objc_storeWeak((id *)&self->timer, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_source, 0);
  objc_destroyWeak((id *)&self->timer);
}

- (OS_dispatch_source)source
{
  return self->_source;
}

- (void)setSource:(id)a3
{
  objc_storeStrong((id *)&self->_source, a3);
}

@end
