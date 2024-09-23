@implementation MPAVRoutingDataSource

- (int64_t)filterMode
{
  return self->_filterMode;
}

void __44__MPAVRoutingDataSource_activeAudioCategory__block_invoke(uint64_t a1)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), *(id *)(*(_QWORD *)(a1 + 32) + 32));
}

uint64_t __29__MPAVRoutingDataSource_init__block_invoke_2(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(result + 32) + 40) = 1;
  return result;
}

uint64_t __47__MPAVRoutingDataSource_hasActiveAudioCategory__block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = *(_BYTE *)(*(_QWORD *)(result + 32) + 40);
  return result;
}

void __66__MPAVRoutingDataSource__reloadActiveAudioCategoryWithCompletion___block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  v2 = objc_msgSend(*(id *)(a1 + 40), "copy");
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(void **)(v3 + 32);
  *(_QWORD *)(v3 + 32) = v2;

}

- (MPAVRoutingDataSource)init
{
  MPAVRoutingDataSource *v2;
  dispatch_queue_t v3;
  OS_dispatch_queue *serialQueue;
  dispatch_queue_t v5;
  OS_dispatch_queue *workerQueue;
  dispatch_queue_t v7;
  OS_dispatch_queue *callbackQueue;
  _QWORD v10[4];
  MPAVRoutingDataSource *v11;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)MPAVRoutingDataSource;
  v2 = -[MPAVRoutingDataSource init](&v12, sel_init);
  if (v2)
  {
    v3 = dispatch_queue_create("com.apple.MediaPlayer.MPAVRoutingDataSource/serialQueue", 0);
    serialQueue = v2->_serialQueue;
    v2->_serialQueue = (OS_dispatch_queue *)v3;

    v5 = dispatch_queue_create("com.apple.MediaPlayer.MPAVRoutingDataSource/workerQueue", 0);
    workerQueue = v2->_workerQueue;
    v2->_workerQueue = (OS_dispatch_queue *)v5;

    v7 = dispatch_queue_create("com.apple.MediaPlayer.MPAVRoutingDataSource/callbackQueue", 0);
    callbackQueue = v2->_callbackQueue;
    v2->_callbackQueue = (OS_dispatch_queue *)v7;

    -[MPAVRoutingDataSource _superclassRegisterNotifications](v2, "_superclassRegisterNotifications");
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __29__MPAVRoutingDataSource_init__block_invoke;
    v10[3] = &unk_1E31631D8;
    v11 = v2;
    -[MPAVRoutingDataSource _reloadActiveAudioCategoryWithCompletion:](v11, "_reloadActiveAudioCategoryWithCompletion:", v10);

  }
  return v2;
}

