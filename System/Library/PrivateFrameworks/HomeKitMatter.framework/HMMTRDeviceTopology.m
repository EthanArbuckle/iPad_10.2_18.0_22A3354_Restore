@implementation HMMTRDeviceTopology

- (HMMTRDeviceTopology)init
{
  HMMTRDeviceTopology *v2;
  NSMutableDictionary *v3;
  NSMutableDictionary *hapServiceTypes;
  NSMutableDictionary *v5;
  NSMutableDictionary *clustersInUse;
  NSMutableDictionary *v7;
  NSMutableDictionary *hapCategories;
  NSMutableDictionary *v9;
  NSMutableDictionary *hapDisabledCharacteristics;
  NSMutableDictionary *v11;
  NSMutableDictionary *deviceFeatureMapValues;
  NSMutableDictionary *v13;
  NSMutableDictionary *deviceAttributeValues;
  NSMutableDictionary *v15;
  NSMutableDictionary *nodeLabels;
  NSMutableDictionary *v17;
  NSMutableDictionary *partsList;
  NSMutableDictionary *v19;
  NSMutableDictionary *fixedLabels;
  NSMutableDictionary *v21;
  NSMutableDictionary *versions;
  NSMutableDictionary *v23;
  NSMutableDictionary *otaRequestorEndpoints;
  objc_super v26;

  v26.receiver = self;
  v26.super_class = (Class)HMMTRDeviceTopology;
  v2 = -[HMMTRDeviceTopology init](&v26, sel_init);
  if (v2)
  {
    v3 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x24BDBCED8]);
    hapServiceTypes = v2->_hapServiceTypes;
    v2->_hapServiceTypes = v3;

    v5 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x24BDBCED8]);
    clustersInUse = v2->_clustersInUse;
    v2->_clustersInUse = v5;

    v7 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x24BDBCED8]);
    hapCategories = v2->_hapCategories;
    v2->_hapCategories = v7;

    v9 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x24BDBCED8]);
    hapDisabledCharacteristics = v2->_hapDisabledCharacteristics;
    v2->_hapDisabledCharacteristics = v9;

    v11 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x24BDBCED8]);
    deviceFeatureMapValues = v2->_deviceFeatureMapValues;
    v2->_deviceFeatureMapValues = v11;

    v13 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x24BDBCED8]);
    deviceAttributeValues = v2->_deviceAttributeValues;
    v2->_deviceAttributeValues = v13;

    v15 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x24BDBCED8]);
    nodeLabels = v2->_nodeLabels;
    v2->_nodeLabels = v15;

    v17 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x24BDBCED8]);
    partsList = v2->_partsList;
    v2->_partsList = v17;

    v19 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x24BDBCED8]);
    fixedLabels = v2->_fixedLabels;
    v2->_fixedLabels = v19;

    v21 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x24BDBCED8]);
    versions = v2->_versions;
    v2->_versions = v21;

    v23 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x24BDBCED8]);
    otaRequestorEndpoints = v2->_otaRequestorEndpoints;
    v2->_otaRequestorEndpoints = v23;

  }
  return v2;
}

