@implementation HMDDataStreamBulkSendProtocol

- (HMDDataStreamBulkSendProtocol)initWithQueue:(id)a3 accessory:(id)a4 logIdentifier:(id)a5
{
  return -[HMDDataStreamBulkSendProtocol initWithQueue:accessory:logIdentifier:bulkSendSessionContextFactory:](self, "initWithQueue:accessory:logIdentifier:bulkSendSessionContextFactory:", a3, a4, a5, &__block_literal_global_119980);
}

- (HMDDataStreamBulkSendProtocol)initWithQueue:(id)a3 accessory:(id)a4 logIdentifier:(id)a5 bulkSendSessionContextFactory:(id)a6
{
  id v11;
  id v12;
  id v13;
  id v14;
  HMDDataStreamBulkSendProtocol *v15;
  HMDDataStreamBulkSendProtocol *v16;
  uint64_t v17;
  NSMapTable *listeners;
  uint64_t v19;
  NSMapTable *activeBulkSendSessions;
  void *v21;
  id bulkSendSessionContextFactory;
  NSMutableDictionary *v23;
  NSMutableDictionary *pendingBulkSendSessionContextBySessionIdentifier;
  uint64_t v25;
  NSString *logIdentifier;
  objc_super v28;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  v28.receiver = self;
  v28.super_class = (Class)HMDDataStreamBulkSendProtocol;
  v15 = -[HMDDataStreamBulkSendProtocol init](&v28, sel_init);
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_queue, a3);
    objc_storeWeak(&v16->_accessory, v12);
    objc_msgSend(MEMORY[0x1E0CB3748], "strongToWeakObjectsMapTable");
    v17 = objc_claimAutoreleasedReturnValue();
    listeners = v16->_listeners;
    v16->_listeners = (NSMapTable *)v17;

    objc_msgSend(MEMORY[0x1E0CB3748], "strongToWeakObjectsMapTable");
    v19 = objc_claimAutoreleasedReturnValue();
    activeBulkSendSessions = v16->_activeBulkSendSessions;
    v16->_activeBulkSendSessions = (NSMapTable *)v19;

    v16->_isConnected = 0;
    v16->_nextSessionIdentifier = 1;
    v21 = _Block_copy(v14);
    bulkSendSessionContextFactory = v16->_bulkSendSessionContextFactory;
    v16->_bulkSendSessionContextFactory = v21;

    v23 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    pendingBulkSendSessionContextBySessionIdentifier = v16->_pendingBulkSendSessionContextBySessionIdentifier;
    v16->_pendingBulkSendSessionContextBySessionIdentifier = v23;

    v25 = objc_msgSend(v13, "copy");
    logIdentifier = v16->_logIdentifier;
    v16->_logIdentifier = (NSString *)v25;

  }
  return v16;
}

- (void)addListener:(id)a3 fileType:(id)a4
{
  id v6;
  id v7;
  _BOOL8 v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  HMDDataStreamBulkSendProtocol *v13;
  NSObject *v14;
  void *v15;
  void *v16;
  int v17;
  void *v18;
  __int16 v19;
  id v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = -[HMDDataStreamBulkSendProtocol isActive](self, "isActive");
  -[HMDDataStreamBulkSendProtocol listeners](self, "listeners");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "objectForKey:", v7);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  -[HMDDataStreamBulkSendProtocol accessory](self, "accessory");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
  {
    v12 = (void *)MEMORY[0x1D17BA0A0]();
    v13 = self;
    HMFGetOSLogHandle();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = 138543618;
      v18 = v15;
      v19 = 2112;
      v20 = v7;
      _os_log_impl(&dword_1CD062000, v14, OS_LOG_TYPE_INFO, "%{public}@Rejecting BulkSend registration for file type %@; handler already exists",
        (uint8_t *)&v17,
        0x16u);

    }
    objc_autoreleasePoolPop(v12);
    objc_msgSend(v6, "accessory:didCloseDataStreamWithError:", v11, 0);
  }
  else
  {
    -[HMDDataStreamBulkSendProtocol listeners](self, "listeners");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setObject:forKey:", v6, v7);

    if (-[HMDDataStreamBulkSendProtocol isConnected](self, "isConnected"))
      objc_msgSend(v6, "accessoryDidStartListening:", v11);
    -[HMDDataStreamBulkSendProtocol _notifyActiveStatusChangedFromPreviousValue:](self, "_notifyActiveStatusChangedFromPreviousValue:", v8);
  }

}

- (void)removeListener:(id)a3
{
  id v4;
  _BOOL8 v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  uint64_t v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = -[HMDDataStreamBulkSendProtocol isActive](self, "isActive");
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  -[HMDDataStreamBulkSendProtocol listeners](self, "listeners", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "keyEnumerator");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v18;
    while (2)
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v18 != v10)
          objc_enumerationMutation(v7);
        v12 = *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * i);
        -[HMDDataStreamBulkSendProtocol listeners](self, "listeners");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "objectForKey:", v12);
        v14 = (id)objc_claimAutoreleasedReturnValue();

        if (v14 == v4)
        {
          -[HMDDataStreamBulkSendProtocol listeners](self, "listeners");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "removeObjectForKey:", v12);

          goto LABEL_11;
        }
      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
      if (v9)
        continue;
      break;
    }
  }
LABEL_11:

  -[HMDDataStreamBulkSendProtocol accessory](self, "accessory");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "accessory:didCloseDataStreamWithError:", v16, 0);

  -[HMDDataStreamBulkSendProtocol _notifyActiveStatusChangedFromPreviousValue:](self, "_notifyActiveStatusChangedFromPreviousValue:", v5);
}

- (void)_notifyActiveStatusChangedFromPreviousValue:(BOOL)a3
{
  void *v4;
  HMDDataStreamBulkSendProtocol *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  __int16 v12;
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  if (-[HMDDataStreamBulkSendProtocol isActive](self, "isActive") != a3)
  {
    v4 = (void *)MEMORY[0x1D17BA0A0]();
    v5 = self;
    HMFGetOSLogHandle();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMDDataStreamBulkSendProtocol isActive](v5, "isActive");
      HMFBooleanToString();
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = 138543618;
      v11 = v7;
      v12 = 2112;
      v13 = v8;
      _os_log_impl(&dword_1CD062000, v6, OS_LOG_TYPE_INFO, "%{public}@BulkSend protocol changes active to %@", (uint8_t *)&v10, 0x16u);

    }
    objc_autoreleasePoolPop(v4);
    -[HMDDataStreamBulkSendProtocol dataStream](v5, "dataStream");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "protocolDidUpdateActiveStatus:", v5);

  }
}

