@implementation _AMMotionDetectionTriggerManagerObserverContext

- (_AMMotionDetectionTriggerManagerObserverContext)initWithObserver:(id)a3 queue:(id)a4
{
  id v6;
  id v7;
  _AMMotionDetectionTriggerManagerObserverContext *v8;
  _AMMotionDetectionTriggerManagerObserverContext *v9;
  objc_super v11;

  v6 = a3;
  v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)_AMMotionDetectionTriggerManagerObserverContext;
  v8 = -[_AMMotionDetectionTriggerManagerObserverContext init](&v11, sel_init);
  v9 = v8;
  if (v8)
  {
    objc_storeWeak((id *)&v8->_observer, v6);
    objc_storeStrong((id *)&v9->_queue, a4);
  }

  return v9;
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (AMMotionDetectionTriggerManagerObserver)observer
{
  return (AMMotionDetectionTriggerManagerObserver *)objc_loadWeakRetained((id *)&self->_observer);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_observer);
  objc_storeStrong((id *)&self->_queue, 0);
}

@end
