@implementation _BMBiomeXPCSchedulerInner

- (_BMBiomeXPCSchedulerInner)initWithDownstream:(id)a3 identifier:(id)a4 graph:(id)a5 client:(id)a6 targetQueue:(id)a7 waking:(BOOL)a8
{
  id v15;
  id v16;
  id v17;
  _BMBiomeXPCSchedulerInner *v18;
  _BMBiomeXPCSchedulerInner *v19;
  uint64_t v20;
  BMComputeXPCPublisherStorage *bookmarkStorage;
  uint64_t v22;
  BPSSubscriptionStatus *status;
  BMBookmarkablePublisher *bpsPublisher;
  id v26;
  id v27;
  objc_super v28;

  v27 = a3;
  v26 = a4;
  v15 = a5;
  v16 = a6;
  v17 = a7;
  v28.receiver = self;
  v28.super_class = (Class)_BMBiomeXPCSchedulerInner;
  v18 = -[_BMBiomeXPCSchedulerInner init](&v28, sel_init);
  v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_downstream, a3);
    objc_storeStrong((id *)&v19->_graph, a5);
    objc_storeStrong((id *)&v19->_client, a6);
    objc_storeStrong((id *)&v19->_identifier, a4);
    +[BMComputeXPCPublisherStorage bookmarkStorageForCurrentProcess](BMComputeXPCPublisherStorage, "bookmarkStorageForCurrentProcess", v26, v27);
    v20 = objc_claimAutoreleasedReturnValue();
    bookmarkStorage = v19->_bookmarkStorage;
    v19->_bookmarkStorage = (BMComputeXPCPublisherStorage *)v20;

    objc_storeStrong((id *)&v19->_queue, a7);
    v19->_lock._os_unfair_lock_opaque = 0;
    v19->_waking = a8;
    v22 = objc_msgSend(objc_alloc(MEMORY[0x1E0D02480]), "initWithState:subscription:", 0, 0);
    status = v19->_status;
    v19->_status = (BPSSubscriptionStatus *)v22;

    bpsPublisher = v19->_bpsPublisher;
    v19->_bpsPublisher = 0;

    v19->_latestEventTime = 0.0;
  }

  return v19;
}

- (void)requestDemand:(int64_t)a3
{
  _BMBiomeXPCSchedulerInner *v4;
  os_unfair_lock_s *p_lock;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  BMComputeXPCSubscription *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  BMComputeXPCSubscription *v15;
  void *v16;
  void *v17;
  void *v18;
  _QWORD v19[5];
  id v20;
  id location;

  v4 = self;
  p_lock = &v4->_lock;
  os_unfair_lock_lock(&v4->_lock);
  -[_BMBiomeXPCSchedulerInner downstream](v4, "downstream");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v6)
    goto LABEL_6;
  v7 = -[_BMBiomeXPCSchedulerInner demand](v4, "demand");
  if (v7 != *MEMORY[0x1E0D02408])
    -[_BMBiomeXPCSchedulerInner setDemand:](v4, "setDemand:", -[_BMBiomeXPCSchedulerInner demand](v4, "demand") + a3);
  if (-[_BMBiomeXPCSchedulerInner demand](v4, "demand")
    && (-[_BMBiomeXPCSchedulerInner xpcSubscription](v4, "xpcSubscription"),
        v8 = (void *)objc_claimAutoreleasedReturnValue(),
        v8,
        !v8))
  {
    objc_initWeak(&location, v4);
    -[_BMBiomeXPCSchedulerInner identifier](v4, "identifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[_BMBiomeXPCSchedulerInner graph](v4, "graph");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    os_unfair_lock_unlock(p_lock);
    v11 = [BMComputeXPCSubscription alloc];
    objc_msgSend(MEMORY[0x1E0D01D18], "current");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "identifier");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = -[_BMBiomeXPCSchedulerInner waking](v4, "waking");
    v19[0] = MEMORY[0x1E0C809B0];
    v19[1] = 3221225472;
    v19[2] = __43___BMBiomeXPCSchedulerInner_requestDemand___block_invoke;
    v19[3] = &unk_1E26495D8;
    v19[4] = v4;
    objc_copyWeak(&v20, &location);
    v15 = -[BMComputeXPCSubscription initWithIdentifier:client:waking:DSLGraph:block:](v11, "initWithIdentifier:client:waking:DSLGraph:block:", v9, v13, v14, v10, v19);

    os_unfair_lock_lock(p_lock);
    -[_BMBiomeXPCSchedulerInner setXpcSubscription:](v4, "setXpcSubscription:", v15);
    -[_BMBiomeXPCSchedulerInner client](v4, "client");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0D01D18], "current");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "identifier");
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    if (!-[_BMBiomeXPCSchedulerInner waking](v4, "waking"))
      -[BMComputeXPCPublisherStorage removeBookmarkFileForSubscriptionWithIdentifier:client:](v4->_bookmarkStorage, "removeBookmarkFileForSubscriptionWithIdentifier:client:", v9, v18);
    os_unfair_lock_unlock(p_lock);
    objc_msgSend(v16, "subscribe:", v15);

    objc_destroyWeak(&v20);
    objc_destroyWeak(&location);
  }
  else
  {
LABEL_6:
    os_unfair_lock_unlock(p_lock);
  }

}

