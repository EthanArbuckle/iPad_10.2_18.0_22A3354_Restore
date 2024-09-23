@implementation COAlarmService

+ (id)serviceWithDelegate:(id)a3
{
  id v4;
  COAlarmAddOnListenerProvider *v5;
  COAlarmAddOnProvider *v6;
  void *v7;

  v4 = a3;
  v5 = objc_alloc_init(COAlarmAddOnListenerProvider);
  v6 = objc_alloc_init(COAlarmAddOnProvider);
  v7 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithListenerProvider:addOnProvider:delegate:", v5, v6, v4);

  return v7;
}

- (COAlarmService)initWithListenerProvider:(id)a3 addOnProvider:(id)a4 delegate:(id)a5
{
  COAlarmService *v5;
  COSignalsClientObserverSet *v6;
  COSignalsClientObserverSet *observers;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)COAlarmService;
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
  COCoreLogForCategory(2);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    +[COAlarmService _isAllowedClient:].cold.1((uint64_t)v3, v4);

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
  v13.super_class = (Class)COAlarmService;
  v4 = a3;
  -[COService _configureServiceInterfacesOnConnection:](&v13, sel__configureServiceInterfacesOnConnection_, v4);
  objc_msgSend(MEMORY[0x24BDD1990], "interfaceWithProtocol:", &unk_254E1D1C8);
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

  objc_msgSend(v5, "setClasses:forSelector:argumentIndex:ofReply:", v11, sel_alarmsAsAccessory_asInstance_forAccessories_callback_, 2, 0);
  objc_msgSend(v4, "setExportedInterface:", v5);
  objc_msgSend(v4, "setExportedObject:", self);
  objc_msgSend(MEMORY[0x24BDD1990], "interfaceWithProtocol:", &unk_254E2D518);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "setRemoteObjectInterface:", v12);
}

- (id)_newClientForConnection:(id)a3
{
  id v3;
  COAlarmServiceClient *v4;

  v3 = a3;
  v4 = -[COAlarmServiceClient initWithConnection:]([COAlarmServiceClient alloc], "initWithConnection:", v3);

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
  v19.super_class = (Class)COAlarmService;
  -[COService _clientLost:](&v19, sel__clientLost_, v4);
  -[COAlarmService observers](self, "observers");
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
        -[COAlarmService _didStopCanDispatchUpdate:](self, "_didStopCanDispatchUpdate:", v13);
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
  COAlarmService *v11;
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
      COCoreLogForCategory(2);
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134218242;
        v11 = self;
        v12 = 2112;
        v13 = v6;
        _os_log_impl(&dword_215E92000, v8, OS_LOG_TYPE_DEFAULT, "%p AlarmService added secondary cluster for accessory %@", buf, 0x16u);
      }

      objc_msgSend(v4, "establishSecondaryClusterForAccessory:", v7);
    }

  }
  v9.receiver = self;
  v9.super_class = (Class)COAlarmService;
  -[COService _addOnAdded:](&v9, sel__addOnAdded_, v4);

}

- (void)_addOnRemoved:(id)a3
{
  id v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)COAlarmService;
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
  v19[2] = __60__COAlarmService__postNotificationName_connection_userInfo___block_invoke;
  v19[3] = &unk_24D4B1CB0;
  v19[4] = self;
  v11 = v9;
  v20 = v11;
  v12 = a5;
  objc_msgSend(v11, "remoteObjectProxyWithErrorHandler:", v19);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = v10;
  v16[1] = 3221225472;
  v16[2] = __60__COAlarmService__postNotificationName_connection_userInfo___block_invoke_82;
  v16[3] = &unk_24D4B3170;
  v16[4] = self;
  v17 = v11;
  v18 = v8;
  v14 = v8;
  v15 = v11;
  objc_msgSend(v13, "postNotificationName:withUserInfo:callback:", v14, v12, v16);

}

void __60__COAlarmService__postNotificationName_connection_userInfo___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;

  v2 = a2;
  COCoreLogForCategory(2);
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    __60__COAlarmService__postNotificationName_connection_userInfo___block_invoke_cold_1();

}

void __60__COAlarmService__postNotificationName_connection_userInfo___block_invoke_82(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;

  v2 = a2;
  if (v2)
  {
    COCoreLogForCategory(2);
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
      __60__COAlarmService__postNotificationName_connection_userInfo___block_invoke_82_cold_1();

  }
}

- (void)_postNotificationName:(id)a3 forAlarms:(id)a4 toAddOn:(id)a5 requiresUserInfo:(BOOL)a6
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
  COAlarmService *v33;
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
  -[COAlarmService observers](self, "observers");
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
    v36 = *MEMORY[0x24BE67778];
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
          v38[2] = __75__COAlarmService__postNotificationName_forAlarms_toAddOn_requiresUserInfo___block_invoke_2;
          v38[3] = &unk_24D4B3198;
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
          v41[2] = __75__COAlarmService__postNotificationName_forAlarms_toAddOn_requiresUserInfo___block_invoke;
          v41[3] = &unk_24D4B3198;
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
          -[COAlarmService _postNotificationName:connection:userInfo:](v33, "_postNotificationName:connection:userInfo:", v34, v20, v29);

      }
      v16 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v44, v48, 16);
    }
    while (v16);
  }

}

