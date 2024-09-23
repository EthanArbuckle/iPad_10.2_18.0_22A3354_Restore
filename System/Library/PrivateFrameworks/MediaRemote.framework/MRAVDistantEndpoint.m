@implementation MRAVDistantEndpoint

- (id)uniqueIdentifier
{
  return self->_uniqueIdentifier;
}

- (MRAVDistantEndpoint)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  MRAVDistantEndpoint *v6;
  uint64_t v7;
  NSXPCListenerEndpoint *externalDeviceListenerEndpoint;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("protobuf"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[MRAVDistantEndpoint initWithDescriptor:](self, "initWithDescriptor:", v5);
  if (v6)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("externalDeviceListenerEndpoint"));
    v7 = objc_claimAutoreleasedReturnValue();
    externalDeviceListenerEndpoint = v6->_externalDeviceListenerEndpoint;
    v6->_externalDeviceListenerEndpoint = (NSXPCListenerEndpoint *)v7;

  }
  return v6;
}

- (id)outputDevices
{
  return self->_distantOutputDevices;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  _MRAVEndpointDescriptorProtobuf *v5;
  void *v6;
  NSArray *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  NSArray *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  NSObject *externalDeviceQueue;
  _QWORD v20[4];
  id v21;
  MRAVDistantEndpoint *v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _BYTE v31[128];
  _BYTE v32[128];
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = objc_alloc_init(_MRAVEndpointDescriptorProtobuf);
  -[_MRAVEndpointDescriptorProtobuf setName:](v5, "setName:", self->_localizedName);
  -[_MRAVEndpointDescriptorProtobuf setUniqueIdentifier:](v5, "setUniqueIdentifier:", self->_uniqueIdentifier);
  -[_MRAVEndpointDescriptorProtobuf setConnectionType:](v5, "setConnectionType:", LODWORD(self->_connectionType));
  -[MRAVDistantOutputDevice protobuf](self->_distantGroupLeader, "protobuf");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[_MRAVEndpointDescriptorProtobuf setDesignatedGroupLeader:](v5, "setDesignatedGroupLeader:", v6);

  -[_MRAVEndpointDescriptorProtobuf setCanModifyGroupMembership:](v5, "setCanModifyGroupMembership:", self->_canModifyGroupMembership);
  v29 = 0u;
  v30 = 0u;
  v27 = 0u;
  v28 = 0u;
  v7 = self->_distantOutputDevices;
  v8 = -[NSArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v27, v32, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v28;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v28 != v10)
          objc_enumerationMutation(v7);
        objc_msgSend(*(id *)(*((_QWORD *)&v27 + 1) + 8 * v11), "protobuf");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        -[_MRAVEndpointDescriptorProtobuf addOutputDevices:](v5, "addOutputDevices:", v12);

        ++v11;
      }
      while (v9 != v11);
      v9 = -[NSArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v27, v32, 16);
    }
    while (v9);
  }

  v25 = 0u;
  v26 = 0u;
  v23 = 0u;
  v24 = 0u;
  v13 = self->_distantPersonalOutputDevices;
  v14 = -[NSArray countByEnumeratingWithState:objects:count:](v13, "countByEnumeratingWithState:objects:count:", &v23, v31, 16);
  if (v14)
  {
    v15 = v14;
    v16 = *(_QWORD *)v24;
    do
    {
      v17 = 0;
      do
      {
        if (*(_QWORD *)v24 != v16)
          objc_enumerationMutation(v13);
        objc_msgSend(*(id *)(*((_QWORD *)&v23 + 1) + 8 * v17), "protobuf");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        -[_MRAVEndpointDescriptorProtobuf addPersonalOutputDevices:](v5, "addPersonalOutputDevices:", v18);

        ++v17;
      }
      while (v15 != v17);
      v15 = -[NSArray countByEnumeratingWithState:objects:count:](v13, "countByEnumeratingWithState:objects:count:", &v23, v31, 16);
    }
    while (v15);
  }

  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("protobuf"));
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    externalDeviceQueue = self->_externalDeviceQueue;
    v20[0] = MEMORY[0x1E0C809B0];
    v20[1] = 3221225472;
    v20[2] = __39__MRAVDistantEndpoint_encodeWithCoder___block_invoke;
    v20[3] = &unk_1E30C5F40;
    v21 = v4;
    v22 = self;
    dispatch_sync(externalDeviceQueue, v20);

  }
}

