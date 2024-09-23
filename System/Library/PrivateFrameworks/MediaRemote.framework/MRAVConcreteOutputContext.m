@implementation MRAVConcreteOutputContext

void __44__MRAVConcreteOutputContext_avOutputContext__block_invoke(uint64_t a1)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), *(id *)(*(_QWORD *)(a1 + 32) + 88));
}

- (BOOL)supportsVolumeControl
{
  void *v2;
  char v3;

  -[MRAVConcreteOutputContext avOutputContext](self, "avOutputContext");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "providesControlForAllVolumeFeatures");

  return v3;
}

- (AVOutputContext)avOutputContext
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
  v7 = __Block_byref_object_copy__10;
  v8 = __Block_byref_object_dispose__10;
  v9 = 0;
  msv_dispatch_sync_on_queue();
  v2 = (id)v5[5];
  _Block_object_dispose(&v4, 8);

  return (AVOutputContext *)v2;
}

void __45__MRAVConcreteOutputContext_uniqueIdentifier__block_invoke(uint64_t a1)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), *(id *)(*(_QWORD *)(a1 + 32) + 32));
}

- (void)_registerNotifications
{
  void *v2;
  void *v3;
  void *v4;
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
  void *v18;
  void *v19;
  id v20;

  if (a1)
  {
    objc_msgSend(a1, "avOutputContext");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    if (v2)
    {
      v20 = v2;
      getAVOutputContextOutputDeviceDidChangeNotification();
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      -[MRAVConcreteOutputContext _addNotifications:name:object:]((uint64_t)a1, (uint64_t)sel__handleOutputDeviceDidChangeNotification_, v3, v20);

      getAVOutputContextOutputDevicesDidChangeNotification();
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      -[MRAVConcreteOutputContext _addNotifications:name:object:]((uint64_t)a1, (uint64_t)sel__handleOutputDevicesDidChangeNotification_, v4, v20);

      getAVOutputContextDestinationChangeInitiatedNotification[0]();
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      -[MRAVConcreteOutputContext _addNotifications:name:object:]((uint64_t)a1, (uint64_t)sel__outputContextChangeInitiatedNotification_, v5, v20);

      getAVOutputDeviceVolumeDidChangeNotification[0]();
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[MRAVConcreteOutputContext _addNotifications:name:object:]((uint64_t)a1, (uint64_t)sel__handleOutputDeviceVolumeDidChangeNotification_, v6, 0);

      getAVOutputDeviceCanSetVolumeDidChangeNotification[0]();
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[MRAVConcreteOutputContext _addNotifications:name:object:]((uint64_t)a1, (uint64_t)sel__handleOutputDeviceCanSetVolumeDidChangeNotification_, v7, 0);

      getAVOutputDeviceVolumeControlTypeDidChangeNotification[0]();
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[MRAVConcreteOutputContext _addNotifications:name:object:]((uint64_t)a1, (uint64_t)sel__handleOutputDeviceCanSetVolumeDidChangeNotification_, v8, 0);

      getAVOutputContextVolumeControlTypeDidChangeNotification[0]();
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[MRAVConcreteOutputContext _addNotifications:name:object:]((uint64_t)a1, (uint64_t)sel__handleOutputContextSupportsVolumeDidChangeNotification_, v9, v20);

      getAVOutputContextCanSetVolumeDidChangeNotification[0]();
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[MRAVConcreteOutputContext _addNotifications:name:object:]((uint64_t)a1, (uint64_t)sel__handleOutputContextSupportsVolumeDidChangeNotification_, v10, v20);

      getAVOutputContextProvidesControlForAllVolumeFeaturesDidChangeNotification[0]();
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[MRAVConcreteOutputContext _addNotifications:name:object:]((uint64_t)a1, (uint64_t)sel__handleOutputContextSupportsVolumeDidChangeNotification_, v11, v20);

      getAVOutputContextPredictedOutputDeviceDidChangeNotification[0]();
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[MRAVConcreteOutputContext _addNotifications:name:object:]((uint64_t)a1, (uint64_t)sel__handlePredictedOutputDeviceDidChangeNotification_, v12, v20);

      getAVOutputDeviceClusterMemberVolumeDidChangeNotification[0]();
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[MRAVConcreteOutputContext _addNotifications:name:object:]((uint64_t)a1, (uint64_t)sel__handleClusterMemberVolumeDidChangeNotification_, v13, 0);

      getAVOutputDeviceClusterMemberVolumeControlTypeDidChangeNotification[0]();
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      -[MRAVConcreteOutputContext _addNotifications:name:object:]((uint64_t)a1, (uint64_t)sel__handleClusterMemberVolumeControlTypeDidChangeNotification_, v14, 0);

      getAVOutputDeviceCanMuteDidChangeNotification[0]();
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      -[MRAVConcreteOutputContext _addNotifications:name:object:]((uint64_t)a1, (uint64_t)sel__handleCanMuteDidChangeNotification_, v15, 0);

      getAVOutputDeviceMutedDidChangeNotification[0]();
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      -[MRAVConcreteOutputContext _addNotifications:name:object:]((uint64_t)a1, (uint64_t)sel__handleMutedDidChangeNotification_, v16, 0);

      getAVOutputDeviceCanMuteDidChangeNotification[0]();
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      -[MRAVConcreteOutputContext _addNotifications:name:object:]((uint64_t)a1, (uint64_t)sel__handleClusterMemberCanMuteDidChangeNotification_, v17, 0);

      getAVOutputDeviceMutedDidChangeNotification[0]();
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      -[MRAVConcreteOutputContext _addNotifications:name:object:]((uint64_t)a1, (uint64_t)sel__handleClusterMemberMutedDidChangeNotification_, v18, 0);

      getAVOutputDeviceActivatedClusterMembersRoomVolumeDidChangeNotification[0]();
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      -[MRAVConcreteOutputContext _addNotifications:name:object:]((uint64_t)a1, (uint64_t)sel__handleClusterMemberRoomVolumeDidChangeNotification_, v19, 0);

      v2 = v20;
    }

  }
}

- (void)_addNotifications:(void *)a3 name:(void *)a4 object:
{
  id v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a3;
  v7 = a4;
  if (a1 && v10)
  {
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "addObserver:selector:name:object:", a1, a2, v10, v7);

    if (v7)
    {
      objc_msgSend(*(id *)(a1 + 96), "setObject:forKeyedSubscript:", v7, v10);
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 96), "setObject:forKeyedSubscript:", v9, v10);

    }
  }

}

void __65__MRAVConcreteOutputContext__initializeAVFNotificationForwarding__block_invoke(uint64_t a1)
{
  NSObject *v2;
  _QWORD block[5];

  objc_msgSend((id)objc_opt_class(), "notificationQueue");
  v2 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __65__MRAVConcreteOutputContext__initializeAVFNotificationForwarding__block_invoke_2;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = *(_QWORD *)(a1 + 32);
  dispatch_async(v2, block);

}

void __59__MRAVConcreteOutputContext_sharedAudioPresentationContext__block_invoke()
{
  void *v0;
  int v1;
  void *v2;
  MRAVConcreteOutputContext *v3;
  void *v4;
  void *v5;
  int v6;
  void *v7;
  NSObject *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;

  +[MRUserSettings currentSettings](MRUserSettings, "currentSettings");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v1 = objc_msgSend(v0, "supportMultiplayerHost");

  if (v1)
    +[MRAVConcreteOutputContext outputContextForLocalDevice](MRAVConcreteOutputContext, "outputContextForLocalDevice");
  else
    objc_msgSend((Class)getAVOutputContextClass[0](), "sharedAudioPresentationOutputContext");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v2)
  {
    _MRLogForCategory(0);
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      __59__MRAVConcreteOutputContext_sharedAudioPresentationContext__block_invoke_cold_1(v8, v9, v10, v11, v12, v13, v14, v15);
    goto LABEL_9;
  }
  v3 = -[MRAVConcreteOutputContext initWithAVOutputContext:type:]([MRAVConcreteOutputContext alloc], "initWithAVOutputContext:type:", v2, 1);
  v4 = (void *)sharedAudioPresentationContext___context;
  sharedAudioPresentationContext___context = (uint64_t)v3;

  +[MRUserSettings currentSettings](MRUserSettings, "currentSettings");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "supportMultiplayerHost");

  if (v6)
  {
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addObserver:selector:name:object:", sharedAudioPresentationContext___context, sel__handleLocalDeviceDidChangeOutputContextNotification_, CFSTR("MRAVOutputContextManagerLocalDeviceDidChangeOutputContextNotification"), 0);

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v8 = objc_claimAutoreleasedReturnValue();
    -[NSObject addObserver:selector:name:object:](v8, "addObserver:selector:name:object:", sharedAudioPresentationContext___context, sel__handleLocalDeviceDidChangeOutputContextNotification_, CFSTR("kMRMediaRemoteServiceClientDidRestoreConnectionNotification"), 0);
LABEL_9:

  }
}

