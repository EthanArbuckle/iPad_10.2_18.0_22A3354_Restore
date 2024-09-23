@implementation BMComputeSourceClient

- (void)sendEvent:(id)a3 account:(id)a4 remoteName:(id)a5 timestamp:(double)a6 signpostID:(unint64_t)a7 sendFullEvent:(BOOL)a8
{
  _BOOL4 v8;
  id v14;
  id v15;
  id v16;
  void *v17;
  void *v18;
  char v19;
  unint64_t v20;
  NSObject *v21;
  NSObject *v22;
  void *v23;
  unsigned __int8 v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  uint64_t v29;
  uint64_t v30;
  NSObject *v31;
  NSObject *v32;
  NSObject *v33;
  void *v34;
  unint64_t v35;
  id v36;
  _QWORD aBlock[4];
  NSObject *v38;
  uint8_t buf[4];
  void *v40;
  uint64_t v41;

  v8 = a8;
  v41 = *MEMORY[0x1E0C80C00];
  v14 = a3;
  v15 = a4;
  v16 = a5;
  -[BMComputeSourceClient streamIdentifier](self, "streamIdentifier");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[NSString hasSuffix:](self->_streamIdentifier, "hasSuffix:", CFSTR(":subscriptions"))
    || (-[BMComputeSourceClient storage](self, "storage"),
        v18 = (void *)objc_claimAutoreleasedReturnValue(),
        v19 = objc_msgSend(v18, "checkActiveSubscriptionMarkerForStream:", v17),
        v18,
        (v19 & 1) != 0))
  {
    v36 = v15;
    v20 = a7;
    __biome_log_for_category();
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
      -[BMComputeSourceClient sendEvent:account:remoteName:timestamp:signpostID:sendFullEvent:].cold.1((uint64_t)v17, self, v21);

    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __89__BMComputeSourceClient_sendEvent_account_remoteName_timestamp_signpostID_sendFullEvent___block_invoke;
    aBlock[3] = &unk_1E2648718;
    v22 = v17;
    v38 = v22;
    v23 = _Block_copy(aBlock);
    v24 = atomic_load(_useSynchronousXPCMessageSending);
    -[BMComputeSourceClient connection](self, "connection");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = v25;
    if ((v24 & 1) != 0)
      objc_msgSend(v25, "synchronousRemoteObjectProxyWithErrorHandler:", v23);
    else
      objc_msgSend(v25, "remoteObjectProxyWithErrorHandler:", v23);
    v27 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
    {
      objc_msgSend(v14, "serialize");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_respondsToSelector() & 1) != 0)
        v29 = objc_msgSend((id)objc_opt_class(), "latestDataVersion");
      else
        v29 = objc_msgSend(v14, "dataVersion");
      v30 = v29;
    }
    else
    {
      v28 = 0;
      v30 = 0;
    }
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", a6);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    v35 = v20;
    v15 = v36;
    objc_msgSend(v27, "sendEventWithStreamIdentifier:timestamp:signpostID:eventData:eventDataVersion:account:remoteName:", v22, v34, v35, v28, v30, v36, v16);

    v33 = v38;
  }
  else
  {
    __biome_log_for_category();
    v31 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v31, OS_LOG_TYPE_DEBUG))
      -[BMComputeSourceClient sendEvent:account:remoteName:timestamp:signpostID:sendFullEvent:].cold.2((uint64_t)v17, self, v31);

    __biome_log_for_category();
    v32 = objc_claimAutoreleasedReturnValue();
    v33 = v32;
    if (a7 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v32))
    {
      *(_DWORD *)buf = 138412290;
      v40 = v17;
      _os_signpost_emit_with_name_impl(&dword_18D810000, v33, OS_SIGNPOST_INTERVAL_END, a7, "SendEvent", "StreamIdentifier=%@", buf, 0xCu);
    }
  }

}

- (NSString)streamIdentifier
{
  return self->_streamIdentifier;
}

- (BMComputeXPCPublisherStorage)storage
{
  return self->_storage;
}