- (void)switchToPublisherWithStreamIdentifier:(id)a3 storeEvent:(id)a4
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  void *v17;
  int v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t j;
  void *v28;
  void *v29;
  int v30;
  BMBookmarkablePublisher *bpsPublisher;
  os_unfair_lock_t lock;
  _BMBiomeXPCSchedulerInner *v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  _BYTE v42[128];
  id v43;
  _BYTE v44[128];
  uint64_t v45;

  v45 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  os_unfair_lock_lock(&self->_lock);
  -[_BMBiomeXPCSchedulerInner status](self, "status");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "state");

  if (v9 == 2)
  {
    -[_BMBiomeXPCSchedulerInner setXpcSubscription:](self, "setXpcSubscription:", 0);
    os_unfair_lock_unlock(&self->_lock);
  }
  else
  {
    lock = &self->_lock;
    v33 = self;
    v40 = 0u;
    v41 = 0u;
    v38 = 0u;
    v39 = 0u;
    -[_BMBiomeXPCSchedulerInner graph](self, "graph");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "streamPublishers");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v38, v44, 16);
    if (v12)
    {
      v13 = v12;
      v14 = *(_QWORD *)v39;
      do
      {
        for (i = 0; i != v13; ++i)
        {
          if (*(_QWORD *)v39 != v14)
            objc_enumerationMutation(v11);
          v16 = *(void **)(*((_QWORD *)&v38 + 1) + 8 * i);
          objc_msgSend(v16, "identifier");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          v18 = objc_msgSend(v17, "isEqualToString:", v6);

          if (v18)
          {
            v43 = v7;
            objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v43, 1);
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v16, "setBackingEvents:", v19);

          }
        }
        v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v38, v44, 16);
      }
      while (v13);
    }

    -[_BMBiomeXPCSchedulerInner graph](v33, "graph");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "bpsPublisher");
    v21 = (void *)objc_claimAutoreleasedReturnValue();

    v36 = 0u;
    v37 = 0u;
    v34 = 0u;
    v35 = 0u;
    -[_BMBiomeXPCSchedulerInner graph](v33, "graph");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "streamPublishers");
    v23 = (void *)objc_claimAutoreleasedReturnValue();

    v24 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v34, v42, 16);
    if (v24)
    {
      v25 = v24;
      v26 = *(_QWORD *)v35;
      do
      {
        for (j = 0; j != v25; ++j)
        {
          if (*(_QWORD *)v35 != v26)
            objc_enumerationMutation(v23);
          v28 = *(void **)(*((_QWORD *)&v34 + 1) + 8 * j);
          objc_msgSend(v28, "identifier");
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          v30 = objc_msgSend(v29, "isEqualToString:", v6);

          if (v30)
            objc_msgSend(v28, "setBackingEvents:", 0);
        }
        v25 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v34, v42, 16);
      }
      while (v25);
    }

    bpsPublisher = v33->_bpsPublisher;
    v33->_bpsPublisher = 0;

    os_unfair_lock_unlock(lock);
    objc_msgSend(v21, "subscribe:", v33);

  }
}

