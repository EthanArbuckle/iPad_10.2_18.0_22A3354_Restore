@implementation BMStoreSource

- (void)sendEvent:(id)a3
{
  id v4;

  v4 = a3;
  -[BMStoreSource sendEvent:timestamp:](self, "sendEvent:timestamp:", v4, CFAbsoluteTimeGetCurrent());

}

- (void)sendEvent:(id)a3 timestamp:(double)a4
{
  __CFString *v6;
  void *v7;
  NSObject *v8;
  uint64_t v9;
  void *v10;
  __CFString *v11;
  __CFString *v12;
  NSObject *v13;
  os_signpost_id_t v14;
  NSObject *v15;
  NSObject *v16;
  unint64_t v17;
  NSObject *v18;
  void *v19;
  NSObject *v20;
  void *v21;
  void *v22;
  NSObject *v23;
  NSObject *v24;
  NSObject *v25;
  NSMutableArray *pendingWrites;
  NSMutableArray *v27;
  NSMutableArray *v28;
  OS_os_transaction *v29;
  OS_os_transaction *transaction;
  void *v31;
  NSObject *v32;
  void *v33;
  void *v34;
  NSObject *v35;
  os_unfair_lock_t lock;
  _QWORD v37[5];
  os_activity_scope_state_s state;
  uint8_t v39[4];
  __CFString *v40;
  uint8_t v41[4];
  __CFString *v42;
  __int16 v43;
  __CFString *v44;
  uint8_t buf[4];
  __CFString *v46;
  uint64_t v47;

  v47 = *MEMORY[0x1E0C80C00];
  v6 = (__CFString *)a3;
  lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v7 = (void *)MEMORY[0x193FECFB4]();
  v8 = _os_activity_create(&dword_18D810000, "BMStoreSource.sendEvent", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v8, &state);
  -[BMSource identifier](self, "identifier");
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = (void *)v9;
  v11 = CFSTR("unknown");
  if (v9)
    v11 = (__CFString *)v9;
  v12 = v11;

  __biome_log_for_category();
  v13 = objc_claimAutoreleasedReturnValue();
  v14 = os_signpost_id_generate(v13);

  __biome_log_for_category();
  v15 = objc_claimAutoreleasedReturnValue();
  v16 = v15;
  v17 = v14 - 1;
  if (v14 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v15))
  {
    *(_DWORD *)buf = 138412290;
    v46 = v12;
    _os_signpost_emit_with_name_impl(&dword_18D810000, v16, OS_SIGNPOST_INTERVAL_BEGIN, v14, "SendEvent", "StreamIdentifier=%@", buf, 0xCu);
  }

  __biome_log_for_category();
  v18 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
  {
    -[BMSource identifier](self, "identifier", lock);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[BMStoreSource sendEvent:timestamp:].cold.2(v19, buf, v18, a4);
  }

  if ((-[__CFString conformsToProtocol:](v6, "conformsToProtocol:", &unk_1EE0CD9D8) & 1) == 0)
  {
    __biome_log_for_category();
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      -[BMSource identifier](self, "identifier");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      NSStringFromProtocol((Protocol *)&unk_1EE0CD9D8);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      -[BMStoreSource sendEvent:timestamp:].cold.1(v21, v22, v41, v20);
    }

    __biome_log_for_category();
    v23 = objc_claimAutoreleasedReturnValue();
    v24 = v23;
    if (v17 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v23))
    {
      *(_DWORD *)v39 = 138412290;
      v40 = v12;
      _os_signpost_emit_with_name_impl(&dword_18D810000, v24, OS_SIGNPOST_INTERVAL_END, v14, "SendEvent", "StreamIdentifier=%@", v39, 0xCu);
    }
    goto LABEL_29;
  }
  if (self->_pendingWrites || (-[BMStreamDatastoreWriter isDataAccessible](self->_writer, "isDataAccessible") & 1) == 0)
  {
    __biome_log_for_category();
    v25 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)v41 = 138412546;
      v42 = v6;
      v43 = 2112;
      v44 = v12;
      _os_log_impl(&dword_18D810000, v25, OS_LOG_TYPE_DEFAULT, "Unable to access data, storing donation %@ to %@ in memory until device unlocks", v41, 0x16u);
    }

    +[BMPendingWrite pendingWriteWithEvent:timestamp:](BMPendingWrite, "pendingWriteWithEvent:timestamp:", v6, a4);
    v24 = objc_claimAutoreleasedReturnValue();
    pendingWrites = self->_pendingWrites;
    if (pendingWrites)
    {
      -[NSMutableArray addObject:](pendingWrites, "addObject:", v24);
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithObject:", v24);
      v27 = (NSMutableArray *)objc_claimAutoreleasedReturnValue();
      v28 = self->_pendingWrites;
      self->_pendingWrites = v27;

      -[NSMutableArray addObject:](self->_pendingWrites, "addObject:", v24);
      v29 = (OS_os_transaction *)os_transaction_create();
      transaction = self->_transaction;
      self->_transaction = v29;

      v37[0] = MEMORY[0x1E0C809B0];
      v37[1] = 3221225472;
      v37[2] = __37__BMStoreSource_sendEvent_timestamp___block_invoke;
      v37[3] = &unk_1E2648CA0;
      v37[4] = self;
      self->_lockStateRegistration = (void *)objc_msgSend(MEMORY[0x1E0D81590], "registerForAKSEventsNotifications:", v37);
      if (objc_msgSend(MEMORY[0x1E0D81590], "isUnlocked"))
        -[BMStoreSource _processPendingWrites](self, "_processPendingWrites");
    }
    -[BMStoreSource computeSource](self, "computeSource", lock);
    v31 = (void *)objc_claimAutoreleasedReturnValue();

    if (v31)
    {
      -[BMStoreSource computeSource](self, "computeSource");
      v32 = objc_claimAutoreleasedReturnValue();
      -[BMStoreConfig account](self->_config, "account");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      -[BMStoreConfig remoteName](self->_config, "remoteName");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSObject sendEvent:account:remoteName:timestamp:signpostID:sendFullEvent:](v32, "sendEvent:account:remoteName:timestamp:signpostID:sendFullEvent:", v6, v33, v34, v14, 1, a4);

    }
    else
    {
      __biome_log_for_category();
      v35 = objc_claimAutoreleasedReturnValue();
      v32 = v35;
      if (v17 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v35))
      {
        *(_DWORD *)v41 = 138412290;
        v42 = v12;
        _os_signpost_emit_with_name_impl(&dword_18D810000, v32, OS_SIGNPOST_INTERVAL_END, v14, "SendEvent", "StreamIdentifier=%@", v41, 0xCu);
      }
    }

