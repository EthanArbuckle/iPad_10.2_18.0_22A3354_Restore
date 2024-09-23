@implementation CNObservableEvent

+ (CNObservableEvent)eventWithResult:(id)a3
{
  id v3;
  _CNObservableResultEvent *v4;

  v3 = a3;
  v4 = -[_CNObservableResultEvent initWithResult:]([_CNObservableResultEvent alloc], "initWithResult:", v3);

  return (CNObservableEvent *)v4;
}

+ (id)completionEvent
{
  if (completionEvent_cn_once_token_1 != -1)
    dispatch_once(&completionEvent_cn_once_token_1, &__block_literal_global_49);
  return (id)completionEvent_cn_once_object_1;
}

void __36__CNObservableEvent_completionEvent__block_invoke()
{
  _CNObservableCompletionEvent *v0;
  void *v1;

  v0 = objc_alloc_init(_CNObservableCompletionEvent);
  v1 = (void *)completionEvent_cn_once_object_1;
  completionEvent_cn_once_object_1 = (uint64_t)v0;

}

+ (id)failureEventWithError:(id)a3
{
  id v3;
  _CNObservableFailureEvent *v4;

  v3 = a3;
  v4 = -[_CNObservableFailureEvent initWithError:]([_CNObservableFailureEvent alloc], "initWithError:", v3);

  return v4;
}

- (unint64_t)eventType
{
  id v2;

  CNAbstractMethodException(self, a2);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v2);
}

- (BOOL)hasValue
{
  id v2;

  CNAbstractMethodException(self, a2);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v2);
}

- (id)value
{
  id v2;

  CNAbstractMethodException(self, a2);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v2);
}

- (NSError)error
{
  id v2;

  CNAbstractMethodException(self, a2);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v2);
}

- (void)dematerializeWithObserver:(id)a3
{
  id v5;
  id v6;

  v5 = a3;
  CNAbstractMethodException(self, a2);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v6);
}

@end
