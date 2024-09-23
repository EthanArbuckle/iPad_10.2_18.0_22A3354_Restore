@implementation _CATArbitratorRegistrationEntry

- (_CATArbitratorRegistrationEntry)initWithResource:(id)a3 maxConcurrentCount:(unint64_t)a4
{
  id v8;
  _CATArbitratorRegistrationEntry *v9;
  _CATArbitratorRegistrationEntry *v10;
  uint64_t v11;
  NSMutableArray *mPendingWaits;
  id v13;
  dispatch_queue_t v14;
  OS_dispatch_queue *mPendingWaitsQueue;
  dispatch_source_t v16;
  OS_dispatch_source *mPendingWaitsSource;
  NSObject *v18;
  void *v20;
  void *v21;
  _QWORD handler[4];
  id v23;
  id location;
  objc_super v25;

  v8 = a3;
  if (v8)
  {
    if (a4)
      goto LABEL_3;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("CATArbitrator.m"), 354, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("resource"));

    if (a4)
      goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("CATArbitrator.m"), 355, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("maxConcurrentCount > 0"));

LABEL_3:
  v25.receiver = self;
  v25.super_class = (Class)_CATArbitratorRegistrationEntry;
  v9 = -[_CATArbitratorRegistrationEntry init](&v25, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong(&v9->mResource, a3);
    v10->mMaxConcurrentCount = a4;
    v11 = objc_opt_new();
    mPendingWaits = v10->mPendingWaits;
    v10->mPendingWaits = (NSMutableArray *)v11;

    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@.%p.pending-waits"), objc_opt_class(), v10);
    v13 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v14 = dispatch_queue_create((const char *)objc_msgSend(v13, "UTF8String"), 0);
    mPendingWaitsQueue = v10->mPendingWaitsQueue;
    v10->mPendingWaitsQueue = (OS_dispatch_queue *)v14;

    objc_initWeak(&location, v10);
    v16 = dispatch_source_create(MEMORY[0x24BDAC9D0], 0, 0, (dispatch_queue_t)v10->mPendingWaitsQueue);
    mPendingWaitsSource = v10->mPendingWaitsSource;
    v10->mPendingWaitsSource = (OS_dispatch_source *)v16;

    v18 = v10->mPendingWaitsSource;
    handler[0] = MEMORY[0x24BDAC760];
    handler[1] = 3221225472;
    handler[2] = __71___CATArbitratorRegistrationEntry_initWithResource_maxConcurrentCount___block_invoke;
    handler[3] = &unk_24C1C58B0;
    objc_copyWeak(&v23, &location);
    dispatch_source_set_event_handler(v18, handler);
    dispatch_resume((dispatch_object_t)v10->mPendingWaitsSource);
    objc_destroyWeak(&v23);
    objc_destroyWeak(&location);

  }
  return v10;
}

