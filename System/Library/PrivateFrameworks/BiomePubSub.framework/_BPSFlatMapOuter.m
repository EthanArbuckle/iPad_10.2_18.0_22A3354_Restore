@implementation _BPSFlatMapOuter

- (_BPSFlatMapOuter)initWithDownstream:(id)a3 maxPublishers:(int64_t)a4 map:(id)a5
{
  id v9;
  id v10;
  _BPSFlatMapOuter *v11;
  _BPSFlatMapOuter *v12;
  uint64_t v13;
  BMBookmark *outerBookmark;
  uint64_t v15;
  NSMutableDictionary *subscriptions;
  uint64_t v17;
  id map;
  uint64_t v19;
  NSMutableArray *buffer;
  objc_super v22;

  v9 = a3;
  v10 = a5;
  v22.receiver = self;
  v22.super_class = (Class)_BPSFlatMapOuter;
  v11 = -[_BPSFlatMapOuter init](&v22, sel_init);
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_downstream, a3);
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v13 = objc_claimAutoreleasedReturnValue();
    outerBookmark = v12->_outerBookmark;
    v12->_outerBookmark = (BMBookmark *)v13;

    v15 = objc_opt_new();
    subscriptions = v12->_subscriptions;
    v12->_subscriptions = (NSMutableDictionary *)v15;

    v12->_maxPublishers = a4;
    v17 = objc_msgSend(v10, "copy");
    map = v12->_map;
    v12->_map = (id)v17;

    v19 = objc_msgSend(MEMORY[0x1E0C9AA60], "mutableCopy");
    buffer = v12->_buffer;
    v12->_buffer = (NSMutableArray *)v19;

    v12->_lock._os_unfair_lock_opaque = 0;
    v12->_outerLock._os_unfair_lock_opaque = 0;
    v12->_downstreamLock = 0;
  }

  return v12;
}

- (void)receiveSubscription:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  os_unfair_lock_lock(&self->_lock);
  -[_BPSFlatMapOuter outerSubscription](self, "outerSubscription");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {

  }
  else if (!-[_BPSFlatMapOuter cancelledOrCompleted](self, "cancelledOrCompleted"))
  {
    os_unfair_lock_unlock(&self->_lock);
    -[_BPSFlatMapOuter setOuterSubscription:](self, "setOuterSubscription:", v5);
    objc_msgSend(v5, "requestDemand:", -[_BPSFlatMapOuter maxPublishers](self, "maxPublishers"));
    goto LABEL_6;
  }
  os_unfair_lock_unlock(&self->_lock);
  objc_msgSend(v5, "cancel");
LABEL_6:

}

- (int64_t)receiveInput:(id)a3
{
  id v4;
  _BPSFlatMapOuter *v5;
  os_unfair_lock_s *p_lock;
  _BOOL4 v7;
  void (**v8)(_QWORD, _QWORD);
  void *v9;
  uint64_t v10;
  _BPSFlatMapSide *v11;

  v4 = a3;
  v5 = self;
  p_lock = &v5->_lock;
  os_unfair_lock_lock(&v5->_lock);
  v7 = -[_BPSFlatMapOuter cancelledOrCompleted](v5, "cancelledOrCompleted");
  os_unfair_lock_unlock(&v5->_lock);
  if (!v7)
  {
    -[_BPSFlatMapOuter map](v5, "map");
    v8 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, id))v8)[2](v8, v4);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    v10 = -[_BPSFlatMapOuter nextInnerIndex](v5, "nextInnerIndex");
    -[_BPSFlatMapOuter setNextInnerIndex:](v5, "setNextInnerIndex:", -[_BPSFlatMapOuter nextInnerIndex](v5, "nextInnerIndex") + 1);
    os_unfair_lock_lock(p_lock);
    -[_BPSFlatMapOuter setPendingSubscriptions:](v5, "setPendingSubscriptions:", -[_BPSFlatMapOuter pendingSubscriptions](v5, "pendingSubscriptions") + 1);
    os_unfair_lock_unlock(p_lock);
    v11 = -[_BPSFlatMapSide initWithIndex:outer:]([_BPSFlatMapSide alloc], "initWithIndex:outer:", v10, v5);
    objc_msgSend(v9, "subscribe:", v11);

  }
  return 0;
}

