@implementation HMDResidentSelectionStatusKit

- (HMDResidentSelectionStatusKit)initWithWithContext:(id)a3 residentStatusList:(id)a4
{
  id v6;
  id v7;
  HMDResidentSelectionStatusKit *v8;
  HMDResidentSelectionStatusKit *v9;
  uint64_t v10;
  OS_dispatch_queue *queue;
  NSArray *v12;
  NSArray *sortedResidentStatuses;
  NSArray *v14;
  uint64_t v15;
  HMDResidentStatus *sourceForPreferredResidentsList;
  uint64_t v17;
  NSDictionary *residentIDSIdentifierToLocationMap;
  uint64_t v19;
  HMDResidentSelectionInfo *selectionInfo;
  uint64_t v21;
  NSSet *wiredResidentIDSIdentifiers;
  objc_super v24;

  v6 = a3;
  v7 = a4;
  v24.receiver = self;
  v24.super_class = (Class)HMDResidentSelectionStatusKit;
  v8 = -[HMDResidentSelectionStatusKit init](&v24, sel_init);
  v9 = v8;
  if (v8)
  {
    objc_storeWeak((id *)&v8->_context, v6);
    objc_msgSend(v6, "queue");
    v10 = objc_claimAutoreleasedReturnValue();
    queue = v9->_queue;
    v9->_queue = (OS_dispatch_queue *)v10;

    objc_storeStrong((id *)&v9->_residentStatusList, a4);
    -[HMDResidentSelectionStatusKit sortResidentStatuses:](v9, "sortResidentStatuses:", v7);
    v12 = (NSArray *)objc_claimAutoreleasedReturnValue();
    sortedResidentStatuses = v9->_sortedResidentStatuses;
    v9->_sortedResidentStatuses = v12;
    v14 = v12;

    -[HMDResidentSelectionStatusKit residentStatusWithValidPreferredResidentsListIn:](v9, "residentStatusWithValidPreferredResidentsListIn:", v14);
    v15 = objc_claimAutoreleasedReturnValue();
    sourceForPreferredResidentsList = v9->_sourceForPreferredResidentsList;
    v9->_sourceForPreferredResidentsList = (HMDResidentStatus *)v15;

    -[HMDResidentSelectionStatusKit residentIDSIdentifierToLocationMapFrom:](v9, "residentIDSIdentifierToLocationMapFrom:", v7);
    v17 = objc_claimAutoreleasedReturnValue();
    residentIDSIdentifierToLocationMap = v9->_residentIDSIdentifierToLocationMap;
    v9->_residentIDSIdentifierToLocationMap = (NSDictionary *)v17;

    -[HMDResidentSelectionStatusKit selectionInfoWithLatestTimestampIn:](v9, "selectionInfoWithLatestTimestampIn:", v7);
    v19 = objc_claimAutoreleasedReturnValue();
    selectionInfo = v9->_selectionInfo;
    v9->_selectionInfo = (HMDResidentSelectionInfo *)v19;

    -[HMDResidentSelectionStatusKit wiredResidentIDSIdentifiersIn:](v9, "wiredResidentIDSIdentifiersIn:", v7);
    v21 = objc_claimAutoreleasedReturnValue();
    wiredResidentIDSIdentifiers = v9->_wiredResidentIDSIdentifiers;
    v9->_wiredResidentIDSIdentifiers = (NSSet *)v21;

  }
  return v9;
}

- (HMDPreferredResidentsList)preferredResidentsList
{
  void *v2;
  void *v3;

  -[HMDResidentSelectionStatusKit sourceForPreferredResidentsList](self, "sourceForPreferredResidentsList");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "preferredResidentsList");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (HMDPreferredResidentsList *)v3;
}

- (id)residentStatusWithValidPreferredResidentsListIn:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  HMDResidentSelectionStatusKit *v7;
  NSObject *v8;
  void *v9;
  _QWORD v11[5];
  uint8_t buf[4];
  void *v13;
  __int16 v14;
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __81__HMDResidentSelectionStatusKit_residentStatusWithValidPreferredResidentsListIn___block_invoke;
  v11[3] = &unk_24E782968;
  v11[4] = self;
  objc_msgSend(v4, "na_firstObjectPassingTest:", v11);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)MEMORY[0x227676638]();
  v7 = self;
  HMFGetOSLogHandle();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v13 = v9;
    v14 = 2112;
    v15 = v5;
    _os_log_impl(&dword_2218F0000, v8, OS_LOG_TYPE_INFO, "%{public}@Preferred source for residents list: %@", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v6);

  return v5;
}

