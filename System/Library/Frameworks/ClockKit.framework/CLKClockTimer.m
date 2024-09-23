@implementation CLKClockTimer

+ (CLKClockTimer)sharedInstance
{
  if (sharedInstance_onceToken_0 != -1)
    dispatch_once(&sharedInstance_onceToken_0, &__block_literal_global_13);
  return (CLKClockTimer *)(id)sharedInstance___sharedInstance;
}

void __31__CLKClockTimer_sharedInstance__block_invoke()
{
  CLKClockTimer *v0;
  void *v1;

  v0 = -[CLKClockTimer initWithIdentifier:]([CLKClockTimer alloc], "initWithIdentifier:", CFSTR("sharedInstance"));
  v1 = (void *)sharedInstance___sharedInstance;
  sharedInstance___sharedInstance = (uint64_t)v0;

}

+ (id)now
{
  void *v2;
  void *v3;
  id v4;
  void *v5;
  void *v6;

  CLKForcedTime();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
  {
    v4 = v2;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDBCE60], "date");
    v4 = (id)objc_claimAutoreleasedReturnValue();
  }
  v5 = v4;

  objc_msgSend(v5, "dateByAddingTimeInterval:", 0.05);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (CLKClockTimer)init
{
  return -[CLKClockTimer initWithIdentifier:](self, "initWithIdentifier:", CFSTR("<anonymous>"));
}

- (CLKClockTimer)initWithIdentifier:(id)a3
{
  id v4;
  char *v5;
  uint64_t i;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  int64x2_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  objc_super v18;

  v4 = a3;
  v18.receiver = self;
  v18.super_class = (Class)CLKClockTimer;
  v5 = -[CLKClockTimer init](&v18, sel_init);
  if (v5)
  {
    for (i = 16; i != 56; i += 8)
    {
      objc_msgSend(MEMORY[0x24BDD15C0], "weakObjectsHashTable");
      v7 = objc_claimAutoreleasedReturnValue();
      v8 = *(void **)&v5[i];
      *(_QWORD *)&v5[i] = v7;

    }
    v9 = objc_msgSend(v4, "copy");
    v10 = (void *)*((_QWORD *)v5 + 21);
    *((_QWORD *)v5 + 21) = v9;

    objc_msgSend(MEMORY[0x24BDD15C0], "weakObjectsHashTable");
    v11 = objc_claimAutoreleasedReturnValue();
    v12 = (void *)*((_QWORD *)v5 + 7);
    *((_QWORD *)v5 + 7) = v11;

    *((_QWORD *)v5 + 15) = 0x7FFFFFFFFFFFFFFFLL;
    v13 = vdupq_n_s64(0x7FFFFFFFFFFFFFFFuLL);
    *(int64x2_t *)(v5 + 104) = v13;
    *(int64x2_t *)(v5 + 88) = v13;
    objc_msgSend(MEMORY[0x24BDBCE48], "autoupdatingCurrentCalendar");
    v14 = objc_claimAutoreleasedReturnValue();
    v15 = (void *)*((_QWORD *)v5 + 19);
    *((_QWORD *)v5 + 19) = v14;

    v5[160] = 0;
    *((_DWORD *)v5 + 32) = 16843008;
    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "addObserver:selector:name:object:", v5, sel__handleTimePassed, *MEMORY[0x24BEBDFF0], 0);

  }
  return (CLKClockTimer *)v5;
}

- (void)dealloc
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)CLKClockTimer;
  -[CLKClockTimer dealloc](&v2, sel_dealloc);
}

- (id)startUpdatesWithUpdateFrequency:(int64_t)a3 withHandler:(id)a4 identificationLog:(id)a5
{
  uint64_t v8;
  void *v10;
  NSHashTable *v11;
  NSObject *v12;
  void *v13;
  NSUInteger v14;
  int v15;
  void *v16;
  __int16 v17;
  const char *v18;
  __int16 v19;
  NSUInteger v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  if ((unint64_t)a3 >= 2)
  {
    if (a3 == 5)
      return 0;
    v8 = 0;
  }
  else
  {
    v8 = 1;
  }
  -[CLKClockTimer _nextTokenWithUpdateFrequency:wantsCommit:wantsHighAccuracy:identificationLog:handler:](self, "_nextTokenWithUpdateFrequency:wantsCommit:wantsHighAccuracy:identificationLog:handler:", a3, 0, v8, a5, a4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = self->_handlersByUpdateFrequency[a3];
  -[NSHashTable addObject:](v11, "addObject:", v10);
  -[NSHashTable addObject:](self->_allHandlers, "addObject:", v10);
  CLKLoggingObjectForDomain(2);
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    -[CLKClockTimer identifier](self, "identifier");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = -[NSHashTable count](self->_allHandlers, "count");
    v15 = 138412802;
    v16 = v13;
    v17 = 2080;
    v18 = "-[CLKClockTimer startUpdatesWithUpdateFrequency:withHandler:identificationLog:]";
    v19 = 2048;
    v20 = v14;
    _os_log_impl(&dword_2114F4000, v12, OS_LOG_TYPE_DEFAULT, "%@ - %s, _allHandlers.count = %lu", (uint8_t *)&v15, 0x20u);

  }
  -[CLKClockTimer _updateDisplayLink](self, "_updateDisplayLink");

  return v10;
}

