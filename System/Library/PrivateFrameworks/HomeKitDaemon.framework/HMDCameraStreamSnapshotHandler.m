@implementation HMDCameraStreamSnapshotHandler

- (HMDCameraStreamSnapshotHandler)initWithWorkQueue:(id)a3 services:(id)a4 logID:(id)a5
{
  id v9;
  id v10;
  id v11;
  HMDCameraStreamSnapshotHandler *v12;
  HMDCameraStreamSnapshotHandler *v13;
  uint64_t v14;
  NSMutableSet *streamSnapshotCaptures;
  uint64_t v16;
  NSMutableSet *retiredStreamSnapshotCaptures;
  uint64_t v18;
  NSMutableDictionary *serviceInstanceStreamStatus;
  uint64_t v20;
  NSMapTable *delegateTable;
  id v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  NSMutableDictionary *v28;
  void *v29;
  id v31;
  id v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  objc_super v37;
  _BYTE v38[128];
  uint64_t v39;

  v39 = *MEMORY[0x24BDAC8D0];
  v9 = a3;
  v10 = a4;
  v11 = a5;
  v37.receiver = self;
  v37.super_class = (Class)HMDCameraStreamSnapshotHandler;
  v12 = -[HMDCameraStreamSnapshotHandler init](&v37, sel_init);
  v13 = v12;
  if (v12)
  {
    v31 = v11;
    v32 = v9;
    v12->_lock._os_unfair_lock_opaque = 0;
    objc_storeStrong((id *)&v12->_workQueue, a3);
    objc_msgSend(MEMORY[0x24BDBCEF0], "set");
    v14 = objc_claimAutoreleasedReturnValue();
    streamSnapshotCaptures = v13->_streamSnapshotCaptures;
    v13->_streamSnapshotCaptures = (NSMutableSet *)v14;

    objc_msgSend(MEMORY[0x24BDBCEF0], "set");
    v16 = objc_claimAutoreleasedReturnValue();
    retiredStreamSnapshotCaptures = v13->_retiredStreamSnapshotCaptures;
    v13->_retiredStreamSnapshotCaptures = (NSMutableSet *)v16;

    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v18 = objc_claimAutoreleasedReturnValue();
    serviceInstanceStreamStatus = v13->_serviceInstanceStreamStatus;
    v13->_serviceInstanceStreamStatus = (NSMutableDictionary *)v18;

    objc_storeStrong((id *)&v13->_logIdentifier, a5);
    objc_msgSend(MEMORY[0x24BDD1650], "weakToStrongObjectsMapTable");
    v20 = objc_claimAutoreleasedReturnValue();
    delegateTable = v13->_delegateTable;
    v13->_delegateTable = (NSMapTable *)v20;

    v35 = 0u;
    v36 = 0u;
    v33 = 0u;
    v34 = 0u;
    v22 = v10;
    v23 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v33, v38, 16);
    if (v23)
    {
      v24 = v23;
      v25 = *(_QWORD *)v34;
      v26 = MEMORY[0x24BDBD1C0];
      do
      {
        v27 = 0;
        do
        {
          if (*(_QWORD *)v34 != v25)
            objc_enumerationMutation(v22);
          v28 = v13->_serviceInstanceStreamStatus;
          objc_msgSend(*(id *)(*((_QWORD *)&v33 + 1) + 8 * v27), "instanceID", v31, v32, (_QWORD)v33);
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSMutableDictionary setObject:forKeyedSubscript:](v28, "setObject:forKeyedSubscript:", v26, v29);

          ++v27;
        }
        while (v24 != v27);
        v24 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v33, v38, 16);
      }
      while (v24);
    }

    v11 = v31;
    v9 = v32;
  }

  return v13;
}

- (void)addDelegate:(id)a3 delegateQueue:(id)a4
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
  block[2] = __60__HMDCameraStreamSnapshotHandler_addDelegate_delegateQueue___block_invoke;
  block[3] = &unk_24E79BBD0;
  block[4] = self;
  v13 = v8;
  v14 = v6;
  v10 = v6;
  v11 = v8;
  dispatch_async(Property, block);

}

