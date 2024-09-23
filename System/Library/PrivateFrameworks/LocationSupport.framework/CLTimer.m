@implementation CLTimer

- (void)updateScheduler
{
  -[CLTimerScheduler reflectNextFireDelay:fireInterval:](self->_scheduler, "reflectNextFireDelay:fireInterval:", self->_nextFireDelay, self->_fireInterval);
}

- (void)invalidate
{
  id handler;

  -[CLTimer dbgAssertInside](self, "dbgAssertInside");
  handler = self->_handler;
  self->_handler = 0;

  self->_nextFireDelay = 1.79769313e308;
  self->_fireInterval = 1.79769313e308;
  -[CLTimer updateScheduler](self, "updateScheduler");
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_handler, 0);
  objc_storeStrong((id *)&self->_scheduler, 0);
  objc_destroyWeak((id *)&self->_silo);
}

- (void)setNextFireTime:(double)a3 interval:(double)a4
{
  if (a3 != 1.79769313e308)
    CFAbsoluteTimeGetCurrent();
  MEMORY[0x1E0DE7D20](self, sel_setNextFireDelay_interval_);
}

- (void)setHandler:(id)a3
{
  void *v4;
  id handler;
  NSObject *v6;
  NSObject *v7;
  NSObject *v8;
  id v9;
  uint8_t buf[4];
  int v11;
  __int16 v12;
  void *v13;
  __int16 v14;
  const char *v15;
  __int16 v16;
  const char *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  -[CLTimer dbgAssertInside](self, "dbgAssertInside");
  if (!v9)
  {
    sub_1A1A0A750();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 68289539;
      v11 = 0;
      v12 = 2082;
      v13 = &unk_1A1A18FAF;
      v14 = 2082;
      v15 = "assert";
      v16 = 2081;
      v17 = "handler != ((void *)0)";
      _os_log_impl(&dword_1A19F4000, v6, OS_LOG_TYPE_FAULT, "{\"msg%{public}.0s\":\"Can't set nil handler for CLTimer.\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", buf, 0x26u);
    }

    sub_1A1A0A750();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_signpost_enabled(v7))
    {
      *(_DWORD *)buf = 68289539;
      v11 = 0;
      v12 = 2082;
      v13 = &unk_1A1A18FAF;
      v14 = 2082;
      v15 = "assert";
      v16 = 2081;
      v17 = "handler != ((void *)0)";
      _os_signpost_emit_with_name_impl(&dword_1A19F4000, v7, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "Can't set nil handler for CLTimer.", "{\"msg%{public}.0s\":\"Can't set nil handler for CLTimer.\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", buf, 0x26u);
    }

    sub_1A1A0A750();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 68289539;
      v11 = 0;
      v12 = 2082;
      v13 = &unk_1A1A18FAF;
      v14 = 2082;
      v15 = "assert";
      v16 = 2081;
      v17 = "handler != ((void *)0)";
      _os_log_impl(&dword_1A19F4000, v8, OS_LOG_TYPE_INFO, "{\"msg%{public}.0s\":\"Can't set nil handler for CLTimer.\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", buf, 0x26u);
    }

    abort_report_np();
  }
  v4 = (void *)objc_msgSend(v9, "copy");
  handler = self->_handler;
  self->_handler = v4;

}

- (id)initInSilo:(id)a3 withScheduler:(id)a4
{
  id v6;
  id v7;
  CLTimer *v8;
  CLTimer *v9;
  id handler;
  CLTimer *v11;
  objc_super v13;

  v6 = a3;
  v7 = a4;
  v13.receiver = self;
  v13.super_class = (Class)CLTimer;
  v8 = -[CLTimer init](&v13, sel_init);
  v9 = v8;
  if (v8)
  {
    objc_storeWeak((id *)&v8->_silo, v6);
    -[CLTimer dbgAssertInside](v9, "dbgAssertInside");
    v9->_nextFireDelay = 1.79769313e308;
    handler = v9->_handler;
    v9->_handler = 0;
    v9->_fireInterval = 1.79769313e308;

    objc_storeStrong((id *)&v9->_scheduler, a4);
    -[CLTimerScheduler setTimer:](v9->_scheduler, "setTimer:", v9);
    -[CLTimer updateScheduler](v9, "updateScheduler");
    v11 = v9;
  }

  return v9;
}

- (void)setNextFireTime:(double)a3
{
  -[CLTimer fireInterval](self, "fireInterval");
  MEMORY[0x1E0DE7D20](self, sel_setNextFireTime_interval_);
}

- (void)shouldFire
{
  id handler;
  void (**v4)(void);

  -[CLTimer dbgAssertInside](self, "dbgAssertInside");
  if (self->_fireInterval == 1.79769313e308)
    self->_nextFireDelay = 1.79769313e308;
  handler = self->_handler;
  if (handler)
  {
    v4 = (void (**)(void))objc_msgSend(handler, "copy");
    v4[2]();

  }
}

- (double)nextFireTime
{
  double v2;
  double v3;
  double result;

  -[CLTimer nextFireDelay](self, "nextFireDelay");
  v3 = v2;
  result = 1.79769313e308;
  if (v3 != 1.79769313e308)
    return v3 + CFAbsoluteTimeGetCurrent();
  return result;
}

- (void)setNextFireDelay:(double)a3
{
  -[CLTimer dbgAssertInside](self, "dbgAssertInside");
  -[CLTimer fireInterval](self, "fireInterval");
  MEMORY[0x1E0DE7D20](self, sel_setNextFireDelay_interval_);
}

- (double)fireInterval
{
  return self->_fireInterval;
}

- (void)setNextFireDelay:(double)a3 interval:(double)a4
{
  double v7;
  uint64_t v8;

  -[CLTimer dbgAssertInside](self, "dbgAssertInside");
  self->_nextFireDelay = fmax(a3, 0.0);
  v7 = 1.79769313e308;
  if (a4 > 0.0)
    v7 = a4;
  self->_fireInterval = v7;
  v8 = mach_continuous_time();
  self->_delaySetAtTime = sub_1A1A00AF4(v8);
  -[CLTimer updateScheduler](self, "updateScheduler");
}

- (double)nextFireDelay
{
  double result;
  uint64_t v4;
  double v5;
  double nextFireDelay;
  double v7;
  double fireInterval;

  -[CLTimer dbgAssertInside](self, "dbgAssertInside");
  result = 1.79769313e308;
  if (self->_nextFireDelay != 1.79769313e308)
  {
    v4 = mach_continuous_time();
    v5 = sub_1A1A00AF4(v4);
    nextFireDelay = self->_nextFireDelay;
    v7 = v5 - self->_delaySetAtTime;
    if (v7 <= nextFireDelay)
    {
      return nextFireDelay - v7;
    }
    else
    {
      fireInterval = self->_fireInterval;
      result = 0.0;
      if (fireInterval != 1.79769313e308)
        return fireInterval - fmod(v7 - nextFireDelay, self->_fireInterval);
    }
  }
  return result;
}

- (void)dbgAssertInside
{

}

- (id)handler
{
  return self->_handler;
}

- (void)setFireInterval:(double)a3
{
  -[CLTimer dbgAssertInside](self, "dbgAssertInside");
  -[CLTimer nextFireDelay](self, "nextFireDelay");
  MEMORY[0x1E0DE7D20](self, sel_setNextFireDelay_interval_);
}

- (double)nextFireDelayRaw
{
  return self->_nextFireDelay;
}

@end
