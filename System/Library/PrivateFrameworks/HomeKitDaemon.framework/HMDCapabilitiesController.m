@implementation HMDCapabilitiesController

- (id)logIdentifier
{
  void *v2;
  void *v3;

  -[HMDCapabilitiesController accessoryUUID]((char *)self);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "UUIDString");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (HMDCapabilitiesController)initWithQueue:(id)a3 dataSource:(id)a4
{
  id v7;
  id v8;
  HMDCapabilitiesController *v9;
  HMDCapabilitiesController *v10;
  uint64_t v11;
  NSUUID *homeUUID;
  uint64_t v13;
  NSUUID *accessoryUUID;
  objc_super v16;

  v7 = a3;
  v8 = a4;
  v16.receiver = self;
  v16.super_class = (Class)HMDCapabilitiesController;
  v9 = -[HMDCapabilitiesController init](&v16, sel_init);
  v10 = v9;
  if (v9)
  {
    v9->_lock._os_unfair_lock_opaque = 0;
    objc_storeStrong((id *)&v9->_queue, a3);
    objc_storeWeak((id *)&v10->_dataSource, v8);
    objc_msgSend(v8, "currentAccessoryHomeUUID");
    v11 = objc_claimAutoreleasedReturnValue();
    homeUUID = v10->_homeUUID;
    v10->_homeUUID = (NSUUID *)v11;

    objc_msgSend(v8, "currentAccessoryUUID");
    v13 = objc_claimAutoreleasedReturnValue();
    accessoryUUID = v10->_accessoryUUID;
    v10->_accessoryUUID = (NSUUID *)v13;

  }
  -[HMDCapabilitiesController updateCurrentAccessoryCapabilities](v10, "updateCurrentAccessoryCapabilities");

  return v10;
}

- (void)updateCurrentAccessoryCapabilities
{
  id WeakRetained;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  HMDCapabilitiesController *v14;
  NSObject *v15;
  void *v16;
  NSObject *queue;
  id v18;
  id v19;
  void *v20;
  HMDCapabilitiesController *v21;
  NSObject *v22;
  void *v23;
  _QWORD block[5];
  id v25;
  id v26;
  uint8_t buf[4];
  void *v28;
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  if (self && (WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource)) != 0)
  {
    v4 = WeakRetained;
    objc_msgSend(WeakRetained, "createCurrentAccessoryCapabilities");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDCapabilitiesController _lastCachedAccessoryCapabilities]((uint64_t)self);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v6;
    if (v6 && objc_msgSend(v6, "isLocalEqual:", v5))
    {
      v8 = v7;

      v5 = v8;
    }
    objc_storeStrong((id *)&self->_currentAccessoryCapabilitiesInternal, v5);
    objc_msgSend(v4, "createCurrentResidentCapabilities");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDCapabilitiesController _lastCachedResidentCapabilities]((uint64_t)self);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v10;
    if (v10 && objc_msgSend(v10, "isLocalEqual:", v9))
    {
      v12 = v11;

      v9 = v12;
    }
    objc_storeStrong((id *)&self->_currentResidentCapabilitiesInternal, v9);
    v13 = (void *)MEMORY[0x227676638]();
    v14 = self;
    HMFGetOSLogHandle();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      HMFGetLogIdentifier();
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v28 = v16;
      _os_log_impl(&dword_2218F0000, v15, OS_LOG_TYPE_DEFAULT, "%{public}@Finished loading current capabilities", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v13);
    queue = v14->_queue;
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __63__HMDCapabilitiesController_updateCurrentAccessoryCapabilities__block_invoke;
    block[3] = &unk_24E79BBD0;
    block[4] = v14;
    v25 = v5;
    v26 = v9;
    v18 = v9;
    v19 = v5;
    dispatch_async(queue, block);

  }
  else
  {
    v20 = (void *)MEMORY[0x227676638]();
    v21 = self;
    HMFGetOSLogHandle();
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v28 = v23;
      _os_log_impl(&dword_2218F0000, v22, OS_LOG_TYPE_ERROR, "%{public}@Nil dataSource", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v20);
  }
}

