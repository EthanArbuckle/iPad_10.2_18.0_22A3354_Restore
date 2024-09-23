@implementation HMDAccessoryPairingLogEventStateManager

- (HMDAccessoryPairingLogEventStateManager)initWithNotificationCenter:(id)a3
{
  id v5;
  HMDAccessoryPairingLogEventStateManager *v6;
  NSMutableDictionary *v7;
  NSMutableDictionary *retryCountMap;
  uint64_t v9;
  NSMutableDictionary *pairingProgressStateTracker;
  uint64_t v11;
  NSDate *lastPairingEndTime;
  objc_super v14;

  v5 = a3;
  v14.receiver = self;
  v14.super_class = (Class)HMDAccessoryPairingLogEventStateManager;
  v6 = -[HMDAccessoryPairingLogEventStateManager init](&v14, sel_init);
  if (v6)
  {
    v7 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x24BDBCED8]);
    retryCountMap = v6->_retryCountMap;
    v6->_retryCountMap = v7;

    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v9 = objc_claimAutoreleasedReturnValue();
    pairingProgressStateTracker = v6->_pairingProgressStateTracker;
    v6->_pairingProgressStateTracker = (NSMutableDictionary *)v9;

    v6->_pairingUIState = 0;
    v6->_recoveryType = 0;
    v6->_previousRecoveryType = 0;
    objc_msgSend(MEMORY[0x24BDBCE60], "distantPast");
    v11 = objc_claimAutoreleasedReturnValue();
    lastPairingEndTime = v6->_lastPairingEndTime;
    v6->_lastPairingEndTime = (NSDate *)v11;

    objc_storeStrong((id *)&v6->_notificationCenter, a3);
    -[NSNotificationCenter addObserver:selector:name:object:](v6->_notificationCenter, "addObserver:selector:name:object:", v6, sel_handleMatterAccessoryUpdatePairingMetricNotification_, CFSTR("HMDMatterAccessoryUpdatePairingMetricNotification"), 0);
    -[NSNotificationCenter addObserver:selector:name:object:](v6->_notificationCenter, "addObserver:selector:name:object:", v6, sel__handlePairingStateProgressNotification_, CFSTR("HMDAccessoryProgressStateUpdateNotification"), 0);
  }

  return v6;
}

- (void)configureWithPairingEvent:(id)a3 workQueue:(id)a4 logEventSubmitter:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  HMDAccessoryPairingLogEventStateManager *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  void *v16;
  int v17;
  void *v18;
  __int16 v19;
  id v20;
  __int16 v21;
  id v22;
  __int16 v23;
  void *v24;
  __int16 v25;
  void *v26;
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = (void *)MEMORY[0x227676638]();
  v12 = self;
  HMFGetOSLogHandle();
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDAccessoryPairingLogEventStateManager workQueue](v12, "workQueue");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDAccessoryPairingLogEventStateManager logEventSubmitter](v12, "logEventSubmitter");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = 138544386;
    v18 = v14;
    v19 = 2112;
    v20 = v9;
    v21 = 2112;
    v22 = v10;
    v23 = 2112;
    v24 = v15;
    v25 = 2112;
    v26 = v16;
    _os_log_impl(&dword_2218F0000, v13, OS_LOG_TYPE_INFO, "%{public}@Configuring with workQueue %@ logEventSubmitter %@, from workQueue %@ logEventSubmitter %@", (uint8_t *)&v17, 0x34u);

  }
  objc_autoreleasePoolPop(v11);
  -[HMDAccessoryPairingLogEventStateManager setPairingEvent:](v12, "setPairingEvent:", v8);
  -[HMDAccessoryPairingLogEventStateManager setWorkQueue:](v12, "setWorkQueue:", v9);
  -[HMDAccessoryPairingLogEventStateManager setLogEventSubmitter:](v12, "setLogEventSubmitter:", v10);

}