uint64_t __75__COAlarmService__postNotificationName_forAlarms_toAddOn_requiresUserInfo___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "_isAlarm:targetingAccessory:", a2, *(_QWORD *)(a1 + 40));
}

uint64_t __75__COAlarmService__postNotificationName_forAlarms_toAddOn_requiresUserInfo___block_invoke_2(uint64_t a1, void *a2)
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
  v6 = objc_msgSend(v2, "_isAlarm:targetingAccessoryIdentifiers:", v4, v5);

  return v6;
}

- (void)_postNotificationName:(id)a3 forAccessory:(id)a4 toAddOn:(id)a5
{
  id v7;
  id v8;
  COAlarmService *v9;
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
  -[COAlarmService observers](self, "observers");
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
            -[COAlarmService _postNotificationName:connection:userInfo:](v9, "_postNotificationName:connection:userInfo:", v22, v21, 0);

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
    objc_msgSend(v9, "setCanDispatch:", v6);
    objc_msgSend(v9, "connection");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
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
      -[COAlarmService _completeDispatchabilityStallActivity:](self, "_completeDispatchabilityStallActivity:", v9);
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
    -[COAlarmService _postNotificationName:connection:userInfo:](self, "_postNotificationName:connection:userInfo:", *MEMORY[0x24BE19C08], v10, v13);

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
  -[COAlarmService observers](self, "observers");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = *MEMORY[0x24BE19C08];
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
          v15[2] = __47__COAlarmService__postCanDispatchChangedAddOn___block_invoke;
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
          -[COAlarmService _postNotificationName:connection:userInfo:](self, "_postNotificationName:connection:userInfo:", v14, v13, 0);

        }
      }
      v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    }
    while (v8);
  }

}

void __47__COAlarmService__postCanDispatchChangedAddOn___block_invoke(uint64_t a1, uint64_t a2)
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

  -[COAlarmService _completeDispatchabilityStallActivity:](self, "_completeDispatchabilityStallActivity:", v8);
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

- (void)alarmsAsAccessory:(id)a3 asInstance:(id)a4 withCallback:(id)a5
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
  v24[2] = __60__COAlarmService_alarmsAsAccessory_asInstance_withCallback___block_invoke;
  v24[3] = &unk_24D4B31E8;
  v25 = v13;
  v26 = v9;
  v24[4] = self;
  v15 = v13;
  v16 = v9;
  v20[0] = v14;
  v20[1] = 3221225472;
  v20[2] = __60__COAlarmService_alarmsAsAccessory_asInstance_withCallback___block_invoke_3;
  v20[3] = &unk_24D4B3210;
  v21 = v8;
  v22 = v11;
  v23 = (id)MEMORY[0x2199F3D40](v24);
  v17 = v23;
  v18 = v11;
  v19 = v8;
  -[COService _addOnForCluster:completion:](self, "_addOnForCluster:completion:", v15, v20);

}

void __60__COAlarmService_alarmsAsAccessory_asInstance_withCallback___block_invoke(uint64_t a1)
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
  v4[2] = __60__COAlarmService_alarmsAsAccessory_asInstance_withCallback___block_invoke_2;
  v4[3] = &unk_24D4B0858;
  v3 = *(void **)(a1 + 40);
  v4[4] = *(_QWORD *)(a1 + 32);
  v5 = v3;
  dispatch_async(v2, v4);

}

uint64_t __60__COAlarmService_alarmsAsAccessory_asInstance_withCallback___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_releaseAssertionForCluster:", *(_QWORD *)(a1 + 40));
}

void __60__COAlarmService_alarmsAsAccessory_asInstance_withCallback___block_invoke_3(_QWORD *a1, void *a2)
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
    objc_msgSend(v6, "alarmsAsAccessory:fromClient:withCallback:", a1[4], a1[5], a1[6]);
  }
  else
  {
    v4 = a1[6];
    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", *MEMORY[0x24BDD1128], 45, 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, _QWORD, void *))(v4 + 16))(v4, 0, v5);

  }
}

- (void)alarmsAsAccessory:(id)a3 asInstance:(id)a4 forAccessories:(id)a5 callback:(id)a6
{
  id v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  uint64_t v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  _QWORD v21[4];
  id v22;
  id v23;
  id v24;
  id v25;
  _QWORD v26[5];
  id v27;
  id v28;

  v9 = a3;
  v10 = a5;
  v11 = a6;
  -[COService currentClient](self, "currentClient");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  _ClusterForAccessory(v9);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[COService _takeAssertionForCluster:](self, "_takeAssertionForCluster:", v13);
  v14 = MEMORY[0x24BDAC760];
  v26[0] = MEMORY[0x24BDAC760];
  v26[1] = 3221225472;
  v26[2] = __71__COAlarmService_alarmsAsAccessory_asInstance_forAccessories_callback___block_invoke;
  v26[3] = &unk_24D4B3238;
  v27 = v13;
  v28 = v11;
  v26[4] = self;
  v15 = v13;
  v16 = v11;
  v21[0] = v14;
  v21[1] = 3221225472;
  v21[2] = __71__COAlarmService_alarmsAsAccessory_asInstance_forAccessories_callback___block_invoke_3;
  v21[3] = &unk_24D4B3260;
  v22 = v9;
  v23 = v10;
  v24 = v12;
  v25 = (id)MEMORY[0x2199F3D40](v26);
  v17 = v25;
  v18 = v12;
  v19 = v10;
  v20 = v9;
  -[COService _addOnForCluster:completion:](self, "_addOnForCluster:completion:", v15, v21);

}

