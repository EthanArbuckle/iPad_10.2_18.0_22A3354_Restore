@implementation CHSWidgetEventServicePublisher

- (void)dealloc
{
  objc_super v3;

  -[CHSWidgetEventServicePublisher _invalidateConnection](self, "_invalidateConnection");
  v3.receiver = self;
  v3.super_class = (Class)CHSWidgetEventServicePublisher;
  -[CHSWidgetEventServicePublisher dealloc](&v3, sel_dealloc);
}

- (id)description
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("<%@: %p; machName: %@>"),
               objc_opt_class(),
               self,
               self->_machServiceName);
}

- (CHSWidgetEventServicePublisher)initWithMachServiceName:(id)a3
{
  id v5;
  CHSWidgetEventServicePublisher *v6;
  uint64_t v7;
  NSString *machServiceName;
  uint64_t Serial;
  OS_dispatch_queue *connectionQueue;
  NSObject *v11;
  objc_class *v12;
  void *v13;
  void *v14;
  void *v16;
  objc_super v17;
  uint8_t buf[4];
  void *v19;
  __int16 v20;
  void *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("CHSWidgetEventServicePublisher.m"), 38, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("machServiceName"));

  }
  v17.receiver = self;
  v17.super_class = (Class)CHSWidgetEventServicePublisher;
  v6 = -[CHSWidgetEventServicePublisher init](&v17, sel_init);
  if (v6)
  {
    v7 = objc_msgSend(v5, "copy");
    machServiceName = v6->_machServiceName;
    v6->_machServiceName = (NSString *)v7;

    Serial = BSDispatchQueueCreateSerial();
    connectionQueue = v6->_connectionQueue;
    v6->_connectionQueue = (OS_dispatch_queue *)Serial;

    CHSLogChronoServices();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      v12 = (objc_class *)objc_opt_class();
      NSStringFromClass(v12);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[CHSWidgetEventServicePublisher description](v6, "description");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v19 = v13;
      v20 = 2114;
      v21 = v14;
      _os_log_impl(&dword_18FB18000, v11, OS_LOG_TYPE_DEFAULT, "Initializing new %{public}@ instance: %{public}@", buf, 0x16u);

    }
  }

  return v6;
}

- (void)activate
{
  id v2;

  v2 = -[CHSWidgetEventServicePublisher _activeConnection](self, "_activeConnection");
}

- (void)publishOpenEventWithURL:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  v6 = a3;
  -[CHSWidgetEventServicePublisher _activeConnection](self, "_activeConnection");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "remoteTarget");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
    objc_msgSend(v5, "handleOpenEventWithURL:", v6);

}

- (void)publishOpenEventWithUserActivity:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  NSObject *v7;
  objc_class *v8;
  void *v9;
  _QWORD v10[6];
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t (*v14)(uint64_t, uint64_t);
  void (*v15)(uint64_t);
  id v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t (*v20)(uint64_t, uint64_t);
  void (*v21)(uint64_t);
  id v22;
  uint8_t buf[4];
  void *v24;
  __int16 v25;
  id v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[CHSWidgetEventServicePublisher _activeConnection](self, "_activeConnection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "remoteTarget");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    v17 = 0;
    v18 = &v17;
    v19 = 0x3032000000;
    v20 = __Block_byref_object_copy__1;
    v21 = __Block_byref_object_dispose__1;
    v22 = 0;
    v11 = 0;
    v12 = &v11;
    v13 = 0x3032000000;
    v14 = __Block_byref_object_copy__1;
    v15 = __Block_byref_object_dispose__1;
    v16 = 0;
    objc_msgSend(v4, "setNeedsSave:", 0);
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __67__CHSWidgetEventServicePublisher_publishOpenEventWithUserActivity___block_invoke;
    v10[3] = &unk_1E2A5A740;
    v10[4] = &v17;
    v10[5] = &v11;
    objc_msgSend(v4, "_createUserActivityDataWithOptions:completionHandler:", 0, v10);
    if (v12[5])
    {
      CHSLogChronoServices();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        v8 = (objc_class *)objc_opt_class();
        NSStringFromClass(v8);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v24 = v9;
        v25 = 2114;
        v26 = v4;
        _os_log_impl(&dword_18FB18000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@ Error serializing User Activity %{public}@", buf, 0x16u);

      }
    }
    else
    {
      objc_msgSend(v6, "handleOpenEventWithUserActivityData:", v18[5]);
    }
    _Block_object_dispose(&v11, 8);

    _Block_object_dispose(&v17, 8);
  }

}

void __67__CHSWidgetEventServicePublisher_publishOpenEventWithUserActivity___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;

  v5 = a2;
  v6 = a3;
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = v5;
  v11 = v5;

  v9 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v10 = *(void **)(v9 + 40);
  *(_QWORD *)(v9 + 40) = v6;

}

