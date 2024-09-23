@implementation COTimerService

+ (id)serviceWithDelegate:(id)a3
{
  id v4;
  COTimerAddOnListenerProvider *v5;
  COTimerAddOnProvider *v6;
  void *v7;

  v4 = a3;
  v5 = objc_alloc_init(COTimerAddOnListenerProvider);
  v6 = objc_alloc_init(COTimerAddOnProvider);
  v7 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithListenerProvider:addOnProvider:delegate:", v5, v6, v4);

  return v7;
}

- (COTimerService)initWithListenerProvider:(id)a3 addOnProvider:(id)a4 delegate:(id)a5
{
  COTimerService *v5;
  COSignalsClientObserverSet *v6;
  COSignalsClientObserverSet *observers;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)COTimerService;
  v5 = -[COService initWithListenerProvider:addOnProvider:delegate:](&v9, sel_initWithListenerProvider_addOnProvider_delegate_, a3, a4, a5);
  if (v5)
  {
    v6 = objc_alloc_init(COSignalsClientObserverSet);
    observers = v5->_observers;
    v5->_observers = v6;

    -[COService _serviceReady](v5, "_serviceReady");
  }
  return v5;
}

+ (BOOL)_isAllowedClient:(id)a3
{
  id v3;
  NSObject *v4;

  v3 = a3;
  COCoreLogForCategory(3);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    +[COTimerService _isAllowedClient:].cold.1((uint64_t)v3, v4);

  return 1;
}

- (void)_configureServiceInterfacesOnConnection:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)COTimerService;
  v4 = a3;
  -[COService _configureServiceInterfacesOnConnection:](&v13, sel__configureServiceInterfacesOnConnection_, v4);
  objc_msgSend(MEMORY[0x24BDD1990], "interfaceWithProtocol:", &unk_254E1DF40);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)MEMORY[0x24BDBCF20];
  v7 = objc_opt_class();
  objc_msgSend(v6, "setWithObjects:", v7, objc_opt_class(), 0, v13.receiver, v13.super_class);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setClasses:forSelector:argumentIndex:ofReply:", v8, sel_addObserverForNotificationName_asAccessory_asInstance_constraints_withCallback_, 3, 0);
  v9 = (void *)MEMORY[0x24BDBCF20];
  v10 = objc_opt_class();
  objc_msgSend(v9, "setWithObjects:", v10, objc_opt_class(), 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "setClasses:forSelector:argumentIndex:ofReply:", v11, sel_timersAsAccessory_forAccessories_callback_, 1, 0);
  objc_msgSend(v4, "setExportedInterface:", v5);
  objc_msgSend(v4, "setExportedObject:", self);
  objc_msgSend(MEMORY[0x24BDD1990], "interfaceWithProtocol:", &unk_254E2D5C8);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "setRemoteObjectInterface:", v12);
}

- (id)_newClientForConnection:(id)a3
{
  id v3;
  COTimerServiceClient *v4;

  v3 = a3;
  v4 = -[COTimerServiceClient initWithConnection:]([COTimerServiceClient alloc], "initWithConnection:", v3);

  return v4;
}

- (void)_clientLost:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  objc_super v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v19.receiver = self;
  v19.super_class = (Class)COTimerService;
  -[COService _clientLost:](&v19, sel__clientLost_, v4);
  -[COTimerService observers](self, "observers");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "connection");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "clientObserversForXPCConnection:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v17 = 0u;
  v18 = 0u;
  v15 = 0u;
  v16 = 0u;
  v8 = v7;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v15, v20, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v16;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v16 != v11)
          objc_enumerationMutation(v8);
        v13 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * i);
        objc_msgSend(v5, "removeClientObserver:forNotificationName:", v13, 0, (_QWORD)v15);
        -[COTimerService _didStopCanDispatchUpdate:](self, "_didStopCanDispatchUpdate:", v13);
        objc_msgSend(v13, "cluster");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        -[COService _releaseAssertionForCluster:](self, "_releaseAssertionForCluster:", v14);

      }
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v15, v20, 16);
    }
    while (v10);
  }

}

- (void)_addOnAdded:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  objc_super v9;
  uint8_t buf[4];
  COTimerService *v11;
  __int16 v12;
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(v4, "setDelegate:", self);
  objc_msgSend(v4, "homekit");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "currentAccessory");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE19E38]), "initWithHomeKitAccessory:", v6);
    if (v7)
    {
      COCoreLogForCategory(3);
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134218242;
        v11 = self;
        v12 = 2112;
        v13 = v6;
        _os_log_impl(&dword_215E92000, v8, OS_LOG_TYPE_DEFAULT, "%p TimerService added secondary cluster for accessory %@", buf, 0x16u);
      }

      objc_msgSend(v4, "establishSecondaryClusterForAccessory:", v7);
    }

  }
  v9.receiver = self;
  v9.super_class = (Class)COTimerService;
  -[COService _addOnAdded:](&v9, sel__addOnAdded_, v4);

}

- (void)_addOnRemoved:(id)a3
{
  id v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)COTimerService;
  v3 = a3;
  -[COService _addOnRemoved:](&v4, sel__addOnRemoved_, v3);
  objc_msgSend(v3, "setDelegate:", 0, v4.receiver, v4.super_class);

}

- (BOOL)_applicableToCluster:(id)a3
{
  void *v3;
  char v4;

  objc_msgSend(a3, "label");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqual:", *MEMORY[0x24BE19C60]);

  return v4;
}

- (void)_postNotificationName:(id)a3 connection:(id)a4 userInfo:(id)a5
{
  id v8;
  id v9;
  uint64_t v10;
  id v11;
  id v12;
  void *v13;
  id v14;
  id v15;
  _QWORD v16[5];
  id v17;
  id v18;
  _QWORD v19[5];
  id v20;

  v8 = a3;
  v9 = a4;
  v10 = MEMORY[0x24BDAC760];
  v19[0] = MEMORY[0x24BDAC760];
  v19[1] = 3221225472;
  v19[2] = __60__COTimerService__postNotificationName_connection_userInfo___block_invoke;
  v19[3] = &unk_24D4B1CB0;
  v19[4] = self;
  v11 = v9;
  v20 = v11;
  v12 = a5;
  objc_msgSend(v11, "remoteObjectProxyWithErrorHandler:", v19);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = v10;
  v16[1] = 3221225472;
  v16[2] = __60__COTimerService__postNotificationName_connection_userInfo___block_invoke_82;
  v16[3] = &unk_24D4B3170;
  v16[4] = self;
  v17 = v11;
  v18 = v8;
  v14 = v8;
  v15 = v11;
  objc_msgSend(v13, "postNotificationName:withUserInfo:callback:", v14, v12, v16);

}

