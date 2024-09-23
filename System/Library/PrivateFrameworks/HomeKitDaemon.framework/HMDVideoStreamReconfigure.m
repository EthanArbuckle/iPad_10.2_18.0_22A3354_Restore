@implementation HMDVideoStreamReconfigure

- (HMDVideoStreamReconfigure)initWithSessionID:(id)a3 workQueue:(id)a4 delegate:(id)a5 delegateQueue:(id)a6
{
  id v11;
  id v12;
  id v13;
  id v14;
  HMDVideoStreamReconfigure *v15;
  HMDVideoStreamReconfigure *v16;
  uint64_t v17;
  NSMutableArray *reconfigureEvents;
  objc_super v20;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  v20.receiver = self;
  v20.super_class = (Class)HMDVideoStreamReconfigure;
  v15 = -[HMDVideoStreamReconfigure init](&v20, sel_init);
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_sessionID, a3);
    objc_storeStrong((id *)&v16->_workQueue, a4);
    objc_storeWeak((id *)&v16->_delegate, v13);
    objc_storeStrong((id *)&v16->_delegateQueue, a6);
    objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", 10);
    v17 = objc_claimAutoreleasedReturnValue();
    reconfigureEvents = v16->_reconfigureEvents;
    v16->_reconfigureEvents = (NSMutableArray *)v17;

  }
  return v16;
}

- (id)logIdentifier
{
  if (self)
    self = (HMDVideoStreamReconfigure *)self->_sessionID;
  return -[HMFObject description](self, "description");
}

- (void)updateReconfigurationMode:(BOOL)a3
{
  NSObject *workQueue;
  _QWORD v4[5];
  BOOL v5;

  if (self)
    workQueue = self->_workQueue;
  else
    workQueue = 0;
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __55__HMDVideoStreamReconfigure_updateReconfigurationMode___block_invoke;
  v4[3] = &unk_24E7968C8;
  v4[4] = self;
  v5 = a3;
  dispatch_async(workQueue, v4);
}

- (void)downlinkQualityChanged:(id)a3
{
  id v4;
  NSObject *workQueue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  if (self)
    workQueue = self->_workQueue;
  else
    workQueue = 0;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __52__HMDVideoStreamReconfigure_downlinkQualityChanged___block_invoke;
  v7[3] = &unk_24E79C268;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(workQueue, v7);

}

