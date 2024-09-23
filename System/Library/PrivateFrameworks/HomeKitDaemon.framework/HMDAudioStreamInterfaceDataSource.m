@implementation HMDAudioStreamInterfaceDataSource

+ (id)logCategory
{
  if (logCategory__hmf_once_t5 != -1)
    dispatch_once(&logCategory__hmf_once_t5, &__block_literal_global_3987);
  return (id)logCategory__hmf_once_v6;
}

void __48__HMDAudioStreamInterfaceDataSource_logCategory__block_invoke()
{
  uint64_t v0;
  void *v1;

  HMFCreateOSLogHandle();
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)logCategory__hmf_once_v6;
  logCategory__hmf_once_v6 = v0;

}

- (BOOL)isMuted
{
  void *v3;
  void *v4;
  char v5;

  if (_os_feature_enabled_impl() && _os_feature_enabled_impl())
    return objc_msgSend(MEMORY[0x24BDFD9D0], "isMicrophoneMuted");
  objc_msgSend(MEMORY[0x24BE64988], "sharedAVSystemController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "attributeForKey:", *MEMORY[0x24BE64940]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "BOOLValue");

  return v5;
}

- (void)setMuted:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  HMDAudioStreamInterfaceDataSource *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  HMDAudioStreamInterfaceDataSource *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  char v18;
  id v19;
  void *v20;
  HMDAudioStreamInterfaceDataSource *v21;
  NSObject *v22;
  void *v23;
  void *v24;
  id v25;
  uint8_t buf[4];
  void *v27;
  __int16 v28;
  void *v29;
  __int16 v30;
  id v31;
  uint64_t v32;

  v3 = a3;
  v32 = *MEMORY[0x24BDAC8D0];
  if (_os_feature_enabled_impl() && _os_feature_enabled_impl())
  {
    v5 = (void *)MEMORY[0x227676638]();
    v6 = self;
    HMFGetOSLogHandle();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      HMFBooleanToString();
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v27 = v8;
      v28 = 2112;
      v29 = v9;
      _os_log_impl(&dword_2218F0000, v7, OS_LOG_TYPE_INFO, "%{public}@Setting AVAudioClient audio muted to %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v5);
    objc_msgSend(MEMORY[0x24BDFD9D0], "setMicrophoneMuted:", v3);
  }
  else
  {
    v10 = (void *)MEMORY[0x227676638]();
    v11 = self;
    HMFGetOSLogHandle();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      HMFBooleanToString();
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v27 = v13;
      v28 = 2112;
      v29 = v14;
      _os_log_impl(&dword_2218F0000, v12, OS_LOG_TYPE_INFO, "%{public}@Setting AVSystemController audio muted to %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v10);
    objc_msgSend(MEMORY[0x24BE64988], "sharedAVSystemController");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v3);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = *MEMORY[0x24BE64940];
    v25 = 0;
    v18 = objc_msgSend(v15, "setAttribute:forKey:error:", v16, v17, &v25);
    v19 = v25;

    if ((v18 & 1) == 0)
    {
      v20 = (void *)MEMORY[0x227676638]();
      v21 = v11;
      HMFGetOSLogHandle();
      v22 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        HMFBooleanToString();
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        v27 = v23;
        v28 = 2112;
        v29 = v24;
        v30 = 2112;
        v31 = v19;
        _os_log_impl(&dword_2218F0000, v22, OS_LOG_TYPE_ERROR, "%{public}@Failed to set AVSystemController audio muted to %@: %@", buf, 0x20u);

      }
      objc_autoreleasePoolPop(v20);
    }

  }
}

- (void)setAudioSessionPropertiesWithShouldAllowSystemSounds:(BOOL)a3 hostProcessBundleIdentifier:(id)a4
{
  _BOOL8 v4;
  id v6;
  void *v7;
  const __CFString *v8;
  const __CFString *v9;
  void *v10;
  void *v11;
  int v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  HMDAudioStreamInterfaceDataSource *v18;
  NSObject *v19;
  void *v20;
  void *v21;
  void *v22;
  HMDAudioStreamInterfaceDataSource *v23;
  NSObject *v24;
  void *v25;
  __int128 v26;
  uint8_t buf[4];
  void *v28;
  __int16 v29;
  void *v30;
  _QWORD v31[2];
  _QWORD v32[2];
  _QWORD v33[2];
  _QWORD v34[2];
  _QWORD v35[2];

  v4 = a3;
  v35[1] = *MEMORY[0x24BDAC8D0];
  v6 = a4;
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (isAppleTV())
    v8 = CFSTR("MediaPlayback");
  else
    v8 = (const __CFString *)*MEMORY[0x24BE64A00];
  objc_msgSend(v7, "setObject:forKeyedSubscript:", v8, *MEMORY[0x24BE64AF0]);
  if (isAppleTV())
    v9 = CFSTR("Default");
  else
    v9 = (const __CFString *)*MEMORY[0x24BE64A08];
  objc_msgSend(v7, "setObject:forKeyedSubscript:", v9, *MEMORY[0x24BE64AF8]);
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setObject:forKeyedSubscript:", v10, *MEMORY[0x24BE64AE8]);

  objc_msgSend(MEMORY[0x24BE3F258], "processInfo", 0, 0, 0, 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "getAuditToken:", &v26);

  if (v12)
  {
    objc_msgSend(MEMORY[0x24BDBCE50], "dataWithBytes:length:", &v26, 32);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = *MEMORY[0x24BE64B28];
    v33[0] = *MEMORY[0x24BE64B20];
    v33[1] = v14;
    v34[0] = v13;
    v34[1] = v6;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v34, v33, 2);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v35[0] = v15;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v35, 1);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setObject:forKeyedSubscript:", v16, *MEMORY[0x24BE64B00]);

  }
  else
  {
    v17 = (void *)MEMORY[0x227676638]();
    v18 = self;
    HMFGetOSLogHandle();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v28 = v20;
      _os_log_impl(&dword_2218F0000, v19, OS_LOG_TYPE_ERROR, "%{public}@Failed to get current process audit token", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v17);
    v13 = 0;
  }
  v31[0] = CFSTR("kAUVoiceIOProperty_OperationMode");
  v31[1] = CFSTR("AVAudioClientBatchMXPropertiesKey");
  v32[0] = &unk_24E96A190;
  v32[1] = v7;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v32, v31, 2);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = (void *)MEMORY[0x227676638]();
  v23 = self;
  HMFGetOSLogHandle();
  v24 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v28 = v25;
    v29 = 2112;
    v30 = v21;
    _os_log_impl(&dword_2218F0000, v24, OS_LOG_TYPE_INFO, "%{public}@Setting audio session properties: %@", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v22);
  objc_msgSend(MEMORY[0x24BDFD9D0], "setAudioSessionProperties:", v21);

}

@end