- (HMAccessoryCapabilities)currentAccessoryCapabilitiesInternal
{
  os_unfair_lock_s *p_lock;
  HMAccessoryCapabilities *v4;

  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  v4 = self->_currentAccessoryCapabilitiesInternal;
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (void)setCurrentAccessoryCapabilitiesInternal:(id)a3
{
  HMAccessoryCapabilities *v4;
  HMAccessoryCapabilities *currentAccessoryCapabilitiesInternal;

  v4 = (HMAccessoryCapabilities *)a3;
  os_unfair_lock_lock_with_options();
  currentAccessoryCapabilitiesInternal = self->_currentAccessoryCapabilitiesInternal;
  self->_currentAccessoryCapabilitiesInternal = v4;

  os_unfair_lock_unlock(&self->_lock);
}

- (HMResidentCapabilities)currentResidentCapabilitiesInternal
{
  os_unfair_lock_s *p_lock;
  HMResidentCapabilities *v4;

  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  v4 = self->_currentResidentCapabilitiesInternal;
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (void)setCurrentResidentCapabilitiesInternal:(id)a3
{
  HMResidentCapabilities *v4;
  HMResidentCapabilities *currentResidentCapabilitiesInternal;

  v4 = (HMResidentCapabilities *)a3;
  os_unfair_lock_lock_with_options();
  currentResidentCapabilitiesInternal = self->_currentResidentCapabilitiesInternal;
  self->_currentResidentCapabilitiesInternal = v4;

  os_unfair_lock_unlock(&self->_lock);
}

- (id)encodedCurrentAccessoryCapabilities
{
  void *v2;
  void *v3;
  void *v4;

  -[HMDCapabilitiesController currentAccessoryCapabilitiesInternal](self, "currentAccessoryCapabilitiesInternal");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "pbCapabilities");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "data");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)encodedCurrentResidentCapabilities
{
  void *v2;
  void *v3;
  void *v4;

  -[HMDCapabilitiesController currentResidentCapabilitiesInternal](self, "currentResidentCapabilitiesInternal");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "pbCapabilities");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "data");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (void)currentAccessoryDidBecomeAvailable
{
  NSObject *queue;
  _QWORD block[5];

  if (self)
    queue = self->_queue;
  else
    queue = 0;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __63__HMDCapabilitiesController_currentAccessoryDidBecomeAvailable__block_invoke;
  block[3] = &unk_24E79C240;
  block[4] = self;
  dispatch_async(queue, block);
}

- (void)didRemoveCurrentAccessory:(id)a3
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
  v7[2] = __55__HMDCapabilitiesController_didRemoveCurrentAccessory___block_invoke;
  v7[3] = &unk_24E79C268;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(queue, v7);

}

- (BOOL)areCurrentAccessoryCapabilitiesPresentAndDifferent:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  int v7;

  v4 = a3;
  -[HMDCapabilitiesController _lastCachedAccessoryCapabilities]((uint64_t)self);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD7330]), "initWithProtoData:", v4);

  if (v5)
    v7 = objc_msgSend(v5, "isLocalEqual:", v6) ^ 1;
  else
    LOBYTE(v7) = 0;

  return v7;
}

- (BOOL)areCurrentResidentCapabilitiesPresentAndDifferent:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  int v7;

  v4 = a3;
  -[HMDCapabilitiesController _lastCachedResidentCapabilities]((uint64_t)self);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD7920]), "initWithProtoData:", v4);

  if (v5)
    v7 = objc_msgSend(v5, "isLocalEqual:", v6) ^ 1;
  else
    LOBYTE(v7) = 0;

  return v7;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_dataSource);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_currentResidentCapabilitiesInternal, 0);
  objc_storeStrong((id *)&self->_currentAccessoryCapabilitiesInternal, 0);
  objc_storeStrong((id *)&self->_accessoryUUID, 0);
  objc_storeStrong((id *)&self->_homeUUID, 0);
}

