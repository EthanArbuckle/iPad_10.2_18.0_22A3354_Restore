@implementation MPRadioController

- (MPRadioController)init
{
  MPRadioController *v2;
  dispatch_queue_t v3;
  OS_dispatch_queue *accessQueue;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)MPRadioController;
  v2 = -[MPRadioController init](&v6, sel_init);
  if (v2)
  {
    v3 = dispatch_queue_create("com.apple.MediaPlayer.MPRadioController.accessQueue", MEMORY[0x1E0C80D50]);
    accessQueue = v2->_accessQueue;
    v2->_accessQueue = (OS_dispatch_queue *)v3;

    v2->_isRadioAvailable = CFPreferencesGetAppBooleanValue(CFSTR("MPRadioControllerRadioAvailability"), CFSTR("com.apple.mobileipod"), 0) != 0;
    -[MPRadioController _getConnectionWithCompletionHandler:](v2, "_getConnectionWithCompletionHandler:", 0);
  }
  return v2;
}

- (void)dealloc
{
  objc_super v3;

  -[NSXPCConnection invalidate](self->_connection, "invalidate");
  -[BKSProcessAssertion invalidate](self->_remoteProcessAssertion, "invalidate");
  v3.receiver = self;
  v3.super_class = (Class)MPRadioController;
  -[MPRadioController dealloc](&v3, sel_dealloc);
}

- (void)clientRadioControllerRadioAvailabilityDidChange:(BOOL)a3
{
  NSObject *accessQueue;
  _QWORD v4[5];
  BOOL v5;

  accessQueue = self->_accessQueue;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __69__MPRadioController_clientRadioControllerRadioAvailabilityDidChange___block_invoke;
  v4[3] = &unk_1E3163468;
  v4[4] = self;
  v5 = a3;
  dispatch_barrier_async(accessQueue, v4);
}

- (void)clientRadioControllerRecentStationsDidChange
{
  NSObject *v3;
  _QWORD block[5];

  dispatch_get_global_queue(0, 0);
  v3 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __65__MPRadioController_clientRadioControllerRecentStationsDidChange__block_invoke;
  block[3] = &unk_1E3163508;
  block[4] = self;
  dispatch_async(v3, block);

}

- (BOOL)isRadioAvailable
{
  NSObject *accessQueue;
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
  accessQueue = self->_accessQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __37__MPRadioController_isRadioAvailable__block_invoke;
  v5[3] = &unk_1E3163580;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(accessQueue, v5);
  v3 = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (void)getRecentStationGroupsWithCompletionHandler:(id)a3
{
  id v4;
  NSObject *accessQueue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  accessQueue = self->_accessQueue;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __65__MPRadioController_getRecentStationGroupsWithCompletionHandler___block_invoke;
  v7[3] = &unk_1E3162560;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_barrier_async(accessQueue, v7);

}

- (void)_beginRemoteProcessAssertionWithCompletionHandler:(id)a3
{
  void (**v4)(_QWORD);
  id remoteProcessAssertionCompletionHandler;
  void *v7;
  uint64_t v8;
  id v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  _QWORD v14[5];
  _QWORD v15[4];
  id v16;
  void (**v17)(_QWORD);
  uint64_t v18;
  _QWORD v19[2];

  v19[1] = *MEMORY[0x1E0C80C00];
  v4 = (void (**)(_QWORD))a3;
  remoteProcessAssertionCompletionHandler = self->_remoteProcessAssertionCompletionHandler;
  ++self->_remoteProcessAssertionCount;
  if (self->_hasLaunchedService && remoteProcessAssertionCompletionHandler == 0)
  {
    if (v4)
      v4[2](v4);
  }
  else
  {
    v7 = (void *)objc_msgSend(remoteProcessAssertionCompletionHandler, "copy");
    v8 = MEMORY[0x1E0C809B0];
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __71__MPRadioController__beginRemoteProcessAssertionWithCompletionHandler___block_invoke;
    v15[3] = &unk_1E3153A70;
    v9 = v7;
    v16 = v9;
    v17 = v4;
    v10 = (void *)objc_msgSend(v15, "copy");
    v11 = self->_remoteProcessAssertionCompletionHandler;
    self->_remoteProcessAssertionCompletionHandler = v10;

    if (!self->_hasLaunchedService)
    {
      self->_hasLaunchedService = 1;
      objc_msgSend(MEMORY[0x1E0D23288], "sharedService");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = *MEMORY[0x1E0D22D00];
      v19[0] = MEMORY[0x1E0C9AAB0];
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v19, &v18, 1);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14[0] = v8;
      v14[1] = 3221225472;
      v14[2] = __71__MPRadioController__beginRemoteProcessAssertionWithCompletionHandler___block_invoke_2;
      v14[3] = &unk_1E3163100;
      v14[4] = self;
      objc_msgSend(v12, "openApplication:options:withResult:", CFSTR("com.apple.Music"), v13, v14);

    }
  }

}

