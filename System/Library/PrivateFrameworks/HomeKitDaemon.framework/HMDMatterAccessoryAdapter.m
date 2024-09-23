@implementation HMDMatterAccessoryAdapter

- (HMDMatterAccessoryAdapter)initWithAccessory:(id)a3
{
  id v4;
  void *v5;
  unint64_t v6;
  id v7;
  void *v8;
  unint64_t v9;
  HMDMatterAccessoryAdapter *v10;
  HMDMatterAccessoryAdapter *v11;
  uint64_t v12;
  NSNumber *matterNodeID;
  uint64_t v14;
  NSNumber *matterVendorID;
  uint64_t v16;
  NSNumber *matterProductID;
  uint64_t v18;
  OS_dispatch_queue *workQueue;
  HMDMatterAccessoryAdapter *v21;
  SEL v22;
  objc_super v23;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v5 = v4;
  else
    v5 = 0;
  v6 = v5;
  v7 = v4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v8 = v7;
  else
    v8 = 0;
  v9 = v8;

  if (v6 | v9)
  {
    v23.receiver = self;
    v23.super_class = (Class)HMDMatterAccessoryAdapter;
    v10 = -[HMDMatterAccessoryAdapter init](&v23, sel_init);
    v11 = v10;
    if (v10)
    {
      objc_storeWeak((id *)&v10->_accessory, v7);
      if (v6)
      {
        objc_msgSend((id)v6, "matterNodeID");
        v12 = objc_claimAutoreleasedReturnValue();
        matterNodeID = v11->_matterNodeID;
        v11->_matterNodeID = (NSNumber *)v12;

        objc_msgSend((id)v6, "matterVendorID");
        v14 = objc_claimAutoreleasedReturnValue();
        matterVendorID = v11->_matterVendorID;
        v11->_matterVendorID = (NSNumber *)v14;

        objc_msgSend((id)v6, "matterProductID");
        v16 = objc_claimAutoreleasedReturnValue();
        matterProductID = v11->_matterProductID;
        v11->_matterProductID = (NSNumber *)v16;

      }
      v11->_retryFetchTimeout = 20.0;
      objc_msgSend(v7, "workQueue");
      v18 = objc_claimAutoreleasedReturnValue();
      workQueue = v11->_workQueue;
      v11->_workQueue = (OS_dispatch_queue *)v18;

    }
    return v11;
  }
  else
  {
    v21 = (HMDMatterAccessoryAdapter *)_HMFPreconditionFailure();
    return (HMDMatterAccessoryAdapter *)-[HMDMatterAccessoryAdapter workContext](v21, v22);
  }
}

- (id)workContext
{
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __40__HMDMatterAccessoryAdapter_workContext__block_invoke;
  block[3] = &unk_24E79C240;
  block[4] = self;
  if (workContext__hmf_once_t2 != -1)
    dispatch_once(&workContext__hmf_once_t2, block);
  return (id)workContext__hmf_once_v3;
}

- (id)hapAccessory
{
  void *v2;
  void *v3;
  id v4;

  -[HMDMatterAccessoryAdapter accessory](self, "accessory");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v3 = v2;
  else
    v3 = 0;
  v4 = v3;

  return v4;
}

- (id)matterAccessory
{
  void *v2;
  void *v3;
  id v4;

  -[HMDMatterAccessoryAdapter accessory](self, "accessory");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v3 = v2;
  else
    v3 = 0;
  v4 = v3;

  return v4;
}

- (id)accessoryServer
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;

  -[HMDMatterAccessoryAdapter hapAccessory](self, "hapAccessory");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "chipAccessoryServer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
  {
    v6 = v4;
  }
  else
  {
    -[HMDMatterAccessoryAdapter matterAccessory](self, "matterAccessory");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "accessoryServer");
    v6 = (id)objc_claimAutoreleasedReturnValue();

  }
  return v6;
}

- (id)mtrDevice
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;

  -[HMDMatterAccessoryAdapter accessoryServer](self, "accessoryServer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "matterDevice");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
  {
    v6 = v4;
  }
  else
  {
    -[HMDMatterAccessoryAdapter testMatterDevice](self, "testMatterDevice");
    v6 = (id)objc_claimAutoreleasedReturnValue();
  }
  v7 = v6;

  return v7;
}

- (NSSet)matterPairings
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  void *v11;
  HMDMatterAccessoryAdapter *v12;
  NSObject *v13;
  void *v14;
  id v16;
  uint8_t buf[4];
  void *v18;
  __int16 v19;
  id v20;
  _QWORD v21[3];

  v21[2] = *MEMORY[0x24BDAC8D0];
  -[HMDMatterAccessoryAdapter matterPairingsData](self, "matterPairingsData");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = (void *)MEMORY[0x24BDD1620];
    v5 = (void *)MEMORY[0x24BDBCF20];
    v21[0] = objc_opt_class();
    v21[1] = objc_opt_class();
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v21, 2);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setWithArray:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = 0;
    objc_msgSend(v4, "unarchivedObjectOfClasses:fromData:error:", v7, v3, &v16);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v16;

    if (v8)
    {
      v10 = v8;
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
        *(_DWORD *)buf = 138543618;
        v18 = v14;
        v19 = 2112;
        v20 = v9;
        _os_log_impl(&dword_2218F0000, v13, OS_LOG_TYPE_ERROR, "%{public}@Failed to deserialize pairings from data: %@", buf, 0x16u);

      }
      objc_autoreleasePoolPop(v11);
    }

  }
  else
  {
    v8 = 0;
  }

  return (NSSet *)v8;
}

