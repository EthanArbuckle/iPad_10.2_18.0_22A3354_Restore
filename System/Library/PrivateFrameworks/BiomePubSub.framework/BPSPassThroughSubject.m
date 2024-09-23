@implementation BPSPassThroughSubject

- (BPSPassThroughSubject)init
{
  BPSPassThroughSubject *v2;
  uint64_t v3;
  NSMutableArray *upstreamSubscriptions;
  BPSCompletion *completion;
  uint64_t v6;
  BPSSubscriberList *downstreams;
  BPSSubscriber *subscriber;
  uint64_t v9;
  NSMutableArray *nextEvents;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)BPSPassThroughSubject;
  v2 = -[BPSPassThroughSubject init](&v12, sel_init);
  if (v2)
  {
    v3 = objc_opt_new();
    upstreamSubscriptions = v2->_upstreamSubscriptions;
    v2->_upstreamSubscriptions = (NSMutableArray *)v3;

    completion = v2->_completion;
    v2->_completion = 0;

    v2->_active = 1;
    v6 = objc_opt_new();
    downstreams = v2->_downstreams;
    v2->_downstreams = (BPSSubscriberList *)v6;

    v2->_lock._os_unfair_lock_opaque = 0;
    subscriber = v2->_subscriber;
    v2->_subscriber = 0;

    v2->_complete = 0;
    v9 = objc_opt_new();
    nextEvents = v2->_nextEvents;
    v2->_nextEvents = (NSMutableArray *)v9;

    v2->_rlock = 0;
  }
  return v2;
}

- (void)dealloc
{
  NSMutableArray *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  objc_super v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v3 = self->_upstreamSubscriptions;
  v4 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v10;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v10 != v6)
          objc_enumerationMutation(v3);
        objc_msgSend(*(id *)(*((_QWORD *)&v9 + 1) + 8 * v7++), "cancel");
      }
      while (v5 != v7);
      v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v5);
  }

  v8.receiver = self;
  v8.super_class = (Class)BPSPassThroughSubject;
  -[BPSPassThroughSubject dealloc](&v8, sel_dealloc);
}

- (void)sendSubscription:(id)a3
{
  os_unfair_lock_s *p_lock;
  id v5;

  v5 = a3;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  -[NSMutableArray addObject:](self->_upstreamSubscriptions, "addObject:", v5);
  LODWORD(self) = -[BPSPassThroughSubject hasAnyDownstreamDemand](self, "hasAnyDownstreamDemand");
  os_unfair_lock_unlock(p_lock);
  if ((_DWORD)self)
    objc_msgSend(v5, "requestDemand:", 0x7FFFFFFFFFFFFFFFLL);

}

- (void)acknowledgeDownstreamDemand
{
  os_unfair_lock_s *p_lock;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  if (-[BPSPassThroughSubject hasAnyDownstreamDemand](self, "hasAnyDownstreamDemand"))
  {
    os_unfair_lock_unlock(p_lock);
  }
  else
  {
    -[BPSPassThroughSubject setHasAnyDownstreamDemand:](self, "setHasAnyDownstreamDemand:", 1);
    -[BPSPassThroughSubject upstreamSubscriptions](self, "upstreamSubscriptions");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    os_unfair_lock_unlock(p_lock);
    v12 = 0u;
    v13 = 0u;
    v10 = 0u;
    v11 = 0u;
    v5 = v4;
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v11;
      do
      {
        v9 = 0;
        do
        {
          if (*(_QWORD *)v11 != v8)
            objc_enumerationMutation(v5);
          objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * v9++), "requestDemand:", 0x7FFFFFFFFFFFFFFFLL, (_QWORD)v10);
        }
        while (v7 != v9);
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
      }
      while (v7);
    }

  }
}

- (void)subscribe:(id)a3
{
  os_unfair_lock_s *p_lock;
  id v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  _BPSInnerConduit *v10;

  p_lock = &self->_lock;
  v5 = a3;
  os_unfair_lock_lock(p_lock);
  if (-[BPSPassThroughSubject active](self, "active"))
  {
    v10 = -[_BPSInnerConduit initWithParent:downstream:]([_BPSInnerConduit alloc], "initWithParent:downstream:", self, v5);
    -[BPSPassThroughSubject downstreams](self, "downstreams");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "appendElement:", v10);

    -[_BPSInnerConduit assignIdentity:](v10, "assignIdentity:", v7);
    os_unfair_lock_unlock(p_lock);
    objc_msgSend(v5, "receiveSubscription:", v10);
  }
  else
  {
    -[BPSPassThroughSubject completion](self, "completion");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v8)
      objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99768], CFSTR("Terminal will always be set when not active"));
    os_unfair_lock_unlock(p_lock);
    v9 = (void *)objc_opt_new();
    objc_msgSend(v5, "receiveSubscription:", v9);

    -[BPSPassThroughSubject completion](self, "completion");
    v10 = (_BPSInnerConduit *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "receiveCompletion:");
  }

}