- (void)removeDelegate:(id)a3
{
  const char *v4;
  id v5;
  NSObject *Property;
  id v7;
  _QWORD v8[5];
  id v9;

  v5 = a3;
  if (self)
    Property = objc_getProperty(self, v4, 32, 1);
  else
    Property = 0;
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __49__HMDCameraStreamSnapshotHandler_removeDelegate___block_invoke;
  v8[3] = &unk_24E79C268;
  v8[4] = self;
  v9 = v5;
  v7 = v5;
  dispatch_async(Property, v8);

}

- (BOOL)isStreamAvailable
{
  HMDCameraStreamSnapshotHandler *v2;
  os_unfair_lock_s *p_lock;

  v2 = self;
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  LOBYTE(v2) = v2->_streamAvailable;
  os_unfair_lock_unlock(p_lock);
  return (char)v2;
}

- (BOOL)isStreamSetupInProgress
{
  HMDCameraStreamSnapshotHandler *v2;
  os_unfair_lock_s *p_lock;

  v2 = self;
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  LOBYTE(v2) = v2->_streamSetupInProgress;
  os_unfair_lock_unlock(p_lock);
  return (char)v2;
}

- (void)setStreamSetupStatusForService:(id)a3 inProgress:(BOOL)a4
{
  const char *v6;
  id v7;
  NSObject *Property;
  id v9;
  _QWORD block[5];
  id v11;
  BOOL v12;

  v7 = a3;
  if (self)
    Property = objc_getProperty(self, v6, 32, 1);
  else
    Property = 0;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __76__HMDCameraStreamSnapshotHandler_setStreamSetupStatusForService_inProgress___block_invoke;
  block[3] = &unk_24E799CF0;
  block[4] = self;
  v11 = v7;
  v12 = a4;
  v9 = v7;
  dispatch_async(Property, block);

}

- (void)addVideoStreamInterface:(id)a3
{
  const char *v4;
  id v5;
  NSObject *Property;
  id v7;
  _QWORD v8[5];
  id v9;

  v5 = a3;
  if (self)
    Property = objc_getProperty(self, v4, 32, 1);
  else
    Property = 0;
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __58__HMDCameraStreamSnapshotHandler_addVideoStreamInterface___block_invoke;
  v8[3] = &unk_24E79C268;
  v8[4] = self;
  v9 = v5;
  v7 = v5;
  dispatch_async(Property, v8);

}

- (void)removeVideoStreamInterface:(id)a3
{
  const char *v4;
  id v5;
  NSObject *Property;
  id v7;
  _QWORD v8[5];
  id v9;

  v5 = a3;
  if (self)
    Property = objc_getProperty(self, v4, 32, 1);
  else
    Property = 0;
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __61__HMDCameraStreamSnapshotHandler_removeVideoStreamInterface___block_invoke;
  v8[3] = &unk_24E79C268;
  v8[4] = self;
  v9 = v5;
  v7 = v5;
  dispatch_async(Property, v8);

}

- (void)getSnapshot:(unint64_t)a3
{
  HMDCameraStreamSnapshotHandler *v3;
  _QWORD block[5];

  v3 = self;
  if (self)
    self = (HMDCameraStreamSnapshotHandler *)objc_getProperty(self, a2, 32, 1);
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __46__HMDCameraStreamSnapshotHandler_getSnapshot___block_invoke;
  block[3] = &unk_24E79C240;
  block[4] = v3;
  dispatch_async(&self->super.super, block);
}

- (void)streamSnapshotCapture:(id)a3 didGetNewSnapshot:(id)a4
{
  -[HMDCameraStreamSnapshotHandler _callDidGetNewSnapshot:](self, a4);
}