- (MRAVDistantEndpoint)initWithDescriptor:(id)a3
{
  id v4;
  MRAVDistantEndpoint *v5;
  NSObject *v6;
  dispatch_queue_t v7;
  OS_dispatch_queue *externalDeviceQueue;
  void *v9;
  uint64_t v10;
  NSString *localizedName;
  void *v12;
  uint64_t v13;
  NSString *uniqueIdentifier;
  NSArray *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  MRAVDistantOutputDevice *v21;
  NSArray *v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  MRAVDistantOutputDevice *v28;
  NSArray *distantOutputDevices;
  NSArray *v30;
  NSArray *distantPersonalOutputDevices;
  NSArray *v32;
  MRAVDistantOutputDevice *v33;
  void *v34;
  uint64_t v35;
  MRAVDistantOutputDevice *distantGroupLeader;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  objc_super v46;
  _BYTE v47[128];
  _BYTE v48[128];
  uint64_t v49;

  v49 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v46.receiver = self;
  v46.super_class = (Class)MRAVDistantEndpoint;
  v5 = -[MRAVEndpoint _init](&v46, sel__init);
  if (v5)
  {
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = dispatch_queue_create("com.apple.mediaremote.distantEndpoint/externalDeviceQueue", v6);
    externalDeviceQueue = v5->_externalDeviceQueue;
    v5->_externalDeviceQueue = (OS_dispatch_queue *)v7;

    objc_msgSend(v4, "name");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "copy");
    localizedName = v5->_localizedName;
    v5->_localizedName = (NSString *)v10;

    objc_msgSend(v4, "uniqueIdentifier");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "copy");
    uniqueIdentifier = v5->_uniqueIdentifier;
    v5->_uniqueIdentifier = (NSString *)v13;

    v5->_connectionType = (int)objc_msgSend(v4, "connectionType");
    v5->_canModifyGroupMembership = objc_msgSend(v4, "canModifyGroupMembership");
    v15 = (NSArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v42 = 0u;
    v43 = 0u;
    v44 = 0u;
    v45 = 0u;
    objc_msgSend(v4, "outputDevices");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v42, v48, 16);
    if (v17)
    {
      v18 = v17;
      v19 = *(_QWORD *)v43;
      do
      {
        v20 = 0;
        do
        {
          if (*(_QWORD *)v43 != v19)
            objc_enumerationMutation(v16);
          v21 = -[MRAVDistantOutputDevice initWithDescriptor:]([MRAVDistantOutputDevice alloc], "initWithDescriptor:", *(_QWORD *)(*((_QWORD *)&v42 + 1) + 8 * v20));
          -[NSArray addObject:](v15, "addObject:", v21);

          ++v20;
        }
        while (v18 != v20);
        v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v42, v48, 16);
      }
      while (v18);
    }

    v22 = (NSArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v38 = 0u;
    v39 = 0u;
    v40 = 0u;
    v41 = 0u;
    objc_msgSend(v4, "personalOutputDevices", 0);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v38, v47, 16);
    if (v24)
    {
      v25 = v24;
      v26 = *(_QWORD *)v39;
      do
      {
        v27 = 0;
        do
        {
          if (*(_QWORD *)v39 != v26)
            objc_enumerationMutation(v23);
          v28 = -[MRAVDistantOutputDevice initWithDescriptor:]([MRAVDistantOutputDevice alloc], "initWithDescriptor:", *(_QWORD *)(*((_QWORD *)&v38 + 1) + 8 * v27));
          -[NSArray addObject:](v22, "addObject:", v28);

          ++v27;
        }
        while (v25 != v27);
        v25 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v38, v47, 16);
      }
      while (v25);
    }

    distantOutputDevices = v5->_distantOutputDevices;
    v5->_distantOutputDevices = v15;
    v30 = v15;

    distantPersonalOutputDevices = v5->_distantPersonalOutputDevices;
    v5->_distantPersonalOutputDevices = v22;
    v32 = v22;

    v33 = [MRAVDistantOutputDevice alloc];
    objc_msgSend(v4, "designatedGroupLeader");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    v35 = -[MRAVDistantOutputDevice initWithDescriptor:](v33, "initWithDescriptor:", v34);
    distantGroupLeader = v5->_distantGroupLeader;
    v5->_distantGroupLeader = (MRAVDistantOutputDevice *)v35;

  }
  return v5;
}

