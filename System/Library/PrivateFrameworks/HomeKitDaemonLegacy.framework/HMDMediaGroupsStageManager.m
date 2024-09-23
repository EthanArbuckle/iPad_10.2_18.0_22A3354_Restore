@implementation HMDMediaGroupsStageManager

- (HMDMediaGroupsStageManager)initWithIdentifier:(id)a3 userDefaults:(id)a4
{
  id v7;
  id v8;
  void *v9;
  HMDMediaGroupsAggregateData *v10;
  HMDMediaGroupsAggregateData *v11;
  HMDMediaGroupsStageManager *v12;
  HMDMediaGroupsStageManager *v13;
  uint64_t v14;
  HMFStagedValue *stagedAggregateData;
  NSUUID *stagedUnpairedCurrentDestinationControllerIdentifier;
  HMDMediaGroupsStageManager *result;
  HMDMediaGroupsStageManager *v18;
  SEL v19;
  objc_super v20;

  v7 = a3;
  v8 = a4;
  if (v8)
  {
    v9 = v8;
    v10 = [HMDMediaGroupsAggregateData alloc];
    v11 = -[HMDMediaGroupsAggregateData initWithDestinations:destinationControllersData:](v10, "initWithDestinations:destinationControllersData:", MEMORY[0x1E0C9AA60], MEMORY[0x1E0C9AA60]);
    v20.receiver = self;
    v20.super_class = (Class)HMDMediaGroupsStageManager;
    v12 = -[HMDMediaGroupsStageManager init](&v20, sel_init);
    v13 = v12;
    if (v12)
    {
      objc_storeStrong((id *)&v12->_identifier, a3);
      objc_storeStrong((id *)&v13->_userDefaults, a4);
      objc_storeStrong((id *)&v13->_committedAggregateData, v11);
      objc_storeStrong((id *)&v13->_lastNotifiedAggregateData, v11);
      v14 = objc_msgSend(objc_alloc(MEMORY[0x1E0D286A8]), "initWithValue:", 0);
      stagedAggregateData = v13->_stagedAggregateData;
      v13->_stagedAggregateData = (HMFStagedValue *)v14;

      -[HMFStagedValue setDelegate:](v13->_stagedAggregateData, "setDelegate:", v13);
      stagedUnpairedCurrentDestinationControllerIdentifier = v13->_stagedUnpairedCurrentDestinationControllerIdentifier;
      v13->_stagedUnpairedCurrentDestinationControllerIdentifier = 0;

    }
    return v13;
  }
  else
  {
    v18 = (HMDMediaGroupsStageManager *)_HMFPreconditionFailure();
    -[HMDMediaGroupsStageManager configure](v18, v19);
  }
  return result;
}

- (void)configure
{
  void *v3;
  void *v4;
  HMDMediaGroupsStageManager *v5;
  NSObject *v6;
  _BOOL4 v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  __int16 v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  -[HMDMediaGroupsStageManager savedAggregateData](self, "savedAggregateData");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)MEMORY[0x1D17BA0A0]();
  v5 = self;
  HMFGetOSLogHandle();
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = os_log_type_enabled(v6, OS_LOG_TYPE_INFO);
  if (v3)
  {
    if (v7)
    {
      HMFGetLogIdentifier();
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = 138543618;
      v12 = v8;
      v13 = 2112;
      v14 = v3;
      _os_log_impl(&dword_1CD062000, v6, OS_LOG_TYPE_INFO, "%{public}@Configuring with staged aggregate data: %@", (uint8_t *)&v11, 0x16u);

    }
    objc_autoreleasePoolPop(v4);
    -[HMDMediaGroupsStageManager stagedAggregateData](v5, "stagedAggregateData");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "stageValue:withTimeout:", v3, 300.0);

    -[HMDMediaGroupsStageManager refreshManager](v5, "refreshManager");
    -[HMDMediaGroupsStageManager clearSavedData](v5, "clearSavedData");
  }
  else
  {
    if (v7)
    {
      HMFGetLogIdentifier();
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = 138543362;
      v12 = v10;
      _os_log_impl(&dword_1CD062000, v6, OS_LOG_TYPE_INFO, "%{public}@Configuring without staged data", (uint8_t *)&v11, 0xCu);

    }
    objc_autoreleasePoolPop(v4);
  }

}

- (void)stageNullDestinationForCurrentDestinationControllerIdentifier:(id)a3
{
  id v4;
  void *v5;
  HMDMediaGroupsStageManager *v6;
  NSObject *v7;
  void *v8;
  int v9;
  void *v10;
  __int16 v11;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = (void *)MEMORY[0x1D17BA0A0]();
  v6 = self;
  HMFGetOSLogHandle();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = 138543618;
    v10 = v8;
    v11 = 2112;
    v12 = v4;
    _os_log_impl(&dword_1CD062000, v7, OS_LOG_TYPE_INFO, "%{public}@Stage null destination for current destination controller identifier: %@", (uint8_t *)&v9, 0x16u);

  }
  objc_autoreleasePoolPop(v5);
  -[HMDMediaGroupsStageManager setStagedUnpairedCurrentDestinationControllerIdentifier:](v6, "setStagedUnpairedCurrentDestinationControllerIdentifier:", v4);
  -[HMDMediaGroupsStageManager refreshManager](v6, "refreshManager");

}