- (void)switchToUpdatedPublisher
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1_4();
  OUTLINED_FUNCTION_0_1(&dword_18D810000, v0, v1, "Failed to fetch bookmark for subscription %@. Error: %@");
  OUTLINED_FUNCTION_5();
}

- (void)cancel
{
  os_unfair_lock_s *p_lock;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  _BMBiomeXPCSchedulerInner *v10;

  p_lock = &self->_lock;
  v10 = self;
  os_unfair_lock_lock(p_lock);
  -[_BMBiomeXPCSchedulerInner client](v10, "client");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[_BMBiomeXPCSchedulerInner xpcSubscription](v10, "xpcSubscription");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D01D18], "current");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "identifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  -[BMComputeXPCPublisherStorage removeBookmarkFileForSubscriptionWithIdentifier:client:](v10->_bookmarkStorage, "removeBookmarkFileForSubscriptionWithIdentifier:client:", v5, v7);
  os_unfair_lock_unlock(p_lock);
  objc_msgSend(v3, "unsubscribeWithIdentifier:", v5);
  os_unfair_lock_lock(p_lock);
  -[_BMBiomeXPCSchedulerInner setClient:](v10, "setClient:", 0);
  -[_BMBiomeXPCSchedulerInner setXpcSubscription:](v10, "setXpcSubscription:", 0);
  -[_BMBiomeXPCSchedulerInner setDownstream:](v10, "setDownstream:", 0);
  -[_BMBiomeXPCSchedulerInner status](v10, "status");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setState:", 2);

  -[_BMBiomeXPCSchedulerInner status](v10, "status");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setSubscription:", 0);

  os_unfair_lock_unlock(p_lock);
}

- (void)receiveCompletion:(id)a3
{
  os_unfair_lock_s *p_lock;
  void *v4;
  void *v5;
  int v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  _BMBiomeXPCSchedulerInner *v14;

  v14 = self;
  p_lock = &v14->_lock;
  os_unfair_lock_lock(&v14->_lock);
  if (v14->_bpsPublisher
    && (-[_BMBiomeXPCSchedulerInner status](v14, "status"),
        v4 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v4, "subscription"),
        v5 = (void *)objc_claimAutoreleasedReturnValue(),
        v6 = objc_msgSend(v5, "conformsToProtocol:", &unk_1EE0D0FF8),
        v5,
        v4,
        v6))
  {
    -[_BMBiomeXPCSchedulerInner status](v14, "status");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "subscription");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    -[_BMBiomeXPCSchedulerInner identifier](v14, "identifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[_BMBiomeXPCSchedulerInner bookmarkStorage](v14, "bookmarkStorage");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    os_unfair_lock_unlock(p_lock);
    v11 = (void *)objc_msgSend(v8, "newBookmark");
    objc_msgSend(MEMORY[0x1E0D01D18], "current");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "identifier");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "writeBookmark:forSubscriptionWithIdentifier:client:", v11, v9, v13);

  }
  else
  {
    os_unfair_lock_unlock(p_lock);
  }

}

