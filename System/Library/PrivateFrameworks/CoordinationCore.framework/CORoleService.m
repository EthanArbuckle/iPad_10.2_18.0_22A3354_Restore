@implementation CORoleService

+ (id)serviceWithDelegate:(id)a3
{
  id v3;
  COServiceListenerProvider *v4;
  CORoleAddOnProvider *v5;
  CORoleService *v6;

  v3 = a3;
  v4 = -[COServiceListenerProvider initWithServiceName:entitlement:]([COServiceListenerProvider alloc], "initWithServiceName:entitlement:", CFSTR("com.apple.coordination.role"), CFSTR("com.apple.private.coordination.role"));
  v5 = objc_alloc_init(CORoleAddOnProvider);
  v6 = -[CORoleService initWithListenerProvider:addOnProvider:delegate:]([CORoleService alloc], "initWithListenerProvider:addOnProvider:delegate:", v4, v5, v3);

  return v6;
}

- (CORoleService)initWithListenerProvider:(id)a3 addOnProvider:(id)a4 delegate:(id)a5
{
  CORoleService *v5;
  uint64_t v6;
  NSDictionary *snapshotState;
  uint64_t v8;
  NSDictionary *roleObservers;
  uint64_t v10;
  NSDictionary *memberObservers;
  uint64_t v12;
  NSDictionary *snapshotObservers;
  objc_super v15;

  v15.receiver = self;
  v15.super_class = (Class)CORoleService;
  v5 = -[COService initWithListenerProvider:addOnProvider:delegate:](&v15, sel_initWithListenerProvider_addOnProvider_delegate_, a3, a4, a5);
  if (v5)
  {
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionary");
    v6 = objc_claimAutoreleasedReturnValue();
    snapshotState = v5->_snapshotState;
    v5->_snapshotState = (NSDictionary *)v6;

    objc_msgSend(MEMORY[0x24BDBCE70], "dictionary");
    v8 = objc_claimAutoreleasedReturnValue();
    roleObservers = v5->_roleObservers;
    v5->_roleObservers = (NSDictionary *)v8;

    objc_msgSend(MEMORY[0x24BDBCE70], "dictionary");
    v10 = objc_claimAutoreleasedReturnValue();
    memberObservers = v5->_memberObservers;
    v5->_memberObservers = (NSDictionary *)v10;

    objc_msgSend(MEMORY[0x24BDBCE70], "dictionary");
    v12 = objc_claimAutoreleasedReturnValue();
    snapshotObservers = v5->_snapshotObservers;
    v5->_snapshotObservers = (NSDictionary *)v12;

    -[COService _serviceReady](v5, "_serviceReady");
  }
  return v5;
}

- (void)_configureServiceInterfacesOnConnection:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  objc_super v16;

  v16.receiver = self;
  v16.super_class = (Class)CORoleService;
  v4 = a3;
  -[COService _configureServiceInterfacesOnConnection:](&v16, sel__configureServiceInterfacesOnConnection_, v4);
  v5 = (void *)MEMORY[0x24BDD1990];
  v6 = &unk_254E21850;
  objc_msgSend(v5, "interfaceWithProtocol:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setExportedInterface:", v7);
  objc_msgSend(v4, "setExportedObject:", self);
  v8 = &unk_254E2D8B8;

  objc_msgSend(MEMORY[0x24BDD1990], "interfaceWithProtocol:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = (void *)MEMORY[0x24BDBCF20];
  v11 = objc_opt_class();
  objc_msgSend(v10, "setWithObjects:", v11, objc_opt_class(), 0, v16.receiver, v16.super_class);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setClasses:forSelector:argumentIndex:ofReply:", v12, sel_membersWithRole_inCluster_didChangeTo_, 2, 0);
  v13 = (void *)MEMORY[0x24BDBCF20];
  v14 = objc_opt_class();
  objc_msgSend(v13, "setWithObjects:", v14, objc_opt_class(), 0);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setClasses:forSelector:argumentIndex:ofReply:", v15, sel_snapshotOfCluster_didChangeTo_, 1, 0);

  objc_msgSend(v4, "setRemoteObjectInterface:", v9);
}

- (void)_clientLost:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)CORoleService;
  v4 = a3;
  -[COService _clientLost:](&v5, sel__clientLost_, v4);
  -[CORoleService _removeRoleObserverForClient:ofMember:inCluster:](self, "_removeRoleObserverForClient:ofMember:inCluster:", v4, 0, 0, v5.receiver, v5.super_class);
  -[CORoleService _removeMemberObserverForClient:ofRole:inCluster:](self, "_removeMemberObserverForClient:ofRole:inCluster:", v4, 0, 0);
  -[CORoleService _removeSnapshotObserverForClient:inCluster:](self, "_removeSnapshotObserverForClient:inCluster:", v4, 0);

}

- (void)_addOnAdded:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(MEMORY[0x24BE19DF0], "pairCluster");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  -[COService _clustersForAddOn:](self, "_clustersForAddOn:", v4, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v14;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v14 != v9)
          objc_enumerationMutation(v6);
        v11 = *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * v10);
        objc_msgSend(MEMORY[0x24BDBCF20], "set");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        -[CORoleService _updateSnapshots:inCluster:](self, "_updateSnapshots:inCluster:", v12, v11);

        if (objc_msgSend(v5, "isEqual:", v11))
          objc_msgSend(v4, "_enableForPairLegacySupport");
        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v8);
  }

  objc_msgSend(v4, "setDelegate:", self);
}

- (void)_addOnRemoved:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(v4, "setDelegate:", 0);
  v12 = 0u;
  v13 = 0u;
  v10 = 0u;
  v11 = 0u;
  -[COService _clustersForAddOn:](self, "_clustersForAddOn:", v4, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v11;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v11 != v8)
          objc_enumerationMutation(v5);
        -[CORoleService _updateSnapshots:inCluster:](self, "_updateSnapshots:inCluster:", 0, *(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * v9++));
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v7);
  }

}