- (void)_superclassRegisterNotifications
{
  void *v3;
  void *v4;
  _QWORD *v5;
  void *v6;
  _QWORD v7[2];

  v7[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObserver:selector:name:object:", self, sel__volumeControlAvailabilityDidChangeNotification_, *MEMORY[0x1E0D4CD68], 0);
  objc_msgSend(v3, "addObserver:selector:name:object:", self, sel__externalScreenTypeDidChangeNotification_, *MEMORY[0x1E0D4C8D8], 0);
  objc_msgSend(MEMORY[0x1E0D48560], "sharedAVSystemController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (_QWORD *)MEMORY[0x1E0D47E48];
  v7[0] = *MEMORY[0x1E0D47E48];
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v7, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setAttribute:forKey:error:", v6, *MEMORY[0x1E0D48280], 0);

  objc_msgSend(v3, "addObserver:selector:name:object:", self, sel__activeAudioRouteDidChangeNotification_, *v5, 0);
  MRMediaRemoteSetWantsVolumeControlNotifications();
  MRMediaRemoteSetWantsExternalScreenTypeChangeNotifications();

}

- (void)_reloadActiveAudioCategoryWithCompletion:(id)a3
{
  id v4;
  NSObject *workerQueue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  workerQueue = self->_workerQueue;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __66__MPAVRoutingDataSource__reloadActiveAudioCategoryWithCompletion___block_invoke;
  v7[3] = &unk_1E3162560;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(workerQueue, v7);

}

void __66__MPAVRoutingDataSource__reloadActiveAudioCategoryWithCompletion___block_invoke(uint64_t a1)
{
  id v2;
  void *v3;
  void *v4;
  uint64_t v5;
  NSObject *v6;
  id v7;
  id v8;
  char v9;
  NSObject *v10;
  uint64_t v11;
  uint64_t v12;
  void (*v13)(uint64_t);
  void *v14;
  uint64_t v15;
  id v16;
  uint8_t buf[4];
  id v18;
  __int16 v19;
  id v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "activeAudioCategory");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D48560], "sharedAVSystemController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "attributeForKey:", *MEMORY[0x1E0D47F58]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = *(_QWORD *)(a1 + 32);
  v6 = *(NSObject **)(v5 + 8);
  v11 = MEMORY[0x1E0C809B0];
  v12 = 3221225472;
  v13 = __66__MPAVRoutingDataSource__reloadActiveAudioCategoryWithCompletion___block_invoke_2;
  v14 = &unk_1E31635F8;
  v15 = v5;
  v7 = v4;
  v16 = v7;
  dispatch_sync(v6, &v11);
  v8 = v7;
  if (v2 == v8)
  {

  }
  else
  {
    v9 = objc_msgSend(v2, "isEqual:", v8, v11, v12, v13, v14, v15);

    if ((v9 & 1) == 0)
    {
      v10 = os_log_create("com.apple.amp.mediaplayer", "RemoteControl");
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543618;
        v18 = v2;
        v19 = 2114;
        v20 = v8;
        _os_log_impl(&dword_193B9B000, v10, OS_LOG_TYPE_DEFAULT, "[BaseRoutingDataSource] Active audio category changed from %{public}@ to %{public}@", buf, 0x16u);
      }

    }
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

- (NSString)activeAudioCategory
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
  v7 = __Block_byref_object_copy__46029;
  v8 = __Block_byref_object_dispose__46030;
  v9 = 0;
  msv_dispatch_sync_on_queue();
  v2 = (id)v5[5];
  _Block_object_dispose(&v4, 8);

  return (NSString *)v2;
}

void __29__MPAVRoutingDataSource_init__block_invoke(uint64_t a1)
{
  _QWORD *v1;
  NSObject *v2;
  _QWORD block[4];
  id v4;

  v1 = *(_QWORD **)(a1 + 32);
  v2 = v1[1];
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __29__MPAVRoutingDataSource_init__block_invoke_2;
  block[3] = &unk_1E3163508;
  v4 = v1;
  dispatch_sync(v2, block);

}

- (BOOL)hasActiveAudioCategory
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
  v5[2] = __47__MPAVRoutingDataSource_hasActiveAudioCategory__block_invoke;
  v5[3] = &unk_1E3163580;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(serialQueue, v5);
  v3 = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (void)dealloc
{
  objc_super v3;

  -[MPAVRoutingDataSource _superclassUnregisterNotifications](self, "_superclassUnregisterNotifications");
  v3.receiver = self;
  v3.super_class = (Class)MPAVRoutingDataSource;
  -[MPAVRoutingDataSource dealloc](&v3, sel_dealloc);
}

- (void)getExternalScreenTypeWithCompletion:(id)a3
{
  id v3;
  void *v4;
  id v5;

  v3 = a3;
  v4 = v3;
  if (v3)
  {
    v5 = v3;
    MRMediaRemoteGetExternalScreenType();

  }
}

- (void)getPickedRouteHasVolumeControlWithCompletion:(id)a3
{
  id v4;
  qos_class_t v5;
  dispatch_block_t v6;
  NSObject *v7;
  _QWORD v8[5];
  id v9;

  v4 = a3;
  if (v4)
  {
    v5 = qos_class_self();
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __70__MPAVRoutingDataSource_getPickedRouteHasVolumeControlWithCompletion___block_invoke;
    v8[3] = &unk_1E3162560;
    v8[4] = self;
    v9 = v4;
    v6 = dispatch_block_create_with_qos_class(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, v5, 0, v8);
    dispatch_get_global_queue(0, 0);
    v7 = objc_claimAutoreleasedReturnValue();
    dispatch_async(v7, v6);

  }
}

- (void)unpickAirPlayAVRoutesWithCompletion:(id)a3
{
  id v3;
  NSObject *v4;
  id v5;
  void *v6;
  uint8_t buf[16];

  v3 = a3;
  v4 = os_log_create("com.apple.amp.mediaplayer", "RemoteControl");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_193B9B000, v4, OS_LOG_TYPE_DEFAULT, "[BaseRoutingDataSource] Unpicking AirPlay AV routes...", buf, 2u);
  }

  v6 = v3;
  v5 = v3;
  MRMediaRemoteUnpickAirPlayAVRoutes();

}

