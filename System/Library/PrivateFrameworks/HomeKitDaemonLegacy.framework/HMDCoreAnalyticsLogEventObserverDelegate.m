@implementation HMDCoreAnalyticsLogEventObserverDelegate

- (HMDCoreAnalyticsLogEventObserverDelegate)initWithDataSource:(id)a3
{
  id v4;
  HMDCoreAnalyticsLogEventObserverDelegate *v5;
  HMDCoreAnalyticsLogEventObserverDelegate *v6;
  uint64_t v7;
  NSMutableDictionary *homeDimensions;
  _QWORD v10[4];
  id v11;
  id location;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)HMDCoreAnalyticsLogEventObserverDelegate;
  v5 = -[HMDCoreAnalyticsLogEventObserverDelegate init](&v13, sel_init);
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_dataSource, v4);
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v7 = objc_claimAutoreleasedReturnValue();
    homeDimensions = v6->_homeDimensions;
    v6->_homeDimensions = (NSMutableDictionary *)v7;

    objc_initWeak(&location, v6);
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __63__HMDCoreAnalyticsLogEventObserverDelegate_initWithDataSource___block_invoke;
    v10[3] = &unk_1E89A8428;
    objc_copyWeak(&v11, &location);
    objc_msgSend(v4, "addConfigurationChangedObserver:", v10);
    objc_destroyWeak(&v11);
    objc_destroyWeak(&location);
  }

  return v6;
}

- (void)addCommonDimensionsToEventDictionary:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;

  v4 = a3;
  -[HMDCoreAnalyticsLogEventObserverDelegate dataSource](self, "dataSource");
  v22 = (id)objc_claimAutoreleasedReturnValue();
  -[HMDCoreAnalyticsLogEventObserverDelegate aggregatedHomeCategorizationDimensions](self, "aggregatedHomeCategorizationDimensions");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addEntriesFromDictionary:", v5);

  -[HMDCoreAnalyticsLogEventObserverDelegate deviceCapabilitiesAndEnablementsDimensions](self, "deviceCapabilitiesAndEnablementsDimensions");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addEntriesFromDictionary:", v6);

  v7 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(v22, "deviceStateProvider");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "numberWithUnsignedInteger:", objc_msgSend(v8, "currentDataSyncState"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v9, CFSTR("dataSyncState"));

  v10 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(v22, "deviceStateProvider");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "numberWithUnsignedInteger:", objc_msgSend(v11, "currentHomeManagerStatus"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v12, CFSTR("homeManagerStatus"));

  v13 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(v22, "deviceStateProvider");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "numberWithInteger:", objc_msgSend(v14, "deviceDaysSinceSoftwareUpdate"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v15, CFSTR("daysSinceSWUpdate"));

  v16 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(v22, "deviceStateProvider");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "numberWithUnsignedInteger:", objc_msgSend(v17, "bitMappedMissingKeys"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v18, CFSTR("missingKeyTypes"));

  v19 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(v22, "deviceStateProvider");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "numberWithUnsignedInteger:", objc_msgSend(v20, "bitMappedDuplicateKeys"));
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v21, CFSTR("duplicateKeyTypes"));

}

- (void)addDimensionsForAccessoryIdentifier:(id)a3 toEventDictionary:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  HMDCoreAnalyticsLogEventObserverDelegate *v11;
  NSObject *v12;
  void *v13;
  int v14;
  void *v15;
  __int16 v16;
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  -[HMDCoreAnalyticsLogEventObserverDelegate dataSource](self, "dataSource");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "accessoryForIdentifier:", v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    objc_msgSend(v9, "populateVendorDetailsForCoreAnalytics:keyPrefix:", v7, CFSTR("accessory"));
  }
  else
  {
    v10 = (void *)MEMORY[0x1D17BA0A0]();
    v11 = self;
    HMFGetOSLogHandle();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = 138543618;
      v15 = v13;
      v16 = 2114;
      v17 = v6;
      _os_log_impl(&dword_1CD062000, v12, OS_LOG_TYPE_ERROR, "%{public}@Accessory with identifier %{public}@ doesn't exist", (uint8_t *)&v14, 0x16u);

    }
    objc_autoreleasePoolPop(v10);
  }

}