- (void)receiveCompletion:(id)a3
{
  id v4;
  _BPSFlatMapOuter *v5;
  os_unfair_lock_s *p_lock;
  uint64_t v7;
  void *v8;
  void *v9;
  BOOL v10;
  BOOL v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _BYTE v32[128];
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = self;
  p_lock = &v5->_lock;
  os_unfair_lock_lock(&v5->_lock);
  -[_BPSFlatMapOuter setOuterFinished:](v5, "setOuterFinished:", 1);
  -[_BPSFlatMapOuter _updateBookmarkWhenLocked](v5, "_updateBookmarkWhenLocked");
  -[_BPSFlatMapOuter setOuterSubscription:](v5, "setOuterSubscription:", 0);
  v7 = objc_msgSend(v4, "state");
  if (v7 == 1)
  {
    v11 = -[_BPSFlatMapOuter cancelledOrCompleted](v5, "cancelledOrCompleted");
    -[_BPSFlatMapOuter setCancelledOrCompleted:](v5, "setCancelledOrCompleted:", 1);
    v30 = 0u;
    v31 = 0u;
    v28 = 0u;
    v29 = 0u;
    -[_BPSFlatMapOuter subscriptions](v5, "subscriptions", 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
    if (v13)
    {
      v14 = v13;
      v15 = *(_QWORD *)v29;
      do
      {
        for (i = 0; i != v14; ++i)
        {
          if (*(_QWORD *)v29 != v15)
            objc_enumerationMutation(v12);
          v17 = *(_QWORD *)(*((_QWORD *)&v28 + 1) + 8 * i);
          -[_BPSFlatMapOuter subscriptions](v5, "subscriptions");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v18, "objectForKeyedSubscript:", v17);
          v19 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v19, "cancel");
        }
        v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
      }
      while (v14);
    }

    v20 = (void *)objc_msgSend(MEMORY[0x1E0C9AA70], "mutableCopy");
    -[_BPSFlatMapOuter setSubscriptions:](v5, "setSubscriptions:", v20);

    os_unfair_lock_unlock(p_lock);
    if (!v11)
    {
      os_unfair_recursive_lock_lock_with_options();
      -[_BPSFlatMapOuter downstream](v5, "downstream");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "error");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      +[BPSCompletion failureWithError:](BPSCompletion, "failureWithError:", v22);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "receiveCompletion:", v23);

LABEL_19:
      os_unfair_recursive_lock_unlock();
    }
  }
  else if (!v7)
  {
    -[_BPSFlatMapOuter buffer](v5, "buffer");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      -[_BPSFlatMapOuter buffer](v5, "buffer");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v9, "count") != 0;

    }
    else
    {
      v10 = 0;
    }

    if (-[_BPSFlatMapOuter cancelledOrCompleted](v5, "cancelledOrCompleted")
      || v10
      || (-[_BPSFlatMapOuter subscriptions](v5, "subscriptions"),
          v24 = (void *)objc_claimAutoreleasedReturnValue(),
          v25 = objc_msgSend(v24, "count"),
          v26 = -[_BPSFlatMapOuter pendingSubscriptions](v5, "pendingSubscriptions"),
          v24,
          v25 + v26))
    {
      os_unfair_lock_unlock(p_lock);
      goto LABEL_21;
    }
    -[_BPSFlatMapOuter setCancelledOrCompleted:](v5, "setCancelledOrCompleted:", 1);
    os_unfair_lock_unlock(p_lock);
    os_unfair_recursive_lock_lock_with_options();
    -[_BPSFlatMapOuter downstream](v5, "downstream");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    +[BPSCompletion success](BPSCompletion, "success");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "receiveCompletion:", v27);

    goto LABEL_19;
  }
LABEL_21:

}

