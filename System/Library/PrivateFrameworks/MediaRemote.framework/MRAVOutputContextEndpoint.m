@implementation MRAVOutputContextEndpoint

- (int64_t)connectionType
{
  return 1;
}

- (NSArray)outputDevices
{
  MRAVOutputContextEndpoint *v2;
  void *v3;

  v2 = self;
  objc_sync_enter(v2);
  v3 = (void *)-[NSArray copy](v2->_outputDevices, "copy");
  objc_sync_exit(v2);

  return (NSArray *)v3;
}

- (id)uniqueIdentifier
{
  return self->_uniqueIdentifier;
}

- (id)designatedGroupLeader
{
  return 0;
}

- (BOOL)canModifyGroupMembership
{
  return 1;
}

- (id)personalOutputDevices
{
  return 0;
}

- (BOOL)groupContainsDiscoverableGroupLeader
{
  return 1;
}

- (void)_reloadOutputDevicesFromContext
{
  id v2;

  if (a1)
  {
    objc_msgSend(a1[10], "outputDevices");
    v2 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "setOutputDevices:", v2);

  }
}

- (void)setOutputDevices:(id)a3
{
  NSArray *v4;
  MRAVOutputContextEndpoint *v5;
  NSArray *outputDevices;
  void *v7;
  uint64_t v8;
  NSArray *v9;
  NSArray *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  NSObject *v17;
  NSObject *v18;
  NSObject *v19;
  char v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  uint8_t buf[4];
  void *v31;
  __int16 v32;
  void *v33;
  __int16 v34;
  void *v35;
  __int16 v36;
  void *v37;
  __int16 v38;
  void *v39;
  _BYTE v40[128];
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  v4 = (NSArray *)a3;
  v5 = self;
  objc_sync_enter(v5);
  outputDevices = v5->_outputDevices;
  if (outputDevices != v4)
  {
    -[NSArray firstObject](outputDevices, "firstObject");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = -[NSArray copy](v4, "copy");
    v9 = v5->_outputDevices;
    v5->_outputDevices = (NSArray *)v8;

    v28 = 0u;
    v29 = 0u;
    v26 = 0u;
    v27 = 0u;
    v10 = v5->_outputDevices;
    v11 = -[NSArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v26, v40, 16);
    if (v11)
    {
      v12 = *(_QWORD *)v27;
      do
      {
        v13 = 0;
        do
        {
          if (*(_QWORD *)v27 != v12)
            objc_enumerationMutation(v10);
          objc_msgSend(*(id *)(*((_QWORD *)&v26 + 1) + 8 * v13++), "setEndpoint:", v5, (_QWORD)v26);
        }
        while (v11 != v13);
        v11 = -[NSArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v26, v40, 16);
      }
      while (v11);
    }

    -[NSArray firstObject](v4, "firstObject");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (-[NSArray count](v4, "count") != 1 || objc_msgSend(v14, "deviceType") != 2)
      goto LABEL_17;
    objc_msgSend(v7, "modelID");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "modelID");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = v15;
    v18 = v16;
    if (v17 == v18)
    {

    }
    else
    {
      v19 = v18;
      v20 = -[NSObject isEqual:](v17, "isEqual:", v18);

      if ((v20 & 1) != 0)
      {
LABEL_17:
        -[MRAVEndpoint scheduleEndpointOutputDevicesDidChangeNotification](v5, "scheduleEndpointOutputDevicesDidChangeNotification", (_QWORD)v26);

        goto LABEL_18;
      }
      _MRLogForCategory(0);
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        -[MRAVOutputContextEndpoint uniqueIdentifier](v5, "uniqueIdentifier");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        -[MRAVEndpoint localizedName](v5, "localizedName");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "uid");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "name");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "modelID");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138544386;
        v31 = v21;
        v32 = 2114;
        v33 = v22;
        v34 = 2114;
        v35 = v23;
        v36 = 2114;
        v37 = v24;
        v38 = 2114;
        v39 = v25;
        _os_log_impl(&dword_193827000, v17, OS_LOG_TYPE_DEFAULT, "Updating Endpoint: %{public}@ | %{public}@ bt output device: %{public}@ | %{public}@ | %{public}@", buf, 0x34u);

      }
    }

    goto LABEL_17;
  }
LABEL_18:
  objc_sync_exit(v5);

}

