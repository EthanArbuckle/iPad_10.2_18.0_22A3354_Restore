@implementation DMFConfigurationSourceClient

- (DMFConfigurationSourceClient)init
{
  void *v4;
  void *v5;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("DMFConfigurationSourceClient.m"), 60, CFSTR("%@ cannot call %@"), self, v5);

  return -[DMFConfigurationSourceClient initWithConnection:organizationIdentifier:displayName:localMachServiceName:](self, "initWithConnection:organizationIdentifier:displayName:localMachServiceName:", 0, 0, 0, 0);
}

- (DMFConfigurationSourceClient)initWithConnection:(id)a3 organizationIdentifier:(id)a4 displayName:(id)a5 localMachServiceName:(id)a6
{
  id v12;
  id v13;
  id v14;
  id v15;
  DMFConfigurationSourceClient *v16;
  DMFConfigurationSourceClient *v17;
  id v18;
  dispatch_queue_t v19;
  OS_dispatch_queue *serialQueue;
  dispatch_source_t v21;
  OS_dispatch_source *registerConfigurationSource;
  NSObject *v23;
  NSObject *v24;
  uint64_t v25;
  NSXPCListener *listener;
  uint64_t v27;
  CATOperationQueue *operationQueue;
  void *v29;
  uint64_t v30;
  NSString *configurationSourceName;
  uint64_t v32;
  NSString *organizationIdentifier;
  uint64_t v34;
  NSString *machServiceName;
  uint64_t v36;
  NSObject *reportingRequirementsLock;
  void *v39;
  void *v40;
  void *v41;
  _QWORD handler[4];
  id v43;
  id location;
  objc_super v45;

  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  if (!v12)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("DMFConfigurationSourceClient.m"), 68, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("connection"));

  }
  if (!objc_msgSend(v13, "length"))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("DMFConfigurationSourceClient.m"), 69, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("organizationIdentifier.length > 0"));

  }
  if (!objc_msgSend(v14, "length"))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("DMFConfigurationSourceClient.m"), 70, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("displayName.length > 0"));

  }
  v45.receiver = self;
  v45.super_class = (Class)DMFConfigurationSourceClient;
  v16 = -[DMFConfigurationSourceClient init](&v45, sel_init);
  v17 = v16;
  if (v16)
  {
    -[DMFConfigurationSourceClient description](v16, "description");
    v18 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v19 = dispatch_queue_create((const char *)objc_msgSend(v18, "UTF8String"), 0);
    serialQueue = v17->_serialQueue;
    v17->_serialQueue = (OS_dispatch_queue *)v19;

    v21 = dispatch_source_create(MEMORY[0x1E0C80D78], 0, 0, (dispatch_queue_t)v17->_serialQueue);
    registerConfigurationSource = v17->_registerConfigurationSource;
    v17->_registerConfigurationSource = (OS_dispatch_source *)v21;

    objc_initWeak(&location, v17);
    v23 = v17->_registerConfigurationSource;
    handler[0] = MEMORY[0x1E0C809B0];
    handler[1] = 3221225472;
    handler[2] = __107__DMFConfigurationSourceClient_initWithConnection_organizationIdentifier_displayName_localMachServiceName___block_invoke;
    handler[3] = &unk_1E6ED7F30;
    objc_copyWeak(&v43, &location);
    dispatch_source_set_event_handler(v23, handler);
    -[DMFConfigurationSourceClient registerConfigurationSource](v17, "registerConfigurationSource");
    v24 = objc_claimAutoreleasedReturnValue();
    dispatch_resume(v24);

    objc_storeStrong((id *)&v17->_connection, a3);
    if (v15)
    {
      v25 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3B58]), "initWithMachServiceName:", v15);
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB3B58], "anonymousListener");
      v25 = objc_claimAutoreleasedReturnValue();
    }
    listener = v17->_listener;
    v17->_listener = (NSXPCListener *)v25;

    -[NSXPCListener setDelegate:](v17->_listener, "setDelegate:", v17);
    -[NSXPCListener _setQueue:](v17->_listener, "_setQueue:", v17->_serialQueue);
    v27 = objc_opt_new();
    operationQueue = v17->_operationQueue;
    v17->_operationQueue = (CATOperationQueue *)v27;

    -[DMFConfigurationSourceClient description](v17, "description");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    -[CATOperationQueue setName:](v17->_operationQueue, "setName:", v29);

    -[CATOperationQueue setUnderlyingQueue:](v17->_operationQueue, "setUnderlyingQueue:", v17->_serialQueue);
    v30 = objc_msgSend(v14, "copy");
    configurationSourceName = v17->_configurationSourceName;
    v17->_configurationSourceName = (NSString *)v30;

    v32 = objc_msgSend(v13, "copy");
    organizationIdentifier = v17->_organizationIdentifier;
    v17->_organizationIdentifier = (NSString *)v32;

    v34 = objc_msgSend(v15, "copy");
    machServiceName = v17->_machServiceName;
    v17->_machServiceName = (NSString *)v34;

    v36 = objc_opt_new();
    reportingRequirementsLock = v17->_reportingRequirementsLock;
    v17->_reportingRequirementsLock = v36;

    objc_destroyWeak(&v43);
    objc_destroyWeak(&location);
  }

  return v17;
}