void __60__COTimerService__postNotificationName_connection_userInfo___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;

  v2 = a2;
  COCoreLogForCategory(3);
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    __60__COAlarmService__postNotificationName_connection_userInfo___block_invoke_cold_1();

}

void __60__COTimerService__postNotificationName_connection_userInfo___block_invoke_82(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;

  v2 = a2;
  if (v2)
  {
    COCoreLogForCategory(3);
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
      __60__COAlarmService__postNotificationName_connection_userInfo___block_invoke_82_cold_1();

  }
}

- (void)_postNotificationName:(id)a3 forTimers:(id)a4 toAddOn:(id)a5 requiresUserInfo:(BOOL)a6
{
  id v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t i;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  void *v25;
  id v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  COTimerService *v33;
  void *v34;
  id obj;
  uint64_t v36;
  _BOOL4 v37;
  _QWORD v38[4];
  id v39;
  id v40;
  _QWORD v41[4];
  id v42;
  id v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  _BYTE v48[128];
  uint64_t v49;

  v37 = a6;
  v49 = *MEMORY[0x24BDAC8D0];
  v9 = a3;
  v10 = a4;
  v11 = a5;
  objc_msgSend(v11, "homekit");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "homehub");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = v12;
  objc_msgSend(v12, "currentAccessory");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v44 = 0u;
  v45 = 0u;
  v46 = 0u;
  v47 = 0u;
  v33 = self;
  -[COTimerService observers](self, "observers");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v34 = v9;
  objc_msgSend(v13, "clientObserversForNotificationName:", v9);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  obj = v14;
  v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v44, v48, 16);
  if (v15)
  {
    v16 = v15;
    v17 = *(_QWORD *)v45;
    v36 = *MEMORY[0x24BE67800];
    do
    {
      for (i = 0; i != v16; ++i)
      {
        if (*(_QWORD *)v45 != v17)
          objc_enumerationMutation(obj);
        v19 = *(void **)(*((_QWORD *)&v44 + 1) + 8 * i);
        objc_msgSend(v19, "connection");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "constraints");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        if (v21)
        {
          v38[0] = MEMORY[0x24BDAC760];
          v38[1] = 3221225472;
          v38[2] = __75__COTimerService__postNotificationName_forTimers_toAddOn_requiresUserInfo___block_invoke_2;
          v38[3] = &unk_24D4B1ED0;
          v39 = v11;
          v40 = v21;
          objc_msgSend(v10, "indexesOfObjectsPassingTest:", v38);
          v22 = (void *)objc_claimAutoreleasedReturnValue();

          v23 = v39;
        }
        else
        {
          objc_msgSend(v20, "co_PeerInstance");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          if (v23)
          {
            objc_msgSend(v31, "accessoryForPeerInstance:usingHomeKitAdapter:", v23, v32);
            v24 = (id)objc_claimAutoreleasedReturnValue();
          }
          else
          {
            v24 = v30;
          }
          v25 = v24;
          v41[0] = MEMORY[0x24BDAC760];
          v41[1] = 3221225472;
          v41[2] = __75__COTimerService__postNotificationName_forTimers_toAddOn_requiresUserInfo___block_invoke;
          v41[3] = &unk_24D4B1ED0;
          v42 = v11;
          v43 = v25;
          v26 = v25;
          objc_msgSend(v10, "indexesOfObjectsPassingTest:", v41);
          v22 = (void *)objc_claimAutoreleasedReturnValue();

        }
        if (objc_msgSend(v22, "count"))
        {
          v27 = (void *)MEMORY[0x24BDBCE70];
          objc_msgSend(v10, "objectsAtIndexes:", v22);
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v27, "dictionaryWithObject:forKey:", v28, v36);
          v29 = (void *)objc_claimAutoreleasedReturnValue();

        }
        else
        {
          v29 = 0;
        }
        if (!v37 || v29)
          -[COTimerService _postNotificationName:connection:userInfo:](v33, "_postNotificationName:connection:userInfo:", v34, v20, v29);

      }
      v16 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v44, v48, 16);
    }
    while (v16);
  }

}

uint64_t __75__COTimerService__postNotificationName_forTimers_toAddOn_requiresUserInfo___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "_isTimer:targetingAccessory:", a2, *(_QWORD *)(a1 + 40));
}

uint64_t __75__COTimerService__postNotificationName_forTimers_toAddOn_requiresUserInfo___block_invoke_2(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  id v4;
  void *v5;
  uint64_t v6;

  v2 = *(void **)(a1 + 32);
  v3 = *(void **)(a1 + 40);
  v4 = a2;
  objc_msgSend(v3, "allObjects");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v2, "_isTimer:targetingAccessoryIdentifiers:", v4, v5);

  return v6;
}

- (void)_postNotificationName:(id)a3 forAccessory:(id)a4 toAddOn:(id)a5
{
  id v7;
  id v8;
  COTimerService *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  int v20;
  void *v21;
  void *v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  v8 = a4;
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v9 = self;
  -[COTimerService observers](self, "observers");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = v7;
  objc_msgSend(v10, "clientObserversForNotificationName:", v7);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v24;
    do
    {
      for (i = 0; i != v13; ++i)
      {
        if (*(_QWORD *)v24 != v14)
          objc_enumerationMutation(v11);
        v16 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * i);
        objc_msgSend(v16, "accessory");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = v17;
        if (v8)
        {
          objc_msgSend(v17, "uniqueIdentifier");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          v20 = objc_msgSend(v19, "isEqual:", v8);

          if (v20)
          {
            objc_msgSend(v16, "connection");
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            -[COTimerService _postNotificationName:connection:userInfo:](v9, "_postNotificationName:connection:userInfo:", v22, v21, 0);

          }
        }

      }
      v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
    }
    while (v13);
  }

}

