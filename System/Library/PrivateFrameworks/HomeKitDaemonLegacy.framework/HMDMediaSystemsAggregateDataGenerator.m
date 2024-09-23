@implementation HMDMediaSystemsAggregateDataGenerator

+ (BOOL)isValidLeftDestination:(id)a3 rightDestination:(id)a4
{
  BOOL result;
  id v5;
  id v6;
  unsigned __int8 v7;

  result = 0;
  if (a3)
  {
    if (a4)
    {
      v5 = a3;
      v6 = a4;
      LOBYTE(v5) = objc_msgSend(v5, "supportedOptions");
      v7 = objc_msgSend(v6, "supportedOptions");

      return (v5 & v7 & 0xB0) != 0;
    }
  }
  return result;
}

+ (id)derivedDestinationForGroup:(id)a3 leftDestination:(id)a4 rightDestination:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v20;
  SEL v21;
  id v22;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (!v8)
  {
    _HMFPreconditionFailure();
    goto LABEL_6;
  }
  if (!v9)
  {
LABEL_6:
    _HMFPreconditionFailure();
    goto LABEL_7;
  }
  v11 = v10;
  if (v10)
  {
    v12 = objc_alloc(MEMORY[0x1E0CBA600]);
    objc_msgSend(v8, "identifier");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "derivedMediaDestinationIdentifierForGroupIdentifier:", v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "identifier");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(a1, "deriveSupportedOptionsFromLeftDestination:rightDestination:", v9, v11);
    objc_msgSend(v8, "associatedGroupIdentifier");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = (void *)objc_msgSend(v12, "initWithUniqueIdentifier:parentIdentifier:supportedOptions:audioGroupIdentifier:", v14, v15, v16, v17);

    return v18;
  }
LABEL_7:
  v20 = (void *)_HMFPreconditionFailure();
  return +[HMDMediaSystemsAggregateDataGenerator derivedMediaDestinationIdentifierForGroupIdentifier:](v20, v21, v22);
}