- (BOOL)_applicableToCluster:(id)a3
{
  void *v3;
  BOOL v4;

  objc_msgSend(a3, "configuration");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (objc_msgSend(v3, "requiredServices") & 0xC) != 0;

  return v4;
}

- (void)registerForRoleChangesOfMember:(id)a3 inCluster:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a3;
  v6 = a4;
  -[COService currentClient](self, "currentClient");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    -[CORoleService _roleOfMember:inCluster:](self, "_roleOfMember:inCluster:", v9, v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[CORoleService _notifyRoleObserver:roleOfMember:inCluster:didChangeTo:](self, "_notifyRoleObserver:roleOfMember:inCluster:didChangeTo:", v7, v9, v6, v8);
    -[CORoleService _addRoleObserverForClient:ofMember:inCluster:](self, "_addRoleObserverForClient:ofMember:inCluster:", v7, v9, v6);

  }
}

- (void)unregisterForRoleChangesOfMember:(id)a3 inCluster:(id)a4
{
  id v6;
  void *v7;
  id v8;

  v8 = a3;
  v6 = a4;
  -[COService currentClient](self, "currentClient");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
    -[CORoleService _removeRoleObserverForClient:ofMember:inCluster:](self, "_removeRoleObserverForClient:ofMember:inCluster:", v7, v8, v6);

}

- (void)registerForMemberChangesWithRole:(id)a3 inCluster:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a3;
  v6 = a4;
  -[COService currentClient](self, "currentClient");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    -[CORoleService _membersWithRole:inCluster:](self, "_membersWithRole:inCluster:", v9, v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[CORoleService _notifyMemberObserver:membersWithRole:inCluster:didChangeTo:](self, "_notifyMemberObserver:membersWithRole:inCluster:didChangeTo:", v7, v9, v6, v8);
    -[CORoleService _addMemberObserverForClient:ofRole:inCluster:](self, "_addMemberObserverForClient:ofRole:inCluster:", v7, v9, v6);

  }
}

- (void)unregisterForMemberChangesWithRole:(id)a3 inCluster:(id)a4
{
  id v6;
  void *v7;
  id v8;

  v8 = a3;
  v6 = a4;
  -[COService currentClient](self, "currentClient");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
    -[CORoleService _removeMemberObserverForClient:ofRole:inCluster:](self, "_removeMemberObserverForClient:ofRole:inCluster:", v7, v8, v6);

}

- (void)registerForSnapshotChangesInCluster:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  v6 = a3;
  -[COService currentClient](self, "currentClient");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    -[CORoleService _snapshotsForCluster:](self, "_snapshotsForCluster:", v6);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[CORoleService _notifySnapshotObserver:snapshotOfCluster:didChangeTo:](self, "_notifySnapshotObserver:snapshotOfCluster:didChangeTo:", v4, v6, v5);
    -[CORoleService _addSnapshotObserverForClient:inCluster:](self, "_addSnapshotObserverForClient:inCluster:", v4, v6);

  }
}

- (void)unregisterForSnapshotChangesInCluster:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  -[COService currentClient](self, "currentClient");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
    -[CORoleService _removeSnapshotObserverForClient:inCluster:](self, "_removeSnapshotObserverForClient:inCluster:", v4, v5);

}

- (void)addOn:(id)a3 stateChanged:(id)a4
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
  block[2] = __36__CORoleService_addOn_stateChanged___block_invoke;
  block[3] = &unk_24D4B08D0;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(v8, block);

}

void __36__CORoleService_addOn_stateChanged___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  uint64_t v7;
  NSObject *v8;
  uint64_t v9;
  uint64_t v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  uint8_t buf[4];
  uint64_t v16;
  __int16 v17;
  uint64_t v18;
  __int16 v19;
  uint64_t v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  objc_msgSend(*(id *)(a1 + 32), "_clustersForAddOn:", *(_QWORD *)(a1 + 40));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v11, v21, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v12;
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v12 != v5)
          objc_enumerationMutation(v2);
        v7 = *(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * i);
        COCoreLogForCategory(4);
        v8 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
        {
          v9 = *(_QWORD *)(a1 + 32);
          v10 = *(_QWORD *)(a1 + 48);
          *(_DWORD *)buf = 134218498;
          v16 = v9;
          v17 = 2112;
          v18 = v7;
          v19 = 2112;
          v20 = v10;
          _os_log_impl(&dword_215E92000, v8, OS_LOG_TYPE_DEFAULT, "%p Snapshot changed in Cluster(%@), now %@", buf, 0x20u);
        }

        objc_msgSend(*(id *)(a1 + 32), "_updateSnapshots:inCluster:", *(_QWORD *)(a1 + 48), v7);
      }
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v11, v21, 16);
    }
    while (v4);
  }

}

- (void)_updateSnapshots:(id)a3 inCluster:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  int v13;
  CORoleService *v14;
  __int16 v15;
  id v16;
  __int16 v17;
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  COCoreLogForCategory(4);
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v13 = 134218498;
    v14 = self;
    v15 = 2112;
    v16 = v7;
    v17 = 2112;
    v18 = v6;
    _os_log_impl(&dword_215E92000, v8, OS_LOG_TYPE_DEFAULT, "%p will process snapshot update for Cluster(%@) to Snapshots(%@)", (uint8_t *)&v13, 0x20u);
  }

  -[CORoleService _snapshotsForCluster:](self, "_snapshotsForCluster:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[CORoleService snapshotState](self, "snapshotState");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_msgSend(v10, "mutableCopy");

  if (v6)
  {
    objc_msgSend(v11, "setObject:forKey:", v6, v7);
  }
  else
  {
    COCoreLogForCategory(4);
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      v13 = 134218242;
      v14 = self;
      v15 = 2112;
      v16 = v7;
      _os_log_impl(&dword_215E92000, v12, OS_LOG_TYPE_DEFAULT, "%p removing snaphots for Cluster(%@)", (uint8_t *)&v13, 0x16u);
    }

    objc_msgSend(v11, "removeObjectForKey:", v7);
    objc_msgSend(MEMORY[0x24BDBCF20], "set");
    v6 = (id)objc_claimAutoreleasedReturnValue();
  }
  -[CORoleService setSnapshotState:](self, "setSnapshotState:", v11);
  -[CORoleService _notifySnapshotObserversSnapshotOfCluster:didChangeTo:](self, "_notifySnapshotObserversSnapshotOfCluster:didChangeTo:", v7, v6);
  -[CORoleService _identifyAndNotifyMemberChangesFromSnapshot:inCluster:](self, "_identifyAndNotifyMemberChangesFromSnapshot:inCluster:", v9, v7);
  -[CORoleService _identifyAndNotifyRoleChangesFromSnapshot:inCluster:](self, "_identifyAndNotifyRoleChangesFromSnapshot:inCluster:", v9, v7);

}

