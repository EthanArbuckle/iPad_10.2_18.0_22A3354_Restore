@implementation BAAgentSystemProxy

- (BAAgentSystemProxy)init
{
  BAAgentSystemProxy *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)BAAgentSystemProxy;
  result = -[BAAgentSystemProxy init](&v3, sel_init);
  if (result)
    *(_QWORD *)&result->_connectionLock._os_unfair_lock_opaque = 0;
  return result;
}

- (uint64_t)_setupConnection
{
  void *v1;
  id v2;
  void *v3;
  SEL v4;
  SEL v5;
  void *v6;
  void *v7;
  SEL v8;
  id v9;
  SEL v10;
  id v11;
  SEL v12;
  id v13;
  SEL v14;
  id v15;
  uint64_t v16;
  SEL v17;
  id v18;
  SEL v19;
  id v20;
  _QWORD v21[4];
  id v22;
  _QWORD v23[4];
  id v24;
  id location;

  if (result)
  {
    v1 = (void *)result;
    v2 = objc_alloc(MEMORY[0x24BDD1988]);
    v3 = (void *)objc_msgSend(v2, "initWithMachServiceName:options:", kBackgroundAssetsAgentSPIMachServiceName, 0);
    objc_setProperty_atomic(v1, v4, v3, 16);

    result = (uint64_t)objc_getProperty(v1, v5, 16, 1);
    if (result)
    {
      objc_initWeak(&location, v1);
      objc_msgSend(MEMORY[0x24BDD1990], "interfaceWithProtocol:", &unk_255115730);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "setClass:forSelector:argumentIndex:ofReply:", objc_opt_class(), sel_applicationPrepareWithDescriptor_completionHandler_, 0, 0);
      objc_msgSend(v6, "setClass:forSelector:argumentIndex:ofReply:", objc_opt_class(), sel_applicationEventPerformedWithDescriptor_completionHandler_, 0, 0);
      objc_msgSend(MEMORY[0x24BDD1990], "interfaceWithProtocol:", &unk_255113E50);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setClass:forSelector:argumentIndex:ofReply:", objc_opt_class(), sel_receiveAppStoreProgressWithAppBundleIdentifier_progressInfo_, 1, 0);
      v9 = objc_getProperty(v1, v8, 16, 1);
      objc_msgSend(v9, "setRemoteObjectInterface:", v6);

      v11 = objc_getProperty(v1, v10, 16, 1);
      objc_msgSend(v11, "setExportedInterface:", v7);

      v13 = objc_getProperty(v1, v12, 16, 1);
      objc_msgSend(v13, "setExportedObject:", v1);

      v15 = objc_getProperty(v1, v14, 16, 1);
      v16 = MEMORY[0x24BDAC760];
      v23[0] = MEMORY[0x24BDAC760];
      v23[1] = 3221225472;
      v23[2] = __38__BAAgentSystemProxy__setupConnection__block_invoke;
      v23[3] = &unk_24DDBEF98;
      objc_copyWeak(&v24, &location);
      objc_msgSend(v15, "setInterruptionHandler:", v23);

      v18 = objc_getProperty(v1, v17, 16, 1);
      v21[0] = v16;
      v21[1] = 3221225472;
      v21[2] = __38__BAAgentSystemProxy__setupConnection__block_invoke_3;
      v21[3] = &unk_24DDBEF98;
      objc_copyWeak(&v22, &location);
      objc_msgSend(v18, "setInvalidationHandler:", v21);

      v20 = objc_getProperty(v1, v19, 16, 1);
      objc_msgSend(v20, "resume");

      objc_destroyWeak(&v22);
      objc_destroyWeak(&v24);

      objc_destroyWeak(&location);
      return 1;
    }
  }
  return result;
}

void __38__BAAgentSystemProxy__setupConnection__block_invoke(uint64_t a1)
{
  qos_class_t v2;
  NSObject *v3;
  _QWORD block[4];
  id v5;

  v2 = qos_class_self();
  dispatch_get_global_queue(v2, 0);
  v3 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __38__BAAgentSystemProxy__setupConnection__block_invoke_2;
  block[3] = &unk_24DDBEF98;
  objc_copyWeak(&v5, (id *)(a1 + 32));
  dispatch_async(v3, block);

  objc_destroyWeak(&v5);
}

void __38__BAAgentSystemProxy__setupConnection__block_invoke_2(uint64_t a1)
{
  os_unfair_lock_s *WeakRetained;
  os_unfair_lock_s *v2;

  WeakRetained = (os_unfair_lock_s *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v2 = WeakRetained;
    -[BAAgentSystemProxy _resendProgressConfigurationAfterInterruption](WeakRetained);
    WeakRetained = v2;
  }

}