- (BOOL)isConfigured
{
  void *v3;
  void *v4;
  void *v5;
  BOOL v6;

  -[HMDAccessoryPairingLogEventStateManager pairingEvent](self, "pairingEvent");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    -[HMDAccessoryPairingLogEventStateManager workQueue](self, "workQueue");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (v4)
    {
      -[HMDAccessoryPairingLogEventStateManager logEventSubmitter](self, "logEventSubmitter");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = v5 != 0;

    }
    else
    {
      v6 = 0;
    }

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (void)handleMatterAccessoryUpdatePairingMetricNotification:(id)a3
{
  id v4;
  BOOL v5;
  void *v6;
  HMDAccessoryPairingLogEventStateManager *v7;
  NSObject *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  NSObject *v15;
  id v16;
  id v17;
  void *v18;
  void *v19;
  _QWORD v20[5];
  id v21;
  id v22;
  id v23;
  uint8_t buf[4];
  void *v25;
  __int16 v26;
  void *v27;
  __int16 v28;
  void *v29;
  uint64_t v30;

  v30 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = -[HMDAccessoryPairingLogEventStateManager isConfigured](self, "isConfigured");
  v6 = (void *)MEMORY[0x227676638]();
  v7 = self;
  HMFGetOSLogHandle();
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v5)
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "name");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMDAccessoryPairingLogEventStateManager pairingEvent](v7, "pairingEvent");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v25 = v10;
      v26 = 2112;
      v27 = v11;
      v28 = 2112;
      v29 = v12;
      _os_log_impl(&dword_2218F0000, v9, OS_LOG_TYPE_INFO, "%{public}@Handling %@ %@", buf, 0x20u);

    }
    objc_autoreleasePoolPop(v6);
    -[HMDAccessoryPairingLogEventStateManager pairingEvent](v7, "pairingEvent");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDAccessoryPairingLogEventStateManager logEventSubmitter](v7, "logEventSubmitter");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDAccessoryPairingLogEventStateManager workQueue](v7, "workQueue");
    v15 = objc_claimAutoreleasedReturnValue();
    v20[0] = MEMORY[0x24BDAC760];
    v20[1] = 3221225472;
    v20[2] = __96__HMDAccessoryPairingLogEventStateManager_handleMatterAccessoryUpdatePairingMetricNotification___block_invoke;
    v20[3] = &unk_24E79A910;
    v20[4] = v7;
    v21 = v4;
    v22 = v13;
    v23 = v14;
    v16 = v14;
    v17 = v13;
    dispatch_async(v15, v20);

  }
  else
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "name");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v25 = v18;
      v26 = 2112;
      v27 = v19;
      _os_log_impl(&dword_2218F0000, v9, OS_LOG_TYPE_ERROR, "%{public}@Not handling %@ logEventStateManager is not configured", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v6);
  }

}

- (void)_handleMatterAccessoryUpdatePairingMetricNotification:(id)a3 pairingEvent:(id)a4 logEventSubmitter:(id)a5
{
  id v8;
  id v9;
  id v10;
  os_unfair_lock_s *p_matterAccessoryPairingMetricLock;
  uint64_t v12;
  void *v13;
  HMDAccessoryPairingLogEventStateManager *v14;
  NSObject *v15;
  id v16;
  void *v17;
  void *v18;
  HMDAccessoryPairingLogEventStateManager *v19;
  NSObject *v20;
  void *v21;
  HMDAccessoryPairingLogEventStateManager *v22;
  void *v23;
  HMDAccessoryPairingLogEventStateManager *v24;
  void *v25;
  HMDAccessoryPairingLogEventStateManager *v26;
  void *v27;
  HMDAccessoryPairingLogEventStateManager *v28;
  void *v29;
  void *v30;
  uint64_t v31;
  HMDAccessoryPairingLogEventStateManager *v32;
  NSObject *v33;
  id v34;
  id v35;
  void *v36;
  void *v37;
  void *v38;
  HMDAccessoryPairingLogEventStateManager *v39;
  NSObject *v40;
  id v41;
  void *v42;
  void *v43;
  unint64_t v44;
  void *v45;
  HMDAccessoryPairingLogEventStateManager *v46;
  NSObject *v47;
  void *v48;
  HMDAccessoryPairingLogEventStateManager *v49;
  NSObject *v50;
  id v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  HMDAccessoryPairingLogEventStateManager *v56;
  NSObject *v57;
  void *v58;
  void *v59;
  void *v60;
  HMDAccessoryPairingLogEventStateManager *v61;
  NSObject *v62;
  id v63;
  void *v64;
  void *v65;
  void *v66;
  int v67;
  void *v68;
  HMDAccessoryPairingLogEventStateManager *v69;
  NSObject *v70;
  void *v71;
  void *v72;
  void *v73;
  id v74;
  void *v75;
  void *v76;
  void *v77;
  id v78;
  void *context;
  void *contexta;
  id v81;
  uint8_t buf[4];
  id v83;
  __int16 v84;
  id v85;
  __int16 v86;
  void *v87;
  __int16 v88;
  void *v89;
  __int16 v90;
  void *v91;
  uint64_t v92;

  v92 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  p_matterAccessoryPairingMetricLock = &self->_matterAccessoryPairingMetricLock;
  v12 = os_unfair_lock_lock_with_options();
  v13 = (void *)MEMORY[0x227676638](v12);
  v14 = self;
  HMFGetOSLogHandle();
  v15 = (id)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v16 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "name");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v83 = v16;
    v84 = 2112;
    v85 = v17;
    _os_log_impl(&dword_2218F0000, v15, OS_LOG_TYPE_INFO, "%{public}@Handling %@", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v13);
  if (!v9)
  {
    v18 = (void *)MEMORY[0x227676638]();
    v22 = v14;
    HMFGetOSLogHandle();
    v20 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v83 = v23;
      _os_log_impl(&dword_2218F0000, v20, OS_LOG_TYPE_ERROR, "%{public}@Not updating pairing metric because pairing event is nil", buf, 0xCu);

    }
    goto LABEL_18;
  }
  if ((objc_msgSend(v9, "isMatterAccessory") & 1) == 0)
  {
    v18 = (void *)MEMORY[0x227676638]();
    v24 = v14;
    HMFGetOSLogHandle();
    v20 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v83 = v25;
      _os_log_impl(&dword_2218F0000, v20, OS_LOG_TYPE_ERROR, "%{public}@Not updating pairing metric because pairing event is not for matter accessory", buf, 0xCu);

    }
    goto LABEL_18;
  }
  if ((objc_msgSend(v9, "isAddOperation") & 1) == 0)
  {
    v18 = (void *)MEMORY[0x227676638]();
    v26 = v14;
    HMFGetOSLogHandle();
    v20 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v83 = v27;
      _os_log_impl(&dword_2218F0000, v20, OS_LOG_TYPE_ERROR, "%{public}@Not updating pairing metric because pairing event is not add operation", buf, 0xCu);

    }
    goto LABEL_18;
  }
  if (objc_msgSend(v9, "isSubmitted"))
  {
    v18 = (void *)MEMORY[0x227676638]();
    v19 = v14;
    HMFGetOSLogHandle();
    v20 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v83 = v21;
      _os_log_impl(&dword_2218F0000, v20, OS_LOG_TYPE_ERROR, "%{public}@Not updating pairing metric because pairing event is already submitted", buf, 0xCu);

    }
