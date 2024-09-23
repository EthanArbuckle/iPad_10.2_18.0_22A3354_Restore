@implementation AMSEngagementConnection

- (void)setErrorHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (AMSEngagementConnection)initWithNotificationCenter:(id)a3
{
  id v5;
  AMSEngagementConnection *v6;
  AMSEngagementConnection *v7;
  NSObject *v8;
  dispatch_queue_t v9;
  OS_dispatch_queue *queue;
  objc_super v12;

  v5 = a3;
  v12.receiver = self;
  v12.super_class = (Class)AMSEngagementConnection;
  v6 = -[AMSEngagementConnection init](&v12, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_notificationCenter, a3);
    dispatch_get_global_queue(0, 0);
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = dispatch_queue_create_with_target_V2("com.apple.AppleMediaServices.engagement", 0, v8);
    queue = v7->_queue;
    v7->_queue = (OS_dispatch_queue *)v9;

  }
  return v7;
}

- (void)treatmentStoreServiceWithReply:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[AMSEngagementConnection proxy](self, "proxy");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "treatmentStoreServiceWithReply:", v4);

}

- (id)proxy
{
  AMSEngagementConnection *v2;
  id v3;
  void *v4;
  _QWORD v6[5];

  v2 = self;
  objc_sync_enter(v2);
  -[AMSEngagementConnection connection](v2, "connection");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    v3 = -[AMSEngagementConnection _newRemoteConnection](v2, "_newRemoteConnection");
    -[AMSEngagementConnection setConnection:](v2, "setConnection:", v3);
  }
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __32__AMSEngagementConnection_proxy__block_invoke;
  v6[3] = &unk_1E253E120;
  v6[4] = v2;
  objc_msgSend(v3, "remoteObjectProxyWithErrorHandler:", v6);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_sync_exit(v2);
  return v4;
}

- (NSXPCConnection)connection
{
  return self->_connection;
}

- (void)beginObservingMessages
{
  id v2;

  -[AMSEngagementConnection proxy](self, "proxy");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "beginObservingMessages");

}

- (void)setConnection:(id)a3
{
  objc_storeStrong((id *)&self->_connection, a3);
}

- (void)enqueueWithRequest:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  id v8;

  v6 = a4;
  v7 = a3;
  -[AMSEngagementConnection proxy](self, "proxy");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "enqueueWithRequest:completion:", v7, v6);

}

- (id)_newRemoteConnection
{
  void *v3;
  NSObject *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v13;
  uint64_t v14;
  void (*v15)(uint64_t);
  void *v16;
  id v17;
  _QWORD v18[4];
  id v19;
  uint8_t buf[4];
  uint64_t v21;
  __int16 v22;
  void *v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  +[AMSLogConfig sharedEngagementConfig](AMSLogConfig, "sharedEngagementConfig");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v3, "OSLogObject");
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = objc_opt_class();
    AMSLogKey();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v21 = v5;
    v22 = 2114;
    v23 = v6;
    _os_log_impl(&dword_18C849000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Creating new connection.", buf, 0x16u);

  }
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3B38]), "initWithMachServiceName:options:", CFSTR("com.apple.xpc.amsengagementd"), 0);
  -[AMSEngagementConnection queue](self, "queue");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "_setQueue:", v8);

  -[AMSEngagementConnection _makeRemoteConnectionInterface](self, "_makeRemoteConnectionInterface");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setRemoteObjectInterface:", v9);

  -[AMSEngagementConnection _makeExportedClientConnectionInterface](self, "_makeExportedClientConnectionInterface");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setExportedInterface:", v10);

  objc_msgSend(v7, "setExportedObject:", self);
  objc_initWeak((id *)buf, self);
  v11 = MEMORY[0x1E0C809B0];
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __47__AMSEngagementConnection__newRemoteConnection__block_invoke;
  v18[3] = &unk_1E253E9A0;
  objc_copyWeak(&v19, (id *)buf);
  objc_msgSend(v7, "setInvalidationHandler:", v18);
  v13 = v11;
  v14 = 3221225472;
  v15 = __47__AMSEngagementConnection__newRemoteConnection__block_invoke_2;
  v16 = &unk_1E253E9A0;
  objc_copyWeak(&v17, (id *)buf);
  objc_msgSend(v7, "setInterruptionHandler:", &v13);
  objc_msgSend(v7, "resume", v13, v14, v15, v16);
  objc_destroyWeak(&v17);
  objc_destroyWeak(&v19);
  objc_destroyWeak((id *)buf);
  return v7;
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (id)_makeExportedClientConnectionInterface
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EE07A380);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[AMSEngagementPushEvent archiveClasses](AMSEngagementPushEvent, "archiveClasses");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setClasses:forSelector:argumentIndex:ofReply:", v3, sel_handlePushedEvent_, 0, 0);

  return v2;
}