- (void)unstageNullDestinationForCurrentDestinationController
{
  void *v3;
  HMDMediaGroupsStageManager *v4;
  NSObject *v5;
  void *v6;
  int v7;
  void *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v3 = (void *)MEMORY[0x1D17BA0A0](self, a2);
  v4 = self;
  HMFGetOSLogHandle();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = 138543362;
    v8 = v6;
    _os_log_impl(&dword_1CD062000, v5, OS_LOG_TYPE_INFO, "%{public}@Unstage null destination for current destination controller", (uint8_t *)&v7, 0xCu);

  }
  objc_autoreleasePoolPop(v3);
  -[HMDMediaGroupsStageManager setStagedUnpairedCurrentDestinationControllerIdentifier:](v4, "setStagedUnpairedCurrentDestinationControllerIdentifier:", 0);
  -[HMDMediaGroupsStageManager refreshManager](v4, "refreshManager");
}

- (void)refreshManager
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  HMDMediaGroupsStageManager *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  int v15;
  void *v16;
  __int16 v17;
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  -[HMDMediaGroupsStageManager committedAggregateData](self, "committedAggregateData");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "mutableCopy");

  -[HMDMediaGroupsStageManager transformedDestinations](self, "transformedDestinations");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setDestinations:", v5);

  -[HMDMediaGroupsStageManager transformedDestinationControllersData](self, "transformedDestinationControllersData");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setDestinationControllersData:", v6);

  -[HMDMediaGroupsStageManager transformedGroups](self, "transformedGroups");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setGroups:", v7);

  -[HMDMediaGroupsStageManager lastNotifiedAggregateData](self, "lastNotifiedAggregateData");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "isEqual:", v4);

  if (v9)
  {
    v10 = (void *)MEMORY[0x1D17BA0A0]();
    v11 = self;
    HMFGetOSLogHandle();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMDMediaGroupsStageManager lastNotifiedAggregateData](v11, "lastNotifiedAggregateData");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = 138543618;
      v16 = v13;
      v17 = 2112;
      v18 = v14;
      _os_log_impl(&dword_1CD062000, v12, OS_LOG_TYPE_INFO, "%{public}@Refresh resulted in no change to aggregate data: %@", (uint8_t *)&v15, 0x16u);

    }
    objc_autoreleasePoolPop(v10);
  }
  else
  {
    -[HMDMediaGroupsStageManager setLastNotifiedAggregateData:](self, "setLastNotifiedAggregateData:", v4);
    -[HMDMediaGroupsStageManager notifyOfUpdatedAggregateData](self, "notifyOfUpdatedAggregateData");
  }

}

- (id)transformedDestinations
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;

  -[HMDMediaGroupsStageManager committedAggregateData](self, "committedAggregateData");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "destinations");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  -[HMDMediaGroupsStageManager stagedAggregateData](self, "stagedAggregateData");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "value");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "destinations");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    addOrReplaceElements(v7, v4, &__block_literal_global_47656);
    v8 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v8 = v4;
  }
  v9 = v8;

  return v9;
}

- (id)transformedDestinationControllersData
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD v12[4];
  id v13;

  -[HMDMediaGroupsStageManager stagedAggregateData](self, "stagedAggregateData");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "value");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "destinationControllersData");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  -[HMDMediaGroupsStageManager stagedUnpairedCurrentDestinationControllerIdentifier](self, "stagedUnpairedCurrentDestinationControllerIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDMediaGroupsStageManager committedAggregateData](self, "committedAggregateData");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "destinationControllersData");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    addOrReplaceElements(v5, v8, &__block_literal_global_8_47653);
    v9 = objc_claimAutoreleasedReturnValue();

    v8 = (void *)v9;
  }
  if (v6)
  {
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __67__HMDMediaGroupsStageManager_transformedDestinationControllersData__block_invoke_2;
    v12[3] = &unk_1E89AAE28;
    v13 = v6;
    objc_msgSend(v8, "na_map:", v12);
    v10 = objc_claimAutoreleasedReturnValue();

    v8 = (void *)v10;
  }

  return v8;
}

- (id)transformedGroups
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;

  -[HMDMediaGroupsStageManager committedAggregateData](self, "committedAggregateData");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "groups");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  -[HMDMediaGroupsStageManager stagedAggregateData](self, "stagedAggregateData");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "value");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "groups");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    addOrReplaceElements(v7, v4, &__block_literal_global_11_47649);
    v8 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v8 = v4;
  }
  v9 = v8;

  return v9;
}