- (void)_closeAllSessionsWithError:(id)a3
{
  id v4;
  void *v5;
  HMDDataStreamBulkSendProtocol *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  void *v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  _BYTE v38[128];
  _BYTE v39[128];
  uint64_t v40;
  id v41;
  uint8_t buf[4];
  void *v43;
  __int16 v44;
  uint64_t v45;
  __int16 v46;
  uint64_t v47;
  uint64_t v48;

  v48 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = (void *)MEMORY[0x1D17BA0A0]();
  v6 = self;
  HMFGetOSLogHandle();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    HMFGetLogIdentifier();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDDataStreamBulkSendProtocol listeners](v6, "listeners");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "count");
    -[HMDDataStreamBulkSendProtocol activeBulkSendSessions](v6, "activeBulkSendSessions");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    v43 = v8;
    v44 = 2048;
    v45 = v10;
    v46 = 2048;
    v47 = objc_msgSend(v11, "count");
    _os_log_impl(&dword_1CD062000, v7, OS_LOG_TYPE_DEBUG, "%{public}@Session closed; removing %lu listeners and closing %lu sessions",
      buf,
      0x20u);

  }
  objc_autoreleasePoolPop(v5);
  -[HMDDataStreamBulkSendProtocol setIsConnected:](v6, "setIsConnected:", 0);
  if (v4)
  {
    v40 = *MEMORY[0x1E0CB3388];
    v41 = v4;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v41, &v40, 1);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v12 = 0;
  }
  objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB32E8], -1005, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDDataStreamBulkSendProtocol accessory](v6, "accessory");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v34 = 0u;
  v35 = 0u;
  v36 = 0u;
  v37 = 0u;
  -[HMDDataStreamBulkSendProtocol activeBulkSendSessions](v6, "activeBulkSendSessions");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "objectEnumerator");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v34, v39, 16);
  if (v17)
  {
    v18 = v17;
    v19 = *(_QWORD *)v35;
    do
    {
      v20 = 0;
      do
      {
        if (*(_QWORD *)v35 != v19)
          objc_enumerationMutation(v16);
        v21 = *(void **)(*((_QWORD *)&v34 + 1) + 8 * v20);
        if (v21)
          objc_msgSend(v21, "asyncHandleRemoteCloseWithError:", v13);
        ++v20;
      }
      while (v18 != v20);
      v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v34, v39, 16);
    }
    while (v18);
  }

  v32 = 0u;
  v33 = 0u;
  v30 = 0u;
  v31 = 0u;
  -[HMDDataStreamBulkSendProtocol listeners](v6, "listeners", 0);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "objectEnumerator");
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  v24 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v30, v38, 16);
  if (v24)
  {
    v25 = v24;
    v26 = *(_QWORD *)v31;
    do
    {
      v27 = 0;
      do
      {
        if (*(_QWORD *)v31 != v26)
          objc_enumerationMutation(v23);
        objc_msgSend(*(id *)(*((_QWORD *)&v30 + 1) + 8 * v27++), "accessory:didCloseDataStreamWithError:", v14, v4);
      }
      while (v25 != v27);
      v25 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v30, v38, 16);
    }
    while (v25);
  }

  -[HMDDataStreamBulkSendProtocol listeners](v6, "listeners");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "removeAllObjects");

  -[HMDDataStreamBulkSendProtocol activeBulkSendSessions](v6, "activeBulkSendSessions");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "removeAllObjects");

}

- (BOOL)isActive
{
  void *v2;
  BOOL v3;

  -[HMDDataStreamBulkSendProtocol listeners](self, "listeners");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "count") != 0;

  return v3;
}

- (void)dataStream:(id)a3 didFailWithError:(id)a4
{
  id v6;
  id v7;
  void *v8;
  HMDDataStreamBulkSendProtocol *v9;
  NSObject *v10;
  void *v11;
  int v12;
  void *v13;
  __int16 v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = (void *)MEMORY[0x1D17BA0A0]();
  v9 = self;
  HMFGetOSLogHandle();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = 138543618;
    v13 = v11;
    v14 = 2112;
    v15 = v7;
    _os_log_impl(&dword_1CD062000, v10, OS_LOG_TYPE_INFO, "%{public}@DataStream failed with error; cleaning up. (%@)",
      (uint8_t *)&v12,
      0x16u);

  }
  objc_autoreleasePoolPop(v8);
  -[HMDDataStreamBulkSendProtocol _closeAllSessionsWithError:](v9, "_closeAllSessionsWithError:", v7);

}

- (void)dataStreamInitiatedClose:(id)a3
{
  id v4;
  void *v5;
  HMDDataStreamBulkSendProtocol *v6;
  NSObject *v7;
  void *v8;
  int v9;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = (void *)MEMORY[0x1D17BA0A0]();
  v6 = self;
  HMFGetOSLogHandle();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = 138543362;
    v10 = v8;
    _os_log_impl(&dword_1CD062000, v7, OS_LOG_TYPE_INFO, "%{public}@DataStream initiated closing...", (uint8_t *)&v9, 0xCu);

  }
  objc_autoreleasePoolPop(v5);

}

- (void)dataStreamDidClose:(id)a3
{
  id v4;
  void *v5;
  HMDDataStreamBulkSendProtocol *v6;
  NSObject *v7;
  void *v8;
  int v9;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = (void *)MEMORY[0x1D17BA0A0]();
  v6 = self;
  HMFGetOSLogHandle();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = 138543362;
    v10 = v8;
    _os_log_impl(&dword_1CD062000, v7, OS_LOG_TYPE_INFO, "%{public}@DataStream closed; cleaning up",
      (uint8_t *)&v9,
      0xCu);

  }
  objc_autoreleasePoolPop(v5);
  -[HMDDataStreamBulkSendProtocol _closeAllSessionsWithError:](v6, "_closeAllSessionsWithError:", 0);

}

- (void)dataStreamDidOpen:(id)a3
{
  id v4;
  void *v5;
  HMDDataStreamBulkSendProtocol *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  uint8_t v21[128];
  uint8_t buf[4];
  void *v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = (void *)MEMORY[0x1D17BA0A0]();
  v6 = self;
  HMFGetOSLogHandle();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    HMFGetLogIdentifier();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v23 = v8;
    _os_log_impl(&dword_1CD062000, v7, OS_LOG_TYPE_DEBUG, "%{public}@DataStream did open; connected.", buf, 0xCu);

  }
  objc_autoreleasePoolPop(v5);
  -[HMDDataStreamBulkSendProtocol setIsConnected:](v6, "setIsConnected:", 1);
  v19 = 0u;
  v20 = 0u;
  v17 = 0u;
  v18 = 0u;
  -[HMDDataStreamBulkSendProtocol listeners](v6, "listeners", 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "objectEnumerator");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v18;
    do
    {
      v14 = 0;
      do
      {
        if (*(_QWORD *)v18 != v13)
          objc_enumerationMutation(v10);
        v15 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * v14);
        if (v15)
        {
          -[HMDDataStreamBulkSendProtocol accessory](v6, "accessory");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "accessoryDidStartListening:", v16);

        }
        ++v14;
      }
      while (v12 != v14);
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v12);
  }

}

- (void)dataStream:(id)a3 didReceiveEvent:(id)a4 header:(id)a5 payload:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  HMDDataStreamBulkSendProtocol *v15;
  NSObject *v16;
  void *v17;
  const char *v18;
  NSObject *v19;
  os_log_type_t v20;
  int v21;
  void *v22;
  __int16 v23;
  id v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  if (!-[HMDDataStreamBulkSendProtocol isConnected](self, "isConnected"))
  {
    v14 = (void *)MEMORY[0x1D17BA0A0]();
    v15 = self;
    HMFGetOSLogHandle();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
    {
      HMFGetLogIdentifier();
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = 138543618;
      v22 = v17;
      v23 = 2112;
      v24 = v11;
      v18 = "%{public}@BulkSend dropping message because it is not running (topic=%@).";
      v19 = v16;
      v20 = OS_LOG_TYPE_DEBUG;
LABEL_10:
      _os_log_impl(&dword_1CD062000, v19, v20, v18, (uint8_t *)&v21, 0x16u);

    }
LABEL_11:

    objc_autoreleasePoolPop(v14);
    goto LABEL_12;
  }
  if (!objc_msgSend(v11, "isEqualToString:", CFSTR("data")))
  {
    if (objc_msgSend(v11, "isEqualToString:", CFSTR("close")))
    {
      -[HMDDataStreamBulkSendProtocol _handleCloseMessage:](self, "_handleCloseMessage:", v13);
      goto LABEL_12;
    }
    v14 = (void *)MEMORY[0x1D17BA0A0]();
    v15 = self;
    HMFGetOSLogHandle();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = 138543618;
      v22 = v17;
      v23 = 2112;
      v24 = v11;
      v18 = "%{public}@DataSend received unexpected event '%@'";
      v19 = v16;
      v20 = OS_LOG_TYPE_INFO;
      goto LABEL_10;
    }
    goto LABEL_11;
  }
  -[HMDDataStreamBulkSendProtocol _handleDataMessage:](self, "_handleDataMessage:", v13);
LABEL_12:

}

