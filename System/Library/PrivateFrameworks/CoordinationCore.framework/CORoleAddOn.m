@implementation CORoleAddOn

- (CORoleAddOn)init
{
  CORoleAddOn *v2;
  CORoleAddOn *v3;
  CORoleDefaultsMonitor *defaultsMonitor;
  void *v5;
  void *v6;
  uint64_t v7;
  COClusterMemberRoleSnapshot *currentDeviceSnapshot;
  uint64_t v9;
  NSSet *nodeCache;
  NSObject *v11;
  dispatch_queue_t v12;
  OS_dispatch_queue *delegateQueue;
  objc_super v15;

  v15.receiver = self;
  v15.super_class = (Class)CORoleAddOn;
  v2 = -[COMeshAddOn init](&v15, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_lock._os_unfair_lock_opaque = 0;
    defaultsMonitor = v2->_defaultsMonitor;
    v2->_defaultsMonitor = 0;

    -[CORoleAddOn _memberForCurrentDevice](v3, "_memberForCurrentDevice");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BE19E18], "roleForUnknown");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(objc_alloc(MEMORY[0x24BE19E08]), "initWithMember:role:", v5, v6);
    currentDeviceSnapshot = v3->_currentDeviceSnapshot;
    v3->_currentDeviceSnapshot = (COClusterMemberRoleSnapshot *)v7;

    objc_msgSend(MEMORY[0x24BDBCF20], "set");
    v9 = objc_claimAutoreleasedReturnValue();
    nodeCache = v3->_nodeCache;
    v3->_nodeCache = (NSSet *)v9;

    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v11 = objc_claimAutoreleasedReturnValue();
    v12 = dispatch_queue_create("com.apple.coordination.CORoleAddOn.delegateQueue", v11);
    delegateQueue = v3->_delegateQueue;
    v3->_delegateQueue = (OS_dispatch_queue *)v12;

    v3->_pendingChanges = 1;
    -[CORoleAddOn _notifyDelegate](v3, "_notifyDelegate");

  }
  return v3;
}

- (void)_enableForPairLegacySupport
{
  CORoleDefaultsMonitor *v3;
  CORoleDefaultsMonitor *defaultsMonitor;
  NSObject *v5;
  void *v6;
  int v7;
  CORoleAddOn *v8;
  __int16 v9;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  v3 = -[CORoleDefaultsMonitor initWithDelegate:]([CORoleDefaultsMonitor alloc], "initWithDelegate:", self);
  defaultsMonitor = self->_defaultsMonitor;
  self->_defaultsMonitor = v3;

  COCoreLogForCategory(4);
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    -[CORoleAddOn defaultsMonitor](self, "defaultsMonitor");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = 134218240;
    v8 = self;
    v9 = 2048;
    v10 = v6;
    _os_log_impl(&dword_215E92000, v5, OS_LOG_TYPE_DEFAULT, "%p add-on using monitor %p for local role in pair", (uint8_t *)&v7, 0x16u);

  }
  -[CORoleDefaultsMonitor activate](self->_defaultsMonitor, "activate");
}

- (void)meshController:(id)a3 didTransitionToState:(unint64_t)a4
{
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)CORoleAddOn;
  -[COMeshAddOn meshController:didTransitionToState:](&v6, sel_meshController_didTransitionToState_, a3);
  if (a4 == 3)
  {
    -[CORoleAddOn _updateCurrentDeviceState](self, "_updateCurrentDeviceState");
    -[CORoleAddOn _updateState](self, "_updateState");
    -[CORoleAddOn _notifyDelegate](self, "_notifyDelegate");
  }
}

- (void)didChangeNodesForMeshController:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)CORoleAddOn;
  -[COMeshAddOn didChangeNodesForMeshController:](&v4, sel_didChangeNodesForMeshController_, a3);
  -[CORoleAddOn _updateCurrentDeviceState](self, "_updateCurrentDeviceState");
  -[CORoleAddOn _updateState](self, "_updateState");
  -[CORoleAddOn _notifyDelegate](self, "_notifyDelegate");
}

