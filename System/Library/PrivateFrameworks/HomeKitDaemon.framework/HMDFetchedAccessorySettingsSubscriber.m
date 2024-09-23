@implementation HMDFetchedAccessorySettingsSubscriber

- (HMDFetchedAccessorySettingsSubscriber)initWithWorkQueue:(id)a3 subscriptionProvider:(id)a4 keyPaths:(id)a5 homeUUID:(id)a6
{
  id v11;
  id v12;
  id v13;
  id v14;
  HMDFetchedAccessorySettingsSubscriber *v15;
  HMDFetchedAccessorySettingsSubscriber *v16;
  uint64_t v17;
  NSMutableDictionary *cachedSettings;
  uint64_t v19;
  NSArray *keyPaths;
  uint64_t v21;
  NSUUID *homeUUID;
  objc_super v24;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  v24.receiver = self;
  v24.super_class = (Class)HMDFetchedAccessorySettingsSubscriber;
  v15 = -[HMDFetchedAccessorySettingsSubscriber init](&v24, sel_init);
  v16 = v15;
  if (v15)
  {
    objc_storeWeak((id *)&v15->_subscriptionProvider, v12);
    objc_storeStrong((id *)&v16->_workQueue, a3);
    v16->_lock._os_unfair_lock_opaque = 0;
    v17 = objc_opt_new();
    cachedSettings = v16->_cachedSettings;
    v16->_cachedSettings = (NSMutableDictionary *)v17;

    v19 = objc_msgSend(v13, "copy");
    keyPaths = v16->_keyPaths;
    v16->_keyPaths = (NSArray *)v19;

    v21 = objc_msgSend(v14, "copy");
    homeUUID = v16->_homeUUID;
    v16->_homeUUID = (NSUUID *)v21;

  }
  return v16;
}

- (HMDFetchedAccessorySettingsSubscriberDelegate)delegate
{
  os_unfair_lock_s *p_lock;
  id WeakRetained;

  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  os_unfair_lock_unlock(p_lock);
  return (HMDFetchedAccessorySettingsSubscriberDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
  os_unfair_lock_s *p_lock;
  id v5;

  p_lock = &self->_lock;
  v5 = a3;
  os_unfair_lock_lock_with_options();
  objc_storeWeak((id *)&self->_delegate, v5);

  os_unfair_lock_unlock(p_lock);
}

- (void)subscribeToSettingsForAccessoryUUIDs:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  id WeakRetained;
  id v8;
  _QWORD v9[5];
  id v10;
  _QWORD v11[5];

  v4 = a3;
  v5 = MEMORY[0x24BDAC760];
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __78__HMDFetchedAccessorySettingsSubscriber_subscribeToSettingsForAccessoryUUIDs___block_invoke;
  v11[3] = &unk_24E78B5C0;
  v11[4] = self;
  objc_msgSend(v4, "na_flatMap:", v11);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (self)
    WeakRetained = objc_loadWeakRetained((id *)&self->_subscriptionProvider);
  else
    WeakRetained = 0;
  v9[0] = v5;
  v9[1] = 3221225472;
  v9[2] = __78__HMDFetchedAccessorySettingsSubscriber_subscribeToSettingsForAccessoryUUIDs___block_invoke_2;
  v9[3] = &unk_24E78B610;
  v9[4] = self;
  v10 = v4;
  v8 = v4;
  objc_msgSend(WeakRetained, "registerConsumer:topicFilters:completion:", self, v6, v9);

}

