@implementation MRUMirroringController

- (MRUMirroringController)init
{
  MRUMirroringController *v2;
  NSMutableSet *v3;
  NSMutableSet *busyIdentifiers;
  MRUMirroringDiscoverySessionController *v5;
  MRUMirroringDiscoverySessionController *outputDeviceDiscoverySessionController;
  MRUOutputContextController *v7;
  MRUOutputContextController *outputContextController;
  void *v9;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)MRUMirroringController;
  v2 = -[MRUMirroringController init](&v11, sel_init);
  if (v2)
  {
    v2->_tetheredDisplayPortModeEnabled = CFPreferencesGetAppBooleanValue(CFSTR("EnableTetheredDisplayPortMode"), (CFStringRef)*MEMORY[0x1E0C9B228], 0) != 0;
    v3 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E0C99E20]);
    busyIdentifiers = v2->_busyIdentifiers;
    v2->_busyIdentifiers = v3;

    v5 = -[MRUMirroringDiscoverySessionController initWithDeviceFeatures:]([MRUMirroringDiscoverySessionController alloc], "initWithDeviceFeatures:", 2);
    outputDeviceDiscoverySessionController = v2->_outputDeviceDiscoverySessionController;
    v2->_outputDeviceDiscoverySessionController = v5;

    -[MRUMirroringDiscoverySessionController setDelegate:](v2->_outputDeviceDiscoverySessionController, "setDelegate:", v2);
    v7 = -[MRUOutputContextController initWithOutputContextType:]([MRUOutputContextController alloc], "initWithOutputContextType:", 1);
    outputContextController = v2->_outputContextController;
    v2->_outputContextController = v7;

    -[MRUOutputContextController setDelegate:](v2->_outputContextController, "setDelegate:", v2);
    MRMediaRemoteSetWantsRouteChangeNotifications();
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "addObserver:selector:name:object:", v2, sel_pairingHandlerNotification_, *MEMORY[0x1E0D4CD50], 0);

    -[MRUMirroringController updateSelectedOutputDevice](v2, "updateSelectedOutputDevice");
  }
  return v2;
}

+ (id)mirroringControllerWithAudioRoutingSupport
{
  id v2;
  MRUMirroringDiscoverySessionController *v3;
  void *v4;
  MRUOutputContextController *v5;
  void *v6;

  v2 = objc_alloc_init((Class)a1);
  v3 = -[MRUMirroringDiscoverySessionController initWithDeviceFeatures:]([MRUMirroringDiscoverySessionController alloc], "initWithDeviceFeatures:", 1);
  objc_msgSend(v2, "setAudioDiscoverySessionController:", v3);

  objc_msgSend(v2, "audioDiscoverySessionController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setDelegate:", v2);

  v5 = -[MRUOutputContextController initWithOutputContextType:]([MRUOutputContextController alloc], "initWithOutputContextType:", 0);
  objc_msgSend(v2, "setAudioContextController:", v5);

  objc_msgSend(v2, "audioContextController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setDelegate:", v2);

  return v2;
}

+ (id)symbolNameForOutputDevice:(id)a3
{
  const void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x1E0C80C00];
  if (!a3)
    return 0;
  v3 = (const void *)MRAVOutputDeviceCreateFromAVOutputDevice();
  v4 = objc_alloc(MEMORY[0x1E0CC22F8]);
  v9[0] = v3;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v9, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v4, "initWithOutputDevices:", v5);

  CFRelease(v3);
  objc_msgSend(MEMORY[0x1E0CC2318], "_symbolNameForRoute:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (void)startMirroringToOutputDevice:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id WeakRetained;
  char v10;
  NSObject *v11;
  uint64_t v12;
  void *v13;
  id v14;
  id v15;
  id v16;
  id v17;
  uint8_t buf[4];
  uint64_t v19;
  __int16 v20;
  void *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  objc_msgSend(v6, "deviceID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8 && (-[NSMutableSet containsObject:](self->_busyIdentifiers, "containsObject:", v8) & 1) == 0)
  {
    -[MRUMirroringController addBusyIdentifier:](self, "addBusyIdentifier:", v8);
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    v10 = objc_opt_respondsToSelector();

    if ((v10 & 1) != 0)
    {
      _MPAVLog();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        v12 = objc_opt_class();
        objc_msgSend(v6, "deviceID");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v19 = v12;
        v20 = 2114;
        v21 = v13;
        _os_log_impl(&dword_1AA991000, v11, OS_LOG_TYPE_DEFAULT, "%{public}@ start mirroring to device %{public}@", buf, 0x16u);

      }
      objc_initWeak((id *)buf, self);
      v14 = MEMORY[0x1E0C80D38];
      objc_copyWeak(&v17, (id *)buf);
      v15 = v6;
      v16 = v7;
      MRMediaRemoteRegisterPairingHandler();

      objc_destroyWeak(&v17);
      objc_destroyWeak((id *)buf);
    }
    else
    {
      -[MRUMirroringController mirrorToOutputDevice:completion:](self, "mirrorToOutputDevice:completion:", v6, v7);
    }
  }

}

