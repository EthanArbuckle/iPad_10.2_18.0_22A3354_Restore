@implementation MRConcreteEndpoint

- (MRConcreteEndpoint)initWithDesignatedGroupLeader:(id)a3 outputDevices:(id)a4 preferredSuffix:(id)a5
{
  id v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  char v14;
  uint64_t v15;
  void *v16;
  void *v17;
  MRConcreteEndpoint *v18;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  objc_msgSend(v9, "primaryID");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (void *)MRMediaRemoteCopyDeviceUID();
  v14 = objc_msgSend(v12, "isEqualToString:", v13);

  if ((v14 & 1) != 0)
  {
    v15 = 6;
  }
  else if ((objc_msgSend(v9, "supportsMultiplayer") & 1) != 0)
  {
    v15 = 5;
  }
  else if ((objc_msgSend(v9, "isRemoteControllable") & 1) != 0)
  {
    v15 = 2;
  }
  else if ((objc_msgSend(v9, "canRelayCommunicationChannel") & 1) != 0)
  {
    v15 = 3;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "uid");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MRConcreteEndpoint.m"), 41, CFSTR("Unknown connection type for endpoint with leader: %@, devices: %@"), v17, v10);

    v15 = 0;
  }
  v18 = -[MRConcreteEndpoint initWithDesignatedGroupLeader:outputDevices:preferredSuffix:connectionType:](self, "initWithDesignatedGroupLeader:outputDevices:preferredSuffix:connectionType:", v9, v10, v11, v15);

  return v18;
}

- (MRConcreteEndpoint)initWithDesignatedGroupLeader:(id)a3 outputDevices:(id)a4 preferredSuffix:(id)a5 connectionType:(int64_t)a6
{
  id v12;
  id v13;
  id v14;
  MRConcreteEndpoint *v15;
  void *v16;
  objc_class *v17;
  const char *Name;
  NSObject *v19;
  dispatch_queue_t v20;
  OS_dispatch_queue *serialQueue;
  uint64_t v22;
  NSArray *outputDevices;
  void *v24;
  void *v25;
  void *v26;
  id v27;
  uint64_t connectionType;
  void *v29;
  uint64_t v30;
  NSString *uniqueIdentifier;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  objc_super v40;

  v12 = a3;
  v13 = a4;
  v14 = a5;
  v40.receiver = self;
  v40.super_class = (Class)MRConcreteEndpoint;
  v15 = -[MRAVEndpoint _init](&v40, sel__init);
  if (!v15)
    goto LABEL_15;
  v16 = (void *)objc_opt_class();
  if (!objc_msgSend(v16, "isEqual:", objc_opt_class()) || objc_msgSend(v13, "count"))
  {
    if (v12)
      goto LABEL_5;
LABEL_17:
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "handleFailureInMethod:object:file:lineNumber:description:", a2, v15, CFSTR("MRConcreteEndpoint.m"), 55, CFSTR("Attempted to initialize an endpoint without a group leader"));

    if (a6)
      goto LABEL_6;
LABEL_18:
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "primaryID");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "handleFailureInMethod:object:file:lineNumber:description:", a2, v15, CFSTR("MRConcreteEndpoint.m"), 56, CFSTR("Unknown connection type for endpoint with leader: %@, devices: %@"), v39, v13);

    goto LABEL_6;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "handleFailureInMethod:object:file:lineNumber:description:", a2, v15, CFSTR("MRConcreteEndpoint.m"), 54, CFSTR("Attempted to initialize an endpoint with an empty array of output devices"));

  if (!v12)
    goto LABEL_17;
LABEL_5:
  if (!a6)
    goto LABEL_18;
LABEL_6:
  v17 = (objc_class *)objc_opt_class();
  Name = class_getName(v17);
  dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v19 = objc_claimAutoreleasedReturnValue();
  v20 = dispatch_queue_create(Name, v19);
  serialQueue = v15->_serialQueue;
  v15->_serialQueue = (OS_dispatch_queue *)v20;

  v22 = objc_msgSend(v13, "copy");
  outputDevices = v15->_outputDevices;
  v15->_outputDevices = (NSArray *)v22;

  objc_storeStrong((id *)&v15->_designatedGroupLeader, a3);
  v15->_connectionType = a6;
  if (a6 == 5)
  {
    objc_msgSend(v13, "firstObject");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "groupID");
    v25 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(v12, "groupID");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
  }
  if (v14)
    v26 = v14;
  else
    v26 = v25;
  v27 = v26;
  connectionType = v15->_connectionType;
  objc_msgSend(v12, "primaryID");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  MRAVEndpointCreateUniqueIdentifier(connectionType, v29, v27);
  v30 = objc_claimAutoreleasedReturnValue();
  uniqueIdentifier = v15->_uniqueIdentifier;
  v15->_uniqueIdentifier = (NSString *)v30;

  if (!-[NSString length](v15->_uniqueIdentifier, "length"))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromMRAVEndpointConnectionType(v15->_connectionType);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "primaryID");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "handleFailureInMethod:object:file:lineNumber:description:", a2, v15, CFSTR("MRConcreteEndpoint.m"), 71, CFSTR("Invalid endpoint with type: %@ leader UID: %@, suffix: %@"), v34, v35, v27);

  }
