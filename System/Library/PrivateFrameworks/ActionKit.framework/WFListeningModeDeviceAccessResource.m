@implementation WFListeningModeDeviceAccessResource

- (WFListeningModeDeviceAccessResource)initWithDefinition:(id)a3
{
  WFListeningModeDeviceAccessResource *v3;
  WFListeningModeDeviceAccessResource *v4;
  WFListeningModeDeviceAccessResource *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)WFListeningModeDeviceAccessResource;
  v3 = -[WFAccessResource initWithDefinition:](&v7, sel_initWithDefinition_, a3);
  v4 = v3;
  if (v3)
  {
    v3->_supportedDevicesLock._os_unfair_lock_opaque = 0;
    v5 = v3;
  }

  return v4;
}

- (void)makeAvailableWithUserInterface:(id)a3 completionHandler:(id)a4
{
  void *v5;
  void (**v6)(id, uint64_t, _QWORD);

  v6 = (void (**)(id, uint64_t, _QWORD))a4;
  if (-[WFListeningModeDeviceAccessResource status](self, "status") == 1)
  {
    -[WFListeningModeDeviceAccessResource setAvailabilityCompletion:](self, "setAvailabilityCompletion:", v6);
    -[WFListeningModeDeviceAccessResource makeSettingsClientIfNecessary](self, "makeSettingsClientIfNecessary");
  }
  else if (-[WFListeningModeDeviceAccessResource status](self, "status") == 4)
  {
    v6[2](v6, 1, 0);
  }
  else
  {
    -[WFListeningModeDeviceAccessResource unavailableAccessResourceError](self, "unavailableAccessResourceError");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    ((void (**)(id, uint64_t, void *))v6)[2](v6, 0, v5);

  }
}

- (unint64_t)status
{
  os_unfair_lock_s *p_supportedDevicesLock;
  void *v4;
  unint64_t v5;

  if (-[WFListeningModeDeviceAccessResource supportedDevicesAreFetched](self, "supportedDevicesAreFetched"))
  {
    p_supportedDevicesLock = &self->_supportedDevicesLock;
    os_unfair_lock_lock(&self->_supportedDevicesLock);
    -[WFListeningModeDeviceAccessResource supportedDevices](self, "supportedDevices");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = 4 * (objc_msgSend(v4, "count") != 0);

    os_unfair_lock_unlock(p_supportedDevicesLock);
  }
  else
  {
    -[WFListeningModeDeviceAccessResource makeSettingsClientIfNecessary](self, "makeSettingsClientIfNecessary");
    return 1;
  }
  return v5;
}

- (id)unavailableAccessResourceError
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v8;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x24BDAC8D0];
  v2 = (void *)MEMORY[0x24BDD1540];
  v3 = *MEMORY[0x24BEC4240];
  v8 = *MEMORY[0x24BDD0FC8];
  -[WFListeningModeDeviceAccessResource localizedAccessResourceErrorString](self, "localizedAccessResourceErrorString");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = v4;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v9, &v8, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "errorWithDomain:code:userInfo:", v3, 0, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)localizedAccessResourceErrorString
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v2 = (void *)MEMORY[0x24BDD17C8];
  WFLocalizedString(CFSTR("Your %@ has not connected to any devices that support Noise Control modes."));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BEC1440], "currentDevice");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "localizedModel");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localizedStringWithFormat:", v3, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (void)makeSettingsClientIfNecessary
{
  _QWORD v3[5];

  if (!-[WFListeningModeDeviceAccessResource supportedDevicesAreFetched](self, "supportedDevicesAreFetched"))
  {
    v3[0] = MEMORY[0x24BDAC760];
    v3[1] = 3221225472;
    v3[2] = __68__WFListeningModeDeviceAccessResource_makeSettingsClientIfNecessary__block_invoke;
    v3[3] = &unk_24F8B19A0;
    v3[4] = self;
    +[WFBluetoothSettingsClient createClientWithCompletionHandler:](WFBluetoothSettingsClient, "createClientWithCompletionHandler:", v3);
  }
}