- (void)_endRemoteProcessAssertion
{
  int64_t v2;
  dispatch_time_t v4;
  _QWORD block[5];

  v2 = self->_remoteProcessAssertionCount - 1;
  self->_remoteProcessAssertionCount = v2;
  if (!v2)
  {
    v4 = dispatch_time(0, 3000000000);
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __47__MPRadioController__endRemoteProcessAssertion__block_invoke;
    block[3] = &unk_1E3163508;
    block[4] = self;
    dispatch_after(v4, MEMORY[0x1E0C80D38], block);
  }
}

- (void)_setRadioAvailable:(BOOL)a3
{
  NSObject *v4;
  _QWORD block[5];

  if (self->_isRadioAvailable != a3)
  {
    self->_isRadioAvailable = a3;
    CFPreferencesSetAppValue(CFSTR("MPRadioControllerRadioAvailability"), (CFPropertyListRef)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:"), CFSTR("com.apple.mobileipod"));
    dispatch_get_global_queue(0, 0);
    v4 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __40__MPRadioController__setRadioAvailable___block_invoke;
    block[3] = &unk_1E3163508;
    block[4] = self;
    dispatch_async(v4, block);

  }
}

- (void)_getConnectionWithCompletionHandler:(id)a3
{
  void (**v4)(_QWORD);
  void *v5;
  _QWORD v6[5];
  void (**v7)(_QWORD);

  v4 = (void (**)(_QWORD))a3;
  v5 = v4;
  if (self->_connection)
  {
    if (v4)
      v4[2](v4);
  }
  else
  {
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __57__MPRadioController__getConnectionWithCompletionHandler___block_invoke;
    v6[3] = &unk_1E3162560;
    v6[4] = self;
    v7 = v4;
    -[MPRadioController _beginRemoteProcessAssertionWithCompletionHandler:](self, "_beginRemoteProcessAssertionWithCompletionHandler:", v6);

  }
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_remoteProcessAssertionCompletionHandler, 0);
  objc_storeStrong((id *)&self->_remoteProcessAssertion, 0);
  objc_storeStrong((id *)&self->_connection, 0);
  objc_storeStrong((id *)&self->_accessQueue, 0);
}