- (void)dataStream:(id)a3 didReceiveRequest:(id)a4 header:(id)a5 payload:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  HMDDataStreamBulkSendProtocol *v15;
  NSObject *v16;
  void *v17;
  int v18;
  void *v19;
  __int16 v20;
  id v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  if (-[HMDDataStreamBulkSendProtocol isConnected](self, "isConnected"))
  {
    if (objc_msgSend(v11, "isEqualToString:", CFSTR("open")))
    {
      -[HMDDataStreamBulkSendProtocol _handleOpenWithRequestHeader:payload:](self, "_handleOpenWithRequestHeader:payload:", v12, v13);
    }
    else
    {
      v14 = (void *)MEMORY[0x1D17BA0A0]();
      v15 = self;
      HMFGetOSLogHandle();
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = 138543618;
        v19 = v17;
        v20 = 2112;
        v21 = v11;
        _os_log_impl(&dword_1CD062000, v16, OS_LOG_TYPE_INFO, "%{public}@DataSend received unexpected request '%@'", (uint8_t *)&v18, 0x16u);

      }
      objc_autoreleasePoolPop(v14);
    }
  }

}

- (void)asyncBulkSendSessionCandidate:(id)a3 didAcceptOnQueue:(id)a4 callback:(id)a5
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
  -[HMDDataStreamBulkSendProtocol queue](self, "queue");
  v11 = objc_claimAutoreleasedReturnValue();
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __89__HMDDataStreamBulkSendProtocol_asyncBulkSendSessionCandidate_didAcceptOnQueue_callback___block_invoke;
  v15[3] = &unk_1E89C0448;
  v15[4] = self;
  v16 = v8;
  v17 = v9;
  v18 = v10;
  v12 = v10;
  v13 = v9;
  v14 = v8;
  dispatch_async(v11, v15);

}

- (void)asyncBulkSendSessionCandidate:(id)a3 didRejectWithStatus:(unsigned __int16)a4
{
  id v6;
  NSObject *v7;
  id v8;
  _QWORD block[5];
  id v10;
  unsigned __int16 v11;

  v6 = a3;
  -[HMDDataStreamBulkSendProtocol queue](self, "queue");
  v7 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __83__HMDDataStreamBulkSendProtocol_asyncBulkSendSessionCandidate_didRejectWithStatus___block_invoke;
  block[3] = &unk_1E89B8408;
  block[4] = self;
  v10 = v6;
  v11 = a4;
  v8 = v6;
  dispatch_async(v7, block);

}

- (void)asyncBulkSendSessionDidCancelSessionWithIdentifier:(id)a3 reason:(unsigned __int16)a4 hadReceivedEof:(BOOL)a5
{
  id v8;
  NSObject *v9;
  id v10;
  _QWORD block[5];
  id v12;
  unsigned __int16 v13;
  BOOL v14;

  v8 = a3;
  -[HMDDataStreamBulkSendProtocol queue](self, "queue");
  v9 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __106__HMDDataStreamBulkSendProtocol_asyncBulkSendSessionDidCancelSessionWithIdentifier_reason_hadReceivedEof___block_invoke;
  block[3] = &unk_1E89B4AA8;
  block[4] = self;
  v12 = v8;
  v13 = a4;
  v14 = a5;
  v10 = v8;
  dispatch_async(v9, block);

}

- (id)_createSessionCandidateWithRequestHeader:(id)a3 metadata:(id)a4
{
  id v6;
  id v7;
  void *v8;
  HMDDataStreamBulkSendProtocol *v9;
  NSObject *v10;
  void *v11;
  HMDDataStreamBulkSendSessionCandidate *v12;
  int v14;
  void *v15;
  __int16 v16;
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = (void *)MEMORY[0x1D17BA0A0]();
  v9 = self;
  HMFGetOSLogHandle();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    HMFGetLogIdentifier();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = 138543618;
    v15 = v11;
    v16 = 2112;
    v17 = v6;
    _os_log_impl(&dword_1CD062000, v10, OS_LOG_TYPE_DEBUG, "%{public}@Creating new receive candidate session (header %@)", (uint8_t *)&v14, 0x16u);

  }
  objc_autoreleasePoolPop(v8);
  v12 = -[HMDDataStreamBulkSendSessionCandidate initWithProtocol:requestHeader:metadata:]([HMDDataStreamBulkSendSessionCandidate alloc], "initWithProtocol:requestHeader:metadata:", v9, v6, v7);

  return v12;
}