- (void)notifyOfUpdatedAggregateData
{
  void *v3;
  HMDMediaGroupsStageManager *v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  HMDMediaGroupsStageManager *v11;
  NSObject *v12;
  void *v13;
  int v14;
  void *v15;
  __int16 v16;
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v3 = (void *)MEMORY[0x1D17BA0A0](self, a2);
  v4 = self;
  HMFGetOSLogHandle();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDMediaGroupsStageManager lastNotifiedAggregateData](v4, "lastNotifiedAggregateData");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = 138543618;
    v15 = v6;
    v16 = 2112;
    v17 = v7;
    _os_log_impl(&dword_1CD062000, v5, OS_LOG_TYPE_INFO, "%{public}@Notifying of updated aggregate data: %@", (uint8_t *)&v14, 0x16u);

  }
  objc_autoreleasePoolPop(v3);
  -[HMDMediaGroupsStageManager delegate](v4, "delegate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v8)
  {
    objc_msgSend(v8, "didUpdateAggregateDataForMediaGroupsStageManager:", v4);
  }
  else
  {
    v10 = (void *)MEMORY[0x1D17BA0A0]();
    v11 = v4;
    HMFGetOSLogHandle();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = 138543362;
      v15 = v13;
      _os_log_impl(&dword_1CD062000, v12, OS_LOG_TYPE_ERROR, "%{public}@Failed to notify of updated aggregate data due to no delegate", (uint8_t *)&v14, 0xCu);

    }
    objc_autoreleasePoolPop(v10);
  }

}

- (void)commitAggregateData:(id)a3
{
  id v4;
  void *v5;
  HMDMediaGroupsStageManager *v6;
  NSObject *v7;
  void *v8;
  int v9;
  void *v10;
  __int16 v11;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = (void *)MEMORY[0x1D17BA0A0]();
  v6 = self;
  HMFGetOSLogHandle();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = 138543618;
    v10 = v8;
    v11 = 2112;
    v12 = v4;
    _os_log_impl(&dword_1CD062000, v7, OS_LOG_TYPE_INFO, "%{public}@Committing aggregate data: %@", (uint8_t *)&v9, 0x16u);

  }
  objc_autoreleasePoolPop(v5);
  -[HMDMediaGroupsStageManager setCommittedAggregateData:](v6, "setCommittedAggregateData:", v4);
  -[HMDMediaGroupsStageManager refreshManager](v6, "refreshManager");

}

- (void)saveAssociatedGroupDataForLegacyCurrentAccessory:(id)a3
{
  id v4;
  void *v5;
  HMDMediaGroupsStageManager *v6;
  NSObject *v7;
  void *v8;
  int v9;
  void *v10;
  __int16 v11;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (objc_msgSend(v4, "isHomePod"))
  {
    -[HMDMediaGroupsStageManager saveAssociatedGroupDataForCurrentLegacyHomePodAccessory:](self, "saveAssociatedGroupDataForCurrentLegacyHomePodAccessory:", v4);
  }
  else if (objc_msgSend(v4, "isAppleTV"))
  {
    -[HMDMediaGroupsStageManager saveAssociatedGroupDataForCurrentLegacyAppleTVAccessory:](self, "saveAssociatedGroupDataForCurrentLegacyAppleTVAccessory:", v4);
  }
  else
  {
    v5 = (void *)MEMORY[0x1D17BA0A0]();
    v6 = self;
    HMFGetOSLogHandle();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = 138543618;
      v10 = v8;
      v11 = 2112;
      v12 = v4;
      _os_log_impl(&dword_1CD062000, v7, OS_LOG_TYPE_ERROR, "%{public}@Failed to save associated group data due to unknown category for current accessory: %@", (uint8_t *)&v9, 0x16u);

    }
    objc_autoreleasePoolPop(v5);
  }

}

