@implementation BPSFuture

- (BPSFuture)initWithAttemptToFulfill:(id)a3
{
  void (**v4)(id, void *);
  BPSFuture *v5;
  uint64_t v6;
  BPSSubscriberList *downstreams;
  BPSFutureResult *v8;
  void *v9;
  _QWORD aBlock[4];
  BPSFuture *v12;
  id v13;
  id location;
  objc_super v15;

  v4 = (void (**)(id, void *))a3;
  v15.receiver = self;
  v15.super_class = (Class)BPSFuture;
  v5 = -[BPSFuture init](&v15, sel_init);
  if (v5)
  {
    v6 = objc_opt_new();
    downstreams = v5->_downstreams;
    v5->_downstreams = (BPSSubscriberList *)v6;

    v5->_lock._os_unfair_lock_opaque = 0;
    v5->_publisherLock = 0;
    v8 = v5->_result;
    v5->_result = 0;

    v5->_sentResult = 0;
    objc_initWeak(&location, v5);
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __38__BPSFuture_initWithAttemptToFulfill___block_invoke;
    aBlock[3] = &unk_1E554D2D0;
    objc_copyWeak(&v13, &location);
    v12 = v5;
    v9 = _Block_copy(aBlock);
    v4[2](v4, v9);

    objc_destroyWeak(&v13);
    objc_destroyWeak(&location);
  }

  return v5;
}

void __38__BPSFuture_initWithAttemptToFulfill___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  os_unfair_lock_s *WeakRetained;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  WeakRetained = (os_unfair_lock_s *)objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    if (BPSPipelineSupportsPullBasedPublishers(*(void **)(a1 + 32)))
    {
      os_unfair_recursive_lock_lock_with_options();
      objc_msgSend(*(id *)(a1 + 32), "setResult:", v3);
      objc_msgSend(*(id *)(a1 + 32), "subscriber");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "requestNextEvents");

      os_unfair_recursive_lock_unlock();
    }
    else
    {
      os_unfair_lock_lock(WeakRetained + 2);
      objc_msgSend(*(id *)(a1 + 32), "result");
      v6 = (void *)objc_claimAutoreleasedReturnValue();

      if (v6)
      {
        os_unfair_lock_unlock(WeakRetained + 2);
      }
      else
      {
        objc_msgSend(*(id *)(a1 + 32), "setResult:", v3);
        objc_msgSend(*(id *)(a1 + 32), "downstreams");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "claimAll");
        v8 = (void *)objc_claimAutoreleasedReturnValue();

        os_unfair_lock_unlock(WeakRetained + 2);
        v16 = 0u;
        v17 = 0u;
        v14 = 0u;
        v15 = 0u;
        v9 = v8;
        v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
        if (v10)
        {
          v11 = v10;
          v12 = *(_QWORD *)v15;
          do
          {
            v13 = 0;
            do
            {
              if (*(_QWORD *)v15 != v12)
                objc_enumerationMutation(v9);
              objc_msgSend(*(id *)(*((_QWORD *)&v14 + 1) + 8 * v13++), "fulfill:", v3, (_QWORD)v14);
            }
            while (v11 != v13);
            v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
          }
          while (v11);
        }

      }
    }
  }

}

- (void)subscribe:(id)a3
{
  os_unfair_lock_s *p_lock;
  id v5;
  _BPSInnerFutureConduit *v6;
  void *v7;
  uint64_t v8;
  id v9;

  p_lock = &self->_lock;
  v5 = a3;
  os_unfair_lock_lock(p_lock);
  -[BPSFuture result](self, "result");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    os_unfair_lock_unlock(p_lock);
    v6 = -[_BPSInnerFutureConduit initWithParent:downstream:]([_BPSInnerFutureConduit alloc], "initWithParent:downstream:", self, v5);
    objc_msgSend(v5, "receiveSubscription:", v6);

    -[_BPSInnerFutureConduit fulfill:](v6, "fulfill:", v9);
  }
  else
  {
    v6 = -[_BPSInnerFutureConduit initWithParent:downstream:]([_BPSInnerFutureConduit alloc], "initWithParent:downstream:", self, v5);
    -[BPSFuture downstreams](self, "downstreams");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "appendElement:", v6);

    -[_BPSInnerFutureConduit assignIdentity:](v6, "assignIdentity:", v8);
    os_unfair_lock_unlock(p_lock);
    objc_msgSend(v5, "receiveSubscription:", v6);

  }
}

- (void)disassociate:(int64_t)a3
{
  os_unfair_lock_s *p_lock;
  void *v6;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  -[BPSFuture downstreams](self, "downstreams");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "removeTicket:", a3);

  os_unfair_lock_unlock(p_lock);
}

- (id)upstreamPublishers
{
  return (id)MEMORY[0x1E0C9AA60];
}

- (id)startWithSubscriber:(id)a3
{
  id v4;

  v4 = a3;
  os_unfair_recursive_lock_lock_with_options();
  -[BPSFuture setSubscriber:](self, "setSubscriber:", v4);

  os_unfair_recursive_lock_unlock();
  return 0;
}

- (id)nextEvent
{
  void *v3;
  void *v4;
  void *v5;

  os_unfair_recursive_lock_lock_with_options();
  if (-[BPSFuture sentResult](self, "sentResult")
    || (-[BPSFuture result](self, "result"), v3 = (void *)objc_claimAutoreleasedReturnValue(), v3, !v3))
  {
    v5 = 0;
  }
  else
  {
    -[BPSFuture setSentResult:](self, "setSentResult:", 1);
    -[BPSFuture result](self, "result");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "value");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  os_unfair_recursive_lock_unlock();
  return v5;
}

- (BOOL)completed
{
  os_unfair_recursive_lock_lock_with_options();
  LOBYTE(self) = -[BPSFuture sentResult](self, "sentResult");
  os_unfair_recursive_lock_unlock();
  return (char)self;
}

- (void)reset
{
  os_unfair_recursive_lock_lock_with_options();
  -[BPSFuture setResult:](self, "setResult:", 0);
  -[BPSFuture setSentResult:](self, "setSentResult:", 0);
  os_unfair_recursive_lock_unlock();
}

- (BPSSubscriber)subscriber
{
  return self->_subscriber;
}

- (void)setSubscriber:(id)a3
{
  objc_storeStrong((id *)&self->_subscriber, a3);
}

- (os_unfair_recursive_lock_s)publisherLock
{
  return self->_publisherLock;
}

- (void)setPublisherLock:(os_unfair_recursive_lock_s)a3
{
  self->_publisherLock = a3;
}

- (BOOL)sentResult
{
  return self->_sentResult;
}

- (void)setSentResult:(BOOL)a3
{
  self->_sentResult = a3;
}

- (BPSSubscriberList)downstreams
{
  return self->_downstreams;
}

- (void)setDownstreams:(id)a3
{
  objc_storeStrong((id *)&self->_downstreams, a3);
}

- (BPSFutureResult)result
{
  return self->_result;
}

- (void)setResult:(id)a3
{
  objc_storeStrong((id *)&self->_result, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_result, 0);
  objc_storeStrong((id *)&self->_downstreams, 0);
  objc_storeStrong((id *)&self->_subscriber, 0);
}

@end
