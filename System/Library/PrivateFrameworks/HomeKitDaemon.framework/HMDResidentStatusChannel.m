@implementation HMDResidentStatusChannel

- (HMDResidentStatusChannel)initWithHome:(id)a3 queue:(id)a4 notificationCenter:(id)a5 timerProvider:(id)a6 channelProvider:(id)a7 logEventSubmitter:(id)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  HMDResidentStatusChannel *v18;
  HMDResidentStatusChannel *v19;
  uint64_t v20;
  NSMutableDictionary *residentStatusMap;
  uint64_t v22;
  NSMutableSet *observers;
  void *v24;
  void *v25;
  uint64_t v26;
  HMDStatusChannel *channel;
  uint64_t v28;
  HMFFuture *initialConnectedToStatusKitFuture;
  id v31;
  id v32;
  id obj;
  objc_super v34;

  v14 = a3;
  v32 = a4;
  v31 = a5;
  v15 = a6;
  v16 = a7;
  v17 = a8;
  v34.receiver = self;
  v34.super_class = (Class)HMDResidentStatusChannel;
  v18 = -[HMDResidentStatusChannel init](&v34, sel_init);
  v19 = v18;
  if (v18)
  {
    objc_storeWeak((id *)&v18->_home, v14);
    objc_storeStrong((id *)&v19->_queue, a4);
    v19->_lock._os_unfair_lock_opaque = 0;
    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v20 = objc_claimAutoreleasedReturnValue();
    residentStatusMap = v19->_residentStatusMap;
    v19->_residentStatusMap = (NSMutableDictionary *)v20;

    objc_storeStrong((id *)&v19->_notificationCenter, a5);
    objc_msgSend(MEMORY[0x24BDBCEF0], "set");
    v22 = objc_claimAutoreleasedReturnValue();
    observers = v19->_observers;
    v19->_observers = (NSMutableSet *)v22;

    objc_storeStrong((id *)&v19->_timerProvider, a6);
    objc_storeStrong((id *)&v19->_channelProvider, a7);
    objc_storeStrong((id *)&v19->_logEventSubmitter, a8);
    objc_msgSend(v14, "uuid");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "UUIDString");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "createStatusChannelWithPrefix:identifier:queue:", CFSTR("HomeKitResidentStatus"), v25, v19->_queue);
    v26 = objc_claimAutoreleasedReturnValue();
    channel = v19->_channel;
    v19->_channel = (HMDStatusChannel *)v26;

    -[HMDStatusChannel addDelegate:](v19->_channel, "addDelegate:", v19);
    v19->_started = 0;
    obj = 0;
    objc_msgSend(MEMORY[0x24BE3F180], "futureWithPromise:", &obj);
    v28 = objc_claimAutoreleasedReturnValue();
    initialConnectedToStatusKitFuture = v19->_initialConnectedToStatusKitFuture;
    v19->_initialConnectedToStatusKitFuture = (HMFFuture *)v28;

    objc_storeStrong((id *)&v19->_initialConnectedToStatusKitPromise, obj);
    v19->_receivedInitialChannelState = 0;

  }
  return v19;
}

- (HMDResidentStatusChannel)initWithHome:(id)a3 queue:(id)a4
{
  void *v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  HMDResidentStatusChannel *v13;

  v6 = (void *)MEMORY[0x24BDD16D0];
  v7 = a4;
  v8 = a3;
  objc_msgSend(v6, "defaultCenter");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_opt_new();
  v11 = (void *)objc_opt_new();
  +[HMDMetricsManager sharedLogEventSubmitter](HMDMetricsManager, "sharedLogEventSubmitter");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = -[HMDResidentStatusChannel initWithHome:queue:notificationCenter:timerProvider:channelProvider:logEventSubmitter:](self, "initWithHome:queue:notificationCenter:timerProvider:channelProvider:logEventSubmitter:", v8, v7, v9, v10, v11, v12);

  return v13;
}

- (void)start
{
  NSObject *queue;
  _QWORD block[5];

  queue = self->_queue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __33__HMDResidentStatusChannel_start__block_invoke;
  block[3] = &unk_24E79C240;
  block[4] = self;
  dispatch_async(queue, block);
}

- (void)stop
{
  NSObject *queue;
  _QWORD block[5];

  queue = self->_queue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __32__HMDResidentStatusChannel_stop__block_invoke;
  block[3] = &unk_24E79C240;
  block[4] = self;
  dispatch_async(queue, block);
}

- (void)publishResidentStatus:(id)a3 reason:(int64_t)a4
{
  id v6;
  NSObject *queue;
  id v8;
  _QWORD block[5];
  id v10;
  int64_t v11;

  v6 = a3;
  queue = self->_queue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __57__HMDResidentStatusChannel_publishResidentStatus_reason___block_invoke;
  block[3] = &unk_24E796490;
  block[4] = self;
  v10 = v6;
  v11 = a4;
  v8 = v6;
  dispatch_async(queue, block);

}

- (BOOL)_shouldDebounce:(int64_t)a3
{
  return (a3 & 0xFFFFFFFFFFFFFFFELL) != 2;
}