- (int64_t)receiveInput:(id)a3
{
  id v4;
  _BMBiomeXPCSchedulerInner *v5;
  os_unfair_lock_s *p_lock;
  void *v7;
  uint64_t v8;
  id v9;
  double v10;
  BOOL v11;
  NSObject *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  void *v16;
  double v17;
  void *v18;
  int64_t v19;
  NSObject *v20;
  id v21;
  _QWORD block[4];
  id v24;
  id v25;
  _BYTE *v26;
  _BYTE buf[24];
  uint64_t v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = self;
  p_lock = &v5->_lock;
  os_unfair_lock_lock(&v5->_lock);
  -[_BMBiomeXPCSchedulerInner status](v5, "status");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "state");

  if (v8 == 2)
    goto LABEL_11;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v9 = v4;
    objc_msgSend(v9, "timestamp");
    v11 = v10 >= v5->_latestEventTime;
    __biome_log_for_category();
    v12 = objc_claimAutoreleasedReturnValue();
    v13 = v12;
    if (!v11)
    {
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
        -[_BMBiomeXPCSchedulerInner receiveInput:].cold.1(v9, &v5->_latestEventTime, v13);

      os_unfair_lock_unlock(p_lock);
      goto LABEL_12;
    }
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      -[_BMBiomeXPCSchedulerInner identifier](v5, "identifier");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = (void *)MEMORY[0x1E0CB37E8];
      objc_msgSend(v9, "timestamp");
      objc_msgSend(v15, "numberWithDouble:");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      *(_QWORD *)&buf[4] = v14;
      *(_WORD *)&buf[12] = 2112;
      *(_QWORD *)&buf[14] = v16;
      _os_log_impl(&dword_18D810000, v13, OS_LOG_TYPE_DEFAULT, "BMBiomeScheduler publishing event for %@ with timestamp %@", buf, 0x16u);

    }
    objc_msgSend(v9, "timestamp");
    v5->_latestEventTime = v17;

  }
  if (-[_BMBiomeXPCSchedulerInner demand](v5, "demand") < 1)
  {
LABEL_11:
    os_unfair_lock_unlock(p_lock);
LABEL_12:
    v19 = *MEMORY[0x1E0D02400];
    goto LABEL_13;
  }
  -[_BMBiomeXPCSchedulerInner setDemand:](v5, "setDemand:", -[_BMBiomeXPCSchedulerInner demand](v5, "demand") - 1);
  -[_BMBiomeXPCSchedulerInner downstream](v5, "downstream");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  os_unfair_lock_unlock(p_lock);
  *(_QWORD *)buf = 0;
  *(_QWORD *)&buf[8] = buf;
  *(_QWORD *)&buf[16] = 0x2020000000;
  v19 = *MEMORY[0x1E0D02400];
  v28 = *MEMORY[0x1E0D02400];
  -[_BMBiomeXPCSchedulerInner queue](v5, "queue");
  v20 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __42___BMBiomeXPCSchedulerInner_receiveInput___block_invoke;
  block[3] = &unk_1E2647840;
  v26 = buf;
  v21 = v18;
  v24 = v21;
  v25 = v4;
  dispatch_async(v20, block);

  os_unfair_lock_lock(p_lock);
  if (*(uint64_t *)(*(_QWORD *)&buf[8] + 24) >= 1)
    -[_BMBiomeXPCSchedulerInner setDemand:](v5, "setDemand:", *(_QWORD *)(*(_QWORD *)&buf[8] + 24) + -[_BMBiomeXPCSchedulerInner demand](v5, "demand"));
  os_unfair_lock_unlock(p_lock);

  _Block_object_dispose(buf, 8);
LABEL_13:

  return v19;
}

- (void)receiveSubscription:(id)a3
{
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  id v9;

  v9 = a3;
  os_unfair_lock_lock(&self->_lock);
  -[_BMBiomeXPCSchedulerInner status](self, "status");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "state");

  if (v5 == 2)
  {
    os_unfair_lock_unlock(&self->_lock);
    objc_msgSend(v9, "cancel");
  }
  else
  {
    -[_BMBiomeXPCSchedulerInner status](self, "status");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setState:", 1);

    -[_BMBiomeXPCSchedulerInner status](self, "status");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setSubscription:", v9);

    v8 = -[_BMBiomeXPCSchedulerInner demand](self, "demand");
    os_unfair_lock_unlock(&self->_lock);
    if (v8 >= 1)
      objc_msgSend(v9, "requestDemand:", -[_BMBiomeXPCSchedulerInner demand](self, "demand"));
  }

}