- (MRAVConcreteOutputContext)initWithAVOutputContext:(id)a3 type:(unsigned int)a4
{
  id v6;
  MRAVConcreteOutputContext *v7;
  MRAVConcreteOutputContext *v8;
  void *v9;
  uint64_t v10;
  NSString *uniqueIdentifier;
  objc_class *v12;
  const char *Name;
  NSObject *v14;
  dispatch_queue_t v15;
  OS_dispatch_queue *serialQueue;
  MRAVOutputDeviceSourceInfo *v17;
  void *v18;
  uint64_t v19;
  MRAVOutputDeviceSourceInfo *outputDeviceSourceInfo;
  NSMutableDictionary *v21;
  NSMutableDictionary *notifications;
  objc_super v24;

  v6 = a3;
  v24.receiver = self;
  v24.super_class = (Class)MRAVConcreteOutputContext;
  v7 = -[MRAVConcreteOutputContext init](&v24, sel_init);
  v8 = v7;
  if (v7)
  {
    v7->_type = a4;
    objc_msgSend(v6, "ID");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "copy");
    uniqueIdentifier = v8->_uniqueIdentifier;
    v8->_uniqueIdentifier = (NSString *)v10;

    v12 = (objc_class *)objc_opt_class();
    Name = class_getName(v12);
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v14 = objc_claimAutoreleasedReturnValue();
    v15 = dispatch_queue_create(Name, v14);
    serialQueue = v8->_serialQueue;
    v8->_serialQueue = (OS_dispatch_queue *)v15;

    v17 = [MRAVOutputDeviceSourceInfo alloc];
    objc_msgSend(v6, "ID");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = -[MRAVOutputDeviceSourceInfo initWithRoutingContextUID:multipleBuiltInDevices:](v17, "initWithRoutingContextUID:multipleBuiltInDevices:", v18, 0);
    outputDeviceSourceInfo = v8->_outputDeviceSourceInfo;
    v8->_outputDeviceSourceInfo = (MRAVOutputDeviceSourceInfo *)v19;

    v21 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    notifications = v8->_notifications;
    v8->_notifications = v21;

    -[MRAVConcreteOutputContext setAvOutputContext:](v8, "setAvOutputContext:", v6);
    +[MRAVConcreteOutputContext _initializeAVFNotificationForwarding]();
  }

  return v8;
}

- (void)setAvOutputContext:(id)a3
{
  id v5;
  void *v6;
  __CFString *v7;
  void *v8;
  NSObject *v9;
  _BOOL4 v10;
  const char *v11;
  NSObject *v12;
  uint32_t v13;
  NSObject *serialQueue;
  id v15;
  void *v16;
  _QWORD block[5];
  id v18;
  uint8_t buf[4];
  void *v20;
  __int16 v21;
  const __CFString *v22;
  __int16 v23;
  id v24;
  __int16 v25;
  id v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MRAVConcreteOutputContext.m"), 354, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("avOutputContext"));

  }
  -[MRAVConcreteOutputContext _unregisterNotifications]((uint64_t)self);
  if (self->_type == 1)
  {
    v6 = (void *)MEMORY[0x1E0CB3940];
    v7 = (__CFString *)MRAVOutputContextTypeCopyDescription(1u);
    objc_msgSend(v6, "stringWithFormat:", CFSTR("OutputContext<%@-%p>"), v7, self);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    _MRLogForCategory(0);
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT);
    if (v5)
    {
      if (v10)
      {
        *(_DWORD *)buf = 138544130;
        v20 = v8;
        v21 = 2114;
        v22 = CFSTR("avOutputContext");
        v23 = 2112;
        v24 = v5;
        v25 = 2112;
        v26 = v5;
        v11 = "Set: %{public}@ setting %{public}@ from <%@> to <%@>";
        v12 = v9;
        v13 = 42;
LABEL_9:
        _os_log_impl(&dword_193827000, v12, OS_LOG_TYPE_DEFAULT, v11, buf, v13);
      }
    }
    else if (v10)
    {
      *(_DWORD *)buf = 138543874;
      v20 = v8;
      v21 = 2114;
      v22 = CFSTR("avOutputContext");
      v23 = 2112;
      v24 = 0;
      v11 = "Set: %{public}@ setting %{public}@ to <%@>";
      v12 = v9;
      v13 = 32;
      goto LABEL_9;
    }

  }
  serialQueue = self->_serialQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __48__MRAVConcreteOutputContext_setAvOutputContext___block_invoke;
  block[3] = &unk_1E30C5F40;
  block[4] = self;
  v18 = v5;
  v15 = v5;
  dispatch_sync(serialQueue, block);
  -[MRAVConcreteOutputContext _registerNotifications](self);
  -[MRAVConcreteOutputContext _reloadOutputDevices](self, "_reloadOutputDevices");
  -[MRAVConcreteOutputContext _reloadPredictedOutputDevice](self);
  -[MRAVConcreteOutputContext setIsVolumeControlAvailable:](self, "setIsVolumeControlAvailable:", -[MRAVConcreteOutputContext isVolumeControlAvailable](self, "isVolumeControlAvailable"));
  -[MRAVOutputContext _scheduleOutputContextDidChangeNotification](self, "_scheduleOutputContextDidChangeNotification");

}

- (void)setIsVolumeControlAvailable:(BOOL)a3
{
  self->_isVolumeControlAvailable = a3;
}

- (BOOL)isVolumeControlAvailable
{
  _BOOL4 v3;
  void *v4;
  char v5;

  v3 = -[MRAVConcreteOutputContext supportsVolumeControl](self, "supportsVolumeControl");
  if (v3)
  {
    -[MRAVConcreteOutputContext avOutputContext](self, "avOutputContext");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "canSetVolume");

    LOBYTE(v3) = v5;
  }
  return v3;
}

- (uint64_t)_unregisterNotifications
{
  uint64_t v1;
  void *v2;
  _QWORD v3[5];

  if (result)
  {
    v1 = result;
    v2 = *(void **)(result + 96);
    v3[0] = MEMORY[0x1E0C809B0];
    v3[1] = 3221225472;
    v3[2] = __53__MRAVConcreteOutputContext__unregisterNotifications__block_invoke;
    v3[3] = &unk_1E30C8C00;
    v3[4] = v1;
    objc_msgSend(v2, "enumerateKeysAndObjectsUsingBlock:", v3);
    return objc_msgSend(*(id *)(v1 + 96), "removeAllObjects");
  }
  return result;
}

- (void)_reloadPredictedOutputDevice
{
  void *v2;
  MRAVConcreteOutputDevice *v3;
  id v4;

  if (a1)
  {
    objc_msgSend(a1, "avOutputContext");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "predictedOutputDevice");
    v4 = (id)objc_claimAutoreleasedReturnValue();

    if (v4)
    {
      v3 = -[MRAVConcreteOutputDevice initWithAVOutputDevice:sourceInfo:]([MRAVConcreteOutputDevice alloc], "initWithAVOutputDevice:sourceInfo:", v4, a1[8]);
      -[MRAVConcreteOutputContext setPredictedOutputDevice:]((uint64_t)a1, v3);

    }
    else
    {
      -[MRAVConcreteOutputContext setPredictedOutputDevice:]((uint64_t)a1, 0);
    }

  }
}

- (id)predictedOutputDevice
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
  v7 = __Block_byref_object_copy__10;
  v8 = __Block_byref_object_dispose__10;
  v9 = 0;
  msv_dispatch_sync_on_queue();
  v2 = (id)v5[5];
  _Block_object_dispose(&v4, 8);

  return v2;
}

- (void)setPredictedOutputDevice:(uint64_t)a1
{
  id v3;
  void *v4;
  NSObject *v5;
  id v6;
  NSObject *v7;
  void *v8;
  _QWORD block[5];
  id v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  char v15;
  uint8_t buf[4];
  void *v17;
  __int16 v18;
  uint64_t v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = v3;
  if (a1)
  {
    v12 = 0;
    v13 = &v12;
    v14 = 0x2020000000;
    v15 = 0;
    v5 = *(NSObject **)(a1 + 72);
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __54__MRAVConcreteOutputContext_setPredictedOutputDevice___block_invoke;
    block[3] = &unk_1E30C74D0;
    v11 = &v12;
    block[4] = a1;
    v6 = v3;
    v10 = v6;
    dispatch_sync(v5, block);
    if (*((_BYTE *)v13 + 24))
    {
      _MRLogForCategory(0);
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(v6, "uid");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v17 = v8;
        v18 = 2114;
        v19 = a1;
        _os_log_impl(&dword_193827000, v7, OS_LOG_TYPE_DEFAULT, "[ConcreteOutputContext] Predicted output device changed to: %{public}@ for context: %{public}@", buf, 0x16u);

      }
      -[MRAVConcreteOutputContext _notifyPredictedOutputDeviceDidChange:](a1, v6);
    }

    _Block_object_dispose(&v12, 8);
  }

}