LABEL_15:

  return v15;
}

- (id)designatedGroupLeader
{
  return self->_designatedGroupLeader;
}

- (int64_t)connectionType
{
  return self->_connectionType;
}

- (id)uniqueIdentifier
{
  id v2;
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  uint64_t (*v7)(uint64_t, uint64_t);
  void (*v8)(uint64_t);
  id v9;

  v4 = 0;
  v5 = &v4;
  v6 = 0x3032000000;
  v7 = __Block_byref_object_copy__1;
  v8 = __Block_byref_object_dispose__1;
  v9 = 0;
  msv_dispatch_sync_on_queue();
  v2 = (id)v5[5];
  _Block_object_dispose(&v4, 8);

  return v2;
}

void __38__MRConcreteEndpoint_uniqueIdentifier__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  v2 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 56), "copy");
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (NSArray)outputDevices
{
  id v2;
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  uint64_t (*v7)(uint64_t, uint64_t);
  void (*v8)(uint64_t);
  id v9;

  v4 = 0;
  v5 = &v4;
  v6 = 0x3032000000;
  v7 = __Block_byref_object_copy__1;
  v8 = __Block_byref_object_dispose__1;
  v9 = 0;
  msv_dispatch_sync_on_queue();
  v2 = (id)v5[5];
  _Block_object_dispose(&v4, 8);

  return (NSArray *)v2;
}

void __35__MRConcreteEndpoint_outputDevices__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  v2 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 64), "copy");
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (void)setOutputDevices:(id)a3
{
  id v4;
  NSObject *serialQueue;
  id v6;
  _QWORD block[5];
  id v8;

  v4 = a3;
  serialQueue = self->_serialQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __39__MRConcreteEndpoint_setOutputDevices___block_invoke;
  block[3] = &unk_1E30C5F40;
  block[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_sync(serialQueue, block);

}

void __39__MRConcreteEndpoint_setOutputDevices___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  id v5;
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

  v15 = *MEMORY[0x1E0C80C00];
  v2 = objc_msgSend(*(id *)(a1 + 40), "copy");
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(void **)(v3 + 64);
  *(_QWORD *)(v3 + 64) = v2;

  v12 = 0u;
  v13 = 0u;
  v10 = 0u;
  v11 = 0u;
  v5 = *(id *)(*(_QWORD *)(a1 + 32) + 64);
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
        objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * v9++), "setEndpoint:", *(_QWORD *)(a1 + 32), (_QWORD)v10);
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v7);
  }

}

- (id)externalDevice
{
  id v2;
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  uint64_t (*v7)(uint64_t, uint64_t);
  void (*v8)(uint64_t);
  id v9;

  v4 = 0;
  v5 = &v4;
  v6 = 0x3032000000;
  v7 = __Block_byref_object_copy__1;
  v8 = __Block_byref_object_dispose__1;
  v9 = 0;
  msv_dispatch_sync_on_queue();
  v2 = (id)v5[5];
  _Block_object_dispose(&v4, 8);

  return v2;
}

void __36__MRConcreteEndpoint_externalDevice__block_invoke(uint64_t a1)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), *(id *)(*(_QWORD *)(a1 + 32) + 72));
}

- (void)setExternalDevice:(id)a3
{
  id v4;
  NSObject *serialQueue;
  id v6;
  _QWORD block[5];
  id v8;

  v4 = a3;
  serialQueue = self->_serialQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __40__MRConcreteEndpoint_setExternalDevice___block_invoke;
  block[3] = &unk_1E30C5F40;
  block[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_sync(serialQueue, block);

}

void __40__MRConcreteEndpoint_setExternalDevice___block_invoke(uint64_t a1)
{
  void *v1;
  uint64_t v2;
  void *v3;
  void *v5;
  id v6;

  v2 = *(_QWORD *)(a1 + 32);
  v1 = *(void **)(a1 + 40);
  v3 = *(void **)(v2 + 72);
  if (v3 != v1)
  {
    if (v3)
    {
      objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "removeObserver:name:object:", *(_QWORD *)(a1 + 32), CFSTR("kMRExternalDeviceConnectionStateDidChangeNotification"), *(_QWORD *)(*(_QWORD *)(a1 + 32) + 72));

      v2 = *(_QWORD *)(a1 + 32);
      v1 = *(void **)(a1 + 40);
    }
    objc_storeStrong((id *)(v2 + 72), v1);
    if (*(_QWORD *)(*(_QWORD *)(a1 + 32) + 72))
    {
      objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
      v6 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "addObserver:selector:name:object:", *(_QWORD *)(a1 + 32), sel__handleConnectionStateDidChangeNotification_, CFSTR("kMRExternalDeviceConnectionStateDidChangeNotification"), *(_QWORD *)(*(_QWORD *)(a1 + 32) + 72));

    }
  }
}