void __71__COAlarmService_alarmsAsAccessory_asInstance_forAccessories_callback___block_invoke(uint64_t a1)
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
  v4[2] = __71__COAlarmService_alarmsAsAccessory_asInstance_forAccessories_callback___block_invoke_2;
  v4[3] = &unk_24D4B0858;
  v3 = *(void **)(a1 + 40);
  v4[4] = *(_QWORD *)(a1 + 32);
  v5 = v3;
  dispatch_async(v2, v4);

}

uint64_t __71__COAlarmService_alarmsAsAccessory_asInstance_forAccessories_callback___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_releaseAssertionForCluster:", *(_QWORD *)(a1 + 40));
}

void __71__COAlarmService_alarmsAsAccessory_asInstance_forAccessories_callback___block_invoke_3(_QWORD *a1, void *a2)
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
    objc_msgSend(v6, "alarmsForAccessories:fromClient:callback:", a1[5], a1[6], a1[7]);
  }
  else
  {
    v4 = a1[7];
    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", *MEMORY[0x24BDD1128], 45, 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, _QWORD, void *))(v4 + 16))(v4, 0, v5);

  }
}

- (void)addAlarm:(id)a3 asAccessory:(id)a4 asInstance:(id)a5 withCallback:(id)a6
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
  v29[2] = __63__COAlarmService_addAlarm_asAccessory_asInstance_withCallback___block_invoke;
  v29[3] = &unk_24D4B3288;
  v30 = v16;
  v31 = v12;
  v29[4] = self;
  v18 = v16;
  v19 = v12;
  v24[0] = v17;
  v24[1] = 3221225472;
  v24[2] = __63__COAlarmService_addAlarm_asAccessory_asInstance_withCallback___block_invoke_3;
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

void __63__COAlarmService_addAlarm_asAccessory_asInstance_withCallback___block_invoke(uint64_t a1)
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
  v4[2] = __63__COAlarmService_addAlarm_asAccessory_asInstance_withCallback___block_invoke_2;
  v4[3] = &unk_24D4B0858;
  v3 = *(void **)(a1 + 40);
  v4[4] = *(_QWORD *)(a1 + 32);
  v5 = v3;
  dispatch_async(v2, v4);

}

uint64_t __63__COAlarmService_addAlarm_asAccessory_asInstance_withCallback___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_releaseAssertionForCluster:", *(_QWORD *)(a1 + 40));
}

void __63__COAlarmService_addAlarm_asAccessory_asInstance_withCallback___block_invoke_3(_QWORD *a1, void *a2)
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
    objc_msgSend(v6, "addAlarm:asAccessory:fromClient:withCallback:", a1[5], a1[4], a1[6], a1[7]);
  }
  else
  {
    v4 = a1[7];
    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", *MEMORY[0x24BDD1128], 45, 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *))(v4 + 16))(v4, v5);

  }
}

- (void)updateAlarm:(id)a3 asAccessory:(id)a4 asInstance:(id)a5 withCallback:(id)a6
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
  v29[2] = __66__COAlarmService_updateAlarm_asAccessory_asInstance_withCallback___block_invoke;
  v29[3] = &unk_24D4B3288;
  v30 = v16;
  v31 = v12;
  v29[4] = self;
  v18 = v16;
  v19 = v12;
  v24[0] = v17;
  v24[1] = 3221225472;
  v24[2] = __66__COAlarmService_updateAlarm_asAccessory_asInstance_withCallback___block_invoke_3;
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

void __66__COAlarmService_updateAlarm_asAccessory_asInstance_withCallback___block_invoke(uint64_t a1)
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
  v4[2] = __66__COAlarmService_updateAlarm_asAccessory_asInstance_withCallback___block_invoke_2;
  v4[3] = &unk_24D4B0858;
  v3 = *(void **)(a1 + 40);
  v4[4] = *(_QWORD *)(a1 + 32);
  v5 = v3;
  dispatch_async(v2, v4);

}

uint64_t __66__COAlarmService_updateAlarm_asAccessory_asInstance_withCallback___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_releaseAssertionForCluster:", *(_QWORD *)(a1 + 40));
}

void __66__COAlarmService_updateAlarm_asAccessory_asInstance_withCallback___block_invoke_3(_QWORD *a1, void *a2)
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
    objc_msgSend(v6, "updateAlarm:asAccessory:fromClient:withCallback:", a1[5], a1[4], a1[6], a1[7]);
  }
  else
  {
    v4 = a1[7];
    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", *MEMORY[0x24BDD1128], 45, 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *))(v4 + 16))(v4, v5);

  }
}

