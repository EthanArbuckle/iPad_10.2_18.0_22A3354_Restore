@implementation HMBSharedCloudZoneRebuilder

- (HMBSharedCloudZoneRebuilder)initWithCloudZone:(id)a3
{
  id v4;
  HMBSharedCloudZoneRebuilder *v5;
  HMBSharedCloudZoneRebuilder *v6;
  HMBCloudZoneRebuilderStatus *v7;
  HMBCloudZoneRebuilderStatus *rebuilderStatus;
  HMBCloudZoneRebuilderStatus *v9;
  uint64_t v10;
  NAFuture *rebuildCompleteFuture;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)HMBSharedCloudZoneRebuilder;
  v5 = -[HMBSharedCloudZoneRebuilder init](&v13, sel_init);
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_cloudZone, v4);
    v7 = -[HMBCloudZoneRebuilderStatus initWithState:message:]([HMBCloudZoneRebuilderStatus alloc], "initWithState:message:", 7, CFSTR("Zone believed to be functional."));
    rebuilderStatus = v6->_rebuilderStatus;
    v6->_rebuilderStatus = v7;
    v9 = v7;

    objc_msgSend(MEMORY[0x1E0D519C0], "futureWithNoResult");
    v10 = objc_claimAutoreleasedReturnValue();
    rebuildCompleteFuture = v6->_rebuildCompleteFuture;
    v6->_rebuildCompleteFuture = (NAFuture *)v10;

  }
  return v6;
}

- (void)rebuild
{
  void *v3;
  HMBSharedCloudZoneRebuilder *v4;
  NSObject *v5;
  void *v6;
  int v7;
  void *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v3 = (void *)MEMORY[0x1D17B6230](self, a2);
  v4 = self;
  HMFGetOSLogHandle();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
  {
    HMFGetLogIdentifier();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = 138543362;
    v8 = v6;
    _os_log_impl(&dword_1CCD48000, v5, OS_LOG_TYPE_ERROR, "%{public}@Unable to rebuild a shared zone.", (uint8_t *)&v7, 0xCu);

  }
  objc_autoreleasePoolPop(v3);
}

- (id)zoneStartUp
{
  return (id)objc_msgSend(MEMORY[0x1E0D519C0], "futureWithNoResult");
}

- (void)handleIdentityLost
{
  id v3;
  void *v4;
  uint64_t v5;
  HMBCloudZoneRebuilderStatus *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  HMBSharedCloudZoneRebuilder *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  id v18;
  id v19;
  id v20;
  _QWORD v21[5];
  _QWORD v22[5];
  id v23;
  uint8_t buf[4];
  void *v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc_init(MEMORY[0x1E0D519C0]);
  -[HMBSharedCloudZoneRebuilder setRebuildCompleteFuture:](self, "setRebuildCompleteFuture:", v3);

  -[HMBSharedCloudZoneRebuilder rebuilderStatus](self, "rebuilderStatus");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "rebuildState");

  v6 = -[HMBCloudZoneRebuilderStatus initWithState:message:]([HMBCloudZoneRebuilderStatus alloc], "initWithState:message:", 1, CFSTR("Lost key on shared zone."));
  -[HMBSharedCloudZoneRebuilder setRebuilderStatus:](self, "setRebuilderStatus:", v6);

  -[HMBSharedCloudZoneRebuilder cloudZone](self, "cloudZone");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMBSharedCloudZoneRebuilder rebuilderStatus](self, "rebuilderStatus");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "rebuildState");

  if (v5 != v9)
  {
    objc_msgSend(v7, "delegate");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (void *)MEMORY[0x1D17B6230]();
    v12 = self;
    HMFGetOSLogHandle();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v25 = v14;
      _os_log_impl(&dword_1CCD48000, v13, OS_LOG_TYPE_INFO, "%{public}@Informing delegate we have lost our identity.", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v11);
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      -[HMBSharedCloudZoneRebuilder rebuilderStatus](v12, "rebuilderStatus");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "cloudZone:didChangeRebuildStatus:", v7, v15);

    }
  }
  objc_msgSend(v7, "leaveCloudShareRequestingNewInvitationToken:", 1);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = MEMORY[0x1E0C809B0];
  v22[0] = MEMORY[0x1E0C809B0];
  v22[1] = 3221225472;
  v22[2] = __49__HMBSharedCloudZoneRebuilder_handleIdentityLost__block_invoke;
  v22[3] = &unk_1E8932780;
  v22[4] = self;
  v23 = v7;
  v18 = v7;
  v19 = (id)objc_msgSend(v16, "addSuccessBlock:", v22);
  v21[0] = v17;
  v21[1] = 3221225472;
  v21[2] = __49__HMBSharedCloudZoneRebuilder_handleIdentityLost__block_invoke_9;
  v21[3] = &unk_1E89327A8;
  v21[4] = self;
  v20 = (id)objc_msgSend(v16, "addFailureBlock:", v21);

}

