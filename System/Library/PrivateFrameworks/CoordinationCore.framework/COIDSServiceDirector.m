@implementation COIDSServiceDirector

- (COIDSServiceDirector)initWithIDSService:(id)a3 meshName:(id)a4
{
  id v7;
  id v8;
  COIDSServiceDirector *v9;
  COIDSServiceDirector *v10;
  NSObject *v11;
  dispatch_queue_t v12;
  OS_dispatch_queue *queue;
  uint64_t v14;
  NSMapTable *activeTransports;
  COIDSMessageFactory *v16;
  COIDSMessageFactory *messageFactory;
  objc_super v19;

  v7 = a3;
  v8 = a4;
  v19.receiver = self;
  v19.super_class = (Class)COIDSServiceDirector;
  v9 = -[COIDSServiceDirector init](&v19, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_service, a3);
    objc_storeStrong((id *)&v10->_meshName, a4);
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v11 = objc_claimAutoreleasedReturnValue();
    v12 = dispatch_queue_create("com.apple.coordination.idsdirector", v11);
    queue = v10->_queue;
    v10->_queue = (OS_dispatch_queue *)v12;

    objc_msgSend(MEMORY[0x24BDD1650], "strongToWeakObjectsMapTable");
    v14 = objc_claimAutoreleasedReturnValue();
    activeTransports = v10->_activeTransports;
    v10->_activeTransports = (NSMapTable *)v14;

    v16 = objc_alloc_init(COIDSMessageFactory);
    messageFactory = v10->_messageFactory;
    v10->_messageFactory = v16;

    v10->_lock._os_unfair_lock_opaque = 0;
  }

  return v10;
}

- (NSString)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p, mesh = %@>"), v5, self, self->_meshName);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v6;
}

- (void)start
{
  void *v3;
  id v4;

  -[COIDSServiceDirector service](self, "service");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[COIDSServiceDirector queue](self, "queue");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addDelegate:queue:", self, v3);

}

- (id)transportWithDiscoveryRecord:(id)a3 withExecutionContext:(id)a4
{
  id v6;
  id v7;
  COIDSTransport *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  void *v14;
  void *v15;
  void *v16;
  int v18;
  COIDSServiceDirector *v19;
  __int16 v20;
  COIDSTransport *v21;
  __int16 v22;
  void *v23;
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  v8 = -[COIDSTransport initWithDiscoveryRecord:executionContext:]([COIDSTransport alloc], "initWithDiscoveryRecord:executionContext:", v6, v7);

  COCoreLogForCategory(17);
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v6, "IDSIdentifier");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = 138543874;
    v19 = self;
    v20 = 2048;
    v21 = v8;
    v22 = 2114;
    v23 = v10;
    _os_log_impl(&dword_215E92000, v9, OS_LOG_TYPE_DEFAULT, "%{public}@ created new transport %p for remote IDS identifier %{public}@", (uint8_t *)&v18, 0x20u);

  }
  objc_msgSend(v6, "deviceTokenURI");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[COIDSServiceDirector service](self, "service");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "conformsToProtocol:", &unk_254E2D468);

  if (v13)
  {
    -[COIDSServiceDirector service](self, "service");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "tokenFromID:", v11);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    -[COIDSServiceDirector tokenFromURI:](self, "tokenFromURI:", v11);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
  }
  -[COIDSServiceDirector activeTransports](self, "activeTransports");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setObject:forKey:", v8, v15);

  return v8;
}

- (void)sendMessage:(id)a3 toDestination:(id)a4 completionHandler:(id)a5
{
  void *v8;
  void (**v9)(id, id, id);
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  id v16;
  id v17;
  id v18;
  uint64_t v19;
  _QWORD v20[2];

  v20[1] = *MEMORY[0x24BDAC8D0];
  v19 = *MEMORY[0x24BE4FAA0];
  v20[0] = &unk_24D4CF3C0;
  v8 = (void *)MEMORY[0x24BDBCE70];
  v9 = (void (**)(id, id, id))a5;
  v10 = a4;
  v11 = a3;
  objc_msgSend(v8, "dictionaryWithObjects:forKeys:count:", v20, &v19, 1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[COIDSServiceDirector service](self, "service");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCF20], "setWithObject:", v10);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  v17 = 0;
  v18 = 0;
  objc_msgSend(v13, "sendMessage:toDestinations:priority:options:identifier:error:", v11, v14, 300, v12, &v18, &v17);

  v15 = v18;
  v16 = v17;

  v9[2](v9, v15, v16);
}

