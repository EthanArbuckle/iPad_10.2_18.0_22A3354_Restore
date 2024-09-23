@implementation _CNObservableEventDynamicQueueBufferingStrategy

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
}

- (void)addEvent:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[_CNObservableEventDynamicQueueBufferingStrategy queue](self, "queue");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "enqueue:", v4);

}

- (id)allEvents
{
  void *v2;
  void *v3;

  -[_CNObservableEventDynamicQueueBufferingStrategy queue](self, "queue");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "allObjects");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (CNQueue)queue
{
  return self->_queue;
}

- (BOOL)isSequenceTerminated
{
  return 0;
}

- (_CNObservableEventDynamicQueueBufferingStrategy)initWithQueue:(id)a3
{
  id v5;
  _CNObservableEventDynamicQueueBufferingStrategy *v6;
  _CNObservableEventDynamicQueueBufferingStrategy *v7;
  _CNObservableEventDynamicQueueBufferingStrategy *v8;
  objc_super v10;

  v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)_CNObservableEventDynamicQueueBufferingStrategy;
  v6 = -[_CNObservableEventDynamicQueueBufferingStrategy init](&v10, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_queue, a3);
    v8 = v7;
  }

  return v7;
}

@end