void __66__MRUMirroringController_startMirroringToOutputDevice_completion___block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  _QWORD v4[4];
  id v5;
  id v6;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  v3 = *(void **)(a1 + 32);
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __66__MRUMirroringController_startMirroringToOutputDevice_completion___block_invoke_2;
  v4[3] = &unk_1E5819250;
  v5 = v3;
  v6 = *(id *)(a1 + 40);
  objc_msgSend(WeakRetained, "mirrorToOutputDevice:completion:", v5, v4);

}

uint64_t __66__MRUMirroringController_startMirroringToOutputDevice_completion___block_invoke_2(uint64_t a1, uint64_t a2)
{
  void *v4;
  uint64_t result;

  objc_msgSend(*(id *)(a1 + 32), "deviceID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  MRMediaRemoteUnregisterPairingHandler();

  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(uint64_t, uint64_t))(result + 16))(result, a2);
  return result;
}

- (void)mirrorToOutputDevice:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  MRUOutputContextController *outputContextController;
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;
  id v13;
  id v14;
  id location;

  v6 = a3;
  v7 = a4;
  objc_initWeak(&location, self);
  outputContextController = self->_outputContextController;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __58__MRUMirroringController_mirrorToOutputDevice_completion___block_invoke;
  v11[3] = &unk_1E58192A0;
  objc_copyWeak(&v14, &location);
  v9 = v6;
  v12 = v9;
  v10 = v7;
  v13 = v10;
  -[MRUOutputContextController setOutputDevice:completion:](outputContextController, "setOutputDevice:completion:", v9, v11);

  objc_destroyWeak(&v14);
  objc_destroyWeak(&location);

}

void __58__MRUMirroringController_mirrorToOutputDevice_completion___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v4;
  uint64_t v5;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  objc_msgSend(*(id *)(a1 + 32), "deviceID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(WeakRetained, "removeBusyIdentifier:", v4);

  v5 = *(_QWORD *)(a1 + 40);
  if (v5)
    (*(void (**)(uint64_t, uint64_t))(v5 + 16))(v5, a2);

}

- (void)stopMirroringWithCompletion:(id)a3
{
  id v4;
  NSObject *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  MRUOutputContextController *outputContextController;
  void *v10;
  id v11;
  _QWORD v12[4];
  id v13;
  uint8_t buf[4];
  uint64_t v15;
  __int16 v16;
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  _MPAVLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = objc_opt_class();
    -[MRUMirroringController selectedOutputDevice](self, "selectedOutputDevice");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "deviceID");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v15 = v6;
    v16 = 2114;
    v17 = v8;
    _os_log_impl(&dword_1AA991000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@ stop mirroring to device %{public}@", buf, 0x16u);

  }
  outputContextController = self->_outputContextController;
  objc_msgSend(MEMORY[0x1E0C8B2B8], "sharedLocalDevice");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __54__MRUMirroringController_stopMirroringWithCompletion___block_invoke;
  v12[3] = &unk_1E58192C8;
  v13 = v4;
  v11 = v4;
  -[MRUOutputContextController setOutputDevice:completion:](outputContextController, "setOutputDevice:completion:", v10, v12);

}

