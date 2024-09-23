@implementation HMDDeviceNotificationHandler

- (HMDDeviceNotificationHandler)initWithDestination:(id)a3 watchDevice:(BOOL)a4 withRequestIdentifier:(id)a5 messageDispatcher:(id)a6 home:(id)a7
{
  _BOOL8 v9;
  id v12;
  id v13;
  id v14;
  id v15;
  HMDDeviceNotificationHandlerDefaultDataSource *v16;
  HMDDeviceNotificationHandler *v17;

  v9 = a4;
  v12 = a7;
  v13 = a6;
  v14 = a5;
  v15 = a3;
  v16 = -[HMDDeviceNotificationHandlerDefaultDataSource initWithHome:]([HMDDeviceNotificationHandlerDefaultDataSource alloc], "initWithHome:", v12);
  v17 = -[HMDDeviceNotificationHandler initWithDestination:watchDevice:withRequestIdentifier:messageDispatcher:home:dataSource:](self, "initWithDestination:watchDevice:withRequestIdentifier:messageDispatcher:home:dataSource:", v15, v9, v14, v13, v12, v16);

  return v17;
}

- (HMDDeviceNotificationHandler)initWithDestination:(id)a3 watchDevice:(BOOL)a4 withRequestIdentifier:(id)a5 messageDispatcher:(id)a6 home:(id)a7 dataSource:(id)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  HMDDeviceNotificationHandler *v18;
  HMDDeviceNotificationHandler *v19;
  uint64_t v20;
  NSMutableOrderedSet *deviceNotificationsByRequestIDs;
  uint64_t v22;
  OS_dispatch_queue *workQueue;
  objc_super v25;

  v14 = a3;
  v15 = a6;
  v16 = a7;
  v17 = a8;
  v25.receiver = self;
  v25.super_class = (Class)HMDDeviceNotificationHandler;
  v18 = -[HMDDeviceNotificationHandler init](&v25, sel_init);
  v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_destination, a3);
    objc_storeWeak((id *)&v19->_home, v16);
    v19->_delaySupported = !a4;
    objc_msgSend(MEMORY[0x1E0C99E10], "orderedSet");
    v20 = objc_claimAutoreleasedReturnValue();
    deviceNotificationsByRequestIDs = v19->_deviceNotificationsByRequestIDs;
    v19->_deviceNotificationsByRequestIDs = (NSMutableOrderedSet *)v20;

    objc_msgSend(v16, "workQueue");
    v22 = objc_claimAutoreleasedReturnValue();
    workQueue = v19->_workQueue;
    v19->_workQueue = (OS_dispatch_queue *)v22;

    objc_storeStrong((id *)&v19->_messageDispatcher, a6);
    objc_storeStrong((id *)&v19->_dataSource, a8);
  }

  return v19;
}