- (id)getRoutesForCategory:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v4 = a3;
  v5 = (void *)MEMORY[0x1E0C99DA0];
  v6 = *MEMORY[0x1E0C99768];
  v7 = (void *)MEMORY[0x1E0CB3940];
  NSStringFromSelector(a2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "stringWithFormat:", CFSTR("%@ is abstract"), v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "exceptionWithName:reason:userInfo:", v6, v9, 0);
  v10 = (id)objc_claimAutoreleasedReturnValue();

  objc_exception_throw(v10);
}

- (void)setPickedRoute:(id)a3 withPassword:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = (void *)MEMORY[0x1E0C99DA0];
  v12 = *MEMORY[0x1E0C99768];
  v13 = (void *)MEMORY[0x1E0CB3940];
  NSStringFromSelector(a2);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "stringWithFormat:", CFSTR("%@ is abstract"), v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "exceptionWithName:reason:userInfo:", v12, v15, 0);
  v16 = (id)objc_claimAutoreleasedReturnValue();

  objc_exception_throw(v16);
}

- (BOOL)routeIsLeaderOfEndpoint:(id)a3
{
  return 0;
}

- (BOOL)supportsMultipleSelection
{
  return 0;
}

- (void)_volumeControlAvailabilityDidChangeNotification:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  const __CFString *v10;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "userInfo");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", *MEMORY[0x1E0D4CDC8]);

  MRNowPlayingPlayerPathGetOrigin();
  if (MROriginIsLocalOrigin())
  {
    objc_msgSend(v4, "userInfo");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectForKey:", *MEMORY[0x1E0D4CD70]);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    v10 = CFSTR("VolumeControlAvailability");
    v11[0] = v7;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v11, &v10, 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "postNotificationName:object:userInfo:", CFSTR("MPAVRoutingDataSourceVolumeControlAvailabilityDidChangeNotification"), self, v8);

  }
}

- (void)_externalScreenTypeDidChangeNotification:(id)a3
{
  void *v4;
  void *v5;
  unsigned int v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  int v12;
  uint64_t v13;
  const __CFString *v14;
  _QWORD v15[2];

  v15[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(a3, "userInfo");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", *MEMORY[0x1E0D4C8E0]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "unsignedIntValue");

  if (v6 == 1)
    v7 = 1;
  else
    v7 = 2 * (v6 == 2);
  v14 = CFSTR("ExternalScreenType");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = v8;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v15, &v14, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = os_log_create("com.apple.amp.mediaplayer", "RemoteControl");
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    v12 = 134217984;
    v13 = v6;
    _os_log_impl(&dword_193B9B000, v11, OS_LOG_TYPE_DEFAULT, "[BaseRoutingDataSource] Received external screen type did change notification with screen type = %ld", (uint8_t *)&v12, 0xCu);
  }

  objc_msgSend(v10, "postNotificationName:object:userInfo:", CFSTR("MPAVRoutingDataSourceExternalScreenTypeDidChangeNotification"), self, v9);
}

- (void)_activeAudioRouteDidChangeNotification:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[4];
  id v8;
  MPAVRoutingDataSource *v9;
  uint8_t buf[4];
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = os_log_create("com.apple.amp.mediaplayer", "RemoteControl");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v11 = v4;
    _os_log_impl(&dword_193B9B000, v5, OS_LOG_TYPE_DEFAULT, "[BaseRoutingDataSource] Received active audio route did change notification: %{public}@", buf, 0xCu);
  }

  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __64__MPAVRoutingDataSource__activeAudioRouteDidChangeNotification___block_invoke;
  v7[3] = &unk_1E3162328;
  v8 = v4;
  v9 = self;
  v6 = v4;
  -[MPAVRoutingDataSource _reloadActiveAudioCategoryWithCompletion:](self, "_reloadActiveAudioCategoryWithCompletion:", v7);

}

- (void)_superclassUnregisterNotifications
{
  id v3;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:name:object:", self, *MEMORY[0x1E0D4CD68], 0);
  objc_msgSend(v3, "removeObserver:name:object:", self, *MEMORY[0x1E0D4C8D8], 0);
  objc_msgSend(v3, "removeObserver:name:object:", self, *MEMORY[0x1E0D47E48], 0);
  MRMediaRemoteSetWantsVolumeControlNotifications();
  MRMediaRemoteSetWantsExternalScreenTypeChangeNotifications();

}