- (void)streamSnapshotCapture:(id)a3 didGetLastSnapshot:(id)a4
{
  id v6;
  const char *v7;
  id v8;
  id Property;
  const char *v10;
  void *v11;
  HMDCameraStreamSnapshotHandler *v12;
  NSObject *v13;
  void *v14;
  const char *v15;
  id v16;
  id v17;
  void *v18;
  HMDCameraStreamSnapshotHandler *v19;
  NSObject *v20;
  void *v21;
  const char *v22;
  id v23;
  id v24;
  void *v25;
  HMDCameraStreamSnapshotHandler *v26;
  NSObject *v27;
  void *v28;
  SEL v29;
  id v30;
  uint64_t v31;
  const char *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t i;
  uint64_t v36;
  NSObject *v37;
  _QWORD block[6];
  id v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  uint8_t buf[4];
  void *v45;
  __int16 v46;
  id v47;
  uint64_t v48;

  v48 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v8 = a4;
  if (self)
    Property = objc_getProperty(self, v7, 24, 1);
  else
    Property = 0;
  if (objc_msgSend(Property, "containsObject:", v6))
  {
    v11 = (void *)MEMORY[0x227676638]();
    v12 = self;
    HMFGetOSLogHandle();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v45 = v14;
      v46 = 2112;
      v47 = v6;
      _os_log_impl(&dword_2218F0000, v13, OS_LOG_TYPE_INFO, "%{public}@Removing %@ from retired stream snapshot captures", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v11);
    if (self)
      v16 = objc_getProperty(v12, v15, 24, 1);
    else
      v16 = 0;
    objc_msgSend(v16, "removeObject:", v6);
  }
  if (self)
    v17 = objc_getProperty(self, v10, 16, 1);
  else
    v17 = 0;
  if (objc_msgSend(v17, "containsObject:", v6))
  {
    v18 = (void *)MEMORY[0x227676638]();
    v19 = self;
    HMFGetOSLogHandle();
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v45 = v21;
      v46 = 2112;
      v47 = v6;
      _os_log_impl(&dword_2218F0000, v20, OS_LOG_TYPE_INFO, "%{public}@Removing %@ from stream snapshot captures", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v18);
    if (self)
      v23 = objc_getProperty(v19, v22, 16, 1);
    else
      v23 = 0;
    objc_msgSend(v23, "removeObject:", v6);
  }
  v24 = v8;
  if (self)
  {
    v25 = (void *)MEMORY[0x227676638]();
    v26 = self;
    HMFGetOSLogHandle();
    v27 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v45 = v28;
      _os_log_impl(&dword_2218F0000, v27, OS_LOG_TYPE_INFO, "%{public}@Calling delegate streamSnapshotHandler:didGetLastSnapshot", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v25);
    v42 = 0u;
    v43 = 0u;
    v40 = 0u;
    v41 = 0u;
    v30 = objc_getProperty(v26, v29, 56, 1);
    v31 = objc_msgSend(v30, "countByEnumeratingWithState:objects:count:", &v40, buf, 16);
    if (v31)
    {
      v33 = v31;
      v34 = *(_QWORD *)v41;
      do
      {
        for (i = 0; i != v33; ++i)
        {
          if (*(_QWORD *)v41 != v34)
            objc_enumerationMutation(v30);
          v36 = *(_QWORD *)(*((_QWORD *)&v40 + 1) + 8 * i);
          objc_msgSend(objc_getProperty(v26, v32, 56, 1), "objectForKey:", v36);
          v37 = objc_claimAutoreleasedReturnValue();
          if ((objc_opt_respondsToSelector() & 1) != 0)
          {
            block[0] = MEMORY[0x24BDAC760];
            block[1] = 3221225472;
            block[2] = __58__HMDCameraStreamSnapshotHandler__callDidGetLastSnapshot___block_invoke;
            block[3] = &unk_24E79BBD0;
            block[4] = v36;
            block[5] = v26;
            v39 = v24;
            dispatch_async(v37, block);

          }
        }
        v33 = objc_msgSend(v30, "countByEnumeratingWithState:objects:count:", &v40, buf, 16);
      }
      while (v33);
    }

  }
}