- (id)_createSessionFromCandidate:(id)a3 queue:(id)a4
{
  id v6;
  id v7;
  void *v8;
  HMDDataStreamBulkSendSession *v9;
  void *v10;
  HMDDataStreamBulkSendSession *v11;
  void *v12;
  HMDDataStreamBulkSendProtocol *v13;
  NSObject *v14;
  void *v15;
  void *v16;
  void *v17;
  int v19;
  void *v20;
  __int16 v21;
  void *v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  -[HMDDataStreamBulkSendProtocol _createSessionIdentifier](self, "_createSessionIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = [HMDDataStreamBulkSendSession alloc];
  -[HMDDataStreamBulkSendProtocol logIdentifier](self, "logIdentifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = -[HMDDataStreamBulkSendSession initWithProtocol:sessionIdentifier:queue:logIdentifier:](v9, "initWithProtocol:sessionIdentifier:queue:logIdentifier:", self, v8, v7, v10);

  v12 = (void *)MEMORY[0x1D17BA0A0]();
  v13 = self;
  HMFGetOSLogHandle();
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
  {
    HMFGetLogIdentifier();
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = 138543618;
    v20 = v15;
    v21 = 2112;
    v22 = v8;
    _os_log_impl(&dword_1CD062000, v14, OS_LOG_TYPE_DEBUG, "%{public}@Creating new receive session with streamIdentifier=%@", (uint8_t *)&v19, 0x16u);

  }
  objc_autoreleasePoolPop(v12);
  -[HMDDataStreamBulkSendProtocol activeBulkSendSessions](v13, "activeBulkSendSessions");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setObject:forKey:", v11, v8);

  objc_msgSend(v6, "requestHeader");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDDataStreamBulkSendProtocol _sendOpenResponseWithRequestHeader:streamIdentifier:](v13, "_sendOpenResponseWithRequestHeader:streamIdentifier:", v17, v8);

  return v11;
}

- (void)_sendOpenResponseWithRequestHeader:(id)a3 streamIdentifier:(id)a4
{
  void *v6;
  id v7;
  id v8;
  void *v9;
  const __CFString *v10;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x1E0C80C00];
  v10 = CFSTR("streamId");
  v11[0] = a4;
  v6 = (void *)MEMORY[0x1E0C99D80];
  v7 = a4;
  v8 = a3;
  objc_msgSend(v6, "dictionaryWithObjects:forKeys:count:", v11, &v10, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  -[HMDDataStreamBulkSendProtocol _sendOpenResponseWithRequestHeader:payload:status:](self, "_sendOpenResponseWithRequestHeader:payload:status:", v8, v9, 0);
}

- (void)_sendOpenResponseWithRequestHeader:(id)a3 bulkSendStatus:(unsigned __int16)a4
{
  uint64_t v4;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  const __CFString *v10;
  _QWORD v11[2];

  v4 = a4;
  v11[1] = *MEMORY[0x1E0C80C00];
  v10 = CFSTR("status");
  v6 = (void *)MEMORY[0x1E0CB37E8];
  v7 = a3;
  objc_msgSend(v6, "numberWithUnsignedShort:", v4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = v8;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v11, &v10, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  -[HMDDataStreamBulkSendProtocol _sendOpenResponseWithRequestHeader:payload:status:](self, "_sendOpenResponseWithRequestHeader:payload:status:", v7, v9, 6);
}

- (void)_sendOpenResponseWithRequestHeader:(id)a3 payload:(id)a4 status:(unsigned __int16)a5
{
  uint64_t v5;
  id v8;
  id v9;
  void *v10;
  void *v11;
  HMDDataStreamBulkSendProtocol *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  _QWORD v16[5];
  uint8_t buf[4];
  void *v18;
  __int16 v19;
  void *v20;
  __int16 v21;
  uint64_t v22;
  uint64_t v23;

  v5 = a5;
  v23 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  -[HMDDataStreamBulkSendProtocol dataStream](self, "dataStream");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
  {
    v11 = (void *)MEMORY[0x1D17BA0A0]();
    v12 = self;
    HMFGetOSLogHandle();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      HMDStringFromDataStreamMessageStatus(v5);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v18 = v14;
      v19 = 2112;
      v20 = v15;
      v21 = 2048;
      v22 = v5;
      _os_log_impl(&dword_1CD062000, v13, OS_LOG_TYPE_INFO, "%{public}@Sending open response with status %@ (%ld)", buf, 0x20u);

    }
    objc_autoreleasePoolPop(v11);
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = __83__HMDDataStreamBulkSendProtocol__sendOpenResponseWithRequestHeader_payload_status___block_invoke;
    v16[3] = &unk_1E89C2350;
    v16[4] = v12;
    objc_msgSend(v10, "sendResponseForRequestHeader:payload:status:completion:", v8, v9, v5, v16);
  }

}

- (void)_sendOpenResponseWithRequestHeader:(id)a3 status:(unsigned __int16)a4
{
  -[HMDDataStreamBulkSendProtocol _sendOpenResponseWithRequestHeader:payload:status:](self, "_sendOpenResponseWithRequestHeader:payload:status:", a3, MEMORY[0x1E0C9AA70], a4);
}

- (id)_createSessionIdentifier
{
  void *v3;
  uint64_t v4;

  v3 = (void *)MEMORY[0x1E0CB37E8];
  v4 = -[HMDDataStreamBulkSendProtocol nextSessionIdentifier](self, "nextSessionIdentifier");
  -[HMDDataStreamBulkSendProtocol setNextSessionIdentifier:](self, "setNextSessionIdentifier:", (v4 + 1));
  return (id)objc_msgSend(v3, "numberWithUnsignedInt:", v4);
}

- (void)_startSessionCandidate:(id)a3 queue:(id)a4 callback:(id)a5
{
  id v8;
  NSObject *v9;
  id v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  id v19;
  id v20;
  _QWORD v21[4];
  id v22;
  id v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  -[HMDDataStreamBulkSendProtocol _createSessionFromCandidate:queue:](self, "_createSessionFromCandidate:queue:", v8, v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  objc_msgSend(v8, "pendingReads");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
  if (v13)
  {
    v14 = v13;
    v15 = *(_QWORD *)v25;
    do
    {
      v16 = 0;
      do
      {
        if (*(_QWORD *)v25 != v15)
          objc_enumerationMutation(v12);
        -[HMDDataStreamBulkSendProtocol _pumpMessage:session:](self, "_pumpMessage:session:", *(_QWORD *)(*((_QWORD *)&v24 + 1) + 8 * v16++), v11);
      }
      while (v14 != v16);
      v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
    }
    while (v14);
  }

  objc_msgSend(v8, "receivedFailure");
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  if (v17)
  {
    objc_msgSend(v8, "receivedFailure");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDDataStreamBulkSendProtocol _pumpReceiveFailure:session:](self, "_pumpReceiveFailure:session:", v18, v11);

  }
  v21[0] = MEMORY[0x1E0C809B0];
  v21[1] = 3221225472;
  v21[2] = __71__HMDDataStreamBulkSendProtocol__startSessionCandidate_queue_callback___block_invoke;
  v21[3] = &unk_1E89C1D68;
  v22 = v11;
  v23 = v10;
  v19 = v11;
  v20 = v10;
  dispatch_async(v9, v21);

}

- (void)_rejectSessionCandidate:(id)a3 status:(unsigned __int16)a4
{
  uint64_t v4;
  id v6;

  v4 = a4;
  objc_msgSend(a3, "requestHeader");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  -[HMDDataStreamBulkSendProtocol _sendOpenResponseWithRequestHeader:bulkSendStatus:](self, "_sendOpenResponseWithRequestHeader:bulkSendStatus:", v6, v4);

}

- (id)_getBulkSendSessionForSessionIdentifier:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[HMDDataStreamBulkSendProtocol activeBulkSendSessions](self, "activeBulkSendSessions");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (void)_removeBulkSendSessionForSessionIdentifier:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[HMDDataStreamBulkSendProtocol activeBulkSendSessions](self, "activeBulkSendSessions");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeObjectForKey:", v4);

}

- (void)_handleOpenWithRequestHeader:(id)a3 payload:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  HMDDataStreamBulkSendProtocol *v20;
  NSObject *v21;
  NSObject *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  HMDDataStreamBulkSendProtocol *v27;
  NSObject *v28;
  void *v29;
  void *v30;
  int v31;
  void *v32;
  __int16 v33;
  id v34;
  __int16 v35;
  id v36;
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("type"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v9 = v8;
  else
    v9 = 0;
  v10 = v9;

  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("target"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v12 = v11;
  else
    v12 = 0;
  v13 = v12;

  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("metadata"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v15 = v14;
  else
    v15 = 0;
  v16 = v15;

  if (v10 && v13)
  {
    -[HMDDataStreamBulkSendProtocol listeners](self, "listeners");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "objectForKey:", v10);
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    v19 = (void *)MEMORY[0x1D17BA0A0]();
    v20 = self;
    HMFGetOSLogHandle();
    v21 = objc_claimAutoreleasedReturnValue();
    v22 = v21;
    if (v18)
    {
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
      {
        HMFGetLogIdentifier();
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        v31 = 138543618;
        v32 = v23;
        v33 = 2112;
        v34 = v10;
        _os_log_impl(&dword_1CD062000, v22, OS_LOG_TYPE_DEBUG, "%{public}@Received 'open' with type=%@; passing to listener",
          (uint8_t *)&v31,
          0x16u);

      }
      objc_autoreleasePoolPop(v19);
      -[HMDDataStreamBulkSendProtocol _createSessionCandidateWithRequestHeader:metadata:](v20, "_createSessionCandidateWithRequestHeader:metadata:", v6, v16);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMDDataStreamBulkSendProtocol accessory](v20, "accessory");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "accessory:didReceiveBulkSessionCandidate:", v25, v24);

    }
    else
    {
      if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        v31 = 138543618;
        v32 = v30;
        v33 = 2112;
        v34 = v10;
        _os_log_impl(&dword_1CD062000, v22, OS_LOG_TYPE_INFO, "%{public}@Received 'open' for type=%@ but no active listener accepted it", (uint8_t *)&v31, 0x16u);

      }
      objc_autoreleasePoolPop(v19);
      -[HMDDataStreamBulkSendProtocol _maybeSubmitMetricForDroppedOpenRequestOfType:](v20, "_maybeSubmitMetricForDroppedOpenRequestOfType:", v10);
      -[HMDDataStreamBulkSendProtocol _sendOpenResponseWithRequestHeader:bulkSendStatus:](v20, "_sendOpenResponseWithRequestHeader:bulkSendStatus:", v6, 1);
    }

  }
  else
  {
    v26 = (void *)MEMORY[0x1D17BA0A0]();
    v27 = self;
    HMFGetOSLogHandle();
    v28 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      v31 = 138543874;
      v32 = v29;
      v33 = 2112;
      v34 = v10;
      v35 = 2112;
      v36 = v13;
      _os_log_impl(&dword_1CD062000, v28, OS_LOG_TYPE_INFO, "%{public}@Dropping 'open' because it is missing required keys (type=%@, target=%@)", (uint8_t *)&v31, 0x20u);

    }
    objc_autoreleasePoolPop(v26);
    -[HMDDataStreamBulkSendProtocol _sendOpenResponseWithRequestHeader:status:](v27, "_sendOpenResponseWithRequestHeader:status:", v6, 4);
  }

}

