@implementation HMDMediaGroupsAggregateData

- (HMDMediaGroupsAggregateData)initWithDestinations:(id)a3 destinationControllersData:(id)a4 groups:(id)a5
{
  id v8;
  id v9;
  id v10;
  HMDMediaGroupsAggregateData *v11;
  uint64_t v12;
  NSArray *destinations;
  uint64_t v14;
  NSArray *destinationControllersData;
  uint64_t v16;
  NSArray *groups;
  objc_super v19;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v19.receiver = self;
  v19.super_class = (Class)HMDMediaGroupsAggregateData;
  v11 = -[HMDMediaGroupsAggregateData init](&v19, sel_init);
  if (v11)
  {
    v12 = objc_msgSend(v8, "copy");
    destinations = v11->_destinations;
    v11->_destinations = (NSArray *)v12;

    v14 = objc_msgSend(v9, "copy");
    destinationControllersData = v11->_destinationControllersData;
    v11->_destinationControllersData = (NSArray *)v14;

    v16 = objc_msgSend(v10, "copy");
    groups = v11->_groups;
    v11->_groups = (NSArray *)v16;

  }
  return v11;
}

- (HMDMediaGroupsAggregateData)initWithDestinations:(id)a3 destinationControllersData:(id)a4
{
  return -[HMDMediaGroupsAggregateData initWithDestinations:destinationControllersData:groups:](self, "initWithDestinations:destinationControllersData:groups:", a3, a4, MEMORY[0x24BDBD1A8]);
}

- (id)groupWithIdentifier:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  _QWORD v9[4];
  id v10;

  v4 = a3;
  -[HMDMediaGroupsAggregateData groups](self, "groups");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __51__HMDMediaGroupsAggregateData_groupWithIdentifier___block_invoke;
  v9[3] = &unk_24E7885B0;
  v10 = v4;
  v6 = v4;
  objc_msgSend(v5, "na_firstObjectPassingTest:", v9);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (HMDMediaGroupsAggregateData)initWithProtoBufferData:(id)a3
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
  HMDMediaGroupsAggregateData *v13;
  HMDMediaGroupsAggregateData *v14;
  void *v15;
  NSObject *v16;
  void *v17;
  int v19;
  void *v20;
  __int16 v21;
  id v22;
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD77A0]), "initWithData:", v4);
  v6 = v5;
  if (v5)
  {
    objc_msgSend(v5, "destinations");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDMediaGroupsAggregateData decodeDestinationsWithEncodedDestinations:](self, "decodeDestinationsWithEncodedDestinations:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v6, "destinationControllerDatas");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDMediaGroupsAggregateData decodeDestinationControllersWithEncodedDestinationControllers:](self, "decodeDestinationControllersWithEncodedDestinationControllers:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v6, "groups");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDMediaGroupsAggregateData decodeMediaGroupsWithEncodedMediaGroups:](self, "decodeMediaGroupsWithEncodedMediaGroups:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    v13 = -[HMDMediaGroupsAggregateData initWithDestinations:destinationControllersData:groups:](self, "initWithDestinations:destinationControllersData:groups:", v8, v10, v12);
    v14 = v13;
  }
  else
  {
    v15 = (void *)MEMORY[0x227676638]();
    v13 = self;
    HMFGetOSLogHandle();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = 138543618;
      v20 = v17;
      v21 = 2112;
      v22 = v4;
      _os_log_impl(&dword_2218F0000, v16, OS_LOG_TYPE_ERROR, "%{public}@Failed to decode event data: %@", (uint8_t *)&v19, 0x16u);

    }
    objc_autoreleasePoolPop(v15);
    v14 = 0;
  }

  return v14;
}

