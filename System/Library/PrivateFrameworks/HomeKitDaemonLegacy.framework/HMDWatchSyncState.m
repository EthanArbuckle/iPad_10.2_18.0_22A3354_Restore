@implementation HMDWatchSyncState

- (HMDWatchSyncState)initWithDeviceId:(id)a3 pairedSync:(id)a4
{
  id v6;
  id v7;
  HMDWatchSyncState *v8;
  uint64_t v9;
  NSString *deviceId;
  uint64_t v11;
  NSMutableArray *syncs;
  objc_super v14;

  v6 = a3;
  v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)HMDWatchSyncState;
  v8 = -[HMDWatchSyncState init](&v14, sel_init);
  if (v8)
  {
    v9 = objc_msgSend(v6, "copy");
    deviceId = v8->_deviceId;
    v8->_deviceId = (NSString *)v9;

    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v11 = objc_claimAutoreleasedReturnValue();
    syncs = v8->_syncs;
    v8->_syncs = (NSMutableArray *)v11;

    objc_storeStrong((id *)&v8->_pairedSync, a4);
  }

  return v8;
}

- (HMDWatchSync)currentSync
{
  void *v3;

  v3 = (void *)-[NSMutableArray count](self->_syncs, "count");
  if (v3)
  {
    -[NSMutableArray objectAtIndex:](self->_syncs, "objectAtIndex:", 0);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return (HMDWatchSync *)v3;
}

- (NSString)identifier
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x1E0CB3940];
  -[HMDWatchSyncState deviceId](self, "deviceId");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringWithFormat:", CFSTR("[HMDWatchSyncState: %@]"), v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v4;
}

- (void)addNewSync:(id)a3
{
  id v4;
  NSMutableArray *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  unint64_t v15;
  __CFString *v16;
  _BOOL4 v17;
  void *v18;
  NSObject *v19;
  _BOOL4 v20;
  void *v21;
  unint64_t v22;
  __CFString *v23;
  void *v24;
  unint64_t v25;
  __CFString *v26;
  __CFString *v27;
  void *v28;
  void *v29;
  NSObject *v30;
  void *v31;
  void *v32;
  __CFString *v33;
  __CFString *v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  uint8_t buf[4];
  void *v40;
  __int16 v41;
  void *v42;
  __int16 v43;
  __CFString *v44;
  _BYTE v45[128];
  uint64_t v46;

  v46 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v35 = 0u;
  v36 = 0u;
  v37 = 0u;
  v38 = 0u;
  v5 = self->_syncs;
  v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v35, v45, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v36;
    while (2)
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v36 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v35 + 1) + 8 * i);
        if ((objc_msgSend(v10, "inProgress", (_QWORD)v35) & 1) == 0)
        {
          v17 = +[HMDWatchSyncState isNewBetter:present:](HMDWatchSyncState, "isNewBetter:present:", objc_msgSend(v4, "syncOption"), objc_msgSend(v10, "syncOption"));
          v18 = (void *)MEMORY[0x1D17BA0A0]();
          HMFGetOSLogHandle();
          v19 = objc_claimAutoreleasedReturnValue();
          v20 = os_log_type_enabled(v19, OS_LOG_TYPE_INFO);
          if (v17)
          {
            if (v20)
            {
              HMFGetLogIdentifier();
              v21 = (void *)objc_claimAutoreleasedReturnValue();
              v22 = objc_msgSend(v4, "syncOption");
              if (v22 > 2)
                v23 = CFSTR("Unknown watch sync option");
              else
                v23 = off_1E89A60F8[v22];
              v33 = v23;
              *(_DWORD *)buf = 138543874;
              v40 = v21;
              v41 = 2112;
              v42 = v10;
              v43 = 2112;
              v44 = v33;
              _os_log_impl(&dword_1CD062000, v19, OS_LOG_TYPE_INFO, "%{public}@Upgrading %@ with %@", buf, 0x20u);

            }
            objc_autoreleasePoolPop(v18);
            objc_msgSend(v10, "setSyncOption:", objc_msgSend(v4, "syncOption"));
          }
          else
          {
            if (v20)
            {
              HMFGetLogIdentifier();
              v24 = (void *)objc_claimAutoreleasedReturnValue();
              v25 = objc_msgSend(v4, "syncOption");
              if (v25 > 2)
                v26 = CFSTR("Unknown watch sync option");
              else
                v26 = off_1E89A60F8[v25];
              v34 = v26;
              *(_DWORD *)buf = 138543874;
              v40 = v24;
              v41 = 2112;
              v42 = v10;
              v43 = 2112;
              v44 = v34;
              _os_log_impl(&dword_1CD062000, v19, OS_LOG_TYPE_INFO, "%{public}@Not upgrading %@ with %@", buf, 0x20u);

            }
            objc_autoreleasePoolPop(v18);
          }
          goto LABEL_31;
        }
      }
      v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v35, v45, 16);
      if (v7)
        continue;
      break;
    }
  }

  v11 = (void *)MEMORY[0x1D17BA0A0]();
  HMFGetOSLogHandle();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDWatchSyncState identifier](self, "identifier");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v4, "syncOption");
    if (v15 > 2)
      v16 = CFSTR("Unknown watch sync option");
    else
      v16 = off_1E89A60F8[v15];
    v27 = v16;
    *(_DWORD *)buf = 138543874;
    v40 = v13;
    v41 = 2112;
    v42 = v14;
    v43 = 2112;
    v44 = v27;
    _os_log_impl(&dword_1CD062000, v12, OS_LOG_TYPE_INFO, "%{public}@%@ Adding the sync option: %@", buf, 0x20u);

  }
  objc_autoreleasePoolPop(v11);
  -[NSMutableArray addObject:](self->_syncs, "addObject:", v4);
  -[HMDWatchSyncState pairedSync](self, "pairedSync");
  v28 = (void *)objc_claimAutoreleasedReturnValue();

  if (v28)
  {
    v29 = (void *)MEMORY[0x1D17BA0A0]();
    HMFGetOSLogHandle();
    v30 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMDWatchSyncState identifier](self, "identifier");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v40 = v31;
      v41 = 2112;
      v42 = v32;
      _os_log_impl(&dword_1CD062000, v30, OS_LOG_TYPE_INFO, "%{public}@%@ Need to sync to watch", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v29);
    -[HMDWatchSyncState pairedSync](self, "pairedSync");
    v5 = (NSMutableArray *)objc_claimAutoreleasedReturnValue();
    -[NSMutableArray needToSync](v5, "needToSync");