- (void)_identifyAndNotifyRoleChangesFromSnapshot:(id)a3 inCluster:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  uint64_t v15;
  void *v16;
  void *v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  -[CORoleService roleObservers](self, "roleObservers");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKey:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v20 = 0u;
  v21 = 0u;
  v18 = 0u;
  v19 = 0u;
  v10 = v9;
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v19;
    do
    {
      for (i = 0; i != v12; ++i)
      {
        if (*(_QWORD *)v19 != v13)
          objc_enumerationMutation(v10);
        v15 = *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * i);
        -[CORoleService _roleOfMember:inSnapshots:](self, "_roleOfMember:inSnapshots:", v15, v6, (_QWORD)v18);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        -[CORoleService _roleOfMember:inCluster:](self, "_roleOfMember:inCluster:", v15, v7);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        if ((objc_msgSend(v17, "isEqual:", v16) & 1) == 0)
          -[CORoleService _notifyRoleObserversRoleOfMember:inCluster:didChangeTo:](self, "_notifyRoleObserversRoleOfMember:inCluster:didChangeTo:", v15, v7, v17);

      }
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    }
    while (v12);
  }

}

- (void)_identifyAndNotifyMemberChangesFromSnapshot:(id)a3 inCluster:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  uint64_t v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  void *v24;
  id v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  id v32;
  CORoleService *v33;
  id v34;
  uint64_t v35;
  id obj;
  uint64_t v37;
  void *v38;
  uint64_t v39;
  __int128 v40;
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
  _BYTE v52[128];
  _BYTE v53[128];
  _BYTE v54[128];
  uint64_t v55;

  v55 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  -[CORoleService memberObservers](self, "memberObservers");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKey:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v50 = 0u;
  v51 = 0u;
  v48 = 0u;
  v49 = 0u;
  obj = v9;
  v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v48, v54, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v49;
    v33 = self;
    v34 = v6;
    v31 = *(_QWORD *)v49;
    v32 = v7;
    do
    {
      v13 = 0;
      v35 = v11;
      do
      {
        if (*(_QWORD *)v49 != v12)
          objc_enumerationMutation(obj);
        v14 = *(_QWORD *)(*((_QWORD *)&v48 + 1) + 8 * v13);
        -[CORoleService _membersWithRole:inSnapshots:](self, "_membersWithRole:inSnapshots:", v14, v6);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        -[CORoleService _membersWithRole:inCluster:](self, "_membersWithRole:inCluster:", v14, v7);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = objc_msgSend(v15, "count");
        if (v17 != objc_msgSend(v16, "count"))
          goto LABEL_25;
        v39 = v14;
        v46 = 0u;
        v47 = 0u;
        v44 = 0u;
        v45 = 0u;
        v18 = v15;
        v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v44, v53, 16);
        if (v19)
        {
          v20 = v19;
          v37 = v13;
          v38 = v15;
          v21 = *(_QWORD *)v45;
          while (1)
          {
            v22 = 0;
LABEL_10:
            if (*(_QWORD *)v45 != v21)
              objc_enumerationMutation(v18);
            v23 = v18;
            v24 = *(void **)(*((_QWORD *)&v44 + 1) + 8 * v22);
            v40 = 0u;
            v41 = 0u;
            v42 = 0u;
            v43 = 0u;
            v25 = v16;
            v26 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v40, v52, 16);
            if (!v26)
              break;
            v27 = v26;
            v28 = *(_QWORD *)v41;
LABEL_14:
            v29 = 0;
            while (1)
            {
              if (*(_QWORD *)v41 != v28)
                objc_enumerationMutation(v25);
              if ((objc_msgSend(v24, "isSameDeviceAsMember:", *(_QWORD *)(*((_QWORD *)&v40 + 1) + 8 * v29)) & 1) != 0)
                break;
              if (v27 == ++v29)
              {
                v27 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v40, v52, 16);
                if (v27)
                  goto LABEL_14;
                goto LABEL_24;
              }
            }

            ++v22;
            v18 = v23;
            if (v22 != v20)
              goto LABEL_10;
            v20 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v44, v53, 16);
            if (!v20)
            {

              self = v33;
              v6 = v34;
              v12 = v31;
              v7 = v32;
              v11 = v35;
              v13 = v37;
              v15 = v38;
              goto LABEL_26;
            }
          }
LABEL_24:

          self = v33;
          v6 = v34;
          v12 = v31;
          v7 = v32;
          v11 = v35;
          v15 = v38;
          v14 = v39;
          v13 = v37;
LABEL_25:
          -[CORoleService _notifyMemberObserversMembersWithRole:inCluster:didChangeTo:](self, "_notifyMemberObserversMembersWithRole:inCluster:didChangeTo:", v14, v7, v16);
          goto LABEL_26;
        }

LABEL_26:
        ++v13;
      }
      while (v13 != v11);
      v30 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v48, v54, 16);
      v11 = v30;
    }
    while (v30);
  }

}