- (void)saveAssociatedGroupDataForCurrentLegacyHomePodAccessory:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  id v11;
  void *v12;
  void *v13;
  HMDMediaGroupsStageManager *v14;
  NSObject *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  HMDMediaGroupsStageManager *v20;
  NSObject *v21;
  void *v22;
  id v23;
  uint8_t buf[4];
  void *v25;
  __int16 v26;
  void *v27;
  __int16 v28;
  void *v29;
  __int16 v30;
  id v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "audioDestination");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "home");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v5 && v6)
  {
    objc_msgSend(v6, "mediaSystemForAppleMediaAccessory:", v4);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v8;
    if (v8)
    {
      objc_msgSend(v8, "audioDestination");
      v10 = objc_claimAutoreleasedReturnValue();
      if (!v10)
      {
        v19 = (void *)MEMORY[0x1D17BA0A0]();
        v20 = self;
        HMFGetOSLogHandle();
        v21 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
        {
          HMFGetLogIdentifier();
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543618;
          v25 = v22;
          v26 = 2112;
          v27 = v9;
          _os_log_impl(&dword_1CD062000, v21, OS_LOG_TYPE_ERROR, "%{public}@Failed to stage associated data due to no root destination identifier from media system: %@", buf, 0x16u);

        }
        objc_autoreleasePoolPop(v19);
        goto LABEL_17;
      }
      v11 = (id)v10;
      objc_msgSend(v7, "audioDestinationControllerDataForDestination:", v10);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMDMediaGroupsStageManager saveDataForLegacyMediaSystem:](self, "saveDataForLegacyMediaSystem:", v9);
      if (!v12)
      {
LABEL_13:

LABEL_17:
        goto LABEL_18;
      }
    }
    else
    {
      v11 = v5;
      objc_msgSend(v7, "audioDestinationControllerDataForDestination:", v11);
      v17 = objc_claimAutoreleasedReturnValue();
      if (!v17)
        goto LABEL_13;
      v12 = (void *)v17;
      v23 = v11;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v23, 1);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMDMediaGroupsStageManager saveDestinations:](self, "saveDestinations:", v18);

    }
    -[HMDMediaGroupsStageManager saveDestinationControllerData:](self, "saveDestinationControllerData:", v12);

    goto LABEL_13;
  }
  v13 = (void *)MEMORY[0x1D17BA0A0]();
  v14 = self;
  HMFGetOSLogHandle();
  v15 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
  {
    HMFGetLogIdentifier();
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138544130;
    v25 = v16;
    v26 = 2112;
    v27 = v5;
    v28 = 2112;
    v29 = v7;
    v30 = 2112;
    v31 = v4;
    _os_log_impl(&dword_1CD062000, v15, OS_LOG_TYPE_ERROR, "%{public}@Failed to stage associated data due to no destination: %@ home: %@ for the current HomePod accessory: %@", buf, 0x2Au);

  }
  objc_autoreleasePoolPop(v13);
LABEL_18:

}

- (void)saveAssociatedGroupDataForCurrentLegacyAppleTVAccessory:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  HMDMediaGroupsStageManager *v15;
  NSObject *v16;
  void *v17;
  _QWORD v18[4];
  id v19;
  HMDMediaGroupsStageManager *v20;
  id v21;
  _QWORD v22[4];
  id v23;
  HMDMediaGroupsStageManager *v24;
  id v25;
  uint8_t buf[4];
  void *v27;
  __int16 v28;
  id v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "audioDestinationControllerData");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "destinationIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    objc_msgSend(v4, "home");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v7;
    if (v7)
    {
      objc_msgSend(v7, "appleMediaAccessories");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = MEMORY[0x1E0C809B0];
      v22[0] = MEMORY[0x1E0C809B0];
      v22[1] = 3221225472;
      v22[2] = __86__HMDMediaGroupsStageManager_saveAssociatedGroupDataForCurrentLegacyAppleTVAccessory___block_invoke;
      v22[3] = &unk_1E89AAE90;
      v11 = v6;
      v23 = v11;
      v24 = self;
      v12 = v5;
      v25 = v12;
      objc_msgSend(v9, "na_each:", v22);

      objc_msgSend(v8, "mediaSystems");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v18[0] = v10;
      v18[1] = 3221225472;
      v18[2] = __86__HMDMediaGroupsStageManager_saveAssociatedGroupDataForCurrentLegacyAppleTVAccessory___block_invoke_2;
      v18[3] = &unk_1E89AAEB8;
      v19 = v11;
      v20 = self;
      v21 = v12;
      objc_msgSend(v13, "na_each:", v18);

    }
    else
    {
      v14 = (void *)MEMORY[0x1D17BA0A0]();
      v15 = self;
      HMFGetOSLogHandle();
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v27 = v17;
        v28 = 2112;
        v29 = v4;
        _os_log_impl(&dword_1CD062000, v16, OS_LOG_TYPE_ERROR, "%{public}@Failed stage associated group data due to no home for current accessory: %@", buf, 0x16u);

      }
      objc_autoreleasePoolPop(v14);
    }

  }
}