- (void)meshController:(id)a3 willTransitionToState:(unint64_t)a4
{
  id v6;
  objc_super v7;

  v6 = a3;
  -[CORoleAddOn _updateCurrentDeviceState](self, "_updateCurrentDeviceState");
  v7.receiver = self;
  v7.super_class = (Class)CORoleAddOn;
  -[COMeshAddOn meshController:willTransitionToState:](&v7, sel_meshController_willTransitionToState_, v6, a4);

}

- (void)monitor:(id)a3 defaultChanged:(unint64_t)a4
{
  -[CORoleAddOn _updateCurrentDeviceState](self, "_updateCurrentDeviceState", a3, a4);
  -[CORoleAddOn _updateState](self, "_updateState");
  -[CORoleAddOn _notifyDelegate](self, "_notifyDelegate");
}

- (void)_updateState
{
  _QWORD v2[5];

  v2[0] = MEMORY[0x24BDAC760];
  v2[1] = 3221225472;
  v2[2] = __27__CORoleAddOn__updateState__block_invoke;
  v2[3] = &unk_24D4B0C80;
  v2[4] = self;
  -[CORoleAddOn _withLock:](self, "_withLock:", v2);
}

void __27__CORoleAddOn__updateState__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  char v15;
  void *v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t j;
  void *v22;
  uint64_t v23;
  void *v24;
  id obj;
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
  v2 = (void *)MEMORY[0x24BDBCF20];
  objc_msgSend(*(id *)(a1 + 32), "meshController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "nodes");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setWithArray:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v32 = 0u;
  v33 = 0u;
  v30 = 0u;
  v31 = 0u;
  obj = v5;
  v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v30, v35, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v31;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v31 != v8)
          objc_enumerationMutation(obj);
        v10 = *(void **)(*((_QWORD *)&v30 + 1) + 8 * i);
        objc_msgSend(*(id *)(a1 + 32), "_memberForNode:", v10);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(a1 + 32), "_roleForNode:", v10);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE19E08]), "initWithMember:role:", v11, v12);
        objc_msgSend(v10, "memberSnapshot");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = objc_msgSend(v13, "isEqual:", v14);

        if ((v15 & 1) == 0)
        {
          objc_msgSend(v10, "setMemberSnapshot:", v13);
          *(_BYTE *)(*(_QWORD *)(a1 + 32) + 28) = 1;
        }

      }
      v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v30, v35, 16);
    }
    while (v7);
  }

  v16 = (void *)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 56), "mutableCopy");
  objc_msgSend(v16, "minusSet:", obj);
  v28 = 0u;
  v29 = 0u;
  v26 = 0u;
  v27 = 0u;
  v17 = v16;
  v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v26, v34, 16);
  if (v18)
  {
    v19 = v18;
    v20 = *(_QWORD *)v27;
    do
    {
      for (j = 0; j != v19; ++j)
      {
        if (*(_QWORD *)v27 != v20)
          objc_enumerationMutation(v17);
        objc_msgSend(*(id *)(*((_QWORD *)&v26 + 1) + 8 * j), "memberSnapshot");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "setStale:", 1);

        *(_BYTE *)(*(_QWORD *)(a1 + 32) + 28) = 1;
      }
      v19 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v26, v34, 16);
    }
    while (v19);
  }

  v23 = *(_QWORD *)(a1 + 32);
  v24 = *(void **)(v23 + 56);
  *(_QWORD *)(v23 + 56) = obj;

}