- (void)sendValue:(id)a3
{
  id v4;
  BPSPassThroughSubject *v5;
  os_unfair_lock_s *p_lock;
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
  v4 = a3;
  v5 = self;
  p_lock = &v5->_lock;
  os_unfair_lock_lock(&v5->_lock);
  if (-[BPSPassThroughSubject active](v5, "active"))
  {
    -[BPSPassThroughSubject downstreams](v5, "downstreams");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "items");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    os_unfair_lock_unlock(p_lock);
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
          objc_msgSend(*(id *)(*((_QWORD *)&v14 + 1) + 8 * v13++), "offerInput:", v4, (_QWORD)v14);
        }
        while (v11 != v13);
        v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      }
      while (v11);
    }

  }
  else
  {
    os_unfair_lock_unlock(p_lock);
  }

}

- (void)sendCompletion:(id)a3
{
  id v4;
  BPSPassThroughSubject *v5;
  os_unfair_lock_s *p_lock;
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
  v4 = a3;
  v5 = self;
  p_lock = &v5->_lock;
  os_unfair_lock_lock(&v5->_lock);
  if (-[BPSPassThroughSubject active](v5, "active"))
  {
    -[BPSPassThroughSubject setActive:](v5, "setActive:", 0);
    -[BPSPassThroughSubject setCompletion:](v5, "setCompletion:", v4);
    -[BPSPassThroughSubject downstreams](v5, "downstreams");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "claimAll");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    -[BPSPassThroughSubject setUpstreamSubscriptions:](v5, "setUpstreamSubscriptions:", 0);
    os_unfair_lock_unlock(p_lock);
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
          objc_msgSend(*(id *)(*((_QWORD *)&v14 + 1) + 8 * v13++), "finishWithCompletion:", v4, (_QWORD)v14);
        }
        while (v11 != v13);
        v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      }
      while (v11);
    }

  }
  else
  {
    os_unfair_lock_unlock(p_lock);
  }

}

- (void)disassociate:(int64_t)a3
{
  os_unfair_lock_s *p_lock;
  void *v6;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  if (-[BPSPassThroughSubject active](self, "active"))
  {
    -[BPSPassThroughSubject downstreams](self, "downstreams");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "removeTicket:", a3);

  }
  os_unfair_lock_unlock(p_lock);
}

- (void)receiveCompletion:(id)a3
{
  BPSPassThroughSubject *v4;

  v4 = self;
  -[BPSPassThroughSubject sendCompletion:](v4, "sendCompletion:", a3);

}

- (int64_t)receiveInput:(id)a3
{
  BPSPassThroughSubject *v4;

  v4 = self;
  -[BPSPassThroughSubject sendValue:](v4, "sendValue:", a3);

  return 0;
}

- (void)cancel
{
  BPSPassThroughSubject *v2;
  os_unfair_lock_s *p_lock;
  void *v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v2 = self;
  p_lock = &v2->_lock;
  os_unfair_lock_lock(&v2->_lock);
  if (-[BPSPassThroughSubject active](v2, "active"))
  {
    -[BPSPassThroughSubject setActive:](v2, "setActive:", 0);
    -[BPSPassThroughSubject upstreamSubscriptions](v2, "upstreamSubscriptions");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (void *)objc_msgSend(v4, "copy");

    -[BPSPassThroughSubject setUpstreamSubscriptions:](v2, "setUpstreamSubscriptions:", 0);
    os_unfair_lock_unlock(p_lock);
    v13 = 0u;
    v14 = 0u;
    v11 = 0u;
    v12 = 0u;
    v6 = v5;
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v12;
      do
      {
        v10 = 0;
        do
        {
          if (*(_QWORD *)v12 != v9)
            objc_enumerationMutation(v6);
          objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * v10++), "cancel", (_QWORD)v11);
        }
        while (v8 != v10);
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
      }
      while (v8);
    }

  }
  else
  {
    os_unfair_lock_unlock(p_lock);
  }

}

+ (id)publisherWithPublisher:(id)a3 upstreams:(id)a4 bookmarkState:(id)a5
{
  return a3;
}

- (BOOL)canStoreInternalStateInBookmark
{
  return 0;
}

- (BOOL)canStorePassThroughValueInBookmark
{
  return 0;
}

- (id)bookmarkableUpstreams
{
  return 0;
}

- (id)startWithSubscriber:(id)a3
{
  id v4;

  v4 = a3;
  os_unfair_recursive_lock_lock_with_options();
  -[BPSPassThroughSubject setSubscriber:](self, "setSubscriber:", v4);

  os_unfair_recursive_lock_unlock();
  return 0;
}

- (id)nextEvent
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;

  os_unfair_recursive_lock_lock_with_options();
  -[BPSPassThroughSubject nextEvents](self, "nextEvents");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count");

  if (v4)
  {
    -[BPSPassThroughSubject nextEvents](self, "nextEvents");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "objectAtIndex:", 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    -[BPSPassThroughSubject nextEvents](self, "nextEvents");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "removeObjectAtIndex:", 0);

  }
  else
  {
    v6 = 0;
  }
  os_unfair_recursive_lock_unlock();
  return v6;
}

