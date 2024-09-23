@implementation HMDLocationCluster

- (HMDLocationCluster)initWithLocations:(id)a3
{
  id v5;
  void *v6;
  HMDLocationCluster *v7;
  HMDLocationCluster *v8;
  HMDLocationCluster *v10;
  SEL v11;
  objc_super v12;

  v5 = a3;
  if (v5)
  {
    v6 = v5;
    v12.receiver = self;
    v12.super_class = (Class)HMDLocationCluster;
    v7 = -[HMDLocationCluster init](&v12, sel_init);
    v8 = v7;
    if (v7)
      objc_storeStrong((id *)&v7->_locations, a3);

    return v8;
  }
  else
  {
    v10 = (HMDLocationCluster *)_HMFPreconditionFailure();
    return (HMDLocationCluster *)-[HMDLocationCluster bestLocation](v10, v11);
  }
}

- (CLLocation)bestLocation
{
  void *v3;
  uint64_t v4;
  void *v5;
  unint64_t v6;
  void *v7;
  HMDLocationCluster *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  HMDLocationCluster *v16;
  NSObject *v17;
  void *v18;
  void *v20;
  HMDLocationCluster *v21;
  NSObject *v22;
  void *v23;
  void *v24;
  int v25;
  void *v26;
  __int16 v27;
  uint64_t v28;
  __int16 v29;
  void *v30;
  uint64_t v31;

  v31 = *MEMORY[0x24BDAC8D0];
  -[HMDLocationCluster locations](self, "locations");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count");

  if (v4)
  {
    -[HMDLocationCluster locations](self, "locations");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "count");

    if (v6 > 0xA)
    {
      -[HMDLocationCluster kMeansClusteredGroups](self, "kMeansClusteredGroups");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMDLocationCluster locationFromKMeansClusteredGroups:](self, "locationFromKMeansClusteredGroups:", v13);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = (void *)MEMORY[0x227676638]();
      v21 = self;
      HMFGetOSLogHandle();
      v22 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        -[HMDLocationCluster locations](v21, "locations");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        v25 = 138543874;
        v26 = v23;
        v27 = 2048;
        v28 = objc_msgSend(v24, "count");
        v29 = 2112;
        v30 = v14;
        _os_log_impl(&dword_2218F0000, v22, OS_LOG_TYPE_INFO, "%{public}@Number of locations is %lu so using k-means-clustered location for best location: %@", (uint8_t *)&v25, 0x20u);

      }
      objc_autoreleasePoolPop(v20);
    }
    else
    {
      v7 = (void *)MEMORY[0x227676638]();
      v8 = self;
      HMFGetOSLogHandle();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        -[HMDLocationCluster locations](v8, "locations");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v25 = 138543618;
        v26 = v10;
        v27 = 2048;
        v28 = objc_msgSend(v11, "count");
        _os_log_impl(&dword_2218F0000, v9, OS_LOG_TYPE_INFO, "%{public}@Number of locations is only %lu so sorting and using most accurate location for best location", (uint8_t *)&v25, 0x16u);

      }
      objc_autoreleasePoolPop(v7);
      -[HMDLocationCluster locations](v8, "locations");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "sortedArrayUsingComparator:", &__block_literal_global_218959);
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v13, "firstObject");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
    }

    return (CLLocation *)v14;
  }
  else
  {
    v15 = (void *)MEMORY[0x227676638]();
    v16 = self;
    HMFGetOSLogHandle();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = 138543362;
      v26 = v18;
      _os_log_impl(&dword_2218F0000, v17, OS_LOG_TYPE_INFO, "%{public}@Number of locations is 0 so returning nil for best location", (uint8_t *)&v25, 0xCu);

    }
    objc_autoreleasePoolPop(v15);
    return (CLLocation *)0;
  }
}