- (HMMTRDeviceTopology)initWithNodeId:(id)a3 server:(id)a4
{
  id v6;
  id v7;
  HMMTRDeviceTopology *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  HMMTRDeviceTopology *v15;
  NSObject *v16;
  void *v17;
  void *v18;
  HMMTRDeviceTopology *v19;
  NSObject *v20;
  void *v21;
  HMMTRDeviceTopology *v22;
  NSMutableDictionary *hapServiceTypes;
  void *v24;
  NSMutableDictionary *clustersInUse;
  void *v26;
  NSMutableDictionary *hapCategories;
  void *v28;
  NSMutableDictionary *hapDisabledCharacteristics;
  void *v30;
  NSMutableDictionary *deviceFeatureMapValues;
  void *v32;
  NSMutableDictionary *deviceAttributeValues;
  void *v34;
  NSMutableDictionary *nodeLabels;
  void *v36;
  NSMutableDictionary *partsList;
  void *v38;
  NSMutableDictionary *fixedLabels;
  void *v40;
  NSMutableDictionary *versions;
  void *v42;
  NSMutableDictionary *otaRequestorEndpoints;
  void *v44;
  id v46;
  uint8_t buf[4];
  void *v48;
  __int16 v49;
  id v50;
  uint64_t v51;

  v51 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  v8 = -[HMMTRDeviceTopology init](self, "init");
  if (!v8)
    goto LABEL_12;
  objc_msgSend(v7, "topology");
  v9 = objc_claimAutoreleasedReturnValue();
  if (!v9)
  {
    v18 = (void *)MEMORY[0x242656984]();
    v19 = v8;
    HMFGetOSLogHandle();
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v48 = v21;
      v49 = 2112;
      v50 = v6;
      _os_log_impl(&dword_23E95B000, v20, OS_LOG_TYPE_ERROR, "%{public}@No enumeration/topology dictionary found for NodeId:%@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v18);
    goto LABEL_10;
  }
  v10 = (void *)v9;
  v46 = 0;
  objc_msgSend(MEMORY[0x24BDD1770], "propertyListWithData:options:format:error:", v9, 0, 0, &v46);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v46;
  if (!v12)
  {
    hapServiceTypes = v8->_hapServiceTypes;
    objc_msgSend(v11, "objectForKey:", CFSTR("HAPServiceTypes"));
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary addEntriesFromDictionary:](hapServiceTypes, "addEntriesFromDictionary:", v24);

    clustersInUse = v8->_clustersInUse;
    objc_msgSend(v11, "objectForKey:", CFSTR("ClustersInUse"));
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary addEntriesFromDictionary:](clustersInUse, "addEntriesFromDictionary:", v26);

    hapCategories = v8->_hapCategories;
    objc_msgSend(v11, "objectForKey:", CFSTR("HAPCategories"));
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary addEntriesFromDictionary:](hapCategories, "addEntriesFromDictionary:", v28);

    hapDisabledCharacteristics = v8->_hapDisabledCharacteristics;
    objc_msgSend(v11, "objectForKey:", CFSTR("HAPDisabledCharacteristics"));
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary addEntriesFromDictionary:](hapDisabledCharacteristics, "addEntriesFromDictionary:", v30);

    deviceFeatureMapValues = v8->_deviceFeatureMapValues;
    objc_msgSend(v11, "objectForKey:", CFSTR("DeviceFeatureMapValues"));
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary addEntriesFromDictionary:](deviceFeatureMapValues, "addEntriesFromDictionary:", v32);

    deviceAttributeValues = v8->_deviceAttributeValues;
    objc_msgSend(v11, "objectForKey:", CFSTR("DeviceAttributeValues"));
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary addEntriesFromDictionary:](deviceAttributeValues, "addEntriesFromDictionary:", v34);

    nodeLabels = v8->_nodeLabels;
    objc_msgSend(v11, "objectForKey:", CFSTR("NodeLabels"));
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary addEntriesFromDictionary:](nodeLabels, "addEntriesFromDictionary:", v36);

    partsList = v8->_partsList;
    objc_msgSend(v11, "objectForKey:", CFSTR("PartsList"));
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary addEntriesFromDictionary:](partsList, "addEntriesFromDictionary:", v38);

    fixedLabels = v8->_fixedLabels;
    objc_msgSend(v11, "objectForKey:", CFSTR("FixedLabels"));
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary addEntriesFromDictionary:](fixedLabels, "addEntriesFromDictionary:", v40);

    versions = v8->_versions;
    objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("Versions"));
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary addEntriesFromDictionary:](versions, "addEntriesFromDictionary:", v42);

    otaRequestorEndpoints = v8->_otaRequestorEndpoints;
    objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("OTARequestorEndpoints"));
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary addEntriesFromDictionary:](otaRequestorEndpoints, "addEntriesFromDictionary:", v44);

LABEL_12:
    v22 = v8;
    goto LABEL_13;
  }
  v13 = v12;
  v14 = (void *)MEMORY[0x242656984]();
  v15 = v8;
  HMFGetOSLogHandle();
  v16 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
  {
    HMFGetLogIdentifier();
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v48 = v17;
    v49 = 2112;
    v50 = v13;
    _os_log_impl(&dword_23E95B000, v16, OS_LOG_TYPE_ERROR, "%{public}@Could not decode string to generate topology dictionary. Error: %@", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v14);

LABEL_10:
  v22 = 0;
LABEL_13:

  return v22;
}