- (void)_updateCurrentDeviceState
{
  void *v3;
  void *v4;
  id v5;
  _QWORD v6[5];
  id v7;

  -[COMeshAddOn meshController](self, "meshController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "nodeForMe");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __40__CORoleAddOn__updateCurrentDeviceState__block_invoke;
  v6[3] = &unk_24D4B0858;
  v6[4] = self;
  v7 = v4;
  v5 = v4;
  -[CORoleAddOn _withLock:](self, "_withLock:", v6);

}

void __40__CORoleAddOn__updateCurrentDeviceState__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  NSObject *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;
  int v12;
  uint64_t v13;
  __int16 v14;
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(a1 + 32), "_roleForCurrentDevice");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 48), "role");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v3, "isEqual:", v2) & 1) == 0)
  {

    goto LABEL_6;
  }
  v4 = *(void **)(a1 + 40);
  if (!v4)
  {
LABEL_9:

    goto LABEL_10;
  }
  objc_msgSend(v4, "memberSnapshot");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
  {
LABEL_6:
    COCoreLogForCategory(4);
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v7 = *(_QWORD *)(a1 + 32);
      v12 = 134218242;
      v13 = v7;
      v14 = 2112;
      v15 = v2;
      _os_log_impl(&dword_215E92000, v6, OS_LOG_TYPE_DEFAULT, "%p add-on updated local device Role(%@)", (uint8_t *)&v12, 0x16u);
    }

    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 48), "member");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE19E08]), "initWithMember:role:", v3, v2);
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 48), "setStale:", 1);
    v9 = *(_QWORD *)(a1 + 32);
    v10 = *(void **)(v9 + 48);
    *(_QWORD *)(v9 + 48) = v8;
    v11 = v8;

    *(_BYTE *)(*(_QWORD *)(a1 + 32) + 28) = 1;
    objc_msgSend(*(id *)(a1 + 40), "setMemberSnapshot:", v11);

    goto LABEL_9;
  }
LABEL_10:

}

- (id)_memberForCurrentDevice
{
  return (id)objc_msgSend(MEMORY[0x24BE19E00], "memberForCurrentDevice");
}

- (id)_memberForNode:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  v4 = a3;
  -[COMeshAddOn meshController](self, "meshController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "nodeForMe");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_msgSend(v4, "isEqual:", v6) & 1) != 0)
  {
    -[CORoleAddOn _memberForCurrentDevice](self, "_memberForCurrentDevice");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "HomeKitIdentifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v9;
    if (v9)
    {
      objc_msgSend(v9, "UUIDString");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "setObject:forKey:", v11, CFSTR("accessory"));

    }
    objc_msgSend(v4, "IDSIdentifier");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (v12)
      objc_msgSend(v8, "setObject:forKey:", v12, CFSTR("IDS"));
    v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE19E00]), "initWithType:deviceMetadata:", 3, v8);

  }
  return v7;
}

- (id)_roleForCurrentDevice
{
  void *v3;
  void *v4;
  unint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  char v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  int v14;
  void *v15;

  -[CORoleAddOn defaultsMonitor](self, "defaultsMonitor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3 && (v5 = objc_msgSend(v3, "result") - 1, v5 <= 2))
    v6 = qword_215F53008[v5];
  else
    v6 = 0;
  v7 = v6 | 0x10;
  -[COMeshAddOn meshController](self, "meshController");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "clusterOptions");

  if ((v9 & 1) != 0)
  {
    -[COMeshAddOn meshController](self, "meshController");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "me");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[COMeshAddOn meshController](self, "meshController");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "leader");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v11, "isEqual:", v13);

    if (v14)
      v7 = v6 | 0x18;
  }
  v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE19E18]), "initWithRoleFlags:", v7);

  return v15;
}

