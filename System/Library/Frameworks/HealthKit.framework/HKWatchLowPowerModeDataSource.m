@implementation HKWatchLowPowerModeDataSource

- (HKWatchLowPowerModeDataSource)init
{
  HKDarwinNotificationDataSource *v3;
  HKNanoRegistryPairingAndSwitchingNotificationDataSource *v4;
  HKWatchLowPowerModeDataSource *v5;

  v3 = objc_alloc_init(HKDarwinNotificationDataSource);
  v4 = objc_alloc_init(HKNanoRegistryPairingAndSwitchingNotificationDataSource);
  v5 = -[HKWatchLowPowerModeDataSource initWithDarwinNotificationDataSource:devicePairingAndSwitchingNotificationDataSource:](self, "initWithDarwinNotificationDataSource:devicePairingAndSwitchingNotificationDataSource:", v3, v4);

  return v5;
}

- (HKWatchLowPowerModeDataSource)initWithDarwinNotificationDataSource:(id)a3 devicePairingAndSwitchingNotificationDataSource:(id)a4
{
  objc_class *v6;
  id v7;
  id v8;
  void *v9;
  HKWatchLowPowerModeDataSource *v10;

  v6 = (objc_class *)MEMORY[0x1E0D51610];
  v7 = a4;
  v8 = a3;
  v9 = (void *)objc_msgSend([v6 alloc], "initWithDomain:", CFSTR("com.apple.Carousel"));
  v10 = -[HKWatchLowPowerModeDataSource initWithDarwinNotificationDataSource:devicePairingAndSwitchingNotificationDataSource:carouselDomainAccessor:](self, "initWithDarwinNotificationDataSource:devicePairingAndSwitchingNotificationDataSource:carouselDomainAccessor:", v8, v7, v9);

  return v10;
}

- (HKWatchLowPowerModeDataSource)initWithCarouselDomainAccessor:(id)a3
{
  id v4;
  HKDarwinNotificationDataSource *v5;
  HKNanoRegistryPairingAndSwitchingNotificationDataSource *v6;
  HKWatchLowPowerModeDataSource *v7;

  v4 = a3;
  v5 = objc_alloc_init(HKDarwinNotificationDataSource);
  v6 = objc_alloc_init(HKNanoRegistryPairingAndSwitchingNotificationDataSource);
  v7 = -[HKWatchLowPowerModeDataSource initWithDarwinNotificationDataSource:devicePairingAndSwitchingNotificationDataSource:carouselDomainAccessor:](self, "initWithDarwinNotificationDataSource:devicePairingAndSwitchingNotificationDataSource:carouselDomainAccessor:", v5, v6, v4);

  return v7;
}

- (HKWatchLowPowerModeDataSource)initWithDarwinNotificationDataSource:(id)a3 devicePairingAndSwitchingNotificationDataSource:(id)a4 carouselDomainAccessor:(id)a5
{
  id v9;
  id v10;
  id v11;
  HKWatchLowPowerModeDataSource *v12;
  HKWatchLowPowerModeDataSource *v13;
  objc_super v15;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)HKWatchLowPowerModeDataSource;
  v12 = -[HKObserverBridge init](&v15, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_darwinNotificationDataSource, a3);
    objc_storeStrong((id *)&v13->_devicePairingAndSwitchingDataSource, a4);
    objc_storeStrong((id *)&v13->_carouselDomainAccessor, a5);
  }

  return v13;
}

- (BOOL)isWatchLowPowerModeEnabled
{
  return _IsWatchLowPowerModeEnabledWithCarouselDomainAccessor(self->_carouselDomainAccessor);
}

- (void)registerObserver:(id)a3 onLowPowerModeChange:(id)a4
{
  id v6;
  void *v7;
  id v8;
  void *v9;
  id v10;
  _QWORD v11[4];
  id v12;

  v6 = a4;
  v7 = (void *)MEMORY[0x1E0C99E38];
  v8 = a3;
  objc_msgSend(v7, "null");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __71__HKWatchLowPowerModeDataSource_registerObserver_onLowPowerModeChange___block_invoke;
  v11[3] = &unk_1E37F78F8;
  v12 = v6;
  v10 = v6;
  -[HKObserverBridge registerObserver:forKey:newValueHandler:](self, "registerObserver:forKey:newValueHandler:", v8, v9, v11);

}

void __71__HKWatchLowPowerModeDataSource_registerObserver_onLowPowerModeChange___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v4;
  id v5;

  v4 = *(_QWORD *)(a1 + 32);
  v5 = a2;
  (*(void (**)(uint64_t, id, uint64_t))(v4 + 16))(v4, v5, objc_msgSend(a3, "BOOLValue"));

}

- (void)unregisterObserver:(id)a3
{
  void *v4;
  id v5;
  id v6;

  v4 = (void *)MEMORY[0x1E0C99E38];
  v5 = a3;
  objc_msgSend(v4, "null");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  -[HKObserverBridge unregisterObserver:forKey:](self, "unregisterObserver:forKey:", v5, v6);

}