- (void)removeAlarm:(id)a3 asAccessory:(id)a4 asInstance:(id)a5 withCallback:(id)a6
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
  v29[2] = __66__COAlarmService_removeAlarm_asAccessory_asInstance_withCallback___block_invoke;
  v29[3] = &unk_24D4B3288;
  v30 = v16;
  v31 = v12;
  v29[4] = self;
  v18 = v16;
  v19 = v12;
  v24[0] = v17;
  v24[1] = 3221225472;
  v24[2] = __66__COAlarmService_removeAlarm_asAccessory_asInstance_withCallback___block_invoke_3;
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

void __66__COAlarmService_removeAlarm_asAccessory_asInstance_withCallback___block_invoke(uint64_t a1)
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
  v4[2] = __66__COAlarmService_removeAlarm_asAccessory_asInstance_withCallback___block_invoke_2;
  v4[3] = &unk_24D4B0858;
  v3 = *(void **)(a1 + 40);
  v4[4] = *(_QWORD *)(a1 + 32);
  v5 = v3;
  dispatch_async(v2, v4);

}

uint64_t __66__COAlarmService_removeAlarm_asAccessory_asInstance_withCallback___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_releaseAssertionForCluster:", *(_QWORD *)(a1 + 40));
}

void __66__COAlarmService_removeAlarm_asAccessory_asInstance_withCallback___block_invoke_3(_QWORD *a1, void *a2)
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
    objc_msgSend(v6, "removeAlarm:asAccessory:fromClient:withCallback:", a1[5], a1[4], a1[6], a1[7]);
  }
  else
  {
    v4 = a1[7];
    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", *MEMORY[0x24BDD1128], 45, 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *))(v4 + 16))(v4, v5);

  }
}

- (void)snoozeAlarmWithIdentifier:(id)a3 asAccessory:(id)a4 asInstance:(id)a5 withCallback:(id)a6
{
  id v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  uint64_t v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  _QWORD v21[4];
  id v22;
  id v23;
  id v24;
  id v25;
  _QWORD v26[5];
  id v27;
  id v28;

  v9 = a3;
  v10 = a4;
  v11 = a6;
  -[COService currentClient](self, "currentClient");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  _ClusterForAccessory(v10);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[COService _takeAssertionForCluster:](self, "_takeAssertionForCluster:", v13);
  v14 = MEMORY[0x24BDAC760];
  v26[0] = MEMORY[0x24BDAC760];
  v26[1] = 3221225472;
  v26[2] = __80__COAlarmService_snoozeAlarmWithIdentifier_asAccessory_asInstance_withCallback___block_invoke;
  v26[3] = &unk_24D4B3288;
  v27 = v13;
  v28 = v11;
  v26[4] = self;
  v15 = v13;
  v16 = v11;
  v21[0] = v14;
  v21[1] = 3221225472;
  v21[2] = __80__COAlarmService_snoozeAlarmWithIdentifier_asAccessory_asInstance_withCallback___block_invoke_3;
  v21[3] = &unk_24D4B3260;
  v22 = v10;
  v23 = v9;
  v24 = v12;
  v25 = (id)MEMORY[0x2199F3D40](v26);
  v17 = v25;
  v18 = v12;
  v19 = v9;
  v20 = v10;
  -[COService _addOnForCluster:completion:](self, "_addOnForCluster:completion:", v15, v21);

}

void __80__COAlarmService_snoozeAlarmWithIdentifier_asAccessory_asInstance_withCallback___block_invoke(uint64_t a1)
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
  v4[2] = __80__COAlarmService_snoozeAlarmWithIdentifier_asAccessory_asInstance_withCallback___block_invoke_2;
  v4[3] = &unk_24D4B0858;
  v3 = *(void **)(a1 + 40);
  v4[4] = *(_QWORD *)(a1 + 32);
  v5 = v3;
  dispatch_async(v2, v4);

}

uint64_t __80__COAlarmService_snoozeAlarmWithIdentifier_asAccessory_asInstance_withCallback___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_releaseAssertionForCluster:", *(_QWORD *)(a1 + 40));
}

void __80__COAlarmService_snoozeAlarmWithIdentifier_asAccessory_asInstance_withCallback___block_invoke_3(_QWORD *a1, void *a2)
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
    objc_msgSend(v6, "snoozeAlarmWithIdentifier:fromClient:withCallback:", a1[5], a1[6], a1[7]);
  }
  else
  {
    v4 = a1[7];
    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", *MEMORY[0x24BDD1128], 45, 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *))(v4 + 16))(v4, v5);

  }
}

