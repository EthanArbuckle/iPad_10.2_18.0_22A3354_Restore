@implementation _ANEAnalyticsTask

- (_ANEAnalyticsTask)initWithMetrics:(id)a3
{
  id v5;
  _ANEAnalyticsTask *v6;
  _ANEAnalyticsTask *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)_ANEAnalyticsTask;
  v6 = -[_ANEAnalyticsTask init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_metrics, a3);

  return v7;
}

- (NSDictionary)metrics
{
  return self->_metrics;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_metrics, 0);
}

+ (id)objectWithMetrics:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  v5 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithMetrics:", v4);

  return v5;
}

@end