- (void)saveDataForLegacyMediaSystem:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  HMDMediaGroupsStageManager *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  HMDMediaGroupsStageManager *v23;
  NSObject *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  void *v30;
  void *v31;
  _QWORD v32[3];
  uint8_t buf[4];
  void *v34;
  __int16 v35;
  id v36;
  __int16 v37;
  void *v38;
  __int16 v39;
  id v40;
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[HMDMediaGroupsStageManager transformedDestinationForLegacyMediaSystem:role:](self, "transformedDestinationForLegacyMediaSystem:role:", v4, 2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDMediaGroupsStageManager transformedDestinationForLegacyMediaSystem:role:](self, "transformedDestinationForLegacyMediaSystem:role:", v4, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "audioDestination");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5 && v6)
  {
    objc_msgSend(v4, "configuredName");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    if (v29)
    {
      v7 = v29;
    }
    else
    {
      objc_msgSend(v4, "name");
      v7 = (id)objc_claimAutoreleasedReturnValue();
    }
    v30 = v7;
    objc_msgSend(v4, "audioDestination");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "audioGroupIdentifier");
    v28 = objc_claimAutoreleasedReturnValue();

    objc_msgSend(v6, "uniqueIdentifier");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "uniqueIdentifier");
    v27 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "home");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "uuid");
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    if (v15 && v30)
    {
      v16 = objc_alloc(MEMORY[0x1E0CBA680]);
      objc_msgSend(v4, "uuid");
      v26 = v13;
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = (void *)v27;
      v18 = (void *)v28;
      v20 = (void *)objc_msgSend(v16, "initWithIdentifier:parentIdentifier:name:defaultName:associatedGroupIdentifier:leftDestinationIdentifier:rightDestinationIdentifier:", v17, v15, v30, v29 == 0, v28, v26, v27);

      v32[0] = v6;
      v32[1] = v5;
      v32[2] = v31;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v32, 3);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMDMediaGroupsStageManager saveDestinations:](self, "saveDestinations:", v21);

      v13 = v26;
      -[HMDMediaGroupsStageManager saveGroup:](self, "saveGroup:", v20);

    }
    else
    {
      v22 = (void *)MEMORY[0x1D17BA0A0]();
      v23 = self;
      HMFGetOSLogHandle();
      v24 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138544130;
        v34 = v25;
        v35 = 2112;
        v36 = v15;
        v37 = 2112;
        v38 = v30;
        v39 = 2112;
        v40 = v4;
        _os_log_impl(&dword_1CD062000, v24, OS_LOG_TYPE_ERROR, "%{public}@Failed to stage data due to missing home identifier: %@ name: %@ for media system: %@", buf, 0x2Au);

      }
      objc_autoreleasePoolPop(v22);
      v19 = (void *)v27;
      v18 = (void *)v28;
    }

  }
  else
  {
    v8 = (void *)MEMORY[0x1D17BA0A0]();
    v9 = self;
    HMFGetOSLogHandle();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v34 = v11;
      v35 = 2112;
      v36 = v4;
      _os_log_impl(&dword_1CD062000, v10, OS_LOG_TYPE_ERROR, "%{public}@Failed to stage data due to missing destinations for media system: %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v8);
  }

}

- (id)transformedDestinationForLegacyMediaSystem:(id)a3 role:(unint64_t)a4
{
  id v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  HMDMediaGroupsStageManager *v17;
  NSObject *v18;
  void *v19;
  _QWORD v21[5];
  uint8_t buf[4];
  void *v23;
  __int16 v24;
  void *v25;
  __int16 v26;
  id v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  objc_msgSend(v6, "components");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v21[0] = MEMORY[0x1E0C809B0];
  v21[1] = 3221225472;
  v21[2] = __78__HMDMediaGroupsStageManager_transformedDestinationForLegacyMediaSystem_role___block_invoke;
  v21[3] = &__block_descriptor_40_e33_B16__0__HMDMediaSystemComponent_8l;
  v21[4] = a4;
  objc_msgSend(v7, "na_firstObjectPassingTest:", v21);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "accessory");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v10 = v9;
  else
    v10 = 0;
  v11 = v10;

  objc_msgSend(v11, "audioDestination");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v12;
  if (v12)
  {
    v14 = (void *)objc_msgSend(v12, "mutableCopy");
    objc_msgSend(v6, "uuid");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setAudioGroupIdentifier:", v15);

  }
  else
  {
    v16 = (void *)MEMORY[0x1D17BA0A0]();
    v17 = self;
    HMFGetOSLogHandle();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v23 = v19;
      v24 = 2112;
      v25 = v8;
      v26 = 2112;
      v27 = v9;
      _os_log_impl(&dword_1CD062000, v18, OS_LOG_TYPE_ERROR, "%{public}@Failed to get destination from component: %@ accessory: %@", buf, 0x20u);

    }
    objc_autoreleasePoolPop(v16);
    v14 = 0;
  }

  return v14;
}

- (void)saveAggregateData:(id)a3
{
  id v4;
  void *v5;
  HMDMediaGroupsStageManager *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  __int16 v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = (void *)MEMORY[0x1D17BA0A0]();
  v6 = self;
  HMFGetOSLogHandle();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = 138543618;
    v12 = v8;
    v13 = 2112;
    v14 = v4;
    _os_log_impl(&dword_1CD062000, v7, OS_LOG_TYPE_INFO, "%{public}@Saving aggregate data: %@", (uint8_t *)&v11, 0x16u);

  }
  objc_autoreleasePoolPop(v5);
  -[HMDMediaGroupsStageManager saveIdentifier](v6, "saveIdentifier");
  -[HMDMediaGroupsStageManager userDefaults](v6, "userDefaults");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeToProtoBufferData");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setObject:forKey:", v10, CFSTR("HMDMediaGroupsStageManagerAggregatedDataKey"));

}