- (void)sendNotificationForCharacteristicUpdates:(id)a3 withRequestIdentifier:(id)a4 notificationUpdateIdentifier:(id)a5 completion:(id)a6
{
  id v10;
  id v11;
  id v12;
  void (**v13)(id, void *);
  NSObject *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  unsigned int v21;
  uint64_t v22;
  id v23;
  uint64_t v24;
  uint64_t v25;
  char v26;
  uint64_t i;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  int v32;
  void *v33;
  void *v34;
  uint64_t v35;
  void *v36;
  HMDDeviceNotificationHandler *v37;
  NSObject *v38;
  void *v39;
  void *v40;
  uint64_t v41;
  void *v42;
  void *v43;
  void *v44;
  HMDDeviceNotificationHandler *v45;
  NSObject *v46;
  void *v47;
  void *v48;
  id v49;
  HMDDeviceNotificationHandler *v50;
  void (**v51)(id, void *);
  id v52;
  id v53;
  id obj;
  uint64_t v55;
  void *v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  uint8_t buf[4];
  void *v62;
  __int16 v63;
  id v64;
  __int16 v65;
  id v66;
  _BYTE v67[128];
  uint64_t v68;

  v68 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = (void (**)(id, void *))a6;
  -[HMDDeviceNotificationHandler workQueue](self, "workQueue");
  v14 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v14);

  if (objc_msgSend(v10, "count"))
  {
    v51 = v13;
    v52 = v12;
    -[HMDDeviceNotificationHandler _notificationUpdateWithRequestID:allowAdd:](self, "_notificationUpdateWithRequestID:allowAdd:", v11, 1);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDDeviceNotificationHandler home](self, "home");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "primaryResident");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "device");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "remoteDestinationString");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v50 = self;
    -[HMDDeviceNotificationHandler destination](self, "destination");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_msgSend(v19, "isEqualToString:", v20) ^ 1;

    if (v11)
      v22 = 0;
    else
      v22 = v21;
    +[HMDHAPMetadata getSharedInstance](HMDHAPMetadata, "getSharedInstance");
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    v57 = 0u;
    v58 = 0u;
    v59 = 0u;
    v60 = 0u;
    v53 = v10;
    v23 = v10;
    v24 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v57, v67, 16);
    if (v24)
    {
      v25 = v24;
      v48 = v15;
      v49 = v11;
      v26 = 0;
      obj = v23;
      v55 = *(_QWORD *)v58;
      do
      {
        for (i = 0; i != v25; ++i)
        {
          if (*(_QWORD *)v58 != v55)
            objc_enumerationMutation(obj);
          objc_msgSend(*(id *)(*((_QWORD *)&v57 + 1) + 8 * i), "characteristic");
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v28, "service");
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v28, "type");
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v29, "type");
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          v32 = objc_msgSend(v56, "shouldCoalesceCharacteristicNotifications:forService:", v30, v31);

          v22 = v32 & v22;
          objc_msgSend(v28, "type");
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v29, "type");
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          LOBYTE(v32) = objc_msgSend(v56, "requiresDeviceUnlock:forService:", v33, v34);

          v26 |= v32;
        }
        v25 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v57, v67, 16);
      }
      while (v25);

      v15 = v48;
      v13 = v51;
      v12 = v52;
      v35 = objc_msgSend(v48, "updateWithCharacteristicUpdates:notificationUpdateID:completion:", obj, v52, v51);
      v11 = v49;
      if ((v26 & 1) != 0)
      {
        v36 = (void *)MEMORY[0x1D17BA0A0](v35);
        v37 = v50;
        HMFGetOSLogHandle();
        v38 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v38, OS_LOG_TYPE_INFO))
        {
          HMFGetLogIdentifier();
          v39 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543874;
          v62 = v39;
          v63 = 2112;
          v64 = obj;
          v65 = 2112;
          v66 = v49;
          _os_log_impl(&dword_1CD062000, v38, OS_LOG_TYPE_INFO, "%{public}@Not coalescing notifications for %@, id: %@", buf, 0x20u);

        }
        objc_autoreleasePoolPop(v36);
        -[HMDDeviceNotificationHandler deviceNotificationsByRequestIDs](v37, "deviceNotificationsByRequestIDs");
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        v41 = objc_msgSend(v40, "indexOfObject:", v48);

        if (v41)
        {
          -[HMDDeviceNotificationHandler deviceNotificationsByRequestIDs](v37, "deviceNotificationsByRequestIDs");
          v42 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v42, "removeObject:", v48);

          -[HMDDeviceNotificationHandler deviceNotificationsByRequestIDs](v37, "deviceNotificationsByRequestIDs");
          v43 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v43, "insertObject:atIndex:", v48, 0);

        }
        -[HMDDeviceNotificationHandler _dispatchNotification](v37, "_dispatchNotification");
        goto LABEL_24;
      }
    }
    else
    {

      v12 = v52;
      objc_msgSend(v15, "updateWithCharacteristicUpdates:notificationUpdateID:completion:", v23, v52, v13);
    }
    -[HMDDeviceNotificationHandler _beginCoalesce:](v50, "_beginCoalesce:", v22);
LABEL_24:

    v10 = v53;
    goto LABEL_25;
  }
  v44 = (void *)MEMORY[0x1D17BA0A0]();
  v45 = self;
  HMFGetOSLogHandle();
  v46 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v46, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v62 = v47;
    v63 = 2112;
    v64 = v11;
    _os_log_impl(&dword_1CD062000, v46, OS_LOG_TYPE_INFO, "%{public}@No characteristics updated for: %@, returning", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v44);
  if (v13)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", 20);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v13[2](v13, v15);
LABEL_25:

  }
}