- (id)_lastCachedResidentCapabilities
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  id WeakRetained;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;

  if (a1)
  {
    v2 = (void *)MEMORY[0x24BDD73A0];
    v3 = *MEMORY[0x24BDD4BC0];
    -[HMDCapabilitiesController homeUUID]((char *)a1);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDCapabilitiesController accessoryUUID]((char *)a1);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "topicFromSuffixID:homeUUID:accessoryUUID:", v3, v4, v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
    objc_msgSend(WeakRetained, "eventStoreReadHandle");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "lastEventForTopic:", v6);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (v9)
    {
      v10 = objc_alloc(MEMORY[0x24BDD7920]);
      objc_msgSend(v9, "encodedData");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = (void *)objc_msgSend(v10, "initWithProtoData:", v11);

    }
    else
    {
      v12 = 0;
    }

  }
  else
  {
    v12 = 0;
  }
  return v12;
}

- (id)homeUUID
{
  id *v1;
  os_unfair_lock_s *v2;

  v1 = (id *)a1;
  if (a1)
  {
    v2 = (os_unfair_lock_s *)(a1 + 8);
    os_unfair_lock_lock_with_options();
    v1 = (id *)v1[2];
    os_unfair_lock_unlock(v2);
  }
  return v1;
}

- (id)accessoryUUID
{
  id *v1;
  os_unfair_lock_s *v2;

  v1 = (id *)a1;
  if (a1)
  {
    v2 = (os_unfair_lock_s *)(a1 + 8);
    os_unfair_lock_lock_with_options();
    v1 = (id *)v1[3];
    os_unfair_lock_unlock(v2);
  }
  return v1;
}

- (id)_lastCachedAccessoryCapabilities
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  id WeakRetained;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;

  if (a1)
  {
    v2 = (void *)MEMORY[0x24BDD73A0];
    v3 = *MEMORY[0x24BDD4B88];
    -[HMDCapabilitiesController homeUUID]((char *)a1);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDCapabilitiesController accessoryUUID]((char *)a1);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "topicFromSuffixID:homeUUID:accessoryUUID:", v3, v4, v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
    objc_msgSend(WeakRetained, "eventStoreReadHandle");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "lastEventForTopic:", v6);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (v9)
    {
      v10 = objc_alloc(MEMORY[0x24BDD7330]);
      objc_msgSend(v9, "encodedData");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = (void *)objc_msgSend(v10, "initWithProtoData:", v11);

    }
    else
    {
      v12 = 0;
    }

  }
  else
  {
    v12 = 0;
  }
  return v12;
}

void __55__HMDCapabilitiesController_didRemoveCurrentAccessory___block_invoke(uint64_t a1)
{
  void *v2;
  int v3;
  void *v4;
  id v5;
  NSObject *v6;
  void *v7;
  int v8;
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  -[HMDCapabilitiesController accessoryUUID](*(char **)(a1 + 32));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hmf_isEqualToUUID:", *(_QWORD *)(a1 + 40));

  if (v3)
  {
    v4 = (void *)MEMORY[0x227676638]();
    v5 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      HMFGetLogIdentifier();
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = 138543362;
      v9 = v7;
      _os_log_impl(&dword_2218F0000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@Reset accessory on removal", (uint8_t *)&v8, 0xCu);

    }
    objc_autoreleasePoolPop(v4);
    -[HMDCapabilitiesController setAccessoryUUID:](*(_QWORD *)(a1 + 32), 0);
    -[HMDCapabilitiesController setHomeUUID:](*(_QWORD *)(a1 + 32), 0);
  }
}