- (void)addAggregatedHomeDimensionsToEventDictionary:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[HMDCoreAnalyticsLogEventObserverDelegate aggregatedHomeDimensions](self, "aggregatedHomeDimensions");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addEntriesFromDictionary:", v5);

}

- (void)addDimensionsForHome:(id)a3 toEventDictionary:(id)a4
{
  id v6;
  id v7;

  v6 = a4;
  -[HMDCoreAnalyticsLogEventObserverDelegate dimensionsForHome:](self, "dimensionsForHome:", a3);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addEntriesFromDictionary:", v7);

}

- (void)configurationChanged
{
  os_unfair_lock_s *p_lock;
  NSDictionary *aggregatedHomeCategorizationDimensions;
  NSDictionary *deviceCapabilitiesAndEnablementsDimensions;
  NSDictionary *aggregatedHomeDimensions;

  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  aggregatedHomeCategorizationDimensions = self->_aggregatedHomeCategorizationDimensions;
  self->_aggregatedHomeCategorizationDimensions = 0;

  deviceCapabilitiesAndEnablementsDimensions = self->_deviceCapabilitiesAndEnablementsDimensions;
  self->_deviceCapabilitiesAndEnablementsDimensions = 0;

  aggregatedHomeDimensions = self->_aggregatedHomeDimensions;
  self->_aggregatedHomeDimensions = 0;

  -[NSMutableDictionary removeAllObjects](self->_homeDimensions, "removeAllObjects");
  os_unfair_lock_unlock(p_lock);
}

- (NSDictionary)aggregatedHomeCategorizationDimensions
{
  os_unfair_lock_s *p_lock;
  NSDictionary *aggregatedHomeCategorizationDimensions;
  void *v5;
  id WeakRetained;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  NSDictionary *v12;
  NSDictionary *v13;
  NSDictionary *v14;

  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  aggregatedHomeCategorizationDimensions = self->_aggregatedHomeCategorizationDimensions;
  if (!aggregatedHomeCategorizationDimensions)
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
    objc_msgSend(WeakRetained, "cachedConfiguration");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7)
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v7, "totalHomeCategoryBitMask"));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setObject:forKeyedSubscript:", v8, CFSTR("totalHomeCategoryBitMask"));

      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v7, "totalAppleMediaCategoryBitMask"));
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setObject:forKeyedSubscript:", v9, CFSTR("totalAppleMediaBitMask"));

      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v7, "totalThirdPartyMediaCategoryBitMask"));
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setObject:forKeyedSubscript:", v10, CFSTR("totalThirdPartyMediaBitMask"));

      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v7, "currentUserPrivilegeBitMask"));
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setObject:forKeyedSubscript:", v11, CFSTR("currentUserPrivilegeBitMask"));

    }
    v12 = (NSDictionary *)objc_msgSend(v5, "copy");
    v13 = self->_aggregatedHomeCategorizationDimensions;
    self->_aggregatedHomeCategorizationDimensions = v12;

    aggregatedHomeCategorizationDimensions = self->_aggregatedHomeCategorizationDimensions;
  }
  v14 = aggregatedHomeCategorizationDimensions;
  os_unfair_lock_unlock(p_lock);
  return v14;
}