- (BOOL)isZoneRebuildInProgress
{
  return 0;
}

- (id)logIdentifier
{
  void *v2;
  void *v3;
  void *v4;

  -[HMBSharedCloudZoneRebuilder cloudZone](self, "cloudZone");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "zoneID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "name");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (HMBCloudZoneRebuilderStatus)rebuilderStatus
{
  return (HMBCloudZoneRebuilderStatus *)objc_getProperty(self, a2, 8, 1);
}

- (void)setRebuilderStatus:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 8);
}

- (NAFuture)rebuildCompleteFuture
{
  return self->_rebuildCompleteFuture;
}

- (void)setRebuildCompleteFuture:(id)a3
{
  objc_storeStrong((id *)&self->_rebuildCompleteFuture, a3);
}

- (HMBCloudZone)cloudZone
{
  return (HMBCloudZone *)objc_loadWeakRetained((id *)&self->_cloudZone);
}

- (void)setCloudZone:(id)a3
{
  objc_storeWeak((id *)&self->_cloudZone, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_cloudZone);
  objc_storeStrong((id *)&self->_rebuildCompleteFuture, 0);
  objc_storeStrong((id *)&self->_rebuilderStatus, 0);
}

void __49__HMBSharedCloudZoneRebuilder_handleIdentityLost__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = (void *)MEMORY[0x1D17B6230]();
  v5 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    HMFGetLogIdentifier();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = 138543362;
    v12 = v7;
    _os_log_impl(&dword_1CCD48000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@Successfully removed ourself from share.", (uint8_t *)&v11, 0xCu);

  }
  objc_autoreleasePoolPop(v4);
  objc_msgSend(*(id *)(a1 + 40), "cloudDatabase");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "delegate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(*(id *)(a1 + 40), "cloudZoneID");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "cloudDatabase:didChangeManateeKeysForZoneWithID:", v8, v10);

  }
}

void __49__HMBSharedCloudZoneRebuilder_handleIdentityLost__block_invoke_9(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  NSObject *v6;
  void *v7;
  int v8;
  void *v9;
  __int16 v10;
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = (void *)MEMORY[0x1D17B6230]();
  v5 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    HMFGetLogIdentifier();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = 138543618;
    v9 = v7;
    v10 = 2112;
    v11 = v3;
    _os_log_impl(&dword_1CCD48000, v6, OS_LOG_TYPE_ERROR, "%{public}@Unable to remove self from the share: %@", (uint8_t *)&v8, 0x16u);

  }
  objc_autoreleasePoolPop(v4);

}

+ (id)logCategory
{
  if (logCategory__hmf_once_t4_2661 != -1)
    dispatch_once(&logCategory__hmf_once_t4_2661, &__block_literal_global_2662);
  return (id)logCategory__hmf_once_v5_2663;
}

void __42__HMBSharedCloudZoneRebuilder_logCategory__block_invoke()
{
  uint64_t v0;
  void *v1;

  HMFCreateOSLogHandle();
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)logCategory__hmf_once_v5_2663;
  logCategory__hmf_once_v5_2663 = v0;

}

@end