- (void)_publishResidentStatus:(id)a3 reason:(int64_t)a4
{
  id v6;
  void *v7;
  HMDResidentStatusChannel *v8;
  NSObject *v9;
  void *v10;
  __CFString *v11;
  uint64_t v12;
  HMDStatusChannel *channel;
  void *v14;
  HMDResidentStatusChannelPublishLogEvent *v15;
  void *v16;
  void *v17;
  HMDResidentStatusChannelPublishLogEvent *v18;
  void *v19;
  void *v20;
  HMDResidentStatusChannel *v21;
  NSObject *v22;
  void *v23;
  uint8_t buf[4];
  void *v25;
  __int16 v26;
  id v27;
  __int16 v28;
  __CFString *v29;
  uint64_t v30;

  v30 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  v7 = (void *)MEMORY[0x227676638]();
  v8 = self;
  HMFGetOSLogHandle();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if ((unint64_t)a4 >= 6)
    {
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Unknown reason: %lu"), a4);
      v11 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v11 = off_24E782AA8[a4];
    }
    *(_DWORD *)buf = 138543874;
    v25 = v10;
    v26 = 2112;
    v27 = v6;
    v28 = 2112;
    v29 = v11;
    _os_log_impl(&dword_2218F0000, v9, OS_LOG_TYPE_INFO, "%{public}@Publishing resident status: %@ with reason: %@", buf, 0x20u);

  }
  objc_autoreleasePoolPop(v7);
  if (v8->_channel)
  {
    v12 = -[HMDResidentStatusChannel _shouldDebounce:](v8, "_shouldDebounce:", a4);
    channel = v8->_channel;
    objc_msgSend(v6, "channelRecordPayload");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDStatusChannel publishRecordWithPayload:shouldDebounce:](channel, "publishRecordWithPayload:shouldDebounce:", v14, v12);

    v15 = [HMDResidentStatusChannelPublishLogEvent alloc];
    -[HMDResidentStatusChannel home](v8, "home");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "uuid");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = -[HMDResidentStatusChannelPublishLogEvent initWithHomeUUID:publishReason:](v15, "initWithHomeUUID:publishReason:", v17, a4);

    -[HMDResidentStatusChannel logEventSubmitter](v8, "logEventSubmitter");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "submitLogEvent:", v18);

  }
  else
  {
    v20 = (void *)MEMORY[0x227676638]();
    v21 = v8;
    HMFGetOSLogHandle();
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v25 = v23;
      _os_log_impl(&dword_2218F0000, v22, OS_LOG_TYPE_ERROR, "%{public}@Attempt to publish status before channel is started", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v20);
  }

}

- (void)stopPublishingAsResident
{
  NSObject *queue;
  _QWORD block[5];

  queue = self->_queue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __52__HMDResidentStatusChannel_stopPublishingAsResident__block_invoke;
  block[3] = &unk_24E79C240;
  block[4] = self;
  dispatch_async(queue, block);
}

- (void)_stopPublishingAsResident
{
  void *v3;
  HMDResidentStatusChannel *v4;
  NSObject *v5;
  void *v6;
  int v7;
  void *v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  v3 = (void *)MEMORY[0x227676638]();
  v4 = self;
  HMFGetOSLogHandle();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = 138543362;
    v8 = v6;
    _os_log_impl(&dword_2218F0000, v5, OS_LOG_TYPE_INFO, "%{public}@Stopping publishing as resident", (uint8_t *)&v7, 0xCu);

  }
  objc_autoreleasePoolPop(v3);
  -[HMDStatusChannel stopPublishing](v4->_channel, "stopPublishing");
}

- (NSSet)presentResidentStatuses
{
  os_unfair_lock_s *p_lock;
  id v4;
  void *v5;
  void *v6;
  void *v7;

  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  v4 = objc_alloc(MEMORY[0x24BDBCF20]);
  -[HMDResidentStatusChannel residentStatusMap](self, "residentStatusMap");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "allValues");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v4, "initWithArray:", v6);

  os_unfair_lock_unlock(p_lock);
  return (NSSet *)v7;
}

- (HMDResidentStatus)currentPrimaryResident
{
  os_unfair_lock_s *p_lock;
  HMDResidentStatus *v4;

  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  v4 = self->_currentPrimaryResident;
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (void)addObserver:(id)a3
{
  id v4;
  NSObject *queue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __40__HMDResidentStatusChannel_addObserver___block_invoke;
  v7[3] = &unk_24E79C268;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(queue, v7);

}

- (void)removeObserver:(id)a3
{
  id v4;
  NSObject *queue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __43__HMDResidentStatusChannel_removeObserver___block_invoke;
  v7[3] = &unk_24E79C268;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(queue, v7);

}

- (id)dumpState
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  v2 = (void *)MEMORY[0x24BDBCED8];
  -[HMDStatusChannel dumpState](self->_channel, "dumpState");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "dictionaryWithDictionary:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = (void *)objc_msgSend(v4, "copy");
  return v5;
}

- (void)_handleHomeUserAddedNotification:(id)a3
{
  id v4;
  NSObject *queue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __61__HMDResidentStatusChannel__handleHomeUserAddedNotification___block_invoke;
  v7[3] = &unk_24E79C268;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(queue, v7);

}

- (void)_handleHomeUserRemovedNotification:(id)a3
{
  id v4;
  NSObject *queue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __63__HMDResidentStatusChannel__handleHomeUserRemovedNotification___block_invoke;
  v7[3] = &unk_24E79C268;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(queue, v7);

}

