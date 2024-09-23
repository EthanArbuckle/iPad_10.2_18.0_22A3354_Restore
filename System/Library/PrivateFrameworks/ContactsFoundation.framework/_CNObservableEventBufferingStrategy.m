@implementation _CNObservableEventBufferingStrategy

+ (id)strategyWithEvents:(id)a3
{
  id v3;
  _CNObservableEventStaticArrayBufferingStrategy *v4;

  v3 = a3;
  v4 = -[_CNObservableEventStaticArrayBufferingStrategy initWithEvents:]([_CNObservableEventStaticArrayBufferingStrategy alloc], "initWithEvents:", v3);

  return v4;
}

+ (id)strategyWithQueue:(id)a3
{
  id v3;
  _CNObservableEventDynamicQueueBufferingStrategy *v4;

  v3 = a3;
  v4 = -[_CNObservableEventDynamicQueueBufferingStrategy initWithQueue:]([_CNObservableEventDynamicQueueBufferingStrategy alloc], "initWithQueue:", v3);

  return v4;
}

- (void)addEvent:(id)a3
{
  id v5;
  id v6;

  v5 = a3;
  CNAbstractMethodException(self, a2);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v6);
}

- (id)allEvents
{
  id v2;

  CNAbstractMethodException(self, a2);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v2);
}

- (BOOL)isSequenceTerminated
{
  id v2;

  CNAbstractMethodException(self, a2);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v2);
}

@end