void __107__DMFConfigurationSourceClient_initWithConnection_organizationIdentifier_displayName_localMachServiceName___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "registerConfigurationSourceIfNeeded");

}

- (void)dealloc
{
  void *v4;
  objc_super v5;

  if (-[DMFConfigurationSourceClient state](self, "state") && -[DMFConfigurationSourceClient state](self, "state") != 4)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("DMFConfigurationSourceClient.m"), 105, CFSTR("%@ must be invalidated before it's deallocated"), self);

  }
  v5.receiver = self;
  v5.super_class = (Class)DMFConfigurationSourceClient;
  -[DMFConfigurationSourceClient dealloc](&v5, sel_dealloc);
}

- (DMFReportingRequirements)reportingRequirements
{
  NSObject *v3;
  DMFReportingRequirements *v4;

  v3 = self->_reportingRequirementsLock;
  objc_sync_enter(v3);
  v4 = self->_reportingRequirements;
  objc_sync_exit(v3);

  return v4;
}

- (void)setReportingRequirements:(id)a3
{
  DMFReportingRequirements *v4;
  NSObject *v5;
  DMFReportingRequirements *reportingRequirements;
  DMFReportingRequirements *v7;
  NSObject *v8;

  v4 = (DMFReportingRequirements *)objc_msgSend(a3, "copy");
  v5 = self->_reportingRequirementsLock;
  objc_sync_enter(v5);
  reportingRequirements = self->_reportingRequirements;
  self->_reportingRequirements = v4;
  v7 = v4;

  objc_sync_exit(v5);
  -[DMFConfigurationSourceClient registerConfigurationSource](self, "registerConfigurationSource");
  v8 = objc_claimAutoreleasedReturnValue();
  dispatch_source_merge_data(v8, 1uLL);

}

- (void)resume
{
  NSObject *v4;
  _QWORD v5[6];

  -[DMFConfigurationSourceClient serialQueue](self, "serialQueue");
  v4 = objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __38__DMFConfigurationSourceClient_resume__block_invoke;
  v5[3] = &unk_1E6ED7F58;
  v5[4] = self;
  v5[5] = a2;
  dispatch_async(v4, v5);

}

void __38__DMFConfigurationSourceClient_resume__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  NSObject *v4;

  if (objc_msgSend(*(id *)(a1 + 32), "state"))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "handleFailureInMethod:object:file:lineNumber:description:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));

  }
  objc_msgSend(*(id *)(a1 + 32), "setState:", 1);
  objc_msgSend(*(id *)(a1 + 32), "listener");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "resume");

  objc_msgSend(*(id *)(a1 + 32), "registerConfigurationSource");
  v4 = objc_claimAutoreleasedReturnValue();
  dispatch_source_merge_data(v4, 1uLL);

}