- (void)requestDemand:(int64_t)a3
{
  _BPSFlatMapOuter *v5;
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t j;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  uint64_t v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  uint64_t v34;
  uint64_t v35;
  void *v36;
  void *v37;
  uint64_t v38;
  void *v39;
  void *v40;
  _BOOL4 v41;
  void *v42;
  uint64_t v43;
  uint64_t v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  _BYTE v57[128];
  _BYTE v58[128];
  uint64_t v59;

  v59 = *MEMORY[0x1E0C80C00];
  v5 = self;
  if (a3 <= 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v47, "handleFailureInMethod:object:file:lineNumber:description:", a2, v5, CFSTR("BPSFlatMap.m"), 164, CFSTR("Zero or negative demand requested"));

  }
  if (-[_BPSFlatMapOuter downstreamRecursive](v5, "downstreamRecursive"))
  {
    -[_BPSFlatMapOuter setDownstreamDemand:](v5, "setDownstreamDemand:", -[_BPSFlatMapOuter downstreamDemand](v5, "downstreamDemand") + a3);
  }
  else
  {
    os_unfair_lock_lock(&v5->_lock);
    if (-[_BPSFlatMapOuter cancelledOrCompleted](v5, "cancelledOrCompleted"))
      goto LABEL_40;
    if (a3 == 0x7FFFFFFFFFFFFFFFLL)
    {
      -[_BPSFlatMapOuter setDownstreamDemand:](v5, "setDownstreamDemand:", 0x7FFFFFFFFFFFFFFFLL);
      -[_BPSFlatMapOuter buffer](v5, "buffer");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = (void *)objc_msgSend(MEMORY[0x1E0C9AA60], "mutableCopy");
      -[_BPSFlatMapOuter setBuffer:](v5, "setBuffer:", v7);

      -[_BPSFlatMapOuter subscriptions](v5, "subscriptions");
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      os_unfair_lock_unlock(&v5->_lock);
      os_unfair_recursive_lock_lock_with_options();
      -[_BPSFlatMapOuter setDownstreamRecursive:](v5, "setDownstreamRecursive:", 1);
      v55 = 0u;
      v56 = 0u;
      v53 = 0u;
      v54 = 0u;
      v8 = v6;
      v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v53, v58, 16);
      if (v9)
      {
        v10 = v9;
        v11 = *(_QWORD *)v54;
        do
        {
          for (i = 0; i != v10; ++i)
          {
            if (*(_QWORD *)v54 != v11)
              objc_enumerationMutation(v8);
            v13 = *(void **)(*((_QWORD *)&v53 + 1) + 8 * i);
            -[_BPSFlatMapOuter downstream](v5, "downstream");
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v13, "second");
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v14, "receiveInput:", v15);

          }
          v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v53, v58, 16);
        }
        while (v10);
      }

      -[_BPSFlatMapOuter setDownstreamRecursive:](v5, "setDownstreamRecursive:", 0);
      os_unfair_recursive_lock_unlock();
      v51 = 0u;
      v52 = 0u;
      v49 = 0u;
      v50 = 0u;
      v16 = v48;
      v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v49, v57, 16);
      if (v17)
      {
        v18 = v17;
        v19 = *(_QWORD *)v50;
        do
        {
          for (j = 0; j != v18; ++j)
          {
            if (*(_QWORD *)v50 != v19)
              objc_enumerationMutation(v16);
            objc_msgSend(v16, "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v49 + 1) + 8 * j));
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v21, "requestDemand:", 0x7FFFFFFFFFFFFFFFLL);

          }
          v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v49, v57, 16);
        }
        while (v18);
      }

      os_unfair_lock_lock(&v5->_lock);
    }
    else
    {
      -[_BPSFlatMapOuter setDownstreamDemand:](v5, "setDownstreamDemand:", -[_BPSFlatMapOuter downstreamDemand](v5, "downstreamDemand") + a3);
      -[_BPSFlatMapOuter buffer](v5, "buffer");
      v22 = objc_claimAutoreleasedReturnValue();
      if (v22)
      {
        v23 = (void *)v22;
        -[_BPSFlatMapOuter buffer](v5, "buffer");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        v25 = objc_msgSend(v24, "count");

        if (v25)
        {
          while (-[_BPSFlatMapOuter downstreamDemand](v5, "downstreamDemand") >= 1)
          {
            -[_BPSFlatMapOuter buffer](v5, "buffer");
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v26, "firstObject");
            v27 = (void *)objc_claimAutoreleasedReturnValue();

            -[_BPSFlatMapOuter buffer](v5, "buffer");
            v28 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v28, "removeObjectAtIndex:", 0);

            -[_BPSFlatMapOuter setDownstreamDemand:](v5, "setDownstreamDemand:", -[_BPSFlatMapOuter downstreamDemand](v5, "downstreamDemand") - 1);
            -[_BPSFlatMapOuter subscriptions](v5, "subscriptions");
            v29 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v27, "first");
            v30 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v29, "objectForKeyedSubscript:", v30);
            v31 = (void *)objc_claimAutoreleasedReturnValue();

            os_unfair_lock_unlock(&v5->_lock);
            os_unfair_recursive_lock_lock_with_options();
            -[_BPSFlatMapOuter setDownstreamRecursive:](v5, "setDownstreamRecursive:", 1);
            -[_BPSFlatMapOuter downstream](v5, "downstream");
            v32 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v27, "second");
            v33 = (void *)objc_claimAutoreleasedReturnValue();
            v34 = objc_msgSend(v32, "receiveInput:", v33);

            -[_BPSFlatMapOuter setDownstreamRecursive:](v5, "setDownstreamRecursive:", 0);
            os_unfair_recursive_lock_unlock();
            if (v34 >= 1)
            {
              os_unfair_lock_lock(&v5->_lock);
              -[_BPSFlatMapOuter setDownstreamDemand:](v5, "setDownstreamDemand:", -[_BPSFlatMapOuter downstreamDemand](v5, "downstreamDemand") + v34);
              os_unfair_lock_unlock(&v5->_lock);
            }
            if (v31)
            {
              -[_BPSFlatMapOuter setInnerRecursive:](v5, "setInnerRecursive:", 1);
              objc_msgSend(v31, "requestDemand:", 1);
              -[_BPSFlatMapOuter setInnerRecursive:](v5, "setInnerRecursive:", 0);
            }
            os_unfair_lock_lock(&v5->_lock);
            -[_BPSFlatMapOuter buffer](v5, "buffer");
            v35 = objc_claimAutoreleasedReturnValue();
            if (!v35)
            {

              break;
            }
            v36 = (void *)v35;
            -[_BPSFlatMapOuter buffer](v5, "buffer");
            v37 = (void *)objc_claimAutoreleasedReturnValue();
            v38 = objc_msgSend(v37, "count");

            if (!v38)
              break;
          }
        }
      }
    }
    -[_BPSFlatMapOuter buffer](v5, "buffer");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    if (v39)
    {
      -[_BPSFlatMapOuter buffer](v5, "buffer");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      v41 = objc_msgSend(v40, "count") != 0;

    }
    else
    {
      v41 = 0;
    }

    if (-[_BPSFlatMapOuter cancelledOrCompleted](v5, "cancelledOrCompleted")
      || !-[_BPSFlatMapOuter outerFinished](v5, "outerFinished")
      || v41
      || (-[_BPSFlatMapOuter subscriptions](v5, "subscriptions"),
          v42 = (void *)objc_claimAutoreleasedReturnValue(),
          v43 = objc_msgSend(v42, "count"),
          v44 = -[_BPSFlatMapOuter pendingSubscriptions](v5, "pendingSubscriptions"),
          v42,
          v43 + v44))
    {
LABEL_40:
      os_unfair_lock_unlock(&v5->_lock);
    }
    else
    {
      -[_BPSFlatMapOuter setCancelledOrCompleted:](v5, "setCancelledOrCompleted:", 1);
      os_unfair_lock_unlock(&v5->_lock);
      os_unfair_recursive_lock_lock_with_options();
      -[_BPSFlatMapOuter downstream](v5, "downstream");
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      +[BPSCompletion success](BPSCompletion, "success");
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v45, "receiveCompletion:", v46);

      os_unfair_recursive_lock_unlock();
    }
  }

}