- (id)kMeansClusteredGroups
{
  uint64_t v3;
  void *v4;
  void *v5;
  unint64_t v6;
  uint64_t v7;
  HMDLocationClusterGroup *v8;
  void *v9;
  void *v10;
  HMDLocationClusterGroup *v11;
  void *v12;
  int v13;
  void *v14;

  v3 = 3;
  objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", 3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDLocationCluster locations](self, "locations");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "count") / 3uLL;

  v7 = 0;
  do
  {
    v8 = [HMDLocationClusterGroup alloc];
    -[HMDLocationCluster locations](self, "locations");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "objectAtIndexedSubscript:", v7);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = -[HMDLocationClusterGroup initWithCenter:](v8, "initWithCenter:", v10);
    objc_msgSend(v4, "addObject:", v11);

    v7 += v6;
    --v3;
  }
  while (v3);
  v12 = (void *)objc_msgSend(v4, "copy");
  -[HMDLocationCluster clusterWithGroups:](self, "clusterWithGroups:", v12);
  v13 = 10;
  do
  {
    v14 = v12;
    -[HMDLocationCluster generateNewGroupsFromGroups:](self, "generateNewGroupsFromGroups:", v12);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    -[HMDLocationCluster clusterWithGroups:](self, "clusterWithGroups:", v12);
    --v13;
  }
  while (v13);

  return v12;
}

- (HMDLocationCluster)clusterWithGroups:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  uint64_t v10;
  unint64_t v11;
  int v12;
  double v13;
  void *v14;
  void *v15;
  double v16;
  double v17;
  void *v19;
  void *v20;
  HMDLocationCluster *result;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  -[HMDLocationCluster locations](self, "locations", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v23;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v23 != v8)
          objc_enumerationMutation(v5);
        v10 = *(_QWORD *)(*((_QWORD *)&v22 + 1) + 8 * i);
        if (objc_msgSend(v4, "count"))
        {
          v11 = 0;
          v12 = -1;
          v13 = 0.0;
          do
          {
            objc_msgSend(v4, "objectAtIndexedSubscript:", v11);
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v14, "center");
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v15, "distanceFromLocation:", v10);
            v17 = v16;

            if (v17 < v13 || v11 == 0)
            {
              v12 = v11;
              v13 = v17;
            }

            ++v11;
          }
          while (objc_msgSend(v4, "count") > v11);
          if (v12 != -1)
          {
            objc_msgSend(v4, "objectAtIndexedSubscript:", v12);
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v19, "locations");
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v20, "addObject:", v10);

          }
        }
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
    }
    while (v7);
  }

  return result;
}

- (id)generateNewGroupsFromGroups:(id)a3
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  double v14;
  double v15;
  uint64_t j;
  void *v17;
  double v18;
  double v19;
  void *v20;
  double v21;
  void *v22;
  double v23;
  void *v24;
  HMDLocationClusterGroup *v25;
  id obj;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  _BYTE v36[128];
  _BYTE v37[128];
  uint64_t v38;

  v38 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", objc_msgSend(v3, "count"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = 0u;
  v33 = 0u;
  v34 = 0u;
  v35 = 0u;
  obj = v3;
  v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v32, v37, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v33;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v33 != v7)
          objc_enumerationMutation(obj);
        v9 = *(void **)(*((_QWORD *)&v32 + 1) + 8 * i);
        v28 = 0u;
        v29 = 0u;
        v30 = 0u;
        v31 = 0u;
        objc_msgSend(v9, "locations");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v28, v36, 16);
        if (v11)
        {
          v12 = v11;
          v13 = *(_QWORD *)v29;
          v14 = 0.0;
          v15 = 0.0;
          do
          {
            for (j = 0; j != v12; ++j)
            {
              if (*(_QWORD *)v29 != v13)
                objc_enumerationMutation(v10);
              v17 = *(void **)(*((_QWORD *)&v28 + 1) + 8 * j);
              objc_msgSend(v17, "coordinate");
              v15 = v15 + v18;
              objc_msgSend(v17, "coordinate");
              v14 = v14 + v19;
            }
            v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v28, v36, 16);
          }
          while (v12);
        }
        else
        {
          v14 = 0.0;
          v15 = 0.0;
        }

        objc_msgSend(v9, "locations");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v21 = v15 / (float)(unint64_t)objc_msgSend(v20, "count");

        objc_msgSend(v9, "locations");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        v23 = v14 / (float)(unint64_t)objc_msgSend(v22, "count");

        v24 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBFA80]), "initWithLatitude:longitude:", v21, v23);
        v25 = -[HMDLocationClusterGroup initWithCenter:]([HMDLocationClusterGroup alloc], "initWithCenter:", v24);
        objc_msgSend(v4, "addObject:", v25);

      }
      v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v32, v37, 16);
    }
    while (v6);
  }

  return v4;
}

