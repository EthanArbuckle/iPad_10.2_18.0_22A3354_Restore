@implementation HMDThreadNetworkMetadataStore

- (HMDThreadNetworkMetadataStore)init
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v2 = (void *)MEMORY[0x24BDBCE88];
  v3 = *MEMORY[0x24BDBCAB0];
  v4 = (void *)MEMORY[0x24BDD17C8];
  NSStringFromSelector(a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringWithFormat:", CFSTR("%@ is unavailable"), v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "exceptionWithName:reason:userInfo:", v3, v6, 0);
  v7 = (id)objc_claimAutoreleasedReturnValue();

  objc_exception_throw(v7);
}

- (id)initInternal
{
  HMDThreadNetworkMetadataStore *v2;
  const char *v3;
  NSObject *v4;
  NSObject *v5;
  dispatch_queue_t v6;
  OS_dispatch_queue *workQueue;
  const char *v8;
  NSObject *v9;
  NSObject *v10;
  dispatch_queue_t v11;
  OS_dispatch_queue *workQueueNetworkChanged;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)HMDThreadNetworkMetadataStore;
  v2 = -[HMDThreadNetworkMetadataStore init](&v14, sel_init);
  if (v2)
  {
    v3 = (const char *)HMFDispatchQueueName();
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v4 = objc_claimAutoreleasedReturnValue();
    dispatch_get_global_queue(17, 0);
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = dispatch_queue_create_with_target_V2(v3, v4, v5);
    workQueue = v2->_workQueue;
    v2->_workQueue = (OS_dispatch_queue *)v6;

    v8 = (const char *)HMFDispatchQueueName();
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v9 = objc_claimAutoreleasedReturnValue();
    dispatch_get_global_queue(9, 0);
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = dispatch_queue_create_with_target_V2(v8, v9, v10);
    workQueueNetworkChanged = v2->_workQueueNetworkChanged;
    v2->_workQueueNetworkChanged = (OS_dispatch_queue *)v11;

  }
  return v2;
}

- (void)retrieveMetadata:(id)a3 homeHasResident:(BOOL)a4 completion:(id)a5
{
  id v8;
  id v9;
  NSObject *v10;
  id v11;
  id v12;
  _QWORD v13[5];
  id v14;
  id v15;
  BOOL v16;

  v8 = a3;
  v9 = a5;
  -[HMDThreadNetworkMetadataStore workQueue](self, "workQueue");
  v10 = objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = __77__HMDThreadNetworkMetadataStore_retrieveMetadata_homeHasResident_completion___block_invoke;
  v13[3] = &unk_24E7962D8;
  v13[4] = self;
  v14 = v8;
  v16 = a4;
  v15 = v9;
  v11 = v9;
  v12 = v8;
  dispatch_async(v10, v13);

}

- (void)_retrieveMetadataOnThreadCapableController:(id)a3 threadClient:(id)a4 homeHasResident:(BOOL)a5 completion:(id)a6
{
  id v10;
  id v11;
  id v12;
  NSObject *v13;
  id v14;
  id v15;
  id v16;
  _QWORD v17[5];
  id v18;
  id v19;
  id v20;
  BOOL v21;

  v10 = a3;
  v11 = a4;
  v12 = a6;
  -[HMDThreadNetworkMetadataStore workQueue](self, "workQueue");
  v13 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v13);

  v17[0] = MEMORY[0x24BDAC760];
  v17[1] = 3221225472;
  v17[2] = __116__HMDThreadNetworkMetadataStore__retrieveMetadataOnThreadCapableController_threadClient_homeHasResident_completion___block_invoke;
  v17[3] = &unk_24E78DE00;
  v17[4] = self;
  v18 = v10;
  v19 = v11;
  v20 = v12;
  v21 = a5;
  v14 = v12;
  v15 = v11;
  v16 = v10;
  objc_msgSend(v15, "retrievePreferredNetworkWithNoScan:", v17);

}

- (void)_retrieveMetadataOnController:(id)a3 homeHasResident:(BOOL)a4 completion:(id)a5
{
  _BOOL8 v6;
  id v8;
  id v9;
  NSObject *v10;
  void *v11;
  int v12;
  uint64_t v13;
  void *v14;
  void *v15;
  HMDThreadNetworkMetadataStore *v16;
  NSObject *v17;
  void *v18;
  void *v19;
  _QWORD v20[5];
  id v21;
  uint64_t *v22;
  _QWORD v23[4];
  id v24;
  uint64_t *v25;
  uint64_t v26;
  uint64_t *v27;
  uint64_t v28;
  uint64_t (*v29)(uint64_t, uint64_t);
  void (*v30)(uint64_t);
  id v31;
  uint8_t buf[4];
  void *v33;
  uint64_t v34;

  v6 = a4;
  v34 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a5;
  -[HMDThreadNetworkMetadataStore workQueue](self, "workQueue");
  v10 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v10);

  v26 = 0;
  v27 = &v26;
  v28 = 0x3032000000;
  v29 = __Block_byref_object_copy__181748;
  v30 = __Block_byref_object_dispose__181749;
  v31 = (id)objc_msgSend(objc_alloc(MEMORY[0x24BDF6068]), "initWithKeychainAccessGroup:", CFSTR("com.apple.thread.network"));
  if (v27[5])
  {
    if (isFeatureMatteriPhoneOnlyPairingControlForThreadEnabled()
      && (+[HMDDeviceCapabilities deviceCapabilities](HMDDeviceCapabilities, "deviceCapabilities"),
          v11 = (void *)objc_claimAutoreleasedReturnValue(),
          v12 = objc_msgSend(v11, "supportsThreadService"),
          v11,
          v12))
    {
      v13 = v27[5];
      v23[0] = MEMORY[0x24BDAC760];
      v23[1] = 3221225472;
      v23[2] = __90__HMDThreadNetworkMetadataStore__retrieveMetadataOnController_homeHasResident_completion___block_invoke;
      v23[3] = &unk_24E78DE28;
      v24 = v9;
      v25 = &v26;
      -[HMDThreadNetworkMetadataStore _retrieveMetadataOnThreadCapableController:threadClient:homeHasResident:completion:](self, "_retrieveMetadataOnThreadCapableController:threadClient:homeHasResident:completion:", v8, v13, v6, v23);

    }
    else
    {
      v14 = (void *)v27[5];
      v20[0] = MEMORY[0x24BDAC760];
      v20[1] = 3221225472;
      v20[2] = __90__HMDThreadNetworkMetadataStore__retrieveMetadataOnController_homeHasResident_completion___block_invoke_2;
      v20[3] = &unk_24E78DE50;
      v20[4] = self;
      v21 = v9;
      v22 = &v26;
      objc_msgSend(v14, "retrievePreferredCredentialsInternally:", v20);

    }
  }
  else
  {
    v15 = (void *)MEMORY[0x227676638]();
    v16 = self;
    HMFGetOSLogHandle();
    v17 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v33 = v18;
      _os_log_impl(&dword_2218F0000, v17, OS_LOG_TYPE_ERROR, "%{public}@CoreThreadCommissionerService is not reachable.", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v15);
    objc_msgSend(MEMORY[0x24BDD1540], "hmErrorWithCode:", 58);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, _QWORD, void *))v9 + 2))(v9, 0, v19);

  }
  _Block_object_dispose(&v26, 8);

}