- (id)fetchConfiguration
{
  void *v3;
  void *v4;
  void *v5;
  _QWORD v7[5];

  v3 = (void *)MEMORY[0x24BE3F180];
  -[HMDMatterAccessoryAdapter workContext](self, "workContext");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __47__HMDMatterAccessoryAdapter_fetchConfiguration__block_invoke;
  v7[3] = &unk_24E78A388;
  v7[4] = self;
  objc_msgSend(v3, "inContext:perform:", v4, v7);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)_fetchMatterPaths
{
  void *v3;
  void *v4;
  void *v5;
  _QWORD v7[5];

  +[HMDMatterPath PathWithAttributeID:endpointID:clusterID:](HMDMatterPath, "PathWithAttributeID:endpointID:clusterID:", &unk_24E96B468, &unk_24E96B480, &unk_24E96B498);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDMatterAccessoryAdapter retryFetchTimeout](self, "retryFetchTimeout");
  -[HMDMatterAccessoryAdapter readFromAttributePath:retryTimeout:](self, "readFromAttributePath:retryTimeout:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __46__HMDMatterAccessoryAdapter__fetchMatterPaths__block_invoke;
  v7[3] = &unk_24E78DFE0;
  v7[4] = self;
  objc_msgSend(v4, "then:", v7);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)_fetchMatterPathsForEndpoint:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  HMDMatterAccessoryAdapter *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  _QWORD v15[5];
  id v16;
  uint8_t buf[4];
  void *v18;
  __int16 v19;
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (!v4)
    _HMFPreconditionFailure();
  v5 = v4;
  v6 = (void *)MEMORY[0x227676638]();
  v7 = self;
  HMFGetOSLogHandle();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v18 = v9;
    v19 = 2112;
    v20 = v5;
    _os_log_impl(&dword_2218F0000, v8, OS_LOG_TYPE_INFO, "%{public}@Fetching matter paths from EP(%@)", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v6);
  +[HMDMatterPath PathWithAttributeID:endpointID:clusterID:](HMDMatterPath, "PathWithAttributeID:endpointID:clusterID:", &unk_24E96B4B0, v5, &unk_24E96B498);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDMatterAccessoryAdapter retryFetchTimeout](v7, "retryFetchTimeout");
  -[HMDMatterAccessoryAdapter readFromAttributePath:retryTimeout:](v7, "readFromAttributePath:retryTimeout:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = MEMORY[0x24BDAC760];
  v15[1] = 3221225472;
  v15[2] = __58__HMDMatterAccessoryAdapter__fetchMatterPathsForEndpoint___block_invoke;
  v15[3] = &unk_24E797CF0;
  v15[4] = v7;
  v16 = v5;
  v12 = v5;
  objc_msgSend(v11, "then:", v15);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

- (id)_fetchMatterPathsForCluster:(id)a3 endpoint:(id)a4
{
  uint64_t (*v6)(uint64_t, uint64_t);
  id v7;
  void *v8;
  void *v9;
  HMDMatterAccessoryAdapter *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  uint64_t (*v14)(uint64_t, uint64_t);
  id v15;
  void *v16;
  _QWORD v18[5];
  uint64_t (*v19)(uint64_t, uint64_t);
  id v20;
  _BYTE *v21;
  _BYTE buf[24];
  uint64_t (*v23)(uint64_t, uint64_t);
  void (*v24)(uint64_t);
  id v25;
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  v6 = (uint64_t (*)(uint64_t, uint64_t))a3;
  v7 = a4;
  if (!v6 || (v8 = v7) == 0)
    _HMFPreconditionFailure();
  v9 = (void *)MEMORY[0x227676638]();
  v10 = self;
  HMFGetOSLogHandle();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
  {
    HMFGetLogIdentifier();
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    *(_QWORD *)&buf[4] = v12;
    *(_WORD *)&buf[12] = 2112;
    *(_QWORD *)&buf[14] = v8;
    *(_WORD *)&buf[22] = 2112;
    v23 = v6;
    _os_log_impl(&dword_2218F0000, v11, OS_LOG_TYPE_DEBUG, "%{public}@Read matter paths from EP(%@)/CL(%@)", buf, 0x20u);

  }
  objc_autoreleasePoolPop(v9);
  *(_QWORD *)buf = 0;
  *(_QWORD *)&buf[8] = buf;
  *(_QWORD *)&buf[16] = 0x3032000000;
  v23 = __Block_byref_object_copy__114488;
  v24 = __Block_byref_object_dispose__114489;
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v25 = (id)objc_claimAutoreleasedReturnValue();
  -[HMDMatterAccessoryAdapter _fetchAttributePathsForCluster:endpoint:](v10, "_fetchAttributePathsForCluster:endpoint:", v6, v8);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v18[0] = MEMORY[0x24BDAC760];
  v18[1] = 3221225472;
  v18[2] = __66__HMDMatterAccessoryAdapter__fetchMatterPathsForCluster_endpoint___block_invoke;
  v18[3] = &unk_24E785028;
  v21 = buf;
  v18[4] = v10;
  v14 = v6;
  v19 = v14;
  v15 = v8;
  v20 = v15;
  objc_msgSend(v13, "then:", v18);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  _Block_object_dispose(buf, 8);
  return v16;
}

- (id)_fetchAttributePathsForCluster:(id)a3 endpoint:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  void *v13;
  HMDMatterAccessoryAdapter *v15;
  SEL v16;
  id v17;
  id v18;
  _QWORD v19[4];
  id v20;
  id v21;
  HMDMatterAccessoryAdapter *v22;

  v6 = a3;
  v7 = a4;
  if (v6 && (v8 = v7) != 0)
  {
    +[HMDMatterPath PathWithAttributeID:endpointID:clusterID:](HMDMatterPath, "PathWithAttributeID:endpointID:clusterID:", &unk_24E96B4C8, v7, v6);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDMatterAccessoryAdapter retryFetchTimeout](self, "retryFetchTimeout");
    -[HMDMatterAccessoryAdapter readFromAttributePath:retryTimeout:](self, "readFromAttributePath:retryTimeout:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v19[0] = MEMORY[0x24BDAC760];
    v19[1] = 3221225472;
    v19[2] = __69__HMDMatterAccessoryAdapter__fetchAttributePathsForCluster_endpoint___block_invoke;
    v19[3] = &unk_24E78A3B0;
    v20 = v8;
    v21 = v6;
    v22 = self;
    v11 = v6;
    v12 = v8;
    objc_msgSend(v10, "then:", v19);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    return v13;
  }
  else
  {
    v15 = (HMDMatterAccessoryAdapter *)_HMFPreconditionFailure();
    return -[HMDMatterAccessoryAdapter _fetchCommandPathsForCluster:endpoint:](v15, v16, v17, v18);
  }
}

- (id)_fetchCommandPathsForCluster:(id)a3 endpoint:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  void *v13;
  HMDMatterAccessoryAdapter *v15;
  SEL v16;
  id v17;
  id v18;
  _QWORD v19[4];
  id v20;
  id v21;
  HMDMatterAccessoryAdapter *v22;

  v6 = a3;
  v7 = a4;
  if (v6 && (v8 = v7) != 0)
  {
    +[HMDMatterPath PathWithAttributeID:endpointID:clusterID:](HMDMatterPath, "PathWithAttributeID:endpointID:clusterID:", &unk_24E96B4E0, v7, v6);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDMatterAccessoryAdapter retryFetchTimeout](self, "retryFetchTimeout");
    -[HMDMatterAccessoryAdapter readFromAttributePath:retryTimeout:](self, "readFromAttributePath:retryTimeout:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v19[0] = MEMORY[0x24BDAC760];
    v19[1] = 3221225472;
    v19[2] = __67__HMDMatterAccessoryAdapter__fetchCommandPathsForCluster_endpoint___block_invoke;
    v19[3] = &unk_24E78A3B0;
    v20 = v8;
    v21 = v6;
    v22 = self;
    v11 = v6;
    v12 = v8;
    objc_msgSend(v10, "then:", v19);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    return v13;
  }
  else
  {
    v15 = (HMDMatterAccessoryAdapter *)_HMFPreconditionFailure();
    return -[HMDMatterAccessoryAdapter _fetchEventPathsForCluster:endpoint:](v15, v16, v17, v18);
  }
}

- (id)_fetchEventPathsForCluster:(id)a3 endpoint:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  void *v13;
  HMDMatterAccessoryAdapter *v15;
  SEL v16;
  id v17;
  double v18;
  _QWORD v19[4];
  id v20;
  id v21;
  HMDMatterAccessoryAdapter *v22;

  v6 = a3;
  v7 = a4;
  if (v6 && (v8 = v7) != 0)
  {
    +[HMDMatterPath PathWithAttributeID:endpointID:clusterID:](HMDMatterPath, "PathWithAttributeID:endpointID:clusterID:", &unk_24E96B4F8, v7, v6);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDMatterAccessoryAdapter retryFetchTimeout](self, "retryFetchTimeout");
    -[HMDMatterAccessoryAdapter readFromAttributePath:retryTimeout:](self, "readFromAttributePath:retryTimeout:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v19[0] = MEMORY[0x24BDAC760];
    v19[1] = 3221225472;
    v19[2] = __65__HMDMatterAccessoryAdapter__fetchEventPathsForCluster_endpoint___block_invoke;
    v19[3] = &unk_24E78A3B0;
    v20 = v8;
    v21 = v6;
    v22 = self;
    v11 = v6;
    v12 = v8;
    objc_msgSend(v10, "then:", v19);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    return v13;
  }
  else
  {
    v15 = (HMDMatterAccessoryAdapter *)_HMFPreconditionFailure();
    return -[HMDMatterAccessoryAdapter _readFromAttributePath:retryTimeout:](v15, v16, v17, v18);
  }
}

- (id)_readFromAttributePath:(id)a3 retryTimeout:(double)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  HMDMatterAccessoryAdapter *v15;
  NSObject *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  _QWORD v24[4];
  id v25;
  id v26;
  HMDMatterAccessoryAdapter *v27;
  uint8_t buf[4];
  void *v29;
  __int16 v30;
  void *v31;
  __int16 v32;
  void *v33;
  uint64_t v34;

  v34 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  if (!v6)
    _HMFPreconditionFailure();
  v7 = v6;
  -[HMDMatterAccessoryAdapter mtrDevice](self, "mtrDevice");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    objc_msgSend(v7, "endpointID");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "clusterID");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "attributeID");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "readAttributeWithEndpointID:clusterID:attributeID:params:", v9, v10, v11, 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    v13 = objc_msgSend(v12, "count");
    if (a4 == 0.0 || v13)
    {
      objc_msgSend(MEMORY[0x24BE3F180], "futureWithValue:", v12);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v14 = (void *)MEMORY[0x227676638]();
      v15 = self;
      HMFGetOSLogHandle();
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
      {
        HMFGetLogIdentifier();
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", a4);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        v29 = v17;
        v30 = 2112;
        v31 = v7;
        v32 = 2112;
        v33 = v18;
        _os_log_impl(&dword_2218F0000, v16, OS_LOG_TYPE_DEBUG, "%{public}@Attempting to retry read from %@ after %@s", buf, 0x20u);

      }
      objc_autoreleasePoolPop(v14);
      objc_msgSend(MEMORY[0x24BE3F180], "futureWithDelay:", a4);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v24[0] = MEMORY[0x24BDAC760];
      v24[1] = 3221225472;
      v24[2] = __65__HMDMatterAccessoryAdapter__readFromAttributePath_retryTimeout___block_invoke;
      v24[3] = &unk_24E785050;
      v25 = v8;
      v26 = v7;
      v27 = v15;
      objc_msgSend(v19, "then:", v24);
      v20 = (void *)objc_claimAutoreleasedReturnValue();

    }
  }
  else
  {
    v21 = (void *)MEMORY[0x24BE3F180];
    objc_msgSend(MEMORY[0x24BDD1540], "hmErrorWithCode:", 21);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "futureWithError:", v22);
    v20 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v20;
}