- (void)dismissAlarmWithIdentifier:(id)a3 asAccessory:(id)a4 asInstance:(id)a5 withCallback:(id)a6
{
  id v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  uint64_t v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  _QWORD v21[4];
  id v22;
  id v23;
  id v24;
  id v25;
  _QWORD v26[5];
  id v27;
  id v28;

  v9 = a3;
  v10 = a4;
  v11 = a6;
  -[COService currentClient](self, "currentClient");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  _ClusterForAccessory(v10);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[COService _takeAssertionForCluster:](self, "_takeAssertionForCluster:", v13);
  v14 = MEMORY[0x24BDAC760];
  v26[0] = MEMORY[0x24BDAC760];
  v26[1] = 3221225472;
  v26[2] = __81__COAlarmService_dismissAlarmWithIdentifier_asAccessory_asInstance_withCallback___block_invoke;
  v26[3] = &unk_24D4B3288;
  v27 = v13;
  v28 = v11;
  v26[4] = self;
  v15 = v13;
  v16 = v11;
  v21[0] = v14;
  v21[1] = 3221225472;
  v21[2] = __81__COAlarmService_dismissAlarmWithIdentifier_asAccessory_asInstance_withCallback___block_invoke_3;
  v21[3] = &unk_24D4B3260;
  v22 = v10;
  v23 = v9;
  v24 = v12;
  v25 = (id)MEMORY[0x2199F3D40](v26);
  v17 = v25;
  v18 = v12;
  v19 = v9;
  v20 = v10;
  -[COService _addOnForCluster:completion:](self, "_addOnForCluster:completion:", v15, v21);

}

void __81__COAlarmService_dismissAlarmWithIdentifier_asAccessory_asInstance_withCallback___block_invoke(uint64_t a1)
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
  v4[2] = __81__COAlarmService_dismissAlarmWithIdentifier_asAccessory_asInstance_withCallback___block_invoke_2;
  v4[3] = &unk_24D4B0858;
  v3 = *(void **)(a1 + 40);
  v4[4] = *(_QWORD *)(a1 + 32);
  v5 = v3;
  dispatch_async(v2, v4);

}

uint64_t __81__COAlarmService_dismissAlarmWithIdentifier_asAccessory_asInstance_withCallback___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_releaseAssertionForCluster:", *(_QWORD *)(a1 + 40));
}

void __81__COAlarmService_dismissAlarmWithIdentifier_asAccessory_asInstance_withCallback___block_invoke_3(_QWORD *a1, void *a2)
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
    objc_msgSend(v6, "dismissAlarmWithIdentifier:fromClient:withCallback:", a1[5], a1[6], a1[7]);
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
  id v18;
  void *v19;
  void *v20;
  void *v21;
  NSObject *v22;
  void *v23;
  NSObject *v24;
  COSignalsClientObserver *v25;
  COSignalsClientObserver *v26;
  void *v27;
  void *v28;
  void *v29;
  id v30;
  void *v31;
  id v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  _QWORD v37[4];
  id v38;
  id v39;
  uint8_t buf[4];
  void *v41;
  __int16 v42;
  id v43;
  uint64_t v44;

  v44 = *MEMORY[0x24BDAC8D0];
  v12 = a3;
  v13 = a4;
  v14 = a6;
  v15 = (void (**)(id, _QWORD))a7;
  v16 = a5;
  v17 = v13;
  v18 = v16;
  -[COService currentClient](self, "currentClient");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "connection");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "co_SetPeerInstance:", v18);

  _ClusterForAccessory(v17);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  -[COService _takeAssertionForCluster:](self, "_takeAssertionForCluster:", v21);
  COCoreLogForCategory(2);
  v22 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134218242;
    v41 = v19;
    v42 = 2112;
    v43 = v12;
    _os_log_impl(&dword_215E92000, v22, OS_LOG_TYPE_DEFAULT, "%p serving request to observe %@", buf, 0x16u);
  }

  -[COAlarmService observers](self, "observers");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v36 = v19;
  if (v14)
  {
    COCoreLogForCategory(2);
    v24 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG))
      -[COAlarmService addObserverForNotificationName:asAccessory:asInstance:constraints:withCallback:].cold.1((uint64_t)v19, (uint64_t)v14, v24);

    v25 = -[COSignalsClientObserver initWithConnection:asAccessory:constraints:cluster:]([COSignalsClientObserver alloc], "initWithConnection:asAccessory:constraints:cluster:", v20, v17, v14, v21);
  }
  else
  {
    v25 = -[COSignalsClientObserver initWithConnection:cluster:]([COSignalsClientObserver alloc], "initWithConnection:cluster:", v20, v21);
  }
  v26 = v25;
  if (objc_msgSend(v12, "isEqualToString:", *MEMORY[0x24BE19C08]))
  {
    -[COSignalsClientObserver dispatchabilityStallActivity](v26, "dispatchabilityStallActivity");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    if (v27)
    {
LABEL_12:

      goto LABEL_13;
    }
    if (!-[COSignalsClientObserver canDispatch](v26, "canDispatch"))
    {
      objc_msgSend(v36, "clientLifetimeActivity");
      v34 = v17;
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      +[CONetworkActivityFactory activityWithLabel:parentActivity:](CONetworkActivityFactory, "activityWithLabel:parentActivity:", 7, v28);
      v27 = (void *)objc_claimAutoreleasedReturnValue();

      v17 = v34;
      -[COSignalsClientObserver setDispatchabilityStallActivity:](v26, "setDispatchabilityStallActivity:", v27);
      nw_activity_activate();
      goto LABEL_12;
    }
  }