LABEL_29:
    goto LABEL_30;
  }
  -[BMStoreSource _writeEvent:timestamp:signpostID:notifyCompute:](self, "_writeEvent:timestamp:signpostID:notifyCompute:", v6, v14, 1, a4);
LABEL_30:

  os_activity_scope_leave(&state);
  objc_autoreleasePoolPop(v7);
  os_unfair_lock_unlock(lock);

}

- (BOOL)_writeEvent:(id)a3 timestamp:(double)a4 signpostID:(unint64_t)a5 notifyCompute:(BOOL)a6
{
  _BOOL4 v6;
  id v10;
  void *v11;
  uint64_t v12;
  void *v13;
  __CFString *v14;
  __CFString *v15;
  uint64_t v16;
  void *v17;
  NSObject *v18;
  void *v19;
  void *v20;
  NSObject *v21;
  NSObject *v22;
  NSObject *v23;
  uint64_t v24;
  unint64_t v26;
  uint8_t buf[4];
  __CFString *v28;
  uint64_t v29;

  v6 = a6;
  v29 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  os_unfair_lock_assert_owner(&self->_lock);
  v11 = (void *)MEMORY[0x193FECFB4]();
  -[BMSource identifier](self, "identifier");
  v12 = objc_claimAutoreleasedReturnValue();
  v13 = (void *)v12;
  v14 = CFSTR("unknown");
  if (v12)
    v14 = (__CFString *)v12;
  v15 = v14;

  v26 = 0;
  v16 = -[BMStreamDatastoreWriter writeEventWithEventBody:timestamp:outEventSize:](self->_writer, "writeEventWithEventBody:timestamp:outEventSize:", v10, &v26, a4);
  if ((v16 & 1) != 0)
  {
    -[BMStoreSource computeSource](self, "computeSource");
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    if (v17 && v6)
    {
      -[BMStoreSource computeSource](self, "computeSource");
      v18 = objc_claimAutoreleasedReturnValue();
      -[BMStoreConfig account](self->_config, "account");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      -[BMStoreConfig remoteName](self->_config, "remoteName");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSObject sendEvent:account:remoteName:timestamp:signpostID:sendFullEvent:](v18, "sendEvent:account:remoteName:timestamp:signpostID:sendFullEvent:", v10, v19, v20, a5, 0, a4);

LABEL_16:
      goto LABEL_17;
    }
  }
  else
  {
    __biome_log_for_category();
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      -[BMStoreSource _writeEvent:timestamp:signpostID:notifyCompute:].cold.2(v21);

  }
  __biome_log_for_category();
  v22 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
    -[BMStoreSource _writeEvent:timestamp:signpostID:notifyCompute:].cold.1((uint64_t)v15, v22);

  if (a5)
  {
    __biome_log_for_category();
    v23 = objc_claimAutoreleasedReturnValue();
    v18 = v23;
    if (a5 != -1 && os_signpost_enabled(v23))
    {
      *(_DWORD *)buf = 138412290;
      v28 = v15;
      _os_signpost_emit_with_name_impl(&dword_18D810000, v18, OS_SIGNPOST_INTERVAL_END, a5, "SendEvent", "StreamIdentifier=%@", buf, 0xCu);
    }
    goto LABEL_16;
  }