- (void)unsubscribeForAccessory:(id)a3
{
  const char *v4;
  id v5;
  id v6;
  SEL v7;
  id Property;
  void *v9;
  id WeakRetained;
  id v11;
  _QWORD v12[5];
  id v13;

  v5 = a3;
  if (self)
  {
    v6 = objc_getProperty(self, v4, 48, 1);
    Property = objc_getProperty(self, v7, 56, 1);
    -[HMDFetchedAccessorySettingsSubscriber topicsForKeyPaths:accessoryUUID:homeUUID:]((uint64_t)self, v6, v5, Property);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    WeakRetained = objc_loadWeakRetained((id *)&self->_subscriptionProvider);
  }
  else
  {
    -[HMDFetchedAccessorySettingsSubscriber topicsForKeyPaths:accessoryUUID:homeUUID:](0, 0, v5, 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    WeakRetained = 0;
  }
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __65__HMDFetchedAccessorySettingsSubscriber_unsubscribeForAccessory___block_invoke;
  v12[3] = &unk_24E79BCC8;
  v12[4] = self;
  v13 = v5;
  v11 = v5;
  objc_msgSend(WeakRetained, "unregisterConsumer:topicFilters:completion:", self, v9, v12);

}

- (void)unsubscribeToAllAccessories
{
  id WeakRetained;
  _QWORD v4[5];

  if (self)
    WeakRetained = objc_loadWeakRetained((id *)&self->_subscriptionProvider);
  else
    WeakRetained = 0;
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __68__HMDFetchedAccessorySettingsSubscriber_unsubscribeToAllAccessories__block_invoke;
  v4[3] = &unk_24E79BD80;
  v4[4] = self;
  objc_msgSend(WeakRetained, "unregisterConsumer:completion:", self, v4);

}

- (id)cachedSettingForAccessory:(id)a3 keyPath:(id)a4
{
  id v6;
  id v7;
  os_unfair_lock_s *p_lock;
  NSMutableDictionary *cachedSettings;
  void *v10;
  void *v11;

  v6 = a3;
  v7 = a4;
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  cachedSettings = self->_cachedSettings;
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@.%@"), v6, v7);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKeyedSubscript:](cachedSettings, "objectForKeyedSubscript:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  os_unfair_lock_unlock(p_lock);
  return v11;
}

- (void)didReceiveEvent:(id)a3 topic:(id)a4
{
  id v6;
  const char *v7;
  id v8;
  NSObject *Property;
  id v10;
  id v11;
  _QWORD block[5];
  id v13;
  id v14;

  v6 = a3;
  v8 = a4;
  if (self)
    Property = objc_getProperty(self, v7, 32, 1);
  else
    Property = 0;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __63__HMDFetchedAccessorySettingsSubscriber_didReceiveEvent_topic___block_invoke;
  block[3] = &unk_24E79BBD0;
  block[4] = self;
  v13 = v6;
  v14 = v8;
  v10 = v8;
  v11 = v6;
  dispatch_async(Property, block);

}

- (void)didReceiveCachedEvent:(id)a3 topic:(id)a4 source:(id)a5
{
  id v7;
  const char *v8;
  id v9;
  NSObject *Property;
  id v11;
  id v12;
  _QWORD block[5];
  id v14;
  id v15;

  v7 = a3;
  v9 = a4;
  if (self)
    Property = objc_getProperty(self, v8, 32, 1);
  else
    Property = 0;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __76__HMDFetchedAccessorySettingsSubscriber_didReceiveCachedEvent_topic_source___block_invoke;
  block[3] = &unk_24E79BBD0;
  block[4] = self;
  v14 = v7;
  v15 = v9;
  v11 = v9;
  v12 = v7;
  dispatch_async(Property, block);

}

- (id)logIdentifier
{
  void *v2;

  v2 = (void *)MEMORY[0x24BDD17C8];
  if (self)
    self = (HMDFetchedAccessorySettingsSubscriber *)objc_getProperty(self, a2, 56, 1);
  return (id)objc_msgSend(v2, "stringWithFormat:", CFSTR("%@"), self);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_homeUUID, 0);
  objc_storeStrong((id *)&self->_keyPaths, 0);
  objc_destroyWeak((id *)&self->_subscriptionProvider);
  objc_storeStrong((id *)&self->_workQueue, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_cachedSettings, 0);
}