LABEL_18:

    objc_autoreleasePoolPop(v18);
    goto LABEL_19;
  }
  if (objc_msgSend(v9, "isSubmitting"))
  {
    v18 = (void *)MEMORY[0x227676638]();
    v28 = v14;
    HMFGetOSLogHandle();
    v20 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v83 = v29;
      _os_log_impl(&dword_2218F0000, v20, OS_LOG_TYPE_ERROR, "%{public}@Not updating pairing metric because pairing event is already being submitted", buf, 0xCu);

    }
    goto LABEL_18;
  }
  objc_msgSend(v9, "error");
  v30 = (void *)objc_claimAutoreleasedReturnValue();

  v31 = objc_msgSend(v9, "matterAccessoryPairingStep");
  if (v30 || v31 == 25)
  {
    context = (void *)MEMORY[0x227676638](v31);
    v32 = v14;
    HMFGetOSLogHandle();
    v33 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v34 = (id)objc_claimAutoreleasedReturnValue();
      HMDMatterAccessoryPairingStepAsString(objc_msgSend(v9, "matterAccessoryPairingStep"));
      v35 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "error");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v83 = v34;
      v84 = 2112;
      v85 = v35;
      v86 = 2112;
      v87 = v36;
      _os_log_impl(&dword_2218F0000, v33, OS_LOG_TYPE_ERROR, "%{public}@Received update to pairing event when metric is completed already %@ %@", buf, 0x20u);

    }
    objc_autoreleasePoolPop(context);
  }
  objc_msgSend(v8, "userInfo");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "objectForKeyedSubscript:", CFSTR("HMDMatterAccessoryPairingMTRMetricsKey"));
  contexta = (void *)objc_claimAutoreleasedReturnValue();

  if (contexta)
  {
    v38 = (void *)MEMORY[0x227676638]();
    v39 = v14;
    HMFGetOSLogHandle();
    v40 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v40, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v41 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "mtrMetrics");
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v83 = v41;
      v84 = 2048;
      v85 = v42;
      v86 = 2048;
      v87 = contexta;
      _os_log_impl(&dword_2218F0000, v40, OS_LOG_TYPE_INFO, "%{public}@Updating mtr metrics %p -> %p", buf, 0x20u);

    }
    objc_autoreleasePoolPop(v38);
    objc_msgSend(v9, "setMtrMetrics:", contexta);
  }
  objc_msgSend(v8, "userInfo");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  v81 = 0;
  v44 = objc_msgSend(v43, "hmf_integerForKey:error:", CFSTR("HMDMatterAccessoryPairingStepKey"), &v81);
  v78 = v81;

  if (objc_msgSend(v78, "code") == 3)
  {
    v45 = (void *)MEMORY[0x227676638]();
    v46 = v14;
    HMFGetOSLogHandle();
    v47 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v47, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v83 = v48;
      v84 = 2112;
      v85 = v78;
      _os_log_impl(&dword_2218F0000, v47, OS_LOG_TYPE_ERROR, "%{public}@Failed to updating pairing metric with error %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v45);
  }
  else
  {
    if (!v78)
    {
      v76 = (void *)MEMORY[0x227676638]();
      v49 = v14;
      HMFGetOSLogHandle();
      v50 = (id)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v50, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v74 = (id)objc_claimAutoreleasedReturnValue();
        HMDMatterAccessoryPairingStepAsString(objc_msgSend(v9, "matterAccessoryPairingStep"));
        v51 = (id)objc_claimAutoreleasedReturnValue();
        HMDMatterAccessoryPairingStepAsString(v44);
        v52 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        v83 = v74;
        v84 = 2112;
        v85 = v51;
        v86 = 2112;
        v87 = v52;
        _os_log_impl(&dword_2218F0000, v50, OS_LOG_TYPE_INFO, "%{public}@Updating step %@ -> %@", buf, 0x20u);

      }
      objc_autoreleasePoolPop(v76);
      objc_msgSend(v9, "setMatterAccessoryPairingStep:", v44);
    }
    objc_msgSend(v8, "userInfo");
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v53, "hmf_errorForKey:", CFSTR("HMDMatterAccessoryPairingFailureErrorKey"));
    v77 = (void *)objc_claimAutoreleasedReturnValue();

    if (v77)
    {
      objc_msgSend(v8, "userInfo");
      v54 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v54, "hmf_stringForKey:", CFSTR("HMDMatterAccessoryPairingSourceErrorDomain"));
      v75 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v75)
      {
        v55 = (void *)MEMORY[0x227676638]();
        v56 = v14;
        HMFGetOSLogHandle();
        v57 = (id)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v57, OS_LOG_TYPE_ERROR))
        {
          HMFGetLogIdentifier();
          v58 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543362;
          v83 = v58;
          _os_log_impl(&dword_2218F0000, v57, OS_LOG_TYPE_ERROR, "%{public}@Received pairing error without source error domain", buf, 0xCu);

        }
        objc_autoreleasePoolPop(v55);
      }
      v59 = (void *)MEMORY[0x24BDD1540];
      objc_msgSend(v77, "domain");
      v60 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v59, "errorWithDomain:code:userInfo:", v60, objc_msgSend(v77, "code"), 0);
      v73 = (void *)objc_claimAutoreleasedReturnValue();

      v72 = (void *)MEMORY[0x227676638]();
      v61 = v14;
      HMFGetOSLogHandle();
      v62 = (id)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v62, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v63 = (id)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "error");
        v64 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "matterAccessorySourceErrorDomain");
        v65 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138544386;
        v83 = v63;
        v84 = 2112;
        v85 = v64;
        v86 = 2112;
        v87 = v73;
        v88 = 2112;
        v89 = v65;
        v90 = 2112;
        v91 = v75;
        _os_log_impl(&dword_2218F0000, v62, OS_LOG_TYPE_INFO, "%{public}@Updating error %@ -> %@, sourceErrorDomain %@ -> %@", buf, 0x34u);

      }
      objc_autoreleasePoolPop(v72);
      objc_msgSend(v9, "setError:", v73);
      objc_msgSend(v9, "setMatterAccessorySourceErrorDomain:", v75);

    }
    objc_msgSend(v8, "userInfo");
    v66 = (void *)objc_claimAutoreleasedReturnValue();
    v67 = objc_msgSend(v66, "hmf_BOOLForKey:", CFSTR("HMDMatterAccessoryPairingSubmitKey"));

    if (v67)
    {
      v68 = (void *)MEMORY[0x227676638](-[HMDAccessoryPairingLogEventStateManager fillUnknownErrorIfMissingErrorForPairingEvent:](v14, "fillUnknownErrorIfMissingErrorForPairingEvent:", v9));
      v69 = v14;
      HMFGetOSLogHandle();
      v70 = (id)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v70, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v71 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v83 = v71;
        v84 = 2112;
        v85 = v9;
        _os_log_impl(&dword_2218F0000, v70, OS_LOG_TYPE_INFO, "%{public}@Submitting Event %@", buf, 0x16u);

      }
      objc_autoreleasePoolPop(v68);
      objc_msgSend(v9, "setSubmitting:", 1);
      objc_msgSend(v10, "submitLogEvent:", v9);
    }

  }