- (id)_roleOfMember:(id)a3 inCluster:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  NSObject *v12;
  int v14;
  CORoleService *v15;
  __int16 v16;
  id v17;
  __int16 v18;
  id v19;
  __int16 v20;
  void *v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  -[CORoleService _snapshotsForCluster:](self, "_snapshotsForCluster:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[CORoleService _roleOfMember:inSnapshots:](self, "_roleOfMember:inSnapshots:", v6, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v9, "isUnknown")
    && +[CODeviceClass isAudioAccessory](CODeviceClass, "isAudioAccessory"))
  {
    objc_msgSend(MEMORY[0x24BE19DF0], "pairCluster");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v7, "isEqual:", v10))
    {
      v11 = objc_msgSend(objc_alloc(MEMORY[0x24BE19E18]), "initWithRoleFlags:", 1);

      v9 = (void *)v11;
    }

  }
  COCoreLogForCategory(4);
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
  {
    v14 = 134218754;
    v15 = self;
    v16 = 2112;
    v17 = v6;
    v18 = 2112;
    v19 = v7;
    v20 = 2112;
    v21 = v9;
    _os_log_debug_impl(&dword_215E92000, v12, OS_LOG_TYPE_DEBUG, "%p Member(%@) in Cluster(%@) has Role(%@)", (uint8_t *)&v14, 0x2Au);
  }

  return v9;
}

- (id)_roleOfMember:(id)a3 inSnapshots:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  char v14;
  void *v15;
  NSObject *v16;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  uint8_t buf[4];
  CORoleService *v23;
  __int16 v24;
  void *v25;
  __int16 v26;
  id v27;
  __int16 v28;
  id v29;
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v7 = a4;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v18, v30, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v19;
LABEL_3:
    v11 = 0;
    while (1)
    {
      if (*(_QWORD *)v19 != v10)
        objc_enumerationMutation(v7);
      v12 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * v11);
      objc_msgSend(v12, "member", (_QWORD)v18);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = objc_msgSend(v13, "isSameDeviceAsMember:", v6);

      if ((v14 & 1) != 0)
        break;
      if (v9 == ++v11)
      {
        v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v18, v30, 16);
        if (v9)
          goto LABEL_3;
        goto LABEL_9;
      }
    }
    objc_msgSend(v12, "role");
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    if (v15)
      goto LABEL_14;
  }
  else
  {
LABEL_9:

  }
  objc_msgSend(MEMORY[0x24BE19E18], "roleForUnknown", (_QWORD)v18);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  COCoreLogForCategory(4);
  v16 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 134218754;
    v23 = self;
    v24 = 2112;
    v25 = v15;
    v26 = 2112;
    v27 = v6;
    v28 = 2112;
    v29 = v7;
    _os_log_error_impl(&dword_215E92000, v16, OS_LOG_TYPE_ERROR, "%p synthesized Role(%@) for Member(%@) missing from Snapshots(%@)", buf, 0x2Au);
  }

LABEL_14:
  return v15;
}

- (id)_membersWithRole:(id)a3 inCluster:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  NSObject *v10;
  int v12;
  CORoleService *v13;
  __int16 v14;
  id v15;
  __int16 v16;
  void *v17;
  __int16 v18;
  id v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  -[CORoleService _snapshotsForCluster:](self, "_snapshotsForCluster:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[CORoleService _membersWithRole:inSnapshots:](self, "_membersWithRole:inSnapshots:", v6, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  COCoreLogForCategory(4);
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    v12 = 134218754;
    v13 = self;
    v14 = 2112;
    v15 = v6;
    v16 = 2112;
    v17 = v9;
    v18 = 2112;
    v19 = v7;
    _os_log_debug_impl(&dword_215E92000, v10, OS_LOG_TYPE_DEBUG, "%p Role(%@) is associated with Members(%@) in Cluster(%@)", (uint8_t *)&v12, 0x2Au);
  }

  return v9;
}

- (id)_membersWithRole:(id)a3 inSnapshots:(id)a4
{
  id v5;
  id v6;
  id v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  void *v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v6 = a4;
  v7 = objc_alloc_init(MEMORY[0x24BDBCEF0]);
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v8 = v6;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v18;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v18 != v11)
          objc_enumerationMutation(v8);
        v13 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * i);
        objc_msgSend(v13, "role", (_QWORD)v17);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v14, "satisfiesRole:", v5))
        {
          objc_msgSend(v13, "member");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v7, "addObject:", v15);

        }
      }
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v10);
  }

  return v7;
}

- (id)_snapshotsForCluster:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[CORoleService snapshotState](self, "snapshotState");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6)
  {
    objc_msgSend(MEMORY[0x24BDBCF20], "set");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v6;
}

- (void)_notifyRoleObserversRoleOfMember:(id)a3 inCluster:(id)a4 didChangeTo:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  -[CORoleService roleObservers](self, "roleObservers");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "objectForKey:", v9);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v12, "objectForKey:", v8);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v14)
  {
    v15 = v14;
    v16 = *(_QWORD *)v19;
    do
    {
      v17 = 0;
      do
      {
        if (*(_QWORD *)v19 != v16)
          objc_enumerationMutation(v13);
        -[CORoleService _notifyRoleObserver:roleOfMember:inCluster:didChangeTo:](self, "_notifyRoleObserver:roleOfMember:inCluster:didChangeTo:", *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * v17++), v8, v9, v10);
      }
      while (v15 != v17);
      v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    }
    while (v15);
  }

}

- (void)_notifyMemberObserversMembersWithRole:(id)a3 inCluster:(id)a4 didChangeTo:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  -[CORoleService memberObservers](self, "memberObservers");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "objectForKey:", v9);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v12, "objectForKey:", v8);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v14)
  {
    v15 = v14;
    v16 = *(_QWORD *)v19;
    do
    {
      v17 = 0;
      do
      {
        if (*(_QWORD *)v19 != v16)
          objc_enumerationMutation(v13);
        -[CORoleService _notifyMemberObserver:membersWithRole:inCluster:didChangeTo:](self, "_notifyMemberObserver:membersWithRole:inCluster:didChangeTo:", *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * v17++), v8, v9, v10);
      }
      while (v15 != v17);
      v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    }
    while (v15);
  }

}

