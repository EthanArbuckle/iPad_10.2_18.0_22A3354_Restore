@implementation GCDTimer

- (GCDTimer)initWithTimeInterval:(double)a3 queue:(id)a4 repeating:(BOOL)a5 block:(id)a6
{
  _BOOL4 v7;
  NSObject *v10;
  id v11;
  GCDTimer *v12;
  GCDTimer *v13;
  dispatch_source_t v14;
  OS_dispatch_source *source;
  uint64_t v16;
  NSDate *fireDate;
  dispatch_time_t v18;
  uint64_t v19;
  NSObject *v20;
  _QWORD v22[4];
  id v23;
  id v24[2];
  id location;
  objc_super v26;

  v7 = a5;
  v10 = a4;
  v11 = a6;
  v26.receiver = self;
  v26.super_class = (Class)GCDTimer;
  v12 = -[GCDTimer init](&v26, sel_init);
  v13 = v12;
  if (v12)
  {
    v12->_repeating = v7;
    v14 = dispatch_source_create(MEMORY[0x1E0C80DD0], 0, 0, v10);
    source = v13->_source;
    v13->_source = (OS_dispatch_source *)v14;

    objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceNow:", a3);
    v16 = objc_claimAutoreleasedReturnValue();
    fireDate = v13->_fireDate;
    v13->_fireDate = (NSDate *)v16;

    v18 = dispatch_time(0, (unint64_t)(a3 * 1000000000.0));
    if (v7)
      v19 = (unint64_t)(a3 * 1000000000.0);
    else
      v19 = -1;
    dispatch_source_set_timer((dispatch_source_t)v13->_source, v18, v19, 0);
    objc_initWeak(&location, v13);
    v20 = v13->_source;
    v22[0] = MEMORY[0x1E0C809B0];
    v22[1] = 3221225472;
    v22[2] = __55__GCDTimer_initWithTimeInterval_queue_repeating_block___block_invoke;
    v22[3] = &unk_1E6651B30;
    objc_copyWeak(v24, &location);
    v24[1] = *(id *)&a3;
    v23 = v11;
    dispatch_source_set_event_handler(v20, v22);

    objc_destroyWeak(v24);
    objc_destroyWeak(&location);
  }

  return v13;
}

void __55__GCDTimer_initWithTimeInterval_queue_repeating_block___block_invoke(uint64_t a1)
{
  _QWORD *WeakRetained;
  uint64_t v3;
  void *v4;
  _QWORD *v5;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v5 = WeakRetained;
    if ((objc_msgSend(WeakRetained, "isRepeating") & 1) != 0)
    {
      objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceNow:", *(double *)(a1 + 48));
      v3 = objc_claimAutoreleasedReturnValue();
      v4 = (void *)v5[3];
      v5[3] = v3;

    }
    else
    {
      objc_msgSend(v5, "invalidate");
    }
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
    WeakRetained = v5;
  }

}

- (id)description
{
  void *v3;
  void *v4;
  const char *v5;
  void *v6;
  void *v7;
  objc_super v9;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v9.receiver = self;
  v9.super_class = (Class)GCDTimer;
  -[GCDTimer description](&v9, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[GCDTimer isRepeating](self, "isRepeating"))
    v5 = "YES";
  else
    v5 = "NO";
  -[GCDTimer fireDate](self, "fireDate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ <repeating: %s, next fire: %@>"), v4, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (void)dealloc
{
  objc_super v3;

  -[GCDTimer invalidate](self, "invalidate");
  v3.receiver = self;
  v3.super_class = (Class)GCDTimer;
  -[GCDTimer dealloc](&v3, sel_dealloc);
}

+ (id)scheduledTimerWithTimeInterval:(double)a3 queue:(id)a4 block:(id)a5
{
  return (id)objc_msgSend(a1, "scheduledTimerWithTimeInterval:queue:repeating:block:", a4, 0, a5, a3);
}

+ (id)scheduledTimerWithTimeInterval:(double)a3 queue:(id)a4 repeating:(BOOL)a5 block:(id)a6
{
  _BOOL8 v6;
  id v9;
  id v10;
  GCDTimer *v11;

  v6 = a5;
  v9 = a6;
  v10 = a4;
  v11 = -[GCDTimer initWithTimeInterval:queue:repeating:block:]([GCDTimer alloc], "initWithTimeInterval:queue:repeating:block:", v10, v6, v9, a3);

  dispatch_resume((dispatch_object_t)v11->_source);
  return v11;
}

- (void)invalidate
{
  NSObject *source;
  OS_dispatch_source *v4;

  source = self->_source;
  if (source)
  {
    dispatch_source_cancel(source);
    v4 = self->_source;
    self->_source = 0;

  }
}

- (BOOL)isRepeating
{
  return self->_repeating;
}

- (NSDate)fireDate
{
  return self->_fireDate;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fireDate, 0);
  objc_storeStrong((id *)&self->_source, 0);
}

@end