- (void)retrieveBorderRouterPreferredNetworkWithCompletion:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  -[HMDThreadNetworkMetadataStore workQueue](self, "workQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __84__HMDThreadNetworkMetadataStore_retrieveBorderRouterPreferredNetworkWithCompletion___block_invoke;
  v7[3] = &unk_24E79C2B8;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, v7);

}

- (void)_retrieveBorderRouterPreferredNetworkWithCompletion:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  HMDThreadNetworkMetadataStore *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  _QWORD v12[5];
  id v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t (*v18)(uint64_t, uint64_t);
  void (*v19)(uint64_t);
  id v20;
  uint8_t buf[4];
  void *v22;
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[HMDThreadNetworkMetadataStore workQueue](self, "workQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  v15 = 0;
  v16 = &v15;
  v17 = 0x3032000000;
  v18 = __Block_byref_object_copy__181748;
  v19 = __Block_byref_object_dispose__181749;
  v20 = (id)objc_msgSend(objc_alloc(MEMORY[0x24BDF6068]), "initWithKeychainAccessGroup:", CFSTR("com.apple.thread.network"));
  v6 = (void *)v16[5];
  if (v6)
  {
    v12[0] = MEMORY[0x24BDAC760];
    v12[1] = 3221225472;
    v12[2] = __85__HMDThreadNetworkMetadataStore__retrieveBorderRouterPreferredNetworkWithCompletion___block_invoke;
    v12[3] = &unk_24E78DE50;
    v12[4] = self;
    v13 = v4;
    v14 = &v15;
    objc_msgSend(v6, "retrievePreferredCredentialsInternally:", v12);

  }
  else
  {
    v7 = (void *)MEMORY[0x227676638]();
    v8 = self;
    HMFGetOSLogHandle();
    v9 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v22 = v10;
      _os_log_impl(&dword_2218F0000, v9, OS_LOG_TYPE_ERROR, "%{public}@CoreThreadCommissionerService is not reachable.", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v7);
    objc_msgSend(MEMORY[0x24BDD1540], "hmErrorWithCode:", 58);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, _QWORD, void *))v4 + 2))(v4, 0, v11);

  }
  _Block_object_dispose(&v15, 8);

}

- (void)_validateOperationalDatasetWithTHClient:(id)a3 operationalDataset:(id)a4 storeCachedAOD:(BOOL)a5 completion:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  _QWORD v16[5];
  id v17;
  id v18;
  id v19;
  BOOL v20;

  v10 = a3;
  v11 = a4;
  v12 = a6;
  v16[0] = MEMORY[0x24BDAC760];
  v16[1] = 3221225472;
  v16[2] = __118__HMDThreadNetworkMetadataStore__validateOperationalDatasetWithTHClient_operationalDataset_storeCachedAOD_completion___block_invoke;
  v16[3] = &unk_24E78DE78;
  v20 = a5;
  v16[4] = self;
  v17 = v10;
  v18 = v11;
  v19 = v12;
  v13 = v11;
  v14 = v10;
  v15 = v12;
  objc_msgSend(v14, "validateAODInternally:completion:", v13, v16);

}

- (void)retrievePreferredNetwork:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  -[HMDThreadNetworkMetadataStore workQueue](self, "workQueue");
  v8 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __69__HMDThreadNetworkMetadataStore_retrievePreferredNetwork_completion___block_invoke;
  block[3] = &unk_24E79B440;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(v8, block);

}

- (void)_retrievePreferredNetworkOnThreadCapableController:(id)a3 threadClient:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  id v12;
  id v13;
  id v14;
  _QWORD v15[5];
  id v16;
  id v17;
  id v18;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  -[HMDThreadNetworkMetadataStore workQueue](self, "workQueue");
  v11 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v11);

  v15[0] = MEMORY[0x24BDAC760];
  v15[1] = 3221225472;
  v15[2] = __108__HMDThreadNetworkMetadataStore__retrievePreferredNetworkOnThreadCapableController_threadClient_completion___block_invoke;
  v15[3] = &unk_24E78DEC8;
  v15[4] = self;
  v16 = v8;
  v17 = v9;
  v18 = v10;
  v12 = v10;
  v13 = v9;
  v14 = v8;
  objc_msgSend(v13, "retrievePreferredNetworkWithNoScan:", v15);

}

- (void)_retrievePreferredNetwork:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  int v10;
  void *v11;
  void *v12;
  HMDThreadNetworkMetadataStore *v13;
  NSObject *v14;
  void *v15;
  void *v16;
  void *v17;
  HMDThreadNetworkMetadataStore *v18;
  NSObject *v19;
  void *v20;
  void *v21;
  _QWORD v22[5];
  id v23;
  id v24;
  __int128 *v25;
  _QWORD v26[4];
  id v27;
  __int128 *p_buf;
  uint8_t v29[4];
  void *v30;
  __int128 buf;
  uint64_t v32;
  uint64_t (*v33)(uint64_t, uint64_t);
  void (*v34)(uint64_t);
  id v35;
  uint64_t v36;

  v36 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  -[HMDThreadNetworkMetadataStore workQueue](self, "workQueue");
  v8 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v8);

  if ((isFeatureMatteriPhoneOnlyPairingControlForThreadEnabled() & 1) != 0)
  {
    *(_QWORD *)&buf = 0;
    *((_QWORD *)&buf + 1) = &buf;
    v32 = 0x3032000000;
    v33 = __Block_byref_object_copy__181748;
    v34 = __Block_byref_object_dispose__181749;
    v35 = (id)objc_msgSend(objc_alloc(MEMORY[0x24BDF6068]), "initWithKeychainAccessGroup:", CFSTR("com.apple.thread.network"));
    if (*(_QWORD *)(*((_QWORD *)&buf + 1) + 40))
    {
      +[HMDDeviceCapabilities deviceCapabilities](HMDDeviceCapabilities, "deviceCapabilities");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v9, "supportsThreadService");

      v11 = *(void **)(*((_QWORD *)&buf + 1) + 40);
      if (v10)
      {
        v26[0] = MEMORY[0x24BDAC760];
        v26[1] = 3221225472;
        v26[2] = __70__HMDThreadNetworkMetadataStore__retrievePreferredNetwork_completion___block_invoke;
        v26[3] = &unk_24E78DEF0;
        v27 = v7;
        p_buf = &buf;
        -[HMDThreadNetworkMetadataStore _retrievePreferredNetworkOnThreadCapableController:threadClient:completion:](self, "_retrievePreferredNetworkOnThreadCapableController:threadClient:completion:", v6, v11, v26);

      }
      else
      {
        v22[0] = MEMORY[0x24BDAC760];
        v22[1] = 3221225472;
        v22[2] = __70__HMDThreadNetworkMetadataStore__retrievePreferredNetwork_completion___block_invoke_2;
        v22[3] = &unk_24E78DF40;
        v22[4] = self;
        v23 = v6;
        v25 = &buf;
        v24 = v7;
        objc_msgSend(v11, "retrievePreferredNetworkInternallyOnMdnsAndSig:", v22);

      }
    }
    else
    {
      v17 = (void *)MEMORY[0x227676638]();
      v18 = self;
      HMFGetOSLogHandle();
      v19 = (id)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)v29 = 138543362;
        v30 = v20;
        _os_log_impl(&dword_2218F0000, v19, OS_LOG_TYPE_ERROR, "%{public}@CoreThreadCommissionerService is not reachable.", v29, 0xCu);

      }
      objc_autoreleasePoolPop(v17);
      objc_msgSend(MEMORY[0x24BDD1540], "hmErrorWithCode:", 58);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      (*((void (**)(id, _QWORD, _QWORD, _QWORD, void *))v7 + 2))(v7, 0, 0, 0, v21);

    }
    _Block_object_dispose(&buf, 8);

  }
  else
  {
    v12 = (void *)MEMORY[0x227676638]();
    v13 = self;
    HMFGetOSLogHandle();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(buf) = 138543362;
      *(_QWORD *)((char *)&buf + 4) = v15;
      _os_log_impl(&dword_2218F0000, v14, OS_LOG_TYPE_ERROR, "%{public}@Cannot retrieve or generate thread preferred network on this platform", (uint8_t *)&buf, 0xCu);

    }
    objc_autoreleasePoolPop(v12);
    objc_msgSend(MEMORY[0x24BDD1540], "hmErrorWithCode:", 48);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, _QWORD, _QWORD, _QWORD, void *))v7 + 2))(v7, 0, 0, 0, v16);

  }
}