- (NSXPCConnection)connection
{
  os_unfair_lock_s *p_lock;
  NSXPCConnection *connection;
  void *v5;
  NSObject *v6;
  NSXPCListenerEndpoint *listenerEndpoint;
  NSString *machServiceName;
  NSXPCConnection *v9;
  NSXPCConnection *v10;
  NSXPCConnection *v11;
  uint64_t v12;
  id v13;
  NSXPCConnection *v14;
  id v15;
  NSXPCConnection *v16;
  _QWORD v18[4];
  id v19;
  id v20;
  _QWORD v21[4];
  id v22;
  uint8_t buf[4];
  void *v24;
  __int16 v25;
  NSXPCListenerEndpoint *v26;
  __int16 v27;
  NSString *v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  connection = self->_connection;
  if (!connection)
  {
    -[BMComputeSourceClient streamIdentifier](self, "streamIdentifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    __biome_log_for_category();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      machServiceName = self->_machServiceName;
      listenerEndpoint = self->_listenerEndpoint;
      *(_DWORD *)buf = 138412802;
      v24 = v5;
      v25 = 2112;
      v26 = listenerEndpoint;
      v27 = 2112;
      v28 = machServiceName;
      _os_log_impl(&dword_18D810000, v6, OS_LOG_TYPE_INFO, "BMComputeSourceClient establishing new XPC connection from source with stream %@, listenerEndpoint: %@, machServiceName: %@", buf, 0x20u);
    }

    if (self->_listenerEndpoint)
    {
      v9 = (NSXPCConnection *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3B38]), "initWithListenerEndpoint:", self->_listenerEndpoint);
    }
    else
    {
      if (!self->_machServiceName)
      {
LABEL_9:
        -[NSXPCConnection setRemoteObjectInterface:](self->_connection, "setRemoteObjectInterface:", objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EE0E5DB8));
        objc_initWeak((id *)buf, self);
        v11 = self->_connection;
        v12 = MEMORY[0x1E0C809B0];
        v21[0] = MEMORY[0x1E0C809B0];
        v21[1] = 3221225472;
        v21[2] = __35__BMComputeSourceClient_connection__block_invoke;
        v21[3] = &unk_1E2647C48;
        v13 = v5;
        v22 = v13;
        -[NSXPCConnection setInterruptionHandler:](v11, "setInterruptionHandler:", v21);
        v14 = self->_connection;
        v18[0] = v12;
        v18[1] = 3221225472;
        v18[2] = __35__BMComputeSourceClient_connection__block_invoke_52;
        v18[3] = &unk_1E2649920;
        objc_copyWeak(&v20, (id *)buf);
        v15 = v13;
        v19 = v15;
        -[NSXPCConnection setInvalidationHandler:](v14, "setInvalidationHandler:", v18);
        -[NSXPCConnection resume](self->_connection, "resume");

        objc_destroyWeak(&v20);
        objc_destroyWeak((id *)buf);

        connection = self->_connection;
        goto LABEL_10;
      }
      v9 = (NSXPCConnection *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3B38]), "initWithMachServiceName:options:", self->_machServiceName, 0);
    }
    v10 = self->_connection;
    self->_connection = v9;

    goto LABEL_9;
  }
LABEL_10:
  v16 = connection;
  os_unfair_lock_unlock(p_lock);
  return v16;
}

- (BMComputeSourceClient)initWithStreamIdentifier:(id)a3 domain:(unint64_t)a4 useCase:(id)a5
{
  id v7;
  id v8;
  void *v9;
  BMComputeXPCPublisherStorage *v10;
  BMComputeSourceClient *v11;

  v7 = a5;
  v8 = a3;
  +[BMDaemon systemComputeSourceServiceName](BMDaemon, "systemComputeSourceServiceName");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = -[BMComputeXPCPublisherStorage initWithUseCase:domain:isClient:]([BMComputeXPCPublisherStorage alloc], "initWithUseCase:domain:isClient:", v7, 0, 1);

  v11 = -[BMComputeSourceClient initWithStreamIdentifier:machServiceName:listenerEndpoint:storage:](self, "initWithStreamIdentifier:machServiceName:listenerEndpoint:storage:", v8, v9, 0, v10);
  return v11;
}

- (BMComputeSourceClient)initWithStreamIdentifier:(id)a3 machServiceName:(id)a4 listenerEndpoint:(id)a5 storage:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  BMComputeSourceClient *v14;
  BMComputeSourceClient *v15;
  uint64_t v16;
  NSString *streamIdentifier;
  objc_super v19;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v19.receiver = self;
  v19.super_class = (Class)BMComputeSourceClient;
  v14 = -[BMComputeSourceClient init](&v19, sel_init);
  v15 = v14;
  if (v14)
  {
    v14->_lock._os_unfair_lock_opaque = 0;
    v16 = objc_msgSend(v10, "copy");
    streamIdentifier = v15->_streamIdentifier;
    v15->_streamIdentifier = (NSString *)v16;

    objc_storeStrong((id *)&v15->_listenerEndpoint, a5);
    objc_storeStrong((id *)&v15->_storage, a6);
    objc_storeStrong((id *)&v15->_machServiceName, a4);
  }

  return v15;
}

