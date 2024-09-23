@implementation HFFormattedTimeRemainingValue

+ (id)defaultFormatter
{
  id v2;

  v2 = objc_alloc_init(MEMORY[0x1E0CB3570]);
  objc_msgSend(v2, "setZeroFormattingBehavior:", 0x10000);
  return v2;
}

+ (id)valueWithRemainingDuration:(double)a3 relativeToDate:(id)a4
{
  void *v5;
  void *v6;

  objc_msgSend(a4, "dateByAddingTimeInterval:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithFireDate:", v5);

  return v6;
}

- (HFFormattedTimeRemainingValue)initWithFireDate:(id)a3
{
  id v4;
  void *v5;
  HFFormattedTimeRemainingValue *v6;

  v4 = a3;
  objc_msgSend((id)objc_opt_class(), "defaultFormatter");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[HFFormattedTimeRemainingValue initWithFireDate:formatter:](self, "initWithFireDate:formatter:", v4, v5);

  return v6;
}

- (HFFormattedTimeRemainingValue)initWithFireDate:(id)a3 formatter:(id)a4
{
  id v7;
  id v8;
  HFFormattedTimeRemainingValue *v9;
  HFFormattedTimeRemainingValue *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)HFFormattedTimeRemainingValue;
  v9 = -[HFFormattedTimeRemainingValue init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_value, a3);
    objc_storeStrong((id *)&v10->_formatter, a4);
  }

  return v10;
}

- (double)_timeRemaining
{
  void *v2;
  void *v3;
  double v4;
  double v5;
  double result;

  -[HFFormattedTimeRemainingValue value](self, "value");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "timeIntervalSinceDate:", v3);
  v5 = v4;

  result = 0.0;
  if (v5 >= 0.0)
    return v5;
  return result;
}

- (id)_generateFormattedValue
{
  double v3;
  double v4;
  void *v5;
  void *v6;
  void *v7;

  -[HFFormattedTimeRemainingValue _timeRemaining](self, "_timeRemaining");
  v4 = v3;
  v5 = (void *)objc_opt_new();
  objc_msgSend(v5, "setSecond:", (uint64_t)v4);
  objc_msgSend(v5, "setMinute:", 0);
  if (v4 >= 3600.0)
    objc_msgSend(v5, "setHour:", 0);
  -[HFFormattedTimeRemainingValue formatter](self, "formatter");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "stringFromDateComponents:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (HFStringGenerator)currentFormattedValue
{
  HFStringGenerator *currentFormattedValue;
  HFStringGenerator *v4;
  HFStringGenerator *v5;

  currentFormattedValue = self->_currentFormattedValue;
  if (!currentFormattedValue)
  {
    -[HFFormattedTimeRemainingValue _generateFormattedValue](self, "_generateFormattedValue");
    v4 = (HFStringGenerator *)objc_claimAutoreleasedReturnValue();
    v5 = self->_currentFormattedValue;
    self->_currentFormattedValue = v4;

    currentFormattedValue = self->_currentFormattedValue;
  }
  return currentFormattedValue;
}

- (NSMapTable)observationBlocks
{
  NSMapTable *observationBlocks;
  NSMapTable *v4;
  NSMapTable *v5;

  observationBlocks = self->_observationBlocks;
  if (!observationBlocks)
  {
    objc_msgSend(MEMORY[0x1E0CB3748], "strongToStrongObjectsMapTable");
    v4 = (NSMapTable *)objc_claimAutoreleasedReturnValue();
    v5 = self->_observationBlocks;
    self->_observationBlocks = v4;

    observationBlocks = self->_observationBlocks;
  }
  return observationBlocks;
}

- (id)observeFormattedValueChangesWithBlock:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v10[4];
  id v11;
  id v12;
  id from;
  id location;

  v4 = a3;
  v5 = objc_alloc_init(MEMORY[0x1E0D51990]);
  -[HFFormattedTimeRemainingValue observationBlocks](self, "observationBlocks");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v4, "copy");
  v8 = _Block_copy(v7);
  objc_msgSend(v6, "setObject:forKey:", v8, v5);

  -[HFFormattedTimeRemainingValue _updateTimerState](self, "_updateTimerState");
  objc_initWeak(&location, self);
  objc_initWeak(&from, v5);
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __71__HFFormattedTimeRemainingValue_observeFormattedValueChangesWithBlock___block_invoke;
  v10[3] = &unk_1EA72A968;
  objc_copyWeak(&v11, &location);
  objc_copyWeak(&v12, &from);
  objc_msgSend(v5, "addCancelationBlock:", v10);
  objc_destroyWeak(&v12);
  objc_destroyWeak(&v11);
  objc_destroyWeak(&from);
  objc_destroyWeak(&location);

  return v5;
}

void __71__HFFormattedTimeRemainingValue_observeFormattedValueChangesWithBlock___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "observationBlocks");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(v2, "removeObjectForKey:", v3);

  objc_msgSend(WeakRetained, "_updateTimerState");
}

- (void)_updateTimerState
{
  void *v3;
  uint64_t v4;
  id v5;

  -[HFFormattedTimeRemainingValue observationBlocks](self, "observationBlocks");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count");

  if (v4)
  {
    +[HFSynchronizedTimer sharedInstance](HFSynchronizedTimer, "sharedInstance");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObserver:", self);

  }
  else
  {
    -[HFFormattedTimeRemainingValue _stopTimer](self, "_stopTimer");
  }
}

- (void)_stopTimer
{
  id v3;

  +[HFSynchronizedTimer sharedInstance](HFSynchronizedTimer, "sharedInstance");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

}

- (void)countdownTimerDidFire:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  double v7;
  _QWORD v8[5];

  -[HFFormattedTimeRemainingValue _generateFormattedValue](self, "_generateFormattedValue", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HFFormattedTimeRemainingValue setCurrentFormattedValue:](self, "setCurrentFormattedValue:", v4);

  -[HFFormattedTimeRemainingValue observationBlocks](self, "observationBlocks");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectEnumerator");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __55__HFFormattedTimeRemainingValue_countdownTimerDidFire___block_invoke;
  v8[3] = &unk_1EA72A990;
  v8[4] = self;
  objc_msgSend(v6, "na_each:", v8);

  -[HFFormattedTimeRemainingValue _timeRemaining](self, "_timeRemaining");
  *(float *)&v7 = v7;
  if (fabsf(*(float *)&v7) < 0.00000011921)
    -[HFFormattedTimeRemainingValue _stopTimer](self, "_stopTimer");
}

uint64_t __55__HFFormattedTimeRemainingValue_countdownTimerDidFire___block_invoke(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(uint64_t, _QWORD))(a2 + 16))(a2, *(_QWORD *)(a1 + 32));
}

- (NSDate)value
{
  return self->_value;
}

- (NSDateComponentsFormatter)formatter
{
  return self->_formatter;
}

- (void)setCurrentFormattedValue:(id)a3
{
  objc_storeStrong((id *)&self->_currentFormattedValue, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentFormattedValue, 0);
  objc_storeStrong((id *)&self->_formatter, 0);
  objc_storeStrong((id *)&self->_value, 0);
  objc_storeStrong((id *)&self->_observationBlocks, 0);
}

@end