- (void)cancel
{
  _BPSFlatMapOuter *v2;
  void *v3;
  void *v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v2 = self;
  os_unfair_lock_lock(&v2->_lock);
  -[_BPSFlatMapOuter setCancelledOrCompleted:](v2, "setCancelledOrCompleted:", 1);
  -[_BPSFlatMapOuter subscriptions](v2, "subscriptions");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(MEMORY[0x1E0C9AA70], "mutableCopy");
  -[_BPSFlatMapOuter setSubscriptions:](v2, "setSubscriptions:", v4);

  -[_BPSFlatMapOuter outerSubscription](v2, "outerSubscription");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[_BPSFlatMapOuter _updateBookmarkWhenLocked](v2, "_updateBookmarkWhenLocked");
  -[_BPSFlatMapOuter setOuterSubscription:](v2, "setOuterSubscription:", 0);
  os_unfair_lock_unlock(&v2->_lock);
  v14 = 0u;
  v15 = 0u;
  v12 = 0u;
  v13 = 0u;
  v6 = v3;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v13;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v13 != v9)
          objc_enumerationMutation(v6);
        objc_msgSend(v6, "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * v10), (_QWORD)v12);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "cancel");

        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v8);
  }

  objc_msgSend(v5, "cancel");
}

- (id)upstreamSubscriptions
{
  void *v3;
  void *v4;
  void *v5;
  _QWORD v7[2];

  v7[1] = *MEMORY[0x1E0C80C00];
  -[_BPSFlatMapOuter outerSubscription](self, "outerSubscription");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    -[_BPSFlatMapOuter outerSubscription](self, "outerSubscription");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v7[0] = v4;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v7, 1);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v5 = (void *)MEMORY[0x1E0C9AA60];
  }

  return v5;
}