- (id)readFromAttributePath:(id)a3 retryTimeout:(double)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  HMDMatterAccessoryAdapter *v13;
  SEL v14;
  id v15;
  double v16;
  _QWORD v17[5];
  id v18;
  double v19;

  v6 = a3;
  if (v6)
  {
    v7 = v6;
    v8 = (void *)MEMORY[0x24BE3F180];
    -[HMDMatterAccessoryAdapter workContext](self, "workContext");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v17[0] = MEMORY[0x24BDAC760];
    v17[1] = 3221225472;
    v17[2] = __64__HMDMatterAccessoryAdapter_readFromAttributePath_retryTimeout___block_invoke;
    v17[3] = &unk_24E785078;
    v17[4] = self;
    v18 = v7;
    v19 = a4;
    v10 = v7;
    objc_msgSend(v8, "inContext:perform:", v9, v17);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    return v11;
  }
  else
  {
    v13 = (HMDMatterAccessoryAdapter *)_HMFPreconditionFailure();
    return -[HMDMatterAccessoryAdapter readFromAttributePaths:retryTimeout:](v13, v14, v15, v16);
  }
}

- (id)readFromAttributePaths:(id)a3 retryTimeout:(double)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id result;
  HMDMatterAccessoryAdapter *v13;
  SEL v14;
  id v15;
  id v16;
  double v17;
  _QWORD v18[6];

  v6 = a3;
  if (v6)
  {
    v7 = v6;
    v18[0] = MEMORY[0x24BDAC760];
    v18[1] = 3221225472;
    v18[2] = __65__HMDMatterAccessoryAdapter_readFromAttributePaths_retryTimeout___block_invoke;
    v18[3] = &unk_24E7850A0;
    v18[4] = self;
    *(double *)&v18[5] = a4;
    objc_msgSend(v6, "na_map:", v18);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BE3F180], "allSettled:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDMatterAccessoryAdapter workContext](self, "workContext");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "inContext:then:", v10, &__block_literal_global_63);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    return v11;
  }
  else
  {
    v13 = (HMDMatterAccessoryAdapter *)_HMFPreconditionFailure();
    -[HMDMatterAccessoryAdapter readFromAttributePath:retryTimeout:completion:](v13, v14, v15, v17, v16);
  }
  return result;
}

- (void)readFromAttributePath:(id)a3 retryTimeout:(double)a4 completion:(id)a5
{
  id v8;
  void *v9;
  id v10;
  id v11;
  _QWORD v12[4];
  id v13;

  v8 = a5;
  -[HMDMatterAccessoryAdapter readFromAttributePath:retryTimeout:](self, "readFromAttributePath:retryTimeout:", a3, a4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __75__HMDMatterAccessoryAdapter_readFromAttributePath_retryTimeout_completion___block_invoke;
  v12[3] = &unk_24E7850E8;
  v13 = v8;
  v10 = v8;
  v11 = (id)objc_msgSend(v9, "then:", v12);

}

- (NSArray)mtrPaths
{
  os_unfair_lock_s *p_lock;
  void *v4;

  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  v4 = (void *)-[NSArray copy](self->_mtrPaths, "copy");
  os_unfair_lock_unlock(p_lock);
  return (NSArray *)v4;
}

- (NSArray)mtrAttributePaths
{
  void *v2;
  void *v3;

  -[HMDMatterAccessoryAdapter mtrPaths](self, "mtrPaths");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "na_map:", &__block_literal_global_65_114465);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v3;
}

- (NSArray)mtrCommandPaths
{
  void *v2;
  void *v3;

  -[HMDMatterAccessoryAdapter mtrPaths](self, "mtrPaths");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "na_map:", &__block_literal_global_66);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v3;
}

- (NSArray)mtrEventPaths
{
  void *v2;
  void *v3;

  -[HMDMatterAccessoryAdapter mtrPaths](self, "mtrPaths");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "na_map:", &__block_literal_global_67_114461);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v3;
}

- (BOOL)supportsMTRPath:(id)a3
{
  id v4;
  void *v5;
  id v6;
  char v7;
  _QWORD v9[4];
  id v10;

  v4 = a3;
  -[HMDMatterAccessoryAdapter mtrPaths](self, "mtrPaths");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __45__HMDMatterAccessoryAdapter_supportsMTRPath___block_invoke;
  v9[3] = &unk_24E785190;
  v10 = v4;
  v6 = v4;
  v7 = objc_msgSend(v5, "na_any:", v9);

  return v7;
}

- (NSArray)matterPaths
{
  os_unfair_lock_s *p_lock;
  void *v4;

  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  v4 = (void *)-[NSMutableArray copy](self->_hmdMatterPaths, "copy");
  os_unfair_lock_unlock(p_lock);
  return (NSArray *)v4;
}

- (id)matterPathWithUUID:(id)a3
{
  id v4;
  os_unfair_lock_s *p_lock;
  void *v6;

  v4 = a3;
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  -[NSMutableArray hmf_firstObjectWithUUID:](self->_hmdMatterPaths, "hmf_firstObjectWithUUID:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  os_unfair_lock_unlock(p_lock);

  return v6;
}

- (NSArray)attributePaths
{
  void *v2;
  void *v3;

  -[HMDMatterAccessoryAdapter matterPaths](self, "matterPaths");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "na_filter:", &__block_literal_global_70_114459);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v3;
}

- (NSArray)commandPaths
{
  void *v2;
  void *v3;

  -[HMDMatterAccessoryAdapter matterPaths](self, "matterPaths");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "na_filter:", &__block_literal_global_71_114458);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v3;
}

- (NSArray)eventPaths
{
  void *v2;
  void *v3;

  -[HMDMatterAccessoryAdapter matterPaths](self, "matterPaths");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "na_filter:", &__block_literal_global_72);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v3;
}

- (id)backingStoreTransactionWithName:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v4 = a3;
  -[HMDMatterAccessoryAdapter accessory](self, "accessory");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "home");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "backingStore");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  +[HMDBackingStoreTransactionOptions defaultXPCOptions](HMDBackingStoreTransactionOptions, "defaultXPCOptions");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "transaction:options:", v4, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)_processAccessoryConfigurationWithPaths:(id)a3
{
  return (id)objc_msgSend(MEMORY[0x24BE3F180], "futureWithNoValue", a3);
}

