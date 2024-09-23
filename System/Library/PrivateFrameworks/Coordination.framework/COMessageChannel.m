@implementation COMessageChannel

- (COMessageChannel)initWithConnectionProvider:(id)a3 roleMonitorConnectionProvider:(id)a4 topic:(id)a5 cluster:(id)a6
{
  unint64_t v11;
  unint64_t v12;
  id v13;
  id v14;
  COMessageChannel *v15;
  COMessageChannel *v16;
  id v17;
  const char *v18;
  NSObject *v19;
  dispatch_queue_t v20;
  OS_dispatch_queue *workQueue;
  uint64_t v22;
  NSMutableDictionary *requestHandlers;
  uint64_t v24;
  NSMutableDictionary *sessionConsumers;
  uint64_t v26;
  NSMutableDictionary *sessionProducers;
  uint64_t v28;
  NSMutableDictionary *sessionsInflight;
  uint64_t v30;
  NSString *clusterLabel;
  uint64_t v32;
  NSMutableDictionary *outstandingRequests;
  uint64_t v34;
  NSMutableDictionary *roleSnapshotsCache;
  id recorder;
  NSObject *v37;
  objc_class *v38;
  void *v39;
  objc_super v41;
  uint8_t buf[4];
  COMessageChannel *v43;
  __int16 v44;
  id v45;
  __int16 v46;
  id v47;
  __int16 v48;
  void *v49;
  uint64_t v50;

  v50 = *MEMORY[0x24BDAC8D0];
  v11 = (unint64_t)a3;
  v12 = (unint64_t)a4;
  v13 = a5;
  v14 = a6;
  v41.receiver = self;
  v41.super_class = (Class)COMessageChannel;
  v15 = -[COMessageChannel init](&v41, sel_init);
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_topic, a5);
    objc_storeStrong(&v16->_cluster, a6);
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("com.apple.coordination.messageChannel.%p"), v16);
    v17 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v18 = (const char *)objc_msgSend(v17, "UTF8String");
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v19 = objc_claimAutoreleasedReturnValue();
    v20 = dispatch_queue_create(v18, v19);
    workQueue = v16->_workQueue;
    v16->_workQueue = (OS_dispatch_queue *)v20;

    v16->_lock._os_unfair_lock_opaque = 0;
    v16->_baseRequestID = arc4random();
    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v22 = objc_claimAutoreleasedReturnValue();
    requestHandlers = v16->_requestHandlers;
    v16->_requestHandlers = (NSMutableDictionary *)v22;

    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v24 = objc_claimAutoreleasedReturnValue();
    sessionConsumers = v16->_sessionConsumers;
    v16->_sessionConsumers = (NSMutableDictionary *)v24;

    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v26 = objc_claimAutoreleasedReturnValue();
    sessionProducers = v16->_sessionProducers;
    v16->_sessionProducers = (NSMutableDictionary *)v26;

    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v28 = objc_claimAutoreleasedReturnValue();
    sessionsInflight = v16->_sessionsInflight;
    v16->_sessionsInflight = (NSMutableDictionary *)v28;

    if (v11 | v12)
    {
      objc_storeStrong((id *)&v16->_provider, a3);
      objc_storeStrong((id *)&v16->_roleMonitorConnectionProvider, a4);
      if (+[COFeatureStatus isCOClusterEnabled](COFeatureStatus, "isCOClusterEnabled"))
        objc_msgSend(v14, "label");
      else
        +[COCluster inferClusterLabelFromCluster:](COCluster, "inferClusterLabelFromCluster:", v14);
      v30 = objc_claimAutoreleasedReturnValue();
      clusterLabel = v16->_clusterLabel;
      v16->_clusterLabel = (NSString *)v30;

      objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
      v32 = objc_claimAutoreleasedReturnValue();
      outstandingRequests = v16->_outstandingRequests;
      v16->_outstandingRequests = (NSMutableDictionary *)v32;

      objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
      v34 = objc_claimAutoreleasedReturnValue();
      roleSnapshotsCache = v16->_roleSnapshotsCache;
      v16->_roleSnapshotsCache = (NSMutableDictionary *)v34;

      recorder = v16->_recorder;
      v16->_recorder = &__block_literal_global_5;

      COLogForCategory(5);
      v37 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
      {
        v38 = (objc_class *)objc_opt_class();
        NSStringFromClass(v38);
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 134218754;
        v43 = v16;
        v44 = 2112;
        v45 = v13;
        v46 = 2112;
        v47 = v14;
        v48 = 2112;
        v49 = v39;
        _os_log_impl(&dword_21214B000, v37, OS_LOG_TYPE_DEFAULT, "%p message channel created with topic %@, cluster %@ and %@ provider", buf, 0x2Au);

      }
    }
  }

  return v16;
}

uint64_t __91__COMessageChannel_initWithConnectionProvider_roleMonitorConnectionProvider_topic_cluster___block_invoke()
{
  return AnalyticsSendEventLazy();
}

- (COMessageChannel)initWithTopic:(id)a3 cluster:(id)a4
{
  id v6;
  void *v7;
  _COMessageChannelConnectionProvider *v8;
  COMessageChannel *v9;

  v6 = a3;
  +[COCluster _clusterForCluster:](COCluster, "_clusterForCluster:", a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_alloc_init(_COMessageChannelConnectionProvider);
  v9 = -[COMessageChannel initWithConnectionProvider:roleMonitorConnectionProvider:topic:cluster:](self, "initWithConnectionProvider:roleMonitorConnectionProvider:topic:cluster:", v8, 0, v6, v7);

  return v9;
}

+ (COMessageChannel)messageChannelWithTopic:(id)a3 cluster:(id)a4 manualGrouping:(BOOL)a5
{
  _BOOL4 v5;
  id v7;
  id v8;
  BOOL v9;
  _COMessageChannel *v10;
  _COMessageChannel *v11;

  v5 = a5;
  v7 = a4;
  v8 = a3;
  if (+[COFeatureStatus isNoDaemonMessageChannelEnabled](COFeatureStatus, "isNoDaemonMessageChannelEnabled"))
  {
    v9 = !v5;
  }
  else
  {
    v9 = 1;
  }
  if (v9)
    v10 = -[COMessageChannel initWithTopic:cluster:]([COMessageChannel alloc], "initWithTopic:cluster:", v8, v7);
  else
    v10 = -[_COMessageChannel initWithTopic:cluster:manualGrouping:]([_COMessageChannel alloc], "initWithTopic:cluster:manualGrouping:", v8, v7, 1);
  v11 = v10;

  return (COMessageChannel *)v11;
}

- (void)dealloc
{
  objc_super v3;
  _QWORD v4[5];

  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __27__COMessageChannel_dealloc__block_invoke;
  v4[3] = &unk_24CD3EFE8;
  v4[4] = self;
  -[COMessageChannel _withLock:](self, "_withLock:", v4);
  v3.receiver = self;
  v3.super_class = (Class)COMessageChannel;
  -[COMessageChannel dealloc](&v3, sel_dealloc);
}

void __27__COMessageChannel_dealloc__block_invoke(uint64_t a1)
{
  void *v1;
  void *v2;
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "lastConnection");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "co_originalInterruptionHandler");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "co_setOriginalInterruptionHandler:", v1);

  objc_msgSend(v3, "co_originalInvalidationHandler");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "co_setOriginalInvalidationHandler:", v2);

  objc_msgSend(v3, "invalidate");
}

- (void)activateWithCompletion:(id)a3
{
  id v4;
  NSObject *workQueue;
  id v6;
  _QWORD block[4];
  id v8;
  id v9;
  id location;

  v4 = a3;
  objc_initWeak(&location, self);
  workQueue = self->_workQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __43__COMessageChannel_activateWithCompletion___block_invoke;
  block[3] = &unk_24CD3FB70;
  objc_copyWeak(&v9, &location);
  v8 = v4;
  v6 = v4;
  dispatch_async(workQueue, block);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

void __43__COMessageChannel_activateWithCompletion___block_invoke(uint64_t a1)
{
  id WeakRetained;
  id v3;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v3 = WeakRetained;
    objc_msgSend(WeakRetained, "_activateWithCompletion:", *(_QWORD *)(a1 + 32));
    WeakRetained = v3;
  }

}

- (void)sendRequest:(id)a3 withCompletionHandler:(id)a4
{
  id v6;
  id v7;
  id v8;

  v6 = a4;
  v7 = a3;
  -[COMessageChannel _payloadTypeFromClass:](self, "_payloadTypeFromClass:", objc_opt_class());
  v8 = (id)objc_claimAutoreleasedReturnValue();
  -[COMessageChannel sendRequest:type:withCompletionHandler:](self, "sendRequest:type:withCompletionHandler:", v7, v8, v6);

}

- (void)sendRequest:(id)a3 type:(id)a4 withCompletionHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *workQueue;
  id v12;
  id v13;
  id v14;
  _QWORD v15[5];
  id v16;
  id v17;
  id v18;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  workQueue = self->_workQueue;
  v15[0] = MEMORY[0x24BDAC760];
  v15[1] = 3221225472;
  v15[2] = __59__COMessageChannel_sendRequest_type_withCompletionHandler___block_invoke;
  v15[3] = &unk_24CD3EF48;
  v15[4] = self;
  v16 = v8;
  v17 = v9;
  v18 = v10;
  v12 = v10;
  v13 = v9;
  v14 = v8;
  dispatch_async(workQueue, v15);

}

uint64_t __59__COMessageChannel_sendRequest_type_withCompletionHandler___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_sendRequest:type:members:withCompletionHandler:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), 0, *(_QWORD *)(a1 + 56));
}

- (void)sendRequest:(id)a3 members:(id)a4 withCompletionHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  -[COMessageChannel _payloadTypeFromClass:](self, "_payloadTypeFromClass:", objc_opt_class());
  v11 = (id)objc_claimAutoreleasedReturnValue();
  -[COMessageChannel sendRequest:type:members:withCompletionHandler:](self, "sendRequest:type:members:withCompletionHandler:", v10, v11, v9, v8);

}

- (void)sendRequest:(id)a3 type:(id)a4 members:(id)a5 withCompletionHandler:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  NSObject *workQueue;
  id v15;
  id v16;
  id v17;
  id v18;
  _QWORD block[5];
  id v20;
  id v21;
  id v22;
  id v23;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  workQueue = self->_workQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __67__COMessageChannel_sendRequest_type_members_withCompletionHandler___block_invoke;
  block[3] = &unk_24CD3F298;
  block[4] = self;
  v20 = v10;
  v21 = v11;
  v22 = v12;
  v23 = v13;
  v15 = v13;
  v16 = v12;
  v17 = v11;
  v18 = v10;
  dispatch_async(workQueue, block);

}

uint64_t __67__COMessageChannel_sendRequest_type_members_withCompletionHandler___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_sendRequest:type:members:withCompletionHandler:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64));
}

- (void)broadcastRequest:(id)a3 recipientsCallback:(id)a4 responseCompletionHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  -[COMessageChannel _payloadTypeFromClass:](self, "_payloadTypeFromClass:", objc_opt_class());
  v11 = (id)objc_claimAutoreleasedReturnValue();
  -[COMessageChannel broadcastRequest:type:recipientsCallback:responseCompletionHandler:](self, "broadcastRequest:type:recipientsCallback:responseCompletionHandler:", v10, v11, v9, v8);

}

- (void)broadcastRequest:(id)a3 type:(id)a4 recipientsCallback:(id)a5 responseCompletionHandler:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  NSObject *workQueue;
  id v15;
  id v16;
  id v17;
  id v18;
  _QWORD block[5];
  id v20;
  id v21;
  id v22;
  id v23;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  workQueue = self->_workQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __87__COMessageChannel_broadcastRequest_type_recipientsCallback_responseCompletionHandler___block_invoke;
  block[3] = &unk_24CD3FB98;
  block[4] = self;
  v20 = v10;
  v21 = v11;
  v22 = v12;
  v23 = v13;
  v15 = v13;
  v16 = v12;
  v17 = v11;
  v18 = v10;
  dispatch_async(workQueue, block);

}

uint64_t __87__COMessageChannel_broadcastRequest_type_recipientsCallback_responseCompletionHandler___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_broadcastRequest:type:recipientsCallback:responseCompletionHandler:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64));
}

- (void)registerHandler:(id)a3 forRequestClass:(Class)a4
{
  id v6;
  id v7;

  v6 = a3;
  -[COMessageChannel _payloadTypeFromClass:](self, "_payloadTypeFromClass:", a4);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  -[COMessageChannel registerHandler:forRequestClassType:](self, "registerHandler:forRequestClassType:", v6, v7);

}

- (void)registerHandler:(id)a3 forRequestClassType:(id)a4
{
  id v6;
  id v7;
  NSObject *workQueue;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  workQueue = self->_workQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __56__COMessageChannel_registerHandler_forRequestClassType___block_invoke;
  block[3] = &unk_24CD3FBC0;
  v12 = v7;
  v13 = v6;
  block[4] = self;
  v9 = v7;
  v10 = v6;
  dispatch_async(workQueue, block);

}

void __56__COMessageChannel_registerHandler_forRequestClassType___block_invoke(_QWORD *a1)
{
  _BYTE *v2;
  uint64_t v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  id v12;

  v3 = (uint64_t)(a1 + 4);
  v2 = (_BYTE *)a1[4];
  if (v2[8])
  {
    COLogForCategory(5);
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      __56__COMessageChannel_registerHandler_forRequestClassType___block_invoke_cold_1(v3, v4, v5, v6, v7, v8, v9, v10);

  }
  else
  {
    objc_msgSend(v2, "requestHandlers");
    v12 = (id)objc_claimAutoreleasedReturnValue();
    v11 = (void *)MEMORY[0x212BE9A2C](a1[6]);
    objc_msgSend(v12, "setObject:forKey:", v11, a1[5]);

  }
}

- (void)unregisterHandlerForRequestClass:(Class)a3
{
  id v4;

  -[COMessageChannel _payloadTypeFromClass:](self, "_payloadTypeFromClass:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[COMessageChannel unregisterHandlerForRequestClassType:](self, "unregisterHandlerForRequestClassType:", v4);

}

- (void)unregisterHandlerForRequestClassType:(id)a3
{
  id v4;
  NSObject *workQueue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  workQueue = self->_workQueue;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __57__COMessageChannel_unregisterHandlerForRequestClassType___block_invoke;
  v7[3] = &unk_24CD3EF20;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(workQueue, v7);

}

void __57__COMessageChannel_unregisterHandlerForRequestClassType___block_invoke(uint64_t a1)
{
  _BYTE *v2;
  uint64_t v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  id v11;

  v3 = a1 + 32;
  v2 = *(_BYTE **)(a1 + 32);
  if (v2[8])
  {
    COLogForCategory(5);
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      __57__COMessageChannel_unregisterHandlerForRequestClassType___block_invoke_cold_1(v3, v4, v5, v6, v7, v8, v9, v10);

  }
  else
  {
    objc_msgSend(v2, "requestHandlers");
    v11 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "removeObjectForKey:", *(_QWORD *)(a1 + 40));

  }
}

- (void)addSessionProducerWithSubTopic:(id)a3 delegate:(id)a4 dispatchQueue:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *workQueue;
  id v12;
  id v13;
  id v14;
  _QWORD v15[5];
  id v16;
  id v17;
  id v18;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  workQueue = self->_workQueue;
  v15[0] = MEMORY[0x24BDAC760];
  v15[1] = 3221225472;
  v15[2] = __74__COMessageChannel_addSessionProducerWithSubTopic_delegate_dispatchQueue___block_invoke;
  v15[3] = &unk_24CD3FBE8;
  v15[4] = self;
  v16 = v8;
  v17 = v9;
  v18 = v10;
  v12 = v10;
  v13 = v9;
  v14 = v8;
  dispatch_async(workQueue, v15);

}

void __74__COMessageChannel_addSessionProducerWithSubTopic_delegate_dispatchQueue___block_invoke(uint64_t a1)
{
  id *v2;
  NSObject *v3;
  id v4;
  NSObject *v5;
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  COMessageSessionProducer *v12;
  void *v13;
  _QWORD v14[4];
  id v15;
  id v16;
  id location;
  _QWORD block[4];
  id v19;
  uint64_t v20;
  id v21;
  id v22;

  v2 = (id *)(a1 + 32);
  if (*(_BYTE *)(*(_QWORD *)(a1 + 32) + 8))
  {
    COLogForCategory(6);
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
      __74__COMessageChannel_addSessionProducerWithSubTopic_delegate_dispatchQueue___block_invoke_cold_1();

    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("COMessageSessionErrorDomain"), -1202, 0);
    v4 = (id)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      block[0] = MEMORY[0x24BDAC760];
      block[1] = 3221225472;
      block[2] = __74__COMessageChannel_addSessionProducerWithSubTopic_delegate_dispatchQueue___block_invoke_44;
      block[3] = &unk_24CD3FBE8;
      v5 = *(NSObject **)(a1 + 56);
      v6 = *(id *)(a1 + 48);
      v7 = *(_QWORD *)(a1 + 32);
      v8 = *(void **)(a1 + 40);
      v19 = v6;
      v20 = v7;
      v21 = v8;
      v4 = v4;
      v22 = v4;
      dispatch_async(v5, block);

    }
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "_commandTypeForProducerWithSubTopic:", *(_QWORD *)(a1 + 40));
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_initWeak(&location, *(id *)(a1 + 32));
    v14[0] = MEMORY[0x24BDAC760];
    v14[1] = 3221225472;
    v14[2] = __74__COMessageChannel_addSessionProducerWithSubTopic_delegate_dispatchQueue___block_invoke_2;
    v14[3] = &unk_24CD3FC10;
    objc_copyWeak(&v16, &location);
    v15 = *(id *)(a1 + 40);
    v9 = (void *)MEMORY[0x212BE9A2C](v14);
    objc_msgSend(*(id *)(a1 + 32), "requestHandlers");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (void *)MEMORY[0x212BE9A2C](v9);
    objc_msgSend(v10, "setObject:forKey:", v11, v4);

    v12 = -[COMessageSessionProducer initWithChannel:subTopic:delegate:dispatchQueue:]([COMessageSessionProducer alloc], "initWithChannel:subTopic:delegate:dispatchQueue:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));
    objc_msgSend(*v2, "sessionProducers");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setObject:forKey:", v12, *(_QWORD *)(a1 + 40));

    objc_destroyWeak(&v16);
    objc_destroyWeak(&location);
  }

}

uint64_t __74__COMessageChannel_addSessionProducerWithSubTopic_delegate_dispatchQueue___block_invoke_44(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "channel:didFailToAddProducerWithSubTopic:error:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));
}

void __74__COMessageChannel_addSessionProducerWithSubTopic_delegate_dispatchQueue___block_invoke_2(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  id WeakRetained;
  id v11;
  NSObject *v12;

  v7 = a2;
  v8 = a3;
  v9 = a4;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v11 = v7;
    if (objc_msgSend(v11, "commandType") == 2)
    {
      objc_msgSend(WeakRetained, "_handleStopCommand:fromMember:callback:", v11, v8, v9);
    }
    else if (objc_msgSend(v11, "commandType"))
    {
      COLogForCategory(6);
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
        __74__COMessageChannel_addSessionProducerWithSubTopic_delegate_dispatchQueue___block_invoke_2_cold_1();

    }
    else
    {
      objc_msgSend(WeakRetained, "_handleCapableCommand:fromMember:callback:", v11, v8, v9);
    }

  }
}

- (void)addSessionConsumerWithSubTopic:(id)a3 delegate:(id)a4 dispatchQueue:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *workQueue;
  id v12;
  id v13;
  id v14;
  _QWORD v15[5];
  id v16;
  id v17;
  id v18;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  workQueue = self->_workQueue;
  v15[0] = MEMORY[0x24BDAC760];
  v15[1] = 3221225472;
  v15[2] = __74__COMessageChannel_addSessionConsumerWithSubTopic_delegate_dispatchQueue___block_invoke;
  v15[3] = &unk_24CD3FBE8;
  v15[4] = self;
  v16 = v8;
  v17 = v9;
  v18 = v10;
  v12 = v10;
  v13 = v9;
  v14 = v8;
  dispatch_async(workQueue, v15);

}

void __74__COMessageChannel_addSessionConsumerWithSubTopic_delegate_dispatchQueue___block_invoke(uint64_t a1)
{
  id *v2;
  NSObject *v3;
  id v4;
  NSObject *v5;
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  COMessageSessionConsumer *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  void (*v16)(uint64_t, void *, void *, void *);
  void *v17;
  id v18;
  id location;
  _QWORD block[4];
  id v21;
  uint64_t v22;
  id v23;
  id v24;

  v2 = (id *)(a1 + 32);
  if (*(_BYTE *)(*(_QWORD *)(a1 + 32) + 8))
  {
    COLogForCategory(6);
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
      __74__COMessageChannel_addSessionConsumerWithSubTopic_delegate_dispatchQueue___block_invoke_cold_1();

    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("COMessageSessionErrorDomain"), -1203, 0);
    v4 = (id)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      block[0] = MEMORY[0x24BDAC760];
      block[1] = 3221225472;
      block[2] = __74__COMessageChannel_addSessionConsumerWithSubTopic_delegate_dispatchQueue___block_invoke_49;
      block[3] = &unk_24CD3FBE8;
      v5 = *(NSObject **)(a1 + 56);
      v6 = *(id *)(a1 + 48);
      v7 = *(_QWORD *)(a1 + 32);
      v8 = *(void **)(a1 + 40);
      v21 = v6;
      v22 = v7;
      v23 = v8;
      v4 = v4;
      v24 = v4;
      dispatch_async(v5, block);

    }
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "_commandTypeForConsumerWithSubTopic:", *(_QWORD *)(a1 + 40));
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_initWeak(&location, *(id *)(a1 + 32));
    v14 = MEMORY[0x24BDAC760];
    v15 = 3221225472;
    v16 = __74__COMessageChannel_addSessionConsumerWithSubTopic_delegate_dispatchQueue___block_invoke_2;
    v17 = &unk_24CD3FC38;
    objc_copyWeak(&v18, &location);
    v9 = (void *)MEMORY[0x212BE9A2C](&v14);
    objc_msgSend(*(id *)(a1 + 32), "requestHandlers", v14, v15, v16, v17);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (void *)MEMORY[0x212BE9A2C](v9);
    objc_msgSend(v10, "setObject:forKey:", v11, v4);

    v12 = -[COMessageSessionConsumer initWithChannel:subTopic:delegate:dispatchQueue:]([COMessageSessionConsumer alloc], "initWithChannel:subTopic:delegate:dispatchQueue:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));
    objc_msgSend(*v2, "sessionConsumers");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setObject:forKey:", v12, *(_QWORD *)(a1 + 40));

    objc_destroyWeak(&v18);
    objc_destroyWeak(&location);
  }

}

uint64_t __74__COMessageChannel_addSessionConsumerWithSubTopic_delegate_dispatchQueue___block_invoke_49(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "channel:didFailToAddConsumerWithSubTopic:error:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));
}

void __74__COMessageChannel_addSessionConsumerWithSubTopic_delegate_dispatchQueue___block_invoke_2(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  NSObject **WeakRetained;
  NSObject **v11;
  NSObject *v12;
  _QWORD v13[4];
  id v14;
  NSObject **v15;
  id v16;
  id v17;

  v7 = a2;
  v8 = a3;
  v9 = a4;
  WeakRetained = (NSObject **)objc_loadWeakRetained((id *)(a1 + 32));
  v11 = WeakRetained;
  if (WeakRetained)
  {
    v12 = WeakRetained[13];
    v13[0] = MEMORY[0x24BDAC760];
    v13[1] = 3221225472;
    v13[2] = __74__COMessageChannel_addSessionConsumerWithSubTopic_delegate_dispatchQueue___block_invoke_3;
    v13[3] = &unk_24CD3EF48;
    v14 = v7;
    v15 = v11;
    v16 = v8;
    v17 = v9;
    dispatch_async(v12, v13);

  }
}

void __74__COMessageChannel_addSessionConsumerWithSubTopic_delegate_dispatchQueue___block_invoke_3(uint64_t a1)
{
  id v2;
  NSObject *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  NSObject *v8;
  NSObject *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  int v13;
  uint64_t v14;
  __int16 v15;
  void *v16;
  __int16 v17;
  uint64_t v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v2 = *(id *)(a1 + 32);
  if (objc_msgSend(v2, "commandType") == 1)
  {
    COLogForCategory(5);
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      v4 = *(_QWORD *)(a1 + 40);
      objc_msgSend(v2, "subTopic");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = *(_QWORD *)(a1 + 48);
      v13 = 134218498;
      v14 = v4;
      v15 = 2112;
      v16 = v5;
      v17 = 2112;
      v18 = v6;
      _os_log_impl(&dword_21214B000, v3, OS_LOG_TYPE_DEFAULT, "%p Message channel received a session management request to start a session for subtopic %@ from member %@", (uint8_t *)&v13, 0x20u);

    }
    objc_msgSend(*(id *)(a1 + 40), "_handleStartCommand:withMember:callback:", v2, *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));
  }
  else
  {
    v7 = objc_msgSend(v2, "commandType");
    COLogForCategory(5);
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = v8;
    if (v7 == 2)
    {
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        v10 = *(_QWORD *)(a1 + 40);
        objc_msgSend(v2, "subTopic");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = *(_QWORD *)(a1 + 48);
        v13 = 134218498;
        v14 = v10;
        v15 = 2112;
        v16 = v11;
        v17 = 2112;
        v18 = v12;
        _os_log_impl(&dword_21214B000, v9, OS_LOG_TYPE_DEFAULT, "%p Message channel received a session management request to stop a session for subtopic %@ from member %@", (uint8_t *)&v13, 0x20u);

      }
      objc_msgSend(*(id *)(a1 + 40), "_handleStopCommand:fromMember:callback:", v2, *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));
    }
    else
    {
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
        __74__COMessageChannel_addSessionConsumerWithSubTopic_delegate_dispatchQueue___block_invoke_3_cold_1(a1, v2, v9);

    }
  }

}