uint64_t __54__MRUMirroringController_stopMirroringWithCompletion___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (void)selectAudioOutputDevice:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  MRUOutputContextController *audioContextController;
  _QWORD v14[4];
  id v15;
  id v16;
  id v17;
  uint8_t buf[4];
  uint64_t v19;
  __int16 v20;
  void *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  _MPAVLog();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v9 = objc_opt_class();
    -[MRUMirroringController selectedOutputDevice](self, "selectedOutputDevice");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "deviceID");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v19 = v9;
    v20 = 2114;
    v21 = v11;
    _os_log_impl(&dword_1AA991000, v8, OS_LOG_TYPE_DEFAULT, "%{public}@ change audio destination to %{public}@", buf, 0x16u);

  }
  objc_msgSend(v6, "deviceID");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (v12 && (-[NSMutableSet containsObject:](self->_busyIdentifiers, "containsObject:", v12) & 1) == 0)
  {
    -[MRUMirroringController addBusyIdentifier:](self, "addBusyIdentifier:", v12);
    objc_initWeak((id *)buf, self);
    audioContextController = self->_audioContextController;
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __61__MRUMirroringController_selectAudioOutputDevice_completion___block_invoke;
    v14[3] = &unk_1E58192A0;
    objc_copyWeak(&v17, (id *)buf);
    v15 = v6;
    v16 = v7;
    -[MRUOutputContextController setOutputDevice:completion:](audioContextController, "setOutputDevice:completion:", v15, v14);

    objc_destroyWeak(&v17);
    objc_destroyWeak((id *)buf);
  }

}

void __61__MRUMirroringController_selectAudioOutputDevice_completion___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v4;
  uint64_t v5;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  objc_msgSend(*(id *)(a1 + 32), "deviceID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(WeakRetained, "removeBusyIdentifier:", v4);

  v5 = *(_QWORD *)(a1 + 40);
  if (v5)
    (*(void (**)(uint64_t, uint64_t))(v5 + 16))(v5, a2);

}

- (void)startDetailedDiscovery
{
  NSObject *v3;
  int v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  _MPAVLog();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4 = 138543362;
    v5 = objc_opt_class();
    _os_log_impl(&dword_1AA991000, v3, OS_LOG_TYPE_DEFAULT, "%{public}@ start detailed discovery", (uint8_t *)&v4, 0xCu);
  }

  -[MRUMirroringDiscoverySessionController startDetailedDiscovery](self->_outputDeviceDiscoverySessionController, "startDetailedDiscovery");
  -[MRUMirroringDiscoverySessionController startDetailedDiscovery](self->_audioDiscoverySessionController, "startDetailedDiscovery");
}

- (void)stopDetailedDiscovery
{
  NSObject *v3;
  int v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  _MPAVLog();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4 = 138543362;
    v5 = objc_opt_class();
    _os_log_impl(&dword_1AA991000, v3, OS_LOG_TYPE_DEFAULT, "%{public}@ stop detailed discovery", (uint8_t *)&v4, 0xCu);
  }

  -[MRUMirroringDiscoverySessionController stopDetailedDiscovery](self->_outputDeviceDiscoverySessionController, "stopDetailedDiscovery");
  -[MRUMirroringDiscoverySessionController stopDetailedDiscovery](self->_audioDiscoverySessionController, "stopDetailedDiscovery");
}

- (void)pairingHandlerNotification:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  NSObject *v10;
  uint64_t v11;
  NSMutableSet *busyIdentifiers;
  id v13;
  _QWORD block[5];
  id v15;
  _BOOL8 v16;
  uint8_t buf[4];
  uint64_t v18;
  __int16 v19;
  void *v20;
  __int16 v21;
  uint64_t v22;
  __int16 v23;
  NSMutableSet *v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "userInfo");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", *MEMORY[0x1E0D4CD58]);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "userInfo");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("inputType"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "integerValue");

  _MPAVLog();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    v11 = objc_opt_class();
    busyIdentifiers = self->_busyIdentifiers;
    *(_DWORD *)buf = 138544130;
    v18 = v11;
    v19 = 2114;
    v20 = v6;
    v21 = 2048;
    v22 = v9;
    v23 = 2114;
    v24 = busyIdentifiers;
    _os_log_impl(&dword_1AA991000, v10, OS_LOG_TYPE_DEFAULT, "%{public}@ received pairing request for %{public}@ | inputType: %li | requests: %{public}@", buf, 0x2Au);
  }

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __53__MRUMirroringController_pairingHandlerNotification___block_invoke;
  block[3] = &unk_1E58192F0;
  block[4] = self;
  v15 = v6;
  v16 = v9 != 1;
  v13 = v6;
  dispatch_async(MEMORY[0x1E0C80D38], block);

}

