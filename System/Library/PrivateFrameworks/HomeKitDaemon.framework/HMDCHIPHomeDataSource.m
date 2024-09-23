@implementation HMDCHIPHomeDataSource

- (HMDCHIPHomeDataSource)initWithFabricID:(id)a3 home:(id)a4
{
  id v7;
  id v8;
  void *v9;
  HMDCHIPHomeDataSource *v10;
  HMDCHIPHomeDataSource *v11;
  NSRecursiveLock *v12;
  NSRecursiveLock *lock;
  HMDCHIPHomeDataSource *result;
  HMDCHIPHomeDataSource *v15;
  SEL v16;
  id v17;
  id v18;
  id v19;
  objc_super v20;

  v7 = a3;
  v8 = a4;
  if (!v7)
  {
    _HMFPreconditionFailure();
    goto LABEL_7;
  }
  v9 = v8;
  if (!v8)
  {
LABEL_7:
    v15 = (HMDCHIPHomeDataSource *)_HMFPreconditionFailure();
    -[HMDCHIPHomeDataSource _updateHomeModelWithLabel:completion:block:](v15, v16, v17, v18, v19);
    return result;
  }
  v20.receiver = self;
  v20.super_class = (Class)HMDCHIPHomeDataSource;
  v10 = -[HMDCHIPHomeDataSource init](&v20, sel_init);
  v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_fabricID, a3);
    objc_storeWeak((id *)&v11->_home, v9);
    v12 = (NSRecursiveLock *)objc_alloc_init(MEMORY[0x24BDD1788]);
    lock = v11->_lock;
    v11->_lock = v12;

  }
  return v11;
}

- (void)_updateHomeModelWithLabel:(id)a3 completion:(id)a4 block:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void (**v13)(_QWORD, _QWORD);
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  HMDCHIPHomeDataSource *v20;
  NSObject *v21;
  void *v22;
  void *v23;
  void *v24;
  char v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  unint64_t v30;
  void *v31;
  void *v32;
  uint64_t v33;
  uint64_t v34;
  void (*v35)(uint64_t, void *);
  void *v36;
  HMDCHIPHomeDataSource *v37;
  id v38;
  uint8_t buf[4];
  void *v40;
  uint64_t v41;

  v41 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  -[HMDCHIPHomeDataSource home](self, "home");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v11;
  if (v11)
  {
    objc_msgSend(v11, "emptyModelObjectWithChangeType:", 2);
    v13 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    -[HMDCHIPHomeDataSource lock](self, "lock");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "lock");

    -[HMDCHIPHomeDataSource pendingKeyValueStore](self, "pendingKeyValueStore");
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v15)
    {
      -[HMDCHIPHomeDataSource keyValueStore](self, "keyValueStore");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      if (v16)
      {
        -[HMDCHIPHomeDataSource keyValueStore](self, "keyValueStore");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = (void *)objc_msgSend(v17, "mutableCopy");
        -[HMDCHIPHomeDataSource setPendingKeyValueStore:](self, "setPendingKeyValueStore:", v18);

      }
      else
      {
        objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        -[HMDCHIPHomeDataSource setPendingKeyValueStore:](self, "setPendingKeyValueStore:", v17);
      }

    }
    -[HMDCHIPHomeDataSource setPendingKeyValueStoreTransactionsCount:](self, "setPendingKeyValueStoreTransactionsCount:", -[HMDCHIPHomeDataSource pendingKeyValueStoreTransactionsCount](self, "pendingKeyValueStoreTransactionsCount") + 1);
    -[HMDCHIPHomeDataSource pendingKeyValueStore](self, "pendingKeyValueStore");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = (*((uint64_t (**)(id, void (**)(_QWORD, _QWORD), void *))v10 + 2))(v10, v13, v24);

    if ((v25 & 1) != 0)
    {
      objc_msgSend(v12, "backingStore");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      +[HMDBackingStoreTransactionOptions defaultXPCOptions](HMDBackingStoreTransactionOptions, "defaultXPCOptions");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "transaction:options:", v8, v27);
      v28 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v28, "add:", v13);
      if (v28)
      {
        v33 = MEMORY[0x24BDAC760];
        v34 = 3221225472;
        v35 = __68__HMDCHIPHomeDataSource__updateHomeModelWithLabel_completion_block___block_invoke;
        v36 = &unk_24E79B3A0;
        v37 = self;
        v38 = v9;
        objc_msgSend(v28, "run:", &v33);
        -[HMDCHIPHomeDataSource lock](self, "lock", v33, v34, v35, v36, v37);
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v29, "unlock");

        goto LABEL_19;
      }
    }
    else
    {
      v30 = -[HMDCHIPHomeDataSource pendingKeyValueStoreTransactionsCount](self, "pendingKeyValueStoreTransactionsCount")- 1;
      -[HMDCHIPHomeDataSource setPendingKeyValueStoreTransactionsCount:](self, "setPendingKeyValueStoreTransactionsCount:", v30);
      if (!v30)
        -[HMDCHIPHomeDataSource setPendingKeyValueStore:](self, "setPendingKeyValueStore:", 0);
    }
    -[HMDCHIPHomeDataSource lock](self, "lock");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "unlock");

    v32 = _Block_copy(v9);
    v23 = v32;
    if (v32)
      (*((void (**)(void *, _QWORD))v32 + 2))(v32, 0);