- (void)triggerPreferredNetworkUpdateWithCompletion:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  -[HMDThreadNetworkMetadataStore workQueueNetworkChanged](self, "workQueueNetworkChanged");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __77__HMDThreadNetworkMetadataStore_triggerPreferredNetworkUpdateWithCompletion___block_invoke;
  v7[3] = &unk_24E79C2B8;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, v7);

}

- (void)_scheduleTriggerPreferredNetworkUpdateWithCompletion:(id)a3
{
  id v4;
  NSObject *v5;
  dispatch_time_t v6;
  NSObject *v7;
  id v8;
  _QWORD block[5];
  id v10;
  dispatch_time_t v11;

  v4 = a3;
  -[HMDThreadNetworkMetadataStore workQueueNetworkChanged](self, "workQueueNetworkChanged");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  v6 = dispatch_time(0, 2000000000);
  -[HMDThreadNetworkMetadataStore setNetworkChangedHandlingLastUpdatedTime:](self, "setNetworkChangedHandlingLastUpdatedTime:", v6);
  -[HMDThreadNetworkMetadataStore workQueueNetworkChanged](self, "workQueueNetworkChanged");
  v7 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __86__HMDThreadNetworkMetadataStore__scheduleTriggerPreferredNetworkUpdateWithCompletion___block_invoke;
  block[3] = &unk_24E7980F8;
  v10 = v4;
  v11 = v6;
  block[4] = self;
  v8 = v4;
  dispatch_after(v6, v7, block);

}

- (void)_triggerPreferredNetworkUpdateWithCompletion:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  _QWORD v6[4];
  id v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t (*v12)(uint64_t, uint64_t);
  void (*v13)(uint64_t);
  id v14;

  v3 = a3;
  v9 = 0;
  v10 = &v9;
  v11 = 0x3032000000;
  v12 = __Block_byref_object_copy__181748;
  v13 = __Block_byref_object_dispose__181749;
  v14 = (id)objc_msgSend(objc_alloc(MEMORY[0x24BDF6068]), "initWithKeychainAccessGroup:", CFSTR("com.apple.thread.network"));
  v4 = (void *)v10[5];
  if (v4)
  {
    v6[0] = MEMORY[0x24BDAC760];
    v6[1] = 3221225472;
    v6[2] = __78__HMDThreadNetworkMetadataStore__triggerPreferredNetworkUpdateWithCompletion___block_invoke;
    v6[3] = &unk_24E78DF68;
    v7 = v3;
    v8 = &v9;
    objc_msgSend(v4, "updatePreferredCredentialsInternally:", v6);
    v5 = v7;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1540], "hmErrorWithCode:", 48);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, void *))v3 + 2))(v3, v5);
  }

  _Block_object_dispose(&v9, 8);
}

- (void)removePreferredNetworkWithCompletion:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  -[HMDThreadNetworkMetadataStore workQueue](self, "workQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __70__HMDThreadNetworkMetadataStore_removePreferredNetworkWithCompletion___block_invoke;
  v7[3] = &unk_24E79C2B8;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, v7);

}

- (void)_removePreferredNetworkWithCompletion:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  HMDThreadNetworkMetadataStore *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  _QWORD v12[5];
  id v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t (*v18)(uint64_t, uint64_t);
  void (*v19)(uint64_t);
  id v20;
  uint8_t buf[4];
  void *v22;
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[HMDThreadNetworkMetadataStore workQueue](self, "workQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  v15 = 0;
  v16 = &v15;
  v17 = 0x3032000000;
  v18 = __Block_byref_object_copy__181748;
  v19 = __Block_byref_object_dispose__181749;
  v20 = (id)objc_msgSend(objc_alloc(MEMORY[0x24BDF6068]), "initWithKeychainAccessGroup:", CFSTR("com.apple.thread.network"));
  v6 = (void *)v16[5];
  if (v6)
  {
    v12[0] = MEMORY[0x24BDAC760];
    v12[1] = 3221225472;
    v12[2] = __71__HMDThreadNetworkMetadataStore__removePreferredNetworkWithCompletion___block_invoke;
    v12[3] = &unk_24E78DF90;
    v12[4] = self;
    v13 = v4;
    v14 = &v15;
    objc_msgSend(v6, "ctcsDeletePreferredNetworkWithCompletion:", v12);

  }
  else
  {
    v7 = (void *)MEMORY[0x227676638]();
    v8 = self;
    HMFGetOSLogHandle();
    v9 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v22 = v10;
      _os_log_impl(&dword_2218F0000, v9, OS_LOG_TYPE_ERROR, "%{public}@CoreThreadCommissionerService is not reachable - cannot clear preferred thread credentials", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v7);
    objc_msgSend(MEMORY[0x24BDD1540], "hmErrorWithCode:", 52);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, void *))v4 + 2))(v4, v11);

  }
  _Block_object_dispose(&v15, 8);

}