- (NSString)logIdentifier
{
  return (NSString *)objc_getProperty(self, a2, 64, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_logIdentifier, 0);
  objc_storeStrong((id *)&self->_delegateTable, 0);
  objc_storeStrong((id *)&self->_serviceInstanceStreamStatus, 0);
  objc_storeStrong((id *)&self->_propertyQueue, 0);
  objc_storeStrong((id *)&self->_workQueue, 0);
  objc_storeStrong((id *)&self->_retiredStreamSnapshotCaptures, 0);
  objc_storeStrong((id *)&self->_streamSnapshotCaptures, 0);
}

uint64_t __58__HMDCameraStreamSnapshotHandler__callDidGetLastSnapshot___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "streamSnapshotHandler:didGetLastSnapshot:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

- (void)_callDidGetNewSnapshot:(void *)a1
{
  id v3;
  void *v4;
  id v5;
  NSObject *v6;
  void *v7;
  SEL v8;
  id v9;
  uint64_t v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  NSObject *v16;
  _QWORD block[6];
  id v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  uint8_t v23[128];
  uint8_t buf[4];
  void *v25;
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  if (a1)
  {
    v4 = (void *)MEMORY[0x227676638]();
    v5 = a1;
    HMFGetOSLogHandle();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v25 = v7;
      _os_log_impl(&dword_2218F0000, v6, OS_LOG_TYPE_INFO, "%{public}@Calling delegate streamSnapshotHandler:didGetNewSnapshot", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v4);
    v21 = 0u;
    v22 = 0u;
    v19 = 0u;
    v20 = 0u;
    v9 = objc_getProperty(v5, v8, 56, 1);
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    if (v10)
    {
      v12 = v10;
      v13 = *(_QWORD *)v20;
      do
      {
        v14 = 0;
        do
        {
          if (*(_QWORD *)v20 != v13)
            objc_enumerationMutation(v9);
          v15 = *(_QWORD *)(*((_QWORD *)&v19 + 1) + 8 * v14);
          objc_msgSend(objc_getProperty(v5, v11, 56, 1), "objectForKey:", v15);
          v16 = objc_claimAutoreleasedReturnValue();
          if ((objc_opt_respondsToSelector() & 1) != 0)
          {
            block[0] = MEMORY[0x24BDAC760];
            block[1] = 3221225472;
            block[2] = __57__HMDCameraStreamSnapshotHandler__callDidGetNewSnapshot___block_invoke;
            block[3] = &unk_24E79BBD0;
            block[4] = v15;
            block[5] = v5;
            v18 = v3;
            dispatch_async(v16, block);

          }
          ++v14;
        }
        while (v12 != v14);
        v12 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
      }
      while (v12);
    }

  }
}

uint64_t __57__HMDCameraStreamSnapshotHandler__callDidGetNewSnapshot___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "streamSnapshotHandler:didGetNewSnapshot:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

void __46__HMDCameraStreamSnapshotHandler_getSnapshot___block_invoke(uint64_t a1, const char *a2)
{
  id Property;
  void *v4;
  id v5;
  NSObject *v6;
  void *v7;
  _OWORD v8[4];
  uint8_t buf[4];
  void *v10;
  _BYTE v11[128];
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  memset(v8, 0, sizeof(v8));
  Property = *(id *)(a1 + 32);
  if (Property)
    Property = objc_getProperty(Property, a2, 16, 1);
  if (objc_msgSend(Property, "countByEnumeratingWithState:objects:count:", v8, v11, 16))
  {
    objc_msgSend(**((id **)&v8[0] + 1), "captureCurrentFrame", *(_QWORD *)&v8[0]);
  }
  else
  {
    v4 = (void *)MEMORY[0x227676638](0);
    v5 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v10 = v7;
      _os_log_impl(&dword_2218F0000, v6, OS_LOG_TYPE_INFO, "%{public}@There is no valid snapshot capture object", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v4);
    -[HMDCameraStreamSnapshotHandler _callDidGetNewSnapshot:](*(void **)(a1 + 32), 0);
  }
}