LABEL_17:
  if (self->_shouldSendMetrics)
  {
    if (v26 >= 0xFFFFFFFF)
      v24 = 0xFFFFFFFFLL;
    else
      v24 = v26;
    objc_msgSend(MEMORY[0x1E0D01CE8], "sendAllStreamsEventWritten:size:streamIdentifier:", v16, v24, v15);
  }

  objc_autoreleasePoolPop(v11);
  return v16;
}

- (BMComputeSourceClient)computeSource
{
  return self->_computeSource;
}

- (BMStoreSource)initWithIdentifier:(id)a3 storeConfig:(id)a4 accessClient:(id)a5 eventDataClass:(Class)a6
{
  id v10;
  id v11;
  id v12;
  BMStoreSource *v13;
  BMStoreSource *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  BMStreamDatastoreWriter *writer;
  uint64_t v21;
  id v22;
  const __CFString *v23;
  uint64_t v24;
  BMComputeSourceClient *v25;
  uint64_t v26;
  uint64_t v27;
  BMComputeSourceClient *computeSource;
  char v29;
  objc_super v31;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v31.receiver = self;
  v31.super_class = (Class)BMStoreSource;
  v13 = -[BMSource initWithIdentifier:](&v31, sel_initWithIdentifier_, v10);
  v14 = v13;
  if (!v13)
    goto LABEL_19;
  v13->_lock._os_unfair_lock_opaque = 0;
  objc_storeStrong((id *)&v13->_config, a4);
  v14->_eventDataClass = a6;
  if (!objc_msgSend(v11, "isManaged"))
  {
    LOBYTE(v18) = 3;
    goto LABEL_6;
  }
  v15 = (void *)MEMORY[0x1E0D01CD0];
  objc_msgSend(MEMORY[0x1E0D01D18], "current");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "policyForProcess:connectionFlags:useCase:", v16, 0, *MEMORY[0x1E0D01CB8]);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  v18 = objc_msgSend(v17, "allowedModeForStream:", v10);
  if (v18 != 2)
  {
LABEL_6:
    v21 = objc_msgSend(objc_alloc(MEMORY[0x1E0D024E8]), "initWithStream:config:eventDataClass:", v10, v11, a6);
    writer = v14->_writer;
    v14->_writer = (BMStreamDatastoreWriter *)v21;
    goto LABEL_7;
  }
  objc_msgSend(MEMORY[0x1E0D024E8], "outOfProcessWriterForStream:user:eventDataClass:", v10, objc_msgSend(v11, "uid"), a6);
  v19 = objc_claimAutoreleasedReturnValue();
  writer = v14->_writer;
  v14->_writer = (BMStreamDatastoreWriter *)v19;
  LOBYTE(v18) = 2;