- (void)_postCanDispatchChanged:(BOOL)a3 forAccessory:(id)a4 toObserver:(id)a5
{
  _BOOL8 v6;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  uint64_t v21;
  _QWORD v22[2];

  v6 = a3;
  v22[1] = *MEMORY[0x24BDAC8D0];
  v8 = a4;
  v9 = a5;
  if (objc_msgSend(v9, "canDispatch") != v6)
  {
    objc_msgSend(v9, "connection");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setCanDispatch:", v6);
    v21 = *MEMORY[0x24BE19BB8];
    v19 = v8;
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v6);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = v11;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v20, &v19, 1);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v22[0] = v12;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v22, &v21, 1);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      -[COTimerService _completeDispatchabilityStallActivity:](self, "_completeDispatchabilityStallActivity:", v9);
    }
    else
    {
      objc_msgSend(v9, "dispatchabilityStallActivity");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      if (v14)
      {

      }
      else if (objc_msgSend(v9, "dispatchabilityStallCount"))
      {
        -[COService clientForConnection:](self, "clientForConnection:", v10);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = v15;
        if (v15)
        {
          objc_msgSend(v15, "clientLifetimeActivity");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v17 = 0;
        }
        +[CONetworkActivityFactory activityWithLabel:parentActivity:](CONetworkActivityFactory, "activityWithLabel:parentActivity:", 7, v17);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "setDispatchabilityStallActivity:", v18);
        nw_activity_activate();

      }
    }
    -[COTimerService _postNotificationName:connection:userInfo:](self, "_postNotificationName:connection:userInfo:", *MEMORY[0x24BE19D58], v10, v13);

  }
}

- (void)_postCanDispatchChangedAddOn:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  _QWORD v15[4];
  id v16;
  void *v17;
  id v18;
  id location;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[COTimerService observers](self, "observers");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = *MEMORY[0x24BE19D58];
  objc_msgSend(v5, "clientObserversForNotificationName:");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v22 = 0u;
  v23 = 0u;
  v20 = 0u;
  v21 = 0u;
  v7 = v6;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
  if (v8)
  {
    v9 = *(_QWORD *)v21;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v21 != v9)
          objc_enumerationMutation(v7);
        v11 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * i);
        objc_msgSend(v11, "accessory");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        if (v12)
        {
          objc_initWeak(&location, self);
          v15[0] = MEMORY[0x24BDAC760];
          v15[1] = 3221225472;
          v15[2] = __47__COTimerService__postCanDispatchChangedAddOn___block_invoke;
          v15[3] = &unk_24D4B31C0;
          objc_copyWeak(&v18, &location);
          v16 = v12;
          v17 = v11;
          objc_msgSend(v4, "canDispatchAsAccessory:asInstance:reply:", v16, 0, v15);

          objc_destroyWeak(&v18);
          objc_destroyWeak(&location);
        }
        else
        {
          objc_msgSend(v11, "connection");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          -[COTimerService _postNotificationName:connection:userInfo:](self, "_postNotificationName:connection:userInfo:", v14, v13, 0);

        }
      }
      v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    }
    while (v8);
  }

}

void __47__COTimerService__postCanDispatchChangedAddOn___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v4;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    objc_msgSend(*(id *)(a1 + 32), "uniqueIdentifier");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(WeakRetained, "_postCanDispatchChanged:forAccessory:toObserver:", a2, v4, *(_QWORD *)(a1 + 40));

  }
}

- (void)_completeDispatchabilityStallActivity:(id)a3
{
  void *v3;
  id v4;

  v4 = a3;
  objc_msgSend(v4, "dispatchabilityStallActivity");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    nw_activity_complete_with_reason();
    objc_msgSend(v4, "setDispatchabilityStallCount:", objc_msgSend(v4, "dispatchabilityStallCount") + 1);
    objc_msgSend(v4, "setDispatchabilityStallActivity:", 0);
  }

}

- (void)_didStopCanDispatchUpdate:(id)a3
{
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  id v8;

  v8 = a3;
  objc_msgSend(v8, "connection");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[COService clientForConnection:](self, "clientForConnection:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  -[COTimerService _completeDispatchabilityStallActivity:](self, "_completeDispatchabilityStallActivity:", v8);
  v6 = objc_msgSend(v8, "dispatchabilityStallCount");
  if (v6)
  {
    if (v6 == 1)
    {
      if (objc_msgSend(v8, "canDispatch"))
        v7 = 2;
      else
        v7 = 3;
    }
    else
    {
      v7 = 3;
    }
    objc_msgSend(v5, "donateClientLifetimeActivityCompletionReason:", v7);
  }

}

- (void)timersAsAccessory:(id)a3 asInstance:(id)a4 withCallback:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  _QWORD v20[4];
  id v21;
  id v22;
  id v23;
  _QWORD v24[5];
  id v25;
  id v26;

  v8 = a3;
  v9 = a5;
  v10 = a4;
  -[COService currentClient](self, "currentClient");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "connection");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "co_SetPeerInstance:", v10);

  _ClusterForAccessory(v8);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[COService _takeAssertionForCluster:](self, "_takeAssertionForCluster:", v13);
  v14 = MEMORY[0x24BDAC760];
  v24[0] = MEMORY[0x24BDAC760];
  v24[1] = 3221225472;
  v24[2] = __60__COTimerService_timersAsAccessory_asInstance_withCallback___block_invoke;
  v24[3] = &unk_24D4B31E8;
  v25 = v13;
  v26 = v9;
  v24[4] = self;
  v15 = v13;
  v16 = v9;
  v20[0] = v14;
  v20[1] = 3221225472;
  v20[2] = __60__COTimerService_timersAsAccessory_asInstance_withCallback___block_invoke_3;
  v20[3] = &unk_24D4B3210;
  v21 = v8;
  v22 = v11;
  v23 = (id)MEMORY[0x2199F3D40](v24);
  v17 = v23;
  v18 = v11;
  v19 = v8;
  -[COService _addOnForCluster:completion:](self, "_addOnForCluster:completion:", v15, v20);

}

void __60__COTimerService_timersAsAccessory_asInstance_withCallback___block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  _QWORD v4[5];
  id v5;

  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  objc_msgSend(*(id *)(a1 + 32), "dispatchQueue");
  v2 = objc_claimAutoreleasedReturnValue();
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __60__COTimerService_timersAsAccessory_asInstance_withCallback___block_invoke_2;
  v4[3] = &unk_24D4B0858;
  v3 = *(void **)(a1 + 40);
  v4[4] = *(_QWORD *)(a1 + 32);
  v5 = v3;
  dispatch_async(v2, v4);

}

uint64_t __60__COTimerService_timersAsAccessory_asInstance_withCallback___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_releaseAssertionForCluster:", *(_QWORD *)(a1 + 40));
}