+ (id)derivedMediaDestinationIdentifierForGroupIdentifier:(id)a3
{
  objc_class *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v3 = (objc_class *)MEMORY[0x1E0CB3A28];
  v4 = a3;
  v5 = (void *)objc_msgSend([v3 alloc], "initWithUUIDString:", CFSTR("222AA6C0-21DB-4EE6-8E62-019974477350"));
  v6 = (void *)MEMORY[0x1E0CB3A28];
  objc_msgSend(v4, "UUIDString");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "dataUsingEncoding:", 4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "hmf_UUIDWithNamespace:data:", v5, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

+ (unint64_t)deriveSupportedOptionsFromLeftDestination:(id)a3 rightDestination:(id)a4
{
  id v5;
  int v6;

  v5 = a4;
  LODWORD(a3) = objc_msgSend(a3, "supportedOptions");
  v6 = objc_msgSend(v5, "supportedOptions");

  return a3 & v6 & 0x45;
}

- (id)aggregateDataWithDestinations:(id)a3 controllers:(id)a4 groups:(id)a5
{
  id v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  id v14;
  void *v15;
  id v16;
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
  HMDMediaGroupsAggregateData *v28;
  id v30;
  void *v31;
  uint64_t v32;
  id v33;
  uint64_t v34;
  id obj;
  void *v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  _QWORD v41[2];
  _BYTE v42[128];
  uint64_t v43;

  v43 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v30 = a4;
  v9 = a5;
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v9, "count"));
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = (void *)objc_msgSend(v8, "mutableCopy");
  v37 = 0u;
  v38 = 0u;
  v39 = 0u;
  v40 = 0u;
  obj = v9;
  v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v37, v42, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v38;
    v32 = *(_QWORD *)v38;
    v33 = v8;
    do
    {
      v13 = 0;
      v34 = v11;
      do
      {
        if (*(_QWORD *)v38 != v12)
          objc_enumerationMutation(obj);
        v14 = *(id *)(*((_QWORD *)&v37 + 1) + 8 * v13);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
          v15 = v14;
        else
          v15 = 0;
        v16 = v15;

        if (v16)
        {
          -[HMDMediaSystemsAggregateDataGenerator destinationWithRoleType:mediaSystemData:destinations:](self, "destinationWithRoleType:mediaSystemData:destinations:", 1, v16, v8);
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          -[HMDMediaSystemsAggregateDataGenerator destinationWithRoleType:mediaSystemData:destinations:](self, "destinationWithRoleType:mediaSystemData:destinations:", 2, v16, v8);
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend((id)objc_opt_class(), "isValidLeftDestination:rightDestination:", v17, v18))
          {
            objc_msgSend(v17, "parentIdentifier");
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            v41[0] = v19;
            objc_msgSend(v18, "parentIdentifier");
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            v41[1] = v20;
            objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v41, 2);
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            -[HMDMediaSystemsAggregateDataGenerator roomForAllDestinationParentIdentifiers:](self, "roomForAllDestinationParentIdentifiers:", v21);
            v22 = (void *)objc_claimAutoreleasedReturnValue();

            if (v22)
            {
              v23 = (void *)objc_msgSend(v16, "mutableCopy");
              -[HMDMediaSystemsAggregateDataGenerator nameForMediaSystemData:room:](self, "nameForMediaSystemData:room:", v16, v22);
              v24 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v23, "setName:", v24);

              objc_msgSend(v17, "uniqueIdentifier");
              v25 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v23, "setLeftDestinationIdentifier:", v25);

              objc_msgSend(v18, "uniqueIdentifier");
              v26 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v23, "setRightDestinationIdentifier:", v26);

              objc_msgSend(v36, "addObject:", v23);
              objc_msgSend((id)objc_opt_class(), "derivedDestinationForGroup:leftDestination:rightDestination:", v14, v17, v18);
              v27 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v31, "addObject:", v27);

            }
            v12 = v32;
            v8 = v33;
            v11 = v34;
          }

        }
        else
        {
          objc_msgSend(v36, "addObject:", v14);
        }

        ++v13;
      }
      while (v11 != v13);
      v11 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v37, v42, 16);
    }
    while (v11);
  }

  v28 = -[HMDMediaGroupsAggregateData initWithDestinations:destinationControllersData:groups:]([HMDMediaGroupsAggregateData alloc], "initWithDestinations:destinationControllersData:groups:", v31, v30, v36);
  return v28;
}

- (id)nameForMediaSystemData:(id)a3 room:(id)a4
{
  id v6;
  id v7;
  int v8;
  void *v9;
  void *v10;
  char v11;
  void *v12;
  void *v13;
  HMDMediaSystemsAggregateDataGenerator *v14;
  NSObject *v15;
  void *v16;
  int v18;
  void *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = objc_msgSend(v6, "isDefaultName");
  objc_msgSend(v6, "name");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    objc_msgSend(MEMORY[0x1E0CBA680], "roomNameSentinel");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v9, "isEqual:", v10);

    v12 = v7;
    if ((v11 & 1) == 0)
    {
      v13 = (void *)MEMORY[0x1D17BA0A0](v7);
      v14 = self;
      HMFGetOSLogHandle();
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = 138543362;
        v19 = v16;
        _os_log_impl(&dword_1CD062000, v15, OS_LOG_TYPE_ERROR, "%{public}@Failed to determine default group name", (uint8_t *)&v18, 0xCu);

      }
      objc_autoreleasePoolPop(v13);
      v12 = v6;
    }
    objc_msgSend(v12, "name");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v9;
}

