@implementation MRUMirroringDiscoverySessionController

- (MRUMirroringDiscoverySessionController)init
{
  return -[MRUMirroringDiscoverySessionController initWithDeviceFeatures:](self, "initWithDeviceFeatures:", 0xFFFFLL);
}

- (MRUMirroringDiscoverySessionController)initWithDeviceFeatures:(unint64_t)a3
{
  MRUMirroringDiscoverySessionController *v4;
  MRUMirroringDiscoverySessionController *v5;
  uint64_t v6;
  NSArray *availableOutputDevices;
  NSObject *v8;
  _QWORD block[4];
  id v11[2];
  id location;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)MRUMirroringDiscoverySessionController;
  v4 = -[MRUMirroringDiscoverySessionController init](&v13, sel_init);
  v5 = v4;
  if (v4)
  {
    v4->_needsUpdate = 0;
    objc_msgSend(MEMORY[0x1E0C99D20], "array");
    v6 = objc_claimAutoreleasedReturnValue();
    availableOutputDevices = v5->_availableOutputDevices;
    v5->_availableOutputDevices = (NSArray *)v6;

    objc_initWeak(&location, v5);
    dispatch_get_global_queue(-2, 0);
    v8 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __65__MRUMirroringDiscoverySessionController_initWithDeviceFeatures___block_invoke;
    block[3] = &unk_1E5819C90;
    v11[1] = (id)a3;
    objc_copyWeak(v11, &location);
    dispatch_async(v8, block);

    objc_destroyWeak(v11);
    objc_destroyWeak(&location);
  }
  return v5;
}

void __65__MRUMirroringDiscoverySessionController_initWithDeviceFeatures___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  char v4;
  id v5;
  NSObject *v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;
  id v13;
  id v14;
  id v15;
  uint8_t buf[4];
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C89AE8], "auxiliarySession");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = *MEMORY[0x1E0C89690];
  v15 = 0;
  v4 = objc_msgSend(v2, "setCategory:error:", v3, &v15);
  v5 = v15;
  if ((v4 & 1) == 0)
  {
    _MPAVLog();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v17 = v5;
      _os_log_impl(&dword_1AA991000, v6, OS_LOG_TYPE_DEFAULT, "Audio session category failed: %{public}@ (AirPlay devices may be missed)", buf, 0xCu);
    }

  }
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C8B2C8]), "initWithDeviceFeatures:", *(_QWORD *)(a1 + 40));
  objc_msgSend(v7, "setTargetAudioSession:", v2);
  objc_msgSend(v7, "availableOutputDevices");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __65__MRUMirroringDiscoverySessionController_initWithDeviceFeatures___block_invoke_3;
  v11[3] = &unk_1E5819C68;
  objc_copyWeak(&v14, (id *)(a1 + 32));
  v12 = v7;
  v13 = v8;
  v9 = v8;
  v10 = v7;
  dispatch_async(MEMORY[0x1E0C80D38], v11);

  objc_destroyWeak(&v14);
}

void __65__MRUMirroringDiscoverySessionController_initWithDeviceFeatures___block_invoke_3(uint64_t a1)
{
  id WeakRetained;
  id v3;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    v3 = WeakRetained;
    objc_msgSend(WeakRetained, "setOutputDeviceDiscoverySession:", *(_QWORD *)(a1 + 32));
    objc_msgSend(v3, "updateDiscoveryMode");
    objc_msgSend(v3, "updateOutputDevicesForAvailableOutputDevices:", *(_QWORD *)(a1 + 40));
    WeakRetained = v3;
  }

}

- (void)dealloc
{
  objc_super v3;

  -[AVOutputDeviceDiscoverySession setDiscoveryMode:](self->_outputDeviceDiscoverySession, "setDiscoveryMode:", 0);
  v3.receiver = self;
  v3.super_class = (Class)MRUMirroringDiscoverySessionController;
  -[MRUMirroringDiscoverySessionController dealloc](&v3, sel_dealloc);
}

- (BOOL)isExternalOutputDeviceAvailable
{
  return -[AVOutputDeviceDiscoverySession devicePresenceDetected](self->_outputDeviceDiscoverySession, "devicePresenceDetected");
}

- (void)startDetailedDiscovery
{
  -[MRUMirroringDiscoverySessionController setDetailedDiscovery:](self, "setDetailedDiscovery:", 1);
  -[MRUMirroringDiscoverySessionController updateDiscoveryMode](self, "updateDiscoveryMode");
}