void __60__COTimerService_timersAsAccessory_asInstance_withCallback___block_invoke_3(_QWORD *a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;
  id v6;

  v3 = a2;
  v6 = v3;
  if (v3)
  {
    objc_msgSend(v3, "establishSecondaryClusterForAccessory:", a1[4]);
    objc_msgSend(v6, "timersAsAccessory:fromClient:withCallback:", a1[4], a1[5], a1[6]);
  }
  else
  {
    v4 = a1[6];
    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", *MEMORY[0x24BDD1128], 45, 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, _QWORD, void *))(v4 + 16))(v4, 0, v5);

  }
}

- (void)timersAsAccessory:(id)a3 forAccessories:(id)a4 callback:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  uint64_t v13;
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  _QWORD v20[4];
  id v21;
  id v22;
  id v23;
  id v24;
  _QWORD v25[5];
  id v26;
  id v27;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  -[COService currentClient](self, "currentClient");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  _ClusterForAccessory(v8);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[COService _takeAssertionForCluster:](self, "_takeAssertionForCluster:", v12);
  v13 = MEMORY[0x24BDAC760];
  v25[0] = MEMORY[0x24BDAC760];
  v25[1] = 3221225472;
  v25[2] = __60__COTimerService_timersAsAccessory_forAccessories_callback___block_invoke;
  v25[3] = &unk_24D4B3238;
  v26 = v12;
  v27 = v10;
  v25[4] = self;
  v14 = v12;
  v15 = v10;
  v20[0] = v13;
  v20[1] = 3221225472;
  v20[2] = __60__COTimerService_timersAsAccessory_forAccessories_callback___block_invoke_3;
  v20[3] = &unk_24D4B3260;
  v21 = v8;
  v22 = v9;
  v23 = v11;
  v24 = (id)MEMORY[0x2199F3D40](v25);
  v16 = v24;
  v17 = v11;
  v18 = v9;
  v19 = v8;
  -[COService _addOnForCluster:completion:](self, "_addOnForCluster:completion:", v14, v20);

}

void __60__COTimerService_timersAsAccessory_forAccessories_callback___block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  _QWORD v4[5];
  id v5;

  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  objc_msgSend(*(id *)(a1 + 32), "dispatchQueue");
  v2 = objc_claimAutoreleasedReturnValue();
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __60__COTimerService_timersAsAccessory_forAccessories_callback___block_invoke_2;
  v4[3] = &unk_24D4B0858;
  v3 = *(void **)(a1 + 40);
  v4[4] = *(_QWORD *)(a1 + 32);
  v5 = v3;
  dispatch_async(v2, v4);

}

uint64_t __60__COTimerService_timersAsAccessory_forAccessories_callback___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_releaseAssertionForCluster:", *(_QWORD *)(a1 + 40));
}

void __60__COTimerService_timersAsAccessory_forAccessories_callback___block_invoke_3(_QWORD *a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;
  id v6;

  v3 = a2;
  v6 = v3;
  if (v3)
  {
    objc_msgSend(v3, "establishSecondaryClusterForAccessory:", a1[4]);
    objc_msgSend(v6, "timersForAccessories:fromClient:callback:", a1[5], a1[6], a1[7]);
  }
  else
  {
    v4 = a1[7];
    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", *MEMORY[0x24BDD1128], 45, 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, _QWORD, void *))(v4 + 16))(v4, 0, v5);

  }
}

- (void)addTimer:(id)a3 asAccessory:(id)a4 asInstance:(id)a5 withCallback:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  _QWORD v24[4];
  id v25;
  id v26;
  id v27;
  id v28;
  _QWORD v29[5];
  id v30;
  id v31;

  v10 = a3;
  v11 = a4;
  v12 = a6;
  v13 = a5;
  -[COService currentClient](self, "currentClient");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "connection");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "co_SetPeerInstance:", v13);

  _ClusterForAccessory(v11);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[COService _takeAssertionForCluster:](self, "_takeAssertionForCluster:", v16);
  v17 = MEMORY[0x24BDAC760];
  v29[0] = MEMORY[0x24BDAC760];
  v29[1] = 3221225472;
  v29[2] = __63__COTimerService_addTimer_asAccessory_asInstance_withCallback___block_invoke;
  v29[3] = &unk_24D4B3288;
  v30 = v16;
  v31 = v12;
  v29[4] = self;
  v18 = v16;
  v19 = v12;
  v24[0] = v17;
  v24[1] = 3221225472;
  v24[2] = __63__COTimerService_addTimer_asAccessory_asInstance_withCallback___block_invoke_3;
  v24[3] = &unk_24D4B3260;
  v25 = v11;
  v26 = v10;
  v27 = v14;
  v28 = (id)MEMORY[0x2199F3D40](v29);
  v20 = v28;
  v21 = v14;
  v22 = v10;
  v23 = v11;
  -[COService _addOnForCluster:completion:](self, "_addOnForCluster:completion:", v18, v24);

}

void __63__COTimerService_addTimer_asAccessory_asInstance_withCallback___block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  _QWORD v4[5];
  id v5;

  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  objc_msgSend(*(id *)(a1 + 32), "dispatchQueue");
  v2 = objc_claimAutoreleasedReturnValue();
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __63__COTimerService_addTimer_asAccessory_asInstance_withCallback___block_invoke_2;
  v4[3] = &unk_24D4B0858;
  v3 = *(void **)(a1 + 40);
  v4[4] = *(_QWORD *)(a1 + 32);
  v5 = v3;
  dispatch_async(v2, v4);

}

uint64_t __63__COTimerService_addTimer_asAccessory_asInstance_withCallback___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_releaseAssertionForCluster:", *(_QWORD *)(a1 + 40));
}

void __63__COTimerService_addTimer_asAccessory_asInstance_withCallback___block_invoke_3(_QWORD *a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;
  id v6;

  v3 = a2;
  v6 = v3;
  if (v3)
  {
    objc_msgSend(v3, "establishSecondaryClusterForAccessory:", a1[4]);
    objc_msgSend(v6, "addTimer:asAccessory:fromClient:withCallback:", a1[5], a1[4], a1[6], a1[7]);
  }
  else
  {
    v4 = a1[7];
    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", *MEMORY[0x24BDD1128], 45, 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *))(v4 + 16))(v4, v5);

  }
}