- (void)_handleCloseMessage:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  HMDDataStreamBulkSendProtocol *v17;
  NSObject *v18;
  NSObject *v19;
  void *v20;
  void *v21;
  HMDDataStreamBulkSendProtocol *v22;
  NSObject *v23;
  void *v24;
  void *v25;
  int v26;
  void *v27;
  __int16 v28;
  id v29;
  const __CFString *v30;
  _QWORD v31[2];

  v31[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("streamId"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v6 = v5;
  else
    v6 = 0;
  v7 = v6;

  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("reason"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v9 = v8;
  else
    v9 = 0;
  v10 = v9;

  if (v7)
  {
    if (v10)
      v10 = v8;
    else
      v10 = &unk_1E8B33D68;
    v11 = (void *)MEMORY[0x1E0CB35C8];
    v12 = *MEMORY[0x1E0CB8C70];
    v30 = CFSTR("reason");
    v31[0] = v10;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v31, &v30, 1);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "errorWithDomain:code:userInfo:", v12, 1054, v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    -[HMDDataStreamBulkSendProtocol _getBulkSendSessionForSessionIdentifier:](self, "_getBulkSendSessionForSessionIdentifier:", v7);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = (void *)MEMORY[0x1D17BA0A0]();
    v17 = self;
    HMFGetOSLogHandle();
    v18 = objc_claimAutoreleasedReturnValue();
    v19 = v18;
    if (v15)
    {
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        HMFGetLogIdentifier();
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v26 = 138543618;
        v27 = v20;
        v28 = 2112;
        v29 = v7;
        _os_log_impl(&dword_1CD062000, v19, OS_LOG_TYPE_DEFAULT, "%{public}@Received close packet for stream identifier: %@", (uint8_t *)&v26, 0x16u);

      }
      objc_autoreleasePoolPop(v16);
      -[HMDDataStreamBulkSendProtocol _pumpReceiveFailure:session:](v17, "_pumpReceiveFailure:session:", v14, v15);
    }
    else
    {
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
      {
        HMFGetLogIdentifier();
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        v26 = 138543618;
        v27 = v25;
        v28 = 2112;
        v29 = v7;
        _os_log_impl(&dword_1CD062000, v19, OS_LOG_TYPE_DEBUG, "%{public}@Close packet for streamIdentifier=%@ dropped because no session is active", (uint8_t *)&v26, 0x16u);

      }
      objc_autoreleasePoolPop(v16);
    }

  }
  else
  {
    v21 = (void *)MEMORY[0x1D17BA0A0]();
    v22 = self;
    HMFGetOSLogHandle();
    v23 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = 138543362;
      v27 = v24;
      _os_log_impl(&dword_1CD062000, v23, OS_LOG_TYPE_ERROR, "%{public}@Close dropped because streamIdentifier was not included", (uint8_t *)&v26, 0xCu);

    }
    objc_autoreleasePoolPop(v21);
  }

}

- (void)_handleDataMessage:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  HMDDataStreamBulkSendProtocol *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  HMDDataStreamBulkSendProtocol *v14;
  NSObject *v15;
  void *v16;
  int v17;
  void *v18;
  __int16 v19;
  id v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("streamId"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v6 = v5;
  else
    v6 = 0;
  v7 = v6;

  if (v7)
  {
    -[HMDDataStreamBulkSendProtocol _getBulkSendSessionForSessionIdentifier:](self, "_getBulkSendSessionForSessionIdentifier:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      -[HMDDataStreamBulkSendProtocol _pumpMessage:session:](self, "_pumpMessage:session:", v4, v8);
    }
    else
    {
      v13 = (void *)MEMORY[0x1D17BA0A0]();
      v14 = self;
      HMFGetOSLogHandle();
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
      {
        HMFGetLogIdentifier();
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = 138543618;
        v18 = v16;
        v19 = 2112;
        v20 = v7;
        _os_log_impl(&dword_1CD062000, v15, OS_LOG_TYPE_DEBUG, "%{public}@Data packet for streamIdentifier=%@ dropped because no session is active", (uint8_t *)&v17, 0x16u);

      }
      objc_autoreleasePoolPop(v13);
    }

  }
  else
  {
    v9 = (void *)MEMORY[0x1D17BA0A0]();
    v10 = self;
    HMFGetOSLogHandle();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = 138543362;
      v18 = v12;
      _os_log_impl(&dword_1CD062000, v11, OS_LOG_TYPE_ERROR, "%{public}@Data packet dropped because no session identifier was present", (uint8_t *)&v17, 0xCu);

    }
    objc_autoreleasePoolPop(v9);
  }

}

- (void)_pumpMessage:(id)a3 session:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  HMDDataStreamBulkSendProtocol *v18;
  NSObject *v19;
  void *v20;
  int v21;
  void *v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("packets"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v9 = v8;
  else
    v9 = 0;
  v10 = v9;

  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("endOfStream"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v12 = v11;
  else
    v12 = 0;
  v13 = v12;

  if (!v13)
  {
    if (!v10)
      goto LABEL_15;
    v15 = 0;
    goto LABEL_13;
  }
  v14 = objc_msgSend(v13, "BOOLValue");
  v15 = v14;
  if (v10)
  {
LABEL_13:
    v16 = objc_msgSend(v10, "count");
    if ((v15 & 1) != 0 || v16)
      goto LABEL_18;
    goto LABEL_15;
  }
  if ((v14 & 1) != 0)
  {
    v15 = 1;
LABEL_18:
    objc_msgSend(v7, "asyncHandleIncomingPackets:isEof:", v10, v15);
    goto LABEL_19;
  }
LABEL_15:
  v17 = (void *)MEMORY[0x1D17BA0A0]();
  v18 = self;
  HMFGetOSLogHandle();
  v19 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = 138543362;
    v22 = v20;
    _os_log_impl(&dword_1CD062000, v19, OS_LOG_TYPE_INFO, "%{public}@Received message with no packets", (uint8_t *)&v21, 0xCu);

  }
  objc_autoreleasePoolPop(v17);
LABEL_19:

}

- (void)_pumpReceiveFailure:(id)a3 session:(id)a4
{
  id v6;
  id v7;

  v6 = a4;
  objc_msgSend(v6, "asyncHandleRemoteCloseWithError:", a3);
  objc_msgSend(v6, "sessionIdentifier");
  v7 = (id)objc_claimAutoreleasedReturnValue();

  -[HMDDataStreamBulkSendProtocol _removeBulkSendSessionForSessionIdentifier:](self, "_removeBulkSendSessionForSessionIdentifier:", v7);
}

- (void)_cancelSessionWithIdentifier:(id)a3 reason:(unsigned __int16)a4 hadReceivedEof:(BOOL)a5
{
  _BOOL4 v5;
  uint64_t v6;
  id v8;

  v5 = a5;
  v6 = a4;
  v8 = a3;
  -[HMDDataStreamBulkSendProtocol _removeBulkSendSessionForSessionIdentifier:](self, "_removeBulkSendSessionForSessionIdentifier:");
  if ((_DWORD)v6 || !v5)
    -[HMDDataStreamBulkSendProtocol _sendCloseMessageWithIdentifier:reason:](self, "_sendCloseMessageWithIdentifier:reason:", v8, v6);
  else
    -[HMDDataStreamBulkSendProtocol _sendAckMessageWithIdentifier:](self, "_sendAckMessageWithIdentifier:", v8);

}

- (void)_sendCloseMessageWithIdentifier:(id)a3 reason:(unsigned __int16)a4
{
  uint64_t v4;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  HMDDataStreamBulkSendProtocol *v11;
  NSObject *v12;
  void *v13;
  int v14;
  void *v15;
  __int16 v16;
  id v17;
  __int16 v18;
  int v19;
  _QWORD v20[2];
  _QWORD v21[3];

  v4 = a4;
  v21[2] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  -[HMDDataStreamBulkSendProtocol dataStream](self, "dataStream");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v20[0] = CFSTR("streamId");
    v20[1] = CFSTR("reason");
    v21[0] = v6;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedShort:", v4);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v21[1] = v8;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v21, v20, 2);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    v10 = (void *)MEMORY[0x1D17BA0A0]();
    v11 = self;
    HMFGetOSLogHandle();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = 138543874;
      v15 = v13;
      v16 = 2112;
      v17 = v6;
      v18 = 1024;
      v19 = v4;
      _os_log_impl(&dword_1CD062000, v12, OS_LOG_TYPE_INFO, "%{public}@Sending 'close' for sid=%@ with reason %d", (uint8_t *)&v14, 0x1Cu);

    }
    objc_autoreleasePoolPop(v10);
    objc_msgSend(v7, "sendEventForProtocol:topic:payload:completion:", CFSTR("dataSend"), CFSTR("close"), v9, &__block_literal_global_42);

  }
}

