@implementation HMDPrimaryResidentCapabilitiesAggregator

- (id)logIdentifier
{
  if (self)
    self = (HMDPrimaryResidentCapabilitiesAggregator *)self->_homeUUID;
  return (id)-[HMDPrimaryResidentCapabilitiesAggregator UUIDString](self, "UUIDString");
}

- (HMDPrimaryResidentCapabilitiesAggregator)initWithDataSource:(id)a3 delegate:(id)a4 queue:(id)a5 notificationCenter:(id)a6 homeUUID:(id)a7 accessories:(id)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  HMDPrimaryResidentCapabilitiesAggregator *v19;
  HMDPrimaryResidentCapabilitiesAggregator *v20;
  uint64_t v21;
  NSMutableSet *accessories;
  id v24;
  objc_super v25;

  v14 = a3;
  v15 = a4;
  v24 = a5;
  v16 = a6;
  v17 = a7;
  v18 = a8;
  v25.receiver = self;
  v25.super_class = (Class)HMDPrimaryResidentCapabilitiesAggregator;
  v19 = -[HMDPrimaryResidentCapabilitiesAggregator init](&v25, sel_init);
  v20 = v19;
  if (v19)
  {
    objc_storeStrong((id *)&v19->_queue, a5);
    objc_storeWeak((id *)&v20->_dataSource, v14);
    objc_storeWeak((id *)&v20->_delegate, v15);
    objc_storeStrong((id *)&v20->_homeUUID, a7);
    objc_storeStrong((id *)&v20->_notificationCenter, a6);
    objc_msgSend(MEMORY[0x24BDBCEF0], "setWithArray:", v18);
    v21 = objc_claimAutoreleasedReturnValue();
    accessories = v20->_accessories;
    v20->_accessories = (NSMutableSet *)v21;

  }
  return v20;
}

- (void)startIfPrimaryResident
{
  NSObject *queue;
  _QWORD block[5];

  if (self)
    queue = self->_queue;
  else
    queue = 0;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __66__HMDPrimaryResidentCapabilitiesAggregator_startIfPrimaryResident__block_invoke;
  block[3] = &unk_24E79C240;
  block[4] = self;
  dispatch_async(queue, block);
}

- (void)didAddAccessory:(id)a3
{
  id v4;
  NSObject *queue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  if (self)
    queue = self->_queue;
  else
    queue = 0;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __60__HMDPrimaryResidentCapabilitiesAggregator_didAddAccessory___block_invoke;
  v7[3] = &unk_24E79C268;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(queue, v7);

}

- (void)didRemoveAccessory:(id)a3
{
  id v4;
  NSObject *queue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  if (self)
    queue = self->_queue;
  else
    queue = 0;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __63__HMDPrimaryResidentCapabilitiesAggregator_didRemoveAccessory___block_invoke;
  v7[3] = &unk_24E79C268;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(queue, v7);

}

- (id)accessoryCapabilitiesForAccessory:(id)a3 ifDifferentFrom:(id)a4
{
  id v6;
  id v7;
  id WeakRetained;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  HMDPrimaryResidentCapabilitiesAggregator *v19;
  NSObject *v20;
  void *v21;
  void *v22;
  int v24;
  void *v25;
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  if (self && (WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource)) != 0)
  {
    v9 = WeakRetained;
    objc_msgSend(MEMORY[0x24BDD73A0], "topicFromSuffixID:homeUUID:accessoryUUID:", *MEMORY[0x24BDD4B88], self->_homeUUID, v6);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "eventStoreReadHandle");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "lastEventForTopic:", v10);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (v12)
    {
      v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD7330]), "initWithProtoData:", v7);
      v14 = objc_alloc(MEMORY[0x24BDD7330]);
      objc_msgSend(v12, "encodedData");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = (void *)objc_msgSend(v14, "initWithProtoData:", v15);

      if (v16 && (objc_msgSend(v16, "isEqual:", v13) & 1) == 0)
      {
        objc_msgSend(v16, "pbCapabilities");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "data");
        v17 = (id)objc_claimAutoreleasedReturnValue();

      }
      else
      {
        v17 = 0;
      }

    }
    else
    {
      v17 = v7;
    }

  }
  else
  {
    v18 = (void *)MEMORY[0x227676638]();
    v19 = self;
    HMFGetOSLogHandle();
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = 138543362;
      v25 = v21;
      _os_log_impl(&dword_2218F0000, v20, OS_LOG_TYPE_ERROR, "%{public}@Cannot create accessory capabilities due to nil datasource", (uint8_t *)&v24, 0xCu);

    }
    objc_autoreleasePoolPop(v18);
    v9 = 0;
    v17 = 0;
  }

  return v17;
}