- (void)eventsPrunedForAccount:(id)a3 remoteName:(id)a4 reason:(unint64_t)a5
{
  id v8;
  id v9;
  void *v10;
  NSObject *v11;
  id v12;
  void *v13;
  unsigned __int8 v14;
  void *v15;
  void *v16;
  void *v17;
  _QWORD aBlock[4];
  id v19;

  v8 = a4;
  v9 = a3;
  -[BMComputeSourceClient streamIdentifier](self, "streamIdentifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  __biome_log_for_category();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    -[BMComputeSourceClient eventsPrunedForAccount:remoteName:reason:].cold.1();

  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __66__BMComputeSourceClient_eventsPrunedForAccount_remoteName_reason___block_invoke;
  aBlock[3] = &unk_1E2648718;
  v19 = v10;
  v12 = v10;
  v13 = _Block_copy(aBlock);
  v14 = atomic_load(_useSynchronousXPCMessageSending);
  -[BMComputeSourceClient connection](self, "connection");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = v15;
  if ((v14 & 1) != 0)
    objc_msgSend(v15, "synchronousRemoteObjectProxyWithErrorHandler:", v13);
  else
    objc_msgSend(v15, "remoteObjectProxyWithErrorHandler:", v13);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v17, "eventsPrunedWithStreamIdentifier:account:remoteName:reason:", v12, v9, v8, a5);
}

- (void)dealloc
{
  NSXPCConnection *connection;
  objc_super v4;

  -[NSXPCConnection setInvalidationHandler:](self->_connection, "setInvalidationHandler:", 0);
  -[NSXPCConnection invalidate](self->_connection, "invalidate");
  connection = self->_connection;
  self->_connection = 0;

  v4.receiver = self;
  v4.super_class = (Class)BMComputeSourceClient;
  -[BMComputeSourceClient dealloc](&v4, sel_dealloc);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_storage, 0);
  objc_storeStrong((id *)&self->_streamIdentifier, 0);
  objc_storeStrong((id *)&self->_listenerEndpoint, 0);
  objc_storeStrong((id *)&self->_machServiceName, 0);
  objc_storeStrong((id *)&self->_connection, 0);
}

void __35__BMComputeSourceClient_connection__block_invoke_52(uint64_t a1)
{
  id *WeakRetained;
  id *v3;
  __CFString *v4;
  void *v5;
  void *v6;
  NSObject *v7;
  uint64_t v8;
  id v9;
  int v10;
  uint64_t v11;
  __int16 v12;
  __CFString *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  v3 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained[2], "_xpcConnection");
    v4 = (__CFString *)objc_claimAutoreleasedReturnValue();

    if (v4)
    {
      objc_msgSend(v3[2], "_xpcConnection");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = (void *)xpc_connection_copy_invalidation_reason();

      if (v6)
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", v6);
        v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v4 = CFSTR("<unknown>");
      }
      free(v6);
    }
  }
  else
  {
    v4 = 0;
  }
  __biome_log_for_category();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    v8 = *(_QWORD *)(a1 + 32);
    v10 = 138412546;
    v11 = v8;
    v12 = 2114;
    v13 = v4;
    _os_log_impl(&dword_18D810000, v7, OS_LOG_TYPE_INFO, "BMComputeSourceClient for stream %@ connection invalidated because %{public}@", (uint8_t *)&v10, 0x16u);
  }

  if (v3)
  {
    os_unfair_lock_lock((os_unfair_lock_t)v3 + 2);
    v9 = v3[2];
    v3[2] = 0;

    os_unfair_lock_unlock((os_unfair_lock_t)v3 + 2);
  }

}

+ (void)setUseSynchronousXPCMessageSending:(BOOL)a3
{
  atomic_store(a3, _useSynchronousXPCMessageSending);
}

- (BMComputeSourceClient)initWithStreamIdentifier:(id)a3 listenerEndpoint:(id)a4 storage:(id)a5
{
  return -[BMComputeSourceClient initWithStreamIdentifier:machServiceName:listenerEndpoint:storage:](self, "initWithStreamIdentifier:machServiceName:listenerEndpoint:storage:", a3, 0, a4, a5);
}