LABEL_18:

    goto LABEL_19;
  }
  v19 = (void *)MEMORY[0x227676638]();
  v20 = self;
  HMFGetOSLogHandle();
  v21 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
  {
    HMFGetLogIdentifier();
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v40 = v22;
    _os_log_impl(&dword_2218F0000, v21, OS_LOG_TYPE_ERROR, "%{public}@Home reference is nil", buf, 0xCu);

  }
  objc_autoreleasePoolPop(v19);
  v13 = (void (**)(_QWORD, _QWORD))_Block_copy(v9);
  if (v13)
  {
    objc_msgSend(MEMORY[0x24BDD1540], "hmErrorWithCode:", 2);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, void *))v13)[2](v13, v23);
    goto LABEL_18;
  }
LABEL_19:

}

- (void)updateFabricID:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  HMDCHIPHomeDataSource *v9;
  NSObject *v10;
  void *v11;
  id v12;
  _QWORD v13[4];
  id v14;
  uint8_t buf[4];
  void *v16;
  __int16 v17;
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
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
    v16 = v11;
    v17 = 2112;
    v18 = v6;
    _os_log_impl(&dword_2218F0000, v10, OS_LOG_TYPE_INFO, "%{public}@Updating home model fabric ID to %@", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v8);
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = __51__HMDCHIPHomeDataSource_updateFabricID_completion___block_invoke;
  v13[3] = &unk_24E779A80;
  v14 = v6;
  v12 = v6;
  -[HMDCHIPHomeDataSource _updateHomeModelWithLabel:completion:block:](v9, "_updateHomeModelWithLabel:completion:block:", CFSTR("Update fabric ID"), v7, v13);

}

- (NSNumber)lastNodeID
{
  void *v2;
  void *v3;
  void *v4;

  -[HMDCHIPHomeDataSource home](self, "home");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "chipStorage");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "lastNodeID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSNumber *)v4;
}

- (void)updateLastNodeID:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  HMDCHIPHomeDataSource *v9;
  NSObject *v10;
  void *v11;
  id v12;
  _QWORD v13[4];
  id v14;
  uint8_t buf[4];
  void *v16;
  __int16 v17;
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
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
    v16 = v11;
    v17 = 2112;
    v18 = v6;
    _os_log_impl(&dword_2218F0000, v10, OS_LOG_TYPE_INFO, "%{public}@Updating home model last node ID to %@", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v8);
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = __53__HMDCHIPHomeDataSource_updateLastNodeID_completion___block_invoke;
  v13[3] = &unk_24E779A80;
  v14 = v6;
  v12 = v6;
  -[HMDCHIPHomeDataSource _updateHomeModelWithLabel:completion:block:](v9, "_updateHomeModelWithLabel:completion:block:", CFSTR("Update CHIP last node ID"), v7, v13);

}

- (NSData)rootCertificate
{
  void *v2;
  void *v3;
  void *v4;

  -[HMDCHIPHomeDataSource home](self, "home");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "chipStorage");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "rootCertificate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSData *)v4;
}