- (void)checkIfThreadNetworkIsRunningWithCompletion:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  -[HMDThreadNetworkMetadataStore workQueue](self, "workQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __77__HMDThreadNetworkMetadataStore_checkIfThreadNetworkIsRunningWithCompletion___block_invoke;
  v7[3] = &unk_24E79C2B8;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, v7);

}

- (void)_checkIfThreadNetworkIsRunningWithCompletion:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  _QWORD v8[4];
  id v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t (*v14)(uint64_t, uint64_t);
  void (*v15)(uint64_t);
  id v16;

  v4 = a3;
  -[HMDThreadNetworkMetadataStore workQueue](self, "workQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  v11 = 0;
  v12 = &v11;
  v13 = 0x3032000000;
  v14 = __Block_byref_object_copy__181748;
  v15 = __Block_byref_object_dispose__181749;
  v16 = (id)objc_msgSend(objc_alloc(MEMORY[0x24BDF6068]), "initWithKeychainAccessGroup:", CFSTR("com.apple.thread.network"));
  v6 = (void *)v12[5];
  if (v6)
  {
    v8[0] = MEMORY[0x24BDAC760];
    v8[1] = 3221225472;
    v8[2] = __78__HMDThreadNetworkMetadataStore__checkIfThreadNetworkIsRunningWithCompletion___block_invoke;
    v8[3] = &unk_24E78DFB8;
    v9 = v4;
    v10 = &v11;
    objc_msgSend(v6, "retrievePreferredCredentialsInternally:", v8);
    v7 = v9;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1540], "hmErrorWithCode:", 58);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, _QWORD, void *))v4 + 2))(v4, 0, v7);
  }

  _Block_object_dispose(&v11, 8);
}

- (OS_dispatch_queue)workQueue
{
  return self->_workQueue;
}

- (OS_dispatch_queue)workQueueNetworkChanged
{
  return self->_workQueueNetworkChanged;
}

- (unint64_t)networkChangedHandlingLastUpdatedTime
{
  return self->_networkChangedHandlingLastUpdatedTime;
}

- (void)setNetworkChangedHandlingLastUpdatedTime:(unint64_t)a3
{
  self->_networkChangedHandlingLastUpdatedTime = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_workQueueNetworkChanged, 0);
  objc_storeStrong((id *)&self->_workQueue, 0);
}

uint64_t __78__HMDThreadNetworkMetadataStore__checkIfThreadNetworkIsRunningWithCompletion___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v5 = *(_QWORD *)(a1 + 32);
  if (!a3 || a4)
  {
    v6 = 0;
    v7 = a4;
  }
  else
  {
    v6 = 1;
    v7 = 0;
  }
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v5 + 16))(v5, v6, v7);
  return objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "invalidate");
}

uint64_t __77__HMDThreadNetworkMetadataStore_checkIfThreadNetworkIsRunningWithCompletion___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_checkIfThreadNetworkIsRunningWithCompletion:", *(_QWORD *)(a1 + 40));
}

void __71__HMDThreadNetworkMetadataStore__removePreferredNetworkWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  NSObject *v6;
  NSObject *v7;
  void *v8;
  const char *v9;
  NSObject *v10;
  os_log_type_t v11;
  uint32_t v12;
  uint64_t v13;
  uint64_t v14;
  int v15;
  void *v16;
  __int16 v17;
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  v4 = (void *)MEMORY[0x227676638]();
  v5 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v3)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = 138543618;
      v16 = v8;
      v17 = 2112;
      v18 = v3;
      v9 = "%{public}@Failed to clear preferred thread network credentials: %@";
      v10 = v7;
      v11 = OS_LOG_TYPE_ERROR;
      v12 = 22;
LABEL_6:
      _os_log_impl(&dword_2218F0000, v10, v11, v9, (uint8_t *)&v15, v12);

    }
  }
  else if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = 138543362;
    v16 = v8;
    v9 = "%{public}@Preferred thread network credentials cleared";
    v10 = v7;
    v11 = OS_LOG_TYPE_INFO;
    v12 = 12;
    goto LABEL_6;
  }

  objc_autoreleasePoolPop(v4);
  (*(void (**)(_QWORD, id, uint64_t, uint64_t))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), v3, v13, v14);
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "invalidate");

}

void __70__HMDThreadNetworkMetadataStore_removePreferredNetworkWithCompletion___block_invoke(uint64_t a1)
{
  void *v2;
  _QWORD v3[4];
  id v4;
  id v5;
  id location;

  objc_initWeak(&location, *(id *)(a1 + 32));
  v2 = *(void **)(a1 + 32);
  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = __70__HMDThreadNetworkMetadataStore_removePreferredNetworkWithCompletion___block_invoke_2;
  v3[3] = &unk_24E797698;
  objc_copyWeak(&v5, &location);
  v4 = *(id *)(a1 + 40);
  objc_msgSend(v2, "_removePreferredNetworkWithCompletion:", v3);

  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

void __70__HMDThreadNetworkMetadataStore_removePreferredNetworkWithCompletion___block_invoke_2(uint64_t a1, void *a2)
{
  id WeakRetained;
  void *v4;
  void *v5;
  id v6;

  v6 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v4 = _Block_copy(*(const void **)(a1 + 32));
  v5 = v4;
  if (v4)
    (*((void (**)(void *, id))v4 + 2))(v4, v6);

}

uint64_t __78__HMDThreadNetworkMetadataStore__triggerPreferredNetworkUpdateWithCompletion___block_invoke(uint64_t a1, int a2)
{
  uint64_t v3;
  void *v4;

  v3 = *(_QWORD *)(a1 + 32);
  if (a2)
  {
    (*(void (**)(_QWORD, _QWORD))(v3 + 16))(*(_QWORD *)(a1 + 32), 0);
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1540], "hmErrorWithCode:", 52);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *))(v3 + 16))(v3, v4);

  }
  return objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "invalidate");
}

void __86__HMDThreadNetworkMetadataStore__scheduleTriggerPreferredNetworkUpdateWithCompletion___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  uint64_t v4;
  id v5;
  _QWORD v6[4];
  id v7;

  v2 = *(_QWORD *)(a1 + 48);
  if (v2 == objc_msgSend(*(id *)(a1 + 32), "networkChangedHandlingLastUpdatedTime"))
  {
    v6[0] = MEMORY[0x24BDAC760];
    v6[1] = 3221225472;
    v6[2] = __86__HMDThreadNetworkMetadataStore__scheduleTriggerPreferredNetworkUpdateWithCompletion___block_invoke_2;
    v6[3] = &unk_24E79A050;
    v3 = *(void **)(a1 + 32);
    v7 = *(id *)(a1 + 40);
    objc_msgSend(v3, "_triggerPreferredNetworkUpdateWithCompletion:", v6);

  }
  else
  {
    v4 = *(_QWORD *)(a1 + 40);
    objc_msgSend(MEMORY[0x24BDD1540], "hmErrorWithCode:", 15);
    v5 = (id)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, id))(v4 + 16))(v4, v5);

  }
}