void __76__HMDFetchedAccessorySettingsSubscriber_didReceiveCachedEvent_topic_source___block_invoke(void **a1)
{
  -[HMDFetchedAccessorySettingsSubscriber _didReceiveEvent:topic:](a1[4], a1[5], a1[6]);
}

- (void)_didReceiveEvent:(void *)a3 topic:
{
  id v5;
  const char *v6;
  id v7;
  NSObject *Property;
  void *v9;
  os_unfair_lock_s *v10;
  NSObject *v11;
  void *v12;
  int v13;
  id v14;
  id v15;
  id v16;
  void *v17;
  const char *v18;
  id v19;
  void *v20;
  os_unfair_lock_s *v21;
  NSObject *v22;
  void *v23;
  void *v24;
  os_unfair_lock_s *v25;
  NSObject *v26;
  void *v27;
  id v28;
  void *v29;
  char v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  id v36;
  void *v37;
  id v38;
  id v39;
  id v40;
  uint8_t buf[4];
  void *v42;
  __int16 v43;
  id v44;
  __int16 v45;
  id v46;
  __int16 v47;
  id v48;
  uint64_t v49;

  v49 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v7 = a3;
  if (a1)
  {
    Property = objc_getProperty(a1, v6, 32, 1);
    dispatch_assert_queue_V2(Property);
    v9 = (void *)MEMORY[0x227676638]();
    v10 = a1;
    HMFGetOSLogHandle();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    {
      HMFGetLogIdentifier();
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v42 = v12;
      v43 = 2112;
      v44 = v5;
      v45 = 2112;
      v46 = v7;
      _os_log_impl(&dword_2218F0000, v11, OS_LOG_TYPE_DEBUG, "%{public}@Received event:%@ for topic:%@", buf, 0x20u);

    }
    objc_autoreleasePoolPop(v9);
    v13 = HMImmutableSettingChangeEventComponentsFromTopic();
    v14 = 0;
    v15 = 0;
    v39 = 0;
    if (!v13)
    {
      v24 = (void *)MEMORY[0x227676638]();
      v25 = v10;
      HMFGetOSLogHandle();
      v26 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138544130;
        v42 = v27;
        v43 = 2112;
        v44 = v5;
        v45 = 2112;
        v46 = v14;
        v47 = 2112;
        v48 = v15;
        _os_log_impl(&dword_2218F0000, v26, OS_LOG_TYPE_ERROR, "%{public}@Received unknown event: %@ home: %@ target: %@", buf, 0x2Au);

      }
      objc_autoreleasePoolPop(v24);
      goto LABEL_18;
    }
    v16 = v5;
    v36 = v14;
    v37 = v16;
    v38 = v15;
    v40 = 0;
    objc_msgSend(MEMORY[0x24BDD7708], "decodeSettingFromEvent:error:", v16, &v40);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = v40;
    if (v19)
    {
      v20 = (void *)MEMORY[0x227676638]();
      v21 = v10;
      HMFGetOSLogHandle();
      v22 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        v42 = v23;
        v43 = 2112;
        v44 = v37;
        v45 = 2112;
        v46 = v19;
        _os_log_impl(&dword_2218F0000, v22, OS_LOG_TYPE_ERROR, "%{public}@Decode setting failed. event:%@ error:%@", buf, 0x20u);

      }
    }
    else
    {
      v28 = objc_getProperty(v10, v18, 48, 1);
      objc_msgSend(v17, "keyPath");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      v30 = objc_msgSend(v28, "containsObject:", v29);

      if ((v30 & 1) != 0)
      {
        os_unfair_lock_lock_with_options();
        v31 = *(void **)&v10[4]._os_unfair_lock_opaque;
        objc_msgSend(v17, "keyPath");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@.%@"), v38, v32);
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v31, "setObject:forKeyedSubscript:", v17, v33);

        os_unfair_lock_unlock(v10 + 2);
        -[os_unfair_lock_s delegate](v10, "delegate");
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v34, "didReceiveAccessorySetting:accessoryUUID:", v17, v38);