uint64_t __57__MPRadioController__getConnectionWithCompletionHandler___block_invoke(uint64_t a1)
{
  _QWORD *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  uint64_t result;
  _QWORD v15[5];
  _QWORD v16[5];
  _QWORD v17[4];
  id v18;
  id v19;
  _QWORD v20[4];
  id v21;
  id v22;
  id from;
  id location;

  v2 = *(_QWORD **)(a1 + 32);
  if (v2[2])
  {
    objc_msgSend(v2, "_endRemoteProcessAssertion");
  }
  else
  {
    v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3B38]), "initWithMachServiceName:options:", CFSTR("com.apple.MediaPlayer.MPRadioControllerServer"), 0);
    objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 16), v3);
    v4 = *(void **)(*(_QWORD *)(a1 + 32) + 16);
    MPServiceRadioControllerGetXPCInterface();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setRemoteObjectInterface:", v5);

    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "setExportedObject:");
    v6 = *(void **)(*(_QWORD *)(a1 + 32) + 16);
    objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EE2F2080);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setExportedInterface:", v7);

    objc_initWeak(&location, *(id *)(*(_QWORD *)(a1 + 32) + 16));
    objc_initWeak(&from, *(id *)(a1 + 32));
    v8 = *(void **)(*(_QWORD *)(a1 + 32) + 16);
    v9 = MEMORY[0x1E0C809B0];
    v20[0] = MEMORY[0x1E0C809B0];
    v20[1] = 3221225472;
    v20[2] = __57__MPRadioController__getConnectionWithCompletionHandler___block_invoke_2;
    v20[3] = &unk_1E3162668;
    objc_copyWeak(&v21, &from);
    objc_copyWeak(&v22, &location);
    objc_msgSend(v8, "setInterruptionHandler:", v20);
    v10 = *(void **)(*(_QWORD *)(a1 + 32) + 16);
    v17[0] = v9;
    v17[1] = 3221225472;
    v17[2] = __57__MPRadioController__getConnectionWithCompletionHandler___block_invoke_2_22;
    v17[3] = &unk_1E3162668;
    objc_copyWeak(&v18, &from);
    objc_copyWeak(&v19, &location);
    objc_msgSend(v10, "setInvalidationHandler:", v17);
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "resume");
    v11 = *(_QWORD *)(a1 + 32);
    v12 = *(void **)(v11 + 16);
    v16[0] = v9;
    v16[1] = 3221225472;
    v16[2] = __57__MPRadioController__getConnectionWithCompletionHandler___block_invoke_2_24;
    v16[3] = &unk_1E3163100;
    v16[4] = v11;
    objc_msgSend(v12, "remoteObjectProxyWithErrorHandler:", v16);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v15[0] = v9;
    v15[1] = 3221225472;
    v15[2] = __57__MPRadioController__getConnectionWithCompletionHandler___block_invoke_4;
    v15[3] = &unk_1E31637D0;
    v15[4] = *(_QWORD *)(a1 + 32);
    objc_msgSend(v13, "serviceRadioControllerGetRadioAvailabilityWithCompletionHandler:", v15);

    objc_destroyWeak(&v19);
    objc_destroyWeak(&v18);
    objc_destroyWeak(&v22);
    objc_destroyWeak(&v21);
    objc_destroyWeak(&from);
    objc_destroyWeak(&location);

  }
  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD))(result + 16))(result, *(_QWORD *)(*(_QWORD *)(a1 + 32) + 16));
  return result;
}

void __57__MPRadioController__getConnectionWithCompletionHandler___block_invoke_2(uint64_t a1)
{
  NSObject *v2;
  _QWORD *WeakRetained;
  id v4;
  void *v5;
  NSObject *v6;
  _QWORD v7[4];
  _QWORD *v8;
  id v9;
  uint8_t buf[16];

  v2 = os_log_create("com.apple.amp.mediaplayer", "Playback");
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_193B9B000, v2, OS_LOG_TYPE_ERROR, "[MPRadioController] Connection interrupted.", buf, 2u);
  }

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v4 = objc_loadWeakRetained((id *)(a1 + 40));
  v5 = v4;
  if (WeakRetained && v4)
  {
    v6 = WeakRetained[1];
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __57__MPRadioController__getConnectionWithCompletionHandler___block_invoke_21;
    v7[3] = &unk_1E31635F8;
    v8 = WeakRetained;
    v9 = v5;
    dispatch_barrier_async(v6, v7);

  }
}

void __57__MPRadioController__getConnectionWithCompletionHandler___block_invoke_2_22(uint64_t a1)
{
  NSObject *v2;
  _QWORD *WeakRetained;
  id v4;
  void *v5;
  NSObject *v6;
  _QWORD v7[4];
  _QWORD *v8;
  id v9;
  uint8_t buf[16];

  v2 = os_log_create("com.apple.amp.mediaplayer", "Playback");
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_193B9B000, v2, OS_LOG_TYPE_ERROR, "[MPRadioController] Connection invalidated.", buf, 2u);
  }

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v4 = objc_loadWeakRetained((id *)(a1 + 40));
  v5 = v4;
  if (WeakRetained && v4)
  {
    v6 = WeakRetained[1];
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __57__MPRadioController__getConnectionWithCompletionHandler___block_invoke_23;
    v7[3] = &unk_1E31635F8;
    v8 = WeakRetained;
    v9 = v5;
    dispatch_barrier_async(v6, v7);

  }
}

