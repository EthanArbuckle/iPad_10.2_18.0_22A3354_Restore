@implementation HMMTRHAPEnumerator

- (HMMTRHAPEnumerator)initWithClusterIDCharacteristicMap:(id)a3
{
  id v5;
  HMMTRHAPEnumerator *v6;
  HMMTRHAPEnumerator *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)HMMTRHAPEnumerator;
  v6 = -[HMMTRHAPEnumerator init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_clusterIDCharacteristicMap, a3);

  return v7;
}

- (id)_serviceLabelIndexMapForDescriptions:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  uint64_t v11;
  void *v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t j;
  void *v18;
  id v19;
  id obj;
  id v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _BYTE v31[128];
  _BYTE v32[128];
  uint64_t v33;

  v33 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  v22 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  objc_msgSend(v3, "allKeys");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "sortedArrayUsingSelector:", sel_caseInsensitiveCompare_);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v29 = 0u;
  v30 = 0u;
  v27 = 0u;
  v28 = 0u;
  obj = v5;
  v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v27, v32, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v28;
    v9 = 1;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v28 != v8)
          objc_enumerationMutation(obj);
        v11 = *(_QWORD *)(*((_QWORD *)&v27 + 1) + 8 * i);
        objc_msgSend(v3, "objectForKey:", v11);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v23 = 0u;
        v24 = 0u;
        v25 = 0u;
        v26 = 0u;
        v13 = v12;
        v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v23, v31, 16);
        if (v14)
        {
          v15 = v14;
          v16 = *(_QWORD *)v24;
          while (2)
          {
            for (j = 0; j != v15; ++j)
            {
              if (*(_QWORD *)v24 != v16)
                objc_enumerationMutation(v13);
              if (objc_msgSend(*(id *)(*((_QWORD *)&v23 + 1) + 8 * j), "optionalServiceLabelIndexIncluded"))
              {
                objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", v9);
                v18 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v22, "setValue:forKey:", v18, v11);

                ++v9;
                goto LABEL_16;
              }
            }
            v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v23, v31, 16);
            if (v15)
              continue;
            break;
          }
        }
LABEL_16:

      }
      v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v27, v32, 16);
    }
    while (v7);
  }

  if (objc_msgSend(v22, "count"))
    v19 = v22;
  else
    v19 = 0;

  return v19;
}

