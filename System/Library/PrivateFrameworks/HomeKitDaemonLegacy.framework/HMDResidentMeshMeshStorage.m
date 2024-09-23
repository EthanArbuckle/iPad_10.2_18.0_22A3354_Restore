@implementation HMDResidentMeshMeshStorage

- (HMDResidentMeshMeshStorage)initWithResidentDevice:(id)a3 owner:(id)a4
{
  id v7;
  id v8;
  HMDResidentMeshMeshStorage *v9;
  HMDResidentMeshMeshStorage *v10;
  uint64_t v11;
  NSDictionary *metrics;
  NSMutableSet *v13;
  NSMutableSet *accessoryUUIDs;
  uint64_t v15;
  NSMutableDictionary *accessoryListWithLinkQuality;
  objc_super v18;

  v7 = a3;
  v8 = a4;
  v18.receiver = self;
  v18.super_class = (Class)HMDResidentMeshMeshStorage;
  v9 = -[HMDResidentMeshMeshStorage init](&v18, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_residentDevice, a3);
    objc_storeWeak((id *)&v10->_owner, v8);
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionary");
    v11 = objc_claimAutoreleasedReturnValue();
    metrics = v10->_metrics;
    v10->_metrics = (NSDictionary *)v11;

    v10->_generationCount = 1;
    v10->_enabled = 1;
    v13 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E0C99E20]);
    accessoryUUIDs = v10->_accessoryUUIDs;
    v10->_accessoryUUIDs = v13;

    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v15 = objc_claimAutoreleasedReturnValue();
    accessoryListWithLinkQuality = v10->_accessoryListWithLinkQuality;
    v10->_accessoryListWithLinkQuality = (NSMutableDictionary *)v15;

  }
  return v10;
}

- (void)_requestStatus
{
  void *v3;
  void *v4;
  NSObject *v5;
  unint64_t v6;
  void *v7;
  char v8;
  uint64_t v9;
  void *v10;
  void *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  const char *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  _QWORD v22[5];
  _QWORD v23[2];
  _QWORD v24[2];
  uint8_t buf[4];
  void *v26;
  __int16 v27;
  void *v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  -[HMDResidentMeshMeshStorage owner](self, "owner");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v3)
    _HMFPreconditionFailure();
  v4 = v3;
  objc_msgSend(v3, "workQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  v6 = -[HMDResidentMeshMeshStorage nestedStatusRequests](self, "nestedStatusRequests");
  -[HMDResidentMeshMeshStorage residentDevice](self, "residentDevice");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "isReachable");

  if ((v8 & 1) != 0)
  {
    v9 = -[HMDResidentMeshMeshStorage setNestedStatusRequests:](self, "setNestedStatusRequests:", -[HMDResidentMeshMeshStorage nestedStatusRequests](self, "nestedStatusRequests") + 1);
    if (!v6)
    {
      v23[0] = CFSTR("kMeshDevice");
      -[HMDResidentMeshMeshStorage residentDevice](self, "residentDevice");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "device");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "identifier");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "UUIDString");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v23[1] = CFSTR("kMeshVersion");
      v24[0] = v19;
      v24[1] = &unk_1E8B33B10;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v24, v23, 2);
      v20 = (void *)objc_claimAutoreleasedReturnValue();

      -[HMDResidentMeshMeshStorage residentDevice](self, "residentDevice");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22[0] = MEMORY[0x1E0C809B0];
      v22[1] = 3221225472;
      v22[2] = __44__HMDResidentMeshMeshStorage__requestStatus__block_invoke;
      v22[3] = &unk_1E89C0E20;
      v22[4] = self;
      objc_msgSend(v4, "_sendMessage:payload:target:force:responseHandler:", CFSTR("kDeviceMeshUpdateRequestKey"), v20, v21, 0, v22);

      goto LABEL_10;
    }
    v10 = (void *)MEMORY[0x1D17BA0A0](v9);
    -[HMDResidentMeshMeshStorage owner](self, "owner");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    HMFGetOSLogHandle();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
    {
      HMFGetLogIdentifier();
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMDResidentMeshMeshStorage residentDevice](self, "residentDevice");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v26 = v13;
      v27 = 2112;
      v28 = v14;
      v15 = "%{public}@Not sending status request because we already have an outstanding request for device: %@";
LABEL_8:
      _os_log_impl(&dword_1CD062000, v12, OS_LOG_TYPE_DEBUG, v15, buf, 0x16u);

    }
  }
  else
  {
    v10 = (void *)MEMORY[0x1D17BA0A0]();
    -[HMDResidentMeshMeshStorage owner](self, "owner");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    HMFGetOSLogHandle();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
    {
      HMFGetLogIdentifier();
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMDResidentMeshMeshStorage residentDevice](self, "residentDevice");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v26 = v13;
      v27 = 2112;
      v28 = v14;
      v15 = "%{public}@skipping update to unreachable resident %@";
      goto LABEL_8;
    }
  }

  objc_autoreleasePoolPop(v10);
LABEL_10:

}

- (HMDResidentMesh)owner
{
  return (HMDResidentMesh *)objc_loadWeakRetained((id *)&self->_owner);
}