- (HMMTRDeviceTopology)initWithTopologyDictionary:(id)a3
{
  id v4;
  HMMTRDeviceTopology *v5;
  HMMTRDeviceTopology *v6;
  NSMutableDictionary *hapServiceTypes;
  void *v8;
  NSMutableDictionary *clustersInUse;
  void *v10;
  NSMutableDictionary *hapCategories;
  void *v12;
  NSMutableDictionary *hapDisabledCharacteristics;
  void *v14;
  NSMutableDictionary *deviceFeatureMapValues;
  void *v16;
  NSMutableDictionary *deviceAttributeValues;
  void *v18;
  NSMutableDictionary *nodeLabels;
  void *v20;
  NSMutableDictionary *partsList;
  void *v22;
  NSMutableDictionary *fixedLabels;
  void *v24;
  NSMutableDictionary *versions;
  void *v26;
  NSMutableDictionary *otaRequestorEndpoints;
  void *v28;

  v4 = a3;
  v5 = -[HMMTRDeviceTopology init](self, "init");
  v6 = v5;
  if (v5)
  {
    hapServiceTypes = v5->_hapServiceTypes;
    objc_msgSend(v4, "objectForKey:", CFSTR("HAPServiceTypes"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary addEntriesFromDictionary:](hapServiceTypes, "addEntriesFromDictionary:", v8);

    clustersInUse = v6->_clustersInUse;
    objc_msgSend(v4, "objectForKey:", CFSTR("ClustersInUse"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary addEntriesFromDictionary:](clustersInUse, "addEntriesFromDictionary:", v10);

    hapCategories = v6->_hapCategories;
    objc_msgSend(v4, "objectForKey:", CFSTR("HAPCategories"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary addEntriesFromDictionary:](hapCategories, "addEntriesFromDictionary:", v12);

    hapDisabledCharacteristics = v6->_hapDisabledCharacteristics;
    objc_msgSend(v4, "objectForKey:", CFSTR("HAPDisabledCharacteristics"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary addEntriesFromDictionary:](hapDisabledCharacteristics, "addEntriesFromDictionary:", v14);

    deviceFeatureMapValues = v6->_deviceFeatureMapValues;
    objc_msgSend(v4, "objectForKey:", CFSTR("DeviceFeatureMapValues"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary addEntriesFromDictionary:](deviceFeatureMapValues, "addEntriesFromDictionary:", v16);

    deviceAttributeValues = v6->_deviceAttributeValues;
    objc_msgSend(v4, "objectForKey:", CFSTR("DeviceAttributeValues"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary addEntriesFromDictionary:](deviceAttributeValues, "addEntriesFromDictionary:", v18);

    nodeLabels = v6->_nodeLabels;
    objc_msgSend(v4, "objectForKey:", CFSTR("NodeLabels"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary addEntriesFromDictionary:](nodeLabels, "addEntriesFromDictionary:", v20);

    partsList = v6->_partsList;
    objc_msgSend(v4, "objectForKey:", CFSTR("PartsList"));
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary addEntriesFromDictionary:](partsList, "addEntriesFromDictionary:", v22);

    fixedLabels = v6->_fixedLabels;
    objc_msgSend(v4, "objectForKey:", CFSTR("FixedLabels"));
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary addEntriesFromDictionary:](fixedLabels, "addEntriesFromDictionary:", v24);

    versions = v6->_versions;
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("Versions"));
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary addEntriesFromDictionary:](versions, "addEntriesFromDictionary:", v26);

    otaRequestorEndpoints = v6->_otaRequestorEndpoints;
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("OTARequestorEndpoints"));
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary addEntriesFromDictionary:](otaRequestorEndpoints, "addEntriesFromDictionary:", v28);

  }
  return v6;
}

- (id)getHAPServiceTypesAtEndpoint:(id)a3
{
  NSMutableDictionary *hapServiceTypes;
  void *v4;
  void *v5;

  hapServiceTypes = self->_hapServiceTypes;
  objc_msgSend(a3, "stringValue");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKeyedSubscript:](hapServiceTypes, "objectForKeyedSubscript:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)getClustersInUseAtEndpoint:(id)a3
{
  NSMutableDictionary *clustersInUse;
  void *v4;
  void *v5;

  clustersInUse = self->_clustersInUse;
  objc_msgSend(a3, "stringValue");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKeyedSubscript:](clustersInUse, "objectForKeyedSubscript:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)getHAPCategoriesAtEndpoint:(id)a3
{
  NSMutableDictionary *hapCategories;
  void *v4;
  void *v5;

  hapCategories = self->_hapCategories;
  objc_msgSend(a3, "stringValue");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKeyedSubscript:](hapCategories, "objectForKeyedSubscript:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)getBridgeAggregateNodeEndpoint
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t j;
  void *v16;
  uint64_t v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  -[NSMutableDictionary allKeys](self->_hapCategories, "allKeys");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v23, v28, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v24;
    v7 = 0x24BDD1000uLL;
    v18 = *(_QWORD *)v24;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v24 != v6)
          objc_enumerationMutation(v3);
        objc_msgSend(*(id *)(v7 + 1760), "numberWithInt:", objc_msgSend(*(id *)(*((_QWORD *)&v23 + 1) + 8 * i), "intValue"));
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        -[HMMTRDeviceTopology getHAPCategoriesAtEndpoint:](self, "getHAPCategoriesAtEndpoint:", v9);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = 0u;
        v20 = 0u;
        v21 = 0u;
        v22 = 0u;
        v11 = v10;
        v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v19, v27, 16);
        if (v12)
        {
          v13 = v12;
          v14 = *(_QWORD *)v20;
          while (2)
          {
            for (j = 0; j != v13; ++j)
            {
              if (*(_QWORD *)v20 != v14)
                objc_enumerationMutation(v11);
              v16 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * j);
              if (v16 && (objc_msgSend(v16, "isEqual:", &unk_250F3F5A0) & 1) != 0)
              {

                goto LABEL_20;
              }
            }
            v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v19, v27, 16);
            if (v13)
              continue;
            break;
          }
        }

        v6 = v18;
        v7 = 0x24BDD1000;
      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v23, v28, 16);
      v9 = 0;
    }
    while (v5);
  }
  else
  {
    v9 = 0;
  }