- (void)sendCoalescedRemoteNotificationForAccessories:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  HMDDeviceNotificationHandler *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  _QWORD v16[4];
  id v17;
  uint8_t buf[4];
  void *v19;
  __int16 v20;
  void *v21;
  __int16 v22;
  void *v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[HMDDeviceNotificationHandler workQueue](self, "workQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  if (objc_msgSend(v4, "count"))
  {
    -[HMDDeviceNotificationHandler deviceNotificationsByRequestIDs](self, "deviceNotificationsByRequestIDs");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "array");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = __78__HMDDeviceNotificationHandler_sendCoalescedRemoteNotificationForAccessories___block_invoke;
    v16[3] = &unk_1E89BBC68;
    v8 = v4;
    v17 = v8;
    objc_msgSend(v7, "na_filter:", v16);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v9, "count"))
    {
      objc_msgSend(v8, "na_map:", &__block_literal_global_159090);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = (void *)MEMORY[0x1D17BA0A0]();
      v12 = self;
      HMFGetOSLogHandle();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v9, "count"));
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        v19 = v14;
        v20 = 2112;
        v21 = v15;
        v22 = 2112;
        v23 = v10;
        _os_log_impl(&dword_1CD062000, v13, OS_LOG_TYPE_INFO, "%{public}@Sending all coalesced remote notifications including %@ updates for %@", buf, 0x20u);

      }
      objc_autoreleasePoolPop(v11);
      -[HMDDeviceNotificationHandler _dispatchNotification](v12, "_dispatchNotification");

    }
  }

}

- (id)_notificationUpdateWithRequestID:(id)a3 allowAdd:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  NSObject *v7;
  id v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  HMDDeviceNotificationUpdate *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  id v17;
  uint64_t v19;
  uint64_t v20;
  void (*v21)(uint64_t, void *, uint64_t, _BYTE *);
  void *v22;
  id v23;
  uint64_t *v24;
  uint64_t v25;
  uint64_t *v26;
  uint64_t v27;
  uint64_t (*v28)(uint64_t, uint64_t);
  void (*v29)(uint64_t);
  id v30;

  v4 = a4;
  v6 = a3;
  -[HMDDeviceNotificationHandler workQueue](self, "workQueue");
  v7 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v7);

  if (v6)
  {
    v8 = v6;
  }
  else
  {
    -[HMDDeviceNotificationHandler destination](self, "destination");
    v8 = (id)objc_claimAutoreleasedReturnValue();
  }
  v9 = v8;
  v25 = 0;
  v26 = &v25;
  v27 = 0x3032000000;
  v28 = __Block_byref_object_copy__159048;
  v29 = __Block_byref_object_dispose__159049;
  v30 = 0;
  -[HMDDeviceNotificationHandler deviceNotificationsByRequestIDs](self, "deviceNotificationsByRequestIDs");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = MEMORY[0x1E0C809B0];
  v20 = 3221225472;
  v21 = __74__HMDDeviceNotificationHandler__notificationUpdateWithRequestID_allowAdd___block_invoke;
  v22 = &unk_1E89BBCD0;
  v11 = v9;
  v23 = v11;
  v24 = &v25;
  objc_msgSend(v10, "enumerateObjectsUsingBlock:", &v19);

  v12 = (void *)v26[5];
  if (!v12 && v4)
  {
    v13 = [HMDDeviceNotificationUpdate alloc];
    v14 = -[HMDDeviceNotificationUpdate initWithRequestID:](v13, "initWithRequestID:", v11, v19, v20, v21, v22);
    v15 = (void *)v26[5];
    v26[5] = v14;

    -[HMDDeviceNotificationHandler deviceNotificationsByRequestIDs](self, "deviceNotificationsByRequestIDs");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "addObject:", v26[5]);

    v12 = (void *)v26[5];
  }
  v17 = v12;

  _Block_object_dispose(&v25, 8);
  return v17;
}