void __61__HMDCameraStreamSnapshotHandler_removeVideoStreamInterface___block_invoke(uint64_t a1, const char *a2)
{
  id Property;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  NSObject *v14;
  void *v15;
  const char *v16;
  id v17;
  void *v18;
  id v19;
  NSObject *v20;
  void *v21;
  const char *v22;
  id v23;
  const char *v24;
  id v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  uint8_t buf[4];
  void *v31;
  __int16 v32;
  void *v33;
  _BYTE v34[128];
  uint64_t v35;

  v35 = *MEMORY[0x24BDAC8D0];
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  Property = *(id *)(a1 + 32);
  if (Property)
    Property = objc_getProperty(Property, a2, 16, 1);
  v4 = (void *)objc_msgSend(Property, "copy", (_QWORD)v26);
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v26, v34, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v27;
    while (2)
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v27 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v26 + 1) + 8 * i);
        objc_msgSend(v9, "videoStreamInterface");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = *(void **)(a1 + 40);

        if (v10 == v11)
        {
          v12 = (void *)MEMORY[0x227676638]();
          v13 = *(id *)(a1 + 32);
          HMFGetOSLogHandle();
          v14 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
          {
            HMFGetLogIdentifier();
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543618;
            v31 = v15;
            v32 = 2112;
            v33 = v9;
            _os_log_impl(&dword_2218F0000, v14, OS_LOG_TYPE_INFO, "%{public}@Removing %@", buf, 0x16u);

          }
          objc_autoreleasePoolPop(v12);
          v17 = *(id *)(a1 + 32);
          if (v17)
            v17 = objc_getProperty(v17, v16, 16, 1);
          objc_msgSend(v17, "removeObject:", v9);
          if (objc_msgSend(*(id *)(a1 + 40), "state") == 2)
          {
            v18 = (void *)MEMORY[0x227676638]();
            v19 = *(id *)(a1 + 32);
            HMFGetOSLogHandle();
            v20 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
            {
              HMFGetLogIdentifier();
              v21 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138543618;
              v31 = v21;
              v32 = 2112;
              v33 = v9;
              _os_log_impl(&dword_2218F0000, v20, OS_LOG_TYPE_INFO, "%{public}@Adding %@ to retired-snapshot-captures", buf, 0x16u);

            }
            objc_autoreleasePoolPop(v18);
            v23 = *(id *)(a1 + 32);
            if (v23)
              v23 = objc_getProperty(v23, v22, 24, 1);
            objc_msgSend(v23, "addObject:", v9);
            objc_msgSend(v9, "captureLastFrame");
          }
          goto LABEL_22;
        }
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v26, v34, 16);
      if (v6)
        continue;
      break;
    }
  }
LABEL_22:

  v25 = *(id *)(a1 + 32);
  if (v25)
    v25 = objc_getProperty(v25, v24, 16, 1);
  if (!objc_msgSend(v25, "count"))
    -[HMDCameraStreamSnapshotHandler setStreamAvailable:](*(_QWORD *)(a1 + 32), 0);
}

- (void)setStreamAvailable:(uint64_t)a1
{
  os_unfair_lock_s *v4;

  if (a1)
  {
    v4 = (os_unfair_lock_s *)(a1 + 8);
    os_unfair_lock_lock_with_options();
    *(_BYTE *)(a1 + 12) = a2;
    os_unfair_lock_unlock(v4);
  }
}

