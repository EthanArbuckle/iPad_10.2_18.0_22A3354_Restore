@implementation HMMTRFabricControllerStore

- (HMMTRFabricControllerStore)initWithQueue:(id)a3 controllerFactory:(id)a4
{
  id v7;
  id v8;
  HMMTRFabricControllerStore *v9;
  HMMTRFabricControllerStore *v10;
  uint64_t v11;
  NSMutableDictionary *controllerWrappers;
  objc_super v14;

  v7 = a3;
  v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)HMMTRFabricControllerStore;
  v9 = -[HMMTRFabricControllerStore init](&v14, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_workQueue, a3);
    objc_storeStrong((id *)&v10->_controllerFactory, a4);
    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v11 = objc_claimAutoreleasedReturnValue();
    controllerWrappers = v10->_controllerWrappers;
    v10->_controllerWrappers = (NSMutableDictionary *)v11;

  }
  return v10;
}

- (id)wrapperWithFabricID:(id)a3 startupParams:(id)a4 allFabricIDs:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  id v12;
  id v13;
  id v14;
  id v15;
  _QWORD block[5];
  id v18;
  id v19;
  id v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t (*v25)(uint64_t, uint64_t);
  void (*v26)(uint64_t);
  id v27;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v22 = 0;
  v23 = &v22;
  v24 = 0x3032000000;
  v25 = __Block_byref_object_copy__2533;
  v26 = __Block_byref_object_dispose__2534;
  v27 = 0;
  -[HMMTRFabricControllerStore workQueue](self, "workQueue");
  v11 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __77__HMMTRFabricControllerStore_wrapperWithFabricID_startupParams_allFabricIDs___block_invoke;
  block[3] = &unk_250F20E20;
  block[4] = self;
  v18 = v8;
  v20 = v10;
  v21 = &v22;
  v19 = v9;
  v12 = v10;
  v13 = v9;
  v14 = v8;
  dispatch_sync(v11, block);

  v15 = (id)v23[5];
  _Block_object_dispose(&v22, 8);

  return v15;
}

- (id)cachedWrapperWithFabricID:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  id v7;
  _QWORD block[5];
  id v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  id v17;

  v4 = a3;
  v12 = 0;
  v13 = &v12;
  v14 = 0x3032000000;
  v15 = __Block_byref_object_copy__2533;
  v16 = __Block_byref_object_dispose__2534;
  v17 = 0;
  -[HMMTRFabricControllerStore workQueue](self, "workQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __56__HMMTRFabricControllerStore_cachedWrapperWithFabricID___block_invoke;
  block[3] = &unk_250F235D0;
  v10 = v4;
  v11 = &v12;
  block[4] = self;
  v6 = v4;
  dispatch_sync(v5, block);

  v7 = (id)v13[5];
  _Block_object_dispose(&v12, 8);

  return v7;
}

- (void)removeAllGetters
{
  void *v3;
  HMMTRFabricControllerStore *v4;
  NSObject *v5;
  void *v6;
  NSObject *v7;
  _QWORD block[5];
  uint8_t buf[4];
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  v3 = (void *)MEMORY[0x242656984](self, a2);
  v4 = self;
  HMFGetOSLogHandle();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v10 = v6;
    _os_log_impl(&dword_23E95B000, v5, OS_LOG_TYPE_INFO, "%{public}@Removing all controller wrappers", buf, 0xCu);

  }
  objc_autoreleasePoolPop(v3);
  -[HMMTRFabricControllerStore workQueue](v4, "workQueue");
  v7 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __46__HMMTRFabricControllerStore_removeAllGetters__block_invoke;
  block[3] = &unk_250F23DF0;
  block[4] = v4;
  dispatch_async(v7, block);

}