LABEL_19:
  os_unfair_lock_unlock(p_matterAccessoryPairingMetricLock);

}

- (void)fillUnknownErrorIfMissingErrorForPairingEvent:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  HMDAccessoryPairingLogEventStateManager *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  int v12;
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = objc_msgSend(v4, "matterAccessoryPairingStep");
  objc_msgSend(v4, "error");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5 != 25 && !v6)
  {
    v7 = (void *)MEMORY[0x227676638]();
    v8 = self;
    HMFGetOSLogHandle();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = 138543362;
      v13 = v10;
      _os_log_impl(&dword_2218F0000, v9, OS_LOG_TYPE_INFO, "%{public}@Filling unknown error before submission because pairing event is missing error", (uint8_t *)&v12, 0xCu);

    }
    objc_autoreleasePoolPop(v7);
    objc_msgSend(MEMORY[0x24BDD1540], "hmdErrorWithCode:", 1);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setError:", v11);

    objc_msgSend(v4, "setMatterAccessorySourceErrorDomain:", CFSTR("HMDErrorDomain"));
  }

}

- (unint64_t)retryCountForIdentifier:(id)a3
{
  id v4;
  os_unfair_lock_s *p_accessoryPairingRetryMapLock;
  void *v6;
  void *v7;
  unint64_t v8;

  v4 = a3;
  p_accessoryPairingRetryMapLock = &self->_accessoryPairingRetryMapLock;
  os_unfair_lock_lock_with_options();
  -[HMDAccessoryPairingLogEventStateManager retryCountMap](self, "retryCountMap");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "unsignedIntegerValue");

  os_unfair_lock_unlock(p_accessoryPairingRetryMapLock);
  return v8;
}

- (void)clearRetryCountMap
{
  os_unfair_lock_s *p_accessoryPairingRetryMapLock;
  void *v4;

  p_accessoryPairingRetryMapLock = &self->_accessoryPairingRetryMapLock;
  os_unfair_lock_lock_with_options();
  -[HMDAccessoryPairingLogEventStateManager retryCountMap](self, "retryCountMap");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeAllObjects");

  os_unfair_lock_unlock(p_accessoryPairingRetryMapLock);
}

