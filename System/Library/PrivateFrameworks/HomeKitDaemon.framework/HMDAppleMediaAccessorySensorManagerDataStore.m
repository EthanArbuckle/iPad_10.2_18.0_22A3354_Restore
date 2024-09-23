@implementation HMDAppleMediaAccessorySensorManagerDataStore

- (HMDAppleMediaAccessorySensorManagerDataStore)initWithLocalMOC:(id)a3
{
  id v5;
  HMDAppleMediaAccessorySensorManagerDataStore *v6;
  HMDAppleMediaAccessorySensorManagerDataStore *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)HMDAppleMediaAccessorySensorManagerDataStore;
  v6 = -[HMDAppleMediaAccessorySensorManagerDataStore init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_localMOC, a3);

  return v7;
}

- (void)saveSensorUUID:(id)a3
{
  -[HMDAppleMediaAccessorySensorManagerDataStore saveSensorUUID:completion:](self, "saveSensorUUID:completion:", a3, 0);
}

- (void)saveSensorUUID:(id)a3 completion:(id)a4
{
  id v6;
  const char *v7;
  id v8;
  id Property;
  id v10;
  id v11;
  id v12;
  id v13;
  _QWORD v14[5];
  id v15;
  id v16;
  id v17;

  v6 = a3;
  v8 = a4;
  if (self)
    Property = objc_getProperty(self, v7, 8, 1);
  else
    Property = 0;
  v10 = Property;
  v14[0] = MEMORY[0x24BDAC760];
  v14[1] = 3221225472;
  v14[2] = __74__HMDAppleMediaAccessorySensorManagerDataStore_saveSensorUUID_completion___block_invoke;
  v14[3] = &unk_24E79B3F0;
  v14[4] = self;
  v15 = v10;
  v16 = v6;
  v17 = v8;
  v11 = v6;
  v12 = v8;
  v13 = v10;
  objc_msgSend(v13, "performBlock:", v14);

}

- (void)fetchSensorUUIDWithCompletion:(id)a3
{
  const char *v4;
  id v5;
  id Property;
  id v7;
  id v8;
  id v9;
  _QWORD v10[5];
  id v11;
  id v12;

  v5 = a3;
  if (self)
    Property = objc_getProperty(self, v4, 8, 1);
  else
    Property = 0;
  v7 = Property;
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __78__HMDAppleMediaAccessorySensorManagerDataStore_fetchSensorUUIDWithCompletion___block_invoke;
  v10[3] = &unk_24E79B440;
  v10[4] = self;
  v11 = v7;
  v12 = v5;
  v8 = v5;
  v9 = v7;
  objc_msgSend(v9, "performBlock:", v10);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_localMOC, 0);
}

void __78__HMDAppleMediaAccessorySensorManagerDataStore_fetchSensorUUIDWithCompletion___block_invoke(_QWORD *a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  id v5;
  uint64_t v6;
  void *v7;
  id v8;

  v2 = a1[4];
  v3 = (void *)a1[5];
  v8 = 0;
  -[HMDAppleMediaAccessorySensorManagerDataStore currentSensorPairingWithMOC:error:](v2, v3, (uint64_t)&v8);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v8;
  v6 = a1[6];
  objc_msgSend(v4, "pairedSensorUUID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, void *))(v6 + 16))(v6, v7);

}

- (id)currentSensorPairingWithMOC:(uint64_t)a3 error:
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  _QWORD v11[5];
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  id v17;

  v5 = a2;
  v6 = v5;
  if (a1)
  {
    objc_msgSend(v5, "hmd_assertIsExecuting");
    v12 = 0;
    v13 = &v12;
    v14 = 0x3032000000;
    v15 = __Block_byref_object_copy__18253;
    v16 = __Block_byref_object_dispose__18254;
    v17 = 0;
    +[MKFLocalAppleMediaSensorPairing fetchRequest](MKFLocalAppleMediaSensorPairing, "fetchRequest");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "executeFetchRequest:error:", v7, a3);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v11[0] = MEMORY[0x24BDAC760];
    v11[1] = 3221225472;
    v11[2] = __82__HMDAppleMediaAccessorySensorManagerDataStore_currentSensorPairingWithMOC_error___block_invoke;
    v11[3] = &unk_24E777A70;
    v11[4] = &v12;
    objc_msgSend(v8, "hmf_enumerateWithAutoreleasePoolUsingBlock:", v11);
    v9 = (id)v13[5];

    _Block_object_dispose(&v12, 8);
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

void __82__HMDAppleMediaAccessorySensorManagerDataStore_currentSensorPairingWithMOC_error___block_invoke(uint64_t a1, void *a2)
{
  void *v4;
  void *v5;
  int v6;
  id v7;

  v7 = a2;
  objc_msgSend(v7, "entity");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[MKFLocalAppleMediaSensorPairing entity](MKFLocalAppleMediaSensorPairing, "entity");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "isKindOfEntity:", v5);

  if (v6)
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);

}