- (NSDictionary)deviceCapabilitiesAndEnablementsDimensions
{
  os_unfair_lock_s *p_lock;
  NSDictionary *deviceCapabilitiesAndEnablementsDimensions;
  void *v5;
  id WeakRetained;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  NSDictionary *v15;
  NSDictionary *v16;
  NSDictionary *v17;

  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  deviceCapabilitiesAndEnablementsDimensions = self->_deviceCapabilitiesAndEnablementsDimensions;
  if (!deviceCapabilitiesAndEnablementsDimensions)
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
    objc_msgSend(WeakRetained, "cachedConfiguration");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7)
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(v7, "isFMFDevice"));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setObject:forKeyedSubscript:", v8, CFSTR("isFMFDevice"));

      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(v7, "isResidentCapable"));
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setObject:forKeyedSubscript:", v9, CFSTR("currentDeviceResidentCapable"));

      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(v7, "isResidentEnabled"));
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setObject:forKeyedSubscript:", v10, CFSTR("currentDeviceResidentEnabled"));

      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(v7, "isPrimaryResidentForSomeHome"));
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setObject:forKeyedSubscript:", v11, CFSTR("currentDeviceResidentPrimaryResidentAnyHome"));

      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(v7, "isResidentFirstEnabledAnyHome"));
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setObject:forKeyedSubscript:", v12, CFSTR("isResidentFirstEnabledAnyHome"));

      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(v7, "isResidentElectionV2EnabledAnyHome"));
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setObject:forKeyedSubscript:", v13, CFSTR("isResidentElectionV2EnabledAnyHome"));

      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v7, "totalResidentElectionBitMask"));
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setObject:forKeyedSubscript:", v14, CFSTR("totalResidentElectionBitMask"));

    }
    objc_msgSend(v5, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAA0], CFSTR("isHH2Enabled"));
    objc_msgSend(v5, "setObject:forKeyedSubscript:", &unk_1E8B32688, CFSTR("isHH2Enabled_INT"));
    v15 = (NSDictionary *)objc_msgSend(v5, "copy");
    v16 = self->_deviceCapabilitiesAndEnablementsDimensions;
    self->_deviceCapabilitiesAndEnablementsDimensions = v15;

    deviceCapabilitiesAndEnablementsDimensions = self->_deviceCapabilitiesAndEnablementsDimensions;
  }
  v17 = deviceCapabilitiesAndEnablementsDimensions;
  os_unfair_lock_unlock(p_lock);
  return v17;
}