void __38__BAAgentSystemProxy__setupConnection__block_invoke_3(uint64_t a1)
{
  os_unfair_lock_s *WeakRetained;

  WeakRetained = (os_unfair_lock_s *)objc_loadWeakRetained((id *)(a1 + 32));
  -[BAAgentSystemProxy _connectionInvalidated](WeakRetained);

}

- (void)_connectionInvalidated
{
  os_unfair_lock_s *v2;
  SEL v3;
  SEL v4;

  if (a1)
  {
    v2 = a1 + 3;
    os_unfair_lock_lock(a1 + 3);
    objc_setProperty_atomic(a1, v3, 0, 16);
    objc_setProperty_atomic(a1, v4, 0, 24);
    os_unfair_lock_unlock(v2);
  }
}

- (void)invalidate
{
  os_unfair_lock_s *p_connectionLock;
  const char *v4;
  id Property;

  p_connectionLock = &self->_connectionLock;
  os_unfair_lock_lock(&self->_connectionLock);
  if (self)
    Property = objc_getProperty(self, v4, 16, 1);
  else
    Property = 0;
  objc_msgSend(Property, "invalidate");
  os_unfair_lock_unlock(p_connectionLock);
}

- (void)_ensureConnection
{
  os_unfair_lock_s *v2;
  SEL v3;

  if (a1)
  {
    v2 = a1 + 2;
    os_unfair_lock_lock(a1 + 2);
    if (!objc_getProperty(a1, v3, 16, 1))
      -[BAAgentSystemProxy _setupConnection]((uint64_t)a1);
    os_unfair_lock_unlock(v2);
  }
}

- (void)_resendProgressConfigurationAfterInterruption
{
  os_unfair_lock_s *v2;
  SEL v3;
  const char *v4;
  os_unfair_lock_s *v5;
  SEL v6;
  void *v7;
  uint64_t v8;
  char v9;
  id v10;
  NSObject *v11;
  void *v12;
  SEL v13;
  const char *v14;
  id v15;
  uint8_t buf[4];
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  if (a1)
  {
    v2 = a1 + 3;
    os_unfair_lock_lock(a1 + 3);
    if (objc_getProperty(a1, v3, 24, 1))
    {
      v5 = (os_unfair_lock_s *)objc_getProperty(a1, v4, 24, 1);
      objc_setProperty_atomic(a1, v6, 0, 24);
      os_unfair_lock_unlock(v2);
      if (v5)
      {
        -[BAAppStoreProgressConfiguration appBundleIdentifiers](v5);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        v8 = objc_msgSend(v7, "count");

        if (v8)
        {
          v15 = 0;
          v9 = -[os_unfair_lock_s updateAppStoreProgressObservationWithConfiguration:error:](a1, "updateAppStoreProgressObservationWithConfiguration:error:", v5, &v15);
          v10 = v15;
          if ((v9 & 1) == 0)
          {
            BAClientLogObject();
            v11 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
            {
              objc_msgSend(v10, "description");
              v12 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138543362;
              v17 = v12;
              _os_log_impl(&dword_21ABD8000, v11, OS_LOG_TYPE_INFO, "Error occured updating progress observer after a connection interruption - Error: %{public}@", buf, 0xCu);

            }
            os_unfair_lock_lock(v2);
            if (!objc_getProperty(a1, v13, 24, 1))
              objc_setProperty_atomic(a1, v14, v5, 24);
            os_unfair_lock_unlock(v2);
          }

        }
      }
    }
    else
    {
      os_unfair_lock_unlock(v2);
      v5 = 0;
    }

  }
}

