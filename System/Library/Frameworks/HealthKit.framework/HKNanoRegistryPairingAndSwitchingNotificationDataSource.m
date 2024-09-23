@implementation HKNanoRegistryPairingAndSwitchingNotificationDataSource

- (HKNanoRegistryPairingAndSwitchingNotificationDataSource)initWithPairedDeviceRegistry:(id)a3
{
  id v5;
  HKNanoRegistryPairingAndSwitchingNotificationDataSource *v6;
  HKNanoRegistryPairingAndSwitchingNotificationDataSource *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)HKNanoRegistryPairingAndSwitchingNotificationDataSource;
  v6 = -[HKObserverBridge init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_pairedDeviceRegistry, a3);

  return v7;
}

- (NRPairedDeviceRegistry)pairedDeviceRegistry
{
  NRPairedDeviceRegistry *pairedDeviceRegistry;
  void *v4;
  id v5;
  _QWORD v6[5];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t v10;

  pairedDeviceRegistry = self->_pairedDeviceRegistry;
  if (pairedDeviceRegistry)
    return pairedDeviceRegistry;
  v7 = 0;
  v8 = &v7;
  v9 = 0x2050000000;
  v4 = (void *)getNRPairedDeviceRegistryClass_softClass_0;
  v10 = getNRPairedDeviceRegistryClass_softClass_0;
  if (!getNRPairedDeviceRegistryClass_softClass_0)
  {
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __getNRPairedDeviceRegistryClass_block_invoke_0;
    v6[3] = &unk_1E37E8690;
    v6[4] = &v7;
    __getNRPairedDeviceRegistryClass_block_invoke_0((uint64_t)v6);
    v4 = (void *)v8[3];
  }
  v5 = objc_retainAutorelease(v4);
  _Block_object_dispose(&v7, 8);
  objc_msgSend(v5, "sharedInstance");
  return (NRPairedDeviceRegistry *)(id)objc_claimAutoreleasedReturnValue();
}

- (id)_notificationCenter
{
  return (id)objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
}

- (id)makeAndRegisterBridgedObserverForKey:(id)a3 handle:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  void *v12;
  _QWORD v14[4];
  id v15;
  id v16;

  v6 = a3;
  v7 = a4;
  -[HKNanoRegistryPairingAndSwitchingNotificationDataSource _notificationCenter](self, "_notificationCenter");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKNanoRegistryPairingAndSwitchingNotificationDataSource pairedDeviceRegistry](self, "pairedDeviceRegistry");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __103__HKNanoRegistryPairingAndSwitchingNotificationDataSource_makeAndRegisterBridgedObserverForKey_handle___block_invoke;
  v14[3] = &unk_1E37EBB90;
  v15 = v7;
  v16 = v6;
  v10 = v6;
  v11 = v7;
  objc_msgSend(v8, "addObserverForName:object:queue:usingBlock:", v10, v9, 0, v14);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

uint64_t __103__HKNanoRegistryPairingAndSwitchingNotificationDataSource_makeAndRegisterBridgedObserverForKey_handle___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "notifyObserversOfChangeForKey:newValue:", *(_QWORD *)(a1 + 40), a2);
}

- (void)unregisterBridgedObserver:(id)a3 forKey:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;

  v6 = a4;
  v7 = a3;
  -[HKNanoRegistryPairingAndSwitchingNotificationDataSource _notificationCenter](self, "_notificationCenter");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  -[HKNanoRegistryPairingAndSwitchingNotificationDataSource pairedDeviceRegistry](self, "pairedDeviceRegistry");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "removeObserver:name:object:", v7, v6, v8);

}