- (id)enumerateServicesFromServices:(id)a3 serviceDescriptionsDictionary:(id)a4 topology:(id)a5 nodeID:(id)a6 primaryAccessory:(id)a7 legacyInstanceIDAssignment:(BOOL)a8
{
  _BOOL4 v8;
  id v14;
  uint64_t *v15;
  void *v16;
  HMMTRHAPEnumerator *v17;
  NSObject *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t i;
  void *v25;
  void *v26;
  id v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  void *v33;
  unint64_t v34;
  void *v35;
  HMMTRHAPEnumerator *v36;
  NSObject *v37;
  uint64_t v38;
  HMMTRHAPEnumerator *v39;
  id v40;
  void *v41;
  void *v42;
  void *v43;
  HMMTRHAPEnumerator *v44;
  NSObject *v45;
  void *v46;
  id v48;
  id v49;
  uint64_t v50;
  id v51;
  id v52;
  void *v53;
  id v54;
  void *v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  uint64_t v64;
  _BYTE v65[128];
  uint8_t v66[128];
  uint8_t buf[4];
  void *v68;
  __int16 v69;
  id v70;
  __int16 v71;
  void *v72;
  uint64_t v73;

  v8 = a8;
  v73 = *MEMORY[0x24BDAC8D0];
  v49 = a3;
  v14 = a4;
  v52 = a5;
  v51 = a6;
  v54 = a7;
  v64 = 20;
  if (v8)
    v15 = &v64;
  else
    v15 = 0;
  v55 = (void *)objc_opt_new();
  -[HMMTRHAPEnumerator _serviceLabelIndexMapForDescriptions:](self, "_serviceLabelIndexMapForDescriptions:", v14);
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = (void *)MEMORY[0x242656984]();
  v17 = self;
  HMFGetOSLogHandle();
  v18 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    v68 = v19;
    v69 = 2112;
    v70 = v54;
    v71 = 2112;
    v72 = v53;
    _os_log_impl(&dword_23E95B000, v18, OS_LOG_TYPE_INFO, "%{public}@Computed service label index map for non-bridged accessory %@ : %@", buf, 0x20u);

  }
  objc_autoreleasePoolPop(v16);
  v62 = 0u;
  v63 = 0u;
  v60 = 0u;
  v61 = 0u;
  objc_msgSend(v14, "allValues");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v60, v66, 16);
  if (v21)
  {
    v22 = v21;
    v23 = *(_QWORD *)v61;
    do
    {
      for (i = 0; i != v22; ++i)
      {
        if (*(_QWORD *)v61 != v23)
          objc_enumerationMutation(v20);
        -[HMMTRHAPEnumerator _createHAPServicesFromServiceDescriptions:topology:nodeID:accessoryEndpointID:services:startingServiceInstanceID:primaryAccessory:standaloneServiceLabelIndexMap:](v17, "_createHAPServicesFromServiceDescriptions:topology:nodeID:accessoryEndpointID:services:startingServiceInstanceID:primaryAccessory:standaloneServiceLabelIndexMap:", *(_QWORD *)(*((_QWORD *)&v60 + 1) + 8 * i), v52, v51, &unk_250F3F180, v55, v15, v54, v53);
      }
      v22 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v60, v66, 16);
    }
    while (v22);
  }

  v25 = v55;
  if (objc_msgSend(v55, "count"))
  {
    v48 = v14;
    v26 = (void *)objc_opt_new();
    v56 = 0u;
    v57 = 0u;
    v58 = 0u;
    v59 = 0u;
    v27 = v49;
    v28 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v56, v65, 16);
    if (v28)
    {
      v29 = v28;
      v30 = *(_QWORD *)v57;
      do
      {
        v31 = 0;
        v50 = v29;
        do
        {
          if (*(_QWORD *)v57 != v30)
            objc_enumerationMutation(v27);
          v32 = *(void **)(*((_QWORD *)&v56 + 1) + 8 * v31);
          objc_msgSend(v32, "instanceID");
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          v34 = objc_msgSend(v33, "unsignedLongLongValue");

          if (v34 > 0x13)
          {
            v35 = (void *)MEMORY[0x242656984]();
            v36 = v17;
            HMFGetOSLogHandle();
            v37 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v37, OS_LOG_TYPE_INFO))
            {
              HMFGetLogIdentifier();
              v38 = v30;
              v39 = v17;
              v40 = v27;
              v41 = v26;
              v42 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138543618;
              v68 = v42;
              v69 = 2112;
              v70 = v32;
              _os_log_impl(&dword_23E95B000, v37, OS_LOG_TYPE_INFO, "%{public}@Dropping existing service %@", buf, 0x16u);

              v26 = v41;
              v27 = v40;
              v17 = v39;
              v30 = v38;
              v29 = v50;
            }

            objc_autoreleasePoolPop(v35);
          }
          else
          {
            objc_msgSend(v26, "addObject:", v32);
          }
          ++v31;
        }
        while (v29 != v31);
        v29 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v56, v65, 16);
      }
      while (v29);
    }

    v25 = v55;
    objc_msgSend(v26, "addObjectsFromArray:", v55);
    v14 = v48;
  }
  else
  {
    v43 = (void *)MEMORY[0x242656984]();
    v44 = v17;
    HMFGetOSLogHandle();
    v45 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v45, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v68 = v46;
      _os_log_impl(&dword_23E95B000, v45, OS_LOG_TYPE_ERROR, "%{public}@Could not construct any of the services.", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v43);
    v26 = 0;
  }

  return v26;
}