- (id)localizedName
{
  return self->_localizedName;
}

- (id)designatedGroupLeader
{
  return self->_distantGroupLeader;
}

- (BOOL)canModifyGroupMembership
{
  return self->_canModifyGroupMembership;
}

- (int64_t)connectionType
{
  return self->_connectionType;
}

uint64_t __39__MRAVDistantEndpoint_encodeWithCoder___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "encodeObject:forKey:", *(_QWORD *)(*(_QWORD *)(a1 + 40) + 128), CFSTR("externalDeviceListenerEndpoint"));
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  +[MRMediaRemoteServiceClient sharedServiceClient](MRMediaRemoteServiceClient, "sharedServiceClient");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeDistantEndpoint:", self);

  v4.receiver = self;
  v4.super_class = (Class)MRAVDistantEndpoint;
  -[MRAVDistantEndpoint dealloc](&v4, sel_dealloc);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_externalDeviceListenerEndpoint, 0);
  objc_storeStrong((id *)&self->_distantGroupLeader, 0);
  objc_storeStrong((id *)&self->_distantPersonalOutputDevices, 0);
  objc_storeStrong((id *)&self->_distantOutputDevices, 0);
  objc_storeStrong((id *)&self->_externalDeviceQueue, 0);
  objc_storeStrong((id *)&self->_distantExternalDevice, 0);
  objc_storeStrong((id *)&self->_uniqueIdentifier, 0);
  objc_storeStrong((id *)&self->_localizedName, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)debugDescription
{
  void *v3;
  void *v4;
  NSObject *externalDeviceQueue;
  id v6;
  id v7;
  _QWORD v9[4];
  id v10;
  MRAVDistantEndpoint *v11;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)MRAVDistantEndpoint;
  -[MRAVEndpoint debugDescription](&v12, sel_debugDescription);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "mutableCopy");

  externalDeviceQueue = self->_externalDeviceQueue;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __39__MRAVDistantEndpoint_debugDescription__block_invoke;
  v9[3] = &unk_1E30C5F40;
  v6 = v4;
  v10 = v6;
  v11 = self;
  dispatch_sync(externalDeviceQueue, v9);
  v7 = v6;

  return v7;
}

uint64_t __39__MRAVDistantEndpoint_debugDescription__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 88), "mr_formattedDebugDescription");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "appendFormat:", CFSTR("\n  distantExternalDevice = %@\n"), v3);

  return objc_msgSend(*(id *)(a1 + 32), "appendFormat:", CFSTR(">"));
}

- (id)personalOutputDevices
{
  return self->_distantPersonalOutputDevices;
}

- (BOOL)isProxyGroupPlayer
{
  void *v2;
  char v3;

  -[MRAVDistantEndpoint designatedGroupLeader](self, "designatedGroupLeader");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isProxyGroupPlayer");

  return v3;
}