- (int64_t)discoveryMode
{
  return self->_discoveryMode;
}

- (void)setDiscoveryMode:(int64_t)a3
{
  self->_discoveryMode = a3;
}

- (BOOL)devicePresenceDetected
{
  return self->_devicePresenceDetected;
}

- (void)setFilterMode:(int64_t)a3
{
  self->_filterMode = a3;
}

- (unsigned)targetSessionID
{
  return self->_targetSessionID;
}

- (void)setTargetSessionID:(unsigned int)a3
{
  self->_targetSessionID = a3;
}

- (BOOL)didReceiveDiscoveryResults
{
  return self->_didReceiveDiscoveryResults;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_activeAudioCategory, 0);
  objc_storeStrong((id *)&self->_callbackQueue, 0);
  objc_storeStrong((id *)&self->_workerQueue, 0);
  objc_storeStrong((id *)&self->_serialQueue, 0);
}

void __64__MPAVRoutingDataSource__activeAudioRouteDidChangeNotification___block_invoke(uint64_t a1, int a2)
{
  id v3;
  uint64_t v4;
  _QWORD v5[4];
  id v6;
  uint64_t v7;

  if (a2)
  {
    v5[0] = MEMORY[0x1E0C809B0];
    v5[1] = 3221225472;
    v5[2] = __64__MPAVRoutingDataSource__activeAudioRouteDidChangeNotification___block_invoke_2;
    v5[3] = &unk_1E31635F8;
    v3 = *(id *)(a1 + 32);
    v4 = *(_QWORD *)(a1 + 40);
    v6 = v3;
    v7 = v4;
    dispatch_async(MEMORY[0x1E0C80D38], v5);

  }
}

void __64__MPAVRoutingDataSource__activeAudioRouteDidChangeNotification___block_invoke_2(uint64_t a1)
{
  void *v2;
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "userInfo");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "postNotificationName:object:userInfo:", CFSTR("MPAVRoutingDataSourceActiveAudioRouteDidChangeNotification"), *(_QWORD *)(a1 + 40), v3);

}

uint64_t __61__MPAVRoutingDataSource_unpickAirPlayAVRoutesWithCompletion___block_invoke(uint64_t a1, uint64_t a2)
{
  NSObject *v4;
  NSObject *v5;
  const char *v6;
  NSObject *v7;
  os_log_type_t v8;
  uint32_t v9;
  uint64_t result;
  int v11;
  uint64_t v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v4 = os_log_create("com.apple.amp.mediaplayer", "RemoteControl");
  v5 = v4;
  if (a2)
  {
    if (!os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      goto LABEL_7;
    v11 = 138543362;
    v12 = a2;
    v6 = "[BaseRoutingDataSource] Failed to unpick AirPlay AV routes: %{public}@";
    v7 = v5;
    v8 = OS_LOG_TYPE_ERROR;
    v9 = 12;
  }
  else
  {
    if (!os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
      goto LABEL_7;
    LOWORD(v11) = 0;
    v6 = "[BaseRoutingDataSource] Successfully unpicked AirPlay AV routes";
    v7 = v5;
    v8 = OS_LOG_TYPE_DEFAULT;
    v9 = 2;
  }
  _os_log_impl(&dword_193B9B000, v7, v8, v6, (uint8_t *)&v11, v9);
LABEL_7:

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, uint64_t))(result + 16))(result, a2);
  return result;
}

void __70__MPAVRoutingDataSource_getPickedRouteHasVolumeControlWithCompletion___block_invoke(uint64_t a1)
{
  id v1;

  v1 = *(id *)(a1 + 40);
  MRMediaRemoteGetPickedRouteHasVolumeControl();

}

uint64_t __70__MPAVRoutingDataSource_getPickedRouteHasVolumeControlWithCompletion___block_invoke_2(uint64_t a1, int a2)
{
  return (*(uint64_t (**)(_QWORD, BOOL))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), a2 != 0);
}

uint64_t __61__MPAVRoutingDataSource_getExternalScreenTypeWithCompletion___block_invoke(uint64_t a1, int a2)
{
  uint64_t v2;
  uint64_t v3;

  v2 = *(_QWORD *)(a1 + 32);
  if (a2 == 1)
    v3 = 1;
  else
    v3 = 2 * (a2 == 2);
  return (*(uint64_t (**)(uint64_t, uint64_t))(v2 + 16))(v2, v3);
}

@end