- (id)_roleForNode:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  char v12;
  void *v13;
  void *v14;
  void *v15;
  int v16;
  void *v17;

  v4 = a3;
  -[COMeshAddOn meshController](self, "meshController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "nodeForMe");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_msgSend(v4, "isEqual:", v6) & 1) != 0)
  {
    -[CORoleAddOn _roleForCurrentDevice](self, "_roleForCurrentDevice");
    v7 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (-[CORoleAddOn _isLegacyStereoPair](self, "_isLegacyStereoPair")
      && -[CORoleAddOn _isLegacyStereoPairPeer:](self, "_isLegacyStereoPairPeer:", v4))
    {
      -[COClusterMemberRoleSnapshot role](self->_currentDeviceSnapshot, "role");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v8, "flags") & 4) != 0)
        v9 = 2;
      else
        v9 = 4;

    }
    else
    {
      v9 = 0;
    }
    v10 = v9 | 0x10;
    -[COMeshAddOn meshController](self, "meshController");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "clusterOptions");

    if ((v12 & 1) != 0)
    {
      objc_msgSend(v4, "remote");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[COMeshAddOn meshController](self, "meshController");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "leader");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = objc_msgSend(v13, "isEqual:", v15);

      if (v16)
        v10 = v9 | 0x18;
    }
    v7 = objc_msgSend(objc_alloc(MEMORY[0x24BE19E18]), "initWithRoleFlags:", v10);
  }
  v17 = (void *)v7;

  return v17;
}

- (BOOL)_isLegacyStereoPair
{
  void *v2;
  BOOL v3;

  -[CORoleAddOn defaultsMonitor](self, "defaultsMonitor");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 != 0;

  return v3;
}

- (BOOL)_isLegacyStereoPairPeer:(id)a3
{
  id v4;
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
  void *v16;
  void *v17;
  char v18;
  void *v19;

  v4 = a3;
  +[COHomeKitAdapter sharedInstance](COHomeKitAdapter, "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "currentAccessory");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v6)
  {
    v7 = 0;
LABEL_7:
    v18 = 0;
    goto LABEL_10;
  }
  objc_msgSend(v5, "homeForAccessory:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v7)
    goto LABEL_7;
  objc_msgSend(v5, "mediaSystemForAccessory:inHome:", v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v8)
    goto LABEL_7;
  v9 = v8;
  objc_msgSend(v8, "uniqueIdentifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(MEMORY[0x24BE19E30], "isGlobalMessagingEnabled"))
  {
    -[COMeshAddOn meshController](self, "meshController");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "nodeManager");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "remote");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "nodeControllerForConstituent:", v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v14, "rapportTransport");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "client");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "destinationDevice");
    v17 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(v4, "client");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "destinationDevice");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
  }

  objc_msgSend(v17, "mediaSystemIdentifier");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend(v10, "isEqual:", v19);

LABEL_10:
  return v18;
}

- (CORoleAddOnDelegate)delegate
{
  id v2;
  _QWORD v4[6];
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t (*v8)(uint64_t, uint64_t);
  void (*v9)(uint64_t);
  id v10;

  v5 = 0;
  v6 = &v5;
  v7 = 0x3032000000;
  v8 = __Block_byref_object_copy__20;
  v9 = __Block_byref_object_dispose__20;
  v10 = 0;
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __23__CORoleAddOn_delegate__block_invoke;
  v4[3] = &unk_24D4B07E0;
  v4[4] = self;
  v4[5] = &v5;
  -[CORoleAddOn _withLock:](self, "_withLock:", v4);
  v2 = (id)v6[5];
  _Block_object_dispose(&v5, 8);

  return (CORoleAddOnDelegate *)v2;
}

void __23__CORoleAddOn_delegate__block_invoke(uint64_t a1)
{
  id WeakRetained;
  uint64_t v3;
  void *v4;

  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 32));
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = WeakRetained;

}

- (void)setDelegate:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;
  CORoleAddOn *v8;

  v4 = a3;
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __27__CORoleAddOn_setDelegate___block_invoke;
  v6[3] = &unk_24D4B0858;
  v7 = v4;
  v8 = self;
  v5 = v4;
  -[CORoleAddOn _withLock:](self, "_withLock:", v6);
  -[CORoleAddOn _notifyDelegate](self, "_notifyDelegate");

}

void __27__CORoleAddOn_setDelegate___block_invoke(uint64_t a1)
{
  void *v2;
  id WeakRetained;

  v2 = *(void **)(a1 + 32);
  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 40) + 32));
  LOBYTE(v2) = objc_msgSend(v2, "isEqual:", WeakRetained);

  if ((v2 & 1) == 0)
  {
    objc_storeWeak((id *)(*(_QWORD *)(a1 + 40) + 32), *(id *)(a1 + 32));
    if (*(_QWORD *)(a1 + 32))
      *(_BYTE *)(*(_QWORD *)(a1 + 40) + 28) = 1;
  }
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

