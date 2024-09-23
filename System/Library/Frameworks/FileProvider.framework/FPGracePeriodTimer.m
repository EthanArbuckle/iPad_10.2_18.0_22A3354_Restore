@implementation FPGracePeriodTimer

- (void)suppress
{
  NSObject *timer;
  OS_dispatch_source *v3;
  FPGracePeriodTimer *obj;

  obj = self;
  objc_sync_enter(obj);
  timer = obj->_timer;
  if (timer)
  {
    dispatch_source_cancel(timer);
    v3 = obj->_timer;
    obj->_timer = 0;

    obj->_expectedFiringTimeSinceReferenceDate = 0.0;
  }
  objc_sync_exit(obj);

}

- (FPGracePeriodTimer)initWithAction:(id)a3 callbackQueue:(id)a4 delay:(double)a5
{
  id v9;
  id v10;
  FPGracePeriodTimer *v11;
  uint64_t v12;
  id action;
  void *v15;
  objc_super v16;

  v9 = a3;
  v10 = a4;
  if (!v10)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("FPGracePeriodTimer.m"), 23, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("callbackQueue"));

  }
  v16.receiver = self;
  v16.super_class = (Class)FPGracePeriodTimer;
  v11 = -[FPGracePeriodTimer init](&v16, sel_init);
  if (v11)
  {
    v12 = MEMORY[0x1A1B00850](v9);
    action = v11->_action;
    v11->_action = (id)v12;

    objc_storeStrong((id *)&v11->_callbackQueue, a4);
    v11->_delay = a5;
  }

  return v11;
}

- (void)dealloc
{
  objc_super v3;

  -[FPGracePeriodTimer suppress](self, "suppress");
  v3.receiver = self;
  v3.super_class = (Class)FPGracePeriodTimer;
  -[FPGracePeriodTimer dealloc](&v3, sel_dealloc);
}

- (void)_createTimer
{
  OS_dispatch_source *v3;
  OS_dispatch_source *timer;
  double delay;
  uint64_t v6;
  dispatch_time_t v7;
  double v8;
  OS_dispatch_source *v9;
  NSObject *v10;
  dispatch_block_t v11;
  _QWORD v12[4];
  id v13;
  id location;

  v3 = (OS_dispatch_source *)dispatch_source_create(MEMORY[0x1E0C80DD0], 0, 0, (dispatch_queue_t)self->_callbackQueue);
  timer = self->_timer;
  self->_timer = v3;

  dispatch_set_qos_class_fallback();
  delay = self->_delay;
  v6 = (unint64_t)(delay / 10.0 * 1000000000.0);
  v7 = dispatch_time(0, (uint64_t)(delay * 1000000000.0));
  dispatch_source_set_timer((dispatch_source_t)self->_timer, v7, 0xFFFFFFFFFFFFFFFFLL, v6);
  objc_msgSend(MEMORY[0x1E0C99D68], "timeIntervalSinceReferenceDate");
  self->_expectedFiringTimeSinceReferenceDate = v8 + self->_delay;
  location = 0;
  objc_initWeak(&location, self);
  v9 = self->_timer;
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __34__FPGracePeriodTimer__createTimer__block_invoke;
  v12[3] = &unk_1E44499C0;
  objc_copyWeak(&v13, &location);
  v10 = v9;
  v11 = dispatch_block_create_with_qos_class(DISPATCH_BLOCK_ENFORCE_QOS_CLASS, QOS_CLASS_UTILITY, 0, v12);
  dispatch_source_set_event_handler(v10, v11);

  objc_destroyWeak(&v13);
  objc_destroyWeak(&location);
}

void __34__FPGracePeriodTimer__createTimer__block_invoke(uint64_t a1)
{
  _QWORD *WeakRetained;
  uint64_t v2;
  void *v3;
  id v4;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v4 = WeakRetained;
    v2 = MEMORY[0x1A1B00850](WeakRetained[1]);
    v3 = (void *)v2;
    if (v2)
      (*(void (**)(uint64_t))(v2 + 16))(v2);
    objc_msgSend(v4, "suppress");

    WeakRetained = v4;
  }

}

- (void)arm
{
  FPGracePeriodTimer *obj;

  obj = self;
  objc_sync_enter(obj);
  -[FPGracePeriodTimer suppress](obj, "suppress");
  -[FPGracePeriodTimer _createTimer](obj, "_createTimer");
  dispatch_resume((dispatch_object_t)obj->_timer);
  objc_sync_exit(obj);

}

- (id)prettyDescription
{
  FPGracePeriodTimer *v2;
  void *v3;
  double expectedFiringTimeSinceReferenceDate;
  double v5;
  __CFString *v6;

  v2 = self;
  objc_sync_enter(v2);
  if (v2->_timer)
  {
    v3 = (void *)MEMORY[0x1E0CB3940];
    expectedFiringTimeSinceReferenceDate = v2->_expectedFiringTimeSinceReferenceDate;
    objc_msgSend(MEMORY[0x1E0C99D68], "timeIntervalSinceReferenceDate");
    objc_msgSend(v3, "stringWithFormat:", CFSTR("armed, firing in %.1gs"), expectedFiringTimeSinceReferenceDate - v5);
    v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = CFSTR("not running");
  }
  objc_sync_exit(v2);

  return v6;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_timer, 0);
  objc_storeStrong((id *)&self->_callbackQueue, 0);
  objc_storeStrong(&self->_action, 0);
}

@end