void __53__MRUMirroringController_pairingHandlerNotification___block_invoke(uint64_t a1)
{
  void *v2;
  MRUMirroringAuthorizationRequest *v3;
  char v4;
  id v5;

  objc_msgSend(*(id *)(a1 + 32), "outputDeviceForID:", *(_QWORD *)(a1 + 40));
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    objc_msgSend(*(id *)(a1 + 32), "busyIdentifiers");
    v3 = (MRUMirroringAuthorizationRequest *)objc_claimAutoreleasedReturnValue();
    if (!-[MRUMirroringAuthorizationRequest containsObject:](v3, "containsObject:", *(_QWORD *)(a1 + 40)))
    {
LABEL_5:

      goto LABEL_6;
    }
    v4 = objc_opt_respondsToSelector();

    if ((v4 & 1) != 0)
    {
      v3 = -[MRUPairingAuthorizationRequest initWithOutputDevice:inputType:]([MRUMirroringAuthorizationRequest alloc], "initWithOutputDevice:inputType:", v5, *(_QWORD *)(a1 + 48));
      objc_msgSend(v2, "mirroringController:didReceiveAuthorizationRequest:", *(_QWORD *)(a1 + 32), v3);
      goto LABEL_5;
    }
  }
LABEL_6:

}

- (void)outputContextController:(id)a3 didChangeOutputDevice:(id)a4
{
  MRUOutputContextController *v6;
  void *v7;
  MRUOutputContextController *outputContextController;

  v6 = (MRUOutputContextController *)a3;
  objc_msgSend(a4, "deviceID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[MRUMirroringController removeBusyIdentifier:](self, "removeBusyIdentifier:", v7);

  outputContextController = self->_outputContextController;
  if (outputContextController == v6)
  {
    -[MRUMirroringController updateSelectedOutputDevice](self, "updateSelectedOutputDevice");
  }
  else
  {
    -[MRUMirroringController updateSelectedAudioOutputDevice](self, "updateSelectedAudioOutputDevice");
    -[MRUMirroringController updateAvailableAudioOutputDevices](self, "updateAvailableAudioOutputDevices");
  }
}

- (void)mirroringDiscoverySessionController:(id)a3 didChangeAvailableOutputDevices:(id)a4
{
  if (self->_outputDeviceDiscoverySessionController == a3)
    -[MRUMirroringController updateAvailableOutputDevices](self, "updateAvailableOutputDevices");
  else
    -[MRUMirroringController updateAvailableAudioOutputDevices](self, "updateAvailableAudioOutputDevices");
}

- (void)updateSelectedOutputDevice
{
  void *v3;
  id v4;
  uint64_t v5;
  void *v6;
  NSObject *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  id WeakRetained;
  int v12;
  uint64_t v13;
  __int16 v14;
  void *v15;
  __int16 v16;
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  -[MRUOutputContextController outputDevice](self->_outputContextController, "outputDevice");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (self->_tetheredDisplayPortModeEnabled)
  {
    v4 = 0;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C8B2B8], "sharedLocalDevice");
    v5 = objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v3, "isEqual:", v5))
      v6 = 0;
    else
      v6 = v3;
    v4 = v6;

    v3 = (void *)v5;
  }

  if ((objc_msgSend(v4, "isEqual:", self->_selectedOutputDevice) & 1) == 0)
  {
    _MPAVLog();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v8 = objc_opt_class();
      objc_msgSend(v4, "deviceID");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[AVOutputDevice deviceID](self->_selectedOutputDevice, "deviceID");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = 138543874;
      v13 = v8;
      v14 = 2114;
      v15 = v9;
      v16 = 2114;
      v17 = v10;
      _os_log_impl(&dword_1AA991000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@ update selected output device: %{public}@ | previous: %{public}@", (uint8_t *)&v12, 0x20u);

    }
    objc_storeStrong((id *)&self->_selectedOutputDevice, v4);
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(WeakRetained, "mirroringController:didChangeOutputDevice:", self, v4);

  }
}