- (void)updateRootCertificate:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  HMDCHIPHomeDataSource *v9;
  NSObject *v10;
  void *v11;
  id v12;
  _QWORD v13[4];
  id v14;
  uint8_t buf[4];
  void *v16;
  __int16 v17;
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
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
    v16 = v11;
    v17 = 2112;
    v18 = v6;
    _os_log_impl(&dword_2218F0000, v10, OS_LOG_TYPE_INFO, "%{public}@Updating home model root certificate to %@", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v8);
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = __58__HMDCHIPHomeDataSource_updateRootCertificate_completion___block_invoke;
  v13[3] = &unk_24E779A80;
  v14 = v6;
  v12 = v6;
  -[HMDCHIPHomeDataSource _updateHomeModelWithLabel:completion:block:](v9, "_updateHomeModelWithLabel:completion:block:", CFSTR("Update CHIP root certificate"), v7, v13);

}

- (NSData)operationalCertificate
{
  void *v2;
  void *v3;
  void *v4;

  -[HMDCHIPHomeDataSource home](self, "home");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "chipStorage");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "operationalCertificate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSData *)v4;
}

- (void)updateOperationalCertificate:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  HMDCHIPHomeDataSource *v9;
  NSObject *v10;
  void *v11;
  id v12;
  _QWORD v13[4];
  id v14;
  uint8_t buf[4];
  void *v16;
  __int16 v17;
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
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
    v16 = v11;
    v17 = 2112;
    v18 = v6;
    _os_log_impl(&dword_2218F0000, v10, OS_LOG_TYPE_INFO, "%{public}@Updating home model operational certificate to %@", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v8);
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = __65__HMDCHIPHomeDataSource_updateOperationalCertificate_completion___block_invoke;
  v13[3] = &unk_24E779A80;
  v14 = v6;
  v12 = v6;
  -[HMDCHIPHomeDataSource _updateHomeModelWithLabel:completion:block:](v9, "_updateHomeModelWithLabel:completion:block:", CFSTR("Update CHIP operational certificate"), v7, v13);

}

- (NSData)intermediateCertificate
{
  void *v2;
  void *v3;
  void *v4;

  -[HMDCHIPHomeDataSource home](self, "home");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "chipStorage");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "intermediateCertificate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSData *)v4;
}

- (void)updateIntermediateCertificate:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  HMDCHIPHomeDataSource *v9;
  NSObject *v10;
  void *v11;
  id v12;
  _QWORD v13[4];
  id v14;
  uint8_t buf[4];
  void *v16;
  __int16 v17;
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
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
    v16 = v11;
    v17 = 2112;
    v18 = v6;
    _os_log_impl(&dword_2218F0000, v10, OS_LOG_TYPE_INFO, "%{public}@Updating home model intermediate certificate to %@", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v8);
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = __66__HMDCHIPHomeDataSource_updateIntermediateCertificate_completion___block_invoke;
  v13[3] = &unk_24E779A80;
  v14 = v6;
  v12 = v6;
  -[HMDCHIPHomeDataSource _updateHomeModelWithLabel:completion:block:](v9, "_updateHomeModelWithLabel:completion:block:", CFSTR("Update CHIP intermediate certificate"), v7, v13);

}

- (NSDictionary)keyValueStore
{
  void *v2;
  void *v3;
  void *v4;

  -[HMDCHIPHomeDataSource home](self, "home");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "chipStorage");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "keyValueStore");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDictionary *)v4;
}

- (void)updateKeyValueStore:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  _QWORD v8[4];
  id v9;

  v6 = a3;
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __56__HMDCHIPHomeDataSource_updateKeyValueStore_completion___block_invoke;
  v8[3] = &unk_24E779AD0;
  v9 = v6;
  v7 = v6;
  -[HMDCHIPHomeDataSource updateKeyValueStoreWithBlock:completion:](self, "updateKeyValueStoreWithBlock:completion:", v8, a4);

}

