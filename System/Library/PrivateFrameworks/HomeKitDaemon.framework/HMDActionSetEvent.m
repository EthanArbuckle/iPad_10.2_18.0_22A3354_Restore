@implementation HMDActionSetEvent

- (id)biomeEventsRepresentationForLogObserver:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  objc_class *v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  uint64_t v16;
  _BOOL8 v17;
  unint64_t v18;
  __CFString *v19;
  void *v20;
  HMDActionSetEvent *v21;
  NSObject *v22;
  void *v23;
  void *v24;
  __CFString *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  id v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v41;
  void *v42;
  id v43;
  void *v44;
  uint8_t buf[4];
  void *v46;
  uint64_t v47;

  v47 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[HMDActionSetEvent home](self, "home");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    v42 = v5;
    v43 = v4;
    if (self)
    {
      v7 = (objc_class *)MEMORY[0x24BDD1508];
      v8 = v5;
      v9 = [v7 alloc];
      -[HMMDatedHomeLogEvent startDate](self, "startDate");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMMDatedHomeLogEvent endDate](self, "endDate");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = (void *)objc_msgSend(v9, "initWithStartDate:endDate:", v10, v11);

      v13 = objc_alloc(MEMORY[0x24BE0CBB0]);
      objc_msgSend(v8, "spiClientIdentifier");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "UUIDString");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = objc_msgSend(v8, "atHomeLevel");

      v17 = (v16 & 0xFFFFFFFFFFFFFFFELL) == 2;
      v18 = -[HMDActionSetEvent triggerSource](self, "triggerSource");
      if (v18 > 9)
        v19 = CFSTR("Unknown");
      else
        v19 = off_24E780100[v18];
      v25 = v19;
      -[HMDActionSetEvent bundleId](self, "bundleId");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMDActionSetEvent clientMetricIdentifier](self, "clientMetricIdentifier");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      if (v27)
      {
        v28 = (void *)objc_msgSend(v13, "initWithDateInterval:homeUniqueIdentifier:homeOccupancy:source:clientName:eventCorrelationIdentifier:", v12, v15, v17, v25, v26, v27);
      }
      else
      {
        objc_msgSend(MEMORY[0x24BDD1880], "UUID");
        v41 = v14;
        v29 = v12;
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v30, "UUIDString");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        v28 = (void *)objc_msgSend(v13, "initWithDateInterval:homeUniqueIdentifier:homeOccupancy:source:clientName:eventCorrelationIdentifier:", v29, v15, v17, v25, v26, v31);

        v12 = v29;
        v14 = v41;
      }

    }
    else
    {
      v28 = 0;
    }
    v32 = objc_alloc(MEMORY[0x24BE0CBA0]);
    -[HMDActionSetEvent actionSetUniqueIdentifier](self, "actionSetUniqueIdentifier");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "UUIDString");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDActionSetEvent actionSetType](self, "actionSetType");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDActionSetEvent accessoryUniqueIdentifiers](self, "accessoryUniqueIdentifiers");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDActionSetEvent actionSetName](self, "actionSetName");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v42;
    objc_msgSend(v42, "name");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    v39 = (void *)objc_msgSend(v32, "initWithBase:actionSetUniqueIdentifier:actionSetType:associatedAccessoryUniqueIdentifiers:actionSetName:homeName:", v28, v34, v35, v36, v37, v38);
    v44 = v39;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v44, 1);
    v24 = (void *)objc_claimAutoreleasedReturnValue();

    v4 = v43;
  }
  else
  {
    v20 = (void *)MEMORY[0x227676638]();
    v21 = self;
    HMFGetOSLogHandle();
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v46 = v23;
      _os_log_impl(&dword_2218F0000, v22, OS_LOG_TYPE_ERROR, "%{public}@Unable to log action set event metadata to biome, no home", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v20);
    v24 = (void *)MEMORY[0x24BDBD1A8];
  }

  return v24;
}

- (id)microLocationMetadataForLogEventObserver:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  __CFString *v9;
  unint64_t v10;
  __CFString *v11;
  const __CFString *v12;
  __CFString *v13;
  void *v14;
  void *v15;

  v4 = (void *)MEMORY[0x24BE66930];
  -[HMDActionSetEvent actionSetUniqueIdentifier](self, "actionSetUniqueIdentifier", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "UUIDString");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDActionSetEvent actionSetName](self, "actionSetName");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDActionSetEvent actionSetType](self, "actionSetType");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDActionSetEvent bundleId](self, "bundleId");
  v9 = (__CFString *)objc_claimAutoreleasedReturnValue();
  v10 = -[HMDActionSetEvent triggerSource](self, "triggerSource");
  if (v10 > 9)
    v11 = CFSTR("Unknown");
  else
    v11 = off_24E780100[v10];
  if (v9)
    v12 = v9;
  else
    v12 = CFSTR("Unknown");
  v13 = v11;
  -[HMDActionSetEvent homeName](self, "homeName");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "metadataForHomekitActionSetEventWithUUID:name:type:clientName:source:homeName:", v6, v7, v8, v12, v13, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
}

