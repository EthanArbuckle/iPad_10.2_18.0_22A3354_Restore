@implementation MSVVariableIntervalTimer

- (MSVVariableIntervalTimer)initWithIntervals:(id)a3 name:(id)a4 queue:(id)a5 block:(id)a6
{
  id v10;
  id v11;
  id v12;
  MSVVariableIntervalTimer *v13;
  uint64_t v14;
  NSMutableArray *intervals;
  void *v17;
  objc_super v18;

  v10 = a3;
  v11 = a5;
  v12 = a6;
  if (!objc_msgSend(v10, "count"))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MSVTimer.m"), 191, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("intervals.count > 0"));

  }
  v18.receiver = self;
  v18.super_class = (Class)MSVVariableIntervalTimer;
  v13 = -[MSVVariableIntervalTimer init](&v18, sel_init);
  if (v13)
  {
    v14 = objc_msgSend(v10, "mutableCopy");
    intervals = v13->_intervals;
    v13->_intervals = (NSMutableArray *)v14;

    -[MSVVariableIntervalTimer _processTimerEventWithQueue:block:](v13, "_processTimerEventWithQueue:block:", v11, v12);
  }

  return v13;
}

- (void)_processTimerEventWithQueue:(id)a3 block:(id)a4
{
  id v6;
  id v7;
  MSVTimer *timer;
  NSDate *v9;
  NSDate *currentIntervalStartDate;
  MSVTimer *v11;
  void *v12;
  double v13;
  double v14;
  MSVTimer *v15;
  MSVTimer *v16;
  _QWORD v17[4];
  id v18;
  id v19;
  id v20;
  id location;

  v6 = a3;
  v7 = a4;
  -[MSVTimer invalidate](self->_timer, "invalidate");
  timer = self->_timer;
  self->_timer = 0;

  if (-[NSMutableArray count](self->_intervals, "count"))
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "now");
    v9 = (NSDate *)objc_claimAutoreleasedReturnValue();
    currentIntervalStartDate = self->_currentIntervalStartDate;
    self->_currentIntervalStartDate = v9;

    objc_initWeak(&location, self);
    v11 = [MSVTimer alloc];
    -[NSMutableArray firstObject](self->_intervals, "firstObject");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "doubleValue");
    v14 = v13;
    v17[0] = MEMORY[0x1E0C809B0];
    v17[1] = 3221225472;
    v17[2] = __62__MSVVariableIntervalTimer__processTimerEventWithQueue_block___block_invoke;
    v17[3] = &unk_1E43E8960;
    objc_copyWeak(&v20, &location);
    v19 = v7;
    v18 = v6;
    v15 = -[MSVTimer initWithInterval:repeats:queue:block:](v11, "initWithInterval:repeats:queue:block:", 0, v18, v17, v14);
    v16 = self->_timer;
    self->_timer = v15;

    objc_destroyWeak(&v20);
    objc_destroyWeak(&location);
  }

}

- (NSArray)remainingIntervals
{
  MSVVariableIntervalTimer *v2;
  void *v3;

  v2 = self;
  objc_sync_enter(v2);
  v3 = (void *)-[NSMutableArray copy](v2->_intervals, "copy");
  objc_sync_exit(v2);

  return (NSArray *)v3;
}

- (double)currentInterval
{
  void *v2;
  void *v3;
  double v4;
  double v5;

  -[MSVVariableIntervalTimer remainingIntervals](self, "remainingIntervals");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "firstObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "doubleValue");
  v5 = v4;

  return v5;
}

- (double)timeUntilNextInterval
{
  MSVVariableIntervalTimer *v2;
  double v3;
  double v4;
  double v5;
  double v6;

  v2 = self;
  objc_sync_enter(v2);
  -[MSVVariableIntervalTimer currentInterval](v2, "currentInterval");
  v4 = v3;
  -[NSDate timeIntervalSinceNow](v2->_currentIntervalStartDate, "timeIntervalSinceNow");
  v6 = v4 + v5;
  objc_sync_exit(v2);

  return v6;
}

- (BOOL)isValid
{
  void *v2;
  BOOL v3;

  -[MSVVariableIntervalTimer remainingIntervals](self, "remainingIntervals");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "count") != 0;

  return v3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentIntervalStartDate, 0);
  objc_storeStrong((id *)&self->_timer, 0);
  objc_storeStrong((id *)&self->_intervals, 0);
}

void __62__MSVVariableIntervalTimer__processTimerEventWithQueue_block___block_invoke(uint64_t a1)
{
  id WeakRetained;
  id *v3;
  id v4;
  id *v5;
  id v6;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    v6 = WeakRetained;
    v3 = (id *)WeakRetained;
    objc_sync_enter(v3);
    if (objc_msgSend(v3[1], "count") == 1)
    {
      v4 = v3[3];
      v3[3] = 0;

    }
    objc_sync_exit(v3);

    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
    v5 = v3;
    objc_sync_enter(v5);
    objc_msgSend(v3[1], "removeObjectAtIndex:", 0);
    objc_msgSend(v5, "_processTimerEventWithQueue:block:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
    objc_sync_exit(v5);

    WeakRetained = v6;
  }

}

@end