- (NSDictionary)aggregatedHomeDimensions
{
  os_unfair_lock_s *p_lock;
  NSDictionary *aggregatedHomeDimensions;
  void *v5;
  id WeakRetained;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  NSDictionary *v67;
  NSDictionary *v68;
  NSDictionary *v69;

  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  aggregatedHomeDimensions = self->_aggregatedHomeDimensions;
  if (!aggregatedHomeDimensions)
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
    objc_msgSend(WeakRetained, "cachedConfiguration");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7)
    {
      +[HMDLogEventHistograms configurationDataHistogram](HMDLogEventHistograms, "configurationDataHistogram");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "intervalIndexForValue:", objc_msgSend(v7, "totalHomes"));
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setObject:forKeyedSubscript:", v9, CFSTR("numHomes"));

      +[HMDLogEventHistograms configurationDataHistogram](HMDLogEventHistograms, "configurationDataHistogram");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "intervalIndexForValue:", objc_msgSend(v7, "totalNonEmptyHomes"));
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setObject:forKeyedSubscript:", v11, CFSTR("numNonEmptyHomes"));

      +[HMDLogEventHistograms configurationDataHistogram](HMDLogEventHistograms, "configurationDataHistogram");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "intervalIndexForValue:", objc_msgSend(v7, "totalOwnedHomes"));
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setObject:forKeyedSubscript:", v13, CFSTR("numOwnedHomes"));

      +[HMDLogEventHistograms configurationDataHistogram](HMDLogEventHistograms, "configurationDataHistogram");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "intervalIndexForValue:", objc_msgSend(v7, "totalResidentEnabledHomes"));
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setObject:forKeyedSubscript:", v15, CFSTR("numResidentEnabledHomes"));

      +[HMDLogEventHistograms configurationDataHistogram](HMDLogEventHistograms, "configurationDataHistogram");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "intervalIndexForValue:", objc_msgSend(v7, "totalUsers"));
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setObject:forKeyedSubscript:", v17, CFSTR("numUsers"));

      +[HMDLogEventHistograms configurationDataHistogram](HMDLogEventHistograms, "configurationDataHistogram");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "intervalIndexForValue:", objc_msgSend(v7, "totalAdminUsers"));
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setObject:forKeyedSubscript:", v19, CFSTR("numAdminUsers"));

      +[HMDLogEventHistograms configurationDataHistogram](HMDLogEventHistograms, "configurationDataHistogram");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "intervalIndexForValue:", objc_msgSend(v7, "totalRestrictedGuests"));
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setObject:forKeyedSubscript:", v21, CFSTR("numRestrictedGuests"));

      +[HMDLogEventHistograms configurationDataHistogram](HMDLogEventHistograms, "configurationDataHistogram");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "intervalIndexForValue:", objc_msgSend(v7, "totalAccessories"));
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setObject:forKeyedSubscript:", v23, CFSTR("numAccessories"));

      +[HMDLogEventHistograms configurationDataHistogram](HMDLogEventHistograms, "configurationDataHistogram");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "intervalIndexForValue:", objc_msgSend(v7, "totalCertifiedAccessories"));
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setObject:forKeyedSubscript:", v25, CFSTR("numCertifiedAccessories"));

      +[HMDLogEventHistograms configurationDataHistogram](HMDLogEventHistograms, "configurationDataHistogram");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "intervalIndexForValue:", objc_msgSend(v7, "totalHAPAccessories"));
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setObject:forKeyedSubscript:", v27, CFSTR("numHAPAccessories"));

      +[HMDLogEventHistograms configurationDataHistogram](HMDLogEventHistograms, "configurationDataHistogram");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "intervalIndexForValue:", objc_msgSend(v7, "totalHAPIPAccessories"));
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setObject:forKeyedSubscript:", v29, CFSTR("numHAPIPAccessories"));

      +[HMDLogEventHistograms configurationDataHistogram](HMDLogEventHistograms, "configurationDataHistogram");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "intervalIndexForValue:", objc_msgSend(v7, "totalHAPBTAccessories"));
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setObject:forKeyedSubscript:", v31, CFSTR("numHAPBTAccessories"));

      +[HMDLogEventHistograms configurationDataHistogram](HMDLogEventHistograms, "configurationDataHistogram");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "intervalIndexForValue:", objc_msgSend(v7, "totalCHIPAccessories"));
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setObject:forKeyedSubscript:", v33, CFSTR("numMatterAccessories"));

      +[HMDLogEventHistograms configurationDataHistogram](HMDLogEventHistograms, "configurationDataHistogram");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v34, "intervalIndexForValue:", objc_msgSend(v7, "totalThreadAccessories"));
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setObject:forKeyedSubscript:", v35, CFSTR("numThreadAccessories"));

      +[HMDLogEventHistograms configurationDataHistogram](HMDLogEventHistograms, "configurationDataHistogram");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v36, "intervalIndexForValue:", objc_msgSend(v7, "totalTelevisionServiceAccessories"));
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setObject:forKeyedSubscript:", v37, CFSTR("numTelevisionServiceAccessories"));

      +[HMDLogEventHistograms configurationDataHistogram](HMDLogEventHistograms, "configurationDataHistogram");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v38, "intervalIndexForValue:", objc_msgSend(v7, "totalBridgedAccessories"));
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setObject:forKeyedSubscript:", v39, CFSTR("numBridgedAccessories"));

      +[HMDLogEventHistograms configurationDataHistogram](HMDLogEventHistograms, "configurationDataHistogram");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v40, "intervalIndexForValue:", objc_msgSend(v7, "totalCameraAccessories"));
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setObject:forKeyedSubscript:", v41, CFSTR("numCameraAccessories"));

      +[HMDLogEventHistograms configurationDataHistogram](HMDLogEventHistograms, "configurationDataHistogram");
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v42, "intervalIndexForValue:", objc_msgSend(v7, "totalCameraAccessoriesRecordingEnabled"));
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setObject:forKeyedSubscript:", v43, CFSTR("numCameraAccessoriesRecordingEnabled"));

      +[HMDLogEventHistograms configurationDataHistogram](HMDLogEventHistograms, "configurationDataHistogram");
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v44, "intervalIndexForValue:", objc_msgSend(v7, "totalScenes"));
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setObject:forKeyedSubscript:", v45, CFSTR("numScenes"));

      +[HMDLogEventHistograms configurationDataHistogram](HMDLogEventHistograms, "configurationDataHistogram");
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v46, "intervalIndexForValue:", objc_msgSend(v7, "totalTriggers"));
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setObject:forKeyedSubscript:", v47, CFSTR("numTriggers"));

      +[HMDLogEventHistograms configurationDataHistogram](HMDLogEventHistograms, "configurationDataHistogram");
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v48, "intervalIndexForValue:", objc_msgSend(v7, "totalActiveTriggers"));
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setObject:forKeyedSubscript:", v49, CFSTR("numActiveTriggers"));

      +[HMDLogEventHistograms configurationDataHistogram](HMDLogEventHistograms, "configurationDataHistogram");
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v50, "intervalIndexForValue:", objc_msgSend(v7, "totalWidgets"));
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setObject:forKeyedSubscript:", v51, CFSTR("numHomeWidgetsEnabled"));

      +[HMDLogEventHistograms configurationDataHistogram](HMDLogEventHistograms, "configurationDataHistogram");
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v52, "intervalIndexForValue:", objc_msgSend(v7, "totalAppleAudioAccessories"));
      v53 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setObject:forKeyedSubscript:", v53, CFSTR("numAppleAudioAccessories"));

      +[HMDLogEventHistograms configurationDataHistogram](HMDLogEventHistograms, "configurationDataHistogram");
      v54 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v54, "intervalIndexForValue:", objc_msgSend(v7, "totalAppleTVAccessories"));
      v55 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setObject:forKeyedSubscript:", v55, CFSTR("numAppleTVAccessories"));

      +[HMDLogEventHistograms configurationDataHistogram](HMDLogEventHistograms, "configurationDataHistogram");
      v56 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v56, "intervalIndexForValue:", objc_msgSend(v7, "totalEnabledResidents"));
      v57 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setObject:forKeyedSubscript:", v57, CFSTR("numEnabledResidents"));

      +[HMDLogEventHistograms configurationDataHistogram](HMDLogEventHistograms, "configurationDataHistogram");
      v58 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v58, "intervalIndexForValue:", objc_msgSend(v7, "totalSmartHomeAccessories"));
      v59 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setObject:forKeyedSubscript:", v59, CFSTR("numSmartHomeAccessories"));

      +[HMDLogEventHistograms configurationDataHistogram](HMDLogEventHistograms, "configurationDataHistogram");
      v60 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v60, "intervalIndexForValue:", objc_msgSend(v7, "totalAppleMediaAccessories"));
      v61 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setObject:forKeyedSubscript:", v61, CFSTR("numAppleMediaAccessories"));

      +[HMDLogEventHistograms configurationDataHistogram](HMDLogEventHistograms, "configurationDataHistogram");
      v62 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v62, "intervalIndexForValue:", objc_msgSend(v7, "totalThirdPartyMediaAccessories"));
      v63 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setObject:forKeyedSubscript:", v63, CFSTR("numThirdPartyMediaAccessories"));

      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v7, "totalUserPrivilegeBitMask"));
      v64 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setObject:forKeyedSubscript:", v64, CFSTR("totalUserPrivilegeBitMask"));

      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(v7, "isTelevisionOnlyConfiguration"));
      v65 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setObject:forKeyedSubscript:", v65, CFSTR("televisionOnlyConfiguration"));

      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(v7, "isMediaOnlyConfiguration"));
      v66 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setObject:forKeyedSubscript:", v66, CFSTR("mediaOnlyConfiguration"));

    }
    v67 = (NSDictionary *)objc_msgSend(v5, "copy");
    v68 = self->_aggregatedHomeDimensions;
    self->_aggregatedHomeDimensions = v67;

    aggregatedHomeDimensions = self->_aggregatedHomeDimensions;
  }
  v69 = aggregatedHomeDimensions;
  os_unfair_lock_unlock(p_lock);
  return v69;
}