- (void)invalidate
{
  NSObject *v3;
  _QWORD block[5];

  -[DMFConfigurationSourceClient serialQueue](self, "serialQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __42__DMFConfigurationSourceClient_invalidate__block_invoke;
  block[3] = &unk_1E6ED7D40;
  block[4] = self;
  dispatch_async(v3, block);

}

void __42__DMFConfigurationSourceClient_invalidate__block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  NSObject *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  NSObject *v17;
  NSObject *v18;
  NSObject *v19;
  NSObject *v20;
  _QWORD v21[5];
  _QWORD block[4];
  NSObject *v23;
  _QWORD v24[4];
  NSObject *v25;
  _QWORD v26[4];
  NSObject *v27;
  uint8_t buf[4];
  uint64_t v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  if (!objc_msgSend(*(id *)(a1 + 32), "state") || (objc_msgSend(*(id *)(a1 + 32), "isInvalid") & 1) == 0)
  {
    DMFConfigurationEngineLog();
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
    {
      v3 = *(_QWORD *)(a1 + 32);
      *(_DWORD *)buf = 138543362;
      v29 = v3;
      _os_log_impl(&dword_1B8C0C000, v2, OS_LOG_TYPE_INFO, "Invalidating configuration source %{public}@...", buf, 0xCu);
    }

    v4 = dispatch_group_create();
    objc_msgSend(*(id *)(a1 + 32), "listener");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "invalidate");

    objc_msgSend(*(id *)(a1 + 32), "incomingConnection");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    v7 = MEMORY[0x1E0C809B0];
    if (v6)
    {
      dispatch_group_enter(v4);
      v26[0] = v7;
      v26[1] = 3221225472;
      v26[2] = __42__DMFConfigurationSourceClient_invalidate__block_invoke_21;
      v26[3] = &unk_1E6ED7D40;
      v27 = v4;
      objc_msgSend(*(id *)(a1 + 32), "incomingConnection");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "setInvalidationHandler:", v26);

      objc_msgSend(*(id *)(a1 + 32), "incomingConnection");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "invalidate");

    }
    objc_msgSend(*(id *)(a1 + 32), "operationQueue");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "cancelAllOperations");

    dispatch_group_enter(v4);
    v11 = (void *)MEMORY[0x1E0CB34C8];
    v24[0] = v7;
    v24[1] = 3221225472;
    v24[2] = __42__DMFConfigurationSourceClient_invalidate__block_invoke_2;
    v24[3] = &unk_1E6ED7D40;
    v12 = v4;
    v25 = v12;
    objc_msgSend(v11, "blockOperationWithBlock:", v24);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "operationQueue");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "operations");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "cat_addDependencies:", v15);

    objc_msgSend(*(id *)(a1 + 32), "operationQueue");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "addOperation:", v13);

    dispatch_group_enter(v12);
    objc_msgSend(*(id *)(a1 + 32), "serialQueue");
    v17 = objc_claimAutoreleasedReturnValue();
    block[0] = v7;
    block[1] = 3221225472;
    block[2] = __42__DMFConfigurationSourceClient_invalidate__block_invoke_3;
    block[3] = &unk_1E6ED7D40;
    v23 = v12;
    v18 = v12;
    dispatch_async(v17, block);

    objc_msgSend(*(id *)(a1 + 32), "registerConfigurationSource");
    v19 = objc_claimAutoreleasedReturnValue();
    dispatch_suspend(v19);

    objc_msgSend(*(id *)(a1 + 32), "serialQueue");
    v20 = objc_claimAutoreleasedReturnValue();
    v21[0] = v7;
    v21[1] = 3221225472;
    v21[2] = __42__DMFConfigurationSourceClient_invalidate__block_invoke_4;
    v21[3] = &unk_1E6ED7D40;
    v21[4] = *(_QWORD *)(a1 + 32);
    dispatch_group_notify(v18, v20, v21);

  }
}