LABEL_31:

  }
}

- (BOOL)removeSync
{
  void *v3;
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  int v10;
  void *v11;
  __int16 v12;
  void *v13;
  __int16 v14;
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  if (-[NSMutableArray count](self->_syncs, "count"))
  {
    v3 = (void *)MEMORY[0x1D17BA0A0]();
    HMFGetOSLogHandle();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMDWatchSyncState identifier](self, "identifier");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableArray objectAtIndex:](self->_syncs, "objectAtIndex:", 0);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = 138543874;
      v11 = v5;
      v12 = 2112;
      v13 = v6;
      v14 = 2112;
      v15 = v7;
      _os_log_impl(&dword_1CD062000, v4, OS_LOG_TYPE_INFO, "%{public}@%@ Removing sync option %@, marking sync complete", (uint8_t *)&v10, 0x20u);

    }
    objc_autoreleasePoolPop(v3);
    -[NSMutableArray removeObjectAtIndex:](self->_syncs, "removeObjectAtIndex:", 0);
    -[HMDWatchSyncState pairedSync](self, "pairedSync");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "syncComplete");

  }
  return -[NSMutableArray count](self->_syncs, "count") != 0;
}

- (void)dealloc
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  objc_super v6;

  -[HMDWatchSyncState pairedSync](self, "pairedSync");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    v4 = -[NSMutableArray count](self->_syncs, "count");
    if (v4)
    {
      v5 = v4;
      do
      {
        -[HMDWatchSyncState removeSync](self, "removeSync");
        --v5;
      }
      while (v5);
    }
  }
  v6.receiver = self;
  v6.super_class = (Class)HMDWatchSyncState;
  -[HMDWatchSyncState dealloc](&v6, sel_dealloc);
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;

  v3 = (void *)MEMORY[0x1E0CB3940];
  -[HMDWatchSyncState identifier](self, "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@, %@>"), v4, self->_syncs);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (NSString)deviceId
{
  return self->_deviceId;
}

- (HMDPairedSync)pairedSync
{
  return self->_pairedSync;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pairedSync, 0);
  objc_storeStrong((id *)&self->_deviceId, 0);
  objc_storeStrong((id *)&self->_syncs, 0);
}

+ (BOOL)isNewBetter:(unint64_t)a3 present:(unint64_t)a4
{
  BOOL v4;

  v4 = a3 - 1 < 2;
  if (a4)
    v4 = 0;
  if (a4 == 2)
    return a3 == 1;
  else
    return v4;
}

@end