- (void)startSessionWithProducer:(id)a3 members:(id)a4
{
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  NSObject *workQueue;
  id obj;
  _QWORD block[5];
  id v16;
  uint64_t v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  obj = a4;
  v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v19;
    v10 = MEMORY[0x24BDAC760];
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v19 != v9)
          objc_enumerationMutation(obj);
        v12 = *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * v11);
        workQueue = self->_workQueue;
        block[0] = v10;
        block[1] = 3221225472;
        block[2] = __53__COMessageChannel_startSessionWithProducer_members___block_invoke;
        block[3] = &unk_24CD3F310;
        block[4] = self;
        v16 = v6;
        v17 = v12;
        dispatch_async(workQueue, block);

        ++v11;
      }
      while (v8 != v11);
      v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    }
    while (v8);
  }

}

uint64_t __53__COMessageChannel_startSessionWithProducer_members___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_startSessionWithProducer:member:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

- (void)stopMessageSession:(id)a3 withNotice:(id)a4
{
  id v6;
  id v7;
  NSObject *workQueue;
  id v9;
  id v10;
  _QWORD block[4];
  id v12;
  COMessageChannel *v13;
  id v14;

  v6 = a3;
  v7 = a4;
  workQueue = self->_workQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __50__COMessageChannel_stopMessageSession_withNotice___block_invoke;
  block[3] = &unk_24CD3F310;
  v12 = v6;
  v13 = self;
  v14 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(workQueue, block);

}

void __50__COMessageChannel_stopMessageSession_withNotice___block_invoke(id *a1)
{
  void *v2;
  NSObject *v3;
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  _BOOL4 v14;
  id v15;
  id v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  NSObject *v23;
  COMessageSessionManagementRequest *v24;
  COMessageSessionManagementRequest *v25;
  void *v26;
  COMessageSessionManagementRequest *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  id v33;
  void *v34;
  id v35;
  id v36;
  id v37;
  _QWORD v38[4];
  id v39;
  id v40;
  id v41;
  id v42;
  id v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  uint64_t v48;
  id v49;
  uint8_t v50[128];
  uint8_t buf[4];
  id v52;
  __int16 v53;
  void *v54;
  __int16 v55;
  void *v56;
  uint64_t v57;

  v57 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a1[4], "member");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  COLogForCategory(6);
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v5 = a1[4];
    v4 = a1[5];
    *(_DWORD *)buf = 134218498;
    v52 = v4;
    v53 = 2112;
    v54 = v5;
    v55 = 2112;
    v56 = v2;
    _os_log_impl(&dword_21214B000, v3, OS_LOG_TYPE_DEFAULT, "%p Stopping session %@ with member %@", buf, 0x20u);
  }

  v46 = 0u;
  v47 = 0u;
  v44 = 0u;
  v45 = 0u;
  objc_msgSend(a1[5], "roleSnapshotsCache");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "allValues");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = 0;
  v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v44, v50, 16);
  if (v9)
  {
    v10 = *(_QWORD *)v45;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v45 != v10)
          objc_enumerationMutation(v7);
        v12 = *(void **)(*((_QWORD *)&v44 + 1) + 8 * i);
        objc_msgSend(v12, "member");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = objc_msgSend(v13, "memberType") == 1;

        if (v14)
        {
          v15 = v12;

          v8 = v15;
        }
      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v44, v50, 16);
    }
    while (v9);
  }

  if (a1[6])
  {
    objc_msgSend(a1[4], "setDidUseNotice:", 1);
    v16 = a1[6];
    v43 = 0;
    objc_msgSend(MEMORY[0x24BDD1618], "archivedDataWithRootObject:requiringSecureCoding:error:", v16, 1, &v43);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = v43;
    if (v18)
    {
      v19 = v18;
      v20 = (void *)MEMORY[0x24BDD1540];
      v48 = *MEMORY[0x24BDD1398];
      v49 = v18;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v49, &v48, 1);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "errorWithDomain:code:userInfo:", CFSTR("COMessageSessionErrorDomain"), -1205, v21);
      v22 = (void *)objc_claimAutoreleasedReturnValue();

      COLogForCategory(6);
      v23 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
      {
        v37 = a1[4];
        v36 = a1[5];
        *(_DWORD *)buf = 134218498;
        v52 = v36;
        v53 = 2112;
        v54 = v22;
        v55 = 2112;
        v56 = v37;
        _os_log_error_impl(&dword_21214B000, v23, OS_LOG_TYPE_ERROR, "%p Failed to encode request with error %@ when stopping session %@", buf, 0x20u);
      }

      objc_msgSend(a1[5], "_deliverDidEndDelegateForSession:notice:initiator:error:", a1[4], a1[6], v8, v22);
      v24 = 0;
    }
    else
    {
      v27 = [COMessageSessionManagementRequest alloc];
      objc_msgSend(a1[5], "_payloadTypeFromClass:", objc_opt_class());
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(a1[5], "topic");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(a1[4], "subTopic");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = -[COMessageSessionManagementRequest initWithCommandType:payload:payloadType:topic:subTopic:](v27, "initWithCommandType:payload:payloadType:topic:subTopic:", 2, v17, v22, v28, v29);

    }
  }
  else
  {
    v25 = [COMessageSessionManagementRequest alloc];
    objc_msgSend(a1[5], "topic");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1[4], "subTopic");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = -[COMessageSessionManagementRequest initWithCommandType:payload:payloadType:topic:subTopic:](v25, "initWithCommandType:payload:payloadType:topic:subTopic:", 2, 0, 0, v22, v26);

    v17 = 0;
  }

  v30 = (void *)MEMORY[0x24BDD17C8];
  objc_msgSend(a1[4], "subTopic");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "_commandTypeForConsumerWithSubTopic:", v31);
  v32 = (void *)objc_claimAutoreleasedReturnValue();

  objc_initWeak((id *)buf, a1[5]);
  v33 = a1[5];
  objc_msgSend(MEMORY[0x24BDBCF20], "setWithObject:", v2);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v38[0] = MEMORY[0x24BDAC760];
  v38[1] = 3221225472;
  v38[2] = __50__COMessageChannel_stopMessageSession_withNotice___block_invoke_55;
  v38[3] = &unk_24CD3FC88;
  objc_copyWeak(&v42, (id *)buf);
  v39 = a1[4];
  v40 = a1[6];
  v35 = v8;
  v41 = v35;
  objc_msgSend(v33, "_sendRequest:type:members:withCompletionHandler:", v24, v32, v34, v38);

  objc_destroyWeak(&v42);
  objc_destroyWeak((id *)buf);

}

void __50__COMessageChannel_stopMessageSession_withNotice___block_invoke_55(id *a1, uint64_t a2, uint64_t a3, void *a4)
{
  id v5;
  NSObject **WeakRetained;
  NSObject **v7;
  NSObject *v8;
  _QWORD block[5];
  id v10;
  id v11;
  id v12;
  id v13;

  v5 = a4;
  WeakRetained = (NSObject **)objc_loadWeakRetained(a1 + 7);
  v7 = WeakRetained;
  if (WeakRetained)
  {
    v8 = WeakRetained[13];
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __50__COMessageChannel_stopMessageSession_withNotice___block_invoke_2;
    block[3] = &unk_24CD3FC60;
    block[4] = WeakRetained;
    v10 = a1[4];
    v11 = a1[5];
    v12 = a1[6];
    v13 = v5;
    dispatch_async(v8, block);

  }
}

uint64_t __50__COMessageChannel_stopMessageSession_withNotice___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_deliverDidEndDelegateForSession:notice:initiator:error:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64));
}

- (void)failedToSendRequestWithID:(unsigned int)a3 withError:(id)a4
{
  id v6;
  NSObject *workQueue;
  id v8;
  _QWORD block[5];
  id v10;
  unsigned int v11;

  v6 = a4;
  workQueue = self->_workQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __56__COMessageChannel_failedToSendRequestWithID_withError___block_invoke;
  block[3] = &unk_24CD3FCB0;
  v11 = a3;
  block[4] = self;
  v10 = v6;
  v8 = v6;
  dispatch_async(workQueue, block);

}

void __56__COMessageChannel_failedToSendRequestWithID_withError___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  NSObject *v8;
  _BOOL4 v9;
  uint64_t v10;
  void *v11;
  NSObject *v12;
  uint64_t v13;
  uint64_t v14;
  int v15;
  void *v16;
  int v17;
  uint64_t v18;
  uint64_t v19;
  int v20;
  uint64_t v21;
  uint64_t v22;
  int v23;
  uint64_t v24;
  __int16 v25;
  _BYTE v26[14];
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 88);
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", *(unsigned int *)(a1 + 48));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = *(void **)(*(_QWORD *)(a1 + 32) + 88);
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", *(unsigned int *)(a1 + 48));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeObjectForKey:", v6);

  if (v4)
  {
    v7 = objc_msgSend(v4, "requestType");
    COLogForCategory(5);
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = os_log_type_enabled(v8, OS_LOG_TYPE_ERROR);
    if (v7)
    {
      if (v9)
      {
        v17 = *(_DWORD *)(a1 + 48);
        v18 = *(_QWORD *)(a1 + 32);
        v19 = *(_QWORD *)(a1 + 40);
        v23 = 134218498;
        v24 = v18;
        v25 = 1024;
        *(_DWORD *)v26 = v17;
        *(_WORD *)&v26[4] = 2112;
        *(_QWORD *)&v26[6] = v19;
        _os_log_error_impl(&dword_21214B000, v8, OS_LOG_TYPE_ERROR, "%p Failed to send broadcast request with ID %u. Error %@", (uint8_t *)&v23, 0x1Cu);
      }

      objc_msgSend(v4, "recipientCallback");
      v10 = objc_claimAutoreleasedReturnValue();
      v11 = (void *)v10;
      if (v10)
        (*(void (**)(uint64_t, _QWORD, _QWORD))(v10 + 16))(v10, 0, *(_QWORD *)(a1 + 40));

    }
    else
    {
      if (v9)
      {
        v20 = *(_DWORD *)(a1 + 48);
        v21 = *(_QWORD *)(a1 + 32);
        v22 = *(_QWORD *)(a1 + 40);
        v23 = 134218498;
        v24 = v21;
        v25 = 1024;
        *(_DWORD *)v26 = v20;
        *(_WORD *)&v26[4] = 2112;
        *(_QWORD *)&v26[6] = v22;
        _os_log_error_impl(&dword_21214B000, v8, OS_LOG_TYPE_ERROR, "%p Failed to send request with ID %u. Error %@", (uint8_t *)&v23, 0x1Cu);
      }

      objc_msgSend(*(id *)(a1 + 32), "_invokeResponseCallbackForInfo:snapshot:response:error:", v4, 0, 0, *(_QWORD *)(a1 + 40));
    }
    v16 = *(void **)(a1 + 32);
    objc_msgSend(v4, "request");
    v12 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "_submitMetricsForRequest:withRequestInfo:withError:", v12, v4, *(_QWORD *)(a1 + 40));
  }
  else
  {
    COLogForCategory(5);
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      v13 = *(_QWORD *)(a1 + 32);
      v14 = *(_QWORD *)(a1 + 40);
      v15 = *(_DWORD *)(a1 + 48);
      v23 = 134218498;
      v24 = v13;
      v25 = 2112;
      *(_QWORD *)v26 = v14;
      *(_WORD *)&v26[8] = 1024;
      *(_DWORD *)&v26[10] = v15;
      _os_log_error_impl(&dword_21214B000, v12, OS_LOG_TYPE_ERROR, " %p Got an error %@ for request ID %u which is not being followed by this message channel", (uint8_t *)&v23, 0x1Cu);
    }
  }

}

- (void)receivedRequestWithPayload:(id)a3 payloadType:(id)a4 requestID:(unsigned int)a5 fromMember:(id)a6 withCallback:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  NSObject *workQueue;
  id v17;
  id v18;
  id v19;
  id v20;
  _QWORD v21[5];
  id v22;
  id v23;
  id v24;
  id v25;
  unsigned int v26;

  v12 = a3;
  v13 = a4;
  v14 = a6;
  v15 = a7;
  workQueue = self->_workQueue;
  v21[0] = MEMORY[0x24BDAC760];
  v21[1] = 3221225472;
  v21[2] = __93__COMessageChannel_receivedRequestWithPayload_payloadType_requestID_fromMember_withCallback___block_invoke;
  v21[3] = &unk_24CD3FD00;
  v21[4] = self;
  v22 = v13;
  v26 = a5;
  v23 = v12;
  v24 = v14;
  v25 = v15;
  v17 = v15;
  v18 = v14;
  v19 = v12;
  v20 = v13;
  dispatch_async(workQueue, v21);

}

void __93__COMessageChannel_receivedRequestWithPayload_payloadType_requestID_fromMember_withCallback___block_invoke(uint64_t a1)
{
  id *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  id *v7;
  uint64_t *v8;
  void *v9;
  void *v10;
  id v11;
  _BOOL4 v12;
  BOOL v13;
  void *v14;
  NSObject *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void (**v22)(_QWORD, _QWORD, _QWORD, _QWORD);
  NSObject *v23;
  NSObject *v24;
  uint64_t v25;
  int v26;
  void *v27;
  void *v28;
  uint64_t v29;
  void *v30;
  uint64_t v31;
  int v32;
  uint64_t v33;
  _QWORD v34[5];
  id v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  void *v40;
  uint8_t buf[4];
  uint64_t v42;
  __int16 v43;
  _BYTE v44[14];
  __int16 v45;
  void *v46;
  uint64_t v47;

  v47 = *MEMORY[0x24BDAC8D0];
  v2 = (id *)(a1 + 40);
  v3 = objc_msgSend(*(id *)(a1 + 32), "_payloadClassFromType:", *(_QWORD *)(a1 + 40));
  if (v3)
  {
    v4 = v3;
    v5 = (void *)MEMORY[0x24BDD1620];
    v6 = *(_QWORD *)(a1 + 48);
    v38 = 0;
    v7 = (id *)&v38;
    v8 = &v38;
  }
  else
  {
    if ((objc_msgSend(*v2, "hasPrefix:", CFSTR("SessionConsumer+")) & 1) == 0
      && !objc_msgSend(*v2, "hasPrefix:", CFSTR("SessionProducer+")))
    {
      v12 = 0;
      v10 = 0;
      v14 = 0;
      goto LABEL_12;
    }
    v9 = (void *)MEMORY[0x24BDD1620];
    v4 = objc_opt_class();
    v6 = *(_QWORD *)(a1 + 48);
    v37 = 0;
    v7 = (id *)&v37;
    v8 = &v37;
    v5 = v9;
  }
  objc_msgSend(v5, "unarchivedObjectOfClass:fromData:error:", v4, v6, v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = *v7;
  v12 = v11 != 0;
  if (v11)
    v13 = 1;
  else
    v13 = v10 == 0;
  if (!v13)
  {
    v19 = objc_msgSend(*(id *)(a1 + 32), "sendLimit");
    v34[0] = MEMORY[0x24BDAC760];
    v34[1] = 3221225472;
    v34[2] = __93__COMessageChannel_receivedRequestWithPayload_payloadType_requestID_fromMember_withCallback___block_invoke_59;
    v34[3] = &unk_24CD3FCD8;
    v34[4] = *(_QWORD *)(a1 + 32);
    v36 = v19;
    v35 = *(id *)(a1 + 64);
    v20 = (void *)MEMORY[0x212BE9A2C](v34);
    objc_msgSend(*(id *)(a1 + 32), "requestHandlers");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "objectForKey:", *(_QWORD *)(a1 + 40));
    v22 = (void (**)(_QWORD, _QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();

    COLogForCategory(5);
    v23 = objc_claimAutoreleasedReturnValue();
    v24 = v23;
    if (v22)
    {
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
      {
        v25 = *(_QWORD *)(a1 + 32);
        v26 = *(_DWORD *)(a1 + 72);
        v27 = (void *)MEMORY[0x212BE9A2C](v22);
        *(_DWORD *)buf = 134218754;
        v42 = v25;
        v43 = 2114;
        *(_QWORD *)v44 = v10;
        *(_WORD *)&v44[8] = 1024;
        *(_DWORD *)&v44[10] = v26;
        v45 = 2048;
        v46 = v27;
        _os_log_impl(&dword_21214B000, v24, OS_LOG_TYPE_DEFAULT, "%p Dispatching request %{public}@ for message %u to %p", buf, 0x26u);

      }
      ((void (**)(_QWORD, void *, _QWORD, void *))v22)[2](v22, v10, *(_QWORD *)(a1 + 56), v20);
    }
    else
    {
      if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
        __93__COMessageChannel_receivedRequestWithPayload_payloadType_requestID_fromMember_withCallback___block_invoke_cold_1();

      v29 = *(_QWORD *)(a1 + 64);
      objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("COMessageChannelErrorDomain"), -1101, 0);
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      (*(void (**)(uint64_t, _QWORD, _QWORD, void *))(v29 + 16))(v29, 0, 0, v30);

    }
    v14 = 0;
    goto LABEL_27;
  }
  v14 = v11;
LABEL_12:
  COLogForCategory(5);
  v15 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
  {
    v31 = *(_QWORD *)(a1 + 32);
    v32 = *(_DWORD *)(a1 + 72);
    v33 = *(_QWORD *)(a1 + 56);
    *(_DWORD *)buf = 134218754;
    v42 = v31;
    v43 = 1024;
    *(_DWORD *)v44 = v32;
    *(_WORD *)&v44[4] = 2112;
    *(_QWORD *)&v44[6] = v33;
    v45 = 2112;
    v46 = v14;
    _os_log_error_impl(&dword_21214B000, v15, OS_LOG_TYPE_ERROR, "%p Failed to unarchive request ID %u received from member with snapshot %@. Error = %@", buf, 0x26u);
  }

  v16 = *(_QWORD *)(a1 + 64);
  v17 = (void *)MEMORY[0x24BDD1540];
  if (v12)
  {
    v39 = *MEMORY[0x24BDD1398];
    v40 = v14;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v40, &v39, 1);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v18 = 0;
  }
  objc_msgSend(v17, "errorWithDomain:code:userInfo:", CFSTR("COMessageChannelErrorDomain"), -1106, v18);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, _QWORD, _QWORD, void *))(v16 + 16))(v16, 0, 0, v28);

  if (v12)
LABEL_27:

}

void __93__COMessageChannel_receivedRequestWithPayload_payloadType_requestID_fromMember_withCallback___block_invoke_59(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  id v8;
  void *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  id v23;
  uint64_t v24;
  _QWORD v25[2];

  v25[1] = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  if (v5)
  {
    v23 = 0;
    objc_msgSend(MEMORY[0x24BDD1618], "archivedDataWithRootObject:requiringSecureCoding:error:", v5, 1, &v23);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v23;
    if (v8)
    {
      v9 = v8;
      COLogForCategory(5);
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
        __93__COMessageChannel_receivedRequestWithPayload_payloadType_requestID_fromMember_withCallback___block_invoke_59_cold_2();

      v11 = (void *)MEMORY[0x24BDD1540];
      v24 = *MEMORY[0x24BDD1398];
      v25[0] = v9;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v25, &v24, 1);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "errorWithDomain:code:userInfo:", CFSTR("COMessageChannelErrorDomain"), -1105, v12);
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v13)
        goto LABEL_14;
      goto LABEL_12;
    }
  }
  else
  {
    v7 = 0;
  }
  if ((unint64_t)objc_msgSend(v7, "length") <= *(_QWORD *)(a1 + 48))
  {
    v9 = 0;
LABEL_14:
    v21 = *(_QWORD *)(a1 + 40);
    objc_msgSend(*(id *)(a1 + 32), "_payloadTypeFromClass:", objc_opt_class());
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *, void *, id))(v21 + 16))(v21, v7, v22, v6);

    v13 = 0;
    goto LABEL_15;
  }
  COLogForCategory(5);
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    __93__COMessageChannel_receivedRequestWithPayload_payloadType_requestID_fromMember_withCallback___block_invoke_59_cold_1(a1, v14, v15, v16, v17, v18, v19, v20);

  objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("COMessageChannelErrorDomain"), -1103, 0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = 0;
  if (!v13)
    goto LABEL_14;
LABEL_12:
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
LABEL_15:
  objc_msgSend(*(id *)(a1 + 32), "_submitMetricsForResponse:size:withError:", v5, objc_msgSend(v7, "length"), v13);

}

- (void)receivedResponseForRequestID:(unsigned int)a3 responsePayload:(id)a4 responseType:(id)a5 responseError:(id)a6 fromMember:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  NSObject *workQueue;
  id v17;
  id v18;
  id v19;
  id v20;
  _QWORD v21[5];
  id v22;
  id v23;
  id v24;
  id v25;
  unsigned int v26;

  v12 = a4;
  v13 = a5;
  v14 = a6;
  v15 = a7;
  workQueue = self->_workQueue;
  v21[0] = MEMORY[0x24BDAC760];
  v21[1] = 3221225472;
  v21[2] = __103__COMessageChannel_receivedResponseForRequestID_responsePayload_responseType_responseError_fromMember___block_invoke;
  v21[3] = &unk_24CD3FD28;
  v26 = a3;
  v21[4] = self;
  v22 = v14;
  v23 = v15;
  v24 = v12;
  v25 = v13;
  v17 = v13;
  v18 = v12;
  v19 = v15;
  v20 = v14;
  dispatch_async(workQueue, v21);

}

void __103__COMessageChannel_receivedResponseForRequestID_responsePayload_responseType_responseError_fromMember___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  NSObject *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  id v23;
  uint8_t buf[4];
  uint64_t v25;
  __int16 v26;
  uint64_t v27;
  __int16 v28;
  void *v29;
  uint64_t v30;
  id v31;
  const __CFString *v32;
  _QWORD v33[2];

  v33[1] = *MEMORY[0x24BDAC8D0];
  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 88);
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", *(unsigned int *)(a1 + 72));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (*(_QWORD *)(a1 + 40))
  {
    objc_msgSend(*(id *)(a1 + 32), "_invokeResponseCallbackForInfo:snapshot:response:error:", v4, *(_QWORD *)(a1 + 48), 0);
    goto LABEL_15;
  }
  if (*(_QWORD *)(a1 + 56) && *(_QWORD *)(a1 + 64))
  {
    v5 = objc_msgSend(*(id *)(a1 + 32), "_payloadClassFromType:");
    if (v5)
    {
      v6 = *(_QWORD *)(a1 + 56);
      v23 = 0;
      objc_msgSend(MEMORY[0x24BDD1620], "unarchivedObjectOfClass:fromData:error:", v5, v6, &v23);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = v23;
      if (!v8)
        goto LABEL_9;
LABEL_11:
      v13 = (void *)MEMORY[0x24BDD1540];
      v30 = *MEMORY[0x24BDD1398];
      v31 = v8;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v31, &v30, 1);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "errorWithDomain:code:userInfo:", CFSTR("COMessageChannelErrorDomain"), -1107, v14);
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      COLogForCategory(5);
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
        v21 = *(_QWORD *)(a1 + 32);
        v22 = *(_QWORD *)(a1 + 64);
        *(_DWORD *)buf = 134218498;
        v25 = v21;
        v26 = 2112;
        v27 = v22;
        v28 = 2112;
        v29 = v9;
        _os_log_error_impl(&dword_21214B000, v15, OS_LOG_TYPE_ERROR, "%p Failed to unarchive response of type %@. Error = %@", buf, 0x20u);
      }

      goto LABEL_14;
    }
    v10 = (void *)MEMORY[0x24BDD1540];
    v11 = *(_QWORD *)(a1 + 64);
    v32 = CFSTR("COMessageChannelUnknownClassErrorKey");
    v33[0] = v11;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v33, &v32, 1);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "errorWithDomain:code:userInfo:", CFSTR("COMessageChannelErrorDomain"), -1108, v12);
    v8 = (id)objc_claimAutoreleasedReturnValue();

    v7 = 0;
    if (v8)
      goto LABEL_11;
  }
  else
  {
    v7 = 0;
  }
LABEL_9:
  v9 = 0;
LABEL_14:
  objc_msgSend(*(id *)(a1 + 32), "_invokeResponseCallbackForInfo:snapshot:response:error:", v4, *(_QWORD *)(a1 + 48), v7, v9);

LABEL_15:
  v16 = objc_msgSend(v4, "receivedResponses") + 1;
  objc_msgSend(v4, "setReceivedResponses:", v16);
  if (v16 == objc_msgSend(v4, "expectedRecipients"))
  {
    v17 = *(void **)(*(_QWORD *)(a1 + 32) + 88);
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", *(unsigned int *)(a1 + 72));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "removeObjectForKey:", v18);

    v19 = *(void **)(a1 + 32);
    objc_msgSend(v4, "request");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "_submitMetricsForRequest:withRequestInfo:withError:", v20, v4, 0);

  }
}

- (void)receivedRecipientListForRequestID:(unsigned int)a3 recipients:(id)a4
{
  id v6;
  NSObject *workQueue;
  id v8;
  _QWORD block[5];
  id v10;
  unsigned int v11;

  v6 = a4;
  workQueue = self->_workQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __65__COMessageChannel_receivedRecipientListForRequestID_recipients___block_invoke;
  block[3] = &unk_24CD3FCB0;
  v11 = a3;
  block[4] = self;
  v10 = v6;
  v8 = v6;
  dispatch_async(workQueue, block);

}