LABEL_17:
LABEL_18:

        goto LABEL_19;
      }
      v20 = (void *)MEMORY[0x227676638]();
      v21 = v10;
      HMFGetOSLogHandle();
      v22 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v42 = v35;
        v43 = 2112;
        v44 = v17;
        _os_log_impl(&dword_2218F0000, v22, OS_LOG_TYPE_ERROR, "%{public}@Unknown keyPath for setting:%@", buf, 0x16u);

      }
    }

    objc_autoreleasePoolPop(v20);
    goto LABEL_17;
  }
LABEL_19:

}

void __63__HMDFetchedAccessorySettingsSubscriber_didReceiveEvent_topic___block_invoke(void **a1)
{
  -[HMDFetchedAccessorySettingsSubscriber _didReceiveEvent:topic:](a1[4], a1[5], a1[6]);
}

void __68__HMDFetchedAccessorySettingsSubscriber_unsubscribeToAllAccessories__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  NSObject *v6;
  NSObject *v7;
  const char *v8;
  id v9;
  id v10;
  const char *v11;
  id Property;
  const char *v13;
  NSObject *v14;
  os_log_type_t v15;
  uint32_t v16;
  const char *v17;
  id v18;
  const char *v19;
  id v20;
  int v21;
  id v22;
  __int16 v23;
  id v24;
  __int16 v25;
  id v26;
  __int16 v27;
  id v28;
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
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
      v9 = (id)objc_claimAutoreleasedReturnValue();
      v10 = *(id *)(a1 + 32);
      if (v10)
      {
        Property = objc_getProperty(v10, v8, 48, 1);
        v10 = *(id *)(a1 + 32);
        if (v10)
          v10 = objc_getProperty(v10, v11, 56, 1);
      }
      else
      {
        Property = 0;
      }
      v21 = 138544130;
      v22 = v9;
      v23 = 2112;
      v24 = Property;
      v25 = 2112;
      v26 = v10;
      v27 = 2112;
      v28 = v3;
      v13 = "%{public}@Failed to unsubscribe to keyPaths:%@ homeUUID:%@ for all accessories with error:%@";
      v14 = v7;
      v15 = OS_LOG_TYPE_ERROR;
      v16 = 42;
LABEL_12:
      _os_log_impl(&dword_2218F0000, v14, v15, v13, (uint8_t *)&v21, v16);

    }
  }
  else if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v9 = (id)objc_claimAutoreleasedReturnValue();
    v18 = *(id *)(a1 + 32);
    if (v18)
    {
      v20 = objc_getProperty(v18, v17, 48, 1);
      v18 = *(id *)(a1 + 32);
      if (v18)
        v18 = objc_getProperty(v18, v19, 56, 1);
    }
    else
    {
      v20 = 0;
    }
    v21 = 138543874;
    v22 = v9;
    v23 = 2112;
    v24 = v20;
    v25 = 2112;
    v26 = v18;
    v13 = "%{public}@Unsubscribed to keyPaths:%@ homeUUID:%@ for all accessories";
    v14 = v7;
    v15 = OS_LOG_TYPE_INFO;
    v16 = 32;
    goto LABEL_12;
  }

  objc_autoreleasePoolPop(v4);
}