- (BOOL)completed
{
  BOOL v3;
  void *v4;

  os_unfair_recursive_lock_lock_with_options();
  v3 = 0;
  if (-[BPSPassThroughSubject complete](self, "complete"))
  {
    -[BPSPassThroughSubject nextEvents](self, "nextEvents");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = objc_msgSend(v4, "count") == 0;

  }
  os_unfair_recursive_lock_unlock();
  return v3;
}

- (void)reset
{
  void *v3;

  os_unfair_recursive_lock_lock_with_options();
  -[BPSPassThroughSubject setComplete:](self, "setComplete:", 0);
  -[BPSPassThroughSubject setSubscriber:](self, "setSubscriber:", 0);
  -[BPSPassThroughSubject nextEvents](self, "nextEvents");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeAllObjects");

  os_unfair_recursive_lock_unlock();
}

- (id)bookmark
{
  void *v3;

  os_unfair_recursive_lock_lock_with_options();
  -[BPSPassThroughSubject nextEvents](self, "nextEvents");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  os_unfair_recursive_lock_unlock();
  return v3;
}

- (id)validateBookmark:(id)a3
{
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v11;
  _QWORD v12[2];

  v12[1] = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v4 = 0;
  }
  else
  {
    v5 = objc_alloc(MEMORY[0x1E0CB3940]);
    v6 = objc_opt_class();
    v7 = (void *)objc_msgSend(v5, "initWithFormat:", CFSTR("%@ expected bookmark of class %@, but received %@"), v6, objc_opt_class(), v3);
    v8 = (void *)MEMORY[0x1E0CB35C8];
    v11 = *MEMORY[0x1E0CB2D50];
    v12[0] = v7;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v12, &v11, 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "errorWithDomain:code:userInfo:", CFSTR("BiomePubSubError"), 2, v9);
    v4 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v4;
}

- (void)applyBookmark:(id)a3
{
  id v4;

  v4 = a3;
  os_unfair_recursive_lock_lock_with_options();
  -[BPSPassThroughSubject setNextEvents:](self, "setNextEvents:", v4);

  os_unfair_recursive_lock_unlock();
}

- (void)sendCompletion
{
  void *v3;

  os_unfair_recursive_lock_lock_with_options();
  -[BPSPassThroughSubject setComplete:](self, "setComplete:", 1);
  -[BPSPassThroughSubject subscriber](self, "subscriber");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "requestNextEvents");

  os_unfair_recursive_lock_unlock();
}

- (void)sendEvent:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  os_unfair_recursive_lock_lock_with_options();
  -[BPSPassThroughSubject nextEvents](self, "nextEvents");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObject:", v4);

  -[BPSPassThroughSubject subscriber](self, "subscriber");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "requestNextEvents");

  os_unfair_recursive_lock_unlock();
}

- (NSMutableArray)upstreamSubscriptions
{
  return self->_upstreamSubscriptions;
}

- (void)setUpstreamSubscriptions:(id)a3
{
  objc_storeStrong((id *)&self->_upstreamSubscriptions, a3);
}

- (BOOL)hasAnyDownstreamDemand
{
  return self->_hasAnyDownstreamDemand;
}

- (void)setHasAnyDownstreamDemand:(BOOL)a3
{
  self->_hasAnyDownstreamDemand = a3;
}

- (BOOL)active
{
  return self->_active;
}

- (void)setActive:(BOOL)a3
{
  self->_active = a3;
}

- (BPSCompletion)completion
{
  return self->_completion;
}

- (void)setCompletion:(id)a3
{
  objc_storeStrong((id *)&self->_completion, a3);
}

- (BPSSubscriberList)downstreams
{
  return self->_downstreams;
}

- (void)setDownstreams:(id)a3
{
  objc_storeStrong((id *)&self->_downstreams, a3);
}

- (BPSSubscription)sub
{
  return self->_sub;
}

- (void)setSub:(id)a3
{
  objc_storeStrong((id *)&self->_sub, a3);
}

- (BPSSubscriber)subscriber
{
  return self->_subscriber;
}

- (void)setSubscriber:(id)a3
{
  objc_storeStrong((id *)&self->_subscriber, a3);
}

- (BOOL)complete
{
  return self->_complete;
}

- (void)setComplete:(BOOL)a3
{
  self->_complete = a3;
}

- (NSMutableArray)nextEvents
{
  return self->_nextEvents;
}

- (void)setNextEvents:(id)a3
{
  objc_storeStrong((id *)&self->_nextEvents, a3);
}

- (os_unfair_recursive_lock_s)rlock
{
  return self->_rlock;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_nextEvents, 0);
  objc_storeStrong((id *)&self->_subscriber, 0);
  objc_storeStrong((id *)&self->_sub, 0);
  objc_storeStrong((id *)&self->_downstreams, 0);
  objc_storeStrong((id *)&self->_completion, 0);
  objc_storeStrong((id *)&self->_upstreamSubscriptions, 0);
}

@end