- (id)decodeDestinationsWithEncodedDestinations:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  char v9;
  id v10;
  void *v11;
  HMDMediaGroupsAggregateData *v12;
  NSObject *v13;
  void *v14;
  int v16;
  void *v17;
  __int16 v18;
  id v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(v4, "na_map:", &__block_literal_global_75381);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "count");
  if (v6 == objc_msgSend(v4, "count"))
  {
    if (objc_msgSend(v5, "count") == 1
      && (objc_msgSend(v5, "firstObject"),
          v7 = (void *)objc_claimAutoreleasedReturnValue(),
          -[HMDMediaGroupsAggregateData sentinelDestination](self, "sentinelDestination"),
          v8 = (void *)objc_claimAutoreleasedReturnValue(),
          v9 = objc_msgSend(v7, "isEqual:", v8),
          v8,
          v7,
          (v9 & 1) != 0))
    {
      v10 = (id)MEMORY[0x24BDBD1A8];
    }
    else
    {
      v10 = v5;
    }
  }
  else
  {
    v11 = (void *)MEMORY[0x227676638]();
    v12 = self;
    HMFGetOSLogHandle();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = 138543618;
      v17 = v14;
      v18 = 2112;
      v19 = v4;
      _os_log_impl(&dword_2218F0000, v13, OS_LOG_TYPE_ERROR, "%{public}@Failed to decode destinations in proto data: %@", (uint8_t *)&v16, 0x16u);

    }
    objc_autoreleasePoolPop(v11);
    v10 = 0;
  }

  return v10;
}

- (id)decodeDestinationControllersWithEncodedDestinationControllers:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  char v9;
  id v10;
  void *v11;
  HMDMediaGroupsAggregateData *v12;
  NSObject *v13;
  void *v14;
  int v16;
  void *v17;
  __int16 v18;
  id v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(v4, "na_map:", &__block_literal_global_5);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "count");
  if (v6 == objc_msgSend(v4, "count"))
  {
    if (objc_msgSend(v5, "count") == 1
      && (objc_msgSend(v5, "firstObject"),
          v7 = (void *)objc_claimAutoreleasedReturnValue(),
          -[HMDMediaGroupsAggregateData sentinelDestinationControllerData](self, "sentinelDestinationControllerData"),
          v8 = (void *)objc_claimAutoreleasedReturnValue(),
          v9 = objc_msgSend(v7, "isEqual:", v8),
          v8,
          v7,
          (v9 & 1) != 0))
    {
      v10 = (id)MEMORY[0x24BDBD1A8];
    }
    else
    {
      v10 = v5;
    }
  }
  else
  {
    v11 = (void *)MEMORY[0x227676638]();
    v12 = self;
    HMFGetOSLogHandle();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = 138543618;
      v17 = v14;
      v18 = 2112;
      v19 = v4;
      _os_log_impl(&dword_2218F0000, v13, OS_LOG_TYPE_ERROR, "%{public}@Failed to decode destination controllers data in proto data: %@", (uint8_t *)&v16, 0x16u);

    }
    objc_autoreleasePoolPop(v11);
    v10 = 0;
  }

  return v10;
}

- (id)decodeMediaGroupsWithEncodedMediaGroups:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  char v7;
  id v8;

  objc_msgSend(a3, "na_map:", &__block_literal_global_8);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "count") == 1
    && (objc_msgSend(v4, "firstObject"),
        v5 = (void *)objc_claimAutoreleasedReturnValue(),
        -[HMDMediaGroupsAggregateData sentinelGroup](self, "sentinelGroup"),
        v6 = (void *)objc_claimAutoreleasedReturnValue(),
        v7 = objc_msgSend(v5, "isEqual:", v6),
        v6,
        v5,
        (v7 & 1) != 0))
  {
    v8 = (id)MEMORY[0x24BDBD1A8];
  }
  else
  {
    v8 = v4;
  }

  return v8;
}

- (id)encodeToProtoBufferData
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v3 = objc_alloc_init(MEMORY[0x24BDD77A0]);
  -[HMDMediaGroupsAggregateData encodedDestinationEvents](self, "encodedDestinationEvents");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v4, "mutableCopy");
  objc_msgSend(v3, "setDestinations:", v5);

  -[HMDMediaGroupsAggregateData encodedDestinationControllerEvents](self, "encodedDestinationControllerEvents");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v6, "mutableCopy");
  objc_msgSend(v3, "setDestinationControllerDatas:", v7);

  -[HMDMediaGroupsAggregateData encodedMediaGroupEvents](self, "encodedMediaGroupEvents");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v8, "mutableCopy");
  objc_msgSend(v3, "setGroups:", v9);

  objc_msgSend(v3, "data");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (id)encodedDestinationEvents
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x24BDAC8D0];
  -[HMDMediaGroupsAggregateData destinations](self, "destinations");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count");

  if (v4)
  {
    -[HMDMediaGroupsAggregateData destinations](self, "destinations");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "na_map:", &__block_literal_global_13_75375);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[HMDMediaGroupsAggregateData sentinelDestination](self, "sentinelDestination");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_alloc(MEMORY[0x24BDD7798]);
    objc_msgSend(v5, "encodeToProtoBufferData");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (void *)objc_msgSend(v7, "initWithData:", v8);
    v11[0] = v9;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v11, 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v6;
}