- (void)sendNotificationForMediaProperties:(id)a3 withRequestIdentifier:(id)a4 notificationUpdateIdentifier:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  unsigned int v19;
  uint64_t v20;
  void *v21;
  void *v22;
  HMDDeviceNotificationHandler *v23;
  NSObject *v24;
  void *v25;
  void *v26;
  void *v27;
  HMDDeviceNotificationHandler *v28;
  NSObject *v29;
  void *v30;
  id v31;
  uint8_t buf[4];
  void *v33;
  __int16 v34;
  id v35;
  __int16 v36;
  id v37;
  __int16 v38;
  void *v39;
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  -[HMDDeviceNotificationHandler workQueue](self, "workQueue");
  v11 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v11);

  if (objc_msgSend(v8, "count"))
  {
    -[HMDDeviceNotificationHandler _notificationUpdateWithRequestID:allowAdd:](self, "_notificationUpdateWithRequestID:allowAdd:", v9, 1);
    v31 = v8;
    v12 = objc_claimAutoreleasedReturnValue();
    -[HMDDeviceNotificationHandler home](self, "home");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "primaryResident");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "device");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "remoteDestinationString");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDDeviceNotificationHandler destination](self, "destination");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = v10;
    v19 = objc_msgSend(v16, "isEqualToString:", v17) ^ 1;

    if (v9)
      v20 = 0;
    else
      v20 = v19;
    v10 = v18;
    v21 = (void *)v12;
    v8 = v31;
    v22 = (void *)MEMORY[0x1D17BA0A0](objc_msgSend(v21, "updateWithUpdatedMediaPropertiesByMediaResponses:notificationUpdateID:completion:", v31, v10, 0));
    v23 = self;
    HMFGetOSLogHandle();
    v24 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      HMFBooleanToString();
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544130;
      v33 = v25;
      v34 = 2112;
      v35 = v31;
      v36 = 2112;
      v37 = v9;
      v38 = 2112;
      v39 = v26;
      _os_log_impl(&dword_1CD062000, v24, OS_LOG_TYPE_INFO, "%{public}@Coalescing media notifications %@, id: %@, shouldCoalesce: %@", buf, 0x2Au);

    }
    objc_autoreleasePoolPop(v22);
    -[HMDDeviceNotificationHandler _beginCoalesce:](v23, "_beginCoalesce:", v20);

  }
  else
  {
    v27 = (void *)MEMORY[0x1D17BA0A0]();
    v28 = self;
    HMFGetOSLogHandle();
    v29 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v33 = v30;
      _os_log_impl(&dword_1CD062000, v29, OS_LOG_TYPE_INFO, "%{public}@No media properties updated, returning", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v27);
  }

}

- (void)_beginCoalesce:(BOOL)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  HMDDeviceNotificationHandler *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  const char *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  int v24;
  void *v25;
  __int16 v26;
  void *v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  if (a3)
  {
    -[HMDDeviceNotificationHandler coalesceTimer](self, "coalesceTimer");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    if (v4)
      return;
    -[HMDDeviceNotificationHandler dataSource](self, "dataSource");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "timerWithType:", 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDDeviceNotificationHandler setCoalesceTimer:](self, "setCoalesceTimer:", v6);

    -[HMDDeviceNotificationHandler coalesceTimer](self, "coalesceTimer");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setDelegate:", self);

    -[HMDDeviceNotificationHandler workQueue](self, "workQueue");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDDeviceNotificationHandler coalesceTimer](self, "coalesceTimer");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setDelegateQueue:", v8);

    -[HMDDeviceNotificationHandler coalesceTimer](self, "coalesceTimer");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "resume");

    v11 = (void *)MEMORY[0x1D17BA0A0]();
    v12 = self;
    HMFGetOSLogHandle();
    v13 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
      goto LABEL_10;
    HMFGetLogIdentifier();
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDDeviceNotificationHandler coalesceTimer](v12, "coalesceTimer");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = 138543618;
    v25 = v14;
    v26 = 2112;
    v27 = v15;
    v16 = "%{public}@Running coalescence timer %@";
    goto LABEL_9;
  }
  if (!-[HMDDeviceNotificationHandler delaySupported](self, "delaySupported"))
  {
    -[HMDDeviceNotificationHandler _dispatchNotification](self, "_dispatchNotification");
    return;
  }
  -[HMDDeviceNotificationHandler delayTimer](self, "delayTimer");
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v17)
  {
    -[HMDDeviceNotificationHandler dataSource](self, "dataSource");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "timerWithType:", 1);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDDeviceNotificationHandler setDelayTimer:](self, "setDelayTimer:", v19);

    -[HMDDeviceNotificationHandler delayTimer](self, "delayTimer");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "setDelegate:", self);

    -[HMDDeviceNotificationHandler workQueue](self, "workQueue");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDDeviceNotificationHandler delayTimer](self, "delayTimer");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "setDelegateQueue:", v21);

    -[HMDDeviceNotificationHandler delayTimer](self, "delayTimer");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "resume");

    v11 = (void *)MEMORY[0x1D17BA0A0]();
    v12 = self;
    HMFGetOSLogHandle();
    v13 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