void __74__HMDAppleMediaAccessorySensorManagerDataStore_saveSensorUUID_completion___block_invoke(uint64_t *a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  id v5;
  id v6;
  void *v7;
  id v8;
  NSObject *v9;
  void *v10;
  uint64_t v11;
  void (*v12)(void);
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  NSObject *v18;
  void *v19;
  void *v20;
  int v21;
  void *v22;
  id v23;
  NSObject *v24;
  NSObject *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  void *v29;
  void *v30;
  uint64_t v31;
  void *v32;
  id v33;
  id v34;
  uint8_t buf[4];
  void *v36;
  __int16 v37;
  id v38;
  uint64_t v39;

  v39 = *MEMORY[0x24BDAC8D0];
  v2 = a1[4];
  v3 = (void *)a1[5];
  v34 = 0;
  -[HMDAppleMediaAccessorySensorManagerDataStore currentSensorPairingWithMOC:error:](v2, v3, (uint64_t)&v34);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v34;
  if (!v5)
  {
    if (!v4)
    {
      v13 = (void *)MEMORY[0x24BDBB658];
      +[MKFLocalAppleMediaSensorPairing entity](MKFLocalAppleMediaSensorPairing, "entity");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "name");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "insertNewObjectForEntityForName:inManagedObjectContext:", v15, a1[5]);
      v4 = (void *)objc_claimAutoreleasedReturnValue();

      v16 = (void *)MEMORY[0x227676638]();
      v17 = (id)a1[4];
      HMFGetOSLogHandle();
      v18 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v36 = v19;
        v37 = 2112;
        v38 = v4;
        _os_log_impl(&dword_2218F0000, v18, OS_LOG_TYPE_INFO, "%{public}@Created new sensor pairing local model: %@", buf, 0x16u);

      }
      objc_autoreleasePoolPop(v16);
    }
    objc_msgSend(v4, "setPairedSensorUUID:", a1[6]);
    v20 = (void *)a1[5];
    v33 = 0;
    v21 = objc_msgSend(v20, "save:", &v33);
    v6 = v33;
    v22 = (void *)MEMORY[0x227676638]();
    v23 = (id)a1[4];
    HMFGetOSLogHandle();
    v24 = objc_claimAutoreleasedReturnValue();
    v25 = v24;
    if (!v21 || v6)
    {
      if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        v30 = (void *)a1[6];
        *(_DWORD *)buf = 138543618;
        v36 = v29;
        v37 = 2112;
        v38 = v30;
        _os_log_impl(&dword_2218F0000, v25, OS_LOG_TYPE_ERROR, "%{public}@Unable to update the local pairedSensorUUID to %@", buf, 0x16u);

      }
      objc_autoreleasePoolPop(v22);
      v31 = a1[7];
      if (!v31)
        goto LABEL_24;
      if (v6)
      {
        v12 = *(void (**)(void))(v31 + 16);
        goto LABEL_6;
      }
      objc_msgSend(MEMORY[0x24BDD1540], "hmErrorWithCode:", -1);
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      (*(void (**)(uint64_t, void *))(v31 + 16))(v31, v32);

    }
    else
    {
      if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        v27 = (void *)a1[6];
        *(_DWORD *)buf = 138543618;
        v36 = v26;
        v37 = 2112;
        v38 = v27;
        _os_log_impl(&dword_2218F0000, v25, OS_LOG_TYPE_INFO, "%{public}@Saved local pairedSensorUUID: %@", buf, 0x16u);

      }
      objc_autoreleasePoolPop(v22);
      v28 = a1[7];
      if (v28)
        (*(void (**)(uint64_t, _QWORD))(v28 + 16))(v28, 0);
    }
    v6 = 0;
    goto LABEL_24;
  }
  v6 = v5;
  v7 = (void *)MEMORY[0x227676638]();
  v8 = (id)a1[4];
  HMFGetOSLogHandle();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
  {
    HMFGetLogIdentifier();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v36 = v10;
    v37 = 2112;
    v38 = v6;
    _os_log_impl(&dword_2218F0000, v9, OS_LOG_TYPE_ERROR, "%{public}@Unable to fetch the current the local sensor pairing with error: %@", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v7);
  v11 = a1[7];
  if (v11)
  {
    v12 = *(void (**)(void))(v11 + 16);
LABEL_6:
    v12();
  }
LABEL_24:

}

@end
