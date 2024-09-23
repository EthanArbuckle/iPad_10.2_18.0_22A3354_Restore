@implementation HMDAccessoryAccessCodeReaderWriter

- (HMDAccessoryAccessCodeReaderWriter)initWithContext:(id)a3
{
  id v5;
  HMDAccessoryAccessCodeReaderWriter *v6;
  HMDAccessoryAccessCodeReaderWriter *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)HMDAccessoryAccessCodeReaderWriter;
  v6 = -[HMDAccessoryAccessCodeReaderWriter init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_context, a3);

  return v7;
}

- (id)readAccessCodesFromAccessoriesWithUUIDs:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  void *v7;

  v4 = a3;
  -[HMDAccessoryAccessCodeReaderWriter context](self, "context");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "workQueue");
  v6 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v6);

  -[HMDAccessoryAccessCodeReaderWriter _readAccessCodesFromAccessoriesWithUUIDs:withRetries:](self, "_readAccessCodesFromAccessoriesWithUUIDs:withRetries:", v4, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)removeAllAccessCodesWithValue:(id)a3 withUserUUID:(id)a4 guestName:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  NSObject *v12;
  void *v13;
  HMDAccessoryAccessCodeReaderWriter *v14;
  NSObject *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  _QWORD v23[2];
  uint8_t buf[4];
  void *v25;
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  -[HMDAccessoryAccessCodeReaderWriter context](self, "context");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "workQueue");
  v12 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v12);

  v13 = (void *)MEMORY[0x227676638]();
  v14 = self;
  HMFGetOSLogHandle();
  v15 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v25 = v16;
    _os_log_impl(&dword_2218F0000, v15, OS_LOG_TYPE_INFO, "%{public}@removeAllAccessCodesWithValue", buf, 0xCu);

  }
  objc_autoreleasePoolPop(v13);
  -[HMDAccessoryAccessCodeReaderWriter removeAllHAPAccessCodesWithValue:forSpecificAccessory:](v14, "removeAllHAPAccessCodesWithValue:forSpecificAccessory:", v8, 0);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDAccessoryAccessCodeReaderWriter removeAllAccessCodesWithValue_Matter:withUserUUID:guestName:](v14, "removeAllAccessCodesWithValue_Matter:withUserUUID:guestName:", v8, v9, v10);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = (void *)MEMORY[0x24BE6B608];
  v23[0] = v17;
  v23[1] = v18;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v23, 2);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "combineAllFuturesFlatteningArrayResults:", v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  return v21;
}

- (id)removeAllHAPAccessCodesWithValue:(id)a3 forSpecificAccessory:(id)a4
{
  id v6;
  id v7;
  void *v8;
  NSObject *v9;
  void *v10;
  HMDAccessoryAccessCodeReaderWriter *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  HMDAccessoryAccessCodeReaderWriter *v17;
  NSObject *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  _QWORD v25[4];
  id v26;
  HMDAccessoryAccessCodeReaderWriter *v27;
  void *v28;
  uint8_t buf[4];
  void *v30;
  __int16 v31;
  id v32;
  uint64_t v33;

  v33 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  -[HMDAccessoryAccessCodeReaderWriter context](self, "context");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "workQueue");
  v9 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v9);

  v10 = (void *)MEMORY[0x227676638]();
  v11 = self;
  HMFGetOSLogHandle();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v30 = v13;
    _os_log_impl(&dword_2218F0000, v12, OS_LOG_TYPE_INFO, "%{public}@removeAllHAPAccessCodesWithValue", buf, 0xCu);

  }
  objc_autoreleasePoolPop(v10);
  if (!v7)
  {
    -[HMDAccessoryAccessCodeReaderWriter context](v11, "context");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "UUIDsOfHAPAccessoriesSupportingAccessCodes");
    v15 = objc_claimAutoreleasedReturnValue();
    goto LABEL_11;
  }
  if ((objc_msgSend(v7, "supportsCHIP") & 1) == 0 && (objc_msgSend(v7, "supportsAccessCode") & 1) != 0)
  {
    objc_msgSend(v7, "uuid");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = v14;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v28, 1);
    v15 = objc_claimAutoreleasedReturnValue();
LABEL_11:
    v21 = (void *)v15;

    -[HMDAccessoryAccessCodeReaderWriter _readAccessCodesFromAccessoriesWithUUIDs:withRetries:](v11, "_readAccessCodesFromAccessoriesWithUUIDs:withRetries:", v21, 1);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v25[0] = MEMORY[0x24BDAC760];
    v25[1] = 3221225472;
    v25[2] = __92__HMDAccessoryAccessCodeReaderWriter_removeAllHAPAccessCodesWithValue_forSpecificAccessory___block_invoke;
    v25[3] = &unk_24E7932C8;
    v26 = v6;
    v27 = v11;
    objc_msgSend(v23, "flatMap:", v25);
    v22 = (void *)objc_claimAutoreleasedReturnValue();

    goto LABEL_12;
  }
  v16 = (void *)MEMORY[0x227676638]();
  v17 = v11;
  HMFGetOSLogHandle();
  v18 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
  {
    HMFGetLogIdentifier();
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v30 = v19;
    v31 = 2112;
    v32 = v7;
    _os_log_impl(&dword_2218F0000, v18, OS_LOG_TYPE_ERROR, "%{public}@removeAccessCodeWithValue for HAP was passed a non HAP accessory or does not support access codes: %@", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v16);
  v20 = (void *)MEMORY[0x24BE6B608];
  objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", *MEMORY[0x24BDD5BD8], 48, 0);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "futureWithError:", v21);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_12:

  return v22;
}

- (id)removeAllAccessCodesWithValue_Matter:(id)a3 withUserUUID:(id)a4 guestName:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  NSObject *v12;
  void *v13;
  HMDAccessoryAccessCodeReaderWriter *v14;
  NSObject *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v22;
  uint64_t v23;
  id (*v24)(uint64_t, void *);
  void *v25;
  HMDAccessoryAccessCodeReaderWriter *v26;
  id v27;
  id v28;
  id v29;
  uint8_t buf[4];
  void *v31;
  uint64_t v32;

  v32 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  if ((_os_feature_enabled_impl() & 1) != 0)
  {
    -[HMDAccessoryAccessCodeReaderWriter context](self, "context");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "workQueue");
    v12 = objc_claimAutoreleasedReturnValue();
    dispatch_assert_queue_V2(v12);

    v13 = (void *)MEMORY[0x227676638]();
    v14 = self;
    HMFGetOSLogHandle();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v31 = v16;
      _os_log_impl(&dword_2218F0000, v15, OS_LOG_TYPE_INFO, "%{public}@removeAllAccessCodesWithValue_Matter", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v13);
    -[HMDAccessoryAccessCodeReaderWriter context](v14, "context");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "UUIDsOfMatterAccessoriesSupportingAccessCodes");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = MEMORY[0x24BDAC760];
    v23 = 3221225472;
    v24 = __98__HMDAccessoryAccessCodeReaderWriter_removeAllAccessCodesWithValue_Matter_withUserUUID_guestName___block_invoke;
    v25 = &unk_24E7741C0;
    v26 = v14;
    v27 = v8;
    v28 = v9;
    v29 = v10;
    objc_msgSend(v18, "na_map:", &v22);
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x24BE6B608], "combineAllFuturesIgnoringEmptyResults:", v19, v22, v23, v24, v25, v26);
    v20 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(MEMORY[0x24BE6B608], "futureWithResult:", MEMORY[0x24BDBD1A8]);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v20;
}

- (id)removeAccessCodeWithValue_Matter:(id)a3 fromAccessory:(id)a4 withUserUUID:(id)a5 guestName:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  NSObject *v15;
  void *v16;
  HMDAccessoryAccessCodeReaderWriter *v17;
  NSObject *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  id v25;
  void *v26;
  id v27;
  id v28;
  id v29;
  void *v30;
  id v31;
  id v32;
  id v33;
  void *v34;
  _QWORD v36[4];
  id v37;
  id v38;
  id v39;
  _QWORD v40[4];
  id v41;
  id v42;
  id v43;
  _QWORD v44[4];
  id v45;
  uint8_t buf[4];
  void *v47;
  __int16 v48;
  void *v49;
  uint64_t v50;

  v50 = *MEMORY[0x24BDAC8D0];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  -[HMDAccessoryAccessCodeReaderWriter context](self, "context");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "workQueue");
  v15 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v15);

  v16 = (void *)MEMORY[0x227676638]();
  v17 = self;
  HMFGetOSLogHandle();
  v18 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "uuid");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v47 = v19;
    v48 = 2112;
    v49 = v20;
    _os_log_impl(&dword_2218F0000, v18, OS_LOG_TYPE_INFO, "%{public}@removeAllAccessCodesWithValue_Matter fromAccessory: %@", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v16);
  -[HMDAccessoryAccessCodeReaderWriter context](v17, "context");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "home");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "findUserIndexForUserUUID:guestName:accessory:", v12, v13, v11);
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  v24 = MEMORY[0x24BDAC760];
  v44[0] = MEMORY[0x24BDAC760];
  v44[1] = 3221225472;
  v44[2] = __108__HMDAccessoryAccessCodeReaderWriter_removeAccessCodeWithValue_Matter_fromAccessory_withUserUUID_guestName___block_invoke;
  v44[3] = &unk_24E7741E8;
  v25 = v11;
  v45 = v25;
  objc_msgSend(v23, "flatMap:", v44);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v40[0] = v24;
  v40[1] = 3221225472;
  v40[2] = __108__HMDAccessoryAccessCodeReaderWriter_removeAccessCodeWithValue_Matter_fromAccessory_withUserUUID_guestName___block_invoke_3;
  v40[3] = &unk_24E7765B8;
  v27 = v23;
  v41 = v27;
  v28 = v25;
  v42 = v28;
  v29 = v10;
  v43 = v29;
  objc_msgSend(v26, "flatMap:", v40);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v36[0] = v24;
  v36[1] = 3221225472;
  v36[2] = __108__HMDAccessoryAccessCodeReaderWriter_removeAccessCodeWithValue_Matter_fromAccessory_withUserUUID_guestName___block_invoke_5;
  v36[3] = &unk_24E792CB0;
  v37 = v27;
  v38 = v28;
  v39 = v29;
  v31 = v29;
  v32 = v28;
  v33 = v27;
  objc_msgSend(v30, "recover:", v36);
  v34 = (void *)objc_claimAutoreleasedReturnValue();

  return v34;
}

- (id)_readAccessCodeWithIdentifier:(id)a3 accessoryUUID:(id)a4
{
  id v6;
  id v7;
  void *v8;
  HMDAccessoryAccessCodeReaderWriter *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  _QWORD v22[4];
  id v23;
  _QWORD v24[4];
  id v25;
  void *v26;
  id v27;
  void *v28;
  uint8_t buf[4];
  void *v30;
  __int16 v31;
  id v32;
  __int16 v33;
  id v34;
  uint64_t v35;

  v35 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  v8 = (void *)MEMORY[0x227676638]();
  v9 = self;
  HMFGetOSLogHandle();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    v30 = v11;
    v31 = 2112;
    v32 = v6;
    v33 = 2112;
    v34 = v7;
    _os_log_impl(&dword_2218F0000, v10, OS_LOG_TYPE_INFO, "%{public}@Reading access code for identifier: %@ from accessoryUUID: %@", buf, 0x20u);

  }
  objc_autoreleasePoolPop(v8);
  v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE1BC28]), "initWithValue:", v6);
  v26 = v12;
  v27 = v7;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v26, 1);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = v13;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v28, &v27, 1);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  -[HMDAccessoryAccessCodeReaderWriter _createReadWriteRequestsForAccessCodeIdentifiers:](v9, "_createReadWriteRequestsForAccessCodeIdentifiers:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (v15)
  {
    -[HMDAccessoryAccessCodeReaderWriter _performWriteRequests:withRetries:](v9, "_performWriteRequests:withRetries:", v15, 1);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = MEMORY[0x24BDAC760];
    v24[0] = MEMORY[0x24BDAC760];
    v24[1] = 3221225472;
    v24[2] = __82__HMDAccessoryAccessCodeReaderWriter__readAccessCodeWithIdentifier_accessoryUUID___block_invoke;
    v24[3] = &unk_24E774260;
    v25 = v15;
    objc_msgSend(v16, "flatMap:", v24);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v22[0] = v17;
    v22[1] = 3221225472;
    v22[2] = __82__HMDAccessoryAccessCodeReaderWriter__readAccessCodeWithIdentifier_accessoryUUID___block_invoke_2;
    v22[3] = &unk_24E799468;
    v23 = v6;
    objc_msgSend(v18, "flatMap:", v22);
    v19 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v20 = (void *)MEMORY[0x24BE6B608];
    objc_msgSend(MEMORY[0x24BDD1540], "hmfErrorWithCode:reason:", 11, CFSTR("Failed to create read write requests"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "futureWithError:", v16);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v19;
}

- (id)readConstraintsFromAccessoriesWithUUIDs:(id)a3
{
  return -[HMDAccessoryAccessCodeReaderWriter _readConstraintsFromAccessoriesWithUUIDs:withRetries:](self, "_readConstraintsFromAccessoriesWithUUIDs:withRetries:", a3, 1);
}

- (void)_readConstraintsAndAccessCodesFromAccessoriesWithUUIDs:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  HMDAccessoryAccessCodeReaderWriter *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  HMDAccessoryAccessCodeReaderWriter *v13;
  NSObject *v14;
  void *v15;
  void *v16;
  id v17;
  _QWORD v18[5];
  id v19;
  id v20;
  uint8_t buf[4];
  void *v22;
  __int16 v23;
  id v24;
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  v8 = (void *)MEMORY[0x227676638]();
  v9 = self;
  HMFGetOSLogHandle();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v22 = v11;
    v23 = 2112;
    v24 = v6;
    _os_log_impl(&dword_2218F0000, v10, OS_LOG_TYPE_INFO, "%{public}@Reading constraints and access codes from accessories with UUIDs: %@", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v8);
  if (objc_msgSend(v6, "hmf_isEmpty"))
  {
    v12 = (void *)MEMORY[0x227676638]();
    v13 = v9;
    HMFGetOSLogHandle();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v22 = v15;
      _os_log_impl(&dword_2218F0000, v14, OS_LOG_TYPE_INFO, "%{public}@Caller submitted empty array of accessory UUIDs", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v12);
    (*((void (**)(id, _QWORD, _QWORD))v7 + 2))(v7, MEMORY[0x24BDBD1A8], MEMORY[0x24BDBD1A8]);
  }
  else
  {
    -[HMDAccessoryAccessCodeReaderWriter _readConstraintsFromAccessoriesWithUUIDs:withRetries:](v9, "_readConstraintsFromAccessoriesWithUUIDs:withRetries:", v6, 1);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v18[0] = MEMORY[0x24BDAC760];
    v18[1] = 3221225472;
    v18[2] = __104__HMDAccessoryAccessCodeReaderWriter__readConstraintsAndAccessCodesFromAccessoriesWithUUIDs_completion___block_invoke;
    v18[3] = &unk_24E795030;
    v18[4] = v9;
    v19 = v6;
    v20 = v7;
    v17 = (id)objc_msgSend(v16, "addCompletionBlock:", v18);

  }
}

- (id)_performWriteRequests:(id)a3 withRetries:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;

  v4 = a4;
  v6 = a3;
  -[HMDAccessoryAccessCodeReaderWriter context](self, "context");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v4)
  {
    -[HMDAccessoryAccessCodeReaderWriter context](self, "context");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "accessoryReadWriteRetries");
    -[HMDAccessoryAccessCodeReaderWriter context](self, "context");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "accessoryReadWriteRetryTimeInterval");
    objc_msgSend(v8, "performWriteRequests:withRetries:timeInterval:loggingObject:", v6, v10, self);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    v6 = v9;
  }
  else
  {
    objc_msgSend(v7, "performWriteRequests:withRetries:timeInterval:loggingObject:", v6, 0, self, 0.0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v12;
}

- (id)_performReadRequests:(id)a3 withRetries:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;

  v4 = a4;
  v6 = a3;
  -[HMDAccessoryAccessCodeReaderWriter context](self, "context");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v4)
  {
    -[HMDAccessoryAccessCodeReaderWriter context](self, "context");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "accessoryReadWriteRetries");
    -[HMDAccessoryAccessCodeReaderWriter context](self, "context");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "accessoryReadWriteRetryTimeInterval");
    objc_msgSend(v8, "performReadRequests:withRetries:timeInterval:loggingObject:", v6, v10, self);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    v6 = v9;
  }
  else
  {
    objc_msgSend(v7, "performReadRequests:withRetries:timeInterval:loggingObject:", v6, 0, self, 0.0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v12;
}

- (id)performAccessCodeModificationRequests:(id)a3 withRetries:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  void *v7;
  NSObject *v8;
  void *v9;
  HMDAccessoryAccessCodeReaderWriter *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  HMDAccessoryAccessCodeReaderWriter *v14;
  NSObject *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  _QWORD v26[5];
  _QWORD v27[5];
  _QWORD v28[2];
  uint8_t buf[4];
  void *v30;
  __int16 v31;
  id v32;
  uint64_t v33;

  v4 = a4;
  v33 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  -[HMDAccessoryAccessCodeReaderWriter context](self, "context");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "workQueue");
  v8 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v8);

  v9 = (void *)MEMORY[0x227676638]();
  v10 = self;
  HMFGetOSLogHandle();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v30 = v12;
    v31 = 2112;
    v32 = v6;
    _os_log_impl(&dword_2218F0000, v11, OS_LOG_TYPE_INFO, "%{public}@Performing access code modification requests: %@", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v9);
  if (objc_msgSend(v6, "hmf_isEmpty"))
  {
    v13 = (void *)MEMORY[0x227676638]();
    v14 = v10;
    HMFGetOSLogHandle();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v30 = v16;
      _os_log_impl(&dword_2218F0000, v15, OS_LOG_TYPE_INFO, "%{public}@Caller submitted empty modification requests", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v13);
    objc_msgSend(MEMORY[0x24BE6B608], "futureWithResult:", MEMORY[0x24BDBD1A8]);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v18 = MEMORY[0x24BDAC760];
    v27[0] = MEMORY[0x24BDAC760];
    v27[1] = 3221225472;
    v27[2] = __88__HMDAccessoryAccessCodeReaderWriter_performAccessCodeModificationRequests_withRetries___block_invoke;
    v27[3] = &unk_24E774288;
    v27[4] = v10;
    objc_msgSend(v6, "na_filter:", v27);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v26[0] = v18;
    v26[1] = 3221225472;
    v26[2] = __88__HMDAccessoryAccessCodeReaderWriter_performAccessCodeModificationRequests_withRetries___block_invoke_2;
    v26[3] = &unk_24E774288;
    v26[4] = v10;
    objc_msgSend(v6, "na_filter:", v26);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDAccessoryAccessCodeReaderWriter performAccessCodeModificationRequests_Matter:withRetries:](v10, "performAccessCodeModificationRequests_Matter:withRetries:", v19, v4);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDAccessoryAccessCodeReaderWriter performAccessCodeModificationRequests_HAP:withRetries:](v10, "performAccessCodeModificationRequests_HAP:withRetries:", v20, v4);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = (void *)MEMORY[0x24BE6B608];
    v28[0] = v21;
    v28[1] = v22;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v28, 2);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "combineAllFuturesFlatteningArrayResults:", v24);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v17;
}