LABEL_10:

      objc_autoreleasePoolPop(v11);
      return;
    }
    HMFGetLogIdentifier();
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDDeviceNotificationHandler delayTimer](v12, "delayTimer");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = 138543618;
    v25 = v14;
    v26 = 2112;
    v27 = v15;
    v16 = "%{public}@Running delay timer %@";
LABEL_9:
    _os_log_impl(&dword_1CD062000, v13, OS_LOG_TYPE_INFO, v16, (uint8_t *)&v24, 0x16u);

    goto LABEL_10;
  }
}

- (void)_dispatchNotification
{
  NSObject *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  -[HMDDeviceNotificationHandler workQueue](self, "workQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  -[HMDDeviceNotificationHandler delayTimer](self, "delayTimer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "suspend");

  -[HMDDeviceNotificationHandler coalesceTimer](self, "coalesceTimer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "suspend");

  -[HMDDeviceNotificationHandler setDelayTimer:](self, "setDelayTimer:", 0);
  -[HMDDeviceNotificationHandler setCoalesceTimer:](self, "setCoalesceTimer:", 0);
  v16 = 0u;
  v17 = 0u;
  v14 = 0u;
  v15 = 0u;
  -[HMDDeviceNotificationHandler deviceNotificationsByRequestIDs](self, "deviceNotificationsByRequestIDs", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v15;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v15 != v9)
          objc_enumerationMutation(v6);
        v11 = *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * v10);
        v12 = (void *)MEMORY[0x1D17BA0A0]();
        -[HMDDeviceNotificationHandler _dispatchNotificationUpdate:](self, "_dispatchNotificationUpdate:", v11);
        objc_autoreleasePoolPop(v12);
        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v8);
  }

  -[HMDDeviceNotificationHandler deviceNotificationsByRequestIDs](self, "deviceNotificationsByRequestIDs");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "removeAllObjects");

}

- (void)_dispatchNotificationUpdate:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  char v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  void *v17;
  void *v18;
  void *v19;
  char v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  HMDRemoteDeviceMessageDestination *v27;
  void *v28;
  HMDRemoteMessage *v29;
  void *v30;
  void *v31;
  HMDDeviceNotificationHandler *v32;
  NSObject *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  id v41;
  uint64_t v42;
  void *v43;
  void *v44;
  HMDRemoteDeviceMessageDestination *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  _QWORD v54[4];
  id v55;
  id v56;
  id v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  uint8_t buf[4];
  void *v63;
  __int16 v64;
  void *v65;
  __int16 v66;
  void *v67;
  __int16 v68;
  void *v69;
  __int16 v70;
  void *v71;
  _BYTE v72[128];
  const __CFString *v73;
  _QWORD v74[4];

  v74[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[HMDDeviceNotificationHandler workQueue](self, "workQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  if (v4)
  {
    objc_msgSend(v4, "characteristicUpdateTuples");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "characteristicUpdateTuples");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "na_map:", &__block_literal_global_69_159032);
    v53 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v53, "na_each:", &__block_literal_global_71);
    objc_msgSend(v4, "mediaProperties");
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v53, "count") || objc_msgSend(v50, "count"))
    {
      v73 = CFSTR("kNotificationUpdateIdentifierKey");
      objc_msgSend(v4, "notificationUpdateID");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v74[0] = v8;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v74, &v73, 1);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v51 = (void *)objc_msgSend(v9, "mutableCopy");

      +[HMDHome notificationPayloadForChangedCharacteristics:destinationIsXPCTransport:](HMDHome, "notificationPayloadForChangedCharacteristics:destinationIsXPCTransport:", v53, 0);
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v48, "count"))
        objc_msgSend(v51, "setObject:forKeyedSubscript:", v48, CFSTR("kCharacteristicNotificationsKey"));
      if (objc_msgSend(v50, "count"))
      {
        +[HMDMediaPropertyResponse serializeResponses:](HMDMediaPropertyResponse, "serializeResponses:", v50);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        if (v10)
          objc_msgSend(v51, "setObject:forKeyedSubscript:", v10, CFSTR("kMediaNotificationsKey"));

      }
      objc_msgSend(v4, "requestID");
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      if (v49)
      {
        -[HMDDeviceNotificationHandler destination](self, "destination");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = objc_msgSend(v49, "isEqualToString:", v11);

        if ((v12 & 1) == 0)
          objc_msgSend(v51, "setObject:forKeyedSubscript:", v49, CFSTR("kRequestIdentifierKey"));
      }
      v60 = 0u;
      v61 = 0u;
      v58 = 0u;
      v59 = 0u;
      v13 = v53;
      v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v58, v72, 16);
      if (v14)
      {
        v15 = *(_QWORD *)v59;
        while (2)
        {
          for (i = 0; i != v14; ++i)
          {
            if (*(_QWORD *)v59 != v15)
              objc_enumerationMutation(v13);
            objc_msgSend(*(id *)(*((_QWORD *)&v58 + 1) + 8 * i), "characteristic");
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v17, "service");
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            -[HMDDeviceNotificationHandler destination](self, "destination");
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            v20 = objc_msgSend(v18, "shouldIncludePresenceForDeviceWithDestination:", v19);

            if ((v20 & 1) != 0)
            {
              LODWORD(v14) = 1;
              goto LABEL_23;
            }
          }
          v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v58, v72, 16);
          if (v14)
            continue;
          break;
        }
      }