- (void)_auditControllerWrappersWithAllFabricIDs:(id)a3
{
  id v4;
  void *v5;
  HMMTRFabricControllerStore *v6;
  NSObject *v7;
  void *v8;
  uint64_t v9;
  __int128 v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  void *v15;
  HMMTRFabricControllerStore *v16;
  HMMTRFabricControllerStore *v17;
  NSObject *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  __int128 v26;
  void *v27;
  id obj;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  uint8_t v33[128];
  uint8_t buf[4];
  void *v35;
  __int16 v36;
  id v37;
  uint64_t v38;

  v38 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = (void *)MEMORY[0x242656984]();
  v6 = self;
  HMFGetOSLogHandle();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
  {
    HMFGetLogIdentifier();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v35 = v8;
    v36 = 2112;
    v37 = v4;
    _os_log_impl(&dword_23E95B000, v7, OS_LOG_TYPE_ERROR, "%{public}@Hitting maximum number of getters. Removing unused and restarting factory. Currently used: %@", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v5);
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  v32 = 0u;
  -[HMMTRFabricControllerStore controllerWrappers](v6, "controllerWrappers");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
  if (v9)
  {
    v11 = v9;
    v12 = *(_QWORD *)v30;
    *(_QWORD *)&v10 = 138543618;
    v26 = v10;
    do
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v30 != v12)
          objc_enumerationMutation(obj);
        v14 = *(void **)(*((_QWORD *)&v29 + 1) + 8 * i);
        if ((objc_msgSend(v4, "containsObject:", v14, v26) & 1) == 0)
        {
          v15 = (void *)MEMORY[0x242656984]();
          v16 = v6;
          v17 = v6;
          HMFGetOSLogHandle();
          v18 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
          {
            HMFGetLogIdentifier();
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = v26;
            v35 = v19;
            v36 = 2112;
            v37 = v14;
            _os_log_impl(&dword_23E95B000, v18, OS_LOG_TYPE_INFO, "%{public}@Removing %@ from factory", buf, 0x16u);

          }
          objc_autoreleasePoolPop(v15);
          -[HMMTRFabricControllerStore controllerWrappers](v17, "controllerWrappers");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v20, "objectForKeyedSubscript:", v14);
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v21, "remove");

          objc_msgSend(v27, "addObject:", v14);
          v6 = v16;
        }
      }
      v11 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
    }
    while (v11);
  }

  -[HMMTRFabricControllerStore controllerWrappers](v6, "controllerWrappers");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "removeObjectsForKeys:", v27);

  -[HMMTRFabricControllerStore controllerFactory](v6, "controllerFactory");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "disableNormalOperation");
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  -[HMMTRFabricControllerStore controllerFactory](v6, "controllerFactory");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "enableNormalOperationWithToken:", v24);

}

- (OS_dispatch_queue)workQueue
{
  return self->_workQueue;
}

- (HMMTRControllerFactory)controllerFactory
{
  return self->_controllerFactory;
}

- (NSMutableDictionary)controllerWrappers
{
  return self->_controllerWrappers;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_controllerWrappers, 0);
  objc_storeStrong((id *)&self->_controllerFactory, 0);
  objc_storeStrong((id *)&self->_workQueue, 0);
}

void __46__HMMTRFabricControllerStore_removeAllGetters__block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  objc_msgSend(*(id *)(a1 + 32), "controllerWrappers", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v12;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v12 != v5)
          objc_enumerationMutation(v2);
        v7 = *(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * v6);
        objc_msgSend(*(id *)(a1 + 32), "controllerWrappers");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "objectForKeyedSubscript:", v7);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "remove");

        ++v6;
      }
      while (v4 != v6);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v4);
  }

  objc_msgSend(*(id *)(a1 + 32), "controllerWrappers");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "removeAllObjects");

}

void __56__HMMTRFabricControllerStore_cachedWrapperWithFabricID___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  id v5;

  objc_msgSend(*(id *)(a1 + 32), "controllerWrappers");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", *(_QWORD *)(a1 + 40));
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