- (BOOL)isConnected
{
  NSObject *externalDeviceQueue;
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
  externalDeviceQueue = self->_externalDeviceQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __34__MRAVDistantEndpoint_isConnected__block_invoke;
  v5[3] = &unk_1E30C5D20;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(externalDeviceQueue, v5);
  v3 = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __34__MRAVDistantEndpoint_isConnected__block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 88), "isConnected");
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (id)groupSessionInfo
{
  void *v3;
  void *v4;
  MRGroupSessionInfo *v5;
  void *v6;
  MRGroupSessionInfo *v7;
  MRGroupSessionInfo *v8;
  MRGroupSessionToken *v9;
  MRGroupSessionInfo *v10;
  objc_super v12;

  -[MRAVDistantEndpoint distantExternalDevice](self, "distantExternalDevice");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "deviceInfo");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = [MRGroupSessionInfo alloc];
  objc_msgSend(v4, "groupSessionToken");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[MRGroupSessionInfo initWithToken:isHosted:](v5, "initWithToken:isHosted:", v6, 0);

  if (v7)
  {
    v8 = v7;
LABEL_6:
    v10 = v8;
    goto LABEL_7;
  }
  if (!objc_msgSend(v4, "hasPlaceholderGroupSession"))
  {
    v12.receiver = self;
    v12.super_class = (Class)MRAVDistantEndpoint;
    -[MRAVEndpoint groupSessionInfo](&v12, sel_groupSessionInfo);
    v8 = (MRGroupSessionInfo *)objc_claimAutoreleasedReturnValue();
    goto LABEL_6;
  }
  v9 = -[MRGroupSessionToken initWithDeviceInfo:]([MRGroupSessionToken alloc], "initWithDeviceInfo:", v4);
  v10 = -[MRGroupSessionInfo initWithToken:isHosted:isPlaceholder:]([MRGroupSessionInfo alloc], "initWithToken:isHosted:isPlaceholder:", v9, 0, 1);

LABEL_7:
  return v10;
}

- (BOOL)isEligibleForHostingGroupSessionExcludingAcknowledgements
{
  void *v2;
  void *v3;
  char v4;

  -[MRAVDistantEndpoint distantExternalDevice](self, "distantExternalDevice");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "deviceInfo");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEligibleForHostingGroupSessionExcludingAcknowledgements");

  return v4;
}

- (MRDistantExternalDevice)distantExternalDevice
{
  NSObject *externalDeviceQueue;
  id v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  id v11;

  v6 = 0;
  v7 = &v6;
  v8 = 0x3032000000;
  v9 = __Block_byref_object_copy__25;
  v10 = __Block_byref_object_dispose__25;
  v11 = 0;
  externalDeviceQueue = self->_externalDeviceQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __44__MRAVDistantEndpoint_distantExternalDevice__block_invoke;
  v5[3] = &unk_1E30C5F90;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(externalDeviceQueue, v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (MRDistantExternalDevice *)v3;
}

void __44__MRAVDistantEndpoint_distantExternalDevice__block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  void *v5;

  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(void **)(v2 + 88);
  if (!v3)
  {
    objc_msgSend((id)objc_opt_class(), "externalDeviceFactory");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "distantExternalDeviceForEndpoint:", *(_QWORD *)(a1 + 32));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[MRAVDistantEndpoint _onExternalDeviceQueue_setExternalDevice:](v2, v5);

    v3 = *(void **)(*(_QWORD *)(a1 + 32) + 88);
  }
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), v3);
}

- (void)_onExternalDeviceQueue_setExternalDevice:(uint64_t)a1
{
  void *v4;
  id v5;

  v5 = a2;
  if (a1)
  {
    dispatch_assert_queue_V2(*(dispatch_queue_t *)(a1 + 96));
    if (*(_QWORD *)(a1 + 88))
      -[MRAVDistantEndpoint _unregisterNotificationsForExternalDevice:](a1);
    objc_storeStrong((id *)(a1 + 88), a2);
    if (*(_QWORD *)(a1 + 88))
      -[MRAVDistantEndpoint _registerNotificationsForExternalDevice:](a1);
    if (objc_msgSend(v5, "connectionState") == 2)
      -[MRAVDistantEndpoint _handleEndpointDidConnectWithExternalDevice:](a1, v5);
    +[MRMediaRemoteServiceClient sharedServiceClient](MRMediaRemoteServiceClient, "sharedServiceClient");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addDistantEndpoint:", a1);

  }
}