- (void)setOutputContextController:(id)a3
{
  MRAVOutputContextEndpoint *v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a3;
  v5 = self;
  objc_sync_enter(v5);
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v5->_outputContextController)
    objc_msgSend(v6, "removeObserver:name:object:", v5, CFSTR("MROutputContextDataSourceDidReloadNotification"));
  objc_storeStrong((id *)&v5->_outputContextController, a3);
  if (v5->_outputContextController)
    objc_msgSend(v7, "addObserver:selector:name:object:", v5, sel_outputContextDataSourceReloaded_, CFSTR("MROutputContextDataSourceDidReloadNotification"));
  -[MRAVEndpoint setOutputContextDataSource:](v5, "setOutputContextDataSource:", v8);

  objc_sync_exit(v5);
}

- (void)setOrigin:(id)a3
{
  MRAVOutputContextEndpoint *v5;
  MROrigin *v6;

  v6 = (MROrigin *)a3;
  v5 = self;
  objc_sync_enter(v5);
  if (v5->_origin != v6)
    objc_storeStrong((id *)&v5->_origin, a3);
  objc_sync_exit(v5);

}

- (MRAVOutputContextEndpoint)initWithOutputContext:(id)a3 uniqueIdentifier:(id)a4
{
  id v6;
  id v7;
  id *v8;
  MRAVOutputContextEndpoint *v9;
  objc_super v11;

  v6 = a3;
  v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)MRAVOutputContextEndpoint;
  v8 = -[MRAVEndpoint _init](&v11, sel__init);
  v9 = (MRAVOutputContextEndpoint *)v8;
  if (v8)
  {
    objc_storeStrong(v8 + 7, a4);
    -[MRAVOutputContextEndpoint setOutputContext:](v9, "setOutputContext:", v6);
  }

  return v9;
}

- (void)setOutputContext:(id)a3
{
  MRAVOutputContextEndpoint *v5;
  MROutputContextController *v6;
  MRAVConcreteOutputContext *v7;

  v7 = (MRAVConcreteOutputContext *)a3;
  v5 = self;
  objc_sync_enter(v5);
  if (v5->_outputContext != v7)
  {
    objc_storeStrong((id *)&v5->_outputContext, a3);
    if (v7)
    {
      if (-[MRAVConcreteOutputContext type](v5->_outputContext, "type") == 1)
      {
        +[MROutputContextController sharedOutputContextController](MROutputContextController, "sharedOutputContextController");
        v6 = (MROutputContextController *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v6 = -[MROutputContextController initWithOutputContext:]([MROutputContextController alloc], "initWithOutputContext:", v7);
      }
      -[MRAVOutputContextEndpoint setOutputContextController:](v5, "setOutputContextController:", v6);

    }
  }
  -[MRAVOutputContextEndpoint _reloadOutputDevicesFromContext]((id *)&v5->super.super.isa);
  objc_sync_exit(v5);

}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

  v4.receiver = self;
  v4.super_class = (Class)MRAVOutputContextEndpoint;
  -[MRAVOutputContextEndpoint dealloc](&v4, sel_dealloc);
}

- (id)_externalOutputContext
{
  MRAVOutputContextEndpoint *v2;
  MROutputContextController *v3;

  v2 = self;
  objc_sync_enter(v2);
  v3 = v2->_outputContextController;
  objc_sync_exit(v2);

  return v3;
}

