@implementation ADASPreferenceStore

- (NSDictionary)defaultValues
{
  return self->_defaultValues;
}

- (NSDictionary)keyMap
{
  return self->_keyMap;
}

+ (id)sharedInstance
{
  if (sharedInstance_once != -1)
    dispatch_once(&sharedInstance_once, &__block_literal_global_1);
  return (id)sharedInstance_instance;
}

void __37__ADASPreferenceStore_sharedInstance__block_invoke()
{
  ADASPreferenceStore *v0;
  void *v1;

  v0 = objc_alloc_init(ADASPreferenceStore);
  v1 = (void *)sharedInstance_instance;
  sharedInstance_instance = (uint64_t)v0;

}

- (void)pairedDeviceStateChanged:(id)a3
{
  id v4;
  NSObject *v5;
  NPSDomainAccessor *coreAudioDomain;
  NPSDomainAccessor *coreAudioDeviceDomain;
  int v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  os_unfair_lock_lock(&self->_npsDomainLock);
  ADAFLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v8 = 138412290;
    v9 = v4;
    _os_log_impl(&dword_20DC02000, v5, OS_LOG_TYPE_DEFAULT, "NPSDomainAccessor state change: %@", (uint8_t *)&v8, 0xCu);
  }

  coreAudioDomain = self->_coreAudioDomain;
  self->_coreAudioDomain = 0;

  coreAudioDeviceDomain = self->_coreAudioDeviceDomain;
  self->_coreAudioDeviceDomain = 0;

  os_unfair_lock_unlock(&self->_npsDomainLock);
}

- (void)registerForNotifications
{
  id v3;

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObserver:selector:name:object:", self, sel_pairedDeviceStateChanged_, *MEMORY[0x24BE6B420], 0);
  objc_msgSend(v3, "addObserver:selector:name:object:", self, sel_pairedDeviceStateChanged_, *MEMORY[0x24BE6B428], 0);
  objc_msgSend(v3, "addObserver:selector:name:object:", self, sel_pairedDeviceStateChanged_, *MEMORY[0x24BE6B440], 0);
  objc_msgSend(v3, "addObserver:selector:name:object:", self, sel_pairedDeviceStateChanged_, *MEMORY[0x24BE6B450], 0);

}

- (void)initNPSDomain
{
  NSObject *npsDomainAccessorQueue;
  _QWORD block[5];

  if (!self->_coreAudioDomain || !self->_coreAudioDeviceDomain)
  {
    npsDomainAccessorQueue = self->_npsDomainAccessorQueue;
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __36__ADASPreferenceStore_initNPSDomain__block_invoke;
    block[3] = &unk_24C83DC80;
    block[4] = self;
    dispatch_async(npsDomainAccessorQueue, block);
  }
}

void __36__ADASPreferenceStore_initNPSDomain__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;

  os_unfair_lock_lock((os_unfair_lock_t)(*(_QWORD *)(a1 + 32) + 8));
  v2 = *(_QWORD *)(a1 + 32);
  if (!*(_QWORD *)(v2 + 48))
  {
    v3 = objc_msgSend(objc_alloc(MEMORY[0x24BE6B2C0]), "initWithDomain:", CFSTR("com.apple.coreaudio"));
    v4 = *(_QWORD *)(a1 + 32);
    v5 = *(void **)(v4 + 48);
    *(_QWORD *)(v4 + 48) = v3;

    v2 = *(_QWORD *)(a1 + 32);
  }
  if (!*(_QWORD *)(v2 + 56))
  {
    v6 = objc_msgSend(objc_alloc(MEMORY[0x24BE6B2C0]), "initWithDomain:", CFSTR("com.apple.coreaudio.device"));
    v7 = *(_QWORD *)(a1 + 32);
    v8 = *(void **)(v7 + 56);
    *(_QWORD *)(v7 + 56) = v6;

    v2 = *(_QWORD *)(a1 + 32);
  }
  os_unfair_lock_unlock((os_unfair_lock_t)(v2 + 8));
}