- (void)_handleConnectionStateDidChangeNotification:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  int v8;
  id v9;

  v4 = a3;
  objc_msgSend(v4, "userInfo");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", *MEMORY[0x1E0CB3388]);
  v9 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "userInfo");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("kMRExternalDeviceConnectionStateUserInfoKey"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "intValue");

  if (v8 == 3)
  {
    objc_msgSend((id)objc_opt_class(), "_notifyEndpointDidDisconnect:withError:", self, v9);
  }
  else if (v8 == 2)
  {
    objc_msgSend((id)objc_opt_class(), "_notifyEndpointDidConnect:", self);
  }

}

- (BOOL)isProxyGroupPlayer
{
  MRConcreteEndpoint *v2;
  void *v3;
  void *v4;
  _QWORD v6[5];

  v2 = self;
  -[MRConcreteEndpoint outputDevices](self, "outputDevices");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __40__MRConcreteEndpoint_isProxyGroupPlayer__block_invoke;
  v6[3] = &unk_1E30C5F68;
  v6[4] = v2;
  objc_msgSend(v3, "msv_firstWhere:", v6);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v2) = v4 == 0;

  return (char)v2;
}

uint64_t __40__MRConcreteEndpoint_isProxyGroupPlayer__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  objc_msgSend(v2, "designatedGroupLeader");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "uid");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v3, "containsUID:", v5);

  return v6;
}

- (BOOL)canModifyGroupMembership
{
  NSObject *serialQueue;
  char v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  char v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  serialQueue = self->_serialQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __46__MRConcreteEndpoint_canModifyGroupMembership__block_invoke;
  v5[3] = &unk_1E30C5F90;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(serialQueue, v5);
  v3 = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

void __46__MRConcreteEndpoint_canModifyGroupMembership__block_invoke(uint64_t a1)
{
  int v2;
  void *v3;
  char v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  void *v14;
  char v15;
  void *v16;
  void *v17;
  char v18;
  char v19;
  char v20;
  int v21;
  void *v22;

  v2 = objc_msgSend(*(id *)(a1 + 32), "groupContainsDiscoverableGroupLeader");
  objc_msgSend(*(id *)(a1 + 32), "designatedGroupLeader");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isAirPlayReceiverSessionActive");

  objc_msgSend(*(id *)(a1 + 32), "designatedGroupLeader");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "groupID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v6, "length"))
  {
    objc_msgSend(*(id *)(a1 + 32), "designatedGroupLeader");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "parentGroupIdentifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v8, "length"))
    {
      objc_msgSend(*(id *)(a1 + 32), "designatedGroupLeader");
      v21 = v2;
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "groupID");
      v20 = v4;
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "designatedGroupLeader");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "parentGroupIdentifier");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v10, "isEqualToString:", v12) ^ 1;

      v4 = v20;
      v2 = v21;
    }
    else
    {
      LOBYTE(v13) = 0;
    }

  }
  else
  {
    LOBYTE(v13) = 0;
  }

  objc_msgSend(*(id *)(a1 + 32), "designatedGroupLeader");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "supportsMultiplayer");

  objc_msgSend(*(id *)(a1 + 32), "designatedGroupLeader");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "groupSessionInfo");
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  v17 = v22;
  if (v22)
  {
    v18 = objc_msgSend(v22, "isHosted");
    v17 = v22;
  }
  else
  {
    v18 = 1;
  }
  v19 = (v13 | ~v4 | v15) & v18;
  if (!v2)
    v19 = 0;
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = v19;

}

- (BOOL)isConnected
{
  void *v2;
  char v3;

  -[MRConcreteEndpoint externalDevice](self, "externalDevice");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isConnected");

  return v3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serialQueue, 0);
  objc_storeStrong((id *)&self->_designatedGroupLeader, 0);
  objc_storeStrong((id *)&self->_externalDevice, 0);
  objc_storeStrong((id *)&self->_outputDevices, 0);
  objc_storeStrong((id *)&self->_uniqueIdentifier, 0);
}

@end