- (void)updateSelectedAudioOutputDevice
{
  void *v3;
  NSObject *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  id WeakRetained;
  int v9;
  uint64_t v10;
  __int16 v11;
  void *v12;
  __int16 v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  -[MRUOutputContextController outputDevice](self->_audioContextController, "outputDevice");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v3, "isEqual:", self->_selectedAudioOutputDevice) & 1) == 0)
  {
    _MPAVLog();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      v5 = objc_opt_class();
      objc_msgSend(v3, "deviceID");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[AVOutputDevice deviceID](self->_selectedAudioOutputDevice, "deviceID");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = 138543874;
      v10 = v5;
      v11 = 2114;
      v12 = v6;
      v13 = 2114;
      v14 = v7;
      _os_log_impl(&dword_1AA991000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@ update selected audio output device: %{public}@ | previous: %{public}@", (uint8_t *)&v9, 0x20u);

    }
    objc_storeStrong((id *)&self->_selectedAudioOutputDevice, v3);
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    if ((objc_opt_respondsToSelector() & 1) != 0)
      objc_msgSend(WeakRetained, "mirroringController:didChangeAudioOutputDevice:", self, v3);

  }
}

- (void)updateAvailableOutputDevices
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  NSArray *v12;
  NSArray *availableOutputDevices;
  NSObject *v14;
  uint64_t v15;
  void *v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  uint8_t buf[4];
  uint64_t v22;
  __int16 v23;
  void *v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C8B2B8], "sharedLocalDevice");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  -[MRUMirroringDiscoverySessionController availableOutputDevices](self->_outputDeviceDiscoverySessionController, "availableOutputDevices", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v17, v25, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v18;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v18 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * i);
        if ((objc_msgSend(v10, "isEqual:", v3) & 1) == 0)
        {
          objc_msgSend(v10, "deviceID");
          v11 = (void *)objc_claimAutoreleasedReturnValue();

          if (v11)
            objc_msgSend(v4, "addObject:", v10);
        }
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v17, v25, 16);
    }
    while (v7);
  }

  v12 = (NSArray *)objc_msgSend(v4, "copy");
  availableOutputDevices = self->_availableOutputDevices;
  self->_availableOutputDevices = v12;

  _MPAVLog();
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    v15 = objc_opt_class();
    *(_DWORD *)buf = 138543618;
    v22 = v15;
    v23 = 2114;
    v24 = v4;
    _os_log_impl(&dword_1AA991000, v14, OS_LOG_TYPE_DEFAULT, "%{public}@ update output devices: %{public}@", buf, 0x16u);
  }

  -[MRUMirroringController delegate](self, "delegate");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v16, "mirroringController:didChangeAvailableOutputDevices:", self, self->_availableOutputDevices);

}

- (void)updateAvailableAudioOutputDevices
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  NSArray *v15;
  NSArray *availableAudioOutputDevices;
  NSObject *v17;
  uint64_t v18;
  void *v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  uint8_t buf[4];
  uint64_t v25;
  __int16 v26;
  void *v27;
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  -[MRUMirroringDiscoverySessionController availableOutputDevices](self->_audioDiscoverySessionController, "availableOutputDevices", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v20, v28, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v21;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v21 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * v8);
        objc_msgSend(v9, "deviceID");
        v10 = objc_claimAutoreleasedReturnValue();
        if (v10)
        {
          v11 = (void *)v10;
          -[MRUMirroringController selectedOutputDevice](self, "selectedOutputDevice");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          if ((objc_msgSend(v9, "isEqual:", v12) & 1) != 0
            || objc_msgSend(v9, "deviceType") == 1
            || objc_msgSend(v9, "deviceType") == 3)
          {

LABEL_11:
            objc_msgSend(v3, "addObject:", v9);
            goto LABEL_12;
          }
          v13 = objc_msgSend(v9, "deviceType");

          if (v13 == 4)
            goto LABEL_11;
        }
LABEL_12:
        ++v8;
      }
      while (v6 != v8);
      v14 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v20, v28, 16);
      v6 = v14;
    }
    while (v14);
  }

  v15 = (NSArray *)objc_msgSend(v3, "copy");
  availableAudioOutputDevices = self->_availableAudioOutputDevices;
  self->_availableAudioOutputDevices = v15;

  _MPAVLog();
  v17 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    v18 = objc_opt_class();
    *(_DWORD *)buf = 138543618;
    v25 = v18;
    v26 = 2114;
    v27 = v3;
    _os_log_impl(&dword_1AA991000, v17, OS_LOG_TYPE_DEFAULT, "%{public}@ update audio output devices: %{public}@", buf, 0x16u);
  }

  -[MRUMirroringController delegate](self, "delegate");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v19, "mirroringController:didChangeAvailableOutputDevices:", self, self->_availableAudioOutputDevices);

}