void __35__BMComputeSourceClient_connection__block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  int v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  __biome_log_for_category();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(_QWORD *)(a1 + 32);
    v4 = 138412290;
    v5 = v3;
    _os_log_impl(&dword_18D810000, v2, OS_LOG_TYPE_DEFAULT, "BMComputeSourceClient for stream %@ connection interrupted", (uint8_t *)&v4, 0xCu);
  }

}

void __89__BMComputeSourceClient_sendEvent_account_remoteName_timestamp_signpostID_sendFullEvent___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;

  v3 = a2;
  __biome_log_for_category();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __89__BMComputeSourceClient_sendEvent_account_remoteName_timestamp_signpostID_sendFullEvent___block_invoke_cold_1(a1);

}

void __66__BMComputeSourceClient_eventsPrunedForAccount_remoteName_reason___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;

  v3 = a2;
  __biome_log_for_category();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __66__BMComputeSourceClient_eventsPrunedForAccount_remoteName_reason___block_invoke_cold_1(a1);

}

- (id)description
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = objc_opt_class();
  -[BMComputeSourceClient streamIdentifier](self, "streamIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMComputeSourceClient connection](self, "connection");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@ %p> streamIdentifier: %@, connection: %@"), v4, self, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (void)sendEvent:(NSObject *)a3 account:remoteName:timestamp:signpostID:sendFullEvent:.cold.1(uint64_t a1, void *a2, NSObject *a3)
{
  void *v4;
  void *v5;
  uint64_t v6;
  uint8_t v7[24];
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a2, "connection");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "serviceName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_7_2();
  OUTLINED_FUNCTION_0_4(&dword_18D810000, a3, v6, "BMComputeSourceClient send event with identifier %@ to compute server: %@", v7);

  OUTLINED_FUNCTION_1_0();
}

- (void)sendEvent:(NSObject *)a3 account:remoteName:timestamp:signpostID:sendFullEvent:.cold.2(uint64_t a1, void *a2, NSObject *a3)
{
  void *v4;
  void *v5;
  uint64_t v6;
  uint8_t v7[24];
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a2, "storage");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "domain");
  BMStringForServiceDomain();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_7_2();
  OUTLINED_FUNCTION_0_4(&dword_18D810000, a3, v6, "BMComputeSourceClient not notifying biomed because there are no downstream subscriptions for %@ found in storage domain: %@", v7);

  OUTLINED_FUNCTION_1_0();
}

void __89__BMComputeSourceClient_sendEvent_account_remoteName_timestamp_signpostID_sendFullEvent___block_invoke_cold_1(uint64_t a1)
{
  uint64_t v1;
  os_log_t v2;
  __int128 v3;

  LODWORD(v3) = 138412546;
  *(_QWORD *)((char *)&v3 + 4) = *(_QWORD *)(a1 + 32);
  OUTLINED_FUNCTION_4_5();
  OUTLINED_FUNCTION_0_1(&dword_18D810000, v1, v2, "BMComputeSourceClient for stream %@ XPC error in sendEvent: %@", (_QWORD)v3, DWORD2(v3));
  OUTLINED_FUNCTION_5();
}

- (void)eventsPrunedForAccount:remoteName:reason:.cold.1()
{
  NSObject *v0;
  uint8_t v1[24];
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_6_3();
  OUTLINED_FUNCTION_0_4(&dword_18D810000, v0, (uint64_t)v0, "BMComputeSourceClient events pruned for stream %@ with reason %lu", v1);
  OUTLINED_FUNCTION_5();
}

void __66__BMComputeSourceClient_eventsPrunedForAccount_remoteName_reason___block_invoke_cold_1(uint64_t a1)
{
  uint64_t v1;
  os_log_t v2;
  __int128 v3;

  LODWORD(v3) = 138412546;
  *(_QWORD *)((char *)&v3 + 4) = *(_QWORD *)(a1 + 32);
  OUTLINED_FUNCTION_4_5();
  OUTLINED_FUNCTION_0_1(&dword_18D810000, v1, v2, "BMComputeSourceClient for stream %@ XPC error in eventsPrunedForAccount:remoteName:reason:%@", (_QWORD)v3, DWORD2(v3));
  OUTLINED_FUNCTION_5();
}

@end