- (void)sendResponse:(id)a3 responseIdentifier:(id)a4 toDestination:(id)a5
{
  void *v8;
  id v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  uint64_t v16;
  id v17;
  uint64_t v18;
  _QWORD v19[2];

  v19[1] = *MEMORY[0x24BDAC8D0];
  v18 = *MEMORY[0x24BE4FAF0];
  v19[0] = a4;
  v8 = (void *)MEMORY[0x24BDBCE70];
  v9 = a5;
  v10 = a4;
  v11 = a3;
  objc_msgSend(v8, "dictionaryWithObjects:forKeys:count:", v19, &v18, 1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[COIDSServiceDirector service](self, "service");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCF20], "setWithObject:", v9);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  v16 = 0;
  v17 = 0;
  objc_msgSend(v13, "sendMessage:toDestinations:priority:options:identifier:error:", v11, v14, 300, v12, &v17, &v16);

  v15 = v17;
}

- (void)service:(id)a3 account:(id)a4 identifier:(id)a5 didSendWithSuccess:(BOOL)a6 error:(id)a7
{
  _BOOL4 v8;
  id v10;
  id v11;
  NSObject *v12;
  NSObject *v13;
  int v14;
  COIDSServiceDirector *v15;
  __int16 v16;
  id v17;
  __int16 v18;
  id v19;
  uint64_t v20;

  v8 = a6;
  v20 = *MEMORY[0x24BDAC8D0];
  v10 = a5;
  v11 = a7;
  COCoreLogForCategory(17);
  v12 = objc_claimAutoreleasedReturnValue();
  v13 = v12;
  if (v8)
  {
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      v14 = 138543618;
      v15 = self;
      v16 = 2114;
      v17 = v10;
      _os_log_impl(&dword_215E92000, v13, OS_LOG_TYPE_DEFAULT, "%{public}@ Did send message %{public}@ successfully", (uint8_t *)&v14, 0x16u);
    }
  }
  else if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
  {
    v14 = 138543874;
    v15 = self;
    v16 = 2114;
    v17 = v10;
    v18 = 2114;
    v19 = v11;
    _os_log_error_impl(&dword_215E92000, v13, OS_LOG_TYPE_ERROR, "%{public}@ Failed to send message %{public}@: %{public}@", (uint8_t *)&v14, 0x20u);
  }

}

- (void)service:(id)a3 account:(id)a4 incomingMessage:(id)a5 fromID:(id)a6 context:(id)a7
{
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  _QWORD v16[5];
  id v17;
  id v18;
  id v19;

  v10 = a5;
  v11 = a6;
  v12 = a7;
  v16[0] = MEMORY[0x24BDAC760];
  v16[1] = 3221225472;
  v16[2] = __71__COIDSServiceDirector_service_account_incomingMessage_fromID_context___block_invoke;
  v16[3] = &unk_24D4B0E50;
  v16[4] = self;
  v17 = v11;
  v18 = v12;
  v19 = v10;
  v13 = v10;
  v14 = v12;
  v15 = v11;
  -[COIDSServiceDirector _withLock:](self, "_withLock:", v16);

}