- (HMDResidentDevice)elector
{
  void *v3;
  void *v4;
  void *v5;
  HMDResidentSelectionStatusKit *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  int v15;
  void *v16;
  __int16 v17;
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  -[HMDResidentSelectionStatusKit sortedResidentStatuses](self, "sortedResidentStatuses");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "firstObject");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = (void *)MEMORY[0x227676638]();
  v6 = self;
  HMFGetOSLogHandle();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = 138543618;
    v16 = v8;
    v17 = 2112;
    v18 = v4;
    _os_log_impl(&dword_2218F0000, v7, OS_LOG_TYPE_INFO, "%{public}@Elector's resident status: %@", (uint8_t *)&v15, 0x16u);

  }
  objc_autoreleasePoolPop(v5);
  if (v4)
  {
    v9 = (void *)MEMORY[0x24BDBCF20];
    -[HMDResidentSelectionStatusKit context](v6, "context");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "availableResidentDevices");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setWithArray:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "matchingDeviceFromResidentDevices:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v13 = 0;
  }

  return (HMDResidentDevice *)v13;
}

- (id)sortResidentStatuses:(id)a3
{
  void *v4;
  void *v5;
  void *v6;

  objc_msgSend(a3, "allObjects");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDResidentSelectionStatusKit comparatorForPreferredResidentsListSource](self, "comparatorForPreferredResidentsListSource");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "sortedArrayUsingComparator:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)comparatorForPreferredResidentsListSource
{
  return &__block_literal_global_96343;
}

- (id)residentIDSIdentifierToLocationMapFrom:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  id v6;
  void *v7;
  _QWORD v9[4];
  id v10;

  v3 = (void *)MEMORY[0x24BDBCED8];
  v4 = a3;
  objc_msgSend(v3, "dictionary");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __72__HMDResidentSelectionStatusKit_residentIDSIdentifierToLocationMapFrom___block_invoke;
  v9[3] = &unk_24E7952B8;
  v10 = v5;
  v6 = v5;
  objc_msgSend(v4, "hmf_enumerateWithAutoreleasePoolUsingBlock:", v9);

  v7 = (void *)objc_msgSend(v6, "copy");
  return v7;
}

- (id)selectionInfoWithLatestTimestampIn:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  HMDResidentSelectionStatusKit *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  int v14;
  void *v15;
  __int16 v16;
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(v4, "allObjects");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "sortedArrayUsingComparator:", &__block_literal_global_5_96338);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "firstObject");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)MEMORY[0x227676638]();
  v9 = self;
  HMFGetOSLogHandle();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = 138543618;
    v15 = v11;
    v16 = 2112;
    v17 = v7;
    _os_log_impl(&dword_2218F0000, v10, OS_LOG_TYPE_INFO, "%{public}@Latest selection info on StatusKit is from status: %@", (uint8_t *)&v14, 0x16u);

  }
  objc_autoreleasePoolPop(v8);
  objc_msgSend(v7, "selectionInfo");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (id)wiredResidentIDSIdentifiersIn:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  HMDResidentSelectionStatusKit *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  _QWORD v13[4];
  id v14;
  uint8_t buf[4];
  void *v16;
  __int16 v17;
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(MEMORY[0x24BDBCEF0], "set");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = __63__HMDResidentSelectionStatusKit_wiredResidentIDSIdentifiersIn___block_invoke;
  v13[3] = &unk_24E7952B8;
  v6 = v5;
  v14 = v6;
  v7 = (void *)MEMORY[0x227676638](objc_msgSend(v4, "hmf_enumerateWithAutoreleasePoolUsingBlock:", v13));
  v8 = self;
  HMFGetOSLogHandle();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v16 = v10;
    v17 = 2112;
    v18 = v6;
    _os_log_impl(&dword_2218F0000, v9, OS_LOG_TYPE_INFO, "%{public}@Wired residents are: %@", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v7);
  v11 = (void *)objc_msgSend(v6, "copy");

  return v11;
}

- (id)logIdentifier
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  -[HMDResidentSelectionStatusKit context](self, "context");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "home");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "uuid");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "UUIDString");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (NSDictionary)residentIDSIdentifierToLocationMap
{
  return self->_residentIDSIdentifierToLocationMap;
}

- (HMDResidentSelectionInfo)selectionInfo
{
  return self->_selectionInfo;
}

