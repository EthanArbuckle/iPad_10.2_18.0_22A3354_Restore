@implementation CLRunLoopTimerScheduler

- (CLRunLoopTimerScheduler)initWithRunLoopSilo:(id)a3
{
  id v4;
  CLRunLoopTimerScheduler *v5;
  uint64_t v6;
  NSRunLoop *runloop;
  void *v8;
  id fireBlock;
  CLRunLoopTimerScheduler *v10;
  _QWORD v12[4];
  id v13;
  id v14;
  id from;
  id location;
  objc_super v17;

  v4 = a3;
  objc_msgSend(v4, "inPermissiveMode");
  v17.receiver = self;
  v17.super_class = (Class)CLRunLoopTimerScheduler;
  v5 = -[CLRunLoopTimerScheduler init](&v17, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "runloop");
    v6 = objc_claimAutoreleasedReturnValue();
    runloop = v5->_runloop;
    v5->_runloop = (NSRunLoop *)v6;

    objc_initWeak(&location, v5);
    objc_initWeak(&from, v4);
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = sub_1A1A08DA4;
    v12[3] = &unk_1E45FB898;
    objc_copyWeak(&v13, &from);
    objc_copyWeak(&v14, &location);
    v8 = _Block_copy(v12);
    fireBlock = v5->_fireBlock;
    v5->_fireBlock = v8;

    v10 = v5;
    objc_destroyWeak(&v14);
    objc_destroyWeak(&v13);
    objc_destroyWeak(&from);
    objc_destroyWeak(&location);
  }

  return v5;
}

- (void)dealloc
{
  objc_super v3;

  -[NSTimer invalidate](self->_underlyingTimer, "invalidate");
  v3.receiver = self;
  v3.super_class = (Class)CLRunLoopTimerScheduler;
  -[CLRunLoopTimerScheduler dealloc](&v3, sel_dealloc);
}

- (void)reflectNextFireDelay:(double)a3 fireInterval:(double)a4
{
  NSTimer *underlyingTimer;
  NSTimer *v8;
  NSTimer *v9;
  NSTimer *v10;
  void *v11;

  underlyingTimer = self->_underlyingTimer;
  if (underlyingTimer)
    -[NSTimer invalidate](underlyingTimer, "invalidate");
  objc_msgSend(MEMORY[0x1E0C99E88], "timerWithTimeInterval:repeats:block:", 1, self->_fireBlock, a4);
  v8 = (NSTimer *)objc_claimAutoreleasedReturnValue();
  v9 = self->_underlyingTimer;
  self->_underlyingTimer = v8;

  v10 = self->_underlyingTimer;
  objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceNow:", a3);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSTimer setFireDate:](v10, "setFireDate:", v11);

  MEMORY[0x1E0DE7D20](self->_runloop, sel_addTimer_forMode_);
}

- (CLTimer)timer
{
  return (CLTimer *)objc_loadWeakRetained((id *)&self->_timer);
}

- (void)setTimer:(id)a3
{
  objc_storeWeak((id *)&self->_timer, a3);
}

- (NSTimer)underlyingTimer
{
  return self->_underlyingTimer;
}

- (void)setUnderlyingTimer:(id)a3
{
  objc_storeStrong((id *)&self->_underlyingTimer, a3);
}

- (id)fireBlock
{
  return self->_fireBlock;
}

- (void)setFireBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSRunLoop)runloop
{
  return self->_runloop;
}

- (void)setRunloop:(id)a3
{
  objc_storeStrong((id *)&self->_runloop, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_timer);
  objc_storeStrong((id *)&self->_runloop, 0);
  objc_storeStrong(&self->_fireBlock, 0);
  objc_storeStrong((id *)&self->_underlyingTimer, 0);
}

@end