- (id)_makeRemoteConnectionInterface
{
  void *v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;

  objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EE07A4A0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_alloc(MEMORY[0x1E0C99E60]);
  v4 = objc_opt_class();
  v5 = objc_opt_class();
  v6 = (void *)objc_msgSend(v3, "initWithObjects:", v4, v5, objc_opt_class(), 0);
  objc_msgSend(v2, "setClasses:forSelector:argumentIndex:ofReply:", v6, sel_contentInfoForApp_cacheKey_version_reply_, 0, 1);
  +[AMSEngagementEnqueueResult archiveClasses](AMSEngagementEnqueueResult, "archiveClasses");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setClasses:forSelector:argumentIndex:ofReply:", v7, sel_enqueueWithRequest_completion_, 0, 1);

  +[AMSEngagementSyncResult archiveClasses](AMSEngagementSyncResult, "archiveClasses");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setClasses:forSelector:argumentIndex:ofReply:", v8, sel_syncWithRequest_completion_, 0, 1);

  objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EE0ADFA8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_alloc(MEMORY[0x1E0C99E60]);
  v11 = objc_opt_class();
  v12 = objc_opt_class();
  v13 = (void *)objc_msgSend(v10, "initWithObjects:", v11, v12, objc_opt_class(), 0);
  objc_msgSend(v9, "setClasses:forSelector:argumentIndex:ofReply:", v13, sel_treatmentsForAreas_cachePolicy_completion_, 0, 1);
  objc_msgSend(v2, "setInterface:forSelector:argumentIndex:ofReply:", v9, sel_treatmentStoreServiceWithReply_, 0, 1);

  return v2;
}

void __32__AMSEngagementConnection_proxy__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  NSObject *v4;
  uint64_t v5;
  void *v6;
  int v7;
  uint64_t v8;
  __int16 v9;
  void *v10;
  __int16 v11;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v2 = a2;
  +[AMSLogConfig sharedEngagementConfig](AMSLogConfig, "sharedEngagementConfig");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v3, "OSLogObject");
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    v5 = objc_opt_class();
    AMSLogKey();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = 138543874;
    v8 = v5;
    v9 = 2114;
    v10 = v6;
    v11 = 2114;
    v12 = v2;
    _os_log_impl(&dword_18C849000, v4, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Failed to retrieve remote object. %{public}@", (uint8_t *)&v7, 0x20u);

  }
}

- (void)dealloc
{
  objc_super v3;

  -[AMSEngagementConnection _removeRemoteConnection](self, "_removeRemoteConnection");
  v3.receiver = self;
  v3.super_class = (Class)AMSEngagementConnection;
  -[AMSEngagementConnection dealloc](&v3, sel_dealloc);
}

void __47__AMSEngagementConnection__newRemoteConnection__block_invoke(uint64_t a1)
{
  void *v1;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_removeRemoteConnection");
  objc_msgSend(WeakRetained, "notificationCenter");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "postNotificationName:object:", CFSTR("AMSEnagementConnectionErrorNotification"), 0);

}

void __47__AMSEngagementConnection__newRemoteConnection__block_invoke_2(uint64_t a1)
{
  void *v1;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_removeRemoteConnection");
  objc_msgSend(WeakRetained, "notificationCenter");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "postNotificationName:object:", CFSTR("AMSEnagementConnectionErrorNotification"), 0);

}

- (void)_removeRemoteConnection
{
  void *v3;

  -[AMSEngagementConnection connection](self, "connection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "invalidate");

  -[AMSEngagementConnection setConnection:](self, "setConnection:", 0);
}

- (void)handlePushedEvent:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[AMSEngagementConnection notificationCenter](self, "notificationCenter");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "postNotificationName:object:", CFSTR("com.apple.AppleMediaServices.engagement.pushEvent"), v4);

}

- (void)treatmentsDidSyncronize
{
  id v2;

  -[AMSEngagementConnection notificationCenter](self, "notificationCenter");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "postNotificationName:object:", CFSTR("AMSEngagementTreatmentsDidSyncronizeNotification"), 0);

}

- (void)contentInfoForApp:(id)a3 cacheKey:(id)a4 version:(id)a5 reply:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;

  v10 = a6;
  v11 = a5;
  v12 = a4;
  v13 = a3;
  -[AMSEngagementConnection proxy](self, "proxy");
  v14 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "contentInfoForApp:cacheKey:version:reply:", v13, v12, v11, v10);

}

- (void)notifyBlockedMessages:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[AMSEngagementConnection proxy](self, "proxy");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "notifyBlockedMessages:", v4);

}

- (void)syncWithRequest:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  id v8;

  v6 = a4;
  v7 = a3;
  -[AMSEngagementConnection proxy](self, "proxy");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "syncWithRequest:completion:", v7, v6);

}

- (void)syncMetricsIdentifiers
{
  id v2;

  -[AMSEngagementConnection proxy](self, "proxy");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "syncMetricsIdentifiers");

}

- (void)manualSyncMetricsIdentifiers
{
  id v2;

  -[AMSEngagementConnection proxy](self, "proxy");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "manualSyncMetricsIdentifiers");

}

- (id)errorHandler
{
  return self->_errorHandler;
}

- (NSNotificationCenter)notificationCenter
{
  return self->_notificationCenter;
}

- (void)setNotificationCenter:(id)a3
{
  objc_storeStrong((id *)&self->_notificationCenter, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_notificationCenter, 0);
  objc_storeStrong((id *)&self->_connection, 0);
  objc_storeStrong(&self->_errorHandler, 0);
}

@end