- (id)topicsForKeyPaths:(void *)a3 accessoryUUID:(void *)a4 homeUUID:
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  _QWORD v12[4];
  id v13;
  id v14;

  v7 = a3;
  v8 = a4;
  v9 = v8;
  if (a1)
  {
    v12[0] = MEMORY[0x24BDAC760];
    v12[1] = 3221225472;
    v12[2] = __82__HMDFetchedAccessorySettingsSubscriber_topicsForKeyPaths_accessoryUUID_homeUUID___block_invoke;
    v12[3] = &unk_24E79A8E8;
    v13 = v8;
    v14 = v7;
    objc_msgSend(a2, "na_map:", v12);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

void __65__HMDFetchedAccessorySettingsSubscriber_unsubscribeForAccessory___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  NSObject *v6;
  NSObject *v7;
  const char *v8;
  id v9;
  id v10;
  const char *v11;
  id Property;
  uint64_t v13;
  const char *v14;
  NSObject *v15;
  os_log_type_t v16;
  uint32_t v17;
  const char *v18;
  id v19;
  const char *v20;
  id v21;
  uint64_t v22;
  int v23;
  id v24;
  __int16 v25;
  id v26;
  __int16 v27;
  uint64_t v28;
  __int16 v29;
  id v30;
  __int16 v31;
  id v32;
  uint64_t v33;

  v33 = *MEMORY[0x24BDAC8D0];
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
      v9 = (id)objc_claimAutoreleasedReturnValue();
      v10 = *(id *)(a1 + 32);
      if (v10)
      {
        Property = objc_getProperty(v10, v8, 48, 1);
        v10 = *(id *)(a1 + 32);
        v13 = *(_QWORD *)(a1 + 40);
        if (v10)
          v10 = objc_getProperty(v10, v11, 56, 1);
      }
      else
      {
        Property = 0;
        v13 = *(_QWORD *)(a1 + 40);
      }
      v23 = 138544386;
      v24 = v9;
      v25 = 2112;
      v26 = Property;
      v27 = 2112;
      v28 = v13;
      v29 = 2112;
      v30 = v10;
      v31 = 2112;
      v32 = v3;
      v14 = "%{public}@Failed to unsubscribe to keyPaths:%@ accessories:%@ homeUUID:%@ with error:%@";
      v15 = v7;
      v16 = OS_LOG_TYPE_ERROR;
      v17 = 52;
LABEL_12:
      _os_log_impl(&dword_2218F0000, v15, v16, v14, (uint8_t *)&v23, v17);

    }
  }
  else if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v9 = (id)objc_claimAutoreleasedReturnValue();
    v19 = *(id *)(a1 + 32);
    if (v19)
    {
      v21 = objc_getProperty(v19, v18, 48, 1);
      v19 = *(id *)(a1 + 32);
      v22 = *(_QWORD *)(a1 + 40);
      if (v19)
        v19 = objc_getProperty(v19, v20, 56, 1);
    }
    else
    {
      v21 = 0;
      v22 = *(_QWORD *)(a1 + 40);
    }
    v23 = 138544130;
    v24 = v9;
    v25 = 2112;
    v26 = v21;
    v27 = 2112;
    v28 = v22;
    v29 = 2112;
    v30 = v19;
    v14 = "%{public}@Unsubscribed to keyPaths:%@ accessories:%@ homeUUID:%@";
    v15 = v7;
    v16 = OS_LOG_TYPE_INFO;
    v17 = 42;
    goto LABEL_12;
  }

  objc_autoreleasePoolPop(v4);
}

void __82__HMDFetchedAccessorySettingsSubscriber_topicsForKeyPaths_accessoryUUID_homeUUID___block_invoke()
{
  JUMPOUT(0x2276752E8);
}