- (id)_activeConnection
{
  CHSWidgetEventServicePublisher *v2;
  void *v3;
  NSString *machServiceName;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v9[5];

  v2 = self;
  objc_sync_enter(v2);
  if (!v2->_connection)
  {
    v3 = (void *)MEMORY[0x1E0D03458];
    machServiceName = v2->_machServiceName;
    +[CHSWidgetEventServiceSpecification identifier](CHSWidgetEventServiceSpecification, "identifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "endpointForMachName:service:instance:", machServiceName, v5, 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0D03448], "connectionWithEndpoint:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __51__CHSWidgetEventServicePublisher__activeConnection__block_invoke;
    v9[3] = &unk_1E2A5A790;
    v9[4] = v2;
    objc_msgSend(v7, "configureConnection:", v9);
    objc_storeStrong((id *)&v2->_connection, v7);
    -[BSServiceConnection activate](v2->_connection, "activate");

  }
  objc_sync_exit(v2);

  return v2->_connection;
}

void __51__CHSWidgetEventServicePublisher__activeConnection__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  _QWORD v7[4];
  id v8;
  _QWORD v9[4];
  id v10;
  _QWORD v11[4];
  id v12;
  id location;

  v3 = a2;
  +[CHSWidgetEventServiceSpecification interface](CHSWidgetEventServiceSpecification, "interface");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_initWeak(&location, *(id *)(a1 + 32));
  if (v4)
  {
    objc_msgSend(v3, "setInterface:", v4);
    objc_msgSend(v3, "setInterfaceTarget:", *(_QWORD *)(a1 + 32));
  }
  objc_msgSend(v3, "setTargetQueue:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 24));
  +[CHSWidgetEventServiceSpecification serviceQuality](CHSWidgetEventServiceSpecification, "serviceQuality");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setServiceQuality:", v5);

  v6 = MEMORY[0x1E0C809B0];
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __51__CHSWidgetEventServicePublisher__activeConnection__block_invoke_2;
  v11[3] = &unk_1E2A5A768;
  objc_copyWeak(&v12, &location);
  objc_msgSend(v3, "setActivationHandler:", v11);
  v9[0] = v6;
  v9[1] = 3221225472;
  v9[2] = __51__CHSWidgetEventServicePublisher__activeConnection__block_invoke_17;
  v9[3] = &unk_1E2A5A768;
  objc_copyWeak(&v10, &location);
  objc_msgSend(v3, "setInterruptionHandler:", v9);
  v7[0] = v6;
  v7[1] = 3221225472;
  v7[2] = __51__CHSWidgetEventServicePublisher__activeConnection__block_invoke_18;
  v7[3] = &unk_1E2A5A768;
  objc_copyWeak(&v8, &location);
  objc_msgSend(v3, "setInvalidationHandler:", v7);
  objc_destroyWeak(&v8);
  objc_destroyWeak(&v10);
  objc_destroyWeak(&v12);
  objc_destroyWeak(&location);

}

void __51__CHSWidgetEventServicePublisher__activeConnection__block_invoke_2(uint64_t a1)
{
  id WeakRetained;
  NSObject *v2;
  objc_class *v3;
  void *v4;
  _BYTE *v5;
  int v6;
  void *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  CHSLogChronoServices();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = (objc_class *)objc_opt_class();
    NSStringFromClass(v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = 138543362;
    v7 = v4;
    _os_log_impl(&dword_18FB18000, v2, OS_LOG_TYPE_DEFAULT, "%{public}@ (host-side) connection activated", (uint8_t *)&v6, 0xCu);

  }
  if (WeakRetained)
  {
    v5 = WeakRetained;
    objc_sync_enter(v5);
    v5[32] = 1;
    objc_sync_exit(v5);

  }
}

void __51__CHSWidgetEventServicePublisher__activeConnection__block_invoke_17(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  NSObject *v5;
  objc_class *v6;
  void *v7;
  _BYTE *v8;
  int v9;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  CHSLogChronoServices();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = (objc_class *)objc_opt_class();
    NSStringFromClass(v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = 138543362;
    v10 = v7;
    _os_log_impl(&dword_18FB18000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@ (service-side) connection interrupted", (uint8_t *)&v9, 0xCu);

  }
  if (WeakRetained)
  {
    v8 = WeakRetained;
    objc_sync_enter(v8);
    v8[32] = 0;
    objc_msgSend(v3, "activate");
    objc_sync_exit(v8);

  }
}

void __51__CHSWidgetEventServicePublisher__activeConnection__block_invoke_18(uint64_t a1)
{
  id WeakRetained;
  NSObject *v2;
  objc_class *v3;
  void *v4;
  _BYTE *v5;
  int v6;
  void *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  CHSLogChronoServices();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = (objc_class *)objc_opt_class();
    NSStringFromClass(v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = 138543362;
    v7 = v4;
    _os_log_impl(&dword_18FB18000, v2, OS_LOG_TYPE_DEFAULT, "%{public}@ (host-side) connection invalidated", (uint8_t *)&v6, 0xCu);

  }
  if (WeakRetained)
  {
    v5 = WeakRetained;
    objc_sync_enter(v5);
    v5[32] = 0;
    objc_msgSend(v5, "_invalidateConnection");
    objc_sync_exit(v5);

  }
}

- (void)_invalidateConnection
{
  CHSWidgetEventServicePublisher *v2;
  BSServiceConnection *connection;
  BSServiceConnection *v4;
  CHSWidgetEventServicePublisher *obj;

  obj = self;
  objc_sync_enter(obj);
  v2 = obj;
  connection = obj->_connection;
  if (connection)
  {
    -[BSServiceConnection invalidate](connection, "invalidate");
    v4 = obj->_connection;
    obj->_connection = 0;

    v2 = obj;
  }
  objc_sync_exit(v2);

}

- (BOOL)isActive
{
  return self->_active;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_connectionQueue, 0);
  objc_storeStrong((id *)&self->_connection, 0);
  objc_storeStrong((id *)&self->_machServiceName, 0);
}

@end