- (void)channel:(id)a3 didObserveRecordUpdate:(id)a4
{
  id v6;
  void *v7;
  HMDResidentStatusChannel *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  HMDResidentStatusChannel *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t i;
  uint64_t v22;
  HMDResidentStatus *v23;
  HMDResidentStatus *v24;
  uint64_t v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  uint64_t v30;
  void *v31;
  HMDResidentStatusChannel *v32;
  NSObject *v33;
  _BOOL4 v34;
  void *v35;
  HMDResidentStatus *v36;
  void *v37;
  HMDResidentStatusChannel *v38;
  NSObject *v39;
  void *v40;
  void *v41;
  HMDResidentStatusChannel *v42;
  NSObject *v43;
  void *v44;
  void *v45;
  HMDResidentStatusChannel *v46;
  NSObject *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  _BOOL4 v53;
  void *v54;
  char v55;
  void *v56;
  uint64_t v57;
  void *v58;
  uint64_t v59;
  void *v60;
  HMDResidentStatusChannel *v61;
  NSObject *v62;
  void *v63;
  uint64_t v64;
  void *v65;
  const __CFString *v66;
  void *v67;
  void *v68;
  HMDResidentStatusChannel *v69;
  NSObject *v70;
  void *v71;
  void *v72;
  HMDResidentStatusChannelObserveLogEvent *v73;
  void *v74;
  _BOOL8 v75;
  _BOOL8 v76;
  _BOOL8 v77;
  uint64_t v78;
  void *v79;
  HMDResidentStatusChannel *v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t j;
  void *v85;
  void *v86;
  uint64_t v87;
  void *v88;
  void *v89;
  uint64_t v90;
  void *v91;
  void *v92;
  id v93;
  void *v94;
  void *v95;
  id obj;
  HMDResidentStatus *v97;
  void *v98;
  void *v99;
  void *v100;
  __int128 v101;
  __int128 v102;
  __int128 v103;
  __int128 v104;
  __int128 v105;
  __int128 v106;
  __int128 v107;
  __int128 v108;
  uint8_t v109[128];
  uint8_t buf[4];
  void *v111;
  __int16 v112;
  uint64_t v113;
  __int16 v114;
  uint64_t v115;
  __int16 v116;
  const __CFString *v117;
  _BYTE v118[128];
  uint64_t v119;

  v119 = *MEMORY[0x24BDAC8D0];
  v93 = a3;
  v6 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  v7 = (void *)MEMORY[0x227676638]();
  v8 = self;
  HMFGetOSLogHandle();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    HMFGetLogIdentifier();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v111 = v10;
    v112 = 2048;
    v113 = objc_msgSend(v6, "count");
    _os_log_impl(&dword_2218F0000, v9, OS_LOG_TYPE_DEFAULT, "%{public}@Status channel updated records (%lu)", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v7);
  v11 = (void *)MEMORY[0x227676638]();
  v12 = v8;
  HMFGetOSLogHandle();
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
  {
    HMFGetLogIdentifier();
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v111 = v14;
    v112 = 2112;
    v113 = (uint64_t)v6;
    _os_log_impl(&dword_2218F0000, v13, OS_LOG_TYPE_DEBUG, "%{public}@Status channel updated records: %@", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v11);
  objc_msgSend(MEMORY[0x24BDBCEF0], "set");
  v100 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCEF0], "set");
  v98 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDResidentStatusChannel residentStatusMap](v12, "residentStatusMap");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "allValues");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v99 = (void *)objc_msgSend(v16, "mutableCopy");

  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v105 = 0u;
  v106 = 0u;
  v107 = 0u;
  v108 = 0u;
  v17 = v6;
  v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v105, v118, 16);
  v94 = v17;
  if (!v18)
  {

    goto LABEL_41;
  }
  v19 = v18;
  v97 = 0;
  v20 = *(_QWORD *)v106;
  do
  {
    for (i = 0; i != v19; ++i)
    {
      if (*(_QWORD *)v106 != v20)
        objc_enumerationMutation(v17);
      v22 = *(_QWORD *)(*((_QWORD *)&v105 + 1) + 8 * i);
      v23 = -[HMDResidentStatus initWithChannelRecord:]([HMDResidentStatus alloc], "initWithChannelRecord:", v22);
      v24 = v23;
      if (v23)
      {
        if (-[HMDResidentStatus isPrimary](v23, "isPrimary"))
        {
          if (v97)
          {
            -[HMDResidentStatus assertionTime](v24, "assertionTime");
            v25 = objc_claimAutoreleasedReturnValue();
            if (v25
              && (v26 = (void *)v25,
                  -[HMDResidentStatus assertionTime](v97, "assertionTime"),
                  v27 = (void *)objc_claimAutoreleasedReturnValue(),
                  v27,
                  v26,
                  v27))
            {
              -[HMDResidentStatus assertionTime](v24, "assertionTime");
              v28 = (void *)objc_claimAutoreleasedReturnValue();
              -[HMDResidentStatus assertionTime](v97, "assertionTime");
              v29 = (void *)objc_claimAutoreleasedReturnValue();
              v30 = objc_msgSend(v28, "compare:", v29);

              v31 = (void *)MEMORY[0x227676638]();
              v32 = v12;
              HMFGetOSLogHandle();
              v33 = objc_claimAutoreleasedReturnValue();
              v34 = os_log_type_enabled(v33, OS_LOG_TYPE_ERROR);
              if (v30 == 1)
              {
                if (v34)
                {
                  HMFGetLogIdentifier();
                  v35 = (void *)objc_claimAutoreleasedReturnValue();
                  *(_DWORD *)buf = 138543618;
                  v111 = v35;
                  v112 = 2112;
                  v113 = (uint64_t)v24;
                  _os_log_impl(&dword_2218F0000, v33, OS_LOG_TYPE_ERROR, "%{public}@Found additional primary resident %@, using as primary because assertion time is newer", buf, 0x16u);

                }
                objc_autoreleasePoolPop(v31);
                v36 = v24;

                v97 = v36;
              }
              else
              {
                if (v34)
                {
                  HMFGetLogIdentifier();
                  v49 = (void *)objc_claimAutoreleasedReturnValue();
                  *(_DWORD *)buf = 138543618;
                  v111 = v49;
                  v112 = 2112;
                  v113 = (uint64_t)v24;
                  _os_log_impl(&dword_2218F0000, v33, OS_LOG_TYPE_ERROR, "%{public}@Found additional primary resident %@, ignoring because assertion time is older", buf, 0x16u);

                }
                objc_autoreleasePoolPop(v31);
              }
              v17 = v94;
            }
            else
            {
              v41 = (void *)MEMORY[0x227676638]();
              v42 = v12;
              HMFGetOSLogHandle();
              v43 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v43, OS_LOG_TYPE_ERROR))
              {
                HMFGetLogIdentifier();
                v44 = (void *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = 138543874;
                v111 = v44;
                v112 = 2112;
                v113 = (uint64_t)v24;
                v114 = 2112;
                v115 = (uint64_t)v97;
                _os_log_impl(&dword_2218F0000, v43, OS_LOG_TYPE_ERROR, "%{public}@Unexpected nil assertion time, ignoring, %@, %@", buf, 0x20u);

              }
              objc_autoreleasePoolPop(v41);
            }
          }
          else
          {
            v45 = (void *)MEMORY[0x227676638]();
            v46 = v12;
            HMFGetOSLogHandle();
            v47 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v47, OS_LOG_TYPE_INFO))
            {
              HMFGetLogIdentifier();
              v48 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138543618;
              v111 = v48;
              v112 = 2112;
              v113 = (uint64_t)v24;
              _os_log_impl(&dword_2218F0000, v47, OS_LOG_TYPE_INFO, "%{public}@Found primary resident %@", buf, 0x16u);

            }
            objc_autoreleasePoolPop(v45);
            v97 = v24;
          }
        }
        -[HMDResidentStatusChannel residentStatusMap](v12, "residentStatusMap");
        v50 = (void *)objc_claimAutoreleasedReturnValue();
        -[HMDResidentStatus idsIdentifier](v24, "idsIdentifier");
        v51 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v50, "objectForKeyedSubscript:", v51);
        v37 = (void *)objc_claimAutoreleasedReturnValue();

        v52 = v100;
        if (!v37 || (v53 = -[HMDResidentStatus hasChangedFrom:](v24, "hasChangedFrom:", v37), v52 = v98, v53))
          objc_msgSend(v52, "addObject:", v24);
        objc_msgSend(v99, "removeObject:", v24);
        -[HMDResidentStatus idsIdentifier](v24, "idsIdentifier");
        v54 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(obj, "setObject:forKeyedSubscript:", v24, v54);

      }
      else
      {
        v37 = (void *)MEMORY[0x227676638]();
        v38 = v12;
        HMFGetOSLogHandle();
        v39 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR))
        {
          HMFGetLogIdentifier();
          v40 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543618;
          v111 = v40;
          v112 = 2112;
          v113 = v22;
          _os_log_impl(&dword_2218F0000, v39, OS_LOG_TYPE_ERROR, "%{public}@Failed to create status from record %@", buf, 0x16u);

        }
        objc_autoreleasePoolPop(v37);
        v17 = v94;
      }

    }
    v19 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v105, v118, 16);
  }
  while (v19);

  if (!v97)
  {
LABEL_41:
    -[HMDResidentStatusChannel currentPrimaryResident](v12, "currentPrimaryResident");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    v55 = 0;
    v97 = 0;
    v56 = 0;
    v57 = 0;
    if (!v37)
      goto LABEL_45;
    goto LABEL_42;
  }
  v55 = 1;