void __57__MPRadioController__getConnectionWithCompletionHandler___block_invoke_2_24(uint64_t a1)
{
  uint64_t v1;
  NSObject *v2;
  _QWORD block[5];

  v1 = *(_QWORD *)(a1 + 32);
  v2 = *(NSObject **)(v1 + 8);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __57__MPRadioController__getConnectionWithCompletionHandler___block_invoke_3;
  block[3] = &unk_1E3163508;
  block[4] = v1;
  dispatch_barrier_async(v2, block);
}

void __57__MPRadioController__getConnectionWithCompletionHandler___block_invoke_4(uint64_t a1, char a2, void *a3)
{
  id v5;
  uint64_t v6;
  NSObject *v7;
  id v8;
  _QWORD block[4];
  id v10;
  uint64_t v11;
  char v12;

  v5 = a3;
  v6 = *(_QWORD *)(a1 + 32);
  v7 = *(NSObject **)(v6 + 8);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __57__MPRadioController__getConnectionWithCompletionHandler___block_invoke_5;
  block[3] = &unk_1E31623A8;
  v10 = v5;
  v11 = v6;
  v12 = a2;
  v8 = v5;
  dispatch_barrier_async(v7, block);

}

uint64_t __57__MPRadioController__getConnectionWithCompletionHandler___block_invoke_5(uint64_t a1)
{
  if (!*(_QWORD *)(a1 + 32))
    objc_msgSend(*(id *)(a1 + 40), "_setRadioAvailable:", *(unsigned __int8 *)(a1 + 48));
  return objc_msgSend(*(id *)(a1 + 40), "_endRemoteProcessAssertion");
}

uint64_t __57__MPRadioController__getConnectionWithCompletionHandler___block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_endRemoteProcessAssertion");
}

void __57__MPRadioController__getConnectionWithCompletionHandler___block_invoke_23(uint64_t a1)
{
  uint64_t v1;
  void *v2;
  void *v3;

  v1 = *(_QWORD *)(a1 + 32);
  v2 = *(void **)(a1 + 40);
  v3 = *(void **)(v1 + 16);
  if (v3 == v2)
  {
    *(_QWORD *)(v1 + 16) = 0;

  }
}

void __57__MPRadioController__getConnectionWithCompletionHandler___block_invoke_21(uint64_t a1)
{
  uint64_t v1;
  void *v2;

  v1 = *(_QWORD *)(a1 + 32);
  v2 = *(void **)(v1 + 16);
  if (v2 == *(void **)(a1 + 40))
  {
    *(_QWORD *)(v1 + 16) = 0;

    *(_BYTE *)(*(_QWORD *)(a1 + 32) + 24) = 0;
  }
}

void __40__MPRadioController__setRadioAvailable___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "postNotificationName:object:", CFSTR("MPRadioControllerRadioAvailabilityDidChangeNotification"), *(_QWORD *)(a1 + 32));

}

void __47__MPRadioController__endRemoteProcessAssertion__block_invoke(uint64_t a1)
{
  uint64_t v1;
  NSObject *v2;
  _QWORD block[5];

  v1 = *(_QWORD *)(a1 + 32);
  v2 = *(NSObject **)(v1 + 8);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __47__MPRadioController__endRemoteProcessAssertion__block_invoke_2;
  block[3] = &unk_1E3163508;
  block[4] = v1;
  dispatch_barrier_async(v2, block);
}

void __47__MPRadioController__endRemoteProcessAssertion__block_invoke_2(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;
  void *v4;

  v1 = *(_QWORD *)(a1 + 32);
  if (!*(_QWORD *)(v1 + 48))
  {
    objc_msgSend(*(id *)(v1 + 32), "setInvalidationHandler:", 0);
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "invalidate");
    v3 = *(_QWORD *)(a1 + 32);
    v4 = *(void **)(v3 + 32);
    *(_QWORD *)(v3 + 32) = 0;

  }
}