LABEL_20:

  return v9;
}

- (id)getEndpoints
{
  void *v2;
  void *v3;

  -[NSMutableDictionary allKeys](self->_clustersInUse, "allKeys");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "valueForKeyPath:", CFSTR("self.integerValue"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (BOOL)isHAPCharacteristicDisabledAtEndpoint:(id)a3 hapServiceType:(id)a4 hapCharacteristic:(id)a5
{
  id v8;
  id v9;
  NSMutableDictionary *hapDisabledCharacteristics;
  void *v11;
  void *v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  BOOL v22;
  BOOL v23;
  void *v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x24BDAC8D0];
  v8 = a4;
  v9 = a5;
  hapDisabledCharacteristics = self->_hapDisabledCharacteristics;
  objc_msgSend(a3, "stringValue");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKeyedSubscript:](hapDisabledCharacteristics, "objectForKeyedSubscript:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v12, "count"))
  {
    v28 = 0u;
    v29 = 0u;
    v26 = 0u;
    v27 = 0u;
    v13 = v12;
    v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
    if (v14)
    {
      v15 = v14;
      v25 = v12;
      v16 = *(_QWORD *)v27;
      while (2)
      {
        for (i = 0; i != v15; ++i)
        {
          if (*(_QWORD *)v27 != v16)
            objc_enumerationMutation(v13);
          objc_msgSend(*(id *)(*((_QWORD *)&v26 + 1) + 8 * i), "componentsSeparatedByString:", CFSTR(":"));
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v18, "objectAtIndexedSubscript:", 0);
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v18, "objectAtIndexedSubscript:", 1);
          v20 = objc_claimAutoreleasedReturnValue();
          v21 = (void *)v20;
          if (v19)
            v22 = v20 == 0;
          else
            v22 = 1;
          if (!v22
            && objc_msgSend(v8, "isEqualToString:", v19)
            && (objc_msgSend(v9, "isEqualToString:", v21) & 1) != 0)
          {

            v23 = 1;
            goto LABEL_18;
          }

        }
        v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
        if (v15)
          continue;
        break;
      }
      v23 = 0;
LABEL_18:
      v12 = v25;
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

  return v23;
}

- (id)getFeatureMapForClusterClassName:(id)a3 endpoint:(id)a4
{
  id v6;
  NSMutableDictionary *deviceFeatureMapValues;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  BOOL v19;
  id v20;
  void *v22;
  _BOOL4 v23;
  id obj;
  void *v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  deviceFeatureMapValues = self->_deviceFeatureMapValues;
  objc_msgSend(a4, "stringValue");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKeyedSubscript:](deviceFeatureMapValues, "objectForKeyedSubscript:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v25 = v6;
  v23 = (objc_msgSend(v6, "isEqualToString:", CFSTR("MTRBaseClusterColorControl")) & 1) != 0
     || objc_msgSend(v6, "isEqualToString:", CFSTR("HMMTRColorControl"));
  if (objc_msgSend(v9, "count"))
  {
    v28 = 0u;
    v29 = 0u;
    v26 = 0u;
    v27 = 0u;
    obj = v9;
    v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
    if (v10)
    {
      v11 = v10;
      v22 = v9;
      v12 = *(_QWORD *)v27;
      while (2)
      {
        for (i = 0; i != v11; ++i)
        {
          if (*(_QWORD *)v27 != v12)
            objc_enumerationMutation(obj);
          objc_msgSend(*(id *)(*((_QWORD *)&v26 + 1) + 8 * i), "componentsSeparatedByString:", CFSTR(":"), v22);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "objectAtIndexedSubscript:", 0);
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          v16 = objc_alloc_init(MEMORY[0x24BDD16F0]);
          objc_msgSend(v16, "setNumberStyle:", 1);
          objc_msgSend(v14, "objectAtIndexedSubscript:", 1);
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "numberFromString:", v17);
          v18 = (void *)objc_claimAutoreleasedReturnValue();

          if (v15)
            v19 = v18 == 0;
          else
            v19 = 1;
          if (!v19
            && (v23 && (objc_msgSend(v15, "hasSuffix:", CFSTR("ColorControl")) & 1) != 0
             || (objc_msgSend(v25, "isEqualToString:", v15) & 1) != 0))
          {
            v20 = v18;

            goto LABEL_22;
          }

        }
        v11 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
        if (v11)
          continue;
        break;
      }
      v20 = 0;
LABEL_22:
      v9 = v22;
    }
    else
    {
      v20 = 0;
    }

  }
  else
  {
    v20 = 0;
  }

  return v20;
}