- (void)setAccessoryUUID:(uint64_t)a1
{
  uint64_t v3;
  void *v4;
  id v5;

  v5 = a2;
  if (a1)
  {
    os_unfair_lock_lock_with_options();
    v3 = objc_msgSend(v5, "copy");
    v4 = *(void **)(a1 + 24);
    *(_QWORD *)(a1 + 24) = v3;

    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 8));
  }

}

- (void)setHomeUUID:(uint64_t)a1
{
  uint64_t v3;
  void *v4;
  id v5;

  v5 = a2;
  if (a1)
  {
    os_unfair_lock_lock_with_options();
    v3 = objc_msgSend(v5, "copy");
    v4 = *(void **)(a1 + 16);
    *(_QWORD *)(a1 + 16) = v3;

    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 8));
  }

}

void __63__HMDCapabilitiesController_currentAccessoryDidBecomeAvailable__block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  NSObject *v4;
  void *v5;
  uint64_t v6;
  id WeakRetained;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  char v16;
  void *v17;
  id v18;
  NSObject *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  int v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  int v31;
  void *v32;
  void *v33;
  void *v34;
  int v35;
  void *v36;
  uint64_t v37;

  v37 = *MEMORY[0x24BDAC8D0];
  v2 = (void *)MEMORY[0x227676638]();
  v3 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v35 = 138543362;
    v36 = v5;
    _os_log_impl(&dword_2218F0000, v4, OS_LOG_TYPE_INFO, "%{public}@Current accessory available", (uint8_t *)&v35, 0xCu);

  }
  objc_autoreleasePoolPop(v2);
  v6 = *(_QWORD *)(a1 + 32);
  if (v6)
  {
    WeakRetained = objc_loadWeakRetained((id *)(v6 + 56));
    v8 = WeakRetained;
    if (WeakRetained)
    {
      objc_msgSend(WeakRetained, "currentAccessoryHomeUUID");
      v9 = objc_claimAutoreleasedReturnValue();
      if (v9)
      {
        v10 = (void *)v9;
        objc_msgSend(v8, "currentAccessoryUUID");
        v11 = (void *)objc_claimAutoreleasedReturnValue();

        if (v11)
        {
          -[HMDCapabilitiesController homeUUID](*(char **)(a1 + 32));
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "currentAccessoryHomeUUID");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          if ((objc_msgSend(v12, "hmf_isEqualToUUID:", v13) & 1) != 0)
          {
            -[HMDCapabilitiesController accessoryUUID](*(char **)(a1 + 32));
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v8, "currentAccessoryUUID");
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            v16 = objc_msgSend(v14, "hmf_isEqualToUUID:", v15);

            if ((v16 & 1) != 0)
              goto LABEL_24;
          }
          else
          {

          }
          v17 = (void *)MEMORY[0x227676638]();
          v18 = *(id *)(a1 + 32);
          HMFGetOSLogHandle();
          v19 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
          {
            HMFGetLogIdentifier();
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            v35 = 138543362;
            v36 = v20;
            _os_log_impl(&dword_2218F0000, v19, OS_LOG_TYPE_DEFAULT, "%{public}@Current accessory became available and is different", (uint8_t *)&v35, 0xCu);

          }
          objc_autoreleasePoolPop(v17);
          objc_msgSend(v8, "currentAccessoryHomeUUID");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          -[HMDCapabilitiesController setHomeUUID:](*(_QWORD *)(a1 + 32), v21);

          objc_msgSend(v8, "currentAccessoryUUID");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          -[HMDCapabilitiesController setAccessoryUUID:](*(_QWORD *)(a1 + 32), v22);

          -[HMDCapabilitiesController _lastCachedAccessoryCapabilities](*(_QWORD *)(a1 + 32));
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          if (v23)
          {
            objc_msgSend(*(id *)(a1 + 32), "currentAccessoryCapabilitiesInternal");
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            v25 = objc_msgSend(v23, "isLocalEqual:", v24);

            if (v25)
              objc_msgSend(*(id *)(a1 + 32), "setCurrentAccessoryCapabilitiesInternal:", v23);
          }
          objc_msgSend(*(id *)(a1 + 32), "currentAccessoryCapabilitiesInternal");
          v26 = (void *)objc_claimAutoreleasedReturnValue();

          if (v26)
          {
            v27 = *(void **)(a1 + 32);
            objc_msgSend(v27, "currentAccessoryCapabilitiesInternal");
            v28 = (void *)objc_claimAutoreleasedReturnValue();
            -[HMDCapabilitiesController _postCurrentAccessoryCapabilitiesEventIfNeeded:]((uint64_t)v27, v28);

          }
          -[HMDCapabilitiesController _lastCachedResidentCapabilities](*(_QWORD *)(a1 + 32));
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          if (v29)
          {
            objc_msgSend(*(id *)(a1 + 32), "currentResidentCapabilitiesInternal");
            v30 = (void *)objc_claimAutoreleasedReturnValue();
            v31 = objc_msgSend(v29, "isLocalEqual:", v30);

            if (v31)
              objc_msgSend(*(id *)(a1 + 32), "setCurrentResidentCapabilitiesInternal:", v29);
          }
          objc_msgSend(*(id *)(a1 + 32), "currentResidentCapabilitiesInternal");
          v32 = (void *)objc_claimAutoreleasedReturnValue();

          if (v32)
          {
            v33 = *(void **)(a1 + 32);
            objc_msgSend(v33, "currentResidentCapabilitiesInternal");
            v34 = (void *)objc_claimAutoreleasedReturnValue();
            -[HMDCapabilitiesController _postCurrentResidentCapabilitiesEventIfNeeded:]((uint64_t)v33, v34);

          }
        }
      }
    }
  }
  else
  {
    v8 = 0;
  }