LABEL_23:

      -[HMDDeviceNotificationHandler home](self, "home");
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      if ((_DWORD)v14)
      {
        objc_msgSend(v52, "presenceMonitor");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "currentHomePresence");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "serializedUUIDDictionary");
        v44 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v52, "presenceMonitor");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "currentHomePresence");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "serializedIdentifierDictionary");
        v42 = objc_claimAutoreleasedReturnValue();

        objc_msgSend(v51, "setObject:forKeyedSubscript:", v44, CFSTR("kPresenceDictionaryForNotificationKey"));
        objc_msgSend(v51, "setObject:forKeyedSubscript:", v42, CFSTR("kPresencePairingIdentifierDictionaryForNotificationKey"));
      }
      else
      {
        v42 = 0;
        v44 = 0;
      }
      -[HMDDeviceNotificationHandler destination](self, "destination", v42);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      +[HMDDeviceHandle deviceHandleForDestination:](HMDDeviceHandle, "deviceHandleForDestination:", v25);
      v46 = (void *)objc_claimAutoreleasedReturnValue();

      +[HMDAccountRegistry sharedRegistry](HMDAccountRegistry, "sharedRegistry");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "deviceForHandle:", v46);
      v47 = (void *)objc_claimAutoreleasedReturnValue();

      v27 = [HMDRemoteDeviceMessageDestination alloc];
      objc_msgSend(v52, "uuid");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      v45 = -[HMDRemoteDeviceMessageDestination initWithTarget:device:](v27, "initWithTarget:device:", v28, v47);

      v29 = -[HMDRemoteMessage initWithName:qualityOfService:destination:payload:type:timeout:secure:]([HMDRemoteMessage alloc], "initWithName:qualityOfService:destination:payload:type:timeout:secure:", CFSTR("kCharacterisiticsChangedInternalNotificationKey"), 17, v45, v51, 3, 1, 0.0);
      if (objc_msgSend(v52, "isResidentFirstAccessoryCommunicationEnabled"))
      {
        objc_msgSend(v52, "_userForDevice:", v47);
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        if ((objc_msgSend(v30, "isRemoteAccessAllowed") & 1) == 0)
          -[HMDRemoteMessage setRestriction:](v29, "setRestriction:", 14);

      }
      v31 = (void *)MEMORY[0x1D17BA0A0]();
      v32 = self;
      HMFGetOSLogHandle();
      v33 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v33, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        -[HMDRemoteMessage identifier](v29, "identifier");
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v13, "count"));
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v50, "count"));
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        -[HMDRemoteMessage messagePayload](v29, "messagePayload");
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138544386;
        v63 = v34;
        v64 = 2112;
        v65 = v35;
        v66 = 2112;
        v67 = v36;
        v68 = 2112;
        v69 = v37;
        v70 = 2112;
        v71 = v38;
        _os_log_impl(&dword_1CD062000, v33, OS_LOG_TYPE_INFO, "%{public}@Dispatching remote notification %@ with characteristics[%@], media properties[%@], payload: %@", buf, 0x34u);

      }
      objc_autoreleasePoolPop(v31);
      objc_msgSend(v52, "workQueue");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_initWeak((id *)buf, v32);
      -[HMDDeviceNotificationHandler messageDispatcher](v32, "messageDispatcher");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      v54[0] = MEMORY[0x1E0C809B0];
      v54[1] = 3221225472;
      v54[2] = __60__HMDDeviceNotificationHandler__dispatchNotificationUpdate___block_invoke_79;
      v54[3] = &unk_1E89BCB20;
      objc_copyWeak(&v57, (id *)buf);
      v41 = v39;
      v55 = v41;
      v56 = v4;
      objc_msgSend(v40, "sendMessage:completionHandler:", v29, v54);

      objc_destroyWeak(&v57);
      objc_destroyWeak((id *)buf);

    }
  }

}