void __42__DMFConfigurationSourceClient_invalidate__block_invoke_21(uint64_t a1)
{
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void __42__DMFConfigurationSourceClient_invalidate__block_invoke_2(uint64_t a1)
{
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void __42__DMFConfigurationSourceClient_invalidate__block_invoke_3(uint64_t a1)
{
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void __42__DMFConfigurationSourceClient_invalidate__block_invoke_4(uint64_t a1)
{
  NSObject *v2;
  NSObject *v3;
  NSObject *v4;
  uint64_t v5;
  int v6;
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "setState:", 4);
  objc_msgSend(*(id *)(a1 + 32), "registerConfigurationSource");
  v2 = objc_claimAutoreleasedReturnValue();
  dispatch_source_cancel(v2);

  objc_msgSend(*(id *)(a1 + 32), "registerConfigurationSource");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_resume(v3);

  objc_msgSend(*(id *)(a1 + 32), "setRegisterConfigurationSource:", 0);
  DMFConfigurationEngineLog();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    v5 = *(_QWORD *)(a1 + 32);
    v6 = 138543362;
    v7 = v5;
    _os_log_impl(&dword_1B8C0C000, v4, OS_LOG_TYPE_INFO, "Did invalidate configuration source: %{public}@", (uint8_t *)&v6, 0xCu);
  }

}

- (id)stateDescription
{
  unint64_t v2;

  v2 = -[DMFConfigurationSourceClient state](self, "state");
  if (v2 - 1 > 3)
    return CFSTR("notStarted");
  else
    return off_1E6ED7F78[v2 - 1];
}

- (NSString)debugDescription
{
  void *v3;
  void *v4;
  _QWORD v6[4];

  v6[3] = *MEMORY[0x1E0C80C00];
  v6[0] = CFSTR("stateDescription");
  v6[1] = CFSTR("name");
  v6[2] = CFSTR("machService");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v6, 3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  DMFObjectDescriptionWithProperties(self, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v4;
}

- (NSString)description
{
  void *v3;
  void *v4;
  _QWORD v6[3];

  v6[2] = *MEMORY[0x1E0C80C00];
  v6[0] = CFSTR("name");
  v6[1] = CFSTR("machService");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v6, 2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  DMFObjectDescriptionWithProperties(self, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v4;
}

- (BOOL)isInvalid
{
  return -[DMFConfigurationSourceClient state](self, "state") - 3 < 0xFFFFFFFFFFFFFFFELL;
}

- (void)registerConfigurationSourceIfNeeded
{
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  NSObject *v16;
  NSObject *v17;
  void *v18;
  void *v19;
  uint8_t buf[4];
  void *v21;
  __int16 v22;
  DMFConfigurationSourceClient *v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  -[DMFConfigurationSourceClient serialQueue](self, "serialQueue");
  v4 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v4);

  if (!-[DMFConfigurationSourceClient isInvalid](self, "isInvalid"))
  {
    v5 = (void *)objc_opt_new();
    -[DMFConfigurationSourceClient configurationSourceName](self, "configurationSourceName");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setConfigurationSourceName:", v6);

    -[DMFConfigurationSourceClient organizationIdentifier](self, "organizationIdentifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setOrganizationIdentifier:", v7);

    -[DMFConfigurationSourceClient machServiceName](self, "machServiceName");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setMachServiceName:", v8);

    -[DMFConfigurationSourceClient listener](self, "listener");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "endpoint");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setListenerEndpoint:", v10);

    -[DMFConfigurationSourceClient reportingRequirements](self, "reportingRequirements");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setReportingRequirements:", v11);

    -[DMFConfigurationSourceClient connection](self, "connection");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "prepareOperationForRequest:", v5);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v13)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      -[DMFConfigurationSourceClient connection](self, "connection");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("DMFConfigurationSourceClient.m"), 271, CFSTR("connection %@ did not return an operation for request: %@"), v19, v5);

    }
    -[DMFConfigurationSourceClient serialQueue](self, "serialQueue");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "addTarget:selector:forOperationEvents:delegateQueue:", self, sel_registrationOperationDidFinish_, 6, v14);

    -[DMFConfigurationSourceClient operationQueue](self, "operationQueue");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "addOperation:", v13);

    -[DMFConfigurationSourceClient registerConfigurationSource](self, "registerConfigurationSource");
    v16 = objc_claimAutoreleasedReturnValue();
    dispatch_suspend(v16);

    DMFConfigurationEngineLog();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138543618;
      v21 = v5;
      v22 = 2114;
      v23 = self;
      _os_log_impl(&dword_1B8C0C000, v17, OS_LOG_TYPE_INFO, "Performing registration request %{public}@ for %{public}@", buf, 0x16u);
    }

  }
}