+ (id)streamIdentifierFromGraph:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v10[0] = v3;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v10, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v4, "mutableCopy");

  while (objc_msgSend(v5, "count"))
  {
    objc_msgSend(v5, "firstObject");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      objc_msgSend(v5, "removeObjectAtIndex:", 0);
      if ((objc_opt_respondsToSelector() & 1) != 0)
      {
        objc_msgSend(v6, "identifier");
        v8 = (void *)objc_claimAutoreleasedReturnValue();

        goto LABEL_8;
      }
      objc_msgSend(v6, "upstreams");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "addObjectsFromArray:", v7);

    }
  }
  v8 = 0;
LABEL_8:

  return v8;
}

- (BPSSubscriber)downstream
{
  return self->_downstream;
}

- (void)setDownstream:(id)a3
{
  objc_storeStrong((id *)&self->_downstream, a3);
}

- (int64_t)demand
{
  return self->_demand;
}

- (void)setDemand:(int64_t)a3
{
  self->_demand = a3;
}

- (BMComputeXPCPublisherClient)client
{
  return self->_client;
}

- (void)setClient:(id)a3
{
  objc_storeStrong((id *)&self->_client, a3);
}

- (BMDSL)graph
{
  return self->_graph;
}

- (void)setGraph:(id)a3
{
  objc_storeStrong((id *)&self->_graph, a3);
}

- (BMComputeXPCSubscription)xpcSubscription
{
  return self->_xpcSubscription;
}

- (void)setXpcSubscription:(id)a3
{
  objc_storeStrong((id *)&self->_xpcSubscription, a3);
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_identifier, a3);
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
  objc_storeStrong((id *)&self->_queue, a3);
}

- (BOOL)waking
{
  return self->_waking;
}

- (void)setWaking:(BOOL)a3
{
  self->_waking = a3;
}

- (BPSSubscriptionStatus)status
{
  return self->_status;
}

- (void)setStatus:(id)a3
{
  objc_storeStrong((id *)&self->_status, a3);
}

- (BMAccessClient)accessClient
{
  return self->_accessClient;
}

- (void)setAccessClient:(id)a3
{
  objc_storeStrong((id *)&self->_accessClient, a3);
}

- (BMComputeXPCPublisherStorage)bookmarkStorage
{
  return self->_bookmarkStorage;
}

- (void)setBookmarkStorage:(id)a3
{
  objc_storeStrong((id *)&self->_bookmarkStorage, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bookmarkStorage, 0);
  objc_storeStrong((id *)&self->_accessClient, 0);
  objc_storeStrong((id *)&self->_status, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_xpcSubscription, 0);
  objc_storeStrong((id *)&self->_graph, 0);
  objc_storeStrong((id *)&self->_client, 0);
  objc_storeStrong((id *)&self->_downstream, 0);
  objc_storeStrong((id *)&self->_bpsPublisher, 0);
}

- (void)receiveInput:(NSObject *)a3 .cold.1(void *a1, double *a2, NSObject *a3)
{
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  __int16 v12;
  void *v13;
  __int16 v14;
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v6 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(a1, "timestamp");
  objc_msgSend(v6, "numberWithDouble:");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", *a2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "eventBody");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = 138412802;
  v11 = v7;
  v12 = 2112;
  v13 = v8;
  v14 = 2112;
  v15 = v9;
  _os_log_error_impl(&dword_18D810000, a3, OS_LOG_TYPE_ERROR, "BMBiomeScheduler skipping event with time %@ that is older than latest event time %@. event: %@", (uint8_t *)&v10, 0x20u);

}

@end