- (id)residentCapabilitiesForAccessory:(id)a3 ifDifferentFrom:(id)a4
{
  id v6;
  id v7;
  id WeakRetained;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  HMDPrimaryResidentCapabilitiesAggregator *v19;
  NSObject *v20;
  void *v21;
  void *v22;
  int v24;
  void *v25;
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  if (self && (WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource)) != 0)
  {
    v9 = WeakRetained;
    objc_msgSend(MEMORY[0x24BDD73A0], "topicFromSuffixID:homeUUID:accessoryUUID:", *MEMORY[0x24BDD4BC0], self->_homeUUID, v6);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "eventStoreReadHandle");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "lastEventForTopic:", v10);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (v12)
    {
      v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD7920]), "initWithProtoData:", v7);
      v14 = objc_alloc(MEMORY[0x24BDD7920]);
      objc_msgSend(v12, "encodedData");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = (void *)objc_msgSend(v14, "initWithProtoData:", v15);

      if (v16 && (objc_msgSend(v16, "isEqual:", v13) & 1) == 0)
      {
        objc_msgSend(v16, "pbCapabilities");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "data");
        v17 = (id)objc_claimAutoreleasedReturnValue();

      }
      else
      {
        v17 = 0;
      }

    }
    else
    {
      v17 = v7;
    }

  }
  else
  {
    v18 = (void *)MEMORY[0x227676638]();
    v19 = self;
    HMFGetOSLogHandle();
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = 138543362;
      v25 = v21;
      _os_log_impl(&dword_2218F0000, v20, OS_LOG_TYPE_ERROR, "%{public}@Cannot create resident capabilities due to nil datasource", (uint8_t *)&v24, 0xCu);

    }
    objc_autoreleasePoolPop(v18);
    v9 = 0;
    v17 = 0;
  }

  return v17;
}

- (id)publicPairingIdentityForAccessory:(id)a3 ifDifferentFrom:(id)a4
{
  id v6;
  id v7;
  id WeakRetained;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  char v16;
  id v17;

  v6 = a3;
  v7 = a4;
  if (!self)
  {
    WeakRetained = 0;
    goto LABEL_12;
  }
  WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
  if (!WeakRetained)
  {
LABEL_12:
    v17 = 0;
    goto LABEL_13;
  }
  objc_msgSend(MEMORY[0x24BDD73A0], "topicFromSuffixID:homeUUID:accessoryUUID:", *MEMORY[0x24BDD4BB8], self->_homeUUID, v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(WeakRetained, "eventStoreReadHandle");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "lastEventForTopic:", v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    v12 = objc_alloc(MEMORY[0x24BE3F228]);
    objc_msgSend(v11, "encodedData");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = (void *)objc_msgSend(v12, "initWithProtoData:", v13);

    if (!v7)
      goto LABEL_9;
  }
  else
  {
    v14 = 0;
    if (!v7)
    {
LABEL_9:
      v17 = v7;
      goto LABEL_10;
    }
  }
  objc_msgSend(v14, "publicPairingIdentity");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v15, "isEqual:", v7);

  if ((v16 & 1) == 0)
    goto LABEL_9;
  v17 = 0;
LABEL_10:

LABEL_13:
  return v17;
}

- (void)handlePrimaryResidentIsCurrentDeviceChangeNotification:(id)a3
{
  NSObject *queue;
  _QWORD block[5];

  if (self)
    queue = self->_queue;
  else
    queue = 0;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __99__HMDPrimaryResidentCapabilitiesAggregator_handlePrimaryResidentIsCurrentDeviceChangeNotification___block_invoke;
  block[3] = &unk_24E79C240;
  block[4] = self;
  dispatch_async(queue, block);
}

- (void)didReceiveEvent:(id)a3 topic:(id)a4
{
  -[HMDPrimaryResidentCapabilitiesAggregator _processEventIfNewer:topic:](self, a3, a4);
}

- (void)didReceiveCachedEvent:(id)a3 topic:(id)a4 source:(id)a5
{
  -[HMDPrimaryResidentCapabilitiesAggregator _processEventIfNewer:topic:](self, a3, a4);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_accessories, 0);
  objc_storeStrong((id *)&self->_notificationCenter, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_homeUUID, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_destroyWeak((id *)&self->_dataSource);
}