- (void)_notifySnapshotObserversSnapshotOfCluster:(id)a3 didChangeTo:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  -[CORoleService snapshotObservers](self, "snapshotObservers");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKey:", v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v17 = 0u;
  v18 = 0u;
  v15 = 0u;
  v16 = 0u;
  v10 = v9;
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v16;
    do
    {
      v14 = 0;
      do
      {
        if (*(_QWORD *)v16 != v13)
          objc_enumerationMutation(v10);
        -[CORoleService _notifySnapshotObserver:snapshotOfCluster:didChangeTo:](self, "_notifySnapshotObserver:snapshotOfCluster:didChangeTo:", *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * v14++), v6, v7, (_QWORD)v15);
      }
      while (v12 != v14);
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v12);
  }

}

- (void)_notifyRoleObserver:(id)a3 roleOfMember:(id)a4 inCluster:(id)a5 didChangeTo:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  void *v15;
  NSObject *v16;
  uint64_t v17;
  uint64_t v18;
  void (*v19)(uint64_t, void *);
  void *v20;
  CORoleService *v21;
  id v22;
  uint8_t buf[4];
  CORoleService *v24;
  __int16 v25;
  id v26;
  __int16 v27;
  id v28;
  __int16 v29;
  id v30;
  __int16 v31;
  id v32;
  uint64_t v33;

  v33 = *MEMORY[0x24BDAC8D0];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v17 = MEMORY[0x24BDAC760];
  v18 = 3221225472;
  v19 = __72__CORoleService__notifyRoleObserver_roleOfMember_inCluster_didChangeTo___block_invoke;
  v20 = &unk_24D4B1CB0;
  v21 = self;
  v14 = v10;
  v22 = v14;
  -[CORoleService _remoteInterfaceForClient:withErrorHandler:](self, "_remoteInterfaceForClient:withErrorHandler:", v14, &v17);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  COCoreLogForCategory(4);
  v16 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134219010;
    v24 = self;
    v25 = 2112;
    v26 = v14;
    v27 = 2112;
    v28 = v13;
    v29 = 2112;
    v30 = v11;
    v31 = 2112;
    v32 = v12;
    _os_log_impl(&dword_215E92000, v16, OS_LOG_TYPE_DEFAULT, "%p change notification to Client(%@) for Role(%@) of Member(%@) in Cluster(%@)", buf, 0x34u);
  }

  objc_msgSend(v15, "roleOfMember:inCluster:didChangeTo:", v11, v12, v13, v17, v18, v19, v20, v21);
}

void __72__CORoleService__notifyRoleObserver_roleOfMember_inCluster_didChangeTo___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;

  v2 = a2;
  COCoreLogForCategory(4);
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    __72__CORoleService__notifyRoleObserver_roleOfMember_inCluster_didChangeTo___block_invoke_cold_1();

}

- (void)_notifyMemberObserver:(id)a3 membersWithRole:(id)a4 inCluster:(id)a5 didChangeTo:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  void *v15;
  NSObject *v16;
  uint64_t v17;
  uint64_t v18;
  void (*v19)(uint64_t, void *);
  void *v20;
  CORoleService *v21;
  id v22;
  uint8_t buf[4];
  CORoleService *v24;
  __int16 v25;
  id v26;
  __int16 v27;
  id v28;
  __int16 v29;
  id v30;
  __int16 v31;
  id v32;
  uint64_t v33;

  v33 = *MEMORY[0x24BDAC8D0];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v17 = MEMORY[0x24BDAC760];
  v18 = 3221225472;
  v19 = __77__CORoleService__notifyMemberObserver_membersWithRole_inCluster_didChangeTo___block_invoke;
  v20 = &unk_24D4B1CB0;
  v21 = self;
  v14 = v10;
  v22 = v14;
  -[CORoleService _remoteInterfaceForClient:withErrorHandler:](self, "_remoteInterfaceForClient:withErrorHandler:", v14, &v17);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  COCoreLogForCategory(4);
  v16 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134219010;
    v24 = self;
    v25 = 2112;
    v26 = v14;
    v27 = 2112;
    v28 = v13;
    v29 = 2112;
    v30 = v11;
    v31 = 2112;
    v32 = v12;
    _os_log_impl(&dword_215E92000, v16, OS_LOG_TYPE_DEFAULT, "%p change notification to Client(%@) for Members(%@) with Role(%@) in Cluster(%@)", buf, 0x34u);
  }

  objc_msgSend(v15, "membersWithRole:inCluster:didChangeTo:", v11, v12, v13, v17, v18, v19, v20, v21);
}

void __77__CORoleService__notifyMemberObserver_membersWithRole_inCluster_didChangeTo___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;

  v2 = a2;
  COCoreLogForCategory(4);
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    __77__CORoleService__notifyMemberObserver_membersWithRole_inCluster_didChangeTo___block_invoke_cold_1();

}

