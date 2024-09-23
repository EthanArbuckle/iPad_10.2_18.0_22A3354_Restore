@implementation AMSMetricsFlushOperation

- (AMSMetricsFlushStrategy)strategy
{
  return self->_strategy;
}

- (AMSMutablePromise)promise
{
  return self->_promise;
}

- (AMSMetricsFlushOperation)initWithStrategy:(id)a3 promise:(id)a4
{
  id v7;
  id v8;
  id *v9;
  AMSMetricsFlushOperation *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)AMSMetricsFlushOperation;
  v9 = -[AMSMetricsOperation _init](&v12, sel__init);
  v10 = (AMSMetricsFlushOperation *)v9;
  if (v9)
  {
    objc_storeStrong(v9 + 1, a3);
    objc_storeStrong((id *)&v10->_promise, a4);
  }

  return v10;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_promise, 0);
  objc_storeStrong((id *)&self->_strategy, 0);
}

@end