- (void)_processEventIfNewer:(void *)a3 topic:
{
  id v5;
  id v6;
  void *v7;
  id *v8;
  NSObject *v9;
  void *v10;
  id WeakRetained;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  void *v22;
  void *v23;
  id *v24;
  NSObject *v25;
  void *v26;
  const char *v27;
  uint64_t v28;
  id v29;
  void *v30;
  void *v31;
  void *v32;
  uint64_t v33;
  id v34;
  id v35;
  void *v36;
  void *v37;
  void *v38;
  uint64_t v39;
  id v40;
  id v41;
  void *v42;
  void *v43;
  uint64_t v44;
  id *v45;
  NSObject *v46;
  void *v47;
  NSObject *v48;
  void *v49;
  void *v50;
  void *v51;
  id *v52;
  void *context;
  void *contexta;
  id v55;
  id v56;
  _QWORD v57[4];
  void *v58;
  id *v59;
  id v60;
  id v61;
  id v62;
  _QWORD v63[4];
  void *v64;
  id *v65;
  id v66;
  id v67;
  id v68;
  uint8_t buf[4];
  void *v70;
  __int16 v71;
  id v72;
  uint64_t v73;

  v73 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  if (a1)
  {
    v7 = (void *)MEMORY[0x227676638]();
    v8 = a1;
    HMFGetOSLogHandle();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    {
      HMFGetLogIdentifier();
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v70 = v10;
      v71 = 2112;
      v72 = v6;
      _os_log_impl(&dword_2218F0000, v9, OS_LOG_TYPE_DEBUG, "%{public}@Received event for: %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v7);
    WeakRetained = objc_loadWeakRetained(v8 + 2);
    v12 = objc_loadWeakRetained(v8 + 3);
    if (!WeakRetained)
      goto LABEL_34;
    objc_msgSend(MEMORY[0x24BDD7640], "decodeTopic:", v6);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "asAccessoryTopic");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = v14;
    if (v14)
    {
      v16 = objc_msgSend(v14, "accessoryEventTopicSuffixID");
      if (v16 == *MEMORY[0x24BDD4B88])
      {
        v17 = objc_alloc(MEMORY[0x24BDD7330]);
        objc_msgSend(v5, "encodedData");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = (void *)objc_msgSend(v17, "initWithProtoData:", v18);

        objc_msgSend(v15, "accessoryUUID");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v63[0] = MEMORY[0x24BDAC760];
        v63[1] = 3221225472;
        v63[2] = __71__HMDPrimaryResidentCapabilitiesAggregator__processEventIfNewer_topic___block_invoke;
        v63[3] = &unk_24E79A108;
        v64 = v19;
        v65 = v8;
        v66 = v12;
        v67 = v5;
        v68 = v15;
        v21 = v19;
        objc_msgSend(v66, "aggregator:accessoryCapabilitiesWithUUID:completion:", v8, v20, v63);

        v22 = v64;
LABEL_32:

        goto LABEL_33;
      }
      v28 = objc_msgSend(v15, "accessoryEventTopicSuffixID");
      if (v28 == *MEMORY[0x24BDD4BC0])
      {
        v29 = objc_alloc(MEMORY[0x24BDD7920]);
        objc_msgSend(v5, "encodedData");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        v31 = (void *)objc_msgSend(v29, "initWithProtoData:", v30);

        objc_msgSend(v15, "accessoryUUID");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        v57[0] = MEMORY[0x24BDAC760];
        v57[1] = 3221225472;
        v57[2] = __71__HMDPrimaryResidentCapabilitiesAggregator__processEventIfNewer_topic___block_invoke_19;
        v57[3] = &unk_24E79A108;
        v58 = v31;
        v59 = v8;
        v60 = v12;
        v61 = v5;
        v62 = v15;
        v21 = v31;
        objc_msgSend(v60, "aggregator:residentCapabilitiesWithUUID:completion:", v8, v32, v57);

        v22 = v58;
        goto LABEL_32;
      }
      v33 = objc_msgSend(v15, "accessoryEventTopicSuffixID");
      if (v33 == *MEMORY[0x24BDD4BB8])
      {
        v21 = v5;
        v55 = v15;
        v34 = objc_loadWeakRetained(v8 + 3);
        if (v34)
        {
          v35 = objc_alloc(MEMORY[0x24BE3F228]);
          context = v21;
          objc_msgSend(v21, "encodedData");
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          v37 = (void *)objc_msgSend(v35, "initWithProtoData:", v36);

          if (v37)
          {
            objc_msgSend(v55, "accessoryUUID");
            v38 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v34, "aggregator:didReceivePublicPairingKeyWithUUID:pairingIdentity:", v8, v38, v37);

          }
          else
          {
            v47 = (void *)MEMORY[0x227676638]();
            v52 = v8;
            HMFGetOSLogHandle();
            v48 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v48, OS_LOG_TYPE_ERROR))
            {
              HMFGetLogIdentifier();
              v50 = v47;
              v49 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138543618;
              v70 = v49;
              v71 = 2112;
              v72 = context;
              _os_log_impl(&dword_2218F0000, v48, OS_LOG_TYPE_ERROR, "%{public}@Failed to process accessory public pairing identity event: %@ due to invalid data", buf, 0x16u);

              v47 = v50;
            }

            objc_autoreleasePoolPop(v47);
          }
          v21 = context;

        }
        else
        {
          contexta = (void *)MEMORY[0x227676638]();
          v45 = v8;
          HMFGetOSLogHandle();
          v46 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v46, OS_LOG_TYPE_ERROR))
          {
            HMFGetLogIdentifier();
            v51 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543618;
            v70 = v51;
            v71 = 2112;
            v72 = v21;
            _os_log_impl(&dword_2218F0000, v46, OS_LOG_TYPE_ERROR, "%{public}@Failed to process accessory public pairing identity event: %@ due to no delegate", buf, 0x16u);

          }
          objc_autoreleasePoolPop(contexta);
        }

        v22 = v55;
        goto LABEL_32;
      }
      v39 = objc_msgSend(v15, "accessoryEventTopicSuffixID");
      if (v39 == *MEMORY[0x24BDD4B98])
      {
        v40 = v15;
        v41 = v5;
        v56 = objc_loadWeakRetained(v8 + 3);
        objc_msgSend(v40, "accessoryUUID");
        v42 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v41, "encodedData");
        v43 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v56, "aggregator:didReceiveDeviceIRKWithUUID:deviceIRK:", v8, v42, v43);
        goto LABEL_33;
      }
      v44 = objc_msgSend(v15, "accessoryEventTopicSuffixID");
      if (v44 == *MEMORY[0x24BDD4BE0])
      {
        -[HMDPrimaryResidentCapabilitiesAggregator processSoftwareVersionEvent:accessoryTopic:](v8, v5, v15);
        goto LABEL_33;
      }
      v23 = (void *)MEMORY[0x227676638]();
      v24 = v8;
      HMFGetOSLogHandle();
      v25 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v70 = v26;
        v71 = 2112;
        v72 = v6;
        v27 = "%{public}@Accessory event does not have expected suffix %@";
        goto LABEL_10;
      }
    }
    else
    {
      v23 = (void *)MEMORY[0x227676638]();
      v24 = v8;
      HMFGetOSLogHandle();
      v25 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v70 = v26;
        v71 = 2112;
        v72 = v6;
        v27 = "%{public}@Unable to parse topic %@";
LABEL_10:
        _os_log_impl(&dword_2218F0000, v25, OS_LOG_TYPE_ERROR, v27, buf, 0x16u);

      }
    }

    objc_autoreleasePoolPop(v23);
