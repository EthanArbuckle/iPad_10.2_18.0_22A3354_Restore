@implementation HDIDSService

- (HDIDSService)initWithServiceName:(id)a3
{
  objc_class *v4;
  id v5;
  void *v6;
  HDIDSService *v7;

  v4 = (objc_class *)MEMORY[0x1E0D34358];
  v5 = a3;
  v6 = (void *)objc_msgSend([v4 alloc], "initWithService:", v5);

  v7 = -[HDIDSService initWithService:](self, "initWithService:", v6);
  return v7;
}

- (HDIDSService)initWithService:(id)a3
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  HDIDSService *v11;
  NSString *v12;
  NSString *serviceIdentifier;
  void *v14;
  NSString *v15;
  NSString *shortServiceIdentifier;
  NSObject *v18;
  void *v19;
  NSString *v20;
  id v21;
  objc_super v22;
  uint8_t buf[4];
  void *v24;
  __int16 v25;
  NSString *v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  objc_msgSend(v5, "serviceIdentifier");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_opt_self();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("idsservice_%@"), v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  HKCreateSerialDispatchQueue();
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = v5;
  v10 = v8;
  if (self)
  {
    v22.receiver = self;
    v22.super_class = (Class)HDIDSService;
    v11 = -[HDIDSService init](&v22, sel_init);
    self = v11;
    if (v11)
    {
      objc_storeStrong((id *)&v11->_service, a3);
      -[IDSService addDelegate:queue:](self->_service, "addDelegate:queue:", self, v10);
      objc_msgSend(v9, "serviceIdentifier");
      v12 = (NSString *)objc_claimAutoreleasedReturnValue();
      serviceIdentifier = self->_serviceIdentifier;
      self->_serviceIdentifier = v12;

      if (!-[NSString containsString:](self->_serviceIdentifier, "containsString:", CFSTR("com.apple.private.alloy.")))
      {
        _HKInitializeLogging();
        v14 = (void *)*MEMORY[0x1E0CB5370];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5370], OS_LOG_TYPE_ERROR))
        {
          v18 = v14;
          v19 = (void *)objc_opt_class();
          v20 = self->_serviceIdentifier;
          *(_DWORD *)buf = 138543618;
          v24 = v19;
          v25 = 2114;
          v26 = v20;
          v21 = v19;
          _os_log_error_impl(&dword_1B7802000, v18, OS_LOG_TYPE_ERROR, "%{public}@ WARNING: serviceName %{public}@ does not follow expected naming convention.", buf, 0x16u);

        }
      }
      -[NSString stringByReplacingOccurrencesOfString:withString:](self->_serviceIdentifier, "stringByReplacingOccurrencesOfString:withString:", CFSTR("com.apple.private.alloy."), &stru_1E6D11BB8);
      v15 = (NSString *)objc_claimAutoreleasedReturnValue();
      shortServiceIdentifier = self->_shortServiceIdentifier;
      self->_shortServiceIdentifier = v15;

      objc_storeStrong((id *)&self->_queue, v8);
    }
  }

  return self;
}