- (MRAVOutputContextEndpoint)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  MRAVOutputContextEndpoint *v8;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("outputContextUID"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("uniqueIdentifier"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  +[MRAVConcreteOutputContext createOutputContextWithUniqueIdentifier:](MRAVConcreteOutputContext, "createOutputContextWithUniqueIdentifier:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[MRAVOutputContextEndpoint initWithOutputContext:uniqueIdentifier:](self, "initWithOutputContext:uniqueIdentifier:", v7, v6);

  return v8;
}

- (void)encodeWithCoder:(id)a3
{
  MRAVConcreteOutputContext *outputContext;
  void *v5;
  id v6;

  outputContext = self->_outputContext;
  v6 = a3;
  -[MRAVConcreteOutputContext uniqueIdentifier](outputContext, "uniqueIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "encodeObject:forKey:", v5, CFSTR("outputContextUID"));

  objc_msgSend(v6, "encodeObject:forKey:", self->_uniqueIdentifier, CFSTR("uniqueIdentifier"));
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (BOOL)isRealized
{
  MRAVOutputContextEndpoint *v2;
  BOOL v3;

  v2 = self;
  objc_sync_enter(v2);
  if (v2->_outputContext)
    v3 = v2->_origin != 0;
  else
    v3 = 0;
  objc_sync_exit(v2);

  return v3;
}

- (id)predictedOutputDevice
{
  MRAVOutputContextEndpoint *v2;
  void *v3;

  v2 = self;
  objc_sync_enter(v2);
  -[MRAVConcreteOutputContext predictedOutputDevice](v2->_outputContext, "predictedOutputDevice");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_sync_exit(v2);

  return v3;
}

- (void)resetPredictedOutputDevice
{
  MRAVOutputContextEndpoint *obj;

  obj = self;
  objc_sync_enter(obj);
  -[MRAVConcreteOutputContext resetPredictedOutputDevice](obj->_outputContext, "resetPredictedOutputDevice");
  objc_sync_exit(obj);

}

- (BOOL)isProxyGroupPlayer
{
  void *v2;
  void *v3;

  -[MRAVOutputContextEndpoint origin](self, "origin");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[MRDeviceInfoRequest deviceInfoForOrigin:](MRDeviceInfoRequest, "deviceInfoForOrigin:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(v2) = objc_msgSend(v3, "isProxyGroupPlayer");
  return (char)v2;
}

- (MROrigin)origin
{
  MRAVOutputContextEndpoint *v2;
  MROrigin *v3;

  v2 = self;
  objc_sync_enter(v2);
  v3 = v2->_origin;
  objc_sync_exit(v2);

  return v3;
}

- (BOOL)isConnected
{
  return 1;
}

- (void)connectToExternalDeviceWithOptions:(unsigned int)a3 userInfo:(id)a4 completion:(id)a5
{
  (*((void (**)(id, _QWORD))a5 + 2))(a5, 0);
}

- (void)requestGroupSessionWithDetails:(id)a3 queue:(id)a4 completion:(id)a5
{
  id v6;
  id v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void (*v14)(uint64_t, void *, void *);
  void *v15;
  id v16;
  id v17;

  v6 = a4;
  v7 = a5;
  v12 = MEMORY[0x1E0C809B0];
  v13 = 3221225472;
  v14 = __77__MRAVOutputContextEndpoint_requestGroupSessionWithDetails_queue_completion___block_invoke;
  v15 = &unk_1E30C7098;
  v16 = v6;
  v17 = v7;
  v8 = v7;
  v9 = v6;
  v10 = (void *)MEMORY[0x194036C44](&v12);
  MRGetSharedService();
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "requestGroupSessionWithCompletion:", v10, v12, v13, v14, v15);

}

void __77__MRAVOutputContextEndpoint_requestGroupSessionWithDetails_queue_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  id v8;
  id v9;
  id v10;
  _QWORD block[4];
  id v12;
  id v13;
  id v14;

  v5 = a2;
  v6 = a3;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __77__MRAVOutputContextEndpoint_requestGroupSessionWithDetails_queue_completion___block_invoke_2;
  block[3] = &unk_1E30C6658;
  v7 = *(NSObject **)(a1 + 32);
  v8 = *(id *)(a1 + 40);
  v13 = v6;
  v14 = v8;
  v12 = v5;
  v9 = v6;
  v10 = v5;
  dispatch_async(v7, block);

}

uint64_t __77__MRAVOutputContextEndpoint_requestGroupSessionWithDetails_queue_completion___block_invoke_2(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

- (void)_modifyTopologyWithRequest:(id)a3 withReplyQueue:(id)a4 completion:(id)a5
{
  -[MRAVConcreteOutputContext modifyTopologyWithRequest:withReplyQueue:completion:](self->_outputContext, "modifyTopologyWithRequest:withReplyQueue:completion:", a3, a4, a5);
}

- (void)_setOutputDeviceVolume:(float)a3 outputDevice:(id)a4 details:(id)a5 queue:(id)a6 completion:(id)a7
{
  NSObject *v12;
  id v13;
  double v14;
  void *v15;
  NSObject *v16;
  id v17;
  _QWORD v18[4];
  id v19;
  id v20;

  v12 = a6;
  v13 = a7;
  *(float *)&v14 = a3;
  -[MROutputContextController setVolume:outputDeviceUID:details:](self->_outputContextController, "setVolume:outputDeviceUID:details:", a4, a5, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (v13)
  {
    v16 = v12;
    if (!v12)
    {
      v16 = MEMORY[0x1E0C80D38];
      v17 = MEMORY[0x1E0C80D38];
    }
    v18[0] = MEMORY[0x1E0C809B0];
    v18[1] = 3221225472;
    v18[2] = __90__MRAVOutputContextEndpoint__setOutputDeviceVolume_outputDevice_details_queue_completion___block_invoke;
    v18[3] = &unk_1E30C6568;
    v20 = v13;
    v19 = v15;
    dispatch_async(v16, v18);
    if (!v12)

  }
}

uint64_t __90__MRAVOutputContextEndpoint__setOutputDeviceVolume_outputDevice_details_queue_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

- (void)_adjustOutputDeviceVolume:(int64_t)a3 outputDevice:(id)a4 details:(id)a5 queue:(id)a6 completion:(id)a7
{
  NSObject *v12;
  id v13;
  void *v14;
  NSObject *v15;
  id v16;
  _QWORD v17[4];
  id v18;
  id v19;

  v12 = a6;
  v13 = a7;
  -[MROutputContextController adjustVolume:outputDeviceUID:details:](self->_outputContextController, "adjustVolume:outputDeviceUID:details:", a3, a4, a5);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (v13)
  {
    v15 = v12;
    if (!v12)
    {
      v15 = MEMORY[0x1E0C80D38];
      v16 = MEMORY[0x1E0C80D38];
    }
    v17[0] = MEMORY[0x1E0C809B0];
    v17[1] = 3221225472;
    v17[2] = __93__MRAVOutputContextEndpoint__adjustOutputDeviceVolume_outputDevice_details_queue_completion___block_invoke;
    v17[3] = &unk_1E30C6568;
    v19 = v13;
    v18 = v14;
    dispatch_async(v15, v17);
    if (!v12)

  }
}

uint64_t __93__MRAVOutputContextEndpoint__adjustOutputDeviceVolume_outputDevice_details_queue_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

- (void)_muteOutputDeviceVolume:(BOOL)a3 outputDevice:(id)a4 details:(id)a5 queue:(id)a6 completion:(id)a7
{
  _BOOL8 v10;
  NSObject *v12;
  id v13;
  void *v14;
  NSObject *v15;
  id v16;
  _QWORD v17[4];
  id v18;
  id v19;

  v10 = a3;
  v12 = a6;
  v13 = a7;
  -[MROutputContextController muteVolume:outputDeviceUID:details:](self->_outputContextController, "muteVolume:outputDeviceUID:details:", v10, a4, a5);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (v13)
  {
    v15 = v12;
    if (!v12)
    {
      v15 = MEMORY[0x1E0C80D38];
      v16 = MEMORY[0x1E0C80D38];
    }
    v17[0] = MEMORY[0x1E0C809B0];
    v17[1] = 3221225472;
    v17[2] = __91__MRAVOutputContextEndpoint__muteOutputDeviceVolume_outputDevice_details_queue_completion___block_invoke;
    v17[3] = &unk_1E30C6568;
    v19 = v13;
    v18 = v14;
    dispatch_async(v15, v17);
    if (!v12)

  }
}

uint64_t __91__MRAVOutputContextEndpoint__muteOutputDeviceVolume_outputDevice_details_queue_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

- (void)removeOutputDeviceFromParentGroup:(id)a3 queue:(id)a4 completion:(id)a5
{
  id v6;
  NSObject *v7;
  id v8;
  _QWORD block[4];
  id v10;

  v6 = a5;
  v7 = a4;
  notify_post((const char *)objc_msgSend(CFSTR("kAirPlayWHANotification_BreakAwayFromCurrentGroup"), "UTF8String"));
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __80__MRAVOutputContextEndpoint_removeOutputDeviceFromParentGroup_queue_completion___block_invoke;
  block[3] = &unk_1E30C6770;
  v10 = v6;
  v8 = v6;
  dispatch_async(v7, block);

}

uint64_t __80__MRAVOutputContextEndpoint_removeOutputDeviceFromParentGroup_queue_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)setListeningMode:(id)a3 outputDeviceUID:(id)a4 queue:(id)a5 completion:(id)a6
{
  id v10;
  NSObject *v11;
  id v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  id v17;
  _QWORD block[4];
  id v19;
  id v20;
  id v21;

  v10 = a3;
  v11 = a5;
  v12 = a6;
  -[MRAVEndpoint outputDeviceWithUID:](self, "outputDeviceWithUID:", a4);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v13;
  if (v13)
  {
    v21 = 0;
    objc_msgSend(v13, "setCurrentBluetoothListeningMode:error:", v10, &v21);
    v15 = v21;
  }
  else
  {
    v15 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB35C8]), "initWithMRError:", 39);
  }
  v16 = v15;
  if (v12)
  {
    if (!v11)
    {
      v11 = MEMORY[0x1E0C80D38];
      v17 = MEMORY[0x1E0C80D38];
    }
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __79__MRAVOutputContextEndpoint_setListeningMode_outputDeviceUID_queue_completion___block_invoke;
    block[3] = &unk_1E30C6568;
    v20 = v12;
    v19 = v16;
    dispatch_async(v11, block);

  }
}

uint64_t __79__MRAVOutputContextEndpoint_setListeningMode_outputDeviceUID_queue_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

- (void)setAllowsHeadTrackedSpatialAudio:(BOOL)a3 outputDeviceUID:(id)a4 queue:(id)a5 completion:(id)a6
{
  _BOOL8 v8;
  NSObject *v10;
  id v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  id v16;
  _QWORD block[4];
  id v18;
  id v19;
  id v20;

  v8 = a3;
  v10 = a5;
  v11 = a6;
  -[MRAVEndpoint outputDeviceWithUID:](self, "outputDeviceWithUID:", a4);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v12;
  if (v12)
  {
    v20 = 0;
    objc_msgSend(v12, "setAllowsHeadTrackedSpatialAudio:error:", v8, &v20);
    v14 = v20;
  }
  else
  {
    v14 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB35C8]), "initWithMRError:", 39);
  }
  v15 = v14;
  if (v11)
  {
    if (!v10)
    {
      v10 = MEMORY[0x1E0C80D38];
      v16 = MEMORY[0x1E0C80D38];
    }
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __95__MRAVOutputContextEndpoint_setAllowsHeadTrackedSpatialAudio_outputDeviceUID_queue_completion___block_invoke;
    block[3] = &unk_1E30C6568;
    v19 = v11;
    v18 = v15;
    dispatch_async(v10, block);

  }
}