LABEL_33:

LABEL_34:
  }

}

void __71__HMDPrimaryResidentCapabilitiesAggregator__processEventIfNewer_topic___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  NSObject *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  int v16;
  void *v17;
  __int16 v18;
  uint64_t v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  if (v3)
    v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD7330]), "initWithProtoData:", v3);
  else
    v4 = 0;
  if ((objc_msgSend(*(id *)(a1 + 32), "isEqual:", v4) & 1) == 0)
  {
    v5 = (void *)MEMORY[0x227676638]();
    v6 = *(id *)(a1 + 40);
    HMFGetOSLogHandle();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      HMFGetLogIdentifier();
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = *(_QWORD *)(a1 + 32);
      v16 = 138543618;
      v17 = v8;
      v18 = 2112;
      v19 = v9;
      _os_log_impl(&dword_2218F0000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@Updating on receiving different accessory capabilities %@.", (uint8_t *)&v16, 0x16u);

    }
    objc_autoreleasePoolPop(v5);
    v11 = *(_QWORD *)(a1 + 32);
    v10 = *(_QWORD *)(a1 + 40);
    v12 = *(void **)(a1 + 48);
    objc_msgSend(*(id *)(a1 + 56), "encodedData");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 64), "accessoryUUID");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 64), "homeUUID");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "aggregator:changedAccessoryCapabilities:rawCapabilities:accessoryUUID:homeUUID:", v10, v11, v13, v14, v15);

  }
}