LABEL_13:
  if (objc_msgSend(MEMORY[0x24BE19E30], "isGlobalMessagingEnabled") && objc_msgSend(v14, "count"))
  {
    v35 = v17;
    objc_msgSend(v23, "constraints");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = (id)objc_msgSend(v14, "mutableCopy");
    objc_msgSend(v30, "minusSet:", v29);
    if (objc_msgSend(v30, "count"))
    {
      v33 = v29;
      v31 = (void *)objc_msgSend(v29, "mutableCopy");

      objc_msgSend(v31, "unionSet:", v14);
      v37[0] = MEMORY[0x24BDAC760];
      v37[1] = 3221225472;
      v37[2] = __97__COAlarmService_addObserverForNotificationName_asAccessory_asInstance_constraints_withCallback___block_invoke;
      v37[3] = &unk_24D4B32D0;
      v38 = v35;
      v32 = v31;
      v29 = v33;
      v30 = v32;
      v39 = v32;
      -[COService _addOnForCluster:completion:](self, "_addOnForCluster:completion:", v21, v37);

    }
    v17 = v35;
  }
  objc_msgSend(v23, "addClientObserver:forNotificationName:", v26, v12);
  v15[2](v15, 0);

}

void __97__COAlarmService_addObserverForNotificationName_asAccessory_asInstance_constraints_withCallback___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  id v4;

  if (a2)
  {
    v3 = *(_QWORD *)(a1 + 32);
    v4 = a2;
    objc_msgSend(v4, "establishSecondaryClusterForAccessory:", v3);
    objc_msgSend(v4, "setInterests:asAccessory:withCallback:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32), &__block_literal_global_8);

  }
}

- (void)removeObserverForNotificationName:(id)a3 asAccessory:(id)a4 asInstance:(id)a5 withCallback:(id)a6
{
  id v9;
  id v10;
  id v11;
  void *v12;
  uint64_t v13;
  NSObject *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t i;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  id v29;
  void *v30;
  id v31;
  id v32;
  void *v33;
  void *v34;
  id v35;
  void *v36;
  _QWORD v37[4];
  id v38;
  id v39;
  id v40;
  _QWORD v41[5];
  id v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  uint8_t v47[128];
  uint8_t buf[4];
  void *v49;
  __int16 v50;
  id v51;
  uint64_t v52;

  v52 = *MEMORY[0x24BDAC8D0];
  v9 = a3;
  v10 = a4;
  v11 = a6;
  -[COService currentClient](self, "currentClient");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "connection");
  v13 = objc_claimAutoreleasedReturnValue();
  COCoreLogForCategory(2);
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134218242;
    v49 = v12;
    v50 = 2112;
    v51 = v9;
    _os_log_impl(&dword_215E92000, v14, OS_LOG_TYPE_DEFAULT, "%p serving request to stop observing %@", buf, 0x16u);
  }
  v34 = v12;

  -[COAlarmService observers](self, "observers");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = v10;
  v35 = v11;
  if (objc_msgSend(MEMORY[0x24BE19E30], "isGlobalMessagingEnabled"))
  {
    objc_msgSend(v15, "constraints");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v36 = 0;
  }
  v33 = (void *)v13;
  objc_msgSend(v15, "clientObserversForXPCConnection:", v13);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v43 = 0u;
  v44 = 0u;
  v45 = 0u;
  v46 = 0u;
  v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v43, v47, 16);
  if (v18)
  {
    v19 = v18;
    v20 = *(_QWORD *)v44;
    v21 = *MEMORY[0x24BE19C08];
    do
    {
      for (i = 0; i != v19; ++i)
      {
        if (*(_QWORD *)v44 != v20)
          objc_enumerationMutation(v17);
        v23 = *(_QWORD *)(*((_QWORD *)&v43 + 1) + 8 * i);
        objc_msgSend(v15, "removeClientObserver:forNotificationName:", v23, v9);
        if (objc_msgSend(v9, "isEqualToString:", v21))
          -[COAlarmService _didStopCanDispatchUpdate:](self, "_didStopCanDispatchUpdate:", v23);
      }
      v19 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v43, v47, 16);
    }
    while (v19);
  }
  v24 = v35;
  (*((void (**)(id, _QWORD))v35 + 2))(v35, 0);
  v25 = v16;
  _ClusterForAccessory(v16);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(MEMORY[0x24BE19E30], "isGlobalMessagingEnabled"))
  {
    objc_msgSend(v15, "constraints");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v27, "isEqual:", v36) & 1) == 0)
    {
      -[COService _takeAssertionForCluster:](self, "_takeAssertionForCluster:", v26);
      v28 = MEMORY[0x24BDAC760];
      v41[0] = MEMORY[0x24BDAC760];
      v41[1] = 3221225472;
      v41[2] = __88__COAlarmService_removeObserverForNotificationName_asAccessory_asInstance_withCallback___block_invoke;
      v41[3] = &unk_24D4B0858;
      v41[4] = self;
      v29 = v26;
      v42 = v29;
      v30 = (void *)MEMORY[0x2199F3D40](v41);
      v37[0] = v28;
      v25 = v16;
      v37[1] = 3221225472;
      v37[2] = __88__COAlarmService_removeObserverForNotificationName_asAccessory_asInstance_withCallback___block_invoke_3;
      v37[3] = &unk_24D4B3210;
      v38 = v16;
      v39 = v27;
      v40 = v30;
      v31 = v30;
      v32 = v29;
      v24 = v35;
      -[COService _addOnForCluster:completion:](self, "_addOnForCluster:completion:", v32, v37);

    }
  }
  -[COService _releaseAssertionForCluster:](self, "_releaseAssertionForCluster:", v26);

}