- (void)setDistantExternalDevice:(id)a3
{
  id v4;
  NSObject *externalDeviceQueue;
  id v6;
  _QWORD block[5];
  id v8;

  v4 = a3;
  externalDeviceQueue = self->_externalDeviceQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __48__MRAVDistantEndpoint_setDistantExternalDevice___block_invoke;
  block[3] = &unk_1E30C5F40;
  block[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_sync(externalDeviceQueue, block);

}

void __48__MRAVDistantEndpoint_setDistantExternalDevice___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;

  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(void **)(a1 + 40);
  if (*(void **)(v2 + 88) != v3)
  {
    -[MRAVDistantEndpoint _onExternalDeviceQueue_setExternalDevice:](v2, v3);
    objc_msgSend(*(id *)(a1 + 40), "listenerEndpoint");
    v4 = objc_claimAutoreleasedReturnValue();
    v5 = *(_QWORD *)(a1 + 32);
    v6 = *(void **)(v5 + 128);
    *(_QWORD *)(v5 + 128) = v4;

  }
}

- (id)_externalOutputContext
{
  void *v2;
  void *v3;

  -[MRAVDistantEndpoint distantExternalDevice](self, "distantExternalDevice");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "externalOutputContext");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)_handleConnectionStateDidChangeNotification:(id)a3
{
  void *v4;
  void *v5;
  int v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a3;
  objc_msgSend(v10, "userInfo");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", CFSTR("kMRExternalDeviceConnectionStateUserInfoKey"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "unsignedIntValue");

  objc_msgSend(v10, "userInfo");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKey:", *MEMORY[0x1E0CB3388]);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6 == 3)
  {
    -[MRAVDistantEndpoint _handleEndpointDidDisconnectWithError:](self, v8);
  }
  else if (v6 == 2)
  {
    objc_msgSend(v10, "object");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[MRAVDistantEndpoint _handleEndpointDidConnectWithExternalDevice:]((uint64_t)self, v9);

  }
}

- (uint64_t)_handleEndpointDidConnectWithExternalDevice:(uint64_t)result
{
  void *v2;
  void *v3;

  if (result)
  {
    v2 = (void *)result;
    objc_msgSend(a2, "externalOutputContext");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "setOutputContextDataSource:", v3);

    return objc_msgSend((id)objc_opt_class(), "_notifyEndpointDidConnect:", v2);
  }
  return result;
}

- (void)_handleEndpointDidDisconnectWithError:(void *)a1
{
  id v3;

  if (a1)
  {
    v3 = a2;
    objc_msgSend(a1, "setOutputContextDataSource:", 0);
    objc_msgSend((id)objc_opt_class(), "_notifyEndpointDidDisconnect:withError:", a1, v3);

  }
}

- (void)_handleDeviceInfoDidChangeNotification:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  MRGroupSessionInfo *v8;
  MRGroupSessionInfo *v9;
  MRGroupSessionInfo *v10;
  BOOL v11;
  MRGroupSessionInfo *v12;
  void *v13;
  MRGroupSessionInfo *v14;
  void *v15;
  MRGroupSessionInfo *v16;
  int v17;
  id v18;

  v4 = a3;
  objc_msgSend(v4, "userInfo");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", CFSTR("MRExternalDeviceDeviceInfoUserInfoKey"));
  v18 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "userInfo");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "objectForKey:", CFSTR("MRExternalDevicePreviousDeviceInfoUserInfoKey"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v7)
  {
    v14 = [MRGroupSessionInfo alloc];
    objc_msgSend(v18, "groupSessionToken");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = -[MRGroupSessionInfo initWithToken:isHosted:](v14, "initWithToken:isHosted:", v15, 0);

    objc_msgSend((id)objc_opt_class(), "_notifyGroupSessionInfoDidChange:endpoint:", v16, self);
LABEL_9:
    objc_msgSend((id)objc_opt_class(), "_notifyGroupSessionHostingEligibilityDidChangeForEndpoint:", self);
    goto LABEL_10;
  }
  objc_msgSend(v7, "groupSessionToken");
  v8 = (MRGroupSessionInfo *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "groupSessionToken");
  v9 = (MRGroupSessionInfo *)(id)objc_claimAutoreleasedReturnValue();
  if (v8 == v9)
  {

  }
  else
  {
    v10 = v9;
    v11 = -[MRGroupSessionInfo isEqual:](v8, "isEqual:", v9);

    if (v11)
      goto LABEL_8;
    v12 = [MRGroupSessionInfo alloc];
    objc_msgSend(v18, "groupSessionToken");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = -[MRGroupSessionInfo initWithToken:isHosted:](v12, "initWithToken:isHosted:", v13, 0);

    objc_msgSend((id)objc_opt_class(), "_notifyGroupSessionInfoDidChange:endpoint:", v8, self);
  }