- (id)getAttributesForClusterClassName:(id)a3 endpoint:(id)a4
{
  id v6;
  id v7;
  NSMutableDictionary *deviceAttributeValues;
  void *v9;
  void *v10;
  __CFString *v11;
  uint64_t v12;
  uint64_t v13;
  const __CFString *v14;
  uint64_t i;
  void *v16;
  void *v17;
  HMMTRDeviceTopology *v18;
  NSObject *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  void *v24;
  BOOL v25;
  id v26;
  char v27;
  unsigned int v28;
  uint64_t v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  HMMTRDeviceTopology *v35;
  NSObject *v36;
  const __CFString *v37;
  HMMTRDeviceTopology *v38;
  void *v39;
  void *v42;
  id v43;
  void *v44;
  void *v45;
  void *v46;
  uint64_t v47;
  void *v48;
  id v49;
  id obj;
  id v51;
  uint64_t v52;
  id v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  uint8_t buf[4];
  void *v59;
  __int16 v60;
  void *v61;
  __int16 v62;
  uint64_t v63;
  __int16 v64;
  id v65;
  __int16 v66;
  id v67;
  _BYTE v68[128];
  uint64_t v69;

  v69 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  deviceAttributeValues = self->_deviceAttributeValues;
  v51 = v7;
  objc_msgSend(v7, "stringValue");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKeyedSubscript:](deviceAttributeValues, "objectForKeyedSubscript:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v46 = (void *)objc_msgSend(v6, "copy");
  v11 = CFSTR("MTRCluster");
  if ((objc_msgSend(v6, "hasPrefix:", CFSTR("MTRCluster")) & 1) != 0
    || (v11 = CFSTR("MTRBaseCluster"), (objc_msgSend(v6, "hasPrefix:", CFSTR("MTRBaseCluster")) & 1) != 0)
    || (v11 = CFSTR("HMMTR"), objc_msgSend(v6, "hasPrefix:", CFSTR("HMMTR"))))
  {
    objc_msgSend(v6, "substringFromIndex:", -[__CFString length](v11, "length"));
    v12 = objc_claimAutoreleasedReturnValue();

    v46 = (void *)v12;
  }
  if (objc_msgSend(v10, "count"))
  {
    v42 = v10;
    v43 = objc_alloc_init(MEMORY[0x24BDBCED8]);
    v54 = 0u;
    v55 = 0u;
    v56 = 0u;
    v57 = 0u;
    obj = v10;
    v52 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v54, v68, 16);
    if (v52)
    {
      v13 = *(_QWORD *)v55;
      v14 = CFSTR(":");
      v47 = *(_QWORD *)v55;
      v49 = v6;
      do
      {
        for (i = 0; i != v52; ++i)
        {
          if (*(_QWORD *)v55 != v13)
            objc_enumerationMutation(obj);
          objc_msgSend(*(id *)(*((_QWORD *)&v54 + 1) + 8 * i), "componentsSeparatedByString:", v14, v42);
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          if ((unint64_t)objc_msgSend(v16, "count") > 2)
          {
            objc_msgSend(v16, "objectAtIndexedSubscript:", 0);
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v16, "objectAtIndexedSubscript:", 1);
            v23 = objc_claimAutoreleasedReturnValue();
            v24 = (void *)v23;
            if (v22)
              v25 = v23 == 0;
            else
              v25 = 1;
            if (!v25 && objc_msgSend(v22, "hasSuffix:", v46))
            {
              v26 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
              v53 = objc_alloc_init(MEMORY[0x24BDD16F0]);
              objc_msgSend(v53, "setNumberStyle:", 1);
              if ((unint64_t)objc_msgSend(v16, "count") < 3)
                goto LABEL_29;
              v44 = v24;
              v45 = v22;
              v27 = 1;
              v28 = 3;
              v29 = 2;
              v30 = v26;
              v31 = v53;
              v48 = v30;
              do
              {
                objc_msgSend(v16, "objectAtIndexedSubscript:", v29);
                v32 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v31, "numberFromString:", v32);
                v33 = (void *)objc_claimAutoreleasedReturnValue();

                if (v33)
                {
                  objc_msgSend(v30, "addObject:", v33);
                }
                else
                {
                  v34 = (void *)MEMORY[0x242656984]();
                  v35 = self;
                  HMFGetOSLogHandle();
                  v36 = objc_claimAutoreleasedReturnValue();
                  if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
                  {
                    HMFGetLogIdentifier();
                    v37 = v14;
                    v38 = self;
                    v39 = (void *)objc_claimAutoreleasedReturnValue();
                    *(_DWORD *)buf = 138544130;
                    v59 = v39;
                    v60 = 2112;
                    v61 = v16;
                    v62 = 2112;
                    v63 = (uint64_t)v49;
                    v64 = 2112;
                    v65 = v51;
                    _os_log_impl(&dword_23E95B000, v36, OS_LOG_TYPE_ERROR, "%{public}@Unable to parse attribute string %@ for cluster %@ on endpoint %@, skipping.", buf, 0x2Au);

                    self = v38;
                    v14 = v37;
                    v30 = v48;
                  }

                  objc_autoreleasePoolPop(v34);
                  v27 = 0;
                  v31 = v53;
                }

                v29 = v28;
              }
              while (objc_msgSend(v16, "count") > (unint64_t)v28++);
              v13 = v47;
              v26 = v30;
              v24 = v44;
              v22 = v45;
              if ((v27 & 1) != 0)
LABEL_29:
                objc_msgSend(v43, "setObject:forKey:", v26, v24);

              v6 = v49;
            }

          }
          else
          {
            v17 = (void *)MEMORY[0x242656984]();
            v18 = self;
            HMFGetOSLogHandle();
            v19 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
            {
              HMFGetLogIdentifier();
              v20 = (void *)objc_claimAutoreleasedReturnValue();
              v21 = objc_msgSend(v16, "count");
              *(_DWORD *)buf = 138544386;
              v59 = v20;
              v60 = 2112;
              v61 = v16;
              v62 = 2048;
              v63 = v21;
              v64 = 2112;
              v65 = v6;
              v66 = 2112;
              v67 = v51;
              _os_log_impl(&dword_23E95B000, v19, OS_LOG_TYPE_ERROR, "%{public}@Invalid attribute string %@ and count %lu, for cluster %@ on endpoint %@", buf, 0x34u);

              v13 = v47;
            }

            objc_autoreleasePoolPop(v17);
          }

        }
        v52 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v54, v68, 16);
      }
      while (v52);
    }

    v10 = v42;
  }
  else
  {
    v43 = 0;
  }

  return v43;
}