void __77__HMMTRFabricControllerStore_wrapperWithFabricID_startupParams_allFabricIDs___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  _BOOL4 v5;
  void *v6;
  id v7;
  NSObject *v8;
  void *v9;
  uint64_t v10;
  const char *v11;
  void *v12;
  unint64_t v13;
  uint64_t v14;
  void *v15;
  id v16;
  NSObject *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  uint64_t v25;
  void *v26;
  uint64_t v27;
  uint8_t buf[4];
  void *v29;
  __int16 v30;
  uint64_t v31;
  uint64_t v32;

  v32 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(a1 + 32), "controllerWrappers");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", *(_QWORD *)(a1 + 40));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40), v3);
    objc_msgSend(v3, "startupParams");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = +[HMMTRFabricControllerStore startupParams:isEquivalentTo:](HMMTRFabricControllerStore, "startupParams:isEquivalentTo:", v4, *(_QWORD *)(a1 + 48));

    if (v5)
    {
      v6 = (void *)MEMORY[0x242656984]();
      v7 = *(id *)(a1 + 32);
      HMFGetOSLogHandle();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = *(_QWORD *)(a1 + 40);
        *(_DWORD *)buf = 138543618;
        v29 = v9;
        v30 = 2112;
        v31 = v10;
        v11 = "%{public}@Startup parameter remains the same for %@. Returning the previous controller wrapper.";
LABEL_12:
        _os_log_impl(&dword_23E95B000, v8, OS_LOG_TYPE_INFO, v11, buf, 0x16u);

      }
    }
    else
    {
      v6 = (void *)MEMORY[0x242656984](objc_msgSend(v3, "replaceStartupParams:", *(_QWORD *)(a1 + 48)));
      v7 = *(id *)(a1 + 32);
      HMFGetOSLogHandle();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v27 = *(_QWORD *)(a1 + 40);
        *(_DWORD *)buf = 138543618;
        v29 = v9;
        v30 = 2112;
        v31 = v27;
        v11 = "%{public}@Startup parameter changed for %@. Replaced controller wrapper params.";
        goto LABEL_12;
      }
    }

    objc_autoreleasePoolPop(v6);
    goto LABEL_14;
  }
  objc_msgSend(*(id *)(a1 + 32), "controllerWrappers");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "count");

  if (v13 >= 8)
    v14 = objc_msgSend(*(id *)(a1 + 32), "_auditControllerWrappersWithAllFabricIDs:", *(_QWORD *)(a1 + 56));
  v15 = (void *)MEMORY[0x242656984](v14);
  v16 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v17 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = *(_QWORD *)(a1 + 40);
    *(_DWORD *)buf = 138543618;
    v29 = v18;
    v30 = 2112;
    v31 = v19;
    _os_log_impl(&dword_23E95B000, v17, OS_LOG_TYPE_INFO, "%{public}@Retrieving controller wrapper for the first time for %@", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v15);
  objc_msgSend(*(id *)(a1 + 32), "controllerFactory");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("PerFabricID:%@"), *(_QWORD *)(a1 + 40));
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "wrapperWithName:startupParams:", v21, *(_QWORD *)(a1 + 48));
  v22 = objc_claimAutoreleasedReturnValue();
  v23 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
  v24 = *(void **)(v23 + 40);
  *(_QWORD *)(v23 + 40) = v22;

  v25 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40);
  objc_msgSend(*(id *)(a1 + 32), "controllerWrappers");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "setObject:forKeyedSubscript:", v25, *(_QWORD *)(a1 + 40));

LABEL_14:
}

+ (BOOL)startupParams:(id)a3 isEquivalentTo:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  char v10;

  v6 = a4;
  v7 = a3;
  if (objc_msgSend(v7, "usesCommonStorageDelegate"))
  {
    objc_msgSend(v7, "controllerParams");
    v8 = objc_claimAutoreleasedReturnValue();

    objc_msgSend(v6, "controllerParams");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(a1, "startupParams1:isEquivalentTo:", v8, v9);

    v7 = (id)v8;
  }
  else
  {
    v10 = objc_msgSend(a1, "startupParams2:isEquivalentTo:", v7, v6);
  }

  return v10;
}

+ (BOOL)startupParams1:(id)a3 isEquivalentTo:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  int v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  char v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  int v31;
  void *v32;
  uint64_t v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  id v38;
  void *v39;
  void *v40;
  id v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  id v48;
  void *v49;
  int v50;
  void *v51;
  void *v52;
  int v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  int v58;
  uint64_t v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  int v64;
  uint64_t v65;
  void *v66;
  void *v67;
  void *v68;
  int v69;

  v5 = a3;
  v6 = a4;
  objc_msgSend(v5, "nocSigner");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v7, "publicKey"))
  {
    objc_msgSend(v6, "nocSigner");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "publicKey");

    if (v9)
    {
      objc_msgSend(v5, "nocSigner");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = SecKeyCopyExternalRepresentation((SecKeyRef)objc_msgSend(v10, "publicKey"), 0);

      objc_msgSend(v6, "nocSigner");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = SecKeyCopyExternalRepresentation((SecKeyRef)objc_msgSend(v12, "publicKey"), 0);

      v14 = objc_msgSend(v11, "isEqual:", v13);
      goto LABEL_8;
    }
  }
  else
  {

  }
  objc_msgSend(v5, "nocSigner");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v11, "publicKey"))
  {
    v14 = 0;
    goto LABEL_9;
  }
  objc_msgSend(v6, "nocSigner");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "publicKey") == 0;
