@implementation IAEventDispatcher

- (void)dispatchEvent:(id)a3 payload:(id)a4
{
  id v4;
  id v5;

  v5 = a4;
  v4 = v5;
  AnalyticsSendEventLazy();

}

@end