void __58__HMDCameraStreamSnapshotHandler_addVideoStreamInterface___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  NSObject *v4;
  void *v5;
  void *v6;
  const char *v7;
  HMDCameraStreamSnapshotCapture *v8;
  id Property;
  const char *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  id v14;
  HMDCameraStreamSnapshotCapture *v15;
  const char *v16;
  id v17;
  int v18;
  void *v19;
  __int16 v20;
  void *v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v2 = (void *)MEMORY[0x227676638]();
  v3 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "sessionID");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = 138543618;
    v19 = v5;
    v20 = 2112;
    v21 = v6;
    _os_log_impl(&dword_2218F0000, v4, OS_LOG_TYPE_INFO, "%{public}@Adding video stream interface %@", (uint8_t *)&v18, 0x16u);

  }
  objc_autoreleasePoolPop(v2);
  v8 = [HMDCameraStreamSnapshotCapture alloc];
  Property = *(id *)(a1 + 32);
  if (Property)
    Property = objc_getProperty(Property, v7, 32, 1);
  v11 = Property;
  v13 = *(_QWORD *)(a1 + 32);
  v12 = *(_QWORD *)(a1 + 40);
  if (v13)
    v14 = objc_getProperty(*(id *)(a1 + 32), v10, 32, 1);
  else
    v14 = 0;
  v15 = -[HMDCameraStreamSnapshotCapture initWithWorkQueue:videoStreamInterface:delegate:delegateQueue:](v8, "initWithWorkQueue:videoStreamInterface:delegate:delegateQueue:", v11, v12, v13, v14);

  v17 = *(id *)(a1 + 32);
  if (v17)
    v17 = objc_getProperty(v17, v16, 16, 1);
  objc_msgSend(v17, "addObject:", v15);
  -[HMDCameraStreamSnapshotHandler setStreamAvailable:](*(_QWORD *)(a1 + 32), 1);

}

void __76__HMDCameraStreamSnapshotHandler_setStreamSetupStatusForService_inProgress___block_invoke(uint64_t a1)
{
  const char *v2;
  void *v3;
  id Property;
  void *v5;
  id v6;
  void *v7;
  const char *v8;
  id v9;
  id v10;
  uint64_t v11;
  const char *v12;
  uint64_t v13;
  int v14;
  uint64_t v15;
  uint64_t i;
  uint64_t v17;
  id v18;
  void *v19;
  uint64_t v20;
  SEL v21;
  NSObject *v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _QWORD block[5];
  char v28;
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", *(unsigned __int8 *)(a1 + 48));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  Property = *(id *)(a1 + 32);
  if (Property)
    Property = objc_getProperty(Property, v2, 48, 1);
  v5 = *(void **)(a1 + 40);
  v6 = Property;
  objc_msgSend(v5, "instanceID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v3, v7);

  v25 = 0u;
  v26 = 0u;
  v23 = 0u;
  v24 = 0u;
  v9 = *(id *)(a1 + 32);
  if (v9)
    v9 = objc_getProperty(v9, v8, 48, 1);
  v10 = v9;
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v23, v29, 16);
  if (v11)
  {
    v13 = v11;
    LOBYTE(v14) = 0;
    v15 = *(_QWORD *)v24;
    do
    {
      for (i = 0; i != v13; ++i)
      {
        if (*(_QWORD *)v24 != v15)
          objc_enumerationMutation(v10);
        if ((v14 & 1) != 0)
        {
          v14 = 1;
        }
        else
        {
          v17 = *(_QWORD *)(*((_QWORD *)&v23 + 1) + 8 * i);
          v18 = *(id *)(a1 + 32);
          if (v18)
            v18 = objc_getProperty(v18, v12, 48, 1);
          objc_msgSend(v18, "objectForKeyedSubscript:", v17, (_QWORD)v23);
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          v14 = objc_msgSend(v19, "BOOLValue");

        }
      }
      v13 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v23, v29, 16);
    }
    while (v13);
  }
  else
  {
    v14 = 0;
  }

  v20 = *(_QWORD *)(a1 + 32);
  if (v20)
  {
    os_unfair_lock_lock_with_options();
    if (*(unsigned __int8 *)(v20 + 13) == v14)
    {
      os_unfair_lock_unlock((os_unfair_lock_t)(v20 + 8));
    }
    else
    {
      *(_BYTE *)(v20 + 13) = v14;
      os_unfair_lock_unlock((os_unfair_lock_t)(v20 + 8));
      v22 = objc_getProperty((id)v20, v21, 32, 1);
      block[0] = MEMORY[0x24BDAC760];
      block[1] = 3221225472;
      block[2] = __60__HMDCameraStreamSnapshotHandler_callStreamSetupInProgress___block_invoke;
      block[3] = &unk_24E7968C8;
      block[4] = v20;
      v28 = v14;
      dispatch_async(v22, block);
    }
  }
}

