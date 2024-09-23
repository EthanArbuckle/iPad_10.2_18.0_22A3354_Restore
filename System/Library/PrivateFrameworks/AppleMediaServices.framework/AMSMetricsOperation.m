@implementation AMSMetricsOperation

+ (id)flushOperationWithStrategy:(id)a3 promise:(id)a4
{
  id v5;
  id v6;
  AMSMetricsFlushOperation *v7;

  v5 = a4;
  v6 = a3;
  v7 = -[AMSMetricsFlushOperation initWithStrategy:promise:]([AMSMetricsFlushOperation alloc], "initWithStrategy:promise:", v6, v5);

  return v7;
}

- (id)_init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)AMSMetricsOperation;
  return -[AMSMetricsOperation init](&v3, sel_init);
}

+ (id)dropEventsOperation
{
  return -[AMSMetricsOperation _init]([AMSMetricsDropEventsOperation alloc], "_init");
}

@end
