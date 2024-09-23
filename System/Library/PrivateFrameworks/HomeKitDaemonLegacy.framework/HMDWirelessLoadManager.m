@implementation HMDWirelessLoadManager

- (HMDWirelessLoadManager)init
{
  HMDWirelessLoadManager *v2;
  uint64_t v3;
  NSDate *lastLoadTimestamp;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)HMDWirelessLoadManager;
  v2 = -[HMDWirelessLoadManager init](&v6, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "distantPast");
    v3 = objc_claimAutoreleasedReturnValue();
    lastLoadTimestamp = v2->_lastLoadTimestamp;
    v2->_lastLoadTimestamp = (NSDate *)v3;

  }
  return v2;
}

- (id)getBtLoadData
{
  HMDWirelessLoadManager *v2;
  void *v3;
  void *v4;
  double v5;
  double v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  HMDWirelessLoadManager *v11;
  NSObject *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  _QWORD v19[3];
  _QWORD v20[3];
  uint8_t buf[4];
  id v22;
  __int16 v23;
  int v24;
  __int16 v25;
  int v26;
  __int16 v27;
  int v28;
  __int16 v29;
  uint64_t v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v2 = self;
  objc_sync_enter(v2);
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDWirelessLoadManager lastLoadTimestamp](v2, "lastLoadTimestamp");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "timeIntervalSinceDate:", v4);
  v6 = v5;

  if (v6 >= 10.0)
  {
    objc_storeStrong((id *)&v2->_lastLoadTimestamp, v3);
    v7 = objc_alloc_init(MEMORY[0x1E0DD9AE0]);
    objc_msgSend(v7, "registerClient:queue:", 40, 0);
    v8 = objc_msgSend(v7, "getWirelessRadioManagerReportLoad:loadDuration:callback:", 0, 0, 0.0);
    v9 = objc_msgSend(v7, "unregisterClient");
    v2->_btLoad = v8;
    *(int8x8_t *)&v2->_btAudioTask = vand_s8((int8x8_t)vshl_u32((uint32x2_t)vdup_n_s32(v8), (uint32x2_t)0xFFFFFFF4FFFFFFF8), (int8x8_t)0xF0000000FLL);
    v10 = (void *)MEMORY[0x1D17BA0A0](v9);
    v11 = v2;
    HMFGetOSLogHandle();
    v12 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v13 = (id)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544386;
      v22 = v13;
      v23 = 1024;
      v24 = -[HMDWirelessLoadManager btLoad](v11, "btLoad");
      v25 = 1024;
      v26 = -[HMDWirelessLoadManager btAudioTask](v11, "btAudioTask");
      v27 = 1024;
      v28 = -[HMDWirelessLoadManager btNonAudioTask](v11, "btNonAudioTask");
      v29 = 2048;
      v30 = v8;
      _os_log_impl(&dword_1CD062000, v12, OS_LOG_TYPE_INFO, "%{public}@BT Load: %d AudioTsk: %d NonAudioTsk: %d Raw: %lld", buf, 0x28u);

    }
    objc_autoreleasePoolPop(v10);

  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[HMDWirelessLoadManager btLoad](v2, "btLoad", CFSTR("kBtLoadKey")));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v20[0] = v14;
  v19[1] = CFSTR("kBtAudioTask");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[HMDWirelessLoadManager btAudioTask](v2, "btAudioTask"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v20[1] = v15;
  v19[2] = CFSTR("kBtNonAudioTask");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[HMDWirelessLoadManager btNonAudioTask](v2, "btNonAudioTask"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v20[2] = v16;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v20, v19, 3);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  objc_sync_exit(v2);
  return v17;
}

- (int)btLoad
{
  return self->_btLoad;
}

- (int)btAudioTask
{
  return self->_btAudioTask;
}

- (int)btNonAudioTask
{
  return self->_btNonAudioTask;
}

- (NSDate)lastLoadTimestamp
{
  return self->_lastLoadTimestamp;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastLoadTimestamp, 0);
}

+ (id)sharedInstance
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __40__HMDWirelessLoadManager_sharedInstance__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedInstance__hmf_once_t0 != -1)
    dispatch_once(&sharedInstance__hmf_once_t0, block);
  return (id)sharedInstance__hmf_once_v1;
}

void __40__HMDWirelessLoadManager_sharedInstance__block_invoke(uint64_t a1)
{
  id v1;
  void *v2;

  v1 = objc_alloc_init(*(Class *)(a1 + 32));
  v2 = (void *)sharedInstance__hmf_once_v1;
  sharedInstance__hmf_once_v1 = (uint64_t)v1;

}

@end