- (void)saveIdentifier
{
  void *v3;
  HMDMediaGroupsStageManager *v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  __int16 v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v3 = (void *)MEMORY[0x1D17BA0A0](self, a2);
  v4 = self;
  HMFGetOSLogHandle();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDMediaGroupsStageManager identifier](v4, "identifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = 138543618;
    v12 = v6;
    v13 = 2112;
    v14 = v7;
    _os_log_impl(&dword_1CD062000, v5, OS_LOG_TYPE_INFO, "%{public}@Saving identifier: %@", (uint8_t *)&v11, 0x16u);

  }
  objc_autoreleasePoolPop(v3);
  -[HMDMediaGroupsStageManager userDefaults](v4, "userDefaults");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDMediaGroupsStageManager identifier](v4, "identifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "UUIDString");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setObject:forKey:", v10, CFSTR("HMDMediaGroupsStageManagerIdentifierKey"));

}

- (id)savedAggregateData
{
  void *v3;
  void *v4;
  HMDMediaGroupsAggregateData *v5;
  HMDMediaGroupsAggregateData *v6;
  HMDMediaGroupsAggregateData *v7;
  void *v9;
  HMDMediaGroupsStageManager *v10;
  NSObject *v11;
  void *v12;
  int v13;
  void *v14;
  __int16 v15;
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  if (!-[HMDMediaGroupsStageManager hasSavedIdentifier](self, "hasSavedIdentifier"))
    return 0;
  -[HMDMediaGroupsStageManager userDefaults](self, "userDefaults");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKey:", CFSTR("HMDMediaGroupsStageManagerAggregatedDataKey"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    v5 = -[HMDMediaGroupsAggregateData initWithProtoBufferData:]([HMDMediaGroupsAggregateData alloc], "initWithProtoBufferData:", v4);
    v6 = v5;
    if (v5)
    {
      v7 = v5;
    }
    else
    {
      v9 = (void *)MEMORY[0x1D17BA0A0]();
      v10 = self;
      HMFGetOSLogHandle();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = 138543618;
        v14 = v12;
        v15 = 2112;
        v16 = v4;
        _os_log_impl(&dword_1CD062000, v11, OS_LOG_TYPE_ERROR, "%{public}@Failed to saved aggregate data due to unable to decode data: %@", (uint8_t *)&v13, 0x16u);

      }
      objc_autoreleasePoolPop(v9);
    }

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (BOOL)hasSavedIdentifier
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  char v7;
  void *v8;
  HMDMediaGroupsStageManager *v9;
  NSObject *v10;
  void *v11;
  int v13;
  void *v14;
  __int16 v15;
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  -[HMDMediaGroupsStageManager userDefaults](self, "userDefaults");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringForKey:", CFSTR("HMDMediaGroupsStageManagerIdentifierKey"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3A28]), "initWithUUIDString:", v4);
    if (v5)
    {
      -[HMDMediaGroupsStageManager identifier](self, "identifier");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = objc_msgSend(v5, "hmf_isEqualToUUID:", v6);

    }
    else
    {
      v8 = (void *)MEMORY[0x1D17BA0A0]();
      v9 = self;
      HMFGetOSLogHandle();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = 138543618;
        v14 = v11;
        v15 = 2112;
        v16 = v4;
        _os_log_impl(&dword_1CD062000, v10, OS_LOG_TYPE_INFO, "%{public}@Failed to decode identifier: %@", (uint8_t *)&v13, 0x16u);

      }
      objc_autoreleasePoolPop(v8);
      v7 = 0;
    }

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (void)saveDestinationControllerData:(id)a3
{
  id v4;
  void *v5;
  HMDMediaGroupsStageManager *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  HMDMediaGroupsAggregateData *v11;
  HMDMediaGroupsAggregateData *v12;
  HMDMediaGroupsAggregateData *v13;
  void *v14;
  void *v15;
  void *v16;
  int v17;
  void *v18;
  __int16 v19;
  id v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = (void *)MEMORY[0x1D17BA0A0]();
  v6 = self;
  HMFGetOSLogHandle();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = 138543618;
    v18 = v8;
    v19 = 2112;
    v20 = v4;
    _os_log_impl(&dword_1CD062000, v7, OS_LOG_TYPE_INFO, "%{public}@Saving destination controller data: %@", (uint8_t *)&v17, 0x16u);

  }
  objc_autoreleasePoolPop(v5);
  -[HMDMediaGroupsStageManager savedAggregateData](v6, "savedAggregateData");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v9)
  {
    v11 = v9;
  }
  else
  {
    v12 = [HMDMediaGroupsAggregateData alloc];
    v11 = -[HMDMediaGroupsAggregateData initWithDestinations:destinationControllersData:](v12, "initWithDestinations:destinationControllersData:", MEMORY[0x1E0C9AA60], MEMORY[0x1E0C9AA60]);
  }
  v13 = v11;

  v14 = (void *)-[HMDMediaGroupsAggregateData mutableCopy](v13, "mutableCopy");
  objc_msgSend(v14, "destinationControllersData");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "arrayByAddingObject:", v4);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setDestinationControllersData:", v16);

  -[HMDMediaGroupsStageManager saveAggregateData:](v6, "saveAggregateData:", v14);
}