- (void)registrationOperationDidFinish:(id)a3
{
  id v4;
  NSObject *v5;
  NSObject *v6;
  NSObject *v7;
  void *v8;
  NSObject *v9;
  NSObject *v10;
  void *v11;
  char v12;
  void *v13;
  int v14;
  DMFConfigurationSourceClient *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[DMFConfigurationSourceClient serialQueue](self, "serialQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  -[DMFConfigurationSourceClient registerConfigurationSource](self, "registerConfigurationSource");
  v6 = objc_claimAutoreleasedReturnValue();
  dispatch_resume(v6);

  if (!-[DMFConfigurationSourceClient isInvalid](self, "isInvalid"))
  {
    if (-[DMFConfigurationSourceClient state](self, "state") == 1)
    {
      -[DMFConfigurationSourceClient setState:](self, "setState:", 2);
      DMFConfigurationEngineLog();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
      {
        v14 = 138543362;
        v15 = self;
        _os_log_impl(&dword_1B8C0C000, v7, OS_LOG_TYPE_INFO, "Configuration source resumed %{public}@", (uint8_t *)&v14, 0xCu);
      }

    }
    objc_msgSend(v4, "error");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    DMFConfigurationEngineLog();
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = v9;
    if (!v8)
    {
      if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
      {
        v14 = 138543362;
        v15 = self;
        _os_log_impl(&dword_1B8C0C000, v10, OS_LOG_TYPE_INFO, "Registered as a configuration source: %{public}@", (uint8_t *)&v14, 0xCu);
      }
      goto LABEL_13;
    }
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      -[DMFConfigurationSourceClient registrationOperationDidFinish:].cold.1((uint64_t)self, v4, v10);

    -[DMFConfigurationSourceClient delegate](self, "delegate");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_opt_respondsToSelector();

    if ((v12 & 1) != 0)
    {
      -[DMFConfigurationSourceClient delegate](self, "delegate");
      v10 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "error");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSObject configurationSourceDidFailToRegister:withError:](v10, "configurationSourceDidFailToRegister:withError:", self, v13);

LABEL_13:
    }
  }

}

- (void)enqueueOperationToReportStatusChange:(id)a3 completion:(id)a4
{
  void (**v6)(id, void *);
  NSObject *v7;
  void *v8;
  char v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;

  v15 = a3;
  v6 = (void (**)(id, void *))a4;
  -[DMFConfigurationSourceClient serialQueue](self, "serialQueue");
  v7 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v7);

  -[DMFConfigurationSourceClient delegate](self, "delegate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_opt_respondsToSelector();

  if ((v9 & 1) != 0
    && (-[DMFConfigurationSourceClient delegate](self, "delegate"),
        v10 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v10, "operationToSendStatusUpdate:", v15),
        v11 = (void *)objc_claimAutoreleasedReturnValue(),
        v10,
        v11))
  {
    if (v6)
    {
      v12 = (void *)MEMORY[0x1BCCB7F34](v6);
      -[DMFConfigurationSourceClient serialQueue](self, "serialQueue");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "addTarget:selector:forOperationEvents:userInfo:delegateQueue:", self, sel_statusReportingOperationDidFinish_completion_, 6, v12, v13);

    }
    -[DMFConfigurationSourceClient operationQueue](self, "operationQueue");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "addOperation:", v11);

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("TODO"), 1010, 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v6[2](v6, v11);
  }

}

- (void)statusReportingOperationDidFinish:(id)a3 completion:(id)a4
{
  void (**v6)(id, id);
  id v7;
  NSObject *v8;
  id v9;

  v6 = (void (**)(id, id))a4;
  v7 = a3;
  -[DMFConfigurationSourceClient serialQueue](self, "serialQueue");
  v8 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v8);

  objc_msgSend(v7, "error");
  v9 = (id)objc_claimAutoreleasedReturnValue();

  v6[2](v6, v9);
}

- (void)enqueueOperationToReportEvents:(id)a3 completion:(id)a4
{
  void (**v6)(id, void *);
  NSObject *v7;
  void *v8;
  char v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;

  v15 = a3;
  v6 = (void (**)(id, void *))a4;
  -[DMFConfigurationSourceClient serialQueue](self, "serialQueue");
  v7 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v7);

  -[DMFConfigurationSourceClient delegate](self, "delegate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_opt_respondsToSelector();

  if ((v9 & 1) != 0
    && (-[DMFConfigurationSourceClient delegate](self, "delegate"),
        v10 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v10, "operationToSendEvents:", v15),
        v11 = (void *)objc_claimAutoreleasedReturnValue(),
        v10,
        v11))
  {
    if (v6)
    {
      v12 = (void *)MEMORY[0x1BCCB7F34](v6);
      -[DMFConfigurationSourceClient serialQueue](self, "serialQueue");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "addTarget:selector:forOperationEvents:userInfo:delegateQueue:", self, sel_eventsReportingOperationDidFinish_completion_, 6, v12, v13);

    }
    -[DMFConfigurationSourceClient operationQueue](self, "operationQueue");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "addOperation:", v11);

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("TODO"), 1010, 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v6[2](v6, v11);
  }

}