LABEL_42:
  -[HMDResidentStatusChannel currentPrimaryResident](v12, "currentPrimaryResident");
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  v57 = -[HMDResidentStatus isEqual:](v97, "isEqual:", v58) ^ 1;

  if ((v55 & 1) != 0)
  {
    v59 = 1;
    goto LABEL_46;
  }
  v56 = v37;
LABEL_45:

  v59 = 0;
LABEL_46:
  v60 = (void *)MEMORY[0x227676638]();
  v61 = v12;
  HMFGetOSLogHandle();
  v62 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v62, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDResidentStatusChannel currentPrimaryResident](v61, "currentPrimaryResident");
    v64 = objc_claimAutoreleasedReturnValue();
    v65 = (void *)v64;
    v66 = CFSTR("NO");
    *(_DWORD *)buf = 138544130;
    v111 = v63;
    if ((_DWORD)v57)
      v66 = CFSTR("YES");
    v112 = 2112;
    v113 = (uint64_t)v97;
    v114 = 2112;
    v115 = v64;
    v116 = 2112;
    v117 = v66;
    _os_log_impl(&dword_2218F0000, v62, OS_LOG_TYPE_INFO, "%{public}@Found primary resident = %@, current primary resident %@, will notify %@", buf, 0x2Au);

  }
  objc_autoreleasePoolPop(v60);
  os_unfair_lock_lock_with_options();
  objc_storeStrong((id *)&v61->_residentStatusMap, obj);
  objc_storeStrong((id *)&v61->_currentPrimaryResident, v97);
  os_unfair_lock_unlock(&v61->_lock);
  -[HMDResidentStatusChannel setConnected:](v61, "setConnected:", 1);
  -[HMDResidentStatusChannel _stopDebounceTimer](v61, "_stopDebounceTimer");
  -[HMDResidentStatusChannel home](v61, "home");
  v67 = (void *)objc_claimAutoreleasedReturnValue();
  if (!-[HMDResidentStatusChannel receivedInitialChannelState](v61, "receivedInitialChannelState"))
  {
    v68 = (void *)MEMORY[0x227676638]();
    v69 = v61;
    HMFGetOSLogHandle();
    v70 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v70, OS_LOG_TYPE_DEFAULT))
    {
      HMFGetLogIdentifier();
      v71 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v111 = v71;
      _os_log_impl(&dword_2218F0000, v70, OS_LOG_TYPE_DEFAULT, "%{public}@Received initial channel state", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v68);
    -[HMDResidentStatusChannel setReceivedInitialChannelState:](v69, "setReceivedInitialChannelState:", 1);
    -[HMDResidentStatusChannel initialConnectedToStatusKitPromise](v69, "initialConnectedToStatusKitPromise");
    v72 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v72, "fulfillWithNoValue");

    if (objc_msgSend(v67, "isOwnerUser"))
      -[HMDResidentStatusChannel _inviteSharedUsers](v69, "_inviteSharedUsers");
  }
  v73 = [HMDResidentStatusChannelObserveLogEvent alloc];
  v92 = v67;
  objc_msgSend(v67, "uuid");
  v74 = (void *)objc_claimAutoreleasedReturnValue();
  v75 = objc_msgSend(v99, "count") != 0;
  v76 = objc_msgSend(v100, "count") != 0;
  v77 = objc_msgSend(v98, "count") != 0;
  LOBYTE(v90) = objc_msgSend(v94, "count") != 0;
  v78 = -[HMDResidentStatusChannelObserveLogEvent initWithHomeUUID:didLoseStatuses:didAddStatuses:didUpdateStatuses:didFindPrimary:didPrimaryChange:isStatusesEmpty:](v73, "initWithHomeUUID:didLoseStatuses:didAddStatuses:didUpdateStatuses:didFindPrimary:didPrimaryChange:isStatusesEmpty:", v74, v75, v76, v77, v59, v57, v90);

  -[HMDResidentStatusChannel logEventSubmitter](v61, "logEventSubmitter");
  v79 = (void *)objc_claimAutoreleasedReturnValue();
  v91 = (void *)v78;
  objc_msgSend(v79, "submitLogEvent:", v78);

  v103 = 0u;
  v104 = 0u;
  v101 = 0u;
  v102 = 0u;
  v80 = v61;
  -[HMDResidentStatusChannel observers](v61, "observers");
  v95 = (void *)objc_claimAutoreleasedReturnValue();
  v81 = objc_msgSend(v95, "countByEnumeratingWithState:objects:count:", &v101, v109, 16);
  if (v81)
  {
    v82 = v81;
    v83 = *(_QWORD *)v102;
    do
    {
      for (j = 0; j != v82; ++j)
      {
        if (*(_QWORD *)v102 != v83)
          objc_enumerationMutation(v95);
        v85 = *(void **)(*((_QWORD *)&v101 + 1) + 8 * j);
        if ((objc_opt_respondsToSelector() & 1) != 0)
        {
          v86 = (void *)objc_msgSend(v100, "copy");
          v87 = v57;
          v88 = (void *)objc_msgSend(v99, "copy");
          v89 = (void *)objc_msgSend(v98, "copy");
          objc_msgSend(v85, "channel:didObserveDevicesAdded:lost:updated:", v80, v86, v88, v89);

          v57 = v87;
        }
        if ((_DWORD)v57 && (objc_opt_respondsToSelector() & 1) != 0)
          objc_msgSend(v85, "channel:didObservePrimaryResidentChange:", v80, v80->_currentPrimaryResident);
      }
      v82 = objc_msgSend(v95, "countByEnumeratingWithState:objects:count:", &v101, v109, 16);
    }
    while (v82);
  }

}