void __65__COMessageChannel_receivedRecipientListForRequestID_recipients___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  NSObject *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  int v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  int v14;
  uint64_t v15;
  __int16 v16;
  void *v17;
  __int16 v18;
  uint64_t v19;
  __int16 v20;
  int v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 88);
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", *(unsigned int *)(a1 + 48));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  COLogForCategory(5);
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v7 = *(_QWORD *)(a1 + 32);
    v6 = *(void **)(a1 + 40);
    v8 = objc_msgSend(v6, "count");
    v9 = *(_DWORD *)(a1 + 48);
    v14 = 134218754;
    v15 = v7;
    v16 = 2112;
    v17 = v6;
    v18 = 2048;
    v19 = v8;
    v20 = 1024;
    v21 = v9;
    _os_log_impl(&dword_21214B000, v5, OS_LOG_TYPE_DEFAULT, "%p Received a recipient list %@ with count %lu for request ID %u", (uint8_t *)&v14, 0x26u);
  }

  objc_msgSend(v4, "setExpectedRecipients:", objc_msgSend(*(id *)(a1 + 40), "count"));
  v10 = *(void **)(*(_QWORD *)(a1 + 32) + 88);
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", objc_msgSend(v4, "requestID"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setObject:forKey:", v4, v11);

  objc_msgSend(v4, "recipientCallback");
  v12 = objc_claimAutoreleasedReturnValue();
  v13 = (void *)v12;
  if (v12)
    (*(void (**)(uint64_t, _QWORD, _QWORD))(v12 + 16))(v12, *(_QWORD *)(a1 + 40), 0);

}

- (unsigned)_generateRequestID
{
  unsigned int result;

  dispatch_assert_queue_V2((dispatch_queue_t)self->_workQueue);
  result = self->_baseRequestID;
  self->_baseRequestID = result + 1;
  return result;
}

- (id)_payloadTypeFromClass:(Class)a3
{
  if (!a3)
    return 0;
  NSStringFromClass(a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (Class)_payloadClassFromType:(id)a3
{
  return NSClassFromString((NSString *)a3);
}

- (void)_withLock:(id)a3
{
  os_unfair_lock_s *p_lock;
  void (**v4)(_QWORD);

  p_lock = &self->_lock;
  v4 = (void (**)(_QWORD))a3;
  os_unfair_lock_lock(p_lock);
  v4[2](v4);

  os_unfair_lock_unlock(p_lock);
}

- (void)_sendRequest:(id)a3 type:(id)a4 members:(id)a5 withCompletionHandler:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void (**v14)(_QWORD, _QWORD, _QWORD, _QWORD);
  void *v15;
  char isKindOfClass;
  void *v17;
  void *v18;
  char v19;
  void *v20;
  uint64_t v21;
  void *v22;
  id v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  NSObject *v28;
  NSObject *v29;
  unint64_t v30;
  NSObject *v31;
  id v32;
  id v33;
  uint64_t v34;
  COMessageChannelRequestInfo *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  __CFString **v42;
  __CFString *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  unint64_t v49;
  __CFString **v50;
  uint64_t v51;
  NSMutableDictionary *outstandingRequests;
  void *v53;
  void *v54;
  void *v55;
  NSObject *v56;
  void *v57;
  void *v58;
  COMessageChannelRequestInfo *v59;
  unsigned int v60;
  _QWORD v61[5];
  id v62;
  id v63;
  id v64;
  uint8_t buf[4];
  COMessageChannel *v66;
  __int16 v67;
  void *v68;
  __int16 v69;
  unsigned int v70;
  uint64_t v71;
  _QWORD v72[3];

  v72[1] = *MEMORY[0x24BDAC8D0];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v14 = (void (**)(_QWORD, _QWORD, _QWORD, _QWORD))v13;
  if (!self->_activated)
  {
    v20 = (void *)MEMORY[0x24BDD1540];
    v21 = -1110;
    goto LABEL_8;
  }
  if (!v13)
  {
    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("COMessageChannelErrorDomain"), -1116, 0);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    COLogForCategory(5);
    v29 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
      -[COMessageChannel _sendRequest:type:members:withCompletionHandler:].cold.1();

    goto LABEL_16;
  }
  if (v12)
    goto LABEL_9;
  -[COMessageChannel cluster](self, "cluster");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) == 0
    || (-[COMessageChannel cluster](self, "cluster"),
        v17 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v17, "configuration"),
        v18 = (void *)objc_claimAutoreleasedReturnValue(),
        v19 = objc_msgSend(v18, "options"),
        v18,
        v17,
        (v19 & 1) != 0))
  {
LABEL_9:
    v64 = 0;
    objc_msgSend(MEMORY[0x24BDD1618], "archivedDataWithRootObject:requiringSecureCoding:error:", v10, 1, &v64);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = v64;
    if (v23)
    {
      v24 = v23;
      v25 = (void *)MEMORY[0x24BDD1540];
      v71 = *MEMORY[0x24BDD1398];
      v72[0] = v23;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v72, &v71, 1);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "errorWithDomain:code:userInfo:", CFSTR("COMessageChannelErrorDomain"), -1104, v26);
      v27 = (void *)objc_claimAutoreleasedReturnValue();

      COLogForCategory(5);
      v28 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
        -[COMessageChannel _sendRequest:type:members:withCompletionHandler:].cold.3();

LABEL_21:
      ((void (**)(_QWORD, _QWORD, _QWORD, void *))v14)[2](v14, 0, 0, v27);
      -[COMessageChannel _submitMetricsForRequest:withRequestInfo:withError:](self, "_submitMetricsForRequest:withRequestInfo:withError:", v10, 0, v27);
LABEL_22:

      goto LABEL_23;
    }
    v30 = objc_msgSend(v22, "length");
    if (v30 > -[COMessageChannel sendLimit](self, "sendLimit"))
    {
      COLogForCategory(5);
      v31 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
        -[COMessageChannel _sendRequest:type:members:withCompletionHandler:].cold.2();

      objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("COMessageChannelErrorDomain"), -1102, 0);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_21;
    }
    v61[0] = MEMORY[0x24BDAC760];
    v61[1] = 3221225472;
    v61[2] = __68__COMessageChannel__sendRequest_type_members_withCompletionHandler___block_invoke;
    v61[3] = &unk_24CD3FD50;
    v32 = v14;
    v63 = v32;
    v61[4] = self;
    v33 = v10;
    v62 = v33;
    -[COMessageChannel _remoteInterfaceWithErrorHandler:](self, "_remoteInterfaceWithErrorHandler:", v61);
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    v34 = -[COMessageChannel _generateRequestID](self, "_generateRequestID");
    v60 = v34;
    v58 = v33;
    v35 = -[COMessageChannelRequestInfo initWithRequestID:type:request:]([COMessageChannelRequestInfo alloc], "initWithRequestID:type:request:", v34, 0, v33);
    -[COMessageChannelRequestInfo setMessageSize:](v35, "setMessageSize:", objc_msgSend(v22, "length"));
    -[COMessageChannelRequestInfo setResponseCallback:](v35, "setResponseCallback:", v32);
    v59 = v35;
    if (v12)
    {
      -[COMessageChannelRequestInfo setExpectedRecipients:](v35, "setExpectedRecipients:", objc_msgSend(v12, "count"));
      if (objc_msgSend(v12, "count") != 1)
        goto LABEL_31;
      -[COMessageChannel roleSnapshotsCache](self, "roleSnapshotsCache");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "allObjects");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v37, "firstObject");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v36, "objectForKey:", v38);
      v39 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v39, "role");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      +[COClusterRole roleForCoordinator](COClusterRole, "roleForCoordinator");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(v38) = objc_msgSend(v40, "satisfiesRole:", v41);

      v42 = COMessagingTypeAdHocSingle;
      if ((_DWORD)v38)
        v42 = COMessagingTypeAdHocLeader;
      v43 = *v42;

      v35 = v59;
    }
    else
    {
      -[COMessageChannelRequestInfo setExpectedRecipients:](v35, "setExpectedRecipients:", 1);
      v43 = CFSTR("coordinator");
    }
    if (v43)
    {
LABEL_37:
      -[COMessageChannelRequestInfo setDestinationInfo:](v35, "setDestinationInfo:", v43);
      outstandingRequests = self->_outstandingRequests;
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", v60);
      v53 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableDictionary setObject:forKey:](outstandingRequests, "setObject:forKey:", v35, v53);

      objc_msgSend(v58, "networkActivity");
      v54 = (void *)objc_claimAutoreleasedReturnValue();
      if (v54)
        v55 = (void *)nw_activity_copy_xpc_token();
      else
        v55 = 0;
      COLogForCategory(5);
      v56 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v56, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134218496;
        v66 = self;
        v67 = 2048;
        v68 = v58;
        v69 = 1024;
        v70 = v60;
        _os_log_impl(&dword_21214B000, v56, OS_LOG_TYPE_DEFAULT, "%p sending request %p with id '%u'", buf, 0x1Cu);
      }

      objc_msgSend(v57, "sendRequestWithPayload:payloadType:requestType:requestID:members:activityToken:", v22, v11, 0, v60, v12, v55);
      v27 = v63;
      goto LABEL_22;
    }
LABEL_31:
    v44 = (void *)MEMORY[0x24BDBCEF0];
    -[COMessageChannel roleSnapshotsCache](self, "roleSnapshotsCache");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v45, "allKeys");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v44, "setWithArray:", v46);
    v47 = (void *)objc_claimAutoreleasedReturnValue();

    +[COClusterMember memberForCurrentDevice](COClusterMember, "memberForCurrentDevice");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v47, "addObject:", v48);

    v49 = objc_msgSend(v12, "count");
    if (v49 <= objc_msgSend(v47, "count"))
    {
      v51 = objc_msgSend(v12, "count");
      v50 = COMessagingTypeAdHocSubset;
      if (v51 == objc_msgSend(v47, "count"))
      {
        objc_msgSend(v47, "minusSet:", v12);
        if (!objc_msgSend(v47, "count"))
          v50 = COMessagingTypeAdHocEntireCluster;
      }
    }
    else
    {
      v50 = COMessagingTypeAdHocSuperset;
    }
    v43 = *v50;

    v35 = v59;
    goto LABEL_37;
  }
  v20 = (void *)MEMORY[0x24BDD1540];
  v21 = -1111;
LABEL_8:
  objc_msgSend(v20, "errorWithDomain:code:userInfo:", CFSTR("COMessageChannelErrorDomain"), v21, 0);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  ((void (**)(_QWORD, _QWORD, _QWORD, void *))v14)[2](v14, 0, 0, v22);
LABEL_16:
  -[COMessageChannel _submitMetricsForRequest:withRequestInfo:withError:](self, "_submitMetricsForRequest:withRequestInfo:withError:", v10, 0, v22);
LABEL_23:

}

void __68__COMessageChannel__sendRequest_type_members_withCompletionHandler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  void (*v4)(uint64_t, _QWORD, _QWORD, id);
  id v5;

  v3 = *(_QWORD *)(a1 + 48);
  v4 = *(void (**)(uint64_t, _QWORD, _QWORD, id))(v3 + 16);
  v5 = a2;
  v4(v3, 0, 0, v5);
  objc_msgSend(*(id *)(a1 + 32), "_submitMetricsForRequest:withRequestInfo:withError:", *(_QWORD *)(a1 + 40), 0, v5);

}

- (void)_broadcastRequest:(id)a3 type:(id)a4 recipientsCallback:(id)a5 responseCompletionHandler:(id)a6
{
  id v10;
  id v11;
  void (**v12)(id, _QWORD, void *);
  id v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  NSObject *v21;
  NSObject *v22;
  unint64_t v23;
  NSObject *v24;
  void (**v25)(id, _QWORD, void *);
  id v26;
  uint64_t v27;
  COMessageChannelRequestInfo *v28;
  NSMutableDictionary *outstandingRequests;
  void *v30;
  void *v31;
  NSObject *v32;
  void *v33;
  void *v34;
  unsigned int v35;
  _QWORD v36[5];
  id v37;
  id v38;
  id v39;
  uint8_t buf[4];
  COMessageChannel *v41;
  __int16 v42;
  id v43;
  __int16 v44;
  unsigned int v45;
  uint64_t v46;
  _QWORD v47[3];

  v47[1] = *MEMORY[0x24BDAC8D0];
  v10 = a3;
  v11 = a4;
  v12 = (void (**)(id, _QWORD, void *))a5;
  v13 = a6;
  v14 = v13;
  if (!self->_activated)
  {
    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("COMessageChannelErrorDomain"), -1110, 0);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_11:
    v12[2](v12, 0, v15);
    goto LABEL_12;
  }
  if (v13)
  {
    v39 = 0;
    objc_msgSend(MEMORY[0x24BDD1618], "archivedDataWithRootObject:requiringSecureCoding:error:", v10, 1, &v39);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = v39;
    if (v16)
    {
      v17 = v16;
      v18 = (void *)MEMORY[0x24BDD1540];
      v46 = *MEMORY[0x24BDD1398];
      v47[0] = v16;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v47, &v46, 1);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "errorWithDomain:code:userInfo:", CFSTR("COMessageChannelErrorDomain"), -1104, v19);
      v20 = (void *)objc_claimAutoreleasedReturnValue();

      COLogForCategory(5);
      v21 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
        -[COMessageChannel _sendRequest:type:members:withCompletionHandler:].cold.3();

    }
    else
    {
      v23 = objc_msgSend(v15, "length");
      if (v23 <= -[COMessageChannel sendLimit](self, "sendLimit"))
      {
        v36[0] = MEMORY[0x24BDAC760];
        v36[1] = 3221225472;
        v36[2] = __88__COMessageChannel__broadcastRequest_type_recipientsCallback_responseCompletionHandler___block_invoke;
        v36[3] = &unk_24CD3FD50;
        v25 = v12;
        v38 = v25;
        v36[4] = self;
        v26 = v10;
        v37 = v26;
        -[COMessageChannel _remoteInterfaceWithErrorHandler:](self, "_remoteInterfaceWithErrorHandler:", v36);
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        v27 = -[COMessageChannel _generateRequestID](self, "_generateRequestID");
        v28 = -[COMessageChannelRequestInfo initWithRequestID:type:request:]([COMessageChannelRequestInfo alloc], "initWithRequestID:type:request:", v27, 1, v26);
        -[COMessageChannelRequestInfo setMessageSize:](v28, "setMessageSize:", objc_msgSend(v15, "length"));
        -[COMessageChannelRequestInfo setRecipientCallback:](v28, "setRecipientCallback:", v25);
        -[COMessageChannelRequestInfo setResponseCallback:](v28, "setResponseCallback:", v14);
        -[COMessageChannelRequestInfo setDestinationInfo:](v28, "setDestinationInfo:", 0x24CD41510);
        outstandingRequests = self->_outstandingRequests;
        v35 = v27;
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", v27);
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSMutableDictionary setObject:forKey:](outstandingRequests, "setObject:forKey:", v28, v30);

        objc_msgSend(v26, "networkActivity");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        if (v31)
          v33 = (void *)nw_activity_copy_xpc_token();
        else
          v33 = 0;
        COLogForCategory(5);
        v32 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 134218496;
          v41 = self;
          v42 = 2048;
          v43 = v26;
          v44 = 1024;
          v45 = v35;
          _os_log_impl(&dword_21214B000, v32, OS_LOG_TYPE_DEFAULT, "%p broadcasting request %p with id '%u'", buf, 0x1Cu);
        }

        objc_msgSend(v34, "sendRequestWithPayload:payloadType:requestType:requestID:members:activityToken:", v15, v11, 1, v35, 0, v33);
        v20 = v38;
        goto LABEL_18;
      }
      COLogForCategory(5);
      v24 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
        -[COMessageChannel _sendRequest:type:members:withCompletionHandler:].cold.2();

      objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("COMessageChannelErrorDomain"), -1102, 0);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v12[2](v12, 0, v20);
    -[COMessageChannel _submitMetricsForRequest:withRequestInfo:withError:](self, "_submitMetricsForRequest:withRequestInfo:withError:", v10, 0, v20);
LABEL_18:

    goto LABEL_19;
  }
  objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("COMessageChannelErrorDomain"), -1116, 0);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  COLogForCategory(5);
  v22 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    -[COMessageChannel _broadcastRequest:type:recipientsCallback:responseCompletionHandler:].cold.1();

  if (v12)
    goto LABEL_11;
LABEL_12:
  -[COMessageChannel _submitMetricsForRequest:withRequestInfo:withError:](self, "_submitMetricsForRequest:withRequestInfo:withError:", v10, 0, v15);
LABEL_19:

}

void __88__COMessageChannel__broadcastRequest_type_recipientsCallback_responseCompletionHandler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  void (*v4)(uint64_t, _QWORD, id);
  id v5;

  v3 = *(_QWORD *)(a1 + 48);
  v4 = *(void (**)(uint64_t, _QWORD, id))(v3 + 16);
  v5 = a2;
  v4(v3, 0, v5);
  objc_msgSend(*(id *)(a1 + 32), "_submitMetricsForRequest:withRequestInfo:withError:", *(_QWORD *)(a1 + 40), 0, v5);

}

- (void)_activateWithCompletion:(id)a3
{
  id v4;
  uint64_t v5;
  id v6;
  void *v7;
  void *v8;
  char v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  void *v16;
  _QWORD v17[5];
  id v18;
  id v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _QWORD v24[4];
  id v25;
  id v26;
  id location;
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_initWeak(&location, self);
  v5 = MEMORY[0x24BDAC760];
  v24[0] = MEMORY[0x24BDAC760];
  v24[1] = 3221225472;
  v24[2] = __44__COMessageChannel__activateWithCompletion___block_invoke;
  v24[3] = &unk_24CD3F010;
  objc_copyWeak(&v26, &location);
  v6 = v4;
  v25 = v6;
  -[COMessageChannel _remoteInterfaceWithErrorHandler:](self, "_remoteInterfaceWithErrorHandler:", v24);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!self->_activated
    || (-[COMessageChannel lastConnection](self, "lastConnection"),
        v8 = (void *)objc_claimAutoreleasedReturnValue(),
        v9 = objc_msgSend(v8, "activated"),
        v8,
        (v9 & 1) == 0))
  {
    objc_msgSend(MEMORY[0x24BDBCEF0], "set");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = 0u;
    v23 = 0u;
    v20 = 0u;
    v21 = 0u;
    -[COMessageChannel requestHandlers](self, "requestHandlers");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v20, v28, 16);
    if (v12)
    {
      v13 = *(_QWORD *)v21;
      do
      {
        for (i = 0; i != v12; ++i)
        {
          if (*(_QWORD *)v21 != v13)
            objc_enumerationMutation(v11);
          objc_msgSend(v10, "addObject:", *(_QWORD *)(*((_QWORD *)&v20 + 1) + 8 * i));
        }
        v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v20, v28, 16);
      }
      while (v12);
    }

    -[COMessageChannel topic](self, "topic");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[COMessageChannel cluster](self, "cluster");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17[0] = v5;
    v17[1] = 3221225472;
    v17[2] = __44__COMessageChannel__activateWithCompletion___block_invoke_66;
    v17[3] = &unk_24CD3FDA0;
    objc_copyWeak(&v19, &location);
    v17[4] = self;
    v18 = v6;
    objc_msgSend(v7, "activateMessageChannelForTopic:cluster:handlers:withCompletion:", v15, v16, v10, v17);

    objc_destroyWeak(&v19);
  }

  objc_destroyWeak(&v26);
  objc_destroyWeak(&location);

}

void __44__COMessageChannel__activateWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  NSObject *v5;

  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    COLogForCategory(5);
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      __44__COMessageChannel__activateWithCompletion___block_invoke_cold_1();

    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
    objc_msgSend(WeakRetained, "_submitMetricsForActivationCompletionWithError:", v3);
  }

}

void __44__COMessageChannel__activateWithCompletion___block_invoke_66(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  id v7;
  NSObject **WeakRetained;
  NSObject **v9;
  NSObject *v10;
  id v11;
  _QWORD v12[4];
  id v13;
  NSObject **v14;
  uint64_t v15;
  id v16;
  uint64_t v17;
  uint64_t v18;

  v7 = a2;
  WeakRetained = (NSObject **)objc_loadWeakRetained((id *)(a1 + 48));
  v9 = WeakRetained;
  if (WeakRetained)
  {
    v10 = WeakRetained[13];
    v12[0] = MEMORY[0x24BDAC760];
    v12[1] = 3221225472;
    v12[2] = __44__COMessageChannel__activateWithCompletion___block_invoke_2;
    v12[3] = &unk_24CD3FD78;
    v13 = v7;
    v14 = v9;
    v17 = a3;
    v18 = a4;
    v11 = *(id *)(a1 + 40);
    v15 = *(_QWORD *)(a1 + 32);
    v16 = v11;
    dispatch_async(v10, v12);

  }
}

void __44__COMessageChannel__activateWithCompletion___block_invoke_2(uint64_t a1)
{
  void *v2;
  id *v3;
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  uint64_t v15;
  NSObject *v16;
  const __CFString *v17;
  void *v18;
  const __CFString *v19;
  _QWORD v20[2];

  v20[1] = *MEMORY[0x24BDAC8D0];
  v3 = (id *)(a1 + 32);
  v2 = *(void **)(a1 + 32);
  if (!v2)
  {
    *(_BYTE *)(*(_QWORD *)(a1 + 40) + 8) = 1;
    objc_msgSend(*(id *)(a1 + 40), "lastConnection");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setActivated:", 1);

    v4 = 0;
    goto LABEL_15;
  }
  v4 = v2;
  objc_msgSend(*v3, "domain");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v5, "isEqualToString:", CFSTR("COMessageChannelErrorDomain")))
    goto LABEL_11;
  v6 = objc_msgSend(*v3, "code");

  if (v6 == -1100)
  {
    objc_msgSend(*v3, "userInfo");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "objectForKey:", CFSTR("COMessageChannelFailedRequestHandlerErrorKey"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v7, "hasPrefix:", CFSTR("SessionProducer+")))
    {
      objc_msgSend(v7, "_sessionProducerSubTopic");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = (void *)MEMORY[0x24BDD1540];
      v19 = CFSTR("COMessageChannelDuplicateSessionProducerKey");
      v20[0] = v8;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v20, &v19, 1);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = v9;
      v12 = -1112;
    }
    else
    {
      if (!objc_msgSend(v7, "hasPrefix:", CFSTR("SessionConsumer+")))
      {
LABEL_10:

LABEL_11:
        goto LABEL_12;
      }
      objc_msgSend(v7, "_sessionConsumerSubTopic");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = (void *)MEMORY[0x24BDD1540];
      v17 = CFSTR("COMessageChannelDuplicateSessionConsumerKey");
      v18 = v8;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v18, &v17, 1);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = v14;
      v12 = -1113;
    }
    objc_msgSend(v11, "errorWithDomain:code:userInfo:", CFSTR("COMessageChannelErrorDomain"), v12, v10);
    v15 = objc_claimAutoreleasedReturnValue();

    v4 = (id)v15;
    goto LABEL_10;
  }
LABEL_12:
  COLogForCategory(5);
  v16 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    __44__COMessageChannel__activateWithCompletion___block_invoke_2_cold_1();

LABEL_15:
  objc_msgSend(*(id *)(a1 + 40), "setSendLimit:", *(_QWORD *)(a1 + 64));
  objc_msgSend(*(id *)(a1 + 40), "setReceiveLimit:", *(_QWORD *)(a1 + 72));
  (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
  if (!v4)
    objc_msgSend(*(id *)(a1 + 48), "_setupClusterMonitor");
  objc_msgSend(*(id *)(a1 + 40), "_submitMetricsForActivationCompletionWithError:", v4);
  objc_msgSend(*(id *)(a1 + 48), "_callbackProducersAndConsumersAfterActivationWithError:", v4);

}

- (id)_remoteInterfaceWithErrorHandler:(id)a3
{
  id v4;
  id v5;
  id v6;
  _QWORD v8[5];
  id v9;
  _QWORD *v10;
  uint64_t *v11;
  _QWORD v12[5];
  id v13;
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t (*v17)(uint64_t, uint64_t);
  void (*v18)(uint64_t);
  id v19;

  v4 = a3;
  v14 = 0;
  v15 = &v14;
  v16 = 0x3032000000;
  v17 = __Block_byref_object_copy__4;
  v18 = __Block_byref_object_dispose__4;
  v19 = 0;
  v12[0] = 0;
  v12[1] = v12;
  v12[2] = 0x3032000000;
  v12[3] = __Block_byref_object_copy__4;
  v12[4] = __Block_byref_object_dispose__4;
  v13 = 0;
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __53__COMessageChannel__remoteInterfaceWithErrorHandler___block_invoke;
  v8[3] = &unk_24CD3FDC8;
  v10 = v12;
  v11 = &v14;
  v8[4] = self;
  v5 = v4;
  v9 = v5;
  -[COMessageChannel _withLock:](self, "_withLock:", v8);
  v6 = (id)v15[5];

  _Block_object_dispose(v12, 8);
  _Block_object_dispose(&v14, 8);

  return v6;
}

