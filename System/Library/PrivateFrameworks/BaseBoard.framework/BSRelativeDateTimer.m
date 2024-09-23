@implementation BSRelativeDateTimer

+ (void)initialize
{
  uint64_t v2;
  id v3;
  void *v4;

  v2 = objc_opt_class();
  if (v2 == objc_opt_class())
  {
    v3 = objc_alloc_init(MEMORY[0x1E0C99E20]);
    v4 = (void *)qword_1ECD39928;
    qword_1ECD39928 = (uint64_t)v3;

  }
}

uint64_t __45__BSRelativeDateTimer_addTimerToMainRunLoop___block_invoke()
{
  id v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  uint64_t result;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v0 = (id)qword_1ECD39928;
  v1 = objc_msgSend(v0, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v1)
  {
    v2 = *(_QWORD *)v9;
    v3 = *MEMORY[0x1E0C99860];
    do
    {
      v4 = 0;
      do
      {
        if (*(_QWORD *)v9 != v2)
          objc_enumerationMutation(v0);
        v5 = *(_QWORD *)(*((_QWORD *)&v8 + 1) + 8 * v4);
        objc_msgSend(MEMORY[0x1E0C99E58], "mainRunLoop", (_QWORD)v8);
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "addTimer:forMode:", v5, v3);

        ++v4;
      }
      while (v1 != v4);
      v1 = objc_msgSend(v0, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    }
    while (v1);
  }

  result = objc_msgSend((id)qword_1ECD39928, "removeAllObjects");
  _MergedGlobals_19 = 0;
  return result;
}

- (BSRelativeDateTimer)init
{
  BSRelativeDateTimer *v2;
  id v3;
  uint64_t v4;
  NSCalendar *gregorian;
  NSCalendar *v6;
  void *v7;
  void *v8;
  void *v9;
  __CFNotificationCenter *DarwinNotifyCenter;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)BSRelativeDateTimer;
  v2 = -[BSRelativeDateTimer init](&v12, sel_init);
  if (v2)
  {
    v3 = objc_alloc(MEMORY[0x1E0C99D48]);
    v4 = objc_msgSend(v3, "initWithCalendarIdentifier:", *MEMORY[0x1E0C996C8]);
    gregorian = v2->_gregorian;
    v2->_gregorian = (NSCalendar *)v4;

    v6 = v2->_gregorian;
    objc_msgSend(MEMORY[0x1E0C99DC8], "currentLocale");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSCalendar setLocale:](v6, "setLocale:", v7);

    +[BSPowerMonitor sharedInstance](BSPowerMonitor, "sharedInstance");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "addObserver:", v2);

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "addObserver:selector:name:object:", v2, sel__fireForLocaleEvent_, *MEMORY[0x1E0C99720], 0);

    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterAddObserver(DarwinNotifyCenter, v2, (CFNotificationCallback)_BSHandleSignificantTimeChange_0, CFSTR("SignificantTimeChangeNotification"), 0, CFNotificationSuspensionBehaviorDeliverImmediately);
  }
  return v2;
}

- (void)dealloc
{
  __CFNotificationCenter *DarwinNotifyCenter;
  void *v4;
  void *v5;
  objc_super v6;

  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterRemoveObserver(DarwinNotifyCenter, self, CFSTR("SignificantTimeChangeNotification"), 0);
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeObserver:", self);

  +[BSPowerMonitor sharedInstance](BSPowerMonitor, "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeObserver:", self);

  -[BSRelativeDateTimer invalidate](self, "invalidate");
  objc_storeWeak((id *)&self->_delegate, 0);
  v6.receiver = self;
  v6.super_class = (Class)BSRelativeDateTimer;
  -[BSRelativeDateTimer dealloc](&v6, sel_dealloc);
}

- (void)_fireForLocaleEvent:(id)a3
{
  NSCalendar *gregorian;
  void *v5;

  gregorian = self->_gregorian;
  objc_msgSend(MEMORY[0x1E0C99DC8], "currentLocale", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSCalendar setLocale:](gregorian, "setLocale:", v5);

  if (self->_date)
    -[BSRelativeDateTimer fireAndSchedule](self, "fireAndSchedule");
}