- (id)makeResourceProxyIfPossible:(BOOL)a3
{
  _BOOL8 v3;
  NSMutableArray *v5;
  void *v6;

  v3 = a3;
  v5 = self->mPendingWaits;
  objc_sync_enter(v5);
  if (self->_currentCount >= self->mMaxConcurrentCount)
  {
    v6 = 0;
  }
  else
  {
    -[_CATArbitratorRegistrationEntry makeResourceProxyIfPossibleWithoutLocking:](self, "makeResourceProxyIfPossibleWithoutLocking:", v3);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_sync_exit(v5);

  return v6;
}

- (id)waitForResourceWithExclusive:(BOOL)a3 group:(id)a4
{
  _BOOL8 v4;
  id v6;
  NSMutableArray *v7;
  _CATProxyWaitToken *v8;

  v4 = a3;
  v6 = a4;
  v7 = self->mPendingWaits;
  objc_sync_enter(v7);
  v8 = -[_CATProxyWaitToken initWithExclusive:group:]([_CATProxyWaitToken alloc], "initWithExclusive:group:", v4, v6);
  -[NSMutableArray addObject:](self->mPendingWaits, "addObject:", v8);
  -[_CATArbitratorRegistrationEntry pendingWaitsNeedServicing](self, "pendingWaitsNeedServicing");
  objc_sync_exit(v7);

  return v8;
}

- (void)invalidate
{
  NSMutableArray *v3;
  id mResource;
  void *v5;

  v3 = self->mPendingWaits;
  objc_sync_enter(v3);
  mResource = self->mResource;
  self->mResource = 0;

  self->mMaxConcurrentCount = 0;
  v5 = (void *)-[NSMutableArray copy](self->mPendingWaits, "copy");
  -[NSMutableArray removeAllObjects](self->mPendingWaits, "removeAllObjects");
  objc_msgSend(v5, "makeObjectsPerformSelector:", sel_cancel);

  objc_sync_exit(v3);
  dispatch_source_cancel((dispatch_source_t)self->mPendingWaitsSource);
}

- (void)resourceProxyDidInvalidate:(id)a3
{
  NSMutableArray *v4;
  unint64_t v5;
  unint64_t currentCount;
  id v7;

  v7 = a3;
  v4 = self->mPendingWaits;
  objc_sync_enter(v4);
  if ((objc_msgSend(v7, "isExclusive") & 1) != 0)
  {
    v5 = 0;
LABEL_5:
    self->_currentCount = v5;
    goto LABEL_6;
  }
  currentCount = self->_currentCount;
  if (currentCount)
  {
    v5 = currentCount - 1;
    goto LABEL_5;
  }
LABEL_6:
  -[_CATArbitratorRegistrationEntry pendingWaitsNeedServicing](self, "pendingWaitsNeedServicing");
  objc_sync_exit(v4);

}

- (void)pendingWaitsNeedServicing
{
  NSMutableArray *obj;

  obj = self->mPendingWaits;
  objc_sync_enter(obj);
  if (-[NSMutableArray count](self->mPendingWaits, "count"))
    dispatch_source_merge_data((dispatch_source_t)self->mPendingWaitsSource, 1uLL);
  objc_sync_exit(obj);

}

- (void)servicePendingWaitTokens
{
  NSMutableArray *v3;
  void *v4;
  NSMutableArray *v5;
  NSMutableArray *v6;

  while (1)
  {
    v3 = self->mPendingWaits;
    objc_sync_enter(v3);
    if (!-[NSMutableArray count](self->mPendingWaits, "count"))
    {
      objc_sync_exit(v3);
      v5 = v3;
      goto LABEL_7;
    }
    -[NSMutableArray firstObject](self->mPendingWaits, "firstObject");
    v6 = (NSMutableArray *)objc_claimAutoreleasedReturnValue();
    -[_CATArbitratorRegistrationEntry makeResourceProxyIfPossibleWithoutLocking:](self, "makeResourceProxyIfPossibleWithoutLocking:", -[NSMutableArray isExclusive](v6, "isExclusive"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v4)
      break;
    -[NSMutableArray removeObjectAtIndex:](self->mPendingWaits, "removeObjectAtIndex:", 0);
    objc_sync_exit(v3);

    -[NSMutableArray notifyWithResourceProxy:](v6, "notifyWithResourceProxy:", v4);
    if (dispatch_source_testcancel((dispatch_source_t)self->mPendingWaitsSource))
      return;
  }
  objc_sync_exit(v3);

  v5 = v6;
LABEL_7:

}

- (id)makeResourceProxyIfPossibleWithoutLocking:(BOOL)a3
{
  _BOOL8 v3;
  NSMutableArray *v5;
  unint64_t currentCount;
  _CATArbitratorResourceProxy *v7;
  unint64_t mMaxConcurrentCount;

  v3 = a3;
  v5 = self->mPendingWaits;
  objc_sync_enter(v5);
  currentCount = self->_currentCount;
  if (v3)
  {
    if (currentCount)
    {
LABEL_3:
      v7 = 0;
      goto LABEL_9;
    }
  }
  else if (currentCount >= self->mMaxConcurrentCount)
  {
    goto LABEL_3;
  }
  v7 = -[_CATArbitratorResourceProxy initWithResource:registration:exclusive:]([_CATArbitratorResourceProxy alloc], "initWithResource:registration:exclusive:", self->mResource, self, v3);
  if (v3)
    mMaxConcurrentCount = self->mMaxConcurrentCount;
  else
    mMaxConcurrentCount = self->_currentCount + 1;
  self->_currentCount = mMaxConcurrentCount;
LABEL_9:
  objc_sync_exit(v5);

  return v7;
}

- (unint64_t)currentCount
{
  return self->_currentCount;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->mPendingWaitsQueue, 0);
  objc_storeStrong((id *)&self->mPendingWaitsSource, 0);
  objc_storeStrong((id *)&self->mPendingWaits, 0);
  objc_storeStrong(&self->mResource, 0);
}

@end