uint64_t __71__MPRadioController__beginRemoteProcessAssertionWithCompletionHandler___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t result;

  v2 = *(_QWORD *)(a1 + 32);
  if (v2)
    (*(void (**)(void))(v2 + 16))();
  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

void __71__MPRadioController__beginRemoteProcessAssertionWithCompletionHandler___block_invoke_2(uint64_t a1)
{
  uint64_t v1;
  NSObject *v2;
  _QWORD block[5];

  v1 = *(_QWORD *)(a1 + 32);
  v2 = *(NSObject **)(v1 + 8);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __71__MPRadioController__beginRemoteProcessAssertionWithCompletionHandler___block_invoke_3;
  block[3] = &unk_1E3163508;
  block[4] = v1;
  dispatch_barrier_async(v2, block);
}

void __71__MPRadioController__beginRemoteProcessAssertionWithCompletionHandler___block_invoke_3(uint64_t a1)
{
  uint64_t v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void (**v8)(_QWORD);
  uint64_t v9;
  void *v10;
  _QWORD v11[5];
  id v12;
  _QWORD v13[5];
  id v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t (*v18)(uint64_t, uint64_t);
  void (*v19)(uint64_t);
  id v20;
  id location;

  v2 = *(_QWORD *)(a1 + 32);
  if (*(uint64_t *)(v2 + 48) >= 1 && !*(_QWORD *)(v2 + 32))
  {
    objc_initWeak(&location, (id)v2);
    v15 = 0;
    v16 = &v15;
    v17 = 0x3032000000;
    v18 = __Block_byref_object_copy__2805;
    v19 = __Block_byref_object_dispose__2806;
    v20 = 0;
    v3 = objc_alloc(MEMORY[0x1E0CFE308]);
    v4 = MEMORY[0x1E0C809B0];
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __71__MPRadioController__beginRemoteProcessAssertionWithCompletionHandler___block_invoke_15;
    v13[3] = &unk_1E3153A98;
    objc_copyWeak(&v14, &location);
    v13[4] = &v15;
    v5 = objc_msgSend(v3, "initWithBundleIdentifier:flags:reason:name:withHandler:", CFSTR("com.apple.Music"), 7, 4, CFSTR("com.apple.MediaPlayer.MPRadioController.connection"), v13);
    v6 = (void *)v16[5];
    v16[5] = v5;

    v7 = (void *)v16[5];
    v11[0] = v4;
    v11[1] = 3221225472;
    v11[2] = __71__MPRadioController__beginRemoteProcessAssertionWithCompletionHandler___block_invoke_3_18;
    v11[3] = &unk_1E31639C8;
    objc_copyWeak(&v12, &location);
    v11[4] = &v15;
    objc_msgSend(v7, "setInvalidationHandler:", v11);
    objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 32), (id)v16[5]);
    objc_destroyWeak(&v12);
    objc_destroyWeak(&v14);
    _Block_object_dispose(&v15, 8);

    objc_destroyWeak(&location);
    v2 = *(_QWORD *)(a1 + 32);
  }
  v8 = (void (**)(_QWORD))objc_msgSend(*(id *)(v2 + 40), "copy");
  v9 = *(_QWORD *)(a1 + 32);
  v10 = *(void **)(v9 + 40);
  *(_QWORD *)(v9 + 40) = 0;

  if (v8)
    v8[2](v8);

}

void __71__MPRadioController__beginRemoteProcessAssertionWithCompletionHandler___block_invoke_15(uint64_t a1, char a2)
{
  _QWORD *WeakRetained;
  void *v4;
  NSObject *v5;
  _QWORD v6[4];
  _QWORD *v7;
  uint64_t v8;

  if ((a2 & 1) == 0)
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
    v4 = WeakRetained;
    if (WeakRetained)
    {
      v5 = WeakRetained[1];
      v6[0] = MEMORY[0x1E0C809B0];
      v6[1] = 3221225472;
      v6[2] = __71__MPRadioController__beginRemoteProcessAssertionWithCompletionHandler___block_invoke_2_16;
      v6[3] = &unk_1E3163580;
      v8 = *(_QWORD *)(a1 + 32);
      v7 = WeakRetained;
      dispatch_barrier_async(v5, v6);

    }
  }
}