- (void)stopDetailedDiscovery
{
  -[MRUMirroringDiscoverySessionController setDetailedDiscovery:](self, "setDetailedDiscovery:", 0);
  -[MRUMirroringDiscoverySessionController updateDiscoveryMode](self, "updateDiscoveryMode");
}

- (void)availableOutputDevicesChangedNotification:(id)a3
{
  dispatch_time_t v4;
  _QWORD block[5];

  if (!self->_needsUpdate)
  {
    self->_needsUpdate = 1;
    v4 = dispatch_time(0, 500000000);
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __84__MRUMirroringDiscoverySessionController_availableOutputDevicesChangedNotification___block_invoke;
    block[3] = &unk_1E5818C88;
    block[4] = self;
    dispatch_after(v4, MEMORY[0x1E0C80D38], block);
  }
}

uint64_t __84__MRUMirroringDiscoverySessionController_availableOutputDevicesChangedNotification___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "needsUpdate");
  if ((_DWORD)result)
    return objc_msgSend(*(id *)(a1 + 32), "updateOutputDevicesIfNeeded");
  return result;
}

- (void)updateDiscoveryMode
{
  _BOOL4 detailedDiscovery;
  NSObject *v4;
  _BOOL4 v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  int v11;
  uint64_t v12;
  __int16 v13;
  uint64_t v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  detailedDiscovery = self->_detailedDiscovery;
  _MPAVLog();
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);
  if (detailedDiscovery)
  {
    if (v5)
    {
      v6 = objc_opt_class();
      v7 = -[AVOutputDeviceDiscoverySession discoveryMode](self->_outputDeviceDiscoverySession, "discoveryMode");
      v11 = 138543618;
      v12 = v6;
      v13 = 2048;
      v14 = v7;
      _os_log_impl(&dword_1AA991000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@ starting detailed discovery, previous: %li", (uint8_t *)&v11, 0x16u);
    }

    -[AVOutputDeviceDiscoverySession setDiscoveryMode:](self->_outputDeviceDiscoverySession, "setDiscoveryMode:", 2);
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "addObserver:selector:name:object:", self, sel_availableOutputDevicesChangedNotification_, *MEMORY[0x1E0C8AB88], 0);
  }
  else
  {
    if (v5)
    {
      v9 = objc_opt_class();
      v10 = -[AVOutputDeviceDiscoverySession discoveryMode](self->_outputDeviceDiscoverySession, "discoveryMode");
      v11 = 138543618;
      v12 = v9;
      v13 = 2048;
      v14 = v10;
      _os_log_impl(&dword_1AA991000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@ stoping detailed discovery, previous: %li", (uint8_t *)&v11, 0x16u);
    }

    -[AVOutputDeviceDiscoverySession setDiscoveryMode:](self->_outputDeviceDiscoverySession, "setDiscoveryMode:", 0);
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "removeObserver:name:object:", self, *MEMORY[0x1E0C8AB88], 0);
  }

}

- (void)updateOutputDevicesIfNeeded
{
  if (self->_needsUpdate)
  {
    self->_needsUpdate = 0;
    -[MRUMirroringDiscoverySessionController updateOutputDevicesImmediately](self, "updateOutputDevicesImmediately");
  }
}

- (void)updateOutputDevicesImmediately
{
  NSObject *v3;
  _QWORD block[5];

  dispatch_get_global_queue(-2, 0);
  v3 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __72__MRUMirroringDiscoverySessionController_updateOutputDevicesImmediately__block_invoke;
  block[3] = &unk_1E5818C88;
  block[4] = self;
  dispatch_async(v3, block);

}

void __72__MRUMirroringDiscoverySessionController_updateOutputDevicesImmediately__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  char v6;
  id v7;

  objc_msgSend(*(id *)(a1 + 32), "outputDeviceDiscoverySession");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "availableOutputDevices");
  v7 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 32), "cachedAvailableOutputDevices");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count");
  if (v4 == objc_msgSend(v7, "count"))
  {
    objc_msgSend(*(id *)(a1 + 32), "cachedAvailableOutputDevices");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v7, "isEqual:", v5);

    if ((v6 & 1) != 0)
      goto LABEL_6;
  }
  else
  {

  }
  objc_msgSend(*(id *)(a1 + 32), "setCachedAvailableOutputDevices:", v7);
  objc_msgSend(*(id *)(a1 + 32), "updateOutputDevicesForAvailableOutputDevices:", v7);
LABEL_6:

}