- (void)setDate:(id)a3
{
  NSDate *v4;
  NSDate *date;
  long double v6;
  NSDate *v7;
  NSDate *v8;
  NSDate *v9;

  v4 = (NSDate *)a3;
  date = self->_date;
  v9 = v4;
  if (date != v4)
  {
    self->_date = 0;

    if (v9)
    {
      -[NSDate timeIntervalSinceReferenceDate](v9, "timeIntervalSinceReferenceDate");
      v7 = (NSDate *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D68]), "initWithTimeIntervalSinceReferenceDate:", (double)(v6 - fmod(v6, 1.0)));
      v8 = self->_date;
      self->_date = v7;

      -[BSRelativeDateTimer _fireAndUpdateTimerIfNecessary](self, "_fireAndUpdateTimerIfNecessary");
    }
    else
    {
      -[BSRelativeDateTimer invalidate](self, "invalidate");
    }
  }

}

- (id)date
{
  return (id)-[NSDate copy](self->_date, "copy");
}

- (double)nextFireInterval
{
  NSTimer *timer;
  double result;

  timer = self->_timer;
  if (!timer)
    return 0.0;
  -[NSTimer timeInterval](timer, "timeInterval");
  return result;
}

- (id)_computeDifferenceCurrentAndNextFireInfoForDate:(uint64_t *)a3 newTimerResolution:(uint64_t *)a4 currentResolution:(uint64_t *)a5 currentValue:(uint64_t *)a6 comparedToNow:
{
  id v11;
  void *v12;
  long double v13;
  void *v14;
  id v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v25;
  uint64_t v26;
  uint64_t v28;
  id v29;

  v11 = a2;
  v12 = v11;
  if (!a1)
  {
    v16 = 0;
    goto LABEL_59;
  }
  v29 = v11;
  objc_msgSend(v11, "timeIntervalSinceReferenceDate");
  objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceReferenceDate:", (double)(v13 - fmod(v13, 1.0)));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = objc_msgSend(*(id *)(a1 + 24), "compare:", v14);
  v15 = v14;
  objc_msgSend(*(id *)(a1 + 8), "components:fromDate:toDate:options:", 240, v15, *(_QWORD *)(a1 + 24), 0);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  v17 = objc_msgSend(v16, "day");
  v18 = objc_msgSend(v16, "hour");
  v19 = objc_msgSend(v16, "minute");
  v20 = objc_msgSend(v16, "second");
  if (!v17)
  {
    if (v18)
    {
      if (v18 >= 1)
      {
        if (v18 == 1 && !v19 && !v20)
        {
          v21 = 2;
          v22 = 1;
LABEL_29:
          v17 = 1;
          goto LABEL_50;
        }
        if (v19 > 0 || v20 >= 1)
        {
          v22 = 2;
          if (v18 == 23)
            v21 = 3;
          else
            v21 = 2;
          if (v18 == 23)
            v17 = 1;
          else
            v17 = v18 + 1;
          goto LABEL_50;
        }
      }
      v22 = 2;
      v21 = 2;
      v17 = v18;
      goto LABEL_50;
    }
    if (!v19)
    {
      v22 = 0;
      v21 = 0;
      v17 = v20;
      goto LABEL_50;
    }
    if (v19 < 1)
    {
      v22 = 1;
      v21 = 1;
      v17 = v19;
      goto LABEL_50;
    }
    if (v19 != 1 || v20)
    {
      v21 = 1;
      v22 = 1;
      if (v19 == 59)
        v25 = 2;
      else
        v25 = 1;
      if (v19 == 59)
        v26 = 1;
      else
        v26 = v19 + 1;
      if (v20 >= 1)
      {
        v21 = v25;
        v17 = v26;
      }
      else
      {
        v22 = 1;
        v17 = v19;
      }
      goto LABEL_50;
    }
    v22 = 0;
    v21 = 1;
    goto LABEL_29;
  }
  if (v17 < 1)
  {
LABEL_23:
    v22 = 3;
    v21 = 3;
    goto LABEL_50;
  }
  if (v17 != 1 || v18 || v19 || v20)
  {
    if (v18 > 0 || v19 > 0 || v20 > 0)
      ++v17;
    goto LABEL_23;
  }
  v17 = 1;
  v21 = 3;
  v22 = 2;
LABEL_50:
  if (a3)
    *a3 = v22;
  if (a4)
    *a4 = v21;
  if (a5)
    *a5 = v17;
  if (a6)
    *a6 = v28;

  v12 = v29;
LABEL_59:

  return v16;
}