- (id)roomForAllDestinationParentIdentifiers:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  HMDMediaSystemsAggregateDataGenerator *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  HMDMediaSystemsAggregateDataGenerator *v15;
  NSObject *v16;
  void *v17;
  int v19;
  void *v20;
  __int16 v21;
  id v22;
  __int16 v23;
  void *v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[HMDMediaSystemsAggregateDataGenerator dataSource](self, "dataSource");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    objc_msgSend(v5, "roomForAllDestinationParentIdentifiers:mediaSystemsAggregateDataGenerator:", v4, self);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v7;
    if (v7)
    {
      v9 = v7;
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
        v19 = 138543874;
        v20 = v17;
        v21 = 2112;
        v22 = v4;
        v23 = 2112;
        v24 = v6;
        _os_log_impl(&dword_1CD062000, v16, OS_LOG_TYPE_ERROR, "%{public}@Failed to get room for all destination parent identifiers: %@ data source: %@", (uint8_t *)&v19, 0x20u);

      }
      objc_autoreleasePoolPop(v14);
    }

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
      v19 = 138543618;
      v20 = v13;
      v21 = 2112;
      v22 = v4;
      _os_log_impl(&dword_1CD062000, v12, OS_LOG_TYPE_ERROR, "%{public}@Failed to get room for all destination parent identifiers: %@ to no data source", (uint8_t *)&v19, 0x16u);

    }
    objc_autoreleasePoolPop(v10);
    v8 = 0;
  }

  return v8;
}

- (id)destinationWithRoleType:(unint64_t)a3 mediaSystemData:(id)a4 destinations:(id)a5
{
  id v8;
  id v9;
  void *v10;
  _QWORD v12[5];
  id v13;
  unint64_t v14;

  v8 = a4;
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __94__HMDMediaSystemsAggregateDataGenerator_destinationWithRoleType_mediaSystemData_destinations___block_invoke;
  v12[3] = &unk_1E89ADDC0;
  v13 = v8;
  v14 = a3;
  v12[4] = self;
  v9 = v8;
  objc_msgSend(a5, "na_firstObjectPassingTest:", v12);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (BOOL)hasRoleType:(unint64_t)a3 mediaSystemData:(id)a4 destination:(id)a5
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  uint64_t v11;
  char v12;
  void *v13;
  void *v14;

  v7 = a4;
  v8 = a5;
  if (a3 == 2)
  {
    objc_msgSend(v7, "rightDestinationIdentifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "uniqueIdentifier");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v9, "hmf_isEqualToUUID:", v10) & 1) == 0)
    {
      objc_msgSend(v7, "rightDestinationIdentifier");
      v11 = objc_claimAutoreleasedReturnValue();
      goto LABEL_9;
    }
LABEL_6:
    v12 = 1;
LABEL_10:

    goto LABEL_11;
  }
  if (a3 == 1)
  {
    objc_msgSend(v7, "leftDestinationIdentifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "uniqueIdentifier");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v9, "hmf_isEqualToUUID:", v10) & 1) == 0)
    {
      objc_msgSend(v7, "leftDestinationIdentifier");
      v11 = objc_claimAutoreleasedReturnValue();
LABEL_9:
      v13 = (void *)v11;
      objc_msgSend(v8, "parentIdentifier");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v13, "hmf_isEqualToUUID:", v14);

      goto LABEL_10;
    }
    goto LABEL_6;
  }
  v12 = 0;
LABEL_11:

  return v12;
}

- (HMDMediaSystemsAggregateDataGeneratorDataSource)dataSource
{
  return (HMDMediaSystemsAggregateDataGeneratorDataSource *)objc_loadWeakRetained((id *)&self->_dataSource);
}

- (void)setDataSource:(id)a3
{
  objc_storeWeak((id *)&self->_dataSource, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_dataSource);
}

uint64_t __94__HMDMediaSystemsAggregateDataGenerator_destinationWithRoleType_mediaSystemData_destinations___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  int v4;
  int v5;
  void *v6;
  void *v7;

  v3 = a2;
  v4 = objc_msgSend(v3, "containsMediaSystemSupportedOptions");
  v5 = objc_msgSend(*(id *)(a1 + 32), "hasRoleType:mediaSystemData:destination:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 40), v3);
  objc_msgSend(v3, "audioGroupIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 40), "identifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v3) = objc_msgSend(v6, "hmf_isEqualToUUID:", v7);

  return v4 & v5 & v3;
}

@end
