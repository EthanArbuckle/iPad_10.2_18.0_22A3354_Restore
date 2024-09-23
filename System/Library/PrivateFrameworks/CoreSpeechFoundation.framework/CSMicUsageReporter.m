@implementation CSMicUsageReporter

- (CSMicUsageReporter)init
{
  CSMicUsageReporter *v2;
  NSObject *v3;
  dispatch_queue_t v4;
  OS_dispatch_queue *queue;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)CSMicUsageReporter;
  v2 = -[CSMicUsageReporter init](&v7, sel_init);
  if (v2)
  {
    dispatch_get_global_queue(33, 0);
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = dispatch_queue_create_with_target_V2("CSMicUsageReporter", 0, v3);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v4;

  }
  return v2;
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
  objc_storeStrong((id *)&self->_queue, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
}

@end