void __88__COAlarmService_removeObserverForNotificationName_asAccessory_asInstance_withCallback___block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  _QWORD v4[5];
  id v5;

  objc_msgSend(*(id *)(a1 + 32), "dispatchQueue");
  v2 = objc_claimAutoreleasedReturnValue();
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __88__COAlarmService_removeObserverForNotificationName_asAccessory_asInstance_withCallback___block_invoke_2;
  v4[3] = &unk_24D4B0858;
  v3 = *(void **)(a1 + 40);
  v4[4] = *(_QWORD *)(a1 + 32);
  v5 = v3;
  dispatch_async(v2, v4);

}

uint64_t __88__COAlarmService_removeObserverForNotificationName_asAccessory_asInstance_withCallback___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_releaseAssertionForCluster:", *(_QWORD *)(a1 + 40));
}

void __88__COAlarmService_removeObserverForNotificationName_asAccessory_asInstance_withCallback___block_invoke_3(_QWORD *a1, void *a2)
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
  v22[2] = __58__COAlarmService_canDispatchAsAccessory_asInstance_reply___block_invoke;
  v22[3] = &unk_24D4B32F8;
  v23 = v11;
  v24 = v10;
  v22[4] = self;
  v13 = v11;
  v14 = v10;
  v18[0] = v12;
  v18[1] = 3221225472;
  v18[2] = __58__COAlarmService_canDispatchAsAccessory_asInstance_reply___block_invoke_3;
  v18[3] = &unk_24D4B3210;
  v19 = v8;
  v20 = v9;
  v21 = (id)MEMORY[0x2199F3D40](v22);
  v15 = v21;
  v16 = v9;
  v17 = v8;
  -[COService _addOnForCluster:completion:](self, "_addOnForCluster:completion:", v13, v18);

}

void __58__COAlarmService_canDispatchAsAccessory_asInstance_reply___block_invoke(uint64_t a1)
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
  v4[2] = __58__COAlarmService_canDispatchAsAccessory_asInstance_reply___block_invoke_2;
  v4[3] = &unk_24D4B0858;
  v3 = *(void **)(a1 + 40);
  v4[4] = *(_QWORD *)(a1 + 32);
  v5 = v3;
  dispatch_async(v2, v4);

}

uint64_t __58__COAlarmService_canDispatchAsAccessory_asInstance_reply___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_releaseAssertionForCluster:", *(_QWORD *)(a1 + 40));
}

void __58__COAlarmService_canDispatchAsAccessory_asInstance_reply___block_invoke_3(_QWORD *a1, void *a2)
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

- (void)alarmAddOn:(id)a3 didAddAlarms:(id)a4
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
  block[2] = __42__COAlarmService_alarmAddOn_didAddAlarms___block_invoke;
  block[3] = &unk_24D4B08D0;
  block[4] = self;
  v12 = v7;
  v13 = v6;
  v9 = v6;
  v10 = v7;
  dispatch_async(v8, block);

}

uint64_t __42__COAlarmService_alarmAddOn_didAddAlarms___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_postNotificationName:forAlarms:toAddOn:requiresUserInfo:", *MEMORY[0x24BE19BD0], *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), 0);
}

- (void)alarmAddOn:(id)a3 didRemoveAlarms:(id)a4
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
  block[2] = __45__COAlarmService_alarmAddOn_didRemoveAlarms___block_invoke;
  block[3] = &unk_24D4B08D0;
  block[4] = self;
  v12 = v7;
  v13 = v6;
  v9 = v6;
  v10 = v7;
  dispatch_async(v8, block);

}

uint64_t __45__COAlarmService_alarmAddOn_didRemoveAlarms___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_postNotificationName:forAlarms:toAddOn:requiresUserInfo:", *MEMORY[0x24BE19BE8], *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), 0);
}

- (void)alarmAddOn:(id)a3 didUpdateAlarms:(id)a4
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
  block[2] = __45__COAlarmService_alarmAddOn_didUpdateAlarms___block_invoke;
  block[3] = &unk_24D4B08D0;
  block[4] = self;
  v12 = v7;
  v13 = v6;
  v9 = v6;
  v10 = v7;
  dispatch_async(v8, block);

}

uint64_t __45__COAlarmService_alarmAddOn_didUpdateAlarms___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_postNotificationName:forAlarms:toAddOn:requiresUserInfo:", *MEMORY[0x24BE19BF0], *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), 0);
}

- (void)alarmAddOn:(id)a3 didChangeAlarms:(id)a4
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
  block[2] = __45__COAlarmService_alarmAddOn_didChangeAlarms___block_invoke;
  block[3] = &unk_24D4B08D0;
  block[4] = self;
  v12 = v7;
  v13 = v6;
  v9 = v6;
  v10 = v7;
  dispatch_async(v8, block);

}

uint64_t __45__COAlarmService_alarmAddOn_didChangeAlarms___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_postNotificationName:forAlarms:toAddOn:requiresUserInfo:", *MEMORY[0x24BE19BD8], *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), 0);
}