- (BOOL)sendMessage:(id)a3 destination:(id)a4 options:(id)a5 identifier:(id *)a6 error:(id *)a7
{
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t i;
  void *v19;
  uint64_t (**v20)(_QWORD, _QWORD);
  int v21;
  void *v22;
  void *v23;
  unint64_t v24;
  uint64_t v25;
  id v26;
  id *v27;
  void *v28;
  id v29;
  double v30;
  void *v31;
  void *v32;
  void *v33;
  IDSService *service;
  int v35;
  id v36;
  id v37;
  NSObject *v38;
  NSObject *v39;
  void *v40;
  NSObject *v41;
  void *v42;
  id v43;
  void *v44;
  void *v45;
  NSObject *v46;
  void *v47;
  uint64_t v48;
  id *v50;
  _QWORD *v51;
  HDIDSService *v52;
  uint64_t v53;
  id v55;
  id v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  uint8_t buf[4];
  HDIDSService *v62;
  __int16 v63;
  uint64_t v64;
  __int16 v65;
  id v66;
  uint64_t v67;

  v50 = a7;
  v67 = *MEMORY[0x1E0C80C00];
  v10 = a5;
  v11 = a4;
  v53 = objc_msgSend(a3, "copy");
  v12 = v11;
  v52 = self;
  if (self)
  {
    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v57 = 0u;
    v58 = 0u;
    v59 = 0u;
    v60 = 0u;
    -[HDIDSService devices]((uint64_t)self);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v57, buf, 16);
    if (v15)
    {
      v16 = v15;
      v17 = *(_QWORD *)v58;
      do
      {
        for (i = 0; i != v16; ++i)
        {
          if (*(_QWORD *)v58 != v17)
            objc_enumerationMutation(v14);
          v19 = *(void **)(*((_QWORD *)&v57 + 1) + 8 * i);
          objc_msgSend(v12, "deviceFilterBlock", v50);
          v20 = (uint64_t (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
          v21 = ((uint64_t (**)(_QWORD, void *))v20)[2](v20, v19);

          if (v21)
          {
            objc_msgSend(v19, "destinationID");
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v13, "addObject:", v22);

          }
        }
        v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v57, buf, 16);
      }
      while (v16);
    }

    v23 = (void *)objc_msgSend(v13, "copy");
  }
  else
  {
    v23 = 0;
  }

  v24 = objc_msgSend(v10, "priority");
  if (v24 > 2)
    v25 = 200;
  else
    v25 = qword_1B7F42680[v24];
  v26 = v10;
  v28 = (void *)v53;
  v27 = a6;
  if (v52)
  {
    v29 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    objc_msgSend(v26, "timeoutInterval");
    if (v30 > 0.0)
    {
      v31 = (void *)MEMORY[0x1E0CB37E8];
      objc_msgSend(v26, "timeoutInterval");
      objc_msgSend(v31, "numberWithDouble:");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "setObject:forKeyedSubscript:", v32, *MEMORY[0x1E0D341C8]);

    }
    v33 = (void *)objc_msgSend(v29, "copy", v50);

  }
  else
  {
    v33 = 0;
  }

  if (objc_msgSend(v23, "count") || v52->_unitTest_sendOnEmptyDestinationSet)
  {
    service = v52->_service;
    v55 = 0;
    v56 = 0;
    v35 = -[IDSService sendMessage:toDestinations:priority:options:identifier:error:](service, "sendMessage:toDestinations:priority:options:identifier:error:", v53, v23, v25, v33, &v56, &v55, v50);
    v36 = v56;
    v37 = v55;
    _HKInitializeLogging();
    v38 = *MEMORY[0x1E0CB5370];
    v39 = *MEMORY[0x1E0CB5370];
    if (v35)
    {
      if (os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT))
      {
        v40 = (void *)MEMORY[0x1E0CB37E8];
        v41 = v38;
        objc_msgSend(v40, "numberWithUnsignedInteger:", objc_msgSend(v23, "count"));
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543875;
        v62 = v52;
        v63 = 2114;
        v64 = (uint64_t)v36;
        v65 = 2113;
        v66 = v42;
        _os_log_impl(&dword_1B7802000, v41, OS_LOG_TYPE_DEFAULT, "%{public}@ Enqueued message %{public}@ to %{private}@ destinations", buf, 0x20u);

        v28 = (void *)v53;
      }
    }
    else
    {
      if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543874;
        v62 = v52;
        v63 = 2114;
        v64 = (uint64_t)v36;
        v65 = 2114;
        v66 = v37;
        _os_log_error_impl(&dword_1B7802000, v38, OS_LOG_TYPE_ERROR, "%{public}@ Could not enqueue message %{public}@. Error: %{public}@", buf, 0x20u);
      }
      v43 = v37;
      v44 = v43;
      if (v43)
      {
        if (v51)
          *v51 = objc_retainAutorelease(v43);
        else
          _HKLogDroppedError();
      }

      v27 = a6;
    }
    if (v27)
      *v27 = objc_retainAutorelease(v36);

  }
  else
  {
    _HKInitializeLogging();
    v45 = (void *)*MEMORY[0x1E0CB5370];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5370], OS_LOG_TYPE_DEFAULT))
    {
      v46 = v45;
      -[HDIDSService devices]((uint64_t)v52);
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      v48 = objc_msgSend(v47, "count");
      *(_DWORD *)buf = 138543618;
      v62 = v52;
      v63 = 2048;
      v64 = v48;
      _os_log_impl(&dword_1B7802000, v46, OS_LOG_TYPE_DEFAULT, "%{public}@ Did not enqueue message: No valid destinations. Available devices: %lu", buf, 0x16u);

      v28 = (void *)v53;
    }
    LOBYTE(v35) = 1;
  }

  return v35;
}

- (id)devices
{
  void *v1;
  void *v2;

  if (a1)
  {
    objc_msgSend(*(id *)(a1 + 48), "devices");
    v1 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v1, "hk_map:", &__block_literal_global_150);
    v2 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v2 = 0;
  }
  return v2;
}

