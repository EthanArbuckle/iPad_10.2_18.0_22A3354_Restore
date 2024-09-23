@implementation HMDHAPAccessoryRemoteWriteWithLocalFallbackTask

- (id)_makeRemoteTaskWithRequests:(id)a3 delegateDevice:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  int v11;
  __CFString *v12;
  void *v13;
  __CFString *v14;
  void *v15;
  void *v16;
  void *v17;
  double v18;
  double v19;
  HMDHAPAccessoryRemoteWriteTask *v20;
  void *v21;
  uint64_t v22;
  HMDHAPAccessoryRemoteWriteTask *v23;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  v11 = objc_msgSend(v10, "na_any:", &__block_literal_global_352);
  v12 = CFSTR("AccessoryReaderWriterMessageWriteTimeout");
  if (v11)
    v12 = CFSTR("AccessoryReaderWriterMessageWriteTimeoutForSuspendedAccessory");
  v13 = (void *)MEMORY[0x24BE3F248];
  v14 = v12;
  objc_msgSend(v13, "sharedPreferences");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "preferenceForKey:", v14);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v16, "numberValue");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "doubleValue");
  v19 = v18;

  v20 = [HMDHAPAccessoryRemoteWriteTask alloc];
  -[HMDHAPAccessoryTask context](self, "context");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = objc_msgSend(v10, "na_map:", &__block_literal_global_451);

  v23 = -[HMDHAPAccessoryRemoteWriteTask initWithContext:requests:delegateDevice:timeout:completion:](v20, "initWithContext:requests:delegateDevice:timeout:completion:", v21, v22, v9, v8, v19);
  return v23;
}

- (id)_makeLocalTaskWithRequests:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  HMDHAPAccessoryLocalWriteTask *v8;
  void *v9;
  uint64_t v10;
  HMDHAPAccessoryLocalWriteTask *v11;

  v6 = a4;
  v7 = a3;
  v8 = [HMDHAPAccessoryLocalWriteTask alloc];
  -[HMDHAPAccessoryTask context](self, "context");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v7, "na_map:", &__block_literal_global_451);

  v11 = -[HMDHAPAccessoryTask initWithContext:requests:completion:](v8, "initWithContext:requests:completion:", v9, v10, v6);
  return v11;
}

uint64_t __105__HMDHAPAccessoryRemoteWriteWithLocalFallbackTask__makeRemoteTaskWithRequests_delegateDevice_completion___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  uint64_t v3;

  objc_msgSend(a2, "accessory");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "canWakeViaCustomWoBLE");

  return v3;
}

@end