void __53__COMessageChannel__remoteInterfaceWithErrorHandler___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  COMessageChannelClientInterfaceMediator *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  COMessageChannelClientInterfaceMediator *v20;
  void *v21;
  uint64_t v22;
  id v23;
  void *v24;
  id v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  void *v29;
  _QWORD v30[4];
  id v31;
  id v32;
  _QWORD v33[4];
  id v34;
  id v35;
  id location[2];

  objc_msgSend(*(id *)(a1 + 32), "provider");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "messageChannelServiceConnection");
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

  v6 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40);
  objc_msgSend(*(id *)(a1 + 32), "lastConnection");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6 != v7)
  {
    v8 = (void *)MEMORY[0x24BDD1990];
    v9 = &unk_254B4A8C0;
    objc_msgSend(v8, "interfaceWithProtocol:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = -[COMessageChannelClientInterfaceMediator initWithMessageChannel:]([COMessageChannelClientInterfaceMediator alloc], "initWithMessageChannel:", *(_QWORD *)(a1 + 32));
    v12 = (void *)MEMORY[0x24BDBCF20];
    v13 = objc_opt_class();
    objc_msgSend(v12, "setWithObjects:", v13, objc_opt_class(), 0);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setClasses:forSelector:argumentIndex:ofReply:", v14, sel_receivedRecipientListForRequestID_recipients_, 1, 0);
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "setExportedInterface:", v10);
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "setExportedObject:", v11);
    v15 = &unk_254B4FA98;

    objc_msgSend(MEMORY[0x24BDD1990], "interfaceWithProtocol:", v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    +[COCluster _allowedClusterClasses](COCluster, "_allowedClusterClasses");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setClasses:forSelector:argumentIndex:ofReply:", v17, sel_activateMessageChannelForTopic_cluster_handlers_withCompletion_, 1, 0);

    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "setRemoteObjectInterface:", v16);
    objc_initWeak(location, *(id *)(a1 + 32));
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "interruptionHandler");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "invalidationHandler");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "setInterruptionHandler:", v18);
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "setInvalidationHandler:", v19);
    v29 = v15;
    v20 = v11;
    v21 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40);
    v22 = MEMORY[0x24BDAC760];
    v33[0] = MEMORY[0x24BDAC760];
    v33[1] = 3221225472;
    v33[2] = __53__COMessageChannel__remoteInterfaceWithErrorHandler___block_invoke_2;
    v33[3] = &unk_24CD3F498;
    v23 = v18;
    v34 = v23;
    objc_copyWeak(&v35, location);
    objc_msgSend(v21, "setInterruptionHandler:", v33);
    v24 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40);
    v30[0] = v22;
    v30[1] = 3221225472;
    v30[2] = __53__COMessageChannel__remoteInterfaceWithErrorHandler___block_invoke_139;
    v30[3] = &unk_24CD3F498;
    v25 = v19;
    v31 = v25;
    objc_copyWeak(&v32, location);
    objc_msgSend(v24, "setInvalidationHandler:", v30);
    objc_msgSend(*(id *)(a1 + 32), "setLastConnection:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40));
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "resume");
    objc_destroyWeak(&v32);

    objc_destroyWeak(&v35);
    objc_destroyWeak(location);

  }
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "remoteObjectProxyWithErrorHandler:", *(_QWORD *)(a1 + 40));
  v26 = objc_claimAutoreleasedReturnValue();
  v27 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
  v28 = *(void **)(v27 + 40);
  *(_QWORD *)(v27 + 40) = v26;

}

void __53__COMessageChannel__remoteInterfaceWithErrorHandler___block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  id WeakRetained;
  NSObject *v4;

  v2 = *(_QWORD *)(a1 + 32);
  if (v2)
    (*(void (**)(void))(v2 + 16))();
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    COLogForCategory(5);
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      __53__COMessageChannel__remoteInterfaceWithErrorHandler___block_invoke_2_cold_1();

    objc_msgSend(WeakRetained, "_lostConnectionToService");
  }

}

void __53__COMessageChannel__remoteInterfaceWithErrorHandler___block_invoke_139(uint64_t a1)
{
  uint64_t v2;
  id WeakRetained;
  NSObject *v4;

  v2 = *(_QWORD *)(a1 + 32);
  if (v2)
    (*(void (**)(void))(v2 + 16))();
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    COLogForCategory(5);
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      __53__COMessageChannel__remoteInterfaceWithErrorHandler___block_invoke_139_cold_1();

    objc_msgSend(WeakRetained, "_lostConnectionToService");
  }

}

- (void)_lostConnectionToService
{
  NSObject *workQueue;
  _QWORD v4[4];
  id v5;
  id location;

  objc_initWeak(&location, self);
  workQueue = self->_workQueue;
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __44__COMessageChannel__lostConnectionToService__block_invoke;
  v4[3] = &unk_24CD3F538;
  objc_copyWeak(&v5, &location);
  dispatch_async(workQueue, v4);
  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

void __44__COMessageChannel__lostConnectionToService__block_invoke(uint64_t a1)
{
  _BYTE *WeakRetained;
  void *v2;
  _QWORD v3[5];

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = WeakRetained;
  if (WeakRetained && WeakRetained[8])
  {
    v3[0] = MEMORY[0x24BDAC760];
    v3[1] = 3221225472;
    v3[2] = __44__COMessageChannel__lostConnectionToService__block_invoke_2;
    v3[3] = &unk_24CD3FDF0;
    v3[4] = WeakRetained;
    objc_msgSend(WeakRetained, "_activateWithCompletion:", v3);
  }

}

void __44__COMessageChannel__lostConnectionToService__block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  NSObject *v5;
  uint64_t v6;
  int v7;
  uint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  COLogForCategory(5);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      __44__COMessageChannel__lostConnectionToService__block_invoke_2_cold_1();

    objc_msgSend(*(id *)(a1 + 32), "_lostConnectionToService");
  }
  else
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      v6 = *(_QWORD *)(a1 + 32);
      v7 = 134217984;
      v8 = v6;
      _os_log_impl(&dword_21214B000, v5, OS_LOG_TYPE_DEFAULT, "Successfully re-established connection to the service for %p", (uint8_t *)&v7, 0xCu);
    }

  }
}

- (void)_invokeResponseCallbackForInfo:(id)a3 snapshot:(id)a4 response:(id)a5 error:(id)a6
{
  id v9;
  id v10;
  id v11;
  id v12;
  void *v13;
  void (**v14)(_QWORD, _QWORD, _QWORD, _QWORD);
  NSObject *v15;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v12 = a6;
  objc_msgSend(v9, "responseCallback");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v13)
  {
    objc_msgSend(v9, "responseCallback");
    v14 = (void (**)(_QWORD, _QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, id, id, id))v14)[2](v14, v10, v11, v12);

  }
  else
  {
    COLogForCategory(5);
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      -[COMessageChannel _invokeResponseCallbackForInfo:snapshot:response:error:].cold.1();

  }
}

- (void)_handleStartCommand:(id)a3 withMember:(id)a4 callback:(id)a5
{
  id v8;
  void (**v9)(id, COMessageSessionManagementResponse *, _QWORD);
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  id v15;
  objc_class *v16;
  id v17;
  void *v18;
  void *v19;
  COMessageConsumedSession *v20;
  NSObject *v21;
  COMessageSessionManagementResponse *v22;
  void *v23;
  void *v24;
  COMessageConsumedSession *v25;
  void *v26;
  NSObject *v27;
  void *v28;
  COMessageSessionManagementResponse *v29;
  void *v30;
  NSObject *queue;
  void *v32;
  void *v33;
  id v34;
  _QWORD block[4];
  id v36;
  id v37;
  id v38;
  id v39;
  COMessageChannel *v40;
  COMessageConsumedSession *v41;
  void (**v42)(id, COMessageSessionManagementResponse *, _QWORD);
  id v43;
  id location;
  id v45;
  uint8_t buf[4];
  void *v47;
  __int16 v48;
  void *v49;
  __int16 v50;
  void *v51;
  uint64_t v52;
  id v53;
  const __CFString *v54;
  _QWORD v55[3];

  v55[1] = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v34 = a4;
  v9 = (void (**)(id, COMessageSessionManagementResponse *, _QWORD))a5;
  objc_msgSend(v8, "subTopic");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  -[COMessageChannel sessionConsumers](self, "sessionConsumers");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "objectForKey:", v32);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "delegate");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "delegateQueue");
  queue = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "payload");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "payloadType");
  v13 = objc_claimAutoreleasedReturnValue();
  v14 = (void *)v13;
  v15 = 0;
  if (v12 && v13)
  {
    v16 = -[COMessageChannel _payloadClassFromType:](self, "_payloadClassFromType:", v13);
    if (v16)
    {
      v45 = 0;
      objc_msgSend(MEMORY[0x24BDD1620], "unarchivedObjectOfClass:fromData:error:", v16, v12, &v45);
      v15 = (id)objc_claimAutoreleasedReturnValue();
      v17 = v45;
      if (v17)
      {
LABEL_5:
        v18 = (void *)MEMORY[0x24BDD1540];
        v52 = *MEMORY[0x24BDD1398];
        v53 = v17;
        objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v53, &v52, 1);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "errorWithDomain:code:userInfo:", CFSTR("COMessageSessionErrorDomain"), -1206, v19);
        v20 = (COMessageConsumedSession *)objc_claimAutoreleasedReturnValue();

        COLogForCategory(6);
        v21 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
        {
          objc_msgSend(v34, "member");
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412802;
          v47 = v11;
          v48 = 2112;
          v49 = v14;
          v50 = 2112;
          v51 = v30;
          _os_log_error_impl(&dword_21214B000, v21, OS_LOG_TYPE_ERROR, "%@ Consumer failed to unarchive request of type %@. Session start with member %@ failed", buf, 0x20u);

        }
        v22 = -[COMessageSessionManagementResponse initWithRemoteError:]([COMessageSessionManagementResponse alloc], "initWithRemoteError:", v20);
        v9[2](v9, v22, 0);

        goto LABEL_14;
      }
    }
    else
    {
      v23 = (void *)MEMORY[0x24BDD1540];
      v54 = CFSTR("COMessageSessionUnknownClassErrorKey");
      v55[0] = v14;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v55, &v54, 1);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "errorWithDomain:code:userInfo:", CFSTR("COMessageSessionErrorDomain"), -1206, v24);
      v17 = (id)objc_claimAutoreleasedReturnValue();

      v15 = 0;
      if (v17)
        goto LABEL_5;
    }
  }
  v25 = [COMessageConsumedSession alloc];
  objc_msgSend(v34, "member");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = -[COMessageConsumedSession initWithMember:consumer:](v25, "initWithMember:consumer:", v26, v11);

  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_initWeak(&location, self);
    COLogForCategory(6);
    v27 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG))
    {
      objc_msgSend(v8, "subTopic");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      -[COMessageChannel _handleStartCommand:withMember:callback:].cold.1((uint64_t)self, v28, (uint64_t)buf, v27);
    }

    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __60__COMessageChannel__handleStartCommand_withMember_callback___block_invoke;
    block[3] = &unk_24CD3FE68;
    v36 = v33;
    v37 = v11;
    v38 = v34;
    v15 = v15;
    v39 = v15;
    objc_copyWeak(&v43, &location);
    v40 = self;
    v20 = v20;
    v41 = v20;
    v42 = v9;
    dispatch_async(queue, block);

    objc_destroyWeak(&v43);
    objc_destroyWeak(&location);
  }
  else
  {
    v29 = objc_alloc_init(COMessageSessionManagementResponse);
    v9[2](v9, v29, 0);

  }
LABEL_14:

}

void __60__COMessageChannel__handleStartCommand_withMember_callback___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  _QWORD v6[5];
  id v7;
  id v8;
  id v9;
  id v10;
  id v11;

  v2 = *(void **)(a1 + 32);
  v3 = *(_QWORD *)(a1 + 40);
  v4 = *(_QWORD *)(a1 + 48);
  v5 = *(_QWORD *)(a1 + 56);
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __60__COMessageChannel__handleStartCommand_withMember_callback___block_invoke_2;
  v6[3] = &unk_24CD3FE40;
  objc_copyWeak(&v11, (id *)(a1 + 88));
  v6[4] = *(_QWORD *)(a1 + 64);
  v7 = *(id *)(a1 + 48);
  v8 = *(id *)(a1 + 40);
  v9 = *(id *)(a1 + 72);
  v10 = *(id *)(a1 + 80);
  objc_msgSend(v2, "consumer:shouldStartSessionWithMember:request:completionHandler:", v3, v4, v5, v6);

  objc_destroyWeak(&v11);
}

void __60__COMessageChannel__handleStartCommand_withMember_callback___block_invoke_2(uint64_t a1, char a2, void *a3)
{
  id v5;
  NSObject **WeakRetained;
  NSObject **v7;
  NSObject *v8;
  id v9;
  uint64_t v10;
  void *v11;
  _QWORD block[4];
  id v13;
  uint64_t v14;
  id v15;
  id v16;
  id v17;
  id v18;
  char v19;

  v5 = a3;
  WeakRetained = (NSObject **)objc_loadWeakRetained((id *)(a1 + 72));
  v7 = WeakRetained;
  if (WeakRetained)
  {
    v8 = WeakRetained[13];
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __60__COMessageChannel__handleStartCommand_withMember_callback___block_invoke_3;
    block[3] = &unk_24CD3FE18;
    v19 = a2;
    v9 = v5;
    v10 = *(_QWORD *)(a1 + 32);
    v11 = *(void **)(a1 + 40);
    v13 = v9;
    v14 = v10;
    v15 = v11;
    v16 = *(id *)(a1 + 48);
    v17 = *(id *)(a1 + 56);
    v18 = *(id *)(a1 + 64);
    dispatch_async(v8, block);

  }
}

void __60__COMessageChannel__handleStartCommand_withMember_callback___block_invoke_3(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  COMessageSessionManagementResponse *v9;
  COMessageSessionManagementResponse *v10;
  void *v11;
  COMessageSessionManagementResponse *v12;
  void *v13;
  id v14;
  uint64_t v15;
  _QWORD v16[2];

  v16[1] = *MEMORY[0x24BDAC8D0];
  if (*(_BYTE *)(a1 + 80))
  {
    v2 = *(_QWORD *)(a1 + 32);
    if (v2)
    {
      v14 = 0;
      objc_msgSend(MEMORY[0x24BDD1618], "archivedDataWithRootObject:requiringSecureCoding:error:", v2, 1, &v14);
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      v4 = v14;
      if (v4)
      {
        v5 = v4;
        v6 = (void *)MEMORY[0x24BDD1540];
        v15 = *MEMORY[0x24BDD1398];
        v16[0] = v4;
        objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v16, &v15, 1);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "errorWithDomain:code:userInfo:", CFSTR("COMessageSessionErrorDomain"), -1207, v7);
        v8 = (void *)objc_claimAutoreleasedReturnValue();

        if (v8)
        {
          v9 = -[COMessageSessionManagementResponse initWithRemoteError:]([COMessageSessionManagementResponse alloc], "initWithRemoteError:", v8);
          objc_msgSend(*(id *)(a1 + 40), "_deliverFailedToStartSessionWithMember:consumer:error:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), v8);

LABEL_9:
          goto LABEL_10;
        }
      }
    }
    else
    {
      v3 = 0;
    }
    v12 = [COMessageSessionManagementResponse alloc];
    objc_msgSend(*(id *)(a1 + 40), "_payloadTypeFromClass:", objc_opt_class());
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = -[COMessageSessionManagementResponse initWithPayload:payloadType:](v12, "initWithPayload:payloadType:", v3, v13);

    objc_msgSend(*(id *)(a1 + 40), "_deliverSuccessfullyStartedSession:withMember:consumer:", *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));
    goto LABEL_9;
  }
  v10 = [COMessageSessionManagementResponse alloc];
  objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("COMessageSessionErrorDomain"), -1213, 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[COMessageSessionManagementResponse initWithRemoteError:](v10, "initWithRemoteError:", v11);

LABEL_10:
  (*(void (**)(void))(*(_QWORD *)(a1 + 72) + 16))();

}

- (void)_deliverSuccessfullyStartedSession:(id)a3 withResponse:(id)a4 withMember:(id)a5 producer:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  NSObject *v16;
  void *v17;
  char v18;
  uint64_t v19;
  NSObject *v20;
  id v21;
  id v22;
  void *v23;
  void *v24;
  void *v25;
  _QWORD v26[4];
  id v27;
  id v28;
  _QWORD block[4];
  id v30;
  id v31;
  id v32;
  id v33;
  id v34;
  uint8_t buf[4];
  id v36;
  __int16 v37;
  id v38;
  uint64_t v39;

  v39 = *MEMORY[0x24BDAC8D0];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  objc_msgSend(v13, "sessions");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "member");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setObject:forKey:", v10, v15);

  COLogForCategory(6);
  v16 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    v36 = v13;
    v37 = 2112;
    v38 = v10;
    _os_log_impl(&dword_21214B000, v16, OS_LOG_TYPE_DEFAULT, "%@ Producer successfully created a session %@", buf, 0x16u);
  }

  objc_msgSend(v13, "delegate");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_opt_respondsToSelector();
  v19 = MEMORY[0x24BDAC760];
  if ((v18 & 1) != 0)
  {
    objc_msgSend(v13, "delegateQueue");
    v20 = objc_claimAutoreleasedReturnValue();
    block[0] = v19;
    block[1] = 3221225472;
    block[2] = __88__COMessageChannel__deliverSuccessfullyStartedSession_withResponse_withMember_producer___block_invoke;
    block[3] = &unk_24CD3FC60;
    v30 = v17;
    v31 = v13;
    v32 = v10;
    v33 = v12;
    v34 = v11;
    dispatch_async(v20, block);

  }
  v26[0] = v19;
  v26[1] = 3221225472;
  v26[2] = __88__COMessageChannel__deliverSuccessfullyStartedSession_withResponse_withMember_producer___block_invoke_2;
  v26[3] = &unk_24CD3FE90;
  v27 = v13;
  v28 = v10;
  v21 = v10;
  v22 = v13;
  -[COMessageChannel _remoteInterfaceWithErrorHandler:](self, "_remoteInterfaceWithErrorHandler:", v26);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "subTopic");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "member");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "sessionStartedForSubTopic:withMember:produced:", v24, v25, 1);

}

uint64_t __88__COMessageChannel__deliverSuccessfullyStartedSession_withResponse_withMember_producer___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "producer:didStartSession:member:response:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64));
}

void __88__COMessageChannel__deliverSuccessfullyStartedSession_withResponse_withMember_producer___block_invoke_2()
{
  NSObject *v0;

  COLogForCategory(6);
  v0 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_ERROR))
    __88__COMessageChannel__deliverSuccessfullyStartedSession_withResponse_withMember_producer___block_invoke_2_cold_1();

}

- (void)_deliverSuccessfullyStartedSession:(id)a3 withMember:(id)a4 consumer:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  uint64_t v13;
  id v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  NSObject *v20;
  _QWORD block[4];
  id v22;
  id v23;
  id v24;
  _QWORD v25[4];
  id v26;
  id v27;

  v8 = a3;
  v9 = a5;
  v10 = a4;
  objc_msgSend(v9, "sessions");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "member");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setObject:forKey:", v8, v12);

  v13 = MEMORY[0x24BDAC760];
  v25[0] = MEMORY[0x24BDAC760];
  v25[1] = 3221225472;
  v25[2] = __75__COMessageChannel__deliverSuccessfullyStartedSession_withMember_consumer___block_invoke;
  v25[3] = &unk_24CD3FE90;
  v14 = v9;
  v26 = v14;
  v15 = v8;
  v27 = v15;
  -[COMessageChannel _remoteInterfaceWithErrorHandler:](self, "_remoteInterfaceWithErrorHandler:", v25);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "subTopic");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "member");
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v16, "sessionStartedForSubTopic:withMember:produced:", v17, v18, 0);
  objc_msgSend(v14, "delegate");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v14, "delegateQueue");
    v20 = objc_claimAutoreleasedReturnValue();
    block[0] = v13;
    block[1] = 3221225472;
    block[2] = __75__COMessageChannel__deliverSuccessfullyStartedSession_withMember_consumer___block_invoke_149;
    block[3] = &unk_24CD3F310;
    v22 = v19;
    v23 = v14;
    v24 = v15;
    dispatch_async(v20, block);

  }
}

void __75__COMessageChannel__deliverSuccessfullyStartedSession_withMember_consumer___block_invoke()
{
  NSObject *v0;

  COLogForCategory(6);
  v0 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_ERROR))
    __75__COMessageChannel__deliverSuccessfullyStartedSession_withMember_consumer___block_invoke_cold_1();

}

uint64_t __75__COMessageChannel__deliverSuccessfullyStartedSession_withMember_consumer___block_invoke_149(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "consumer:didStartSession:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

- (void)_deliverDidFailToStartSessionWithMember:(id)a3 producer:(id)a4 error:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  NSObject *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t);
  void *v16;
  id v17;
  id v18;
  id v19;
  id v20;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  objc_msgSend(v9, "delegate");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "delegateQueue");
  v12 = objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v13 = MEMORY[0x24BDAC760];
    v14 = 3221225472;
    v15 = __75__COMessageChannel__deliverDidFailToStartSessionWithMember_producer_error___block_invoke;
    v16 = &unk_24CD3FBE8;
    v17 = v11;
    v18 = v9;
    v19 = v8;
    v20 = v10;
    dispatch_async(v12, &v13);

  }
  -[COMessageChannel _submitMetricsForSession:withError:](self, "_submitMetricsForSession:withError:", 0, v10, v13, v14, v15, v16);

}

uint64_t __75__COMessageChannel__deliverDidFailToStartSessionWithMember_producer_error___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "producer:didFailToStartSessionWithMember:error:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));
}

- (void)_deliverFailedToStartSessionWithMember:(id)a3 consumer:(id)a4 error:(id)a5
{
  id v7;
  id v8;
  id v9;
  void *v10;
  NSObject *v11;
  _QWORD v12[4];
  id v13;
  id v14;
  id v15;
  id v16;

  v7 = a3;
  v8 = a4;
  v9 = a5;
  objc_msgSend(v8, "delegate");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "delegateQueue");
  v11 = objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v12[0] = MEMORY[0x24BDAC760];
    v12[1] = 3221225472;
    v12[2] = __74__COMessageChannel__deliverFailedToStartSessionWithMember_consumer_error___block_invoke;
    v12[3] = &unk_24CD3FBE8;
    v13 = v10;
    v14 = v8;
    v15 = v7;
    v16 = v9;
    dispatch_async(v11, v12);

  }
}

uint64_t __74__COMessageChannel__deliverFailedToStartSessionWithMember_consumer_error___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "consumer:didFailToStartSessionWithMember:error:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));
}

- (void)_handleStopCommand:(id)a3 fromMember:(id)a4 callback:(id)a5
{
  id v8;
  id v9;
  void (**v10)(id, COMessageSessionManagementResponse *, _QWORD);
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  id v24;
  void *v25;
  COMessageSessionManagementResponse *v26;
  objc_class *v27;
  void *v28;
  void *v29;
  void *v30;
  id v31;
  const __CFString *v32;
  _QWORD v33[2];

  v33[1] = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = (void (**)(id, COMessageSessionManagementResponse *, _QWORD))a5;
  objc_msgSend(v8, "subTopic");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[COMessageChannel sessionConsumers](self, "sessionConsumers");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "objectForKey:", v11);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v13, "sessions");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "member");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "objectForKey:", v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (v16)
    goto LABEL_3;
  -[COMessageChannel sessionProducers](self, "sessionProducers");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "objectForKey:", v11);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v18, "sessions");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "member");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "objectForKey:", v20);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (v16)
  {
LABEL_3:
    v30 = v13;
    objc_msgSend(v8, "payload");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "payloadType");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "remoteError");
    v23 = objc_claimAutoreleasedReturnValue();
    if (v23)
    {
      v24 = (id)v23;
    }
    else
    {
      v25 = 0;
      v24 = 0;
      if (!v21 || !v22)
        goto LABEL_6;
      v27 = -[COMessageChannel _payloadClassFromType:](self, "_payloadClassFromType:", v22);
      if (v27)
      {
        v31 = 0;
        objc_msgSend(MEMORY[0x24BDD1620], "unarchivedObjectOfClass:fromData:error:", v27, v21, &v31);
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        v24 = v31;
        goto LABEL_6;
      }
      v29 = (void *)MEMORY[0x24BDD1540];
      v32 = CFSTR("COMessageSessionUnknownClassErrorKey");
      v33[0] = v22;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v33, &v32, 1);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "errorWithDomain:code:userInfo:", CFSTR("COMessageSessionErrorDomain"), -1206, v28);
      v24 = (id)objc_claimAutoreleasedReturnValue();

    }
    v25 = 0;
LABEL_6:
    -[COMessageChannel _deliverDidEndDelegateForSession:notice:initiator:error:](self, "_deliverDidEndDelegateForSession:notice:initiator:error:", v16, v25, v9, v24);

    v13 = v30;
  }
  v26 = objc_alloc_init(COMessageSessionManagementResponse);
  v10[2](v10, v26, 0);

}

- (void)_handleCapableCommand:(id)a3 fromMember:(id)a4 callback:(id)a5
{
  id v8;
  id v9;
  void (**v10)(id, COMessageSessionManagementResponse *, _QWORD);
  COMessageSessionManagementResponse *v11;
  void *v12;
  void *v13;
  void *v14;
  NSObject *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  void *v24;
  void *v25;
  void *v26;
  int v27;
  COMessageChannel *v28;
  __int16 v29;
  void *v30;
  __int16 v31;
  void *v32;
  uint64_t v33;

  v33 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = (void (**)(id, COMessageSessionManagementResponse *, _QWORD))a5;
  v11 = objc_alloc_init(COMessageSessionManagementResponse);
  v10[2](v10, v11, 0);

  -[COMessageChannel sessionsInflight](self, "sessionsInflight");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "member");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "objectForKey:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (v14)
  {
    COLogForCategory(6);
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v9, "member");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "subTopic");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = 134218498;
      v28 = self;
      v29 = 2112;
      v30 = v16;
      v31 = 2112;
      v32 = v17;
      _os_log_impl(&dword_21214B000, v15, OS_LOG_TYPE_DEFAULT, "%p Received a command indicating inflight member %@ is now capable of consuming subTopic %@", (uint8_t *)&v27, 0x20u);

    }
    -[COMessageChannel sessionProducers](self, "sessionProducers");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "subTopic");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "objectForKey:", v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x24BDBCEF8], "null");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v14, "isEqual:", v21))
      v22 = 0;
    else
      v22 = v14;
    v23 = v22;

    -[COMessageChannel sessionsInflight](self, "sessionsInflight");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "member");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "removeObjectForKey:", v25);

    objc_msgSend(v9, "member");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    -[COMessageChannel _startSessionWithProducer:member:request:](self, "_startSessionWithProducer:member:request:", v20, v26, v23);

  }
}

