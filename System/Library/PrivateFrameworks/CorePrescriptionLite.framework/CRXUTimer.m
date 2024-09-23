@implementation CRXUTimer

- (CRXUTimer)initWithTimeInterval:(double)a3 weakTarget:(id)a4 selector:(SEL)a5 repeats:(BOOL)a6 queue:(id)a7
{
  id v12;
  id v13;
  CRXUTimer *v14;
  CRXUTimer *v15;
  NSObject *v16;
  dispatch_source_t v17;
  OS_dispatch_source *timer;
  dispatch_time_t v19;
  NSObject *v20;
  _QWORD v22[4];
  CRXUTimer *v23;
  BOOL v24;
  objc_super v25;

  v12 = a4;
  v13 = a7;
  v25.receiver = self;
  v25.super_class = (Class)CRXUTimer;
  v14 = -[CRXUTimer init](&v25, sel_init);
  v15 = v14;
  if (v14)
  {
    objc_storeWeak(&v14->_target, v12);
    v15->_selector = a5;
    objc_msgSend(v13, "queue");
    v16 = objc_claimAutoreleasedReturnValue();
    v17 = dispatch_source_create(MEMORY[0x24BDACA18], 0, 0, v16);
    timer = v15->_timer;
    v15->_timer = (OS_dispatch_source *)v17;

    v19 = dispatch_time(0, (uint64_t)(a3 * 1000000000.0));
    dispatch_source_set_timer((dispatch_source_t)v15->_timer, v19, v19, 0);
    v20 = v15->_timer;
    v22[0] = MEMORY[0x24BDAC760];
    v22[1] = 3221225472;
    v22[2] = __68__CRXUTimer_initWithTimeInterval_weakTarget_selector_repeats_queue___block_invoke;
    v22[3] = &unk_250B04558;
    v24 = a6;
    v23 = v15;
    dispatch_source_set_event_handler(v20, v22);
    dispatch_resume((dispatch_object_t)v15->_timer);

  }
  return v15;
}

uint64_t __68__CRXUTimer_initWithTimeInterval_weakTarget_selector_repeats_queue___block_invoke(uint64_t a1)
{
  if (!*(_BYTE *)(a1 + 40))
    objc_msgSend(*(id *)(a1 + 32), "invalidate");
  return objc_msgSend(*(id *)(a1 + 32), "handleTimer");
}

- (void)dealloc
{
  NSObject *timer;
  objc_super v4;

  timer = self->_timer;
  if (timer)
    dispatch_source_cancel(timer);
  v4.receiver = self;
  v4.super_class = (Class)CRXUTimer;
  -[CRXUTimer dealloc](&v4, sel_dealloc);
}

- (void)invalidate
{
  NSObject *timer;
  OS_dispatch_source *v4;

  timer = self->_timer;
  if (timer)
  {
    dispatch_source_cancel(timer);
    v4 = self->_timer;
    self->_timer = 0;

  }
}

- (void)handleTimer
{
  uint64_t v3;
  void *v4;
  void *v5;
  char v6;
  void *v7;
  void (*v8)(id, SEL, CRXUTimer *);
  id v9;

  -[CRXUTimer target](self, "target");
  v3 = objc_claimAutoreleasedReturnValue();
  if (v3
    && (v4 = (void *)v3,
        -[CRXUTimer target](self, "target"),
        v5 = (void *)objc_claimAutoreleasedReturnValue(),
        -[CRXUTimer selector](self, "selector"),
        v6 = objc_opt_respondsToSelector(),
        v5,
        v4,
        (v6 & 1) != 0))
  {
    -[CRXUTimer target](self, "target");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (void (*)(id, SEL, CRXUTimer *))objc_msgSend(v7, "methodForSelector:", -[CRXUTimer selector](self, "selector"));

    -[CRXUTimer target](self, "target");
    v9 = (id)objc_claimAutoreleasedReturnValue();
    v8(v9, -[CRXUTimer selector](self, "selector"), self);

  }
  else
  {
    -[CRXUTimer invalidate](self, "invalidate");
  }
}

+ (id)scheduledTimerWithTimeInterval:(double)a3 weakTarget:(id)a4 selector:(SEL)a5 repeats:(BOOL)a6 queue:(id)a7
{
  _BOOL8 v7;
  id v12;
  id v13;
  void *v14;

  v7 = a6;
  v12 = a7;
  v13 = a4;
  v14 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithTimeInterval:weakTarget:selector:repeats:queue:", v13, a5, v7, v12, a3);

  return v14;
}

- (id)target
{
  return objc_loadWeakRetained(&self->_target);
}

- (void)setTarget:(id)a3
{
  objc_storeWeak(&self->_target, a3);
}

- (SEL)selector
{
  return self->_selector;
}

- (void)setSelector:(SEL)a3
{
  self->_selector = a3;
}

- (void).cxx_destruct
{
  objc_destroyWeak(&self->_target);
  objc_storeStrong((id *)&self->_timer, 0);
}

@end