void __71__MPRadioController__beginRemoteProcessAssertionWithCompletionHandler___block_invoke_3_18(uint64_t a1)
{
  _QWORD *WeakRetained;
  void *v3;
  NSObject *v4;
  _QWORD v5[4];
  _QWORD *v6;
  uint64_t v7;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v3 = WeakRetained;
  if (WeakRetained)
  {
    v4 = WeakRetained[1];
    v5[0] = MEMORY[0x1E0C809B0];
    v5[1] = 3221225472;
    v5[2] = __71__MPRadioController__beginRemoteProcessAssertionWithCompletionHandler___block_invoke_4;
    v5[3] = &unk_1E3163580;
    v7 = *(_QWORD *)(a1 + 32);
    v6 = WeakRetained;
    dispatch_barrier_async(v4, v5);

  }
}

void __71__MPRadioController__beginRemoteProcessAssertionWithCompletionHandler___block_invoke_4(uint64_t a1)
{
  uint64_t v1;
  void *v2;

  v1 = *(_QWORD *)(a1 + 32);
  v2 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
  if (v2 == *(void **)(v1 + 32))
  {
    *(_QWORD *)(v1 + 32) = 0;

  }
}

void __71__MPRadioController__beginRemoteProcessAssertionWithCompletionHandler___block_invoke_2_16(uint64_t a1)
{
  uint64_t v1;
  void *v2;

  v1 = *(_QWORD *)(a1 + 32);
  v2 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
  if (v2 == *(void **)(v1 + 32))
  {
    *(_QWORD *)(v1 + 32) = 0;

  }
}

void __65__MPRadioController_getRecentStationGroupsWithCompletionHandler___block_invoke(uint64_t a1)
{
  void *v1;
  _QWORD v2[4];
  id v3;
  id v4;

  v2[0] = MEMORY[0x1E0C809B0];
  v2[1] = 3221225472;
  v2[2] = __65__MPRadioController_getRecentStationGroupsWithCompletionHandler___block_invoke_2;
  v2[3] = &unk_1E3162560;
  v1 = *(void **)(a1 + 40);
  v3 = *(id *)(a1 + 32);
  v4 = v1;
  objc_msgSend(v3, "_beginRemoteProcessAssertionWithCompletionHandler:", v2);

}

void __65__MPRadioController_getRecentStationGroupsWithCompletionHandler___block_invoke_2(uint64_t a1)
{
  void *v2;
  id v3;
  _QWORD v4[5];
  id v5;

  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __65__MPRadioController_getRecentStationGroupsWithCompletionHandler___block_invoke_3;
  v4[3] = &unk_1E3153A48;
  v2 = *(void **)(a1 + 32);
  v3 = *(id *)(a1 + 40);
  v4[4] = *(_QWORD *)(a1 + 32);
  v5 = v3;
  objc_msgSend(v2, "_getConnectionWithCompletionHandler:", v4);

}