- (id)performAccessCodeModificationRequests_HAP:(id)a3 withRetries:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  void *v7;
  NSObject *v8;
  void *v9;
  HMDAccessoryAccessCodeReaderWriter *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  HMDAccessoryAccessCodeReaderWriter *v17;
  NSObject *v18;
  void *v19;
  void *v20;
  void *v21;
  _QWORD v23[5];
  id v24;
  uint8_t buf[4];
  void *v26;
  __int16 v27;
  id v28;
  uint64_t v29;

  v4 = a4;
  v29 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  -[HMDAccessoryAccessCodeReaderWriter context](self, "context");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "workQueue");
  v8 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v8);

  v9 = (void *)MEMORY[0x227676638]();
  v10 = self;
  HMFGetOSLogHandle();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v26 = v12;
    v27 = 2112;
    v28 = v6;
    _os_log_impl(&dword_2218F0000, v11, OS_LOG_TYPE_INFO, "%{public}@Performing access code modification requests HAP: %@", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v9);
  if (objc_msgSend(v6, "hmf_isEmpty"))
  {
    objc_msgSend(MEMORY[0x24BE6B608], "futureWithResult:", MEMORY[0x24BDBD1A8]);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[HMDAccessoryAccessCodeReaderWriter _createWriteRequestsForModificationRequests:](v10, "_createWriteRequestsForModificationRequests:", v6);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "na_map:", &__block_literal_global_64);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v15, "hmf_isEmpty"))
    {
      v16 = (void *)MEMORY[0x227676638]();
      v17 = v10;
      HMFGetOSLogHandle();
      v18 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v26 = v19;
        _os_log_impl(&dword_2218F0000, v18, OS_LOG_TYPE_ERROR, "%{public}@Did not find any valid write requests to perform", buf, 0xCu);

      }
      objc_autoreleasePoolPop(v16);
      v20 = (void *)MEMORY[0x24BE6B608];
      objc_msgSend(MEMORY[0x24BDD1540], "hmfErrorWithCode:", 11);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "futureWithError:", v21);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      -[HMDAccessoryAccessCodeReaderWriter _performWriteRequests:withRetries:](v10, "_performWriteRequests:withRetries:", v15, v4);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v23[0] = MEMORY[0x24BDAC760];
      v23[1] = 3221225472;
      v23[2] = __92__HMDAccessoryAccessCodeReaderWriter_performAccessCodeModificationRequests_HAP_withRetries___block_invoke_65;
      v23[3] = &unk_24E7742F0;
      v23[4] = v10;
      v24 = v14;
      objc_msgSend(v21, "flatMap:", v23);
      v13 = (void *)objc_claimAutoreleasedReturnValue();

    }
  }

  return v13;
}

- (id)performAccessCodeModificationRequests_Matter:(id)a3 withRetries:(BOOL)a4
{
  id v5;
  void *v6;
  NSObject *v7;
  void *v8;
  HMDAccessoryAccessCodeReaderWriter *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  _QWORD v17[5];
  uint8_t buf[4];
  void *v19;
  __int16 v20;
  id v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  if ((_os_feature_enabled_impl() & 1) == 0)
    goto LABEL_5;
  -[HMDAccessoryAccessCodeReaderWriter context](self, "context");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "workQueue");
  v7 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v7);

  v8 = (void *)MEMORY[0x227676638]();
  v9 = self;
  HMFGetOSLogHandle();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v19 = v11;
    v20 = 2112;
    v21 = v5;
    _os_log_impl(&dword_2218F0000, v10, OS_LOG_TYPE_INFO, "%{public}@Performing access code modification requests Matter: %@", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v8);
  if (!objc_msgSend(v5, "hmf_isEmpty"))
  {
    v17[0] = MEMORY[0x24BDAC760];
    v17[1] = 3221225472;
    v17[2] = __95__HMDAccessoryAccessCodeReaderWriter_performAccessCodeModificationRequests_Matter_withRetries___block_invoke;
    v17[3] = &unk_24E774318;
    v17[4] = v9;
    objc_msgSend(v5, "na_map:", v17);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = (void *)MEMORY[0x24BE6B608];
    objc_msgSend(MEMORY[0x24BE6B628], "immediateScheduler");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "combineAllFutures:scheduler:", v13, v15);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
LABEL_5:
    objc_msgSend(MEMORY[0x24BE6B608], "futureWithResult:", MEMORY[0x24BDBD1A8]);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v12;
}

- (id)performModificationRequest_Matter:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  void *v7;
  HMDAccessoryAccessCodeReaderWriter *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  unint64_t v16;
  id v17;
  void *v18;
  unint64_t v19;
  id v20;
  void *v21;
  id v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  _BOOL4 v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  uint64_t v34;
  void *v35;
  void *v36;
  void *v37;
  uint64_t v38;
  id v39;
  void *v40;
  void *v41;
  id v42;
  _QWORD *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  HMDAccessoryAccessCodeReaderWriter *v48;
  NSObject *v49;
  void *v50;
  void *v51;
  void *v52;
  uint64_t v53;
  uint64_t v54;
  id v55;
  id v56;
  id v57;
  void *v58;
  id v59;
  void *v60;
  void *v62;
  void *v63;
  void *v64;
  unint64_t v65;
  _QWORD v66[5];
  id v67;
  uint64_t v68;
  uint64_t v69;
  id (*v70)(uint64_t);
  void *v71;
  id v72;
  id v73;
  id v74;
  uint64_t v75;
  _QWORD v76[4];
  id v77;
  _QWORD v78[4];
  id v79;
  id v80;
  uint8_t buf[4];
  void *v82;
  __int16 v83;
  id v84;
  uint64_t v85;

  v85 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[HMDAccessoryAccessCodeReaderWriter context](self, "context");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "workQueue");
  v6 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v6);

  v7 = (void *)MEMORY[0x227676638]();
  v8 = self;
  HMFGetOSLogHandle();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v82 = v10;
    v83 = 2112;
    v84 = v4;
    _os_log_impl(&dword_2218F0000, v9, OS_LOG_TYPE_INFO, "%{public}@Performing access code modification request Matter: %@", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v7);
  -[HMDAccessoryAccessCodeReaderWriter context](v8, "context");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "accessoryUUID");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "hapAccessoryWithUUID:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v14 = v4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v15 = v14;
  else
    v15 = 0;
  v16 = v15;

  v17 = v14;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v18 = v17;
  else
    v18 = 0;
  v19 = v18;

  v20 = v17;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v21 = v20;
  else
    v21 = 0;
  v22 = v21;

  v64 = v22;
  v65 = v19;
  v63 = (void *)v16;
  if (v22)
  {
    v23 = (void *)MEMORY[0x24BE6B608];
    objc_msgSend(v22, "accessoryAccessCodeValue");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "uniqueIdentifier");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "futureWithResult:", v25);
    v26 = (void *)objc_claimAutoreleasedReturnValue();

    v27 = v16 != 0;
    if (!(v16 | v19))
    {
      objc_msgSend(v22, "accessoryAccessCodeValue");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v40, "accessCodeValue");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v41, "stringValue");
      v42 = (id)objc_claimAutoreleasedReturnValue();

      v38 = MEMORY[0x24BDAC760];
      v76[0] = MEMORY[0x24BDAC760];
      v43 = &unk_22269F000;
      v76[1] = 3221225472;
      v76[2] = __72__HMDAccessoryAccessCodeReaderWriter_performModificationRequest_Matter___block_invoke_3;
      v76[3] = &unk_24E7741E8;
      v77 = v13;
      objc_msgSend(v26, "flatMap:", v76);
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      v34 = 2;
      v45 = v13;
      v46 = v77;
      goto LABEL_24;
    }
    v62 = v13;
    goto LABEL_16;
  }
  -[HMDAccessoryAccessCodeReaderWriter context](v8, "context");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "home");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "userUUID");
  v30 = v13;
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "guestName");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BE3F178], "untrackedPlaceholderFlow");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v62 = v30;
  objc_msgSend(v29, "findOrAddUserIndexForUserUUID:guestName:accessory:flow:", v31, v32, v30, v33);
  v26 = (void *)objc_claimAutoreleasedReturnValue();

  v19 = v65;
  v27 = v16 != 0;
  if (v16 | v65)
  {
LABEL_16:
    v34 = !v27;
    objc_msgSend((id)v16, "accessCodeValue");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "stringValue");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    v37 = v36;
    v38 = MEMORY[0x24BDAC760];
    if (v36)
    {
      v39 = v36;
    }
    else
    {
      objc_msgSend((id)v19, "updatedAccessCodeValue");
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v52, "stringValue");
      v39 = (id)objc_claimAutoreleasedReturnValue();

      v38 = MEMORY[0x24BDAC760];
    }

    v78[0] = v38;
    v43 = &unk_22269F000;
    v78[1] = 3221225472;
    v78[2] = __72__HMDAccessoryAccessCodeReaderWriter_performModificationRequest_Matter___block_invoke;
    v78[3] = &unk_24E774210;
    v45 = v62;
    v79 = v62;
    v42 = v39;
    v80 = v42;
    objc_msgSend(v26, "flatMap:", v78);
    v44 = (void *)objc_claimAutoreleasedReturnValue();

    v46 = v79;
    goto LABEL_24;
  }
  v47 = (void *)MEMORY[0x227676638]();
  v48 = v8;
  HMFGetOSLogHandle();
  v49 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v49, OS_LOG_TYPE_ERROR))
  {
    HMFGetLogIdentifier();
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v82 = v50;
    _os_log_impl(&dword_2218F0000, v49, OS_LOG_TYPE_ERROR, "%{public}@Found HMAccessCodeModificationRequestValue of unknown type", buf, 0xCu);

  }
  objc_autoreleasePoolPop(v47);
  v51 = (void *)MEMORY[0x24BE6B608];
  objc_msgSend(MEMORY[0x24BDD1540], "hmErrorWithCode:", 52);
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v51, "futureWithError:", v46);
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  v42 = 0;
  v34 = 0;
  v45 = v62;
  v38 = MEMORY[0x24BDAC760];
  v43 = (_QWORD *)&unk_22269F000;
LABEL_24:

  v68 = v38;
  v69 = v43[398];
  v53 = v69;
  v70 = __72__HMDAccessoryAccessCodeReaderWriter_performModificationRequest_Matter___block_invoke_69;
  v71 = &unk_24E774368;
  v72 = v26;
  v73 = v42;
  v54 = v38;
  v55 = v20;
  v74 = v55;
  v75 = v34;
  v56 = v42;
  v57 = v26;
  objc_msgSend(v44, "flatMap:", &v68);
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  v66[0] = v54;
  v66[1] = v53;
  v66[2] = __72__HMDAccessoryAccessCodeReaderWriter_performModificationRequest_Matter___block_invoke_3_73;
  v66[3] = &unk_24E774390;
  v66[4] = v8;
  v67 = v55;
  v59 = v55;
  objc_msgSend(v58, "recover:", v66);
  v60 = (void *)objc_claimAutoreleasedReturnValue();

  return v60;
}

- (id)_readConstraintsFromAccessoriesWithUUIDs:(id)a3 withRetries:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  void *v7;
  HMDAccessoryAccessCodeReaderWriter *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  HMDAccessoryAccessCodeReaderWriter *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  _QWORD v24[5];
  _QWORD v25[5];
  _QWORD v26[2];
  uint8_t buf[4];
  void *v28;
  __int16 v29;
  id v30;
  uint64_t v31;

  v4 = a4;
  v31 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = (void *)MEMORY[0x227676638]();
  v8 = self;
  HMFGetOSLogHandle();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v28 = v10;
    v29 = 2112;
    v30 = v6;
    _os_log_impl(&dword_2218F0000, v9, OS_LOG_TYPE_INFO, "%{public}@Reading constraints from accessories with UUIDs: %@", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v7);
  if (objc_msgSend(v6, "hmf_isEmpty"))
  {
    v11 = (void *)MEMORY[0x227676638]();
    v12 = v8;
    HMFGetOSLogHandle();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v28 = v14;
      _os_log_impl(&dword_2218F0000, v13, OS_LOG_TYPE_INFO, "%{public}@Caller submitted empty array of accessory UUIDs", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v11);
    objc_msgSend(MEMORY[0x24BE6B608], "futureWithResult:", MEMORY[0x24BDBD1A8]);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v16 = MEMORY[0x24BDAC760];
    v25[0] = MEMORY[0x24BDAC760];
    v25[1] = 3221225472;
    v25[2] = __91__HMDAccessoryAccessCodeReaderWriter__readConstraintsFromAccessoriesWithUUIDs_withRetries___block_invoke;
    v25[3] = &unk_24E79BCA0;
    v25[4] = v8;
    objc_msgSend(v6, "na_filter:", v25);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v24[0] = v16;
    v24[1] = 3221225472;
    v24[2] = __91__HMDAccessoryAccessCodeReaderWriter__readConstraintsFromAccessoriesWithUUIDs_withRetries___block_invoke_2;
    v24[3] = &unk_24E79BCA0;
    v24[4] = v8;
    objc_msgSend(v6, "na_filter:", v24);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDAccessoryAccessCodeReaderWriter _readConstraintsFromAccessoriesWithUUIDs_HAP:withRetries:](v8, "_readConstraintsFromAccessoriesWithUUIDs_HAP:withRetries:", v17, v4);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDAccessoryAccessCodeReaderWriter _readConstraintsFromAccessoriesWithUUIDs_Matter:withRetries:](v8, "_readConstraintsFromAccessoriesWithUUIDs_Matter:withRetries:", v18, v4);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = (void *)MEMORY[0x24BE6B608];
    v26[0] = v19;
    v26[1] = v20;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v26, 2);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "combineAllFuturesFlatteningArrayResults:", v22);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v15;
}

- (id)_readConstraintsFromAccessoriesWithUUIDs_HAP:(id)a3 withRetries:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  void *v7;
  HMDAccessoryAccessCodeReaderWriter *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  HMDAccessoryAccessCodeReaderWriter *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  _QWORD v20[4];
  id v21;
  uint8_t buf[4];
  void *v23;
  __int16 v24;
  id v25;
  uint64_t v26;

  v4 = a4;
  v26 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = (void *)MEMORY[0x227676638]();
  v8 = self;
  HMFGetOSLogHandle();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v23 = v10;
    v24 = 2112;
    v25 = v6;
    _os_log_impl(&dword_2218F0000, v9, OS_LOG_TYPE_INFO, "%{public}@Reading constraints from HAP accessories with UUIDs: %@", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v7);
  if (objc_msgSend(v6, "hmf_isEmpty"))
  {
    v11 = (void *)MEMORY[0x227676638]();
    v12 = v8;
    HMFGetOSLogHandle();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v23 = v14;
      _os_log_impl(&dword_2218F0000, v13, OS_LOG_TYPE_INFO, "%{public}@Caller submitted empty array of accessory UUIDs", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v11);
    objc_msgSend(MEMORY[0x24BE6B608], "futureWithResult:", MEMORY[0x24BDBD1A8]);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[HMDAccessoryAccessCodeReaderWriter _createConstraintsReadRequestsForAccessoriesWithUUIDs:](v8, "_createConstraintsReadRequestsForAccessoriesWithUUIDs:", v6);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    if (v16)
    {
      -[HMDAccessoryAccessCodeReaderWriter _performReadRequests:withRetries:](v8, "_performReadRequests:withRetries:", v16, v4);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v20[0] = MEMORY[0x24BDAC760];
      v20[1] = 3221225472;
      v20[2] = __95__HMDAccessoryAccessCodeReaderWriter__readConstraintsFromAccessoriesWithUUIDs_HAP_withRetries___block_invoke;
      v20[3] = &unk_24E774260;
      v21 = v16;
      objc_msgSend(v17, "flatMap:", v20);
      v15 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v18 = (void *)MEMORY[0x24BE6B608];
      objc_msgSend(MEMORY[0x24BDD1540], "hmfErrorWithCode:reason:", 11, CFSTR("Failed to create constraints read requests"));
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "futureWithError:", v17);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
    }

  }
  return v15;
}

- (id)_readConstraintsFromAccessoriesWithUUIDs_Matter:(id)a3 withRetries:(BOOL)a4
{
  id v6;
  void *v7;
  HMDAccessoryAccessCodeReaderWriter *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  HMDAccessoryAccessCodeReaderWriter *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  _QWORD v20[5];
  BOOL v21;
  uint8_t buf[4];
  void *v23;
  __int16 v24;
  id v25;
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  if ((_os_feature_enabled_impl() & 1) != 0)
  {
    v7 = (void *)MEMORY[0x227676638]();
    v8 = self;
    HMFGetOSLogHandle();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v23 = v10;
      v24 = 2112;
      v25 = v6;
      _os_log_impl(&dword_2218F0000, v9, OS_LOG_TYPE_INFO, "%{public}@Reading constraints from Matter accessories with UUIDs: %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v7);
    if (!objc_msgSend(v6, "hmf_isEmpty"))
    {
      v20[0] = MEMORY[0x24BDAC760];
      v20[1] = 3221225472;
      v20[2] = __98__HMDAccessoryAccessCodeReaderWriter__readConstraintsFromAccessoriesWithUUIDs_Matter_withRetries___block_invoke;
      v20[3] = &unk_24E7743B8;
      v20[4] = v8;
      v21 = a4;
      objc_msgSend(v6, "na_map:", v20);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = (void *)MEMORY[0x24BE6B608];
      objc_msgSend(MEMORY[0x24BE6B628], "immediateScheduler");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "combineAllFutures:scheduler:", v16, v18);
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      goto LABEL_10;
    }
    v11 = (void *)MEMORY[0x227676638]();
    v12 = v8;
    HMFGetOSLogHandle();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v23 = v14;
      _os_log_impl(&dword_2218F0000, v13, OS_LOG_TYPE_INFO, "%{public}@Caller submitted empty array of accessory UUIDs", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v11);
  }
  objc_msgSend(MEMORY[0x24BE6B608], "futureWithResult:", MEMORY[0x24BDBD1A8]);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_10:

  return v15;
}