- (void)timerDidFire:(id)a3
{
  HMFTimer *v4;
  HMFTimer *downgradeDebouceTimer;
  void *v6;
  HMDVideoStreamReconfigure *v7;
  NSObject *v8;
  void *v9;
  id WeakRetained;
  void *v11;
  HMDVideoStreamReconfigure *v12;
  NSObject *v13;
  void *v14;
  NSObject *delegateQueue;
  uint64_t (*v16)(uint64_t);
  void *v17;
  HMDVideoStreamReconfigure *v18;
  NSObject *v19;
  void *v20;
  void *v21;
  NSObject *v22;
  void *v23;
  __int128 v24;
  uint64_t (*v25)(uint64_t);
  void *v26;
  id v27;
  HMDVideoStreamReconfigure *v28;
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  v4 = (HMFTimer *)a3;
  if (self)
  {
    dispatch_assert_queue_V2((dispatch_queue_t)self->_workQueue);
    if (self->_upgradeDebouceTimer != v4)
    {
      downgradeDebouceTimer = self->_downgradeDebouceTimer;
LABEL_4:
      if (downgradeDebouceTimer == v4)
      {
        v6 = (void *)MEMORY[0x227676638]();
        v7 = self;
        HMFGetOSLogHandle();
        v8 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
        {
          HMFGetLogIdentifier();
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          LODWORD(v24) = 138543362;
          *(_QWORD *)((char *)&v24 + 4) = v9;
          _os_log_impl(&dword_2218F0000, v8, OS_LOG_TYPE_INFO, "%{public}@Downgrade debouce timer has fired, calling network has deteriorated", (uint8_t *)&v24, 0xCu);

        }
        objc_autoreleasePoolPop(v6);
        -[HMDVideoStreamReconfigure setDowngradeDebouceTimer:]((uint64_t)v7, 0);
        if (self)
        {
          v7->_reconfigurationMode = 1;
          -[HMDVideoStreamReconfigure _addReconfigureEvent:]((uint64_t)v7, 2);
          WeakRetained = objc_loadWeakRetained((id *)&v7->_delegate);
          v11 = (void *)MEMORY[0x227676638]();
          v12 = v7;
          HMFGetOSLogHandle();
          v13 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
          {
            HMFGetLogIdentifier();
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            LODWORD(v24) = 138543362;
            *(_QWORD *)((char *)&v24 + 4) = v14;
            _os_log_impl(&dword_2218F0000, v13, OS_LOG_TYPE_INFO, "%{public}@Calling delegate videoStreamReconfigureDidNetworkDeteriorate", (uint8_t *)&v24, 0xCu);

          }
          objc_autoreleasePoolPop(v11);
          if ((objc_opt_respondsToSelector() & 1) == 0)
            goto LABEL_21;
          delegateQueue = v12->_delegateQueue;
          *(_QWORD *)&v24 = MEMORY[0x24BDAC760];
          *((_QWORD *)&v24 + 1) = 3221225472;
          v16 = __53__HMDVideoStreamReconfigure__callNetworkDeteriorated__block_invoke;
LABEL_20:
          v25 = v16;
          v26 = &unk_24E79C268;
          v27 = WeakRetained;
          v28 = v12;
          dispatch_async(delegateQueue, &v24);

LABEL_21:
          goto LABEL_22;
        }
      }
      goto LABEL_22;
    }
  }
  else
  {
    dispatch_assert_queue_V2(0);
    downgradeDebouceTimer = 0;
    if (v4)
      goto LABEL_4;
  }
  v17 = (void *)MEMORY[0x227676638]();
  v18 = self;
  HMFGetOSLogHandle();
  v19 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v24) = 138543362;
    *(_QWORD *)((char *)&v24 + 4) = v20;
    _os_log_impl(&dword_2218F0000, v19, OS_LOG_TYPE_INFO, "%{public}@Upgrade debouce timer has fired, calling network has improved", (uint8_t *)&v24, 0xCu);

  }
  objc_autoreleasePoolPop(v17);
  -[HMDVideoStreamReconfigure setUpgradeDebouceTimer:]((uint64_t)v18, 0);
  if (self)
  {
    v18->_reconfigurationMode = 1;
    -[HMDVideoStreamReconfigure _addReconfigureEvent:]((uint64_t)v18, 1);
    WeakRetained = objc_loadWeakRetained((id *)&v18->_delegate);
    v21 = (void *)MEMORY[0x227676638]();
    v12 = v18;
    HMFGetOSLogHandle();
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(v24) = 138543362;
      *(_QWORD *)((char *)&v24 + 4) = v23;
      _os_log_impl(&dword_2218F0000, v22, OS_LOG_TYPE_INFO, "%{public}@Calling delegate videoStreamReconfigureDidNetworkImprove", (uint8_t *)&v24, 0xCu);

    }
    objc_autoreleasePoolPop(v21);
    if ((objc_opt_respondsToSelector() & 1) == 0)
      goto LABEL_21;
    delegateQueue = v12->_delegateQueue;
    *(_QWORD *)&v24 = MEMORY[0x24BDAC760];
    *((_QWORD *)&v24 + 1) = 3221225472;
    v16 = __49__HMDVideoStreamReconfigure__callNetworkImproved__block_invoke;
    goto LABEL_20;
  }
LABEL_22:

}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_sessionID, 0);
  objc_storeStrong((id *)&self->_delegateQueue, 0);
  objc_storeStrong((id *)&self->_workQueue, 0);
  objc_storeStrong((id *)&self->_downgradeDebouceTimer, 0);
  objc_storeStrong((id *)&self->_upgradeDebouceTimer, 0);
  objc_storeStrong((id *)&self->_reconfigureEvents, 0);
  objc_storeStrong((id *)&self->_downlinkQualityInfo, 0);
}

