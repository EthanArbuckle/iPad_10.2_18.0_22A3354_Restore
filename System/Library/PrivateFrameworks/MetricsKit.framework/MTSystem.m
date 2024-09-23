@implementation MTSystem

- (MTEnvironment)environment
{
  return self->_environment;
}

- (MTEventRecorder)eventRecorder
{
  return self->_eventRecorder;
}

- (MTEventFilter)treatmentFilter
{
  MTSystem *v2;
  MTConstraintTreatmentFilter *v3;
  void *v4;
  uint64_t v5;
  MTEventFilter *treatmentFilter;

  v2 = self;
  objc_sync_enter(v2);
  if (!v2->_treatmentFilter)
  {
    v3 = [MTConstraintTreatmentFilter alloc];
    -[MTObject metricsKit](v2, "metricsKit");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = -[MTObject initWithMetricsKit:](v3, "initWithMetricsKit:", v4);

    treatmentFilter = v2->_treatmentFilter;
    v2->_treatmentFilter = (MTEventFilter *)v5;

  }
  objc_sync_exit(v2);

  return v2->_treatmentFilter;
}

- (MTEventFilter)eventFilter
{
  MTSystem *v2;
  MTFinalValidationFilter *v3;
  void *v4;
  MTFinalValidationFilter *v5;
  MTEventFilter *eventFilter;

  v2 = self;
  objc_sync_enter(v2);
  if (!v2->_eventFilter)
  {
    v3 = [MTFinalValidationFilter alloc];
    -[MTObject metricsKit](v2, "metricsKit");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = -[MTObject initWithMetricsKit:](v3, "initWithMetricsKit:", v4);

    -[MTFinalValidationFilter setShouldApplyDeRes:](v5, "setShouldApplyDeRes:", 1);
    eventFilter = v2->_eventFilter;
    v2->_eventFilter = (MTEventFilter *)v5;

  }
  objc_sync_exit(v2);

  return v2->_eventFilter;
}

- (MTSystem)initWithMetricsKit:(id)a3
{
  MTSystem *v3;
  MTEnvironment *v4;
  void *v5;
  MTEnvironment *v6;
  MTEventRecorder *v7;
  void *v8;
  MTEventRecorder *v9;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)MTSystem;
  v3 = -[MTObject initWithMetricsKit:](&v11, sel_initWithMetricsKit_, a3);
  if (v3)
  {
    v4 = [MTEnvironment alloc];
    -[MTObject metricsKit](v3, "metricsKit");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = -[MTObject initWithMetricsKit:](v4, "initWithMetricsKit:", v5);
    -[MTSystem setEnvironment:](v3, "setEnvironment:", v6);

    v7 = [MTEventRecorder alloc];
    -[MTObject metricsKit](v3, "metricsKit");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = -[MTEventRecorder initWithMetricsKit:](v7, "initWithMetricsKit:", v8);
    -[MTSystem setEventRecorder:](v3, "setEventRecorder:", v9);

  }
  return v3;
}

- (void)setEventRecorder:(id)a3
{
  objc_storeStrong((id *)&self->_eventRecorder, a3);
}

- (void)setEnvironment:(id)a3
{
  objc_storeStrong((id *)&self->_environment, a3);
}

- (OS_dispatch_queue)queue
{
  MTSystem *v2;
  OS_dispatch_queue *queue;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  dispatch_queue_t v11;
  OS_dispatch_queue *v12;
  OS_dispatch_queue *v13;

  v2 = self;
  objc_sync_enter(v2);
  queue = v2->_queue;
  if (!queue)
  {
    v4 = (void *)MEMORY[0x24BDD17C8];
    +[MTFrameworkEnvironment sharedEnvironment](MTFrameworkEnvironment, "sharedEnvironment");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "metricsKitBundleIdentifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[MTObject metricsKit](v2, "metricsKit");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "topic");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "stringWithFormat:", CFSTR("%@.%@"), v6, v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    v10 = objc_retainAutorelease(v9);
    v11 = dispatch_queue_create((const char *)objc_msgSend(v10, "UTF8String"), 0);
    v12 = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v11;

    queue = v2->_queue;
  }
  v13 = queue;
  objc_sync_exit(v2);

  return v13;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_treatmentFilter, 0);
  objc_storeStrong((id *)&self->_eventFilter, 0);
  objc_storeStrong((id *)&self->_eventRecorder, 0);
  objc_storeStrong((id *)&self->_environment, 0);
}

- (void)setEventFilterWithJavaScriptFunction:(id)a3 context:(id)a4 operationQueue:(id)a5
{
  id v8;
  id v9;
  id v10;
  MTJSContextEventFilter *v11;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  v11 = -[MTJSContextEventFilter initWithJSContext:functionName:operationQueue:]([MTJSContextEventFilter alloc], "initWithJSContext:functionName:operationQueue:", v9, v10, v8);

  -[MTSystem setEventFilter:](self, "setEventFilter:", v11);
}

- (void)setEventFilter:(id)a3
{
  objc_storeStrong((id *)&self->_eventFilter, a3);
}

- (void)setTreatmentFilter:(id)a3
{
  objc_storeStrong((id *)&self->_treatmentFilter, a3);
}

- (void)setQueue:(id)a3
{
  objc_storeStrong((id *)&self->_queue, a3);
}

@end
