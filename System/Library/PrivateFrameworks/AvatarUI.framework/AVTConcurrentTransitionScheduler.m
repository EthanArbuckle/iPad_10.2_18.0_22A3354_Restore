@implementation AVTConcurrentTransitionScheduler

- (AVTConcurrentTransitionScheduler)initWithEventHandler:(id)a3 delay:(double)a4
{
  id v6;
  AVTConcurrentTransitionScheduler *v7;
  uint64_t v8;
  id eventHandler;
  objc_super v11;

  v6 = a3;
  v11.receiver = self;
  v11.super_class = (Class)AVTConcurrentTransitionScheduler;
  v7 = -[AVTConcurrentTransitionScheduler init](&v11, sel_init);
  if (v7)
  {
    v8 = objc_msgSend(v6, "copy");
    eventHandler = v7->_eventHandler;
    v7->_eventHandler = (id)v8;

    v7->_delay = a4;
  }

  return v7;
}

- (AVTConcurrentTransitionScheduler)initWithEventHandler:(id)a3
{
  return -[AVTConcurrentTransitionScheduler initWithEventHandler:delay:](self, "initWithEventHandler:delay:", a3, 0.0);
}

- (void)scheduleEvent
{
  void *v3;
  void (**v4)(void);

  -[AVTConcurrentTransitionScheduler transitionTimer](self, "transitionTimer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
  {
    -[AVTConcurrentTransitionScheduler scheduleTransitionTimer](self, "scheduleTransitionTimer");
    -[AVTConcurrentTransitionScheduler eventHandler](self, "eventHandler");
    v4 = (void (**)(void))objc_claimAutoreleasedReturnValue();
    v4[2]();

  }
}

- (void)stop
{
  void *v3;

  -[AVTConcurrentTransitionScheduler transitionTimer](self, "transitionTimer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "invalidate");

  -[AVTConcurrentTransitionScheduler setTransitionTimer:](self, "setTransitionTimer:", 0);
}

- (void)scheduleTransitionTimer
{
  void *v3;
  void *v4;
  void *v5;
  double v6;
  double v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void (*v12)(uint64_t);
  void *v13;
  id v14;
  id location;

  -[AVTConcurrentTransitionScheduler transitionTimer](self, "transitionTimer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99768], CFSTR("Calling schedule transition timer while timer is already running"), 0);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "raise");

  }
  objc_initWeak(&location, self);
  v5 = (void *)MEMORY[0x1E0C99E88];
  -[AVTConcurrentTransitionScheduler delay](self, "delay");
  v7 = v6;
  v10 = MEMORY[0x1E0C809B0];
  v11 = 3221225472;
  v12 = __59__AVTConcurrentTransitionScheduler_scheduleTransitionTimer__block_invoke;
  v13 = &unk_1EA51E290;
  objc_copyWeak(&v14, &location);
  objc_msgSend(v5, "timerWithTimeInterval:repeats:block:", 1, &v10, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E58], "mainRunLoop", v10, v11, v12, v13);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "addTimer:forMode:", v8, *MEMORY[0x1E0C99860]);

  -[AVTConcurrentTransitionScheduler setTransitionTimer:](self, "setTransitionTimer:", v8);
  objc_destroyWeak(&v14);
  objc_destroyWeak(&location);
}

void __59__AVTConcurrentTransitionScheduler_scheduleTransitionTimer__block_invoke(uint64_t a1)
{
  void (**v1)(void);
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "eventHandler");
  v1 = (void (**)(void))objc_claimAutoreleasedReturnValue();
  v1[2]();

}

- (id)eventHandler
{
  return self->_eventHandler;
}

- (NSTimer)transitionTimer
{
  return self->_transitionTimer;
}

- (void)setTransitionTimer:(id)a3
{
  objc_storeStrong((id *)&self->_transitionTimer, a3);
}

- (double)delay
{
  return self->_delay;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_transitionTimer, 0);
  objc_storeStrong(&self->_eventHandler, 0);
}

@end