- (void)updateTimer:(id)a3 asAccessory:(id)a4 withCallback:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  uint64_t v13;
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  _QWORD v20[4];
  id v21;
  id v22;
  id v23;
  id v24;
  _QWORD v25[5];
  id v26;
  id v27;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  -[COService currentClient](self, "currentClient");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  _ClusterForAccessory(v9);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[COService _takeAssertionForCluster:](self, "_takeAssertionForCluster:", v12);
  v13 = MEMORY[0x24BDAC760];
  v25[0] = MEMORY[0x24BDAC760];
  v25[1] = 3221225472;
  v25[2] = __55__COTimerService_updateTimer_asAccessory_withCallback___block_invoke;
  v25[3] = &unk_24D4B3288;
  v26 = v12;
  v27 = v10;
  v25[4] = self;
  v14 = v12;
  v15 = v10;
  v20[0] = v13;
  v20[1] = 3221225472;
  v20[2] = __55__COTimerService_updateTimer_asAccessory_withCallback___block_invoke_3;
  v20[3] = &unk_24D4B3260;
  v21 = v9;
  v22 = v8;
  v23 = v11;
  v24 = (id)MEMORY[0x2199F3D40](v25);
  v16 = v24;
  v17 = v11;
  v18 = v8;
  v19 = v9;
  -[COService _addOnForCluster:completion:](self, "_addOnForCluster:completion:", v14, v20);

}

void __55__COTimerService_updateTimer_asAccessory_withCallback___block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  _QWORD v4[5];
  id v5;

  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  objc_msgSend(*(id *)(a1 + 32), "dispatchQueue");
  v2 = objc_claimAutoreleasedReturnValue();
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __55__COTimerService_updateTimer_asAccessory_withCallback___block_invoke_2;
  v4[3] = &unk_24D4B0858;
  v3 = *(void **)(a1 + 40);
  v4[4] = *(_QWORD *)(a1 + 32);
  v5 = v3;
  dispatch_async(v2, v4);

}

uint64_t __55__COTimerService_updateTimer_asAccessory_withCallback___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_releaseAssertionForCluster:", *(_QWORD *)(a1 + 40));
}

void __55__COTimerService_updateTimer_asAccessory_withCallback___block_invoke_3(_QWORD *a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;
  id v6;

  v3 = a2;
  v6 = v3;
  if (v3)
  {
    objc_msgSend(v3, "establishSecondaryClusterForAccessory:", a1[4]);
    objc_msgSend(v6, "updateTimer:asAccessory:fromClient:withCallback:", a1[5], a1[4], a1[6], a1[7]);
  }
  else
  {
    v4 = a1[7];
    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", *MEMORY[0x24BDD1128], 45, 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *))(v4 + 16))(v4, v5);

  }
}

- (void)removeTimer:(id)a3 asAccessory:(id)a4 withCallback:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  uint64_t v13;
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  _QWORD v20[4];
  id v21;
  id v22;
  id v23;
  id v24;
  _QWORD v25[5];
  id v26;
  id v27;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  -[COService currentClient](self, "currentClient");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  _ClusterForAccessory(v9);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[COService _takeAssertionForCluster:](self, "_takeAssertionForCluster:", v12);
  v13 = MEMORY[0x24BDAC760];
  v25[0] = MEMORY[0x24BDAC760];
  v25[1] = 3221225472;
  v25[2] = __55__COTimerService_removeTimer_asAccessory_withCallback___block_invoke;
  v25[3] = &unk_24D4B3288;
  v26 = v12;
  v27 = v10;
  v25[4] = self;
  v14 = v12;
  v15 = v10;
  v20[0] = v13;
  v20[1] = 3221225472;
  v20[2] = __55__COTimerService_removeTimer_asAccessory_withCallback___block_invoke_3;
  v20[3] = &unk_24D4B3260;
  v21 = v9;
  v22 = v8;
  v23 = v11;
  v24 = (id)MEMORY[0x2199F3D40](v25);
  v16 = v24;
  v17 = v11;
  v18 = v8;
  v19 = v9;
  -[COService _addOnForCluster:completion:](self, "_addOnForCluster:completion:", v14, v20);

}

void __55__COTimerService_removeTimer_asAccessory_withCallback___block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  _QWORD v4[5];
  id v5;

  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  objc_msgSend(*(id *)(a1 + 32), "dispatchQueue");
  v2 = objc_claimAutoreleasedReturnValue();
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __55__COTimerService_removeTimer_asAccessory_withCallback___block_invoke_2;
  v4[3] = &unk_24D4B0858;
  v3 = *(void **)(a1 + 40);
  v4[4] = *(_QWORD *)(a1 + 32);
  v5 = v3;
  dispatch_async(v2, v4);

}

uint64_t __55__COTimerService_removeTimer_asAccessory_withCallback___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_releaseAssertionForCluster:", *(_QWORD *)(a1 + 40));
}

void __55__COTimerService_removeTimer_asAccessory_withCallback___block_invoke_3(_QWORD *a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;
  id v6;

  v3 = a2;
  v6 = v3;
  if (v3)
  {
    objc_msgSend(v3, "establishSecondaryClusterForAccessory:", a1[4]);
    objc_msgSend(v6, "removeTimer:asAccessory:fromClient:withCallback:", a1[5], a1[4], a1[6], a1[7]);
  }
  else
  {
    v4 = a1[7];
    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", *MEMORY[0x24BDD1128], 45, 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *))(v4 + 16))(v4, v5);

  }
}

- (void)dismissTimerWithIdentifier:(id)a3 asAccessory:(id)a4 withCallback:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  uint64_t v13;
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  _QWORD v20[4];
  id v21;
  id v22;
  id v23;
  id v24;
  _QWORD v25[5];
  id v26;
  id v27;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  -[COService currentClient](self, "currentClient");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  _ClusterForAccessory(v9);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[COService _takeAssertionForCluster:](self, "_takeAssertionForCluster:", v12);
  v13 = MEMORY[0x24BDAC760];
  v25[0] = MEMORY[0x24BDAC760];
  v25[1] = 3221225472;
  v25[2] = __70__COTimerService_dismissTimerWithIdentifier_asAccessory_withCallback___block_invoke;
  v25[3] = &unk_24D4B3288;
  v26 = v12;
  v27 = v10;
  v25[4] = self;
  v14 = v12;
  v15 = v10;
  v20[0] = v13;
  v20[1] = 3221225472;
  v20[2] = __70__COTimerService_dismissTimerWithIdentifier_asAccessory_withCallback___block_invoke_3;
  v20[3] = &unk_24D4B3260;
  v21 = v9;
  v22 = v8;
  v23 = v11;
  v24 = (id)MEMORY[0x2199F3D40](v25);
  v16 = v24;
  v17 = v11;
  v18 = v8;
  v19 = v9;
  -[COService _addOnForCluster:completion:](self, "_addOnForCluster:completion:", v14, v20);

}

