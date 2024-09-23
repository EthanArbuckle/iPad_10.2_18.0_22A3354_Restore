@implementation AXUpdateElementVisualsCoalescer

- (AXUpdateElementVisualsCoalescer)init
{
  AXUpdateElementVisualsCoalescer *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)AXUpdateElementVisualsCoalescer;
  result = -[AXUpdateElementVisualsCoalescer init](&v3, sel_init);
  if (result)
  {
    *(_OWORD *)&result->_threshold = xmmword_18C7371E0;
    result->_lastProgressTime = -1.0;
  }
  return result;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  -[AXUpdateElementVisualsCoalescer timer](self, "timer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "invalidate");

  v4.receiver = self;
  v4.super_class = (Class)AXUpdateElementVisualsCoalescer;
  -[AXUpdateElementVisualsCoalescer dealloc](&v4, sel_dealloc);
}

- (void)notifyUpdateElementVisualsEventDidOccur
{
  void *v3;
  void *v4;
  void *v5;
  void (**v6)(void);
  void *v7;
  void *v8;
  double progressInterval;
  double v10;
  double v11;
  double lastProgressTime;
  void (**v13)(void);

  -[AXUpdateElementVisualsCoalescer timer](self, "timer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[AXUpdateElementVisualsCoalescer timer](self, "timer");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "invalidate");

    -[AXUpdateElementVisualsCoalescer setTimer:](self, "setTimer:", 0);
  }
  else
  {
    -[AXUpdateElementVisualsCoalescer updateVisualsSequenceDidBeginHandler](self, "updateVisualsSequenceDidBeginHandler");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5)
    {
      -[AXUpdateElementVisualsCoalescer updateVisualsSequenceDidBeginHandler](self, "updateVisualsSequenceDidBeginHandler");
      v6 = (void (**)(void))objc_claimAutoreleasedReturnValue();
      v6[2]();

    }
  }
  objc_msgSend(MEMORY[0x1E0C99E88], "scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:", self, sel__timerDidFire_, 0, 0, self->_threshold);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[AXUpdateElementVisualsCoalescer setTimer:](self, "setTimer:", v7);

  -[AXUpdateElementVisualsCoalescer updateVisualsSequenceInProgressHandler](self, "updateVisualsSequenceInProgressHandler");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    progressInterval = self->_progressInterval;

    if (progressInterval > 0.0)
    {
      objc_msgSend(MEMORY[0x1E0C99D68], "timeIntervalSinceReferenceDate");
      v11 = v10;
      lastProgressTime = self->_lastProgressTime;
      if (lastProgressTime > 0.0)
      {
        if (v11 - lastProgressTime <= self->_progressInterval)
          return;
        -[AXUpdateElementVisualsCoalescer updateVisualsSequenceInProgressHandler](self, "updateVisualsSequenceInProgressHandler");
        v13 = (void (**)(void))objc_claimAutoreleasedReturnValue();
        v13[2]();

      }
      self->_lastProgressTime = v11;
    }
  }
}

- (void)_timerDidFire:(id)a3
{
  void *v4;
  void (**v5)(void);
  void *v6;

  -[AXUpdateElementVisualsCoalescer updateVisualsSequenceDidFinishHandler](self, "updateVisualsSequenceDidFinishHandler", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[AXUpdateElementVisualsCoalescer updateVisualsSequenceDidFinishHandler](self, "updateVisualsSequenceDidFinishHandler");
    v5 = (void (**)(void))objc_claimAutoreleasedReturnValue();
    v5[2]();

  }
  -[AXUpdateElementVisualsCoalescer timer](self, "timer");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "invalidate");

  -[AXUpdateElementVisualsCoalescer setTimer:](self, "setTimer:", 0);
}

- (double)threshold
{
  return self->_threshold;
}

- (void)setThreshold:(double)a3
{
  self->_threshold = a3;
}

- (double)progressInterval
{
  return self->_progressInterval;
}

- (void)setProgressInterval:(double)a3
{
  self->_progressInterval = a3;
}

- (id)updateVisualsSequenceDidBeginHandler
{
  return self->_updateVisualsSequenceDidBeginHandler;
}

- (void)setUpdateVisualsSequenceDidBeginHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (id)updateVisualsSequenceDidFinishHandler
{
  return self->_updateVisualsSequenceDidFinishHandler;
}

- (void)setUpdateVisualsSequenceDidFinishHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (id)updateVisualsSequenceInProgressHandler
{
  return self->_updateVisualsSequenceInProgressHandler;
}

- (void)setUpdateVisualsSequenceInProgressHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (NSTimer)timer
{
  return self->_timer;
}

- (void)setTimer:(id)a3
{
  objc_storeStrong((id *)&self->_timer, a3);
}

- (double)lastProgressTime
{
  return self->_lastProgressTime;
}

- (void)setLastProgressTime:(double)a3
{
  self->_lastProgressTime = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_timer, 0);
  objc_storeStrong(&self->_updateVisualsSequenceInProgressHandler, 0);
  objc_storeStrong(&self->_updateVisualsSequenceDidFinishHandler, 0);
  objc_storeStrong(&self->_updateVisualsSequenceDidBeginHandler, 0);
}

@end