LABEL_7:

  if (objc_msgSend(v11, "isManaged") && (v18 & 2) != 0)
  {
    v22 = v10;
    if ((objc_msgSend(v11, "storeLocationOption") & 4) != 0)
    {
      v23 = CFSTR(":subscriptions");
    }
    else
    {
      if ((objc_msgSend(v11, "storeLocationOption") & 2) == 0)
      {
LABEL_14:
        v25 = [BMComputeSourceClient alloc];
        v26 = objc_msgSend(v11, "domain");
        v27 = -[BMComputeSourceClient initWithStreamIdentifier:domain:useCase:](v25, "initWithStreamIdentifier:domain:useCase:", v22, v26, *MEMORY[0x1E0D01CB8]);
        computeSource = v14->_computeSource;
        v14->_computeSource = (BMComputeSourceClient *)v27;

        goto LABEL_15;
      }
      v23 = CFSTR(":tombstones");
    }
    objc_msgSend(v22, "stringByAppendingString:", v23);
    v24 = objc_claimAutoreleasedReturnValue();

    v22 = (id)v24;
    goto LABEL_14;
  }
LABEL_15:
  objc_storeStrong((id *)&v14->_accessClient, a5);
  if (-[BMStoreConfig isManaged](v14->_config, "isManaged"))
    v29 = objc_msgSend(MEMORY[0x1E0D01D10], "isTestPathOverridden") ^ 1;
  else
    v29 = 0;
  v14->_shouldSendMetrics = v29;
LABEL_19:

  return v14;
}

- (void)dealloc
{
  objc_super v3;

  if (self->_lockStateRegistration)
  {
    objc_msgSend(MEMORY[0x1E0D81590], "unregisterForAKSEventsNotifications:");
    self->_lockStateRegistration = 0;
  }
  v3.receiver = self;
  v3.super_class = (Class)BMStoreSource;
  -[BMStoreSource dealloc](&v3, sel_dealloc);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_computeSource, 0);
  objc_storeStrong((id *)&self->_pendingWrites, 0);
  objc_storeStrong((id *)&self->_transaction, 0);
  objc_storeStrong((id *)&self->_accessClient, 0);
  objc_storeStrong((id *)&self->_config, 0);
  objc_storeStrong((id *)&self->_writer, 0);
}

- (BMStoreSource)initWithIdentifier:(id)a3 storeConfig:(id)a4
{
  return -[BMStoreSource initWithIdentifier:storeConfig:accessClient:](self, "initWithIdentifier:storeConfig:accessClient:", a3, a4, 0);
}

- (BMStoreSource)initWithIdentifier:(id)a3 storeConfig:(id)a4 accessClient:(id)a5
{
  return -[BMStoreSource initWithIdentifier:storeConfig:accessClient:eventDataClass:](self, "initWithIdentifier:storeConfig:accessClient:eventDataClass:", a3, a4, a5, 0);
}