- (void)addBusyIdentifier:(id)a3
{
  id WeakRetained;
  id v5;

  if (a3)
  {
    -[NSMutableSet addObject:](self->_busyIdentifiers, "addObject:");
    -[MRUMirroringController delegate](self, "delegate");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
      objc_msgSend(WeakRetained, "mirroringController:didUpdateBusyIdenifiers:", self, self->_busyIdentifiers);

    }
  }
}

- (void)removeBusyIdentifier:(id)a3
{
  void *v4;
  id WeakRetained;
  id v6;

  v6 = a3;
  if (-[NSMutableSet count](self->_busyIdentifiers, "count") == 1)
  {
    -[NSMutableSet removeAllObjects](self->_busyIdentifiers, "removeAllObjects");
  }
  else if (v6)
  {
    -[NSMutableSet removeObject:](self->_busyIdentifiers, "removeObject:", v6);
  }
  -[MRUMirroringController delegate](self, "delegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(WeakRetained, "mirroringController:didUpdateBusyIdenifiers:", self, self->_busyIdentifiers);

  }
}

- (id)outputDeviceForID:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  _QWORD v9[4];
  id v10;

  v4 = a3;
  -[MRUMirroringController availableOutputDevices](self, "availableOutputDevices");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __44__MRUMirroringController_outputDeviceForID___block_invoke;
  v9[3] = &unk_1E5819318;
  v10 = v4;
  v6 = v4;
  objc_msgSend(v5, "msv_firstWhere:", v9);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

uint64_t __44__MRUMirroringController_outputDeviceForID___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;

  objc_msgSend(a2, "deviceID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqualToString:", *(_QWORD *)(a1 + 32));

  return v4;
}

- (MRUMirroringControllerDelegate)delegate
{
  return (MRUMirroringControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (AVOutputDevice)selectedOutputDevice
{
  return self->_selectedOutputDevice;
}

- (NSArray)availableOutputDevices
{
  return self->_availableOutputDevices;
}

- (AVOutputDevice)selectedAudioOutputDevice
{
  return self->_selectedAudioOutputDevice;
}

- (NSArray)availableAudioOutputDevices
{
  return self->_availableAudioOutputDevices;
}

- (NSMutableSet)busyIdentifiers
{
  return self->_busyIdentifiers;
}

- (void)setBusyIdentifiers:(id)a3
{
  objc_storeStrong((id *)&self->_busyIdentifiers, a3);
}

- (MRUOutputContextController)outputContextController
{
  return self->_outputContextController;
}

- (void)setOutputContextController:(id)a3
{
  objc_storeStrong((id *)&self->_outputContextController, a3);
}

- (MRUMirroringDiscoverySessionController)outputDeviceDiscoverySessionController
{
  return self->_outputDeviceDiscoverySessionController;
}

- (void)setOutputDeviceDiscoverySessionController:(id)a3
{
  objc_storeStrong((id *)&self->_outputDeviceDiscoverySessionController, a3);
}

- (MRUOutputContextController)audioContextController
{
  return self->_audioContextController;
}

- (void)setAudioContextController:(id)a3
{
  objc_storeStrong((id *)&self->_audioContextController, a3);
}

- (MRUMirroringDiscoverySessionController)audioDiscoverySessionController
{
  return self->_audioDiscoverySessionController;
}

- (void)setAudioDiscoverySessionController:(id)a3
{
  objc_storeStrong((id *)&self->_audioDiscoverySessionController, a3);
}

- (BOOL)tetheredDisplayPortModeEnabled
{
  return self->_tetheredDisplayPortModeEnabled;
}

- (void)setTetheredDisplayPortModeEnabled:(BOOL)a3
{
  self->_tetheredDisplayPortModeEnabled = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_audioDiscoverySessionController, 0);
  objc_storeStrong((id *)&self->_audioContextController, 0);
  objc_storeStrong((id *)&self->_outputDeviceDiscoverySessionController, 0);
  objc_storeStrong((id *)&self->_outputContextController, 0);
  objc_storeStrong((id *)&self->_busyIdentifiers, 0);
  objc_storeStrong((id *)&self->_availableAudioOutputDevices, 0);
  objc_storeStrong((id *)&self->_selectedAudioOutputDevice, 0);
  objc_storeStrong((id *)&self->_availableOutputDevices, 0);
  objc_storeStrong((id *)&self->_selectedOutputDevice, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