- (void)eventsReportingOperationDidFinish:(id)a3 completion:(id)a4
{
  void (**v6)(id, id);
  id v7;
  NSObject *v8;
  id v9;

  v6 = (void (**)(id, id))a4;
  v7 = a3;
  -[DMFConfigurationSourceClient serialQueue](self, "serialQueue");
  v8 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v8);

  objc_msgSend(v7, "error");
  v9 = (id)objc_claimAutoreleasedReturnValue();

  v6[2](v6, v9);
}

- (void)enqueueOperationToResolveAsset:(id)a3 completion:(id)a4
{
  void (**v6)(id, _QWORD, void *);
  NSObject *v7;
  void *v8;
  char v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;

  v15 = a3;
  v6 = (void (**)(id, _QWORD, void *))a4;
  -[DMFConfigurationSourceClient serialQueue](self, "serialQueue");
  v7 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v7);

  -[DMFConfigurationSourceClient delegate](self, "delegate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_opt_respondsToSelector();

  if ((v9 & 1) != 0
    && (-[DMFConfigurationSourceClient delegate](self, "delegate"),
        v10 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v10, "operationToResolveAsset:", v15),
        v11 = (void *)objc_claimAutoreleasedReturnValue(),
        v10,
        v11))
  {
    v12 = (void *)MEMORY[0x1BCCB7F34](v6);
    -[DMFConfigurationSourceClient serialQueue](self, "serialQueue");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "addTarget:selector:forOperationEvents:userInfo:delegateQueue:", self, sel_assetResolutionOperationDidFinish_completion_, 6, v12, v13);

    -[DMFConfigurationSourceClient operationQueue](self, "operationQueue");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "addOperation:", v11);

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("TODO"), 1010, 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v6[2](v6, 0, v11);
  }

}

- (void)assetResolutionOperationDidFinish:(id)a3 completion:(id)a4
{
  void (**v6)(id, id, void *);
  id v7;
  NSObject *v8;
  void *v9;
  id v10;

  v6 = (void (**)(id, id, void *))a4;
  v7 = a3;
  -[DMFConfigurationSourceClient serialQueue](self, "serialQueue");
  v8 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v8);

  objc_msgSend(v7, "resultObject");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "error");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v6[2](v6, v10, v9);
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v5;
  NSObject *v6;
  void *v7;
  BOOL v8;
  NSObject *v9;
  void *v11;
  void *v12;
  void *v13;
  int v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v5 = a4;
  -[DMFConfigurationSourceClient serialQueue](self, "serialQueue");
  v6 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v6);

  objc_msgSend(v5, "valueForEntitlement:", CFSTR("application-identifier"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0 || (objc_msgSend(v7, "isEqualToString:", CFSTR("com.apple.dmd")) & 1) == 0)
  {
    DMFConfigurationEngineLog();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      -[DMFConfigurationSourceClient listener:shouldAcceptNewConnection:].cold.1();
    v8 = 0;
    goto LABEL_8;
  }
  if (!-[DMFConfigurationSourceClient isInvalid](self, "isInvalid"))
  {
    -[DMFConfigurationSourceClient incomingConnection](self, "incomingConnection");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "invalidate");

    -[DMFConfigurationSourceClient setIncomingConnection:](self, "setIncomingConnection:", v5);
    -[DMFConfigurationSourceClient serialQueue](self, "serialQueue");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "_setQueue:", v12);

    DMFConfigurationSourceClientXPCInterface();
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setExportedInterface:", v13);

    objc_msgSend(v5, "setExportedObject:", self);
    objc_msgSend(v5, "resume");
    DMFConfigurationEngineLog();
    v9 = objc_claimAutoreleasedReturnValue();
    v8 = 1;
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      v14 = 138543362;
      v15 = v5;
      _os_log_impl(&dword_1B8C0C000, v9, OS_LOG_TYPE_INFO, "new connection %{public}@", (uint8_t *)&v14, 0xCu);
    }
LABEL_8:

    goto LABEL_9;
  }
  v8 = 0;
LABEL_9:

  return v8;
}

- (void)probe:(id)a3
{
  (*((void (**)(id, _QWORD))a3 + 2))(a3, 0);
}