- (void)_reloadOutputDevices
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  MRAVConcreteOutputDevice *v12;
  MRAVConcreteOutputDevice *v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[MRAVConcreteOutputContext avOutputContext](self, "avOutputContext");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "outputDevices");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v16 = 0u;
  v17 = 0u;
  v14 = 0u;
  v15 = 0u;
  v6 = v5;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v15;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v15 != v9)
          objc_enumerationMutation(v6);
        v11 = *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * v10);
        v12 = [MRAVConcreteOutputDevice alloc];
        v13 = -[MRAVConcreteOutputDevice initWithAVOutputDevice:sourceInfo:](v12, "initWithAVOutputDevice:sourceInfo:", v11, self->_outputDeviceSourceInfo, (_QWORD)v14);
        if (v13)
          objc_msgSend(v3, "addObject:", v13);

        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v8);
  }

  -[MRAVConcreteOutputContext setConcreteOutputDevices:](self, "setConcreteOutputDevices:", v3);
  -[MRAVOutputContext _reloadWithOutputDevices:](self, "_reloadWithOutputDevices:", v3);

}

- (void)setConcreteOutputDevices:(id)a3
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
  block[2] = __54__MRAVConcreteOutputContext_setConcreteOutputDevices___block_invoke;
  block[3] = &unk_1E30C5F40;
  block[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_sync(serialQueue, block);

}

+ (void)_initializeAVFNotificationForwarding
{
  uint64_t v0;
  _QWORD block[5];

  v0 = objc_opt_self();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __65__MRAVConcreteOutputContext__initializeAVFNotificationForwarding__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = v0;
  if (_initializeAVFNotificationForwarding___once != -1)
    dispatch_once(&_initializeAVFNotificationForwarding___once, block);
}

+ (id)sharedAudioPresentationContext
{
  if (sharedAudioPresentationContext___once != -1)
    dispatch_once(&sharedAudioPresentationContext___once, &__block_literal_global_33);
  return (id)sharedAudioPresentationContext___context;
}

- (id)uniqueIdentifier
{
  NSObject *serialQueue;
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
  v9 = __Block_byref_object_copy__10;
  v10 = __Block_byref_object_dispose__10;
  v11 = 0;
  serialQueue = self->_serialQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __45__MRAVConcreteOutputContext_uniqueIdentifier__block_invoke;
  v5[3] = &unk_1E30C5D20;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(serialQueue, v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

void __50__MRAVConcreteOutputContext_predictedOutputDevice__block_invoke(uint64_t a1)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), *(id *)(*(_QWORD *)(a1 + 32) + 56));
}

void __65__MRAVConcreteOutputContext__initializeAVFNotificationForwarding__block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  id v10;
  _QWORD v11[4];
  id v12;
  uint64_t v13;
  _QWORD v14[4];
  id v15;
  uint64_t v16;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  getAVOutputContextOutputDeviceDidChangeNotification();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = MEMORY[0x1E0C809B0];
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __65__MRAVConcreteOutputContext__initializeAVFNotificationForwarding__block_invoke_4;
  v14[3] = &unk_1E30C8C98;
  v5 = *(_QWORD *)(a1 + 32);
  v15 = &__block_literal_global_107;
  v16 = v5;
  v6 = (id)objc_msgSend(v2, "addObserverForName:object:queue:usingBlock:", v3, 0, 0, v14);

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  getAVOutputContextOutputDevicesDidChangeNotification();
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = v4;
  v11[1] = 3221225472;
  v11[2] = __65__MRAVConcreteOutputContext__initializeAVFNotificationForwarding__block_invoke_6;
  v11[3] = &unk_1E30C8C98;
  v9 = *(_QWORD *)(a1 + 32);
  v12 = &__block_literal_global_107;
  v13 = v9;
  v10 = (id)objc_msgSend(v7, "addObserverForName:object:queue:usingBlock:", v8, 0, 0, v11);

}

void __48__MRAVConcreteOutputContext_setAvOutputContext___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 88), *(id *)(a1 + 40));
  objc_msgSend(*(id *)(a1 + 40), "contextID");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(void **)(v3 + 32);
  *(_QWORD *)(v3 + 32) = v2;

}

- (id)contextID
{
  void *v2;
  void *v3;

  -[MRAVConcreteOutputContext avOutputContext](self, "avOutputContext");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "contextID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (unsigned)type
{
  return self->_type;
}

void __54__MRAVConcreteOutputContext_setConcreteOutputDevices___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  id v4;

  v2 = *(_QWORD *)(a1 + 40);
  if (v2)
    v3 = (void *)objc_msgSend(*(id *)(a1 + 40), "copy");
  else
    v3 = (void *)MEMORY[0x1E0C9AA60];
  v4 = v3;
  objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 48), v3);
  if (v2)

}

void __54__MRAVConcreteOutputContext_setPredictedOutputDevice___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  char v4;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 56), "uid");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "uid");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2 == v3)
    v4 = 0;
  else
    v4 = objc_msgSend(v2, "isEqual:", v3) ^ 1;
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = v4;

  objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 56), *(id *)(a1 + 40));
}

+ (id)sharedSystemAudioContext
{
  if (sharedSystemAudioContext___once != -1)
    dispatch_once(&sharedSystemAudioContext___once, &__block_literal_global_6_1);
  return (id)sharedSystemAudioContext___context;
}

void __53__MRAVConcreteOutputContext_sharedSystemAudioContext__block_invoke()
{
  void *v0;
  MRAVConcreteOutputContext *v1;
  void *v2;
  NSObject *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  objc_msgSend((Class)getAVOutputContextClass[0](), "sharedSystemAudioContext");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  if (v0)
  {
    v1 = -[MRAVConcreteOutputContext initWithAVOutputContext:type:]([MRAVConcreteOutputContext alloc], "initWithAVOutputContext:type:", v0, 2);
    v2 = (void *)sharedSystemAudioContext___context;
    sharedSystemAudioContext___context = (uint64_t)v1;

  }
  else
  {
    _MRLogForCategory(0);
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
      __53__MRAVConcreteOutputContext_sharedSystemAudioContext__block_invoke_cold_1(v3, v4, v5, v6, v7, v8, v9, v10);

  }
}

+ (id)sharedSystemScreenContext
{
  if (sharedSystemScreenContext___once != -1)
    dispatch_once(&sharedSystemScreenContext___once, &__block_literal_global_7_1);
  return (id)sharedSystemScreenContext___context;
}

void __54__MRAVConcreteOutputContext_sharedSystemScreenContext__block_invoke()
{
  void *v0;
  MRAVConcreteOutputContext *v1;
  void *v2;
  NSObject *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  objc_msgSend((Class)getAVOutputContextClass[0](), "sharedSystemScreenContext");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  if (v0)
  {
    v1 = -[MRAVConcreteOutputContext initWithAVOutputContext:type:]([MRAVConcreteOutputContext alloc], "initWithAVOutputContext:type:", v0, 3);
    v2 = (void *)sharedSystemScreenContext___context;
    sharedSystemScreenContext___context = (uint64_t)v1;

  }
  else
  {
    _MRLogForCategory(0);
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
      __54__MRAVConcreteOutputContext_sharedSystemScreenContext__block_invoke_cold_1(v3, v4, v5, v6, v7, v8, v9, v10);

  }
}

+ (id)iTunesContext
{
  void *v2;
  MRAVConcreteOutputContext *v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  objc_msgSend((Class)getAVOutputContextClass[0](), "iTunesAudioContext");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    v3 = -[MRAVConcreteOutputContext initWithAVOutputContext:type:]([MRAVConcreteOutputContext alloc], "initWithAVOutputContext:type:", v2, 4);
  }
  else
  {
    _MRLogForCategory(0);
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      +[MRAVConcreteOutputContext iTunesContext].cold.1(v4, v5, v6, v7, v8, v9, v10, v11);

    v3 = 0;
  }

  return v3;
}

+ (id)createOutputContextWithUniqueIdentifier:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  MRAVConcreteOutputContext *v7;
  void *v8;
  NSObject *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;

  v4 = a3;
  if (v4)
  {
    objc_msgSend((Class)getAVOutputContextClass[0](), "sharedAudioPresentationOutputContext");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "ID");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v6, "isEqualToString:", v4))
    {
      objc_msgSend(a1, "sharedAudioPresentationContext");
      v7 = (MRAVConcreteOutputContext *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      objc_msgSend((Class)getAVOutputContextClass[0](), "outputContextForID:", v4);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      if (v8)
      {
        v7 = -[MRAVConcreteOutputContext initWithAVOutputContext:type:]([MRAVConcreteOutputContext alloc], "initWithAVOutputContext:type:", v8, 5);
      }
      else
      {
        _MRLogForCategory(0);
        v9 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
          +[MRAVConcreteOutputContext createOutputContextWithUniqueIdentifier:].cold.1((uint64_t)v4, v9, v10, v11, v12, v13, v14, v15);

        v7 = 0;
      }

    }
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (void)dealloc
{
  objc_super v3;

  -[MRAVConcreteOutputContext _unregisterNotifications]((uint64_t)self);
  v3.receiver = self;
  v3.super_class = (Class)MRAVConcreteOutputContext;
  -[MRAVConcreteOutputContext dealloc](&v3, sel_dealloc);
}

- (id)description
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
  v7 = __Block_byref_object_copy__10;
  v8 = __Block_byref_object_dispose__10;
  v9 = 0;
  msv_dispatch_sync_on_queue();
  v2 = (id)v5[5];
  _Block_object_dispose(&v4, 8);

  return v2;
}