void __70__COTimerService_dismissTimerWithIdentifier_asAccessory_withCallback___block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  _QWORD v4[5];
  id v5;

  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  objc_msgSend(*(id *)(a1 + 32), "dispatchQueue");
  v2 = objc_claimAutoreleasedReturnValue();
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __70__COTimerService_dismissTimerWithIdentifier_asAccessory_withCallback___block_invoke_2;
  v4[3] = &unk_24D4B0858;
  v3 = *(void **)(a1 + 40);
  v4[4] = *(_QWORD *)(a1 + 32);
  v5 = v3;
  dispatch_async(v2, v4);

}

uint64_t __70__COTimerService_dismissTimerWithIdentifier_asAccessory_withCallback___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_releaseAssertionForCluster:", *(_QWORD *)(a1 + 40));
}

void __70__COTimerService_dismissTimerWithIdentifier_asAccessory_withCallback___block_invoke_3(_QWORD *a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;
  id v6;

  v3 = a2;
  v6 = v3;
  if (v3)
  {
    objc_msgSend(v3, "establishSecondaryClusterForAccessory:", a1[4]);
    objc_msgSend(v6, "dismissTimerWithIdentifier:fromClient:withCallback:", a1[5], a1[6], a1[7]);
  }
  else
  {
    v4 = a1[7];
    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", *MEMORY[0x24BDD1128], 45, 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *))(v4 + 16))(v4, v5);

  }
}

- (void)addObserverForNotificationName:(id)a3 asAccessory:(id)a4 asInstance:(id)a5 constraints:(id)a6 withCallback:(id)a7
{
  id v12;
  id v13;
  id v14;
  void (**v15)(id, _QWORD);
  id v16;
  void *v17;
  void *v18;
  void *v19;
  NSObject *v20;
  void *v21;
  NSObject *v22;
  COSignalsClientObserver *v23;
  COSignalsClientObserver *v24;
  void *v25;
  void *v26;
  void *v27;
  id v28;
  void *v29;
  void (**v30)(id, _QWORD);
  void *v31;
  id v32;
  void *v33;
  id v34;
  void *v35;
  COTimerService *v36;
  void *v37;
  void *v38;
  _QWORD v39[4];
  id v40;
  id v41;
  uint8_t buf[4];
  void *v43;
  __int16 v44;
  id v45;
  uint64_t v46;

  v46 = *MEMORY[0x24BDAC8D0];
  v12 = a3;
  v13 = a4;
  v14 = a6;
  v15 = (void (**)(id, _QWORD))a7;
  v16 = a5;
  -[COService currentClient](self, "currentClient");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "connection");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "co_SetPeerInstance:", v16);

  _ClusterForAccessory(v13);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[COService _takeAssertionForCluster:](self, "_takeAssertionForCluster:", v19);
  COCoreLogForCategory(3);
  v20 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134218242;
    v43 = v17;
    v44 = 2112;
    v45 = v12;
    _os_log_impl(&dword_215E92000, v20, OS_LOG_TYPE_DEFAULT, "%p serving request to observe %@", buf, 0x16u);
  }

  -[COTimerService observers](self, "observers");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v36 = self;
  if (v14)
  {
    COCoreLogForCategory(3);
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
      -[COAlarmService addObserverForNotificationName:asAccessory:asInstance:constraints:withCallback:].cold.1((uint64_t)v17, (uint64_t)v14, v22);

    v23 = -[COSignalsClientObserver initWithConnection:asAccessory:constraints:cluster:]([COSignalsClientObserver alloc], "initWithConnection:asAccessory:constraints:cluster:", v18, v13, v14, v19);
  }
  else
  {
    v23 = -[COSignalsClientObserver initWithConnection:cluster:]([COSignalsClientObserver alloc], "initWithConnection:cluster:", v18, v19);
  }
  v24 = v23;
  if (objc_msgSend(v12, "isEqualToString:", *MEMORY[0x24BE19D58]))
  {
    -[COSignalsClientObserver dispatchabilityStallActivity](v24, "dispatchabilityStallActivity");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v25)
    {
      if (-[COSignalsClientObserver canDispatch](v24, "canDispatch"))
        goto LABEL_13;
      objc_msgSend(v17, "clientLifetimeActivity");
      v37 = v21;
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      +[CONetworkActivityFactory activityWithLabel:parentActivity:](CONetworkActivityFactory, "activityWithLabel:parentActivity:", 7, v26);
      v25 = (void *)objc_claimAutoreleasedReturnValue();

      v21 = v37;
      -[COSignalsClientObserver setDispatchabilityStallActivity:](v24, "setDispatchabilityStallActivity:", v25);
      nw_activity_activate();
    }

  }
LABEL_13:
  if (objc_msgSend(v14, "count"))
  {
    v38 = v21;
    objc_msgSend(v21, "constraints");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = (id)objc_msgSend(v14, "mutableCopy");
    objc_msgSend(v28, "minusSet:", v27);
    if (objc_msgSend(v28, "count"))
    {
      v35 = v19;
      v29 = v18;
      v30 = v15;
      v31 = v17;
      v32 = v12;
      v33 = (void *)objc_msgSend(v27, "mutableCopy");

      objc_msgSend(v33, "unionSet:", v14);
      v39[0] = MEMORY[0x24BDAC760];
      v39[1] = 3221225472;
      v39[2] = __97__COTimerService_addObserverForNotificationName_asAccessory_asInstance_constraints_withCallback___block_invoke;
      v39[3] = &unk_24D4B32D0;
      v40 = v13;
      v34 = v33;
      v12 = v32;
      v17 = v31;
      v15 = v30;
      v18 = v29;
      v28 = v34;
      v41 = v34;
      v19 = v35;
      -[COService _addOnForCluster:completion:](v36, "_addOnForCluster:completion:", v35, v39);

    }
    v21 = v38;
  }
  objc_msgSend(v21, "addClientObserver:forNotificationName:", v24, v12);
  v15[2](v15, 0);

}

void __97__COTimerService_addObserverForNotificationName_asAccessory_asInstance_constraints_withCallback___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  id v4;

  if (a2)
  {
    v3 = *(_QWORD *)(a1 + 32);
    v4 = a2;
    objc_msgSend(v4, "establishSecondaryClusterForAccessory:", v3);
    objc_msgSend(v4, "setInterests:asAccessory:withCallback:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32), &__block_literal_global_9);

  }
}