LABEL_8:
  v17 = objc_msgSend(v7, "isEligibleForHostingGroupSessionExcludingAcknowledgements");
  if (v17 != objc_msgSend(v18, "isEligibleForHostingGroupSessionExcludingAcknowledgements"))
    goto LABEL_9;
LABEL_10:

}

+ (MRAVDistantExternalDeviceFactory)externalDeviceFactory
{
  if (externalDeviceFactory_onceToken != -1)
    dispatch_once(&externalDeviceFactory_onceToken, &__block_literal_global_57);
  return (MRAVDistantExternalDeviceFactory *)(id)externalDeviceFactory_cache;
}

void __44__MRAVDistantEndpoint_externalDeviceFactory__block_invoke()
{
  MRAVDistantExternalDeviceFactory *v0;
  void *v1;

  v0 = objc_alloc_init(MRAVDistantExternalDeviceFactory);
  v1 = (void *)externalDeviceFactory_cache;
  externalDeviceFactory_cache = (uint64_t)v0;

}

- (void)_unregisterNotificationsForExternalDevice:(uint64_t)a1
{
  void *v2;
  id v3;

  if (a1)
  {
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "removeObserver:name:object:", a1, CFSTR("kMRExternalDeviceConnectionStateDidChangeNotification"), *(_QWORD *)(a1 + 88));

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "removeObserver:name:object:", a1, CFSTR("MRExternalDeviceDeviceInfoDidChangeNotification"), *(_QWORD *)(a1 + 88));

  }
}

- (void)_registerNotificationsForExternalDevice:(uint64_t)a1
{
  void *v2;
  id v3;

  if (a1)
  {
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "addObserver:selector:name:object:", a1, sel__handleConnectionStateDidChangeNotification_, CFSTR("kMRExternalDeviceConnectionStateDidChangeNotification"), *(_QWORD *)(a1 + 88));

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObserver:selector:name:object:", a1, sel__handleDeviceInfoDidChangeNotification_, CFSTR("MRExternalDeviceDeviceInfoDidChangeNotification"), *(_QWORD *)(a1 + 88));

  }
}

- (void)setLocalizedName:(id)a3
{
  objc_storeStrong((id *)&self->_localizedName, a3);
}

- (void)setUniqueIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_uniqueIdentifier, a3);
}

- (OS_dispatch_queue)externalDeviceQueue
{
  return self->_externalDeviceQueue;
}

- (void)setExternalDeviceQueue:(id)a3
{
  objc_storeStrong((id *)&self->_externalDeviceQueue, a3);
}

- (NSArray)distantOutputDevices
{
  return self->_distantOutputDevices;
}

- (void)setDistantOutputDevices:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 104);
}

- (NSArray)distantPersonalOutputDevices
{
  return self->_distantPersonalOutputDevices;
}

- (void)setDistantPersonalOutputDevices:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 112);
}

- (MRAVDistantOutputDevice)distantGroupLeader
{
  return self->_distantGroupLeader;
}

- (void)setDistantGroupLeader:(id)a3
{
  objc_storeStrong((id *)&self->_distantGroupLeader, a3);
}

- (NSXPCListenerEndpoint)externalDeviceListenerEndpoint
{
  return self->_externalDeviceListenerEndpoint;
}

- (void)setExternalDeviceListenerEndpoint:(id)a3
{
  objc_storeStrong((id *)&self->_externalDeviceListenerEndpoint, a3);
}

@end