- (void)timerDidFire:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  HMDDeviceNotificationHandler *v10;
  NSObject *v11;
  void *v12;
  int v13;
  void *v14;
  __int16 v15;
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[HMDDeviceNotificationHandler workQueue](self, "workQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  -[HMDDeviceNotificationHandler coalesceTimer](self, "coalesceTimer");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "isEqual:", v6))
  {

  }
  else
  {
    -[HMDDeviceNotificationHandler delayTimer](self, "delayTimer");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v4, "isEqual:", v7);

    if (!v8)
      goto LABEL_7;
  }
  v9 = (void *)MEMORY[0x1D17BA0A0]();
  v10 = self;
  HMFGetOSLogHandle();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = 138543618;
    v14 = v12;
    v15 = 2112;
    v16 = v4;
    _os_log_impl(&dword_1CD062000, v11, OS_LOG_TYPE_INFO, "%{public}@Notification timer fired %@", (uint8_t *)&v13, 0x16u);

  }
  objc_autoreleasePoolPop(v9);
  -[HMDDeviceNotificationHandler _dispatchNotification](v10, "_dispatchNotification");
LABEL_7:

}

- (id)logIdentifier
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = (void *)MEMORY[0x1E0CB3940];
  -[HMDDeviceNotificationHandler home](self, "home");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "uuid");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDDeviceNotificationHandler destination](self, "destination");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@/%@"), v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (HMDHome)home
{
  return (HMDHome *)objc_loadWeakRetained((id *)&self->_home);
}

- (void)setHome:(id)a3
{
  objc_storeWeak((id *)&self->_home, a3);
}

- (OS_dispatch_queue)workQueue
{
  return self->_workQueue;
}

- (void)setWorkQueue:(id)a3
{
  objc_storeStrong((id *)&self->_workQueue, a3);
}

- (NSString)destination
{
  return self->_destination;
}

- (void)setDestination:(id)a3
{
  objc_storeStrong((id *)&self->_destination, a3);
}

- (HMFTimer)coalesceTimer
{
  return self->_coalesceTimer;
}

- (void)setCoalesceTimer:(id)a3
{
  objc_storeStrong((id *)&self->_coalesceTimer, a3);
}

- (HMFTimer)delayTimer
{
  return self->_delayTimer;
}

- (void)setDelayTimer:(id)a3
{
  objc_storeStrong((id *)&self->_delayTimer, a3);
}

- (BOOL)delaySupported
{
  return self->_delaySupported;
}

- (void)setDelaySupported:(BOOL)a3
{
  self->_delaySupported = a3;
}

- (HMFMessageDispatcher)messageDispatcher
{
  return self->_messageDispatcher;
}

- (HMDDeviceNotificationHandlerDataSource)dataSource
{
  return self->_dataSource;
}

- (NSMutableOrderedSet)deviceNotificationsByRequestIDs
{
  return (NSMutableOrderedSet *)objc_getProperty(self, a2, 72, 1);
}