- (id)_readConstraintsFromAccessory_Matter:(id)a3 withRetries:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  void *v7;
  HMDAccessoryAccessCodeReaderWriter *v8;
  NSObject *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  id v16;
  void *v17;
  id v18;
  void *v19;
  _QWORD v21[5];
  id v22;
  _QWORD v23[4];
  id v24;
  HMDAccessoryAccessCodeReaderWriter *v25;
  uint8_t buf[4];
  void *v27;
  __int16 v28;
  id v29;
  uint64_t v30;

  v4 = a4;
  v30 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = (void *)MEMORY[0x227676638]();
  v8 = self;
  HMFGetOSLogHandle();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v27 = v10;
    v28 = 2112;
    v29 = v6;
    _os_log_impl(&dword_2218F0000, v9, OS_LOG_TYPE_INFO, "%{public}@Reading constraints from accessory: %@", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v7);
  if (v4)
    v11 = 8;
  else
    v11 = 0;
  v12 = (void *)MEMORY[0x24BE6B608];
  -[HMDAccessoryAccessCodeReaderWriter context](v8, "context");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "workQueue");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = MEMORY[0x24BDAC760];
  v23[0] = MEMORY[0x24BDAC760];
  v23[1] = 3221225472;
  v23[2] = __87__HMDAccessoryAccessCodeReaderWriter__readConstraintsFromAccessory_Matter_withRetries___block_invoke;
  v23[3] = &unk_24E7743E0;
  v16 = v6;
  v24 = v16;
  v25 = v8;
  objc_msgSend(v12, "futureWithRetries:timeInterval:workQueue:block:", v11, v14, v23, 5.0);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v21[0] = v15;
  v21[1] = 3221225472;
  v21[2] = __87__HMDAccessoryAccessCodeReaderWriter__readConstraintsFromAccessory_Matter_withRetries___block_invoke_83;
  v21[3] = &unk_24E774390;
  v21[4] = v8;
  v22 = v16;
  v18 = v16;
  objc_msgSend(v17, "recover:", v21);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  return v19;
}

- (id)_readAccessCodesFromAccessoriesWithUUIDs:(id)a3 withRetries:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  void *v7;
  HMDAccessoryAccessCodeReaderWriter *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  HMDAccessoryAccessCodeReaderWriter *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  _QWORD v24[5];
  _QWORD v25[5];
  _QWORD v26[2];
  uint8_t buf[4];
  void *v28;
  __int16 v29;
  id v30;
  uint64_t v31;

  v4 = a4;
  v31 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = (void *)MEMORY[0x227676638]();
  v8 = self;
  HMFGetOSLogHandle();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v28 = v10;
    v29 = 2112;
    v30 = v6;
    _os_log_impl(&dword_2218F0000, v9, OS_LOG_TYPE_INFO, "%{public}@Reading access codes from accessories with UUIDs: %@", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v7);
  if (objc_msgSend(v6, "hmf_isEmpty"))
  {
    v11 = (void *)MEMORY[0x227676638]();
    v12 = v8;
    HMFGetOSLogHandle();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v28 = v14;
      _os_log_impl(&dword_2218F0000, v13, OS_LOG_TYPE_INFO, "%{public}@Caller submitted empty array of accessory UUIDs", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v11);
    objc_msgSend(MEMORY[0x24BE6B608], "futureWithResult:", MEMORY[0x24BDBD1A8]);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v16 = MEMORY[0x24BDAC760];
    v25[0] = MEMORY[0x24BDAC760];
    v25[1] = 3221225472;
    v25[2] = __91__HMDAccessoryAccessCodeReaderWriter__readAccessCodesFromAccessoriesWithUUIDs_withRetries___block_invoke;
    v25[3] = &unk_24E79BCA0;
    v25[4] = v8;
    objc_msgSend(v6, "na_filter:", v25);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v24[0] = v16;
    v24[1] = 3221225472;
    v24[2] = __91__HMDAccessoryAccessCodeReaderWriter__readAccessCodesFromAccessoriesWithUUIDs_withRetries___block_invoke_2;
    v24[3] = &unk_24E79BCA0;
    v24[4] = v8;
    objc_msgSend(v6, "na_filter:", v24);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDAccessoryAccessCodeReaderWriter _readAccessCodesFromAccessoriesWithUUIDs_HAP:withRetries:](v8, "_readAccessCodesFromAccessoriesWithUUIDs_HAP:withRetries:", v17, v4);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDAccessoryAccessCodeReaderWriter _readAccessCodesFromAccessoriesWithUUIDs_Matter:withRetries:](v8, "_readAccessCodesFromAccessoriesWithUUIDs_Matter:withRetries:", v18, v4);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = (void *)MEMORY[0x24BE6B608];
    v26[0] = v19;
    v26[1] = v20;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v26, 2);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "combineAllFuturesFlatteningArrayResults:", v22);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v15;
}

- (id)_readAccessCodesFromAccessoriesWithUUIDs_HAP:(id)a3 withRetries:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  void *v7;
  void *v8;
  HMDAccessoryAccessCodeReaderWriter *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  _QWORD v19[5];
  id v20;
  BOOL v21;
  _QWORD v22[5];
  _QWORD v23[5];
  id v24;
  uint8_t buf[4];
  void *v26;
  __int16 v27;
  id v28;
  uint64_t v29;

  v4 = a4;
  v29 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  if (objc_msgSend(v6, "hmf_isEmpty"))
  {
    objc_msgSend(MEMORY[0x24BE6B608], "futureWithResult:", MEMORY[0x24BDBD1A8]);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v8 = (void *)MEMORY[0x227676638]();
    v9 = self;
    HMFGetOSLogHandle();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v26 = v11;
      v27 = 2112;
      v28 = v6;
      _os_log_impl(&dword_2218F0000, v10, OS_LOG_TYPE_INFO, "%{public}@Reading access codes from HAP accessories with UUIDs: %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v8);
    -[HMDAccessoryAccessCodeReaderWriter _createListWriteRequestsForAccessoriesWithUUIDS:](v9, "_createListWriteRequestsForAccessoriesWithUUIDS:", v6);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (v12)
    {
      -[HMDAccessoryAccessCodeReaderWriter _performWriteRequests:withRetries:](v9, "_performWriteRequests:withRetries:", v12, v4);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = MEMORY[0x24BDAC760];
      v23[0] = MEMORY[0x24BDAC760];
      v23[1] = 3221225472;
      v23[2] = __95__HMDAccessoryAccessCodeReaderWriter__readAccessCodesFromAccessoriesWithUUIDs_HAP_withRetries___block_invoke;
      v23[3] = &unk_24E7742F0;
      v23[4] = v9;
      v24 = v12;
      objc_msgSend(v13, "flatMap:", v23);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v22[0] = v14;
      v22[1] = 3221225472;
      v22[2] = __95__HMDAccessoryAccessCodeReaderWriter__readAccessCodesFromAccessoriesWithUUIDs_HAP_withRetries___block_invoke_86;
      v22[3] = &unk_24E774260;
      v22[4] = v9;
      objc_msgSend(v15, "flatMap:", v22);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v19[0] = v14;
      v19[1] = 3221225472;
      v19[2] = __95__HMDAccessoryAccessCodeReaderWriter__readAccessCodesFromAccessoriesWithUUIDs_HAP_withRetries___block_invoke_2;
      v19[3] = &unk_24E774478;
      v19[4] = v9;
      v21 = v4;
      v20 = v6;
      objc_msgSend(v16, "flatMap:", v19);
      v7 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v17 = (void *)MEMORY[0x24BE6B608];
      objc_msgSend(MEMORY[0x24BDD1540], "hmfErrorWithCode:reason:", 11, CFSTR("Failed to create list write requests"));
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "futureWithError:", v13);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
    }

  }
  return v7;
}

- (id)_readAccessCodesFromAccessoriesWithUUIDs_Matter:(id)a3 withRetries:(BOOL)a4
{
  id v6;
  void *v7;
  void *v8;
  HMDAccessoryAccessCodeReaderWriter *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  _QWORD v16[5];
  BOOL v17;
  uint8_t buf[4];
  void *v19;
  __int16 v20;
  id v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  if (_os_feature_enabled_impl() && !objc_msgSend(v6, "hmf_isEmpty"))
  {
    v8 = (void *)MEMORY[0x227676638]();
    v9 = self;
    HMFGetOSLogHandle();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v19 = v11;
      v20 = 2112;
      v21 = v6;
      _os_log_impl(&dword_2218F0000, v10, OS_LOG_TYPE_INFO, "%{public}@Reading access codes from Matter accessories with UUIDs: %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v8);
    v16[0] = MEMORY[0x24BDAC760];
    v16[1] = 3221225472;
    v16[2] = __98__HMDAccessoryAccessCodeReaderWriter__readAccessCodesFromAccessoriesWithUUIDs_Matter_withRetries___block_invoke;
    v16[3] = &unk_24E7743B8;
    v16[4] = v9;
    v17 = a4;
    objc_msgSend(v6, "na_map:", v16);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = (void *)MEMORY[0x24BE6B608];
    objc_msgSend(MEMORY[0x24BE6B628], "immediateScheduler");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "combineAllFutures:scheduler:", v12, v14);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(MEMORY[0x24BE6B608], "futureWithResult:", MEMORY[0x24BDBD1A8]);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v7;
}

- (id)_readAccessCodesFromAccessory_Matter:(id)a3 withRetries:(BOOL)a4
{
  id v5;
  void *v6;
  HMDAccessoryAccessCodeReaderWriter *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  id v14;
  void *v15;
  id v16;
  void *v17;
  _QWORD v19[5];
  id v20;
  _QWORD v21[5];
  id v22;
  uint8_t buf[4];
  void *v24;
  __int16 v25;
  id v26;
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v6 = (void *)MEMORY[0x227676638]();
  v7 = self;
  HMFGetOSLogHandle();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v24 = v9;
    v25 = 2112;
    v26 = v5;
    _os_log_impl(&dword_2218F0000, v8, OS_LOG_TYPE_INFO, "%{public}@Reading access codes from Matter accessory: %@", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v6);
  objc_msgSend(MEMORY[0x24BE3F178], "untrackedPlaceholderFlow");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "waitForDoorLockClusterObjectWithFlow:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "naFuture");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = MEMORY[0x24BDAC760];
  v21[0] = MEMORY[0x24BDAC760];
  v21[1] = 3221225472;
  v21[2] = __87__HMDAccessoryAccessCodeReaderWriter__readAccessCodesFromAccessory_Matter_withRetries___block_invoke;
  v21[3] = &unk_24E7929D0;
  v21[4] = v7;
  v14 = v5;
  v22 = v14;
  objc_msgSend(v12, "flatMap:", v21);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v19[0] = v13;
  v19[1] = 3221225472;
  v19[2] = __87__HMDAccessoryAccessCodeReaderWriter__readAccessCodesFromAccessory_Matter_withRetries___block_invoke_3;
  v19[3] = &unk_24E774390;
  v19[4] = v7;
  v20 = v14;
  v16 = v14;
  objc_msgSend(v15, "recover:", v19);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  return v17;
}

- (id)_fetchResponseFromCredentialUserTuples:(id)a3 accessory:(id)a4 doorLock:(id)a5
{
  id v7;
  id v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  uint64_t v14;
  uint64_t v15;
  id (*v16)(uint64_t, void *);
  void *v17;
  HMDAccessoryAccessCodeReaderWriter *v18;
  id v19;

  v7 = a4;
  v14 = MEMORY[0x24BDAC760];
  v15 = 3221225472;
  v16 = __96__HMDAccessoryAccessCodeReaderWriter__fetchResponseFromCredentialUserTuples_accessory_doorLock___block_invoke;
  v17 = &unk_24E7744C8;
  v18 = self;
  v19 = v7;
  v8 = v7;
  objc_msgSend(a3, "na_map:", &v14);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_alloc(MEMORY[0x24BDD7320]);
  objc_msgSend(v8, "uuid", v14, v15, v16, v17, v18);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)objc_msgSend(v10, "initWithAccessoryUUID:accessoryAccessCodeValues:error:", v11, v9, 0);

  return v12;
}

- (id)_createConstraintsReadRequestsForAccessoriesWithUUIDs:(id)a3
{
  void *v3;
  void *v4;
  void *v5;

  -[HMDAccessoryAccessCodeReaderWriter _characteristicsOfType:fromAccessoriesWithUUIDs:](self, "_characteristicsOfType:fromAccessoriesWithUUIDs:", CFSTR("00000261-0000-1000-8000-0026BB765291"), a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    objc_msgSend(v3, "na_map:", &__block_literal_global_100);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (id)_createListWriteRequestsForAccessoriesWithUUIDS:(id)a3
{
  void *v3;
  void *v4;

  -[HMDAccessoryAccessCodeReaderWriter _characteristicsOfType:fromAccessoriesWithUUIDs:](self, "_characteristicsOfType:fromAccessoriesWithUUIDs:", CFSTR("00000262-0000-1000-8000-0026BB765291"), a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    +[HMDAccessoryAccessCodeReaderWriter _createListWriteRequestsForCharacteristics:](HMDAccessoryAccessCodeReaderWriter, "_createListWriteRequestsForCharacteristics:", v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (id)_characteristicsOfType:(id)a3 fromAccessoriesWithUUIDs:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  id v11;
  void *v12;
  uint64_t v13;
  id v14;
  void *v15;
  uint64_t v16;
  id v17;
  void *v18;
  HMDAccessoryAccessCodeReaderWriter *v19;
  NSObject *v20;
  void *v21;
  void *v22;
  HMDAccessoryAccessCodeReaderWriter *v23;
  NSObject *v24;
  void *v25;
  uint64_t v27;
  uint64_t v28;
  uint64_t (*v29)(uint64_t, void *);
  void *v30;
  id v31;
  _QWORD v32[4];
  id v33;
  uint8_t buf[4];
  void *v35;
  __int16 v36;
  id v37;
  __int16 v38;
  void *v39;
  __int16 v40;
  void *v41;
  uint64_t v42;

  v42 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  -[HMDAccessoryAccessCodeReaderWriter context](self, "context");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "accessoriesSupportingAccessCodes");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = MEMORY[0x24BDAC760];
  v32[0] = MEMORY[0x24BDAC760];
  v32[1] = 3221225472;
  v32[2] = __86__HMDAccessoryAccessCodeReaderWriter__characteristicsOfType_fromAccessoriesWithUUIDs___block_invoke;
  v32[3] = &unk_24E7928E0;
  v11 = v7;
  v33 = v11;
  objc_msgSend(v9, "na_filter:", v32);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = objc_msgSend(v12, "count");
  if (v13 == objc_msgSend(v11, "count"))
  {
    v27 = v10;
    v28 = 3221225472;
    v29 = __86__HMDAccessoryAccessCodeReaderWriter__characteristicsOfType_fromAccessoriesWithUUIDs___block_invoke_103;
    v30 = &unk_24E774530;
    v14 = v6;
    v31 = v14;
    objc_msgSend(v12, "na_map:", &v27);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v15, "count", v27, v28, v29, v30);
    if (v16 == objc_msgSend(v12, "count"))
    {
      v17 = v15;
    }
    else
    {
      v22 = (void *)MEMORY[0x227676638]();
      v23 = self;
      HMFGetOSLogHandle();
      v24 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138544130;
        v35 = v25;
        v36 = 2112;
        v37 = v14;
        v38 = 2112;
        v39 = v12;
        v40 = 2112;
        v41 = v15;
        _os_log_impl(&dword_2218F0000, v24, OS_LOG_TYPE_ERROR, "%{public}@Could not find access code control point characteristics of type: %@ for all accessories: %@. Found characteristics: %@", buf, 0x2Au);

      }
      objc_autoreleasePoolPop(v22);
      v17 = 0;
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
      *(_DWORD *)buf = 138543874;
      v35 = v21;
      v36 = 2112;
      v37 = v11;
      v38 = 2112;
      v39 = v12;
      _os_log_impl(&dword_2218F0000, v20, OS_LOG_TYPE_ERROR, "%{public}@Could not find all accessories with UUIDs: %@. Only found the subset of accessories: %@", buf, 0x20u);

    }
    objc_autoreleasePoolPop(v18);
    v17 = 0;
  }

  return v17;
}

- (id)_createReadWriteRequestsForAccessCodeIdentifiers:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  __int128 v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  HMDAccessoryAccessCodeReaderWriter *v17;
  NSObject *v18;
  void *v19;
  id v20;
  void *v21;
  void *v22;
  void *v23;
  HMDAccessoryAccessCodeReaderWriter *v24;
  NSObject *v25;
  void *v26;
  __int128 v28;
  void *v29;
  uint64_t v30;
  _QWORD v32[5];
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  uint8_t buf[4];
  void *v38;
  __int16 v39;
  void *v40;
  _BYTE v41[128];
  uint64_t v42;

  v42 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  objc_msgSend(MEMORY[0x24BDD1650], "mapTableWithStrongToStrongObjects");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v33 = 0u;
  v34 = 0u;
  v35 = 0u;
  v36 = 0u;
  objc_msgSend(v3, "allKeys");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v33, v41, 16);
  if (v6)
  {
    v8 = v6;
    v30 = *(_QWORD *)v34;
    *(_QWORD *)&v7 = 138543618;
    v28 = v7;
    v29 = v5;
    while (2)
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v34 != v30)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v33 + 1) + 8 * i);
        -[HMDAccessoryAccessCodeReaderWriter context](self, "context", v28);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "accessoriesSupportingAccessCodes");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v32[0] = MEMORY[0x24BDAC760];
        v32[1] = 3221225472;
        v32[2] = __87__HMDAccessoryAccessCodeReaderWriter__createReadWriteRequestsForAccessCodeIdentifiers___block_invoke;
        v32[3] = &unk_24E7928E0;
        v32[4] = v10;
        objc_msgSend(v12, "na_firstObjectPassingTest:", v32);
        v13 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v13)
        {
          v23 = (void *)MEMORY[0x227676638]();
          v24 = self;
          HMFGetOSLogHandle();
          v25 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
          {
            HMFGetLogIdentifier();
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = v28;
            v38 = v26;
            v39 = 2112;
            v40 = v10;
            _os_log_impl(&dword_2218F0000, v25, OS_LOG_TYPE_ERROR, "%{public}@Could not create read write requests because failed to find hap accessory with UUID: %@", buf, 0x16u);

          }
          objc_autoreleasePoolPop(v23);
          v5 = v29;
LABEL_19:

          v22 = 0;
          goto LABEL_20;
        }
        objc_msgSend(v13, "findCharacteristicType:forServiceType:", CFSTR("00000262-0000-1000-8000-0026BB765291"), CFSTR("00000260-0000-1000-8000-0026BB765291"));
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        if (v14)
        {
          objc_msgSend(v3, "objectForKeyedSubscript:", v10);
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v4, "setObject:forKey:", v15, v14);

        }
        else
        {
          v16 = (void *)MEMORY[0x227676638]();
          v17 = self;
          HMFGetOSLogHandle();
          v18 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
          {
            HMFGetLogIdentifier();
            v19 = v4;
            v20 = v3;
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = v28;
            v38 = v21;
            v39 = 2112;
            v40 = v13;
            _os_log_impl(&dword_2218F0000, v18, OS_LOG_TYPE_ERROR, "%{public}@Could not create read write requests because failed to find access code control point characteristic on accessory: %@", buf, 0x16u);

            v3 = v20;
            v4 = v19;
            v5 = v29;
          }

          objc_autoreleasePoolPop(v16);
        }

        if (!v14)
          goto LABEL_19;
      }
      v8 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v33, v41, 16);
      if (v8)
        continue;
      break;
    }
  }

  +[HMDAccessoryAccessCodeReaderWriter _createReadWriteRequestsForAccessCodeIdentifiersByCharacteristic:](HMDAccessoryAccessCodeReaderWriter, "_createReadWriteRequestsForAccessCodeIdentifiersByCharacteristic:", v4);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_20:

  return v22;
}