void __71__COIDSServiceDirector_service_account_incomingMessage_fromID_context___block_invoke(uint64_t a1)
{
  void *v2;
  int v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  NSObject *v14;
  NSObject *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  NSObject *v20;
  void *v21;
  void *v22;
  int v23;
  void *v24;
  uint64_t v25;
  void *v26;
  void *v27;
  COOnDemandIDSNodeCreationRequest *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  NSObject *log;
  id v34;
  uint8_t buf[4];
  void *v36;
  __int16 v37;
  void *v38;
  __int16 v39;
  NSObject *v40;
  uint64_t v41;

  v41 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(a1 + 32), "service");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "conformsToProtocol:", &unk_254E2D468);

  v4 = *(void **)(a1 + 32);
  if (v3)
  {
    objc_msgSend(v4, "service");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "tokenFromID:", *(_QWORD *)(a1 + 40));
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(v4, "tokenFromURI:", *(_QWORD *)(a1 + 40));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(*(id *)(a1 + 32), "activeTransports");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKey:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 48), "outgoingResponseIdentifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 48), "incomingResponseIdentifier");
  v10 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "messageFactory");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = *(_QWORD *)(a1 + 56);
  v34 = 0;
  objc_msgSend(v11, "decodeDictionary:error:", v12, &v34);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v34;

  if (v13)
  {
    if (v8)
    {
      objc_msgSend(v8, "handleMessage:requestIdentifier:responseIdentifier:from:", v13, v9, v10, *(_QWORD *)(a1 + 40));
      goto LABEL_27;
    }
    if (objc_msgSend(v13, "type"))
    {
      COCoreLogForCategory(17);
      v20 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      {
        v21 = *(void **)(a1 + 32);
        *(_DWORD *)buf = 138543874;
        v36 = v21;
        v37 = 2112;
        v38 = v9;
        v39 = 2112;
        v40 = v10;
        _os_log_error_impl(&dword_215E92000, v20, OS_LOG_TYPE_ERROR, "%{public}@ dropping response '%@' for '%@' from unknown node", buf, 0x20u);
      }
LABEL_26:

      goto LABEL_27;
    }
    objc_msgSend(*(id *)(a1 + 32), "service");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = objc_msgSend(v22, "conformsToProtocol:", &unk_254E2D468);

    if (v23)
    {
      objc_msgSend(*(id *)(a1 + 32), "service");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "localIDSIdentifierForDestination:", *(_QWORD *)(a1 + 40));
      v25 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      objc_msgSend(v13, "metadata");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = v26;
      if (!v26)
      {
        v20 = 0;
LABEL_18:

        objc_msgSend(*(id *)(a1 + 32), "discoveryDelegate");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        if (v20 && (objc_opt_respondsToSelector() & 1) != 0)
        {
          v28 = -[COOnDemandIDSNodeCreationRequest initWithMessage:idsIdentifier:uriToken:requestIdentifier:responseIdentifier:]([COOnDemandIDSNodeCreationRequest alloc], "initWithMessage:idsIdentifier:uriToken:requestIdentifier:responseIdentifier:", v13, v20, *(_QWORD *)(a1 + 40), v9, v10);
          COCoreLogForCategory(17);
          log = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT))
          {
            v29 = *(void **)(a1 + 32);
            *(_DWORD *)buf = 138543618;
            v36 = v29;
            v37 = 2112;
            v38 = v9;
            _os_log_impl(&dword_215E92000, log, OS_LOG_TYPE_DEFAULT, "%{public}@ received message '%@' from unknown node. Attempting to create node on demand.", buf, 0x16u);
          }

          objc_msgSend(v27, "onDemandDiscoveryForRequest:", v28);
        }
        else
        {
          COCoreLogForCategory(17);
          v28 = (COOnDemandIDSNodeCreationRequest *)objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(&v28->super.super, OS_LOG_TYPE_ERROR))
          {
            v32 = *(void **)(a1 + 32);
            *(_DWORD *)buf = 138543874;
            v36 = v32;
            v37 = 2112;
            v38 = v9;
            v39 = 2114;
            v40 = v20;
            _os_log_error_impl(&dword_215E92000, &v28->super.super, OS_LOG_TYPE_ERROR, "%{public}@ dropping message '%@' from unknown node. IDS identifier = %{public}@", buf, 0x20u);
          }
        }

        goto LABEL_26;
      }
      objc_msgSend(v26, "objectForKey:", 0x24D4B5E98);
      v25 = objc_claimAutoreleasedReturnValue();
    }
    v20 = v25;
    goto LABEL_18;
  }
  COCoreLogForCategory(17);
  v15 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
  {
    objc_msgSend(*(id *)(a1 + 32), "description");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = *(void **)(a1 + 40);
    *(_DWORD *)buf = 138543874;
    v36 = v30;
    v37 = 2114;
    v38 = v31;
    v39 = 2114;
    v40 = v14;
    _os_log_error_impl(&dword_215E92000, v15, OS_LOG_TYPE_ERROR, "%{public}@ received invalid message from %{public}@: %{public}@", buf, 0x20u);

  }
  objc_msgSend(*(id *)(a1 + 32), "messageFactory");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "encodeError:", v14);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  v18 = *(void **)(a1 + 32);
  objc_msgSend(v17, "dictionaryRepresentation");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "sendResponse:responseIdentifier:toDestination:", v19, v9, *(_QWORD *)(a1 + 40));

LABEL_27:
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

- (id)tokenFromURI:(id)a3
{
  id v3;
  id v5;

  v5 = 0;
  v3 = (id)objc_msgSend(a3, "_stripPotentialTokenURIWithToken:", &v5);
  return v5;
}

- (IDSService)service
{
  return self->_service;
}

- (COIDSMessageFactory)messageFactory
{
  return self->_messageFactory;
}

- (COIDSServiceDirectorOnDemandDiscoveryDelegate)discoveryDelegate
{
  return (COIDSServiceDirectorOnDemandDiscoveryDelegate *)objc_loadWeakRetained((id *)&self->_discoveryDelegate);
}

- (void)setDiscoveryDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_discoveryDelegate, a3);
}

- (NSMapTable)activeTransports
{
  return self->_activeTransports;
}

- (void)setActiveTransports:(id)a3
{
  objc_storeStrong((id *)&self->_activeTransports, a3);
}

- (NSString)meshName
{
  return self->_meshName;
}

- (void)setMeshName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_meshName, 0);
  objc_storeStrong((id *)&self->_activeTransports, 0);
  objc_destroyWeak((id *)&self->_discoveryDelegate);
  objc_storeStrong((id *)&self->_messageFactory, 0);
  objc_storeStrong((id *)&self->_service, 0);
}

@end