- (void)updateStatesOnResult:(BOOL)a3
{
  _BOOL4 v3;
  os_unfair_lock_s *p_accessoryPairingRetryMapLock;
  unint64_t v6;
  void *v7;
  void *v8;
  HMDAccessoryPairingLogEventStateManager *v9;
  NSObject *v10;
  void *v11;
  int v12;
  void *v13;
  __int16 v14;
  uint64_t v15;
  uint64_t v16;

  v3 = a3;
  v16 = *MEMORY[0x24BDAC8D0];
  p_accessoryPairingRetryMapLock = &self->_accessoryPairingRetryMapLock;
  os_unfair_lock_lock_with_options();
  if (v3)
  {
    v6 = 0;
  }
  else
  {
    if (!-[HMDAccessoryPairingLogEventStateManager recoveryType](self, "recoveryType"))
      goto LABEL_6;
    v6 = -[HMDAccessoryPairingLogEventStateManager recoveryType](self, "recoveryType");
  }
  -[HMDAccessoryPairingLogEventStateManager setPreviousRecoveryType:](self, "setPreviousRecoveryType:", v6);
LABEL_6:
  -[HMDAccessoryPairingLogEventStateManager setRecoveryType:](self, "setRecoveryType:", 0);
  objc_msgSend(MEMORY[0x24BDBCE60], "date");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDAccessoryPairingLogEventStateManager setLastPairingEndTime:](self, "setLastPairingEndTime:", v7);

  os_unfair_lock_unlock(p_accessoryPairingRetryMapLock);
  v8 = (void *)MEMORY[0x227676638]();
  v9 = self;
  HMFGetOSLogHandle();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = 138543618;
    v13 = v11;
    v14 = 2048;
    v15 = -[HMDAccessoryPairingLogEventStateManager previousRecoveryType](v9, "previousRecoveryType");
    _os_log_impl(&dword_2218F0000, v10, OS_LOG_TYPE_INFO, "%{public}@Updated previous recoveryType to: %lu", (uint8_t *)&v12, 0x16u);

  }
  objc_autoreleasePoolPop(v8);
}

- (void)incrementRetryCount:(id)a3
{
  id v4;
  os_unfair_lock_s *p_accessoryPairingRetryMapLock;
  uint64_t v6;
  void *v7;
  HMDAccessoryPairingLogEventStateManager *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  int v15;
  void *v16;
  __int16 v17;
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  p_accessoryPairingRetryMapLock = &self->_accessoryPairingRetryMapLock;
  v6 = os_unfair_lock_lock_with_options();
  v7 = (void *)MEMORY[0x227676638](v6);
  v8 = self;
  HMFGetOSLogHandle();
  v9 = (id)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = 138543618;
    v16 = v10;
    v17 = 2112;
    v18 = v4;
    _os_log_impl(&dword_2218F0000, v9, OS_LOG_TYPE_INFO, "%{public}@Incrementing retry count for identifier %@", (uint8_t *)&v15, 0x16u);

  }
  objc_autoreleasePoolPop(v7);
  -[HMDAccessoryPairingLogEventStateManager retryCountMap](v8, "retryCountMap");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "objectForKeyedSubscript:", v4);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", objc_msgSend(v12, "intValue") + 1);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDAccessoryPairingLogEventStateManager retryCountMap](v8, "retryCountMap");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setObject:forKeyedSubscript:", v13, v4);

  }
  else
  {
    -[HMDAccessoryPairingLogEventStateManager retryCountMap](v8, "retryCountMap");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setObject:forKeyedSubscript:", &unk_24E96B300, v4);
  }

  os_unfair_lock_unlock(p_accessoryPairingRetryMapLock);
}

- (void)_handlePairingStateProgressNotification:(id)a3
{
  id v4;
  void *v5;
  HMDAccessoryPairingLogEventStateManager *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  __int16 v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = (void *)MEMORY[0x227676638]();
  v6 = self;
  HMFGetOSLogHandle();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    HMFGetLogIdentifier();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "name");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = 138543618;
    v12 = v8;
    v13 = 2112;
    v14 = v9;
    _os_log_impl(&dword_2218F0000, v7, OS_LOG_TYPE_DEBUG, "%{public}@Received accessory pairing progress notification %@", (uint8_t *)&v11, 0x16u);

  }
  objc_autoreleasePoolPop(v5);
  objc_msgSend(v4, "userInfo");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDAccessoryPairingLogEventStateManager updatePairingProgressState:](v6, "updatePairingProgressState:", v10);

}