- (void)_startSessionWithProducer:(id)a3 member:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  NSObject *v10;
  _BOOL4 v11;
  void *v12;
  void *v13;
  void *v14;
  NSObject *v15;
  NSObject *v16;
  _QWORD v17[4];
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  id location;
  uint8_t buf[4];
  COMessageChannel *v25;
  __int16 v26;
  id v27;
  __int16 v28;
  id v29;
  uint64_t v30;

  v30 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  objc_msgSend(v6, "sessions");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKey:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  COLogForCategory(6);
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT);
  if (v9)
  {
    if (v11)
    {
      *(_DWORD *)buf = 134218242;
      v25 = self;
      v26 = 2112;
      v27 = v7;
      _os_log_impl(&dword_21214B000, v10, OS_LOG_TYPE_DEFAULT, "%p Session with member %@ is already active. Not starting again", buf, 0x16u);
    }
  }
  else
  {
    if (v11)
    {
      *(_DWORD *)buf = 134218498;
      v25 = self;
      v26 = 2112;
      v27 = v7;
      v28 = 2112;
      v29 = v6;
      _os_log_impl(&dword_21214B000, v10, OS_LOG_TYPE_DEFAULT, "%p Attempting to start a session with member %@ using producer %@", buf, 0x20u);
    }

    objc_msgSend(v6, "delegateQueue");
    v10 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "delegate");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_initWeak(&location, self);
    -[COMessageChannel roleSnapshotsCache](self, "roleSnapshotsCache");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "objectForKey:", v7);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      COLogForCategory(6);
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
        -[COMessageChannel _startSessionWithProducer:member:].cold.1();

      v17[0] = MEMORY[0x24BDAC760];
      v17[1] = 3221225472;
      v17[2] = __53__COMessageChannel__startSessionWithProducer_member___block_invoke;
      v17[3] = &unk_24CD3FEE0;
      v18 = v12;
      v19 = v6;
      v20 = v14;
      objc_copyWeak(&v22, &location);
      v21 = v7;
      dispatch_async(v10, v17);

      objc_destroyWeak(&v22);
    }
    else
    {
      COLogForCategory(6);
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134217984;
        v25 = self;
        _os_log_impl(&dword_21214B000, v16, OS_LOG_TYPE_DEFAULT, "%p Client does not implement producer:shouldStartSessionWithMember:completionHandler:", buf, 0xCu);
      }

      -[COMessageChannel _startSessionWithProducer:member:request:](self, "_startSessionWithProducer:member:request:", v6, v7, 0);
    }

    objc_destroyWeak(&location);
  }

}

void __53__COMessageChannel__startSessionWithProducer_member___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  _QWORD v5[4];
  id v6;
  id v7;
  id v8;

  v2 = *(void **)(a1 + 32);
  v3 = *(_QWORD *)(a1 + 40);
  v4 = *(_QWORD *)(a1 + 48);
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __53__COMessageChannel__startSessionWithProducer_member___block_invoke_2;
  v5[3] = &unk_24CD3FEB8;
  objc_copyWeak(&v8, (id *)(a1 + 64));
  v6 = *(id *)(a1 + 56);
  v7 = *(id *)(a1 + 40);
  objc_msgSend(v2, "producer:shouldStartSessionWithMember:completionHandler:", v3, v4, v5);

  objc_destroyWeak(&v8);
}

void __53__COMessageChannel__startSessionWithProducer_member___block_invoke_2(id *a1, int a2, void *a3)
{
  id v5;
  _QWORD *WeakRetained;
  NSObject *v7;
  _BOOL4 v8;
  id v9;
  NSObject *v10;
  id v11;
  _QWORD v12[5];
  id v13;
  id v14;
  id v15;
  uint8_t buf[4];
  _QWORD *v17;
  __int16 v18;
  id v19;
  __int16 v20;
  id v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  WeakRetained = objc_loadWeakRetained(a1 + 6);
  if (WeakRetained)
  {
    COLogForCategory(6);
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);
    if (a2)
    {
      if (v8)
      {
        v9 = a1[4];
        *(_DWORD *)buf = 134218498;
        v17 = WeakRetained;
        v18 = 2112;
        v19 = v9;
        v20 = 2112;
        v21 = v5;
        _os_log_impl(&dword_21214B000, v7, OS_LOG_TYPE_DEFAULT, "%p Client wants to start a session with member %@ with request %@", buf, 0x20u);
      }

      v10 = WeakRetained[13];
      v12[0] = MEMORY[0x24BDAC760];
      v12[1] = 3221225472;
      v12[2] = __53__COMessageChannel__startSessionWithProducer_member___block_invoke_157;
      v12[3] = &unk_24CD3FBE8;
      v12[4] = WeakRetained;
      v13 = a1[5];
      v14 = a1[4];
      v15 = v5;
      dispatch_async(v10, v12);

    }
    else
    {
      if (v8)
      {
        v11 = a1[4];
        *(_DWORD *)buf = 134218242;
        v17 = WeakRetained;
        v18 = 2112;
        v19 = v11;
        _os_log_impl(&dword_21214B000, v7, OS_LOG_TYPE_DEFAULT, "%p Client does not want to start a session with member %@", buf, 0x16u);
      }

    }
  }

}

uint64_t __53__COMessageChannel__startSessionWithProducer_member___block_invoke_157(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_startSessionWithProducer:member:request:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));
}

- (void)_startSessionWithProducer:(id)a3 member:(id)a4 request:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  COMessageSessionManagementRequest *v17;
  COMessageSessionManagementRequest *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  _QWORD v27[4];
  id v28;
  id v29;
  id v30;
  id v31;
  id location;
  id v33;
  uint64_t v34;
  _QWORD v35[2];

  v35[1] = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  -[COMessageChannel roleSnapshotsCache](self, "roleSnapshotsCache");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "objectForKey:", v9);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v33 = 0;
  objc_msgSend(MEMORY[0x24BDD1618], "archivedDataWithRootObject:requiringSecureCoding:error:", v10, 1, &v33);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v33;
  v14 = v13;
  if (v13)
  {
    v15 = (void *)MEMORY[0x24BDD1540];
    v34 = *MEMORY[0x24BDD1398];
    v35[0] = v13;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v35, &v34, 1);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "errorWithDomain:code:userInfo:", CFSTR("COMessageSessionErrorDomain"), -1205, v16);
    v17 = (COMessageSessionManagementRequest *)objc_claimAutoreleasedReturnValue();

    -[COMessageChannel _deliverDidFailToStartSessionWithMember:producer:error:](self, "_deliverDidFailToStartSessionWithMember:producer:error:", v12, v8, v17);
  }
  else
  {
    v18 = [COMessageSessionManagementRequest alloc];
    -[COMessageChannel _payloadTypeFromClass:](self, "_payloadTypeFromClass:", objc_opt_class());
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[COMessageChannel topic](self, "topic");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "subTopic");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = -[COMessageSessionManagementRequest initWithCommandType:payload:payloadType:topic:subTopic:](v18, "initWithCommandType:payload:payloadType:topic:subTopic:", 1, v26, v19, v20, v21);

    v22 = (void *)MEMORY[0x24BDD17C8];
    objc_msgSend(v8, "subTopic");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "_commandTypeForConsumerWithSubTopic:", v23);
    v24 = (void *)objc_claimAutoreleasedReturnValue();

    objc_initWeak(&location, self);
    objc_msgSend(MEMORY[0x24BDBCF20], "setWithObject:", v9);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v27[0] = MEMORY[0x24BDAC760];
    v27[1] = 3221225472;
    v27[2] = __61__COMessageChannel__startSessionWithProducer_member_request___block_invoke;
    v27[3] = &unk_24CD3FC88;
    objc_copyWeak(&v31, &location);
    v28 = v10;
    v29 = v8;
    v30 = v9;
    -[COMessageChannel _sendRequest:type:members:withCompletionHandler:](self, "_sendRequest:type:members:withCompletionHandler:", v17, v24, v25, v27);

    objc_destroyWeak(&v31);
    objc_destroyWeak(&location);

  }
}

void __61__COMessageChannel__startSessionWithProducer_member_request___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  id WeakRetained;
  void *v11;
  uint64_t v12;
  NSObject *v13;
  void *v14;
  id v15;
  id v16;
  void *v17;
  NSObject *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  COMessageProducedSession *v29;
  NSObject *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  COMessageProducedSession *v43;
  void *v44;
  void *v45;
  void *v46;
  COMessageSessionManagementRequest *v47;
  COMessageSessionManagementRequest *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  id v55;
  uint64_t v56;
  COMessageProducedSession *v57;
  const __CFString *v58;
  uint64_t v59;
  uint64_t v60;
  id v61;
  uint8_t buf[4];
  id v63;
  __int16 v64;
  id v65;
  uint64_t v66;

  v66 = *MEMORY[0x24BDAC8D0];
  v7 = a2;
  v8 = a3;
  v9 = a4;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  if (WeakRetained)
  {
    if (v9)
    {
      objc_msgSend(v9, "domain");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v11, "isEqualToString:", CFSTR("COMessageChannelErrorDomain")))
      {
        v12 = objc_msgSend(v9, "code");

        if (v12 == -1114)
        {
          COLogForCategory(6);
          v13 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412546;
            v63 = WeakRetained;
            v64 = 2112;
            v65 = v7;
            _os_log_impl(&dword_21214B000, v13, OS_LOG_TYPE_DEFAULT, "%@ Member %@ does not have an active message channel for Sessions. Deferring session creation.", buf, 0x16u);
          }

          v14 = *(void **)(a1 + 32);
          if (v14)
          {
            v15 = v14;
          }
          else
          {
            objc_msgSend(MEMORY[0x24BDBCEF8], "null");
            v15 = (id)objc_claimAutoreleasedReturnValue();
          }
          v16 = v15;
          objc_msgSend(WeakRetained, "sessionsInflight");
          v40 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v7, "member");
          v41 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v40, "setObject:forKey:", v16, v41);

          goto LABEL_33;
        }
      }
      else
      {

      }
      objc_msgSend(v9, "domain");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v21, "isEqualToString:", CFSTR("COMessageChannelErrorDomain")))
      {
        v22 = objc_msgSend(v9, "code");

        if (v22 == -1101)
        {
          objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("COMessageSessionErrorDomain"), -1210, 0);
          v16 = (id)objc_claimAutoreleasedReturnValue();
LABEL_19:
          objc_msgSend(WeakRetained, "_deliverDidFailToStartSessionWithMember:producer:error:", v7, *(_QWORD *)(a1 + 40), v16);
LABEL_33:

          goto LABEL_34;
        }
      }
      else
      {

      }
      v23 = (void *)MEMORY[0x24BDD1540];
      v60 = *MEMORY[0x24BDD1398];
      v61 = v9;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v61, &v60, 1);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "errorWithDomain:code:userInfo:", CFSTR("COMessageSessionErrorDomain"), -1204, v24);
      v16 = (id)objc_claimAutoreleasedReturnValue();

      goto LABEL_19;
    }
    v16 = v8;
    objc_msgSend(v16, "remoteError");
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    if (v17)
    {
      COLogForCategory(6);
      v18 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
        __61__COMessageChannel__startSessionWithProducer_member_request___block_invoke_cold_2(a1, v16, v18);

      v19 = *(_QWORD *)(a1 + 40);
      objc_msgSend(v16, "remoteError");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(WeakRetained, "_deliverDidFailToStartSessionWithMember:producer:error:", v7, v19, v20);
      goto LABEL_32;
    }
    objc_msgSend(v16, "payload");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "payloadType");
    v25 = objc_claimAutoreleasedReturnValue();
    v26 = 0;
    v54 = (void *)v25;
    if (v20)
    {
      v27 = v25;
      if (v25)
      {
        v28 = objc_msgSend(WeakRetained, "_payloadClassFromType:", v25);
        if (v28)
        {
          v55 = 0;
          objc_msgSend(MEMORY[0x24BDD1620], "unarchivedObjectOfClass:fromData:error:", v28, v20, &v55);
          v26 = objc_claimAutoreleasedReturnValue();
          v29 = (COMessageProducedSession *)v55;
          if (v29)
          {
LABEL_24:
            v49 = (void *)v26;
            COLogForCategory(6);
            v30 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
              __61__COMessageChannel__startSessionWithProducer_member_request___block_invoke_cold_1();

            v50 = (void *)MEMORY[0x24BDD1540];
            v56 = *MEMORY[0x24BDD1398];
            v57 = v29;
            objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v57, &v56, 1);
            v31 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v50, "errorWithDomain:code:userInfo:", CFSTR("COMessageSessionErrorDomain"), -1208, v31);
            v51 = (void *)objc_claimAutoreleasedReturnValue();

            objc_msgSend(WeakRetained, "_deliverDidFailToStartSessionWithMember:producer:error:", v7, *(_QWORD *)(a1 + 40), v51);
            v47 = [COMessageSessionManagementRequest alloc];
            objc_msgSend(WeakRetained, "topic");
            v32 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(*(id *)(a1 + 40), "subTopic");
            v33 = (void *)objc_claimAutoreleasedReturnValue();
            v48 = -[COMessageSessionManagementRequest initWithCommandType:error:topic:subTopic:](v47, "initWithCommandType:error:topic:subTopic:", 2, v51, v32, v33);

            v34 = (void *)MEMORY[0x24BDD17C8];
            objc_msgSend(*(id *)(a1 + 40), "subTopic");
            v35 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v34, "_commandTypeForConsumerWithSubTopic:", v35);
            v36 = (void *)objc_claimAutoreleasedReturnValue();

            v37 = (void *)MEMORY[0x24BDBCF20];
            objc_msgSend(v7, "member");
            v46 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v37, "setWithObject:", v46);
            v38 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(WeakRetained, "_sendRequest:type:members:withCompletionHandler:", v48, v36, v38, &__block_literal_global_160_0);

            v39 = v49;
            goto LABEL_31;
          }
        }
        else
        {
          v52 = (void *)MEMORY[0x24BDD1540];
          v58 = CFSTR("COMessageSessionUnknownClassErrorKey");
          v59 = v27;
          objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v59, &v58, 1);
          v42 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v52, "errorWithDomain:code:userInfo:", CFSTR("COMessageSessionErrorDomain"), -1208, v42);
          v29 = (COMessageProducedSession *)objc_claimAutoreleasedReturnValue();

          v26 = 0;
          if (v29)
            goto LABEL_24;
        }
      }
    }
    v43 = [COMessageProducedSession alloc];
    objc_msgSend(v7, "member");
    v53 = v20;
    v44 = (void *)v26;
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = -[COMessageProducedSession initWithMember:producer:](v43, "initWithMember:producer:", v45, *(_QWORD *)(a1 + 40));

    v39 = v44;
    v20 = v53;
    -[COMessageSession setDidUseRequest:](v29, "setDidUseRequest:", *(_QWORD *)(a1 + 32) != 0);
    -[COMessageSession setDidUseResponse:](v29, "setDidUseResponse:", v39 != 0);
    objc_msgSend(WeakRetained, "_deliverSuccessfullyStartedSession:withResponse:withMember:producer:", v29, v39, v7, *(_QWORD *)(a1 + 40));
LABEL_31:

LABEL_32:
    goto LABEL_33;
  }
LABEL_34:

}

- (void)_deliverDidEndDelegateForSession:(id)a3 notice:(id)a4 initiator:(id)a5 error:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  char isKindOfClass;
  uint64_t v15;
  id v16;
  id v17;
  NSObject *v18;
  NSObject *v19;
  id v20;
  void *v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  void (*v25)(uint64_t);
  void *v26;
  id v27;
  id v28;
  id location;
  _QWORD v30[4];
  id v31;
  id v32;
  id v33;
  id v34;
  id v35;
  id v36;
  _QWORD block[4];
  id v38;
  id v39;
  id v40;
  id v41;
  id v42;
  id v43;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();
  v15 = MEMORY[0x24BDAC760];
  if ((isKindOfClass & 1) != 0)
  {
    objc_msgSend(v10, "producer");
    v16 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "delegate");
    v17 = (id)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      objc_msgSend(v16, "delegateQueue");
      v18 = objc_claimAutoreleasedReturnValue();
      block[0] = v15;
      block[1] = 3221225472;
      block[2] = __76__COMessageChannel__deliverDidEndDelegateForSession_notice_initiator_error___block_invoke;
      block[3] = &unk_24CD3FF48;
      v38 = v17;
      v39 = v16;
      v40 = v10;
      v41 = v12;
      v42 = v11;
      v43 = v13;
      dispatch_async(v18, block);

    }
    -[COMessageChannel _submitMetricsForSession:withError:](self, "_submitMetricsForSession:withError:", v10, v13);
  }
  else
  {
    objc_msgSend(v10, "consumer");
    v16 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "delegate");
    v17 = (id)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      objc_msgSend(v16, "delegateQueue");
      v19 = objc_claimAutoreleasedReturnValue();
      v30[0] = v15;
      v30[1] = 3221225472;
      v30[2] = __76__COMessageChannel__deliverDidEndDelegateForSession_notice_initiator_error___block_invoke_2;
      v30[3] = &unk_24CD3FF48;
      v17 = v17;
      v31 = v17;
      v16 = v16;
      v32 = v16;
      v33 = v10;
      v34 = v12;
      v35 = v11;
      v36 = v13;
      dispatch_async(v19, v30);

    }
  }

  objc_initWeak(&location, self);
  v23 = v15;
  v24 = 3221225472;
  v25 = __76__COMessageChannel__deliverDidEndDelegateForSession_notice_initiator_error___block_invoke_3;
  v26 = &unk_24CD3FF70;
  objc_copyWeak(&v28, &location);
  v20 = v10;
  v27 = v20;
  -[COMessageChannel _remoteInterfaceWithErrorHandler:](self, "_remoteInterfaceWithErrorHandler:", &v23);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "subTopic", v23, v24, v25, v26);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "sessionEndedForSubTopic:", v22);

  objc_destroyWeak(&v28);
  objc_destroyWeak(&location);

}

uint64_t __76__COMessageChannel__deliverDidEndDelegateForSession_notice_initiator_error___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "producer:didStopSession:initiator:notice:error:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 72));
}

uint64_t __76__COMessageChannel__deliverDidEndDelegateForSession_notice_initiator_error___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "consumer:didStopSession:initiator:notice:error:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 72));
}

void __76__COMessageChannel__deliverDidEndDelegateForSession_notice_initiator_error___block_invoke_3(uint64_t a1)
{
  id WeakRetained;
  NSObject *v2;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    COLogForCategory(6);
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
      __76__COMessageChannel__deliverDidEndDelegateForSession_notice_initiator_error___block_invoke_3_cold_1();

  }
}

- (void)_callbackProducersAndConsumersAfterActivationWithError:(id)a3
{
  void *v4;
  void *v5;
  uint64_t v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t k;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  NSObject *v19;
  uint64_t m;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  NSObject *v25;
  COMessageSessionManagementRequest *v26;
  void *v27;
  COMessageSessionManagementRequest *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t i;
  uint64_t v37;
  void *v38;
  void *v39;
  void *v40;
  NSObject *v41;
  void *v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t j;
  uint64_t v46;
  void *v47;
  void *v48;
  void *v49;
  NSObject *v50;
  id v51;
  uint64_t v52;
  uint64_t v53;
  id obj;
  _QWORD v55[4];
  id v56;
  COMessageChannel *v57;
  uint64_t v58;
  id v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  _QWORD v64[4];
  id v65;
  COMessageChannel *v66;
  uint64_t v67;
  id v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  _QWORD v73[5];
  id v74;
  _QWORD v75[5];
  id v76;
  _QWORD v77[4];
  id v78;
  COMessageChannel *v79;
  id v80;
  __int128 v81;
  __int128 v82;
  __int128 v83;
  __int128 v84;
  _QWORD block[4];
  id v86;
  COMessageChannel *v87;
  id v88;
  __int128 v89;
  __int128 v90;
  __int128 v91;
  __int128 v92;
  _BYTE v93[128];
  _BYTE v94[128];
  uint64_t v95;
  id v96;
  const __CFString *v97;
  void *v98;
  const __CFString *v99;
  void *v100;
  _BYTE v101[128];
  uint8_t v102[128];
  uint8_t buf[4];
  COMessageChannel *v104;
  __int16 v105;
  id v106;
  uint64_t v107;

  v107 = *MEMORY[0x24BDAC8D0];
  v51 = a3;
  -[COMessageChannel sessionProducers](self, "sessionProducers");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "count"))
  {

  }
  else
  {
    -[COMessageChannel sessionConsumers](self, "sessionConsumers");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "count");

    if (!v6)
      goto LABEL_57;
  }
  COLogForCategory(6);
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134218242;
    v104 = self;
    v105 = 2112;
    v106 = v51;
    _os_log_impl(&dword_21214B000, v7, OS_LOG_TYPE_DEFAULT, "%p Channel activation complete with error %@. Calling producer and consumer delegates", buf, 0x16u);
  }

  if (v51)
  {
    if (objc_msgSend(v51, "code") == -1112)
    {
      objc_msgSend(v51, "userInfo");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "objectForKey:", CFSTR("COMessageChannelDuplicateSessionProducerKey"));
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      if (v9)
      {
        v99 = CFSTR("COMessageSessionDuplicateSessionProducerKey");
        v100 = v9;
        objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v100, &v99, 1);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v10 = 0;
      }
      objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("COMessageSessionErrorDomain"), -1209, v10);
      obj = (id)objc_claimAutoreleasedReturnValue();

    }
    else if (objc_msgSend(v51, "code") == -1113)
    {
      objc_msgSend(v51, "userInfo");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "objectForKey:", CFSTR("COMessageChannelDuplicateSessionConsumerKey"));
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      if (v9)
      {
        v97 = CFSTR("COMessageSessionDuplicateSessionConsumerKey");
        v98 = v9;
        objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v98, &v97, 1);
        v31 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v31 = 0;
      }
      objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("COMessageSessionErrorDomain"), -1209, v31);
      obj = (id)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v32 = (void *)MEMORY[0x24BDD1540];
      v95 = *MEMORY[0x24BDD1398];
      v96 = v51;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v96, &v95, 1);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "errorWithDomain:code:userInfo:", CFSTR("COMessageSessionErrorDomain"), -1209, v9);
      obj = (id)objc_claimAutoreleasedReturnValue();
    }

    v71 = 0u;
    v72 = 0u;
    v69 = 0u;
    v70 = 0u;
    -[COMessageChannel sessionProducers](self, "sessionProducers");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v34 = objc_msgSend(v33, "countByEnumeratingWithState:objects:count:", &v69, v94, 16);
    if (v34)
    {
      v35 = *(_QWORD *)v70;
      do
      {
        for (i = 0; i != v34; ++i)
        {
          if (*(_QWORD *)v70 != v35)
            objc_enumerationMutation(v33);
          v37 = *(_QWORD *)(*((_QWORD *)&v69 + 1) + 8 * i);
          -[COMessageChannel sessionProducers](self, "sessionProducers");
          v38 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v38, "objectForKey:", v37);
          v39 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v39, "delegate");
          v40 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v39, "delegateQueue");
          v41 = objc_claimAutoreleasedReturnValue();
          if ((objc_opt_respondsToSelector() & 1) != 0)
          {
            v64[0] = MEMORY[0x24BDAC760];
            v64[1] = 3221225472;
            v64[2] = __75__COMessageChannel__callbackProducersAndConsumersAfterActivationWithError___block_invoke_172;
            v64[3] = &unk_24CD3FBE8;
            v65 = v40;
            v66 = self;
            v67 = v37;
            v68 = obj;
            dispatch_async(v41, v64);

          }
        }
        v34 = objc_msgSend(v33, "countByEnumeratingWithState:objects:count:", &v69, v94, 16);
      }
      while (v34);
    }

    v62 = 0u;
    v63 = 0u;
    v60 = 0u;
    v61 = 0u;
    -[COMessageChannel sessionConsumers](self, "sessionConsumers");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    v43 = objc_msgSend(v42, "countByEnumeratingWithState:objects:count:", &v60, v93, 16);
    if (v43)
    {
      v44 = *(_QWORD *)v61;
      do
      {
        for (j = 0; j != v43; ++j)
        {
          if (*(_QWORD *)v61 != v44)
            objc_enumerationMutation(v42);
          v46 = *(_QWORD *)(*((_QWORD *)&v60 + 1) + 8 * j);
          -[COMessageChannel sessionConsumers](self, "sessionConsumers");
          v47 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v47, "objectForKey:", v46);
          v48 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v48, "delegate");
          v49 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v48, "delegateQueue");
          v50 = objc_claimAutoreleasedReturnValue();
          if ((objc_opt_respondsToSelector() & 1) != 0)
          {
            v55[0] = MEMORY[0x24BDAC760];
            v55[1] = 3221225472;
            v55[2] = __75__COMessageChannel__callbackProducersAndConsumersAfterActivationWithError___block_invoke_2_173;
            v55[3] = &unk_24CD3FBE8;
            v56 = v49;
            v57 = self;
            v58 = v46;
            v59 = obj;
            dispatch_async(v50, v55);

          }
        }
        v43 = objc_msgSend(v42, "countByEnumeratingWithState:objects:count:", &v60, v93, 16);
      }
      while (v43);
    }

  }
  else
  {
    v91 = 0u;
    v92 = 0u;
    v89 = 0u;
    v90 = 0u;
    -[COMessageChannel sessionProducers](self, "sessionProducers");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v89, v102, 16);
    if (v12)
    {
      v13 = *(_QWORD *)v90;
      do
      {
        for (k = 0; k != v12; ++k)
        {
          if (*(_QWORD *)v90 != v13)
            objc_enumerationMutation(v11);
          v15 = *(_QWORD *)(*((_QWORD *)&v89 + 1) + 8 * k);
          -[COMessageChannel sessionProducers](self, "sessionProducers");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "objectForKey:", v15);
          v17 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v17, "delegate");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "delegateQueue");
          v19 = objc_claimAutoreleasedReturnValue();
          if ((objc_opt_respondsToSelector() & 1) != 0)
          {
            block[0] = MEMORY[0x24BDAC760];
            block[1] = 3221225472;
            block[2] = __75__COMessageChannel__callbackProducersAndConsumersAfterActivationWithError___block_invoke;
            block[3] = &unk_24CD3F310;
            v86 = v18;
            v87 = self;
            v88 = v17;
            dispatch_async(v19, block);

          }
        }
        v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v89, v102, 16);
      }
      while (v12);
    }

    v83 = 0u;
    v84 = 0u;
    v81 = 0u;
    v82 = 0u;
    -[COMessageChannel sessionConsumers](self, "sessionConsumers");
    obj = (id)objc_claimAutoreleasedReturnValue();
    v53 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v81, v101, 16);
    if (v53)
    {
      v52 = *(_QWORD *)v82;
      do
      {
        for (m = 0; m != v53; ++m)
        {
          if (*(_QWORD *)v82 != v52)
            objc_enumerationMutation(obj);
          v21 = *(_QWORD *)(*((_QWORD *)&v81 + 1) + 8 * m);
          -[COMessageChannel sessionConsumers](self, "sessionConsumers");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v22, "objectForKey:", v21);
          v23 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v23, "delegate");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v23, "delegateQueue");
          v25 = objc_claimAutoreleasedReturnValue();
          if ((objc_opt_respondsToSelector() & 1) != 0)
          {
            v77[0] = MEMORY[0x24BDAC760];
            v77[1] = 3221225472;
            v77[2] = __75__COMessageChannel__callbackProducersAndConsumersAfterActivationWithError___block_invoke_2;
            v77[3] = &unk_24CD3F310;
            v78 = v24;
            v79 = self;
            v80 = v23;
            dispatch_async(v25, v77);

          }
          v26 = [COMessageSessionManagementRequest alloc];
          -[COMessageChannel topic](self, "topic");
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          v28 = -[COMessageSessionManagementRequest initWithCommandType:payload:payloadType:topic:subTopic:](v26, "initWithCommandType:payload:payloadType:topic:subTopic:", 0, 0, 0, v27, v21);

          objc_msgSend(MEMORY[0x24BDD17C8], "_commandTypeForProducerWithSubTopic:", v21);
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          objc_initWeak((id *)buf, self);
          v75[0] = MEMORY[0x24BDAC760];
          v75[1] = 3221225472;
          v75[2] = __75__COMessageChannel__callbackProducersAndConsumersAfterActivationWithError___block_invoke_3;
          v75[3] = &unk_24CD3FF98;
          objc_copyWeak(&v76, (id *)buf);
          v75[4] = v21;
          v73[0] = MEMORY[0x24BDAC760];
          v73[1] = 3221225472;
          v73[2] = __75__COMessageChannel__callbackProducersAndConsumersAfterActivationWithError___block_invoke_171;
          v73[3] = &unk_24CD3FFC0;
          objc_copyWeak(&v74, (id *)buf);
          v73[4] = v21;
          -[COMessageChannel _broadcastRequest:type:recipientsCallback:responseCompletionHandler:](self, "_broadcastRequest:type:recipientsCallback:responseCompletionHandler:", v28, v29, v75, v73);
          objc_destroyWeak(&v74);
          objc_destroyWeak(&v76);
          objc_destroyWeak((id *)buf);

        }
        v53 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v81, v101, 16);
      }
      while (v53);
    }
  }