- (void)updateKeyValueStoreWithBlock:(id)a3 completion:(id)a4
{
  unsigned int (**v6)(id, void *, void *);
  id v7;
  void *v8;
  void *v9;
  void *v10;
  HMDCHIPHomeDataSource *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  HMDCHIPHomeDataSource *v15;
  NSObject *v16;
  void *v17;
  void (**v18)(void *, void *);
  void *v19;
  void *v20;
  HMDCHIPHomeDataSource *v21;
  NSObject *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void (**v27)(void *, void *);
  void *v28;
  void *v29;
  _QWORD v30[5];
  unsigned int (**v31)(id, void *, void *);
  uint8_t buf[4];
  void *v33;
  uint64_t v34;

  v34 = *MEMORY[0x24BDAC8D0];
  v6 = (unsigned int (**)(id, void *, void *))a3;
  v7 = a4;
  -[HMDCHIPHomeDataSource home](self, "home");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (!v8)
  {
    v14 = (void *)MEMORY[0x227676638]();
    v15 = self;
    HMFGetOSLogHandle();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v33 = v17;
      _os_log_impl(&dword_2218F0000, v16, OS_LOG_TYPE_ERROR, "%{public}@Home reference is nil", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v14);
    v18 = (void (**)(void *, void *))_Block_copy(v7);
    if (!v18)
      goto LABEL_24;
    objc_msgSend(MEMORY[0x24BDD1540], "hmErrorWithCode:", 2);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v18[2](v18, v19);
LABEL_23:

LABEL_24:
    goto LABEL_25;
  }
  if ((objc_msgSend(v8, "isCurrentDevicePrimaryResident") & 1) == 0
    && (!isFeatureMatteriPhoneOnlyPairingControlEnabled()
     || (objc_msgSend(v9, "isPrimaryResidentNodeReachable") & 1) != 0
     || !objc_msgSend(v9, "isOwnerUser")))
  {
    v20 = (void *)MEMORY[0x227676638]();
    v21 = self;
    HMFGetOSLogHandle();
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v33 = v23;
      _os_log_impl(&dword_2218F0000, v22, OS_LOG_TYPE_INFO, "%{public}@Remotely updating home model key-value store", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v20);
    -[HMDCHIPHomeDataSource keyValueStore](v21, "keyValueStore");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = (void *)objc_msgSend(v24, "mutableCopy");
    v26 = v25;
    if (v25)
    {
      v27 = v25;
    }
    else
    {
      objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
      v27 = (void (**)(void *, void *))objc_claimAutoreleasedReturnValue();
    }
    v18 = v27;

    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6[2](v6, v18, v19))
    {
      objc_msgSend(v9, "remotelyUpdateHomeModelWithCHIPKeyValueStore:removedKeys:completion:", v18, v19, v7);
    }
    else
    {
      v28 = _Block_copy(v7);
      v29 = v28;
      if (v28)
        (*((void (**)(void *, _QWORD))v28 + 2))(v28, 0);

    }
    goto LABEL_23;
  }
  v10 = (void *)MEMORY[0x227676638]();
  v11 = self;
  HMFGetOSLogHandle();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v33 = v13;
    _os_log_impl(&dword_2218F0000, v12, OS_LOG_TYPE_INFO, "%{public}@Locally updating home model key-value store", buf, 0xCu);

  }
  objc_autoreleasePoolPop(v10);
  v30[0] = MEMORY[0x24BDAC760];
  v30[1] = 3221225472;
  v30[2] = __65__HMDCHIPHomeDataSource_updateKeyValueStoreWithBlock_completion___block_invoke;
  v30[3] = &unk_24E779AF8;
  v30[4] = v11;
  v31 = v6;
  -[HMDCHIPHomeDataSource _updateHomeModelWithLabel:completion:block:](v11, "_updateHomeModelWithLabel:completion:block:", CFSTR("Update CHIP key-value store"), v7, v30);

LABEL_25:
}

- (NSSet)allNodeIDs
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  HMDCHIPHomeDataSource *v11;
  NSObject *v12;
  void *v13;
  int v15;
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  -[HMDCHIPHomeDataSource home](self, "home");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    v5 = (void *)MEMORY[0x24BDBCF20];
    objc_msgSend(v3, "hapAccessories");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "na_map:", &__block_literal_global_31702);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "na_filter:", &__block_literal_global_32_31703);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setWithArray:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v10 = (void *)MEMORY[0x227676638]();
    v11 = self;
    HMFGetOSLogHandle();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = 138543362;
      v16 = v13;
      _os_log_impl(&dword_2218F0000, v12, OS_LOG_TYPE_ERROR, "%{public}@Home reference is nil", (uint8_t *)&v15, 0xCu);

    }
    objc_autoreleasePoolPop(v10);
    objc_msgSend(MEMORY[0x24BDBCF20], "set");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return (NSSet *)v9;
}