- (void)updateOutputDevicesForAvailableOutputDevices:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  NSObject *v7;
  uint64_t v8;
  id v9;
  _QWORD v10[5];
  id v11;
  uint8_t buf[4];
  MRUMirroringDiscoverySessionController *v13;
  __int16 v14;
  uint64_t v15;
  __int16 v16;
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[MRUMirroringDiscoverySessionController filterAndSortOutputDevices:](self, "filterAndSortOutputDevices:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  _MPAVLog();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543874;
    v13 = self;
    v14 = 2048;
    v15 = objc_msgSend(v4, "count");
    v16 = 2114;
    v17 = v4;
    _os_log_impl(&dword_1AA991000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@ received output devices: #%ld %{public}@", buf, 0x20u);
  }

  _MPAVLog();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v8 = objc_msgSend(v5, "count");
    *(_DWORD *)buf = 138543874;
    v13 = self;
    v14 = 2048;
    v15 = v8;
    v16 = 2114;
    v17 = v5;
    _os_log_impl(&dword_1AA991000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@ updating to output devices: #%ld %{public}@", buf, 0x20u);
  }

  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __87__MRUMirroringDiscoverySessionController_updateOutputDevicesForAvailableOutputDevices___block_invoke;
  v10[3] = &unk_1E5818CB0;
  v10[4] = self;
  v11 = v5;
  v9 = v5;
  dispatch_async(MEMORY[0x1E0C80D38], v10);

}

void __87__MRUMirroringDiscoverySessionController_updateOutputDevicesForAvailableOutputDevices___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "setAvailableOutputDevices:", *(_QWORD *)(a1 + 40));
  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "mirroringDiscoverySessionController:didChangeAvailableOutputDevices:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

}

- (id)filterAndSortOutputDevices:(id)a3
{
  _QWORD v4[5];

  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __69__MRUMirroringDiscoverySessionController_filterAndSortOutputDevices___block_invoke;
  v4[3] = &unk_1E5819CB8;
  v4[4] = self;
  objc_msgSend(a3, "sortedArrayUsingComparator:", v4);
  return (id)objc_claimAutoreleasedReturnValue();
}

uint64_t __69__MRUMirroringDiscoverySessionController_filterAndSortOutputDevices___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;

  v5 = a2;
  v6 = a3;
  if (objc_msgSend(*(id *)(a1 + 32), "sortDeviceToTop:", v5)
    && !objc_msgSend(*(id *)(a1 + 32), "sortDeviceToTop:", v6))
  {
    v9 = -1;
  }
  else if (objc_msgSend(*(id *)(a1 + 32), "sortDeviceToTop:", v6)
         && !objc_msgSend(*(id *)(a1 + 32), "sortDeviceToTop:", v5))
  {
    v9 = 1;
  }
  else
  {
    objc_msgSend(v5, "name");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "name");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v7, "compare:options:", v8, 577);

    if (!v9)
    {
      objc_msgSend(v5, "deviceID");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "deviceID");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v10, "compare:options:", v11, 577);

    }
  }

  return v9;
}

- (BOOL)sortDeviceToTop:(id)a3
{
  return (unint64_t)objc_msgSend(a3, "deviceType") > 1;
}

- (MRUMirroringDiscoverySessionControllerDelegate)delegate
{
  return (MRUMirroringDiscoverySessionControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (NSArray)availableOutputDevices
{
  return self->_availableOutputDevices;
}

- (void)setAvailableOutputDevices:(id)a3
{
  objc_storeStrong((id *)&self->_availableOutputDevices, a3);
}

- (AVOutputDeviceDiscoverySession)outputDeviceDiscoverySession
{
  return self->_outputDeviceDiscoverySession;
}

- (void)setOutputDeviceDiscoverySession:(id)a3
{
  objc_storeStrong((id *)&self->_outputDeviceDiscoverySession, a3);
}

- (NSArray)cachedAvailableOutputDevices
{
  return self->_cachedAvailableOutputDevices;
}

- (void)setCachedAvailableOutputDevices:(id)a3
{
  objc_storeStrong((id *)&self->_cachedAvailableOutputDevices, a3);
}

- (BOOL)needsUpdate
{
  return self->_needsUpdate;
}

- (void)setNeedsUpdate:(BOOL)a3
{
  self->_needsUpdate = a3;
}

- (BOOL)detailedDiscovery
{
  return self->_detailedDiscovery;
}

- (void)setDetailedDiscovery:(BOOL)a3
{
  self->_detailedDiscovery = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cachedAvailableOutputDevices, 0);
  objc_storeStrong((id *)&self->_outputDeviceDiscoverySession, 0);
  objc_storeStrong((id *)&self->_availableOutputDevices, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