- (void)_sendAckMessageWithIdentifier:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  HMDDataStreamBulkSendProtocol *v8;
  NSObject *v9;
  void *v10;
  int v11;
  void *v12;
  __int16 v13;
  id v14;
  _QWORD v15[2];
  _QWORD v16[3];

  v16[2] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[HMDDataStreamBulkSendProtocol dataStream](self, "dataStream");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v15[0] = CFSTR("streamId");
    v15[1] = CFSTR("endOfStream");
    v16[0] = v4;
    v16[1] = MEMORY[0x1E0C9AAB0];
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v16, v15, 2);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (void *)MEMORY[0x1D17BA0A0]();
    v8 = self;
    HMFGetOSLogHandle();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = 138543618;
      v12 = v10;
      v13 = 2112;
      v14 = v4;
      _os_log_impl(&dword_1CD062000, v9, OS_LOG_TYPE_INFO, "%{public}@Sending 'ack' for sid=%@", (uint8_t *)&v11, 0x16u);

    }
    objc_autoreleasePoolPop(v7);
    objc_msgSend(v5, "sendEventForProtocol:topic:payload:completion:", CFSTR("dataSend"), CFSTR("ack"), v6, &__block_literal_global_43_119942);

  }
}

- (void)openSessionForFileType:(id)a3 reason:(id)a4 metadata:(id)a5 queue:(id)a6 callback:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  NSObject *v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  _QWORD v23[5];
  id v24;
  id v25;
  id v26;
  id v27;
  id v28;

  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  -[HMDDataStreamBulkSendProtocol queue](self, "queue");
  v17 = objc_claimAutoreleasedReturnValue();
  v23[0] = MEMORY[0x1E0C809B0];
  v23[1] = 3221225472;
  v23[2] = __87__HMDDataStreamBulkSendProtocol_openSessionForFileType_reason_metadata_queue_callback___block_invoke;
  v23[3] = &unk_1E89C0790;
  v23[4] = self;
  v24 = v12;
  v25 = v13;
  v26 = v14;
  v27 = v15;
  v28 = v16;
  v18 = v16;
  v19 = v15;
  v20 = v14;
  v21 = v13;
  v22 = v12;
  dispatch_async(v17, v23);

}

- (void)_openSessionForFileType:(id)a3 reason:(id)a4 metadata:(id)a5 queue:(id)a6 callback:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  NSObject *v17;
  void *v18;
  void *v19;
  void *v20;
  void (**v21)(_QWORD, _QWORD);
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  HMDDataStreamBulkSendProtocol *v33;
  NSObject *v34;
  void *v35;
  void *v36;
  id v37;
  id v38;
  id v39;
  void *v40;
  void *v41;
  _QWORD v42[5];
  id v43;
  id v44;
  id v45;
  uint8_t buf[4];
  void *v47;
  __int16 v48;
  void *v49;
  __int16 v50;
  id v51;
  _QWORD v52[4];
  _QWORD v53[6];

  v53[4] = *MEMORY[0x1E0C80C00];
  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  -[HMDDataStreamBulkSendProtocol queue](self, "queue");
  v17 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v17);

  -[HMDDataStreamBulkSendProtocol _createSessionIdentifier](self, "_createSessionIdentifier");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v52[0] = CFSTR("type");
  v52[1] = CFSTR("streamId");
  v40 = v13;
  v41 = v12;
  v53[0] = v12;
  v53[1] = v18;
  v52[2] = CFSTR("target");
  v52[3] = CFSTR("reason");
  v53[2] = CFSTR("controller");
  v53[3] = v13;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v53, v52, 4);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = (void *)objc_msgSend(v19, "mutableCopy");

  if (v14 && objc_msgSend(v14, "count"))
    objc_msgSend(v20, "setObject:forKeyedSubscript:", v14, CFSTR("metadata"));
  -[HMDDataStreamBulkSendProtocol bulkSendSessionContextFactory](self, "bulkSendSessionContextFactory");
  v21 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
  ((void (**)(_QWORD, id))v21)[2](v21, v16);
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  -[HMDDataStreamBulkSendProtocol pendingBulkSendSessionContextBySessionIdentifier](self, "pendingBulkSendSessionContextBySessionIdentifier");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "setObject:forKeyedSubscript:", v22, v18);

  objc_msgSend(v22, "handleOpenRequestResponseTimer");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "setDelegate:", self);

  -[HMDDataStreamBulkSendProtocol queue](self, "queue");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "handleOpenRequestResponseTimer");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "setDelegateQueue:", v25);

  objc_msgSend(v22, "handleOpenRequestResponseTimer");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "resume");

  objc_msgSend(v22, "sendCloseEventTimer");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "setDelegate:", self);

  -[HMDDataStreamBulkSendProtocol queue](self, "queue");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "sendCloseEventTimer");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "setDelegateQueue:", v29);

  objc_msgSend(v22, "sendCloseEventTimer");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "resume");

  v32 = (void *)MEMORY[0x1D17BA0A0]();
  v33 = self;
  HMFGetOSLogHandle();
  v34 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v34, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    v47 = v35;
    v48 = 2112;
    v49 = v18;
    v50 = 2112;
    v51 = v14;
    _os_log_impl(&dword_1CD062000, v34, OS_LOG_TYPE_INFO, "%{public}@Starting bulk session with identifier: %@ and metadata: %@", buf, 0x20u);

  }
  objc_autoreleasePoolPop(v32);
  -[HMDDataStreamBulkSendProtocol dataStream](v33, "dataStream");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  v42[0] = MEMORY[0x1E0C809B0];
  v42[1] = 3221225472;
  v42[2] = __88__HMDDataStreamBulkSendProtocol__openSessionForFileType_reason_metadata_queue_callback___block_invoke;
  v42[3] = &unk_1E89B4B10;
  v42[4] = v33;
  v43 = v18;
  v44 = v15;
  v45 = v16;
  v37 = v15;
  v38 = v16;
  v39 = v18;
  objc_msgSend(v36, "sendRequestForProtocol:topic:payload:completion:", CFSTR("dataSend"), CFSTR("open"), v20, v42);

}

- (void)timerDidFire:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  id v15;
  id v16;
  void *v17;
  HMDDataStreamBulkSendProtocol *v18;
  NSObject *v19;
  void *v20;
  const char *v21;
  HMDDataStreamBulkSendProtocol *v22;
  void *v23;
  void *v24;
  void *v25;
  HMDDataStreamBulkSendProtocol *v26;
  NSObject *v27;
  void *v28;
  void *v29;
  HMDDataStreamBulkSendProtocol *v30;
  NSObject *v31;
  void *v32;
  void (**v33)(_QWORD, _QWORD, _QWORD);
  void *v34;
  void *v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  uint8_t buf[4];
  void *v41;
  __int16 v42;
  id v43;
  _BYTE v44[128];
  uint64_t v45;

  v45 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[HMDDataStreamBulkSendProtocol queue](self, "queue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  v38 = 0u;
  v39 = 0u;
  v36 = 0u;
  v37 = 0u;
  -[HMDDataStreamBulkSendProtocol pendingBulkSendSessionContextBySessionIdentifier](self, "pendingBulkSendSessionContextBySessionIdentifier", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v36, v44, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v37;
LABEL_3:
    v10 = 0;
    while (1)
    {
      if (*(_QWORD *)v37 != v9)
        objc_enumerationMutation(v6);
      v11 = *(void **)(*((_QWORD *)&v36 + 1) + 8 * v10);
      -[HMDDataStreamBulkSendProtocol pendingBulkSendSessionContextBySessionIdentifier](self, "pendingBulkSendSessionContextBySessionIdentifier");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "objectForKey:", v11);
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v13, "handleOpenRequestResponseTimer");
      v14 = (id)objc_claimAutoreleasedReturnValue();

      if (v14 == v4)
      {
        objc_msgSend(v13, "setHandleOpenRequestResponseTimer:", 0);
        v16 = v11;
        v17 = (void *)MEMORY[0x1D17BA0A0]();
        v18 = self;
        HMFGetOSLogHandle();
        v19 = objc_claimAutoreleasedReturnValue();
        if (!os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
          goto LABEL_16;
        HMFGetLogIdentifier();
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v41 = v20;
        v42 = 2112;
        v43 = v16;
        v21 = "%{public}@Session with identifier: %@ open request response timer has expired";
        goto LABEL_15;
      }
      objc_msgSend(v13, "sendCloseEventTimer");
      v15 = (id)objc_claimAutoreleasedReturnValue();

      if (v15 == v4)
        break;

      if (v8 == ++v10)
      {
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v36, v44, 16);
        if (v8)
          goto LABEL_3;
        goto LABEL_10;
      }
    }
    objc_msgSend(v13, "setSendCloseEventTimer:", 0);
    v16 = v11;
    v17 = (void *)MEMORY[0x1D17BA0A0]();
    v22 = self;
    HMFGetOSLogHandle();
    v19 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
      goto LABEL_16;
    HMFGetLogIdentifier();
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v41 = v20;
    v42 = 2112;
    v43 = v16;
    v21 = "%{public}@Session with identifier: %@ send event close timer has expired";