- (void)_updateBookmarkWhenLocked
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  objc_msgSend(a1, "outerSubscription");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0_3(&dword_1A956A000, v2, v3, "Subscription - %@ doesn't conform to BMBookmarkableSubscription protocol", v4, v5, v6, v7, 2u);

  OUTLINED_FUNCTION_1();
}

- (id)newBookmark
{
  BMBookmarkNode *v3;
  void *v4;
  void *v5;
  objc_class *v6;
  void *v7;
  BMBookmarkNode *v8;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x1E0C80C00];
  v3 = [BMBookmarkNode alloc];
  v10[0] = self->_outerBookmark;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v10, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[_BPSFlatMapOuter outerSubscription](self, "outerSubscription");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (objc_class *)objc_opt_class();
  NSStringFromClass(v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[BMBookmarkNode initWithValue:upstreams:name:](v3, "initWithValue:upstreams:name:", 0, v4, v7);

  return v8;
}

- (void)receiveInnerSubscription:(id)a3 index:(int64_t)a4
{
  os_unfair_lock_s *p_lock;
  void *v7;
  void *v8;
  uint64_t v9;
  id v10;

  p_lock = &self->_lock;
  v10 = a3;
  os_unfair_lock_lock(p_lock);
  -[_BPSFlatMapOuter setPendingSubscriptions:](self, "setPendingSubscriptions:", -[_BPSFlatMapOuter pendingSubscriptions](self, "pendingSubscriptions") - 1);
  -[_BPSFlatMapOuter subscriptions](self, "subscriptions");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setObject:forKeyedSubscript:", v10, v8);

  if (-[_BPSFlatMapOuter downstreamDemand](self, "downstreamDemand") == 0x7FFFFFFFFFFFFFFFLL)
    v9 = 0x7FFFFFFFFFFFFFFFLL;
  else
    v9 = 1;
  os_unfair_lock_unlock(p_lock);
  objc_msgSend(v10, "requestDemand:", v9);

}

- (int64_t)receiveInnerInput:(id)a3 index:(int64_t)a4
{
  id v6;
  os_unfair_lock_s *p_lock;
  void *v8;
  void *v9;
  BPSTuple *v10;
  void *v11;
  BPSTuple *v12;
  int64_t v13;
  void *v15;
  uint64_t v16;

  v6 = a3;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  if (-[_BPSFlatMapOuter downstreamDemand](self, "downstreamDemand") == 0x7FFFFFFFFFFFFFFFLL)
  {
    os_unfair_lock_unlock(&self->_lock);
    os_unfair_recursive_lock_lock_with_options();
    -[_BPSFlatMapOuter setDownstreamRecursive:](self, "setDownstreamRecursive:", 1);
    -[_BPSFlatMapOuter downstream](self, "downstream");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "receiveInput:", v6);

    -[_BPSFlatMapOuter setDownstreamRecursive:](self, "setDownstreamRecursive:", 0);
    os_unfair_recursive_lock_unlock();
LABEL_6:
    v13 = 0;
    goto LABEL_7;
  }
  if (-[_BPSFlatMapOuter downstreamDemand](self, "downstreamDemand") < 1
    || -[_BPSFlatMapOuter innerRecursive](self, "innerRecursive"))
  {
    -[_BPSFlatMapOuter buffer](self, "buffer");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = [BPSTuple alloc];
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a4);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = -[BPSTuple initWithFirst:second:](v10, "initWithFirst:second:", v11, v6);
    objc_msgSend(v9, "addObject:", v12);

    os_unfair_lock_unlock(p_lock);
    goto LABEL_6;
  }
  -[_BPSFlatMapOuter setDownstreamDemand:](self, "setDownstreamDemand:", -[_BPSFlatMapOuter downstreamDemand](self, "downstreamDemand") - 1);
  os_unfair_lock_unlock(&self->_lock);
  os_unfair_recursive_lock_lock_with_options();
  v13 = 1;
  -[_BPSFlatMapOuter setDownstreamRecursive:](self, "setDownstreamRecursive:", 1);
  -[_BPSFlatMapOuter downstream](self, "downstream");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v15, "receiveInput:", v6);

  -[_BPSFlatMapOuter setDownstreamRecursive:](self, "setDownstreamRecursive:", 0);
  os_unfair_recursive_lock_unlock();
  if (v16 >= 1)
  {
    os_unfair_lock_lock(&self->_lock);
    -[_BPSFlatMapOuter setDownstreamDemand:](self, "setDownstreamDemand:", -[_BPSFlatMapOuter downstreamDemand](self, "downstreamDemand") + v16);
    os_unfair_lock_unlock(&self->_lock);
    v13 = 1;
  }