- (id)addMatterPaths:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  _QWORD v10[5];
  id v11;

  v4 = a3;
  v5 = (void *)MEMORY[0x24BE3F180];
  -[HMDMatterAccessoryAdapter workContext](self, "workContext");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __44__HMDMatterAccessoryAdapter_addMatterPaths___block_invoke;
  v10[3] = &unk_24E79B238;
  v10[4] = self;
  v11 = v4;
  v7 = v4;
  objc_msgSend(v5, "inContext:perform:", v6, v10);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)removeMatterPaths:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  _QWORD v10[5];
  id v11;

  v4 = a3;
  v5 = (void *)MEMORY[0x24BE3F180];
  -[HMDMatterAccessoryAdapter workContext](self, "workContext");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __47__HMDMatterAccessoryAdapter_removeMatterPaths___block_invoke;
  v10[3] = &unk_24E79B238;
  v10[4] = self;
  v11 = v4;
  v7 = v4;
  objc_msgSend(v5, "inContext:perform:", v6, v10);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)_addMatterPaths:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  HMDMatterAccessoryAdapter *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  _QWORD v18[4];
  id v19;
  uint8_t buf[4];
  void *v21;
  __int16 v22;
  void *v23;
  __int16 v24;
  void *v25;
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (v4)
  {
    objc_msgSend(MEMORY[0x24BDBCF20], "setWithArray:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = 0;
  }
  if (objc_msgSend(v5, "count"))
  {
    v6 = (void *)MEMORY[0x227676638]();
    v7 = self;
    HMFGetOSLogHandle();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", objc_msgSend(v5, "count"));
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v21 = v9;
      v22 = 2112;
      v23 = v10;
      v24 = 2112;
      v25 = v5;
      _os_log_impl(&dword_2218F0000, v8, OS_LOG_TYPE_INFO, "%{public}@Adding %@ matter paths %@", buf, 0x20u);

    }
    objc_autoreleasePoolPop(v6);
    -[HMDMatterAccessoryAdapter accessory](v7, "accessory");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "uuid");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v5, "allObjects");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v18[0] = MEMORY[0x24BDAC760];
    v18[1] = 3221225472;
    v18[2] = __45__HMDMatterAccessoryAdapter__addMatterPaths___block_invoke;
    v18[3] = &unk_24E785238;
    v19 = v12;
    v14 = v12;
    objc_msgSend(v13, "na_map:", v18);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    -[HMDMatterAccessoryAdapter _runAccessoryTransactions:](v7, "_runAccessoryTransactions:", v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(MEMORY[0x24BE3F180], "futureWithNoValue");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v16;
}

- (id)_removeMatterPaths:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  HMDMatterAccessoryAdapter *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  _QWORD v18[4];
  id v19;
  uint8_t buf[4];
  void *v21;
  __int16 v22;
  void *v23;
  __int16 v24;
  void *v25;
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (v4)
  {
    objc_msgSend(MEMORY[0x24BDBCF20], "setWithArray:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = 0;
  }
  if (objc_msgSend(v5, "count"))
  {
    v6 = (void *)MEMORY[0x227676638]();
    v7 = self;
    HMFGetOSLogHandle();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", objc_msgSend(v5, "count"));
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v21 = v9;
      v22 = 2112;
      v23 = v10;
      v24 = 2112;
      v25 = v5;
      _os_log_impl(&dword_2218F0000, v8, OS_LOG_TYPE_INFO, "%{public}@Removing %@ matter paths %@", buf, 0x20u);

    }
    objc_autoreleasePoolPop(v6);
    -[HMDMatterAccessoryAdapter accessory](v7, "accessory");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "uuid");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v5, "allObjects");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v18[0] = MEMORY[0x24BDAC760];
    v18[1] = 3221225472;
    v18[2] = __48__HMDMatterAccessoryAdapter__removeMatterPaths___block_invoke;
    v18[3] = &unk_24E785238;
    v19 = v12;
    v14 = v12;
    objc_msgSend(v13, "na_map:", v18);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    -[HMDMatterAccessoryAdapter _runAccessoryTransactions:](v7, "_runAccessoryTransactions:", v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(MEMORY[0x24BE3F180], "futureWithNoValue");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v16;
}

- (id)_runAccessoryTransactions:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  _QWORD v8[5];
  id v9;
  id v10;
  id v11;

  v4 = a3;
  if (objc_msgSend(v4, "count"))
  {
    -[HMDMatterAccessoryAdapter backingStoreTransactionWithName:](self, "backingStoreTransactionWithName:", CFSTR("AccessoryUpdated"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObjects:", v4);
    v11 = 0;
    objc_msgSend(MEMORY[0x24BE3F180], "futureWithPromise:", &v11);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v8[0] = MEMORY[0x24BDAC760];
    v8[1] = 3221225472;
    v8[2] = __55__HMDMatterAccessoryAdapter__runAccessoryTransactions___block_invoke;
    v8[3] = &unk_24E799FD0;
    v8[4] = self;
    v9 = v4;
    v10 = v11;
    objc_msgSend(v5, "run:", v8);

  }
  else
  {
    objc_msgSend(MEMORY[0x24BE3F180], "futureWithNoValue");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v6;
}

- (void)removeMatterPathModel:(id)a3 message:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  HMDMatterAccessoryAdapter *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  void *v16;
  int v17;
  void *v18;
  __int16 v19;
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  objc_msgSend(v6, "uuid");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDMatterAccessoryAdapter matterPathWithUUID:](self, "matterPathWithUUID:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    os_unfair_lock_lock_with_options();
    -[NSMutableArray removeObject:](self->_hmdMatterPaths, "removeObject:", v9);
    os_unfair_lock_unlock(&self->_lock);
    objc_msgSend(v7, "transactionResult");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "markChanged");

    objc_msgSend(v7, "respondWithSuccess");
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
      objc_msgSend(v6, "uuid");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = 138543618;
      v18 = v14;
      v19 = 2112;
      v20 = v15;
      _os_log_impl(&dword_2218F0000, v13, OS_LOG_TYPE_ERROR, "%{public}@Couldn't find matter path with UUID %@ to remove.", (uint8_t *)&v17, 0x16u);

    }
    objc_autoreleasePoolPop(v11);
    objc_msgSend(MEMORY[0x24BDD1540], "hmErrorWithCode:", 2);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "respondWithError:", v16);

  }
}

- (void)addMatterPathModel:(id)a3 message:(id)a4
{
  id v6;
  id v7;
  void *v8;
  HMDMatterPath *v9;
  void *v10;
  HMDMatterAccessoryAdapter *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  HMDMatterPath *v15;
  void *v16;
  void *v17;
  HMDMatterAccessoryAdapter *v18;
  NSObject *v19;
  void *v20;
  os_unfair_lock_s *p_lock;
  void *hmdMatterPaths;
  uint64_t v23;
  void **p_hmdMatterPaths;
  void *v25;
  void *v26;
  int v27;
  void *v28;
  __int16 v29;
  HMDMatterPath *v30;
  uint64_t v31;

  v31 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  objc_msgSend(v6, "uuid");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDMatterAccessoryAdapter matterPathWithUUID:](self, "matterPathWithUUID:", v8);
  v9 = (HMDMatterPath *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    v10 = (void *)MEMORY[0x227676638]();
    v11 = self;
    HMFGetOSLogHandle();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = 138543618;
      v28 = v13;
      v29 = 2112;
      v30 = v9;
      _os_log_impl(&dword_2218F0000, v12, OS_LOG_TYPE_ERROR, "%{public}@Can't add an existing matter path: %@.", (uint8_t *)&v27, 0x16u);

    }
    objc_autoreleasePoolPop(v10);
    objc_msgSend(MEMORY[0x24BDD1540], "hmErrorWithCode:", 3);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "respondWithError:", v14);

  }
  else
  {
    v15 = [HMDMatterPath alloc];
    -[HMDMatterAccessoryAdapter accessory](self, "accessory");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = -[HMDMatterPath initWithPathModel:accessory:](v15, "initWithPathModel:accessory:", v6, v16);

    v17 = (void *)MEMORY[0x227676638]();
    v18 = self;
    HMFGetOSLogHandle();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
    {
      HMFGetLogIdentifier();
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = 138543618;
      v28 = v20;
      v29 = 2112;
      v30 = v9;
      _os_log_impl(&dword_2218F0000, v19, OS_LOG_TYPE_DEBUG, "%{public}@Adding new matter path: %@.", (uint8_t *)&v27, 0x16u);

    }
    objc_autoreleasePoolPop(v17);
    p_lock = &v18->_lock;
    os_unfair_lock_lock_with_options();
    hmdMatterPaths = v18->_hmdMatterPaths;
    if (!hmdMatterPaths)
    {
      objc_msgSend(MEMORY[0x24BDBCEB8], "array");
      v23 = objc_claimAutoreleasedReturnValue();
      p_hmdMatterPaths = (void **)&v18->_hmdMatterPaths;
      v25 = *p_hmdMatterPaths;
      *p_hmdMatterPaths = (void *)v23;

      hmdMatterPaths = *p_hmdMatterPaths;
    }
    objc_msgSend(hmdMatterPaths, "addObject:", v9);
    os_unfair_lock_unlock(p_lock);
    objc_msgSend(v7, "transactionResult");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "markChanged");

    objc_msgSend(v7, "respondWithSuccess");
  }

}