- (void)channel:(id)a3 didObserveConnectionChange:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  void *v7;
  HMDResidentStatusChannel *v8;
  NSObject *v9;
  _BOOL4 v10;
  void *v11;
  void *v12;
  int v13;
  void *v14;
  uint64_t v15;

  v4 = a4;
  v15 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  v7 = (void *)MEMORY[0x227676638]();
  v8 = self;
  HMFGetOSLogHandle();
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = os_log_type_enabled(v9, OS_LOG_TYPE_INFO);
  if (v4)
  {
    if (v10)
    {
      HMFGetLogIdentifier();
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = 138543362;
      v14 = v11;
      _os_log_impl(&dword_2218F0000, v9, OS_LOG_TYPE_INFO, "%{public}@Status Channel gained connectivity, stopping debounce timer", (uint8_t *)&v13, 0xCu);

    }
    objc_autoreleasePoolPop(v7);
    -[HMDResidentStatusChannel _stopDebounceTimer](v8, "_stopDebounceTimer");
  }
  else
  {
    if (v10)
    {
      HMFGetLogIdentifier();
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = 138543362;
      v14 = v12;
      _os_log_impl(&dword_2218F0000, v9, OS_LOG_TYPE_INFO, "%{public}@Status Channel lost connectivity, starting debounce timer", (uint8_t *)&v13, 0xCu);

    }
    objc_autoreleasePoolPop(v7);
    -[HMDResidentStatusChannel _startDebounceTimer](v8, "_startDebounceTimer");
  }

}