- (id)getNodeLabelAtEndpoint:(id)a3
{
  NSMutableDictionary *nodeLabels;
  void *v4;
  void *v5;

  nodeLabels = self->_nodeLabels;
  objc_msgSend(a3, "stringValue");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKeyedSubscript:](nodeLabels, "objectForKeyedSubscript:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)getPartsListAtEndpoint:(id)a3
{
  NSMutableDictionary *partsList;
  void *v4;
  void *v5;

  partsList = self->_partsList;
  objc_msgSend(a3, "stringValue");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKeyedSubscript:](partsList, "objectForKeyedSubscript:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)getFixedLabelsAtEndpoint:(id)a3
{
  NSMutableDictionary *fixedLabels;
  void *v4;
  void *v5;

  fixedLabels = self->_fixedLabels;
  objc_msgSend(a3, "stringValue");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKeyedSubscript:](fixedLabels, "objectForKeyedSubscript:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)getVersionForKey:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[HMMTRDeviceTopology versions](self, "versions");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)getOTARequestorEndpoints
{
  return self->_otaRequestorEndpoints;
}

- (id)getEnabledOTARequestorEndpoint
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  void *v7;
  void *v8;
  void *v9;
  char v10;
  void *v11;
  id obj;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  -[NSMutableDictionary allKeys](self->_otaRequestorEndpoints, "allKeys");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v15;
    while (2)
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v15 != v5)
          objc_enumerationMutation(obj);
        v7 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * i);
        -[NSMutableDictionary objectForKey:](self->_otaRequestorEndpoints, "objectForKey:", v7);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", 1);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = objc_msgSend(v8, "isEqualToNumber:", v9);

        if ((v10 & 1) != 0)
        {
          objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", objc_msgSend(v7, "intValue"));
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          goto LABEL_11;
        }
      }
      v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      if (v4)
        continue;
      break;
    }
  }
  v11 = 0;