- (void)setOwner:(id)a3
{
  objc_storeWeak((id *)&self->_owner, a3);
}

- (HMDResidentDevice)residentDevice
{
  return self->_residentDevice;
}

- (NSDictionary)metrics
{
  return self->_metrics;
}

- (void)setMetrics:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (unint64_t)generationCount
{
  return self->_generationCount;
}

- (void)setGenerationCount:(unint64_t)a3
{
  self->_generationCount = a3;
}

- (BOOL)enabled
{
  return self->_enabled;
}

- (void)setEnabled:(BOOL)a3
{
  self->_enabled = a3;
}

- (unint64_t)nestedStatusRequests
{
  return self->_nestedStatusRequests;
}

- (void)setNestedStatusRequests:(unint64_t)a3
{
  self->_nestedStatusRequests = a3;
}

- (NSMutableSet)accessoryUUIDs
{
  return self->_accessoryUUIDs;
}

- (void)setAccessoryUUIDs:(id)a3
{
  objc_storeStrong((id *)&self->_accessoryUUIDs, a3);
}

- (NSMutableDictionary)accessoryListWithLinkQuality
{
  return self->_accessoryListWithLinkQuality;
}

- (void)setAccessoryListWithLinkQuality:(id)a3
{
  objc_storeStrong((id *)&self->_accessoryListWithLinkQuality, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_accessoryListWithLinkQuality, 0);
  objc_storeStrong((id *)&self->_accessoryUUIDs, 0);
  objc_storeStrong((id *)&self->_metrics, 0);
  objc_storeStrong((id *)&self->_residentDevice, 0);
  objc_destroyWeak((id *)&self->_owner);
}

void __44__HMDResidentMeshMeshStorage__requestStatus__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  unint64_t v7;
  void *v8;
  void *v9;
  id v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  int v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  NSObject *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  int v29;
  void *v30;
  __int16 v31;
  void *v32;
  __int16 v33;
  id v34;
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  v7 = objc_msgSend(*(id *)(a1 + 32), "nestedStatusRequests");
  objc_msgSend(*(id *)(a1 + 32), "setNestedStatusRequests:", 0);
  if (v5)
  {
    objc_msgSend(*(id *)(a1 + 32), "owner");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (void *)MEMORY[0x1D17BA0A0]();
    v10 = v8;
    HMFGetOSLogHandle();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "residentDevice");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "device");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v29 = 138543874;
      v30 = v12;
      v31 = 2112;
      v32 = v14;
      v33 = 2112;
      v34 = v5;
      _os_log_impl(&dword_1CD062000, v11, OS_LOG_TYPE_INFO, "%{public}@Got error result for kDeviceMeshUpdateRequestKey from %@: %@", (uint8_t *)&v29, 0x20u);

    }
    objc_autoreleasePoolPop(v9);
    if (objc_msgSend(v5, "code") == 54)
    {
      objc_msgSend(v5, "domain");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = objc_msgSend(v15, "isEqualToString:", *MEMORY[0x1E0CB8C70]);

      if (v16)
      {
        objc_msgSend(*(id *)(a1 + 32), "setGenerationCount:", 0);
        objc_msgSend(*(id *)(a1 + 32), "accessoryUUIDs");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "removeAllObjects");

        objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(a1 + 32), "setAccessoryListWithLinkQuality:", v18);

      }
    }
    if (v7 >= 2)
    {
      v19 = (void *)MEMORY[0x1D17BA0A0]();
      v20 = v10;
      HMFGetOSLogHandle();
      v21 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(a1 + 32), "residentDevice");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        v29 = 138543618;
        v30 = v22;
        v31 = 2112;
        v32 = v23;
        _os_log_impl(&dword_1CD062000, v21, OS_LOG_TYPE_INFO, "%{public}@Retrying kDeviceMeshUpdateRequestKey message for %@", (uint8_t *)&v29, 0x16u);

      }
      objc_autoreleasePoolPop(v19);
      objc_msgSend(*(id *)(a1 + 32), "_requestStatus");
    }
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "setEnabled:", objc_msgSend(v6, "hmf_BOOLForKey:", CFSTR("kMeshDeviceStorageEnabled")));
    objc_msgSend(v6, "hmf_numberForKey:", CFSTR("kMeshDeviceStorageGenerationCount"));
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "setGenerationCount:", objc_msgSend(v24, "unsignedIntegerValue"));

    objc_msgSend(v6, "hmf_dictionaryForKey:", CFSTR("kMeshDeviceStorageSystemLoad"));
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "setMetrics:", v25);

    objc_msgSend(v6, "hmf_arrayForKey:", CFSTR("kMeshDeviceStorageAcccessories"));
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    uuidSetFromArrayOfStrings(v26);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "setAccessoryUUIDs:", v27);

    objc_msgSend(v6, "hmf_dictionaryForKey:", CFSTR("kMeshDeviceStorageAccessoriesWithLinkQuality"));
    v10 = (id)objc_claimAutoreleasedReturnValue();
    v28 = (void *)objc_msgSend(v10, "mutableCopy");
    objc_msgSend(*(id *)(a1 + 32), "setAccessoryListWithLinkQuality:", v28);

  }
}

@end