- (void)stopUpdatesForToken:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  NSUInteger v7;
  int v8;
  void *v9;
  __int16 v10;
  const char *v11;
  __int16 v12;
  NSUInteger v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(v4, "setIsActive:", 0);
  objc_msgSend(v4, "setHandler:", 0);
  objc_msgSend(v4, "setLog:", 0);
  -[NSHashTable removeObject:](self->_handlersByUpdateFrequency[objc_msgSend(v4, "updateFrequency")], "removeObject:", v4);
  -[NSHashTable removeObject:](self->_allHandlers, "removeObject:", v4);

  CLKLoggingObjectForDomain(2);
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    -[CLKClockTimer identifier](self, "identifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = -[NSHashTable count](self->_allHandlers, "count");
    v8 = 138412802;
    v9 = v6;
    v10 = 2080;
    v11 = "-[CLKClockTimer stopUpdatesForToken:]";
    v12 = 2048;
    v13 = v7;
    _os_log_impl(&dword_2114F4000, v5, OS_LOG_TYPE_DEFAULT, "%@ - %s, _allHandlers.count = %lu", (uint8_t *)&v8, 0x20u);

  }
  -[CLKClockTimer _updateDisplayLink](self, "_updateDisplayLink");
  -[CLKClockTimer _maybeClearLastSeenTimeComponents](self, "_maybeClearLastSeenTimeComponents");
}

- (id)_nextTokenWithUpdateFrequency:(int64_t)a3 wantsCommit:(BOOL)a4 wantsHighAccuracy:(BOOL)a5 identificationLog:(id)a6 handler:(id)a7
{
  _BOOL8 v8;
  _BOOL8 v9;
  id v12;
  id v13;
  CLKClockTimerToken *v14;

  v8 = a5;
  v9 = a4;
  v12 = a6;
  v13 = a7;
  v14 = -[CLKClockTimerToken initWithID:]([CLKClockTimerToken alloc], "initWithID:", self->_nextToken++);
  if (!v12)
    v12 = (id)objc_msgSend(&__block_literal_global_83, "copy");
  -[CLKClockTimerToken setWantsCommit:](v14, "setWantsCommit:", v9);
  -[CLKClockTimerToken setWantsHighAccuracy:](v14, "setWantsHighAccuracy:", v8);
  -[CLKClockTimerToken setUpdateFrequency:](v14, "setUpdateFrequency:", a3);
  -[CLKClockTimerToken setLog:](v14, "setLog:", v12);
  -[CLKClockTimerToken setHandler:](v14, "setHandler:", v13);

  -[CLKClockTimerToken setIsActive:](v14, "setIsActive:", 1);
  -[CLKClockTimerToken setOwner:](v14, "setOwner:", self);

  return v14;
}

const __CFString *__103__CLKClockTimer__nextTokenWithUpdateFrequency_wantsCommit_wantsHighAccuracy_identificationLog_handler___block_invoke()
{
  return CFSTR("No identification log provided");
}

- (void)setHandler:(id)a3 wantsCommit:(BOOL)a4
{
  objc_msgSend(a3, "setWantsCommit:", a4);
}