LABEL_57:
}

uint64_t __75__COMessageChannel__callbackProducersAndConsumersAfterActivationWithError___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "channel:didAddProducer:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

uint64_t __75__COMessageChannel__callbackProducersAndConsumersAfterActivationWithError___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "channel:didAddConsumer:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

void __75__COMessageChannel__callbackProducersAndConsumersAfterActivationWithError___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id WeakRetained;
  NSObject *v8;
  NSObject *v9;
  uint64_t v10;
  int v11;
  id v12;
  __int16 v13;
  uint64_t v14;
  __int16 v15;
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    COLogForCategory(6);
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = v8;
    if (v6)
    {
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        v10 = *(_QWORD *)(a1 + 32);
        v11 = 134218498;
        v12 = WeakRetained;
        v13 = 2112;
        v14 = v10;
        v15 = 2112;
        v16 = v6;
        _os_log_error_impl(&dword_21214B000, v9, OS_LOG_TYPE_ERROR, "%p Failed to broadcast session capability for subTopic %@. Error = %@", (uint8_t *)&v11, 0x20u);
      }
    }
    else if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      v11 = 134218240;
      v12 = WeakRetained;
      v13 = 2048;
      v14 = objc_msgSend(v5, "count");
      _os_log_impl(&dword_21214B000, v9, OS_LOG_TYPE_DEFAULT, "%p Informing %ld clients about session capability", (uint8_t *)&v11, 0x16u);
    }

  }
}

void __75__COMessageChannel__callbackProducersAndConsumersAfterActivationWithError___block_invoke_171(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v6;
  id v7;
  id WeakRetained;
  NSObject *v9;
  NSObject *v10;
  uint64_t v11;
  uint64_t v12;
  int v13;
  id v14;
  __int16 v15;
  id v16;
  __int16 v17;
  uint64_t v18;
  __int16 v19;
  id v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v6 = a2;
  v7 = a4;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    COLogForCategory(6);
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = v9;
    if (v7)
    {
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        v11 = *(_QWORD *)(a1 + 32);
        v13 = 134218754;
        v14 = WeakRetained;
        v15 = 2112;
        v16 = v6;
        v17 = 2112;
        v18 = v11;
        v19 = 2112;
        v20 = v7;
        _os_log_error_impl(&dword_21214B000, v10, OS_LOG_TYPE_ERROR, "%p Failed to inform client %@ about session capability for subTopic %@. Error = %@", (uint8_t *)&v13, 0x2Au);
      }
    }
    else if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      v12 = *(_QWORD *)(a1 + 32);
      v13 = 134218498;
      v14 = WeakRetained;
      v15 = 2112;
      v16 = v6;
      v17 = 2112;
      v18 = v12;
      _os_log_impl(&dword_21214B000, v10, OS_LOG_TYPE_DEFAULT, "%p Successfully informed client %@ about session capability for subTopic %@", (uint8_t *)&v13, 0x20u);
    }

  }
}

uint64_t __75__COMessageChannel__callbackProducersAndConsumersAfterActivationWithError___block_invoke_172(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "channel:didFailToAddProducerWithSubTopic:error:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));
}

uint64_t __75__COMessageChannel__callbackProducersAndConsumersAfterActivationWithError___block_invoke_2_173(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "channel:didFailToAddConsumerWithSubTopic:error:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));
}

- (void)_setupClusterMonitor
{
  COClusterRoleMonitorConnectionProvider *roleMonitorConnectionProvider;
  COClusterRoleMonitor *v4;
  COClusterRoleMonitorConnectionProvider *v5;
  void *v6;
  COClusterRoleMonitor *v7;
  COClusterRoleMonitor *clusterRoleMonitor;
  COClusterRoleMonitor *v9;
  OS_dispatch_queue *workQueue;
  id v11;
  _QWORD v12[4];
  id v13;
  id location;

  roleMonitorConnectionProvider = self->_roleMonitorConnectionProvider;
  v4 = [COClusterRoleMonitor alloc];
  if (roleMonitorConnectionProvider)
  {
    v5 = self->_roleMonitorConnectionProvider;
    -[COMessageChannel cluster](self, "cluster");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = -[COClusterRoleMonitor initWithConnectionProvider:cluster:](v4, "initWithConnectionProvider:cluster:", v5, v6);
  }
  else
  {
    -[COMessageChannel cluster](self, "cluster");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = -[COClusterRoleMonitor initWithCluster:](v4, "initWithCluster:", v6);
  }
  clusterRoleMonitor = self->_clusterRoleMonitor;
  self->_clusterRoleMonitor = v7;

  objc_initWeak(&location, self);
  v9 = self->_clusterRoleMonitor;
  workQueue = self->_workQueue;
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __40__COMessageChannel__setupClusterMonitor__block_invoke;
  v12[3] = &unk_24CD3FFE8;
  objc_copyWeak(&v13, &location);
  v11 = -[COClusterRoleMonitor addObserverForSnapshotsToDispatchQueue:block:](v9, "addObserverForSnapshotsToDispatchQueue:block:", workQueue, v12);
  objc_destroyWeak(&v13);
  objc_destroyWeak(&location);
}

void __40__COMessageChannel__setupClusterMonitor__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t j;
  void *v26;
  void *v27;
  int v28;
  void *v29;
  void *v30;
  id v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t k;
  uint64_t v36;
  void *v37;
  void *v38;
  void *v39;
  id v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  _BYTE v53[128];
  _BYTE v54[128];
  _BYTE v55[128];
  uint64_t v56;

  v56 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    objc_msgSend(MEMORY[0x24BDBCEF0], "set");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (void *)MEMORY[0x24BDBCEF0];
    objc_msgSend(WeakRetained, "roleSnapshotsCache");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "allKeys");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setWithArray:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    v51 = 0u;
    v52 = 0u;
    v49 = 0u;
    v50 = 0u;
    v40 = v3;
    v10 = v3;
    v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v49, v55, 16);
    if (v11)
    {
      v12 = v11;
      v13 = *(_QWORD *)v50;
      do
      {
        for (i = 0; i != v12; ++i)
        {
          if (*(_QWORD *)v50 != v13)
            objc_enumerationMutation(v10);
          v15 = *(void **)(*((_QWORD *)&v49 + 1) + 8 * i);
          objc_msgSend(v15, "member");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          v17 = objc_msgSend(v16, "memberType");

          if (v17 != 1)
          {
            objc_msgSend(v15, "member");
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v5, "addObject:", v18);

          }
        }
        v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v49, v55, 16);
      }
      while (v12);
    }

    v19 = (void *)objc_msgSend(v5, "mutableCopy");
    v39 = v9;
    v20 = (void *)objc_msgSend(v9, "mutableCopy");
    objc_msgSend(v20, "minusSet:", v5);
    v38 = v20;
    objc_msgSend(WeakRetained, "_handleRemovedMembers:", v20);
    v47 = 0u;
    v48 = 0u;
    v45 = 0u;
    v46 = 0u;
    v21 = v10;
    v22 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v45, v54, 16);
    if (v22)
    {
      v23 = v22;
      v24 = *(_QWORD *)v46;
      do
      {
        for (j = 0; j != v23; ++j)
        {
          if (*(_QWORD *)v46 != v24)
            objc_enumerationMutation(v21);
          v26 = *(void **)(*((_QWORD *)&v45 + 1) + 8 * j);
          objc_msgSend(v26, "member");
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          v28 = objc_msgSend(v19, "containsObject:", v27);

          if (v28)
          {
            objc_msgSend(WeakRetained, "roleSnapshotsCache");
            v29 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v26, "member");
            v30 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v29, "setObject:forKey:", v26, v30);

          }
        }
        v23 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v45, v54, 16);
      }
      while (v23);
    }

    v43 = 0u;
    v44 = 0u;
    v41 = 0u;
    v42 = 0u;
    v31 = v38;
    v32 = objc_msgSend(v31, "countByEnumeratingWithState:objects:count:", &v41, v53, 16);
    if (v32)
    {
      v33 = v32;
      v34 = *(_QWORD *)v42;
      do
      {
        for (k = 0; k != v33; ++k)
        {
          if (*(_QWORD *)v42 != v34)
            objc_enumerationMutation(v31);
          v36 = *(_QWORD *)(*((_QWORD *)&v41 + 1) + 8 * k);
          objc_msgSend(WeakRetained, "roleSnapshotsCache");
          v37 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v37, "removeObjectForKey:", v36);

        }
        v33 = objc_msgSend(v31, "countByEnumeratingWithState:objects:count:", &v41, v53, 16);
      }
      while (v33);
    }

    objc_msgSend(v19, "minusSet:", v39);
    objc_msgSend(WeakRetained, "_handleAddedMembers:", v19);

    v3 = v40;
  }

}

- (void)_handleAddedMembers:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  id obj;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  -[COMessageChannel sessionProducers](self, "sessionProducers");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "allValues");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  obj = v6;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v22, v27, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v23;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v23 != v9)
          objc_enumerationMutation(obj);
        v11 = *(_QWORD *)(*((_QWORD *)&v22 + 1) + 8 * v10);
        v18 = 0u;
        v19 = 0u;
        v20 = 0u;
        v21 = 0u;
        v12 = v4;
        v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v18, v26, 16);
        if (v13)
        {
          v14 = v13;
          v15 = *(_QWORD *)v19;
          do
          {
            v16 = 0;
            do
            {
              if (*(_QWORD *)v19 != v15)
                objc_enumerationMutation(v12);
              -[COMessageChannel _startSessionWithProducer:member:](self, "_startSessionWithProducer:member:", v11, *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * v16++));
            }
            while (v14 != v16);
            v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v18, v26, 16);
          }
          while (v14);
        }

        ++v10;
      }
      while (v10 != v8);
      v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v22, v27, 16);
    }
    while (v8);
  }

}

- (void)_handleRemovedMembers:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t j;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  id obj;
  uint64_t v31;
  uint64_t v32;
  void *v33;
  void *v34;
  uint64_t v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  _BYTE v48[128];
  _BYTE v49[128];
  _BYTE v50[128];
  uint64_t v51;

  v51 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("COMessageSessionErrorDomain"), -1212, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v44 = 0u;
  v45 = 0u;
  v46 = 0u;
  v47 = 0u;
  obj = v4;
  v32 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v44, v50, 16);
  if (v32)
  {
    v31 = *(_QWORD *)v45;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v45 != v31)
          objc_enumerationMutation(obj);
        v35 = v6;
        v7 = *(_QWORD *)(*((_QWORD *)&v44 + 1) + 8 * v6);
        -[COMessageChannel sessionProducers](self, "sessionProducers");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = (void *)objc_msgSend(v8, "copy");

        v42 = 0u;
        v43 = 0u;
        v40 = 0u;
        v41 = 0u;
        v34 = v9;
        objc_msgSend(v9, "allValues");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v40, v49, 16);
        if (v11)
        {
          v12 = v11;
          v13 = *(_QWORD *)v41;
          do
          {
            for (i = 0; i != v12; ++i)
            {
              if (*(_QWORD *)v41 != v13)
                objc_enumerationMutation(v10);
              v15 = *(void **)(*((_QWORD *)&v40 + 1) + 8 * i);
              objc_msgSend(v15, "sessions");
              v16 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v16, "objectForKey:", v7);
              v17 = (void *)objc_claimAutoreleasedReturnValue();

              if (v17)
              {
                -[COMessageChannel _deliverDidEndDelegateForSession:notice:initiator:error:](self, "_deliverDidEndDelegateForSession:notice:initiator:error:", v17, 0, 0, v5);
                objc_msgSend(v15, "sessions");
                v18 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v18, "removeObjectForKey:", v7);

              }
            }
            v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v40, v49, 16);
          }
          while (v12);
        }

        -[COMessageChannel sessionConsumers](self, "sessionConsumers");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v20 = (void *)objc_msgSend(v19, "copy");

        v38 = 0u;
        v39 = 0u;
        v36 = 0u;
        v37 = 0u;
        v33 = v20;
        objc_msgSend(v20, "allValues");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        v22 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v36, v48, 16);
        if (v22)
        {
          v23 = v22;
          v24 = *(_QWORD *)v37;
          do
          {
            for (j = 0; j != v23; ++j)
            {
              if (*(_QWORD *)v37 != v24)
                objc_enumerationMutation(v21);
              v26 = *(void **)(*((_QWORD *)&v36 + 1) + 8 * j);
              objc_msgSend(v26, "sessions");
              v27 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v27, "objectForKey:", v7);
              v28 = (void *)objc_claimAutoreleasedReturnValue();

              if (v28)
              {
                -[COMessageChannel _deliverDidEndDelegateForSession:notice:initiator:error:](self, "_deliverDidEndDelegateForSession:notice:initiator:error:", v28, 0, 0, v5);
                objc_msgSend(v26, "sessions");
                v29 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v29, "removeObjectForKey:", v7);

              }
            }
            v23 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v36, v48, 16);
          }
          while (v23);
        }

        v6 = v35 + 1;
      }
      while (v35 + 1 != v32);
      v32 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v44, v50, 16);
    }
    while (v32);
  }

}

- (void)_submitMetricsForActivationCompletionWithError:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD *v10;
  void (*v11)(_QWORD *, __CFString *, _QWORD *);
  id v12;
  _QWORD v13[4];
  id v14;

  v4 = a3;
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[COMessageChannel clusterLabel](self, "clusterLabel");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v6, 0x24CD413B0);

  -[COMessageChannel topic](self, "topic");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v7, 0x24CD415F0);

  if (v4)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%ld"), objc_msgSend(v4, "code"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v8, 0x24CD41450);

    objc_msgSend(v4, "domain");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v9, 0x24CD41410);

  }
  -[COMessageChannel recorder](self, "recorder");
  v10 = (_QWORD *)objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = __67__COMessageChannel__submitMetricsForActivationCompletionWithError___block_invoke;
  v13[3] = &unk_24CD40010;
  v14 = v5;
  v11 = (void (*)(_QWORD *, __CFString *, _QWORD *))v10[2];
  v12 = v5;
  v11(v10, CFSTR("com.apple.com.apple.CoordinationCore.MessageChannel_1"), v13);

}

id __67__COMessageChannel__submitMetricsForActivationCompletionWithError___block_invoke(uint64_t a1)
{
  return *(id *)(a1 + 32);
}

- (void)_submitMetricsForSession:(id)a3 withError:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  double v14;
  void *v15;
  void *v16;
  void *v17;
  _QWORD *v18;
  void (*v19)(_QWORD *, __CFString *, _QWORD *);
  id v20;
  _QWORD v21[4];
  id v22;

  v6 = a3;
  v7 = a4;
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[COMessageChannel topic](self, "topic");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setObject:forKeyedSubscript:", v9, 0x24CD415F0);

  -[COMessageChannel clusterLabel](self, "clusterLabel");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setObject:forKeyedSubscript:", v10, 0x24CD413B0);

  if (v6)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", objc_msgSend(v6, "didUseRequest"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setObject:forKeyedSubscript:", v11, 0x24CD41630);

    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", objc_msgSend(v6, "didUseResponse"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setObject:forKeyedSubscript:", v12, 0x24CD41650);

    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", objc_msgSend(v6, "didUseNotice"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setObject:forKeyedSubscript:", v13, 0x24CD41610);

    v14 = fmax((double)(clock_gettime_nsec_np(_CLOCK_UPTIME_RAW) - objc_msgSend(v6, "startTime")) / 1000000000.0, 0.0);
  }
  else
  {
    v14 = 0.0;
  }
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setObject:forKeyedSubscript:", v15, 0x24CD40C90);

  if (v7)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%ld"), objc_msgSend(v7, "code"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setObject:forKeyedSubscript:", v16, 0x24CD41450);

    objc_msgSend(v7, "domain");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setObject:forKeyedSubscript:", v17, 0x24CD41410);

  }
  -[COMessageChannel recorder](self, "recorder");
  v18 = (_QWORD *)objc_claimAutoreleasedReturnValue();
  v21[0] = MEMORY[0x24BDAC760];
  v21[1] = 3221225472;
  v21[2] = __55__COMessageChannel__submitMetricsForSession_withError___block_invoke;
  v21[3] = &unk_24CD40010;
  v22 = v8;
  v19 = (void (*)(_QWORD *, __CFString *, _QWORD *))v18[2];
  v20 = v8;
  v19(v18, CFSTR("com.apple.CoordinationCore.MessageChannelSessions_1"), v21);

}

id __55__COMessageChannel__submitMetricsForSession_withError___block_invoke(uint64_t a1)
{
  return *(id *)(a1 + 32);
}

- (void)_submitMetricsForRequest:(id)a3 withRequestInfo:(id)a4 withError:(id)a5
{
  id v8;
  id v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  _QWORD *v26;
  void (*v27)(_QWORD *, __CFString *, _QWORD *);
  id v28;
  _QWORD v29[4];
  id v30;

  v8 = a4;
  v9 = a5;
  v10 = (void *)MEMORY[0x24BDBCED8];
  v11 = a3;
  objc_msgSend(v10, "dictionary");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[COMessageChannel clusterLabel](self, "clusterLabel");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setObject:forKeyedSubscript:", v13, 0x24CD413B0);

  -[COMessageChannel topic](self, "topic");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setObject:forKeyedSubscript:", v14, 0x24CD41390);

  v15 = objc_opt_class();
  -[COMessageChannel _payloadTypeFromClass:](self, "_payloadTypeFromClass:", v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setObject:forKeyedSubscript:", v16, 0x24CD413D0);

  if (v8)
  {
    objc_msgSend(v8, "destinationInfo");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setObject:forKeyedSubscript:", v17, 0x24CD413F0);

  }
  else
  {
    objc_msgSend(v12, "setObject:forKeyedSubscript:", 0x24CD414D0, 0x24CD413F0);
  }
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", objc_msgSend(v8, "messageSize"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setObject:forKeyedSubscript:", v18, 0x24CD41490);

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", objc_msgSend(v8, "expectedRecipients") * objc_msgSend(v8, "messageSize"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setObject:forKeyedSubscript:", v19, 0x24CD414B0);

  if (v9)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%ld"), objc_msgSend(v9, "code"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setObject:forKeyedSubscript:", v20, 0x24CD41450);

    objc_msgSend(v9, "domain");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setObject:forKeyedSubscript:", v21, 0x24CD41410);

    objc_msgSend(v9, "userInfo");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "objectForKeyedSubscript:", *MEMORY[0x24BDD1398]);
    v23 = (void *)objc_claimAutoreleasedReturnValue();

    if (v23)
    {
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%ld"), objc_msgSend(v23, "code"));
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "setObject:forKeyedSubscript:", v24, 0x24CD41470);

      objc_msgSend(v23, "domain");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "setObject:forKeyedSubscript:", v25, 0x24CD41430);

    }
  }
  -[COMessageChannel recorder](self, "recorder");
  v26 = (_QWORD *)objc_claimAutoreleasedReturnValue();
  v29[0] = MEMORY[0x24BDAC760];
  v29[1] = 3221225472;
  v29[2] = __71__COMessageChannel__submitMetricsForRequest_withRequestInfo_withError___block_invoke;
  v29[3] = &unk_24CD40010;
  v30 = v12;
  v27 = (void (*)(_QWORD *, __CFString *, _QWORD *))v26[2];
  v28 = v12;
  v27(v26, CFSTR("com.apple.CoordinationCore.Messaging_1"), v29);

}

id __71__COMessageChannel__submitMetricsForRequest_withRequestInfo_withError___block_invoke(uint64_t a1)
{
  return *(id *)(a1 + 32);
}

- (void)_submitMetricsForResponse:(id)a3 size:(unint64_t)a4 withError:(id)a5
{
  id v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  _QWORD *v24;
  void (*v25)(_QWORD *, __CFString *, _QWORD *);
  id v26;
  _QWORD v27[4];
  id v28;

  v8 = a5;
  v9 = (void *)MEMORY[0x24BDBCED8];
  v10 = a3;
  objc_msgSend(v9, "dictionary");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[COMessageChannel clusterLabel](self, "clusterLabel");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setObject:forKeyedSubscript:", v12, 0x24CD413B0);

  -[COMessageChannel topic](self, "topic");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setObject:forKeyedSubscript:", v13, 0x24CD41390);

  v14 = objc_opt_class();
  -[COMessageChannel _payloadTypeFromClass:](self, "_payloadTypeFromClass:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setObject:forKeyedSubscript:", v15, 0x24CD413D0);

  objc_msgSend(v11, "setObject:forKeyedSubscript:", 0x24CD414F0, 0x24CD413F0);
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", a4);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setObject:forKeyedSubscript:", v16, 0x24CD41490);

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", a4);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setObject:forKeyedSubscript:", v17, 0x24CD414B0);

  if (v8)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%ld"), objc_msgSend(v8, "code"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setObject:forKeyedSubscript:", v18, 0x24CD41450);

    objc_msgSend(v8, "domain");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setObject:forKeyedSubscript:", v19, 0x24CD41410);

    objc_msgSend(v8, "userInfo");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "objectForKeyedSubscript:", *MEMORY[0x24BDD1398]);
    v21 = (void *)objc_claimAutoreleasedReturnValue();

    if (v21)
    {
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%ld"), objc_msgSend(v21, "code"));
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "setObject:forKeyedSubscript:", v22, 0x24CD41470);

      objc_msgSend(v21, "domain");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "setObject:forKeyedSubscript:", v23, 0x24CD41430);

    }
  }
  -[COMessageChannel recorder](self, "recorder");
  v24 = (_QWORD *)objc_claimAutoreleasedReturnValue();
  v27[0] = MEMORY[0x24BDAC760];
  v27[1] = 3221225472;
  v27[2] = __61__COMessageChannel__submitMetricsForResponse_size_withError___block_invoke;
  v27[3] = &unk_24CD40010;
  v28 = v11;
  v25 = (void (*)(_QWORD *, __CFString *, _QWORD *))v24[2];
  v26 = v11;
  v25(v24, CFSTR("com.apple.CoordinationCore.Messaging_1"), v27);

}

id __61__COMessageChannel__submitMetricsForResponse_size_withError___block_invoke(uint64_t a1)
{
  return *(id *)(a1 + 32);
}

- (NSString)topic
{
  return self->_topic;
}

- (id)cluster
{
  return self->_cluster;
}

- (NSString)clusterLabel
{
  return self->_clusterLabel;
}

- (NSXPCConnection)lastConnection
{
  return (NSXPCConnection *)objc_loadWeakRetained((id *)&self->_lastConnection);
}

- (void)setLastConnection:(id)a3
{
  objc_storeWeak((id *)&self->_lastConnection, a3);
}

- (unint64_t)sendLimit
{
  return self->_sendLimit;
}

- (void)setSendLimit:(unint64_t)a3
{
  self->_sendLimit = a3;
}

- (unint64_t)receiveLimit
{
  return self->_receiveLimit;
}

- (void)setReceiveLimit:(unint64_t)a3
{
  self->_receiveLimit = a3;
}

- (COClusterRoleMonitor)clusterRoleMonitor
{
  return self->_clusterRoleMonitor;
}

- (void)setClusterRoleMonitor:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (NSMutableDictionary)roleSnapshotsCache
{
  return self->_roleSnapshotsCache;
}

- (void)setRoleSnapshotsCache:(id)a3
{
  objc_storeStrong((id *)&self->_roleSnapshotsCache, a3);
}