void __40__MRAVConcreteOutputContext_description__block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  __CFString *v9;

  v2 = (void *)MEMORY[0x1E0CB3940];
  v3 = objc_opt_class();
  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(_QWORD *)(v4 + 32);
  v9 = (__CFString *)MRAVOutputContextTypeCopyDescription(*(_DWORD *)(v4 + 40));
  objc_msgSend(v2, "stringWithFormat:", CFSTR("<%@: %p uid=%@ type=%@ avOutputContext=%@>"), v3, v4, v5, v9, *(_QWORD *)(*(_QWORD *)(a1 + 32) + 88));
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = v6;

}

- (id)debugDescription
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x1E0CB3940];
  -[MRAVConcreteOutputContext description](self, "description");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[MRAVOutputContext outputDevices](self, "outputDevices");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (void)setOutputContextForLocalDeviceDataSource:(id)a3
{
  uint64_t v3;
  void *v4;

  v3 = MEMORY[0x194036C44](a3, a2);
  v4 = (void *)_outputContextForLocalDeviceDataSource;
  _outputContextForLocalDeviceDataSource = v3;

}

+ (id)outputContextForLocalDeviceDataSource
{
  return (id)MEMORY[0x194036C44](_outputContextForLocalDeviceDataSource, a2);
}

+ (AVOutputContext)outputContextForLocalDevice
{
  void *v3;
  void *v4;
  void *v5;
  __CFString *v6;
  NSObject *v7;
  void *v8;
  void (**v9)(void);
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  NSObject *v17;
  NSObject *v18;
  NSObject *v19;
  void *v20;
  uint64_t v21;
  const char *v22;
  NSObject *v23;
  uint32_t v24;
  uint64_t v25;
  void *v26;
  id v28;
  uint8_t buf[4];
  const __CFString *v30;
  __int16 v31;
  void *v32;
  __int16 v33;
  id v34;
  __int16 v35;
  uint64_t v36;
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "UUIDString");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C99D68], "now");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (__CFString *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37A0]), "initWithFormat:", CFSTR("%@<%@>"), CFSTR("outputContextForLocalDevice"), v4);
  _MRLogForCategory(0xAuLL);
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v30 = v6;
    _os_log_impl(&dword_193827000, v7, OS_LOG_TYPE_DEFAULT, "Request: %{public}@", buf, 0xCu);
  }

  objc_msgSend(a1, "outputContextForLocalDeviceDataSource");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    objc_msgSend(a1, "outputContextForLocalDeviceDataSource");
    v9 = (void (**)(void))objc_claimAutoreleasedReturnValue();
    v9[2]();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = 0;
  }
  else
  {
    MRCreateXPCMessage(0x300000000000025uLL);
    v9 = (void (**)(void))objc_claimAutoreleasedReturnValue();
    +[MRMediaRemoteServiceClient sharedServiceClient](MRMediaRemoteServiceClient, "sharedServiceClient");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "service");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "mrXPCConnection");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = 0;
    objc_msgSend(v14, "sendSyncMessage:error:", v9, &v28);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v28;

    MRCreateStringFromXPCMessage(v15, "MRXPC_ROUTING_CONTEXT_UID_KEY");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    _MRLogForCategory(0xAuLL);
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543874;
      v30 = CFSTR("outputContextForLocalDevice");
      v31 = 2114;
      v32 = v4;
      v33 = 2112;
      v34 = v16;
      _os_log_impl(&dword_193827000, v17, OS_LOG_TYPE_DEFAULT, "Update: %{public}@<%{public}@> %@", buf, 0x20u);
    }

    objc_msgSend((Class)getAVOutputContextClass[0](), "outputContextForID:", v16);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

  }
  _MRLogForCategory(0xAuLL);
  v18 = objc_claimAutoreleasedReturnValue();
  v19 = v18;
  if (v11 || !v10)
  {
    if (v11)
    {
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend(MEMORY[0x1E0C99D68], "date");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "timeIntervalSinceDate:", v5);
        *(_DWORD *)buf = 138544130;
        v30 = CFSTR("outputContextForLocalDevice");
        v31 = 2114;
        v32 = v4;
        v33 = 2114;
        v34 = v11;
        v35 = 2048;
        v36 = v25;
        _os_log_error_impl(&dword_193827000, v19, OS_LOG_TYPE_ERROR, "Response: %{public}@<%{public}@> returned with error <%{public}@> in %.4lf seconds", buf, 0x2Au);
LABEL_18:

      }
    }
    else if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(MEMORY[0x1E0C99D68], "date");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "timeIntervalSinceDate:", v5);
      *(_DWORD *)buf = 138543874;
      v30 = CFSTR("outputContextForLocalDevice");
      v31 = 2114;
      v32 = v4;
      v33 = 2048;
      v34 = v26;
      v22 = "Response: %{public}@<%{public}@> returned in %.4lf seconds";
      v23 = v19;
      v24 = 32;
      goto LABEL_17;
    }
  }
  else if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "timeIntervalSinceDate:", v5);
    *(_DWORD *)buf = 138544130;
    v30 = CFSTR("outputContextForLocalDevice");
    v31 = 2114;
    v32 = v4;
    v33 = 2112;
    v34 = v10;
    v35 = 2048;
    v36 = v21;
    v22 = "Response: %{public}@<%{public}@> returned <%@> in %.4lf seconds";
    v23 = v19;
    v24 = 42;
LABEL_17:
    _os_log_impl(&dword_193827000, v23, OS_LOG_TYPE_DEFAULT, v22, buf, v24);
    goto LABEL_18;
  }

  return (AVOutputContext *)v10;
}

- (NSArray)concreteOutputDevices
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
  v7 = __Block_byref_object_copy__10;
  v8 = __Block_byref_object_dispose__10;
  v9 = 0;
  msv_dispatch_sync_on_queue();
  v2 = (id)v5[5];
  _Block_object_dispose(&v4, 8);

  return (NSArray *)v2;
}

void __50__MRAVConcreteOutputContext_concreteOutputDevices__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  v2 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 48), "copy");
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (BOOL)supportsMultipleBluetoothOutputDevices
{
  void *v2;
  char v3;

  -[MRAVConcreteOutputContext avOutputContext](self, "avOutputContext");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "supportsMultipleBluetoothOutputDevices");

  return v3;
}

- (void)_notifyPredictedOutputDeviceDidChange:(uint64_t)a1
{
  id v3;
  NSObject *v4;
  _QWORD v5[4];
  id v6;
  uint64_t v7;

  v3 = a2;
  if (a1)
  {
    objc_msgSend((id)objc_opt_class(), "notificationQueue");
    v4 = objc_claimAutoreleasedReturnValue();
    v5[0] = MEMORY[0x1E0C809B0];
    v5[1] = 3221225472;
    v5[2] = __67__MRAVConcreteOutputContext__notifyPredictedOutputDeviceDidChange___block_invoke;
    v5[3] = &unk_1E30C5F40;
    v6 = v3;
    v7 = a1;
    dispatch_async(v4, v5);

  }
}

- (void)modifyTopologyWithRequest:(id)a3 withReplyQueue:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  MRAVOutputContextModification *v11;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  v11 = -[MRAVOutputContextModification initWithRequest:]([MRAVOutputContextModification alloc], "initWithRequest:", v10);

  -[MRAVOutputContextModification modifyWithOutputContext:queue:completion:](v11, "modifyWithOutputContext:queue:completion:", self, v9, v8);
}

- (void)resetPredictedOutputDevice
{
  id v2;

  -[MRAVConcreteOutputContext avOutputContext](self, "avOutputContext");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "resetPredictedOutputDevice");

}

- (void)attemptLogicalDeviceRecovery
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_debug_impl(&dword_193827000, log, OS_LOG_TYPE_DEBUG, "[ConcreteOutputContext] Did not find any incomplete logical devices.", v1, 2u);
}

void __57__MRAVConcreteOutputContext_attemptLogicalDeviceRecovery__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;

  v5 = a2;
  if ((unint64_t)objc_msgSend(a3, "count") <= 1)
    objc_msgSend(*(id *)(a1 + 32), "addObject:", v5);

}

