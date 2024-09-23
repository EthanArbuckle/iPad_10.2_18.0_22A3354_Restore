@implementation MRTimer

- (MRTimer)initWithInterval:(double)a3 name:(id)a4 queue:(id)a5 block:(id)a6
{
  id v10;
  id v11;
  id v12;
  MRTimer *v13;
  id v14;
  uint64_t v15;
  MSVTimer *timer;
  uint64_t v17;
  NSDate *fireDate;
  _QWORD v20[4];
  id v21;
  id v22;
  id location;
  objc_super v24;

  v10 = a4;
  v11 = a5;
  v12 = a6;
  v24.receiver = self;
  v24.super_class = (Class)MRTimer;
  v13 = -[MRTimer init](&v24, sel_init);
  if (v13)
  {
    objc_initWeak(&location, v13);
    v14 = objc_alloc(MEMORY[0x1E0D4D110]);
    v20[0] = MEMORY[0x1E0C809B0];
    v20[1] = 3221225472;
    v20[2] = __45__MRTimer_initWithInterval_name_queue_block___block_invoke;
    v20[3] = &unk_1E30C8180;
    objc_copyWeak(&v22, &location);
    v21 = v12;
    v15 = objc_msgSend(v14, "initWithInterval:repeats:queue:block:", 0, v11, v20, a3);
    timer = v13->_timer;
    v13->_timer = (MSVTimer *)v15;

    objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceNow:", a3);
    v17 = objc_claimAutoreleasedReturnValue();
    fireDate = v13->_fireDate;
    v13->_fireDate = (NSDate *)v17;

    objc_destroyWeak(&v22);
    objc_destroyWeak(&location);
  }

  return v13;
}

uint64_t __45__MRTimer_initWithInterval_name_queue_block___block_invoke(uint64_t a1)
{
  id WeakRetained;
  uint64_t result;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "invalidateWithReason:", CFSTR("Timer Fired"));

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (void)invalidate
{
  -[MRTimer invalidateWithReason:](self, "invalidateWithReason:", CFSTR("Invalidated"));
}

- (void)invalidateWithReason:(id)a3
{
  MRTimer *v4;
  MSVTimer *timer;
  MSVTimer *v6;
  uint64_t v7;
  NSDate *fireDate;
  id v9;

  v9 = a3;
  v4 = self;
  objc_sync_enter(v4);
  timer = v4->_timer;
  if (timer)
  {
    -[MSVTimer invalidate](timer, "invalidate");
    v6 = v4->_timer;
    v4->_timer = 0;

    objc_msgSend(MEMORY[0x1E0C99D68], "now");
    v7 = objc_claimAutoreleasedReturnValue();
    fireDate = v4->_fireDate;
    v4->_fireDate = (NSDate *)v7;

  }
  objc_sync_exit(v4);

}

- (BOOL)isValid
{
  MRTimer *v2;
  BOOL v3;

  v2 = self;
  objc_sync_enter(v2);
  v3 = v2->_timer != 0;
  objc_sync_exit(v2);

  return v3;
}

- (NSDate)fireDate
{
  MRTimer *v2;
  NSDate *v3;

  v2 = self;
  objc_sync_enter(v2);
  v3 = v2->_fireDate;
  objc_sync_exit(v2);

  return v3;
}

- (double)timeRemaining
{
  void *v2;
  double v3;
  double v4;

  -[MRTimer fireDate](self, "fireDate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "timeIntervalSinceNow");
  v4 = v3;

  return v4;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fireDate, 0);
  objc_storeStrong((id *)&self->_timer, 0);
}

@end