- (id)enumerateBridgedAccessoriesFromAccessories:(id)a3 serviceDescriptionsDictionary:(id)a4 namesDictionary:(id)a5 topology:(id)a6 server:(id)a7 legacyInstanceIDAssignment:(BOOL)a8
{
  _BOOL4 v8;
  id v14;
  id v15;
  id v16;
  int64_t *v17;
  unint64_t v18;
  unint64_t v19;
  uint64_t i;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  void *v29;
  int64_t v30;
  void *v31;
  void *v32;
  int64_t v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  HMMTRHAPEnumerator *v40;
  NSObject *v41;
  void *v42;
  uint64_t v44;
  void *v45;
  id v46;
  id obj;
  HMMTRHAPEnumerator *v48;
  int64_t *v49;
  _BOOL4 v50;
  id v51;
  id v52;
  uint64_t v53;
  void *v54;
  uint64_t v55;
  void *v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  int64_t v61;
  uint8_t buf[4];
  void *v63;
  __int16 v64;
  id v65;
  _BYTE v66[128];
  uint64_t v67;

  v8 = a8;
  v67 = *MEMORY[0x24BDAC8D0];
  v14 = a3;
  v15 = a4;
  v52 = a5;
  v51 = a6;
  v16 = a7;
  v45 = v14;
  objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithArray:", v14);
  v46 = (id)objc_claimAutoreleasedReturnValue();
  v61 = 20;
  v50 = v8;
  v17 = &v61;
  v57 = 0u;
  v58 = 0u;
  if (!v8)
    v17 = 0;
  v49 = v17;
  v59 = 0uLL;
  v60 = 0uLL;
  v54 = v15;
  objc_msgSend(v15, "allKeys");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v55 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v57, v66, 16);
  if (v55)
  {
    v53 = *(_QWORD *)v58;
    v18 = 0x24BDD1000uLL;
    v19 = 0x250F1E000uLL;
    v48 = self;
    do
    {
      for (i = 0; i != v55; ++i)
      {
        if (*(_QWORD *)v58 != v53)
          objc_enumerationMutation(obj);
        v21 = *(void **)(*((_QWORD *)&v57 + 1) + 8 * i);
        objc_msgSend(v54, "objectForKey:", v21);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        v23 = (void *)objc_opt_new();
        if (objc_msgSend(v22, "count"))
        {
          objc_msgSend(v52, "objectForKey:", v21);
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          v25 = v24;
          if (!v24 || objc_msgSend(v24, "isEqual:", &stru_250F24B08))
          {
            objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@,%@"), CFSTR("Matter Accessory"), v21);
            v26 = objc_claimAutoreleasedReturnValue();

            v25 = (void *)v26;
          }
          +[HMMTRUtilities sanitizeHAPName:](HMMTRUtilities, "sanitizeHAPName:", v25);
          v27 = objc_claimAutoreleasedReturnValue();

          objc_msgSend(*(id *)(v18 + 1760), "numberWithInteger:", objc_msgSend(v21, "integerValue"));
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          v29 = *(void **)(v19 + 3248);
          v30 = v61;
          objc_msgSend(v16, "nodeID");
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          LOBYTE(v44) = v50;
          v56 = (void *)v27;
          objc_msgSend(v29, "createInfoService:model:manufacturer:serialNumber:instanceID:endpointID:nodeID:legacyInstanceIDAssignment:", v27, CFSTR("Unknown"), CFSTR("Unknown"), CFSTR("Unknown"), v30, v28, v31, v44);
          v32 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v23, "addObject:", v32);
          v33 = v61;
          objc_msgSend(v32, "characteristics");
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          v61 = +[HMMTRUtilities nextServiceInstanceID:previousCharacteristicsCount:](HMMTRUtilities, "nextServiceInstanceID:previousCharacteristicsCount:", v33, objc_msgSend(v34, "count"));

          objc_msgSend(v16, "nodeID");
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          self = v48;
          -[HMMTRHAPEnumerator _createHAPServicesFromServiceDescriptions:topology:nodeID:accessoryEndpointID:services:startingServiceInstanceID:primaryAccessory:standaloneServiceLabelIndexMap:](v48, "_createHAPServicesFromServiceDescriptions:topology:nodeID:accessoryEndpointID:services:startingServiceInstanceID:primaryAccessory:standaloneServiceLabelIndexMap:", v22, v51, v35, v28, v23, v49, 0, 0);

          if (v50)
          {
            objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", v61);
            v36 = (void *)objc_claimAutoreleasedReturnValue();
          }
          else
          {
            objc_msgSend(v16, "nodeID");
            v37 = (void *)objc_claimAutoreleasedReturnValue();
            +[HMMTRAccessoryServerFactory instanceIDForCharacteristicType:serviceType:endpointID:nodeID:](HMMTRAccessoryServerFactory, "instanceIDForCharacteristicType:serviceType:endpointID:nodeID:", 0, 0, v28, v37);
            v36 = (void *)objc_claimAutoreleasedReturnValue();

          }
          -[HMMTRHAPEnumerator _createBridgedHAPAccessoryWithServer:services:instanceId:endpointID:](v48, "_createBridgedHAPAccessoryWithServer:services:instanceId:endpointID:", v16, v23, v36, v28);
          v38 = (void *)objc_claimAutoreleasedReturnValue();
          if (v38)
            objc_msgSend(v46, "addObject:", v38);

          v18 = 0x24BDD1000;
          v19 = 0x250F1E000;
        }

      }
      v55 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v57, v66, 16);
    }
    while (v55);
  }

  v39 = (void *)MEMORY[0x242656984]();
  v40 = self;
  HMFGetOSLogHandle();
  v41 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v41, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v63 = v42;
    v64 = 2112;
    v65 = v46;
    _os_log_impl(&dword_23E95B000, v41, OS_LOG_TYPE_INFO, "%{public}@Constructed bridge accessories @%@", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v39);

  return v46;
}