- (BOOL)supportedDevicesAreFetched
{
  WFListeningModeDeviceAccessResource *v2;
  void (**v3)(_QWORD);
  void *v4;
  _QWORD aBlock[5];

  v2 = self;
  os_unfair_lock_lock(&self->_supportedDevicesLock);
  aBlock[0] = MEMORY[0x24BDAC760];
  aBlock[1] = 3221225472;
  aBlock[2] = __65__WFListeningModeDeviceAccessResource_supportedDevicesAreFetched__block_invoke;
  aBlock[3] = &unk_24F8BB638;
  aBlock[4] = v2;
  v3 = (void (**)(_QWORD))_Block_copy(aBlock);
  -[WFListeningModeDeviceAccessResource supportedDevices](v2, "supportedDevices");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v2) = v4 != 0;

  v3[2](v3);
  return (char)v2;
}

- (WFBluetoothSettingsClient)bluetoothClient
{
  return self->_bluetoothClient;
}

- (NSArray)supportedDevices
{
  return self->_supportedDevices;
}

- (os_unfair_lock_s)supportedDevicesLock
{
  return self->_supportedDevicesLock;
}

- (id)availabilityCompletion
{
  return self->_availabilityCompletion;
}

- (void)setAvailabilityCompletion:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 80);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_availabilityCompletion, 0);
  objc_storeStrong((id *)&self->_supportedDevices, 0);
  objc_storeStrong((id *)&self->_bluetoothClient, 0);
}

void __65__WFListeningModeDeviceAccessResource_supportedDevicesAreFetched__block_invoke(uint64_t a1)
{
  os_unfair_lock_unlock((os_unfair_lock_t)(*(_QWORD *)(a1 + 32) + 56));
}

void __68__WFListeningModeDeviceAccessResource_makeSettingsClientIfNecessary__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v6;
  id v7;
  void *v8;
  NSObject *v9;
  _QWORD v10[5];
  id v11;
  _BYTE location[12];
  __int16 v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v6 = a2;
  v7 = a3;
  if (v6)
  {
    objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 64), a2);
    objc_initWeak((id *)location, *(id *)(a1 + 32));
    objc_msgSend(*(id *)(a1 + 32), "bluetoothClient");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v10[0] = MEMORY[0x24BDAC760];
    v10[1] = 3221225472;
    v10[2] = __68__WFListeningModeDeviceAccessResource_makeSettingsClientIfNecessary__block_invoke_117;
    v10[3] = &unk_24F8B1978;
    objc_copyWeak(&v11, (id *)location);
    v10[4] = *(_QWORD *)(a1 + 32);
    objc_msgSend(v8, "observePairedDevicesMatchingType:update:", 2, v10);

    objc_destroyWeak(&v11);
    objc_destroyWeak((id *)location);
  }
  else
  {
    getWFActionsLogObject();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)location = 136315394;
      *(_QWORD *)&location[4] = "-[WFListeningModeDeviceAccessResource makeSettingsClientIfNecessary]_block_invoke";
      v13 = 2114;
      v14 = v7;
      _os_log_impl(&dword_22D353000, v9, OS_LOG_TYPE_ERROR, "%s Error creating WFBluetoothSettingsClient: %{public}@", location, 0x16u);
    }

  }
}

void __68__WFListeningModeDeviceAccessResource_makeSettingsClientIfNecessary__block_invoke_117(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;
  id v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void (**v10)(_QWORD, _QWORD, _QWORD);
  void *v11;
  id WeakRetained;

  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  os_unfair_lock_lock((os_unfair_lock_t)(*(_QWORD *)(a1 + 32) + 56));
  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(void **)(v4 + 72);
  *(_QWORD *)(v4 + 72) = v3;
  v6 = v3;

  os_unfair_lock_unlock((os_unfair_lock_t)(*(_QWORD *)(a1 + 32) + 56));
  objc_msgSend(WeakRetained, "refreshAvailabilityWithNotification");
  v7 = objc_msgSend(WeakRetained, "status");
  objc_msgSend(WeakRetained, "availabilityCompletion");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    objc_msgSend(WeakRetained, "availabilityCompletion");
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = (void (**)(_QWORD, _QWORD, _QWORD))v9;
    if (v7 == 4)
    {
      (*(void (**)(uint64_t, uint64_t, _QWORD))(v9 + 16))(v9, 1, 0);
    }
    else
    {
      objc_msgSend(WeakRetained, "unavailableAccessResourceError");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      ((void (**)(_QWORD, _QWORD, void *))v10)[2](v10, 0, v11);

    }
    objc_msgSend(WeakRetained, "setAvailabilityCompletion:", 0);
  }

}

+ (BOOL)isSingleton
{
  return 1;
}

@end