- (void)startProgressStateTrackerWithDate:(id)a3 identifier:(id)a4
{
  id v6;
  os_unfair_lock_s *p_accessoryPairingProgressStateTrackerLock;
  void *v8;
  void *v9;
  HMDAccessoryPairingProgressStateMap *v10;
  id v11;

  v11 = a3;
  v6 = a4;
  p_accessoryPairingProgressStateTrackerLock = &self->_accessoryPairingProgressStateTrackerLock;
  os_unfair_lock_lock_with_options();
  -[HMDAccessoryPairingLogEventStateManager pairingProgressStateTracker](self, "pairingProgressStateTracker");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "removeObjectForKey:", v6);

  -[HMDAccessoryPairingLogEventStateManager pairingProgressStateTracker](self, "pairingProgressStateTracker");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = -[HMDAccessoryPairingProgressStateMap initWithDate:]([HMDAccessoryPairingProgressStateMap alloc], "initWithDate:", v11);
  objc_msgSend(v9, "setObject:forKey:", v10, v6);

  os_unfair_lock_unlock(p_accessoryPairingProgressStateTrackerLock);
}

- (void)updatePairingProgressState:(id)a3
{
  id v4;
  os_unfair_lock_s *p_accessoryPairingProgressStateTrackerLock;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  HMDAccessoryPairingLogEventStateManager *v14;
  NSObject *v15;
  void *v16;
  int v17;
  void *v18;
  __int16 v19;
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  p_accessoryPairingProgressStateTrackerLock = &self->_accessoryPairingProgressStateTrackerLock;
  os_unfair_lock_lock_with_options();
  objc_msgSend(v4, "objectForKey:", CFSTR("HMDAccessoryProgressStateNotificationKey"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", CFSTR("HMDAccessoryProgressStateTimeNotificationKey"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", CFSTR("HMDAccessoryProgressStateforAccessoryKey"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "hmf_numberForKey:", CFSTR("HMDSetupAccessoryProgressStateKey"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "integerValue");

  -[HMDAccessoryPairingLogEventStateManager _updateStateOnPairingProgress:](self, "_updateStateOnPairingProgress:", v10);
  -[HMDAccessoryPairingLogEventStateManager pairingProgressStateTracker](self, "pairingProgressStateTracker");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "objectForKey:", v8);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    objc_msgSend(v12, "updateWithProgressState:date:", v6, v7);
  }
  else
  {
    v13 = (void *)MEMORY[0x227676638]();
    v14 = self;
    HMFGetOSLogHandle();
    v15 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = 138543618;
      v18 = v16;
      v19 = 2112;
      v20 = v8;
      _os_log_impl(&dword_2218F0000, v15, OS_LOG_TYPE_ERROR, "%{public}@Attempting to update an uninitialized progress state map for %@", (uint8_t *)&v17, 0x16u);

    }
    objc_autoreleasePoolPop(v13);
  }

  os_unfair_lock_unlock(p_accessoryPairingProgressStateTrackerLock);
}

- (void)_updateStateOnPairingProgress:(int64_t)a3
{
  HMDAccessoryPairingLogEventStateManager *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  HMDAccessoryPairingLogEventStateManager *v7;
  NSObject *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  int v13;
  void *v14;
  __int16 v15;
  uint64_t v16;
  __int16 v17;
  uint64_t v18;
  __int16 v19;
  void *v20;
  uint64_t v21;

  v3 = self;
  v21 = *MEMORY[0x24BDAC8D0];
  switch(a3)
  {
    case '/':
      v4 = 1;
      goto LABEL_9;
    case '0':
      v4 = 2;
      goto LABEL_9;
    case '1':
      v4 = 3;
      goto LABEL_9;
    case '2':
      v4 = 4;
LABEL_9:
      self = (HMDAccessoryPairingLogEventStateManager *)-[HMDAccessoryPairingLogEventStateManager setRecoveryType:](self, "setRecoveryType:", v4);
      goto LABEL_12;
    default:
      if (a3 == 3)
      {
        v5 = 2;
      }
      else
      {
        if (a3 != 2)
          goto LABEL_12;
        v5 = 1;
      }
      self = (HMDAccessoryPairingLogEventStateManager *)-[HMDAccessoryPairingLogEventStateManager setPairingUIState:](self, "setPairingUIState:", v5);
LABEL_12:
      v6 = (void *)MEMORY[0x227676638](self);
      v7 = v3;
      HMFGetOSLogHandle();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = -[HMDAccessoryPairingLogEventStateManager pairingUIState](v7, "pairingUIState");
        v11 = -[HMDAccessoryPairingLogEventStateManager recoveryType](v7, "recoveryType");
        HMSetupAccessoryProgressAsString();
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = 138544130;
        v14 = v9;
        v15 = 2048;
        v16 = v10;
        v17 = 2048;
        v18 = v11;
        v19 = 2112;
        v20 = v12;
        _os_log_impl(&dword_2218F0000, v8, OS_LOG_TYPE_INFO, "%{public}@Updated Pairing UI state: %lu, recoveryType: %lu on progress: %@", (uint8_t *)&v13, 0x2Au);

      }
      objc_autoreleasePoolPop(v6);
      return;
  }
}