- (void)timerDidFire:(id)a3
{
  id v4;
  id v5;
  id v6;
  void *v7;
  char v8;
  void *v9;
  HMDResidentStatusChannel *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  int v15;
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  -[HMDResidentStatusChannel debounceTimer](self, "debounceTimer");
  v5 = (id)objc_claimAutoreleasedReturnValue();

  if (v5 == v4)
  {
    -[HMDResidentStatusChannel _stopDebounceTimer](self, "_stopDebounceTimer");
    -[HMDResidentStatusChannel channel](self, "channel");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "isConnected");

    if ((v8 & 1) == 0)
    {
      v9 = (void *)MEMORY[0x227676638]();
      v10 = self;
      HMFGetOSLogHandle();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = 138543362;
        v16 = v12;
        _os_log_impl(&dword_2218F0000, v11, OS_LOG_TYPE_INFO, "%{public}@Status Channel still disconnected after debounce timer fired, resetting records", (uint8_t *)&v15, 0xCu);

      }
      objc_autoreleasePoolPop(v9);
      -[HMDResidentStatusChannel setConnected:](v10, "setConnected:", 0);
      -[HMDResidentStatusChannel channel](v10, "channel");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDBCF20], "set");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMDResidentStatusChannel channel:didObserveRecordUpdate:](v10, "channel:didObserveRecordUpdate:", v13, v14);

    }
  }
  else
  {
    -[HMDResidentStatusChannel inviteRetryTimer](self, "inviteRetryTimer");
    v6 = (id)objc_claimAutoreleasedReturnValue();

    if (v6 == v4)
    {
      -[HMDResidentStatusChannel setInviteRetryTimer:](self, "setInviteRetryTimer:", 0);
      -[HMDResidentStatusChannel _inviteSharedUsers](self, "_inviteSharedUsers");
    }
  }

}

- (void)_startDebounceTimer
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  OS_dispatch_queue *queue;
  void *v8;
  id v9;

  -[HMDResidentStatusChannel debounceTimer](self, "debounceTimer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
  {
    -[HMDResidentStatusChannel timerProvider](self, "timerProvider");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "timerWithTimeInterval:options:", 0, 120.0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDResidentStatusChannel setDebounceTimer:](self, "setDebounceTimer:", v5);

    -[HMDResidentStatusChannel debounceTimer](self, "debounceTimer");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setDelegate:", self);

    queue = self->_queue;
    -[HMDResidentStatusChannel debounceTimer](self, "debounceTimer");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setDelegateQueue:", queue);

    -[HMDResidentStatusChannel debounceTimer](self, "debounceTimer");
    v9 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "resume");

  }
}

- (void)_stopDebounceTimer
{
  void *v3;
  void *v4;

  -[HMDResidentStatusChannel debounceTimer](self, "debounceTimer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[HMDResidentStatusChannel debounceTimer](self, "debounceTimer");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "suspend");

    -[HMDResidentStatusChannel setDebounceTimer:](self, "setDebounceTimer:", 0);
  }
}

- (void)_inviteSharedUsers
{
  void *v3;
  void *v4;
  void *v5;
  HMDResidentStatusChannel *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  id v10;
  _QWORD v11[4];
  id v12;
  id v13;
  uint8_t buf[4];
  void *v15;
  __int16 v16;
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  -[HMDResidentStatusChannel home](self, "home");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "isOwnerUser"))
  {
    objc_msgSend(v3, "usersIncludingPendingUsers:", 1);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (void *)MEMORY[0x227676638]();
    v6 = self;
    HMFGetOSLogHandle();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v15 = v8;
      v16 = 2112;
      v17 = v4;
      _os_log_impl(&dword_2218F0000, v7, OS_LOG_TYPE_INFO, "%{public}@Setting invited users to: %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v5);
    objc_initWeak((id *)buf, v6);
    -[HMDResidentStatusChannel channel](v6, "channel");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v11[0] = MEMORY[0x24BDAC760];
    v11[1] = 3221225472;
    v11[2] = __46__HMDResidentStatusChannel__inviteSharedUsers__block_invoke;
    v11[3] = &unk_24E798300;
    objc_copyWeak(&v13, (id *)buf);
    v10 = v4;
    v12 = v10;
    objc_msgSend(v9, "setInvitedUsers:withCompletion:", v10, v11);

    objc_destroyWeak(&v13);
    objc_destroyWeak((id *)buf);

  }
}

- (id)logIdentifier
{
  void *v2;
  void *v3;
  void *v4;

  -[HMDResidentStatusChannel home](self, "home");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "uuid");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "UUIDString");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (HMDHome)home
{
  return (HMDHome *)objc_loadWeakRetained((id *)&self->_home);
}

- (HMDResidentStatusChannelManager)manager
{
  return (HMDResidentStatusChannelManager *)objc_loadWeakRetained((id *)&self->_manager);
}

- (void)setManager:(id)a3
{
  objc_storeWeak((id *)&self->_manager, a3);
}

- (HMFFuture)initialConnectedToStatusKitFuture
{
  return self->_initialConnectedToStatusKitFuture;
}

- (BOOL)isConnected
{
  return self->_connected;
}

- (void)setConnected:(BOOL)a3
{
  self->_connected = a3;
}

- (HMDStatusChannel)channel
{
  return self->_channel;
}

- (NSMutableDictionary)residentStatusMap
{
  return self->_residentStatusMap;
}

- (NSMutableSet)observers
{
  return self->_observers;
}