- (NSMutableDictionary)outstandingRequests
{
  return self->_outstandingRequests;
}

- (void)setOutstandingRequests:(id)a3
{
  objc_storeStrong((id *)&self->_outstandingRequests, a3);
}

- (id)recorder
{
  return self->_recorder;
}

- (void)setRecorder:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 96);
}

- (os_unfair_lock_s)lock
{
  return self->_lock;
}

- (void)setLock:(os_unfair_lock_s)a3
{
  self->_lock = a3;
}

- (BOOL)activated
{
  return self->_activated;
}

- (void)setActivated:(BOOL)a3
{
  self->_activated = a3;
}

- (unsigned)baseRequestID
{
  return self->_baseRequestID;
}

- (void)setBaseRequestID:(unsigned int)a3
{
  self->_baseRequestID = a3;
}

- (OS_dispatch_queue)workQueue
{
  return self->_workQueue;
}

- (void)setWorkQueue:(id)a3
{
  objc_storeStrong((id *)&self->_workQueue, a3);
}

- (NSMutableDictionary)requestHandlers
{
  return self->_requestHandlers;
}

- (void)setRequestHandlers:(id)a3
{
  objc_storeStrong((id *)&self->_requestHandlers, a3);
}

- (NSMutableDictionary)sessionProducers
{
  return self->_sessionProducers;
}

- (void)setSessionProducers:(id)a3
{
  objc_storeStrong((id *)&self->_sessionProducers, a3);
}

- (NSMutableDictionary)sessionConsumers
{
  return self->_sessionConsumers;
}

- (void)setSessionConsumers:(id)a3
{
  objc_storeStrong((id *)&self->_sessionConsumers, a3);
}

- (NSMutableDictionary)sessionsInflight
{
  return self->_sessionsInflight;
}

- (void)setSessionsInflight:(id)a3
{
  objc_storeStrong((id *)&self->_sessionsInflight, a3);
}

- (COMessageChannelConnectionProvider)provider
{
  return self->_provider;
}

- (COClusterRoleMonitorConnectionProvider)roleMonitorConnectionProvider
{
  return self->_roleMonitorConnectionProvider;
}

- (id)foundHandler
{
  return self->_foundHandler;
}

- (void)setFoundHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 160);
}

- (id)lostHandler
{
  return self->_lostHandler;
}

- (void)setLostHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 168);
}

- (NSSet)groupedHomeKitIdentifiers
{
  return self->_groupedHomeKitIdentifiers;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_groupedHomeKitIdentifiers, 0);
  objc_storeStrong(&self->_lostHandler, 0);
  objc_storeStrong(&self->_foundHandler, 0);
  objc_storeStrong((id *)&self->_roleMonitorConnectionProvider, 0);
  objc_storeStrong((id *)&self->_provider, 0);
  objc_storeStrong((id *)&self->_sessionsInflight, 0);
  objc_storeStrong((id *)&self->_sessionConsumers, 0);
  objc_storeStrong((id *)&self->_sessionProducers, 0);
  objc_storeStrong((id *)&self->_requestHandlers, 0);
  objc_storeStrong((id *)&self->_workQueue, 0);
  objc_storeStrong(&self->_recorder, 0);
  objc_storeStrong((id *)&self->_outstandingRequests, 0);
  objc_storeStrong((id *)&self->_roleSnapshotsCache, 0);
  objc_storeStrong((id *)&self->_clusterRoleMonitor, 0);
  objc_destroyWeak((id *)&self->_lastConnection);
  objc_storeStrong((id *)&self->_clusterLabel, 0);
  objc_storeStrong(&self->_cluster, 0);
  objc_storeStrong((id *)&self->_topic, 0);
}

void __44___COMessageChannel_activateWithCompletion___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  _QWORD v4[5];
  id v5;

  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 184) = 1;
  objc_msgSend(*(id *)(a1 + 32), "rapportTransport");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __44___COMessageChannel_activateWithCompletion___block_invoke_2;
  v4[3] = &unk_24CD403B0;
  v3 = *(id *)(a1 + 40);
  v4[4] = *(_QWORD *)(a1 + 32);
  v5 = v3;
  objc_msgSend(v2, "activateWithCompletion:", v4);

}

void __44___COMessageChannel_activateWithCompletion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  NSObject *v15;
  id v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  NSObject *v27;
  id v28;
  uint64_t v29;
  void *v30;
  _QWORD v31[4];
  id v32;
  uint64_t v33;
  id v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  _QWORD block[4];
  id v40;
  uint64_t v41;
  id v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  _BYTE v47[128];
  uint8_t v48[128];
  uint8_t buf[4];
  uint64_t v50;
  __int16 v51;
  id v52;
  uint64_t v53;

  v53 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  COLogForCategory(5);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = *(_QWORD *)(a1 + 32);
    *(_DWORD *)buf = 134218242;
    v50 = v5;
    v51 = 2112;
    v52 = v3;
    _os_log_impl(&dword_21214B000, v4, OS_LOG_TYPE_DEFAULT, "%p channel activation complete with error %@", buf, 0x16u);
  }
  v30 = v3;

  v45 = 0u;
  v46 = 0u;
  v43 = 0u;
  v44 = 0u;
  objc_msgSend(*(id *)(a1 + 32), "sessionProducers");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v43, v48, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v44;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v44 != v9)
          objc_enumerationMutation(v6);
        v11 = *(_QWORD *)(*((_QWORD *)&v43 + 1) + 8 * v10);
        objc_msgSend(*(id *)(a1 + 32), "sessionProducers", v30);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "objectForKey:", v11);
        v13 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v13, "delegate");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "delegateQueue");
        v15 = objc_claimAutoreleasedReturnValue();
        if ((objc_opt_respondsToSelector() & 1) != 0)
        {
          block[0] = MEMORY[0x24BDAC760];
          block[1] = 3221225472;
          block[2] = __44___COMessageChannel_activateWithCompletion___block_invoke_14;
          block[3] = &unk_24CD3F310;
          v16 = v14;
          v17 = *(_QWORD *)(a1 + 32);
          v40 = v16;
          v41 = v17;
          v42 = v13;
          dispatch_async(v15, block);

        }
        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v43, v48, 16);
    }
    while (v8);
  }

  v37 = 0u;
  v38 = 0u;
  v35 = 0u;
  v36 = 0u;
  objc_msgSend(*(id *)(a1 + 32), "sessionConsumers");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v35, v47, 16);
  if (v19)
  {
    v20 = v19;
    v21 = *(_QWORD *)v36;
    do
    {
      v22 = 0;
      do
      {
        if (*(_QWORD *)v36 != v21)
          objc_enumerationMutation(v18);
        v23 = *(_QWORD *)(*((_QWORD *)&v35 + 1) + 8 * v22);
        objc_msgSend(*(id *)(a1 + 32), "sessionConsumers", v30);
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "objectForKey:", v23);
        v25 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v25, "delegate");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "delegateQueue");
        v27 = objc_claimAutoreleasedReturnValue();
        if ((objc_opt_respondsToSelector() & 1) != 0)
        {
          v31[0] = MEMORY[0x24BDAC760];
          v31[1] = 3221225472;
          v31[2] = __44___COMessageChannel_activateWithCompletion___block_invoke_2_18;
          v31[3] = &unk_24CD3F310;
          v28 = v26;
          v29 = *(_QWORD *)(a1 + 32);
          v32 = v28;
          v33 = v29;
          v34 = v25;
          dispatch_async(v27, v31);

        }
        ++v22;
      }
      while (v20 != v22);
      v20 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v35, v47, 16);
    }
    while (v20);
  }

}

uint64_t __44___COMessageChannel_activateWithCompletion___block_invoke_14(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "channel:didAddProducer:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

uint64_t __44___COMessageChannel_activateWithCompletion___block_invoke_2_18(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "channel:didAddConsumer:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

uint64_t __63___COMessageChannel_sendRequest_members_withCompletionHandler___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_onqueue_sendRequest:members:withCompletionHandler:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));
}

void __83___COMessageChannel_broadcastRequest_recipientsCallback_responseCompletionHandler___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t j;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  id v21;
  void *v22;
  id obj;
  _QWORD v24[5];
  id v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  _BYTE v34[128];
  _BYTE v35[128];
  uint64_t v36;

  v36 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "rapportTransport");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "activeMembers");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v32 = 0u;
  v33 = 0u;
  v30 = 0u;
  v31 = 0u;
  v5 = v4;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v30, v35, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v31;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v31 != v8)
          objc_enumerationMutation(v5);
        +[COClusterMemberRoleSnapshot snapshotWithParticipantRoleForMember:](COClusterMemberRoleSnapshot, "snapshotWithParticipantRoleForMember:", *(_QWORD *)(*((_QWORD *)&v30 + 1) + 8 * i));
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v2, "addObject:", v10);

      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v30, v35, 16);
    }
    while (v7);
  }
  v22 = v5;

  v11 = *(_QWORD *)(a1 + 48);
  v12 = (void *)objc_msgSend(v2, "copy");
  (*(void (**)(uint64_t, void *, _QWORD))(v11 + 16))(v11, v12, 0);

  v28 = 0u;
  v29 = 0u;
  v26 = 0u;
  v27 = 0u;
  obj = v2;
  v13 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v26, v34, 16);
  if (v13)
  {
    v14 = v13;
    v15 = *(_QWORD *)v27;
    do
    {
      for (j = 0; j != v14; ++j)
      {
        if (*(_QWORD *)v27 != v15)
          objc_enumerationMutation(obj);
        v17 = *(void **)(*((_QWORD *)&v26 + 1) + 8 * j);
        objc_msgSend(v17, "member", v22);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(a1 + 32), "rapportTransport");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v20 = *(_QWORD *)(a1 + 40);
        v24[0] = MEMORY[0x24BDAC760];
        v24[1] = 3221225472;
        v24[2] = __83___COMessageChannel_broadcastRequest_recipientsCallback_responseCompletionHandler___block_invoke_2;
        v24[3] = &unk_24CD3F060;
        v21 = *(id *)(a1 + 56);
        v24[4] = v17;
        v25 = v21;
        objc_msgSend(v19, "sendRequest:to:withCompletionHandler:", v20, v18, v24);

      }
      v14 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v26, v34, 16);
    }
    while (v14);
  }

}

uint64_t __83___COMessageChannel_broadcastRequest_recipientsCallback_responseCompletionHandler___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32), a2, a3);
}

void __72___COMessageChannel__onqueue_sendRequest_members_withCompletionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v5;
  id v6;
  id v7;
  id v8;

  v5 = *(_QWORD *)(a1 + 32);
  v6 = a3;
  v7 = a2;
  +[COClusterMemberRoleSnapshot snapshotWithParticipantRoleForMember:](COClusterMemberRoleSnapshot, "snapshotWithParticipantRoleForMember:", v5);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

void __53___COMessageChannel_registerHandler_forRequestClass___block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  void *v4;
  id v5;

  if (objc_msgSend(*(id *)(a1 + 32), "activated"))
  {
    COLogForCategory(5);
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
      __53___COMessageChannel_registerHandler_forRequestClass___block_invoke_cold_1();

  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "requestHandlers");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    v3 = (void *)MEMORY[0x212BE9A2C](*(_QWORD *)(a1 + 40));
    objc_msgSend(*(id *)(a1 + 32), "_payloadTypeFromClass:", *(_QWORD *)(a1 + 48));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKey:", v3, v4);

  }
}

void __48___COMessageChannel_registerMemberFoundHandler___block_invoke(uint64_t a1)
{
  NSObject *v2;

  if (objc_msgSend(*(id *)(a1 + 32), "activated"))
  {
    COLogForCategory(5);
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
      __48___COMessageChannel_registerMemberFoundHandler___block_invoke_cold_1();

  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "setFoundHandler:", *(_QWORD *)(a1 + 40));
  }
}

void __47___COMessageChannel_registerMemberLostHandler___block_invoke(uint64_t a1)
{
  NSObject *v2;

  if (objc_msgSend(*(id *)(a1 + 32), "activated"))
  {
    COLogForCategory(5);
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
      __47___COMessageChannel_registerMemberLostHandler___block_invoke_cold_1();

  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "setLostHandler:", *(_QWORD *)(a1 + 40));
  }
}

void __46___COMessageChannel_groupedHomeKitIdentifiers__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  id v5;

  objc_msgSend(*(id *)(a1 + 32), "rapportTransport");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "groupHKIdentifiers");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

void __50___COMessageChannel_addGroupedHomeKitIdentifiers___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "rapportTransport");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addHomeKitGroupIdentifiers:", *(_QWORD *)(a1 + 40));

}

void __53___COMessageChannel_removeGroupedHomeKitIdentifiers___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "rapportTransport");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "removeHomeKitGroupIdentifiers:", *(_QWORD *)(a1 + 40));

}

void __75___COMessageChannel_addSessionProducerWithSubTopic_delegate_dispatchQueue___block_invoke(uint64_t a1)
{
  void *v2;
  NSObject *v3;
  id v4;
  uint64_t v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  COMessageSessionProducer *v10;
  void *v11;
  _QWORD v12[4];
  id v13;
  id v14;
  id location;
  _QWORD block[4];
  id v17;
  uint64_t v18;
  id v19;
  id v20;

  if (*(_BYTE *)(*(_QWORD *)(a1 + 32) + 184))
  {
    if ((objc_opt_respondsToSelector() & 1) == 0)
      return;
    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("COMessageChannelErrorDomain"), -1202, 0);
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __75___COMessageChannel_addSessionProducerWithSubTopic_delegate_dispatchQueue___block_invoke_2;
    block[3] = &unk_24CD3FBE8;
    v3 = *(NSObject **)(a1 + 48);
    v4 = *(id *)(a1 + 40);
    v5 = *(_QWORD *)(a1 + 32);
    v17 = v4;
    v18 = v5;
    v19 = *(id *)(a1 + 56);
    v20 = v2;
    v6 = v2;
    dispatch_async(v3, block);

  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "_commandTypeForProducerWithSubTopic:", *(_QWORD *)(a1 + 56));
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_initWeak(&location, *(id *)(a1 + 32));
    v12[0] = MEMORY[0x24BDAC760];
    v12[1] = 3221225472;
    v12[2] = __75___COMessageChannel_addSessionProducerWithSubTopic_delegate_dispatchQueue___block_invoke_3;
    v12[3] = &unk_24CD3FC10;
    objc_copyWeak(&v14, &location);
    v13 = *(id *)(a1 + 56);
    v7 = (void *)MEMORY[0x212BE9A2C](v12);
    objc_msgSend(*(id *)(a1 + 32), "requestHandlers");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (void *)MEMORY[0x212BE9A2C](v7);
    objc_msgSend(v8, "setObject:forKey:", v9, v6);

    v10 = -[COMessageSessionProducer initWithChannel:subTopic:delegate:dispatchQueue:]([COMessageSessionProducer alloc], "initWithChannel:subTopic:delegate:dispatchQueue:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
    objc_msgSend(*(id *)(a1 + 32), "sessionProducers");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setObject:forKey:", v10, *(_QWORD *)(a1 + 56));

    objc_destroyWeak(&v14);
    objc_destroyWeak(&location);
  }

}

uint64_t __75___COMessageChannel_addSessionProducerWithSubTopic_delegate_dispatchQueue___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "channel:didFailToAddProducerWithSubTopic:error:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));
}

void __75___COMessageChannel_addSessionProducerWithSubTopic_delegate_dispatchQueue___block_invoke_3(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  id WeakRetained;
  id v11;
  NSObject *v12;

  v7 = a2;
  v8 = a3;
  v9 = a4;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v11 = v7;
    if (objc_msgSend(v11, "commandType") == 2)
    {
      objc_msgSend(WeakRetained, "_onqueue_handleStopCommand:fromMember:callback:", v11, v8, v9);
    }
    else if (objc_msgSend(v11, "commandType"))
    {
      COLogForCategory(6);
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
        __75___COMessageChannel_addSessionProducerWithSubTopic_delegate_dispatchQueue___block_invoke_3_cold_1((uint64_t)WeakRetained, a1, v12);

    }
    else
    {
      objc_msgSend(WeakRetained, "_onqueue_handleCapableCommand:fromMember:callback:", v11, v8, v9);
    }

  }
}

void __75___COMessageChannel_addSessionConsumerWithSubTopic_delegate_dispatchQueue___block_invoke(uint64_t a1)
{
  _BYTE *v2;
  void *v3;
  NSObject *v4;
  id v5;
  uint64_t v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  objc_class *v11;
  void *v12;
  COMessageSessionConsumer *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  void (*v17)(uint64_t, void *, void *, void *);
  void *v18;
  id v19;
  id location;
  _QWORD block[4];
  id v22;
  uint64_t v23;
  id v24;
  id v25;

  v2 = *(_BYTE **)(a1 + 32);
  if (v2[184])
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("COMessageChannelErrorDomain"), -1203, 0);
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      block[0] = MEMORY[0x24BDAC760];
      block[1] = 3221225472;
      block[2] = __75___COMessageChannel_addSessionConsumerWithSubTopic_delegate_dispatchQueue___block_invoke_2;
      block[3] = &unk_24CD3FBE8;
      v4 = *(NSObject **)(a1 + 48);
      v5 = *(id *)(a1 + 40);
      v6 = *(_QWORD *)(a1 + 32);
      v22 = v5;
      v23 = v6;
      v24 = *(id *)(a1 + 56);
      v25 = v3;
      v7 = v3;
      dispatch_async(v4, block);

    }
  }
  else
  {
    objc_initWeak(&location, v2);
    v15 = MEMORY[0x24BDAC760];
    v16 = 3221225472;
    v17 = __75___COMessageChannel_addSessionConsumerWithSubTopic_delegate_dispatchQueue___block_invoke_3;
    v18 = &unk_24CD3FC38;
    objc_copyWeak(&v19, &location);
    v8 = (void *)MEMORY[0x212BE9A2C](&v15);
    objc_msgSend(*(id *)(a1 + 32), "requestHandlers", v15, v16, v17, v18);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (void *)MEMORY[0x212BE9A2C](v8);
    v11 = (objc_class *)objc_opt_class();
    NSStringFromClass(v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setObject:forKey:", v10, v12);

    v13 = -[COMessageSessionConsumer initWithChannel:subTopic:delegate:dispatchQueue:]([COMessageSessionConsumer alloc], "initWithChannel:subTopic:delegate:dispatchQueue:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
    objc_msgSend(*(id *)(a1 + 32), "sessionConsumers");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setObject:forKey:", v13, *(_QWORD *)(a1 + 56));

    objc_destroyWeak(&v19);
    objc_destroyWeak(&location);
  }
}

uint64_t __75___COMessageChannel_addSessionConsumerWithSubTopic_delegate_dispatchQueue___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "channel:didFailToAddConsumerWithSubTopic:error:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));
}

void __75___COMessageChannel_addSessionConsumerWithSubTopic_delegate_dispatchQueue___block_invoke_3(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  id WeakRetained;
  void *v11;
  NSObject *v12;
  _QWORD v13[4];
  id v14;
  void *v15;
  id v16;
  id v17;

  v7 = a2;
  v8 = a3;
  v9 = a4;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v11 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "workQueue");
    v12 = objc_claimAutoreleasedReturnValue();
    v13[0] = MEMORY[0x24BDAC760];
    v13[1] = 3221225472;
    v13[2] = __75___COMessageChannel_addSessionConsumerWithSubTopic_delegate_dispatchQueue___block_invoke_4;
    v13[3] = &unk_24CD3EF48;
    v14 = v7;
    v15 = v11;
    v16 = v8;
    v17 = v9;
    dispatch_async(v12, v13);

  }
}

void __75___COMessageChannel_addSessionConsumerWithSubTopic_delegate_dispatchQueue___block_invoke_4(uint64_t a1)
{
  id v2;
  NSObject *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  NSObject *v8;
  NSObject *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  int v13;
  uint64_t v14;
  __int16 v15;
  void *v16;
  __int16 v17;
  uint64_t v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v2 = *(id *)(a1 + 32);
  if (objc_msgSend(v2, "commandType") == 1)
  {
    COLogForCategory(5);
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      v4 = *(_QWORD *)(a1 + 40);
      objc_msgSend(v2, "subTopic");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = *(_QWORD *)(a1 + 48);
      v13 = 134218498;
      v14 = v4;
      v15 = 2112;
      v16 = v5;
      v17 = 2112;
      v18 = v6;
      _os_log_impl(&dword_21214B000, v3, OS_LOG_TYPE_DEFAULT, "%p Message channel received a session management request to start a session for subtopic %@ from member %@", (uint8_t *)&v13, 0x20u);

    }
    objc_msgSend(*(id *)(a1 + 40), "_onqueue_handleStartCommand:withMember:callback:", v2, *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));
  }
  else
  {
    v7 = objc_msgSend(v2, "commandType");
    COLogForCategory(5);
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = v8;
    if (v7 == 2)
    {
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        v10 = *(_QWORD *)(a1 + 40);
        objc_msgSend(v2, "subTopic");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = *(_QWORD *)(a1 + 48);
        v13 = 134218498;
        v14 = v10;
        v15 = 2112;
        v16 = v11;
        v17 = 2112;
        v18 = v12;
        _os_log_impl(&dword_21214B000, v9, OS_LOG_TYPE_DEFAULT, "%p Message channel received a session management request to stop a session for subtopic %@ from member %@", (uint8_t *)&v13, 0x20u);

      }
      objc_msgSend(*(id *)(a1 + 40), "_onqueue_handleStopCommand:fromMember:callback:", v2, *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));
    }
    else
    {
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
        __75___COMessageChannel_addSessionConsumerWithSubTopic_delegate_dispatchQueue___block_invoke_4_cold_1(a1, v2, v9);

    }
  }

}

void __62___COMessageChannel__onqueue_startSessionWithProducer_member___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  _QWORD v5[4];
  id v6;
  id v7;
  id v8;

  v2 = *(void **)(a1 + 32);
  v3 = *(_QWORD *)(a1 + 40);
  v4 = *(_QWORD *)(a1 + 48);
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __62___COMessageChannel__onqueue_startSessionWithProducer_member___block_invoke_2;
  v5[3] = &unk_24CD3FEB8;
  objc_copyWeak(&v8, (id *)(a1 + 64));
  v6 = *(id *)(a1 + 56);
  v7 = *(id *)(a1 + 40);
  objc_msgSend(v2, "producer:shouldStartSessionWithMember:completionHandler:", v3, v4, v5);

  objc_destroyWeak(&v8);
}

void __62___COMessageChannel__onqueue_startSessionWithProducer_member___block_invoke_2(id *a1, int a2, void *a3)
{
  id v5;
  id WeakRetained;
  NSObject *v7;
  _BOOL4 v8;
  id v9;
  NSObject *v10;
  id v11;
  _QWORD v12[5];
  id v13;
  id v14;
  id v15;
  uint8_t buf[4];
  id v17;
  __int16 v18;
  id v19;
  __int16 v20;
  id v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  WeakRetained = objc_loadWeakRetained(a1 + 6);
  if (WeakRetained)
  {
    COLogForCategory(6);
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);
    if (a2)
    {
      if (v8)
      {
        v9 = a1[4];
        *(_DWORD *)buf = 134218498;
        v17 = WeakRetained;
        v18 = 2112;
        v19 = v9;
        v20 = 2112;
        v21 = v5;
        _os_log_impl(&dword_21214B000, v7, OS_LOG_TYPE_DEFAULT, "%p Client wants to start a session with member %@ with request %@", buf, 0x20u);
      }

      objc_msgSend(WeakRetained, "workQueue");
      v10 = objc_claimAutoreleasedReturnValue();
      v12[0] = MEMORY[0x24BDAC760];
      v12[1] = 3221225472;
      v12[2] = __62___COMessageChannel__onqueue_startSessionWithProducer_member___block_invoke_34;
      v12[3] = &unk_24CD3FBE8;
      v12[4] = WeakRetained;
      v13 = a1[5];
      v14 = a1[4];
      v15 = v5;
      dispatch_async(v10, v12);

    }
    else
    {
      if (v8)
      {
        v11 = a1[4];
        *(_DWORD *)buf = 134218242;
        v17 = WeakRetained;
        v18 = 2112;
        v19 = v11;
        _os_log_impl(&dword_21214B000, v7, OS_LOG_TYPE_DEFAULT, "%p Client does not want to start a session with member %@", buf, 0x16u);
      }

    }
  }

}

uint64_t __62___COMessageChannel__onqueue_startSessionWithProducer_member___block_invoke_34(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_onqueue_startSessionWithProducer:member:request:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));
}