void __57__MRAVConcreteOutputContext_attemptLogicalDeviceRecovery__block_invoke_48(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  uint64_t v17;
  NSObject *v18;
  NSObject *v19;
  _QWORD v20[4];
  id v21;
  uint64_t v22;
  _QWORD v23[4];
  id v24;

  v7 = a2;
  v8 = a3;
  v9 = a4;
  v10 = *(id *)(a1 + 32);
  if (v9 || !objc_msgSend(v7, "count"))
  {
    _MRLogForCategory(0);
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      __57__MRAVConcreteOutputContext_attemptLogicalDeviceRecovery__block_invoke_48_cold_1((uint64_t)v9, (uint64_t)v7, v11);

    *(_BYTE *)(*(_QWORD *)(a1 + 40) + 80) = 0;
  }
  else
  {
    v12 = MEMORY[0x1E0C809B0];
    v23[0] = MEMORY[0x1E0C809B0];
    v23[1] = 3221225472;
    v23[2] = __57__MRAVConcreteOutputContext_attemptLogicalDeviceRecovery__block_invoke_49;
    v23[3] = &unk_1E30C8B88;
    v24 = *(id *)(a1 + 48);
    objc_msgSend(v7, "indexesOfObjectsPassingTest:", v23);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "objectsAtIndexes:", v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v14, "count"))
    {
      v15 = *(void **)(a1 + 40);
      v20[0] = v12;
      v20[1] = 3221225472;
      v20[2] = __57__MRAVConcreteOutputContext_attemptLogicalDeviceRecovery__block_invoke_53;
      v20[3] = &unk_1E30C8BB0;
      v16 = v14;
      v17 = *(_QWORD *)(a1 + 40);
      v21 = v16;
      v22 = v17;
      objc_msgSend(v15, "addOutputDevices:withCallbackQueue:block:", v16, 0, v20);

    }
    else
    {
      _MRLogForCategory(0);
      v18 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
        __57__MRAVConcreteOutputContext_attemptLogicalDeviceRecovery__block_invoke_48_cold_3(v18);

      _MRLogForCategory(0);
      v19 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
        __57__MRAVConcreteOutputContext_attemptLogicalDeviceRecovery__block_invoke_48_cold_2(v7, (id *)(a1 + 48), v19);

      *(_BYTE *)(*(_QWORD *)(a1 + 40) + 80) = 0;
    }

  }
}

uint64_t __57__MRAVConcreteOutputContext_attemptLogicalDeviceRecovery__block_invoke_49(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  uint64_t v4;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(a2, "uid");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v2, "containsObject:", v3) ^ 1;

  return v4;
}

void __57__MRAVConcreteOutputContext_attemptLogicalDeviceRecovery__block_invoke_53(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  int v13;
  uint64_t v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  _MRLogForCategory(0);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      __57__MRAVConcreteOutputContext_attemptLogicalDeviceRecovery__block_invoke_53_cold_1((uint64_t)v3, v5, v6, v7, v8, v9, v10, v11);
  }
  else if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v12 = objc_msgSend(*(id *)(a1 + 32), "count");
    v13 = 134217984;
    v14 = v12;
    _os_log_impl(&dword_193827000, v5, OS_LOG_TYPE_DEFAULT, "[ConcreteOutputContext] Successfully recovered missing logical devices: %ld", (uint8_t *)&v13, 0xCu);
  }

  *(_BYTE *)(*(_QWORD *)(a1 + 40) + 80) = 0;
}

- (unsigned)volumeControlCapabilities
{
  NSObject *serialQueue;
  unsigned int v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  int v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  serialQueue = self->_serialQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __54__MRAVConcreteOutputContext_volumeControlCapabilities__block_invoke;
  v5[3] = &unk_1E30C5D20;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(serialQueue, v5);
  v3 = *((_DWORD *)v7 + 6);
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __54__MRAVConcreteOutputContext_volumeControlCapabilities__block_invoke(uint64_t a1)
{
  uint64_t result;
  int v3;

  result = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 88), "volumeControlType");
  v3 = 4 * (result == 2);
  if (result == 1)
    v3 = 2;
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = v3;
  return result;
}

- (float)volume
{
  void *v3;
  float v4;
  float v5;

  if (!-[MRAVConcreteOutputContext isVolumeControlAvailable](self, "isVolumeControlAvailable"))
    return 0.0;
  -[MRAVConcreteOutputContext avOutputContext](self, "avOutputContext");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "volume");
  v5 = v4;

  return v5;
}

- (void)setVolume:(float)a3 details:(id)a4
{
  objc_class *v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  NSObject *v14;
  NSObject *v15;
  double v16;
  uint8_t buf[4];
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v6 = (objc_class *)MEMORY[0x1E0CB3940];
  v7 = a4;
  v8 = [v6 alloc];
  -[MRAVConcreteOutputContext contextID](self, "contextID");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v8, "initWithFormat:", CFSTR("%@ -> %lf"), v9, a3);

  v11 = objc_alloc(MEMORY[0x1E0CB37A0]);
  objc_msgSend(v7, "requestID");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = (void *)objc_msgSend(v11, "initWithFormat:", CFSTR("%@<%@>"), CFSTR("ConcreteOutputContext.setVolume"), v12);
  if (v10)
    objc_msgSend(v13, "appendFormat:", CFSTR(" for %@"), v10);
  _MRLogForCategory(0xAuLL);
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v18 = v13;
    _os_log_impl(&dword_193827000, v14, OS_LOG_TYPE_DEFAULT, "Request: %{public}@", buf, 0xCu);
  }

  if (-[MRAVConcreteOutputContext isVolumeControlAvailable](self, "isVolumeControlAvailable"))
  {
    -[MRAVConcreteOutputContext avOutputContext](self, "avOutputContext");
    v15 = objc_claimAutoreleasedReturnValue();
    *(float *)&v16 = a3;
    -[NSObject setVolume:](v15, "setVolume:", v16);
  }
  else
  {
    _MRLogForCategory(0);
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_193827000, v15, OS_LOG_TYPE_DEFAULT, "[ConcreteOutputContext] Volume control is not available, ignoring setVolume request.", buf, 2u);
    }
  }

}

- (void)adjustVolume:(int64_t)a3 details:(id)a4
{
  objc_class *v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  NSObject *v15;
  void *v16;
  uint8_t buf[4];
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v6 = (objc_class *)MEMORY[0x1E0CB3940];
  v7 = a4;
  v8 = [v6 alloc];
  -[MRAVConcreteOutputContext contextID](self, "contextID");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  MRMediaRemoteVolumeControlAdjustmentDescription(a3);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_msgSend(v8, "initWithFormat:", CFSTR("%@ -> %@"), v9, v10);

  v12 = objc_alloc(MEMORY[0x1E0CB37A0]);
  objc_msgSend(v7, "requestID");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v14 = (void *)objc_msgSend(v12, "initWithFormat:", CFSTR("%@<%@>"), CFSTR("ConcreteOutputContext.adjustVolume"), v13);
  if (v11)
    objc_msgSend(v14, "appendFormat:", CFSTR(" for %@"), v11);
  _MRLogForCategory(0xAuLL);
  v15 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v18 = v14;
    _os_log_impl(&dword_193827000, v15, OS_LOG_TYPE_DEFAULT, "Request: %{public}@", buf, 0xCu);
  }

  -[MRAVConcreteOutputContext avOutputContext](self, "avOutputContext");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v16, "volumeControlType") == 2)
  {
    if ((unint64_t)(a3 - 1) > 2)
    {
      if ((unint64_t)(a3 - 4) <= 2)
        objc_msgSend(v16, "decreaseVolumeByCount:", 1);
    }
    else
    {
      objc_msgSend(v16, "increaseVolumeByCount:", 1);
    }
  }

}

- (BOOL)isVolumeMuted
{
  void *v2;
  char v3;

  -[MRAVConcreteOutputContext avOutputContext](self, "avOutputContext");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isMuted");

  return v3;
}

- (void)setVolumeMuted:(BOOL)a3 details:(id)a4
{
  _BOOL8 v4;
  objc_class *v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  NSObject *v14;
  void *v15;
  uint8_t buf[4];
  void *v17;
  uint64_t v18;

  v4 = a3;
  v18 = *MEMORY[0x1E0C80C00];
  v6 = (objc_class *)MEMORY[0x1E0CB3940];
  v7 = a4;
  v8 = [v6 alloc];
  -[MRAVConcreteOutputContext contextID](self, "contextID");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v8, "initWithFormat:", CFSTR("%@ -> %u"), v9, v4);

  v11 = objc_alloc(MEMORY[0x1E0CB37A0]);
  objc_msgSend(v7, "requestID");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = (void *)objc_msgSend(v11, "initWithFormat:", CFSTR("%@<%@>"), CFSTR("ConcreteOutputContext.setVolumeMuted"), v12);
  if (v10)
    objc_msgSend(v13, "appendFormat:", CFSTR(" for %@"), v10);
  _MRLogForCategory(0xAuLL);
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v17 = v13;
    _os_log_impl(&dword_193827000, v14, OS_LOG_TYPE_DEFAULT, "Request: %{public}@", buf, 0xCu);
  }

  -[MRAVConcreteOutputContext avOutputContext](self, "avOutputContext");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setMuted:", v4);

}