- (ADASPreferenceStore)init
{
  ADASPreferenceStore *v2;
  ADASPreferenceStore *v3;
  dispatch_queue_t v4;
  OS_dispatch_queue *npsDomainAccessorQueue;
  NPSDomainAccessor *coreAudioDomain;
  NPSDomainAccessor *coreAudioDeviceDomain;
  uint64_t v8;
  NSDictionary *keyMap;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  NSDictionary *defaultValues;
  uint64_t v22;
  NSDictionary *specialDarwinKeys;
  objc_super v25;

  v25.receiver = self;
  v25.super_class = (Class)ADASPreferenceStore;
  v2 = -[ADASPreferenceStore init](&v25, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_npsDomainLock._os_unfair_lock_opaque = 0;
    v4 = dispatch_queue_create("com.apple.coreaudio.adam.nps", 0);
    npsDomainAccessorQueue = v3->_npsDomainAccessorQueue;
    v3->_npsDomainAccessorQueue = (OS_dispatch_queue *)v4;

    coreAudioDomain = v3->_coreAudioDomain;
    v3->_coreAudioDomain = 0;

    coreAudioDeviceDomain = v3->_coreAudioDeviceDomain;
    v3->_coreAudioDeviceDomain = 0;

    -[ADASPreferenceStore initNPSDomain](v3, "initNPSDomain");
    -[ADASPreferenceStore registerForNotifications](v3, "registerForNotifications");
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjectsAndKeys:", CFSTR("VolumeLimitEnabled"), CFSTR("_ADAFPreferenceKeyVolumeLimitEnabled"), CFSTR("VolumeLimitThreshold"), CFSTR("_ADAFPreferenceKeyVolumeLimitThreshold"), CFSTR("LoudnessCompensationEnabled"), CFSTR("_ADAFPreferenceKeyLoudnessCompensationEnabled"), CFSTR("EnableHAELiveMonitor"), CFSTR("_ADAFPreferenceKeyHAENotificationFeatureEnabled"), CFSTR("HAENSampleTransient"), CFSTR("_ADAFPreferenceKeyHAESampleTransient"), CFSTR("EnableHAEHKWrite"), CFSTR("_ADAFPreferenceKeyHAEEnableHKWrite"), CFSTR("EnableHAEOtherDevices"), CFSTR("_ADAFPreferenceKeyHAEEnableOtherDevices"), CFSTR("UnknownDeviceIsHeadphone"), CFSTR("_ADAFPreferenceKeyConnectedWiredDeviceIsHeadphone"), CFSTR("HAENVolumeReductionDelta"),
      CFSTR("_ADAFPreferenceKeyVolumeReductionDelta"),
      CFSTR("HAELiveMonitorThreshold"),
      CFSTR("_ADAFPreferenceKeyHAENotificationLiveThreshold"),
      CFSTR("HAELiveMonitorWindowInSecond"),
      CFSTR("_ADAFPreferenceKeyHAENotificationLiveWindowInSeconds"),
      CFSTR("HAENKnownAccessories"),
      CFSTR("_ADAFPreferenceKeyKnownAccessories"),
      CFSTR("HAENKnownAccessoryExpiryDays"),
      CFSTR("_ADAFPreferenceKeyHAENKnownAccessoryExpiryDays"),
      CFSTR("MXVolumeLimitOn"),
      CFSTR("_ADAFPreferenceKeyMXVolumeLimitOn"),
      CFSTR("HAENRegionCode"),
      CFSTR("_ADAFPreferenceKeyHAENDeviceCountryCodeOverride"),
      CFSTR("HAENDeviceProductTypeOverride"),
      CFSTR("_ADAFPreferenceKeyHAENDeviceProductTypeOverride"),
      0);
    v8 = objc_claimAutoreleasedReturnValue();
    keyMap = v3->_keyMap;
    v3->_keyMap = (NSDictionary *)v8;

    v10 = (void *)MGGetStringAnswer();
    v11 = objc_msgSend(v10, "isEqualToString:", CFSTR("iPad")) ^ 1;
    v12 = (void *)MEMORY[0x24BDBCE70];
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", 0);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v11);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", 0);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", 85);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", 0.0625);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", 14.0);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", 1);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "dictionaryWithObjectsAndKeys:", v13, CFSTR("VolumeLimitEnabled"), v14, CFSTR("EnableHAEHKWrite"), v15, CFSTR("EnableHAEOtherDevices"), v16, CFSTR("VolumeLimitThreshold"), v17, CFSTR("HAENVolumeReductionDelta"), v18, CFSTR("HAENKnownAccessoryExpiryDays"), v19, CFSTR("EnableHAELiveMonitor"), 0);
    v20 = objc_claimAutoreleasedReturnValue();
    defaultValues = v3->_defaultValues;
    v3->_defaultValues = (NSDictionary *)v20;

    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjectsAndKeys:", CFSTR("HAENUnknownWiredDeviceStatusChanged"), CFSTR("_ADAFPreferenceKeyConnectedWiredDeviceIsHeadphone"), CFSTR("HAENVolumeLimitStatusDidChange"), CFSTR("_ADAFPreferenceKeyMXVolumeLimitOn"), CFSTR("HAENRLSStatusDidChange"), CFSTR("_ADAFPreferenceKeyVolumeLimitEnabled"), CFSTR("HAENRLSStatusDidChange"), CFSTR("_ADAFPreferenceKeyVolumeLimitThreshold"), CFSTR("HAENKnownAccessoriesDidChange"), CFSTR("_ADAFPreferenceKeyKnownAccessories"), 0);
    v22 = objc_claimAutoreleasedReturnValue();
    specialDarwinKeys = v3->_specialDarwinKeys;
    v3->_specialDarwinKeys = (NSDictionary *)v22;

  }
  return v3;
}

- (NSDictionary)specialDarwinKeys
{
  return self->_specialDarwinKeys;
}

- (NPSDomainAccessor)coreAudioDomain
{
  return self->_coreAudioDomain;
}

- (void)setCoreAudioDomain:(id)a3
{
  objc_storeStrong((id *)&self->_coreAudioDomain, a3);
}

- (NPSDomainAccessor)coreAudioDeviceDomain
{
  return self->_coreAudioDeviceDomain;
}

- (void)setCoreAudioDeviceDomain:(id)a3
{
  objc_storeStrong((id *)&self->_coreAudioDeviceDomain, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_coreAudioDeviceDomain, 0);
  objc_storeStrong((id *)&self->_coreAudioDomain, 0);
  objc_storeStrong((id *)&self->_specialDarwinKeys, 0);
  objc_storeStrong((id *)&self->_defaultValues, 0);
  objc_storeStrong((id *)&self->_keyMap, 0);
  objc_storeStrong((id *)&self->_npsDomainAccessorQueue, 0);
}

@end