void __71__HMDPrimaryResidentCapabilitiesAggregator__processEventIfNewer_topic___block_invoke_19(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  NSObject *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  int v16;
  void *v17;
  __int16 v18;
  uint64_t v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  if (v3)
    v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD7920]), "initWithProtoData:", v3);
  else
    v4 = 0;
  if ((objc_msgSend(*(id *)(a1 + 32), "isEqual:", v4) & 1) == 0)
  {
    v5 = (void *)MEMORY[0x227676638]();
    v6 = *(id *)(a1 + 40);
    HMFGetOSLogHandle();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      HMFGetLogIdentifier();
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = *(_QWORD *)(a1 + 32);
      v16 = 138543618;
      v17 = v8;
      v18 = 2112;
      v19 = v9;
      _os_log_impl(&dword_2218F0000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@Updating on receiving different resident capabilities %@.", (uint8_t *)&v16, 0x16u);

    }
    objc_autoreleasePoolPop(v5);
    v11 = *(_QWORD *)(a1 + 32);
    v10 = *(_QWORD *)(a1 + 40);
    v12 = *(void **)(a1 + 48);
    objc_msgSend(*(id *)(a1 + 56), "encodedData");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 64), "accessoryUUID");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 64), "homeUUID");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "aggregator:changedResidentCapabilities:rawCapabilities:accessoryUUID:homeUUID:", v10, v11, v13, v14, v15);

  }
}

- (void)processSoftwareVersionEvent:(void *)a3 accessoryTopic:
{
  id v5;
  id v6;
  id WeakRetained;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id *v14;
  NSObject *v15;
  void *v16;
  void *v17;
  id *v18;
  NSObject *v19;
  void *v20;
  int v21;
  void *v22;
  __int16 v23;
  id v24;
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  WeakRetained = objc_loadWeakRetained(a1 + 3);
  if (WeakRetained)
  {
    v8 = objc_alloc(MEMORY[0x24BDD73E8]);
    objc_msgSend(v5, "encodedData");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (void *)objc_msgSend(v8, "initWithProtoData:", v9);

    if (v10)
    {
      objc_msgSend(v6, "accessoryUUID");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "softwareVersion");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(WeakRetained, "aggregator:didReceiveSoftwareVersionWithUUID:softwareVersion:", a1, v11, v12);

    }
    else
    {
      v17 = (void *)MEMORY[0x227676638]();
      v18 = a1;
      HMFGetOSLogHandle();
      v19 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v21 = 138543618;
        v22 = v20;
        v23 = 2112;
        v24 = v5;
        _os_log_impl(&dword_2218F0000, v19, OS_LOG_TYPE_ERROR, "%{public}@Failed to process accessory software version event: %@ due to invalid data", (uint8_t *)&v21, 0x16u);

      }
      objc_autoreleasePoolPop(v17);
    }

  }
  else
  {
    v13 = (void *)MEMORY[0x227676638]();
    v14 = a1;
    HMFGetOSLogHandle();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = 138543618;
      v22 = v16;
      v23 = 2112;
      v24 = v5;
      _os_log_impl(&dword_2218F0000, v15, OS_LOG_TYPE_ERROR, "%{public}@Failed to process accessory software version event: %@ due to no delegate", (uint8_t *)&v21, 0x16u);

    }
    objc_autoreleasePoolPop(v13);
  }

}

void __99__HMDPrimaryResidentCapabilitiesAggregator_handlePrimaryResidentIsCurrentDeviceChangeNotification___block_invoke(uint64_t a1)
{
  uint64_t v2;
  id WeakRetained;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  id v7;
  NSObject *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  id v13;
  void *v14;
  void *v15;
  int v16;
  void *v17;
  __int16 v18;
  void *v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v2 = *(_QWORD *)(a1 + 32);
  if (v2)
    WeakRetained = objc_loadWeakRetained((id *)(v2 + 16));
  else
    WeakRetained = 0;
  v4 = objc_msgSend(WeakRetained, "isCurrentDevicePrimaryResident");

  v5 = *(_QWORD *)(a1 + 32);
  if (v5)
  {
    if ((_DWORD)v4 == (*(_BYTE *)(v5 + 8) != 0))
      return;
  }
  else if ((v4 & 1) == 0)
  {
    return;
  }
  v6 = (void *)MEMORY[0x227676638]();
  v7 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v4);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = 138543618;
    v17 = v9;
    v18 = 2112;
    v19 = v10;
    _os_log_impl(&dword_2218F0000, v8, OS_LOG_TYPE_INFO, "%{public}@Primary resident status changed to %@", (uint8_t *)&v16, 0x16u);

  }
  objc_autoreleasePoolPop(v6);
  v11 = *(_QWORD *)(a1 + 32);
  if (v11)
  {
    *(_BYTE *)(v11 + 8) = v4;
    v12 = *(_QWORD *)(a1 + 32);
    if (v12)
    {
      if (*(_BYTE *)(v12 + 8))
      {
        -[HMDPrimaryResidentCapabilitiesAggregator _handleDidBecomePrimaryResident](v12);
      }
      else
      {
        dispatch_assert_queue_V2(*(dispatch_queue_t *)(v12 + 40));
        v13 = objc_loadWeakRetained((id *)(v12 + 16));
        v14 = v13;
        if (v13)
        {
          objc_msgSend(v13, "localAndRemoteSubscriptionProvider");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "unregisterConsumer:completion:", v12, &__block_literal_global_16_243966);

        }
      }
    }
  }
}