LABEL_7:

  return v13;
}

- (void)receiveInnerCompletion:(id)a3 index:(int64_t)a4
{
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  _BOOL4 v12;
  os_unfair_lock_s *p_lock;
  void *v14;
  void *v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t i;
  void *v21;
  void *v22;
  char v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  uint64_t v29;
  void *v30;
  void *v31;
  os_unfair_lock_s *p_outerLock;
  void *v33;
  void *v34;
  void *v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  _BYTE v40[128];
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = objc_msgSend(v6, "state");
  if (v7 == 1)
  {
    os_unfair_lock_lock(&self->_lock);
    if (-[_BPSFlatMapOuter cancelledOrCompleted](self, "cancelledOrCompleted"))
    {
      p_lock = &self->_lock;
      goto LABEL_28;
    }
    v35 = v6;
    -[_BPSFlatMapOuter setCancelledOrCompleted:](self, "setCancelledOrCompleted:", 1);
    -[_BPSFlatMapOuter subscriptions](self, "subscriptions");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = (void *)objc_msgSend(MEMORY[0x1E0C9AA70], "mutableCopy");
    -[_BPSFlatMapOuter setSubscriptions:](self, "setSubscriptions:", v15);

    os_unfair_lock_unlock(&self->_lock);
    v38 = 0u;
    v39 = 0u;
    v36 = 0u;
    v37 = 0u;
    v16 = v14;
    v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v36, v40, 16);
    if (v17)
    {
      v18 = v17;
      v19 = *(_QWORD *)v37;
      do
      {
        for (i = 0; i != v18; ++i)
        {
          if (*(_QWORD *)v37 != v19)
            objc_enumerationMutation(v16);
          v21 = *(void **)(*((_QWORD *)&v36 + 1) + 8 * i);
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a4);
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          v23 = objc_msgSend(v21, "isEqualToNumber:", v22);

          if ((v23 & 1) == 0)
          {
            objc_msgSend(v16, "objectForKeyedSubscript:", v21);
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v24, "cancel");

          }
        }
        v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v36, v40, 16);
      }
      while (v18);
    }

    os_unfair_recursive_lock_lock_with_options();
    -[_BPSFlatMapOuter downstream](self, "downstream");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v35;
    objc_msgSend(v35, "error");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    +[BPSCompletion failureWithError:](BPSCompletion, "failureWithError:", v26);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "receiveCompletion:", v27);

    os_unfair_recursive_lock_unlock();
  }
  else if (!v7)
  {
    os_unfair_lock_lock(&self->_lock);
    -[_BPSFlatMapOuter subscriptions](self, "subscriptions");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a4);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "removeObjectForKey:", v9);

    -[_BPSFlatMapOuter buffer](self, "buffer");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (v10)
    {
      -[_BPSFlatMapOuter buffer](self, "buffer");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v11, "count") == 0;

    }
    else
    {
      v12 = 1;
    }

    if (!-[_BPSFlatMapOuter cancelledOrCompleted](self, "cancelledOrCompleted")
      && -[_BPSFlatMapOuter outerFinished](self, "outerFinished"))
    {
      -[_BPSFlatMapOuter subscriptions](self, "subscriptions");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      v29 = objc_msgSend(v28, "count");
      if (v29 + -[_BPSFlatMapOuter pendingSubscriptions](self, "pendingSubscriptions"))
        v12 = 0;

      if (v12)
      {
        -[_BPSFlatMapOuter setCancelledOrCompleted:](self, "setCancelledOrCompleted:", 1);
        os_unfair_lock_unlock(&self->_lock);
        os_unfair_recursive_lock_lock_with_options();
        -[_BPSFlatMapOuter downstream](self, "downstream");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        +[BPSCompletion success](BPSCompletion, "success");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v30, "receiveCompletion:", v31);

        os_unfair_recursive_lock_unlock();
        goto LABEL_29;
      }
    }
    os_unfair_lock_unlock(&self->_lock);
    if (-[_BPSFlatMapOuter maxPublishers](self, "maxPublishers") == 0x7FFFFFFFFFFFFFFFLL)
      goto LABEL_29;
    p_outerLock = &self->_outerLock;
    os_unfair_lock_lock(&self->_outerLock);
    -[_BPSFlatMapOuter outerSubscription](self, "outerSubscription");
    v33 = (void *)objc_claimAutoreleasedReturnValue();

    if (v33)
    {
      -[_BPSFlatMapOuter outerSubscription](self, "outerSubscription");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      os_unfair_lock_unlock(p_outerLock);
      objc_msgSend(v34, "requestDemand:", 1);

      goto LABEL_29;
    }
    p_lock = &self->_outerLock;