- (BOOL)applicationPrepareWithDescriptor:(id)a3 error:(id *)a4
{
  id v6;
  const char *v7;
  id Property;
  id v9;
  uint64_t v10;
  void *v11;
  char v12;
  _QWORD v14[6];
  _QWORD v15[5];
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  char v19;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t (*v23)(uint64_t, uint64_t);
  void (*v24)(uint64_t);
  id v25;

  v6 = a3;
  -[BAAgentSystemProxy _ensureConnection]((os_unfair_lock_s *)self);
  v20 = 0;
  v21 = &v20;
  v22 = 0x3032000000;
  v23 = __Block_byref_object_copy__1;
  v24 = __Block_byref_object_dispose__1;
  v25 = 0;
  v16 = 0;
  v17 = &v16;
  v18 = 0x2020000000;
  v19 = 0;
  if (self)
    Property = objc_getProperty(self, v7, 16, 1);
  else
    Property = 0;
  v9 = Property;
  v10 = MEMORY[0x24BDAC760];
  v15[0] = MEMORY[0x24BDAC760];
  v15[1] = 3221225472;
  v15[2] = __61__BAAgentSystemProxy_applicationPrepareWithDescriptor_error___block_invoke;
  v15[3] = &unk_24DDBF010;
  v15[4] = &v20;
  objc_msgSend(v9, "synchronousRemoteObjectProxyWithErrorHandler:", v15);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = v10;
  v14[1] = 3221225472;
  v14[2] = __61__BAAgentSystemProxy_applicationPrepareWithDescriptor_error___block_invoke_66;
  v14[3] = &unk_24DDBEF20;
  v14[4] = &v16;
  v14[5] = &v20;
  objc_msgSend(v11, "applicationPrepareWithDescriptor:completionHandler:", v6, v14);

  if (a4)
    *a4 = objc_retainAutorelease((id)v21[5]);
  v12 = *((_BYTE *)v17 + 24);
  _Block_object_dispose(&v16, 8);
  _Block_object_dispose(&v20, 8);

  return v12;
}

void __61__BAAgentSystemProxy_applicationPrepareWithDescriptor_error___block_invoke(uint64_t a1, void *a2)
{
  id v4;
  NSObject *v5;
  void *v6;
  int v7;
  const char *v8;
  __int16 v9;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  v4 = a2;
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
  BAClientLogObject();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    objc_msgSend(v4, "description");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = 136446466;
    v8 = "-[BAAgentSystemProxy applicationPrepareWithDescriptor:error:]_block_invoke";
    v9 = 2114;
    v10 = v6;
    _os_log_impl(&dword_21ABD8000, v5, OS_LOG_TYPE_INFO, "Failed to send message %{public}s - Error: %{public}@", (uint8_t *)&v7, 0x16u);

  }
}

void __61__BAAgentSystemProxy_applicationPrepareWithDescriptor_error___block_invoke_66(uint64_t a1, char a2, id obj)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = a2;
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), obj);
}

- (BOOL)applicationEventPerformedWithDescriptor:(id)a3 error:(id *)a4
{
  id v6;
  const char *v7;
  id Property;
  id v9;
  uint64_t v10;
  void *v11;
  char v12;
  _QWORD v14[6];
  _QWORD v15[5];
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  char v19;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t (*v23)(uint64_t, uint64_t);
  void (*v24)(uint64_t);
  id v25;

  v6 = a3;
  -[BAAgentSystemProxy _ensureConnection]((os_unfair_lock_s *)self);
  v20 = 0;
  v21 = &v20;
  v22 = 0x3032000000;
  v23 = __Block_byref_object_copy__1;
  v24 = __Block_byref_object_dispose__1;
  v25 = 0;
  v16 = 0;
  v17 = &v16;
  v18 = 0x2020000000;
  v19 = 0;
  if (self)
    Property = objc_getProperty(self, v7, 16, 1);
  else
    Property = 0;
  v9 = Property;
  v10 = MEMORY[0x24BDAC760];
  v15[0] = MEMORY[0x24BDAC760];
  v15[1] = 3221225472;
  v15[2] = __68__BAAgentSystemProxy_applicationEventPerformedWithDescriptor_error___block_invoke;
  v15[3] = &unk_24DDBF010;
  v15[4] = &v20;
  objc_msgSend(v9, "synchronousRemoteObjectProxyWithErrorHandler:", v15);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = v10;
  v14[1] = 3221225472;
  v14[2] = __68__BAAgentSystemProxy_applicationEventPerformedWithDescriptor_error___block_invoke_68;
  v14[3] = &unk_24DDBEF20;
  v14[4] = &v16;
  v14[5] = &v20;
  objc_msgSend(v11, "applicationEventPerformedWithDescriptor:completionHandler:", v6, v14);

  if (a4)
    *a4 = objc_retainAutorelease((id)v21[5]);
  v12 = *((_BYTE *)v17 + 24);
  _Block_object_dispose(&v16, 8);
  _Block_object_dispose(&v20, 8);

  return v12;
}

void __68__BAAgentSystemProxy_applicationEventPerformedWithDescriptor_error___block_invoke(uint64_t a1, void *a2)
{
  id v4;
  NSObject *v5;
  void *v6;
  int v7;
  const char *v8;
  __int16 v9;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  v4 = a2;
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
  BAClientLogObject();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    objc_msgSend(v4, "description");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = 136446466;
    v8 = "-[BAAgentSystemProxy applicationEventPerformedWithDescriptor:error:]_block_invoke";
    v9 = 2114;
    v10 = v6;
    _os_log_impl(&dword_21ABD8000, v5, OS_LOG_TYPE_INFO, "Failed to send message %{public}s - Error: %{public}@", (uint8_t *)&v7, 0x16u);

  }
}