- (void)_handleDidBecomePrimaryResident
{
  id WeakRetained;
  id v3;

  dispatch_assert_queue_V2(*(dispatch_queue_t *)(a1 + 40));
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 24));
  objc_msgSend(WeakRetained, "aggregatorDidBecomePrimary:", a1);

  objc_msgSend(*(id *)(a1 + 56), "allObjects");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  -[HMDPrimaryResidentCapabilitiesAggregator _handleAddedAccessories:](a1, v3);

}

- (void)_handleAddedAccessories:(uint64_t)a1
{
  id v3;
  id WeakRetained;
  void *v5;
  uint64_t i;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  uint64_t v19;
  id v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  NSObject *v25;
  void *v26;
  void *v27;
  id v28;
  void *v29;
  void *v30;
  id obj;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  void *v38;
  uint64_t v39;
  id v40;
  void *v41;
  id v42;
  id v43;
  _QWORD v44[5];
  id v45;
  id v46;
  id v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  uint8_t v52[128];
  _BYTE buf[24];
  void *v54;
  void *v55;
  uint64_t v56;

  v56 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  if (a1)
  {
    dispatch_assert_queue_V2(*(dispatch_queue_t *)(a1 + 40));
    if (objc_msgSend(v3, "count"))
    {
      if (*(_BYTE *)(a1 + 8))
      {
        WeakRetained = objc_loadWeakRetained((id *)(a1 + 16));
        v5 = WeakRetained;
        if (WeakRetained)
        {
          v29 = WeakRetained;
          v30 = v3;
          objc_msgSend(MEMORY[0x24BDBCEB8], "array");
          v38 = (void *)objc_claimAutoreleasedReturnValue();
          v48 = 0u;
          v49 = 0u;
          v50 = 0u;
          v51 = 0u;
          obj = *(id *)(a1 + 56);
          v39 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v48, v52, 16);
          if (v39)
          {
            v37 = *(_QWORD *)v49;
            v36 = *MEMORY[0x24BDD4B88];
            v35 = *MEMORY[0x24BDD4BC0];
            v34 = *MEMORY[0x24BDD4BB8];
            v33 = *MEMORY[0x24BDD4B98];
            v32 = *MEMORY[0x24BDD4BE0];
            do
            {
              for (i = 0; i != v39; ++i)
              {
                if (*(_QWORD *)v49 != v37)
                  objc_enumerationMutation(obj);
                v7 = *(void **)(*((_QWORD *)&v48 + 1) + 8 * i);
                v43 = *(id *)(a1 + 32);
                v8 = (void *)MEMORY[0x24BDD73A0];
                v42 = *(id *)(a1 + 32);
                v9 = v7;
                objc_msgSend(v8, "topicFromSuffixID:homeUUID:accessoryUUID:", v36, v42, v9);
                v41 = (void *)objc_claimAutoreleasedReturnValue();
                *(_QWORD *)buf = v41;
                v10 = (void *)MEMORY[0x24BDD73A0];
                v40 = *(id *)(a1 + 32);
                objc_msgSend(v10, "topicFromSuffixID:homeUUID:accessoryUUID:", v35, v40, v9);
                v11 = (void *)objc_claimAutoreleasedReturnValue();
                *(_QWORD *)&buf[8] = v11;
                v12 = (void *)MEMORY[0x24BDD73A0];
                v13 = *(id *)(a1 + 32);
                objc_msgSend(v12, "topicFromSuffixID:homeUUID:accessoryUUID:", v34, v13, v9);
                v14 = (void *)objc_claimAutoreleasedReturnValue();
                *(_QWORD *)&buf[16] = v14;
                v15 = (void *)MEMORY[0x24BDD73A0];
                v16 = *(id *)(a1 + 32);
                objc_msgSend(v15, "topicFromSuffixID:homeUUID:accessoryUUID:", v33, v16, v9);
                v17 = (void *)objc_claimAutoreleasedReturnValue();
                v54 = v17;
                v18 = (void *)MEMORY[0x24BDD73A0];
                v19 = a1;
                v20 = *(id *)(a1 + 32);
                objc_msgSend(v18, "topicFromSuffixID:homeUUID:accessoryUUID:", v32, v20, v9);
                v21 = (void *)objc_claimAutoreleasedReturnValue();

                v55 = v21;
                objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", buf, 5);
                v22 = (void *)objc_claimAutoreleasedReturnValue();

                a1 = v19;
                objc_msgSend(v38, "addObjectsFromArray:", v22);

              }
              v39 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v48, v52, 16);
            }
            while (v39);
          }

          v23 = (void *)MEMORY[0x227676638]();
          v24 = (id)a1;
          HMFGetOSLogHandle();
          v25 = objc_claimAutoreleasedReturnValue();
          v3 = v30;
          if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
          {
            HMFGetLogIdentifier();
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543618;
            *(_QWORD *)&buf[4] = v26;
            *(_WORD *)&buf[12] = 2112;
            *(_QWORD *)&buf[14] = v30;
            _os_log_impl(&dword_2218F0000, v25, OS_LOG_TYPE_DEFAULT, "%{public}@Subscribing for accessories: %@", buf, 0x16u);

          }
          objc_autoreleasePoolPop(v23);
          v5 = v29;
          objc_msgSend(v29, "localAndRemoteSubscriptionProvider");
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          v44[0] = MEMORY[0x24BDAC760];
          v44[1] = 3221225472;
          v44[2] = __68__HMDPrimaryResidentCapabilitiesAggregator__handleAddedAccessories___block_invoke;
          v44[3] = &unk_24E79A0C0;
          v44[4] = v24;
          v45 = v38;
          v46 = v29;
          v47 = v30;
          v28 = v38;
          objc_msgSend(v27, "changeRegistrationsForConsumer:topicFilterAdditions:topicFilterRemovals:completion:", v24, v28, MEMORY[0x24BDBD1A8], v44);

        }
      }
    }
  }

}