- (id)encodedDestinationControllerEvents
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x24BDAC8D0];
  -[HMDMediaGroupsAggregateData destinationControllersData](self, "destinationControllersData");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count");

  if (v4)
  {
    -[HMDMediaGroupsAggregateData destinationControllersData](self, "destinationControllersData");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "na_map:", &__block_literal_global_16_75372);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[HMDMediaGroupsAggregateData sentinelDestinationControllerData](self, "sentinelDestinationControllerData");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_alloc(MEMORY[0x24BDD77A8]);
    objc_msgSend(v5, "encodeToProtoBufferData");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (void *)objc_msgSend(v7, "initWithData:", v8);
    v11[0] = v9;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v11, 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v6;
}

- (id)encodedMediaGroupEvents
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  _QWORD v26[2];

  v26[1] = *MEMORY[0x24BDAC8D0];
  -[HMDMediaGroupsAggregateData groups](self, "groups");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count");

  if (v4)
  {
    v5 = (void *)MEMORY[0x24BDBCEB8];
    -[HMDMediaGroupsAggregateData groups](self, "groups");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "arrayWithCapacity:", objc_msgSend(v6, "count"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    v23 = 0u;
    v24 = 0u;
    v21 = 0u;
    v22 = 0u;
    -[HMDMediaGroupsAggregateData groups](self, "groups", 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v22;
      do
      {
        for (i = 0; i != v10; ++i)
        {
          if (*(_QWORD *)v22 != v11)
            objc_enumerationMutation(v8);
          v13 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * i);
          v14 = objc_alloc(MEMORY[0x24BDD77B0]);
          objc_msgSend(v13, "encodeToProtoBufferData");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          v16 = (void *)objc_msgSend(v14, "initWithData:", v15);

          if (v16)
            objc_msgSend(v7, "addObject:", v16);

        }
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
      }
      while (v10);
    }
  }
  else
  {
    -[HMDMediaGroupsAggregateData sentinelGroup](self, "sentinelGroup");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_alloc(MEMORY[0x24BDD77B0]);
    objc_msgSend(v8, "encodeToProtoBufferData");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = (void *)objc_msgSend(v17, "initWithData:", v18);

    v26[0] = v19;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v26, 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v7;
}

- (id)sentinelIdentifier
{
  return (id)objc_msgSend(objc_alloc(MEMORY[0x24BDD1880]), "initWithUUIDString:", CFSTR("00000000-0000-0000-0000-000000000000"));
}