- (void)_updateWithAccessoryModel:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  NSNumber *v7;
  NSNumber *matterNodeID;
  NSNumber *v9;
  NSNumber *matterVendorID;
  NSNumber *v11;
  NSNumber *matterProductID;
  NSNumber *v13;
  NSNumber *matterWEDSupport;
  NSString *v15;
  NSString *matterExtendedMACAddress;
  NSData *v17;
  NSData *matterPairingsData;
  id v19;

  v19 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v4 = v19;
  else
    v4 = 0;
  v5 = v4;
  v6 = v5;
  if (v5)
  {
    objc_msgSend(v5, "chipNodeID");
    v7 = (NSNumber *)objc_claimAutoreleasedReturnValue();
    matterNodeID = self->_matterNodeID;
    self->_matterNodeID = v7;

    objc_msgSend(v6, "chipVendorID");
    v9 = (NSNumber *)objc_claimAutoreleasedReturnValue();
    matterVendorID = self->_matterVendorID;
    self->_matterVendorID = v9;

    objc_msgSend(v6, "chipProductID");
    v11 = (NSNumber *)objc_claimAutoreleasedReturnValue();
    matterProductID = self->_matterProductID;
    self->_matterProductID = v11;

    objc_msgSend(v6, "chipWEDSupport");
    v13 = (NSNumber *)objc_claimAutoreleasedReturnValue();
    matterWEDSupport = self->_matterWEDSupport;
    self->_matterWEDSupport = v13;

    objc_msgSend(v6, "chipExtendedMACAddress");
    v15 = (NSString *)objc_claimAutoreleasedReturnValue();
    matterExtendedMACAddress = self->_matterExtendedMACAddress;
    self->_matterExtendedMACAddress = v15;

    objc_msgSend(v6, "chipPairingsData");
    v17 = (NSData *)objc_claimAutoreleasedReturnValue();
    matterPairingsData = self->_matterPairingsData;
    self->_matterPairingsData = v17;

  }
}

- (void)populateAccessoryModel:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  v12 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v4 = v12;
  else
    v4 = 0;
  v5 = v4;
  if (v5)
  {
    -[HMDMatterAccessoryAdapter matterNodeID](self, "matterNodeID");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setChipNodeID:", v6);

    -[HMDMatterAccessoryAdapter matterVendorID](self, "matterVendorID");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setChipVendorID:", v7);

    -[HMDMatterAccessoryAdapter matterProductID](self, "matterProductID");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setChipProductID:", v8);

    -[HMDMatterAccessoryAdapter matterWEDSupport](self, "matterWEDSupport");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setChipWEDSupport:", v9);

    -[HMDMatterAccessoryAdapter matterExtendedMACAddress](self, "matterExtendedMACAddress");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setChipExtendedMACAddress:", v10);

    -[HMDMatterAccessoryAdapter matterPairingsData](self, "matterPairingsData");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setChipPairingsData:", v11);

  }
}

- (id)shortDescription
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v4 = objc_opt_class();
  -[HMDMatterAccessoryAdapter accessory](self, "accessory");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "identifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (OS_dispatch_queue)workQueue
{
  return self->_workQueue;
}

- (void)setWorkQueue:(id)a3
{
  objc_storeStrong((id *)&self->_workQueue, a3);
}

- (HMDAccessory)accessory
{
  return (HMDAccessory *)objc_loadWeakRetained((id *)&self->_accessory);
}

- (void)setAccessory:(id)a3
{
  objc_storeWeak((id *)&self->_accessory, a3);
}

- (NSNumber)matterFabricID
{
  return self->_matterFabricID;
}

- (void)setMatterFabricID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (NSNumber)matterNodeID
{
  return self->_matterNodeID;
}

- (void)setMatterNodeID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (NSNumber)matterVendorID
{
  return self->_matterVendorID;
}

- (void)setMatterVendorID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (NSNumber)matterProductID
{
  return self->_matterProductID;
}

- (void)setMatterProductID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 80);
}

- (NSNumber)matterWEDSupport
{
  return self->_matterWEDSupport;
}

- (void)setMatterWEDSupport:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 88);
}

- (NSString)matterExtendedMACAddress
{
  return self->_matterExtendedMACAddress;
}

- (void)setMatterExtendedMACAddress:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 96);
}

- (NSData)matterPairingsData
{
  return self->_matterPairingsData;
}

- (void)setMatterPairingsData:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 104);
}

- (BOOL)fetchInProgress
{
  return self->_fetchInProgress;
}

- (void)setFetchInProgress:(BOOL)a3
{
  self->_fetchInProgress = a3;
}

- (MTRDevice)testMatterDevice
{
  return self->_testMatterDevice;
}

- (void)setTestMatterDevice:(id)a3
{
  objc_storeStrong((id *)&self->_testMatterDevice, a3);
}

- (double)retryFetchTimeout
{
  return self->_retryFetchTimeout;
}

- (void)setRetryFetchTimeout:(double)a3
{
  self->_retryFetchTimeout = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_testMatterDevice, 0);
  objc_storeStrong((id *)&self->_matterPairingsData, 0);
  objc_storeStrong((id *)&self->_matterExtendedMACAddress, 0);
  objc_storeStrong((id *)&self->_matterWEDSupport, 0);
  objc_storeStrong((id *)&self->_matterProductID, 0);
  objc_storeStrong((id *)&self->_matterVendorID, 0);
  objc_storeStrong((id *)&self->_matterNodeID, 0);
  objc_storeStrong((id *)&self->_matterFabricID, 0);
  objc_destroyWeak((id *)&self->_accessory);
  objc_storeStrong((id *)&self->_workQueue, 0);
  objc_storeStrong((id *)&self->_mtrPaths, 0);
  objc_storeStrong((id *)&self->_hmdMatterPaths, 0);
}

void __55__HMDMatterAccessoryAdapter__runAccessoryTransactions___block_invoke(id *a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  NSObject *v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  __int16 v11;
  void *v12;
  __int16 v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  v4 = (void *)MEMORY[0x227676638]();
  v5 = a1[4];
  HMFGetOSLogHandle();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", objc_msgSend(a1[5], "count"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = 138543874;
    v10 = v7;
    v11 = 2112;
    v12 = v8;
    v13 = 2112;
    v14 = v3;
    _os_log_impl(&dword_2218F0000, v6, OS_LOG_TYPE_INFO, "%{public}@Ran %@ transactions with error: %@", (uint8_t *)&v9, 0x20u);

  }
  objc_autoreleasePoolPop(v4);
  objc_msgSend(a1[6], "fulfillWithNoValue");

}

id __48__HMDMatterAccessoryAdapter__removeMatterPaths___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  HMDMatterPathModel *v4;
  void *v5;
  HMDMatterPathModel *v6;

  v3 = a2;
  v4 = [HMDMatterPathModel alloc];
  objc_msgSend(v3, "uuid");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[HMDBackingStoreModelObject initWithObjectChangeType:uuid:parentUUID:](v4, "initWithObjectChangeType:uuid:parentUUID:", 3, v5, *(_QWORD *)(a1 + 32));

  objc_msgSend(v3, "populateModelObject:", v6);
  return v3;
}

id __45__HMDMatterAccessoryAdapter__addMatterPaths___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  HMDMatterPathModel *v4;
  void *v5;
  HMDMatterPathModel *v6;

  v3 = a2;
  v4 = [HMDMatterPathModel alloc];
  objc_msgSend(v3, "uuid");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[HMDBackingStoreModelObject initWithObjectChangeType:uuid:parentUUID:](v4, "initWithObjectChangeType:uuid:parentUUID:", 1, v5, *(_QWORD *)(a1 + 32));

  objc_msgSend(v3, "populateModelObject:", v6);
  return v3;
}

uint64_t __47__HMDMatterAccessoryAdapter_removeMatterPaths___block_invoke(uint64_t a1)
{
  id v1;
  void *v2;
  uint64_t v4;

  objc_msgSend(*(id *)(a1 + 32), "_removeMatterPaths:", *(_QWORD *)(a1 + 40));
  v1 = (id)objc_claimAutoreleasedReturnValue();
  if (v1)
  {
    v2 = v1;

    return 3;
  }
  else
  {
    v4 = _HMFPreconditionFailure();
    return __44__HMDMatterAccessoryAdapter_addMatterPaths___block_invoke(v4);
  }
}