- (void)_createHAPServicesFromServiceDescriptions:(id)a3 topology:(id)a4 nodeID:(id)a5 accessoryEndpointID:(id)a6 services:(id)a7 startingServiceInstanceID:(int64_t *)a8 primaryAccessory:(id)a9 standaloneServiceLabelIndexMap:(id)a10
{
  id v14;
  id v15;
  int64_t *v16;
  uint64_t i;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  void *v27;
  HMMTRHAPEnumerator *v28;
  NSObject *v29;
  void *v30;
  id v31;
  void *v32;
  HMMTRHAPEnumerator *v33;
  NSObject *v34;
  void *v35;
  void *v36;
  void *v37;
  HMMTRHAPEnumerator *v38;
  NSObject *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  uint64_t v45;
  id v46;
  void *v47;
  HMMTRHAPEnumerator *v48;
  NSObject *v49;
  void *v50;
  int64_t v51;
  void *v52;
  void *v53;
  HMMTRHAPEnumerator *v54;
  NSObject *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  id v60;
  id v61;
  unsigned __int128 v62;
  void *v63;
  id v64;
  id obj;
  id v66;
  id v67;
  uint64_t v68;
  uint64_t v69;
  void *v71;
  void *v73;
  void *v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  uint8_t buf[4];
  void *v80;
  __int16 v81;
  uint64_t v82;
  __int16 v83;
  id v84;
  _BYTE v85[128];
  uint64_t v86;

  v86 = *MEMORY[0x24BDAC8D0];
  v14 = a3;
  v66 = a4;
  v67 = a5;
  v61 = a6;
  v64 = a7;
  v15 = a9;
  *((_QWORD *)&v62 + 1) = a10;
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  v75 = 0u;
  v76 = 0u;
  v77 = 0u;
  v78 = 0u;
  obj = v14;
  v69 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v75, v85, 16);
  if (v69)
  {
    v68 = *(_QWORD *)v76;
    *(_QWORD *)&v62 = 1;
    v16 = a8;
    do
    {
      for (i = 0; i != v69; ++i)
      {
        if (*(_QWORD *)v76 != v68)
          objc_enumerationMutation(obj);
        v18 = *(void **)(*((_QWORD *)&v75 + 1) + 8 * i);
        objc_msgSend(v18, "serviceType");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "endpoint");
        v74 = (void *)objc_claimAutoreleasedReturnValue();
        v20 = (void *)MEMORY[0x24BDBCEB8];
        objc_msgSend(v18, "requiredCharacteristics");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "arrayWithArray:", v21);
        v22 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v18, "optionalCharacteristics");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "addObjectsFromArray:", v23);

        if (objc_msgSend(v22, "count"))
        {
          v73 = v19;
          if (objc_msgSend(v18, "optionalServiceLabelIndexIncluded"))
          {
            if (*((_QWORD *)&v62 + 1))
            {
              objc_msgSend(v18, "endpoint");
              v24 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v24, "stringValue");
              v25 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(*((id *)&v62 + 1), "valueForKey:", v25);
              v26 = objc_claimAutoreleasedReturnValue();

            }
            else
            {
              objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:");
              v26 = objc_claimAutoreleasedReturnValue();
              *(_QWORD *)&v62 = v62 + 1;
              v16 = a8;
            }
            v32 = (void *)MEMORY[0x242656984]();
            v33 = self;
            HMFGetOSLogHandle();
            v34 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v34, OS_LOG_TYPE_INFO))
            {
              HMFGetLogIdentifier();
              v35 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v18, "endpoint");
              v36 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138543874;
              v80 = v35;
              v81 = 2112;
              v82 = v26;
              v83 = 2112;
              v84 = v36;
              _os_log_impl(&dword_23E95B000, v34, OS_LOG_TYPE_INFO, "%{public}@Service label index enumerated to %@ for endpoint %@", buf, 0x20u);

            }
            objc_autoreleasePoolPop(v32);
            v31 = v63;
          }
          else
          {
            v26 = 0;
            v31 = (id)MEMORY[0x24BDBD1A8];
          }
          v37 = (void *)MEMORY[0x242656984]();
          v38 = self;
          HMFGetOSLogHandle();
          v39 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v39, OS_LOG_TYPE_INFO))
          {
            HMFGetLogIdentifier();
            v40 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543874;
            v80 = v40;
            v81 = 2112;
            v82 = (uint64_t)v22;
            v83 = 2112;
            v84 = v67;
            _os_log_impl(&dword_23E95B000, v39, OS_LOG_TYPE_INFO, "%{public}@Will construct service with characteristics %@ for nodeID %@", buf, 0x20u);

          }
          objc_autoreleasePoolPop(v37);
          if (v16)
          {
            objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", *v16);
            v41 = (void *)objc_claimAutoreleasedReturnValue();
          }
          else
          {
            v41 = 0;
          }
          -[HMMTRHAPEnumerator clusterIDCharacteristicMap](v38, "clusterIDCharacteristicMap");
          v42 = (void *)objc_claimAutoreleasedReturnValue();
          v71 = v31;
          v60 = v31;
          v43 = (void *)v26;
          +[HMMTRAccessoryServerFactory createHMMTRHAPServiceCommon:characteristics:serviceLabelIndex:serviceInstanceID:endpointID:nodeID:topology:clusterIDCharacteristicMap:linkedServices:](HMMTRAccessoryServerFactory, "createHMMTRHAPServiceCommon:characteristics:serviceLabelIndex:serviceInstanceID:endpointID:nodeID:topology:clusterIDCharacteristicMap:linkedServices:", v73, v22, v26, v41, v74, v67, v66, v42, v60);
          v44 = (void *)objc_claimAutoreleasedReturnValue();

          if (v15)
            v45 = objc_msgSend(v44, "setAccessory:", v15);
          v46 = v15;
          v47 = (void *)MEMORY[0x242656984](v45);
          v48 = v38;
          HMFGetOSLogHandle();
          v49 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v49, OS_LOG_TYPE_INFO))
          {
            HMFGetLogIdentifier();
            v50 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543874;
            v80 = v50;
            v81 = 2112;
            v82 = (uint64_t)v44;
            v83 = 2112;
            v84 = v74;
            _os_log_impl(&dword_23E95B000, v49, OS_LOG_TYPE_INFO, "%{public}@Constructed new service to add %@ at endpoint %@", buf, 0x20u);

            v16 = a8;
          }

          objc_autoreleasePoolPop(v47);
          v15 = v46;
          if (v44)
          {
            if (v16)
            {
              v51 = *a8;
              objc_msgSend(v44, "characteristics");
              v52 = (void *)objc_claimAutoreleasedReturnValue();
              v16 = a8;
              *a8 = +[HMMTRUtilities nextServiceInstanceID:previousCharacteristicsCount:](HMMTRUtilities, "nextServiceInstanceID:previousCharacteristicsCount:", v51, objc_msgSend(v52, "count"));

            }
            objc_msgSend(v64, "addObject:", v44);
          }

          v19 = v73;
        }
        else
        {
          v27 = (void *)MEMORY[0x242656984]();
          v28 = self;
          HMFGetOSLogHandle();
          v29 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
          {
            HMFGetLogIdentifier();
            v30 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543874;
            v80 = v30;
            v81 = 2112;
            v82 = (uint64_t)v19;
            v83 = 2112;
            v84 = v74;
            _os_log_impl(&dword_23E95B000, v29, OS_LOG_TYPE_INFO, "%{public}@Not constructing new service of type %@ as there are no supported characteristics at endpoint %@", buf, 0x20u);

            v16 = a8;
          }

          objc_autoreleasePoolPop(v27);
        }

      }
      v69 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v75, v85, 16);
    }
    while (v69);
  }
  else
  {
    *(_QWORD *)&v62 = 1;
  }

  if (v62 >= 2)
  {
    v53 = (void *)MEMORY[0x242656984]();
    v54 = self;
    HMFGetOSLogHandle();
    v55 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v55, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v56 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v80 = v56;
      v81 = 2112;
      v82 = (uint64_t)v61;
      _os_log_impl(&dword_23E95B000, v55, OS_LOG_TYPE_INFO, "%{public}@Constructed Service Label service at endpoint %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v53);
    +[HMMTRAccessoryServerFactory createHMMTRHAPServiceLabelServiceWithEndpointID:nodeID:](HMMTRAccessoryServerFactory, "createHMMTRHAPServiceLabelServiceWithEndpointID:nodeID:", v61, v67);
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    v58 = v57;
    if (v15)
      objc_msgSend(v57, "setAccessory:", v15);
    objc_msgSend(v64, "addObject:", v58);
    objc_msgSend(v58, "instanceID");
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v63, "addObject:", v59);

  }
}