- (BOOL)outOfProcess
{
  objc_class *v2;
  void *v3;
  char v4;

  v2 = (objc_class *)objc_opt_class();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "containsString:", CFSTR("OutOfProcess"));

  return v4;
}

- (void)setOutOfProcess:(BOOL)a3
{
  NSObject *v4;
  void *v5;
  void *v6;
  BMStreamDatastoreWriter *v7;
  BMStreamDatastoreWriter *writer;
  id v9;
  BMStreamDatastoreWriter *v10;
  BMStreamDatastoreWriter *v11;
  id v12;

  if (a3)
  {
    __biome_log_for_category();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
      -[BMStoreSource setOutOfProcess:].cold.1(v4);

    if (!-[BMStoreSource outOfProcess](self, "outOfProcess"))
    {
      v5 = (void *)MEMORY[0x1E0D024E8];
      -[BMSource identifier](self, "identifier");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "outOfProcessWriterForStream:user:eventDataClass:", v6, -[BMStoreConfig uid](self->_config, "uid"), self->_eventDataClass);
      v7 = (BMStreamDatastoreWriter *)objc_claimAutoreleasedReturnValue();
      writer = self->_writer;
      self->_writer = v7;

    }
  }
  else if (-[BMStoreSource outOfProcess](self, "outOfProcess"))
  {
    v9 = objc_alloc(MEMORY[0x1E0D024E8]);
    -[BMSource identifier](self, "identifier");
    v12 = (id)objc_claimAutoreleasedReturnValue();
    v10 = (BMStreamDatastoreWriter *)objc_msgSend(v9, "initWithStream:config:eventDataClass:", v12, self->_config, self->_eventDataClass);
    v11 = self->_writer;
    self->_writer = v10;

  }
}

+ (id)_processPendingWritesQueue
{
  if (_processPendingWritesQueue_onceToken != -1)
    dispatch_once(&_processPendingWritesQueue_onceToken, &__block_literal_global_14);
  return (id)_processPendingWritesQueue_queue;
}

void __43__BMStoreSource__processPendingWritesQueue__block_invoke()
{
  dispatch_queue_t v0;
  void *v1;
  NSObject *v2;

  dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v2 = objc_claimAutoreleasedReturnValue();
  v0 = dispatch_queue_create("com.apple.biome.pending-writes", v2);
  v1 = (void *)_processPendingWritesQueue_queue;
  _processPendingWritesQueue_queue = (uint64_t)v0;

}

void __37__BMStoreSource_sendEvent_timestamp___block_invoke(uint64_t a1, int a2)
{
  NSObject *v4;
  _QWORD v5[5];
  int v6;

  objc_msgSend((id)objc_opt_class(), "_processPendingWritesQueue");
  v4 = objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __37__BMStoreSource_sendEvent_timestamp___block_invoke_2;
  v5[3] = &unk_1E2648C78;
  v6 = a2;
  v5[4] = *(_QWORD *)(a1 + 32);
  dispatch_async(v4, v5);

}

void __37__BMStoreSource_sendEvent_timestamp___block_invoke_2(uint64_t a1)
{
  int v1;
  os_unfair_lock_s *v4;

  v1 = *(_DWORD *)(a1 + 40);
  if (v1 == 3 || v1 == 0)
  {
    v4 = (os_unfair_lock_s *)(*(_QWORD *)(a1 + 32) + 52);
    os_unfair_lock_lock(v4);
    objc_msgSend(*(id *)(a1 + 32), "_processPendingWrites");
    os_unfair_lock_unlock(v4);
  }
}