- (id)sentinelDestinationControllerData
{
  void *v2;
  id v3;
  void *v4;

  -[HMDMediaGroupsAggregateData sentinelIdentifier](self, "sentinelIdentifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_alloc(MEMORY[0x24BDD7788]);
  v4 = (void *)objc_msgSend(v3, "initWithIdentifier:parentIdentifier:destinationIdentifier:supportedOptions:availableDestinationIdentifiers:", v2, v2, 0, 0, MEMORY[0x24BDBD1A8]);

  return v4;
}

- (id)sentinelDestination
{
  void *v2;
  void *v3;

  -[HMDMediaGroupsAggregateData sentinelIdentifier](self, "sentinelIdentifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD7780]), "initWithUniqueIdentifier:parentIdentifier:supportedOptions:", v2, v2, 0);

  return v3;
}

- (id)sentinelGroup
{
  void *v2;
  id v3;
  void *v4;

  -[HMDMediaGroupsAggregateData sentinelIdentifier](self, "sentinelIdentifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_alloc(MEMORY[0x24BDD7790]);
  v4 = (void *)objc_msgSend(v3, "initWithIdentifier:parentIdentifier:name:defaultName:destinationIdentifiers:associatedGroupIdentifier:", v2, v2, &stru_24E79DB48, 0, MEMORY[0x24BDBD1A8], 0);

  return v4;
}

- (BOOL)isEqual:(id)a3
{
  HMDMediaGroupsAggregateData *v4;
  HMDMediaGroupsAggregateData *v5;
  HMDMediaGroupsAggregateData *v6;
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
  char v23;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;

  v4 = (HMDMediaGroupsAggregateData *)a3;
  if (v4 == self)
  {
    v23 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v5 = v4;
    else
      v5 = 0;
    v6 = v5;
    if (v6)
    {
      v7 = (void *)MEMORY[0x24BDBCF20];
      -[HMDMediaGroupsAggregateData destinations](self, "destinations");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setWithArray:", v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = (void *)MEMORY[0x24BDBCF20];
      -[HMDMediaGroupsAggregateData destinations](v6, "destinations");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "setWithArray:", v11);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v9, "isEqualToSet:", v12))
      {
        v28 = v8;
        v13 = (void *)MEMORY[0x24BDBCF20];
        -[HMDMediaGroupsAggregateData destinationControllersData](self, "destinationControllersData");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "setWithArray:", v14);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = (void *)MEMORY[0x24BDBCF20];
        -[HMDMediaGroupsAggregateData destinationControllersData](v6, "destinationControllersData");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "setWithArray:");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v29 = v15;
        if (objc_msgSend(v15, "isEqualToSet:", v17))
        {
          v26 = v14;
          v18 = (void *)MEMORY[0x24BDBCF20];
          -[HMDMediaGroupsAggregateData groups](self, "groups");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v18, "setWithArray:", v25);
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          v20 = (void *)MEMORY[0x24BDBCF20];
          -[HMDMediaGroupsAggregateData groups](v6, "groups");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v20, "setWithArray:", v21);
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          v23 = objc_msgSend(v19, "isEqualToSet:", v22);

          v14 = v26;
        }
        else
        {
          v23 = 0;
        }

        v8 = v28;
      }
      else
      {
        v23 = 0;
      }

    }
    else
    {
      v23 = 0;
    }

  }
  return v23;
}

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  unint64_t v7;
  _QWORD v9[5];
  _QWORD v10[5];
  _QWORD v11[5];
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t v15;

  v12 = 0;
  v13 = &v12;
  v14 = 0x2020000000;
  v15 = 0;
  -[HMDMediaGroupsAggregateData destinations](self, "destinations");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = MEMORY[0x24BDAC760];
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __35__HMDMediaGroupsAggregateData_hash__block_invoke;
  v11[3] = &unk_24E780458;
  v11[4] = &v12;
  objc_msgSend(v3, "na_each:", v11);

  -[HMDMediaGroupsAggregateData destinationControllersData](self, "destinationControllersData");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = v4;
  v10[1] = 3221225472;
  v10[2] = __35__HMDMediaGroupsAggregateData_hash__block_invoke_2;
  v10[3] = &unk_24E780480;
  v10[4] = &v12;
  objc_msgSend(v5, "na_each:", v10);

  -[HMDMediaGroupsAggregateData groups](self, "groups");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = v4;
  v9[1] = 3221225472;
  v9[2] = __35__HMDMediaGroupsAggregateData_hash__block_invoke_3;
  v9[3] = &unk_24E7804A8;
  v9[4] = &v12;
  objc_msgSend(v6, "na_each:", v9);

  v7 = v13[3];
  _Block_object_dispose(&v12, 8);
  return v7;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = (void *)MEMORY[0x24BDD17C8];
  -[HMDMediaGroupsAggregateData destinations](self, "destinations");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDMediaGroupsAggregateData destinationControllersData](self, "destinationControllersData");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDMediaGroupsAggregateData groups](self, "groups");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<HMDMediaGroupsAggregateData destinations: %@ destinationControllerDatas: %@ groups: %@>"), v4, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  HMDMutableMediaGroupsAggregateData *v4;
  void *v5;
  void *v6;
  void *v7;
  HMDMutableMediaGroupsAggregateData *v8;

  v4 = [HMDMutableMediaGroupsAggregateData alloc];
  -[HMDMediaGroupsAggregateData destinations](self, "destinations");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDMediaGroupsAggregateData destinationControllersData](self, "destinationControllersData");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDMediaGroupsAggregateData groups](self, "groups");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[HMDMediaGroupsAggregateData initWithDestinations:destinationControllersData:groups:](v4, "initWithDestinations:destinationControllersData:groups:", v5, v6, v7);

  return v8;
}