LABEL_11:

  return v11;
}

- (id)_dictionaryRepresentation
{
  id v3;
  void *v4;
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

  v3 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  -[HMMTRDeviceTopology hapServiceTypes](self, "hapServiceTypes");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v4, CFSTR("HAPServiceTypes"));

  -[HMMTRDeviceTopology clustersInUse](self, "clustersInUse");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("ClustersInUse"));

  -[HMMTRDeviceTopology hapCategories](self, "hapCategories");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v6, CFSTR("HAPCategories"));

  -[HMMTRDeviceTopology hapDisabledCharacteristics](self, "hapDisabledCharacteristics");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v7, CFSTR("HAPDisabledCharacteristics"));

  -[HMMTRDeviceTopology deviceFeatureMapValues](self, "deviceFeatureMapValues");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v8, CFSTR("DeviceFeatureMapValues"));

  -[HMMTRDeviceTopology deviceAttributeValues](self, "deviceAttributeValues");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v9, CFSTR("DeviceAttributeValues"));

  -[HMMTRDeviceTopology nodeLabels](self, "nodeLabels");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v10, CFSTR("NodeLabels"));

  -[HMMTRDeviceTopology partsList](self, "partsList");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v11, CFSTR("PartsList"));

  -[HMMTRDeviceTopology fixedLabels](self, "fixedLabels");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v12, CFSTR("FixedLabels"));

  -[HMMTRDeviceTopology versions](self, "versions");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v13, CFSTR("Versions"));

  -[HMMTRDeviceTopology otaRequestorEndpoints](self, "otaRequestorEndpoints");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v14, CFSTR("OTARequestorEndpoints"));

  return v3;
}