- (id)storageDataSourceForDeviceWithNodeID:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  void *v14;
  char v15;
  void *v16;
  HMDCHIPHomeDataSource *v17;
  NSObject *v18;
  void *v19;
  HMDCHIPAccessoryDataSource *v20;
  void *v21;
  HMDCHIPHomeDataSource *v22;
  NSObject *v23;
  void *v24;
  void *v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  uint8_t buf[4];
  void *v32;
  __int16 v33;
  id v34;
  _BYTE v35[128];
  uint64_t v36;

  v36 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[HMDCHIPHomeDataSource home](self, "home");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    v29 = 0u;
    v30 = 0u;
    v27 = 0u;
    v28 = 0u;
    v26 = v5;
    objc_msgSend(v5, "hapAccessories");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v27, v35, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v28;
      while (2)
      {
        for (i = 0; i != v9; ++i)
        {
          if (*(_QWORD *)v28 != v10)
            objc_enumerationMutation(v7);
          v12 = *(void **)(*((_QWORD *)&v27 + 1) + 8 * i);
          objc_msgSend(v12, "chipStorage");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "nodeID");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          v15 = objc_msgSend(v14, "isEqualToNumber:", v4);

          if ((v15 & 1) != 0)
          {
            v20 = -[HMDCHIPAccessoryDataSource initWithNodeID:accessory:]([HMDCHIPAccessoryDataSource alloc], "initWithNodeID:accessory:", v4, v12);

            goto LABEL_14;
          }
        }
        v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v27, v35, 16);
        if (v9)
          continue;
        break;
      }
    }

    v16 = (void *)MEMORY[0x227676638]();
    v17 = self;
    HMFGetOSLogHandle();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      HMFGetLogIdentifier();
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v32 = v19;
      v33 = 2112;
      v34 = v4;
      _os_log_impl(&dword_2218F0000, v18, OS_LOG_TYPE_DEFAULT, "%{public}@Could not find accessory with CHIP node ID: %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v16);
    v20 = 0;
LABEL_14:
    v6 = v26;
  }
  else
  {
    v21 = (void *)MEMORY[0x227676638]();
    v22 = self;
    HMFGetOSLogHandle();
    v23 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v32 = v24;
      _os_log_impl(&dword_2218F0000, v23, OS_LOG_TYPE_ERROR, "%{public}@Home reference is nil", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v21);
    v20 = 0;
  }

  return v20;
}

- (id)logIdentifier
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = (void *)MEMORY[0x24BDD17C8];
  -[HMDCHIPHomeDataSource home](self, "home");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "logIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDCHIPHomeDataSource fabricID](self, "fabricID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@/%@"), v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (NSNumber)fabricID
{
  return self->_fabricID;
}

- (HMDHome)home
{
  return (HMDHome *)objc_loadWeakRetained((id *)&self->_home);
}

- (void)setHome:(id)a3
{
  objc_storeWeak((id *)&self->_home, a3);
}

- (NSMutableDictionary)pendingKeyValueStore
{
  return self->_pendingKeyValueStore;
}

- (void)setPendingKeyValueStore:(id)a3
{
  objc_storeStrong((id *)&self->_pendingKeyValueStore, a3);
}

- (unint64_t)pendingKeyValueStoreTransactionsCount
{
  return self->_pendingKeyValueStoreTransactionsCount;
}

- (void)setPendingKeyValueStoreTransactionsCount:(unint64_t)a3
{
  self->_pendingKeyValueStoreTransactionsCount = a3;
}

- (NSRecursiveLock)lock
{
  return self->_lock;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lock, 0);
  objc_storeStrong((id *)&self->_pendingKeyValueStore, 0);
  objc_destroyWeak((id *)&self->_home);
  objc_storeStrong((id *)&self->_fabricID, 0);
}

uint64_t __35__HMDCHIPHomeDataSource_allNodeIDs__block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "isEqual:", &unk_24E96A910) ^ 1;
}

id __35__HMDCHIPHomeDataSource_allNodeIDs__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;

  objc_msgSend(a2, "chipStorage");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "nodeID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

