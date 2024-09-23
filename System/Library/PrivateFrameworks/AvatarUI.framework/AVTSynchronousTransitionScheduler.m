@implementation AVTSynchronousTransitionScheduler

- (AVTSynchronousTransitionScheduler)initWithEventHandler:(id)a3
{
  id v4;
  AVTSynchronousTransitionScheduler *v5;
  uint64_t v6;
  id eventHandler;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)AVTSynchronousTransitionScheduler;
  v5 = -[AVTSynchronousTransitionScheduler init](&v9, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    eventHandler = v5->_eventHandler;
    v5->_eventHandler = (id)v6;

  }
  return v5;
}

- (void)scheduleEvent
{
  void (**v3)(void);

  if (!-[AVTSynchronousTransitionScheduler isRunningEvent](self, "isRunningEvent"))
  {
    -[AVTSynchronousTransitionScheduler setIsRunningEvent:](self, "setIsRunningEvent:", 1);
    -[AVTSynchronousTransitionScheduler eventHandler](self, "eventHandler");
    v3 = (void (**)(void))objc_claimAutoreleasedReturnValue();
    v3[2]();

  }
}

- (void)stop
{
  -[AVTSynchronousTransitionScheduler setIsRunningEvent:](self, "setIsRunningEvent:", 0);
}

- (void)didCompleteEvent
{
  void (**v3)(void);

  if (-[AVTSynchronousTransitionScheduler isRunningEvent](self, "isRunningEvent"))
  {
    -[AVTSynchronousTransitionScheduler eventHandler](self, "eventHandler");
    v3 = (void (**)(void))objc_claimAutoreleasedReturnValue();
    v3[2]();

  }
}

- (id)eventHandler
{
  return self->_eventHandler;
}

- (BOOL)isRunningEvent
{
  return self->_isRunningEvent;
}

- (void)setIsRunningEvent:(BOOL)a3
{
  self->_isRunningEvent = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_eventHandler, 0);
}

@end