LABEL_28:
    os_unfair_lock_unlock(p_lock);
  }
LABEL_29:

}

- (BPSSubscription)outerSubscription
{
  return self->_outerSubscription;
}

- (void)setOuterSubscription:(id)a3
{
  objc_storeStrong((id *)&self->_outerSubscription, a3);
}

- (BMBookmark)outerBookmark
{
  return self->_outerBookmark;
}

- (void)setOuterBookmark:(id)a3
{
  objc_storeStrong((id *)&self->_outerBookmark, a3);
}

- (BPSSubscriber)downstream
{
  return self->_downstream;
}

- (void)setDownstream:(id)a3
{
  objc_storeStrong((id *)&self->_downstream, a3);
}

- (int64_t)downstreamDemand
{
  return self->_downstreamDemand;
}

- (void)setDownstreamDemand:(int64_t)a3
{
  self->_downstreamDemand = a3;
}

- (BOOL)downstreamRecursive
{
  return self->_downstreamRecursive;
}

- (void)setDownstreamRecursive:(BOOL)a3
{
  self->_downstreamRecursive = a3;
}

- (BOOL)innerRecursive
{
  return self->_innerRecursive;
}

- (void)setInnerRecursive:(BOOL)a3
{
  self->_innerRecursive = a3;
}

- (NSMutableDictionary)subscriptions
{
  return self->_subscriptions;
}

- (void)setSubscriptions:(id)a3
{
  objc_storeStrong((id *)&self->_subscriptions, a3);
}

- (int64_t)nextInnerIndex
{
  return self->_nextInnerIndex;
}

- (void)setNextInnerIndex:(int64_t)a3
{
  self->_nextInnerIndex = a3;
}

- (int64_t)pendingSubscriptions
{
  return self->_pendingSubscriptions;
}

- (void)setPendingSubscriptions:(int64_t)a3
{
  self->_pendingSubscriptions = a3;
}

- (NSMutableArray)buffer
{
  return self->_buffer;
}

- (void)setBuffer:(id)a3
{
  objc_storeStrong((id *)&self->_buffer, a3);
}

- (int64_t)maxPublishers
{
  return self->_maxPublishers;
}

- (void)setMaxPublishers:(int64_t)a3
{
  self->_maxPublishers = a3;
}

- (id)map
{
  return self->_map;
}

- (void)setMap:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 104);
}

- (BOOL)cancelledOrCompleted
{
  return self->_cancelledOrCompleted;
}

- (void)setCancelledOrCompleted:(BOOL)a3
{
  self->_cancelledOrCompleted = a3;
}

- (BOOL)outerFinished
{
  return self->_outerFinished;
}

- (void)setOuterFinished:(BOOL)a3
{
  self->_outerFinished = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_map, 0);
  objc_storeStrong((id *)&self->_buffer, 0);
  objc_storeStrong((id *)&self->_subscriptions, 0);
  objc_storeStrong((id *)&self->_downstream, 0);
  objc_storeStrong((id *)&self->_outerBookmark, 0);
  objc_storeStrong((id *)&self->_outerSubscription, 0);
}

@end