uint64_t __44__HMDMatterAccessoryAdapter_addMatterPaths___block_invoke(uint64_t a1)
{
  id v1;
  void *v2;
  uint64_t v4;

  objc_msgSend(*(id *)(a1 + 32), "_addMatterPaths:", *(_QWORD *)(a1 + 40));
  v1 = (id)objc_claimAutoreleasedReturnValue();
  if (v1)
  {
    v2 = v1;

    return 3;
  }
  else
  {
    v4 = _HMFPreconditionFailure();
    return __39__HMDMatterAccessoryAdapter_eventPaths__block_invoke(v4);
  }
}

BOOL __39__HMDMatterAccessoryAdapter_eventPaths__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  _BOOL8 v3;

  objc_msgSend(a2, "eventID");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 != 0;

  return v3;
}

BOOL __41__HMDMatterAccessoryAdapter_commandPaths__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  _BOOL8 v3;

  objc_msgSend(a2, "commandID");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 != 0;

  return v3;
}

BOOL __43__HMDMatterAccessoryAdapter_attributePaths__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  _BOOL8 v3;

  objc_msgSend(a2, "attributeID");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 != 0;

  return v3;
}

uint64_t __45__HMDMatterAccessoryAdapter_supportsMTRPath___block_invoke()
{
  return HMFEqualObjects();
}

id __42__HMDMatterAccessoryAdapter_mtrEventPaths__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  id v4;

  v2 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v3 = v2;
  else
    v3 = 0;
  v4 = v3;

  return v4;
}

id __44__HMDMatterAccessoryAdapter_mtrCommandPaths__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  id v4;

  v2 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v3 = v2;
  else
    v3 = 0;
  v4 = v3;

  return v4;
}

id __46__HMDMatterAccessoryAdapter_mtrAttributePaths__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  id v4;

  v2 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v3 = v2;
  else
    v3 = 0;
  v4 = v3;

  return v4;
}

uint64_t __75__HMDMatterAccessoryAdapter_readFromAttributePath_retryTimeout_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;

  v3 = a2;
  v4 = _Block_copy(*(const void **)(a1 + 32));
  v5 = v4;
  if (v4)
    (*((void (**)(void *, id))v4 + 2))(v4, v3);

  return 1;
}

uint64_t __65__HMDMatterAccessoryAdapter_readFromAttributePaths_retryTimeout___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "readFromAttributePath:retryTimeout:", a2, *(double *)(a1 + 40));
}

uint64_t __65__HMDMatterAccessoryAdapter_readFromAttributePaths_retryTimeout___block_invoke_2(uint64_t a1, void *a2)
{
  objc_msgSend(a2, "na_arrayByFlattening");
  objc_claimAutoreleasedReturnValue();
  return 1;
}

uint64_t __64__HMDMatterAccessoryAdapter_readFromAttributePath_retryTimeout___block_invoke(uint64_t a1)
{
  id v1;
  void *v2;
  uint64_t v4;
  void *v5;

  objc_msgSend(*(id *)(a1 + 32), "_readFromAttributePath:retryTimeout:", *(_QWORD *)(a1 + 40), *(double *)(a1 + 48));
  v1 = (id)objc_claimAutoreleasedReturnValue();
  if (v1)
  {
    v2 = v1;

    return 3;
  }
  else
  {
    v4 = _HMFPreconditionFailure();
    return __65__HMDMatterAccessoryAdapter__readFromAttributePath_retryTimeout___block_invoke(v4, v5);
  }
}

uint64_t __65__HMDMatterAccessoryAdapter__readFromAttributePath_retryTimeout___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  NSObject *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  int v16;
  void *v17;
  __int16 v18;
  uint64_t v19;
  __int16 v20;
  void *v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  v4 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "endpointID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "clusterID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "attributeID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "readAttributeWithEndpointID:clusterID:attributeID:params:", v5, v6, v7, 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = (void *)MEMORY[0x227676638]();
  v10 = *(id *)(a1 + 48);
  HMFGetOSLogHandle();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
  {
    HMFGetLogIdentifier();
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = *(_QWORD *)(a1 + 40);
    v16 = 138543874;
    v17 = v12;
    v18 = 2112;
    v19 = v13;
    v20 = 2112;
    v21 = v8;
    _os_log_impl(&dword_2218F0000, v11, OS_LOG_TYPE_DEBUG, "%{public}@Retried and receive response for path: %@ with result: %@", (uint8_t *)&v16, 0x20u);

  }
  objc_autoreleasePoolPop(v9);
  v14 = (void *)MEMORY[0x24BDBD1B8];
  if (v8)
    v14 = v8;
  v14;

  return 1;
}