LABEL_24:

}

- (void)_postCurrentAccessoryCapabilitiesEventIfNeeded:(uint64_t)a1
{
  id v3;
  id WeakRetained;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  char v14;
  void *v15;
  id v16;
  NSObject *v17;
  NSObject *v18;
  void *v19;
  void *v20;
  id v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  _QWORD v27[5];
  uint8_t buf[4];
  void *v29;
  __int16 v30;
  id v31;
  uint64_t v32;

  v32 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  if (a1)
  {
    dispatch_assert_queue_V2(*(dispatch_queue_t *)(a1 + 48));
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
    if (WeakRetained)
    {
      -[HMDCapabilitiesController homeUUID]((char *)a1);
      v5 = objc_claimAutoreleasedReturnValue();
      if (v5)
      {
        v6 = (void *)v5;
        -[HMDCapabilitiesController accessoryUUID]((char *)a1);
        v7 = (void *)objc_claimAutoreleasedReturnValue();

        if (v7)
        {
          v8 = (void *)MEMORY[0x24BDD73A0];
          v9 = *MEMORY[0x24BDD4B88];
          -[HMDCapabilitiesController homeUUID]((char *)a1);
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          -[HMDCapabilitiesController accessoryUUID]((char *)a1);
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "topicFromSuffixID:homeUUID:accessoryUUID:", v9, v10, v11);
          v12 = (void *)objc_claimAutoreleasedReturnValue();

          -[HMDCapabilitiesController _lastCachedAccessoryCapabilities](a1);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          v14 = objc_msgSend(v3, "isLocalEqual:", v13);
          v15 = (void *)MEMORY[0x227676638]();
          v16 = (id)a1;
          HMFGetOSLogHandle();
          v17 = objc_claimAutoreleasedReturnValue();
          v18 = v17;
          if ((v14 & 1) != 0)
          {
            if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
            {
              HMFGetLogIdentifier();
              v19 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138543618;
              v29 = v19;
              v30 = 2112;
              v31 = v3;
              _os_log_impl(&dword_2218F0000, v18, OS_LOG_TYPE_INFO, "%{public}@Accessory capabilities are the same not posting: %@", buf, 0x16u);

            }
            objc_autoreleasePoolPop(v15);
          }
          else
          {
            if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
            {
              HMFGetLogIdentifier();
              v20 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138543618;
              v29 = v20;
              v30 = 2112;
              v31 = v3;
              _os_log_impl(&dword_2218F0000, v18, OS_LOG_TYPE_DEFAULT, "%{public}@Posting event as current accessory capabilities are different: %@", buf, 0x16u);

            }
            objc_autoreleasePoolPop(v15);
            v21 = objc_alloc(MEMORY[0x24BE4ED80]);
            objc_msgSend(v3, "pbCapabilities");
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v22, "data");
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            -[HMDCapabilitiesController _metadataForEvent]((char *)v16);
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            v25 = (void *)objc_msgSend(v21, "initWithEventData:metadata:", v23, v24);

            objc_msgSend(WeakRetained, "eventForwarder");
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            v27[0] = MEMORY[0x24BDAC760];
            v27[1] = 3221225472;
            v27[2] = __76__HMDCapabilitiesController__postCurrentAccessoryCapabilitiesEventIfNeeded___block_invoke;
            v27[3] = &unk_24E79BD80;
            v27[4] = v16;
            objc_msgSend(v26, "forwardEvent:topic:completion:", v25, v12, v27);

          }
        }
      }
    }

  }
}

