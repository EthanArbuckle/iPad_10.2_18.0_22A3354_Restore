@implementation NTKDelayedBlock

- (NTKDelayedBlock)initWithDelay:(double)a3 action:(id)a4
{
  return -[NTKDelayedBlock initWithDelay:runLoopMode:action:](self, "initWithDelay:runLoopMode:action:", *MEMORY[0x1E0C99748], a4, a3);
}

- (NTKDelayedBlock)initWithDelay:(double)a3 runLoopMode:(id)a4 action:(id)a5
{
  id v8;
  id v9;
  NTKDelayedBlock *v10;
  NTKDelayedBlock *v11;
  objc_super v13;

  v8 = a4;
  v9 = a5;
  v13.receiver = self;
  v13.super_class = (Class)NTKDelayedBlock;
  v10 = -[NTKDelayedBlock init](&v13, sel_init);
  v11 = v10;
  if (v10)
  {
    -[NTKDelayedBlock setDelay:](v10, "setDelay:", a3);
    -[NTKDelayedBlock setRunLoopMode:](v11, "setRunLoopMode:", v8);
    -[NTKDelayedBlock setAction:](v11, "setAction:", v9);
    -[NTKDelayedBlock delay](v11, "delay");
    -[NTKDelayedBlock resetWithDelay:](v11, "resetWithDelay:");
  }

  return v11;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  -[NTKDelayedBlock timer](self, "timer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "invalidate");

  -[NTKDelayedBlock setAction:](self, "setAction:", 0);
  v4.receiver = self;
  v4.super_class = (Class)NTKDelayedBlock;
  -[NTKDelayedBlock dealloc](&v4, sel_dealloc);
}

- (void)reset
{
  -[NTKDelayedBlock delay](self, "delay");
  -[NTKDelayedBlock resetWithDelay:](self, "resetWithDelay:");
}

- (void)resetWithDelay:(double)a3
{
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint8_t v13[16];

  if (-[NTKDelayedBlock canceled](self, "canceled"))
  {
    _NTKLoggingObjectForDomain(0, (uint64_t)"NTKLoggingDomainDefault");
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v13 = 0;
      _os_log_impl(&dword_1B72A3000, v5, OS_LOG_TYPE_DEFAULT, "*** warning: attempting to reset an NTKDelayedBlock which has been canceled or whose block has been called.", v13, 2u);
    }

  }
  -[NTKDelayedBlock action](self, "action");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    if (a3 >= 0.0)
    {
      -[NTKDelayedBlock setCanceled:](self, "setCanceled:", 0);
      -[NTKDelayedBlock setDelay:](self, "setDelay:", a3);
      objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceNow:", a3);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[NTKDelayedBlock timer](self, "timer");
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      if (v8)
      {
        -[NTKDelayedBlock timer](self, "timer");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "setFireDate:", v7);
      }
      else
      {
        v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E88]), "initWithFireDate:interval:target:selector:userInfo:repeats:", v7, self, sel_timerFired_, 0, 0, a3);
        -[NTKDelayedBlock setTimer:](self, "setTimer:", v10);

        objc_msgSend(MEMORY[0x1E0C99E58], "currentRunLoop");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        -[NTKDelayedBlock timer](self, "timer");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        -[NTKDelayedBlock runLoopMode](self, "runLoopMode");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "addTimer:forMode:", v11, v12);

      }
    }
    else
    {
      -[NTKDelayedBlock cancel](self, "cancel");
    }
  }
}

- (void)timerFired:(id)a3
{
  void *v4;
  void (**v5)(_QWORD, _QWORD);

  if (!-[NTKDelayedBlock canceled](self, "canceled", a3))
  {
    -[NTKDelayedBlock action](self, "action");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    if (v4)
    {
      -[NTKDelayedBlock action](self, "action");
      v5 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
      ((void (**)(_QWORD, NTKDelayedBlock *))v5)[2](v5, self);

    }
  }
  -[NTKDelayedBlock cancel](self, "cancel");
}

- (void)cancel
{
  void *v3;

  -[NTKDelayedBlock setCanceled:](self, "setCanceled:", 1);
  -[NTKDelayedBlock timer](self, "timer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "invalidate");

  -[NTKDelayedBlock setTimer:](self, "setTimer:", 0);
  -[NTKDelayedBlock setAction:](self, "setAction:", 0);
}

- (double)delay
{
  return self->_delay;
}

- (void)setDelay:(double)a3
{
  self->_delay = a3;
}

- (NSString)runLoopMode
{
  return self->_runLoopMode;
}

- (void)setRunLoopMode:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (id)action
{
  return self->_action;
}

- (void)setAction:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (BOOL)canceled
{
  return self->_canceled;
}

- (void)setCanceled:(BOOL)a3
{
  self->_canceled = a3;
}

- (NSTimer)timer
{
  return self->_timer;
}

- (void)setTimer:(id)a3
{
  objc_storeStrong((id *)&self->_timer, a3);
}

- (BOOL)invalidated
{
  return self->_invalidated;
}

- (void)setInvalidated:(BOOL)a3
{
  self->_invalidated = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_timer, 0);
  objc_storeStrong(&self->_action, 0);
  objc_storeStrong((id *)&self->_runLoopMode, 0);
}

@end