uint64_t __95__MRAVOutputContextEndpoint_setAllowsHeadTrackedSpatialAudio_outputDeviceUID_queue_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

- (void)setHeadTrackedSpatialAudioMode:(id)a3 outputDeviceUID:(id)a4 queue:(id)a5 completion:(id)a6
{
  id v10;
  NSObject *v11;
  id v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  id v17;
  _QWORD block[4];
  id v19;
  id v20;
  id v21;

  v10 = a3;
  v11 = a5;
  v12 = a6;
  -[MRAVEndpoint outputDeviceWithUID:](self, "outputDeviceWithUID:", a4);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v13;
  if (v13)
  {
    v21 = 0;
    objc_msgSend(v13, "setHeadTrackedSpatialAudioMode:error:", v10, &v21);
    v15 = v21;
  }
  else
  {
    v15 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB35C8]), "initWithMRError:", 39);
  }
  v16 = v15;
  if (v12)
  {
    if (!v11)
    {
      v11 = MEMORY[0x1E0C80D38];
      v17 = MEMORY[0x1E0C80D38];
    }
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __93__MRAVOutputContextEndpoint_setHeadTrackedSpatialAudioMode_outputDeviceUID_queue_completion___block_invoke;
    block[3] = &unk_1E30C6568;
    v20 = v12;
    v19 = v16;
    dispatch_async(v11, block);

  }
}