- (void)saveDestinations:(id)a3
{
  id v4;
  void *v5;
  HMDMediaGroupsStageManager *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  HMDMediaGroupsAggregateData *v11;
  HMDMediaGroupsAggregateData *v12;
  HMDMediaGroupsAggregateData *v13;
  void *v14;
  void *v15;
  void *v16;
  int v17;
  void *v18;
  __int16 v19;
  id v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = (void *)MEMORY[0x1D17BA0A0]();
  v6 = self;
  HMFGetOSLogHandle();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = 138543618;
    v18 = v8;
    v19 = 2112;
    v20 = v4;
    _os_log_impl(&dword_1CD062000, v7, OS_LOG_TYPE_INFO, "%{public}@Saving destinations: %@", (uint8_t *)&v17, 0x16u);

  }
  objc_autoreleasePoolPop(v5);
  -[HMDMediaGroupsStageManager savedAggregateData](v6, "savedAggregateData");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v9)
  {
    v11 = v9;
  }
  else
  {
    v12 = [HMDMediaGroupsAggregateData alloc];
    v11 = -[HMDMediaGroupsAggregateData initWithDestinations:destinationControllersData:](v12, "initWithDestinations:destinationControllersData:", MEMORY[0x1E0C9AA60], MEMORY[0x1E0C9AA60]);
  }
  v13 = v11;

  v14 = (void *)-[HMDMediaGroupsAggregateData mutableCopy](v13, "mutableCopy");
  objc_msgSend(v14, "destinations");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "arrayByAddingObjectsFromArray:", v4);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setDestinations:", v16);

  -[HMDMediaGroupsStageManager saveAggregateData:](v6, "saveAggregateData:", v14);
}

- (void)saveGroup:(id)a3
{
  id v4;
  void *v5;
  HMDMediaGroupsStageManager *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  HMDMediaGroupsAggregateData *v11;
  HMDMediaGroupsAggregateData *v12;
  HMDMediaGroupsAggregateData *v13;
  void *v14;
  void *v15;
  void *v16;
  int v17;
  void *v18;
  __int16 v19;
  id v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = (void *)MEMORY[0x1D17BA0A0]();
  v6 = self;
  HMFGetOSLogHandle();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = 138543618;
    v18 = v8;
    v19 = 2112;
    v20 = v4;
    _os_log_impl(&dword_1CD062000, v7, OS_LOG_TYPE_INFO, "%{public}@Saving group: %@", (uint8_t *)&v17, 0x16u);

  }
  objc_autoreleasePoolPop(v5);
  -[HMDMediaGroupsStageManager savedAggregateData](v6, "savedAggregateData");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v9)
  {
    v11 = v9;
  }
  else
  {
    v12 = [HMDMediaGroupsAggregateData alloc];
    v11 = -[HMDMediaGroupsAggregateData initWithDestinations:destinationControllersData:](v12, "initWithDestinations:destinationControllersData:", MEMORY[0x1E0C9AA60], MEMORY[0x1E0C9AA60]);
  }
  v13 = v11;

  v14 = (void *)-[HMDMediaGroupsAggregateData mutableCopy](v13, "mutableCopy");
  objc_msgSend(v14, "groups");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "arrayByAddingObject:", v4);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setGroups:", v16);

  -[HMDMediaGroupsStageManager saveAggregateData:](v6, "saveAggregateData:", v14);
}

- (void)clearSavedData
{
  void *v3;
  id v4;

  -[HMDMediaGroupsStageManager userDefaults](self, "userDefaults");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObjectForKey:", CFSTR("HMDMediaGroupsStageManagerIdentifierKey"));

  -[HMDMediaGroupsStageManager userDefaults](self, "userDefaults");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeObjectForKey:", CFSTR("HMDMediaGroupsStageManagerAggregatedDataKey"));

}

- (void)stagedValue:(id)a3 didExpireValue:(id)a4
{
  id v6;
  id v7;
  void *v8;
  HMDMediaGroupsStageManager *v9;
  NSObject *v10;
  void *v11;
  int v12;
  void *v13;
  __int16 v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = (void *)MEMORY[0x1D17BA0A0]();
  v9 = self;
  HMFGetOSLogHandle();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = 138543618;
    v13 = v11;
    v14 = 2112;
    v15 = v7;
    _os_log_impl(&dword_1CD062000, v10, OS_LOG_TYPE_INFO, "%{public}@Handling expired staged aggregate data: %@", (uint8_t *)&v12, 0x16u);

  }
  objc_autoreleasePoolPop(v8);
  -[HMDMediaGroupsStageManager refreshManager](v9, "refreshManager");

}