- (void)_postCurrentResidentCapabilitiesEventIfNeeded:(uint64_t)a1
{
  id v3;
  id WeakRetained;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  NSObject *v16;
  void *v17;
  void *v18;
  id v19;
  NSObject *v20;
  void *v21;
  id v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  _QWORD v28[5];
  uint8_t buf[4];
  void *v30;
  __int16 v31;
  id v32;
  uint64_t v33;

  v33 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  if (a1)
  {
    dispatch_assert_queue_V2(*(dispatch_queue_t *)(a1 + 48));
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
    if (WeakRetained)
    {
      -[HMDCapabilitiesController homeUUID]((char *)a1);
      v5 = objc_claimAutoreleasedReturnValue();
      if (v5)
      {
        v6 = (void *)v5;
        -[HMDCapabilitiesController accessoryUUID]((char *)a1);
        v7 = (void *)objc_claimAutoreleasedReturnValue();

        if (v7)
        {
          v8 = (void *)MEMORY[0x24BDD73A0];
          v9 = *MEMORY[0x24BDD4BC0];
          -[HMDCapabilitiesController homeUUID]((char *)a1);
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          -[HMDCapabilitiesController accessoryUUID]((char *)a1);
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "topicFromSuffixID:homeUUID:accessoryUUID:", v9, v10, v11);
          v12 = (void *)objc_claimAutoreleasedReturnValue();

          -[HMDCapabilitiesController _lastCachedResidentCapabilities](a1);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          if ((objc_msgSend(v3, "isLocalEqual:", v13) & 1) != 0)
          {
            if (v3)
            {
              v14 = (void *)MEMORY[0x227676638]();
              v15 = (id)a1;
              HMFGetOSLogHandle();
              v16 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
              {
                HMFGetLogIdentifier();
                v17 = (void *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = 138543618;
                v30 = v17;
                v31 = 2112;
                v32 = v3;
                _os_log_impl(&dword_2218F0000, v16, OS_LOG_TYPE_INFO, "%{public}@Resident capabilities are the same not posting: %@", buf, 0x16u);

              }
              objc_autoreleasePoolPop(v14);
            }
          }
          else
          {
            v18 = (void *)MEMORY[0x227676638]();
            v19 = (id)a1;
            HMFGetOSLogHandle();
            v20 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
            {
              HMFGetLogIdentifier();
              v21 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138543618;
              v30 = v21;
              v31 = 2112;
              v32 = v3;
              _os_log_impl(&dword_2218F0000, v20, OS_LOG_TYPE_DEFAULT, "%{public}@Posting event as current resident capabilities are different: %@", buf, 0x16u);

            }
            objc_autoreleasePoolPop(v18);
            v22 = objc_alloc(MEMORY[0x24BE4ED80]);
            objc_msgSend(v3, "pbCapabilities");
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v23, "data");
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            -[HMDCapabilitiesController _metadataForEvent]((char *)v19);
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            v26 = (void *)objc_msgSend(v22, "initWithEventData:metadata:", v24, v25);

            objc_msgSend(WeakRetained, "eventForwarder");
            v27 = (void *)objc_claimAutoreleasedReturnValue();
            v28[0] = MEMORY[0x24BDAC760];
            v28[1] = 3221225472;
            v28[2] = __75__HMDCapabilitiesController__postCurrentResidentCapabilitiesEventIfNeeded___block_invoke;
            v28[3] = &unk_24E79BD80;
            v28[4] = v19;
            objc_msgSend(v27, "forwardEvent:topic:completion:", v26, v12, v28);

          }
        }
      }
    }

  }
}