- (id)nextFireAfterDate:(id)a3
{
  id v4;
  void *v5;
  long double v6;
  void *v7;
  id v8;
  uint64_t v9;
  id v10;
  void *v11;
  uint64_t v12;
  id v13;
  id v14;
  id v15;
  void *v16;
  id v17;
  BSRelativeDateTimerFireInfo *v18;
  uint64_t v19;
  BSRelativeDateTimerFireInfo *v20;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;

  v4 = a3;
  v5 = v4;
  if (self)
  {
    objc_msgSend(v4, "timeIntervalSinceReferenceDate");
    objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceReferenceDate:", (double)(v6 - fmod(v6, 1.0)));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = 0;
    v8 = -[BSRelativeDateTimer _computeDifferenceCurrentAndNextFireInfoForDate:newTimerResolution:currentResolution:currentValue:comparedToNow:]((uint64_t)self, v7, &v24, 0, 0, 0);
    v9 = v24;
    v10 = v5;
    v11 = v10;
    if ((unint64_t)(v9 - 1) > 2)
    {
      v15 = v10;
      v14 = objc_alloc_init(MEMORY[0x1E0C99D78]);
      objc_msgSend(v14, "setSecond:", 1);
      -[NSCalendar dateByAddingComponents:toDate:options:](self->_gregorian, "dateByAddingComponents:toDate:options:", v14, v15, 0);
    }
    else
    {
      v12 = qword_18A21D3E0[v9 - 1];
      v13 = v10;
      -[NSCalendar components:fromDate:](self->_gregorian, "components:fromDate:", v12, self->_date);
      v14 = (id)objc_claimAutoreleasedReturnValue();
      -[NSCalendar nextDateAfterDate:matchingComponents:options:](self->_gregorian, "nextDateAfterDate:matchingComponents:options:", v13, v14, 5120);
    }
    v16 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v16 = 0;
  }

  v23 = 0;
  v24 = 0;
  v22 = 0;
  v17 = -[BSRelativeDateTimer _computeDifferenceCurrentAndNextFireInfoForDate:newTimerResolution:currentResolution:currentValue:comparedToNow:]((uint64_t)self, v16, 0, &v23, &v24, &v22);
  v18 = [BSRelativeDateTimerFireInfo alloc];
  if ((int)v24 >= 0)
    v19 = v24;
  else
    v19 = -(int)v24;
  v20 = -[BSRelativeDateTimerFireInfo initWithValue:resolution:comparedToNow:fireDate:](v18, "initWithValue:resolution:comparedToNow:fireDate:", v19, v23, v22, v16);

  return v20;
}

- (void)fireAndSchedule
{
  -[BSRelativeDateTimer invalidate](self, "invalidate");
  if (self->_date)
    -[BSRelativeDateTimer _fireAndUpdateTimerIfNecessary](self, "_fireAndUpdateTimerIfNecessary");
}

- (void)_invalidateTimer
{
  void *v2;
  id v3;
  void *v4;

  if (a1)
  {
    v2 = *(void **)(a1 + 16);
    if (v2)
    {
      v3 = v2;
      objc_opt_self();
      objc_msgSend((id)qword_1ECD39928, "removeObject:", v3);

      objc_msgSend(*(id *)(a1 + 16), "invalidate");
      v4 = *(void **)(a1 + 16);
      *(_QWORD *)(a1 + 16) = 0;

    }
  }
}