uint64_t __86__HMDThreadNetworkMetadataStore__scheduleTriggerPreferredNetworkUpdateWithCompletion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __77__HMDThreadNetworkMetadataStore_triggerPreferredNetworkUpdateWithCompletion___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  _QWORD v4[5];
  id v5;

  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __77__HMDThreadNetworkMetadataStore_triggerPreferredNetworkUpdateWithCompletion___block_invoke_2;
  v4[3] = &unk_24E79B3A0;
  v2 = *(void **)(a1 + 32);
  v3 = *(id *)(a1 + 40);
  v4[4] = *(_QWORD *)(a1 + 32);
  v5 = v3;
  objc_msgSend(v2, "_scheduleTriggerPreferredNetworkUpdateWithCompletion:", v4);

}

void __77__HMDThreadNetworkMetadataStore_triggerPreferredNetworkUpdateWithCompletion___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  id v5;

  v5 = a2;
  v3 = _Block_copy(*(const void **)(a1 + 40));
  v4 = v3;
  if (v3)
    (*((void (**)(void *, id))v3 + 2))(v3, v5);

}

uint64_t __70__HMDThreadNetworkMetadataStore__retrievePreferredNetwork_completion___block_invoke(uint64_t a1)
{
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  return objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "invalidate");
}

void __70__HMDThreadNetworkMetadataStore__retrievePreferredNetwork_completion___block_invoke_2(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  void *v10;
  id v11;
  NSObject *v12;
  NSObject *v13;
  void *v14;
  id v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  void *v29;
  void *v30;
  uint64_t v31;
  id v32;
  uint64_t v33;
  void *v34;
  _QWORD v35[4];
  id v36;
  id v37;
  uint64_t v38;
  uint8_t buf[4];
  void *v40;
  __int16 v41;
  id v42;
  __int16 v43;
  id v44;
  uint64_t v45;

  v45 = *MEMORY[0x24BDAC8D0];
  v7 = a2;
  v8 = a3;
  v9 = a4;
  v10 = (void *)MEMORY[0x227676638]();
  v11 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v12 = objc_claimAutoreleasedReturnValue();
  v13 = v12;
  if (!v8 || v9)
  {
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v40 = v27;
      v41 = 2112;
      v42 = v9;
      _os_log_impl(&dword_2218F0000, v13, OS_LOG_TYPE_ERROR, "%{public}@Failed to retrieve preferred thread network credentials record : %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v10);
    v28 = *(_QWORD *)(a1 + 40);
    if (v28)
    {
      v29 = *(void **)(a1 + 32);
      v30 = *(void **)(a1 + 48);
      v31 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40);
      v35[0] = MEMORY[0x24BDAC760];
      v35[1] = 3221225472;
      v35[2] = __70__HMDThreadNetworkMetadataStore__retrievePreferredNetwork_completion___block_invoke_25;
      v35[3] = &unk_24E78DF18;
      v37 = v30;
      v32 = *(id *)(a1 + 40);
      v33 = *(_QWORD *)(a1 + 56);
      v36 = v32;
      v38 = v33;
      objc_msgSend(v29, "_validateOperationalDatasetWithTHClient:operationalDataset:storeCachedAOD:completion:", v31, v28, 0, v35);

    }
    else
    {
      (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
      objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), "invalidate");
    }
  }
  else
  {
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
    {
      HMFGetLogIdentifier();
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v40 = v14;
      v41 = 2112;
      v42 = v7;
      v43 = 2112;
      v44 = v8;
      _os_log_impl(&dword_2218F0000, v13, OS_LOG_TYPE_DEBUG, "%{public}@retrievePreferredNetworkInternallyOnMdnsAndSig returned THCredential:%@, uuid %@", buf, 0x20u);

    }
    objc_autoreleasePoolPop(v10);
    v15 = objc_alloc(MEMORY[0x24BDD7A48]);
    objc_msgSend(v7, "networkName");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v7, "channel");
    objc_msgSend(v7, "panID");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "extendedPANID");
    v34 = v8;
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "networkKey");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "PSKC");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "activeOperationalDataSet");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = (void *)objc_msgSend(v15, "initWithName:channel:PANID:extendedPANID:masterKey:passPhrase:PSKc:operationalDataset:", v16, v17, v18, v19, v20, 0, v21, v22);

    v8 = v34;
    v24 = *(_QWORD *)(a1 + 48);
    objc_msgSend(v34, "UUIDString");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "activeOperationalDataSet");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *, void *, void *, _QWORD))(v24 + 16))(v24, v23, v25, v26, 0);

    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), "invalidate");
    v9 = 0;
  }

}

uint64_t __70__HMDThreadNetworkMetadataStore__retrievePreferredNetwork_completion___block_invoke_25(uint64_t a1)
{
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  return objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "invalidate");
}

void __108__HMDThreadNetworkMetadataStore__retrievePreferredNetworkOnThreadCapableController_threadClient_completion___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  void *v10;
  id v11;
  NSObject *v12;
  NSObject *v13;
  void *v14;
  id v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  void *v29;
  uint64_t v30;
  void *v31;
  _QWORD v32[4];
  id v33;
  id v34;
  uint8_t buf[4];
  void *v36;
  __int16 v37;
  id v38;
  __int16 v39;
  id v40;
  uint64_t v41;

  v41 = *MEMORY[0x24BDAC8D0];
  v7 = a2;
  v8 = a3;
  v9 = a4;
  v10 = (void *)MEMORY[0x227676638]();
  v11 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v12 = objc_claimAutoreleasedReturnValue();
  v13 = v12;
  if (!v8 || v9)
  {
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v36 = v27;
      v37 = 2112;
      v38 = v9;
      _os_log_impl(&dword_2218F0000, v13, OS_LOG_TYPE_ERROR, "%{public}@retrievePreferredNetworkWithNoScan failed : %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v10);
    v28 = *(_QWORD *)(a1 + 40);
    if (v28)
    {
      v29 = *(void **)(a1 + 32);
      v32[0] = MEMORY[0x24BDAC760];
      v32[1] = 3221225472;
      v32[2] = __108__HMDThreadNetworkMetadataStore__retrievePreferredNetworkOnThreadCapableController_threadClient_completion___block_invoke_24;
      v32[3] = &unk_24E790418;
      v30 = *(_QWORD *)(a1 + 48);
      v34 = *(id *)(a1 + 56);
      v33 = *(id *)(a1 + 40);
      objc_msgSend(v29, "_validateOperationalDatasetWithTHClient:operationalDataset:storeCachedAOD:completion:", v30, v28, 0, v32);

    }
    else
    {
      (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
    }
  }
  else
  {
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
    {
      HMFGetLogIdentifier();
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v36 = v14;
      v37 = 2112;
      v38 = v7;
      v39 = 2112;
      v40 = v8;
      _os_log_impl(&dword_2218F0000, v13, OS_LOG_TYPE_DEBUG, "%{public}@retrievePreferredNetworkWithNoScan returned THCredential:%@, uuid %@", buf, 0x20u);

    }
    objc_autoreleasePoolPop(v10);
    v15 = objc_alloc(MEMORY[0x24BDD7A48]);
    objc_msgSend(v7, "networkName");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v7, "channel");
    objc_msgSend(v7, "panID");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "extendedPANID");
    v31 = v8;
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "networkKey");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "PSKC");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "activeOperationalDataSet");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = (void *)objc_msgSend(v15, "initWithName:channel:PANID:extendedPANID:masterKey:passPhrase:PSKc:operationalDataset:", v16, v17, v18, v19, v20, 0, v21, v22);

    v8 = v31;
    v24 = *(_QWORD *)(a1 + 56);
    objc_msgSend(v31, "UUIDString");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "activeOperationalDataSet");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *, void *, void *, _QWORD))(v24 + 16))(v24, v23, v25, v26, 0);

    v9 = 0;
  }

}