- (id)_pairingChangeNotifications
{
  id *v2;
  void *v3;
  id v4;
  id *v5;
  void *v6;
  id v7;
  id *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t v17;
  _QWORD v18[2];
  id v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v14 = 0;
  v15 = &v14;
  v16 = 0x2020000000;
  v2 = (id *)getNRPairedDeviceRegistryDeviceIsSetupNotificationSymbolLoc_ptr;
  v17 = getNRPairedDeviceRegistryDeviceIsSetupNotificationSymbolLoc_ptr;
  if (!getNRPairedDeviceRegistryDeviceIsSetupNotificationSymbolLoc_ptr)
  {
    v3 = (void *)NanoRegistryLibrary_0();
    v2 = (id *)dlsym(v3, "NRPairedDeviceRegistryDeviceIsSetupNotification");
    v15[3] = (uint64_t)v2;
    getNRPairedDeviceRegistryDeviceIsSetupNotificationSymbolLoc_ptr = (uint64_t)v2;
  }
  _Block_object_dispose(&v14, 8);
  if (!v2)
    -[HKNanoRegistryPairingAndSwitchingNotificationDataSource _pairingChangeNotifications].cold.1();
  v4 = *v2;
  v18[0] = v4;
  v14 = 0;
  v15 = &v14;
  v16 = 0x2020000000;
  v5 = (id *)getNRPairedDeviceRegistryDeviceDidUnpairNotificationSymbolLoc_ptr;
  v17 = getNRPairedDeviceRegistryDeviceDidUnpairNotificationSymbolLoc_ptr;
  if (!getNRPairedDeviceRegistryDeviceDidUnpairNotificationSymbolLoc_ptr)
  {
    v6 = (void *)NanoRegistryLibrary_0();
    v5 = (id *)dlsym(v6, "NRPairedDeviceRegistryDeviceDidUnpairNotification");
    v15[3] = (uint64_t)v5;
    getNRPairedDeviceRegistryDeviceDidUnpairNotificationSymbolLoc_ptr = (uint64_t)v5;
  }
  _Block_object_dispose(&v14, 8);
  if (!v5)
    -[HKNanoRegistryPairingAndSwitchingNotificationDataSource _pairingChangeNotifications].cold.2();
  v7 = *v5;
  v18[1] = v7;
  v14 = 0;
  v15 = &v14;
  v16 = 0x2020000000;
  v8 = (id *)getNRPairedDeviceRegistryDeviceDidBecomeActiveSymbolLoc_ptr;
  v17 = getNRPairedDeviceRegistryDeviceDidBecomeActiveSymbolLoc_ptr;
  if (!getNRPairedDeviceRegistryDeviceDidBecomeActiveSymbolLoc_ptr)
  {
    v9 = (void *)NanoRegistryLibrary_0();
    v8 = (id *)dlsym(v9, "NRPairedDeviceRegistryDeviceDidBecomeActive");
    v15[3] = (uint64_t)v8;
    getNRPairedDeviceRegistryDeviceDidBecomeActiveSymbolLoc_ptr = (uint64_t)v8;
  }
  _Block_object_dispose(&v14, 8);
  if (!v8)
    -[HKNanoRegistryPairingAndSwitchingNotificationDataSource _pairingChangeNotifications].cold.3();
  v19 = *v8;
  v10 = (void *)MEMORY[0x1E0C99D20];
  v11 = v19;
  objc_msgSend(v10, "arrayWithObjects:count:", v18, 3, v14);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (void)registerObserverForDevicePairingChanges:(id)a3 block:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  id obj;
  _QWORD v15[4];
  id v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  -[HKNanoRegistryPairingAndSwitchingNotificationDataSource _pairingChangeNotifications](self, "_pairingChangeNotifications");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v18;
    v11 = MEMORY[0x1E0C809B0];
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v18 != v10)
          objc_enumerationMutation(obj);
        v13 = *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * v12);
        v15[0] = v11;
        v15[1] = 3221225472;
        v15[2] = __105__HKNanoRegistryPairingAndSwitchingNotificationDataSource_registerObserverForDevicePairingChanges_block___block_invoke;
        v15[3] = &unk_1E37EBBB8;
        v16 = v7;
        -[HKObserverBridge registerObserver:forKey:newValueHandler:](self, "registerObserver:forKey:newValueHandler:", v6, v13, v15);

        ++v12;
      }
      while (v9 != v12);
      v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v9);
  }

}

uint64_t __105__HKNanoRegistryPairingAndSwitchingNotificationDataSource_registerObserverForDevicePairingChanges_block___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)unregisterObserverForDevicePairingChanges:(id)a3
{
  id v4;
  void *v5;
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
  v4 = a3;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  -[HKNanoRegistryPairingAndSwitchingNotificationDataSource _pairingChangeNotifications](self, "_pairingChangeNotifications", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
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
        -[HKObserverBridge unregisterObserver:forKey:](self, "unregisterObserver:forKey:", v4, *(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * v9++));
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v7);
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pairedDeviceRegistry, 0);
}

- (void)_pairingChangeNotifications
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "NSString *getNRPairedDeviceRegistryDeviceDidBecomeActive(void)");
  objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "handleFailureInFunction:file:lineNumber:description:", v0, CFSTR("HKNanoRegistryPairingAndSwitchingNotificationDataSource.m"), 24, CFSTR("%s"), OUTLINED_FUNCTION_0_6());

  __break(1u);
}

@end