- (BOOL)shouldTriggerMicroLocationLocalizationScanForLogEventObserver:(id)a3
{
  unsigned int v4;
  unsigned int v5;
  unint64_t v6;

  v4 = -[HMDActionSetEvent numAccessoriesInHome](self, "numAccessoriesInHome", a3);
  v5 = -[HMDActionSetEvent numNonEmptyScenesInHome](self, "numNonEmptyScenesInHome");
  v6 = -[HMDActionSetEvent triggerSource](self, "triggerSource");
  if (v5 + (unint64_t)v4 > 3)
    return (v6 < 7) & (0x67u >> v6);
  else
    return 0;
}

- (BOOL)shouldTriggerMicroLocationRecordingScanForLogEventObserver:(id)a3
{
  unsigned int v4;
  unsigned int v5;
  unint64_t v6;

  v4 = -[HMDActionSetEvent numAccessoriesInHome](self, "numAccessoriesInHome", a3);
  v5 = -[HMDActionSetEvent numNonEmptyScenesInHome](self, "numNonEmptyScenesInHome");
  v6 = -[HMDActionSetEvent triggerSource](self, "triggerSource");
  if (v5 + (unint64_t)v4 > 3)
    return (v6 < 7) & (0x67u >> v6);
  else
    return 0;
}

- (unint64_t)microLocationScanTriggerTypeForLogEventObserver:(id)a3
{
  return 2;
}

- (HMDActionSetEvent)initWithActionSet:(id)a3 source:(unint64_t)a4 numAccessories:(unsigned int)a5 bundleId:(id)a6 transactionId:(id)a7
{
  id v12;
  id v13;
  id v14;
  void *v15;
  void *v16;
  HMDActionSetEvent *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  NSString *clientMetricIdentifier;
  void *v22;
  uint64_t v23;
  NSUUID *actionSetUUID;
  void *v25;
  uint64_t v26;
  NSUUID *actionSetUniqueIdentifier;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  uint64_t v32;
  NSString *bundleId;
  uint64_t v34;
  NSUUID *transactionId;
  void *v36;
  uint64_t v37;
  NSString *serializedIdentifier;
  void *v39;
  uint64_t v40;
  NSString *actionSetName;
  void *v42;
  uint64_t v43;
  NSString *actionSetType;
  void *v45;
  uint64_t v46;
  NSString *homeName;
  void *v48;
  uint64_t v49;
  NSArray *accessoryUUIDs;
  void *v51;
  uint64_t v52;
  NSArray *accessoryUniqueIdentifiers;
  objc_super v55;

  v12 = a3;
  v13 = a6;
  v14 = a7;
  objc_msgSend(v12, "home");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "uuid");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v55.receiver = self;
  v55.super_class = (Class)HMDActionSetEvent;
  v17 = -[HMMDatedHomeLogEvent initWithHomeUUID:](&v55, sel_initWithHomeUUID_, v16);

  if (v17)
  {
    objc_msgSend(v12, "home");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BE3F138], "currentActivity");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "clientMetricIdentifier");
    v20 = objc_claimAutoreleasedReturnValue();
    clientMetricIdentifier = v17->_clientMetricIdentifier;
    v17->_clientMetricIdentifier = (NSString *)v20;

    objc_msgSend(v12, "uuid");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = objc_msgSend(v22, "copy");
    actionSetUUID = v17->_actionSetUUID;
    v17->_actionSetUUID = (NSUUID *)v23;

    objc_msgSend(v12, "spiClientIdentifier");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = objc_msgSend(v25, "copy");
    actionSetUniqueIdentifier = v17->_actionSetUniqueIdentifier;
    v17->_actionSetUniqueIdentifier = (NSUUID *)v26;

    v17->_numAccessoriesModified = a5;
    objc_msgSend(v18, "accessories");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v17->_numAccessoriesInHome = objc_msgSend(v28, "count");

    objc_msgSend(v18, "actionSets");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = (void *)objc_msgSend(v29, "copy");

    objc_msgSend(v30, "na_filter:", &__block_literal_global_116837);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v17->_numNonEmptyScenesInHome = objc_msgSend(v31, "count");

    v17->_triggerSource = a4;
    v32 = objc_msgSend(v13, "copy");
    bundleId = v17->_bundleId;
    v17->_bundleId = (NSString *)v32;

    v34 = objc_msgSend(v14, "copy");
    transactionId = v17->_transactionId;
    v17->_transactionId = (NSUUID *)v34;

    objc_msgSend(v12, "serializedIdentifier");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    v37 = objc_msgSend(v36, "copy");
    serializedIdentifier = v17->_serializedIdentifier;
    v17->_serializedIdentifier = (NSString *)v37;

    objc_msgSend(v12, "name");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    v40 = objc_msgSend(v39, "copy");
    actionSetName = v17->_actionSetName;
    v17->_actionSetName = (NSString *)v40;

    objc_msgSend(v12, "type");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    v43 = objc_msgSend(v42, "copy");
    actionSetType = v17->_actionSetType;
    v17->_actionSetType = (NSString *)v43;

    objc_storeWeak((id *)&v17->_home, v18);
    objc_msgSend(v18, "name");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    v46 = objc_msgSend(v45, "copy");
    homeName = v17->_homeName;
    v17->_homeName = (NSString *)v46;

    objc_msgSend(v12, "associatedAccessories");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v48, "na_map:", &__block_literal_global_2_116838);
    v49 = objc_claimAutoreleasedReturnValue();
    accessoryUUIDs = v17->_accessoryUUIDs;
    v17->_accessoryUUIDs = (NSArray *)v49;

    objc_msgSend(v12, "associatedAccessories");
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v51, "na_map:", &__block_literal_global_3_116839);
    v52 = objc_claimAutoreleasedReturnValue();
    accessoryUniqueIdentifiers = v17->_accessoryUniqueIdentifiers;
    v17->_accessoryUniqueIdentifiers = (NSArray *)v52;

  }
  return v17;
}

