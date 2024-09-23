@implementation HMMTagManager

- (HMMTagManager)init
{
  HMMTagManager *v2;
  HMMTagManager *v3;
  const char *v4;
  NSObject *v5;
  NSObject *v6;
  dispatch_queue_t v7;
  OS_dispatch_queue *workQueue;
  HMMTagDispatcher *v9;
  HMMTagDispatching *currentDispatcher;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)HMMTagManager;
  v2 = -[HMMTagManager init](&v12, sel_init);
  v3 = v2;
  if (v2)
  {
    v4 = (const char *)HMMDispatchQueueName(v2, 0);
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v5 = objc_claimAutoreleasedReturnValue();
    dispatch_queue_attr_make_with_qos_class(v5, QOS_CLASS_BACKGROUND, 0);
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = dispatch_queue_create(v4, v6);
    workQueue = v3->_workQueue;
    v3->_workQueue = (OS_dispatch_queue *)v7;

    v9 = -[HMMTagDispatcher initWithWorkQueue:]([HMMTagDispatcher alloc], "initWithWorkQueue:", v3->_workQueue);
    currentDispatcher = v3->_currentDispatcher;
    v3->_currentDispatcher = (HMMTagDispatching *)v9;

  }
  return v3;
}

- (void)resetTagDispatcher
{
  HMMTagDispatcher *v3;
  HMMTagDispatcher *v4;
  id v5;

  v3 = [HMMTagDispatcher alloc];
  -[HMMTagManager workQueue](self, "workQueue");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  v4 = -[HMMTagDispatcher initWithWorkQueue:](v3, "initWithWorkQueue:", v5);
  -[HMMTagManager setCurrentDispatcher:](self, "setCurrentDispatcher:", v4);

}

- (void)submitTaggedEvent:(id)a3 processorList:(id)a4
{
  id v6;
  id v7;
  id v8;

  v6 = a4;
  v7 = a3;
  -[HMMTagManager currentDispatcher](self, "currentDispatcher");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "submitTaggedEvent:processorList:", v7, v6);

}

- (void)registerTagObserver:(id)a3 forTags:(id)a4
{
  id v6;
  id v7;
  id v8;

  v6 = a4;
  v7 = a3;
  -[HMMTagManager currentDispatcher](self, "currentDispatcher");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "registerTagObserver:forTags:", v7, v6);

}

- (void)unregisterTagObserver:(id)a3 forTags:(id)a4
{
  id v6;
  id v7;
  id v8;

  v6 = a4;
  v7 = a3;
  -[HMMTagManager currentDispatcher](self, "currentDispatcher");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "unregisterTagObserver:forTags:", v7, v6);

}

- (OS_dispatch_queue)workQueue
{
  return self->_workQueue;
}

- (HMMLogEventSubmitting)logEventSubmitter
{
  return self->_logEventSubmitter;
}

- (void)setLogEventSubmitter:(id)a3
{
  objc_storeStrong((id *)&self->_logEventSubmitter, a3);
}

- (HMMTagDispatching)currentDispatcher
{
  return (HMMTagDispatching *)objc_getProperty(self, a2, 24, 1);
}

- (void)setCurrentDispatcher:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 24);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentDispatcher, 0);
  objc_storeStrong((id *)&self->_logEventSubmitter, 0);
  objc_storeStrong((id *)&self->_workQueue, 0);
}

+ (id)sharedInstance
{
  if (sharedInstance__hmf_once_t0_1298 != -1)
    dispatch_once(&sharedInstance__hmf_once_t0_1298, &__block_literal_global_1299);
  return (id)sharedInstance__hmf_once_v1_1300;
}

void __31__HMMTagManager_sharedInstance__block_invoke()
{
  HMMTagManager *v0;
  void *v1;

  v0 = objc_alloc_init(HMMTagManager);
  v1 = (void *)sharedInstance__hmf_once_v1_1300;
  sharedInstance__hmf_once_v1_1300 = (uint64_t)v0;

}

@end