- (id)dimensionsForHome:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  _BOOL8 v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;

  v4 = a3;
  os_unfair_lock_lock_with_options();
  -[NSMutableDictionary objectForKeyedSubscript:](self->_homeDimensions, "objectForKeyedSubscript:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v5)
  {
    -[HMDCoreAnalyticsLogEventObserverDelegate dataSource](self, "dataSource");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "cachedHomeConfigurationForHomeUUID:", v4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7)
    {
      objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v7, "homeCategoryBitMask"));
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "setObject:forKeyedSubscript:", v9, CFSTR("homeCategoryBitMask"));

      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v7, "thirdPartyMediaCategoryBitMask"));
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "setObject:forKeyedSubscript:", v10, CFSTR("thirdPartyMediaBitMask"));

      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v7, "appleMediaCategoryBitMask"));
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "setObject:forKeyedSubscript:", v11, CFSTR("appleMediaBitMask"));

      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(v7, "isOwnerUser"));
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "setObject:forKeyedSubscript:", v12, CFSTR("isOwnerUserInHome"));

      v13 = (void *)MEMORY[0x1E0CB37E8];
      v14 = objc_msgSend(v7, "currentUserPrivilege") == 3 || objc_msgSend(v7, "currentUserPrivilege") == 4;
      objc_msgSend(v13, "numberWithInt:", v14);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "setObject:forKeyedSubscript:", v15, CFSTR("isAdminUserInHome"));

      +[HMDLogEventHistograms configurationDataHistogram](HMDLogEventHistograms, "configurationDataHistogram");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "intervalIndexForValue:", objc_msgSend(v7, "numUsers"));
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "setObject:forKeyedSubscript:", v17, CFSTR("numUsersInHome"));

      +[HMDLogEventHistograms configurationDataHistogram](HMDLogEventHistograms, "configurationDataHistogram");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "intervalIndexForValue:", objc_msgSend(v7, "numAdmins"));
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "setObject:forKeyedSubscript:", v19, CFSTR("numAdminUsersInHome"));

      +[HMDLogEventHistograms configurationDataHistogram](HMDLogEventHistograms, "configurationDataHistogram");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "intervalIndexForValue:", objc_msgSend(v7, "numRestrictedGuests"));
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "setObject:forKeyedSubscript:", v21, CFSTR("numRestrictedGuestsInHome"));

      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v7, "currentUserPrivilege"));
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "setObject:forKeyedSubscript:", v22, CFSTR("currentUserPrivilegeInHome"));

      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v7, "userPrivilegeBitMask"));
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "setObject:forKeyedSubscript:", v23, CFSTR("userPrivilegeBitMaskInHome"));

      +[HMDLogEventHistograms configurationDataHistogram](HMDLogEventHistograms, "configurationDataHistogram");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "intervalIndexForValue:", objc_msgSend(v7, "numAccessories"));
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "setObject:forKeyedSubscript:", v25, CFSTR("numAccessoriesInHome"));

      +[HMDLogEventHistograms configurationDataHistogram](HMDLogEventHistograms, "configurationDataHistogram");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "intervalIndexForValue:", objc_msgSend(v7, "numSmartHomeAccessories"));
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "setObject:forKeyedSubscript:", v27, CFSTR("numSmartHomeAccessoriesInHome"));

      +[HMDLogEventHistograms configurationDataHistogram](HMDLogEventHistograms, "configurationDataHistogram");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "intervalIndexForValue:", objc_msgSend(v7, "numAppleMediaAccessories"));
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "setObject:forKeyedSubscript:", v29, CFSTR("numAppleMediaAccessoriesInHome"));

      +[HMDLogEventHistograms configurationDataHistogram](HMDLogEventHistograms, "configurationDataHistogram");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "intervalIndexForValue:", objc_msgSend(v7, "numThirdPartyMediaAccessories"));
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "setObject:forKeyedSubscript:", v31, CFSTR("numThirdPartyMediaAccessoriesInHome"));

      +[HMDLogEventHistograms configurationDataHistogram](HMDLogEventHistograms, "configurationDataHistogram");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "intervalIndexForValue:", objc_msgSend(v7, "numAppleAudioAccessories"));
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "setObject:forKeyedSubscript:", v33, CFSTR("numAppleAudioAccessoriesInHome"));

      +[HMDLogEventHistograms configurationDataHistogram](HMDLogEventHistograms, "configurationDataHistogram");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v34, "intervalIndexForValue:", objc_msgSend(v7, "numAppleTVAccessories"));
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "setObject:forKeyedSubscript:", v35, CFSTR("numAppleTVAccessoriesInHome"));

      +[HMDLogEventHistograms configurationDataHistogram](HMDLogEventHistograms, "configurationDataHistogram");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v36, "intervalIndexForValue:", objc_msgSend(v7, "numHAPAccessories"));
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "setObject:forKeyedSubscript:", v37, CFSTR("numHAPAccessoriesInHome"));

      +[HMDLogEventHistograms configurationDataHistogram](HMDLogEventHistograms, "configurationDataHistogram");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v38, "intervalIndexForValue:", objc_msgSend(v7, "numCHIPAccessories"));
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "setObject:forKeyedSubscript:", v39, CFSTR("numMatterAccessoriesInHome"));

      +[HMDLogEventHistograms configurationDataHistogram](HMDLogEventHistograms, "configurationDataHistogram");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v40, "intervalIndexForValue:", objc_msgSend(v7, "numCameraAccessories"));
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "setObject:forKeyedSubscript:", v41, CFSTR("numCameraAccessoriesInHome"));

      +[HMDLogEventHistograms configurationDataHistogram](HMDLogEventHistograms, "configurationDataHistogram");
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v42, "intervalIndexForValue:", objc_msgSend(v7, "numCameraAccessoriesRecordingEnabled"));
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "setObject:forKeyedSubscript:", v43, CFSTR("numCamerasRecordingEnabledInHome"));

      +[HMDLogEventHistograms configurationDataHistogram](HMDLogEventHistograms, "configurationDataHistogram");
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v44, "intervalIndexForValue:", objc_msgSend(v7, "numConfiguredWidgets"));
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "setObject:forKeyedSubscript:", v45, CFSTR("numWidgetsInHome"));

      +[HMDLogEventHistograms configurationDataHistogram](HMDLogEventHistograms, "configurationDataHistogram");
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v46, "intervalIndexForValue:", objc_msgSend(v7, "numScenes"));
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "setObject:forKeyedSubscript:", v47, CFSTR("numScenesInHome"));

      +[HMDLogEventHistograms configurationDataHistogram](HMDLogEventHistograms, "configurationDataHistogram");
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v48, "intervalIndexForValue:", objc_msgSend(v7, "numTriggers"));
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "setObject:forKeyedSubscript:", v49, CFSTR("numTriggersInHome"));

      +[HMDLogEventHistograms configurationDataHistogram](HMDLogEventHistograms, "configurationDataHistogram");
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v50, "intervalIndexForValue:", objc_msgSend(v7, "numActiveTriggers"));
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "setObject:forKeyedSubscript:", v51, CFSTR("numActiveTriggersInHome"));

      +[HMDLogEventHistograms configurationDataHistogram](HMDLogEventHistograms, "configurationDataHistogram");
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v52, "intervalIndexForValue:", objc_msgSend(v7, "numResidentsEnabled"));
      v53 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "setObject:forKeyedSubscript:", v53, CFSTR("numEnabledResidentsInHome"));

      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v7, "residentElectionBitMask"));
      v54 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "setObject:forKeyedSubscript:", v54, CFSTR("residentElectionBitMask"));

      v5 = (void *)objc_msgSend(v8, "copy");
      -[NSMutableDictionary setObject:forKeyedSubscript:](self->_homeDimensions, "setObject:forKeyedSubscript:", v5, v4);

    }
    else
    {
      v5 = 0;
    }

  }
  os_unfair_lock_unlock(&self->_lock);

  return v5;
}

- (HMDCoreAnalyticsLogEventObserverDelegateDataSource)dataSource
{
  return (HMDCoreAnalyticsLogEventObserverDelegateDataSource *)objc_loadWeakRetained((id *)&self->_dataSource);
}

- (NSMutableDictionary)homeDimensions
{
  return self->_homeDimensions;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_homeDimensions, 0);
  objc_destroyWeak((id *)&self->_dataSource);
  objc_storeStrong((id *)&self->_aggregatedHomeDimensions, 0);
  objc_storeStrong((id *)&self->_deviceCapabilitiesAndEnablementsDimensions, 0);
  objc_storeStrong((id *)&self->_aggregatedHomeCategorizationDimensions, 0);
}

void __63__HMDCoreAnalyticsLogEventObserverDelegate_initWithDataSource___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "configurationChanged");

}

@end