- (id)makeAndRegisterBridgedObserverForKey:(id)a3 handle:(id)a4
{
  id v5;
  NPSDomainAccessor *v6;
  uint64_t v7;
  NPSDomainAccessor *v8;
  id v9;
  void *v10;
  void *v11;
  int v12;
  id v13;
  uint64_t v14;
  id v15;
  void *v16;
  HKDarwinNotificationDataSource *darwinNotificationDataSource;
  id v18;
  HKNanoRegistryPairingAndSwitchingNotificationDataSource *devicePairingAndSwitchingDataSource;
  _QWORD v21[4];
  id v22;
  _QWORD v23[4];
  id v24;
  _QWORD v25[4];
  id v26;
  _QWORD aBlock[4];
  NPSDomainAccessor *v28;
  id v29;

  v5 = a4;
  v6 = self->_carouselDomainAccessor;
  v7 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __77__HKWatchLowPowerModeDataSource_makeAndRegisterBridgedObserverForKey_handle___block_invoke;
  aBlock[3] = &unk_1E37E6980;
  v8 = v6;
  v28 = v8;
  v9 = v5;
  v29 = v9;
  v10 = _Block_copy(aBlock);
  +[_HKBehavior sharedBehavior](_HKBehavior, "sharedBehavior");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "isAppleWatch");

  if (v12)
  {
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v13 = (id)objc_claimAutoreleasedReturnValue();
    v14 = *MEMORY[0x1E0CB3048];
    v25[0] = v7;
    v25[1] = 3221225472;
    v25[2] = __77__HKWatchLowPowerModeDataSource_makeAndRegisterBridgedObserverForKey_handle___block_invoke_2;
    v25[3] = &unk_1E37F7920;
    v26 = v10;
    v15 = v10;
    objc_msgSend(v13, "addObserverForName:object:queue:usingBlock:", v14, 0, 0, v25);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    darwinNotificationDataSource = self->_darwinNotificationDataSource;
    v23[0] = v7;
    v23[1] = 3221225472;
    v23[2] = __77__HKWatchLowPowerModeDataSource_makeAndRegisterBridgedObserverForKey_handle___block_invoke_3;
    v23[3] = &unk_1E37F06A8;
    v18 = v10;
    v24 = v18;
    -[HKObserverBridge registerObserver:forKey:newValueHandler:](darwinNotificationDataSource, "registerObserver:forKey:newValueHandler:", self, CFSTR("com.apple.Carousel.LowPowerMode"), v23);
    devicePairingAndSwitchingDataSource = self->_devicePairingAndSwitchingDataSource;
    v21[0] = v7;
    v21[1] = 3221225472;
    v21[2] = __77__HKWatchLowPowerModeDataSource_makeAndRegisterBridgedObserverForKey_handle___block_invoke_4;
    v21[3] = &unk_1E37F7948;
    v22 = v18;
    v13 = v18;
    -[HKNanoRegistryPairingAndSwitchingNotificationDataSource registerObserverForDevicePairingChanges:block:](devicePairingAndSwitchingDataSource, "registerObserverForDevicePairingChanges:block:", self, v21);
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    v15 = v24;
  }

  return v16;
}

void __77__HKWatchLowPowerModeDataSource_makeAndRegisterBridgedObserverForKey_handle___block_invoke(uint64_t a1)
{
  uint64_t IsWatchLowPowerModeEnabledWithCarouselDomainAccessor;
  void *v3;
  void *v4;
  id v5;

  IsWatchLowPowerModeEnabledWithCarouselDomainAccessor = _IsWatchLowPowerModeEnabledWithCarouselDomainAccessor(*(void **)(a1 + 32));
  v3 = *(void **)(a1 + 40);
  objc_msgSend(MEMORY[0x1E0C99E38], "null");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", IsWatchLowPowerModeEnabledWithCarouselDomainAccessor);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "notifyObserversOfChangeForKey:newValue:", v5, v4);

}

uint64_t __77__HKWatchLowPowerModeDataSource_makeAndRegisterBridgedObserverForKey_handle___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __77__HKWatchLowPowerModeDataSource_makeAndRegisterBridgedObserverForKey_handle___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __77__HKWatchLowPowerModeDataSource_makeAndRegisterBridgedObserverForKey_handle___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)unregisterBridgedObserver:(id)a3 forKey:(id)a4
{
  void *v5;
  int v6;
  void *v7;
  id v8;

  v8 = a3;
  +[_HKBehavior sharedBehavior](_HKBehavior, "sharedBehavior");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isAppleWatch");

  if (v6)
  {
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "removeObserver:name:object:", v8, *MEMORY[0x1E0CB3048], 0);

  }
  else
  {
    -[HKObserverBridge unregisterObserver:forKey:](self->_darwinNotificationDataSource, "unregisterObserver:forKey:", self, CFSTR("com.apple.Carousel.LowPowerMode"));
    -[HKNanoRegistryPairingAndSwitchingNotificationDataSource unregisterObserverForDevicePairingChanges:](self->_devicePairingAndSwitchingDataSource, "unregisterObserverForDevicePairingChanges:", self);
  }

}

- (HKDarwinNotificationDataSource)darwinNotificationDataSource
{
  return self->_darwinNotificationDataSource;
}

- (HKNanoRegistryPairingAndSwitchingNotificationDataSource)devicePairingAndSwitchingDataSource
{
  return self->_devicePairingAndSwitchingDataSource;
}

- (NPSDomainAccessor)carouselDomainAccessor
{
  return self->_carouselDomainAccessor;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_carouselDomainAccessor, 0);
  objc_storeStrong((id *)&self->_devicePairingAndSwitchingDataSource, 0);
  objc_storeStrong((id *)&self->_darwinNotificationDataSource, 0);
}

@end