- (void)_handleOutputDevicesDidChangeNotification:(id)a3
{
  void *v4;
  MRAVConcreteOutputContext *v5;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;

  v15 = a3;
  v4 = (void *)MRMediaRemoteCopyDeviceUID();

  +[MRAVConcreteOutputContext sharedAudioPresentationContext](MRAVConcreteOutputContext, "sharedAudioPresentationContext");
  v5 = (MRAVConcreteOutputContext *)objc_claimAutoreleasedReturnValue();

  if (MRProcessIsMediaRemoteDaemon())
  {
    if (v5 == self && v4 == 0)
    {
      objc_msgSend(v15, "userInfo");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      getAVOutputContextDestinationChangeReasonKey[0]();
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "objectForKeyedSubscript:", v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      getAVOutputContextDestinationChangeReasonIdleDisconnect[0]();
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v9, "isEqualToString:", v10);

      if (v11)
      {
        objc_msgSend(v15, "userInfo");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        getAVOutputContextDestinationChangePreviousDeviceIDsKey();
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "objectForKeyedSubscript:", v13);
        v14 = (void *)objc_claimAutoreleasedReturnValue();

        -[MRAVConcreteOutputContext _handleOutputDevicesTimedOut:]((uint64_t)self, v14);
      }
    }
  }
  -[MRAVOutputContext _scheduleOutputContextDevicesDidChangeNotification](self, "_scheduleOutputContextDevicesDidChangeNotification");

}

- (void)_handleOutputDevicesTimedOut:(uint64_t)a1
{
  id v3;
  NSObject *v4;
  NSObject *v5;
  uint64_t v6;
  id v7;
  uint64_t v8;
  _QWORD v9[5];
  id v10;
  _QWORD block[5];
  id v12;
  __int128 *p_buf;
  __int128 buf;
  uint64_t v15;
  char v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (a1)
  {
    _MRLogForCategory(0);
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      LODWORD(buf) = 138543362;
      *(_QWORD *)((char *)&buf + 4) = v3;
      _os_log_impl(&dword_193827000, v4, OS_LOG_TYPE_DEFAULT, "[ConcreteOutputContext] AirPlay routes timed out: %{public}@", (uint8_t *)&buf, 0xCu);
    }

    *(_QWORD *)&buf = 0;
    *((_QWORD *)&buf + 1) = &buf;
    v15 = 0x2020000000;
    v5 = *(NSObject **)(a1 + 72);
    v6 = MEMORY[0x1E0C809B0];
    v16 = 0;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __58__MRAVConcreteOutputContext__handleOutputDevicesTimedOut___block_invoke;
    block[3] = &unk_1E30C8C28;
    block[4] = a1;
    v7 = v3;
    v12 = v7;
    p_buf = &buf;
    dispatch_sync(v5, block);
    if (*(_BYTE *)(*((_QWORD *)&buf + 1) + 24))
    {
      v8 = *(_QWORD *)(a1 + 72);
      v9[0] = v6;
      v9[1] = 3221225472;
      v9[2] = __58__MRAVConcreteOutputContext__handleOutputDevicesTimedOut___block_invoke_2;
      v9[3] = &unk_1E30C8C50;
      v9[4] = a1;
      v10 = v7;
      +[MRAVEndpoint createEndpointWithOutputDeviceUIDs:queue:completion:](MRAVEndpoint, "createEndpointWithOutputDeviceUIDs:queue:completion:", v10, v8, v9);

    }
    _Block_object_dispose(&buf, 8);
  }

}

- (void)_outputContextChangeInitiatedNotification:(id)a3
{
  id v4;
  NSObject *v5;
  int v6;
  id v7;
  __int16 v8;
  MRAVConcreteOutputContext *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (self && ((MRProcessIsMediaRemoteDaemon() & 1) != 0 || -[MRAVConcreteOutputContext type](self, "type") == 3))
  {
    _MRLogForCategory(0);
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v6 = 138543618;
      v7 = v4;
      v8 = 2114;
      v9 = self;
      _os_log_impl(&dword_193827000, v5, OS_LOG_TYPE_DEFAULT, "[ConcreteOutputContext] Received output context change initiated notification: %{public}@ for context: %{public}@", (uint8_t *)&v6, 0x16u);
    }

  }
}

void __53__MRAVConcreteOutputContext__unregisterNotifications__block_invoke(uint64_t a1, void *a2, void *a3)
{
  void *v5;
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  id v10;
  id v11;

  v5 = (void *)MEMORY[0x1E0CB37D0];
  v6 = a3;
  v7 = a2;
  objc_msgSend(v5, "defaultCenter");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  v8 = *(_QWORD *)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0C99E38], "null");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v6, "isEqual:", v9))
    v10 = 0;
  else
    v10 = v6;
  objc_msgSend(v11, "removeObserver:name:object:", v8, v7, v10);

}

- (void)_handleOutputContextSupportsVolumeDidChangeNotification:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  NSObject *v7;
  int v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  uint8_t buf[4];
  int v17;
  __int16 v18;
  void *v19;
  __int16 v20;
  MRAVConcreteOutputContext *v21;
  __int16 v22;
  void *v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = -[MRAVConcreteOutputContext volumeControlCapabilities](self, "volumeControlCapabilities");
  if (self && ((MRProcessIsMediaRemoteDaemon() & 1) != 0 || -[MRAVConcreteOutputContext type](self, "type") == 3))
  {
    -[MRAVConcreteOutputContext avOutputContext](self, "avOutputContext");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    _MRLogForCategory(0);
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v8 = objc_msgSend(v6, "providesControlForAllVolumeFeatures");
      v9 = (void *)MRMediaRemotePickedRouteVolumeControlCapabilitiesCopyDescription(v5);
      objc_msgSend(v4, "name");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 67109890;
      v17 = v8;
      v18 = 2114;
      v19 = v9;
      v20 = 2114;
      v21 = self;
      v22 = 2114;
      v23 = v10;
      _os_log_impl(&dword_193827000, v7, OS_LOG_TYPE_DEFAULT, "[ConcreteOutputContext] ProvidesVolumeFeatures did change to %{BOOL}u, capabilities: %{public}@  for context: %{public}@ - %{public}@", buf, 0x26u);

    }
  }
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v5, CFSTR("MRAVOutputContextVolumeControlCapabilitiesUserInfoKey"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = v12;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v15, &v14, 1);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "postNotificationName:object:userInfo:", CFSTR("MRAVOutputContextVolumeControlCapabilitiesDidChangeNotification"), self, v13);

}

- (void)_handleOutputDeviceCanSetVolumeDidChangeNotification:(id)a3
{
  void *v4;
  id v5;

  objc_msgSend(a3, "object");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "deviceID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[MRAVConcreteOutputContext _postVolumeCapabilitiesChangedNotificationForUID:](self, v4);

}

- (void)_postVolumeCapabilitiesChangedNotificationForUID:(void *)a1
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  uint64_t v9;
  void *v10;
  NSObject *v11;
  void *v12;
  int v13;
  void *v14;
  void *v15;
  void *v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _QWORD v21[2];
  _QWORD v22[2];
  uint8_t buf[4];
  void *v24;
  __int16 v25;
  int v26;
  __int16 v27;
  void *v28;
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (a1)
  {
    v19 = 0u;
    v20 = 0u;
    v17 = 0u;
    v18 = 0u;
    objc_msgSend(a1, "concreteOutputDevices", 0);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v17, v29, 16);
    if (v5)
    {
      v6 = v5;
      v7 = *(_QWORD *)v18;
      while (2)
      {
        for (i = 0; i != v6; ++i)
        {
          if (*(_QWORD *)v18 != v7)
            objc_enumerationMutation(v4);
          objc_msgSend(*(id *)(*((_QWORD *)&v17 + 1) + 8 * i), "effectiveOutputDeviceForUID:", v3);
          v9 = objc_claimAutoreleasedReturnValue();
          if (v9)
          {
            v10 = (void *)v9;
            if ((MRProcessIsMediaRemoteDaemon() & 1) != 0 || objc_msgSend(a1, "type") == 3)
            {
              _MRLogForCategory(0);
              v11 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
              {
                objc_msgSend(v10, "uid");
                v12 = (void *)objc_claimAutoreleasedReturnValue();
                v13 = objc_msgSend(v10, "isVolumeControlAvailable");
                *(_DWORD *)buf = 138543874;
                v24 = v12;
                v25 = 1024;
                v26 = v13;
                v27 = 2114;
                v28 = a1;
                _os_log_impl(&dword_193827000, v11, OS_LOG_TYPE_DEFAULT, "[ConcreteOutputContext] Output device %{public}@ did change isVolumeControlAvailable to %{BOOL}u for context: %{public}@", buf, 0x1Cu);

              }
            }
            objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            v21[0] = CFSTR("MRAVOutputContextOutputDeviceUserInfoKey");
            v21[1] = CFSTR("MRAVOutputContextVolumeControlCapabilitiesUserInfoKey");
            v22[0] = v10;
            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", objc_msgSend(v10, "volumeCapabilities"));
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            v22[1] = v15;
            objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v22, v21, 2);
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v14, "postNotificationName:object:userInfo:", CFSTR("MRAVOutputContextVolumeControlCapabilitiesDidChangeNotification"), a1, v16);

            goto LABEL_17;
          }
        }
        v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v17, v29, 16);
        if (v6)
          continue;
        break;
      }
    }