uint64_t __108__HMDThreadNetworkMetadataStore__retrievePreferredNetworkOnThreadCapableController_threadClient_completion___block_invoke_24(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(_QWORD, uint64_t, _QWORD, _QWORD, uint64_t))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), a2, 0, *(_QWORD *)(a1 + 32), a3);
}

void __69__HMDThreadNetworkMetadataStore_retrievePreferredNetwork_completion___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  id v4;
  _QWORD v5[5];
  id v6;

  v2 = *(void **)(a1 + 32);
  v3 = *(_QWORD *)(a1 + 40);
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __69__HMDThreadNetworkMetadataStore_retrievePreferredNetwork_completion___block_invoke_2;
  v5[3] = &unk_24E78DEA0;
  v4 = *(id *)(a1 + 48);
  v5[4] = *(_QWORD *)(a1 + 32);
  v6 = v4;
  objc_msgSend(v2, "_retrievePreferredNetwork:completion:", v3, v5);

}

uint64_t __69__HMDThreadNetworkMetadataStore_retrievePreferredNetwork_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

void __118__HMDThreadNetworkMetadataStore__validateOperationalDatasetWithTHClient_operationalDataset_storeCachedAOD_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  id v8;
  NSObject *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  _QWORD v25[5];
  id v26;
  id v27;
  uint8_t buf[4];
  void *v29;
  __int16 v30;
  id v31;
  __int16 v32;
  id v33;
  uint64_t v34;

  v34 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  v7 = (void *)MEMORY[0x227676638]();
  v8 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (!v5 || v6)
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v29 = v24;
      v30 = 2112;
      v31 = v6;
      v32 = 2112;
      v33 = v5;
      _os_log_impl(&dword_2218F0000, v10, OS_LOG_TYPE_ERROR, "%{public}@Unexpected, operational dataset validation failed. Error: %@, credentials: %@", buf, 0x20u);

    }
    objc_autoreleasePoolPop(v7);
    (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
  }
  else
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      HMFBooleanToString();
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v29 = v11;
      v30 = 2112;
      v31 = v12;
      v32 = 2112;
      v33 = v5;
      _os_log_impl(&dword_2218F0000, v10, OS_LOG_TYPE_INFO, "%{public}@Operational dataset validation passed, store cached AOD: %@, THCredential:%@", buf, 0x20u);

    }
    objc_autoreleasePoolPop(v7);
    v13 = objc_alloc(MEMORY[0x24BDD7A48]);
    objc_msgSend(v5, "networkName");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v5, "channel");
    objc_msgSend(v5, "panID");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "extendedPANID");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "networkKey");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "PSKC");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "activeOperationalDataSet");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = (void *)objc_msgSend(v13, "initWithName:channel:PANID:extendedPANID:masterKey:passPhrase:PSKc:operationalDataset:", v14, v15, v16, v17, v18, 0, v19, v20);

    if (*(_BYTE *)(a1 + 64))
    {
      v25[0] = MEMORY[0x24BDAC760];
      v25[1] = 3221225472;
      v25[2] = __118__HMDThreadNetworkMetadataStore__validateOperationalDatasetWithTHClient_operationalDataset_storeCachedAOD_completion___block_invoke_20;
      v25[3] = &unk_24E79AB68;
      v22 = *(void **)(a1 + 40);
      v25[4] = *(_QWORD *)(a1 + 32);
      v23 = *(_QWORD *)(a1 + 48);
      v27 = *(id *)(a1 + 56);
      v26 = v21;
      objc_msgSend(v22, "storeCachedAODasPreferredNetwork:completion:", v23, v25);

    }
    else
    {
      (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
    }
    v6 = 0;

  }
}

void __118__HMDThreadNetworkMetadataStore__validateOperationalDatasetWithTHClient_operationalDataset_storeCachedAOD_completion___block_invoke_20(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  NSObject *v6;
  _BOOL4 v7;
  void *v8;
  const char *v9;
  NSObject *v10;
  uint32_t v11;
  uint64_t v12;
  int v13;
  void *v14;
  __int16 v15;
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  v4 = (void *)MEMORY[0x227676638]();
  v5 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = os_log_type_enabled(v6, OS_LOG_TYPE_INFO);
  if (v3)
  {
    if (v7)
    {
      HMFGetLogIdentifier();
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = 138543618;
      v14 = v8;
      v15 = 2112;
      v16 = v3;
      v9 = "%{public}@Failed to store cached AOD: %@, proceeding";
      v10 = v6;
      v11 = 22;
LABEL_6:
      _os_log_impl(&dword_2218F0000, v10, OS_LOG_TYPE_INFO, v9, (uint8_t *)&v13, v11);

    }
  }
  else if (v7)
  {
    HMFGetLogIdentifier();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = 138543362;
    v14 = v8;
    v9 = "%{public}@THClient storeCachedAODasPreferredNetwork successful";
    v10 = v6;
    v11 = 12;
    goto LABEL_6;
  }

  objc_autoreleasePoolPop(v4);
  (*(void (**)(_QWORD, _QWORD, _QWORD, uint64_t))(*(_QWORD *)(a1 + 48) + 16))(*(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 40), 0, v12);

}