LABEL_15:
    _os_log_impl(&dword_1CD062000, v19, OS_LOG_TYPE_INFO, v21, buf, 0x16u);

LABEL_16:
    objc_autoreleasePoolPop(v17);

    if (!v16)
      goto LABEL_21;
    -[HMDDataStreamBulkSendProtocol pendingBulkSendSessionContextBySessionIdentifier](self, "pendingBulkSendSessionContextBySessionIdentifier");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "objectForKeyedSubscript:", v16);
    v24 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v24, "shouldCloseSessionWithTimeoutReason"))
    {
      v25 = (void *)MEMORY[0x1D17BA0A0]();
      v26 = self;
      HMFGetOSLogHandle();
      v27 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v41 = v28;
        _os_log_impl(&dword_1CD062000, v27, OS_LOG_TYPE_INFO, "%{public}@Skipping invoking the session start callback since handle response timer hasn't expired", buf, 0xCu);

      }
      objc_autoreleasePoolPop(v25);
    }
    else
    {
      objc_msgSend(v24, "sessionStartCallback");
      v33 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB8C70], 8, 0);
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      ((void (**)(_QWORD, _QWORD, void *))v33)[2](v33, 0, v34);
      -[HMDDataStreamBulkSendProtocol pendingBulkSendSessionContextBySessionIdentifier](self, "pendingBulkSendSessionContextBySessionIdentifier");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v35, "setObject:forKeyedSubscript:", 0, v16);

    }
  }
  else
  {
LABEL_10:

LABEL_21:
    v29 = (void *)MEMORY[0x1D17BA0A0]();
    v30 = self;
    HMFGetOSLogHandle();
    v31 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v31, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v41 = v32;
      v42 = 2112;
      v43 = 0;
      _os_log_impl(&dword_1CD062000, v31, OS_LOG_TYPE_INFO, "%{public}@Could not find expired timer for session with identifier: %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v29);
  }

}

- (HMDDataStreamProtocolDelegate)dataStream
{
  return (HMDDataStreamProtocolDelegate *)objc_loadWeakRetained((id *)&self->_dataStream);
}

- (void)setDataStream:(id)a3
{
  objc_storeWeak((id *)&self->_dataStream, a3);
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
  objc_storeStrong((id *)&self->_queue, a3);
}

- (id)accessory
{
  return objc_loadWeakRetained(&self->_accessory);
}

- (void)setAccessory:(id)a3
{
  objc_storeWeak(&self->_accessory, a3);
}

- (NSMapTable)listeners
{
  return self->_listeners;
}

- (void)setListeners:(id)a3
{
  objc_storeStrong((id *)&self->_listeners, a3);
}

- (BOOL)isConnected
{
  return self->_isConnected;
}

- (void)setIsConnected:(BOOL)a3
{
  self->_isConnected = a3;
}

- (NSString)logIdentifier
{
  return self->_logIdentifier;
}

- (unsigned)nextSessionIdentifier
{
  return self->_nextSessionIdentifier;
}

- (void)setNextSessionIdentifier:(unsigned int)a3
{
  self->_nextSessionIdentifier = a3;
}

- (NSMapTable)activeBulkSendSessions
{
  return (NSMapTable *)objc_getProperty(self, a2, 56, 1);
}

- (NSMutableDictionary)pendingBulkSendSessionContextBySessionIdentifier
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 64, 1);
}

- (id)bulkSendSessionContextFactory
{
  return objc_getProperty(self, a2, 72, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_bulkSendSessionContextFactory, 0);
  objc_storeStrong((id *)&self->_pendingBulkSendSessionContextBySessionIdentifier, 0);
  objc_storeStrong((id *)&self->_activeBulkSendSessions, 0);
  objc_storeStrong((id *)&self->_logIdentifier, 0);
  objc_storeStrong((id *)&self->_listeners, 0);
  objc_destroyWeak(&self->_accessory);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_destroyWeak((id *)&self->_dataStream);
}