- (void)_notifySnapshotObserver:(id)a3 snapshotOfCluster:(id)a4 didChangeTo:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  void *v12;
  NSObject *v13;
  uint64_t v14;
  uint64_t v15;
  void (*v16)(uint64_t, void *);
  void *v17;
  CORoleService *v18;
  id v19;
  uint8_t buf[4];
  CORoleService *v21;
  __int16 v22;
  id v23;
  __int16 v24;
  id v25;
  __int16 v26;
  id v27;
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  v14 = MEMORY[0x24BDAC760];
  v15 = 3221225472;
  v16 = __71__CORoleService__notifySnapshotObserver_snapshotOfCluster_didChangeTo___block_invoke;
  v17 = &unk_24D4B1CB0;
  v18 = self;
  v11 = v8;
  v19 = v11;
  -[CORoleService _remoteInterfaceForClient:withErrorHandler:](self, "_remoteInterfaceForClient:withErrorHandler:", v11, &v14);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  COCoreLogForCategory(4);
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134218754;
    v21 = self;
    v22 = 2112;
    v23 = v11;
    v24 = 2112;
    v25 = v10;
    v26 = 2112;
    v27 = v9;
    _os_log_impl(&dword_215E92000, v13, OS_LOG_TYPE_DEFAULT, "%p change notification to Client(%@) for Snapshots(%@) in Cluster(%@)", buf, 0x2Au);
  }

  objc_msgSend(v12, "snapshotOfCluster:didChangeTo:", v9, v10, v14, v15, v16, v17, v18);
}

void __71__CORoleService__notifySnapshotObserver_snapshotOfCluster_didChangeTo___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;

  v2 = a2;
  COCoreLogForCategory(4);
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    __71__CORoleService__notifySnapshotObserver_snapshotOfCluster_didChangeTo___block_invoke_cold_1();

}

- (void)_addRoleObserverForClient:(id)a3 ofMember:(id)a4 inCluster:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  NSObject *v18;
  int v19;
  CORoleService *v20;
  __int16 v21;
  id v22;
  __int16 v23;
  id v24;
  __int16 v25;
  id v26;
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  -[COService _takeAssertionForCluster:](self, "_takeAssertionForCluster:", v10);
  -[CORoleService roleObservers](self, "roleObservers");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)objc_msgSend(v11, "mutableCopy");

  objc_msgSend(v12, "objectForKey:", v10);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v13;
  if (v13)
  {
    v15 = (void *)objc_msgSend(v13, "mutableCopy");
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v16 = v15;
  objc_msgSend(v15, "objectForKey:", v9);
  v17 = (id)objc_claimAutoreleasedReturnValue();
  if (!v17)
    v17 = objc_alloc_init(MEMORY[0x24BDBCEF0]);
  objc_msgSend(v17, "addObject:", v8);
  objc_msgSend(v16, "setObject:forKey:", v17, v9);
  objc_msgSend(v12, "setObject:forKey:", v16, v10);
  -[CORoleService setRoleObservers:](self, "setRoleObservers:", v12);
  COCoreLogForCategory(4);
  v18 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
  {
    v19 = 134218754;
    v20 = self;
    v21 = 2112;
    v22 = v8;
    v23 = 2112;
    v24 = v9;
    v25 = 2112;
    v26 = v10;
    _os_log_debug_impl(&dword_215E92000, v18, OS_LOG_TYPE_DEBUG, "%p added client %@ role observer for %@ in %@", (uint8_t *)&v19, 0x2Au);
  }

}

- (void)_removeRoleObserverForClient:(id)a3 ofMember:(id)a4 inCluster:(id)a5
{
  id v8;
  id v9;
  void *v10;
  uint64_t i;
  uint64_t v12;
  void *v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  NSObject *v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  id obj;
  uint64_t v26;
  id v27;
  void *v28;
  CORoleService *v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  uint8_t buf[4];
  CORoleService *v39;
  __int16 v40;
  id v41;
  __int16 v42;
  id v43;
  __int16 v44;
  id v45;
  _BYTE v46[128];
  _BYTE v47[128];
  uint64_t v48;

  v48 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v27 = a5;
  v29 = self;
  -[CORoleService roleObservers](self, "roleObservers");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = (void *)objc_msgSend(v10, "mutableCopy");
  v34 = 0u;
  v35 = 0u;
  v36 = 0u;
  v37 = 0u;
  obj = v10;
  v24 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v34, v47, 16);
  if (v24)
  {
    v23 = *(_QWORD *)v35;
    do
    {
      for (i = 0; i != v24; ++i)
      {
        if (*(_QWORD *)v35 != v23)
          objc_enumerationMutation(obj);
        v12 = *(_QWORD *)(*((_QWORD *)&v34 + 1) + 8 * i);
        if (!v27 || objc_msgSend(v27, "isEqual:", *(_QWORD *)(*((_QWORD *)&v34 + 1) + 8 * i)))
        {
          v26 = i;
          objc_msgSend(obj, "objectForKey:", v12);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          v28 = (void *)objc_msgSend(v13, "mutableCopy");
          v30 = 0u;
          v31 = 0u;
          v32 = 0u;
          v33 = 0u;
          v14 = v13;
          v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v30, v46, 16);
          if (v15)
          {
            v16 = v15;
            v17 = *(_QWORD *)v31;
            do
            {
              v18 = 0;
              do
              {
                if (*(_QWORD *)v31 != v17)
                  objc_enumerationMutation(v14);
                v19 = *(_QWORD *)(*((_QWORD *)&v30 + 1) + 8 * v18);
                if (!v9
                  || objc_msgSend(v9, "isSameDeviceAsMember:", *(_QWORD *)(*((_QWORD *)&v30 + 1) + 8 * v18)))
                {
                  objc_msgSend(v14, "objectForKey:", v19);
                  v20 = (void *)objc_claimAutoreleasedReturnValue();
                  if (objc_msgSend(v20, "containsObject:", v8))
                  {
                    COCoreLogForCategory(4);
                    v21 = objc_claimAutoreleasedReturnValue();
                    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
                    {
                      *(_DWORD *)buf = 134218754;
                      v39 = v29;
                      v40 = 2112;
                      v41 = v8;
                      v42 = 2112;
                      v43 = v9;
                      v44 = 2112;
                      v45 = v27;
                      _os_log_debug_impl(&dword_215E92000, v21, OS_LOG_TYPE_DEBUG, "%p removed client %@ role observer for %@ in %@", buf, 0x2Au);
                    }

                    objc_msgSend(v20, "removeObject:", v8);
                    -[COService _releaseAssertionForCluster:](v29, "_releaseAssertionForCluster:", v12);
                    if (!objc_msgSend(v20, "count"))
                      objc_msgSend(v28, "removeObjectForKey:", v19);
                  }

                }
                ++v18;
              }
              while (v16 != v18);
              v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v30, v46, 16);
            }
            while (v16);
          }

          if (objc_msgSend(v28, "count"))
            objc_msgSend(v22, "setObject:forKey:", v28, v12);
          else
            objc_msgSend(v22, "removeObjectForKey:", v12);
          i = v26;

        }
      }
      v24 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v34, v47, 16);
    }
    while (v24);
  }

  -[CORoleService setRoleObservers:](v29, "setRoleObservers:", v22);
}