LABEL_17:

  }
}

- (void)_handleCanMuteDidChangeNotification:(id)a3
{
  void *v4;
  id v5;

  objc_msgSend(a3, "object");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "ID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[MRAVConcreteOutputContext _postVolumeCapabilitiesChangedNotificationForUID:](self, v4);

}

- (void)_handleClusterMemberCanMuteDidChangeNotification:(id)a3
{
  void *v4;
  id v5;

  objc_msgSend(a3, "object");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "ID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[MRAVConcreteOutputContext _postVolumeCapabilitiesChangedNotificationForUID:](self, v4);

}

- (void)_handleOutputDeviceVolumeDidChangeNotification:(id)a3
{
  void *v4;
  id v5;

  objc_msgSend(a3, "object");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "deviceID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[MRAVConcreteOutputContext _postVolumeChangedNotificationForUID:](self, v4);

}

- (void)_postVolumeChangedNotificationForUID:(void *)a1
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _QWORD v19[2];
  _QWORD v20[2];
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (a1)
  {
    v17 = 0u;
    v18 = 0u;
    v15 = 0u;
    v16 = 0u;
    objc_msgSend(a1, "concreteOutputDevices", 0);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v15, v21, 16);
    if (v5)
    {
      v6 = v5;
      v7 = *(_QWORD *)v16;
      while (2)
      {
        for (i = 0; i != v6; ++i)
        {
          if (*(_QWORD *)v16 != v7)
            objc_enumerationMutation(v4);
          objc_msgSend(*(id *)(*((_QWORD *)&v15 + 1) + 8 * i), "effectiveOutputDeviceForUID:", v3);
          v9 = objc_claimAutoreleasedReturnValue();
          if (v9)
          {
            v10 = (void *)v9;
            objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
            v11 = (void *)objc_claimAutoreleasedReturnValue();
            v19[0] = CFSTR("MRAVOutputContextOutputDeviceUserInfoKey");
            v19[1] = CFSTR("MRAVOutputContextVolumeUserInfoKey");
            v20[0] = v10;
            v12 = (void *)MEMORY[0x1E0CB37E8];
            objc_msgSend(v10, "volume");
            objc_msgSend(v12, "numberWithFloat:");
            v13 = (void *)objc_claimAutoreleasedReturnValue();
            v20[1] = v13;
            objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v20, v19, 2);
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v11, "postNotificationName:object:userInfo:", CFSTR("MRAVOutputContextVolumeDidChangeNotification"), a1, v14);

            goto LABEL_12;
          }
        }
        v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v15, v21, 16);
        if (v6)
          continue;
        break;
      }
    }
LABEL_12:

  }
}

- (void)_handleClusterMemberRoomVolumeDidChangeNotification:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v4 = a3;
  objc_msgSend(v4, "object");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "userInfo");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  getAVOutputDeviceActivatedClusterMembersRoomIDKey();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "ID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  +[MRAVRoomOutputDevice calculateOutputDeviceIDFromOutputDeviceID:withRoomID:](MRAVRoomOutputDevice, "calculateOutputDeviceIDFromOutputDeviceID:withRoomID:", v8, v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  -[MRAVConcreteOutputContext _postVolumeChangedNotificationForUID:](self, v9);
}

- (void)_handleMutedDidChangeNotification:(id)a3
{
  void *v4;
  id v5;

  objc_msgSend(a3, "object");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "deviceID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[MRAVConcreteOutputContext _postVolumeMutedChangedNotificationForUID:](self, v4);

}

- (void)_postVolumeMutedChangedNotificationForUID:(void *)a1
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _QWORD v18[2];
  _QWORD v19[2];
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (a1)
  {
    v16 = 0u;
    v17 = 0u;
    v14 = 0u;
    v15 = 0u;
    objc_msgSend(a1, "concreteOutputDevices", 0);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v14, v20, 16);
    if (v5)
    {
      v6 = v5;
      v7 = *(_QWORD *)v15;
      while (2)
      {
        for (i = 0; i != v6; ++i)
        {
          if (*(_QWORD *)v15 != v7)
            objc_enumerationMutation(v4);
          objc_msgSend(*(id *)(*((_QWORD *)&v14 + 1) + 8 * i), "effectiveOutputDeviceForUID:", v3);
          v9 = objc_claimAutoreleasedReturnValue();
          if (v9)
          {
            v10 = (void *)v9;
            objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
            v11 = (void *)objc_claimAutoreleasedReturnValue();
            v18[0] = CFSTR("MRAVOutputContextOutputDeviceUserInfoKey");
            v18[1] = CFSTR("MRAVOutputContextVolumeMutedUserInfoKey");
            v19[0] = v10;
            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(v10, "isVolumeMuted"));
            v12 = (void *)objc_claimAutoreleasedReturnValue();
            v19[1] = v12;
            objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v19, v18, 2);
            v13 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v11, "postNotificationName:object:userInfo:", CFSTR("MRAVOutputContextVolumeMutedDidChangeNotification"), a1, v13);

            goto LABEL_12;
          }
        }
        v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v14, v20, 16);
        if (v6)
          continue;
        break;
      }
    }
LABEL_12:

  }
}

- (void)_handleClusterMemberMutedDidChangeNotification:(id)a3
{
  void *v4;
  id v5;

  objc_msgSend(a3, "object");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "ID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[MRAVConcreteOutputContext _postVolumeMutedChangedNotificationForUID:](self, v4);

}

unint64_t __58__MRAVConcreteOutputContext__handleOutputDevicesTimedOut___block_invoke(unint64_t result)
{
  unint64_t v1;

  if (!*(_BYTE *)(*(_QWORD *)(result + 32) + 81))
  {
    v1 = result;
    result = objc_msgSend(*(id *)(result + 40), "count");
    if (result >= 2)
    {
      *(_BYTE *)(*(_QWORD *)(v1 + 32) + 81) = 1;
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(v1 + 48) + 8) + 24) = 1;
    }
  }
  return result;
}

void __58__MRAVConcreteOutputContext__handleOutputDevicesTimedOut___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  NSObject *v8;
  int v9;
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 81) = 0;
  _MRLogForCategory(0);
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v6)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      __58__MRAVConcreteOutputContext__handleOutputDevicesTimedOut___block_invoke_2_cold_1(a1, (uint64_t)v6, v8);
  }
  else if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v9 = 138543362;
    v10 = v5;
    _os_log_impl(&dword_193827000, v8, OS_LOG_TYPE_DEFAULT, "[ConcreteOutputContext] Created endpoint for disconnected devices: %{public}@", (uint8_t *)&v9, 0xCu);
  }

}

void __67__MRAVConcreteOutputContext__notifyPredictedOutputDeviceDidChange___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  const __CFString *v5;
  _QWORD v6[2];

  v6[1] = *MEMORY[0x1E0C80C00];
  v2 = *(_QWORD *)(a1 + 32);
  if (v2)
  {
    v5 = CFSTR("MRAVOutputContextOutputDeviceUserInfoKey");
    v6[0] = v2;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v6, &v5, 1);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = (void *)MEMORY[0x1E0C9AA70];
  }
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "postNotificationName:object:userInfo:", CFSTR("kMRAVOutputContextPredictedOutputDeviceDidChangeNotification"), *(_QWORD *)(a1 + 40), v3);

}

- (void)_reloadOutputContext
{
  _QWORD block[5];

  if (a1)
  {
    if (_reloadOutputContext___once != -1)
      dispatch_once(&_reloadOutputContext___once, &__block_literal_global_103);
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __49__MRAVConcreteOutputContext__reloadOutputContext__block_invoke_2;
    block[3] = &unk_1E30C5CA8;
    block[4] = a1;
    dispatch_async((dispatch_queue_t)_reloadOutputContext___queue, block);
  }
}

void __49__MRAVConcreteOutputContext__reloadOutputContext__block_invoke()
{
  dispatch_queue_t v0;
  void *v1;
  NSObject *v2;

  dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v2 = objc_claimAutoreleasedReturnValue();
  v0 = dispatch_queue_create("com.apple.mediaremote.outputcontext.reloadOutputContext", v2);
  v1 = (void *)_reloadOutputContext___queue;
  _reloadOutputContext___queue = (uint64_t)v0;

}