- (void)alarmAddOn:(id)a3 didFireAlarms:(id)a4
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
  block[2] = __43__COAlarmService_alarmAddOn_didFireAlarms___block_invoke;
  block[3] = &unk_24D4B08D0;
  block[4] = self;
  v12 = v7;
  v13 = v6;
  v9 = v6;
  v10 = v7;
  dispatch_async(v8, block);

}

uint64_t __43__COAlarmService_alarmAddOn_didFireAlarms___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_postNotificationName:forAlarms:toAddOn:requiresUserInfo:", *MEMORY[0x24BE19BC0], *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), 1);
}

- (void)alarmAddOn:(id)a3 didDismissAlarms:(id)a4
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
  block[2] = __46__COAlarmService_alarmAddOn_didDismissAlarms___block_invoke;
  block[3] = &unk_24D4B08D0;
  block[4] = self;
  v12 = v7;
  v13 = v6;
  v9 = v6;
  v10 = v7;
  dispatch_async(v8, block);

}

uint64_t __46__COAlarmService_alarmAddOn_didDismissAlarms___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_postNotificationName:forAlarms:toAddOn:requiresUserInfo:", *MEMORY[0x24BE19C18], *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), 1);
}

- (void)alarmAddOn:(id)a3 didChangeFiringAlarms:(id)a4
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
  block[2] = __51__COAlarmService_alarmAddOn_didChangeFiringAlarms___block_invoke;
  block[3] = &unk_24D4B08D0;
  block[4] = self;
  v12 = v7;
  v13 = v6;
  v9 = v6;
  v10 = v7;
  dispatch_async(v8, block);

}

uint64_t __51__COAlarmService_alarmAddOn_didChangeFiringAlarms___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_postNotificationName:forAlarms:toAddOn:requiresUserInfo:", *MEMORY[0x24BE19C10], *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), 1);
}

- (void)alarmAddOn:(id)a3 resetAccesory:(id)a4
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
  block[2] = __43__COAlarmService_alarmAddOn_resetAccesory___block_invoke;
  block[3] = &unk_24D4B08D0;
  block[4] = self;
  v12 = v7;
  v13 = v6;
  v9 = v6;
  v10 = v7;
  dispatch_async(v8, block);

}

uint64_t __43__COAlarmService_alarmAddOn_resetAccesory___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_postNotificationName:forAccessory:toAddOn:", *MEMORY[0x24BE19C38], *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

- (void)didResetAlarmAddOn:(id)a3
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
  v7[2] = __37__COAlarmService_didResetAlarmAddOn___block_invoke;
  v7[3] = &unk_24D4B0858;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, v7);

}

uint64_t __37__COAlarmService_didResetAlarmAddOn___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_didResetAlarmAddOn:", *(_QWORD *)(a1 + 40));
}

- (void)didChangeCompositionForAlarmAddOn:(id)a3
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
  v7[2] = __52__COAlarmService_didChangeCompositionForAlarmAddOn___block_invoke;
  v7[3] = &unk_24D4B0858;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, v7);

}

uint64_t __52__COAlarmService_didChangeCompositionForAlarmAddOn___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_postCanDispatchChangedAddOn:", *(_QWORD *)(a1 + 40));
}

- (void)_didResetAlarmAddOn:(id)a3
{
  -[COAlarmService _postNotificationName:forAlarms:toAddOn:requiresUserInfo:](self, "_postNotificationName:forAlarms:toAddOn:requiresUserInfo:", *MEMORY[0x24BE19C38], MEMORY[0x24BDBD1A8], a3, 0);
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
  _os_log_debug_impl(&dword_215E92000, a2, OS_LOG_TYPE_DEBUG, "alarms service allowing %@", (uint8_t *)&v2, 0xCu);
}

void __60__COAlarmService__postNotificationName_connection_userInfo___block_invoke_cold_1()
{
  uint64_t v0;
  os_log_t v1;
  uint8_t v2[24];
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_0_6();
  v3 = v0;
  _os_log_error_impl(&dword_215E92000, v1, OS_LOG_TYPE_ERROR, "%p -> %p remote failed %@ ", v2, 0x20u);
}

void __60__COAlarmService__postNotificationName_connection_userInfo___block_invoke_82_cold_1()
{
  uint64_t v0;
  __int16 v1;
  uint64_t v2;
  os_log_t v3;
  uint8_t v4[24];
  uint64_t v5;
  __int16 v6;
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_0_6();
  v5 = v0;
  v6 = v1;
  v7 = v2;
  _os_log_error_impl(&dword_215E92000, v3, OS_LOG_TYPE_ERROR, "%p -> %p %@ post failed %@ ", v4, 0x2Au);
}

- (void)addObserverForNotificationName:(os_log_t)log asAccessory:asInstance:constraints:withCallback:.cold.1(uint64_t a1, uint64_t a2, os_log_t log)
{
  int v3;
  uint64_t v4;
  __int16 v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  v3 = 134218242;
  v4 = a1;
  v5 = 2112;
  v6 = a2;
  _os_log_debug_impl(&dword_215E92000, log, OS_LOG_TYPE_DEBUG, "%p observing constrained to %@", (uint8_t *)&v3, 0x16u);
}

@end