- (id)_createWriteRequestsForModificationRequests:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = a3;
  -[HMDAccessoryAccessCodeReaderWriter context](self, "context");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "accessoriesSupportingAccessCodes");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[HMDAccessoryAccessCodeReaderWriter createWriteRequestsForModificationRequests:hapAccessories:](HMDAccessoryAccessCodeReaderWriter, "createWriteRequestsForModificationRequests:hapAccessories:", v4, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)_createModificationResponsesForWriteResponses:(id)a3 ofRequestPairs:(id)a4
{
  return +[HMDAccessoryAccessCodeReaderWriter createModificationResponsesForWriteResponses:ofRequestPairs:](HMDAccessoryAccessCodeReaderWriter, "createModificationResponsesForWriteResponses:ofRequestPairs:", a3, a4);
}

- (id)logIdentifier
{
  void *v2;
  void *v3;
  void *v4;

  -[HMDAccessoryAccessCodeReaderWriter context](self, "context");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "UUID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "UUIDString");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (HMDAccessCodeManagerContext)context
{
  return (HMDAccessCodeManagerContext *)objc_getProperty(self, a2, 8, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_context, 0);
}

uint64_t __87__HMDAccessoryAccessCodeReaderWriter__createReadWriteRequestsForAccessCodeIdentifiers___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;

  objc_msgSend(a2, "uuid");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hmf_isEqualToUUID:", *(_QWORD *)(a1 + 32));

  return v4;
}

uint64_t __86__HMDAccessoryAccessCodeReaderWriter__characteristicsOfType_fromAccessoriesWithUUIDs___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  uint64_t v4;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(a2, "uuid");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v2, "containsObject:", v3);

  return v4;
}

uint64_t __86__HMDAccessoryAccessCodeReaderWriter__characteristicsOfType_fromAccessoriesWithUUIDs___block_invoke_103(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "findCharacteristicType:forServiceType:", *(_QWORD *)(a1 + 32), CFSTR("00000260-0000-1000-8000-0026BB765291"));
}

HMDCharacteristicRequest *__92__HMDAccessoryAccessCodeReaderWriter__createConstraintsReadRequestsForAccessoriesWithUUIDs___block_invoke(uint64_t a1, uint64_t a2)
{
  return +[HMDCharacteristicRequest requestWithCharacteristic:](HMDCharacteristicRequest, "requestWithCharacteristic:", a2);
}

id __96__HMDAccessoryAccessCodeReaderWriter__fetchResponseFromCredentialUserTuples_accessory_doorLock___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  char v15;
  void *v16;
  void *v17;
  int v18;
  void *v19;
  id v20;
  NSObject *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  id v27;
  NSObject *v28;
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
  id v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v46;
  void *v47;
  uint8_t buf[4];
  void *v49;
  __int16 v50;
  void *v51;
  __int16 v52;
  void *v53;
  __int16 v54;
  void *v55;
  __int16 v56;
  void *v57;
  uint64_t v58;

  v58 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  v4 = (void *)MEMORY[0x227676638]();
  v5 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "credential");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "user");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    v49 = v7;
    v50 = 2112;
    v51 = v8;
    v52 = 2112;
    v53 = v9;
    _os_log_impl(&dword_2218F0000, v6, OS_LOG_TYPE_INFO, "%{public}@Creating fetch response from credential: %@, user: %@", buf, 0x20u);

  }
  objc_autoreleasePoolPop(v4);
  objc_msgSend(v3, "user");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "userUniqueId");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "user");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "creatorFabricIndex");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "currentFabricIndex");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = HMFEqualObjects();

  if ((v15 & 1) == 0)
  {
    v26 = (void *)MEMORY[0x227676638]();
    v27 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    v28 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "credential");
      v46 = v11;
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "user");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "creatorFabricIndex");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "currentFabricIndex");
      v47 = v26;
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 40), "shortDescription");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544386;
      v49 = v29;
      v50 = 2112;
      v51 = v30;
      v52 = 2112;
      v53 = v32;
      v54 = 2112;
      v55 = v33;
      v56 = 2112;
      v57 = v34;
      _os_log_impl(&dword_2218F0000, v28, OS_LOG_TYPE_INFO, "%{public}@Dropping userUniqueId because the user's creatorFabricIndex does not match the currentFabricIndex. credential: %@, creatorFabricIndex: %@, currentFabricIndex: %@, accessory: %@", buf, 0x34u);

      v26 = v47;
      v11 = v46;

    }
    objc_autoreleasePoolPop(v26);

    v11 = 0;
    goto LABEL_11;
  }
  objc_msgSend(v3, "user");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "userUniqueID");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend(v17, "isEqualToNumber:", *MEMORY[0x24BE4EF38]);

  if (!v18)
  {
LABEL_11:
    objc_msgSend(*(id *)(a1 + 32), "context");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "home");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "accessCodeForMatterUserWithUserUniqueID:", v11);
    v37 = (void *)objc_claimAutoreleasedReturnValue();

    v38 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD7300]), "initWithStringValue:", v37);
    v39 = objc_alloc(MEMORY[0x24BDD7328]);
    objc_msgSend(*(id *)(a1 + 40), "uuid");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    v41 = (void *)MEMORY[0x24BDD16E0];
    objc_msgSend(v3, "credential");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v42, "userIndex");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "numberWithInteger:", objc_msgSend(v43, "integerValue"));
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = (void *)objc_msgSend(v39, "initWithAccessoryUUID:accessCodeValue:uniqueIdentifier:hasRestrictions:", v40, v38, v44, 0);

    goto LABEL_12;
  }
  v19 = (void *)MEMORY[0x227676638]();
  v20 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v21 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "credential");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "shortDescription");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    v49 = v22;
    v50 = 2112;
    v51 = v23;
    v52 = 2112;
    v53 = v24;
    _os_log_impl(&dword_2218F0000, v21, OS_LOG_TYPE_INFO, "%{public}@Dropping credential because it is the COTA home user: %@, accessory: %@", buf, 0x20u);

  }
  objc_autoreleasePoolPop(v19);
  v25 = 0;
LABEL_12:

  return v25;
}

id __87__HMDAccessoryAccessCodeReaderWriter__readAccessCodesFromAccessory_Matter_withRetries___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  _QWORD v10[5];
  id v11;
  id v12;

  v3 = a2;
  objc_msgSend(v3, "getAllPinCodes");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "naFuture");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __87__HMDAccessoryAccessCodeReaderWriter__readAccessCodesFromAccessory_Matter_withRetries___block_invoke_2;
  v10[3] = &unk_24E7744A0;
  v6 = *(void **)(a1 + 40);
  v10[4] = *(_QWORD *)(a1 + 32);
  v11 = v6;
  v12 = v3;
  v7 = v3;
  objc_msgSend(v5, "flatMap:", v10);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

id __87__HMDAccessoryAccessCodeReaderWriter__readAccessCodesFromAccessory_Matter_withRetries___block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  NSObject *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  int v15;
  void *v16;
  __int16 v17;
  void *v18;
  __int16 v19;
  id v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  v4 = (void *)MEMORY[0x227676638]();
  v5 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "uuid");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = 138543874;
    v16 = v7;
    v17 = 2112;
    v18 = v8;
    v19 = 2112;
    v20 = v3;
    _os_log_impl(&dword_2218F0000, v6, OS_LOG_TYPE_INFO, "%{public}@Failed to read access codes from Matter accessory: %@, with error: %@", (uint8_t *)&v15, 0x20u);

  }
  objc_autoreleasePoolPop(v4);
  v9 = objc_alloc(MEMORY[0x24BDD7320]);
  objc_msgSend(*(id *)(a1 + 40), "uuid");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD1540], "hmErrorWithCode:", 52);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)objc_msgSend(v9, "initWithAccessoryUUID:accessoryAccessCodeValues:error:", v10, 0, v11);

  objc_msgSend(MEMORY[0x24BE6B608], "futureWithResult:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

id __87__HMDAccessoryAccessCodeReaderWriter__readAccessCodesFromAccessory_Matter_withRetries___block_invoke_2(uint64_t a1, uint64_t a2)
{
  void *v2;
  void *v3;

  objc_msgSend(*(id *)(a1 + 32), "_fetchResponseFromCredentialUserTuples:accessory:doorLock:", a2, *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BE6B608], "futureWithResult:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

id __98__HMDAccessoryAccessCodeReaderWriter__readAccessCodesFromAccessoriesWithUUIDs_Matter_withRetries___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  objc_msgSend(v3, "context");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "hapAccessoryWithUUID:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 32), "_readAccessCodesFromAccessory_Matter:withRetries:", v6, *(unsigned __int8 *)(a1 + 40));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

id __95__HMDAccessoryAccessCodeReaderWriter__readAccessCodesFromAccessoriesWithUUIDs_HAP_withRetries___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  int v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  v4 = (void *)MEMORY[0x227676638]();
  v5 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = 138543362;
    v12 = v7;
    _os_log_impl(&dword_2218F0000, v6, OS_LOG_TYPE_INFO, "%{public}@Got list responses", (uint8_t *)&v11, 0xCu);

  }
  objc_autoreleasePoolPop(v4);
  +[HMDAccessoryAccessCodeReaderWriter identifiersFromListWriteResponses:ofWriteRequests:](HMDAccessoryAccessCodeReaderWriter, "identifiersFromListWriteResponses:ofWriteRequests:", v3, *(_QWORD *)(a1 + 40));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BE6B608], "futureWithResult:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

id __95__HMDAccessoryAccessCodeReaderWriter__readAccessCodesFromAccessoriesWithUUIDs_HAP_withRetries___block_invoke_86(uint64_t a1, uint64_t a2)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(*(id *)(a1 + 32), "_createReadWriteRequestsForAccessCodeIdentifiers:", a2);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)MEMORY[0x24BE6B608];
  if (v2)
  {
    objc_msgSend(MEMORY[0x24BE6B608], "futureWithResult:", v2);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1540], "hmfErrorWithCode:reason:", 11, CFSTR("Failed to create read write requests"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "futureWithError:", v5);
    v4 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v4;
}

id __95__HMDAccessoryAccessCodeReaderWriter__readAccessCodesFromAccessoriesWithUUIDs_HAP_withRetries___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  id v7;
  void *v8;
  _QWORD v10[4];
  id v11;
  uint64_t v12;
  id v13;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "_performWriteRequests:withRetries:", v3, *(unsigned __int8 *)(a1 + 48));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __95__HMDAccessoryAccessCodeReaderWriter__readAccessCodesFromAccessoriesWithUUIDs_HAP_withRetries___block_invoke_3;
  v10[3] = &unk_24E774450;
  v5 = *(_QWORD *)(a1 + 32);
  v6 = *(void **)(a1 + 40);
  v11 = v3;
  v12 = v5;
  v13 = v6;
  v7 = v3;
  objc_msgSend(v4, "flatMap:", v10);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

id __95__HMDAccessoryAccessCodeReaderWriter__readAccessCodesFromAccessoriesWithUUIDs_HAP_withRetries___block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  NSObject *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  _QWORD v17[4];
  id v18;
  uint8_t buf[4];
  void *v20;
  __int16 v21;
  void *v22;
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  +[HMDAccessoryAccessCodeReaderWriter accessCodeFetchResponsesForReadWriteResponses:ofWriteRequests:](HMDAccessoryAccessCodeReaderWriter, "accessCodeFetchResponsesForReadWriteResponses:ofWriteRequests:", v3, *(_QWORD *)(a1 + 32));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)MEMORY[0x227676638]();
  v6 = *(id *)(a1 + 40);
  HMFGetOSLogHandle();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v20 = v8;
    v21 = 2112;
    v22 = v4;
    _os_log_impl(&dword_2218F0000, v7, OS_LOG_TYPE_INFO, "%{public}@Access code fetch responses from read: %@", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v5);
  v9 = *(void **)(a1 + 48);
  v17[0] = MEMORY[0x24BDAC760];
  v17[1] = 3221225472;
  v17[2] = __95__HMDAccessoryAccessCodeReaderWriter__readAccessCodesFromAccessoriesWithUUIDs_HAP_withRetries___block_invoke_87;
  v17[3] = &unk_24E79BCA0;
  v18 = v4;
  v10 = v4;
  objc_msgSend(v9, "na_filter:", v17);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "na_map:", &__block_literal_global_91);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (void *)MEMORY[0x24BE6B608];
  objc_msgSend(v10, "arrayByAddingObjectsFromArray:", v12);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "futureWithResult:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
}

BOOL __95__HMDAccessoryAccessCodeReaderWriter__readAccessCodesFromAccessoriesWithUUIDs_HAP_withRetries___block_invoke_87(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  _BOOL8 v7;
  _QWORD v9[4];
  id v10;

  v3 = a2;
  v4 = *(void **)(a1 + 32);
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __95__HMDAccessoryAccessCodeReaderWriter__readAccessCodesFromAccessoriesWithUUIDs_HAP_withRetries___block_invoke_2_88;
  v9[3] = &unk_24E774408;
  v10 = v3;
  v5 = v3;
  objc_msgSend(v4, "na_firstObjectPassingTest:", v9);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6 == 0;

  return v7;
}

id __95__HMDAccessoryAccessCodeReaderWriter__readAccessCodesFromAccessoriesWithUUIDs_HAP_withRetries___block_invoke_3_90(uint64_t a1, void *a2)
{
  objc_class *v2;
  id v3;
  id v4;
  void *v5;
  void *v6;

  v2 = (objc_class *)MEMORY[0x24BDD7320];
  v3 = a2;
  v4 = [v2 alloc];
  objc_msgSend(MEMORY[0x24BDD1540], "hmErrorWithCode:", 2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v4, "initWithAccessoryUUID:accessoryAccessCodeValues:error:", v3, 0, v5);

  return v6;
}

uint64_t __95__HMDAccessoryAccessCodeReaderWriter__readAccessCodesFromAccessoriesWithUUIDs_HAP_withRetries___block_invoke_2_88(uint64_t a1, void *a2)
{
  void *v2;
  uint64_t v3;

  objc_msgSend(a2, "accessoryUUID");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = HMFEqualObjects();

  return v3;
}

uint64_t __91__HMDAccessoryAccessCodeReaderWriter__readAccessCodesFromAccessoriesWithUUIDs_withRetries___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  objc_msgSend(v2, "context");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "UUIDsOfHAPAccessoriesSupportingAccessCodes");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "containsObject:", v3);

  return v6;
}

uint64_t __91__HMDAccessoryAccessCodeReaderWriter__readAccessCodesFromAccessoriesWithUUIDs_withRetries___block_invoke_2(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  objc_msgSend(v2, "context");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "UUIDsOfMatterAccessoriesSupportingAccessCodes");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "containsObject:", v3);

  return v6;
}

id __87__HMDAccessoryAccessCodeReaderWriter__readConstraintsFromAccessory_Matter_withRetries___block_invoke(int8x16_t *a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  int8x16_t v9;
  _QWORD v10[4];
  int8x16_t v11;

  v2 = (void *)a1[2].i64[0];
  objc_msgSend(MEMORY[0x24BE3F178], "untrackedPlaceholderFlow");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "waitForDoorLockClusterObjectWithFlow:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "naFuture");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __87__HMDAccessoryAccessCodeReaderWriter__readConstraintsFromAccessory_Matter_withRetries___block_invoke_2;
  v10[3] = &unk_24E7929D0;
  v9 = a1[2];
  v6 = (id)v9.i64[0];
  v11 = vextq_s8(v9, v9, 8uLL);
  objc_msgSend(v5, "flatMap:", v10);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

id __87__HMDAccessoryAccessCodeReaderWriter__readConstraintsFromAccessory_Matter_withRetries___block_invoke_83(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  int v15;
  void *v16;
  __int16 v17;
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  v4 = (void *)MEMORY[0x227676638]();
  v5 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "uuid");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = 138543618;
    v16 = v7;
    v17 = 2112;
    v18 = v8;
    _os_log_impl(&dword_2218F0000, v6, OS_LOG_TYPE_INFO, "%{public}@All retries failed to read constraint from accessory: %@", (uint8_t *)&v15, 0x16u);

  }
  objc_autoreleasePoolPop(v4);
  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD72D0]), "initWithAllowedCharacterSets:minimumLength:maximumLength:maximumAllowedAccessCodes:", 1, 4, 8, 50);
  v10 = objc_alloc(MEMORY[0x24BDD7318]);
  objc_msgSend(*(id *)(a1 + 40), "uuid");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)objc_msgSend(v10, "initWithAccessory:constraints:error:", v11, v9, 0);

  objc_msgSend(MEMORY[0x24BE6B608], "futureWithResult:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

id __87__HMDAccessoryAccessCodeReaderWriter__readConstraintsFromAccessory_Matter_withRetries___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  NSObject *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  NSObject *v21;
  void *v22;
  void *v23;
  void *v24;
  int v26;
  void *v27;
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  objc_msgSend(v3, "readAttributeMaxPINCodeLengthWithParams:", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", CFSTR("value"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    objc_msgSend(v3, "readAttributeMinPINCodeLengthWithParams:", 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v6, "objectForKey:", CFSTR("value"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7)
    {
      v8 = v7;
      v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD72D0]), "initWithAllowedCharacterSets:minimumLength:maximumLength:maximumAllowedAccessCodes:", 1, objc_msgSend(v7, "integerValue"), objc_msgSend(v5, "integerValue"), 50);
      v10 = objc_alloc(MEMORY[0x24BDD7318]);
      objc_msgSend(*(id *)(a1 + 40), "uuid");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = (void *)objc_msgSend(v10, "initWithAccessory:constraints:error:", v11, v9, 0);

      objc_msgSend(MEMORY[0x24BE6B608], "futureWithResult:", v12);
      v13 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v19 = (void *)MEMORY[0x227676638]();
      v20 = *(id *)(a1 + 32);
      HMFGetOSLogHandle();
      v21 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        v26 = 138543362;
        v27 = v22;
        _os_log_impl(&dword_2218F0000, v21, OS_LOG_TYPE_INFO, "%{public}@Failed to read min pin code length constraint from accessory", (uint8_t *)&v26, 0xCu);

      }
      objc_autoreleasePoolPop(v19);
      v23 = (void *)MEMORY[0x24BE6B608];
      objc_msgSend(MEMORY[0x24BDD1540], "hmErrorWithCode:", 2);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "futureWithError:", v24);
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      v8 = 0;
    }
    v4 = v6;
  }
  else
  {
    v14 = (void *)MEMORY[0x227676638]();
    v15 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = 138543362;
      v27 = v17;
      _os_log_impl(&dword_2218F0000, v16, OS_LOG_TYPE_INFO, "%{public}@Failed to read max pin code length constraint from accessory", (uint8_t *)&v26, 0xCu);

    }
    objc_autoreleasePoolPop(v14);
    v18 = (void *)MEMORY[0x24BE6B608];
    objc_msgSend(MEMORY[0x24BDD1540], "hmErrorWithCode:", 2);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "futureWithError:", v8);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v13;
}