- (void)updateLastPairingProgressStateEventForIdentifier:(id)a3 withDate:(id)a4
{
  id v6;
  os_unfair_lock_s *p_accessoryPairingProgressStateTrackerLock;
  void *v8;
  void *v9;
  id v10;

  v10 = a3;
  v6 = a4;
  p_accessoryPairingProgressStateTrackerLock = &self->_accessoryPairingProgressStateTrackerLock;
  os_unfair_lock_lock_with_options();
  -[HMDAccessoryPairingLogEventStateManager pairingProgressStateTracker](self, "pairingProgressStateTracker");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKey:", v10);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "updateWithProgressState:date:", 0, v6);
  os_unfair_lock_unlock(p_accessoryPairingProgressStateTrackerLock);

}

- (void)clearPairingProgressStateTrackerForIdentifier:(id)a3
{
  os_unfair_lock_s *p_accessoryPairingProgressStateTrackerLock;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a3;
  p_accessoryPairingProgressStateTrackerLock = &self->_accessoryPairingProgressStateTrackerLock;
  os_unfair_lock_lock_with_options();
  -[HMDAccessoryPairingLogEventStateManager pairingProgressStateTracker](self, "pairingProgressStateTracker");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", v8);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[HMDAccessoryPairingLogEventStateManager pairingProgressStateTracker](self, "pairingProgressStateTracker");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "removeObjectForKey:", v8);

  }
  os_unfair_lock_unlock(p_accessoryPairingProgressStateTrackerLock);

}

- (id)getLongestProgressStateForAccessory:(id)a3
{
  id v4;
  os_unfair_lock_s *p_accessoryPairingProgressStateTrackerLock;
  void *v6;
  void *v7;
  void *v8;

  v4 = a3;
  p_accessoryPairingProgressStateTrackerLock = &self->_accessoryPairingProgressStateTrackerLock;
  os_unfair_lock_lock_with_options();
  -[HMDAccessoryPairingLogEventStateManager pairingProgressStateTracker](self, "pairingProgressStateTracker");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKey:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    objc_msgSend(v7, "longestProgressState");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v8 = 0;
  }

  os_unfair_lock_unlock(p_accessoryPairingProgressStateTrackerLock);
  return v8;
}

- (id)getLastProgressStateForAccessory:(id)a3
{
  id v4;
  os_unfair_lock_s *p_accessoryPairingProgressStateTrackerLock;
  void *v6;
  void *v7;
  void *v8;
  HMDAccessoryPairingLogEventStateManager *v9;
  NSObject *v10;
  id v11;
  void *v12;
  void *v13;
  int v15;
  id v16;
  __int16 v17;
  id v18;
  __int16 v19;
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  p_accessoryPairingProgressStateTrackerLock = &self->_accessoryPairingProgressStateTrackerLock;
  os_unfair_lock_lock_with_options();
  -[HMDAccessoryPairingLogEventStateManager pairingProgressStateTracker](self, "pairingProgressStateTracker");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKey:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    v8 = (void *)MEMORY[0x227676638]();
    v9 = self;
    HMFGetOSLogHandle();
    v10 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v11 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "progressStateMap");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = 138543874;
      v16 = v11;
      v17 = 2114;
      v18 = v4;
      v19 = 2114;
      v20 = v12;
      _os_log_impl(&dword_2218F0000, v10, OS_LOG_TYPE_INFO, "%{public}@Final pairing progress state map before metric submission for identifier %{public}@ - %{public}@", (uint8_t *)&v15, 0x20u);

    }
    objc_autoreleasePoolPop(v8);
    objc_msgSend(v7, "lastProgressState");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v13 = 0;
  }

  os_unfair_lock_unlock(p_accessoryPairingProgressStateTrackerLock);
  return v13;
}

- (double)getTimeDurationForLongestProgressStateForAccessory:(id)a3
{
  id v4;
  os_unfair_lock_s *p_accessoryPairingProgressStateTrackerLock;
  void *v6;
  void *v7;
  double v8;
  double v9;

  v4 = a3;
  p_accessoryPairingProgressStateTrackerLock = &self->_accessoryPairingProgressStateTrackerLock;
  os_unfair_lock_lock_with_options();
  -[HMDAccessoryPairingLogEventStateManager pairingProgressStateTracker](self, "pairingProgressStateTracker");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKey:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    objc_msgSend(v7, "getTimeDurationForLongestProgressState");
    v9 = v8;
  }
  else
  {
    v9 = 0.0;
  }

  os_unfair_lock_unlock(p_accessoryPairingProgressStateTrackerLock);
  return v9;
}

- (double)getTimeDurationForProgressStateForIdentifier:(id)a3 state:(id)a4
{
  id v6;
  id v7;
  os_unfair_lock_s *p_accessoryPairingProgressStateTrackerLock;
  double v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  double v14;

  v6 = a3;
  v7 = a4;
  p_accessoryPairingProgressStateTrackerLock = &self->_accessoryPairingProgressStateTrackerLock;
  os_unfair_lock_lock_with_options();
  v9 = 0.0;
  if (v7)
  {
    -[HMDAccessoryPairingLogEventStateManager pairingProgressStateTracker](self, "pairingProgressStateTracker");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "objectForKey:", v6);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (v11)
    {
      objc_msgSend(v11, "progressStateMap");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "objectForKey:", v7);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "doubleValue");
      v9 = v14 * 1000.0;

    }
  }
  os_unfair_lock_unlock(p_accessoryPairingProgressStateTrackerLock);

  return v9;
}