LABEL_8:

LABEL_9:
  objc_msgSend(v5, "operationalKeypair");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v15, "publicKey"))
  {
    objc_msgSend(v6, "operationalKeypair");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v16, "publicKey");

    if (v17)
    {
      objc_msgSend(v5, "operationalKeypair");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = SecKeyCopyExternalRepresentation((SecKeyRef)objc_msgSend(v18, "publicKey"), 0);

      objc_msgSend(v6, "operationalKeypair");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = SecKeyCopyExternalRepresentation((SecKeyRef)objc_msgSend(v20, "publicKey"), 0);

      v22 = objc_msgSend(v19, "isEqual:", v21);
      goto LABEL_16;
    }
  }
  else
  {

  }
  objc_msgSend(v5, "operationalKeypair");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v19, "publicKey"))
  {
    v23 = 0;
LABEL_78:

    goto LABEL_79;
  }
  objc_msgSend(v6, "operationalKeypair");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = objc_msgSend(v21, "publicKey") == 0;
LABEL_16:

  if ((v14 & v22) == 1)
  {
    objc_msgSend(v5, "ipk");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    if (v19 || (objc_msgSend(v6, "ipk"), (v68 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
    {
      objc_msgSend(v5, "ipk");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "ipk");
      v22 = objc_claimAutoreleasedReturnValue();
      if (!objc_msgSend(v21, "isEqual:", v22))
      {
        v23 = 0;
LABEL_75:

LABEL_76:
        if (!v19)

        goto LABEL_78;
      }
      v69 = 1;
    }
    else
    {
      v68 = 0;
      v69 = 0;
    }
    v24 = (void *)MEMORY[0x24BDDB5B0];
    objc_msgSend(v5, "rootCertificate");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "rootCertificate");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend(v24, "isCertificate:equalTo:", v25, v26))
    {
      v23 = 0;
      v31 = v69;
      goto LABEL_74;
    }
    objc_msgSend(v5, "intermediateCertificate");
    v67 = (void *)objc_claimAutoreleasedReturnValue();
    if (v67
      || (objc_msgSend(v6, "intermediateCertificate"), (v60 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
    {
      v27 = (void *)MEMORY[0x24BDDB5B0];
      objc_msgSend(v5, "intermediateCertificate");
      v28 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "intermediateCertificate");
      v29 = objc_claimAutoreleasedReturnValue();
      v66 = (void *)v28;
      v30 = v28;
      v24 = (void *)v29;
      if (!objc_msgSend(v27, "isCertificate:equalTo:", v30, v29))
      {
        v23 = 0;
        v31 = v69;
LABEL_70:

LABEL_71:
        if (!v67)

LABEL_74:
        if (!v31)
          goto LABEL_76;
        goto LABEL_75;
      }
      v64 = 1;
    }
    else
    {
      v60 = 0;
      v64 = 0;
    }
    objc_msgSend(v5, "operationalCertificate");
    v65 = objc_claimAutoreleasedReturnValue();
    if (v65 || (objc_msgSend(v6, "operationalCertificate"), (v63 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
    {
      v32 = (void *)MEMORY[0x24BDDB5B0];
      objc_msgSend(v5, "operationalCertificate");
      v33 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "operationalCertificate");
      v61 = (void *)objc_claimAutoreleasedReturnValue();
      v62 = (void *)v33;
      if (!objc_msgSend(v32, "isCertificate:equalTo:", v33))
      {
        v23 = 0;
        v31 = v69;
        goto LABEL_66;
      }
      v58 = 1;
      v34 = v63;
    }
    else
    {
      v34 = 0;
      v58 = 0;
    }
    objc_msgSend(v5, "caseAuthenticatedTags");
    v59 = objc_claimAutoreleasedReturnValue();
    v63 = v34;
    if (v59 || (objc_msgSend(v6, "caseAuthenticatedTags"), (v51 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
    {
      objc_msgSend(v5, "caseAuthenticatedTags");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "caseAuthenticatedTags");
      v56 = (void *)objc_claimAutoreleasedReturnValue();
      v57 = v35;
      if (!objc_msgSend(v35, "isEqual:"))
      {
        v23 = 0;
        goto LABEL_43;
      }
      v53 = 1;
    }
    else
    {
      v51 = 0;
      v53 = 0;
    }
    objc_msgSend(v5, "operationalCertificateIssuer");
    v54 = v24;
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    if (v55
      || (objc_msgSend(v6, "operationalCertificateIssuer"), (v49 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
    {
      objc_msgSend(v5, "operationalCertificateIssuer");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v37 = v36;
      else
        v37 = 0;
      v38 = v37;

      objc_msgSend(v6, "operationalCertificateIssuer");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v40 = v39;
      else
        v40 = 0;
      v41 = v40;

      v52 = v41;
      if (!objc_msgSend(v38, "isEquivalentTo:", v41))
      {
        v23 = 0;
        v24 = v54;
        goto LABEL_59;
      }
      v48 = v38;
      v50 = 1;
    }
    else
    {
      v49 = 0;
      v50 = 0;
    }
    objc_msgSend(v5, "vendorID");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "vendorID");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = objc_msgSend(v42, "isEqual:", v43);

    if (v50)
    {
      v24 = v54;
      v38 = v48;
LABEL_59:

      v31 = v69;
      v44 = v55;
      if (!v55)
      {

        v44 = 0;
      }

      if (v53)
        goto LABEL_62;
LABEL_63:
      v45 = (void *)v59;
      if (!v59)
      {

        v45 = 0;
      }

      if (!v58)
      {
LABEL_67:
        v46 = (void *)v65;
        if (!v65)
        {

          v46 = 0;
        }

        if (!v64)
          goto LABEL_71;
        goto LABEL_70;
      }
LABEL_66:

      goto LABEL_67;
    }
    v24 = v54;
    if (!v55)
    {

      v31 = v69;
      if ((v53 & 1) == 0)
        goto LABEL_63;
LABEL_62:

      goto LABEL_63;
    }

    if ((v53 & 1) == 0)
    {
      v31 = v69;
      goto LABEL_63;
    }
LABEL_43:
    v31 = v69;
    goto LABEL_62;
  }
  v23 = 0;
LABEL_79:

  return v23;
}

+ (BOOL)startupParams2:(id)a3 isEquivalentTo:(id)a4
{
  void *v4;
  id v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  CFDataRef v12;
  uint64_t v13;
  void *v14;
  void *v15;
  char v16;
  void *v17;
  int v18;
  int v19;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  int v26;
  void *v27;
  void *v28;
  uint64_t v29;
  void *v30;
  void *v31;
  id v32;
  void *v33;
  void *v34;
  id v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  int v42;
  void *v43;
  void *v44;
  void *v45;
  int v46;
  uint64_t v47;
  void *v48;
  void *v49;
  void *v50;
  int v51;
  uint64_t v52;
  void *v53;
  void *v54;
  uint64_t v55;
  void *v56;
  int v57;

  v6 = a3;
  v7 = a4;
  objc_msgSend(v6, "operationalKeypair");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v8, "publicKey"))
  {
    objc_msgSend(v7, "operationalKeypair");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "publicKey");

    if (v10)
    {
      objc_msgSend(v6, "operationalKeypair");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = SecKeyCopyExternalRepresentation((SecKeyRef)objc_msgSend(v11, "publicKey"), 0);

      objc_msgSend(v7, "operationalKeypair");
      v13 = objc_claimAutoreleasedReturnValue();
      v14 = SecKeyCopyExternalRepresentation((SecKeyRef)objc_msgSend((id)v13, "publicKey"), 0);

      LOBYTE(v13) = -[__CFData isEqual:](v12, "isEqual:", v14);
      if ((v13 & 1) == 0)
        goto LABEL_12;
      goto LABEL_10;
    }
  }
  else
  {

  }
  objc_msgSend(v6, "operationalKeypair");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v15, "publicKey"))
  {
    objc_msgSend(v7, "operationalKeypair");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = (void *)objc_msgSend(v17, "publicKey");

    if (v14)
    {
LABEL_12:
      v16 = 0;
      goto LABEL_13;
    }
LABEL_10:
    v18 = objc_msgSend(v6, "usesCommonStorageDelegate");
    if (v18 != objc_msgSend(v7, "usesCommonStorageDelegate"))
      goto LABEL_12;
    v19 = objc_msgSend(v6, "shouldAdvertiseOperational");
    if (v19 != objc_msgSend(v7, "shouldAdvertiseOperational"))
      goto LABEL_12;
    objc_msgSend(v6, "ipk");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    if (v15 || (objc_msgSend(v7, "ipk"), (v56 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
    {
      objc_msgSend(v6, "ipk");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "ipk");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      if (!objc_msgSend(v14, "isEqual:", v4))
      {
        v16 = 0;
LABEL_59:

LABEL_60:
        if (!v15)

        goto LABEL_8;
      }
      v57 = 1;
    }
    else
    {
      v56 = 0;
      v57 = 0;
    }
    v21 = (void *)MEMORY[0x24BDDB5B0];
    objc_msgSend(v6, "rootCertificate");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "rootCertificate");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend(v21, "isCertificate:equalTo:", v22, v23))
    {
      v16 = 0;
      v26 = v57;
      goto LABEL_58;
    }
    objc_msgSend(v6, "intermediateCertificate");
    v55 = objc_claimAutoreleasedReturnValue();
    if (v55
      || (objc_msgSend(v7, "intermediateCertificate"), (v48 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
    {
      v24 = (void *)MEMORY[0x24BDDB5B0];
      objc_msgSend(v6, "intermediateCertificate");
      v25 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "intermediateCertificate");
      v53 = (void *)objc_claimAutoreleasedReturnValue();
      v54 = (void *)v25;
      if (!objc_msgSend(v24, "isCertificate:equalTo:", v25))
      {
        v16 = 0;
        v26 = v57;
        v27 = (void *)v55;
LABEL_54:

LABEL_55:
        if (!v27)

LABEL_58:
        if (!v26)
          goto LABEL_60;
        goto LABEL_59;
      }
      v51 = 1;
    }
    else
    {
      v48 = 0;
      v51 = 0;
    }
    objc_msgSend(v6, "operationalCertificate");
    v52 = objc_claimAutoreleasedReturnValue();
    if (v52 || (objc_msgSend(v7, "operationalCertificate"), (v43 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
    {
      v28 = (void *)MEMORY[0x24BDDB5B0];
      objc_msgSend(v6, "operationalCertificate");
      v29 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "operationalCertificate");
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      v50 = (void *)v29;
      if (!objc_msgSend(v28, "isCertificate:equalTo:", v29))
      {
        v16 = 0;
        v26 = v57;
        v27 = (void *)v55;
LABEL_50:

        goto LABEL_51;
      }
      v46 = 1;
    }
    else
    {
      v43 = 0;
      v46 = 0;
    }
    objc_msgSend(v6, "operationalCertificateIssuer");
    v47 = objc_claimAutoreleasedReturnValue();
    if (v47
      || (objc_msgSend(v7, "operationalCertificateIssuer"), (v41 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
    {
      objc_msgSend(v6, "operationalCertificateIssuer");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v31 = v30;
      else
        v31 = 0;
      v32 = v31;

      objc_msgSend(v7, "operationalCertificateIssuer");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v34 = v33;
      else
        v34 = 0;
      v35 = v34;

      v44 = v35;
      v45 = v32;
      if (!objc_msgSend(v32, "isEquivalentTo:", v35))
      {
        v16 = 0;
        goto LABEL_47;
      }
      v42 = 1;
    }
    else
    {
      v41 = 0;
      v42 = 0;
    }
    objc_msgSend(v6, "vendorID");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "vendorID");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v36, "isEqual:", v37);

    if (!v42)
    {
      v26 = v57;
      v27 = (void *)v55;
      v40 = (void *)v47;
      if (!v47)
        v40 = v41;

      if ((v46 & 1) != 0)
        goto LABEL_50;
      goto LABEL_51;
    }
LABEL_47:
    v26 = v57;
    v27 = (void *)v55;

    v38 = (void *)v47;
    if (!v47)
    {

      v38 = 0;
    }

    if (v46)
      goto LABEL_50;
LABEL_51:
    v39 = (void *)v52;
    if (!v52)
    {

      v39 = 0;
    }

    if (!v51)
      goto LABEL_55;
    goto LABEL_54;
  }
  v16 = 0;
LABEL_8:

LABEL_13:
  return v16;
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t10 != -1)
    dispatch_once(&logCategory__hmf_once_t10, &__block_literal_global_2551);
  return (id)logCategory__hmf_once_v11;
}

void __41__HMMTRFabricControllerStore_logCategory__block_invoke()
{
  uint64_t v0;
  void *v1;

  HMFCreateOSLogHandle();
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)logCategory__hmf_once_v11;
  logCategory__hmf_once_v11 = v0;

}

@end