uint64_t __65__HMDCHIPHomeDataSource_updateKeyValueStoreWithBlock_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;

  v5 = a2;
  v6 = a3;
  objc_msgSend(*(id *)(a1 + 32), "fabricID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setChipFabricID:", v7);

  objc_msgSend(*(id *)(a1 + 32), "fabricID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setChipFabricIndex:", v8);

  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  if ((_DWORD)v10)
  {
    v11 = (void *)objc_msgSend(v6, "copy");
    objc_msgSend(v5, "setChipKeyValueStore:", v11);

  }
  return v10;
}

uint64_t __56__HMDCHIPHomeDataSource_updateKeyValueStore_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  _QWORD v11[4];
  id v12;

  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __56__HMDCHIPHomeDataSource_updateKeyValueStore_completion___block_invoke_2;
  v11[3] = &unk_24E779AA8;
  v12 = *(id *)(a1 + 32);
  v6 = a3;
  v7 = a2;
  objc_msgSend(v7, "keysOfEntriesPassingTest:", v11);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "allObjects");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addObjectsFromArray:", v9);

  objc_msgSend(v7, "setDictionary:", *(_QWORD *)(a1 + 32));
  return 1;
}

BOOL __56__HMDCHIPHomeDataSource_updateKeyValueStore_completion___block_invoke_2(uint64_t a1, uint64_t a2)
{
  void *v2;
  _BOOL8 v3;

  objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", a2);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 == 0;

  return v3;
}

uint64_t __66__HMDCHIPHomeDataSource_updateIntermediateCertificate_completion___block_invoke(uint64_t a1, void *a2)
{
  objc_msgSend(a2, "setChipIntermediateCertificate:", *(_QWORD *)(a1 + 32));
  return 1;
}

uint64_t __65__HMDCHIPHomeDataSource_updateOperationalCertificate_completion___block_invoke(uint64_t a1, void *a2)
{
  objc_msgSend(a2, "setChipOperationalCertificate:", *(_QWORD *)(a1 + 32));
  return 1;
}

uint64_t __58__HMDCHIPHomeDataSource_updateRootCertificate_completion___block_invoke(uint64_t a1, void *a2)
{
  objc_msgSend(a2, "setChipRootCertificate:", *(_QWORD *)(a1 + 32));
  return 1;
}

uint64_t __53__HMDCHIPHomeDataSource_updateLastNodeID_completion___block_invoke(uint64_t a1, void *a2)
{
  objc_msgSend(a2, "setChipLastNodeID:", *(_QWORD *)(a1 + 32));
  return 1;
}

uint64_t __51__HMDCHIPHomeDataSource_updateFabricID_completion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  id v4;

  v3 = *(_QWORD *)(a1 + 32);
  v4 = a2;
  objc_msgSend(v4, "setChipFabricID:", v3);
  objc_msgSend(v4, "setChipFabricIndex:", *(_QWORD *)(a1 + 32));

  return 1;
}

void __68__HMDCHIPHomeDataSource__updateHomeModelWithLabel_completion_block___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  v12 = a2;
  objc_msgSend(*(id *)(a1 + 32), "pendingKeyValueStore");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "home");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "chipStorage");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setKeyValueStore:", v3);

  objc_msgSend(*(id *)(a1 + 32), "lock");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "lock");

  v7 = *(void **)(a1 + 32);
  v8 = objc_msgSend(v7, "pendingKeyValueStoreTransactionsCount") - 1;
  objc_msgSend(v7, "setPendingKeyValueStoreTransactionsCount:", v8);
  if (!v8)
    objc_msgSend(*(id *)(a1 + 32), "setPendingKeyValueStore:", 0);
  objc_msgSend(*(id *)(a1 + 32), "lock");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "unlock");

  v10 = _Block_copy(*(const void **)(a1 + 40));
  v11 = v10;
  if (v10)
    (*((void (**)(void *, id))v10 + 2))(v10, v12);

}

+ (id)logCategory
{
  if (logCategory__hmf_once_t17_31745 != -1)
    dispatch_once(&logCategory__hmf_once_t17_31745, &__block_literal_global_39_31746);
  return (id)logCategory__hmf_once_v18_31747;
}

void __36__HMDCHIPHomeDataSource_logCategory__block_invoke()
{
  uint64_t v0;
  void *v1;

  HMFCreateOSLogHandle();
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)logCategory__hmf_once_v18_31747;
  logCategory__hmf_once_v18_31747 = v0;

}

@end