- (void)removeObserverForNotificationName:(id)a3 asAccessory:(id)a4 withCallback:(id)a5
{
  id v8;
  void (**v9)(id, _QWORD);
  void *v10;
  uint64_t v11;
  NSObject *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t i;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  id v25;
  void *v26;
  id v27;
  void *v28;
  void *v29;
  id v30;
  void *v31;
  _QWORD v32[4];
  id v33;
  id v34;
  id v35;
  _QWORD v36[5];
  id v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  uint8_t v42[128];
  uint8_t buf[4];
  void *v44;
  __int16 v45;
  id v46;
  uint64_t v47;

  v47 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v30 = a4;
  v9 = (void (**)(id, _QWORD))a5;
  -[COService currentClient](self, "currentClient");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "connection");
  v11 = objc_claimAutoreleasedReturnValue();
  COCoreLogForCategory(3);
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134218242;
    v44 = v10;
    v45 = 2112;
    v46 = v8;
    _os_log_impl(&dword_215E92000, v12, OS_LOG_TYPE_DEFAULT, "%p serving request to stop observing %@", buf, 0x16u);
  }
  v29 = v10;

  -[COTimerService observers](self, "observers");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "constraints");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = (void *)v11;
  objc_msgSend(v13, "clientObserversForXPCConnection:", v11);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v38 = 0u;
  v39 = 0u;
  v40 = 0u;
  v41 = 0u;
  v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v38, v42, 16);
  if (v15)
  {
    v16 = v15;
    v17 = *(_QWORD *)v39;
    v18 = *MEMORY[0x24BE19D58];
    do
    {
      for (i = 0; i != v16; ++i)
      {
        if (*(_QWORD *)v39 != v17)
          objc_enumerationMutation(v14);
        v20 = *(_QWORD *)(*((_QWORD *)&v38 + 1) + 8 * i);
        objc_msgSend(v13, "removeClientObserver:forNotificationName:", v20, v8);
        if (objc_msgSend(v8, "isEqualToString:", v18))
          -[COTimerService _didStopCanDispatchUpdate:](self, "_didStopCanDispatchUpdate:", v20);
      }
      v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v38, v42, 16);
    }
    while (v16);
  }
  v21 = v30;
  _ClusterForAccessory(v30);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "constraints");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v23, "isEqual:", v31) & 1) == 0)
  {
    -[COService _takeAssertionForCluster:](self, "_takeAssertionForCluster:", v22);
    v24 = MEMORY[0x24BDAC760];
    v36[0] = MEMORY[0x24BDAC760];
    v36[1] = 3221225472;
    v36[2] = __77__COTimerService_removeObserverForNotificationName_asAccessory_withCallback___block_invoke;
    v36[3] = &unk_24D4B0858;
    v36[4] = self;
    v25 = v22;
    v37 = v25;
    v26 = (void *)MEMORY[0x2199F3D40](v36);
    v32[0] = v24;
    v21 = v30;
    v32[1] = 3221225472;
    v32[2] = __77__COTimerService_removeObserverForNotificationName_asAccessory_withCallback___block_invoke_3;
    v32[3] = &unk_24D4B3210;
    v33 = v30;
    v34 = v23;
    v35 = v26;
    v27 = v26;
    -[COService _addOnForCluster:completion:](self, "_addOnForCluster:completion:", v25, v32);

  }
  v9[2](v9, 0);
  -[COService _releaseAssertionForCluster:](self, "_releaseAssertionForCluster:", v22);

}

void __77__COTimerService_removeObserverForNotificationName_asAccessory_withCallback___block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  _QWORD v4[5];
  id v5;

  objc_msgSend(*(id *)(a1 + 32), "dispatchQueue");
  v2 = objc_claimAutoreleasedReturnValue();
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __77__COTimerService_removeObserverForNotificationName_asAccessory_withCallback___block_invoke_2;
  v4[3] = &unk_24D4B0858;
  v3 = *(void **)(a1 + 40);
  v4[4] = *(_QWORD *)(a1 + 32);
  v5 = v3;
  dispatch_async(v2, v4);

}

uint64_t __77__COTimerService_removeObserverForNotificationName_asAccessory_withCallback___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_releaseAssertionForCluster:", *(_QWORD *)(a1 + 40));
}

void __77__COTimerService_removeObserverForNotificationName_asAccessory_withCallback___block_invoke_3(_QWORD *a1, void *a2)
{
  uint64_t v3;
  id v4;

  if (a2)
  {
    v3 = a1[4];
    v4 = a2;
    objc_msgSend(v4, "establishSecondaryClusterForAccessory:", v3);
    objc_msgSend(v4, "setInterests:asAccessory:withCallback:", a1[5], a1[4], a1[6]);

  }
}

- (void)canDispatchAsAccessory:(id)a3 asInstance:(id)a4 reply:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  uint64_t v12;
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  _QWORD v18[4];
  id v19;
  id v20;
  id v21;
  _QWORD v22[5];
  id v23;
  id v24;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  _ClusterForAccessory(v8);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[COService _takeAssertionForCluster:](self, "_takeAssertionForCluster:", v11);
  v12 = MEMORY[0x24BDAC760];
  v22[0] = MEMORY[0x24BDAC760];
  v22[1] = 3221225472;
  v22[2] = __58__COTimerService_canDispatchAsAccessory_asInstance_reply___block_invoke;
  v22[3] = &unk_24D4B32F8;
  v23 = v11;
  v24 = v10;
  v22[4] = self;
  v13 = v11;
  v14 = v10;
  v18[0] = v12;
  v18[1] = 3221225472;
  v18[2] = __58__COTimerService_canDispatchAsAccessory_asInstance_reply___block_invoke_3;
  v18[3] = &unk_24D4B3210;
  v19 = v8;
  v20 = v9;
  v21 = (id)MEMORY[0x2199F3D40](v22);
  v15 = v21;
  v16 = v9;
  v17 = v8;
  -[COService _addOnForCluster:completion:](self, "_addOnForCluster:completion:", v13, v18);

}

void __58__COTimerService_canDispatchAsAccessory_asInstance_reply___block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  _QWORD v4[5];
  id v5;

  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  objc_msgSend(*(id *)(a1 + 32), "dispatchQueue");
  v2 = objc_claimAutoreleasedReturnValue();
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __58__COTimerService_canDispatchAsAccessory_asInstance_reply___block_invoke_2;
  v4[3] = &unk_24D4B0858;
  v3 = *(void **)(a1 + 40);
  v4[4] = *(_QWORD *)(a1 + 32);
  v5 = v3;
  dispatch_async(v2, v4);

}

uint64_t __58__COTimerService_canDispatchAsAccessory_asInstance_reply___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_releaseAssertionForCluster:", *(_QWORD *)(a1 + 40));
}