id __98__HMDAccessoryAccessCodeReaderWriter__readConstraintsFromAccessoriesWithUUIDs_Matter_withRetries___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  objc_msgSend(v3, "context");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "hapAccessoryWithUUID:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 32), "_readConstraintsFromAccessory_Matter:withRetries:", v6, *(unsigned __int8 *)(a1 + 40));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

id __95__HMDAccessoryAccessCodeReaderWriter__readConstraintsFromAccessoriesWithUUIDs_HAP_withRetries___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v2;
  void *v3;

  +[HMDAccessoryAccessCodeReaderWriter createConstraintsFromReadResponses:readRequests:](HMDAccessoryAccessCodeReaderWriter, "createConstraintsFromReadResponses:readRequests:", a2, *(_QWORD *)(a1 + 32));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BE6B608], "futureWithResult:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

uint64_t __91__HMDAccessoryAccessCodeReaderWriter__readConstraintsFromAccessoriesWithUUIDs_withRetries___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  objc_msgSend(v2, "context");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "UUIDsOfHAPAccessoriesSupportingAccessCodes");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "containsObject:", v3);

  return v6;
}

uint64_t __91__HMDAccessoryAccessCodeReaderWriter__readConstraintsFromAccessoriesWithUUIDs_withRetries___block_invoke_2(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  objc_msgSend(v2, "context");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "UUIDsOfMatterAccessoriesSupportingAccessCodes");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "containsObject:", v3);

  return v6;
}

id __72__HMDAccessoryAccessCodeReaderWriter_performModificationRequest_Matter___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  _QWORD v11[4];
  id v12;
  id v13;

  v3 = a2;
  v4 = *(void **)(a1 + 32);
  objc_msgSend(MEMORY[0x24BE3F178], "untrackedPlaceholderFlow");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "waitForDoorLockClusterObjectWithFlow:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "naFuture");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __72__HMDAccessoryAccessCodeReaderWriter_performModificationRequest_Matter___block_invoke_2;
  v11[3] = &unk_24E7929D0;
  v12 = *(id *)(a1 + 40);
  v13 = v3;
  v8 = v3;
  objc_msgSend(v7, "flatMap:", v11);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

id __72__HMDAccessoryAccessCodeReaderWriter_performModificationRequest_Matter___block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  _QWORD v11[4];
  id v12;

  v3 = a2;
  v4 = *(void **)(a1 + 32);
  objc_msgSend(MEMORY[0x24BE3F178], "untrackedPlaceholderFlow");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "waitForDoorLockClusterObjectWithFlow:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "naFuture");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __72__HMDAccessoryAccessCodeReaderWriter_performModificationRequest_Matter___block_invoke_4;
  v11[3] = &unk_24E7994F8;
  v12 = v3;
  v8 = v3;
  objc_msgSend(v7, "flatMap:", v11);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

id __72__HMDAccessoryAccessCodeReaderWriter_performModificationRequest_Matter___block_invoke_69(uint64_t a1)
{
  void *v2;
  id v3;
  uint64_t v4;
  void *v5;
  _QWORD v7[4];
  id v8;
  id v9;
  uint64_t v10;

  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __72__HMDAccessoryAccessCodeReaderWriter_performModificationRequest_Matter___block_invoke_2_70;
  v7[3] = &unk_24E774340;
  v2 = *(void **)(a1 + 32);
  v8 = *(id *)(a1 + 40);
  v3 = *(id *)(a1 + 48);
  v4 = *(_QWORD *)(a1 + 56);
  v9 = v3;
  v10 = v4;
  objc_msgSend(v2, "flatMap:", v7);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

id __72__HMDAccessoryAccessCodeReaderWriter_performModificationRequest_Matter___block_invoke_3_73(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x24BE6B608];
  v4 = a2;
  objc_msgSend((id)objc_opt_class(), "modificationResponseForFailedMatterRequest:error:", *(_QWORD *)(a1 + 40), v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "futureWithResult:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

id __72__HMDAccessoryAccessCodeReaderWriter_performModificationRequest_Matter___block_invoke_2_70(uint64_t a1, void *a2)
{
  objc_class *v3;
  id v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;

  v3 = (objc_class *)MEMORY[0x24BDD7300];
  v4 = a2;
  v5 = (void *)objc_msgSend([v3 alloc], "initWithStringValue:", *(_QWORD *)(a1 + 32));
  v6 = objc_alloc(MEMORY[0x24BDD7328]);
  objc_msgSend(*(id *)(a1 + 40), "accessoryUUID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v6, "initWithAccessoryUUID:accessCodeValue:uniqueIdentifier:hasRestrictions:", v7, v5, v4, 0);

  v9 = objc_alloc(MEMORY[0x24BDD72E0]);
  objc_msgSend(*(id *)(a1 + 40), "accessoryUUID");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_msgSend(v9, "initWithAccessoryUUID:accessoryAccessCodeValue:accessCodeValue:operationType:error:", v10, v8, 0, *(_QWORD *)(a1 + 48), 0);

  objc_msgSend(MEMORY[0x24BE6B608], "futureWithResult:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

id __72__HMDAccessoryAccessCodeReaderWriter_performModificationRequest_Matter___block_invoke_4(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  void *v4;
  void *v5;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  objc_msgSend(v3, "removePinCodeForUserIndex:", objc_msgSend(v2, "integerValue"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "naFuture");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

id __72__HMDAccessoryAccessCodeReaderWriter_performModificationRequest_Matter___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v2;
  void *v3;
  id v4;
  void *v5;
  void *v6;

  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(void **)(a1 + 40);
  v4 = a2;
  objc_msgSend(v4, "addOrUpdatePinCodeWithValue:forUserIndex:", v2, objc_msgSend(v3, "integerValue"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "naFuture");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

uint64_t __95__HMDAccessoryAccessCodeReaderWriter_performAccessCodeModificationRequests_Matter_withRetries___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "performModificationRequest_Matter:", a2);
}

id __92__HMDAccessoryAccessCodeReaderWriter_performAccessCodeModificationRequests_HAP_withRetries___block_invoke_65(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  NSObject *v7;
  void *v8;
  void *v9;
  int v11;
  void *v12;
  __int16 v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "_createModificationResponsesForWriteResponses:ofRequestPairs:", v3, *(_QWORD *)(a1 + 40));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)MEMORY[0x227676638]();
  v6 = *(id *)(a1 + 32);
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
    _os_log_impl(&dword_2218F0000, v7, OS_LOG_TYPE_INFO, "%{public}@Received modification responses: %@", (uint8_t *)&v11, 0x16u);

  }
  objc_autoreleasePoolPop(v5);
  objc_msgSend(MEMORY[0x24BE6B608], "futureWithResult:", v4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

uint64_t __92__HMDAccessoryAccessCodeReaderWriter_performAccessCodeModificationRequests_HAP_withRetries___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "writeRequest");
}

uint64_t __88__HMDAccessoryAccessCodeReaderWriter_performAccessCodeModificationRequests_withRetries___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  objc_msgSend(v2, "context");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "accessoryUUID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "hapAccessoryWithUUID:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v6, "supportsCHIP");
  return v7;
}

uint64_t __88__HMDAccessoryAccessCodeReaderWriter_performAccessCodeModificationRequests_withRetries___block_invoke_2(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  objc_msgSend(v2, "context");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "accessoryUUID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "hapAccessoryWithUUID:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v6, "supportsCHIP") ^ 1;
  return v7;
}

void __104__HMDAccessoryAccessCodeReaderWriter__readConstraintsAndAccessCodesFromAccessoriesWithUUIDs_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  id v8;
  NSObject *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  id v20;
  id v21;
  _QWORD v22[5];
  id v23;
  id v24;
  id v25;
  uint8_t buf[4];
  void *v27;
  __int16 v28;
  uint64_t v29;
  __int16 v30;
  id v31;
  uint64_t v32;

  v32 = *MEMORY[0x24BDAC8D0];
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
      v11 = *(_QWORD *)(a1 + 40);
      *(_DWORD *)buf = 138543874;
      v27 = v10;
      v28 = 2112;
      v29 = v11;
      v30 = 2112;
      v31 = v6;
      _os_log_impl(&dword_2218F0000, v9, OS_LOG_TYPE_ERROR, "%{public}@Failed to read constraints from accessories with uuids: %@, error: %@", buf, 0x20u);

    }
    objc_autoreleasePoolPop(v7);
  }
  objc_msgSend(*(id *)(a1 + 32), "_readAccessCodesFromAccessoriesWithUUIDs:withRetries:", *(_QWORD *)(a1 + 40), 1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (void *)MEMORY[0x24BE6B628];
  objc_msgSend(*(id *)(a1 + 32), "context");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "workQueue");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "schedulerWithDispatchQueue:", v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "reschedule:", v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v22[0] = MEMORY[0x24BDAC760];
  v22[1] = 3221225472;
  v22[2] = __104__HMDAccessoryAccessCodeReaderWriter__readConstraintsAndAccessCodesFromAccessoriesWithUUIDs_completion___block_invoke_60;
  v22[3] = &unk_24E7995C0;
  v18 = *(void **)(a1 + 40);
  v22[4] = *(_QWORD *)(a1 + 32);
  v23 = v18;
  v19 = *(id *)(a1 + 48);
  v24 = v5;
  v25 = v19;
  v20 = v5;
  v21 = (id)objc_msgSend(v17, "addCompletionBlock:", v22);

}

void __104__HMDAccessoryAccessCodeReaderWriter__readConstraintsAndAccessCodesFromAccessoriesWithUUIDs_completion___block_invoke_60(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  id v8;
  NSObject *v9;
  void *v10;
  uint64_t v11;
  int v12;
  void *v13;
  __int16 v14;
  uint64_t v15;
  __int16 v16;
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
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
      v11 = *(_QWORD *)(a1 + 40);
      v12 = 138543874;
      v13 = v10;
      v14 = 2112;
      v15 = v11;
      v16 = 2112;
      v17 = v6;
      _os_log_impl(&dword_2218F0000, v9, OS_LOG_TYPE_ERROR, "%{public}@Failed to read access codes from accessories with uuids: %@, error: %@", (uint8_t *)&v12, 0x20u);

    }
    objc_autoreleasePoolPop(v7);
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();

}

id __82__HMDAccessoryAccessCodeReaderWriter__readAccessCodeWithIdentifier_accessoryUUID___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v2;
  void *v3;

  +[HMDAccessoryAccessCodeReaderWriter accessCodeFetchResponsesForReadWriteResponses:ofWriteRequests:](HMDAccessoryAccessCodeReaderWriter, "accessCodeFetchResponsesForReadWriteResponses:ofWriteRequests:", a2, *(_QWORD *)(a1 + 32));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BE6B608], "futureWithResult:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