void __68__BAAgentSystemProxy_applicationEventPerformedWithDescriptor_error___block_invoke_68(uint64_t a1, char a2, id obj)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = a2;
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), obj);
}

- (BOOL)applicationShouldTriggerPeriodicWithIdentifier:(id)a3 bundleURLPath:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  const char *v10;
  id Property;
  id v12;
  uint64_t v13;
  void *v14;
  char v15;
  _QWORD v17[6];
  _QWORD v18[5];
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  char v22;
  uint64_t v23;
  uint64_t *v24;
  uint64_t v25;
  uint64_t (*v26)(uint64_t, uint64_t);
  void (*v27)(uint64_t);
  id v28;

  v8 = a3;
  v9 = a4;
  -[BAAgentSystemProxy _ensureConnection]((os_unfair_lock_s *)self);
  v23 = 0;
  v24 = &v23;
  v25 = 0x3032000000;
  v26 = __Block_byref_object_copy__1;
  v27 = __Block_byref_object_dispose__1;
  v28 = 0;
  v19 = 0;
  v20 = &v19;
  v21 = 0x2020000000;
  v22 = 0;
  if (self)
    Property = objc_getProperty(self, v10, 16, 1);
  else
    Property = 0;
  v12 = Property;
  v13 = MEMORY[0x24BDAC760];
  v18[0] = MEMORY[0x24BDAC760];
  v18[1] = 3221225472;
  v18[2] = __89__BAAgentSystemProxy_applicationShouldTriggerPeriodicWithIdentifier_bundleURLPath_error___block_invoke;
  v18[3] = &unk_24DDBF010;
  v18[4] = &v23;
  objc_msgSend(v12, "synchronousRemoteObjectProxyWithErrorHandler:", v18);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = v13;
  v17[1] = 3221225472;
  v17[2] = __89__BAAgentSystemProxy_applicationShouldTriggerPeriodicWithIdentifier_bundleURLPath_error___block_invoke_69;
  v17[3] = &unk_24DDBEF20;
  v17[4] = &v19;
  v17[5] = &v23;
  objc_msgSend(v14, "applicationShouldTriggerPeriodicWithIdentifier:bundleURLPath:completionHandler:", v8, v9, v17);

  if (a5)
    *a5 = objc_retainAutorelease((id)v24[5]);
  v15 = *((_BYTE *)v20 + 24);
  _Block_object_dispose(&v19, 8);
  _Block_object_dispose(&v23, 8);

  return v15;
}

void __89__BAAgentSystemProxy_applicationShouldTriggerPeriodicWithIdentifier_bundleURLPath_error___block_invoke(uint64_t a1, void *a2)
{
  id v4;
  NSObject *v5;
  void *v6;
  int v7;
  const char *v8;
  __int16 v9;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  v4 = a2;
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
  BAClientLogObject();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    objc_msgSend(v4, "description");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = 136446466;
    v8 = "-[BAAgentSystemProxy applicationShouldTriggerPeriodicWithIdentifier:bundleURLPath:error:]_block_invoke";
    v9 = 2114;
    v10 = v6;
    _os_log_impl(&dword_21ABD8000, v5, OS_LOG_TYPE_INFO, "Failed to send message %{public}s - Error: %{public}@", (uint8_t *)&v7, 0x16u);

  }
}

void __89__BAAgentSystemProxy_applicationShouldTriggerPeriodicWithIdentifier_bundleURLPath_error___block_invoke_69(uint64_t a1, char a2, id obj)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = a2;
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), obj);
}

- (void)runDebugCommand:(id)a3
{
  id v4;
  const char *v5;
  id Property;
  id v7;

  v4 = a3;
  -[BAAgentSystemProxy _ensureConnection]((os_unfair_lock_s *)self);
  if (self)
    Property = objc_getProperty(self, v5, 16, 1);
  else
    Property = 0;
  objc_msgSend(Property, "synchronousRemoteObjectProxyWithErrorHandler:", &__block_literal_global_3);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "runDebugCommand:reply:", v4, &__block_literal_global_71);

}