- (void)setUpgradeDebouceTimer:(uint64_t)a1
{
  if (a1)
    objc_storeStrong((id *)(a1 + 32), a2);
}

- (void)setDowngradeDebouceTimer:(uint64_t)a1
{
  if (a1)
    objc_storeStrong((id *)(a1 + 40), a2);
}

- (void)_addReconfigureEvent:(uint64_t)a1
{
  HMDVideoStreamReconfigureEvent *v4;

  if (objc_msgSend(*(id *)(a1 + 24), "count") == 10)
    objc_msgSend(*(id *)(a1 + 24), "removeObjectAtIndex:", 0);
  v4 = -[HMDVideoStreamReconfigureEvent initWithEventType:]([HMDVideoStreamReconfigureEvent alloc], "initWithEventType:", a2);
  objc_msgSend(*(id *)(a1 + 24), "addObject:", v4);

}

uint64_t __53__HMDVideoStreamReconfigure__callNetworkDeteriorated__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "videoStreamReconfigureDidNetworkDeteriorate:", *(_QWORD *)(a1 + 40));
}

uint64_t __49__HMDVideoStreamReconfigure__callNetworkImproved__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "videoStreamReconfigureDidNetworkImprove:", *(_QWORD *)(a1 + 40));
}

void __52__HMDVideoStreamReconfigure_downlinkQualityChanged___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  id v6;
  NSObject *v7;
  void *v8;
  int v9;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  v2 = (void *)objc_msgSend(*(id *)(a1 + 40), "copy");
  v3 = *(_QWORD *)(a1 + 32);
  if (v3)
    objc_storeStrong((id *)(v3 + 16), v2);

  v4 = *(_QWORD *)(a1 + 32);
  if (v4)
  {
    if (*(_BYTE *)(v4 + 8))
    {
      v5 = (void *)MEMORY[0x227676638]();
      v6 = *(id *)(a1 + 32);
      HMFGetOSLogHandle();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = 138543362;
        v10 = v8;
        _os_log_impl(&dword_2218F0000, v7, OS_LOG_TYPE_INFO, "%{public}@Not processing the downlink quality change yet, since the stream is in reconfiguration mode", (uint8_t *)&v9, 0xCu);

      }
      objc_autoreleasePoolPop(v5);
    }
    else
    {
      -[HMDVideoStreamReconfigure _processDownlinkQuality]((id *)v4);
    }
  }
}