- (id)logIdentifier
{
  void *v2;
  void *v3;

  -[HMDMediaGroupsStageManager identifier](self, "identifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "UUIDString");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (HMDMediaGroupsStageManagerDelegate)delegate
{
  return (HMDMediaGroupsStageManagerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (NSUUID)identifier
{
  return (NSUUID *)objc_getProperty(self, a2, 16, 1);
}

- (NSUserDefaults)userDefaults
{
  return (NSUserDefaults *)objc_getProperty(self, a2, 24, 1);
}

- (HMFStagedValue)stagedAggregateData
{
  return (HMFStagedValue *)objc_getProperty(self, a2, 32, 1);
}

- (HMDMediaGroupsAggregateData)committedAggregateData
{
  return (HMDMediaGroupsAggregateData *)objc_getProperty(self, a2, 40, 1);
}

- (void)setCommittedAggregateData:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 40);
}

- (HMDMediaGroupsAggregateData)lastNotifiedAggregateData
{
  return (HMDMediaGroupsAggregateData *)objc_getProperty(self, a2, 48, 1);
}

- (void)setLastNotifiedAggregateData:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 48);
}

- (NSUUID)stagedUnpairedCurrentDestinationControllerIdentifier
{
  return (NSUUID *)objc_getProperty(self, a2, 56, 1);
}

- (void)setStagedUnpairedCurrentDestinationControllerIdentifier:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 56);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_stagedUnpairedCurrentDestinationControllerIdentifier, 0);
  objc_storeStrong((id *)&self->_lastNotifiedAggregateData, 0);
  objc_storeStrong((id *)&self->_committedAggregateData, 0);
  objc_storeStrong((id *)&self->_stagedAggregateData, 0);
  objc_storeStrong((id *)&self->_userDefaults, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

BOOL __78__HMDMediaGroupsStageManager_transformedDestinationForLegacyMediaSystem_role___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  _BOOL8 v4;

  objc_msgSend(a2, "role");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "type") == *(_QWORD *)(a1 + 32);

  return v4;
}

void __86__HMDMediaGroupsStageManager_saveAssociatedGroupDataForCurrentLegacyAppleTVAccessory___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  int v5;
  void *v6;
  void *v7;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(a2, "audioDestination");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "uniqueIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "hmf_isEqualToUUID:", *(_QWORD *)(a1 + 32));

  if (v5)
  {
    objc_msgSend(*(id *)(a1 + 40), "saveDestinationControllerData:", *(_QWORD *)(a1 + 48));
    v6 = *(void **)(a1 + 40);
    v8[0] = v3;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v8, 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "saveDestinations:", v7);

  }
}

void __86__HMDMediaGroupsStageManager_saveAssociatedGroupDataForCurrentLegacyAppleTVAccessory___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  int v5;
  id v6;

  v6 = a2;
  objc_msgSend(v6, "audioDestination");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "uniqueIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "hmf_isEqualToUUID:", *(_QWORD *)(a1 + 32));

  if (v5)
  {
    objc_msgSend(*(id *)(a1 + 40), "saveDestinationControllerData:", *(_QWORD *)(a1 + 48));
    objc_msgSend(*(id *)(a1 + 40), "saveDataForLegacyMediaSystem:", v6);
  }

}

uint64_t __47__HMDMediaGroupsStageManager_transformedGroups__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;

  v4 = a3;
  objc_msgSend(a2, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "identifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v5, "hmf_isEqualToUUID:", v6);
  return v7;
}

id __67__HMDMediaGroupsStageManager_transformedDestinationControllersData__block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  id v6;

  v3 = a2;
  objc_msgSend(v3, "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v4, "hmf_isEqualToUUID:", *(_QWORD *)(a1 + 32)) & 1) == 0)
  {

    goto LABEL_5;
  }
  objc_msgSend(v3, "destinationIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
  {
LABEL_5:
    v6 = v3;
    goto LABEL_6;
  }
  v6 = (id)objc_msgSend(v3, "mutableCopy");
  objc_msgSend(v6, "setDestinationIdentifier:", 0);
LABEL_6:

  return v6;
}

uint64_t __67__HMDMediaGroupsStageManager_transformedDestinationControllersData__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;

  v4 = a3;
  objc_msgSend(a2, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "identifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v5, "hmf_isEqualToUUID:", v6);
  return v7;
}

uint64_t __53__HMDMediaGroupsStageManager_transformedDestinations__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;

  v4 = a3;
  objc_msgSend(a2, "uniqueIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "uniqueIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v5, "hmf_isEqualToUUID:", v6);
  return v7;
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t24_47670 != -1)
    dispatch_once(&logCategory__hmf_once_t24_47670, &__block_literal_global_20_47671);
  return (id)logCategory__hmf_once_v25_47672;
}

void __41__HMDMediaGroupsStageManager_logCategory__block_invoke()
{
  uint64_t v0;
  void *v1;

  HMFCreateOSLogHandle();
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)logCategory__hmf_once_v25_47672;
  logCategory__hmf_once_v25_47672 = v0;

}

@end