- (NSSet)wiredResidentIDSIdentifiers
{
  return self->_wiredResidentIDSIdentifiers;
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (HMDResidentDeviceManagerContext)context
{
  return (HMDResidentDeviceManagerContext *)objc_loadWeakRetained((id *)&self->_context);
}

- (NSSet)residentStatusList
{
  return self->_residentStatusList;
}

- (NSArray)sortedResidentStatuses
{
  return self->_sortedResidentStatuses;
}

- (HMDResidentStatus)sourceForPreferredResidentsList
{
  return self->_sourceForPreferredResidentsList;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sourceForPreferredResidentsList, 0);
  objc_storeStrong((id *)&self->_sortedResidentStatuses, 0);
  objc_storeStrong((id *)&self->_residentStatusList, 0);
  objc_destroyWeak((id *)&self->_context);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_wiredResidentIDSIdentifiers, 0);
  objc_storeStrong((id *)&self->_selectionInfo, 0);
  objc_storeStrong((id *)&self->_residentIDSIdentifierToLocationMap, 0);
}

void __63__HMDResidentSelectionStatusKit_wiredResidentIDSIdentifiersIn___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  id v5;

  v5 = a2;
  if (objc_msgSend(v5, "networkConnectionType") == 1)
  {
    v3 = *(void **)(a1 + 32);
    objc_msgSend(v5, "idsIdentifier");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObject:", v4);

  }
}

uint64_t __68__HMDResidentSelectionStatusKit_selectionInfoWithLatestTimestampIn___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;

  v4 = a2;
  v5 = a3;
  objc_msgSend(v4, "selectionInfo");
  v6 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "selectionInfo");
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = (void *)v7;
  if (v6 | v7)
    v9 = -1;
  else
    v9 = 0;
  if (v7)
    v10 = 1;
  else
    v10 = v9;
  if (v6 && v7)
  {
    objc_msgSend((id)v7, "selectionTimestamp");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)v6, "selectionTimestamp");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v11, "compare:", v12);

  }
  if (!v10)
  {
    objc_msgSend(v4, "idsIdentifier");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "UUIDString");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "idsIdentifier");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "UUIDString");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v14, "compare:", v16);

  }
  return v10;
}

void __72__HMDResidentSelectionStatusKit_residentIDSIdentifierToLocationMapFrom___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  id v7;

  v3 = (void *)MEMORY[0x24BDD16E0];
  v4 = a2;
  objc_msgSend(v3, "numberWithUnsignedInteger:", objc_msgSend(v4, "location"));
  v7 = (id)objc_claimAutoreleasedReturnValue();
  v5 = *(void **)(a1 + 32);
  objc_msgSend(v4, "idsIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "setObject:forKeyedSubscript:", v7, v6);
}

uint64_t __74__HMDResidentSelectionStatusKit_comparatorForPreferredResidentsListSource__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  v4 = a2;
  v5 = a3;
  objc_msgSend(v5, "swVersion");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "swVersion");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v6, "compare:", v7);

  if (!v8)
  {
    objc_msgSend(v4, "idsIdentifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "UUIDString");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "idsIdentifier");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "UUIDString");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v10, "compare:", v12);

  }
  return v8;
}

BOOL __81__HMDResidentSelectionStatusKit_residentStatusWithValidPreferredResidentsListIn___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  id v8;
  NSObject *v9;
  void *v10;
  int v12;
  void *v13;
  __int16 v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  objc_msgSend(v3, "preferredResidentsList");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "residentIDSIdentifiers");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "count");

  if (!v6)
  {
    v7 = (void *)MEMORY[0x227676638]();
    v8 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = 138543618;
      v13 = v10;
      v14 = 2112;
      v15 = v3;
      _os_log_impl(&dword_2218F0000, v9, OS_LOG_TYPE_ERROR, "%{public}@Preferred residents list is missing in: %@. Moving to next one.", (uint8_t *)&v12, 0x16u);

    }
    objc_autoreleasePoolPop(v7);
  }

  return v6 != 0;
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t5_96353 != -1)
    dispatch_once(&logCategory__hmf_once_t5_96353, &__block_literal_global_8_96354);
  return (id)logCategory__hmf_once_v6_96355;
}

void __44__HMDResidentSelectionStatusKit_logCategory__block_invoke()
{
  uint64_t v0;
  void *v1;

  HMFCreateOSLogHandle();
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)logCategory__hmf_once_v6_96355;
  logCategory__hmf_once_v6_96355 = v0;

}

@end