void __85__HMDThreadNetworkMetadataStore__retrieveBorderRouterPreferredNetworkWithCompletion___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  NSObject *v20;
  void *v21;
  void *v22;
  unsigned int v23;
  id v24;
  uint8_t buf[4];
  void *v26;
  __int16 v27;
  void *v28;
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  v7 = a2;
  v8 = a3;
  v9 = a4;
  v10 = v9;
  if (!v8 || v9)
  {
    v18 = (void *)MEMORY[0x227676638]();
    v19 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v26 = v21;
      v27 = 2112;
      v28 = v10;
      _os_log_impl(&dword_2218F0000, v20, OS_LOG_TYPE_ERROR, "%{public}@Failed to retrieve preferred thread network credentials record : %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v18);
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "invalidate");
  }
  else
  {
    v24 = objc_alloc(MEMORY[0x24BDD7A48]);
    objc_msgSend(v7, "networkName");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = objc_msgSend(v7, "channel");
    objc_msgSend(v7, "panID");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "extendedPANID");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "networkKey");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "PSKC");
    v14 = v8;
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "activeOperationalDataSet");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = (void *)objc_msgSend(v24, "initWithName:channel:PANID:extendedPANID:masterKey:passPhrase:PSKc:operationalDataset:", v22, v23, v11, v12, v13, 0, v15, v16);

    v8 = v14;
    v10 = 0;

    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "invalidate");

  }
}

void __84__HMDThreadNetworkMetadataStore_retrieveBorderRouterPreferredNetworkWithCompletion___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  _QWORD v4[5];
  id v5;

  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __84__HMDThreadNetworkMetadataStore_retrieveBorderRouterPreferredNetworkWithCompletion___block_invoke_2;
  v4[3] = &unk_24E790418;
  v2 = *(void **)(a1 + 32);
  v3 = *(id *)(a1 + 40);
  v4[4] = *(_QWORD *)(a1 + 32);
  v5 = v3;
  objc_msgSend(v2, "_retrieveBorderRouterPreferredNetworkWithCompletion:", v4);

}

uint64_t __84__HMDThreadNetworkMetadataStore_retrieveBorderRouterPreferredNetworkWithCompletion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

uint64_t __90__HMDThreadNetworkMetadataStore__retrieveMetadataOnController_homeHasResident_completion___block_invoke(uint64_t a1)
{
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  return objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "invalidate");
}

void __90__HMDThreadNetworkMetadataStore__retrieveMetadataOnController_homeHasResident_completion___block_invoke_2(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  NSObject *v20;
  void *v21;
  void *v22;
  unsigned int v23;
  id v24;
  uint8_t buf[4];
  void *v26;
  __int16 v27;
  void *v28;
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  v7 = a2;
  v8 = a3;
  v9 = a4;
  v10 = v9;
  if (!v8 || v9)
  {
    v18 = (void *)MEMORY[0x227676638]();
    v19 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v26 = v21;
      v27 = 2112;
      v28 = v10;
      _os_log_impl(&dword_2218F0000, v20, OS_LOG_TYPE_ERROR, "%{public}@retrievePreferredCredentialsInternally failed : %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v18);
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "invalidate");
  }
  else
  {
    v24 = objc_alloc(MEMORY[0x24BDD7A48]);
    objc_msgSend(v7, "networkName");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = objc_msgSend(v7, "channel");
    objc_msgSend(v7, "panID");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "extendedPANID");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "networkKey");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "PSKC");
    v14 = v8;
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "activeOperationalDataSet");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = (void *)objc_msgSend(v24, "initWithName:channel:PANID:extendedPANID:masterKey:passPhrase:PSKc:operationalDataset:", v22, v23, v11, v12, v13, 0, v15, v16);

    v8 = v14;
    v10 = 0;

    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "invalidate");

  }
}

void __116__HMDThreadNetworkMetadataStore__retrieveMetadataOnThreadCapableController_threadClient_homeHasResident_completion___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  NSObject *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  _BOOL8 v24;
  uint64_t v25;
  void *v26;
  void *v27;
  void *v28;
  unsigned int v29;
  id v30;
  _QWORD v31[4];
  id v32;
  _QWORD v33[5];
  id v34;
  uint8_t buf[4];
  void *v36;
  __int16 v37;
  void *v38;
  uint64_t v39;

  v39 = *MEMORY[0x24BDAC8D0];
  v7 = a2;
  v8 = a3;
  v9 = a4;
  v10 = v9;
  if (!v8 || v9)
  {
    v18 = (void *)MEMORY[0x227676638]();
    v19 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v36 = v21;
      v37 = 2112;
      v38 = v10;
      _os_log_impl(&dword_2218F0000, v20, OS_LOG_TYPE_ERROR, "%{public}@retrievePreferredNetworkWithNoScan failed : %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v18);
    v22 = *(_QWORD *)(a1 + 40);
    if (v22)
    {
      v23 = *(void **)(a1 + 32);
      v24 = *(_BYTE *)(a1 + 64) == 0;
      v31[0] = MEMORY[0x24BDAC760];
      v31[1] = 3221225472;
      v31[2] = __116__HMDThreadNetworkMetadataStore__retrieveMetadataOnThreadCapableController_threadClient_homeHasResident_completion___block_invoke_16;
      v31[3] = &unk_24E78DDD8;
      v25 = *(_QWORD *)(a1 + 48);
      v32 = *(id *)(a1 + 56);
      objc_msgSend(v23, "_validateOperationalDatasetWithTHClient:operationalDataset:storeCachedAOD:completion:", v25, v22, v24, v31);
      v26 = v32;
    }
    else
    {
      v33[0] = MEMORY[0x24BDAC760];
      v33[1] = 3221225472;
      v33[2] = __116__HMDThreadNetworkMetadataStore__retrieveMetadataOnThreadCapableController_threadClient_homeHasResident_completion___block_invoke_13;
      v33[3] = &unk_24E78DDB0;
      v33[4] = *(_QWORD *)(a1 + 32);
      v27 = *(void **)(a1 + 48);
      v34 = *(id *)(a1 + 56);
      objc_msgSend(v27, "retrieveOrGeneratePreferredNetworkInternally:", v33);
      v26 = v34;
    }

  }
  else
  {
    v30 = objc_alloc(MEMORY[0x24BDD7A48]);
    objc_msgSend(v7, "networkName");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = objc_msgSend(v7, "channel");
    objc_msgSend(v7, "panID");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "extendedPANID");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "networkKey");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "PSKC");
    v14 = v8;
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "activeOperationalDataSet");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = (void *)objc_msgSend(v30, "initWithName:channel:PANID:extendedPANID:masterKey:passPhrase:PSKc:operationalDataset:", v28, v29, v11, v12, v13, 0, v15, v16);

    v10 = 0;
    v8 = v14;

    (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
  }

}