void __70___COMessageChannel__onqueue_startSessionWithProducer_member_request___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  id WeakRetained;
  void *v11;
  uint64_t v12;
  NSObject *v13;
  void *v14;
  id v15;
  id v16;
  void *v17;
  NSObject *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  NSString *v25;
  uint64_t v26;
  NSString *v27;
  Class v28;
  COMessageProducedSession *v29;
  NSObject *v30;
  void *v31;
  void *v32;
  uint64_t v33;
  uint64_t v34;
  void *v35;
  void *v36;
  COMessageSessionManagementRequest *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  COMessageProducedSession *v45;
  void *v46;
  void *v47;
  COMessageSessionManagementRequest *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  NSString *v53;
  id v54;
  uint64_t v55;
  COMessageProducedSession *v56;
  const __CFString *v57;
  NSString *v58;
  uint64_t v59;
  id v60;
  uint8_t buf[4];
  id v62;
  __int16 v63;
  id v64;
  uint64_t v65;

  v65 = *MEMORY[0x24BDAC8D0];
  v7 = a2;
  v8 = a3;
  v9 = a4;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  if (WeakRetained)
  {
    if (v9)
    {
      objc_msgSend(v9, "domain");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v11, "isEqualToString:", CFSTR("COMessageChannelErrorDomain")))
      {
        v12 = objc_msgSend(v9, "code");

        if (v12 == -1114)
        {
          COLogForCategory(6);
          v13 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412546;
            v62 = WeakRetained;
            v63 = 2112;
            v64 = v7;
            _os_log_impl(&dword_21214B000, v13, OS_LOG_TYPE_DEFAULT, "%@ Member %@ does not have an active message channel for Sessions. Deferring session creation.", buf, 0x16u);
          }

          v14 = *(void **)(a1 + 32);
          if (v14)
          {
            v15 = v14;
          }
          else
          {
            objc_msgSend(MEMORY[0x24BDBCEF8], "null");
            v15 = (id)objc_claimAutoreleasedReturnValue();
          }
          v16 = v15;
          objc_msgSend(WeakRetained, "sessionsInflight");
          v42 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v7, "member");
          v43 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v42, "setObject:forKey:", v16, v43);

          goto LABEL_33;
        }
      }
      else
      {

      }
      objc_msgSend(v9, "domain");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v21, "isEqualToString:", CFSTR("COMessageChannelErrorDomain")))
      {
        v22 = objc_msgSend(v9, "code");

        if (v22 == -1101)
        {
          objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("COMessageSessionErrorDomain"), -1210, 0);
          v16 = (id)objc_claimAutoreleasedReturnValue();
LABEL_19:
          objc_msgSend(WeakRetained, "_onqueue_deliverDidFailToStartSessionWithMember:producer:error:", v7, *(_QWORD *)(a1 + 40), v16);
LABEL_33:

          goto LABEL_34;
        }
      }
      else
      {

      }
      v23 = (void *)MEMORY[0x24BDD1540];
      v59 = *MEMORY[0x24BDD1398];
      v60 = v9;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v60, &v59, 1);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "errorWithDomain:code:userInfo:", CFSTR("COMessageSessionErrorDomain"), -1204, v24);
      v16 = (id)objc_claimAutoreleasedReturnValue();

      goto LABEL_19;
    }
    v16 = v8;
    objc_msgSend(v16, "remoteError");
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    if (v17)
    {
      COLogForCategory(6);
      v18 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
        __70___COMessageChannel__onqueue_startSessionWithProducer_member_request___block_invoke_cold_2(a1, v16, v18);

      v19 = *(_QWORD *)(a1 + 40);
      objc_msgSend(v16, "remoteError");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(WeakRetained, "_onqueue_deliverDidFailToStartSessionWithMember:producer:error:", v7, v19, v20);
      goto LABEL_32;
    }
    objc_msgSend(v16, "payload");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "payloadType");
    v25 = (NSString *)objc_claimAutoreleasedReturnValue();
    v26 = 0;
    v53 = v25;
    if (v20)
    {
      v27 = v25;
      if (v25)
      {
        v28 = NSClassFromString(v25);
        if (v28)
        {
          v54 = 0;
          objc_msgSend(MEMORY[0x24BDD1620], "unarchivedObjectOfClass:fromData:error:", v28, v20, &v54);
          v26 = objc_claimAutoreleasedReturnValue();
          v29 = (COMessageProducedSession *)v54;
          if (v29)
          {
LABEL_24:
            v50 = (void *)v26;
            COLogForCategory(6);
            v30 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
              __70___COMessageChannel__onqueue_startSessionWithProducer_member_request___block_invoke_cold_1();

            v31 = (void *)MEMORY[0x24BDD1540];
            v55 = *MEMORY[0x24BDD1398];
            v56 = v29;
            objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v56, &v55, 1);
            v32 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v31, "errorWithDomain:code:userInfo:", CFSTR("COMessageSessionErrorDomain"), -1208, v32);
            v33 = objc_claimAutoreleasedReturnValue();

            v34 = v33;
            v49 = (void *)v33;
            objc_msgSend(WeakRetained, "_onqueue_deliverDidFailToStartSessionWithMember:producer:error:", v7, *(_QWORD *)(a1 + 40), v33);
            v48 = [COMessageSessionManagementRequest alloc];
            objc_msgSend(WeakRetained, "topic");
            v35 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(*(id *)(a1 + 40), "subTopic");
            v36 = (void *)objc_claimAutoreleasedReturnValue();
            v37 = -[COMessageSessionManagementRequest initWithCommandType:error:topic:subTopic:](v48, "initWithCommandType:error:topic:subTopic:", 2, v34, v35, v36);

            v38 = (void *)MEMORY[0x24BDBCF20];
            objc_msgSend(v7, "member");
            v39 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v38, "setWithObject:", v39);
            v40 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(WeakRetained, "_onqueue_sendRequest:members:withCompletionHandler:", v37, v40, &__block_literal_global_9);

            v41 = v50;
            goto LABEL_31;
          }
        }
        else
        {
          v51 = (void *)MEMORY[0x24BDD1540];
          v57 = CFSTR("COMessageSessionUnknownClassErrorKey");
          v58 = v27;
          objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v58, &v57, 1);
          v44 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v51, "errorWithDomain:code:userInfo:", CFSTR("COMessageSessionErrorDomain"), -1208, v44);
          v29 = (COMessageProducedSession *)objc_claimAutoreleasedReturnValue();

          v26 = 0;
          if (v29)
            goto LABEL_24;
        }
      }
    }
    v45 = [COMessageProducedSession alloc];
    objc_msgSend(v7, "member");
    v52 = v20;
    v46 = (void *)v26;
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = -[COMessageProducedSession initWithMember:producer:](v45, "initWithMember:producer:", v47, *(_QWORD *)(a1 + 40));

    v41 = v46;
    v20 = v52;
    -[COMessageSession setDidUseRequest:](v29, "setDidUseRequest:", *(_QWORD *)(a1 + 32) != 0);
    -[COMessageSession setDidUseResponse:](v29, "setDidUseResponse:", v41 != 0);
    objc_msgSend(WeakRetained, "_onqueue_deliverSuccessfullyStartedSession:withResponse:withMember:producer:", v29, v41, v7, *(_QWORD *)(a1 + 40));
LABEL_31:

LABEL_32:
    goto LABEL_33;
  }
LABEL_34:

}

void __69___COMessageChannel__onqueue_handleStartCommand_withMember_callback___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  id v6;
  uint64_t v7;
  void *v8;
  _QWORD v9[4];
  id v10;
  id v11;
  uint64_t v12;
  id v13;
  id v14;
  id v15;

  v2 = *(void **)(a1 + 32);
  v3 = *(_QWORD *)(a1 + 40);
  v4 = *(_QWORD *)(a1 + 48);
  v5 = *(_QWORD *)(a1 + 56);
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __69___COMessageChannel__onqueue_handleStartCommand_withMember_callback___block_invoke_2;
  v9[3] = &unk_24CD3FE40;
  objc_copyWeak(&v15, (id *)(a1 + 88));
  v10 = *(id *)(a1 + 48);
  v6 = *(id *)(a1 + 40);
  v7 = *(_QWORD *)(a1 + 64);
  v8 = *(void **)(a1 + 72);
  v11 = v6;
  v12 = v7;
  v13 = v8;
  v14 = *(id *)(a1 + 80);
  objc_msgSend(v2, "consumer:shouldStartSessionWithMember:request:completionHandler:", v3, v4, v5, v9);

  objc_destroyWeak(&v15);
}

void __69___COMessageChannel__onqueue_handleStartCommand_withMember_callback___block_invoke_2(uint64_t a1, char a2, void *a3)
{
  id v5;
  id WeakRetained;
  void *v7;
  NSObject *v8;
  id v9;
  uint64_t v10;
  void *v11;
  _QWORD v12[4];
  id v13;
  void *v14;
  id v15;
  id v16;
  uint64_t v17;
  id v18;
  id v19;
  char v20;

  v5 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 72));
  v7 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "workQueue");
    v8 = objc_claimAutoreleasedReturnValue();
    v12[0] = MEMORY[0x24BDAC760];
    v12[1] = 3221225472;
    v12[2] = __69___COMessageChannel__onqueue_handleStartCommand_withMember_callback___block_invoke_3;
    v12[3] = &unk_24CD40448;
    v20 = a2;
    v13 = v5;
    v14 = v7;
    v15 = *(id *)(a1 + 32);
    v9 = *(id *)(a1 + 40);
    v10 = *(_QWORD *)(a1 + 48);
    v11 = *(void **)(a1 + 56);
    v16 = v9;
    v17 = v10;
    v18 = v11;
    v19 = *(id *)(a1 + 64);
    dispatch_async(v8, v12);

  }
}

void __69___COMessageChannel__onqueue_handleStartCommand_withMember_callback___block_invoke_3(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  COMessageSessionManagementResponse *v9;
  COMessageSessionManagementResponse *v10;
  void *v11;
  COMessageSessionManagementResponse *v12;
  void *v13;
  id v14;
  uint64_t v15;
  _QWORD v16[2];

  v16[1] = *MEMORY[0x24BDAC8D0];
  if (*(_BYTE *)(a1 + 88))
  {
    v2 = *(_QWORD *)(a1 + 32);
    if (v2)
    {
      v14 = 0;
      objc_msgSend(MEMORY[0x24BDD1618], "archivedDataWithRootObject:requiringSecureCoding:error:", v2, 1, &v14);
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      v4 = v14;
      if (v4)
      {
        v5 = v4;
        v6 = (void *)MEMORY[0x24BDD1540];
        v15 = *MEMORY[0x24BDD1398];
        v16[0] = v4;
        objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v16, &v15, 1);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "errorWithDomain:code:userInfo:", CFSTR("COMessageSessionErrorDomain"), -1207, v7);
        v8 = (void *)objc_claimAutoreleasedReturnValue();

        if (v8)
        {
          v9 = -[COMessageSessionManagementResponse initWithRemoteError:]([COMessageSessionManagementResponse alloc], "initWithRemoteError:", v8);
          objc_msgSend(*(id *)(a1 + 40), "_onqueue_deliverDidFailToStartSessionWithMember:consumer:error:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), v8);

LABEL_9:
          goto LABEL_10;
        }
      }
    }
    else
    {
      v3 = 0;
    }
    v12 = [COMessageSessionManagementResponse alloc];
    objc_msgSend(*(id *)(a1 + 64), "_payloadTypeFromClass:", objc_opt_class());
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = -[COMessageSessionManagementResponse initWithPayload:payloadType:](v12, "initWithPayload:payloadType:", v3, v13);

    objc_msgSend(*(id *)(a1 + 40), "_onqueue_deliverSuccessfullyStartedSession:withMember:consumer:", *(_QWORD *)(a1 + 72), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));
    goto LABEL_9;
  }
  v10 = [COMessageSessionManagementResponse alloc];
  objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("COMessageSessionErrorDomain"), -1213, 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[COMessageSessionManagementResponse initWithRemoteError:](v10, "initWithRemoteError:", v11);

LABEL_10:
  (*(void (**)(void))(*(_QWORD *)(a1 + 80) + 16))();

}

uint64_t __84___COMessageChannel__onqueue_deliverDidFailToStartSessionWithMember_producer_error___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "producer:didFailToStartSessionWithMember:error:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));
}

uint64_t __84___COMessageChannel__onqueue_deliverDidFailToStartSessionWithMember_consumer_error___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "consumer:didFailToStartSessionWithMember:error:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));
}

uint64_t __97___COMessageChannel__onqueue_deliverSuccessfullyStartedSession_withResponse_withMember_producer___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "producer:didStartSession:member:response:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64));
}

uint64_t __84___COMessageChannel__onqueue_deliverSuccessfullyStartedSession_withMember_consumer___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "consumer:didStartSession:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

uint64_t __85___COMessageChannel__onqueue_deliverDidEndDelegateForSession_notice_initiator_error___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "producer:didStopSession:initiator:notice:error:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 72));
}

uint64_t __85___COMessageChannel__onqueue_deliverDidEndDelegateForSession_notice_initiator_error___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "consumer:didStopSession:initiator:notice:error:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 72));
}

void __35___COMessageChannel_didFindMember___block_invoke(uint64_t a1)
{
  void *v2;
  void (**v3)(_QWORD, _QWORD);
  void *v4;
  void *v5;
  _QWORD v6[5];
  id v7;

  objc_msgSend(*(id *)(a1 + 32), "foundHandler");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (v2)
  {
    objc_msgSend(*(id *)(a1 + 32), "foundHandler");
    v3 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    v3[2](v3, *(_QWORD *)(a1 + 40));

  }
  objc_msgSend(*(id *)(a1 + 32), "sessionProducers");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __35___COMessageChannel_didFindMember___block_invoke_2;
  v6[3] = &unk_24CD40470;
  v5 = *(void **)(a1 + 40);
  v6[4] = *(_QWORD *)(a1 + 32);
  v7 = v5;
  objc_msgSend(v4, "enumerateKeysAndObjectsUsingBlock:", v6);

}

uint64_t __35___COMessageChannel_didFindMember___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(a1 + 32), "_onqueue_startSessionWithProducer:member:", a3, *(_QWORD *)(a1 + 40));
}

void __35___COMessageChannel_didLoseMember___block_invoke(uint64_t a1)
{
  void *v2;
  void (**v3)(id, _QWORD);

  objc_msgSend(*(id *)(a1 + 32), "lostHandler");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (v2)
  {
    objc_msgSend(*(id *)(a1 + 32), "lostHandler");
    v3 = (void (**)(id, _QWORD))objc_claimAutoreleasedReturnValue();
    v3[2](v3, *(_QWORD *)(a1 + 40));

  }
}

void __66___COMessageChannel_didReceiveRequest_from_withCompletionHandler___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void (**v4)(_QWORD, _QWORD, _QWORD, _QWORD);
  void *v5;
  void *v6;
  void *v7;
  _QWORD v8[4];
  id v9;
  id v10;
  id location;

  objc_msgSend(*(id *)(a1 + 32), "_payloadTypeFromClass:", objc_opt_class());
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "requestHandlers");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKey:", v2);
  v4 = (void (**)(_QWORD, _QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    objc_initWeak(&location, *(id *)(a1 + 32));
    v8[0] = MEMORY[0x24BDAC760];
    v8[1] = 3221225472;
    v8[2] = __66___COMessageChannel_didReceiveRequest_from_withCompletionHandler___block_invoke_2;
    v8[3] = &unk_24CD40498;
    objc_copyWeak(&v10, &location);
    v9 = *(id *)(a1 + 56);
    v5 = (void *)MEMORY[0x212BE9A2C](v8);
    +[COClusterMemberRoleSnapshot snapshotWithParticipantRoleForMember:](COClusterMemberRoleSnapshot, "snapshotWithParticipantRoleForMember:", *(_QWORD *)(a1 + 48));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, _QWORD, void *, void *))v4)[2](v4, *(_QWORD *)(a1 + 40), v6, v5);

    objc_destroyWeak(&v10);
    objc_destroyWeak(&location);
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("COMessageChannelErrorDomain"), -1101, 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();

  }
}

void __66___COMessageChannel_didReceiveRequest_from_withCompletionHandler___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id WeakRetained;
  id v7;

  v7 = a2;
  v5 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

void __56__COMessageChannel_registerHandler_forRequestClassType___block_invoke_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_4(&dword_21214B000, a2, a3, "%p Handlers cannot be registered after activation", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_1();
}

void __57__COMessageChannel_unregisterHandlerForRequestClassType___block_invoke_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_4(&dword_21214B000, a2, a3, "%p Handlers cannot be unregistered after activation", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_1();
}

void __74__COMessageChannel_addSessionProducerWithSubTopic_delegate_dispatchQueue___block_invoke_cold_1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_0(&dword_21214B000, v0, v1, "%p Cannot add session producer %@ after activation");
  OUTLINED_FUNCTION_1();
}

void __74__COMessageChannel_addSessionProducerWithSubTopic_delegate_dispatchQueue___block_invoke_2_cold_1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_7_0();
  OUTLINED_FUNCTION_0(&dword_21214B000, v0, v1, "%p Received unknown command on producer handler for subTopic %@");
  OUTLINED_FUNCTION_1();
}

void __74__COMessageChannel_addSessionConsumerWithSubTopic_delegate_dispatchQueue___block_invoke_cold_1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_0(&dword_21214B000, v0, v1, "%p Cannot add session consumer %@ after activation");
  OUTLINED_FUNCTION_1();
}

void __74__COMessageChannel_addSessionConsumerWithSubTopic_delegate_dispatchQueue___block_invoke_3_cold_1(uint64_t a1, void *a2, NSObject *a3)
{
  uint64_t v4;
  void *v5;
  uint64_t v6;
  int v7;
  uint64_t v8;
  __int16 v9;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  v4 = *(_QWORD *)(a1 + 40);
  objc_msgSend(a2, "subTopic");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = 134218242;
  v8 = v4;
  v9 = 2112;
  v10 = v5;
  OUTLINED_FUNCTION_1_0(&dword_21214B000, a3, v6, "%p Message channel received a session management request without unknown type for subtopic %@", (uint8_t *)&v7);

}

void __93__COMessageChannel_receivedRequestWithPayload_payloadType_requestID_fromMember_withCallback___block_invoke_cold_1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_0(&dword_21214B000, v0, v1, "%p Failed to find a connected client that handles request of type %@");
  OUTLINED_FUNCTION_1();
}

void __93__COMessageChannel_receivedRequestWithPayload_payloadType_requestID_fromMember_withCallback___block_invoke_59_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_4(&dword_21214B000, a2, a3, "%p Failed to encode response. Message too big", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_1();
}

void __93__COMessageChannel_receivedRequestWithPayload_payloadType_requestID_fromMember_withCallback___block_invoke_59_cold_2()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_21214B000, v0, v1, "%p Failed to encode response with error %@");
  OUTLINED_FUNCTION_1();
}

- (void)_sendRequest:type:members:withCompletionHandler:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0(&dword_21214B000, v0, v1, "%p No response completion handler for request %@");
  OUTLINED_FUNCTION_1();
}

- (void)_sendRequest:type:members:withCompletionHandler:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_4(&dword_21214B000, v0, v1, "%p Failed to send message. Message too big", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)_sendRequest:type:members:withCompletionHandler:.cold.3()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0(&dword_21214B000, v0, v1, "%p Failed to encode request with error %@");
  OUTLINED_FUNCTION_1();
}

- (void)_broadcastRequest:type:recipientsCallback:responseCompletionHandler:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0(&dword_21214B000, v0, v1, "%p No response completion handler for broadcast request %@");
  OUTLINED_FUNCTION_1();
}

void __44__COMessageChannel__activateWithCompletion___block_invoke_cold_1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0(&dword_21214B000, v0, v1, "%p Error connecting to the remote service %@");
  OUTLINED_FUNCTION_1();
}

void __44__COMessageChannel__activateWithCompletion___block_invoke_2_cold_1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_0(&dword_21214B000, v0, v1, "%p Error activating message channel. Error = %@");
  OUTLINED_FUNCTION_1();
}

void __53__COMessageChannel__remoteInterfaceWithErrorHandler___block_invoke_2_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_4(&dword_21214B000, v0, v1, "%p connection to Messaging service interrupted", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __53__COMessageChannel__remoteInterfaceWithErrorHandler___block_invoke_139_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_4(&dword_21214B000, v0, v1, "%p connection to Messaging service invalidated", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __44__COMessageChannel__lostConnectionToService__block_invoke_2_cold_1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_21214B000, v0, v1, "%p failed to re-activate lost connection. Error %@");
  OUTLINED_FUNCTION_1();
}

- (void)_invokeResponseCallbackForInfo:snapshot:response:error:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0(&dword_21214B000, v0, v1, "%p No response block found for requestInfo %@");
  OUTLINED_FUNCTION_1();
}

- (void)_handleStartCommand:(uint64_t)a3 withMember:(NSObject *)a4 callback:.cold.1(uint64_t a1, void *a2, uint64_t a3, NSObject *a4)
{
  *(_DWORD *)a3 = 134218242;
  *(_QWORD *)(a3 + 4) = a1;
  *(_WORD *)(a3 + 12) = 2112;
  *(_QWORD *)(a3 + 14) = a2;
  OUTLINED_FUNCTION_5(&dword_21214B000, a4, a3, "%p Message channel reaching out to delegate consumer:shouldStartSessionWithMember:request:completionHandler: for subTopic %@", (uint8_t *)a3);

}

void __88__COMessageChannel__deliverSuccessfullyStartedSession_withResponse_withMember_producer___block_invoke_2_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_1_0(&dword_21214B000, v0, v1, "%@ Producer failed to inform the service about a new session %@", v2);
  OUTLINED_FUNCTION_1();
}

void __75__COMessageChannel__deliverSuccessfullyStartedSession_withMember_consumer___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_1_0(&dword_21214B000, v0, v1, "%p Consumer failed to inform service about a new session %@", v2);
  OUTLINED_FUNCTION_1();
}

- (void)_startSessionWithProducer:member:.cold.1()
{
  NSObject *v0;
  uint8_t v1[24];
  uint64_t v2;

  v2 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_5(&dword_21214B000, v0, (uint64_t)v0, "%p Reaching out to client delegate producer:shouldStartSessionWithMember:completionHandler: with member %@", v1);
  OUTLINED_FUNCTION_1();
}

void __61__COMessageChannel__startSessionWithProducer_member_request___block_invoke_cold_1()
{
  __int16 v0;
  uint64_t v1;
  os_log_t v2;
  uint8_t v3[22];
  __int16 v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_2_1();
  v4 = v0;
  v5 = v1;
  _os_log_error_impl(&dword_21214B000, v2, OS_LOG_TYPE_ERROR, "%@ Producer failed to unarchive the response from member %@. Error = %@", v3, 0x20u);
}

void __61__COMessageChannel__startSessionWithProducer_member_request___block_invoke_cold_2(uint64_t a1, void *a2, NSObject *a3)
{
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  int v10;
  void *v11;
  __int16 v12;
  void *v13;
  __int16 v14;
  uint64_t v15;
  __int16 v16;
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v6 = *(void **)(a1 + 40);
  objc_msgSend(v6, "subTopic");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = *(_QWORD *)(a1 + 48);
  objc_msgSend(a2, "remoteError");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = 138413058;
  v11 = v6;
  v12 = 2112;
  v13 = v7;
  v14 = 2112;
  v15 = v8;
  v16 = 2112;
  v17 = v9;
  _os_log_error_impl(&dword_21214B000, a3, OS_LOG_TYPE_ERROR, "%@ Producer failed to start a session with sub-topic %@ with member %@. Error %@", (uint8_t *)&v10, 0x2Au);

}

void __76__COMessageChannel__deliverDidEndDelegateForSession_notice_initiator_error___block_invoke_3_cold_1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_7_0();
  OUTLINED_FUNCTION_0(&dword_21214B000, v0, v1, "%p Failed to inform the service about end of session %@");
  OUTLINED_FUNCTION_1();
}

void __53___COMessageChannel_registerHandler_forRequestClass___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5_1();
  OUTLINED_FUNCTION_4(&dword_21214B000, v0, v1, "%p Handlers cannot be registered after activation", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __48___COMessageChannel_registerMemberFoundHandler___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5_1();
  OUTLINED_FUNCTION_4(&dword_21214B000, v0, v1, "%p Member found handler cannot be registered after activation", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __47___COMessageChannel_registerMemberLostHandler___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5_1();
  OUTLINED_FUNCTION_4(&dword_21214B000, v0, v1, "%p Member lost handler cannot be registered after activation", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __75___COMessageChannel_addSessionProducerWithSubTopic_delegate_dispatchQueue___block_invoke_3_cold_1(uint64_t a1, uint64_t a2, NSObject *a3)
{
  uint64_t v3;
  int v4;
  uint64_t v5;
  __int16 v6;
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  v3 = *(_QWORD *)(a2 + 32);
  v4 = 134218242;
  v5 = a1;
  v6 = 2112;
  v7 = v3;
  OUTLINED_FUNCTION_1_0(&dword_21214B000, a3, (uint64_t)a3, "%p Received unknown command on producer handler for subTopic %@", (uint8_t *)&v4);
  OUTLINED_FUNCTION_1();
}

void __75___COMessageChannel_addSessionConsumerWithSubTopic_delegate_dispatchQueue___block_invoke_4_cold_1(uint64_t a1, void *a2, NSObject *a3)
{
  uint64_t v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  int v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  v4 = *(_QWORD *)(a1 + 40);
  objc_msgSend(a2, "subTopic");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = 134218242;
  v9 = v4;
  OUTLINED_FUNCTION_2_3();
  v10 = v6;
  OUTLINED_FUNCTION_1_0(&dword_21214B000, a3, v7, "%p Message channel received a session management request without unknown type for subtopic %@", (uint8_t *)&v8);

}

void __70___COMessageChannel__onqueue_startSessionWithProducer_member_request___block_invoke_cold_1()
{
  uint64_t v0;
  __int16 v1;
  uint64_t v2;
  os_log_t v3;
  uint8_t v4[14];
  uint64_t v5;
  __int16 v6;
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_5_1();
  OUTLINED_FUNCTION_2_3();
  v5 = v0;
  v6 = v1;
  v7 = v2;
  _os_log_error_impl(&dword_21214B000, v3, OS_LOG_TYPE_ERROR, "%@ Producer failed to unarchive the response from member %@. Error = %@", v4, 0x20u);
}

void __70___COMessageChannel__onqueue_startSessionWithProducer_member_request___block_invoke_cold_2(uint64_t a1, void *a2, NSObject *a3)
{
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  __int16 v10;
  uint64_t v11;
  int v12;
  void *v13;
  void *v14;
  __int16 v15;
  uint64_t v16;
  __int16 v17;
  uint64_t v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v6 = *(void **)(a1 + 40);
  objc_msgSend(v6, "subTopic");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = *(_QWORD *)(a1 + 48);
  objc_msgSend(a2, "remoteError");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = 138413058;
  v13 = v6;
  OUTLINED_FUNCTION_2_3();
  v14 = v7;
  v15 = v10;
  v16 = v8;
  v17 = v10;
  v18 = v11;
  _os_log_error_impl(&dword_21214B000, a3, OS_LOG_TYPE_ERROR, "%@ Producer failed to start a session with sub-topic %@ with member %@. Error %@", (uint8_t *)&v12, 0x2Au);

}

@end
