@implementation CRUIAnalytics

- (CRUIAnalytics)init
{
  CRUIAnalytics *v2;
  dispatch_queue_t v3;
  OS_dispatch_queue *serialAsyncQueue;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)CRUIAnalytics;
  v2 = -[CRUIAnalytics init](&v6, sel_init);
  if (v2)
  {
    v3 = dispatch_queue_create("async", 0);
    serialAsyncQueue = v2->serialAsyncQueue;
    v2->serialAsyncQueue = (OS_dispatch_queue *)v3;

  }
  return v2;
}

- (void)sendAnalyticsForRepairHistoryMismatch
{
  AnalyticsSendEventLazy();
}

- (void)sendAsyncAnalyticsForEventIfNeeded:(id)a3 moduleName:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  NSObject *serialAsyncQueue;
  _QWORD v10[4];
  id v11;
  id v12;

  v6 = a3;
  v7 = a4;
  if (v6)
  {
    v8 = objc_msgSend(v6, "length");
    if (v7)
    {
      if (v8 && objc_msgSend(v7, "length"))
      {
        serialAsyncQueue = self->serialAsyncQueue;
        v10[0] = MEMORY[0x24BDAC760];
        v10[1] = 3221225472;
        v10[2] = sub_22AC8206C;
        v10[3] = &unk_24F4D4E88;
        v11 = v7;
        v12 = v6;
        dispatch_async(serialAsyncQueue, v10);

      }
    }
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->serialAsyncQueue, 0);
}

@end