- (id)startMinuteUpdatesWithHandler:(id)a3 identificationLog:(id)a4
{
  id v6;
  id v7;
  void *v8;
  _QWORD v10[4];
  id v11;

  v6 = a3;
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __65__CLKClockTimer_startMinuteUpdatesWithHandler_identificationLog___block_invoke;
  v10[3] = &unk_24CBFA7F0;
  v11 = v6;
  v7 = v6;
  -[CLKClockTimer startUpdatesWithUpdateFrequency:withHandler:identificationLog:](self, "startUpdatesWithUpdateFrequency:withHandler:identificationLog:", 0, v10, a4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

void __65__CLKClockTimer_startMinuteUpdatesWithHandler_identificationLog___block_invoke(uint64_t a1, void *a2, id *a3)
{
  id v5;

  v5 = a2;
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

- (id)startSecondUpdatesWithHandler:(id)a3 identificationLog:(id)a4
{
  id v6;
  id v7;
  void *v8;
  _QWORD v10[4];
  id v11;

  v6 = a3;
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __65__CLKClockTimer_startSecondUpdatesWithHandler_identificationLog___block_invoke;
  v10[3] = &unk_24CBFA7F0;
  v11 = v6;
  v7 = v6;
  -[CLKClockTimer startUpdatesWithUpdateFrequency:withHandler:identificationLog:](self, "startUpdatesWithUpdateFrequency:withHandler:identificationLog:", 1, v10, a4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

void __65__CLKClockTimer_startSecondUpdatesWithHandler_identificationLog___block_invoke(uint64_t a1, void *a2, id *a3)
{
  id v5;

  v5 = a2;
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

- (id)start15fpsUpdatesWithHandler:(id)a3 identificationLog:(id)a4
{
  id v6;
  id v7;
  void *v8;
  _QWORD v10[4];
  id v11;

  v6 = a3;
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __64__CLKClockTimer_start15fpsUpdatesWithHandler_identificationLog___block_invoke;
  v10[3] = &unk_24CBFA7F0;
  v11 = v6;
  v7 = v6;
  -[CLKClockTimer startUpdatesWithUpdateFrequency:withHandler:identificationLog:](self, "startUpdatesWithUpdateFrequency:withHandler:identificationLog:", 2, v10, a4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

void __64__CLKClockTimer_start15fpsUpdatesWithHandler_identificationLog___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;

  v5 = a2;
  (*(void (**)(double))(*(_QWORD *)(a1 + 32) + 16))(*(double *)(a3 + 32));

}

- (id)start30fpsUpdatesWithHandler:(id)a3 identificationLog:(id)a4
{
  id v6;
  id v7;
  void *v8;
  _QWORD v10[4];
  id v11;

  v6 = a3;
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __64__CLKClockTimer_start30fpsUpdatesWithHandler_identificationLog___block_invoke;
  v10[3] = &unk_24CBFA7F0;
  v11 = v6;
  v7 = v6;
  -[CLKClockTimer startUpdatesWithUpdateFrequency:withHandler:identificationLog:](self, "startUpdatesWithUpdateFrequency:withHandler:identificationLog:", 3, v10, a4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

void __64__CLKClockTimer_start30fpsUpdatesWithHandler_identificationLog___block_invoke(uint64_t a1, void *a2, id *a3)
{
  id v5;

  v5 = a2;
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

- (id)start60fpsUpdatesWithHandler:(id)a3 identificationLog:(id)a4
{
  id v6;
  id v7;
  void *v8;
  _QWORD v10[4];
  id v11;

  v6 = a3;
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __64__CLKClockTimer_start60fpsUpdatesWithHandler_identificationLog___block_invoke;
  v10[3] = &unk_24CBFA7F0;
  v11 = v6;
  v7 = v6;
  -[CLKClockTimer startUpdatesWithUpdateFrequency:withHandler:identificationLog:](self, "startUpdatesWithUpdateFrequency:withHandler:identificationLog:", 4, v10, a4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

void __64__CLKClockTimer_start60fpsUpdatesWithHandler_identificationLog___block_invoke(uint64_t a1, void *a2, id *a3)
{
  id v5;

  v5 = a2;
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

- (BOOL)_hasHandlers
{
  return -[NSHashTable count](self->_allHandlers, "count") != 0;
}

- (int64_t)_minimumPossibleUpdateFrequency
{
  if (-[NSHashTable count](self->_handlersByUpdateFrequency[4], "count"))
    return 4;
  if (-[NSHashTable count](self->_handlersByUpdateFrequency[3], "count"))
    return 3;
  if (-[NSHashTable count](self->_handlersByUpdateFrequency[2], "count"))
    return 2;
  if (!-[NSHashTable count](self->_handlersByUpdateFrequency[1], "count"))
    -[NSHashTable count](self->_handlersByUpdateFrequency[0], "count");
  return 0x7FFFFFFFFFFFFFFFLL;
}

- (double)_timeUntilNextHighAccuracyEventFromHour:(int64_t)a3 minute:(int64_t)a4 second:(int64_t)a5 nanosecond:(int64_t)a6
{
  double v8;

  v8 = (double)a6 / -1000000000.0 + 1.0;
  if (!-[NSHashTable count](self->_handlersByUpdateFrequency[1], "count", a3, a4))
  {
    if (-[NSHashTable count](self->_handlersByUpdateFrequency[0], "count"))
      return v8 + (double)(59 - a5);
    else
      return INFINITY;
  }
  return v8;
}

- (double)_timeUntilNextHighAccuracyEventFromNow
{
  void *v3;
  double v4;
  double v5;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  +[CLKClockTimer now](CLKClockTimer, "now");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = 0x7FFFFFFFFFFFFFFFLL;
  v10 = 0x7FFFFFFFFFFFFFFFLL;
  v7 = 0x7FFFFFFFFFFFFFFFLL;
  v8 = 0x7FFFFFFFFFFFFFFFLL;
  -[NSCalendar getHour:minute:second:nanosecond:fromDate:](self->_calendar, "getHour:minute:second:nanosecond:fromDate:", &v10, &v9, &v8, &v7, v3);
  -[CLKClockTimer _timeUntilNextHighAccuracyEventFromHour:minute:second:nanosecond:](self, "_timeUntilNextHighAccuracyEventFromHour:minute:second:nanosecond:", v10, v9, v8, v7);
  v5 = v4;

  return v5;
}

- (void)_cancelWaitTimer
{
  NSObject *waitForNextEventTimer;
  OS_dispatch_source *v4;
  NSDate *waitTimerScheduledFireTime;

  waitForNextEventTimer = self->_waitForNextEventTimer;
  if (waitForNextEventTimer)
  {
    dispatch_source_cancel(waitForNextEventTimer);
    v4 = self->_waitForNextEventTimer;
    self->_waitForNextEventTimer = 0;

    waitTimerScheduledFireTime = self->_waitTimerScheduledFireTime;
    self->_waitTimerScheduledFireTime = 0;

  }
}

- (void)_createDisplayLinkIfNeeded
{
  CADisplayLink *v3;
  CADisplayLink *displayLink;
  CADisplayLink *v5;
  id v6;

  if (!self->_displayLink)
  {
    objc_msgSend(MEMORY[0x24BDE5670], "displayLinkWithTarget:selector:", self, sel__onDisplayLink_);
    v3 = (CADisplayLink *)objc_claimAutoreleasedReturnValue();
    displayLink = self->_displayLink;
    self->_displayLink = v3;

    v5 = self->_displayLink;
    objc_msgSend(MEMORY[0x24BDBCF18], "mainRunLoop");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    -[CADisplayLink addToRunLoop:forMode:](v5, "addToRunLoop:forMode:", v6, *MEMORY[0x24BDBCB80]);

  }
}

- (void)_setDisplayLinkFrameInterval:(int64_t)a3
{
  -[CLKClockTimer _createDisplayLinkIfNeeded](self, "_createDisplayLinkIfNeeded");
  if (-[CADisplayLink frameInterval](self->_displayLink, "frameInterval") != a3)
  {
    -[CADisplayLink setFrameInterval:](self->_displayLink, "setFrameInterval:", a3);
    kdebug_trace();
  }
}

- (void)_updateDisplayLinkWithTimeUntilNextHighAccuracyEvent:(double)a3 withMinimumUpdateFrequency:(int64_t)a4
{
  uint64_t v7;
  void *v8;
  double v9;
  void *v10;
  void *v11;
  double v12;
  OS_dispatch_source *v13;
  OS_dispatch_source *waitForNextEventTimer;
  NSObject *v15;
  dispatch_time_t v16;
  CADisplayLink *displayLink;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void (*v21)(uint64_t);
  void *v22;
  id v23;
  id location;

  if (!self->_permittedToRun || !-[CLKClockTimer _hasHandlers](self, "_hasHandlers"))
  {
    -[CADisplayLink setPaused:](self->_displayLink, "setPaused:", 1, a3);
    -[CLKClockTimer _cancelWaitTimer](self, "_cancelWaitTimer");
    return;
  }
  v7 = 0x7FFFFFFFFFFFFFFFLL;
  if (a4 != 0x7FFFFFFFFFFFFFFFLL)
    v7 = CLKClockTimerFrameIntervalForUpdateFrequency[a4];
  if (a3 <= 0.0833333333)
  {
    -[CLKClockTimer _cancelWaitTimer](self, "_cancelWaitTimer");
    v7 = 1;
LABEL_16:
    -[CLKClockTimer _setDisplayLinkFrameInterval:](self, "_setDisplayLinkFrameInterval:", v7, v19, v20, v21, v22);
    displayLink = self->_displayLink;
    v18 = 0;
    goto LABEL_17;
  }
  if (a3 < INFINITY && v7 != 1)
  {
    +[CLKClockTimer now](CLKClockTimer, "now");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = a3 + -0.05 + -0.0166666667;
    objc_msgSend(v8, "dateByAddingTimeInterval:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v10;
    if (!self->_waitTimerScheduledFireTime || (objc_msgSend(v10, "timeIntervalSinceDate:"), fabs(v12) > 0.0166666667))
    {
      -[CLKClockTimer _cancelWaitTimer](self, "_cancelWaitTimer");
      objc_storeStrong((id *)&self->_waitTimerScheduledFireTime, v11);
      objc_initWeak(&location, self);
      v13 = (OS_dispatch_source *)dispatch_source_create(MEMORY[0x24BDACA18], 0, 1uLL, MEMORY[0x24BDAC9B8]);
      waitForNextEventTimer = self->_waitForNextEventTimer;
      self->_waitForNextEventTimer = v13;

      v15 = self->_waitForNextEventTimer;
      v19 = MEMORY[0x24BDAC760];
      v20 = 3221225472;
      v21 = __97__CLKClockTimer__updateDisplayLinkWithTimeUntilNextHighAccuracyEvent_withMinimumUpdateFrequency___block_invoke;
      v22 = &unk_24CBF9088;
      objc_copyWeak(&v23, &location);
      dispatch_source_set_event_handler(v15, &v19);
      v16 = dispatch_time(0, (uint64_t)(v9 * 1000000000.0));
      dispatch_source_set_timer((dispatch_source_t)self->_waitForNextEventTimer, v16, 0xFFFFFFFFFFFFFFFFLL, 0xFE502AuLL);
      dispatch_resume((dispatch_object_t)self->_waitForNextEventTimer);
      objc_destroyWeak(&v23);
      objc_destroyWeak(&location);
    }

  }
  if (v7 != 0x7FFFFFFFFFFFFFFFLL)
    goto LABEL_16;
  displayLink = self->_displayLink;
  v18 = 1;
LABEL_17:
  -[CADisplayLink setPaused:](displayLink, "setPaused:", v18, v19, v20, v21, v22);
}

void __97__CLKClockTimer__updateDisplayLinkWithTimeUntilNextHighAccuracyEvent_withMinimumUpdateFrequency___block_invoke(uint64_t a1)
{
  _QWORD *WeakRetained;
  void *v2;
  id v3;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v2 = (void *)WeakRetained[17];
    WeakRetained[17] = 0;
    v3 = WeakRetained;

    objc_msgSend(v3, "_updateDisplayLink");
    WeakRetained = v3;
  }

}

- (void)_updateDisplayLink
{
  double v3;

  -[CLKClockTimer _timeUntilNextHighAccuracyEventFromNow](self, "_timeUntilNextHighAccuracyEventFromNow");
  -[CLKClockTimer _updateDisplayLinkWithTimeUntilNextHighAccuracyEvent:withMinimumUpdateFrequency:](self, "_updateDisplayLinkWithTimeUntilNextHighAccuracyEvent:withMinimumUpdateFrequency:", -[CLKClockTimer _minimumPossibleUpdateFrequency](self, "_minimumPossibleUpdateFrequency"), v3);
}

- (void)_maybeClearLastSeenTimeComponents
{
  uint64_t v3;
  int64x2_t v4;

  if (!self->_permittedToRun)
  {
    self->_last60fps = 0x7FFFFFFFFFFFFFFFLL;
    v4 = vdupq_n_s64(0x7FFFFFFFFFFFFFFFuLL);
    *(int64x2_t *)&self->_last15fps = v4;
    *(int64x2_t *)&self->_lastMinute = v4;
    v3 = 80;
    goto LABEL_13;
  }
  if (!-[NSHashTable count](self->_handlersByUpdateFrequency[0], "count"))
    self->_lastMinute = 0x7FFFFFFFFFFFFFFFLL;
  if (!-[NSHashTable count](self->_handlersByUpdateFrequency[1], "count"))
    self->_lastSecond = 0x7FFFFFFFFFFFFFFFLL;
  if (!-[NSHashTable count](self->_handlersByUpdateFrequency[2], "count"))
    self->_last15fps = 0x7FFFFFFFFFFFFFFFLL;
  if (!-[NSHashTable count](self->_handlersByUpdateFrequency[3], "count"))
    self->_last30fps = 0x7FFFFFFFFFFFFFFFLL;
  if (!-[NSHashTable count](self->_handlersByUpdateFrequency[4], "count"))
  {
    v3 = 120;
LABEL_13:
    *(Class *)((char *)&self->super.isa + v3) = (Class)0x7FFFFFFFFFFFFFFFLL;
  }
}

- (void)_handleTimePassed
{
  CLKClockTimer *v2;
  double v3;
  double v4;
  double v5;
  int64_t lastHour;
  int64_t lastMinute;
  uint64_t v8;
  int64_t v9;
  int64_t v10;
  int64_t v11;
  int64_t lastSecond;
  uint64_t v13;
  char v14;
  double v15;
  int64_t v16;
  int64_t v17;
  int64_t v18;
  BOOL v19;
  int v20;
  _BOOL4 v21;
  char v22;
  char v23;
  int64_t last60fps;
  char v25;
  char v26;
  int64_t v27;
  CLKClockTimer *v28;
  uint64_t v29;
  uint64_t v30;
  int64_t v31;
  int64_t v32;
  int64_t v33;
  char v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t i;
  void *v38;
  char v39;
  void *v40;
  id v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t j;
  double v45;
  _BOOL4 v46;
  int64_t v47;
  int64_t v48;
  int v49;
  id obj;
  NSHashTable *v51;
  id v52;
  id v53;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  _QWORD v59[6];
  id v60;
  int64_t v61;
  int64_t v62;
  int64_t v63;
  double v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  _BYTE v69[5];
  uint64_t v70;
  int64_t v71;
  int64_t v72;
  int64_t v73;
  _BYTE v74[128];
  _BYTE v75[128];
  uint64_t v76;

  v76 = *MEMORY[0x24BDAC8D0];
  +[CLKClockTimer now](CLKClockTimer, "now");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v72 = 0x7FFFFFFFFFFFFFFFLL;
  v73 = 0x7FFFFFFFFFFFFFFFLL;
  v70 = 0x7FFFFFFFFFFFFFFFLL;
  v71 = 0x7FFFFFFFFFFFFFFFLL;
  v2 = self;
  -[NSDate timeIntervalSinceReferenceDate](self->_lastNow, "timeIntervalSinceReferenceDate");
  v4 = v3;
  objc_msgSend(obj, "timeIntervalSinceReferenceDate");
  if (!self->_lastNow
    || (lastHour = self->_lastHour, lastHour == 0x7FFFFFFFFFFFFFFFLL)
    || (lastMinute = self->_lastMinute, lastMinute == 0x7FFFFFFFFFFFFFFFLL)
    || (lastSecond = self->_lastSecond, lastSecond == 0x7FFFFFFFFFFFFFFFLL)
    || *(uint64_t *)&v4 != *(uint64_t *)&v5)
  {
    -[NSCalendar getHour:minute:second:nanosecond:fromDate:](self->_calendar, "getHour:minute:second:nanosecond:fromDate:", &v73, &v72, &v71, &v70, obj);
    v8 = v70;
    v9 = v71;
    v11 = v72;
    v10 = v73;
    v2 = self;
    lastHour = self->_lastHour;
    lastMinute = self->_lastMinute;
    lastSecond = self->_lastSecond;
  }
  else
  {
    v72 = self->_lastMinute;
    v73 = lastHour;
    v8 = (uint64_t)((v5 - (double)(uint64_t)v4) * 1000000000.0);
    v70 = v8;
    v71 = lastSecond;
    v9 = lastSecond;
    v11 = lastMinute;
    v10 = lastHour;
  }
  v13 = 0;
  v14 = 0;
  v15 = (double)v8 / 1000000000.0;
  v16 = (uint64_t)(v15 / 0.0666666667);
  v17 = (uint64_t)(v15 / 0.0333333333);
  v47 = v9;
  v48 = lastSecond;
  v18 = (uint64_t)(v15 / 0.0166666667);
  v19 = v11 == lastMinute && v10 == lastHour;
  v20 = !v19;
  v21 = !v19 || v9 != lastSecond;
  v22 = v2->_last15fps != v16 || v21;
  v23 = v2->_last30fps != v17 || v21;
  v69[2] = v22;
  last60fps = v2->_last60fps;
  v49 = v20;
  v69[0] = v20;
  v69[3] = v23;
  v25 = last60fps != v18 || v21;
  v46 = v21;
  v69[1] = v21;
  v69[4] = v25;
  do
  {
    v26 = v69[v13];
    if (v26)
    {
      v26 = -[NSHashTable count](v2->_handlersByUpdateFrequency[v13], "count") != 0;
      v2 = self;
    }
    v14 |= v26;
    ++v13;
  }
  while (v13 != 5);
  objc_storeStrong((id *)&self->_lastNow, obj);
  v27 = v72;
  v28 = self;
  self->_lastHour = v73;
  self->_lastMinute = v27;
  self->_lastSecond = v71;
  self->_last15fps = v16;
  self->_last30fps = v17;
  self->_last60fps = v18;
  if ((v14 & 1) != 0)
  {
    v52 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
    v29 = 0;
    v30 = 0;
    do
    {
      v30 |= v69[v29] << v29;
      ++v29;
    }
    while (v29 != 5);
    v53 = obj;
    v31 = v72;
    v32 = v73;
    v33 = v71;
    v65 = 0u;
    v66 = 0u;
    v67 = 0u;
    v68 = 0u;
    v51 = self->_allHandlers;
    v34 = 0;
    v35 = -[NSHashTable countByEnumeratingWithState:objects:count:](v51, "countByEnumeratingWithState:objects:count:", &v65, v75, 16);
    if (v35)
    {
      v36 = *(_QWORD *)v66;
      do
      {
        for (i = 0; i != v35; ++i)
        {
          if (*(_QWORD *)v66 != v36)
            objc_enumerationMutation(v51);
          v38 = *(void **)(*((_QWORD *)&v65 + 1) + 8 * i);
          if ((v30 & (1 << objc_msgSend(v38, "updateFrequency"))) != 0)
          {
            v39 = objc_msgSend(v38, "wantsCommit");
            v59[0] = MEMORY[0x24BDAC760];
            v59[1] = 3254779904;
            v59[2] = __34__CLKClockTimer__handleTimePassed__block_invoke;
            v59[3] = &unk_24CBFA818;
            v59[4] = v38;
            v59[5] = self;
            v60 = v53;
            v61 = v32;
            v62 = v31;
            v63 = v33;
            v64 = v15;
            v40 = (void *)MEMORY[0x212BDBEAC](v59);
            objc_msgSend(v52, "addObject:", v40);

            v34 |= v39;
          }
        }
        v35 = -[NSHashTable countByEnumeratingWithState:objects:count:](v51, "countByEnumeratingWithState:objects:count:", &v65, v75, 16);
      }
      while (v35);
    }

    if ((v49 | (v47 != v48)) == 1)
    {
      objc_msgSend(v53, "timeIntervalSinceReferenceDate");
      kdebug_trace();
    }
    if (v49 && -[NSHashTable count](self->_handlersByUpdateFrequency[0], "count"))
      kdebug_trace();
    if (v46 && -[NSHashTable count](self->_handlersByUpdateFrequency[1], "count"))
      kdebug_trace();
    if ((v34 & 1) != 0)
      objc_msgSend(MEMORY[0x24BDE57D8], "begin");
    v57 = 0u;
    v58 = 0u;
    v55 = 0u;
    v56 = 0u;
    v41 = v52;
    v42 = objc_msgSend(v41, "countByEnumeratingWithState:objects:count:", &v55, v74, 16);
    if (v42)
    {
      v43 = *(_QWORD *)v56;
      do
      {
        for (j = 0; j != v42; ++j)
        {
          if (*(_QWORD *)v56 != v43)
            objc_enumerationMutation(v41);
          (*(void (**)(void))(*(_QWORD *)(*((_QWORD *)&v55 + 1) + 8 * j) + 16))();
        }
        v42 = objc_msgSend(v41, "countByEnumeratingWithState:objects:count:", &v55, v74, 16);
      }
      while (v42);
    }

    if ((v34 & 1) != 0)
      objc_msgSend(MEMORY[0x24BDE57D8], "commit");

    v28 = self;
  }
  -[CLKClockTimer _timeUntilNextHighAccuracyEventFromHour:minute:second:nanosecond:](v28, "_timeUntilNextHighAccuracyEventFromHour:minute:second:nanosecond:");
  -[CLKClockTimer _updateDisplayLinkWithTimeUntilNextHighAccuracyEvent:withMinimumUpdateFrequency:](self, "_updateDisplayLinkWithTimeUntilNextHighAccuracyEvent:withMinimumUpdateFrequency:", -[CLKClockTimer _minimumPossibleUpdateFrequency](self, "_minimumPossibleUpdateFrequency"), v45);

}

void __34__CLKClockTimer__handleTimePassed__block_invoke(uint64_t a1)
{
  void (**v2)(_QWORD, _QWORD, _QWORD);
  uint64_t v3;
  __int128 v4;
  id v5;
  __int128 v6;
  __int128 v7;

  if (objc_msgSend(*(id *)(a1 + 32), "isActive"))
  {
    objc_msgSend(*(id *)(a1 + 32), "handler");
    v2 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    v3 = *(_QWORD *)(a1 + 40);
    v5 = *(id *)(a1 + 48);
    v4 = *(_OWORD *)(a1 + 72);
    v6 = *(_OWORD *)(a1 + 56);
    v7 = v4;
    ((void (**)(_QWORD, uint64_t, id *))v2)[2](v2, v3, &v5);

  }
}

- (void)_updateIsPermittedToRun
{
  _BOOL4 v3;
  _BOOL4 isForeground;
  NSObject *v5;
  void *v6;
  NSUInteger v7;
  _BOOL4 v8;
  _BOOL4 v9;
  _BOOL4 v10;
  char v11;
  NSObject *v12;
  void *v13;
  NSUInteger v14;
  _BOOL4 v15;
  _BOOL4 v16;
  _BOOL4 v17;
  NSObject *v18;
  void *v19;
  NSUInteger v20;
  _BOOL4 v21;
  _BOOL4 backlightOn;
  _BOOL4 ignoreScreenState;
  int v24;
  void *v25;
  __int16 v26;
  const char *v27;
  __int16 v28;
  NSUInteger v29;
  __int16 v30;
  int v31;
  __int16 v32;
  _BOOL4 v33;
  __int16 v34;
  _BOOL4 v35;
  __int16 v36;
  _BOOL4 v37;
  uint64_t v38;

  v38 = *MEMORY[0x24BDAC8D0];
  v3 = !self->_paused;
  if (!self->_ignoreScreenState)
  {
    isForeground = self->_isForeground;
    if (self->_isForeground)
      isForeground = self->_backlightOn;
    v3 = !self->_paused && isForeground;
  }
  if (v3 || !self->_permittedToRun)
  {
    v11 = !v3;
    if (self->_permittedToRun)
      v11 = 1;
    if ((v11 & 1) != 0)
    {
      CLKLoggingObjectForDomain(2);
      v18 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        -[CLKClockTimer identifier](self, "identifier");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v20 = -[NSHashTable count](self->_allHandlers, "count");
        v21 = self->_isForeground;
        backlightOn = self->_backlightOn;
        ignoreScreenState = self->_ignoreScreenState;
        v24 = 138413826;
        v25 = v19;
        v26 = 2080;
        v27 = "-[CLKClockTimer _updateIsPermittedToRun]";
        v28 = 2048;
        v29 = v20;
        v30 = 1024;
        v31 = v3;
        v32 = 1024;
        v33 = v21;
        v34 = 1024;
        v35 = backlightOn;
        v36 = 1024;
        v37 = ignoreScreenState;
        _os_log_impl(&dword_2114F4000, v18, OS_LOG_TYPE_DEFAULT, "No update %@ - %s, _allHandlers.count = %lu, shouldPermitToRun = %d, _isForeground = %d, _backlightOn = %d, _ignoreScreenState = %d", (uint8_t *)&v24, 0x38u);

      }
    }
    else
    {
      kdebug_trace();
      -[CLKClockTimer _maybeClearLastSeenTimeComponents](self, "_maybeClearLastSeenTimeComponents");
      self->_permittedToRun = 1;
      CLKLoggingObjectForDomain(2);
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        -[CLKClockTimer identifier](self, "identifier");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = -[NSHashTable count](self->_allHandlers, "count");
        v15 = self->_isForeground;
        v16 = self->_backlightOn;
        v17 = self->_ignoreScreenState;
        v24 = 138413826;
        v25 = v13;
        v26 = 2080;
        v27 = "-[CLKClockTimer _updateIsPermittedToRun]";
        v28 = 2048;
        v29 = v14;
        v30 = 1024;
        v31 = 1;
        v32 = 1024;
        v33 = v15;
        v34 = 1024;
        v35 = v16;
        v36 = 1024;
        v37 = v17;
        _os_log_impl(&dword_2114F4000, v12, OS_LOG_TYPE_DEFAULT, "Resuming %@ - %s, _allHandlers.count = %lu, shouldPermitToRun = %d, _isForeground = %d, _backlightOn = %d, _ignoreScreenState = %d", (uint8_t *)&v24, 0x38u);

      }
      -[CLKClockTimer _updateDisplayLink](self, "_updateDisplayLink");
      -[CLKClockTimer _handleTimePassed](self, "_handleTimePassed");
    }
  }
  else
  {
    kdebug_trace();
    self->_permittedToRun = 0;
    CLKLoggingObjectForDomain(2);
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      -[CLKClockTimer identifier](self, "identifier");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = -[NSHashTable count](self->_allHandlers, "count");
      v8 = self->_isForeground;
      v9 = self->_backlightOn;
      v10 = self->_ignoreScreenState;
      v24 = 138413826;
      v25 = v6;
      v26 = 2080;
      v27 = "-[CLKClockTimer _updateIsPermittedToRun]";
      v28 = 2048;
      v29 = v7;
      v30 = 1024;
      v31 = 0;
      v32 = 1024;
      v33 = v8;
      v34 = 1024;
      v35 = v9;
      v36 = 1024;
      v37 = v10;
      _os_log_impl(&dword_2114F4000, v5, OS_LOG_TYPE_DEFAULT, "Pausing %@ - %s, _allHandlers.count = %lu, shouldPermitToRun = %d, _isForeground = %d, _backlightOn = %d, _ignoreScreenState = %d", (uint8_t *)&v24, 0x38u);

    }
    -[CLKClockTimer _updateDisplayLink](self, "_updateDisplayLink");
  }
}

- (void)setIgnoreScreenState:(BOOL)a3
{
  self->_ignoreScreenState = a3;
  -[CLKClockTimer _updateIsPermittedToRun](self, "_updateIsPermittedToRun");
}

- (void)unpause
{
  self->_paused = 0;
  -[CLKClockTimer _updateIsPermittedToRun](self, "_updateIsPermittedToRun");
}

- (void)pause
{
  self->_paused = 1;
  -[CLKClockTimer _updateIsPermittedToRun](self, "_updateIsPermittedToRun");
}

- (id)description
{
  return (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("<CLKClockTimer: %p-%@>"), self, self->_identifier);
}

- (BOOL)ignoreScreenState
{
  return self->_ignoreScreenState;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void).cxx_destruct
{
  uint64_t i;

  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_calendar, 0);
  objc_storeStrong((id *)&self->_waitForNextEventTimer, 0);
  objc_storeStrong((id *)&self->_waitTimerScheduledFireTime, 0);
  objc_storeStrong((id *)&self->_lastNow, 0);
  objc_storeStrong((id *)&self->_allHandlers, 0);
  for (i = 48; i != 8; i -= 8)
    objc_storeStrong((id *)((char *)&self->super.isa + i), 0);
  objc_storeStrong((id *)&self->_displayLink, 0);
}

@end