- (NSNotificationCenter)notificationCenter
{
  return self->_notificationCenter;
}

- (HMDTimerProvider)timerProvider
{
  return self->_timerProvider;
}

- (HMDStatusChannelProvider)channelProvider
{
  return self->_channelProvider;
}

- (HMFTimer)debounceTimer
{
  return (HMFTimer *)objc_getProperty(self, a2, 112, 1);
}

- (void)setDebounceTimer:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 112);
}

- (HMFTimer)inviteRetryTimer
{
  return (HMFTimer *)objc_getProperty(self, a2, 120, 1);
}

- (void)setInviteRetryTimer:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 120);
}

- (HMMLogEventSubmitting)logEventSubmitter
{
  return self->_logEventSubmitter;
}

- (HMFPromise)initialConnectedToStatusKitPromise
{
  return self->_initialConnectedToStatusKitPromise;
}

- (BOOL)receivedInitialChannelState
{
  return self->_receivedInitialChannelState;
}

- (void)setReceivedInitialChannelState:(BOOL)a3
{
  self->_receivedInitialChannelState = a3;
}

- (BOOL)started
{
  return self->_started;
}

- (void)setStarted:(BOOL)a3
{
  self->_started = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_initialConnectedToStatusKitPromise, 0);
  objc_storeStrong((id *)&self->_logEventSubmitter, 0);
  objc_storeStrong((id *)&self->_inviteRetryTimer, 0);
  objc_storeStrong((id *)&self->_debounceTimer, 0);
  objc_storeStrong((id *)&self->_channelProvider, 0);
  objc_storeStrong((id *)&self->_timerProvider, 0);
  objc_storeStrong((id *)&self->_notificationCenter, 0);
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_residentStatusMap, 0);
  objc_storeStrong((id *)&self->_channel, 0);
  objc_storeStrong((id *)&self->_initialConnectedToStatusKitFuture, 0);
  objc_destroyWeak((id *)&self->_manager);
  objc_destroyWeak((id *)&self->_home);
  objc_storeStrong((id *)&self->_currentPrimaryResident, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

void __46__HMDResidentStatusChannel__inviteSharedUsers__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  void *v5;
  _QWORD *v6;
  NSObject *v7;
  NSObject *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  int v19;
  void *v20;
  __int16 v21;
  uint64_t v22;
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v5 = (void *)MEMORY[0x227676638]();
  v6 = WeakRetained;
  HMFGetOSLogHandle();
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v3)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = *(_QWORD *)(a1 + 32);
      v19 = 138543618;
      v20 = v9;
      v21 = 2112;
      v22 = v10;
      _os_log_impl(&dword_2218F0000, v8, OS_LOG_TYPE_ERROR, "%{public}@Failed to set users %@", (uint8_t *)&v19, 0x16u);

    }
    objc_autoreleasePoolPop(v5);
    objc_msgSend(v6, "timerProvider");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "timerWithTimeInterval:options:", 0, 3600.0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setInviteRetryTimer:", v12);

    objc_msgSend(v6, "inviteRetryTimer");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setDelegate:", v6);

    v14 = v6[1];
    objc_msgSend(v6, "inviteRetryTimer");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setDelegateQueue:", v14);

    objc_msgSend(v6, "inviteRetryTimer");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "resume");

  }
  else
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    {
      HMFGetLogIdentifier();
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = *(_QWORD *)(a1 + 32);
      v19 = 138543618;
      v20 = v17;
      v21 = 2112;
      v22 = v18;
      _os_log_impl(&dword_2218F0000, v8, OS_LOG_TYPE_DEBUG, "%{public}@Successfully set invited users %@", (uint8_t *)&v19, 0x16u);

    }
    objc_autoreleasePoolPop(v5);
  }

}

uint64_t __63__HMDResidentStatusChannel__handleHomeUserRemovedNotification___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  NSObject *v4;
  void *v5;
  uint64_t v6;
  int v8;
  void *v9;
  __int16 v10;
  uint64_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v2 = (void *)MEMORY[0x227676638]();
  v3 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    HMFGetLogIdentifier();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = *(_QWORD *)(a1 + 40);
    v8 = 138543618;
    v9 = v5;
    v10 = 2112;
    v11 = v6;
    _os_log_impl(&dword_2218F0000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@Handling home user removed notification: %@", (uint8_t *)&v8, 0x16u);

  }
  objc_autoreleasePoolPop(v2);
  return objc_msgSend(*(id *)(a1 + 32), "_inviteSharedUsers");
}

uint64_t __61__HMDResidentStatusChannel__handleHomeUserAddedNotification___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  NSObject *v4;
  void *v5;
  uint64_t v6;
  int v8;
  void *v9;
  __int16 v10;
  uint64_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v2 = (void *)MEMORY[0x227676638]();
  v3 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    HMFGetLogIdentifier();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = *(_QWORD *)(a1 + 40);
    v8 = 138543618;
    v9 = v5;
    v10 = 2112;
    v11 = v6;
    _os_log_impl(&dword_2218F0000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@Handling home user added notification: %@", (uint8_t *)&v8, 0x16u);

  }
  objc_autoreleasePoolPop(v2);
  return objc_msgSend(*(id *)(a1 + 32), "_inviteSharedUsers");
}

void __43__HMDResidentStatusChannel_removeObserver___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "observers");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "removeObject:", *(_QWORD *)(a1 + 40));

}

void __40__HMDResidentStatusChannel_addObserver___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "observers");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObject:", *(_QWORD *)(a1 + 40));

}