- (void)resetStatesForNewAddOperation
{
  void *v3;
  double v4;
  double v5;

  -[HMDAccessoryPairingLogEventStateManager setPairingUIState:](self, "setPairingUIState:", 0);
  -[HMDAccessoryPairingLogEventStateManager lastPairingEndTime](self, "lastPairingEndTime");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "timeIntervalSinceNow");
  v5 = fabs(v4);

  if (v5 > 300.0)
    -[HMDAccessoryPairingLogEventStateManager setPreviousRecoveryType:](self, "setPreviousRecoveryType:", 0);
}

- (unint64_t)pairingUIState
{
  return self->_pairingUIState;
}

- (void)setPairingUIState:(unint64_t)a3
{
  self->_pairingUIState = a3;
}

- (unint64_t)recoveryType
{
  return self->_recoveryType;
}

- (void)setRecoveryType:(unint64_t)a3
{
  self->_recoveryType = a3;
}

- (unint64_t)previousRecoveryType
{
  return self->_previousRecoveryType;
}

- (void)setPreviousRecoveryType:(unint64_t)a3
{
  self->_previousRecoveryType = a3;
}

- (HMMLogEventSubmitting)logEventSubmitter
{
  return self->_logEventSubmitter;
}

- (void)setLogEventSubmitter:(id)a3
{
  objc_storeStrong((id *)&self->_logEventSubmitter, a3);
}

- (OS_dispatch_queue)workQueue
{
  return self->_workQueue;
}

- (void)setWorkQueue:(id)a3
{
  objc_storeStrong((id *)&self->_workQueue, a3);
}

- (NSDate)lastPairingEndTime
{
  return self->_lastPairingEndTime;
}

- (void)setLastPairingEndTime:(id)a3
{
  objc_storeStrong((id *)&self->_lastPairingEndTime, a3);
}

- (NSMutableDictionary)retryCountMap
{
  return self->_retryCountMap;
}

- (NSMutableDictionary)pairingProgressStateTracker
{
  return self->_pairingProgressStateTracker;
}

- (NSNotificationCenter)notificationCenter
{
  return self->_notificationCenter;
}

- (HMDAccessoryPairingEvent)pairingEvent
{
  return (HMDAccessoryPairingEvent *)objc_loadWeakRetained((id *)&self->_pairingEvent);
}

- (void)setPairingEvent:(id)a3
{
  objc_storeWeak((id *)&self->_pairingEvent, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_pairingEvent);
  objc_storeStrong((id *)&self->_notificationCenter, 0);
  objc_storeStrong((id *)&self->_pairingProgressStateTracker, 0);
  objc_storeStrong((id *)&self->_retryCountMap, 0);
  objc_storeStrong((id *)&self->_lastPairingEndTime, 0);
  objc_storeStrong((id *)&self->_workQueue, 0);
  objc_storeStrong((id *)&self->_logEventSubmitter, 0);
}

uint64_t __96__HMDAccessoryPairingLogEventStateManager_handleMatterAccessoryUpdatePairingMetricNotification___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_handleMatterAccessoryUpdatePairingMetricNotification:pairingEvent:logEventSubmitter:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));
}

+ (HMDAccessoryPairingLogEventStateManager)sharedManager
{
  void *v2;
  uint64_t v3;
  id v4;
  void *v5;
  void *v6;
  HMDAccessoryPairingLogEventStateManager *v7;
  _QWORD block[4];
  void *v10;

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __56__HMDAccessoryPairingLogEventStateManager_sharedManager__block_invoke;
  block[3] = &unk_24E79C240;
  v10 = v2;
  v3 = sharedManager__hmf_once_t4;
  v4 = v2;
  v5 = v4;
  if (v3 == -1)
  {
    v6 = v4;
  }
  else
  {
    dispatch_once(&sharedManager__hmf_once_t4, block);
    v6 = v10;
  }
  v7 = (HMDAccessoryPairingLogEventStateManager *)(id)sharedManager__hmf_once_v5;

  return v7;
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t42 != -1)
    dispatch_once(&logCategory__hmf_once_t42, &__block_literal_global_101147);
  return (id)logCategory__hmf_once_v43;
}

void __54__HMDAccessoryPairingLogEventStateManager_logCategory__block_invoke()
{
  uint64_t v0;
  void *v1;

  HMFCreateOSLogHandle();
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)logCategory__hmf_once_v43;
  logCategory__hmf_once_v43 = v0;

}

void __56__HMDAccessoryPairingLogEventStateManager_sharedManager__block_invoke(uint64_t a1)
{
  HMDAccessoryPairingLogEventStateManager *v1;
  void *v2;

  v1 = -[HMDAccessoryPairingLogEventStateManager initWithNotificationCenter:]([HMDAccessoryPairingLogEventStateManager alloc], "initWithNotificationCenter:", *(_QWORD *)(a1 + 32));
  v2 = (void *)sharedManager__hmf_once_v5;
  sharedManager__hmf_once_v5 = (uint64_t)v1;

}

@end