- (void)configurationStatusDidChange:(id)a3 completion:(id)a4
{
  void (**v6)(id, void *);
  NSObject *v7;
  void *v8;
  id v9;

  v9 = a3;
  v6 = (void (**)(id, void *))a4;
  -[DMFConfigurationSourceClient serialQueue](self, "serialQueue");
  v7 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v7);

  if (-[DMFConfigurationSourceClient isInvalid](self, "isInvalid"))
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB28A8], 4099, 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v6[2](v6, v8);

  }
  else
  {
    -[DMFConfigurationSourceClient enqueueOperationToReportStatusChange:completion:](self, "enqueueOperationToReportStatusChange:completion:", v9, v6);
  }

}

- (void)configurationEventsDidChange:(id)a3 completion:(id)a4
{
  void (**v6)(id, void *);
  NSObject *v7;
  void *v8;
  id v9;

  v9 = a3;
  v6 = (void (**)(id, void *))a4;
  -[DMFConfigurationSourceClient serialQueue](self, "serialQueue");
  v7 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v7);

  if (-[DMFConfigurationSourceClient isInvalid](self, "isInvalid"))
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB28A8], 4099, 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v6[2](v6, v8);

  }
  else
  {
    -[DMFConfigurationSourceClient enqueueOperationToReportEvents:completion:](self, "enqueueOperationToReportEvents:completion:", v9, v6);
  }

}

- (void)configurationEngineRequestedAsset:(id)a3 completion:(id)a4
{
  void (**v6)(id, _QWORD, void *);
  NSObject *v7;
  void *v8;
  id v9;

  v9 = a3;
  v6 = (void (**)(id, _QWORD, void *))a4;
  -[DMFConfigurationSourceClient serialQueue](self, "serialQueue");
  v7 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v7);

  if (-[DMFConfigurationSourceClient isInvalid](self, "isInvalid"))
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB28A8], 4099, 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v6[2](v6, 0, v8);

  }
  else
  {
    -[DMFConfigurationSourceClient enqueueOperationToResolveAsset:completion:](self, "enqueueOperationToResolveAsset:completion:", v9, v6);
  }

}

+ (id)activeRestrictionsURL
{
  uint64_t v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  _QWORD v8[6];

  v8[5] = *MEMORY[0x1E0C80C00];
  NSHomeDirectoryForUser(CFSTR("mobile"));
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)v2;
  if (v2)
  {
    v4 = (void *)MEMORY[0x1E0C99E98];
    v8[0] = v2;
    v8[1] = CFSTR("Library");
    v8[2] = CFSTR("dmd");
    v8[3] = CFSTR("ConfigurationEngine");
    v8[4] = CFSTR("ActiveRestrictions.plist");
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v8, 5);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "fileURLWithPathComponents:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

+ (id)setOfActiveRestrictionUUIDs
{
  void *v2;
  void *v3;
  NSObject *v4;
  NSObject *v5;
  NSObject *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  NSObject *v11;
  NSObject *v12;
  id v14;
  id v15;

  objc_msgSend(a1, "activeRestrictionsURL");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    v15 = 0;
    objc_msgSend(MEMORY[0x1E0C99D50], "dataWithContentsOfURL:options:error:", v2, 0, &v15);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = v15;
    if (!v3)
    {
      DMFConfigurationEngineLog();
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
        +[DMFConfigurationSourceClient setOfActiveRestrictionUUIDs].cold.2(v4);
      v8 = 0;
      v6 = v4;
      goto LABEL_24;
    }
    v14 = 0;
    objc_msgSend(MEMORY[0x1E0CB38B0], "propertyListWithData:options:format:error:", v3, 0, 0, &v14);
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = v14;

    if (v5)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", v5);
        v7 = objc_claimAutoreleasedReturnValue();
LABEL_17:
        v8 = (void *)v7;
LABEL_24:

        goto LABEL_25;
      }
      DMFConfigurationEngineLog();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
        +[DMFConfigurationSourceClient setOfActiveRestrictionUUIDs].cold.5();
    }
    else
    {
      -[NSObject domain](v6, "domain");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v9, "isEqualToString:", *MEMORY[0x1E0CB28A8]))
      {
        v10 = -[NSObject code](v6, "code");

        if (v10 == 4)
        {
          DMFConfigurationEngineLog();
          v11 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
            +[DMFConfigurationSourceClient setOfActiveRestrictionUUIDs].cold.3(v11);

          objc_msgSend(MEMORY[0x1E0C99E60], "set");
          v7 = objc_claimAutoreleasedReturnValue();
          goto LABEL_17;
        }
      }
      else
      {

      }
      DMFConfigurationEngineLog();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
        +[DMFConfigurationSourceClient setOfActiveRestrictionUUIDs].cold.4(v6);
    }

    v8 = 0;
    goto LABEL_24;
  }
  DMFConfigurationEngineLog();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    +[DMFConfigurationSourceClient setOfActiveRestrictionUUIDs].cold.1(v6);
  v8 = 0;