uint64_t __65__HMDMatterAccessoryAdapter__fetchEventPathsForCluster_endpoint___block_invoke(id *a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  id v10;
  NSObject *v11;
  void *v12;
  void *v13;
  id v14;
  id v15;
  uint64_t v17;
  uint64_t v18;
  id (*v19)(uint64_t, void *);
  void *v20;
  id v21;
  id v22;
  uint8_t buf[4];
  void *v24;
  __int16 v25;
  void *v26;
  __int16 v27;
  id v28;
  __int16 v29;
  id v30;
  __int16 v31;
  void *v32;
  uint64_t v33;

  v33 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  objc_msgSend(v3, "hmf_arrayForKey:", CFSTR("value"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = MEMORY[0x24BDAC760];
  v18 = 3221225472;
  v19 = __65__HMDMatterAccessoryAdapter__fetchEventPathsForCluster_endpoint___block_invoke_2;
  v20 = &unk_24E784FB8;
  v21 = a1[4];
  v22 = a1[5];
  objc_msgSend(v4, "na_map:", &v17);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)MEMORY[0x227676638](v5, v6, v7, v8);
  v10 = a1[6];
  HMFGetOSLogHandle();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
  {
    HMFGetLogIdentifier();
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", objc_msgSend(v5, "count", v17, v18, v19, v20, v21));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = a1[4];
    v15 = a1[5];
    *(_DWORD *)buf = 138544386;
    v24 = v12;
    v25 = 2112;
    v26 = v13;
    v27 = 2112;
    v28 = v14;
    v29 = 2112;
    v30 = v15;
    v31 = 2112;
    v32 = v5;
    _os_log_impl(&dword_2218F0000, v11, OS_LOG_TYPE_DEBUG, "%{public}@Read %@ matter event paths for EP(%@)/CL(%@): %@", buf, 0x34u);

  }
  objc_autoreleasePoolPop(v9);

  return 1;
}

id __65__HMDMatterAccessoryAdapter__fetchEventPathsForCluster_endpoint___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(a2, "hmf_dictionaryForKey:", CFSTR("data"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "hmf_numberForKey:", CFSTR("value"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    objc_msgSend(MEMORY[0x24BDDB748], "eventPathWithEndpointID:clusterID:eventID:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

uint64_t __67__HMDMatterAccessoryAdapter__fetchCommandPathsForCluster_endpoint___block_invoke(id *a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  id v10;
  NSObject *v11;
  void *v12;
  void *v13;
  id v14;
  id v15;
  uint64_t v17;
  uint64_t v18;
  id (*v19)(uint64_t, void *);
  void *v20;
  id v21;
  id v22;
  uint8_t buf[4];
  void *v24;
  __int16 v25;
  void *v26;
  __int16 v27;
  id v28;
  __int16 v29;
  id v30;
  __int16 v31;
  void *v32;
  uint64_t v33;

  v33 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  objc_msgSend(v3, "hmf_arrayForKey:", CFSTR("value"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = MEMORY[0x24BDAC760];
  v18 = 3221225472;
  v19 = __67__HMDMatterAccessoryAdapter__fetchCommandPathsForCluster_endpoint___block_invoke_2;
  v20 = &unk_24E784FB8;
  v21 = a1[4];
  v22 = a1[5];
  objc_msgSend(v4, "na_map:", &v17);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)MEMORY[0x227676638](v5, v6, v7, v8);
  v10 = a1[6];
  HMFGetOSLogHandle();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
  {
    HMFGetLogIdentifier();
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", objc_msgSend(v5, "count", v17, v18, v19, v20, v21));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = a1[4];
    v15 = a1[5];
    *(_DWORD *)buf = 138544386;
    v24 = v12;
    v25 = 2112;
    v26 = v13;
    v27 = 2112;
    v28 = v14;
    v29 = 2112;
    v30 = v15;
    v31 = 2112;
    v32 = v5;
    _os_log_impl(&dword_2218F0000, v11, OS_LOG_TYPE_DEBUG, "%{public}@Read %@ matter command paths for EP(%@)/CL(%@): %@", buf, 0x34u);

  }
  objc_autoreleasePoolPop(v9);

  return 1;
}

id __67__HMDMatterAccessoryAdapter__fetchCommandPathsForCluster_endpoint___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(a2, "hmf_dictionaryForKey:", CFSTR("data"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "hmf_numberForKey:", CFSTR("value"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    objc_msgSend(MEMORY[0x24BDDB660], "commandPathWithEndpointID:clusterID:commandID:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

uint64_t __69__HMDMatterAccessoryAdapter__fetchAttributePathsForCluster_endpoint___block_invoke(id *a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  id v10;
  NSObject *v11;
  void *v12;
  void *v13;
  id v14;
  id v15;
  uint64_t v17;
  uint64_t v18;
  id (*v19)(uint64_t, void *);
  void *v20;
  id v21;
  id v22;
  uint8_t buf[4];
  void *v24;
  __int16 v25;
  void *v26;
  __int16 v27;
  id v28;
  __int16 v29;
  id v30;
  __int16 v31;
  void *v32;
  uint64_t v33;

  v33 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  objc_msgSend(v3, "hmf_arrayForKey:", CFSTR("value"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = MEMORY[0x24BDAC760];
  v18 = 3221225472;
  v19 = __69__HMDMatterAccessoryAdapter__fetchAttributePathsForCluster_endpoint___block_invoke_2;
  v20 = &unk_24E784FB8;
  v21 = a1[4];
  v22 = a1[5];
  objc_msgSend(v4, "na_map:", &v17);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)MEMORY[0x227676638](v5, v6, v7, v8);
  v10 = a1[6];
  HMFGetOSLogHandle();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
  {
    HMFGetLogIdentifier();
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", objc_msgSend(v5, "count", v17, v18, v19, v20, v21));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = a1[4];
    v15 = a1[5];
    *(_DWORD *)buf = 138544386;
    v24 = v12;
    v25 = 2112;
    v26 = v13;
    v27 = 2112;
    v28 = v14;
    v29 = 2112;
    v30 = v15;
    v31 = 2112;
    v32 = v5;
    _os_log_impl(&dword_2218F0000, v11, OS_LOG_TYPE_DEBUG, "%{public}@Read %@ matter attribute paths for EP(%@)/CL(%@): %@", buf, 0x34u);

  }
  objc_autoreleasePoolPop(v9);

  return 1;
}

id __69__HMDMatterAccessoryAdapter__fetchAttributePathsForCluster_endpoint___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(a2, "hmf_dictionaryForKey:", CFSTR("data"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "hmf_numberForKey:", CFSTR("value"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    objc_msgSend(MEMORY[0x24BDDB538], "attributePathWithEndpointID:clusterID:attributeID:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

uint64_t __66__HMDMatterAccessoryAdapter__fetchMatterPathsForCluster_endpoint___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  uint64_t v8;
  uint64_t v9;
  _QWORD v10[5];

  v3 = a2;
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), "addObjectsFromArray:", v3);
  objc_msgSend(*(id *)(a1 + 32), "_fetchCommandPathsForCluster:endpoint:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __66__HMDMatterAccessoryAdapter__fetchMatterPathsForCluster_endpoint___block_invoke_2;
  v10[3] = &unk_24E785000;
  v10[4] = *(_QWORD *)(a1 + 56);
  objc_msgSend(v4, "then:", v10);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v6 = v5;

    return 3;
  }
  else
  {
    v8 = _HMFPreconditionFailure();
    return __66__HMDMatterAccessoryAdapter__fetchMatterPathsForCluster_endpoint___block_invoke_2(v8, v9);
  }
}

uint64_t __66__HMDMatterAccessoryAdapter__fetchMatterPathsForCluster_endpoint___block_invoke_2(uint64_t a1, uint64_t a2)
{
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "addObjectsFromArray:", a2);

  return 1;
}

uint64_t __58__HMDMatterAccessoryAdapter__fetchMatterPathsForEndpoint___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  id (*v15)(uint64_t, void *);
  void *v16;
  uint64_t v17;
  id v18;

  v3 = a2;
  objc_msgSend(v3, "hmf_arrayForKey:", CFSTR("value"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = MEMORY[0x24BDAC760];
  v14 = 3221225472;
  v15 = __58__HMDMatterAccessoryAdapter__fetchMatterPathsForEndpoint___block_invoke_2;
  v16 = &unk_24E784FB8;
  v5 = *(void **)(a1 + 40);
  v17 = *(_QWORD *)(a1 + 32);
  v18 = v5;
  objc_msgSend(v4, "na_map:", &v13);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BE3F180], "allSettled:", v6, v13, v14, v15, v16, v17);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "then:", &__block_literal_global_48_114495);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    v9 = v8;

    return 3;
  }
  else
  {
    v11 = _HMFPreconditionFailure();
    return (uint64_t)__58__HMDMatterAccessoryAdapter__fetchMatterPathsForEndpoint___block_invoke_2(v11, v12);
  }
}

id __58__HMDMatterAccessoryAdapter__fetchMatterPathsForEndpoint___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(a2, "hmf_dictionaryForKey:", CFSTR("data"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "hmf_numberForKey:", CFSTR("value"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    objc_msgSend(*(id *)(a1 + 32), "_fetchMatterPathsForCluster:endpoint:", v4, *(_QWORD *)(a1 + 40));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

uint64_t __58__HMDMatterAccessoryAdapter__fetchMatterPathsForEndpoint___block_invoke_3(uint64_t a1, void *a2)
{
  objc_msgSend(a2, "na_arrayByFlattening");
  objc_claimAutoreleasedReturnValue();
  return 1;
}

uint64_t __46__HMDMatterAccessoryAdapter__fetchMatterPaths__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  uint64_t v12;
  uint64_t v13;
  _QWORD v14[5];

  v3 = a2;
  objc_msgSend(v3, "hmf_arrayForKey:", CFSTR("value"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "na_map:", &__block_literal_global_114499);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "mutableCopy");

  objc_msgSend(v6, "addObject:", &unk_24E96B480);
  v14[0] = MEMORY[0x24BDAC760];
  v14[1] = 3221225472;
  v14[2] = __46__HMDMatterAccessoryAdapter__fetchMatterPaths__block_invoke_3;
  v14[3] = &unk_24E784F50;
  v14[4] = *(_QWORD *)(a1 + 32);
  objc_msgSend(v6, "na_map:", v14);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BE3F180], "allSettled:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "then:", &__block_literal_global_40_114500);
  v9 = (id)objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    v10 = v9;

    return 3;
  }
  else
  {
    v12 = _HMFPreconditionFailure();
    return __46__HMDMatterAccessoryAdapter__fetchMatterPaths__block_invoke_3(v12, v13);
  }
}

uint64_t __46__HMDMatterAccessoryAdapter__fetchMatterPaths__block_invoke_3(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "_fetchMatterPathsForEndpoint:", a2);
}

uint64_t __46__HMDMatterAccessoryAdapter__fetchMatterPaths__block_invoke_4(uint64_t a1, void *a2)
{
  void *v2;

  objc_msgSend(a2, "na_arrayByFlattening");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "na_map:", &__block_literal_global_42);
  objc_claimAutoreleasedReturnValue();

  return 1;
}

id __46__HMDMatterAccessoryAdapter__fetchMatterPaths__block_invoke_5(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  id v4;

  v2 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v3 = v2;
  else
    v3 = 0;
  v4 = v3;

  return v4;
}

id __46__HMDMatterAccessoryAdapter__fetchMatterPaths__block_invoke_2(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;

  objc_msgSend(a2, "hmf_dictionaryForKey:", CFSTR("data"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "hmf_numberForKey:", CFSTR("value"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

uint64_t __47__HMDMatterAccessoryAdapter_fetchConfiguration__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  id v10;
  NSObject *v11;
  void *v12;
  id v13;
  void *v14;
  id v15;
  void *v16;
  id v17;
  NSObject *v18;
  void *v19;
  id v20;
  void *v21;
  uint64_t v22;
  _QWORD v24[5];
  uint8_t buf[4];
  void *v26;
  __int16 v27;
  void *v28;
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(a1 + 32), "mtrDevice");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v2)
  {
    v9 = (void *)MEMORY[0x227676638]();
    v10 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v26 = v12;
      _os_log_impl(&dword_2218F0000, v11, OS_LOG_TYPE_ERROR, "%{public}@Nil MTRDevice found", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v9);
    v7 = (void *)MEMORY[0x24BDD1540];
    v8 = 2;
    goto LABEL_9;
  }
  if (objc_msgSend(*(id *)(a1 + 32), "fetchInProgress"))
  {
    v3 = (void *)MEMORY[0x227676638]();
    v4 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v26 = v6;
      v27 = 2112;
      v28 = v2;
      _os_log_impl(&dword_2218F0000, v5, OS_LOG_TYPE_INFO, "%{public}@Fetch configuration is in progress for device: %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v3);
    v7 = (void *)MEMORY[0x24BDD1540];
    v8 = 15;
LABEL_9:
    objc_msgSend(v7, "hmErrorWithCode:", v8);
    v13 = (id)objc_claimAutoreleasedReturnValue();
    v14 = v13;
    if (v13)
    {
      v15 = v13;
    }
    else
    {
      objc_msgSend(MEMORY[0x24BDD1540], "hmfUnspecifiedError");
      objc_claimAutoreleasedReturnValue();
    }

    v22 = 2;
    goto LABEL_17;
  }
  v16 = (void *)MEMORY[0x227676638](objc_msgSend(*(id *)(a1 + 32), "setFetchInProgress:", 1));
  v17 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v18 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v26 = v19;
    v27 = 2112;
    v28 = v2;
    _os_log_impl(&dword_2218F0000, v18, OS_LOG_TYPE_INFO, "%{public}@Fetch configuration from device: %@", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v16);
  objc_msgSend(*(id *)(a1 + 32), "_fetchMatterPaths");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v24[0] = MEMORY[0x24BDAC760];
  v24[1] = 3221225472;
  v24[2] = __47__HMDMatterAccessoryAdapter_fetchConfiguration__block_invoke_27;
  v24[3] = &unk_24E797000;
  v24[4] = *(_QWORD *)(a1 + 32);
  objc_msgSend(v14, "then:", v24);
  v20 = (id)objc_claimAutoreleasedReturnValue();
  if (!v20)
    _HMFPreconditionFailure();
  v21 = v20;

  v22 = 3;
LABEL_17:

  return v22;
}

uint64_t __47__HMDMatterAccessoryAdapter_fetchConfiguration__block_invoke_27(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  id v14;
  void *v15;
  _QWORD v17[5];
  id v18;
  uint8_t buf[4];
  void *v20;
  __int16 v21;
  void *v22;
  __int16 v23;
  void *v24;
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  if (v3)
  {
    objc_msgSend(MEMORY[0x24BDBCF20], "setWithArray:", v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = 0;
  }
  v5 = (void *)MEMORY[0x227676638]();
  v6 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    HMFGetLogIdentifier();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", objc_msgSend(v4, "count"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    v20 = v8;
    v21 = 2112;
    v22 = v9;
    v23 = 2112;
    v24 = v4;
    _os_log_impl(&dword_2218F0000, v7, OS_LOG_TYPE_DEBUG, "%{public}@Fetch configuration completed with %@ matter paths: %@", buf, 0x20u);

  }
  objc_autoreleasePoolPop(v5);
  v10 = *(void **)(a1 + 32);
  objc_msgSend(v4, "allObjects");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "_processAccessoryConfigurationWithPaths:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = MEMORY[0x24BDAC760];
  v17[1] = 3221225472;
  v17[2] = __47__HMDMatterAccessoryAdapter_fetchConfiguration__block_invoke_29;
  v17[3] = &unk_24E799360;
  v17[4] = *(_QWORD *)(a1 + 32);
  v13 = v4;
  v18 = v13;
  objc_msgSend(v12, "then:", v17);
  v14 = (id)objc_claimAutoreleasedReturnValue();
  if (!v14)
    _HMFPreconditionFailure();
  v15 = v14;

  return 3;
}

uint64_t __47__HMDMatterAccessoryAdapter_fetchConfiguration__block_invoke_29(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  NSObject *v6;
  void *v7;
  os_unfair_lock_s *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  int v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  v4 = (void *)MEMORY[0x227676638]();
  v5 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = 138543362;
    v14 = v7;
    _os_log_impl(&dword_2218F0000, v6, OS_LOG_TYPE_INFO, "%{public}@Fetch configuration completed", (uint8_t *)&v13, 0xCu);

  }
  objc_autoreleasePoolPop(v4);
  v8 = (os_unfair_lock_s *)(*(_QWORD *)(a1 + 32) + 8);
  os_unfair_lock_lock_with_options();
  objc_msgSend(*(id *)(a1 + 40), "allObjects");
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = *(_QWORD *)(a1 + 32);
  v11 = *(void **)(v10 + 24);
  *(_QWORD *)(v10 + 24) = v9;

  os_unfair_lock_unlock(v8);
  objc_msgSend(*(id *)(a1 + 32), "setFetchInProgress:", 0);
  objc_msgSend(*(id *)(a1 + 40), "allObjects");
  objc_claimAutoreleasedReturnValue();

  return 1;
}

void __40__HMDMatterAccessoryAdapter_workContext__block_invoke(uint64_t a1)
{
  id v2;
  uint64_t v3;
  void *v4;
  id v5;

  v2 = objc_alloc(MEMORY[0x24BE3F168]);
  objc_msgSend(*(id *)(a1 + 32), "workQueue");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "initWithQueue:", v5);
  v4 = (void *)workContext__hmf_once_v3;
  workContext__hmf_once_v3 = v3;

}

+ (id)MatterAccessoryAdapterWithAccessory:(id)a3 accessoryModel:(id)a4
{
  id v5;
  id v6;
  HMDMatterAccessoryAdapter *v7;

  v5 = a4;
  v6 = a3;
  v7 = -[HMDMatterAccessoryAdapter initWithAccessory:]([HMDMatterAccessoryAdapter alloc], "initWithAccessory:", v6);

  if (v5)
    -[HMDMatterAccessoryAdapter _updateWithAccessoryModel:](v7, "_updateWithAccessoryModel:", v5);

  return v7;
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t38_114522 != -1)
    dispatch_once(&logCategory__hmf_once_t38_114522, &__block_literal_global_77);
  return (id)logCategory__hmf_once_v39_114523;
}

void __40__HMDMatterAccessoryAdapter_logCategory__block_invoke()
{
  uint64_t v0;
  void *v1;

  HMFCreateOSLogHandle();
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)logCategory__hmf_once_v39_114523;
  logCategory__hmf_once_v39_114523 = v0;

}

- (void)testSetMatterPaths:(id)a3
{
  NSMutableArray *v4;
  NSMutableArray *hmdMatterPaths;
  id v6;

  v6 = a3;
  os_unfair_lock_lock_with_options();
  v4 = (NSMutableArray *)objc_msgSend(v6, "mutableCopy");
  hmdMatterPaths = self->_hmdMatterPaths;
  self->_hmdMatterPaths = v4;

  os_unfair_lock_unlock(&self->_lock);
}

- (void)testSetMatterDevice:(id)a3 retryTimeout:(double)a4
{
  -[HMDMatterAccessoryAdapter setTestMatterDevice:](self, "setTestMatterDevice:", a3);
  -[HMDMatterAccessoryAdapter setRetryFetchTimeout:](self, "setRetryFetchTimeout:", a4);
}

- (void)testSetMTRPaths:(id)a3
{
  NSArray *v4;
  NSArray *mtrPaths;
  id v6;

  v6 = a3;
  os_unfair_lock_lock_with_options();
  v4 = (NSArray *)objc_msgSend(v6, "mutableCopy");
  mtrPaths = self->_mtrPaths;
  self->_mtrPaths = v4;

  os_unfair_lock_unlock(&self->_lock);
}

@end