- (void)_addMemberObserverForClient:(id)a3 ofRole:(id)a4 inCluster:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  NSObject *v18;
  int v19;
  CORoleService *v20;
  __int16 v21;
  id v22;
  __int16 v23;
  id v24;
  __int16 v25;
  id v26;
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  -[COService _takeAssertionForCluster:](self, "_takeAssertionForCluster:", v10);
  -[CORoleService memberObservers](self, "memberObservers");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)objc_msgSend(v11, "mutableCopy");

  objc_msgSend(v12, "objectForKey:", v10);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v13;
  if (v13)
  {
    v15 = (void *)objc_msgSend(v13, "mutableCopy");
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v16 = v15;
  objc_msgSend(v15, "objectForKey:", v9);
  v17 = (id)objc_claimAutoreleasedReturnValue();
  if (!v17)
    v17 = objc_alloc_init(MEMORY[0x24BDBCEF0]);
  objc_msgSend(v17, "addObject:", v8);
  objc_msgSend(v16, "setObject:forKey:", v17, v9);
  objc_msgSend(v12, "setObject:forKey:", v16, v10);
  -[CORoleService setMemberObservers:](self, "setMemberObservers:", v12);
  COCoreLogForCategory(4);
  v18 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
  {
    v19 = 134218754;
    v20 = self;
    v21 = 2112;
    v22 = v8;
    v23 = 2112;
    v24 = v9;
    v25 = 2112;
    v26 = v10;
    _os_log_debug_impl(&dword_215E92000, v18, OS_LOG_TYPE_DEBUG, "%p added client %@ member observer for %@ in %@", (uint8_t *)&v19, 0x2Au);
  }

}

- (void)_removeMemberObserverForClient:(id)a3 ofRole:(id)a4 inCluster:(id)a5
{
  id v8;
  id v9;
  void *v10;
  uint64_t i;
  uint64_t v12;
  void *v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  NSObject *v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  id obj;
  uint64_t v26;
  id v27;
  void *v28;
  CORoleService *v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  uint8_t buf[4];
  CORoleService *v39;
  __int16 v40;
  id v41;
  __int16 v42;
  id v43;
  __int16 v44;
  id v45;
  _BYTE v46[128];
  _BYTE v47[128];
  uint64_t v48;

  v48 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v27 = a5;
  v29 = self;
  -[CORoleService memberObservers](self, "memberObservers");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = (void *)objc_msgSend(v10, "mutableCopy");
  v34 = 0u;
  v35 = 0u;
  v36 = 0u;
  v37 = 0u;
  obj = v10;
  v24 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v34, v47, 16);
  if (v24)
  {
    v23 = *(_QWORD *)v35;
    do
    {
      for (i = 0; i != v24; ++i)
      {
        if (*(_QWORD *)v35 != v23)
          objc_enumerationMutation(obj);
        v12 = *(_QWORD *)(*((_QWORD *)&v34 + 1) + 8 * i);
        if (!v27 || objc_msgSend(v27, "isEqual:", *(_QWORD *)(*((_QWORD *)&v34 + 1) + 8 * i)))
        {
          v26 = i;
          objc_msgSend(obj, "objectForKey:", v12);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          v28 = (void *)objc_msgSend(v13, "mutableCopy");
          v30 = 0u;
          v31 = 0u;
          v32 = 0u;
          v33 = 0u;
          v14 = v13;
          v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v30, v46, 16);
          if (v15)
          {
            v16 = v15;
            v17 = *(_QWORD *)v31;
            do
            {
              v18 = 0;
              do
              {
                if (*(_QWORD *)v31 != v17)
                  objc_enumerationMutation(v14);
                v19 = *(_QWORD *)(*((_QWORD *)&v30 + 1) + 8 * v18);
                if (!v9 || objc_msgSend(v9, "isEqual:", *(_QWORD *)(*((_QWORD *)&v30 + 1) + 8 * v18)))
                {
                  objc_msgSend(v14, "objectForKey:", v19);
                  v20 = (void *)objc_claimAutoreleasedReturnValue();
                  if (objc_msgSend(v20, "containsObject:", v8))
                  {
                    COCoreLogForCategory(4);
                    v21 = objc_claimAutoreleasedReturnValue();
                    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
                    {
                      *(_DWORD *)buf = 134218754;
                      v39 = v29;
                      v40 = 2112;
                      v41 = v8;
                      v42 = 2112;
                      v43 = v9;
                      v44 = 2112;
                      v45 = v27;
                      _os_log_debug_impl(&dword_215E92000, v21, OS_LOG_TYPE_DEBUG, "%p removed client %@ member observer for %@ in %@", buf, 0x2Au);
                    }

                    objc_msgSend(v20, "removeObject:", v8);
                    -[COService _releaseAssertionForCluster:](v29, "_releaseAssertionForCluster:", v12);
                    if (!objc_msgSend(v20, "count"))
                      objc_msgSend(v28, "removeObjectForKey:", v19);
                  }

                }
                ++v18;
              }
              while (v16 != v18);
              v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v30, v46, 16);
            }
            while (v16);
          }

          if (objc_msgSend(v28, "count"))
            objc_msgSend(v22, "setObject:forKey:", v28, v12);
          else
            objc_msgSend(v22, "removeObjectForKey:", v12);
          i = v26;

        }
      }
      v24 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v34, v47, 16);
    }
    while (v24);
  }

  -[CORoleService setMemberObservers:](v29, "setMemberObservers:", v22);
}