- (void)_processPendingWrites
{
  NSObject *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  BOOL v13;
  int v14;
  int v15;
  NSMutableArray *pendingWrites;
  OS_os_transaction *transaction;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  uint8_t v22[128];
  uint8_t buf[4];
  uint64_t v24;
  __int16 v25;
  void *v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  os_unfair_lock_assert_owner(&self->_lock);
  if (self->_pendingWrites)
  {
    __biome_log_for_category();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      v4 = -[NSMutableArray count](self->_pendingWrites, "count");
      -[BMSource identifier](self, "identifier");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 134218242;
      v24 = v4;
      v25 = 2112;
      v26 = v5;
      _os_log_impl(&dword_18D810000, v3, OS_LOG_TYPE_DEFAULT, "Device has unlocked, proceeding with %lu queued writes to stream %@", buf, 0x16u);

    }
    v20 = 0u;
    v21 = 0u;
    v18 = 0u;
    v19 = 0u;
    v6 = (void *)-[NSMutableArray copy](self->_pendingWrites, "copy", 0);
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v19;
LABEL_6:
      v10 = 0;
      while (1)
      {
        if (*(_QWORD *)v19 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * v10);
        objc_msgSend(v11, "event");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "timestamp");
        v13 = -[BMStoreSource _writeEvent:timestamp:signpostID:notifyCompute:](self, "_writeEvent:timestamp:signpostID:notifyCompute:", v12, 0, 0);

        v14 = -[BMStreamDatastoreWriter isDataAccessible](self->_writer, "isDataAccessible");
        v15 = v14;
        if (v13 || v14)
          -[NSMutableArray removeObject:](self->_pendingWrites, "removeObject:", v11);
        if (!v15)
          break;
        if (v8 == ++v10)
        {
          v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
          if (v8)
            goto LABEL_6;
          break;
        }
      }
    }

    if (!-[NSMutableArray count](self->_pendingWrites, "count"))
    {
      objc_msgSend(MEMORY[0x1E0D81590], "unregisterForAKSEventsNotifications:", self->_lockStateRegistration);
      self->_lockStateRegistration = 0;
      pendingWrites = self->_pendingWrites;
      self->_pendingWrites = 0;

      transaction = self->_transaction;
      self->_transaction = 0;

    }
  }
}

- (void)setOutOfProcess:(os_log_t)log .cold.1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_debug_impl(&dword_18D810000, log, OS_LOG_TYPE_DEBUG, "Configuring source for out-of-process writes", v1, 2u);
}

- (void)sendEvent:(uint8_t *)buf timestamp:(os_log_t)log .cold.1(void *a1, void *a2, uint8_t *buf, os_log_t log)
{
  *(_DWORD *)buf = 138412546;
  *(_QWORD *)(buf + 4) = a1;
  *((_WORD *)buf + 6) = 2112;
  *(_QWORD *)(buf + 14) = a2;
  _os_log_error_impl(&dword_18D810000, log, OS_LOG_TYPE_ERROR, "Wrong event type sent to source %@ expecting event conforms to %@", buf, 0x16u);

}

- (void)sendEvent:(os_log_t)log timestamp:(double)a4 .cold.2(void *a1, uint8_t *buf, os_log_t log, double a4)
{
  *(_DWORD *)buf = 138412546;
  *(_QWORD *)(buf + 4) = a1;
  *((_WORD *)buf + 6) = 2048;
  *(double *)(buf + 14) = a4;
  _os_log_debug_impl(&dword_18D810000, log, OS_LOG_TYPE_DEBUG, "Event donation to stream: %@ with timestamp: %lf", buf, 0x16u);

}

- (void)_writeEvent:(uint64_t)a1 timestamp:(NSObject *)a2 signpostID:notifyCompute:.cold.1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 138412290;
  v3 = a1;
  _os_log_debug_impl(&dword_18D810000, a2, OS_LOG_TYPE_DEBUG, "Not notifyng biomed of new event in %@", (uint8_t *)&v2, 0xCu);
}

- (void)_writeEvent:(os_log_t)log timestamp:signpostID:notifyCompute:.cold.2(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_18D810000, log, OS_LOG_TYPE_ERROR, "Error saving biome store event", v1, 2u);
}

@end