- (NSArray)destinations
{
  return (NSArray *)objc_getProperty(self, a2, 8, 1);
}

- (void)setDestinations:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 8);
}

- (NSArray)destinationControllersData
{
  return (NSArray *)objc_getProperty(self, a2, 16, 1);
}

- (void)setDestinationControllersData:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 16);
}

- (NSArray)groups
{
  return (NSArray *)objc_getProperty(self, a2, 24, 1);
}

- (void)setGroups:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 24);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_groups, 0);
  objc_storeStrong((id *)&self->_destinationControllersData, 0);
  objc_storeStrong((id *)&self->_destinations, 0);
}

uint64_t __35__HMDMediaGroupsAggregateData_hash__block_invoke(uint64_t a1, void *a2)
{
  uint64_t result;

  result = objc_msgSend(a2, "hash");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) ^= result;
  return result;
}

uint64_t __35__HMDMediaGroupsAggregateData_hash__block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t result;

  result = objc_msgSend(a2, "hash");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) ^= result;
  return result;
}

uint64_t __35__HMDMediaGroupsAggregateData_hash__block_invoke_3(uint64_t a1, void *a2)
{
  uint64_t result;

  result = objc_msgSend(a2, "hash");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) ^= result;
  return result;
}

id __65__HMDMediaGroupsAggregateData_encodedDestinationControllerEvents__block_invoke(uint64_t a1, void *a2)
{
  objc_class *v2;
  id v3;
  id v4;
  void *v5;
  void *v6;

  v2 = (objc_class *)MEMORY[0x24BDD77A8];
  v3 = a2;
  v4 = [v2 alloc];
  objc_msgSend(v3, "encodeToProtoBufferData");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = (void *)objc_msgSend(v4, "initWithData:", v5);
  return v6;
}

id __55__HMDMediaGroupsAggregateData_encodedDestinationEvents__block_invoke(uint64_t a1, void *a2)
{
  objc_class *v2;
  id v3;
  id v4;
  void *v5;
  void *v6;

  v2 = (objc_class *)MEMORY[0x24BDD7798];
  v3 = a2;
  v4 = [v2 alloc];
  objc_msgSend(v3, "encodeToProtoBufferData");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = (void *)objc_msgSend(v4, "initWithData:", v5);
  return v6;
}

id __71__HMDMediaGroupsAggregateData_decodeMediaGroupsWithEncodedMediaGroups___block_invoke(uint64_t a1, void *a2)
{
  objc_class *v2;
  id v3;
  id v4;
  void *v5;
  void *v6;

  v2 = (objc_class *)MEMORY[0x24BDD7790];
  v3 = a2;
  v4 = [v2 alloc];
  objc_msgSend(v3, "data");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = (void *)objc_msgSend(v4, "initWithProtoBufferData:", v5);
  return v6;
}

id __93__HMDMediaGroupsAggregateData_decodeDestinationControllersWithEncodedDestinationControllers___block_invoke(uint64_t a1, void *a2)
{
  objc_class *v2;
  id v3;
  id v4;
  void *v5;
  void *v6;

  v2 = (objc_class *)MEMORY[0x24BDD7788];
  v3 = a2;
  v4 = [v2 alloc];
  objc_msgSend(v3, "data");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = (void *)objc_msgSend(v4, "initWithProtoBufferData:", v5);
  return v6;
}

id __73__HMDMediaGroupsAggregateData_decodeDestinationsWithEncodedDestinations___block_invoke(uint64_t a1, void *a2)
{
  objc_class *v2;
  id v3;
  id v4;
  void *v5;
  void *v6;

  v2 = (objc_class *)MEMORY[0x24BDD7780];
  v3 = a2;
  v4 = [v2 alloc];
  objc_msgSend(v3, "data");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = (void *)objc_msgSend(v4, "initWithProtoBufferData:", v5);
  return v6;
}

uint64_t __51__HMDMediaGroupsAggregateData_groupWithIdentifier___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;

  objc_msgSend(a2, "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hmf_isEqualToUUID:", *(_QWORD *)(a1 + 32));

  return v4;
}

@end