void __58__COTimerService_canDispatchAsAccessory_asInstance_reply___block_invoke_3(_QWORD *a1, void *a2)
{
  id v3;
  id v4;

  v3 = a2;
  v4 = v3;
  if (v3)
  {
    objc_msgSend(v3, "establishSecondaryClusterForAccessory:", a1[4]);
    objc_msgSend(v4, "canDispatchAsAccessory:asInstance:reply:", a1[4], a1[5], a1[6]);
  }
  else
  {
    (*(void (**)(void))(a1[6] + 16))();
  }

}

- (void)timerAddOn:(id)a3 didAddTimers:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  -[COService dispatchQueue](self, "dispatchQueue");
  v8 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __42__COTimerService_timerAddOn_didAddTimers___block_invoke;
  block[3] = &unk_24D4B08D0;
  block[4] = self;
  v12 = v7;
  v13 = v6;
  v9 = v6;
  v10 = v7;
  dispatch_async(v8, block);

}

uint64_t __42__COTimerService_timerAddOn_didAddTimers___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_postNotificationName:forTimers:toAddOn:requiresUserInfo:", *MEMORY[0x24BE19DA0], *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), 0);
}

- (void)timerAddOn:(id)a3 didRemoveTimers:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  -[COService dispatchQueue](self, "dispatchQueue");
  v8 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __45__COTimerService_timerAddOn_didRemoveTimers___block_invoke;
  block[3] = &unk_24D4B08D0;
  block[4] = self;
  v12 = v7;
  v13 = v6;
  v9 = v6;
  v10 = v7;
  dispatch_async(v8, block);

}

uint64_t __45__COTimerService_timerAddOn_didRemoveTimers___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_postNotificationName:forTimers:toAddOn:requiresUserInfo:", *MEMORY[0x24BE19DB8], *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), 0);
}

- (void)timerAddOn:(id)a3 didUpdateTimers:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  -[COService dispatchQueue](self, "dispatchQueue");
  v8 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __45__COTimerService_timerAddOn_didUpdateTimers___block_invoke;
  block[3] = &unk_24D4B08D0;
  block[4] = self;
  v12 = v7;
  v13 = v6;
  v9 = v6;
  v10 = v7;
  dispatch_async(v8, block);

}

uint64_t __45__COTimerService_timerAddOn_didUpdateTimers___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_postNotificationName:forTimers:toAddOn:requiresUserInfo:", *MEMORY[0x24BE19DC8], *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), 0);
}

- (void)timerAddOn:(id)a3 didChangeTimers:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  -[COService dispatchQueue](self, "dispatchQueue");
  v8 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __45__COTimerService_timerAddOn_didChangeTimers___block_invoke;
  block[3] = &unk_24D4B08D0;
  block[4] = self;
  v12 = v7;
  v13 = v6;
  v9 = v6;
  v10 = v7;
  dispatch_async(v8, block);

}

uint64_t __45__COTimerService_timerAddOn_didChangeTimers___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_postNotificationName:forTimers:toAddOn:requiresUserInfo:", *MEMORY[0x24BE19DB0], *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), 0);
}

- (void)timerAddOn:(id)a3 didFireTimers:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  -[COService dispatchQueue](self, "dispatchQueue");
  v8 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __43__COTimerService_timerAddOn_didFireTimers___block_invoke;
  block[3] = &unk_24D4B08D0;
  block[4] = self;
  v12 = v7;
  v13 = v6;
  v9 = v6;
  v10 = v7;
  dispatch_async(v8, block);

}

uint64_t __43__COTimerService_timerAddOn_didFireTimers___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_postNotificationName:forTimers:toAddOn:requiresUserInfo:", *MEMORY[0x24BE19D98], *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), 1);
}

- (void)timerAddOn:(id)a3 didDismissTimers:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  -[COService dispatchQueue](self, "dispatchQueue");
  v8 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __46__COTimerService_timerAddOn_didDismissTimers___block_invoke;
  block[3] = &unk_24D4B08D0;
  block[4] = self;
  v12 = v7;
  v13 = v6;
  v9 = v6;
  v10 = v7;
  dispatch_async(v8, block);

}

uint64_t __46__COTimerService_timerAddOn_didDismissTimers___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_postNotificationName:forTimers:toAddOn:requiresUserInfo:", *MEMORY[0x24BE19D70], *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), 1);
}

- (void)timerAddOn:(id)a3 resetAccesory:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  -[COService dispatchQueue](self, "dispatchQueue");
  v8 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __43__COTimerService_timerAddOn_resetAccesory___block_invoke;
  block[3] = &unk_24D4B08D0;
  block[4] = self;
  v12 = v7;
  v13 = v6;
  v9 = v6;
  v10 = v7;
  dispatch_async(v8, block);

}

uint64_t __43__COTimerService_timerAddOn_resetAccesory___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_postNotificationName:forAccessory:toAddOn:", *MEMORY[0x24BE19C38], *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

- (void)didResetTimerAddOn:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  -[COService dispatchQueue](self, "dispatchQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __37__COTimerService_didResetTimerAddOn___block_invoke;
  v7[3] = &unk_24D4B0858;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, v7);

}

uint64_t __37__COTimerService_didResetTimerAddOn___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_didResetTimerAddOn:", *(_QWORD *)(a1 + 40));
}

- (void)didChangeCompositionForTimerAddOn:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  -[COService dispatchQueue](self, "dispatchQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __52__COTimerService_didChangeCompositionForTimerAddOn___block_invoke;
  v7[3] = &unk_24D4B0858;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, v7);

}

uint64_t __52__COTimerService_didChangeCompositionForTimerAddOn___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_postCanDispatchChangedAddOn:", *(_QWORD *)(a1 + 40));
}

- (void)_didResetTimerAddOn:(id)a3
{
  -[COTimerService _postNotificationName:forTimers:toAddOn:requiresUserInfo:](self, "_postNotificationName:forTimers:toAddOn:requiresUserInfo:", *MEMORY[0x24BE19D90], MEMORY[0x24BDBD1A8], a3, 0);
}

- (COSignalsClientObserverSet)observers
{
  return self->_observers;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_observers, 0);
}

+ (void)_isAllowedClient:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  v2 = 138412290;
  v3 = a1;
  _os_log_debug_impl(&dword_215E92000, a2, OS_LOG_TYPE_DEBUG, "timers service allowing %@", (uint8_t *)&v2, 0xCu);
}

@end