id __82__HMDAccessoryAccessCodeReaderWriter__readAccessCodeWithIdentifier_accessoryUUID___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  _QWORD v13[4];
  id v14;

  objc_msgSend(a2, "firstObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    objc_msgSend(v3, "accessoryAccessCodeValues");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v13[0] = MEMORY[0x24BDAC760];
    v13[1] = 3221225472;
    v13[2] = __82__HMDAccessoryAccessCodeReaderWriter__readAccessCodeWithIdentifier_accessoryUUID___block_invoke_3;
    v13[3] = &unk_24E78F610;
    v14 = *(id *)(a1 + 32);
    objc_msgSend(v5, "na_firstObjectPassingTest:", v13);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    v7 = (void *)MEMORY[0x24BE6B608];
    objc_msgSend(v6, "accessCodeValue");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "futureWithResult:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    v10 = v14;
  }
  else
  {
    v11 = (void *)MEMORY[0x24BE6B608];
    objc_msgSend(MEMORY[0x24BDD1540], "hmfErrorWithCode:reason:", 15, CFSTR("Response without access code value"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "futureWithError:", v10);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v9;
}

uint64_t __82__HMDAccessoryAccessCodeReaderWriter__readAccessCodeWithIdentifier_accessoryUUID___block_invoke_3(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;

  objc_msgSend(a2, "uniqueIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqualToNumber:", *(_QWORD *)(a1 + 32));

  return v4;
}

id __108__HMDAccessoryAccessCodeReaderWriter_removeAccessCodeWithValue_Matter_fromAccessory_withUserUUID_guestName___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  _QWORD v11[4];
  id v12;

  v3 = a2;
  v4 = *(void **)(a1 + 32);
  objc_msgSend(MEMORY[0x24BE3F178], "untrackedPlaceholderFlow");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "waitForDoorLockClusterObjectWithFlow:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "naFuture");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __108__HMDAccessoryAccessCodeReaderWriter_removeAccessCodeWithValue_Matter_fromAccessory_withUserUUID_guestName___block_invoke_2;
  v11[3] = &unk_24E7994F8;
  v12 = v3;
  v8 = v3;
  objc_msgSend(v7, "flatMap:", v11);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

id __108__HMDAccessoryAccessCodeReaderWriter_removeAccessCodeWithValue_Matter_fromAccessory_withUserUUID_guestName___block_invoke_3(uint64_t a1)
{
  void *v2;
  void *v3;
  _QWORD v5[4];
  id v6;
  id v7;

  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __108__HMDAccessoryAccessCodeReaderWriter_removeAccessCodeWithValue_Matter_fromAccessory_withUserUUID_guestName___block_invoke_4;
  v5[3] = &unk_24E774210;
  v2 = *(void **)(a1 + 32);
  v6 = *(id *)(a1 + 40);
  v7 = *(id *)(a1 + 48);
  objc_msgSend(v2, "flatMap:", v5);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

id __108__HMDAccessoryAccessCodeReaderWriter_removeAccessCodeWithValue_Matter_fromAccessory_withUserUUID_guestName___block_invoke_5(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  _QWORD v12[4];
  id v13;
  id v14;
  id v15;

  v3 = a2;
  objc_msgSend(v3, "domain");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4 != (void *)*MEMORY[0x24BDD5BD8])
  {

LABEL_5:
    v12[0] = MEMORY[0x24BDAC760];
    v12[1] = 3221225472;
    v12[2] = __108__HMDAccessoryAccessCodeReaderWriter_removeAccessCodeWithValue_Matter_fromAccessory_withUserUUID_guestName___block_invoke_6;
    v12[3] = &unk_24E774238;
    v10 = *(void **)(a1 + 32);
    v13 = *(id *)(a1 + 40);
    v14 = *(id *)(a1 + 48);
    v15 = v3;
    objc_msgSend(v10, "flatMap:", v12);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    goto LABEL_6;
  }
  v6 = objc_msgSend(v3, "code");

  if (v6 != 2)
    goto LABEL_5;
  v7 = (void *)MEMORY[0x24BE6B608];
  objc_msgSend(MEMORY[0x24BDBCEF8], "null");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "futureWithResult:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_6:
  return v9;
}

id __108__HMDAccessoryAccessCodeReaderWriter_removeAccessCodeWithValue_Matter_fromAccessory_withUserUUID_guestName___block_invoke_6(uint64_t a1, void *a2)
{
  objc_class *v3;
  id v4;
  id v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;

  v3 = (objc_class *)MEMORY[0x24BDD7328];
  v4 = a2;
  v5 = [v3 alloc];
  objc_msgSend(*(id *)(a1 + 32), "uuid");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v5, "initWithAccessoryUUID:accessCodeValue:uniqueIdentifier:hasRestrictions:", v6, *(_QWORD *)(a1 + 40), v4, 0);

  v8 = objc_alloc(MEMORY[0x24BDD72E0]);
  objc_msgSend(*(id *)(a1 + 32), "uuid");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v8, "initWithAccessoryUUID:accessoryAccessCodeValue:accessCodeValue:operationType:error:", v9, v7, 0, 2, *(_QWORD *)(a1 + 48));

  objc_msgSend(MEMORY[0x24BE6B608], "futureWithResult:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

id __108__HMDAccessoryAccessCodeReaderWriter_removeAccessCodeWithValue_Matter_fromAccessory_withUserUUID_guestName___block_invoke_4(uint64_t a1, void *a2)
{
  objc_class *v3;
  id v4;
  id v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;

  v3 = (objc_class *)MEMORY[0x24BDD7328];
  v4 = a2;
  v5 = [v3 alloc];
  objc_msgSend(*(id *)(a1 + 32), "uuid");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v5, "initWithAccessoryUUID:accessCodeValue:uniqueIdentifier:hasRestrictions:", v6, *(_QWORD *)(a1 + 40), v4, 0);

  v8 = objc_alloc(MEMORY[0x24BDD72E0]);
  objc_msgSend(*(id *)(a1 + 32), "uuid");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v8, "initWithAccessoryUUID:accessoryAccessCodeValue:accessCodeValue:operationType:error:", v9, v7, 0, 2, 0);

  objc_msgSend(MEMORY[0x24BE6B608], "futureWithResult:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

id __108__HMDAccessoryAccessCodeReaderWriter_removeAccessCodeWithValue_Matter_fromAccessory_withUserUUID_guestName___block_invoke_2(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  void *v4;
  void *v5;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  objc_msgSend(v3, "removePinCodeForUserIndex:", objc_msgSend(v2, "integerValue"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "naFuture");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

id __98__HMDAccessoryAccessCodeReaderWriter_removeAllAccessCodesWithValue_Matter_withUserUUID_guestName___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  objc_msgSend(v3, "context");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "hapAccessoryWithUUID:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 32), "removeAccessCodeWithValue_Matter:fromAccessory:withUserUUID:guestName:", *(_QWORD *)(a1 + 40), v6, *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

id __92__HMDAccessoryAccessCodeReaderWriter_removeAllHAPAccessCodesWithValue_forSpecificAccessory___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  _QWORD v13[4];
  id v14;
  _QWORD v15[4];
  id v16;
  _QWORD v17[4];
  id v18;

  v4 = MEMORY[0x24BDAC760];
  v17[0] = MEMORY[0x24BDAC760];
  v17[1] = 3221225472;
  v17[2] = __92__HMDAccessoryAccessCodeReaderWriter_removeAllHAPAccessCodesWithValue_forSpecificAccessory___block_invoke_2;
  v17[3] = &unk_24E774130;
  v18 = *(id *)(a1 + 32);
  v5 = a2;
  objc_msgSend(v5, "na_map:", v17);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = v4;
  v15[1] = 3221225472;
  v15[2] = __92__HMDAccessoryAccessCodeReaderWriter_removeAllHAPAccessCodesWithValue_forSpecificAccessory___block_invoke_3;
  v15[3] = &unk_24E78F638;
  v16 = *(id *)(a1 + 32);
  objc_msgSend(v5, "na_flatMap:", v15);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "na_map:", &__block_literal_global_5106);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "performAccessCodeModificationRequests:withRetries:", v8, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = v4;
  v13[1] = 3221225472;
  v13[2] = __92__HMDAccessoryAccessCodeReaderWriter_removeAllHAPAccessCodesWithValue_forSpecificAccessory___block_invoke_6;
  v13[3] = &unk_24E799468;
  v14 = v6;
  v10 = v6;
  objc_msgSend(v9, "flatMap:", v13);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

id __92__HMDAccessoryAccessCodeReaderWriter_removeAllHAPAccessCodesWithValue_forSpecificAccessory___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;

  v3 = a2;
  objc_msgSend(v3, "error");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    v5 = objc_alloc(MEMORY[0x24BDD72E0]);
    objc_msgSend(v3, "accessoryUUID");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = *(_QWORD *)(a1 + 32);
    objc_msgSend(v3, "error");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (void *)objc_msgSend(v5, "initWithAccessoryUUID:accessoryAccessCodeValue:accessCodeValue:operationType:error:", v6, 0, v7, 2, v8);

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

id __92__HMDAccessoryAccessCodeReaderWriter_removeAllHAPAccessCodesWithValue_forSpecificAccessory___block_invoke_3(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  _QWORD v6[4];
  id v7;

  objc_msgSend(a2, "accessoryAccessCodeValues");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __92__HMDAccessoryAccessCodeReaderWriter_removeAllHAPAccessCodesWithValue_forSpecificAccessory___block_invoke_4;
  v6[3] = &unk_24E774158;
  v7 = *(id *)(a1 + 32);
  objc_msgSend(v3, "na_map:", v6);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

id __92__HMDAccessoryAccessCodeReaderWriter_removeAllHAPAccessCodesWithValue_forSpecificAccessory___block_invoke_6(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x24BE6B608];
  objc_msgSend(a2, "arrayByAddingObjectsFromArray:", *(_QWORD *)(a1 + 32));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "futureWithResult:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

id __92__HMDAccessoryAccessCodeReaderWriter_removeAllHAPAccessCodesWithValue_forSpecificAccessory___block_invoke_5(uint64_t a1, void *a2)
{
  objc_class *v2;
  id v3;
  void *v4;

  v2 = (objc_class *)MEMORY[0x24BDD72E8];
  v3 = a2;
  v4 = (void *)objc_msgSend([v2 alloc], "initWithAccessoryAccessCodeValue:", v3);

  return v4;
}

id __92__HMDAccessoryAccessCodeReaderWriter_removeAllHAPAccessCodesWithValue_forSpecificAccessory___block_invoke_4(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;

  v3 = a2;
  objc_msgSend(v3, "accessCodeValue");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(a1) = objc_msgSend(v4, "isEqual:", *(_QWORD *)(a1 + 32));

  if ((_DWORD)a1)
    v5 = v3;
  else
    v5 = 0;

  return v5;
}

+ (id)_createListWriteRequestsForCharacteristics:(id)a3
{
  _QWORD v4[5];

  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __81__HMDAccessoryAccessCodeReaderWriter__createListWriteRequestsForCharacteristics___block_invoke;
  v4[3] = &__block_descriptor_40_e58___HMDCharacteristicWriteRequest_16__0__HMDCharacteristic_8l;
  v4[4] = a1;
  objc_msgSend(a3, "na_map:", v4);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)_createReadWriteRequestsForAccessCodeIdentifiersByCharacteristic:(id)a3
{
  id v3;
  uint64_t i;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  id v13;
  NSObject *v14;
  void *v15;
  void *v16;
  void *v18;
  id v19;
  id obj;
  void *v22;
  void *context;
  uint64_t v24;
  uint64_t v25;
  id v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  uint8_t buf[4];
  void *v32;
  __int16 v33;
  uint64_t v34;
  __int16 v35;
  void *v36;
  __int16 v37;
  uint64_t v38;
  __int16 v39;
  id v40;
  _BYTE v41[128];
  uint64_t v42;

  v42 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  objc_msgSend(v3, "keyEnumerator");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v25 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v27, v41, 16);
  if (v25)
  {
    v24 = *(_QWORD *)v28;
    v19 = v3;
    while (2)
    {
      for (i = 0; i != v25; ++i)
      {
        if (*(_QWORD *)v28 != v24)
          objc_enumerationMutation(obj);
        v5 = *(_QWORD *)(*((_QWORD *)&v27 + 1) + 8 * i);
        v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE1B988]), "initWithValue:", 2);
        objc_msgSend(v3, "objectForKey:", v5);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "na_map:", &__block_literal_global_108);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE1B968]), "initWithOperationType:accessCodeControlRequest:accessCodeControlResponse:", v6, v8, 0);
        v26 = 0;
        objc_msgSend(v9, "serializeWithError:", &v26);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = v26;
        if (v10)
        {
          +[HMDCharacteristicWriteRequest writeRequestWithCharacteristic:value:authorizationData:identifier:type:includeResponseValue:](HMDCharacteristicWriteRequest, "writeRequestWithCharacteristic:value:authorizationData:identifier:type:includeResponseValue:", v5, v10, 0, 0, 0, 1);
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v22, "addObject:", v12);

        }
        else
        {
          context = (void *)MEMORY[0x227676638]();
          v13 = a1;
          HMFGetOSLogHandle();
          v14 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
          {
            HMFGetLogIdentifier();
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138544386;
            v32 = v18;
            v33 = 2112;
            v34 = 0;
            v35 = 2112;
            v36 = v7;
            v37 = 2112;
            v38 = v5;
            v39 = 2112;
            v40 = v11;
            _os_log_impl(&dword_2218F0000, v14, OS_LOG_TYPE_ERROR, "%{public}@Failed to serialize access code control write request: %@, to read access codes with identifiers: %@, from characteristic: %@, with error: %@", buf, 0x34u);

          }
          objc_autoreleasePoolPop(context);
          v3 = v19;
        }

        if (!v10)
        {

          v16 = 0;
          v15 = v22;
          goto LABEL_16;
        }
      }
      v25 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v27, v41, 16);
      if (v25)
        continue;
      break;
    }
  }

  v15 = v22;
  v16 = (void *)objc_msgSend(v22, "copy");
LABEL_16:

  return v16;
}

+ (id)accessCodeFetchResponsesForReadWriteResponses:(id)a3 ofWriteRequests:(id)a4
{
  id v6;
  uint64_t v7;
  __int128 v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  id v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  id v31;
  NSObject *v32;
  void *v33;
  void *v34;
  id v35;
  NSObject *v36;
  void *v37;
  void *v38;
  __int128 v40;
  uint64_t v41;
  void *v42;
  id obj;
  uint64_t v44;
  id v45;
  _QWORD v46[5];
  id v47;
  id v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  uint8_t buf[4];
  void *v54;
  __int16 v55;
  id v56;
  __int16 v57;
  void *v58;
  _BYTE v59[128];
  uint64_t v60;

  v60 = *MEMORY[0x24BDAC8D0];
  v45 = a3;
  v6 = a4;
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  v49 = 0u;
  v50 = 0u;
  v51 = 0u;
  v52 = 0u;
  obj = v6;
  v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v49, v59, 16);
  if (v7)
  {
    v9 = v7;
    v10 = *(_QWORD *)v50;
    *(_QWORD *)&v8 = 138543874;
    v40 = v8;
    v41 = *(_QWORD *)v50;
    do
    {
      v11 = 0;
      v44 = v9;
      do
      {
        if (*(_QWORD *)v50 != v10)
          objc_enumerationMutation(obj);
        v12 = *(void **)(*((_QWORD *)&v49 + 1) + 8 * v11);
        objc_msgSend(v12, "characteristic", v40);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "service");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "accessory");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "uuid");
        v16 = (void *)objc_claimAutoreleasedReturnValue();

        if (v16)
        {
          +[HMDAccessoryAccessCodeReaderWriter _accessCodeControlFromWriteResponses:forWriteRequest:](HMDAccessoryAccessCodeReaderWriter, "_accessCodeControlFromWriteResponses:forWriteRequest:", v45, v12);
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          v18 = v17;
          if (v17)
          {
            objc_msgSend(v17, "accessCodeControlResponse");
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            v46[0] = MEMORY[0x24BDAC760];
            v46[1] = 3221225472;
            v46[2] = __100__HMDAccessoryAccessCodeReaderWriter_accessCodeFetchResponsesForReadWriteResponses_ofWriteRequests___block_invoke;
            v46[3] = &unk_24E774598;
            v20 = a1;
            v48 = a1;
            v46[4] = v12;
            v21 = v16;
            v47 = v21;
            objc_msgSend(v19, "na_map:", v46);
            v22 = (void *)objc_claimAutoreleasedReturnValue();

            objc_msgSend(v18, "accessCodeControlResponse");
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v23, "na_firstObjectPassingTest:", &__block_literal_global_113);
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v24, "statusCode");
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            v26 = (void *)objc_msgSend(v25, "value");

            if (v26)
            {
              v27 = (void *)MEMORY[0x24BDD1540];
              HAPAccessCodeResponseStatusAsString();
              v28 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v27, "hmErrorWithCode:description:reason:suggestion:", -1, v28, 0, 0);
              v26 = (void *)objc_claimAutoreleasedReturnValue();

            }
            v9 = v44;
            v29 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD7320]), "initWithAccessoryUUID:accessoryAccessCodeValues:error:", v21, v22, v26);
            objc_msgSend(v42, "addObject:", v29);

            a1 = v20;
            v10 = v41;
          }
          else
          {
            v34 = (void *)MEMORY[0x227676638]();
            v35 = a1;
            HMFGetOSLogHandle();
            v36 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
            {
              HMFGetLogIdentifier();
              v37 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = v40;
              v54 = v37;
              v55 = 2112;
              v56 = v45;
              v57 = 2112;
              v58 = v12;
              _os_log_impl(&dword_2218F0000, v36, OS_LOG_TYPE_ERROR, "%{public}@Failed to extract HAPAccessCodeControl from write responses: %@, for write request: %@", buf, 0x20u);

              v9 = v44;
            }

            objc_autoreleasePoolPop(v34);
          }

        }
        else
        {
          v30 = (void *)MEMORY[0x227676638]();
          v31 = a1;
          HMFGetOSLogHandle();
          v32 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
          {
            HMFGetLogIdentifier();
            v33 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543618;
            v54 = v33;
            v55 = 2112;
            v56 = v12;
            _os_log_impl(&dword_2218F0000, v32, OS_LOG_TYPE_ERROR, "%{public}@Failed to find accessory UUID for write request: %@", buf, 0x16u);

          }
          objc_autoreleasePoolPop(v30);
        }

        ++v11;
      }
      while (v9 != v11);
      v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v49, v59, 16);
    }
    while (v9);
  }

  v38 = (void *)objc_msgSend(v42, "copy");
  return v38;
}

+ (id)identifiersFromListWriteResponses:(id)a3 ofWriteRequests:(id)a4
{
  id v5;
  id v6;
  uint64_t v7;
  __int128 v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  NSObject *v22;
  void *v23;
  void *v24;
  __int128 v26;
  id obj;
  void *v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  uint8_t buf[4];
  void *v35;
  __int16 v36;
  id v37;
  __int16 v38;
  void *v39;
  _BYTE v40[128];
  uint64_t v41;

  v41 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v6 = a4;
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = 0u;
  v31 = 0u;
  v32 = 0u;
  v33 = 0u;
  obj = v6;
  v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v30, v40, 16);
  if (v7)
  {
    v9 = v7;
    v10 = *(_QWORD *)v31;
    *(_QWORD *)&v8 = 138543874;
    v26 = v8;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v31 != v10)
          objc_enumerationMutation(obj);
        v12 = *(void **)(*((_QWORD *)&v30 + 1) + 8 * i);
        +[HMDAccessoryAccessCodeReaderWriter _accessCodeControlFromWriteResponses:forWriteRequest:](HMDAccessoryAccessCodeReaderWriter, "_accessCodeControlFromWriteResponses:forWriteRequest:", v5, v12, v26);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = v13;
        if (v13)
        {
          objc_msgSend(v13, "accessCodeControlResponse");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "na_map:", &__block_literal_global_116);
          v16 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v12, "characteristic");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "accessory");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v18, "uuid");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v29, "setObject:forKeyedSubscript:", v16, v19);

        }
        else
        {
          v20 = (void *)MEMORY[0x227676638]();
          v21 = a1;
          HMFGetOSLogHandle();
          v22 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
          {
            HMFGetLogIdentifier();
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = v26;
            v35 = v23;
            v36 = 2112;
            v37 = v5;
            v38 = 2112;
            v39 = v12;
            _os_log_impl(&dword_2218F0000, v22, OS_LOG_TYPE_ERROR, "%{public}@Failed to extract HAPAccessCodeControl from write responses: %@, for write request: %@", buf, 0x20u);

          }
          objc_autoreleasePoolPop(v20);
        }

      }
      v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v30, v40, 16);
    }
    while (v9);
  }

  v24 = (void *)objc_msgSend(v29, "copy");
  return v24;
}

+ (id)createConstraintsFromReadResponses:(id)a3 readRequests:(id)a4
{
  id v6;
  void *v7;
  id v8;
  void *v9;
  _QWORD v11[4];
  id v12;
  id v13;

  v6 = a3;
  objc_msgSend(a4, "na_map:", &__block_literal_global_118);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __86__HMDAccessoryAccessCodeReaderWriter_createConstraintsFromReadResponses_readRequests___block_invoke_2;
  v11[3] = &unk_24E774660;
  v12 = v6;
  v13 = a1;
  v8 = v6;
  objc_msgSend(v7, "na_map:", v11);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

+ (id)_accessCodeControlFromWriteResponses:(id)a3 forWriteRequest:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  int v12;
  void *v13;
  void *v14;
  id v15;
  id v16;
  void *v17;
  id v18;
  NSObject *v19;
  void *v20;
  void *v21;
  id v22;
  NSObject *v23;
  void *v24;
  void *v25;
  id v26;
  NSObject *v27;
  void *v28;
  void *v30;
  id v31;
  id v32;
  id v33;
  uint8_t buf[4];
  void *v35;
  __int16 v36;
  id v37;
  __int16 v38;
  id v39;
  __int16 v40;
  id v41;
  uint64_t v42;

  v42 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  objc_msgSend(v7, "characteristic");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v33 = 0;
  objc_msgSend(v6, "hmd_valueOfCharacteristic:error:", v8, &v33);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v33;
  if (v9)
  {
    v11 = v9;
    objc_opt_class();
    v12 = objc_opt_isKindOfClass() & 1;
    if (v12)
      v13 = v11;
    else
      v13 = 0;
    v31 = v13;

    if (v12)
    {
      v32 = v10;
      objc_msgSend(MEMORY[0x24BE1B968], "parsedFromData:error:", v11, &v32);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = v32;

      if (v14)
      {
        v16 = v14;
      }
      else
      {
        v25 = (void *)MEMORY[0x227676638]();
        v26 = a1;
        HMFGetOSLogHandle();
        v27 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
        {
          HMFGetLogIdentifier();
          v30 = v25;
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543618;
          v35 = v28;
          v36 = 2112;
          v37 = v11;
          _os_log_impl(&dword_2218F0000, v27, OS_LOG_TYPE_ERROR, "%{public}@Failed to parse HAPAccessCodeControl from NSData: %@", buf, 0x16u);

          v25 = v30;
        }

        objc_autoreleasePoolPop(v25);
      }

      v10 = v15;
    }
    else
    {
      v21 = (void *)MEMORY[0x227676638]();
      v22 = a1;
      HMFGetOSLogHandle();
      v23 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v35 = v24;
        v36 = 2112;
        v37 = v11;
        _os_log_impl(&dword_2218F0000, v23, OS_LOG_TYPE_ERROR, "%{public}@Characteristic response value: %@ is not of expected type NSData", buf, 0x16u);

      }
      objc_autoreleasePoolPop(v21);
      v14 = 0;
    }

  }
  else
  {
    v17 = (void *)MEMORY[0x227676638]();
    v18 = a1;
    HMFGetOSLogHandle();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544130;
      v35 = v20;
      v36 = 2112;
      v37 = v8;
      v38 = 2112;
      v39 = v6;
      v40 = 2112;
      v41 = v10;
      _os_log_impl(&dword_2218F0000, v19, OS_LOG_TYPE_INFO, "%{public}@Failed to parse characteristic response for characteristic: %@, in payload: %@, with error: %@", buf, 0x2Au);

    }
    objc_autoreleasePoolPop(v17);
    v14 = 0;
  }

  return v14;
}