void __38__BAAgentSystemProxy_runDebugCommand___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  void *v4;
  int v5;
  const char *v6;
  __int16 v7;
  void *v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  v2 = a2;
  BAClientLogObject();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    objc_msgSend(v2, "description");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = 136446466;
    v6 = "-[BAAgentSystemProxy runDebugCommand:]_block_invoke";
    v7 = 2114;
    v8 = v4;
    _os_log_impl(&dword_21ABD8000, v3, OS_LOG_TYPE_INFO, "Failed to send message %{public}s - Error: %{public}@", (uint8_t *)&v5, 0x16u);

  }
}

- (BOOL)updateAppStoreProgressObservationWithConfiguration:(id)a3 error:(id *)a4
{
  id v6;
  const char *v7;
  SEL v8;
  id Property;
  id v10;
  uint64_t v11;
  void *v12;
  char v13;
  _QWORD v15[6];
  _QWORD v16[5];
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  char v20;
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t (*v24)(uint64_t, uint64_t);
  void (*v25)(uint64_t);
  id v26;

  v6 = a3;
  -[BAAgentSystemProxy _ensureConnection]((os_unfair_lock_s *)self);
  v21 = 0;
  v22 = &v21;
  v23 = 0x3032000000;
  v24 = __Block_byref_object_copy__1;
  v25 = __Block_byref_object_dispose__1;
  v26 = 0;
  v17 = 0;
  v18 = &v17;
  v19 = 0x2020000000;
  v20 = 0;
  os_unfair_lock_lock(&self->_progressObserverLock);
  if (self)
  {
    objc_setProperty_atomic(self, v7, v6, 24);
    os_unfair_lock_unlock(&self->_progressObserverLock);
    Property = objc_getProperty(self, v8, 16, 1);
  }
  else
  {
    os_unfair_lock_unlock((os_unfair_lock_t)0xC);
    Property = 0;
  }
  v10 = Property;
  v11 = MEMORY[0x24BDAC760];
  v16[0] = MEMORY[0x24BDAC760];
  v16[1] = 3221225472;
  v16[2] = __79__BAAgentSystemProxy_updateAppStoreProgressObservationWithConfiguration_error___block_invoke;
  v16[3] = &unk_24DDBF010;
  v16[4] = &v21;
  objc_msgSend(v10, "synchronousRemoteObjectProxyWithErrorHandler:", v16);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = v11;
  v15[1] = 3221225472;
  v15[2] = __79__BAAgentSystemProxy_updateAppStoreProgressObservationWithConfiguration_error___block_invoke_72;
  v15[3] = &unk_24DDBEF20;
  v15[4] = &v17;
  v15[5] = &v21;
  objc_msgSend(v12, "updateAppStoreProgressObservationWithConfiguration:completionHandler:", v6, v15);

  if (a4)
    *a4 = objc_retainAutorelease((id)v22[5]);
  v13 = *((_BYTE *)v18 + 24);
  _Block_object_dispose(&v17, 8);
  _Block_object_dispose(&v21, 8);

  return v13;
}

void __79__BAAgentSystemProxy_updateAppStoreProgressObservationWithConfiguration_error___block_invoke(uint64_t a1, void *a2)
{
  id v4;
  NSObject *v5;
  void *v6;
  int v7;
  const char *v8;
  __int16 v9;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  v4 = a2;
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
  BAClientLogObject();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    objc_msgSend(v4, "description");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = 136446466;
    v8 = "-[BAAgentSystemProxy updateAppStoreProgressObservationWithConfiguration:error:]_block_invoke";
    v9 = 2114;
    v10 = v6;
    _os_log_impl(&dword_21ABD8000, v5, OS_LOG_TYPE_INFO, "Failed to send message %{public}s - Error: %{public}@", (uint8_t *)&v7, 0x16u);

  }
}

void __79__BAAgentSystemProxy_updateAppStoreProgressObservationWithConfiguration_error___block_invoke_72(uint64_t a1, char a2, id obj)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = a2;
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), obj);
}

- (void)receiveAppStoreProgressWithAppBundleIdentifier:(id)a3 progressInfo:(id)a4
{
  os_unfair_lock_s *p_progressObserverLock;
  id v7;
  const char *v8;
  id Property;
  id v10;
  id v11;

  p_progressObserverLock = &self->_progressObserverLock;
  v7 = a4;
  v11 = a3;
  os_unfair_lock_lock(p_progressObserverLock);
  if (self)
    Property = objc_getProperty(self, v8, 24, 1);
  else
    Property = 0;
  v10 = Property;
  os_unfair_lock_unlock(p_progressObserverLock);
  -[BAAppStoreProgressConfiguration invokeHandlerWithAppBundleIdentifier:progressInfo:]((uint64_t)v10, v11, v7);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_recentProgressConfiguration, 0);
  objc_storeStrong((id *)&self->_connection, 0);
}

@end