- (void)_processDownlinkQuality
{
  id v2;
  void *v3;
  id *v4;
  NSObject *v5;
  void *v6;
  void *v7;
  int v8;
  int v9;
  void *v10;
  id *v11;
  NSObject *v12;
  void *v13;
  char v14;
  void *v15;
  id *v16;
  NSObject *v17;
  void *v18;
  char v19;
  id v20;
  void *v21;
  id *v22;
  NSObject *v23;
  _BOOL4 v24;
  void *v25;
  void *v26;
  char v27;
  id v28;
  uint64_t v29;
  id *v30;
  NSObject *v31;
  void *v32;
  void *v33;
  id *v34;
  NSObject *v35;
  void *v36;
  uint64_t v37;
  void *v38;
  NSObject *v39;
  void *v40;
  void *v41;
  id v42;
  void *v43;
  id v44;
  id v45;
  uint64_t v46;
  double v47;
  id v48;
  void *v49;
  id v50;
  void *v51;
  id v52;
  void *v53;
  void *v54;
  id *v55;
  NSObject *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  double v61;
  double v62;
  void *v63;
  NSObject *v64;
  void *v65;
  void *v66;
  id v67;
  id v68;
  id v69;
  void *v70;
  id *v71;
  NSObject *v72;
  void *v73;
  void *v74;
  id *v75;
  NSObject *v76;
  void *v77;
  void *v78;
  void *v79;
  void *v80;
  uint8_t buf[4];
  void *v82;
  __int16 v83;
  uint64_t v84;
  __int16 v85;
  void *v86;
  __int16 v87;
  void *v88;
  uint64_t v89;

  v89 = *MEMORY[0x24BDAC8D0];
  if (a1)
  {
    v2 = a1[2];
    v3 = (void *)MEMORY[0x227676638]();
    v4 = a1;
    HMFGetOSLogHandle();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v82 = v6;
      v83 = 2112;
      v84 = (uint64_t)v2;
      _os_log_impl(&dword_2218F0000, v5, OS_LOG_TYPE_INFO, "%{public}@Downlink quality changed with %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v3);
    objc_msgSend(v2, "hmf_numberForKey:", *MEMORY[0x24BDFDA98]);
    v80 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "hmf_numberForKey:", *MEMORY[0x24BDFDA90]);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v2, "hmf_BOOLForKey:", *MEMORY[0x24BDFDA80]);
    v9 = objc_msgSend(v2, "hmf_BOOLForKey:", *MEMORY[0x24BDFDA88]);
    if (v4[4] && (v8 & 1) == 0)
    {
      v10 = (void *)MEMORY[0x227676638]();
      v11 = v4;
      HMFGetOSLogHandle();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v82 = v13;
        _os_log_impl(&dword_2218F0000, v12, OS_LOG_TYPE_INFO, "%{public}@Upgrade debounce timer is set, but not operating at maximum anymore, resetting the timer", buf, 0xCu);

      }
      objc_autoreleasePoolPop(v10);
      objc_storeStrong(v11 + 4, 0);
    }
    if (v4[5])
      v14 = v9;
    else
      v14 = 1;
    if ((v14 & 1) == 0)
    {
      v15 = (void *)MEMORY[0x227676638]();
      v16 = v4;
      HMFGetOSLogHandle();
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v82 = v18;
        _os_log_impl(&dword_2218F0000, v17, OS_LOG_TYPE_INFO, "%{public}@Downgrade debounce timer is set, but not operating at minimum anymore, resetting the timer", buf, 0xCu);

      }
      objc_autoreleasePoolPop(v15);
      objc_storeStrong(v16 + 5, 0);
    }
    if (v9)
    {
      v19 = objc_msgSend(v80, "isEqualToNumber:", v7);
      v20 = v4[5];
      if ((v19 & 1) != 0)
      {
        v21 = (void *)MEMORY[0x227676638]();
        v22 = v4;
        HMFGetOSLogHandle();
        v23 = objc_claimAutoreleasedReturnValue();
        v24 = os_log_type_enabled(v23, OS_LOG_TYPE_INFO);
        if (v20)
        {
          if (v24)
          {
            HMFGetLogIdentifier();
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543362;
            v82 = v25;
            _os_log_impl(&dword_2218F0000, v23, OS_LOG_TYPE_INFO, "%{public}@Downgrade debounce timer is already scheduled", buf, 0xCu);

          }
          v26 = v21;
LABEL_28:
          objc_autoreleasePoolPop(v26);
          goto LABEL_53;
        }
        if (v24)
        {
          HMFGetLogIdentifier();
          v41 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543618;
          v82 = v41;
          v83 = 2048;
          v84 = videoAttributesDowngradeDebouceTimer;
          _os_log_impl(&dword_2218F0000, v23, OS_LOG_TYPE_INFO, "%{public}@Starting downgrade debouce timer with interval %llu seconds", buf, 0x16u);

        }
        objc_autoreleasePoolPop(v21);
        v42 = objc_alloc(MEMORY[0x24BE3F298]);
        v43 = (void *)objc_msgSend(v42, "initWithTimeInterval:options:", 0, (double)(unint64_t)videoAttributesDowngradeDebouceTimer);
        objc_storeStrong(v22 + 5, v43);

        objc_msgSend(v22[5], "setDelegate:", v22);
        v44 = v22[5];
        v45 = v22[6];
        objc_msgSend(v44, "setDelegateQueue:", v45);

        v46 = 5;
        goto LABEL_52;
      }
      if (!v20)
        goto LABEL_53;
      v33 = (void *)MEMORY[0x227676638]();
      v34 = v4;
      HMFGetOSLogHandle();
      v35 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v35, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v82 = v36;
        _os_log_impl(&dword_2218F0000, v35, OS_LOG_TYPE_INFO, "%{public}@Downgrade debounce timer is set, but optimal and operating bitrates arent matching, resetting the timer", buf, 0xCu);

      }
      objc_autoreleasePoolPop(v33);
      v37 = 5;
    }
    else
    {
      if (!v8)
      {
LABEL_53:

        v69 = v4[2];
        v4[2] = 0;

        return;
      }
      v27 = objc_msgSend(v80, "isEqualToNumber:", v7);
      v28 = v4[4];
      if ((v27 & 1) != 0)
      {
        if (v28)
        {
          v29 = MEMORY[0x227676638]();
          v30 = v4;
          HMFGetOSLogHandle();
          v31 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v31, OS_LOG_TYPE_INFO))
          {
            HMFGetLogIdentifier();
            v32 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543362;
            v82 = v32;
            _os_log_impl(&dword_2218F0000, v31, OS_LOG_TYPE_INFO, "%{public}@Upgrade debounce timer is already scheduled", buf, 0xCu);

          }
          v26 = (void *)v29;
          goto LABEL_28;
        }
        v79 = v7;
        v47 = (double)(unint64_t)videoAttributesUpgradeDebouceTimer;
        if ((unint64_t)objc_msgSend(v4[3], "count") >= 4)
        {
          v48 = v4[3];
          objc_msgSend(v48, "objectAtIndex:", objc_msgSend(v48, "count") - 1);
          v49 = (void *)objc_claimAutoreleasedReturnValue();

          v50 = v4[3];
          objc_msgSend(v50, "objectAtIndex:", objc_msgSend(v50, "count") - 2);
          v51 = (void *)objc_claimAutoreleasedReturnValue();

          v52 = v4[3];
          objc_msgSend(v52, "objectAtIndex:", objc_msgSend(v52, "count") - 3);
          v53 = (void *)objc_claimAutoreleasedReturnValue();

          v54 = (void *)MEMORY[0x227676638]();
          v55 = v4;
          HMFGetOSLogHandle();
          v56 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v56, OS_LOG_TYPE_INFO))
          {
            HMFGetLogIdentifier();
            v57 = v51;
            v58 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138544130;
            v82 = v58;
            v83 = 2112;
            v84 = (uint64_t)v49;
            v85 = 2112;
            v86 = v57;
            v87 = 2112;
            v88 = v53;
            _os_log_impl(&dword_2218F0000, v56, OS_LOG_TYPE_INFO, "%{public}@reconfigure_1: %@, reconfigure_2: %@, reconfigure_3: %@", buf, 0x2Au);

            v51 = v57;
          }

          objc_autoreleasePoolPop(v54);
          v7 = v79;
          if (objc_msgSend(v49, "eventType") == 2
            && objc_msgSend(v51, "eventType") == 1
            && objc_msgSend(v53, "eventType") == 2
            && (objc_msgSend(v53, "timestamp"),
                v59 = v51,
                v60 = (void *)objc_claimAutoreleasedReturnValue(),
                objc_msgSend(v60, "timeIntervalSinceNow"),
                v62 = fabs(v61),
                v60,
                v51 = v59,
                v62 < 120.0))
          {
            v78 = v49;
            v70 = (void *)MEMORY[0x227676638]();
            v71 = v55;
            HMFGetOSLogHandle();
            v72 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v72, OS_LOG_TYPE_INFO))
            {
              HMFGetLogIdentifier();
              v73 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138543618;
              v82 = v73;
              v83 = 2048;
              v84 = *(_QWORD *)&v62;
              _os_log_impl(&dword_2218F0000, v72, OS_LOG_TYPE_INFO, "%{public}@Downgrade-Upgrade-Downgrade has happened within %lf seconds", buf, 0x16u);

              v51 = v59;
            }

            objc_autoreleasePoolPop(v70);
            v74 = (void *)MEMORY[0x227676638]();
            v75 = v71;
            HMFGetOSLogHandle();
            v76 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v76, OS_LOG_TYPE_INFO))
            {
              HMFGetLogIdentifier();
              v77 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138543618;
              v82 = v77;
              v83 = 2048;
              v84 = 0x405E000000000000;
              _os_log_impl(&dword_2218F0000, v76, OS_LOG_TYPE_INFO, "%{public}@A Flip flop has been detected, so upgrade is going to be backed off by %lf seconds", buf, 0x16u);

            }
            objc_autoreleasePoolPop(v74);
            v47 = 120.0;
          }
          else
          {

          }
        }
        v63 = (void *)MEMORY[0x227676638]();
        v22 = v4;
        HMFGetOSLogHandle();
        v64 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v64, OS_LOG_TYPE_INFO))
        {
          HMFGetLogIdentifier();
          v65 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543618;
          v82 = v65;
          v83 = 2048;
          v84 = *(_QWORD *)&v47;
          _os_log_impl(&dword_2218F0000, v64, OS_LOG_TYPE_INFO, "%{public}@Starting upgrade debouce timer with interval %lf seconds", buf, 0x16u);

        }
        objc_autoreleasePoolPop(v63);
        v66 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE3F298]), "initWithTimeInterval:options:", 0, v47);
        objc_storeStrong(v22 + 4, v66);

        objc_msgSend(v22[4], "setDelegate:", v22);
        v67 = v22[4];
        v68 = v22[6];
        objc_msgSend(v67, "setDelegateQueue:", v68);

        v46 = 4;