uint64_t __93__MRAVOutputContextEndpoint_setHeadTrackedSpatialAudioMode_outputDeviceUID_queue_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

- (void)setConversationDetectionEnabled:(BOOL)a3 outputDeviceUID:(id)a4 queue:(id)a5 completion:(id)a6
{
  _BOOL8 v8;
  NSObject *v10;
  id v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  id v16;
  _QWORD block[4];
  id v18;
  id v19;
  id v20;

  v8 = a3;
  v10 = a5;
  v11 = a6;
  -[MRAVEndpoint outputDeviceWithUID:](self, "outputDeviceWithUID:", a4);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v12;
  if (v12)
  {
    v20 = 0;
    objc_msgSend(v12, "setConversationDetectionEnabled:error:", v8, &v20);
    v14 = v20;
  }
  else
  {
    v14 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB35C8]), "initWithMRError:", 39);
  }
  v15 = v14;
  if (v11)
  {
    if (!v10)
    {
      v10 = MEMORY[0x1E0C80D38];
      v16 = MEMORY[0x1E0C80D38];
    }
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __94__MRAVOutputContextEndpoint_setConversationDetectionEnabled_outputDeviceUID_queue_completion___block_invoke;
    block[3] = &unk_1E30C6568;
    v19 = v11;
    v18 = v15;
    dispatch_async(v10, block);

  }
}

uint64_t __94__MRAVOutputContextEndpoint_setConversationDetectionEnabled_outputDeviceUID_queue_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

- (MRAVConcreteOutputContext)outputContext
{
  return self->_outputContext;
}

- (MROutputContextController)outputContextController
{
  return self->_outputContextController;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_outputContextController, 0);
  objc_storeStrong((id *)&self->_outputContext, 0);
  objc_storeStrong((id *)&self->_origin, 0);
  objc_storeStrong((id *)&self->_outputDevices, 0);
  objc_storeStrong((id *)&self->_uniqueIdentifier, 0);
}

@end
