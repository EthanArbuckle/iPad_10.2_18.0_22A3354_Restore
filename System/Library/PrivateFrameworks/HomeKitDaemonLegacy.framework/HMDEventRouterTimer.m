@implementation HMDEventRouterTimer

- (HMDEventRouterTimer)initWithQueue:(id)a3 interval:(double)a4 timerFireHandler:(id)a5
{
  id v8;
  id v9;
  HMDEventRouterTimer *v10;
  void *v11;
  id timerFireHandler;
  uint64_t v13;
  HMFTimer *timer;
  objc_super v16;

  v8 = a3;
  v9 = a5;
  v16.receiver = self;
  v16.super_class = (Class)HMDEventRouterTimer;
  v10 = -[HMDEventRouterTimer init](&v16, sel_init);
  if (v10)
  {
    v11 = _Block_copy(v9);
    timerFireHandler = v10->_timerFireHandler;
    v10->_timerFireHandler = v11;

    v13 = objc_msgSend(objc_alloc(MEMORY[0x1E0D286C8]), "initWithTimeInterval:options:", 8, a4);
    timer = v10->_timer;
    v10->_timer = (HMFTimer *)v13;

    -[HMFTimer setDelegateQueue:](v10->_timer, "setDelegateQueue:", v8);
    -[HMFTimer setDelegate:](v10->_timer, "setDelegate:", v10);
  }

  return v10;
}

- (void)resume
{
  id v2;

  -[HMDEventRouterTimer timer](self, "timer");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "resume");

}

- (void)suspend
{
  id v2;

  -[HMDEventRouterTimer timer](self, "timer");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "suspend");

}

- (void)timerDidFire:(id)a3
{
  void (**v3)(void);

  -[HMDEventRouterTimer timerFireHandler](self, "timerFireHandler", a3);
  v3 = (void (**)(void))objc_claimAutoreleasedReturnValue();
  v3[2]();

}

- (double)timeInterval
{
  void *v2;
  double v3;
  double v4;

  -[HMDEventRouterTimer timer](self, "timer");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "timeInterval");
  v4 = v3;

  return v4;
}

- (id)timerFireHandler
{
  return objc_getProperty(self, a2, 8, 1);
}

- (HMFTimer)timer
{
  return (HMFTimer *)objc_getProperty(self, a2, 16, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_timer, 0);
  objc_storeStrong(&self->_timerFireHandler, 0);
}

@end