- (id)description
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x24BDD17C8];
  -[HMMTRDeviceTopology _dictionaryRepresentation](self, "_dictionaryRepresentation");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringWithFormat:", CFSTR("Device Topology:%@"), v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (NSMutableDictionary)hapServiceTypes
{
  return self->_hapServiceTypes;
}

- (void)setHapServiceTypes:(id)a3
{
  objc_storeStrong((id *)&self->_hapServiceTypes, a3);
}

- (NSMutableDictionary)clustersInUse
{
  return self->_clustersInUse;
}

- (void)setClustersInUse:(id)a3
{
  objc_storeStrong((id *)&self->_clustersInUse, a3);
}

- (NSMutableDictionary)hapDisabledCharacteristics
{
  return self->_hapDisabledCharacteristics;
}

- (void)setHapDisabledCharacteristics:(id)a3
{
  objc_storeStrong((id *)&self->_hapDisabledCharacteristics, a3);
}

- (NSMutableDictionary)deviceFeatureMapValues
{
  return self->_deviceFeatureMapValues;
}

- (void)setDeviceFeatureMapValues:(id)a3
{
  objc_storeStrong((id *)&self->_deviceFeatureMapValues, a3);
}

- (NSMutableDictionary)deviceAttributeValues
{
  return self->_deviceAttributeValues;
}

- (void)setDeviceAttributeValues:(id)a3
{
  objc_storeStrong((id *)&self->_deviceAttributeValues, a3);
}

- (NSMutableDictionary)nodeLabels
{
  return self->_nodeLabels;
}

- (void)setNodeLabels:(id)a3
{
  objc_storeStrong((id *)&self->_nodeLabels, a3);
}

- (NSMutableDictionary)hapCategories
{
  return self->_hapCategories;
}

- (void)setHapCategories:(id)a3
{
  objc_storeStrong((id *)&self->_hapCategories, a3);
}

- (NSMutableDictionary)partsList
{
  return self->_partsList;
}

- (void)setPartsList:(id)a3
{
  objc_storeStrong((id *)&self->_partsList, a3);
}

- (NSMutableDictionary)fixedLabels
{
  return self->_fixedLabels;
}

- (void)setFixedLabels:(id)a3
{
  objc_storeStrong((id *)&self->_fixedLabels, a3);
}

- (NSMutableDictionary)versions
{
  return self->_versions;
}

- (void)setVersions:(id)a3
{
  objc_storeStrong((id *)&self->_versions, a3);
}

- (NSMutableDictionary)otaRequestorEndpoints
{
  return self->_otaRequestorEndpoints;
}

- (void)setOtaRequestorEndpoints:(id)a3
{
  objc_storeStrong((id *)&self->_otaRequestorEndpoints, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_otaRequestorEndpoints, 0);
  objc_storeStrong((id *)&self->_versions, 0);
  objc_storeStrong((id *)&self->_fixedLabels, 0);
  objc_storeStrong((id *)&self->_partsList, 0);
  objc_storeStrong((id *)&self->_hapCategories, 0);
  objc_storeStrong((id *)&self->_nodeLabels, 0);
  objc_storeStrong((id *)&self->_deviceAttributeValues, 0);
  objc_storeStrong((id *)&self->_deviceFeatureMapValues, 0);
  objc_storeStrong((id *)&self->_hapDisabledCharacteristics, 0);
  objc_storeStrong((id *)&self->_clustersInUse, 0);
  objc_storeStrong((id *)&self->_hapServiceTypes, 0);
}

@end