+ (id)createModificationResponsesForWriteResponses:(id)a3 ofRequestPairs:(id)a4
{
  id v5;
  id v6;
  uint64_t v7;
  __int128 v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  int v18;
  void *v19;
  id v20;
  NSObject *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  id v27;
  NSObject *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  uint64_t v33;
  void *v34;
  __int128 v36;
  id obj;
  uint64_t v39;
  void *v40;
  _QWORD v41[4];
  id v42;
  id v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  uint8_t buf[4];
  void *v49;
  __int16 v50;
  id v51;
  __int16 v52;
  void *v53;
  _BYTE v54[128];
  uint64_t v55;

  v55 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v6 = a4;
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  v44 = 0u;
  v45 = 0u;
  v46 = 0u;
  v47 = 0u;
  obj = v6;
  v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v44, v54, 16);
  if (v7)
  {
    v9 = v7;
    v39 = *(_QWORD *)v45;
    *(_QWORD *)&v8 = 138543874;
    v36 = v8;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v45 != v39)
          objc_enumerationMutation(obj);
        v11 = *(void **)(*((_QWORD *)&v44 + 1) + 8 * v10);
        objc_msgSend(v11, "writeRequest", v36);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        +[HMDAccessoryAccessCodeReaderWriter _accessCodeControlFromWriteResponses:forWriteRequest:](HMDAccessoryAccessCodeReaderWriter, "_accessCodeControlFromWriteResponses:forWriteRequest:", v5, v12);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = v13;
        if (!v13)
        {
          v26 = (void *)MEMORY[0x227676638]();
          v27 = a1;
          HMFGetOSLogHandle();
          v28 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
          {
            HMFGetLogIdentifier();
            v29 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = v36;
            v49 = v29;
            v50 = 2112;
            v51 = v5;
            v52 = 2112;
            v53 = v12;
            _os_log_impl(&dword_2218F0000, v28, OS_LOG_TYPE_INFO, "%{public}@Failed to extract HAPAccessCodeControl from write responses: %@, for write request: %@", buf, 0x20u);

          }
          objc_autoreleasePoolPop(v26);
          objc_msgSend(v11, "modificationRequests");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          v24 = v23;
          v25 = &__block_literal_global_122;
          goto LABEL_15;
        }
        objc_msgSend(v13, "accessCodeControlResponse");
        v15 = objc_claimAutoreleasedReturnValue();
        if (!v15
          || (v16 = (void *)v15,
              objc_msgSend(v14, "accessCodeControlResponse"),
              v17 = (void *)objc_claimAutoreleasedReturnValue(),
              v18 = objc_msgSend(v17, "hmf_isEmpty"),
              v17,
              v16,
              v18))
        {
          v19 = (void *)MEMORY[0x227676638]();
          v20 = a1;
          HMFGetOSLogHandle();
          v21 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
          {
            HMFGetLogIdentifier();
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543362;
            v49 = v22;
            _os_log_impl(&dword_2218F0000, v21, OS_LOG_TYPE_ERROR, "%{public}@Received HAPAccessCodeControl object that does not contain any HAPAccessCodeControlResponses", buf, 0xCu);

          }
          objc_autoreleasePoolPop(v19);
          objc_msgSend(v11, "modificationRequests");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          v24 = v23;
          v25 = &__block_literal_global_124;
LABEL_15:
          objc_msgSend(v23, "na_map:", v25);
          v30 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v40, "addObjectsFromArray:", v30);
          goto LABEL_16;
        }
        objc_msgSend(v14, "accessCodeControlResponse");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        v41[0] = MEMORY[0x24BDAC760];
        v41[1] = 3221225472;
        v41[2] = __98__HMDAccessoryAccessCodeReaderWriter_createModificationResponsesForWriteResponses_ofRequestPairs___block_invoke_2;
        v41[3] = &unk_24E7746E8;
        v42 = v14;
        v43 = v12;
        objc_msgSend(v31, "na_map:", v41);
        v32 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v40, "addObjectsFromArray:", v32);
        v30 = v42;
LABEL_16:

        ++v10;
      }
      while (v9 != v10);
      v33 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v44, v54, 16);
      v9 = v33;
    }
    while (v33);
  }

  v34 = (void *)objc_msgSend(v40, "copy");
  return v34;
}

+ (id)genericModificationResponseForFailedRequest:(id)a3
{
  id v3;
  void *v4;
  id v5;
  id v6;
  void *v7;
  id v8;
  id v9;
  void *v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  id v21;
  void *v22;

  v3 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v4 = v3;
  else
    v4 = 0;
  v5 = v4;
  v6 = v3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v7 = v6;
  else
    v7 = 0;
  v8 = v7;

  v9 = v6;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v10 = v9;
  else
    v10 = 0;
  v11 = v10;

  if (v5)
  {
    v12 = objc_alloc(MEMORY[0x24BDD72E0]);
    objc_msgSend(v5, "accessoryUUID");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "accessCodeValue");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD1540], "hmErrorWithCode:", 52);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = v12;
    v17 = v13;
    v18 = 0;
    v19 = v14;
    v20 = 0;
  }
  else
  {
    v21 = objc_alloc(MEMORY[0x24BDD72E0]);
    if (v8)
    {
      objc_msgSend(v8, "accessoryUUID");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "accessoryAccessCodeValue");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD1540], "hmErrorWithCode:", 52);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = v21;
      v17 = v13;
      v18 = v14;
      v19 = 0;
      v20 = 1;
    }
    else
    {
      objc_msgSend(v11, "accessoryUUID");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "accessoryAccessCodeValue");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD1540], "hmErrorWithCode:", 52);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = v21;
      v17 = v13;
      v18 = v14;
      v19 = 0;
      v20 = 2;
    }
  }
  v22 = (void *)objc_msgSend(v16, "initWithAccessoryUUID:accessoryAccessCodeValue:accessCodeValue:operationType:error:", v17, v18, v19, v20, v15);

  return v22;
}

+ (id)modificationResponseForFailedMatterRequest:(id)a3 error:(id)a4
{
  id v5;
  id v6;
  void *v7;
  id v8;
  id v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  uint64_t v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  id v24;
  void *v25;

  v5 = a3;
  v6 = a4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v7 = v5;
  else
    v7 = 0;
  v8 = v7;
  v9 = v5;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v10 = v9;
  else
    v10 = 0;
  v11 = v10;

  objc_msgSend(v6, "domain");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v12;
  if (v12 != (void *)*MEMORY[0x24BE4EF28])
  {

LABEL_15:
    objc_msgSend((id)objc_opt_class(), "genericModificationResponseForFailedRequest:", v9);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_16;
  }
  v14 = objc_msgSend(v6, "code");

  if (v14 != 8)
    goto LABEL_15;
  if (v8)
  {
    v15 = objc_alloc(MEMORY[0x24BDD72E0]);
    objc_msgSend(v8, "accessoryUUID");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "accessCodeValue");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD1540], "hmPrivateErrorWithCode:", 2602);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = v15;
    v20 = v16;
    v21 = 0;
    v22 = v17;
    v23 = 0;
  }
  else
  {
    if (!v11)
      goto LABEL_15;
    v24 = objc_alloc(MEMORY[0x24BDD72E0]);
    objc_msgSend(v11, "accessoryUUID");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "accessoryAccessCodeValue");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD1540], "hmPrivateErrorWithCode:", 2602);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = v24;
    v20 = v16;
    v21 = v17;
    v22 = 0;
    v23 = 1;
  }
  v25 = (void *)objc_msgSend(v19, "initWithAccessoryUUID:accessoryAccessCodeValue:accessCodeValue:operationType:error:", v20, v21, v22, v23, v18);

LABEL_16:
  return v25;
}

+ (id)modificationResponseForControlResponse:(id)a3 operationType:(int64_t)a4 accessoryUUID:(id)a5
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  id v11;
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
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  void *v30;
  SEL v31;
  int64_t v32;

  v7 = a3;
  v8 = a5;
  if ((unint64_t)(a4 - 6) <= 0xFFFFFFFFFFFFFFFCLL)
  {
    v30 = (void *)_HMFPreconditionFailure();
    return (id)+[HMDAccessoryAccessCodeReaderWriter hmPrivateErrorCodeForHAPAccessCodeError:](v30, v31, v32);
  }
  v9 = v8;
  objc_msgSend(v7, "accessCode");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v10)
    goto LABEL_7;
  v11 = objc_alloc(MEMORY[0x24BDD7300]);
  objc_msgSend(v7, "accessCode");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v11, "initWithStringValue:", v12);

  objc_msgSend(v7, "flags");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v13)
  {
    objc_msgSend(v7, "flags");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = (void *)(objc_msgSend(v14, "value") & 1);

  }
  objc_msgSend(v7, "identifier");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (v15)
  {
    v16 = objc_alloc(MEMORY[0x24BDD7328]);
    objc_msgSend(v7, "identifier");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "value");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = (void *)objc_msgSend(v16, "initWithAccessoryUUID:accessCodeValue:uniqueIdentifier:hasRestrictions:", v9, v10, v18, v13);

  }
  else
  {
LABEL_7:
    v19 = 0;
  }
  objc_msgSend(v7, "statusCode");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v20)
    goto LABEL_14;
  objc_msgSend(v7, "statusCode");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = objc_msgSend(v21, "value");

  if (!v22)
  {
    v20 = 0;
LABEL_14:
    v25 = v10;
    v10 = 0;
    goto LABEL_15;
  }
  v23 = (void *)MEMORY[0x24BDD1540];
  objc_msgSend(v7, "statusCode");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "hmPrivateErrorWithCode:", +[HMDAccessoryAccessCodeReaderWriter hmPrivateErrorCodeForHAPAccessCodeError:](HMDAccessoryAccessCodeReaderWriter, "hmPrivateErrorCodeForHAPAccessCodeError:", objc_msgSend(v24, "value")));
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  if (a4 != 3 || !v20)
    goto LABEL_14;
  v25 = v19;
  v19 = 0;
LABEL_15:

  v26 = 1;
  if (a4 != 4)
    v26 = 2;
  if (a4 == 3)
    v27 = 0;
  else
    v27 = v26;
  v28 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD72E0]), "initWithAccessoryUUID:accessoryAccessCodeValue:accessCodeValue:operationType:error:", v9, v19, v10, v27, v20);

  return v28;
}

+ (int64_t)hmPrivateErrorCodeForHAPAccessCodeError:(int64_t)a3
{
  int64_t v4;
  void *v5;
  id v6;
  NSObject *v7;
  void *v8;
  void *v9;
  int v11;
  void *v12;
  __int16 v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v4 = a3 - 2;
  if ((unint64_t)(a3 - 2) < 8 && ((0xBDu >> v4) & 1) != 0)
    return qword_2226A0588[v4];
  v5 = (void *)MEMORY[0x227676638](a1, a2);
  v6 = a1;
  HMFGetOSLogHandle();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
  {
    HMFGetLogIdentifier();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    HAPAccessCodeResponseStatusAsString();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = 138543618;
    v12 = v8;
    v13 = 2112;
    v14 = v9;
    _os_log_impl(&dword_2218F0000, v7, OS_LOG_TYPE_ERROR, "%{public}@Encountered an error type that likely indicates a bug: %@", (uint8_t *)&v11, 0x16u);

  }
  objc_autoreleasePoolPop(v5);
  return 2607;
}

+ (id)createWriteRequestsForModificationRequests:(id)a3 hapAccessories:(id)a4
{
  id v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  __int128 v19;
  uint64_t j;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  HMDAccessCodeWriteRequestModificationRequestPair *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  HMDAccessCodeWriteRequestModificationRequestPair *v33;
  void *v34;
  void *v35;
  void *v36;
  HMDAccessCodeWriteRequestModificationRequestPair *v37;
  void *v38;
  id v39;
  NSObject *v40;
  void *v41;
  void *v42;
  void *v43;
  id v44;
  NSObject *v45;
  void *v46;
  __int128 v48;
  id v50;
  id obj;
  uint64_t v52;
  uint64_t v53;
  void *v54;
  void *v55;
  void *v56;
  _QWORD v57[5];
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  uint8_t buf[4];
  void *v67;
  __int16 v68;
  void *v69;
  _BYTE v70[128];
  _BYTE v71[128];
  uint64_t v72;

  v72 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v50 = a4;
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v62 = 0u;
  v63 = 0u;
  v64 = 0u;
  v65 = 0u;
  v7 = v5;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v62, v71, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v63;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v63 != v10)
          objc_enumerationMutation(v7);
        v12 = *(void **)(*((_QWORD *)&v62 + 1) + 8 * i);
        objc_msgSend(v12, "accessoryUUID");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "objectForKeyedSubscript:", v13);
        v14 = (void *)objc_claimAutoreleasedReturnValue();

        if (v14)
        {
          objc_msgSend(v12, "accessoryUUID");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v6, "objectForKeyedSubscript:", v15);
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "addObject:", v12);
        }
        else
        {
          objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithObject:", v12);
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "accessoryUUID");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v6, "setObject:forKeyedSubscript:", v15, v16);
        }

      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v62, v71, 16);
    }
    while (v9);
  }

  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v58 = 0u;
  v59 = 0u;
  v60 = 0u;
  v61 = 0u;
  objc_msgSend(v6, "allKeys");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v18 = v50;
  v53 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v58, v70, 16);
  if (v53)
  {
    v52 = *(_QWORD *)v59;
    *(_QWORD *)&v19 = 138543618;
    v48 = v19;
    v56 = v17;
    while (2)
    {
      for (j = 0; j != v53; ++j)
      {
        if (*(_QWORD *)v59 != v52)
          objc_enumerationMutation(obj);
        v21 = *(void **)(*((_QWORD *)&v58 + 1) + 8 * j);
        v57[0] = MEMORY[0x24BDAC760];
        v57[1] = 3221225472;
        v57[2] = __96__HMDAccessoryAccessCodeReaderWriter_createWriteRequestsForModificationRequests_hapAccessories___block_invoke;
        v57[3] = &unk_24E7928E0;
        v57[4] = v21;
        objc_msgSend(v18, "na_firstObjectPassingTest:", v57, v48);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v22)
        {
          v43 = (void *)MEMORY[0x227676638]();
          v44 = a1;
          HMFGetOSLogHandle();
          v45 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v45, OS_LOG_TYPE_ERROR))
          {
            HMFGetLogIdentifier();
            v46 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = v48;
            v67 = v46;
            v68 = 2112;
            v69 = v21;
            _os_log_impl(&dword_2218F0000, v45, OS_LOG_TYPE_ERROR, "%{public}@Not submitting modification requests because did not find an accessory with UUID: %@", buf, 0x16u);

          }
          objc_autoreleasePoolPop(v43);
LABEL_35:

          v42 = (void *)MEMORY[0x24BDBD1A8];
          v17 = v56;
          goto LABEL_36;
        }
        v23 = v22;
        objc_msgSend(v22, "findCharacteristicType:forServiceType:", CFSTR("00000262-0000-1000-8000-0026BB765291"), CFSTR("00000260-0000-1000-8000-0026BB765291"));
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        if (v24)
        {
          objc_msgSend(v6, "objectForKeyedSubscript:", v21);
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v25, "na_map:", &__block_literal_global_130);
          v26 = objc_claimAutoreleasedReturnValue();

          +[HMDAccessoryAccessCodeReaderWriter createWriteRequestForAddRequests:characteristic:](HMDAccessoryAccessCodeReaderWriter, "createWriteRequestForAddRequests:characteristic:", v26, v24);
          v27 = objc_claimAutoreleasedReturnValue();
          if (v27)
          {
            v28 = -[HMDAccessCodeWriteRequestModificationRequestPair initWithWriteRequest:modificationRequests:]([HMDAccessCodeWriteRequestModificationRequestPair alloc], "initWithWriteRequest:modificationRequests:", v27, v26);
            objc_msgSend(v56, "addObject:", v28);

          }
          v54 = (void *)v27;
          v55 = (void *)v26;
          objc_msgSend(v6, "objectForKeyedSubscript:", v21);
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v29, "na_map:", &__block_literal_global_133);
          v30 = (void *)objc_claimAutoreleasedReturnValue();

          v31 = v24;
          +[HMDAccessoryAccessCodeReaderWriter createWriteRequestForUpdateRequests:characteristic:](HMDAccessoryAccessCodeReaderWriter, "createWriteRequestForUpdateRequests:characteristic:", v30, v24);
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          if (v32)
          {
            v33 = -[HMDAccessCodeWriteRequestModificationRequestPair initWithWriteRequest:modificationRequests:]([HMDAccessCodeWriteRequestModificationRequestPair alloc], "initWithWriteRequest:modificationRequests:", v32, v30);
            objc_msgSend(v56, "addObject:", v33);

          }
          objc_msgSend(v6, "objectForKeyedSubscript:", v21);
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v34, "na_map:", &__block_literal_global_135);
          v35 = (void *)objc_claimAutoreleasedReturnValue();

          +[HMDAccessoryAccessCodeReaderWriter createWriteRequestForRemoveRequests:characteristic:](HMDAccessoryAccessCodeReaderWriter, "createWriteRequestForRemoveRequests:characteristic:", v35, v31);
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          if (v36)
          {
            v37 = -[HMDAccessCodeWriteRequestModificationRequestPair initWithWriteRequest:modificationRequests:]([HMDAccessCodeWriteRequestModificationRequestPair alloc], "initWithWriteRequest:modificationRequests:", v36, v35);
            objc_msgSend(v56, "addObject:", v37);

            v18 = v50;
          }

          v24 = v31;
        }
        else
        {
          v38 = (void *)MEMORY[0x227676638]();
          v39 = a1;
          HMFGetOSLogHandle();
          v40 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR))
          {
            HMFGetLogIdentifier();
            v41 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = v48;
            v67 = v41;
            v68 = 2112;
            v69 = v23;
            _os_log_impl(&dword_2218F0000, v40, OS_LOG_TYPE_ERROR, "%{public}@Not submitting modification requests because did not find an access code control point on accessory: %@", buf, 0x16u);

            v24 = 0;
          }

          objc_autoreleasePoolPop(v38);
        }

        if (!v24)
          goto LABEL_35;
      }
      v17 = v56;
      v53 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v58, v70, 16);
      if (v53)
        continue;
      break;
    }
  }

  v42 = (void *)objc_msgSend(v17, "copy");
LABEL_36:

  return v42;
}

+ (id)createWriteRequestForAddRequests:(id)a3 characteristic:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  id v15;
  NSObject *v16;
  void *v17;
  void *v19;
  id v20;
  uint8_t buf[4];
  void *v22;
  __int16 v23;
  uint64_t v24;
  __int16 v25;
  id v26;
  __int16 v27;
  id v28;
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  if ((objc_msgSend(v6, "hmf_isEmpty") & 1) != 0)
  {
    v8 = 0;
  }
  else
  {
    v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE1B988]), "initWithValue:", 3);
    objc_msgSend(v6, "na_map:", &__block_literal_global_137);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE1B968]), "initWithOperationType:accessCodeControlRequest:accessCodeControlResponse:", v9, v10, 0);
    v20 = 0;
    objc_msgSend(v11, "serializeWithError:", &v20);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = v20;
    if (v12)
    {
      +[HMDCharacteristicWriteRequest writeRequestWithCharacteristic:value:authorizationData:identifier:type:includeResponseValue:](HMDCharacteristicWriteRequest, "writeRequestWithCharacteristic:value:authorizationData:identifier:type:includeResponseValue:", v7, v12, 0, 0, 0, 1);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v14 = (void *)MEMORY[0x227676638]();
      v15 = a1;
      HMFGetOSLogHandle();
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v19 = v14;
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138544130;
        v22 = v17;
        v23 = 2112;
        v24 = 0;
        v25 = 2112;
        v26 = v6;
        v27 = 2112;
        v28 = v13;
        _os_log_impl(&dword_2218F0000, v16, OS_LOG_TYPE_ERROR, "%{public}@Failed to serialize access code control write request: %@, for add requests: %@, with error: %@", buf, 0x2Au);

        v14 = v19;
      }

      objc_autoreleasePoolPop(v14);
      v8 = 0;
    }

  }
  return v8;
}