void __88__HMDDataStreamBulkSendProtocol__openSessionForFileType_reason_metadata_queue_callback___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  HMDDataStreamBulkSendSession *v7;
  id v8;
  id v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  NSObject *v15;
  _BOOL4 v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  NSObject *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  unsigned __int16 v30;
  unsigned __int16 v31;
  HMDDataStreamBulkSendSession *v32;
  HMDDataStreamBulkSendSession *v33;
  uint64_t v34;
  uint64_t v35;
  void *v36;
  id v37;
  NSObject *v38;
  void *v39;
  HMDDataStreamBulkSendSession *v40;
  void *v41;
  uint64_t v42;
  uint64_t v43;
  void *v44;
  void *v45;
  HMDDataStreamBulkSendOpenSessionResult *v46;
  void *v47;
  id v48;
  NSObject *v49;
  void *v50;
  void *v51;
  void *v52;
  void *context;
  void *v54;
  uint8_t buf[4];
  void *v56;
  __int16 v57;
  void *v58;
  __int16 v59;
  HMDDataStreamBulkSendSession *v60;
  __int16 v61;
  void *v62;
  uint64_t v63;

  v63 = *MEMORY[0x1E0C80C00];
  v7 = a2;
  v8 = a3;
  v9 = a4;
  objc_msgSend(*(id *)(a1 + 32), "queue");
  v10 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v10);

  objc_msgSend(*(id *)(a1 + 32), "pendingBulkSendSessionContextBySessionIdentifier");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "objectForKey:", *(_QWORD *)(a1 + 40));
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = (void *)MEMORY[0x1D17BA0A0]();
  v14 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v15 = objc_claimAutoreleasedReturnValue();
  v16 = os_log_type_enabled(v15, OS_LOG_TYPE_INFO);
  if (v12)
  {
    if (v16)
    {
      HMFGetLogIdentifier();
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = *(void **)(a1 + 40);
      *(_DWORD *)buf = 138543874;
      v56 = v17;
      v57 = 2112;
      v58 = v18;
      v59 = 2112;
      v60 = v7;
      _os_log_impl(&dword_1CD062000, v15, OS_LOG_TYPE_INFO, "%{public}@Received bulk send open response for session with identifier: %@ error: %@", buf, 0x20u);

    }
    objc_autoreleasePoolPop(v13);
    objc_msgSend(*(id *)(a1 + 32), "pendingBulkSendSessionContextBySessionIdentifier");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "removeObjectForKey:", *(_QWORD *)(a1 + 40));

    if (objc_msgSend(v12, "shouldCloseSessionWithTimeoutReason"))
    {
      v20 = (void *)MEMORY[0x1D17BA0A0]();
      v21 = *(id *)(a1 + 32);
      HMFGetOSLogHandle();
      v22 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        v24 = *(void **)(a1 + 40);
        *(_DWORD *)buf = 138543618;
        v56 = v23;
        v57 = 2112;
        v58 = v24;
        _os_log_impl(&dword_1CD062000, v22, OS_LOG_TYPE_INFO, "%{public}@Session with identifier: %@ has timed out, sending close event to accessory", buf, 0x16u);

      }
      objc_autoreleasePoolPop(v20);
      objc_msgSend(*(id *)(a1 + 32), "_sendCloseMessageWithIdentifier:reason:", *(_QWORD *)(a1 + 40), 6);
      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB8C70], 8, 0);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();

    }
    else if (v7)
    {
      (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
    }
    else
    {
      objc_msgSend(v8, "hmf_numberForKey:", CFSTR("status"));
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      v29 = v28;
      if (v28)
      {
        v30 = objc_msgSend(v28, "integerValue");
        v54 = v29;
        if (v30)
        {
          v31 = v30;
          objc_msgSend(v9, "hmf_numberForKey:", CFSTR("status"));
          v32 = (HMDDataStreamBulkSendSession *)objc_claimAutoreleasedReturnValue();
          v33 = v32;
          if (v32)
          {
            if (-[HMDDataStreamBulkSendSession integerValue](v32, "integerValue") == 2)
              v34 = 14;
            else
              v34 = 23;
            if (-[HMDDataStreamBulkSendSession integerValue](v33, "integerValue") == 9)
              v35 = 21;
            else
              v35 = v34;
          }
          else
          {
            v35 = 23;
          }
          objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB8C70], v35, 0);
          v47 = (void *)objc_claimAutoreleasedReturnValue();
          context = (void *)MEMORY[0x1D17BA0A0]();
          v48 = *(id *)(a1 + 32);
          HMFGetOSLogHandle();
          v49 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v49, OS_LOG_TYPE_ERROR))
          {
            HMFGetLogIdentifier();
            v52 = v47;
            v50 = (void *)objc_claimAutoreleasedReturnValue();
            HMDStringFromDataStreamMessageStatus(v31);
            v51 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138544130;
            v56 = v50;
            v57 = 2112;
            v58 = v51;
            v59 = 2112;
            v60 = v33;
            v61 = 2112;
            v62 = v52;
            _os_log_impl(&dword_1CD062000, v49, OS_LOG_TYPE_ERROR, "%{public}@Received non-success status in header: %@ payload status: %@. Mapped to error: %@", buf, 0x2Au);

            v47 = v52;
          }

          objc_autoreleasePoolPop(context);
          (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();

          v29 = v54;
        }
        else
        {
          v40 = [HMDDataStreamBulkSendSession alloc];
          v41 = *(void **)(a1 + 32);
          v42 = *(_QWORD *)(a1 + 40);
          v43 = *(_QWORD *)(a1 + 48);
          objc_msgSend(v41, "logIdentifier");
          v44 = (void *)objc_claimAutoreleasedReturnValue();
          v33 = -[HMDDataStreamBulkSendSession initWithProtocol:sessionIdentifier:queue:logIdentifier:](v40, "initWithProtocol:sessionIdentifier:queue:logIdentifier:", v41, v42, v43, v44);

          v29 = v54;
          objc_msgSend(*(id *)(a1 + 32), "activeBulkSendSessions");
          v45 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v45, "setObject:forKey:", v33, *(_QWORD *)(a1 + 40));

          v46 = -[HMDDataStreamBulkSendOpenSessionResult initWithSession:payload:]([HMDDataStreamBulkSendOpenSessionResult alloc], "initWithSession:payload:", v33, v9);
          (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();

        }
      }
      else
      {
        v36 = (void *)MEMORY[0x1D17BA0A0]();
        v37 = *(id *)(a1 + 32);
        HMFGetOSLogHandle();
        v38 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
        {
          HMFGetLogIdentifier();
          v39 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543362;
          v56 = v39;
          _os_log_impl(&dword_1CD062000, v38, OS_LOG_TYPE_ERROR, "%{public}@Could not find a status in header", buf, 0xCu);

        }
        objc_autoreleasePoolPop(v36);
        objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB8C70], 27, 0);
        v33 = (HMDDataStreamBulkSendSession *)objc_claimAutoreleasedReturnValue();
        (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
      }

    }
  }
  else
  {
    if (v16)
    {
      HMFGetLogIdentifier();
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = *(void **)(a1 + 40);
      *(_DWORD *)buf = 138543618;
      v56 = v26;
      v57 = 2112;
      v58 = v27;
      _os_log_impl(&dword_1CD062000, v15, OS_LOG_TYPE_INFO, "%{public}@Could not find pending bulk send session context for session identifier: %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v13);
    objc_msgSend(*(id *)(a1 + 32), "_sendCloseMessageWithIdentifier:reason:", *(_QWORD *)(a1 + 40), 6);
  }

}

uint64_t __87__HMDDataStreamBulkSendProtocol_openSessionForFileType_reason_metadata_queue_callback___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_openSessionForFileType:reason:metadata:queue:callback:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 72));
}

uint64_t __71__HMDDataStreamBulkSendProtocol__startSessionCandidate_queue_callback___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

void __83__HMDDataStreamBulkSendProtocol__sendOpenResponseWithRequestHeader_payload_status___block_invoke(uint64_t a1, void *a2)
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
  int v13;
  void *v14;
  __int16 v15;
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = (void *)MEMORY[0x1D17BA0A0]();
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
      v13 = 138543618;
      v14 = v8;
      v15 = 2112;
      v16 = v3;
      v9 = "%{public}@Failed to send open response: %@";
      v10 = v7;
      v11 = OS_LOG_TYPE_ERROR;
      v12 = 22;
LABEL_6:
      _os_log_impl(&dword_1CD062000, v10, v11, v9, (uint8_t *)&v13, v12);

    }
  }
  else if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = 138543362;
    v14 = v8;
    v9 = "%{public}@Sent open response";
    v10 = v7;
    v11 = OS_LOG_TYPE_INFO;
    v12 = 12;
    goto LABEL_6;
  }

  objc_autoreleasePoolPop(v4);
}

uint64_t __106__HMDDataStreamBulkSendProtocol_asyncBulkSendSessionDidCancelSessionWithIdentifier_reason_hadReceivedEof___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_cancelSessionWithIdentifier:reason:hadReceivedEof:", *(_QWORD *)(a1 + 40), *(unsigned __int16 *)(a1 + 48), *(unsigned __int8 *)(a1 + 50));
}

uint64_t __83__HMDDataStreamBulkSendProtocol_asyncBulkSendSessionCandidate_didRejectWithStatus___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_rejectSessionCandidate:status:", *(_QWORD *)(a1 + 40), *(unsigned __int16 *)(a1 + 48));
}

uint64_t __89__HMDDataStreamBulkSendProtocol_asyncBulkSendSessionCandidate_didAcceptOnQueue_callback___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_startSessionCandidate:queue:callback:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));
}

HMDDataStreamBulkSendPendingSessionContext *__71__HMDDataStreamBulkSendProtocol_initWithQueue_accessory_logIdentifier___block_invoke(uint64_t a1, void *a2)
{
  objc_class *v2;
  id v3;
  void *v4;
  void *v5;
  HMDDataStreamBulkSendPendingSessionContext *v6;

  v2 = (objc_class *)MEMORY[0x1E0D286C8];
  v3 = a2;
  v4 = (void *)objc_msgSend([v2 alloc], "initWithTimeInterval:options:", 0, 5.0);
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D286C8]), "initWithTimeInterval:options:", 0, 10.0);
  v6 = -[HMDDataStreamBulkSendPendingSessionContext initWithSessionStartCallback:handleOpenRequestResponseTimer:sendCloseEventTimer:]([HMDDataStreamBulkSendPendingSessionContext alloc], "initWithSessionStartCallback:handleOpenRequestResponseTimer:sendCloseEventTimer:", v3, v4, v5);

  return v6;
}

+ (id)protocolName
{
  __CFString *v2;

  v2 = CFSTR("dataSend");
  return CFSTR("dataSend");
}

@end