void __68__HMDPrimaryResidentCapabilitiesAggregator__handleAddedAccessories___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  id v8;
  NSObject *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  NSObject *v13;
  id v14;
  uint64_t v15;
  _QWORD v16[4];
  id v17;
  id v18;
  id v19;
  uint64_t v20;
  uint8_t buf[4];
  void *v22;
  __int16 v23;
  uint64_t v24;
  __int16 v25;
  id v26;
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  if (v6)
  {
    v7 = (void *)MEMORY[0x227676638]();
    v8 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = *(_QWORD *)(a1 + 56);
      *(_DWORD *)buf = 138543874;
      v22 = v10;
      v23 = 2112;
      v24 = v11;
      v25 = 2112;
      v26 = v6;
      _os_log_impl(&dword_2218F0000, v9, OS_LOG_TYPE_ERROR, "%{public}@Error subscribing to capabilities for accessories: %@, error: %@", buf, 0x20u);

    }
    objc_autoreleasePoolPop(v7);
  }
  else
  {
    v12 = *(_QWORD *)(a1 + 32);
    if (v12)
      v13 = *(NSObject **)(v12 + 40);
    else
      v13 = 0;
    v16[0] = MEMORY[0x24BDAC760];
    v16[1] = 3221225472;
    v16[2] = __68__HMDPrimaryResidentCapabilitiesAggregator__handleAddedAccessories___block_invoke_2;
    v16[3] = &unk_24E79A910;
    v17 = *(id *)(a1 + 40);
    v18 = v5;
    v14 = *(id *)(a1 + 48);
    v15 = *(_QWORD *)(a1 + 32);
    v19 = v14;
    v20 = v15;
    dispatch_async(v13, v16);

  }
}

void __68__HMDPrimaryResidentCapabilitiesAggregator__handleAddedAccessories___block_invoke_2(id *a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v2 = a1[4];
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v13;
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v13 != v5)
          objc_enumerationMutation(v2);
        v7 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * i);
        objc_msgSend(a1[5], "objectForKeyedSubscript:", v7, (_QWORD)v12);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(a1[6], "eventStoreReadHandle");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "lastEventForTopic:", v7);
        v10 = (void *)objc_claimAutoreleasedReturnValue();

        v11 = v8;
        if (v8 || (v11 = v10) != 0)
          -[HMDPrimaryResidentCapabilitiesAggregator _processEventIfNewer:topic:](a1[7], v11, v7);

      }
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v4);
  }

}