uint64_t __52__HMDResidentStatusChannel_stopPublishingAsResident__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_stopPublishingAsResident");
}

uint64_t __57__HMDResidentStatusChannel_publishResidentStatus_reason___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_publishResidentStatus:reason:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

void __32__HMDResidentStatusChannel_stop__block_invoke(uint64_t a1)
{
  char v2;
  void *v3;
  id v4;
  NSObject *v5;
  _BOOL4 v6;
  void *v7;
  os_unfair_lock_s *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  int v18;
  void *v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v2 = objc_msgSend(*(id *)(a1 + 32), "started");
  v3 = (void *)MEMORY[0x227676638]();
  v4 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = os_log_type_enabled(v5, OS_LOG_TYPE_INFO);
  if ((v2 & 1) != 0)
  {
    if (v6)
    {
      HMFGetLogIdentifier();
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = 138543362;
      v19 = v7;
      _os_log_impl(&dword_2218F0000, v5, OS_LOG_TYPE_INFO, "%{public}@Stopping ResidentStatusChannel", (uint8_t *)&v18, 0xCu);

    }
    objc_autoreleasePoolPop(v3);
    *(_BYTE *)(*(_QWORD *)(a1 + 32) + 34) = 0;
    *(_BYTE *)(*(_QWORD *)(a1 + 32) + 32) = 0;
    v8 = (os_unfair_lock_s *)(*(_QWORD *)(a1 + 32) + 16);
    os_unfair_lock_lock_with_options();
    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = *(_QWORD *)(a1 + 32);
    v11 = *(void **)(v10 + 72);
    *(_QWORD *)(v10 + 72) = v9;

    v12 = *(void **)(*(_QWORD *)(a1 + 32) + 24);
    *(_QWORD *)(*(_QWORD *)(a1 + 32) + 24) = 0;

    os_unfair_lock_unlock(v8);
    objc_msgSend(*(id *)(a1 + 32), "home");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v13, "isOwnerUser") & 1) != 0)
    {
      objc_msgSend(*(id *)(a1 + 32), "notificationCenter");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "removeObserver:name:object:", *(_QWORD *)(a1 + 32), CFSTR("HMDHomeUserAddedNotification"), v13);

      objc_msgSend(*(id *)(a1 + 32), "notificationCenter");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "removeObserver:name:object:", *(_QWORD *)(a1 + 32), CFSTR("HMDHomeUserRemovedNotification"), v13);

    }
    objc_msgSend(*(id *)(a1 + 32), "channel");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "stop");

  }
  else
  {
    if (v6)
    {
      HMFGetLogIdentifier();
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = 138543362;
      v19 = v17;
      _os_log_impl(&dword_2218F0000, v5, OS_LOG_TYPE_INFO, "%{public}@ResidentStatusChannel already stopped", (uint8_t *)&v18, 0xCu);

    }
    objc_autoreleasePoolPop(v3);
  }
}

void __33__HMDResidentStatusChannel_start__block_invoke(uint64_t a1)
{
  int v2;
  void *v3;
  id v4;
  NSObject *v5;
  _BOOL4 v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v2 = objc_msgSend(*(id *)(a1 + 32), "started");
  v3 = (void *)MEMORY[0x227676638]();
  v4 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = os_log_type_enabled(v5, OS_LOG_TYPE_INFO);
  if (v2)
  {
    if (v6)
    {
      HMFGetLogIdentifier();
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = 138543362;
      v14 = v7;
      _os_log_impl(&dword_2218F0000, v5, OS_LOG_TYPE_INFO, "%{public}@ResidentStatusChannel already started", (uint8_t *)&v13, 0xCu);

    }
    objc_autoreleasePoolPop(v3);
  }
  else
  {
    if (v6)
    {
      HMFGetLogIdentifier();
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = 138543362;
      v14 = v8;
      _os_log_impl(&dword_2218F0000, v5, OS_LOG_TYPE_INFO, "%{public}@Starting ResidentStatusChannel", (uint8_t *)&v13, 0xCu);

    }
    objc_autoreleasePoolPop(v3);
    *(_BYTE *)(*(_QWORD *)(a1 + 32) + 34) = 1;
    *(_BYTE *)(*(_QWORD *)(a1 + 32) + 32) = 0;
    objc_msgSend(*(id *)(a1 + 32), "channel");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "start");

    objc_msgSend(*(id *)(a1 + 32), "home");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v10, "isOwnerUser"))
    {
      objc_msgSend(*(id *)(a1 + 32), "notificationCenter");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "addObserver:selector:name:object:", *(_QWORD *)(a1 + 32), sel__handleHomeUserAddedNotification_, CFSTR("HMDHomeUserAddedNotification"), v10);

      objc_msgSend(*(id *)(a1 + 32), "notificationCenter");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "addObserver:selector:name:object:", *(_QWORD *)(a1 + 32), sel__handleHomeUserRemovedNotification_, CFSTR("HMDHomeUserRemovedNotification"), v10);

    }
  }
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t31_97382 != -1)
    dispatch_once(&logCategory__hmf_once_t31_97382, &__block_literal_global_160_97383);
  return (id)logCategory__hmf_once_v32_97384;
}

void __39__HMDResidentStatusChannel_logCategory__block_invoke()
{
  uint64_t v0;
  void *v1;

  HMFCreateOSLogHandle();
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)logCategory__hmf_once_v32_97384;
  logCategory__hmf_once_v32_97384 = v0;

}

@end
