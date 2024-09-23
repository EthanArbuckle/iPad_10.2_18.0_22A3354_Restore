@implementation NADecayingTimer

- (NADecayingTimer)initWithReferenceDate:(id)a3 minimumUnit:(unint64_t)a4 block:(id)a5
{
  id v9;
  id v10;
  NADecayingTimer *v11;
  NADecayingTimer *v12;
  uint64_t v13;
  id block;
  objc_super v16;

  v9 = a3;
  v10 = a5;
  v16.receiver = self;
  v16.super_class = (Class)NADecayingTimer;
  v11 = -[NADecayingTimer init](&v16, sel_init);
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_referenceDate, a3);
    v12->_minimumUnit = a4;
    v13 = MEMORY[0x1B5E0F7A8](v10);
    block = v12->_block;
    v12->_block = (id)v13;

    -[NADecayingTimer _scheduleNextTimer](v12, "_scheduleNextTimer");
  }

  return v12;
}

- (void)dealloc
{
  objc_super v3;

  -[NADecayingTimer invalidate](self, "invalidate");
  v3.receiver = self;
  v3.super_class = (Class)NADecayingTimer;
  -[NADecayingTimer dealloc](&v3, sel_dealloc);
}

+ (id)scheduledTimerWithReferenceDate:(id)a3 minimumUnit:(unint64_t)a4 block:(id)a5
{
  id v8;
  id v9;
  void *v10;

  v8 = a5;
  v9 = a3;
  v10 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithReferenceDate:minimumUnit:block:", v9, a4, v8);

  return v10;
}

- (void)invalidate
{
  id v2;

  -[NADecayingTimer timer](self, "timer");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "invalidate");

}

- (id)_nextFireDate
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  unint64_t v7;
  uint64_t v8;
  id v9;
  void *v10;
  void *v11;

  __32__NADecayingTimer__nextFireDate__block_invoke();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[NADecayingTimer referenceDate](self, "referenceDate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "components:fromDate:toDate:options:", 252, v4, v5, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = -[NADecayingTimer _mostSignificantUnitForDateComponents:](self, "_mostSignificantUnitForDateComponents:", v6);
  v8 = objc_msgSend(v6, "valueForComponent:", v7);
  v9 = objc_alloc_init(MEMORY[0x1E0C99D78]);
  objc_msgSend(v9, "setValue:forComponent:", v8 + 1, v7);
  -[NADecayingTimer referenceDate](self, "referenceDate");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "dateByAddingComponents:toDate:options:", v9, v10, 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

id __32__NADecayingTimer__nextFireDate__block_invoke()
{
  if (_block_invoke_na_once_token_0_0 != -1)
    dispatch_once(&_block_invoke_na_once_token_0_0, &__block_literal_global_4_0);
  return (id)_block_invoke_na_once_object_0_0;
}

void __32__NADecayingTimer__nextFireDate__block_invoke_2()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0C99D48], "calendarWithIdentifier:", *MEMORY[0x1E0C996C8]);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)_block_invoke_na_once_object_0_0;
  _block_invoke_na_once_object_0_0 = v0;

}

- (void)_scheduleNextTimer
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void (*v10)(uint64_t);
  void *v11;
  id v12;
  id location;

  -[NADecayingTimer _nextFireDate](self, "_nextFireDate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_initWeak(&location, self);
  v4 = objc_alloc(MEMORY[0x1E0C99E88]);
  v8 = MEMORY[0x1E0C809B0];
  v9 = 3221225472;
  v10 = __37__NADecayingTimer__scheduleNextTimer__block_invoke;
  v11 = &unk_1E6227EE0;
  objc_copyWeak(&v12, &location);
  v5 = (void *)objc_msgSend(v4, "initWithFireDate:interval:repeats:block:", v3, 0, &v8, 0.0);
  -[NADecayingTimer setTimer:](self, "setTimer:", v5, v8, v9, v10, v11);

  objc_msgSend(MEMORY[0x1E0C99E58], "mainRunLoop");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[NADecayingTimer timer](self, "timer");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addTimer:forMode:", v7, *MEMORY[0x1E0C99748]);

  objc_destroyWeak(&v12);
  objc_destroyWeak(&location);

}

void __37__NADecayingTimer__scheduleNextTimer__block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_timerEvent");

}

- (void)_timerEvent
{
  void (**v3)(_QWORD, _QWORD);

  -[NADecayingTimer block](self, "block");
  v3 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
  ((void (**)(_QWORD, NADecayingTimer *))v3)[2](v3, self);

  -[NADecayingTimer _scheduleNextTimer](self, "_scheduleNextTimer");
}

- (unint64_t)_mostSignificantUnitForDateComponents:(id)a3
{
  id v4;
  unint64_t v5;

  v4 = a3;
  v5 = 4;
  if (-[NADecayingTimer minimumUnit](self, "minimumUnit") >= 5)
  {
    do
    {
      if ((unint64_t)(objc_msgSend(v4, "valueForComponent:", v5) - 1) < 0x7FFFFFFFFFFFFFFELL)
        break;
      v5 *= 2;
    }
    while (v5 < -[NADecayingTimer minimumUnit](self, "minimumUnit"));
  }

  return v5;
}

- (NSDate)referenceDate
{
  return self->_referenceDate;
}

- (unint64_t)minimumUnit
{
  return self->_minimumUnit;
}

- (id)block
{
  return self->_block;
}

- (NSTimer)timer
{
  return self->_timer;
}

- (void)setTimer:(id)a3
{
  objc_storeStrong((id *)&self->_timer, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_timer, 0);
  objc_storeStrong(&self->_block, 0);
  objc_storeStrong((id *)&self->_referenceDate, 0);
}

@end