void __63__HMDPrimaryResidentCapabilitiesAggregator_didRemoveAccessory___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;

  v2 = *(_QWORD *)(a1 + 32);
  if (v2)
    v3 = *(void **)(v2 + 56);
  else
    v3 = 0;
  if (objc_msgSend(v3, "containsObject:", *(_QWORD *)(a1 + 40)))
  {
    v4 = *(_QWORD *)(a1 + 32);
    if (v4)
      v5 = *(void **)(v4 + 56);
    else
      v5 = 0;
    objc_msgSend(v5, "removeObject:", *(_QWORD *)(a1 + 40));
    v6 = *(_QWORD *)(a1 + 32);
    if (v6)
      dispatch_assert_queue_V2(*(dispatch_queue_t *)(v6 + 40));
  }
}

void __60__HMDPrimaryResidentCapabilitiesAggregator_didAddAccessory___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x24BDAC8D0];
  v2 = *(_QWORD *)(a1 + 32);
  if (v2)
    v3 = *(void **)(v2 + 56);
  else
    v3 = 0;
  if ((objc_msgSend(v3, "containsObject:", *(_QWORD *)(a1 + 40)) & 1) == 0)
  {
    v4 = *(_QWORD *)(a1 + 32);
    if (v4)
      v5 = *(void **)(v4 + 56);
    else
      v5 = 0;
    objc_msgSend(v5, "addObject:", *(_QWORD *)(a1 + 40));
    v6 = *(_QWORD *)(a1 + 32);
    v8[0] = *(_QWORD *)(a1 + 40);
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v8, 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDPrimaryResidentCapabilitiesAggregator _handleAddedAccessories:](v6, v7);

  }
}

void __66__HMDPrimaryResidentCapabilitiesAggregator_startIfPrimaryResident__block_invoke(uint64_t a1)
{
  uint64_t v1;
  id WeakRetained;
  void *v4;
  id v5;
  NSObject *v6;
  void *v7;
  int v8;
  const __CFString *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  id v14;
  void *v15;
  char v16;
  uint64_t v17;
  uint64_t v18;
  int v19;
  void *v20;
  __int16 v21;
  const __CFString *v22;
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v1 = *(_QWORD *)(a1 + 32);
  if (v1)
  {
    WeakRetained = objc_loadWeakRetained((id *)(v1 + 16));
    if (WeakRetained)
    {
      v4 = (void *)MEMORY[0x227676638]();
      v5 = *(id *)(a1 + 32);
      HMFGetOSLogHandle();
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        HMFGetLogIdentifier();
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        v8 = objc_msgSend(WeakRetained, "isCurrentDevicePrimaryResident");
        v9 = CFSTR("NO");
        if (v8)
          v9 = CFSTR("YES");
        v19 = 138543618;
        v20 = v7;
        v21 = 2112;
        v22 = v9;
        _os_log_impl(&dword_2218F0000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@Starting capabilities aggregator, primary resident: %@", (uint8_t *)&v19, 0x16u);

      }
      objc_autoreleasePoolPop(v4);
      v10 = *(_QWORD *)(a1 + 32);
      if (v10)
        v11 = *(void **)(v10 + 48);
      else
        v11 = 0;
      objc_msgSend(v11, "removeObserver:");
      v12 = *(_QWORD *)(a1 + 32);
      if (v12)
        v13 = *(void **)(v12 + 48);
      else
        v13 = 0;
      v14 = v13;
      objc_msgSend(WeakRetained, "primaryResidentChangeMonitor");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "addObserver:selector:name:object:", v12, sel_handlePrimaryResidentIsCurrentDeviceChangeNotification_, CFSTR("HMDPrimaryResidentChangeMonitorIsCurrentDeviceChangeNotification"), v15);

      v16 = objc_msgSend(WeakRetained, "isCurrentDevicePrimaryResident");
      v17 = *(_QWORD *)(a1 + 32);
      if (v17)
      {
        *(_BYTE *)(v17 + 8) = v16;
        v18 = *(_QWORD *)(a1 + 32);
        if (v18)
        {
          if (*(_BYTE *)(v18 + 8))
            -[HMDPrimaryResidentCapabilitiesAggregator _handleDidBecomePrimaryResident](v18);
        }
      }
    }
  }
  else
  {
    WeakRetained = 0;
  }

}

+ (id)logCategory
{
  if (logCategory__hmf_once_t0_243985 != -1)
    dispatch_once(&logCategory__hmf_once_t0_243985, &__block_literal_global_243986);
  return (id)logCategory__hmf_once_v1_243987;
}

void __55__HMDPrimaryResidentCapabilitiesAggregator_logCategory__block_invoke()
{
  uint64_t v0;
  void *v1;

  HMFCreateOSLogHandle();
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)logCategory__hmf_once_v1_243987;
  logCategory__hmf_once_v1_243987 = v0;

}

@end