void __116__HMDThreadNetworkMetadataStore__retrieveMetadataOnThreadCapableController_threadClient_homeHasResident_completion___block_invoke_13(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  void *v10;
  id v11;
  NSObject *v12;
  NSObject *v13;
  void *v14;
  id v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  uint8_t buf[4];
  void *v28;
  __int16 v29;
  id v30;
  __int16 v31;
  id v32;
  uint64_t v33;

  v33 = *MEMORY[0x24BDAC8D0];
  v7 = a2;
  v8 = a3;
  v9 = a4;
  v10 = (void *)MEMORY[0x227676638]();
  v11 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v12 = objc_claimAutoreleasedReturnValue();
  v13 = v12;
  if (!v8 || v9)
  {
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v28 = v25;
      v29 = 2112;
      v30 = v9;
      _os_log_impl(&dword_2218F0000, v13, OS_LOG_TYPE_ERROR, "%{public}@retrieveOrGeneratePreferredNetworkInternally failed : %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v10);
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }
  else
  {
    v26 = a1;
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
    {
      HMFGetLogIdentifier();
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v28 = v14;
      v29 = 2112;
      v30 = v7;
      v31 = 2112;
      v32 = v8;
      _os_log_impl(&dword_2218F0000, v13, OS_LOG_TYPE_DEBUG, "%{public}@retrieveOrGeneratePreferredNetworkInternally returned THCredential:%@, uuid %@", buf, 0x20u);

    }
    objc_autoreleasePoolPop(v10);
    v15 = objc_alloc(MEMORY[0x24BDD7A48]);
    objc_msgSend(v7, "networkName");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v7, "channel");
    objc_msgSend(v7, "panID");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "extendedPANID");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "networkKey");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "PSKC");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "activeOperationalDataSet");
    v22 = v8;
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = (void *)objc_msgSend(v15, "initWithName:channel:PANID:extendedPANID:masterKey:passPhrase:PSKc:operationalDataset:", v16, v17, v18, v19, v20, 0, v21, v23);

    v8 = v22;
    (*(void (**)(void))(*(_QWORD *)(v26 + 40) + 16))();

    v9 = 0;
  }

}

uint64_t __116__HMDThreadNetworkMetadataStore__retrieveMetadataOnThreadCapableController_threadClient_homeHasResident_completion___block_invoke_16(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __77__HMDThreadNetworkMetadataStore_retrieveMetadata_homeHasResident_completion___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  id v5;
  _QWORD v6[5];
  id v7;

  v2 = *(void **)(a1 + 32);
  v3 = *(_QWORD *)(a1 + 40);
  v4 = *(unsigned __int8 *)(a1 + 56);
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __77__HMDThreadNetworkMetadataStore_retrieveMetadata_homeHasResident_completion___block_invoke_2;
  v6[3] = &unk_24E790418;
  v5 = *(id *)(a1 + 48);
  v6[4] = *(_QWORD *)(a1 + 32);
  v7 = v5;
  objc_msgSend(v2, "_retrieveMetadataOnController:homeHasResident:completion:", v3, v4, v6);

}

uint64_t __77__HMDThreadNetworkMetadataStore_retrieveMetadata_homeHasResident_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

+ (id)new
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v2 = (void *)MEMORY[0x24BDBCE88];
  v3 = *MEMORY[0x24BDBCAB0];
  v4 = (void *)MEMORY[0x24BDD17C8];
  NSStringFromSelector(a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringWithFormat:", CFSTR("%@ is unavailable"), v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "exceptionWithName:reason:userInfo:", v3, v6, 0);
  v7 = (id)objc_claimAutoreleasedReturnValue();

  objc_exception_throw(v7);
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t0_181805 != -1)
    dispatch_once(&logCategory__hmf_once_t0_181805, &__block_literal_global_181806);
  return (id)logCategory__hmf_once_v1_181807;
}

+ (HMDThreadNetworkMetadataStore)defaultStore
{
  id WeakRetained;
  void *v4;
  id v5;
  NSObject *v6;
  void *v7;
  NSObject *v8;
  void *v9;
  int v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  os_unfair_lock_lock_with_options();
  WeakRetained = objc_loadWeakRetained(&defaultStore_weakStore);
  v4 = (void *)MEMORY[0x227676638]();
  v5 = a1;
  if (WeakRetained)
  {
    HMFGetOSLogHandle();
    v6 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    {
      HMFGetLogIdentifier();
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = 138543362;
      v12 = v7;
      _os_log_impl(&dword_2218F0000, v6, OS_LOG_TYPE_DEBUG, "%{public}@Reusing existing store", (uint8_t *)&v11, 0xCu);

    }
    objc_autoreleasePoolPop(v4);
  }
  else
  {
    HMFGetOSLogHandle();
    v8 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    {
      HMFGetLogIdentifier();
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = 138543362;
      v12 = v9;
      _os_log_impl(&dword_2218F0000, v8, OS_LOG_TYPE_DEBUG, "%{public}@Creating new store", (uint8_t *)&v11, 0xCu);

    }
    objc_autoreleasePoolPop(v4);
    WeakRetained = -[HMDThreadNetworkMetadataStore initInternal]([HMDThreadNetworkMetadataStore alloc], "initInternal");
    objc_storeWeak(&defaultStore_weakStore, WeakRetained);
  }
  os_unfair_lock_unlock((os_unfair_lock_t)&defaultStore_lock);
  return (HMDThreadNetworkMetadataStore *)WeakRetained;
}

+ (HMDThreadNetworkMetadataStore)_testOnlyStore
{
  id WeakRetained;
  void *v4;
  id v5;
  NSObject *v6;
  void *v7;
  NSObject *v8;
  void *v9;
  int v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  os_unfair_lock_lock_with_options();
  WeakRetained = objc_loadWeakRetained(&_testOnlyStore_weakStore);
  v4 = (void *)MEMORY[0x227676638]();
  v5 = a1;
  if (WeakRetained)
  {
    HMFGetOSLogHandle();
    v6 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    {
      HMFGetLogIdentifier();
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = 138543362;
      v12 = v7;
      _os_log_impl(&dword_2218F0000, v6, OS_LOG_TYPE_DEBUG, "%{public}@Reusing existing store", (uint8_t *)&v11, 0xCu);

    }
    objc_autoreleasePoolPop(v4);
  }
  else
  {
    HMFGetOSLogHandle();
    v8 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    {
      HMFGetLogIdentifier();
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = 138543362;
      v12 = v9;
      _os_log_impl(&dword_2218F0000, v8, OS_LOG_TYPE_DEBUG, "%{public}@Creating new store", (uint8_t *)&v11, 0xCu);

    }
    objc_autoreleasePoolPop(v4);
    WeakRetained = -[HMDThreadNetworkMetadataStore initInternal]([HMDThreadNetworkMetadataStore alloc], "initInternal");
    objc_storeWeak(&_testOnlyStore_weakStore, WeakRetained);
  }
  os_unfair_lock_unlock((os_unfair_lock_t)&_testOnlyStore_lock);
  return (HMDThreadNetworkMetadataStore *)WeakRetained;
}

void __44__HMDThreadNetworkMetadataStore_logCategory__block_invoke()
{
  uint64_t v0;
  void *v1;

  HMFCreateOSLogHandle();
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)logCategory__hmf_once_v1_181807;
  logCategory__hmf_once_v1_181807 = v0;

}

@end