LABEL_52:
        objc_msgSend(v22[v46], "resume");
        goto LABEL_53;
      }
      if (!v28)
        goto LABEL_53;
      v38 = (void *)MEMORY[0x227676638]();
      v34 = v4;
      HMFGetOSLogHandle();
      v39 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v39, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v82 = v40;
        _os_log_impl(&dword_2218F0000, v39, OS_LOG_TYPE_INFO, "%{public}@Upgrade debounce timer is set, but optimal and operating bitrates arent matching, resetting the timer", buf, 0xCu);

      }
      objc_autoreleasePoolPop(v38);
      v37 = 4;
    }
    objc_storeStrong(&v34[v37], 0);
    goto LABEL_53;
  }
}

void __55__HMDVideoStreamReconfigure_updateReconfigurationMode___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  id v11;
  NSObject *v12;
  void *v13;
  int v14;
  void *v15;
  __int16 v16;
  void *v17;
  __int16 v18;
  void *v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v2 = (void *)MEMORY[0x227676638]();
  v3 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    HMFBooleanToString();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    HMFBooleanToString();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = 138543874;
    v15 = v5;
    v16 = 2112;
    v17 = v6;
    v18 = 2112;
    v19 = v7;
    _os_log_impl(&dword_2218F0000, v4, OS_LOG_TYPE_INFO, "%{public}@Updating reconfiguration mode from %@ to %@", (uint8_t *)&v14, 0x20u);

  }
  objc_autoreleasePoolPop(v2);
  v8 = *(_QWORD *)(a1 + 32);
  if (v8)
  {
    *(_BYTE *)(v8 + 8) = *(_BYTE *)(a1 + 40);
    v9 = *(_QWORD *)(a1 + 32);
    if (v9)
    {
      if (*(_QWORD *)(v9 + 16))
      {
        v10 = (void *)MEMORY[0x227676638]();
        v11 = *(id *)(a1 + 32);
        HMFGetOSLogHandle();
        v12 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
        {
          HMFGetLogIdentifier();
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          v14 = 138543362;
          v15 = v13;
          _os_log_impl(&dword_2218F0000, v12, OS_LOG_TYPE_INFO, "%{public}@Downlink quality info is present, processing it", (uint8_t *)&v14, 0xCu);

        }
        objc_autoreleasePoolPop(v10);
        -[HMDVideoStreamReconfigure _processDownlinkQuality](*(id **)(a1 + 32));
      }
    }
  }
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t0_14578 != -1)
    dispatch_once(&logCategory__hmf_once_t0_14578, &__block_literal_global_14579);
  return (id)logCategory__hmf_once_v1_14580;
}

void __40__HMDVideoStreamReconfigure_logCategory__block_invoke()
{
  uint64_t v0;
  void *v1;

  HMFCreateOSLogHandle();
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)logCategory__hmf_once_v1_14580;
  logCategory__hmf_once_v1_14580 = v0;

}

@end