- (void)setDeviceNotificationsByRequestIDs:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 72);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_deviceNotificationsByRequestIDs, 0);
  objc_storeStrong((id *)&self->_dataSource, 0);
  objc_storeStrong((id *)&self->_messageDispatcher, 0);
  objc_storeStrong((id *)&self->_delayTimer, 0);
  objc_storeStrong((id *)&self->_coalesceTimer, 0);
  objc_storeStrong((id *)&self->_destination, 0);
  objc_storeStrong((id *)&self->_workQueue, 0);
  objc_destroyWeak((id *)&self->_home);
}

void __60__HMDDeviceNotificationHandler__dispatchNotificationUpdate___block_invoke_79(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  NSObject *v5;
  _QWORD v6[4];
  id v7;
  id v8;

  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __60__HMDDeviceNotificationHandler__dispatchNotificationUpdate___block_invoke_2_80;
    v6[3] = &unk_1E89C2328;
    v5 = *(NSObject **)(a1 + 32);
    v7 = *(id *)(a1 + 40);
    v8 = v3;
    dispatch_async(v5, v6);

  }
}

void __60__HMDDeviceNotificationHandler__dispatchNotificationUpdate___block_invoke_2_80(uint64_t a1)
{
  void *v2;
  _QWORD v3[4];
  id v4;

  objc_msgSend(*(id *)(a1 + 32), "completions");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __60__HMDDeviceNotificationHandler__dispatchNotificationUpdate___block_invoke_3;
  v3[3] = &unk_1E89BE768;
  v4 = *(id *)(a1 + 40);
  objc_msgSend(v2, "na_each:", v3);

}

uint64_t __60__HMDDeviceNotificationHandler__dispatchNotificationUpdate___block_invoke_3(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(uint64_t, _QWORD))(a2 + 16))(a2, *(_QWORD *)(a1 + 32));
}

void __60__HMDDeviceNotificationHandler__dispatchNotificationUpdate___block_invoke_2(uint64_t a1, void *a2)
{
  void *v2;
  id v3;

  objc_msgSend(a2, "characteristicResponse");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "request");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setCompleted:", 1);

}

id __60__HMDDeviceNotificationHandler__dispatchNotificationUpdate___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  void *v4;
  void *v5;
  id v6;

  v2 = a2;
  objc_msgSend(v2, "characteristicResponse");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "request");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "isCompleted"))
    v5 = 0;
  else
    v5 = v2;
  v6 = v5;

  return v6;
}

void __74__HMDDeviceNotificationHandler__notificationUpdateWithRequestID_allowAdd___block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  id v7;
  void *v8;
  void *v9;
  id v10;

  v7 = a2;
  v8 = *(void **)(a1 + 32);
  v10 = v7;
  objc_msgSend(v7, "requestID");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v8) = objc_msgSend(v8, "isEqualToString:", v9);

  if ((_DWORD)v8)
  {
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
    *a4 = 1;
  }

}

uint64_t __78__HMDDeviceNotificationHandler_sendCoalescedRemoteNotificationForAccessories___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;
  _QWORD v6[4];
  id v7;

  objc_msgSend(a2, "characteristicUpdateTuples");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __78__HMDDeviceNotificationHandler_sendCoalescedRemoteNotificationForAccessories___block_invoke_2;
  v6[3] = &unk_1E89BBC40;
  v7 = *(id *)(a1 + 32);
  v4 = objc_msgSend(v3, "na_any:", v6);

  return v4;
}

uint64_t __78__HMDDeviceNotificationHandler_sendCoalescedRemoteNotificationForAccessories___block_invoke_3(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "shortDescription");
}

uint64_t __78__HMDDeviceNotificationHandler_sendCoalescedRemoteNotificationForAccessories___block_invoke_2(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(a2, "characteristic");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "accessory");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v2, "containsObject:", v4);

  return v5;
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t9_159103 != -1)
    dispatch_once(&logCategory__hmf_once_t9_159103, &__block_literal_global_84_159104);
  return (id)logCategory__hmf_once_v10_159105;
}

void __43__HMDDeviceNotificationHandler_logCategory__block_invoke()
{
  uint64_t v0;
  void *v1;

  HMFCreateOSLogHandle();
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)logCategory__hmf_once_v10_159105;
  logCategory__hmf_once_v10_159105 = v0;

}

@end