- (void)_addSnapshotObserverForClient:(id)a3 inCluster:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  NSObject *v12;
  int v13;
  CORoleService *v14;
  __int16 v15;
  id v16;
  __int16 v17;
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  -[COService _takeAssertionForCluster:](self, "_takeAssertionForCluster:", v7);
  -[CORoleService snapshotObservers](self, "snapshotObservers");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKey:", v7);
  v9 = (id)objc_claimAutoreleasedReturnValue();

  if (!v9)
  {
    v9 = objc_alloc_init(MEMORY[0x24BDBCEF0]);
    -[CORoleService snapshotObservers](self, "snapshotObservers");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (void *)objc_msgSend(v10, "mutableCopy");

    objc_msgSend(v11, "setObject:forKey:", v9, v7);
    -[CORoleService setSnapshotObservers:](self, "setSnapshotObservers:", v11);

  }
  objc_msgSend(v9, "addObject:", v6);
  COCoreLogForCategory(4);
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
  {
    v13 = 134218498;
    v14 = self;
    v15 = 2112;
    v16 = v6;
    v17 = 2112;
    v18 = v7;
    _os_log_debug_impl(&dword_215E92000, v12, OS_LOG_TYPE_DEBUG, "%p added client %@ snapshot observer in %@", (uint8_t *)&v13, 0x20u);
  }

}

- (void)_removeSnapshotObserverForClient:(id)a3 inCluster:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  uint64_t v10;
  __int128 v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  NSObject *v17;
  __int128 v18;
  void *v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  uint8_t buf[4];
  CORoleService *v25;
  __int16 v26;
  id v27;
  __int16 v28;
  id v29;
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  -[CORoleService snapshotObservers](self, "snapshotObservers");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = (void *)objc_msgSend(v8, "mutableCopy");
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v9 = v8;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v20, v30, 16);
  if (v10)
  {
    v12 = v10;
    v13 = *(_QWORD *)v21;
    *(_QWORD *)&v11 = 134218498;
    v18 = v11;
    do
    {
      v14 = 0;
      do
      {
        if (*(_QWORD *)v21 != v13)
          objc_enumerationMutation(v9);
        v15 = *(_QWORD *)(*((_QWORD *)&v20 + 1) + 8 * v14);
        if (!v7 || objc_msgSend(v7, "isEqual:", *(_QWORD *)(*((_QWORD *)&v20 + 1) + 8 * v14)))
        {
          objc_msgSend(v9, "objectForKey:", v15, v18);
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v16, "containsObject:", v6))
          {
            COCoreLogForCategory(4);
            v17 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)buf = v18;
              v25 = self;
              v26 = 2112;
              v27 = v6;
              v28 = 2112;
              v29 = v7;
              _os_log_debug_impl(&dword_215E92000, v17, OS_LOG_TYPE_DEBUG, "%p removed client %@ snapshot observer in %@", buf, 0x20u);
            }

            objc_msgSend(v16, "removeObject:", v6);
            -[COService _releaseAssertionForCluster:](self, "_releaseAssertionForCluster:", v15);
            if (!objc_msgSend(v16, "count"))
              objc_msgSend(v19, "removeObjectForKey:", v15);
          }

        }
        ++v14;
      }
      while (v12 != v14);
      v12 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v20, v30, 16);
    }
    while (v12);
  }

  -[CORoleService setSnapshotObservers:](self, "setSnapshotObservers:", v19);
}

- (id)_remoteInterfaceForClient:(id)a3 withErrorHandler:(id)a4
{
  id v5;
  void *v6;
  void *v7;

  v5 = a4;
  objc_msgSend(a3, "connection");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "remoteObjectProxyWithErrorHandler:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (NSDictionary)snapshotState
{
  return self->_snapshotState;
}

- (void)setSnapshotState:(id)a3
{
  objc_storeStrong((id *)&self->_snapshotState, a3);
}

- (NSDictionary)roleObservers
{
  return self->_roleObservers;
}

- (void)setRoleObservers:(id)a3
{
  objc_storeStrong((id *)&self->_roleObservers, a3);
}

- (NSDictionary)memberObservers
{
  return self->_memberObservers;
}

- (void)setMemberObservers:(id)a3
{
  objc_storeStrong((id *)&self->_memberObservers, a3);
}

- (NSDictionary)snapshotObservers
{
  return self->_snapshotObservers;
}

- (void)setSnapshotObservers:(id)a3
{
  objc_storeStrong((id *)&self->_snapshotObservers, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_snapshotObservers, 0);
  objc_storeStrong((id *)&self->_memberObservers, 0);
  objc_storeStrong((id *)&self->_roleObservers, 0);
  objc_storeStrong((id *)&self->_snapshotState, 0);
}

void __72__CORoleService__notifyRoleObserver_roleOfMember_inCluster_didChangeTo___block_invoke_cold_1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_18_0();
  OUTLINED_FUNCTION_1_7(&dword_215E92000, v0, v1, "%p -> %@ remote Role failed: %@");
  OUTLINED_FUNCTION_6_1();
}

void __77__CORoleService__notifyMemberObserver_membersWithRole_inCluster_didChangeTo___block_invoke_cold_1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_18_0();
  OUTLINED_FUNCTION_1_7(&dword_215E92000, v0, v1, "%p -> %@ remote Member failed: %@");
  OUTLINED_FUNCTION_6_1();
}

void __71__CORoleService__notifySnapshotObserver_snapshotOfCluster_didChangeTo___block_invoke_cold_1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_18_0();
  OUTLINED_FUNCTION_1_7(&dword_215E92000, v0, v1, "%p -> %@ remote snapshot failed: %@");
  OUTLINED_FUNCTION_6_1();
}

@end
