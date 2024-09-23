@implementation HMDHomeMetricsDispatcherFactory

- (id)createHomeMetricsDispatcherWithIdentifier:(id)a3 logEventSubmitter:(id)a4
{
  id v5;
  id v6;
  HMDHomeMetricsDispatcher *v7;

  v5 = a4;
  v6 = a3;
  v7 = -[HMDHomeMetricsDispatcher initWithIdentifier:logEventSubmitter:]([HMDHomeMetricsDispatcher alloc], "initWithIdentifier:logEventSubmitter:", v6, v5);

  return v7;
}

@end