- (id)locationFromKMeansClusteredGroups:(id)a3
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  void *v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  unint64_t v12;
  id v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  double v19;
  uint64_t v20;
  uint64_t j;
  void *v22;
  void *v23;
  double v24;
  double v25;
  id v26;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  _BYTE v36[128];
  _BYTE v37[128];
  uint64_t v38;

  v38 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  v32 = 0u;
  v33 = 0u;
  v34 = 0u;
  v35 = 0u;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v32, v37, 16);
  if (v4)
  {
    v5 = v4;
    v6 = 0;
    v7 = 0;
    v8 = *(_QWORD *)v33;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v33 != v8)
          objc_enumerationMutation(v3);
        v10 = *(void **)(*((_QWORD *)&v32 + 1) + 8 * i);
        objc_msgSend(v10, "locations");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = objc_msgSend(v11, "count");

        if (v12 > v6)
        {
          v13 = v10;

          objc_msgSend(v13, "locations");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          v6 = objc_msgSend(v14, "count");

          v7 = v13;
        }
      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v32, v37, 16);
    }
    while (v5);
  }
  else
  {
    v7 = 0;
  }
  v30 = 0u;
  v31 = 0u;
  v28 = 0u;
  v29 = 0u;
  objc_msgSend(v7, "locations", 0);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v28, v36, 16);
  if (v16)
  {
    v17 = v16;
    v18 = 0;
    v19 = *MEMORY[0x24BDBFA20];
    v20 = *(_QWORD *)v29;
    do
    {
      for (j = 0; j != v17; ++j)
      {
        if (*(_QWORD *)v29 != v20)
          objc_enumerationMutation(v15);
        v22 = *(void **)(*((_QWORD *)&v28 + 1) + 8 * j);
        objc_msgSend(v7, "center");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "distanceFromLocation:", v22);
        v25 = v24;

        if (v25 < v19)
        {
          v26 = v22;

          v18 = v26;
          v19 = v25;
        }
      }
      v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v28, v36, 16);
    }
    while (v17);
  }
  else
  {
    v18 = 0;
  }

  return v18;
}

- (id)attributeDescriptions
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x24BDAC8D0];
  v3 = objc_alloc(MEMORY[0x24BE3F140]);
  -[HMDLocationCluster locations](self, "locations");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v3, "initWithName:value:", CFSTR("Locations"), v4);
  v8[0] = v5;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v8, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (NSArray)locations
{
  return (NSArray *)objc_getProperty(self, a2, 8, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_locations, 0);
}

uint64_t __34__HMDLocationCluster_bestLocation__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  double v6;
  double v7;
  double v8;
  uint64_t v9;
  double v10;
  double v11;
  double v12;

  v4 = a2;
  v5 = a3;
  objc_msgSend(v4, "horizontalAccuracy");
  v7 = v6;
  objc_msgSend(v5, "horizontalAccuracy");
  if (v7 >= v8)
  {
    objc_msgSend(v4, "horizontalAccuracy");
    v11 = v10;
    objc_msgSend(v5, "horizontalAccuracy");
    v9 = v11 > v12;
  }
  else
  {
    v9 = -1;
  }

  return v9;
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t3_218966 != -1)
    dispatch_once(&logCategory__hmf_once_t3_218966, &__block_literal_global_5_218967);
  return (id)logCategory__hmf_once_v4_218968;
}

void __33__HMDLocationCluster_logCategory__block_invoke()
{
  uint64_t v0;
  void *v1;

  HMFCreateOSLogHandle();
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)logCategory__hmf_once_v4_218968;
  logCategory__hmf_once_v4_218968 = v0;

}

@end