void __60__HMDCameraStreamSnapshotHandler_callStreamSetupInProgress___block_invoke(uint64_t a1)
{
  void *v1;
  void *v2;
  id v3;
  NSObject *v4;
  void *v5;
  SEL v6;
  id v7;
  uint64_t v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  uint64_t v13;
  NSObject *v14;
  char v15;
  _QWORD block[6];
  char v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  uint8_t buf[4];
  void *v23;
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v1 = *(void **)(a1 + 32);
  if (v1)
  {
    v15 = *(_BYTE *)(a1 + 40);
    v2 = (void *)MEMORY[0x227676638]();
    v3 = v1;
    HMFGetOSLogHandle();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v23 = v5;
      _os_log_impl(&dword_2218F0000, v4, OS_LOG_TYPE_INFO, "%{public}@Calling delegate streamSnapshotHandler:didChangeStreamSetupInProgress", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v2);
    v20 = 0u;
    v21 = 0u;
    v18 = 0u;
    v19 = 0u;
    v7 = objc_getProperty(v3, v6, 56, 1);
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v18, buf, 16);
    if (v8)
    {
      v10 = v8;
      v11 = *(_QWORD *)v19;
      do
      {
        for (i = 0; i != v10; ++i)
        {
          if (*(_QWORD *)v19 != v11)
            objc_enumerationMutation(v7);
          v13 = *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * i);
          objc_msgSend(objc_getProperty(v3, v9, 56, 1), "objectForKey:", v13);
          v14 = objc_claimAutoreleasedReturnValue();
          if ((objc_opt_respondsToSelector() & 1) != 0)
          {
            block[0] = MEMORY[0x24BDAC760];
            block[1] = 3221225472;
            block[2] = __61__HMDCameraStreamSnapshotHandler__callStreamSetupInProgress___block_invoke;
            block[3] = &unk_24E799CF0;
            block[4] = v13;
            block[5] = v3;
            v17 = v15;
            dispatch_async(v14, block);
          }

        }
        v10 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v18, buf, 16);
      }
      while (v10);
    }

  }
}

uint64_t __61__HMDCameraStreamSnapshotHandler__callStreamSetupInProgress___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "streamSnapshotHandler:didChangeStreamSetupInProgress:", *(_QWORD *)(a1 + 40), *(unsigned __int8 *)(a1 + 48));
}

uint64_t __49__HMDCameraStreamSnapshotHandler_removeDelegate___block_invoke(uint64_t a1, const char *a2)
{
  id Property;

  Property = *(id *)(a1 + 32);
  if (Property)
    Property = objc_getProperty(Property, a2, 56, 1);
  return objc_msgSend(Property, "removeObjectForKey:", *(_QWORD *)(a1 + 40));
}

uint64_t __60__HMDCameraStreamSnapshotHandler_addDelegate_delegateQueue___block_invoke(_QWORD *a1, const char *a2)
{
  id Property;

  Property = (id)a1[4];
  if (Property)
    Property = objc_getProperty(Property, a2, 56, 1);
  return objc_msgSend(Property, "setObject:forKey:", a1[5], a1[6]);
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t0_55707 != -1)
    dispatch_once(&logCategory__hmf_once_t0_55707, &__block_literal_global_55708);
  return (id)logCategory__hmf_once_v1_55709;
}

void __45__HMDCameraStreamSnapshotHandler_logCategory__block_invoke()
{
  uint64_t v0;
  void *v1;

  HMFCreateOSLogHandle();
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)logCategory__hmf_once_v1_55709;
  logCategory__hmf_once_v1_55709 = v0;

}

@end