void __65__MPRadioController_getRecentStationGroupsWithCompletionHandler___block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  id v5;
  void (**v6)(_QWORD, _QWORD, _QWORD);
  void *v7;
  void (**v8)(_QWORD, _QWORD, _QWORD);
  void *v9;
  _QWORD v10[5];
  void (**v11)(_QWORD, _QWORD, _QWORD);
  _QWORD v12[5];
  id v13;
  _QWORD v14[5];
  id v15;

  v3 = a2;
  v4 = MEMORY[0x1E0C809B0];
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __65__MPRadioController_getRecentStationGroupsWithCompletionHandler___block_invoke_4;
  v14[3] = &unk_1E315BA48;
  v5 = *(id *)(a1 + 40);
  v14[4] = *(_QWORD *)(a1 + 32);
  v15 = v5;
  v6 = (void (**)(_QWORD, _QWORD, _QWORD))MEMORY[0x19403A810](v14);
  v7 = v6;
  if (v3)
  {
    v12[0] = v4;
    v12[1] = 3221225472;
    v12[2] = __65__MPRadioController_getRecentStationGroupsWithCompletionHandler___block_invoke_6;
    v12[3] = &unk_1E3161878;
    v12[4] = *(_QWORD *)(a1 + 32);
    v8 = v6;
    v13 = v8;
    objc_msgSend(v3, "remoteObjectProxyWithErrorHandler:", v12);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10[0] = v4;
    v10[1] = 3221225472;
    v10[2] = __65__MPRadioController_getRecentStationGroupsWithCompletionHandler___block_invoke_8;
    v10[3] = &unk_1E315BA48;
    v10[4] = *(_QWORD *)(a1 + 32);
    v11 = v8;
    objc_msgSend(v9, "serviceRadioControllerGetRecentStationGroupsWithCompletionHandler:", v10);

  }
  else
  {
    v6[2](v6, 0, 0);
  }

}

void __65__MPRadioController_getRecentStationGroupsWithCompletionHandler___block_invoke_4(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  NSObject *v8;
  _QWORD block[4];
  id v10;
  id v11;
  id v12;

  v5 = a2;
  v6 = a3;
  v7 = *(void **)(a1 + 40);
  if (v7)
  {
    dispatch_get_global_queue(0, 0);
    v8 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __65__MPRadioController_getRecentStationGroupsWithCompletionHandler___block_invoke_5;
    block[3] = &unk_1E3161780;
    v12 = v7;
    v10 = v5;
    v11 = v6;
    dispatch_async(v8, block);

  }
  objc_msgSend(*(id *)(a1 + 32), "_endRemoteProcessAssertion");

}

void __65__MPRadioController_getRecentStationGroupsWithCompletionHandler___block_invoke_6(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  NSObject *v5;
  id v6;
  _QWORD v7[4];
  id v8;
  id v9;

  v3 = a2;
  v4 = *(void **)(a1 + 40);
  v5 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 8);
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __65__MPRadioController_getRecentStationGroupsWithCompletionHandler___block_invoke_7;
  v7[3] = &unk_1E3162560;
  v8 = v3;
  v9 = v4;
  v6 = v3;
  dispatch_barrier_async(v5, v7);

}

void __65__MPRadioController_getRecentStationGroupsWithCompletionHandler___block_invoke_8(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  NSObject *v8;
  id v9;
  id v10;
  _QWORD block[4];
  id v12;
  id v13;
  id v14;

  v5 = a2;
  v6 = a3;
  v7 = *(void **)(a1 + 40);
  v8 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 8);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __65__MPRadioController_getRecentStationGroupsWithCompletionHandler___block_invoke_9;
  block[3] = &unk_1E3161780;
  v13 = v6;
  v14 = v7;
  v12 = v5;
  v9 = v6;
  v10 = v5;
  dispatch_barrier_async(v8, block);

}

uint64_t __65__MPRadioController_getRecentStationGroupsWithCompletionHandler___block_invoke_9(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

uint64_t __65__MPRadioController_getRecentStationGroupsWithCompletionHandler___block_invoke_7(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), 0, *(_QWORD *)(a1 + 32));
}

uint64_t __65__MPRadioController_getRecentStationGroupsWithCompletionHandler___block_invoke_5(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

uint64_t __37__MPRadioController_isRadioAvailable__block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = *(_BYTE *)(*(_QWORD *)(result + 32) + 25);
  return result;
}

void __65__MPRadioController_clientRadioControllerRecentStationsDidChange__block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "postNotificationName:object:", CFSTR("MPRadioControllerRecentStationsDidChangeNotification"), *(_QWORD *)(a1 + 32));

}

uint64_t __69__MPRadioController_clientRadioControllerRadioAvailabilityDidChange___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_setRadioAvailable:", *(unsigned __int8 *)(a1 + 40));
}

@end