- (id)_createBridgedHAPAccessoryWithServer:(id)a3 services:(id)a4 instanceId:(id)a5 endpointID:(id)a6
{
  id v8;
  objc_class *v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;

  v8 = a3;
  v9 = (objc_class *)MEMORY[0x24BE1B998];
  v10 = a5;
  v11 = a4;
  v12 = (void *)objc_msgSend([v9 alloc], "initWithServer:instanceID:parsedServices:", v8, v10, v11);

  if (v12)
  {
    objc_msgSend(v8, "nodeID");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    +[HMMTRUtilities identifierStringWithCHIPNodeID:](HMMTRUtilities, "identifierStringWithCHIPNodeID:", v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setIdentifier:", v14);

    objc_msgSend(v8, "primaryAccessory");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "serverIdentifier");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setServerIdentifier:", v16);

    objc_msgSend(v12, "setPrimary:", 0);
  }

  return v12;
}

- (NSDictionary)clusterIDCharacteristicMap
{
  return self->_clusterIDCharacteristicMap;
}

- (void)setClusterIDCharacteristicMap:(id)a3
{
  objc_storeStrong((id *)&self->_clusterIDCharacteristicMap, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_clusterIDCharacteristicMap, 0);
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t9 != -1)
    dispatch_once(&logCategory__hmf_once_t9, &__block_literal_global_338);
  return (id)logCategory__hmf_once_v10;
}

void __33__HMMTRHAPEnumerator_logCategory__block_invoke()
{
  uint64_t v0;
  void *v1;

  HMFCreateOSLogHandle();
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)logCategory__hmf_once_v10;
  logCategory__hmf_once_v10 = v0;

}

@end