- (id)_metadataForEvent
{
  id v2;
  void *v3;
  void *v4;
  void *v5;

  v2 = objc_alloc(MEMORY[0x24BE4ED90]);
  -[HMDCapabilitiesController accessoryUUID](a1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "UUIDString");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCE60], "timeIntervalSinceReferenceDate");
  v5 = (void *)objc_msgSend(v2, "initWithSource:cachePolicy:combineType:timestamp:", v4, 2, 2);

  return v5;
}

void __75__HMDCapabilitiesController__postCurrentResidentCapabilitiesEventIfNeeded___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  NSObject *v6;
  void *v7;
  int v8;
  void *v9;
  __int16 v10;
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  v4 = (void *)MEMORY[0x227676638]();
  v5 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = 138543618;
    v9 = v7;
    v10 = 2112;
    v11 = v3;
    _os_log_impl(&dword_2218F0000, v6, OS_LOG_TYPE_INFO, "%{public}@Posted event for current resident capabilities error: %@", (uint8_t *)&v8, 0x16u);

  }
  objc_autoreleasePoolPop(v4);

}

void __76__HMDCapabilitiesController__postCurrentAccessoryCapabilitiesEventIfNeeded___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  NSObject *v6;
  void *v7;
  int v8;
  void *v9;
  __int16 v10;
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  v4 = (void *)MEMORY[0x227676638]();
  v5 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = 138543618;
    v9 = v7;
    v10 = 2112;
    v11 = v3;
    _os_log_impl(&dword_2218F0000, v6, OS_LOG_TYPE_INFO, "%{public}@Posted event for current accessory capabilities error: %@", (uint8_t *)&v8, 0x16u);

  }
  objc_autoreleasePoolPop(v4);

}

void __63__HMDCapabilitiesController_updateCurrentAccessoryCapabilities__block_invoke(uint64_t a1)
{
  -[HMDCapabilitiesController _postCurrentAccessoryCapabilitiesEventIfNeeded:](*(_QWORD *)(a1 + 32), *(void **)(a1 + 40));
  -[HMDCapabilitiesController _postCurrentResidentCapabilitiesEventIfNeeded:](*(_QWORD *)(a1 + 32), *(void **)(a1 + 48));
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t0_62099 != -1)
    dispatch_once(&logCategory__hmf_once_t0_62099, &__block_literal_global_62100);
  return (id)logCategory__hmf_once_v1_62101;
}

void __40__HMDCapabilitiesController_logCategory__block_invoke()
{
  uint64_t v0;
  void *v1;

  HMFCreateOSLogHandle();
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)logCategory__hmf_once_v1_62101;
  logCategory__hmf_once_v1_62101 = v0;

}

@end