- (unint64_t)triggerSource
{
  return self->_triggerSource;
}

- (NSUUID)actionSetUUID
{
  return self->_actionSetUUID;
}

- (NSUUID)actionSetUniqueIdentifier
{
  return self->_actionSetUniqueIdentifier;
}

- (NSString)bundleId
{
  return self->_bundleId;
}

- (NSUUID)transactionId
{
  return self->_transactionId;
}

- (NSString)clientMetricIdentifier
{
  return self->_clientMetricIdentifier;
}

- (unsigned)numAccessoriesModified
{
  return self->_numAccessoriesModified;
}

- (unsigned)numAccessoriesInHome
{
  return self->_numAccessoriesInHome;
}

- (unsigned)numNonEmptyScenesInHome
{
  return self->_numNonEmptyScenesInHome;
}

- (NSString)serializedIdentifier
{
  return self->_serializedIdentifier;
}

- (NSString)actionSetName
{
  return self->_actionSetName;
}

- (NSString)actionSetType
{
  return self->_actionSetType;
}

- (HMDHome)home
{
  return (HMDHome *)objc_loadWeakRetained((id *)&self->_home);
}

- (NSString)homeName
{
  return (NSString *)objc_getProperty(self, a2, 168, 1);
}

- (NSArray)accessoryUUIDs
{
  return self->_accessoryUUIDs;
}

- (NSArray)accessoryUniqueIdentifiers
{
  return self->_accessoryUniqueIdentifiers;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_accessoryUniqueIdentifiers, 0);
  objc_storeStrong((id *)&self->_accessoryUUIDs, 0);
  objc_storeStrong((id *)&self->_homeName, 0);
  objc_destroyWeak((id *)&self->_home);
  objc_storeStrong((id *)&self->_actionSetType, 0);
  objc_storeStrong((id *)&self->_actionSetName, 0);
  objc_storeStrong((id *)&self->_serializedIdentifier, 0);
  objc_storeStrong((id *)&self->_clientMetricIdentifier, 0);
  objc_storeStrong((id *)&self->_transactionId, 0);
  objc_storeStrong((id *)&self->_bundleId, 0);
  objc_storeStrong((id *)&self->_actionSetUniqueIdentifier, 0);
  objc_storeStrong((id *)&self->_actionSetUUID, 0);
}

id __84__HMDActionSetEvent_initWithActionSet_source_numAccessories_bundleId_transactionId___block_invoke_3(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;

  objc_msgSend(a2, "spiClientIdentifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "UUIDString");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

id __84__HMDActionSetEvent_initWithActionSet_source_numAccessories_bundleId_transactionId___block_invoke_2(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;

  objc_msgSend(a2, "uuid");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "UUIDString");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

BOOL __84__HMDActionSetEvent_initWithActionSet_source_numAccessories_bundleId_transactionId___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  _BOOL8 v3;

  objc_msgSend(a2, "actions");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "count") != 0;

  return v3;
}

@end
