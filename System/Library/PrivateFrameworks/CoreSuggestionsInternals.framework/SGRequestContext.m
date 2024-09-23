@implementation SGRequestContext

- (SGRequestContext)initWithServiceContext:(id)a3 concurrencyBehavior:(int)a4 backpressureHazard:(int)a5
{
  return -[SGRequestContext initWithServiceContext:concurrencyBehavior:backpressureHazard:extractionMode:](self, "initWithServiceContext:concurrencyBehavior:backpressureHazard:extractionMode:", a3, *(_QWORD *)&a4, *(_QWORD *)&a5, 0);
}

- (SGRequestContext)initWithServiceContext:(id)a3 concurrencyBehavior:(int)a4 backpressureHazard:(int)a5 extractionMode:(int)a6
{
  id v11;
  SGRequestContext *v12;
  SGRequestContext *v13;
  objc_super v15;

  v11 = a3;
  v15.receiver = self;
  v15.super_class = (Class)SGRequestContext;
  v12 = -[SGRequestContext init](&v15, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_serviceContext, a3);
    v13->_concurrencyBehavior = a4;
    v13->_backpressureHazard = a5;
    v13->_extractionMode = a6;
  }

  return v13;
}

- (SGServiceContext)serviceContext
{
  return self->_serviceContext;
}

- (int)concurrencyBehavior
{
  return self->_concurrencyBehavior;
}

- (int)backpressureHazard
{
  return self->_backpressureHazard;
}

- (int)extractionMode
{
  return self->_extractionMode;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serviceContext, 0);
}

- (NSOperationQueue)processingQueue
{
  void *v4;
  SGRequestContext *v5;

  if (-[SGRequestContext concurrencyBehavior](self, "concurrencyBehavior"))
  {
    +[SGPipeline sharedBackgroundProcessingQueue](SGPipeline, "sharedBackgroundProcessingQueue");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = self;
    objc_sync_enter(v5);
    objc_getAssociatedObject(v5, a2);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v4)
    {
      v4 = (void *)objc_opt_new();
      objc_msgSend(v4, "setMaxConcurrentOperationCount:", -1);
      objc_setAssociatedObject(v5, a2, v4, (void *)1);
    }
    objc_sync_exit(v5);

  }
  return (NSOperationQueue *)v4;
}

- (NSOperationQueue)storageQueue
{
  void *v4;
  SGRequestContext *v5;

  if (-[SGRequestContext concurrencyBehavior](self, "concurrencyBehavior"))
  {
    +[SGPipeline sharedBackgroundStorageQueue](SGPipeline, "sharedBackgroundStorageQueue");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = self;
    objc_sync_enter(v5);
    objc_getAssociatedObject(v5, a2);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v4)
    {
      v4 = (void *)objc_opt_new();
      objc_msgSend(v4, "setMaxConcurrentOperationCount:", 1);
      objc_setAssociatedObject(v5, a2, v4, (void *)1);
    }
    objc_sync_exit(v5);

  }
  return (NSOperationQueue *)v4;
}

@end