+ (id)createWriteRequestForUpdateRequests:(id)a3 characteristic:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  id v15;
  NSObject *v16;
  void *v17;
  void *v19;
  id v20;
  uint8_t buf[4];
  void *v22;
  __int16 v23;
  uint64_t v24;
  __int16 v25;
  id v26;
  __int16 v27;
  id v28;
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  if ((objc_msgSend(v6, "hmf_isEmpty") & 1) != 0)
  {
    v8 = 0;
  }
  else
  {
    v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE1B988]), "initWithValue:", 4);
    objc_msgSend(v6, "na_map:", &__block_literal_global_139);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE1B968]), "initWithOperationType:accessCodeControlRequest:accessCodeControlResponse:", v9, v10, 0);
    v20 = 0;
    objc_msgSend(v11, "serializeWithError:", &v20);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = v20;
    if (v12)
    {
      +[HMDCharacteristicWriteRequest writeRequestWithCharacteristic:value:authorizationData:identifier:type:includeResponseValue:](HMDCharacteristicWriteRequest, "writeRequestWithCharacteristic:value:authorizationData:identifier:type:includeResponseValue:", v7, v12, 0, 0, 0, 1);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v14 = (void *)MEMORY[0x227676638]();
      v15 = a1;
      HMFGetOSLogHandle();
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v19 = v14;
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138544130;
        v22 = v17;
        v23 = 2112;
        v24 = 0;
        v25 = 2112;
        v26 = v6;
        v27 = 2112;
        v28 = v13;
        _os_log_impl(&dword_2218F0000, v16, OS_LOG_TYPE_ERROR, "%{public}@Failed to serialize access code control write request: %@, for update requests: %@, with error: %@", buf, 0x2Au);

        v14 = v19;
      }

      objc_autoreleasePoolPop(v14);
      v8 = 0;
    }

  }
  return v8;
}

+ (id)createWriteRequestForRemoveRequests:(id)a3 characteristic:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  id v15;
  NSObject *v16;
  void *v17;
  void *v19;
  id v20;
  uint8_t buf[4];
  void *v22;
  __int16 v23;
  uint64_t v24;
  __int16 v25;
  id v26;
  __int16 v27;
  id v28;
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  if ((objc_msgSend(v6, "hmf_isEmpty") & 1) != 0)
  {
    v8 = 0;
  }
  else
  {
    v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE1B988]), "initWithValue:", 5);
    objc_msgSend(v6, "na_map:", &__block_literal_global_141);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE1B968]), "initWithOperationType:accessCodeControlRequest:accessCodeControlResponse:", v9, v10, 0);
    v20 = 0;
    objc_msgSend(v11, "serializeWithError:", &v20);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = v20;
    if (v12)
    {
      +[HMDCharacteristicWriteRequest writeRequestWithCharacteristic:value:authorizationData:identifier:type:includeResponseValue:](HMDCharacteristicWriteRequest, "writeRequestWithCharacteristic:value:authorizationData:identifier:type:includeResponseValue:", v7, v12, 0, 0, 0, 1);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v14 = (void *)MEMORY[0x227676638]();
      v15 = a1;
      HMFGetOSLogHandle();
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v19 = v14;
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138544130;
        v22 = v17;
        v23 = 2112;
        v24 = 0;
        v25 = 2112;
        v26 = v6;
        v27 = 2112;
        v28 = v13;
        _os_log_impl(&dword_2218F0000, v16, OS_LOG_TYPE_ERROR, "%{public}@Failed to serialize access code control write request: %@, for update requests: %@, with error: %@", buf, 0x2Au);

        v14 = v19;
      }

      objc_autoreleasePoolPop(v14);
      v8 = 0;
    }

  }
  return v8;
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t77 != -1)
    dispatch_once(&logCategory__hmf_once_t77, &__block_literal_global_143);
  return (id)logCategory__hmf_once_v78;
}

void __49__HMDAccessoryAccessCodeReaderWriter_logCategory__block_invoke()
{
  uint64_t v0;
  void *v1;

  HMFCreateOSLogHandle();
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)logCategory__hmf_once_v78;
  logCategory__hmf_once_v78 = v0;

}

id __89__HMDAccessoryAccessCodeReaderWriter_createWriteRequestForRemoveRequests_characteristic___block_invoke(uint64_t a1, void *a2)
{
  objc_class *v2;
  id v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v2 = (objc_class *)MEMORY[0x24BE1BC28];
  v3 = a2;
  v4 = [v2 alloc];
  objc_msgSend(v3, "accessoryAccessCodeValue");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "uniqueIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v4, "initWithValue:", v6);

  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE1B970]), "initWithIdentifier:accessCode:", v7, 0);
  return v8;
}

id __89__HMDAccessoryAccessCodeReaderWriter_createWriteRequestForUpdateRequests_characteristic___block_invoke(uint64_t a1, void *a2)
{
  objc_class *v2;
  id v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;

  v2 = (objc_class *)MEMORY[0x24BE1BC28];
  v3 = a2;
  v4 = [v2 alloc];
  objc_msgSend(v3, "accessoryAccessCodeValue");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "uniqueIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v4, "initWithValue:", v6);

  v8 = objc_alloc(MEMORY[0x24BE1B970]);
  objc_msgSend(v3, "updatedAccessCodeValue");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "stringValue");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_msgSend(v8, "initWithIdentifier:accessCode:", v7, v10);

  return v11;
}

id __86__HMDAccessoryAccessCodeReaderWriter_createWriteRequestForAddRequests_characteristic___block_invoke(uint64_t a1, void *a2)
{
  objc_class *v2;
  id v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v2 = (objc_class *)MEMORY[0x24BE1B970];
  v3 = a2;
  v4 = [v2 alloc];
  objc_msgSend(v3, "accessCodeValue");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "stringValue");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v4, "initWithIdentifier:accessCode:", 0, v6);

  return v7;
}

uint64_t __96__HMDAccessoryAccessCodeReaderWriter_createWriteRequestsForModificationRequests_hapAccessories___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;

  objc_msgSend(a2, "uuid");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hmf_isEqualToUUID:", *(_QWORD *)(a1 + 32));

  return v4;
}

id __96__HMDAccessoryAccessCodeReaderWriter_createWriteRequestsForModificationRequests_hapAccessories___block_invoke_3(uint64_t a1, void *a2)
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

id __96__HMDAccessoryAccessCodeReaderWriter_createWriteRequestsForModificationRequests_hapAccessories___block_invoke_2(uint64_t a1, void *a2)
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

id __96__HMDAccessoryAccessCodeReaderWriter_createWriteRequestsForModificationRequests_hapAccessories___block_invoke_128(uint64_t a1, void *a2)
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

id __98__HMDAccessoryAccessCodeReaderWriter_createModificationResponsesForWriteResponses_ofRequestPairs___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  objc_msgSend(v3, "operationType");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "value");
  objc_msgSend(*(id *)(a1 + 40), "characteristic");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "service");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "accessory");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "uuid");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  +[HMDAccessoryAccessCodeReaderWriter modificationResponseForControlResponse:operationType:accessoryUUID:](HMDAccessoryAccessCodeReaderWriter, "modificationResponseForControlResponse:operationType:accessoryUUID:", v4, v6, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

id __98__HMDAccessoryAccessCodeReaderWriter_createModificationResponsesForWriteResponses_ofRequestPairs___block_invoke_123(uint64_t a1, uint64_t a2)
{
  return +[HMDAccessoryAccessCodeReaderWriter genericModificationResponseForFailedRequest:](HMDAccessoryAccessCodeReaderWriter, "genericModificationResponseForFailedRequest:", a2);
}

id __98__HMDAccessoryAccessCodeReaderWriter_createModificationResponsesForWriteResponses_ofRequestPairs___block_invoke(uint64_t a1, uint64_t a2)
{
  return +[HMDAccessoryAccessCodeReaderWriter genericModificationResponseForFailedRequest:](HMDAccessoryAccessCodeReaderWriter, "genericModificationResponseForFailedRequest:", a2);
}

id __86__HMDAccessoryAccessCodeReaderWriter_createConstraintsFromReadResponses_readRequests___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  int v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  id v26;
  NSObject *v27;
  void *v28;
  uint64_t v29;
  void *v30;
  id v31;
  NSObject *v32;
  void *v33;
  id v34;
  void *v35;
  id v36;
  NSObject *v37;
  void *v38;
  id v39;
  id v41;
  _BOOL8 v42;
  void *v43;
  id v44;
  id v45;
  void *v46;
  uint64_t v47;
  id v48;
  id v49;
  uint8_t buf[4];
  void *v51;
  __int16 v52;
  id v53;
  __int16 v54;
  uint64_t v55;
  __int16 v56;
  id v57;
  uint64_t v58;

  v58 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  objc_msgSend(v3, "accessory");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "uuid");
  v47 = objc_claimAutoreleasedReturnValue();

  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD72D0]), "initWithAllowedCharacterSets:minimumLength:maximumLength:maximumAllowedAccessCodes:", 1, 4, 8, 200);
  v6 = *(void **)(a1 + 32);
  v49 = 0;
  objc_msgSend(v6, "hmd_valueOfCharacteristic:error:", v3, &v49);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v49;
  if (v7)
  {
    v46 = v5;
    v9 = v7;
    objc_opt_class();
    v10 = objc_opt_isKindOfClass() & 1;
    if (v10)
      v11 = v9;
    else
      v11 = 0;
    v45 = v11;

    if (v10)
    {
      v48 = v8;
      objc_msgSend(MEMORY[0x24BE1B960], "parsedFromData:error:", v9, &v48);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v44 = v48;

      if (v12)
      {
        objc_msgSend(v12, "characterSet");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = objc_msgSend(v13, "value");

        v42 = v14 == 1;
        v41 = objc_alloc(MEMORY[0x24BDD72D0]);
        objc_msgSend(v12, "minimumValueLength");
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v43, "value");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = objc_msgSend(v15, "integerValue");
        objc_msgSend(v12, "maximumValueLength");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "value");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = objc_msgSend(v18, "integerValue");
        objc_msgSend(v12, "maximumAccessCodes");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "value");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        v22 = (void *)objc_msgSend(v41, "initWithAllowedCharacterSets:minimumLength:maximumLength:maximumAllowedAccessCodes:", v42, v16, v19, objc_msgSend(v21, "integerValue"));

        v23 = (void *)v47;
        v24 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD7318]), "initWithAccessory:constraints:error:", v47, v22, 0);
        v5 = v46;
      }
      else
      {
        v35 = (void *)MEMORY[0x227676638]();
        v36 = *(id *)(a1 + 40);
        HMFGetOSLogHandle();
        v37 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
        {
          HMFGetLogIdentifier();
          v38 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543618;
          v51 = v38;
          v52 = 2112;
          v53 = v9;
          _os_log_impl(&dword_2218F0000, v37, OS_LOG_TYPE_ERROR, "%{public}@Failed to parse HAPAccessCodeControl from NSData: %@", buf, 0x16u);

        }
        objc_autoreleasePoolPop(v35);
        v39 = objc_alloc(MEMORY[0x24BDD7318]);
        objc_msgSend(MEMORY[0x24BDD1540], "hmErrorWithCode:", -1);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        v5 = v46;
        v23 = (void *)v47;
        v24 = (void *)objc_msgSend(v39, "initWithAccessory:constraints:error:", v47, v46, v22);
      }

      v8 = v44;
    }
    else
    {
      v30 = (void *)MEMORY[0x227676638]();
      v31 = *(id *)(a1 + 40);
      HMFGetOSLogHandle();
      v32 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v51 = v33;
        v52 = 2112;
        v53 = v9;
        _os_log_impl(&dword_2218F0000, v32, OS_LOG_TYPE_ERROR, "%{public}@Characteristic response value: %@ is not of expected type NSData", buf, 0x16u);

      }
      objc_autoreleasePoolPop(v30);
      v34 = objc_alloc(MEMORY[0x24BDD7318]);
      objc_msgSend(MEMORY[0x24BDD1540], "hmErrorWithCode:", -1);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = v46;
      v23 = (void *)v47;
      v24 = (void *)objc_msgSend(v34, "initWithAccessory:constraints:error:", v47, v46, v12);
    }

  }
  else
  {
    v25 = (void *)MEMORY[0x227676638]();
    v26 = *(id *)(a1 + 40);
    HMFGetOSLogHandle();
    v27 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      v29 = *(_QWORD *)(a1 + 32);
      *(_DWORD *)buf = 138544130;
      v51 = v28;
      v52 = 2112;
      v53 = v3;
      v54 = 2112;
      v55 = v29;
      v56 = 2112;
      v57 = v8;
      _os_log_impl(&dword_2218F0000, v27, OS_LOG_TYPE_ERROR, "%{public}@Failed to parse characteristic response for characteristic: %@, in payload: %@, with error: %@", buf, 0x2Au);

    }
    objc_autoreleasePoolPop(v25);
    v23 = (void *)v47;
    v24 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD7318]), "initWithAccessory:constraints:error:", v47, v5, v8);
  }

  return v24;
}

uint64_t __86__HMDAccessoryAccessCodeReaderWriter_createConstraintsFromReadResponses_readRequests___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "characteristic");
}

uint64_t __88__HMDAccessoryAccessCodeReaderWriter_identifiersFromListWriteResponses_ofWriteRequests___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "identifier");
}

id __100__HMDAccessoryAccessCodeReaderWriter_accessCodeFetchResponsesForReadWriteResponses_ofWriteRequests___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  NSObject *v18;
  void *v19;
  uint64_t v20;
  const char *v21;
  uint64_t v22;
  int v24;
  void *v25;
  __int16 v26;
  id v27;
  __int16 v28;
  uint64_t v29;
  uint64_t v30;

  v30 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  objc_msgSend(v3, "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v4)
  {
    v16 = (void *)MEMORY[0x227676638]();
    v17 = *(id *)(a1 + 48);
    HMFGetOSLogHandle();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = *(_QWORD *)(a1 + 32);
      v24 = 138543874;
      v25 = v19;
      v26 = 2112;
      v27 = v3;
      v28 = 2112;
      v29 = v20;
      v21 = "%{public}@Accessory read response: %@ does not contain an access code identifier for write request: %@";
LABEL_10:
      _os_log_impl(&dword_2218F0000, v18, OS_LOG_TYPE_ERROR, v21, (uint8_t *)&v24, 0x20u);

    }
LABEL_11:

    objc_autoreleasePoolPop(v16);
    v15 = 0;
    goto LABEL_12;
  }
  objc_msgSend(v3, "accessCode");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
  {
    v16 = (void *)MEMORY[0x227676638]();
    v17 = *(id *)(a1 + 48);
    HMFGetOSLogHandle();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = *(_QWORD *)(a1 + 32);
      v24 = 138543874;
      v25 = v19;
      v26 = 2112;
      v27 = v3;
      v28 = 2112;
      v29 = v22;
      v21 = "%{public}@Accessory read response: %@ does not contain an access code for write request: %@";
      goto LABEL_10;
    }
    goto LABEL_11;
  }
  objc_msgSend(v3, "flags");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    objc_msgSend(v3, "flags");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (void *)(objc_msgSend(v7, "value") & 1);

  }
  v8 = objc_alloc(MEMORY[0x24BDD7328]);
  v9 = *(_QWORD *)(a1 + 40);
  v10 = objc_alloc(MEMORY[0x24BDD7300]);
  objc_msgSend(v3, "accessCode");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)objc_msgSend(v10, "initWithStringValue:", v11);
  objc_msgSend(v3, "identifier");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "value");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = (void *)objc_msgSend(v8, "initWithAccessoryUUID:accessCodeValue:uniqueIdentifier:hasRestrictions:", v9, v12, v14, v6);

LABEL_12:
  return v15;
}

BOOL __100__HMDAccessoryAccessCodeReaderWriter_accessCodeFetchResponsesForReadWriteResponses_ofWriteRequests___block_invoke_111(uint64_t a1, void *a2)
{
  void *v2;
  _BOOL8 v3;

  objc_msgSend(a2, "statusCode");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "value") != 0;

  return v3;
}

id __103__HMDAccessoryAccessCodeReaderWriter__createReadWriteRequestsForAccessCodeIdentifiersByCharacteristic___block_invoke(uint64_t a1, void *a2)
{
  objc_class *v2;
  id v3;
  void *v4;

  v2 = (objc_class *)MEMORY[0x24BE1B970];
  v3 = a2;
  v4 = (void *)objc_msgSend([v2 alloc], "initWithIdentifier:accessCode:", v3, 0);

  return v4;
}

id __81__HMDAccessoryAccessCodeReaderWriter__createListWriteRequestsForCharacteristics___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  NSObject *v11;
  void *v12;
  id v14;
  uint8_t buf[4];
  void *v16;
  __int16 v17;
  uint64_t v18;
  __int16 v19;
  id v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE1B988]), "initWithValue:", 1);
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE1B968]), "initWithOperationType:accessCodeControlRequest:accessCodeControlResponse:", v4, 0, 0);
  v14 = 0;
  objc_msgSend(v5, "serializeWithError:", &v14);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v14;
  if (v6)
  {
    +[HMDCharacteristicWriteRequest writeRequestWithCharacteristic:value:authorizationData:identifier:type:includeResponseValue:](HMDCharacteristicWriteRequest, "writeRequestWithCharacteristic:value:authorizationData:identifier:type:includeResponseValue:", v3, v6, 0, 0, 0, 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v9 = (void *)MEMORY[0x227676638]();
    v10 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v16 = v12;
      v17 = 2112;
      v18 = 0;
      v19 = 2112;
      v20 = v7;
      _os_log_impl(&dword_2218F0000, v11, OS_LOG_TYPE_ERROR, "%{public}@Failed to serialize access code control list request: %@, with error: %@", buf, 0x20u);

    }
    objc_autoreleasePoolPop(v9);
    v8 = 0;
  }

  return v8;
}

@end