HDIDSDevice *__23__HDIDSService_devices__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  HDIDSDevice *v3;

  v2 = a2;
  v3 = -[HDIDSDevice initWithIDSDevice:]([HDIDSDevice alloc], "initWithIDSDevice:", v2);

  return v3;
}

- (void)service:(id)a3 account:(id)a4 incomingMessage:(id)a5 fromID:(id)a6 context:(id)a7
{
  id v11;
  id v12;
  id v13;
  id v14;
  HDIDSMessageContext *v15;
  void *v16;
  NSObject *v17;
  void *v18;
  void *v19;
  HDIDSDevice *v20;
  void *v21;
  HDIDSDevice *v22;
  int v23;
  HDIDSService *v24;
  __int16 v25;
  id v26;
  __int16 v27;
  void *v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v11 = a6;
  v12 = a7;
  v13 = a5;
  v14 = a3;
  v15 = -[HDIDSMessageContext initWithMessageContext:]([HDIDSMessageContext alloc], "initWithMessageContext:", v12);

  _HKInitializeLogging();
  v16 = (void *)*MEMORY[0x1E0CB5370];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5370], OS_LOG_TYPE_DEFAULT))
  {
    v17 = v16;
    -[HDIDSMessageContext originalGUID](v15, "originalGUID");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = 138543874;
    v24 = self;
    v25 = 2114;
    v26 = v11;
    v27 = 2114;
    v28 = v18;
    _os_log_impl(&dword_1B7802000, v17, OS_LOG_TYPE_DEFAULT, "%{public}@ Received message from %{public}@, originalGUID: %{public}@", (uint8_t *)&v23, 0x20u);

  }
  -[HDIDSService delegate](self, "delegate");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = [HDIDSDevice alloc];
  objc_msgSend(v14, "deviceForFromID:", v11);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  v22 = -[HDIDSDevice initWithIDSDevice:](v20, "initWithIDSDevice:", v21);
  objc_msgSend(v19, "service:didReceiveMessage:fromDevice:messageContext:", self, v13, v22, v15);

}

- (void)service:(id)a3 account:(id)a4 identifier:(id)a5 didSendWithSuccess:(BOOL)a6 error:(id)a7
{
  -[HDIDSService service:account:identifier:didSendWithSuccess:error:context:](self, "service:account:identifier:didSendWithSuccess:error:context:", a3, a4, a5, a6, a7, 0);
}

- (void)service:(id)a3 account:(id)a4 identifier:(id)a5 didSendWithSuccess:(BOOL)a6 error:(id)a7 context:(id)a8
{
  _BOOL8 v9;
  id v11;
  id v12;
  NSObject *v13;
  NSObject *v14;
  void *v15;
  int v16;
  HDIDSService *v17;
  __int16 v18;
  id v19;
  __int16 v20;
  id v21;
  uint64_t v22;

  v9 = a6;
  v22 = *MEMORY[0x1E0C80C00];
  v11 = a5;
  v12 = a7;
  _HKInitializeLogging();
  v13 = *MEMORY[0x1E0CB5370];
  v14 = *MEMORY[0x1E0CB5370];
  if (v9)
  {
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      v16 = 138543618;
      v17 = self;
      v18 = 2114;
      v19 = v11;
      _os_log_impl(&dword_1B7802000, v13, OS_LOG_TYPE_DEFAULT, "%{public}@ Successfully sent message %{public}@", (uint8_t *)&v16, 0x16u);
    }
  }
  else if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
  {
    v16 = 138543874;
    v17 = self;
    v18 = 2114;
    v19 = v11;
    v20 = 2114;
    v21 = v12;
    _os_log_error_impl(&dword_1B7802000, v13, OS_LOG_TYPE_ERROR, "%{public}@ Could not enqueue message %{public}@. Error: %{public}@", (uint8_t *)&v16, 0x20u);
  }
  -[HDIDSService delegate](self, "delegate");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "service:didSendWithSuccess:identifier:error:", self, v9, v11, v12);

}

- (NSString)description
{
  return (NSString *)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("[%@] %@"), objc_opt_class(), self->_shortServiceIdentifier);
}

- (HDIDSServiceDelegate)delegate
{
  return (HDIDSServiceDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (IDSService)service
{
  return self->_service;
}

- (BOOL)unitTest_sendOnEmptyDestinationSet
{
  return self->_unitTest_sendOnEmptyDestinationSet;
}

- (void)setUnitTest_sendOnEmptyDestinationSet:(BOOL)a3
{
  self->_unitTest_sendOnEmptyDestinationSet = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_service, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_shortServiceIdentifier, 0);
  objc_storeStrong((id *)&self->_serviceIdentifier, 0);
}

@end