- (void)_notifyDelegate
{
  _QWORD v2[5];

  v2[0] = MEMORY[0x24BDAC760];
  v2[1] = 3221225472;
  v2[2] = __30__CORoleAddOn__notifyDelegate__block_invoke;
  v2[3] = &unk_24D4B0C80;
  v2[4] = self;
  -[CORoleAddOn _withLock:](self, "_withLock:", v2);
}

void __30__CORoleAddOn__notifyDelegate__block_invoke(uint64_t a1)
{
  uint64_t v1;
  id v3;
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  NSObject *v10;
  id v11;
  uint64_t v12;
  id v13;
  _QWORD block[4];
  id v15;
  uint64_t v16;
  id v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  id to;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v1 = *(_QWORD *)(a1 + 32);
  if (*(_BYTE *)(v1 + 28))
  {
    objc_copyWeak(&to, (id *)(v1 + 32));
    v3 = objc_loadWeakRetained(&to);
    if (v3)
    {
      v4 = objc_alloc_init(MEMORY[0x24BDBCEF0]);
      objc_msgSend(v4, "addObject:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 48));
      v20 = 0u;
      v21 = 0u;
      v18 = 0u;
      v19 = 0u;
      v5 = *(id *)(*(_QWORD *)(a1 + 32) + 56);
      v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v18, v23, 16);
      if (v6)
      {
        v7 = *(_QWORD *)v19;
        do
        {
          v8 = 0;
          do
          {
            if (*(_QWORD *)v19 != v7)
              objc_enumerationMutation(v5);
            objc_msgSend(*(id *)(*((_QWORD *)&v18 + 1) + 8 * v8), "memberSnapshot");
            v9 = (void *)objc_claimAutoreleasedReturnValue();
            if (v9)
              objc_msgSend(v4, "addObject:", v9);

            ++v8;
          }
          while (v6 != v8);
          v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v18, v23, 16);
        }
        while (v6);
      }

      *(_BYTE *)(*(_QWORD *)(a1 + 32) + 28) = 0;
      v10 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 64);
      block[0] = MEMORY[0x24BDAC760];
      block[1] = 3221225472;
      block[2] = __30__CORoleAddOn__notifyDelegate__block_invoke_2;
      block[3] = &unk_24D4B08D0;
      v11 = v3;
      v12 = *(_QWORD *)(a1 + 32);
      v15 = v11;
      v16 = v12;
      v17 = v4;
      v13 = v4;
      dispatch_async(v10, block);

    }
    objc_destroyWeak(&to);
  }
}

uint64_t __30__CORoleAddOn__notifyDelegate__block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "addOn:stateChanged:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

- (CORoleDefaultsMonitor)defaultsMonitor
{
  return self->_defaultsMonitor;
}

- (COClusterMemberRoleSnapshot)currentDeviceSnapshot
{
  return self->_currentDeviceSnapshot;
}

- (void)setCurrentDeviceSnapshot:(id)a3
{
  objc_storeStrong((id *)&self->_currentDeviceSnapshot, a3);
}

- (NSSet)nodeCache
{
  return self->_nodeCache;
}

- (void)setNodeCache:(id)a3
{
  objc_storeStrong((id *)&self->_nodeCache, a3);
}

- (BOOL)havePendingChanges
{
  return self->_pendingChanges;
}

- (void)setPendingChanges:(BOOL)a3
{
  self->_pendingChanges = a3;
}

- (OS_dispatch_queue)delegateQueue
{
  return self->_delegateQueue;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_delegateQueue, 0);
  objc_storeStrong((id *)&self->_nodeCache, 0);
  objc_storeStrong((id *)&self->_currentDeviceSnapshot, 0);
  objc_storeStrong((id *)&self->_defaultsMonitor, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