void __49__MRAVConcreteOutputContext__reloadOutputContext__block_invoke_2(uint64_t a1)
{
  void *v2;
  NSObject *v3;
  uint64_t v4;
  dispatch_time_t v5;
  NSObject *v6;
  _QWORD block[4];
  id v8;
  uint8_t buf[4];
  uint64_t v10;
  __int16 v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  objc_msgSend((id)objc_opt_class(), "outputContextForLocalDevice");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2
    || (objc_msgSend((id)objc_opt_class(), "outputContextForLocalDevice"),
        (v2 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
  {
    _MRLogForCategory(0);
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      v4 = *(_QWORD *)(a1 + 32);
      *(_DWORD *)buf = 138543618;
      v10 = v4;
      v11 = 2112;
      v12 = v2;
      _os_log_impl(&dword_193827000, v3, OS_LOG_TYPE_DEFAULT, "[ConcreteOutputContext] %{public}@ Reloading with output context: %@", buf, 0x16u);
    }

    objc_msgSend(*(id *)(a1 + 32), "setAvOutputContext:", v2);
  }
  else
  {
    objc_initWeak((id *)buf, *(id *)(a1 + 32));
    v5 = dispatch_time(0, 10000000000);
    v6 = _reloadOutputContext___queue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __49__MRAVConcreteOutputContext__reloadOutputContext__block_invoke_3;
    block[3] = &unk_1E30C6AA0;
    objc_copyWeak(&v8, (id *)buf);
    dispatch_after(v5, v6, block);
    objc_destroyWeak(&v8);
    objc_destroyWeak((id *)buf);
  }
}

void __49__MRAVConcreteOutputContext__reloadOutputContext__block_invoke_3(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  -[MRAVConcreteOutputContext _reloadOutputContext]();

}

+ (id)_sharedOutputContextFromType:(uint64_t)a1
{
  void *v3;

  objc_opt_self();
  switch(a2)
  {
    case 3:
      +[MRAVConcreteOutputContext sharedSystemScreenContext](MRAVConcreteOutputContext, "sharedSystemScreenContext");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 2:
      +[MRAVConcreteOutputContext sharedSystemAudioContext](MRAVConcreteOutputContext, "sharedSystemAudioContext");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 1:
      +[MRAVConcreteOutputContext sharedAudioPresentationContext](MRAVConcreteOutputContext, "sharedAudioPresentationContext");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    default:
      v3 = 0;
      break;
  }
  return v3;
}

id __65__MRAVConcreteOutputContext__initializeAVFNotificationForwarding__block_invoke_3(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  _QWORD v12[3];
  _QWORD v13[4];

  v13[3] = *MEMORY[0x1E0C80C00];
  objc_msgSend(a2, "object");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "outputContextType");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  getAVOutputContextTypeSharedSystemAudio[0]();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = v4;
  v13[0] = &unk_1E3143540;
  getAVOutputContextTypeSharedSystemScreen[0]();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v12[1] = v5;
  v13[1] = &unk_1E3143558;
  getAVOutputContextTypeSharedAudioPresentation[0]();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v12[2] = v6;
  v13[2] = &unk_1E3143570;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v13, v12, 3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKey:", v3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "unsignedIntegerValue");

  if (v9)
  {
    +[MRAVConcreteOutputContext _sharedOutputContextFromType:]((uint64_t)MRAVConcreteOutputContext, v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

void __65__MRAVConcreteOutputContext__initializeAVFNotificationForwarding__block_invoke_4(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  id v5;
  id v6;
  _QWORD v7[4];
  id v8;
  id v9;

  v3 = a2;
  objc_msgSend((id)objc_opt_class(), "notificationQueue");
  v4 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __65__MRAVConcreteOutputContext__initializeAVFNotificationForwarding__block_invoke_5;
  v7[3] = &unk_1E30C6568;
  v5 = *(id *)(a1 + 32);
  v8 = v3;
  v9 = v5;
  v6 = v3;
  dispatch_async(v4, v7);

}

void __65__MRAVConcreteOutputContext__initializeAVFNotificationForwarding__block_invoke_5(uint64_t a1)
{
  id v1;

  (*(void (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "_scheduleOutputContextDeviceDidChangeNotification");

}

void __65__MRAVConcreteOutputContext__initializeAVFNotificationForwarding__block_invoke_6(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  id v5;
  id v6;
  _QWORD v7[4];
  id v8;
  id v9;

  v3 = a2;
  objc_msgSend((id)objc_opt_class(), "notificationQueue");
  v4 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __65__MRAVConcreteOutputContext__initializeAVFNotificationForwarding__block_invoke_7;
  v7[3] = &unk_1E30C6568;
  v5 = *(id *)(a1 + 32);
  v8 = v3;
  v9 = v5;
  v6 = v3;
  dispatch_async(v4, v7);

}

void __65__MRAVConcreteOutputContext__initializeAVFNotificationForwarding__block_invoke_7(uint64_t a1)
{
  id v1;

  (*(void (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "_scheduleOutputContextDevicesDidChangeNotification");

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_notifications, 0);
  objc_storeStrong((id *)&self->_avOutputContext, 0);
  objc_storeStrong((id *)&self->_serialQueue, 0);
  objc_storeStrong((id *)&self->_outputDeviceSourceInfo, 0);
  objc_storeStrong((id *)&self->_predictedOutputDevice, 0);
  objc_storeStrong((id *)&self->_concreteOutputDevices, 0);
  objc_storeStrong((id *)&self->_uniqueIdentifier, 0);
}

void __59__MRAVConcreteOutputContext_sharedAudioPresentationContext__block_invoke_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_5(&dword_193827000, a1, a3, "[ConcreteOutputContext] WARNING: AVF context unavailable for %{public}s", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_8();
}

void __53__MRAVConcreteOutputContext_sharedSystemAudioContext__block_invoke_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_5(&dword_193827000, a1, a3, "[ConcreteOutputContext] WARNING: AVF context unavailable for %{public}s", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_8();
}

void __54__MRAVConcreteOutputContext_sharedSystemScreenContext__block_invoke_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_5(&dword_193827000, a1, a3, "[ConcreteOutputContext] WARNING: AVF context unavailable for %{public}s", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_8();
}

+ (void)iTunesContext
{
  OUTLINED_FUNCTION_5(&dword_193827000, a1, a3, "[ConcreteOutputContext] WARNING: AVF context unavailable for %s", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_8();
}

+ (void)createOutputContextWithUniqueIdentifier:(uint64_t)a3 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_5(&dword_193827000, a2, a3, "[ConcreteOutputContext] WARNING: AVF context unavailable for %{public}@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_8();
}

void __57__MRAVConcreteOutputContext_attemptLogicalDeviceRecovery__block_invoke_48_cold_1(uint64_t a1, uint64_t a2, NSObject *a3)
{
  int v3;
  uint64_t v4;
  __int16 v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v3 = 138543618;
  v4 = a1;
  v5 = 2114;
  v6 = a2;
  OUTLINED_FUNCTION_2_4(&dword_193827000, a3, (uint64_t)a3, "[ConcreteOutputContext] Failed to find missing logical device components: %{public}@ -- found devices %{public}@", (uint8_t *)&v3);
  OUTLINED_FUNCTION_8();
}

void __57__MRAVConcreteOutputContext_attemptLogicalDeviceRecovery__block_invoke_48_cold_2(void *a1, id *a2, NSObject *a3)
{
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  int v9;
  void *v10;
  __int16 v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "componentsJoinedByString:", CFSTR(", "));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*a2, "allObjects");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "componentsJoinedByString:", CFSTR(", "));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = 138543618;
  v10 = v5;
  v11 = 2114;
  v12 = v7;
  OUTLINED_FUNCTION_2_4(&dword_193827000, a3, v8, "[ConcreteOutputContext] Logical Devices: %{public}@. Existing devices: %{public}@.", (uint8_t *)&v9);

}

void __57__MRAVConcreteOutputContext_attemptLogicalDeviceRecovery__block_invoke_48_cold_3(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_193827000, log, OS_LOG_TYPE_ERROR, "[ConcreteOutputContext] Failed to find any remaining logical device components to add.", v1, 2u);
}

void __57__MRAVConcreteOutputContext_attemptLogicalDeviceRecovery__block_invoke_53_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_5(&dword_193827000, a2, a3, "[ConcreteOutputContext] Failed to add missing logical device components to output context. %{public}@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_8();
}

void __58__MRAVConcreteOutputContext__handleOutputDevicesTimedOut___block_invoke_2_cold_1(uint64_t a1, uint64_t a2, NSObject *a3)
{
  uint64_t v3;
  int v4;
  uint64_t v5;
  __int16 v6;
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v3 = *(_QWORD *)(a1 + 40);
  v4 = 138543618;
  v5 = v3;
  v6 = 2114;
  v7 = a2;
  OUTLINED_FUNCTION_2_4(&dword_193827000, a3, (uint64_t)a3, "[ConcreteOutputContext] Failed to create endpoint for disconnected devices (%{public}@): %{public}@", (uint8_t *)&v4);
  OUTLINED_FUNCTION_8();
}

@end