id __78__HMDFetchedAccessorySettingsSubscriber_subscribeToSettingsForAccessoryUUIDs___block_invoke(uint64_t a1, void *a2)
{
  const char *v3;
  id v4;
  uint64_t v5;
  id Property;
  const char *v7;
  id v8;
  void *v9;
  id v10;
  void *v11;

  v4 = a2;
  v5 = *(_QWORD *)(a1 + 32);
  if (v5)
    Property = objc_getProperty(*(id *)(a1 + 32), v3, 48, 1);
  else
    Property = 0;
  v8 = Property;
  v9 = *(void **)(a1 + 32);
  if (v9)
    v10 = objc_getProperty(v9, v7, 56, 1);
  else
    v10 = 0;
  -[HMDFetchedAccessorySettingsSubscriber topicsForKeyPaths:accessoryUUID:homeUUID:](v5, v8, v4, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

void __78__HMDFetchedAccessorySettingsSubscriber_subscribeToSettingsForAccessoryUUIDs___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  id v8;
  NSObject *v9;
  NSObject *v10;
  const char *v11;
  id v12;
  id v13;
  const char *v14;
  id Property;
  uint64_t v16;
  const char *v17;
  NSObject *v18;
  os_log_type_t v19;
  uint32_t v20;
  const char *v21;
  id v22;
  const char *v23;
  id v24;
  uint64_t v25;
  _QWORD v26[5];
  uint8_t buf[4];
  id v28;
  __int16 v29;
  id v30;
  __int16 v31;
  uint64_t v32;
  __int16 v33;
  id v34;
  __int16 v35;
  id v36;
  uint64_t v37;

  v37 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  v7 = (void *)MEMORY[0x227676638]();
  v8 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v6)
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v12 = (id)objc_claimAutoreleasedReturnValue();
      v13 = *(id *)(a1 + 32);
      if (v13)
      {
        Property = objc_getProperty(v13, v11, 48, 1);
        v13 = *(id *)(a1 + 32);
        v16 = *(_QWORD *)(a1 + 40);
        if (v13)
          v13 = objc_getProperty(v13, v14, 56, 1);
      }
      else
      {
        Property = 0;
        v16 = *(_QWORD *)(a1 + 40);
      }
      *(_DWORD *)buf = 138544386;
      v28 = v12;
      v29 = 2112;
      v30 = Property;
      v31 = 2112;
      v32 = v16;
      v33 = 2112;
      v34 = v13;
      v35 = 2112;
      v36 = v6;
      v17 = "%{public}@Failed to subscribe to keyPaths:%@ accessories:%@ homeUUID:%@ with error:%@";
      v18 = v10;
      v19 = OS_LOG_TYPE_ERROR;
      v20 = 52;
LABEL_12:
      _os_log_impl(&dword_2218F0000, v18, v19, v17, buf, v20);

    }
  }
  else if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v12 = (id)objc_claimAutoreleasedReturnValue();
    v22 = *(id *)(a1 + 32);
    if (v22)
    {
      v24 = objc_getProperty(v22, v21, 48, 1);
      v22 = *(id *)(a1 + 32);
      v25 = *(_QWORD *)(a1 + 40);
      if (v22)
        v22 = objc_getProperty(v22, v23, 56, 1);
    }
    else
    {
      v24 = 0;
      v25 = *(_QWORD *)(a1 + 40);
    }
    *(_DWORD *)buf = 138544130;
    v28 = v12;
    v29 = 2112;
    v30 = v24;
    v31 = 2112;
    v32 = v25;
    v33 = 2112;
    v34 = v22;
    v17 = "%{public}@Subscribed to keyPaths:%@ accessories:%@ homeUUID:%@";
    v18 = v10;
    v19 = OS_LOG_TYPE_INFO;
    v20 = 42;
    goto LABEL_12;
  }

  objc_autoreleasePoolPop(v7);
  v26[0] = MEMORY[0x24BDAC760];
  v26[1] = 3221225472;
  v26[2] = __78__HMDFetchedAccessorySettingsSubscriber_subscribeToSettingsForAccessoryUUIDs___block_invoke_1;
  v26[3] = &unk_24E78B5E8;
  v26[4] = *(_QWORD *)(a1 + 32);
  objc_msgSend(v5, "na_each:", v26);

}

uint64_t __78__HMDFetchedAccessorySettingsSubscriber_subscribeToSettingsForAccessoryUUIDs___block_invoke_1(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(a1 + 32), "didReceiveEvent:topic:", a3, a2);
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t14_166429 != -1)
    dispatch_once(&logCategory__hmf_once_t14_166429, &__block_literal_global_166430);
  return (id)logCategory__hmf_once_v15_166431;
}

void __52__HMDFetchedAccessorySettingsSubscriber_logCategory__block_invoke()
{
  uint64_t v0;
  void *v1;

  HMFCreateOSLogHandle();
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)logCategory__hmf_once_v15_166431;
  logCategory__hmf_once_v15_166431 = v0;

}

@end