- (void)_fireAndUpdateTimerIfNecessary
{
  void *v3;
  unint64_t *p_currResolution;
  void *v5;
  double v6;
  uint64_t v7;
  uint64_t v8;
  id v9;
  void *v10;
  double v11;
  int v12;
  unsigned int v13;
  int v14;
  unsigned int v15;
  int v16;
  uint64_t v17;
  double v18;
  double v19;
  long double v20;
  double v21;
  NSTimer *v22;
  NSTimer *timer;
  NSTimer *v24;
  __CFRunLoop *Main;
  id WeakRetained;
  int currValue;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;

  v29 = 0;
  v30 = 0;
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  p_currResolution = &self->_currResolution;
  -[BSRelativeDateTimer _computeDifferenceCurrentAndNextFireInfoForDate:newTimerResolution:currentResolution:currentValue:comparedToNow:]((uint64_t)self, v3, &v30, (uint64_t *)&self->_currResolution, &self->_currValue, &v29);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  -[NSTimer timeInterval](self->_timer, "timeInterval");
  if (v6 != 1.0 || *p_currResolution)
  {
    -[BSRelativeDateTimer _invalidateTimer]((uint64_t)self);
    v7 = v29;
    v8 = v30;
    v9 = v5;
    v10 = v9;
    v11 = 1.0;
    if (v8 && v7)
    {
      v12 = objc_msgSend(v9, "hour");
      if (v12 >= 0)
        v13 = v12;
      else
        v13 = -v12;
      v14 = objc_msgSend(v10, "minute");
      if (v14 >= 0)
        v15 = v14;
      else
        v15 = -v14;
      v16 = objc_msgSend(v10, "second");
      if (v16 >= 0)
        v17 = v16;
      else
        v17 = -v16;
      switch(v8)
      {
        case 1:
          v18 = (double)v17;
          v19 = 60.0;
          break;
        case 2:
          v18 = (double)(v17 + 60 * v15);
          v19 = 3600.0;
          break;
        case 3:
          v18 = (double)(3600 * v13 + 60 * v15 + v17);
          v19 = 86400.0;
          break;
        default:
          v18 = 0.0;
          objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", CFSTR("UnsupportedDateResolutionException"), CFSTR("Unknown resolution: %lu"), v8);
          v19 = 0.0;
          break;
      }
      objc_msgSend(MEMORY[0x1E0C99D68], "timeIntervalSinceReferenceDate");
      v21 = v19 - v18;
      if (v7 == 1)
        v21 = v18;
      if (v18 == 0.0)
        v21 = v19;
      v11 = fabs(v21) - fmod(v20, 1.0);
    }

    objc_msgSend(MEMORY[0x1E0C99E88], "timerWithTimeInterval:target:selector:userInfo:repeats:", self, sel__fireAndUpdateTimerIfNecessary, 0, 1, v11);
    v22 = (NSTimer *)objc_claimAutoreleasedReturnValue();
    timer = self->_timer;
    self->_timer = v22;

    v24 = self->_timer;
    objc_opt_self();
    if (v24)
    {
      if ((_MergedGlobals_19 & 1) == 0)
      {
        _MergedGlobals_19 = 1;
        Main = CFRunLoopGetMain();
        CFRunLoopPerformBlock(Main, (CFTypeRef)*MEMORY[0x1E0C9B280], &__block_literal_global_17);
      }
      objc_msgSend((id)qword_1ECD39928, "addObject:", v24);
    }

  }
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (WeakRetained && (objc_opt_respondsToSelector() & 1) != 0)
  {
    currValue = self->_currValue;
    if (currValue >= 0)
      v28 = currValue;
    else
      v28 = -currValue;
    objc_msgSend(WeakRetained, "timerFiredWithValue:forResolution:comparedToNow:", v28, *p_currResolution, v29);
  }

}

- (void)powerMonitorSystemDidWakeFromSleep:(id)a3
{
  _QWORD v3[4];
  id v4;
  id location;

  objc_initWeak(&location, self);
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __58__BSRelativeDateTimer_powerMonitorSystemDidWakeFromSleep___block_invoke;
  v3[3] = &unk_1E1EBF4D8;
  objc_copyWeak(&v4, &location);
  BSDispatchMain(v3);
  objc_destroyWeak(&v4);
  objc_destroyWeak(&location);
}

void __58__BSRelativeDateTimer_powerMonitorSystemDidWakeFromSleep___block_invoke(uint64_t a1)
{
  _QWORD *WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained && WeakRetained[3])
    objc_msgSend(WeakRetained, "fireAndSchedule");

}

- (BSRelativeDateTimerDelegate)delegate
{
  return (BSRelativeDateTimerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_date, 0);
  objc_storeStrong((id *)&self->_timer, 0);
  objc_storeStrong((id *)&self->_gregorian, 0);
}

@end