LABEL_25:

  return v8;
}

- (DMFConfigurationSourceClientDelegate)delegate
{
  return (DMFConfigurationSourceClientDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (unint64_t)state
{
  return self->_state;
}

- (void)setState:(unint64_t)a3
{
  self->_state = a3;
}

- (DMFConnection)connection
{
  return self->_connection;
}

- (void)setConnection:(id)a3
{
  objc_storeStrong((id *)&self->_connection, a3);
}

- (NSXPCListener)listener
{
  return self->_listener;
}

- (void)setListener:(id)a3
{
  objc_storeStrong((id *)&self->_listener, a3);
}

- (NSXPCConnection)incomingConnection
{
  return self->_incomingConnection;
}

- (void)setIncomingConnection:(id)a3
{
  objc_storeStrong((id *)&self->_incomingConnection, a3);
}

- (NSObject)reportingRequirementsLock
{
  return self->_reportingRequirementsLock;
}

- (void)setReportingRequirementsLock:(id)a3
{
  objc_storeStrong((id *)&self->_reportingRequirementsLock, a3);
}

- (NSString)configurationSourceName
{
  return self->_configurationSourceName;
}

- (void)setConfigurationSourceName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (NSString)organizationIdentifier
{
  return self->_organizationIdentifier;
}

- (void)setOrganizationIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (NSString)machServiceName
{
  return self->_machServiceName;
}

- (void)setMachServiceName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 80);
}

- (OS_dispatch_queue)serialQueue
{
  return self->_serialQueue;
}

- (void)setSerialQueue:(id)a3
{
  objc_storeStrong((id *)&self->_serialQueue, a3);
}

- (CATOperationQueue)operationQueue
{
  return self->_operationQueue;
}

- (void)setOperationQueue:(id)a3
{
  objc_storeStrong((id *)&self->_operationQueue, a3);
}

- (OS_dispatch_source)registerConfigurationSource
{
  return self->_registerConfigurationSource;
}

- (void)setRegisterConfigurationSource:(id)a3
{
  objc_storeStrong((id *)&self->_registerConfigurationSource, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_registerConfigurationSource, 0);
  objc_storeStrong((id *)&self->_operationQueue, 0);
  objc_storeStrong((id *)&self->_serialQueue, 0);
  objc_storeStrong((id *)&self->_machServiceName, 0);
  objc_storeStrong((id *)&self->_organizationIdentifier, 0);
  objc_storeStrong((id *)&self->_configurationSourceName, 0);
  objc_storeStrong((id *)&self->_reportingRequirementsLock, 0);
  objc_storeStrong((id *)&self->_incomingConnection, 0);
  objc_storeStrong((id *)&self->_listener, 0);
  objc_storeStrong((id *)&self->_connection, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_reportingRequirements, 0);
}

- (void)registrationOperationDidFinish:(NSObject *)a3 .cold.1(uint64_t a1, void *a2, NSObject *a3)
{
  void *v5;
  int v6;
  uint64_t v7;
  __int16 v8;
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a2, "error");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = 138543618;
  v7 = a1;
  v8 = 2114;
  v9 = v5;
  _os_log_error_impl(&dword_1B8C0C000, a3, OS_LOG_TYPE_ERROR, "Failed to register configuration source \"%{public}@\": %{public}@", (uint8_t *)&v6, 0x16u);

}

- (void)listener:shouldAcceptNewConnection:.cold.1()
{
  os_log_t v0;
  uint8_t v1[24];
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_2_0();
  _os_log_error_impl(&dword_1B8C0C000, v0, OS_LOG_TYPE_ERROR, "rejecting incoming connection from %{public}@", v1, 0xCu);
}

+ (void)setOfActiveRestrictionUUIDs
{
  objc_class *v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  v0 = (objc_class *)objc_opt_class();
  NSStringFromClass(v0);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_0(&dword_1B8C0C000, v2, v3, "Couldn't read active restrictions with unexpected type: %{public}@", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_1_1();
}

@end
