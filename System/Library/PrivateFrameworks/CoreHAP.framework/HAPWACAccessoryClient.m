@implementation HAPWACAccessoryClient

- (HAPWACAccessoryClient)init
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v2 = (void *)MEMORY[0x1E0C99DA0];
  v3 = *MEMORY[0x1E0C99768];
  v4 = (void *)MEMORY[0x1E0CB3940];
  NSStringFromSelector(a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringWithFormat:", CFSTR("%@ is unavailable"), v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "exceptionWithName:reason:userInfo:", v3, v6, 0);
  v7 = (id)objc_claimAutoreleasedReturnValue();

  objc_exception_throw(v7);
}

- (HAPWACAccessoryClient)initWithWACAccessory:(id)a3 server:(id)a4 browser:(id)a5 compatible2Pt4Networks:(id)a6
{
  id v11;
  id v12;
  id v13;
  id v14;
  HAPWACAccessoryClient *v15;
  HAPWACAccessoryClient *v16;
  NSObject *v17;
  dispatch_queue_t v18;
  OS_dispatch_queue *workQueue;
  NSDictionary *currentNetworkInfo;
  NSDictionary *compatiblePrefixedNetwork;
  _QWORD v23[6];
  objc_super v24;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  v24.receiver = self;
  v24.super_class = (Class)HAPWACAccessoryClient;
  v15 = -[HAPWACAccessoryClient init](&v24, sel_init);
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_hapWACAccessory, a3);
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v17 = objc_claimAutoreleasedReturnValue();
    v18 = dispatch_queue_create("HAPWACAccessoryClient", v17);
    workQueue = v16->_workQueue;
    v16->_workQueue = (OS_dispatch_queue *)v18;

    currentNetworkInfo = v16->_currentNetworkInfo;
    v16->_currentNetworkInfo = 0;

    objc_storeWeak((id *)&v16->_server, v12);
    objc_storeWeak((id *)&v16->_browser, v13);
    objc_storeStrong((id *)&v16->_compatible2Pt4Networks, a6);
    compatiblePrefixedNetwork = v16->_compatiblePrefixedNetwork;
    v16->_compatiblePrefixedNetwork = 0;

    v16->_metricSubmitted = 0;
    v23[0] = MEMORY[0x1E0C809B0];
    v23[1] = 3221225472;
    v23[2] = __84__HAPWACAccessoryClient_initWithWACAccessory_server_browser_compatible2Pt4Networks___block_invoke;
    v23[3] = &unk_1E894E0F8;
    v23[4] = v16;
    v23[5] = v11;
    __84__HAPWACAccessoryClient_initWithWACAccessory_server_browser_compatible2Pt4Networks___block_invoke((uint64_t)v23);
  }

  return v16;
}

- (id)_setupEasyConfigWithDeviceInfo:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  HAPEasyConfigDevice *v8;
  id result;
  HAPWACAccessoryClient *v10;
  SEL v11;
  id v12;
  __int128 v13;
  uint64_t v14;
  uint64_t v15;
  __int128 v16;

  v4 = a3;
  -[HAPWACAccessoryClient server](self, "server");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v6 = v5;
  else
    v6 = 0;
  v7 = v6;

  if (v7)
  {
    v14 = objc_msgSend(v7, "copyPairingIdentityDelegateCallback", 0, 0, 0, 0, 0, 0, 0, 0, 0);
    v15 = objc_msgSend(v7, "findPairedPeerDelegateCallback");
    *(_QWORD *)&v16 = objc_msgSend(v7, "savePairedPeerDelegateCallback");
    v8 = -[HAPEasyConfigDevice initWithDeviceInfo:server:]([HAPEasyConfigDevice alloc], "initWithDeviceInfo:server:", v4, v7);
    -[EasyConfigDevice setPairingDelegate:](v8, "setPairingDelegate:", &v13);

    return v8;
  }
  else
  {
    v10 = (HAPWACAccessoryClient *)_HMFPreconditionFailure();
    -[HAPWACAccessoryClient dumpStatsWithError:](v10, v11, v12);
  }
  return result;
}

- (void)dumpStatsWithError:(id)a3
{
  id v4;
  void *v5;
  HAPWACAccessoryClient *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  void *v29;
  id v30;
  uint8_t buf[4];
  void *v32;
  __int16 v33;
  void *v34;
  __int16 v35;
  void *v36;
  __int16 v37;
  void *v38;
  __int16 v39;
  uint64_t v40;
  __int16 v41;
  uint64_t v42;
  __int16 v43;
  uint64_t v44;
  __int16 v45;
  uint64_t v46;
  __int16 v47;
  uint64_t v48;
  __int16 v49;
  uint64_t v50;
  __int16 v51;
  uint64_t v52;
  __int16 v53;
  uint64_t v54;
  __int16 v55;
  id v56;
  uint64_t v57;

  v57 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (!-[HAPWACAccessoryClient metricSubmitted](self, "metricSubmitted"))
  {
    v5 = (void *)MEMORY[0x1D17B7244]();
    v6 = self;
    HMFGetOSLogHandle();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v29 = v5;
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[HAPWACAccessoryClient hapWACAccessory](v6, "hapWACAccessory");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "name");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[HAPWACAccessoryClient hapWACAccessory](v6, "hapWACAccessory");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "deviceId");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[HAPWACAccessoryClient hapWACAccessory](v6, "hapWACAccessory");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "rssi");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[HAPWACAccessoryClient hapWACAccessory](v6, "hapWACAccessory");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "discoveryTime");
      v16 = v15;
      -[HAPWACAccessoryClient joinLatency](v6, "joinLatency");
      v18 = v17;
      -[HAPWACAccessoryClient restoreLatency](v6, "restoreLatency");
      v20 = v19;
      -[HAPWACAccessoryClient configurationLatency](v6, "configurationLatency");
      v22 = v21;
      -[HAPWACAccessoryClient preConfigDiscoveryTime](v6, "preConfigDiscoveryTime");
      v24 = v23;
      -[HAPWACAccessoryClient postConfigDiscoveryTime](v6, "postConfigDiscoveryTime");
      v26 = v25;
      -[HAPWACAccessoryClient setupCodeDelay](v6, "setupCodeDelay");
      *(_DWORD *)buf = 138546434;
      v32 = v8;
      v33 = 2112;
      v34 = v9;
      v35 = 2112;
      v36 = v11;
      v37 = 2112;
      v38 = v13;
      v39 = 2048;
      v40 = v16;
      v41 = 2048;
      v42 = v18;
      v43 = 2048;
      v44 = v20;
      v45 = 2048;
      v46 = v22;
      v47 = 2048;
      v48 = v24;
      v49 = 2048;
      v50 = v26;
      v51 = 2048;
      v52 = v27;
      v53 = 2048;
      v54 = -[HAPWACAccessoryClient retryCount](v6, "retryCount");
      v55 = 2112;
      v56 = v4;
      _os_log_impl(&dword_1CCE01000, v7, OS_LOG_TYPE_INFO, "%{public}@Stats for accessory: %@ (%@) @ (%@), \nDiscovery Time: %f sec, \nJoin Time     : %f sec, \nRestore Time  : %f sec, \nWAC Configs   : %f sec, \n    Pre-Config Discovery : %f sec, \n    Post-Config Discovery: %f sec, \n    Setup Code delay     : %f sec, \nRetry Count   : %ld \nError         : %@  \n", buf, 0x84u);

      v5 = v29;
    }

    objc_autoreleasePoolPop(v5);
    v30 = v4;
    AnalyticsSendEventLazy();
    -[HAPWACAccessoryClient setMetricSubmitted:](v6, "setMetricSubmitted:", 1);

  }
}

- (void)registerClientDelegate:(id)a3
{
  os_unfair_lock_s *p_lock;
  id v5;

  p_lock = &self->_lock;
  v5 = a3;
  os_unfair_lock_lock_with_options();
  objc_storeWeak((id *)&self->_clientDelegate, v5);

  os_unfair_lock_unlock(p_lock);
}

- (HAPWACAccessoryClientDelegate)clientDelegate
{
  os_unfair_lock_s *p_lock;
  id WeakRetained;

  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  WeakRetained = objc_loadWeakRetained((id *)&self->_clientDelegate);
  os_unfair_lock_unlock(p_lock);
  return (HAPWACAccessoryClientDelegate *)WeakRetained;
}

- (void)setState:(unint64_t)a3
{
  os_unfair_lock_s *p_lock;

  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  self->_state = a3;
  os_unfair_lock_unlock(p_lock);
}

- (unint64_t)state
{
  os_unfair_lock_s *p_lock;
  unint64_t state;

  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  state = self->_state;
  os_unfair_lock_unlock(p_lock);
  return state;
}

- (void)_joinCompleteWithStatus:(int)a3
{
  uint64_t v3;
  void *v5;
  HAPWACAccessoryClient *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  HAPWACAccessoryClient *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id *v18;
  id *v19;
  _QWORD v20[4];
  id v21;
  id v22;
  _QWORD v23[4];
  id v24;
  id v25;
  id v26;
  uint64_t v27;
  const __CFString *v28;
  uint8_t buf[4];
  void *v30;
  __int16 v31;
  int v32;
  uint64_t v33;

  v3 = *(_QWORD *)&a3;
  v33 = *MEMORY[0x1E0C80C00];
  v5 = (void *)MEMORY[0x1D17B7244](self, a2);
  v6 = self;
  HMFGetOSLogHandle();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v30 = v8;
    v31 = 1024;
    v32 = v3;
    _os_log_impl(&dword_1CCE01000, v7, OS_LOG_TYPE_INFO, "%{public}@Joined accessory network with status: %d", buf, 0x12u);

  }
  objc_autoreleasePoolPop(v5);
  switch((_DWORD)v3)
  {
    case 5:
      goto LABEL_6;
    case 0:
      -[HAPWACAccessoryClient completionHandler](v6, "completionHandler");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[HAPWACAccessoryClient _callJoinCompletion:withError:](v6, "_callJoinCompletion:withError:", v13, 0);
      break;
    case 0xFFFFF0A0:
LABEL_6:
      v9 = (void *)MEMORY[0x1D17B7244]();
      v10 = v6;
      HMFGetOSLogHandle();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v30 = v12;
        _os_log_impl(&dword_1CCE01000, v11, OS_LOG_TYPE_INFO, "%{public}@Failed to join network, reporting connection failure", buf, 0xCu);

      }
      objc_autoreleasePoolPop(v9);
      -[HAPWACAccessoryClient completionHandler](v10, "completionHandler");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = (void *)MEMORY[0x1E0CB35C8];
      v27 = *MEMORY[0x1E0CB2D68];
      v28 = CFSTR("Network was not found");
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v28, &v27, 1);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "errorWithDomain:code:userInfo:", CFSTR("HAPErrorDomain"), 34, v15);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      -[HAPWACAccessoryClient _callJoinCompletion:withError:](v10, "_callJoinCompletion:withError:", v13, v16);

      break;
    default:
      HMErrorFromOSStatus(v3);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[HAPWACAccessoryClient completionHandler](v6, "completionHandler");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_initWeak((id *)buf, v6);
      if (-[HAPWACAccessoryClient retryCount](v6, "retryCount") > 2)
      {
        v20[0] = MEMORY[0x1E0C809B0];
        v20[1] = 3221225472;
        v20[2] = __49__HAPWACAccessoryClient__joinCompleteWithStatus___block_invoke_4;
        v20[3] = &unk_1E894AA60;
        v18 = &v22;
        objc_copyWeak(&v22, (id *)buf);
        v21 = v17;
        -[HAPWACAccessoryClient _restoreNetworkWithCompletion:](v6, "_restoreNetworkWithCompletion:", v20);
        v19 = &v21;
      }
      else
      {
        v23[0] = MEMORY[0x1E0C809B0];
        v23[1] = 3221225472;
        v23[2] = __49__HAPWACAccessoryClient__joinCompleteWithStatus___block_invoke;
        v23[3] = &unk_1E894A548;
        v18 = &v26;
        objc_copyWeak(&v26, (id *)buf);
        v25 = v17;
        v24 = v13;
        -[HAPWACAccessoryClient _restoreNetworkWithCompletion:](v6, "_restoreNetworkWithCompletion:", v23);

        v19 = &v25;
      }

      objc_destroyWeak(v18);
      objc_destroyWeak((id *)buf);

      break;
  }

}

- (void)_callJoinCompletion:(id)a3 withError:(id)a4
{
  void (**v6)(id, id);
  id v7;
  void *v8;
  uint64_t v9;
  void *v10;
  HAPWACAccessoryClient *v11;
  NSObject *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint8_t buf[4];
  void *v19;
  __int16 v20;
  void *v21;
  __int16 v22;
  uint64_t v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v6 = (void (**)(id, id))a3;
  v7 = a4;
  if (!v7)
  {
    v8 = (void *)WiFiCopyCurrentNetworkInfoEx();
    v7 = 0;
    v9 = objc_msgSend(v8, "objectForKey:", CFSTR("platformNetwork"));
    v10 = (void *)MEMORY[0x1D17B7244]();
    v11 = self;
    HMFGetOSLogHandle();
    v12 = objc_claimAutoreleasedReturnValue();
    v13 = v12;
    if (v9)
    {
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
      {
        HMFGetLogIdentifier();
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "hmf_stringForKey:", CFSTR("ssid"));
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        v19 = v14;
        v20 = 2112;
        v21 = v15;
        v22 = 2112;
        v23 = 0;
        _os_log_impl(&dword_1CCE01000, v13, OS_LOG_TYPE_DEBUG, "%{public}@Disabling auto-join on: %@, error: %@", buf, 0x20u);

      }
      objc_autoreleasePoolPop(v10);
      WiFiNetworkDisableAutoJoinUntilFirstUserJoin();
    }
    else
    {
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v19 = v16;
        _os_log_impl(&dword_1CCE01000, v13, OS_LOG_TYPE_ERROR, "%{public}@Join succeeded but no network - declaring join failure", buf, 0xCu);

      }
      objc_autoreleasePoolPop(v10);
      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("HAPErrorDomain"), 26, 0);
      v17 = objc_claimAutoreleasedReturnValue();

      v7 = (id)v17;
    }

  }
  if (v6)
    v6[2](v6, v7);

}

- (id)joinAccessoryNetworkWithCompletion:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  _QWORD v8[5];
  id v9;

  v4 = a3;
  if (v4)
  {
    -[HAPWACAccessoryClient workQueue](self, "workQueue");
    v5 = objc_claimAutoreleasedReturnValue();
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __60__HAPWACAccessoryClient_joinAccessoryNetworkWithCompletion___block_invoke;
    v8[3] = &unk_1E894D5E0;
    v8[4] = self;
    v9 = v4;
    dispatch_async(v5, v8);

    v6 = 0;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("HAPErrorDomain"), 9, 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v6;
}

- (void)_joinAccessoryNetworkWithCompletion:(id)a3
{
  void (**v4)(id, void *);
  void *v5;
  void *v6;
  objc_class *v7;
  id v8;
  void *v9;
  char v10;
  int OperatingBand;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  HAPWACAccessoryClient *v18;
  NSObject *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  int v24;
  int v25;
  void *v26;
  HAPWACAccessoryClient *v27;
  NSObject *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  HAPWACAccessoryClient *v34;
  NSObject *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  char v40;
  void *v41;
  void *v42;
  char v43;
  void *v44;
  HAPWACAccessoryClient *v45;
  NSObject *v46;
  void *v47;
  void *v48;
  void *v49;
  HAPWACAccessoryClient *v50;
  NSObject *v51;
  void *v52;
  void *v53;
  _QWORD v54[5];
  void (**v55)(id, void *);
  uint64_t v56;
  uint64_t *v57;
  uint64_t v58;
  uint64_t v59;
  _BYTE buf[24];
  void *v61;
  uint64_t *v62;
  uint64_t v63;

  v63 = *MEMORY[0x1E0C80C00];
  v4 = (void (**)(id, void *))a3;
  -[HAPWACAccessoryClient setCompletionHandler:](self, "setCompletionHandler:", v4);
  -[HAPWACAccessoryClient currentNetworkInfo](self, "currentNetworkInfo");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", CFSTR("platformNetwork"));

  if (!CoreWiFiLibraryCore_frameworkLibrary)
  {
    *(_OWORD *)buf = xmmword_1E894A6A0;
    *(_QWORD *)&buf[16] = 0;
    CoreWiFiLibraryCore_frameworkLibrary = _sl_dlopen();
  }
  if (CoreWiFiLibraryCore_frameworkLibrary)
  {
    v56 = 0;
    v57 = &v56;
    v58 = 0x2050000000;
    v6 = (void *)getCWFInterfaceClass_softClass;
    v59 = getCWFInterfaceClass_softClass;
    if (!getCWFInterfaceClass_softClass)
    {
      *(_QWORD *)buf = MEMORY[0x1E0C809B0];
      *(_QWORD *)&buf[8] = 3221225472;
      *(_QWORD *)&buf[16] = __getCWFInterfaceClass_block_invoke;
      v61 = &unk_1E894A6C0;
      v62 = &v56;
      __getCWFInterfaceClass_block_invoke((uint64_t)buf);
      v6 = (void *)v57[3];
    }
    v7 = objc_retainAutorelease(v6);
    _Block_object_dispose(&v56, 8);
    v8 = objc_alloc_init(v7);
    objc_msgSend(v8, "resume");
    objc_msgSend(v8, "currentKnownNetworkProfile");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "isEAP");

    objc_msgSend(v8, "invalidate");
  }
  else
  {
    v10 = 0;
  }
  OperatingBand = WiFiNetworkGetOperatingBand();
  -[HAPWACAccessoryClient currentNetworkInfo](self, "currentNetworkInfo");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "hmf_stringForKey:", CFSTR("ssid"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D28678], "sharedPreferences");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "preferenceForKey:", CFSTR("wifiNetworkBlacklist"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "value");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if ((v10 & 1) != 0 || objc_msgSend(v16, "containsObject:", v13))
  {
    v17 = (void *)MEMORY[0x1D17B7244]();
    v18 = self;
    HMFGetOSLogHandle();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      *(_QWORD *)&buf[4] = v20;
      _os_log_impl(&dword_1CCE01000, v19, OS_LOG_TYPE_ERROR, "%{public}@Enterprise networks - not supported", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v17);
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("HAPErrorDomain"), 23, 0);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v4[2](v4, v21);

    goto LABEL_13;
  }
  -[HAPWACAccessoryClient hapWACAccessory](self, "hapWACAccessory");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "ssid");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = objc_msgSend(v13, "isEqual:", v23);
  if (v13)
    v25 = v24;
  else
    v25 = 1;

  if (v25)
  {
    v26 = (void *)MEMORY[0x1D17B7244]();
    v27 = self;
    HMFGetOSLogHandle();
    v28 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      *(_QWORD *)&buf[4] = v29;
      _os_log_impl(&dword_1CCE01000, v28, OS_LOG_TYPE_ERROR, "%{public}@Not associated to WiFi", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v26);
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("HAPErrorDomain"), 21, 0);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v4[2](v4, v30);

    goto LABEL_13;
  }
  -[HAPWACAccessoryClient setCompatiblePrefixedNetwork:](self, "setCompatiblePrefixedNetwork:", 0);
  -[HAPWACAccessoryClient hapWACAccessory](self, "hapWACAccessory");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v31, "supportedWiFiBands") & 1) != 0 && OperatingBand == 1)
    goto LABEL_26;
  -[HAPWACAccessoryClient hapWACAccessory](self, "hapWACAccessory");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v32, "supportedWiFiBands") & 2) != 0 && OperatingBand == 2)
  {

LABEL_26:
LABEL_27:
    v33 = (void *)MEMORY[0x1D17B7244]();
    v34 = self;
    HMFGetOSLogHandle();
    v35 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v35, OS_LOG_TYPE_DEBUG))
    {
      HMFGetLogIdentifier();
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      *(_QWORD *)&buf[4] = v36;
      _os_log_impl(&dword_1CCE01000, v35, OS_LOG_TYPE_DEBUG, "%{public}@Compatible network", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v33);
    -[HAPWACAccessoryClient hapWACAccessory](v34, "hapWACAccessory");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    -[HAPWACAccessoryClient _joinAccessory:completion:](v34, "_joinAccessory:completion:", v37, v4);

    goto LABEL_13;
  }
  -[HAPWACAccessoryClient hapWACAccessory](self, "hapWACAccessory");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v38, "supportedWiFiBands") & 1) != 0)
  {
    -[HAPWACAccessoryClient compatible2Pt4Networks](self, "compatible2Pt4Networks");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    v40 = objc_msgSend(v39, "containsObject:", v13);

    if ((v40 & 1) != 0)
      goto LABEL_27;
  }
  else
  {

  }
  -[HAPWACAccessoryClient hapWACAccessory](self, "hapWACAccessory");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v41, "supportedWiFiBands") & 1) == 0)
  {

LABEL_36:
    v44 = (void *)MEMORY[0x1D17B7244]();
    v45 = self;
    HMFGetOSLogHandle();
    v46 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v46, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      *(_QWORD *)&buf[4] = v47;
      _os_log_impl(&dword_1CCE01000, v46, OS_LOG_TYPE_ERROR, "%{public}@Incompatible network", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v44);
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("HAPErrorDomain"), 20, 0);
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    v4[2](v4, v48);

    goto LABEL_13;
  }
  -[HAPWACAccessoryClient compatible2Pt4Networks](self, "compatible2Pt4Networks");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  v43 = objc_msgSend(v42, "containsObject:", v13);

  if ((v43 & 1) != 0)
    goto LABEL_36;
  v49 = (void *)MEMORY[0x1D17B7244]();
  v50 = self;
  HMFGetOSLogHandle();
  v51 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v51, OS_LOG_TYPE_DEBUG))
  {
    HMFGetLogIdentifier();
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    *(_QWORD *)&buf[4] = v52;
    *(_WORD *)&buf[12] = 2112;
    *(_QWORD *)&buf[14] = v13;
    _os_log_impl(&dword_1CCE01000, v51, OS_LOG_TYPE_DEBUG, "%{public}@Finding 2.4 AP with ssid: %@", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v49);
  -[HAPWACAccessoryClient browser](v50, "browser");
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  v54[0] = MEMORY[0x1E0C809B0];
  v54[1] = 3221225472;
  v54[2] = __61__HAPWACAccessoryClient__joinAccessoryNetworkWithCompletion___block_invoke;
  v54[3] = &unk_1E894A4F8;
  v54[4] = v50;
  v55 = v4;
  objc_msgSend(v53, "scan2Pt4APWithSSID:completion:", v13, v54);

LABEL_13:
}

- (id)_findCompatiblePrefixedNetworks
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  uint64_t v13;
  void *v14;
  void *v15;
  HAPWACAccessoryClient *v16;
  NSObject *v17;
  void *v18;
  uint64_t v19;
  __int128 v20;
  uint64_t v21;
  id v22;
  HAPWACAccessoryClient *v23;
  uint64_t j;
  uint64_t v25;
  void *v26;
  void *v27;
  HAPWACAccessoryClient *v28;
  NSObject *v29;
  void *v30;
  void *v31;
  id v32;
  __int128 v34;
  HAPWACAccessoryClient *v35;
  id obj;
  uint64_t v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  int v46;
  const __CFString *v47;
  uint64_t v48;
  uint8_t v49[128];
  uint8_t buf[4];
  void *v51;
  __int16 v52;
  void *v53;
  _BYTE v54[128];
  uint64_t v55;

  v55 = *MEMORY[0x1E0C80C00];
  v46 = 0;
  -[HAPWACAccessoryClient currentNetworkInfo](self, "currentNetworkInfo");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "hmf_stringForKey:", CFSTR("ssid"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = (void *)MEMORY[0x1E0C99DE8];
  -[HAPWACAccessoryClient compatible2Pt4Networks](self, "compatible2Pt4Networks");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "arrayWithCapacity:", objc_msgSend(v6, "count"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v44 = 0u;
  v45 = 0u;
  v42 = 0u;
  v43 = 0u;
  -[HAPWACAccessoryClient compatible2Pt4Networks](self, "compatible2Pt4Networks");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v42, v54, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v43;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v43 != v11)
          objc_enumerationMutation(v8);
        v13 = *(_QWORD *)(*((_QWORD *)&v42 + 1) + 8 * i);
        objc_msgSend(v4, "commonPrefixWithString:options:", v13, 10);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v14, "length"))
          objc_msgSend(v7, "addObject:", v13);

      }
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v42, v54, 16);
    }
    while (v10);
  }

  v15 = (void *)MEMORY[0x1D17B7244]();
  v16 = self;
  HMFGetOSLogHandle();
  v17 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v51 = v18;
    v52 = 2112;
    v53 = v7;
    _os_log_impl(&dword_1CCE01000, v17, OS_LOG_TYPE_INFO, "%{public}@Possible compatible results: %@", buf, 0x16u);

  }
  v35 = v16;

  objc_autoreleasePoolPop(v15);
  v40 = 0u;
  v41 = 0u;
  v38 = 0u;
  v39 = 0u;
  obj = v7;
  v19 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v38, v49, 16);
  if (v19)
  {
    v21 = v19;
    v22 = 0;
    v37 = *(_QWORD *)v39;
    *(_QWORD *)&v20 = 138543618;
    v34 = v20;
    v23 = v16;
    while (2)
    {
      for (j = 0; j != v21; ++j)
      {
        if (*(_QWORD *)v39 != v37)
          objc_enumerationMutation(obj);
        v25 = *(_QWORD *)(*((_QWORD *)&v38 + 1) + 8 * j);
        v47 = CFSTR("ssid");
        v48 = v25;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v48, &v47, 1, v34);
        v26 = (void *)WiFiCopyNetworkInfo();
        if (v26)
        {
          v27 = (void *)MEMORY[0x1D17B7244]();
          v28 = v23;
          HMFGetOSLogHandle();
          v29 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
          {
            HMFGetLogIdentifier();
            v30 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v26, "objectForKeyedSubscript:", CFSTR("ssid"));
            v31 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = v34;
            v51 = v30;
            v52 = 2112;
            v53 = v31;
            _os_log_impl(&dword_1CCE01000, v29, OS_LOG_TYPE_INFO, "%{public}@Matched : %@", buf, 0x16u);

            v23 = v35;
          }

          objc_autoreleasePoolPop(v27);
          if (v22)
          {

            goto LABEL_26;
          }
          v22 = v26;
        }

      }
      v21 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v38, v49, 16);
      if (v21)
        continue;
      break;
    }
  }
  else
  {
LABEL_26:
    v22 = 0;
  }

  v32 = v22;
  return v32;
}

- (void)_joinAccessory:(id)a3 completion:(id)a4
{
  id v6;
  void (**v7)(id, void *);
  void *v8;
  int OperatingBand;
  void *v10;
  void *v11;
  void *v12;
  HAPWACAccessoryClient *v13;
  NSObject *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  int v21;
  void *v22;
  HAPWACAccessoryClient *v23;
  NSObject *v24;
  void *v25;
  void *v26;
  int v27;
  void *v28;
  __int16 v29;
  void *v30;
  __int16 v31;
  int v32;
  __int16 v33;
  void *v34;
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = (void (**)(id, void *))a4;
  -[HAPWACAccessoryClient currentNetworkInfo](self, "currentNetworkInfo");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKey:", CFSTR("platformNetwork"));

  OperatingBand = WiFiNetworkGetOperatingBand();
  -[HAPWACAccessoryClient currentNetworkInfo](self, "currentNetworkInfo");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "hmf_stringForKey:", CFSTR("ssid"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = (void *)MEMORY[0x1D17B7244]();
  v13 = self;
  HMFGetOSLogHandle();
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
  {
    HMFGetLogIdentifier();
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[HAPWACAccessoryClient hapWACAccessory](v13, "hapWACAccessory");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "ssid");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = 138544130;
    v28 = v15;
    v29 = 2112;
    v30 = v11;
    v31 = 1024;
    v32 = OperatingBand;
    v33 = 2112;
    v34 = v17;
    _os_log_impl(&dword_1CCE01000, v14, OS_LOG_TYPE_DEBUG, "%{public}@Joining accessory network: (%@[%u]) -> %@)", (uint8_t *)&v27, 0x26u);

  }
  objc_autoreleasePoolPop(v12);
  -[HAPWACAccessoryClient hapWACAccessory](v13, "hapWACAccessory");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "rawScanResult");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[HAPWACAccessoryClient workQueue](v13, "workQueue");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = WiFiJoinNetwork();

  if (v21)
  {
    v22 = (void *)MEMORY[0x1D17B7244]();
    v23 = v13;
    HMFGetOSLogHandle();
    v24 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = 138543618;
      v28 = v25;
      v29 = 1024;
      LODWORD(v30) = v21;
      _os_log_impl(&dword_1CCE01000, v24, OS_LOG_TYPE_ERROR, "%{public}@Failed to join accessory network with error: %d", (uint8_t *)&v27, 0x12u);

    }
    objc_autoreleasePoolPop(v22);
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("HAPErrorDomain"), 26, 0);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v7[2](v7, v26);

  }
}

- (id)restoreNetworkWithCompletion:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  id v7;
  void *v8;
  _QWORD block[5];
  id v11;
  id v12;

  v4 = a3;
  if (v4)
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[HAPWACAccessoryClient workQueue](self, "workQueue");
    v6 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __54__HAPWACAccessoryClient_restoreNetworkWithCompletion___block_invoke;
    block[3] = &unk_1E894D9E8;
    block[4] = self;
    v11 = v5;
    v12 = v4;
    v7 = v5;
    dispatch_async(v6, block);

    v8 = 0;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("HAPErrorDomain"), 9, 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v8;
}

- (void)_callRestoreCompletion:(id)a3 withError:(id)a4
{
  void (**v6)(id, id);
  id v7;
  uint64_t v8;
  void *v9;
  HAPWACAccessoryClient *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  int v17;
  void *v18;
  __int16 v19;
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v6 = (void (**)(id, id))a3;
  v7 = a4;
  if (v7)
    v8 = 3;
  else
    v8 = 1;
  v9 = (void *)MEMORY[0x1D17B7244](-[HAPWACAccessoryClient setState:](self, "setState:", v8));
  v10 = self;
  HMFGetOSLogHandle();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
  {
    HMFGetLogIdentifier();
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[HAPWACAccessoryClient hapWACAccessory](v10, "hapWACAccessory");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "ssid");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = 138543618;
    v18 = v12;
    v19 = 2112;
    v20 = v14;
    _os_log_impl(&dword_1CCE01000, v11, OS_LOG_TYPE_DEBUG, "%{public}@Removing accessory network %@ from the known network list", (uint8_t *)&v17, 0x16u);

  }
  objc_autoreleasePoolPop(v9);
  WiFiManagerClientCreate();
  -[HAPWACAccessoryClient hapWACAccessory](v10, "hapWACAccessory");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "rawScanResult");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "objectForKey:", CFSTR("platformNetwork"));

  WiFiManagerClientRemoveNetwork();
  if (v6)
    v6[2](v6, v7);

}

- (void)_restoreNetworkWithCompletion:(id)a3
{
  void (**v4)(id, void *);
  void *v5;
  void *v6;
  void *v7;
  HAPWACAccessoryClient *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  HAPWACAccessoryClient *v13;
  NSObject *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void (**v19)(id, void *);
  id v20;
  void *v21;
  void (**v22)(id, void *);
  uint8_t buf[4];
  void *v24;
  __int16 v25;
  void *v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v4 = (void (**)(id, void *))a3;
  -[HAPWACAccessoryClient setCompletionHandler:](self, "setCompletionHandler:", v4);
  -[HAPWACAccessoryClient currentNetworkInfo](self, "currentNetworkInfo");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "hmf_stringForKey:", CFSTR("ssid"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = (void *)MEMORY[0x1D17B7244]();
  v8 = self;
  HMFGetOSLogHandle();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
  {
    HMFGetLogIdentifier();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v24 = v10;
    v25 = 2112;
    v26 = v6;
    _os_log_impl(&dword_1CCE01000, v9, OS_LOG_TYPE_DEBUG, "%{public}@Restoring network: %@", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v7);
  -[HAPWACAccessoryClient currentNetworkInfo](v8, "currentNetworkInfo");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v11)
  {
    v12 = (void *)MEMORY[0x1D17B7244]();
    v13 = v8;
    HMFGetOSLogHandle();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v24 = v15;
      _os_log_impl(&dword_1CCE01000, v14, OS_LOG_TYPE_ERROR, "%{public}@No restored network info", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v12);
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("HAPErrorDomain"), 26, 0);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v4[2](v4, v16);

  }
  -[HAPWACAccessoryClient currentNetworkInfo](v8, "currentNetworkInfo");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[HAPWACAccessoryClient workQueue](v8, "workQueue");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = v6;
  v22 = v4;
  v19 = v4;
  v20 = v6;
  WiFiRestoreNetwork();

}

- (id)performEasyConfigWithParingPrompt:(void *)a3 performPairSetup:(BOOL)a4 isSplit:(BOOL)a5 pairingRequest:(id)a6 completion:(id)a7
{
  id v12;
  id v13;
  NSObject *v14;
  void *v15;
  _QWORD block[5];
  id v18;
  id v19;
  void *v20;
  BOOL v21;
  BOOL v22;

  v12 = a6;
  v13 = a7;
  if (v13)
  {
    -[HAPWACAccessoryClient workQueue](self, "workQueue");
    v14 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __110__HAPWACAccessoryClient_performEasyConfigWithParingPrompt_performPairSetup_isSplit_pairingRequest_completion___block_invoke;
    block[3] = &unk_1E894A570;
    block[4] = self;
    v20 = a3;
    v21 = a4;
    v22 = a5;
    v18 = v12;
    v19 = v13;
    dispatch_async(v14, block);

    v15 = 0;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("HAPErrorDomain"), 9, 0);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v15;
}

- (void)_reportProgress:(unint64_t)a3
{
  void *v5;
  id v6;

  -[HAPWACAccessoryClient clientDelegate](self, "clientDelegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[HAPWACAccessoryClient clientDelegate](self, "clientDelegate");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "hapWACAccessoryClient:wacProgress:", self, a3);

  }
}

- (void)_performEasyConfigWithPairingPrompt:(void *)a3 performPairSetup:(BOOL)a4 isSplit:(BOOL)a5 pairingRequest:(id)a6 completion:(id)a7
{
  _BOOL4 v8;
  id v11;
  uint64_t v12;
  void *v13;
  HAPWACAccessoryClient *v14;
  NSObject *v15;
  id v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  BOOL v25;
  id v26;
  void *v27;
  void *v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  HAPWACAccessoryClient *v35;
  NSObject *v36;
  id v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  uint64_t v49;
  uint64_t v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  uint64_t v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  HAPWACAccessoryClient *v71;
  NSObject *v72;
  id v73;
  void *v74;
  void *v75;
  void *v76;
  HAPWACAccessoryClient *v77;
  NSObject *v78;
  id v79;
  void *v80;
  void *v81;
  void *v82;
  void *v83;
  void *v84;
  void *v85;
  void *v86;
  void *v87;
  void *v88;
  void *v89;
  HAPWACAccessoryClient *v90;
  NSObject *v91;
  id v92;
  void *v93;
  void *v94;
  void *v95;
  void *v96;
  int v97;
  void *v98;
  void *v99;
  void *v100;
  _BOOL4 v101;
  id v102;
  id v103;
  void (**v104)(_QWORD, _QWORD, _QWORD);
  _QWORD v105[4];
  void (**v106)(_QWORD, _QWORD, _QWORD);
  _QWORD *v107;
  _QWORD *v108;
  id v109[2];
  _QWORD v110[4];
  id v111[2];
  _QWORD v112[4];
  id v113;
  id v114;
  id v115[2];
  BOOL v116;
  BOOL v117;
  _QWORD v118[4];
  id v119;
  id v120;
  _QWORD v121[5];
  id v122;
  _QWORD v123[5];
  id v124;
  id location;
  uint64_t v126;
  void *v127;
  _QWORD v128[3];
  _QWORD v129[3];
  _QWORD v130[2];
  _QWORD v131[2];
  _QWORD v132[3];
  _QWORD v133[3];
  uint8_t buf[4];
  id v135;
  __int16 v136;
  id v137;
  __int16 v138;
  void *v139;
  __int16 v140;
  id v141;
  uint64_t v142;

  v101 = a5;
  v8 = a4;
  v142 = *MEMORY[0x1E0C80C00];
  v103 = a6;
  v11 = a7;
  objc_initWeak(&location, self);
  v123[0] = 0;
  v123[1] = v123;
  v123[2] = 0x3032000000;
  v123[3] = __Block_byref_object_copy__5472;
  v123[4] = __Block_byref_object_dispose__5473;
  v124 = 0;
  v121[0] = 0;
  v121[1] = v121;
  v121[2] = 0x3032000000;
  v121[3] = __Block_byref_object_copy__5472;
  v121[4] = __Block_byref_object_dispose__5473;
  v122 = 0;
  v12 = MEMORY[0x1E0C809B0];
  v118[0] = MEMORY[0x1E0C809B0];
  v118[1] = 3221225472;
  v118[2] = __112__HAPWACAccessoryClient__performEasyConfigWithPairingPrompt_performPairSetup_isSplit_pairingRequest_completion___block_invoke;
  v118[3] = &unk_1E894A598;
  objc_copyWeak(&v120, &location);
  v102 = v11;
  v119 = v102;
  v104 = (void (**)(_QWORD, _QWORD, _QWORD))MEMORY[0x1D17B7400](v118);
  v13 = (void *)MEMORY[0x1D17B7244]();
  v14 = self;
  HMFGetOSLogHandle();
  v15 = (id)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
  {
    HMFGetLogIdentifier();
    v16 = (id)objc_claimAutoreleasedReturnValue();
    HMFBooleanToString();
    v17 = (id)objc_claimAutoreleasedReturnValue();
    HMFBooleanToString();
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138544130;
    v135 = v16;
    v136 = 2112;
    v137 = v17;
    v138 = 2112;
    v139 = v18;
    v140 = 2112;
    v141 = v103;
    _os_log_impl(&dword_1CCE01000, v15, OS_LOG_TYPE_DEBUG, "%{public}@Performing easy config, setupCodeHandler: %@ performPairSetup: %@ pairingRequest: %@", buf, 0x2Au);

  }
  objc_autoreleasePoolPop(v13);
  -[HAPWACAccessoryClient hapWACAccessory](v14, "hapWACAccessory");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "name");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v20)
    goto LABEL_10;
  -[HAPWACAccessoryClient hapWACAccessory](v14, "hapWACAccessory");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "deviceId");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v22)
  {

LABEL_10:
    goto LABEL_11;
  }
  -[HAPWACAccessoryClient currentNetworkInfo](v14, "currentNetworkInfo");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "objectForKeyedSubscript:", CFSTR("ssid"));
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = v24 == 0;

  if (!v25)
  {
    v112[0] = v12;
    v112[1] = 3221225472;
    v112[2] = __112__HAPWACAccessoryClient__performEasyConfigWithPairingPrompt_performPairSetup_isSplit_pairingRequest_completion___block_invoke_84;
    v112[3] = &unk_1E894A5C0;
    objc_copyWeak(v115, &location);
    v115[1] = a3;
    v116 = v8;
    v117 = v101;
    v26 = v103;
    v113 = v26;
    v114 = v102;
    -[HAPWACAccessoryClient setRestartEasyConfigBlock:](v14, "setRestartEasyConfigBlock:", v112);
    if (a3 && v8)
    {
      v132[0] = *MEMORY[0x1E0D1DB10];
      -[HAPWACAccessoryClient hapWACAccessory](v14, "hapWACAccessory");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "deviceId");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      v29 = *MEMORY[0x1E0D1DB18];
      v133[0] = v28;
      v133[1] = &unk_1E8989518;
      v30 = *MEMORY[0x1E0D1DB00];
      v132[1] = v29;
      v132[2] = v30;
      v133[2] = MEMORY[0x1E0C9AAB0];
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v133, v132, 3);
      v31 = (void *)objc_claimAutoreleasedReturnValue();

      -[HAPWACAccessoryClient _setupEasyConfigWithDeviceInfo:](v14, "_setupEasyConfigWithDeviceInfo:", v31);
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      -[HAPWACAccessoryClient setEzConfigDevice:](v14, "setEzConfigDevice:", v32);

      -[HAPWACAccessoryClient ezConfigDevice](v14, "ezConfigDevice");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      v110[0] = v12;
      v110[1] = 3221225472;
      v110[2] = __112__HAPWACAccessoryClient__performEasyConfigWithPairingPrompt_performPairSetup_isSplit_pairingRequest_completion___block_invoke_86;
      v110[3] = &unk_1E894A5E8;
      objc_copyWeak(v111, &location);
      v111[1] = a3;
      objc_msgSend(v33, "setPromptForSetupCodeHandler:", v110);

      objc_destroyWeak(v111);
    }
    else
    {
      if (v8)
      {
        v130[0] = *MEMORY[0x1E0D1DB10];
        -[HAPWACAccessoryClient hapWACAccessory](v14, "hapWACAccessory");
        v45 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v45, "deviceId");
        v46 = (void *)objc_claimAutoreleasedReturnValue();
        v130[1] = *MEMORY[0x1E0D1DB18];
        v131[0] = v46;
        v131[1] = &unk_1E8989530;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v131, v130, 2);
      }
      else
      {
        v128[0] = *MEMORY[0x1E0D1DB10];
        -[HAPWACAccessoryClient hapWACAccessory](v14, "hapWACAccessory");
        v45 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v45, "deviceId");
        v46 = (void *)objc_claimAutoreleasedReturnValue();
        v49 = *MEMORY[0x1E0D1DB18];
        v129[0] = v46;
        v129[1] = &unk_1E8989518;
        v50 = *MEMORY[0x1E0D1DB00];
        v128[1] = v49;
        v128[2] = v50;
        v129[2] = MEMORY[0x1E0C9AAB0];
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v129, v128, 3);
      }
      v31 = (void *)objc_claimAutoreleasedReturnValue();

      -[HAPWACAccessoryClient _setupEasyConfigWithDeviceInfo:](v14, "_setupEasyConfigWithDeviceInfo:", v31);
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      -[HAPWACAccessoryClient setEzConfigDevice:](v14, "setEzConfigDevice:", v47);

      -[HAPWACAccessoryClient ezConfigDevice](v14, "ezConfigDevice");
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v48, "setSkipPairSetup:", 1);

    }
    v126 = *MEMORY[0x1E0D1DB20];
    -[HAPWACAccessoryClient hapWACAccessory](v14, "hapWACAccessory");
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v51, "name");
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    v127 = v52;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v127, &v126, 1);
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    v54 = (void *)objc_msgSend(v53, "mutableCopy");

    objc_msgSend(v26, "ssid");
    v55 = (void *)objc_claimAutoreleasedReturnValue();

    if (v55)
    {
      objc_msgSend(v26, "ssid");
      v56 = (void *)objc_claimAutoreleasedReturnValue();
      v57 = *MEMORY[0x1E0D1DB38];
      objc_msgSend(v54, "setObject:forKeyedSubscript:", v56, *MEMORY[0x1E0D1DB38]);
    }
    else
    {
      -[HAPWACAccessoryClient compatiblePrefixedNetwork](v14, "compatiblePrefixedNetwork");
      v58 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v58, "objectForKeyedSubscript:", CFSTR("ssid"));
      v59 = (void *)objc_claimAutoreleasedReturnValue();

      if (v59)
        -[HAPWACAccessoryClient compatiblePrefixedNetwork](v14, "compatiblePrefixedNetwork");
      else
        -[HAPWACAccessoryClient currentNetworkInfo](v14, "currentNetworkInfo");
      v56 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v56, "objectForKeyedSubscript:", CFSTR("ssid"));
      v60 = (void *)objc_claimAutoreleasedReturnValue();
      v57 = *MEMORY[0x1E0D1DB38];
      objc_msgSend(v54, "setObject:forKeyedSubscript:", v60, *MEMORY[0x1E0D1DB38]);

    }
    objc_msgSend(v26, "psk");
    v61 = (void *)objc_claimAutoreleasedReturnValue();

    if (v61)
    {
      objc_msgSend(v26, "psk");
      v62 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v54, "setObject:forKeyedSubscript:", v62, *MEMORY[0x1E0D1DB30]);
LABEL_32:

      goto LABEL_33;
    }
    -[HAPWACAccessoryClient compatiblePrefixedNetwork](v14, "compatiblePrefixedNetwork");
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v63, "objectForKeyedSubscript:", CFSTR("ssid"));
    v64 = (void *)objc_claimAutoreleasedReturnValue();

    if (v64)
    {
      -[HAPWACAccessoryClient compatiblePrefixedNetwork](v14, "compatiblePrefixedNetwork");
      v65 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v65, "objectForKeyedSubscript:", CFSTR("password"));
      v66 = (void *)objc_claimAutoreleasedReturnValue();

      if (v66)
      {
        -[HAPWACAccessoryClient compatiblePrefixedNetwork](v14, "compatiblePrefixedNetwork");
        v62 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v62, "objectForKeyedSubscript:", CFSTR("password"));
        v67 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v54, "setObject:forKeyedSubscript:", v67, *MEMORY[0x1E0D1DB30]);
LABEL_31:

        goto LABEL_32;
      }
    }
    else
    {
      -[HAPWACAccessoryClient currentNetworkInfo](v14, "currentNetworkInfo");
      v68 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v68, "objectForKeyedSubscript:", CFSTR("password"));
      v69 = (void *)objc_claimAutoreleasedReturnValue();

      if (v69)
      {
        -[HAPWACAccessoryClient currentNetworkInfo](v14, "currentNetworkInfo");
        v62 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v62, "objectForKeyedSubscript:", CFSTR("password"));
        v67 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v54, "setObject:forKeyedSubscript:", v67, *MEMORY[0x1E0D1DB30]);
        goto LABEL_31;
      }
    }
LABEL_33:
    v70 = (void *)MEMORY[0x1D17B7244]();
    v71 = v14;
    HMFGetOSLogHandle();
    v72 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v72, OS_LOG_TYPE_DEBUG))
    {
      HMFGetLogIdentifier();
      v73 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v54, "objectForKeyedSubscript:", v57);
      v74 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v135 = v73;
      v136 = 2112;
      v137 = v74;
      _os_log_impl(&dword_1CCE01000, v72, OS_LOG_TYPE_DEBUG, "%{public}@Configuring to SSID: %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v70);
    objc_msgSend(v26, "isoCountryCode");
    v75 = (void *)objc_claimAutoreleasedReturnValue();

    if (v75)
    {
      v76 = (void *)MEMORY[0x1D17B7244]();
      v77 = v71;
      HMFGetOSLogHandle();
      v78 = (id)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v78, OS_LOG_TYPE_DEBUG))
      {
        HMFGetLogIdentifier();
        v79 = (id)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "isoCountryCode");
        v80 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v135 = v79;
        v136 = 2112;
        v137 = v80;
        _os_log_impl(&dword_1CCE01000, v78, OS_LOG_TYPE_DEBUG, "%{public}@Adding country code: %@", buf, 0x16u);

      }
      objc_autoreleasePoolPop(v76);
      objc_msgSend(v26, "isoCountryCode");
      v81 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v54, "setObject:forKeyedSubscript:", v81, *MEMORY[0x1E0D1DB08]);

    }
    -[HAPWACAccessoryClient ezConfigDevice](v71, "ezConfigDevice");
    v82 = (void *)objc_claimAutoreleasedReturnValue();

    if (v82)
    {
      v83 = -[HAPWACAccessoryClient restartPairingCount](v71, "restartPairingCount");
      -[HAPWACAccessoryClient ezConfigDevice](v71, "ezConfigDevice");
      v84 = (void *)objc_claimAutoreleasedReturnValue();
      v105[0] = v12;
      v105[1] = 3221225472;
      v105[2] = __112__HAPWACAccessoryClient__performEasyConfigWithPairingPrompt_performPairSetup_isSplit_pairingRequest_completion___block_invoke_91;
      v105[3] = &unk_1E894A638;
      objc_copyWeak(v109, &location);
      v109[1] = v83;
      v106 = v104;
      v107 = v123;
      v108 = v121;
      objc_msgSend(v84, "setProgressHandler:", v105);

      -[HAPWACAccessoryClient ezConfigDevice](v71, "ezConfigDevice");
      v85 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v85, "setConfiguration:", v54);

      -[HAPWACAccessoryClient ezConfigDevice](v71, "ezConfigDevice");
      v86 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v86, "setPairSetupFlags:", 0);

      -[HAPWACAccessoryClient hapWACAccessory](v71, "hapWACAccessory");
      v87 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(v83) = objc_msgSend(v87, "supportsTokenAuth");

      if ((_DWORD)v83)
      {
        -[HAPWACAccessoryClient ezConfigDevice](v71, "ezConfigDevice");
        v88 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v88, "setPairSetupFlags:", objc_msgSend(v88, "pairSetupFlags") | 0x8000);
      }
      else
      {
        -[HAPWACAccessoryClient hapWACAccessory](v71, "hapWACAccessory");
        v96 = (void *)objc_claimAutoreleasedReturnValue();
        v97 = objc_msgSend(v96, "supportsCertAuth");

        -[HAPWACAccessoryClient ezConfigDevice](v71, "ezConfigDevice");
        v88 = (void *)objc_claimAutoreleasedReturnValue();
        if (v97)
          objc_msgSend(v88, "setPairSetupFlags:", objc_msgSend(v88, "pairSetupFlags") | 0x4001);
        else
          objc_msgSend(v88, "setPairSetupFlags:", 1);
      }

      if (v101)
      {
        -[HAPWACAccessoryClient ezConfigDevice](v71, "ezConfigDevice");
        v98 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v98, "setPairSetupFlags:", objc_msgSend(v98, "pairSetupFlags") | 0x1000000);

      }
      -[HAPWACAccessoryClient ezConfigDevice](v71, "ezConfigDevice");
      v99 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v99, "setPausesAfterApply:", 1);

      -[HAPWACAccessoryClient ezConfigDevice](v71, "ezConfigDevice");
      v100 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v100, "start");

      objc_destroyWeak(v109);
    }
    else
    {
      v89 = (void *)MEMORY[0x1D17B7244]();
      v90 = v71;
      HMFGetOSLogHandle();
      v91 = (id)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v91, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v92 = (id)objc_claimAutoreleasedReturnValue();
        -[HAPWACAccessoryClient hapWACAccessory](v90, "hapWACAccessory");
        v93 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v93, "rawScanResult");
        v94 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v135 = v92;
        v136 = 2112;
        v137 = v94;
        _os_log_impl(&dword_1CCE01000, v91, OS_LOG_TYPE_ERROR, "%{public}@Failed instantiating easy config with scan result: %@", buf, 0x16u);

      }
      objc_autoreleasePoolPop(v89);
      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("HAPErrorDomain"), 19, 0);
      v95 = (void *)objc_claimAutoreleasedReturnValue();
      ((void (**)(_QWORD, void *, unint64_t))v104)[2](v104, v95, -[HAPWACAccessoryClient state](v90, "state"));

    }
    objc_destroyWeak(v115);
    goto LABEL_52;
  }
LABEL_11:
  v34 = (void *)MEMORY[0x1D17B7244]();
  v35 = v14;
  HMFGetOSLogHandle();
  v36 = (id)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
  {
    HMFGetLogIdentifier();
    v37 = (id)objc_claimAutoreleasedReturnValue();
    -[HAPWACAccessoryClient hapWACAccessory](v35, "hapWACAccessory");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "name");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    -[HAPWACAccessoryClient hapWACAccessory](v35, "hapWACAccessory");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "deviceId");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    -[HAPWACAccessoryClient currentNetworkInfo](v35, "currentNetworkInfo");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v42, "objectForKeyedSubscript:", CFSTR("ssid"));
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138544130;
    v135 = v37;
    v136 = 2112;
    v137 = v39;
    v138 = 2112;
    v139 = v41;
    v140 = 2112;
    v141 = v43;
    _os_log_impl(&dword_1CCE01000, v36, OS_LOG_TYPE_ERROR, "%{public}@Invalid nil param(s), name: %@, deviceId: %@, ssid: %@", buf, 0x2Au);

  }
  objc_autoreleasePoolPop(v34);
  objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("HAPErrorDomain"), 9, 0);
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  ((void (**)(_QWORD, void *, unint64_t))v104)[2](v104, v44, -[HAPWACAccessoryClient state](v35, "state"));

LABEL_52:
  objc_destroyWeak(&v120);
  _Block_object_dispose(v121, 8);

  _Block_object_dispose(v123, 8);
  objc_destroyWeak(&location);

}

- (void)_restoreNetworkAndReportError:(id)a3 withCompletion:(id)a4
{
  id v6;
  id v7;
  unint64_t v8;
  void *v9;
  id v10;
  id v11;
  id v12;
  _QWORD v13[4];
  id v14;
  id v15;
  unint64_t v16;

  v6 = a4;
  v7 = a3;
  v8 = -[HAPWACAccessoryClient state](self, "state");
  -[HAPWACAccessoryClient setState:](self, "setState:", 0);
  mapUnderlyingErrorToHAPError(v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __70__HAPWACAccessoryClient__restoreNetworkAndReportError_withCompletion___block_invoke;
  v13[3] = &unk_1E894A660;
  v14 = v9;
  v15 = v6;
  v16 = v8;
  v10 = v9;
  v11 = v6;
  v12 = -[HAPWACAccessoryClient restoreNetworkWithCompletion:](self, "restoreNetworkWithCompletion:", v13);

}

- (void)_performPostConfig
{
  id v3;
  _QWORD v4[5];

  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __43__HAPWACAccessoryClient__performPostConfig__block_invoke;
  v4[3] = &unk_1E894DD08;
  v4[4] = self;
  __43__HAPWACAccessoryClient__performPostConfig__block_invoke((uint64_t)v4);
  -[HAPWACAccessoryClient setState:](self, "setState:", 8);
  -[HAPWACAccessoryClient ezConfigDevice](self, "ezConfigDevice");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "resumePostConfig");

}

- (id)continuePairingWithSetupCode:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  _QWORD v8[5];
  id v9;

  v4 = a3;
  if (v4)
  {
    -[HAPWACAccessoryClient workQueue](self, "workQueue");
    v5 = objc_claimAutoreleasedReturnValue();
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __54__HAPWACAccessoryClient_continuePairingWithSetupCode___block_invoke;
    v8[3] = &unk_1E894E0F8;
    v8[4] = self;
    v9 = v4;
    dispatch_async(v5, v8);

    v6 = 0;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("HAPErrorDomain"), 9, 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v6;
}

- (void)_continuePairingWithSetupCode:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[HAPWACAccessoryClient ezConfigDevice](self, "ezConfigDevice");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "trySetupCode:", v4);

}

- (void)stopEasyConfig
{
  void *v3;
  void *v4;
  HAPWACAccessoryClient *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  -[HAPWACAccessoryClient ezConfigDevice](self, "ezConfigDevice");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    v4 = (void *)MEMORY[0x1D17B7244]();
    v5 = self;
    HMFGetOSLogHandle();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    {
      HMFGetLogIdentifier();
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = 138543362;
      v10 = v7;
      _os_log_impl(&dword_1CCE01000, v6, OS_LOG_TYPE_DEBUG, "%{public}@Stopping ezConfig", (uint8_t *)&v9, 0xCu);

    }
    objc_autoreleasePoolPop(v4);
    -[HAPWACAccessoryClient ezConfigDevice](v5, "ezConfigDevice");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "stop");

  }
}

- (void)restart
{
  NSObject *v3;
  _QWORD block[5];

  -[HAPWACAccessoryClient workQueue](self, "workQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __32__HAPWACAccessoryClient_restart__block_invoke;
  block[3] = &unk_1E894DD08;
  block[4] = self;
  dispatch_async(v3, block);

}

- (id)logIdentifier
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[HAPWACAccessoryClient state](self, "state"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (HAPWACAccessory)hapWACAccessory
{
  return self->_hapWACAccessory;
}

- (NSMutableSet)compatible2Pt4Networks
{
  return self->_compatible2Pt4Networks;
}

- (NSDictionary)currentNetworkInfo
{
  return self->_currentNetworkInfo;
}

- (void)setCurrentNetworkInfo:(id)a3
{
  objc_storeStrong((id *)&self->_currentNetworkInfo, a3);
}

- (NSDictionary)compatiblePrefixedNetwork
{
  return self->_compatiblePrefixedNetwork;
}

- (void)setCompatiblePrefixedNetwork:(id)a3
{
  objc_storeStrong((id *)&self->_compatiblePrefixedNetwork, a3);
}

- (OS_dispatch_queue)workQueue
{
  return self->_workQueue;
}

- (id)completionHandler
{
  return self->_completionHandler;
}

- (void)setCompletionHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (HAPEasyConfigDevice)ezConfigDevice
{
  return self->_ezConfigDevice;
}

- (void)setEzConfigDevice:(id)a3
{
  objc_storeStrong((id *)&self->_ezConfigDevice, a3);
}

- (HAPAccessoryServer)server
{
  return (HAPAccessoryServer *)objc_loadWeakRetained((id *)&self->_server);
}

- (HAPWACAccessoryBrowser)browser
{
  return (HAPWACAccessoryBrowser *)objc_loadWeakRetained((id *)&self->_browser);
}

- (unint64_t)restartPairingCount
{
  return self->_restartPairingCount;
}

- (void)setRestartPairingCount:(unint64_t)a3
{
  self->_restartPairingCount = a3;
}

- (id)restartEasyConfigBlock
{
  return self->_restartEasyConfigBlock;
}

- (void)setRestartEasyConfigBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 112);
}

- (BOOL)metricSubmitted
{
  return self->_metricSubmitted;
}

- (void)setMetricSubmitted:(BOOL)a3
{
  self->_metricSubmitted = a3;
}

- (double)joinLatency
{
  return self->_joinLatency;
}

- (void)setJoinLatency:(double)a3
{
  self->_joinLatency = a3;
}

- (double)restoreLatency
{
  return self->_restoreLatency;
}

- (void)setRestoreLatency:(double)a3
{
  self->_restoreLatency = a3;
}

- (double)configurationLatency
{
  return self->_configurationLatency;
}

- (void)setConfigurationLatency:(double)a3
{
  self->_configurationLatency = a3;
}

- (double)preConfigDiscoveryTime
{
  return self->_preConfigDiscoveryTime;
}

- (void)setPreConfigDiscoveryTime:(double)a3
{
  self->_preConfigDiscoveryTime = a3;
}

- (double)postConfigDiscoveryTime
{
  return self->_postConfigDiscoveryTime;
}

- (void)setPostConfigDiscoveryTime:(double)a3
{
  self->_postConfigDiscoveryTime = a3;
}

- (double)setupCodeDelay
{
  return self->_setupCodeDelay;
}

- (void)setSetupCodeDelay:(double)a3
{
  self->_setupCodeDelay = a3;
}

- (NSDate)setupCodeRequestTime
{
  return self->_setupCodeRequestTime;
}

- (void)setSetupCodeRequestTime:(id)a3
{
  objc_storeStrong((id *)&self->_setupCodeRequestTime, a3);
}

- (unint64_t)retryCount
{
  return self->_retryCount;
}

- (void)setRetryCount:(unint64_t)a3
{
  self->_retryCount = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_setupCodeRequestTime, 0);
  objc_storeStrong(&self->_restartEasyConfigBlock, 0);
  objc_destroyWeak((id *)&self->_browser);
  objc_destroyWeak((id *)&self->_server);
  objc_storeStrong((id *)&self->_ezConfigDevice, 0);
  objc_storeStrong(&self->_completionHandler, 0);
  objc_storeStrong((id *)&self->_workQueue, 0);
  objc_storeStrong((id *)&self->_compatiblePrefixedNetwork, 0);
  objc_storeStrong((id *)&self->_currentNetworkInfo, 0);
  objc_storeStrong((id *)&self->_compatible2Pt4Networks, 0);
  objc_storeStrong((id *)&self->_hapWACAccessory, 0);
  objc_destroyWeak((id *)&self->_clientDelegate);
}

void __32__HAPWACAccessoryClient_restart__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  NSObject *v6;
  void *v7;
  void (**v8)(void);
  void *v9;
  id v10;
  NSObject *v11;
  void *v12;
  int v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "restartEasyConfigBlock");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (v2)
  {
    objc_msgSend(*(id *)(a1 + 32), "ezConfigDevice");
    v3 = (void *)objc_claimAutoreleasedReturnValue();

    if (v3)
    {
      v4 = (void *)MEMORY[0x1D17B7244]();
      v5 = *(id *)(a1 + 32);
      HMFGetOSLogHandle();
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
      {
        HMFGetLogIdentifier();
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = 138543362;
        v14 = v7;
        _os_log_impl(&dword_1CCE01000, v6, OS_LOG_TYPE_DEBUG, "%{public}@Restarting ezConfig", (uint8_t *)&v13, 0xCu);

      }
      objc_autoreleasePoolPop(v4);
      objc_msgSend(*(id *)(a1 + 32), "setRestartPairingCount:", objc_msgSend(*(id *)(a1 + 32), "restartPairingCount") + 1);
      objc_msgSend(*(id *)(a1 + 32), "restartEasyConfigBlock");
      v8 = (void (**)(void))objc_claimAutoreleasedReturnValue();
      v8[2]();

    }
  }
  else
  {
    v9 = (void *)MEMORY[0x1D17B7244]();
    v10 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = 138543362;
      v14 = v12;
      _os_log_impl(&dword_1CCE01000, v11, OS_LOG_TYPE_ERROR, "%{public}@Invalid state, must have a block here", (uint8_t *)&v13, 0xCu);

    }
    objc_autoreleasePoolPop(v9);
  }
}

uint64_t __54__HAPWACAccessoryClient_continuePairingWithSetupCode___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  double v5;
  double v6;
  double v7;

  objc_msgSend(*(id *)(a1 + 32), "setState:", 7);
  v2 = *(void **)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "setupCodeRequestTime");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "timeIntervalSinceDate:", v4);
  v6 = v5;
  objc_msgSend(v2, "setupCodeDelay");
  objc_msgSend(v2, "setSetupCodeDelay:", v6 + v7);

  return objc_msgSend(*(id *)(a1 + 32), "_continuePairingWithSetupCode:", *(_QWORD *)(a1 + 40));
}

void __43__HAPWACAccessoryClient__performPostConfig__block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  id v4;

  objc_msgSend(*(id *)(a1 + 32), "server");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "pairingActivity");
  v4 = (id)objc_claimAutoreleasedReturnValue();

  if (v4)
    v3 = (id)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(*(id *)(a1 + 32), "state"));

}

uint64_t __70__HAPWACAccessoryClient__restoreNetworkAndReportError_withCompletion___block_invoke(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(a1[5] + 16))(a1[5], a1[4], a1[6]);
}

void __112__HAPWACAccessoryClient__performEasyConfigWithPairingPrompt_performPairSetup_isSplit_pairingRequest_completion___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id WeakRetained;
  void *v6;
  id v7;
  void *v8;
  id v9;
  id v10;
  _QWORD v11[7];

  v10 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    objc_msgSend(v10, "userInfo");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectForKeyedSubscript:", *MEMORY[0x1E0CB3388]);
    v7 = (id)objc_claimAutoreleasedReturnValue();

    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v8 = v7;
    else
      v8 = 0;
    v9 = v8;

    if (!v9)
      v7 = v10;
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __112__HAPWACAccessoryClient__performEasyConfigWithPairingPrompt_performPairSetup_isSplit_pairingRequest_completion___block_invoke_2;
    v11[3] = &unk_1E894B6C0;
    v11[5] = v7;
    v11[6] = a3;
    v11[4] = WeakRetained;
    __112__HAPWACAccessoryClient__performEasyConfigWithPairingPrompt_performPairSetup_isSplit_pairingRequest_completion___block_invoke_2((uint64_t)v11);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithHMErrorCode:", 20);
    v7 = v10;
    v10 = (id)objc_claimAutoreleasedReturnValue();
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __112__HAPWACAccessoryClient__performEasyConfigWithPairingPrompt_performPairSetup_isSplit_pairingRequest_completion___block_invoke_84(uint64_t a1)
{
  void *v2;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  objc_msgSend(WeakRetained, "ezConfigDevice");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stop");

  objc_msgSend(WeakRetained, "_performEasyConfigWithPairingPrompt:performPairSetup:isSplit:pairingRequest:completion:", *(_QWORD *)(a1 + 56), *(unsigned __int8 *)(a1 + 64), *(unsigned __int8 *)(a1 + 65), *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
}

uint64_t __112__HAPWACAccessoryClient__performEasyConfigWithPairingPrompt_performPairSetup_isSplit_pairingRequest_completion___block_invoke_86(uint64_t a1, uint64_t a2, uint64_t a3)
{
  id WeakRetained;
  void *v7;
  void *v8;
  void (*v9)(uint64_t, uint64_t, void *);
  void *v10;
  uint64_t v11;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v7 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "setState:", 6);
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setSetupCodeRequestTime:", v8);

    v9 = *(void (**)(uint64_t, uint64_t, void *))(a1 + 40);
    objc_msgSend(v7, "server");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v9(a2, a3, v10);

    v11 = 0;
  }
  else
  {
    v11 = 4294960556;
  }

  return v11;
}

void __112__HAPWACAccessoryClient__performEasyConfigWithPairingPrompt_performPairSetup_isSplit_pairingRequest_completion___block_invoke_91(uint64_t a1, int a2, void *a3)
{
  id v5;
  id WeakRetained;
  void *v7;
  NSObject *v8;
  _QWORD v9[5];
  id v10;
  id v11;
  __int128 v12;
  id v13[2];
  int v14;

  v5 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  v7 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "workQueue");
    v8 = objc_claimAutoreleasedReturnValue();
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __112__HAPWACAccessoryClient__performEasyConfigWithPairingPrompt_performPairSetup_isSplit_pairingRequest_completion___block_invoke_2_92;
    v9[3] = &unk_1E894A610;
    v13[1] = *(id *)(a1 + 64);
    v9[4] = v7;
    v14 = a2;
    v10 = v5;
    v11 = *(id *)(a1 + 32);
    v12 = *(_OWORD *)(a1 + 40);
    objc_copyWeak(v13, (id *)(a1 + 56));
    dispatch_async(v8, v9);

    objc_destroyWeak(v13);
  }

}

void __112__HAPWACAccessoryClient__performEasyConfigWithPairingPrompt_performPairSetup_isSplit_pairingRequest_completion___block_invoke_2_92(uint64_t a1)
{
  uint64_t v2;
  BOOL v3;
  void *v4;
  id v5;
  NSObject *v6;
  _BOOL4 v7;
  uint64_t v8;
  void *v9;
  int v10;
  const char *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  void *v16;
  BOOL v17;
  void *v18;
  id v19;
  NSObject *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  int v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  void *v33;
  void *v34;
  double v35;
  double v36;
  double v37;
  uint64_t v38;
  void *v39;
  void *v40;
  void *v41;
  double v42;
  double v43;
  double v44;
  uint64_t v45;
  void *v46;
  void *v47;
  id v48;
  NSObject *v49;
  void *v50;
  uint64_t v51;
  void *v52;
  id v53;
  _BOOL4 v54;
  void *v55;
  id v56;
  NSObject *v57;
  NSObject *v58;
  void *v59;
  void *v60;
  uint64_t v61;
  void *v62;
  void *v63;
  _QWORD v64[4];
  id v65;
  _QWORD v66[5];
  int v67;
  uint8_t buf[4];
  uint64_t v69;
  __int16 v70;
  uint64_t v71;
  __int16 v72;
  void *v73;
  uint64_t v74;

  v74 = *MEMORY[0x1E0C80C00];
  v2 = *(_QWORD *)(a1 + 80);
  v3 = v2 == objc_msgSend(*(id *)(a1 + 32), "restartPairingCount");
  v4 = (void *)MEMORY[0x1D17B7244]();
  v5 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = os_log_type_enabled(v6, OS_LOG_TYPE_INFO);
  if (v3)
  {
    if (!v7)
      goto LABEL_28;
    HMFGetLogIdentifier();
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = (void *)v8;
    v10 = *(_DWORD *)(a1 + 88);
    if (v10 <= 29)
    {
      v11 = "Start";
      switch(v10)
      {
        case 1:
          goto LABEL_27;
        case 2:
          v11 = "Final";
          break;
        case 3:
          v11 = "Error";
          break;
        case 4:
        case 5:
        case 6:
        case 7:
        case 8:
        case 9:
          goto LABEL_19;
        case 10:
          v11 = "Search for pre-config device";
          break;
        default:
          if (v10 != 20)
            goto LABEL_19;
          v11 = "Authenticating pre-config device";
          break;
      }
      goto LABEL_27;
    }
    if (v10 <= 49)
    {
      if (v10 == 30)
      {
        v11 = "Applying configuration to device";
        goto LABEL_27;
      }
      if (v10 == 40)
      {
        v11 = "Applied configuration to device";
        goto LABEL_27;
      }
    }
    else
    {
      switch(v10)
      {
        case '2':
          v11 = "Searching for post-config device";
          goto LABEL_27;
        case '<':
          v11 = "Performing post-config check of device";
          goto LABEL_27;
        case 'F':
          v11 = "Performed post-config check of device";
LABEL_27:
          *(_DWORD *)buf = 138543618;
          v69 = v8;
          v70 = 2080;
          v71 = (uint64_t)v11;
          _os_log_impl(&dword_1CCE01000, v6, OS_LOG_TYPE_INFO, "%{public}@Easy config progress: %s", buf, 0x16u);

LABEL_28:
          objc_autoreleasePoolPop(v4);
          v13 = MEMORY[0x1E0C809B0];
          v66[0] = MEMORY[0x1E0C809B0];
          v66[1] = 3221225472;
          v66[2] = __112__HAPWACAccessoryClient__performEasyConfigWithPairingPrompt_performPairSetup_isSplit_pairingRequest_completion___block_invoke_105;
          v66[3] = &unk_1E894D748;
          v66[4] = *(_QWORD *)(a1 + 32);
          v67 = *(_DWORD *)(a1 + 88);
          __112__HAPWACAccessoryClient__performEasyConfigWithPairingPrompt_performPairSetup_isSplit_pairingRequest_completion___block_invoke_105((uint64_t)v66);
          v14 = *(void **)(a1 + 40);
          if (v14)
          {
            v15 = *MEMORY[0x1E0D1DB28];
            objc_msgSend(v14, "objectForKeyedSubscript:", *MEMORY[0x1E0D1DB28]);
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            v17 = v16 == 0;

            if (!v17)
            {
              v18 = (void *)MEMORY[0x1D17B7244]();
              v19 = *(id *)(a1 + 32);
              HMFGetOSLogHandle();
              v20 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
              {
                HMFGetLogIdentifier();
                v21 = (void *)objc_claimAutoreleasedReturnValue();
                v22 = objc_msgSend(*(id *)(a1 + 32), "state");
                objc_msgSend(*(id *)(a1 + 40), "objectForKeyedSubscript:", v15);
                v23 = (void *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = 138543874;
                v69 = (uint64_t)v21;
                v70 = 2048;
                v71 = v22;
                v72 = 2112;
                v73 = v23;
                _os_log_impl(&dword_1CCE01000, v20, OS_LOG_TYPE_ERROR, "%{public}@Easy config failed in state: %tu - error: %@ calling completion handler with error", buf, 0x20u);

              }
              objc_autoreleasePoolPop(v18);
              v24 = *(void **)(a1 + 32);
              objc_msgSend(*(id *)(a1 + 40), "objectForKeyedSubscript:", v15);
              v25 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v24, "_restoreNetworkAndReportError:withCompletion:", v25, *(_QWORD *)(a1 + 48));

            }
          }
          v26 = *(_DWORD *)(a1 + 88);
          if (v26 == 10)
          {
            objc_msgSend(*(id *)(a1 + 32), "_reportProgress:", 0);
            objc_msgSend(MEMORY[0x1E0C99D68], "date");
            v27 = objc_claimAutoreleasedReturnValue();
            v28 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
            v29 = *(void **)(v28 + 40);
            *(_QWORD *)(v28 + 40) = v27;

            v26 = *(_DWORD *)(a1 + 88);
          }
          if (v26 == 50)
          {
            objc_msgSend(*(id *)(a1 + 32), "_reportProgress:", 0);
            objc_msgSend(MEMORY[0x1E0C99D68], "date");
            v30 = objc_claimAutoreleasedReturnValue();
            v31 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
            v32 = *(void **)(v31 + 40);
            *(_QWORD *)(v31 + 40) = v30;

            v26 = *(_DWORD *)(a1 + 88);
          }
          if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40) && v26 >= 11)
          {
            v33 = *(void **)(a1 + 32);
            objc_msgSend(MEMORY[0x1E0C99D68], "date");
            v34 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v34, "timeIntervalSinceDate:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40));
            v36 = v35;
            objc_msgSend(v33, "preConfigDiscoveryTime");
            objc_msgSend(v33, "setPreConfigDiscoveryTime:", v36 + v37);

            v38 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
            v39 = *(void **)(v38 + 40);
            *(_QWORD *)(v38 + 40) = 0;

            v26 = *(_DWORD *)(a1 + 88);
          }
          if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40) && v26 >= 51)
          {
            v40 = *(void **)(a1 + 32);
            objc_msgSend(MEMORY[0x1E0C99D68], "date");
            v41 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v41, "timeIntervalSinceDate:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40));
            v43 = v42;
            objc_msgSend(v40, "postConfigDiscoveryTime");
            objc_msgSend(v40, "setPostConfigDiscoveryTime:", v43 + v44);

            v45 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
            v46 = *(void **)(v45 + 40);
            *(_QWORD *)(v45 + 40) = 0;

            v26 = *(_DWORD *)(a1 + 88);
          }
          if (v26 == 40)
          {
            v47 = (void *)MEMORY[0x1D17B7244]();
            v48 = *(id *)(a1 + 32);
            HMFGetOSLogHandle();
            v49 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v49, OS_LOG_TYPE_DEBUG))
            {
              HMFGetLogIdentifier();
              v50 = (void *)objc_claimAutoreleasedReturnValue();
              v51 = *(_QWORD *)(a1 + 40);
              *(_DWORD *)buf = 138543618;
              v69 = (uint64_t)v50;
              v70 = 2112;
              v71 = v51;
              _os_log_impl(&dword_1CCE01000, v49, OS_LOG_TYPE_DEBUG, "%{public}@Applied Config with info: %@", buf, 0x16u);

            }
            objc_autoreleasePoolPop(v47);
            objc_msgSend(*(id *)(a1 + 32), "_reportProgress:", 1);
            objc_msgSend(*(id *)(a1 + 32), "_reportProgress:", 2);
            v52 = *(void **)(a1 + 32);
            v64[0] = v13;
            v64[1] = 3221225472;
            v64[2] = __112__HAPWACAccessoryClient__performEasyConfigWithPairingPrompt_performPairSetup_isSplit_pairingRequest_completion___block_invoke_109;
            v64[3] = &unk_1E894DDF8;
            objc_copyWeak(&v65, (id *)(a1 + 72));
            v53 = (id)objc_msgSend(v52, "restoreNetworkWithCompletion:", v64);
            objc_destroyWeak(&v65);
            v26 = *(_DWORD *)(a1 + 88);
          }
          if (v26 == 2)
          {
            v54 = objc_msgSend(*(id *)(a1 + 32), "state") == 8;
            v55 = (void *)MEMORY[0x1D17B7244]();
            v56 = *(id *)(a1 + 32);
            HMFGetOSLogHandle();
            v57 = objc_claimAutoreleasedReturnValue();
            v58 = v57;
            if (v54)
            {
              if (os_log_type_enabled(v57, OS_LOG_TYPE_DEBUG))
              {
                HMFGetLogIdentifier();
                v59 = (void *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = 138543362;
                v69 = (uint64_t)v59;
                _os_log_impl(&dword_1CCE01000, v58, OS_LOG_TYPE_DEBUG, "%{public}@Easy config completed - calling completion handler", buf, 0xCu);

              }
              objc_autoreleasePoolPop(v55);
              objc_msgSend(*(id *)(a1 + 32), "setState:", 9);
              (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
            }
            else
            {
              if (os_log_type_enabled(v57, OS_LOG_TYPE_ERROR))
              {
                HMFGetLogIdentifier();
                v60 = (void *)objc_claimAutoreleasedReturnValue();
                v61 = objc_msgSend(*(id *)(a1 + 32), "state");
                *(_DWORD *)buf = 138543618;
                v69 = (uint64_t)v60;
                v70 = 2048;
                v71 = v61;
                _os_log_impl(&dword_1CCE01000, v58, OS_LOG_TYPE_ERROR, "%{public}@Easy config failed in state: %tu - calling completion handler with error", buf, 0x16u);

              }
              objc_autoreleasePoolPop(v55);
              v62 = *(void **)(a1 + 32);
              objc_msgSend(*(id *)(a1 + 40), "objectForKeyedSubscript:", *MEMORY[0x1E0D1DB28]);
              v63 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v62, "_restoreNetworkAndReportError:withCompletion:", v63, *(_QWORD *)(a1 + 48));

            }
          }
          return;
      }
    }
LABEL_19:
    v11 = "?";
    if (v10 == 100)
      v11 = "Configuration complete";
    goto LABEL_27;
  }
  if (v7)
  {
    HMFGetLogIdentifier();
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v69 = (uint64_t)v12;
    _os_log_impl(&dword_1CCE01000, v6, OS_LOG_TYPE_INFO, "%{public}@Ignoring easy config progress event because we are restarting", buf, 0xCu);

  }
  objc_autoreleasePoolPop(v4);
}

void __112__HAPWACAccessoryClient__performEasyConfigWithPairingPrompt_performPairSetup_isSplit_pairingRequest_completion___block_invoke_105(uint64_t a1)
{
  void *v2;
  id v3;
  id v4;
  id v5;

  objc_msgSend(*(id *)(a1 + 32), "server");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "pairingActivity");
  v5 = (id)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    v3 = (id)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(*(id *)(a1 + 32), "state"));
    v4 = (id)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", *(unsigned int *)(a1 + 40));
  }

}

void __112__HAPWACAccessoryClient__performEasyConfigWithPairingPrompt_performPairSetup_isSplit_pairingRequest_completion___block_invoke_109(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  void *v5;
  void *v6;
  id v7;
  NSObject *v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v5 = WeakRetained;
  if (!v3 && WeakRetained)
  {
    v6 = (void *)MEMORY[0x1D17B7244]();
    v7 = v5;
    HMFGetOSLogHandle();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    {
      HMFGetLogIdentifier();
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = 138543362;
      v12 = v9;
      _os_log_impl(&dword_1CCE01000, v8, OS_LOG_TYPE_DEBUG, "%{public}@Restored network", (uint8_t *)&v11, 0xCu);

    }
    objc_autoreleasePoolPop(v6);
    objc_msgSend(v7, "clientDelegate");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "hapWACAccessoryClient:setBonjourInfo:", v7, 0);

    objc_msgSend(v7, "_reportProgress:", 3);
    objc_msgSend(v7, "_performPostConfig");
  }

}

void __112__HAPWACAccessoryClient__performEasyConfigWithPairingPrompt_performPairSetup_isSplit_pairingRequest_completion___block_invoke_2(uint64_t a1)
{
  void *v2;
  id v3;
  void *v4;
  id v5;
  void *v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  id v11;
  void *v12;
  id v13;
  void *v14;
  id v15;
  id v16;

  objc_msgSend(*(id *)(a1 + 32), "server");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "pairingActivity");
  v16 = (id)objc_claimAutoreleasedReturnValue();

  if (v16)
  {
    v3 = (id)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", *(_QWORD *)(a1 + 48));
    v4 = (void *)MEMORY[0x1E0CB37E8];
    objc_msgSend(*(id *)(a1 + 32), "joinLatency");
    v5 = (id)objc_msgSend(v4, "numberWithDouble:");
    v6 = (void *)MEMORY[0x1E0CB37E8];
    objc_msgSend(*(id *)(a1 + 32), "restoreLatency");
    v7 = (id)objc_msgSend(v6, "numberWithDouble:");
    v8 = (void *)MEMORY[0x1E0CB37E8];
    objc_msgSend(*(id *)(a1 + 32), "configurationLatency");
    v9 = (id)objc_msgSend(v8, "numberWithDouble:");
    v10 = (void *)MEMORY[0x1E0CB37E8];
    objc_msgSend(*(id *)(a1 + 32), "preConfigDiscoveryTime");
    v11 = (id)objc_msgSend(v10, "numberWithDouble:");
    v12 = (void *)MEMORY[0x1E0CB37E8];
    objc_msgSend(*(id *)(a1 + 32), "postConfigDiscoveryTime");
    v13 = (id)objc_msgSend(v12, "numberWithDouble:");
    v14 = (void *)MEMORY[0x1E0CB37E8];
    objc_msgSend(*(id *)(a1 + 32), "setupCodeDelay");
    v15 = (id)objc_msgSend(v14, "numberWithDouble:");
    objc_msgSend(*(id *)(a1 + 40), "domain");

    objc_msgSend(*(id *)(a1 + 40), "code");
  }

}

void __110__HAPWACAccessoryClient_performEasyConfigWithParingPrompt_performPairSetup_isSplit_pairingRequest_completion___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  id v8;
  _QWORD v9[4];
  id v10;
  id v11;
  id v12;
  id location;

  objc_msgSend(*(id *)(a1 + 32), "setState:", 5);
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_initWeak(&location, *(id *)(a1 + 32));
  v3 = *(_QWORD *)(a1 + 56);
  v4 = *(unsigned __int8 *)(a1 + 64);
  v5 = *(unsigned __int8 *)(a1 + 65);
  v6 = *(void **)(a1 + 32);
  v7 = *(_QWORD *)(a1 + 40);
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __110__HAPWACAccessoryClient_performEasyConfigWithParingPrompt_performPairSetup_isSplit_pairingRequest_completion___block_invoke_2;
  v9[3] = &unk_1E894A548;
  objc_copyWeak(&v12, &location);
  v8 = v2;
  v10 = v8;
  v11 = *(id *)(a1 + 48);
  objc_msgSend(v6, "_performEasyConfigWithPairingPrompt:performPairSetup:isSplit:pairingRequest:completion:", v3, v4, v5, v7, v9);

  objc_destroyWeak(&v12);
  objc_destroyWeak(&location);

}

void __110__HAPWACAccessoryClient_performEasyConfigWithParingPrompt_performPairSetup_isSplit_pairingRequest_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id WeakRetained;
  uint64_t v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  id v9;

  v9 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    if (v9)
      v4 = 1;
    else
      v4 = 9;
    objc_msgSend(WeakRetained, "setState:", v4);
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "timeIntervalSinceDate:", *(_QWORD *)(a1 + 32));
    v7 = v6;
    objc_msgSend(WeakRetained, "configurationLatency");
    objc_msgSend(WeakRetained, "setConfigurationLatency:", v7 + v8);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithHMErrorCode:", 20);
    v5 = v9;
    v9 = (id)objc_claimAutoreleasedReturnValue();
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

void __55__HAPWACAccessoryClient__restoreNetworkWithCompletion___block_invoke(uint64_t a1, int a2)
{
  void *v4;
  id v5;
  NSObject *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  NSObject *v14;
  void *v15;
  uint8_t buf[4];
  void *v17;
  __int16 v18;
  uint64_t v19;
  __int16 v20;
  int v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v4 = (void *)MEMORY[0x1D17B7244]();
  v5 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = *(_QWORD *)(a1 + 40);
    *(_DWORD *)buf = 138543874;
    v17 = v7;
    v18 = 2112;
    v19 = v8;
    v20 = 1024;
    v21 = a2;
    _os_log_impl(&dword_1CCE01000, v6, OS_LOG_TYPE_INFO, "%{public}@Restored to network %@ with status: %d", buf, 0x1Cu);

  }
  objc_autoreleasePoolPop(v4);
  if (a2)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("HAPErrorDomain"), 26, 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v10 = (void *)WiFiCopyCurrentNetworkInfoEx();
    objc_msgSend(v10, "hmf_stringForKey:", CFSTR("ssid"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(*(id *)(a1 + 40), "isEqual:", v11) & 1) != 0)
    {
      v9 = 0;
    }
    else
    {
      v12 = (void *)MEMORY[0x1D17B7244]();
      v13 = *(id *)(a1 + 32);
      HMFGetOSLogHandle();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v17 = v15;
        _os_log_impl(&dword_1CCE01000, v14, OS_LOG_TYPE_ERROR, "%{public}@Restored network does not match - indicating join failure", buf, 0xCu);

      }
      objc_autoreleasePoolPop(v12);
      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("HAPErrorDomain"), 26, 0);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
    }

  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();

}

void __54__HAPWACAccessoryClient_restoreNetworkWithCompletion___block_invoke(id *a1)
{
  uint64_t v2;
  void *v3;
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;
  id v8;
  id v9;
  _QWORD v10[4];
  id v11;
  id v12;
  id location;

  objc_initWeak(&location, a1[4]);
  v2 = MEMORY[0x1E0C809B0];
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __54__HAPWACAccessoryClient_restoreNetworkWithCompletion___block_invoke_2;
  v10[3] = &unk_1E894AA60;
  objc_copyWeak(&v12, &location);
  v11 = a1[6];
  v3 = (void *)MEMORY[0x1D17B7400](v10);
  objc_msgSend(a1[4], "setState:", 4);
  v4 = a1[4];
  v6[0] = v2;
  v6[1] = 3221225472;
  v6[2] = __54__HAPWACAccessoryClient_restoreNetworkWithCompletion___block_invoke_4;
  v6[3] = &unk_1E894A548;
  objc_copyWeak(&v9, &location);
  v5 = v3;
  v8 = v5;
  v7 = a1[5];
  objc_msgSend(v4, "_restoreNetworkWithCompletion:", v6);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&v12);
  objc_destroyWeak(&location);
}

void __54__HAPWACAccessoryClient_restoreNetworkWithCompletion___block_invoke_2(uint64_t a1, void *a2)
{
  id WeakRetained;
  void *v4;
  uint64_t v5;
  id v6;
  _QWORD v7[6];

  v6 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v4 = WeakRetained;
  if (WeakRetained)
  {
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __54__HAPWACAccessoryClient_restoreNetworkWithCompletion___block_invoke_3;
    v7[3] = &unk_1E894E0F8;
    v7[4] = WeakRetained;
    v7[5] = v6;
    __54__HAPWACAccessoryClient_restoreNetworkWithCompletion___block_invoke_3((uint64_t)v7);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithHMErrorCode:", 20);
    v5 = objc_claimAutoreleasedReturnValue();

    v6 = (id)v5;
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

void __54__HAPWACAccessoryClient_restoreNetworkWithCompletion___block_invoke_4(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  void *v5;
  double v6;
  double v7;
  double v8;
  void *v9;
  id v10;
  NSObject *v11;
  void *v12;
  dispatch_time_t v13;
  NSObject *v14;
  uint64_t v15;
  void *v16;
  _QWORD block[5];
  id v18;
  id v19;
  uint8_t buf[4];
  void *v21;
  __int16 v22;
  id v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "timeIntervalSinceDate:", *(_QWORD *)(a1 + 32));
    v7 = v6;
    objc_msgSend(WeakRetained, "restoreLatency");
    objc_msgSend(WeakRetained, "setRestoreLatency:", v7 + v8);

    if (v3)
    {
      v9 = (void *)MEMORY[0x1D17B7244](objc_msgSend(WeakRetained, "setRetryCount:", objc_msgSend(WeakRetained, "retryCount") + 1));
      v10 = WeakRetained;
      HMFGetOSLogHandle();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
      {
        HMFGetLogIdentifier();
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v21 = v12;
        v22 = 2112;
        v23 = v3;
        _os_log_impl(&dword_1CCE01000, v11, OS_LOG_TYPE_DEBUG, "%{public}@Retrying restore after 5 sec on error: %@", buf, 0x16u);

      }
      objc_autoreleasePoolPop(v9);
      v13 = dispatch_time(0, 5000000000);
      objc_msgSend(v10, "workQueue");
      v14 = objc_claimAutoreleasedReturnValue();
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __54__HAPWACAccessoryClient_restoreNetworkWithCompletion___block_invoke_77;
      block[3] = &unk_1E894DC48;
      block[4] = v10;
      objc_copyWeak(&v19, (id *)(a1 + 48));
      v18 = *(id *)(a1 + 40);
      dispatch_after(v13, v14, block);

      objc_destroyWeak(&v19);
    }
    else
    {
      objc_msgSend(WeakRetained, "_callRestoreCompletion:withError:", *(_QWORD *)(a1 + 40), 0);
    }
  }
  else
  {
    v15 = *(_QWORD *)(a1 + 40);
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithHMErrorCode:", 20);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *))(v15 + 16))(v15, v16);

  }
}

void __54__HAPWACAccessoryClient_restoreNetworkWithCompletion___block_invoke_77(uint64_t a1)
{
  void *v2;
  _QWORD v3[4];
  id v4;
  id v5;

  v2 = *(void **)(a1 + 32);
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __54__HAPWACAccessoryClient_restoreNetworkWithCompletion___block_invoke_2_78;
  v3[3] = &unk_1E894AA60;
  objc_copyWeak(&v5, (id *)(a1 + 48));
  v4 = *(id *)(a1 + 40);
  objc_msgSend(v2, "_restoreNetworkWithCompletion:", v3);

  objc_destroyWeak(&v5);
}

void __54__HAPWACAccessoryClient_restoreNetworkWithCompletion___block_invoke_2_78(uint64_t a1, void *a2)
{
  id WeakRetained;
  void *v4;
  uint64_t v5;
  void *v6;
  id v7;

  v7 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v4 = WeakRetained;
  v5 = *(_QWORD *)(a1 + 32);
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "_callRestoreCompletion:withError:", v5, v7);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithHMErrorCode:", 20);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *))(v5 + 16))(v5, v6);

  }
}

void __54__HAPWACAccessoryClient_restoreNetworkWithCompletion___block_invoke_3(uint64_t a1)
{
  void *v2;
  id v3;
  void *v4;
  id v5;
  id v6;
  id v7;

  objc_msgSend(*(id *)(a1 + 32), "server");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "pairingActivity");
  v7 = (id)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    v3 = (id)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(*(id *)(a1 + 32), "state"));
    v4 = (void *)MEMORY[0x1E0CB37E8];
    objc_msgSend(*(id *)(a1 + 32), "restoreLatency");
    v5 = (id)objc_msgSend(v4, "numberWithDouble:");
    v6 = (id)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(*(id *)(a1 + 32), "retryCount"));
    objc_msgSend(*(id *)(a1 + 40), "domain");

    objc_msgSend(*(id *)(a1 + 40), "code");
  }

}

void __61__HAPWACAccessoryClient__joinAccessoryNetworkWithCompletion___block_invoke(uint64_t a1, int a2)
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  NSObject *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  id v18;
  uint8_t buf[4];
  void *v20;
  __int16 v21;
  void *v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v3 = *(void **)(a1 + 32);
  if (a2)
  {
    objc_msgSend(*(id *)(a1 + 32), "hapWACAccessory");
    v18 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "_joinAccessory:completion:");

  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "_findCompatiblePrefixedNetworks");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "setCompatiblePrefixedNetwork:", v4);

    objc_msgSend(*(id *)(a1 + 32), "compatiblePrefixedNetwork");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    v6 = (void *)MEMORY[0x1D17B7244]();
    v7 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = v8;
    if (v5)
    {
      if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(a1 + 32), "compatiblePrefixedNetwork");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("ssid"));
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v20 = v10;
        v21 = 2112;
        v22 = v12;
        _os_log_impl(&dword_1CCE01000, v9, OS_LOG_TYPE_INFO, "%{public}@Found compatible prefixed network: %@", buf, 0x16u);

      }
      objc_autoreleasePoolPop(v6);
      v13 = *(void **)(a1 + 32);
      objc_msgSend(v13, "hapWACAccessory");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "_joinAccessory:completion:", v14, *(_QWORD *)(a1 + 40));

    }
    else
    {
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v20 = v15;
        _os_log_impl(&dword_1CCE01000, v9, OS_LOG_TYPE_ERROR, "%{public}@No compatible network found", buf, 0xCu);

      }
      objc_autoreleasePoolPop(v6);
      v16 = *(_QWORD *)(a1 + 40);
      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("HAPErrorDomain"), 20, 0);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      (*(void (**)(uint64_t, void *))(v16 + 16))(v16, v17);

    }
  }
}

void __60__HAPWACAccessoryClient_joinAccessoryNetworkWithCompletion___block_invoke(uint64_t a1)
{
  id *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  NSObject *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  _QWORD v15[4];
  id v16;
  id v17;
  id v18;
  int v19;
  _QWORD v20[4];
  id v21;
  id v22;
  id location;
  uint8_t buf[4];
  id v25;
  __int16 v26;
  void *v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v2 = (id *)(a1 + 32);
  objc_initWeak(&location, *(id *)(a1 + 32));
  v3 = MEMORY[0x1E0C809B0];
  v20[0] = MEMORY[0x1E0C809B0];
  v20[1] = 3221225472;
  v20[2] = __60__HAPWACAccessoryClient_joinAccessoryNetworkWithCompletion___block_invoke_2;
  v20[3] = &unk_1E894AA60;
  objc_copyWeak(&v22, &location);
  v21 = *(id *)(a1 + 40);
  v4 = (void *)MEMORY[0x1D17B7400](v20);
  v19 = 0;
  objc_msgSend(*v2, "setState:", 2);
  objc_msgSend(*(id *)(a1 + 32), "setRetryCount:", 0);
  v5 = (void *)WiFiCopyCurrentNetworkInfoEx();
  objc_msgSend(*(id *)(a1 + 32), "setCurrentNetworkInfo:", v5);

  v6 = (void *)MEMORY[0x1D17B7244]();
  v7 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v8 = (id)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    HMFGetLogIdentifier();
    v9 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "currentNetworkInfo");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "hmf_stringForKey:", CFSTR("ssid"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v25 = v9;
    v26 = 2112;
    v27 = v11;
    _os_log_impl(&dword_1CCE01000, v8, OS_LOG_TYPE_DEBUG, "%{public}@Saving current network: %@", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v6);
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = *(void **)(a1 + 32);
  v15[0] = v3;
  v15[1] = 3221225472;
  v15[2] = __60__HAPWACAccessoryClient_joinAccessoryNetworkWithCompletion___block_invoke_69;
  v15[3] = &unk_1E894A548;
  objc_copyWeak(&v18, &location);
  v17 = v4;
  v14 = v12;
  v16 = v14;
  objc_msgSend(v13, "_joinAccessoryNetworkWithCompletion:", v15);

  objc_destroyWeak(&v18);
  objc_destroyWeak(&v22);
  objc_destroyWeak(&location);
}

void __60__HAPWACAccessoryClient_joinAccessoryNetworkWithCompletion___block_invoke_2(uint64_t a1, void *a2)
{
  id WeakRetained;
  void *v4;
  uint64_t v5;
  id v6;
  _QWORD v7[6];

  v6 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v4 = WeakRetained;
  if (WeakRetained)
  {
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __60__HAPWACAccessoryClient_joinAccessoryNetworkWithCompletion___block_invoke_3;
    v7[3] = &unk_1E894E0F8;
    v7[4] = WeakRetained;
    v7[5] = v6;
    __60__HAPWACAccessoryClient_joinAccessoryNetworkWithCompletion___block_invoke_3((uint64_t)v7);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithHMErrorCode:", 20);
    v5 = objc_claimAutoreleasedReturnValue();

    v6 = (id)v5;
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

void __60__HAPWACAccessoryClient_joinAccessoryNetworkWithCompletion___block_invoke_69(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  void *v5;
  double v6;
  double v7;
  double v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  id v13;
  NSObject *v14;
  void *v15;
  _QWORD v16[4];
  id v17;
  id v18;
  uint8_t buf[4];
  void *v20;
  __int16 v21;
  id v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "timeIntervalSinceDate:", *(_QWORD *)(a1 + 32));
    v7 = v6;
    objc_msgSend(WeakRetained, "joinLatency");
    objc_msgSend(WeakRetained, "setJoinLatency:", v7 + v8);

    if (!v3)
    {
      v9 = 3;
      goto LABEL_9;
    }
    if (objc_msgSend(WeakRetained, "retryCount") || objc_msgSend(v3, "code") == 23 || objc_msgSend(v3, "code") == 34)
    {
      v9 = 1;
LABEL_9:
      objc_msgSend(WeakRetained, "setState:", v9);
      (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
      goto LABEL_10;
    }
    v12 = (void *)MEMORY[0x1D17B7244](objc_msgSend(WeakRetained, "setRetryCount:", objc_msgSend(WeakRetained, "retryCount") + 1));
    v13 = WeakRetained;
    HMFGetOSLogHandle();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
    {
      HMFGetLogIdentifier();
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v20 = v15;
      v21 = 2112;
      v22 = v3;
      _os_log_impl(&dword_1CCE01000, v14, OS_LOG_TYPE_DEBUG, "%{public}@Retrying to join accessory network on error: %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v12);
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = __60__HAPWACAccessoryClient_joinAccessoryNetworkWithCompletion___block_invoke_70;
    v16[3] = &unk_1E894AA60;
    objc_copyWeak(&v18, (id *)(a1 + 48));
    v17 = *(id *)(a1 + 40);
    objc_msgSend(v13, "_joinAccessoryNetworkWithCompletion:", v16);

    objc_destroyWeak(&v18);
  }
  else
  {
    v10 = *(_QWORD *)(a1 + 40);
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithHMErrorCode:", 20);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *))(v10 + 16))(v10, v11);

  }
LABEL_10:

}

void __60__HAPWACAccessoryClient_joinAccessoryNetworkWithCompletion___block_invoke_70(uint64_t a1, void *a2)
{
  id WeakRetained;
  uint64_t v4;
  uint64_t v5;
  id v6;

  v6 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    if (v6)
      v4 = 1;
    else
      v4 = 3;
    objc_msgSend(WeakRetained, "setState:", v4);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithHMErrorCode:", 20);
    v5 = objc_claimAutoreleasedReturnValue();

    v6 = (id)v5;
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

void __60__HAPWACAccessoryClient_joinAccessoryNetworkWithCompletion___block_invoke_3(uint64_t a1)
{
  void *v2;
  id v3;
  void *v4;
  id v5;
  id v6;
  id v7;

  objc_msgSend(*(id *)(a1 + 32), "server");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "pairingActivity");
  v7 = (id)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    v3 = (id)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(*(id *)(a1 + 32), "state"));
    v4 = (void *)MEMORY[0x1E0CB37E8];
    objc_msgSend(*(id *)(a1 + 32), "joinLatency");
    v5 = (id)objc_msgSend(v4, "numberWithDouble:");
    v6 = (id)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(*(id *)(a1 + 32), "retryCount"));
    objc_msgSend(*(id *)(a1 + 40), "domain");

    objc_msgSend(*(id *)(a1 + 40), "code");
  }

}

void __49__HAPWACAccessoryClient__joinCompleteWithStatus___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  void *v5;
  void *v6;
  id v7;
  NSObject *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  id v13;
  NSObject *v14;
  void *v15;
  dispatch_time_t v16;
  NSObject *v17;
  uint64_t v18;
  void *v19;
  _QWORD v20[4];
  id v21;
  id v22;
  _QWORD block[5];
  id v24;
  id v25;
  uint8_t buf[4];
  void *v27;
  __int16 v28;
  uint64_t v29;
  __int16 v30;
  uint64_t v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  v5 = WeakRetained;
  if (WeakRetained)
  {
    v6 = (void *)MEMORY[0x1D17B7244](objc_msgSend(WeakRetained, "setRetryCount:", objc_msgSend(WeakRetained, "retryCount") + 1));
    v7 = v5;
    HMFGetOSLogHandle();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    {
      HMFGetLogIdentifier();
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v7, "retryCount");
      v11 = *(_QWORD *)(a1 + 32);
      *(_DWORD *)buf = 138543874;
      v27 = v9;
      v28 = 2048;
      v29 = v10;
      v30 = 2112;
      v31 = v11;
      _os_log_impl(&dword_1CCE01000, v8, OS_LOG_TYPE_DEBUG, "%{public}@Retrying attempt: %ld to join accessory network on error:%@", buf, 0x20u);

    }
    objc_autoreleasePoolPop(v6);
    if (objc_msgSend(v7, "retryCount") == 3)
    {
      v12 = (void *)MEMORY[0x1D17B7244]();
      v13 = v7;
      HMFGetOSLogHandle();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
      {
        HMFGetLogIdentifier();
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v27 = v15;
        _os_log_impl(&dword_1CCE01000, v14, OS_LOG_TYPE_DEBUG, "%{public}@Last retry attempting after 10 sec", buf, 0xCu);

      }
      objc_autoreleasePoolPop(v12);
      v16 = dispatch_time(0, 10000000000);
      objc_msgSend(v13, "workQueue");
      v17 = objc_claimAutoreleasedReturnValue();
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __49__HAPWACAccessoryClient__joinCompleteWithStatus___block_invoke_59;
      block[3] = &unk_1E894DC48;
      block[4] = v13;
      objc_copyWeak(&v25, (id *)(a1 + 48));
      v24 = *(id *)(a1 + 40);
      dispatch_after(v16, v17, block);

      objc_destroyWeak(&v25);
    }
    else
    {
      v20[0] = MEMORY[0x1E0C809B0];
      v20[1] = 3221225472;
      v20[2] = __49__HAPWACAccessoryClient__joinCompleteWithStatus___block_invoke_3;
      v20[3] = &unk_1E894AA60;
      objc_copyWeak(&v22, (id *)(a1 + 48));
      v21 = *(id *)(a1 + 40);
      objc_msgSend(v7, "_joinAccessoryNetworkWithCompletion:", v20);

      objc_destroyWeak(&v22);
    }
  }
  else
  {
    v18 = *(_QWORD *)(a1 + 40);
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithHMErrorCode:", 20);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *))(v18 + 16))(v18, v19);

  }
}

void __49__HAPWACAccessoryClient__joinCompleteWithStatus___block_invoke_4(uint64_t a1, void *a2)
{
  id WeakRetained;
  void *v4;
  uint64_t v5;
  void *v6;
  id v7;

  v7 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v4 = WeakRetained;
  v5 = *(_QWORD *)(a1 + 32);
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "_callJoinCompletion:withError:", v5, v7);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithHMErrorCode:", 20);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *))(v5 + 16))(v5, v6);

  }
}

void __49__HAPWACAccessoryClient__joinCompleteWithStatus___block_invoke_59(uint64_t a1)
{
  void *v2;
  _QWORD v3[4];
  id v4;
  id v5;

  v2 = *(void **)(a1 + 32);
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __49__HAPWACAccessoryClient__joinCompleteWithStatus___block_invoke_2;
  v3[3] = &unk_1E894AA60;
  objc_copyWeak(&v5, (id *)(a1 + 48));
  v4 = *(id *)(a1 + 40);
  objc_msgSend(v2, "_joinAccessoryNetworkWithCompletion:", v3);

  objc_destroyWeak(&v5);
}

void __49__HAPWACAccessoryClient__joinCompleteWithStatus___block_invoke_3(uint64_t a1, void *a2)
{
  id WeakRetained;
  void *v4;
  uint64_t v5;
  void *v6;
  id v7;

  v7 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v4 = WeakRetained;
  v5 = *(_QWORD *)(a1 + 32);
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "_callJoinCompletion:withError:", v5, v7);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithHMErrorCode:", 20);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *))(v5 + 16))(v5, v6);

  }
}

void __49__HAPWACAccessoryClient__joinCompleteWithStatus___block_invoke_2(uint64_t a1, void *a2)
{
  id WeakRetained;
  void *v4;
  uint64_t v5;
  void *v6;
  id v7;

  v7 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v4 = WeakRetained;
  v5 = *(_QWORD *)(a1 + 32);
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "_callJoinCompletion:withError:", v5, v7);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithHMErrorCode:", 20);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *))(v5 + 16))(v5, v6);

  }
}

id __44__HAPWACAccessoryClient_dumpStatsWithError___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  __CFString *v16;
  void *v17;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  _QWORD v24[11];
  _QWORD v25[13];

  v25[11] = *MEMORY[0x1E0C80C00];
  v24[0] = CFSTR("accessoryName");
  objc_msgSend(*(id *)(a1 + 32), "hapWACAccessory");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "name");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v25[0] = v22;
  v24[1] = CFSTR("deviceId");
  objc_msgSend(*(id *)(a1 + 32), "hapWACAccessory");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "deviceId");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v25[1] = v20;
  v24[2] = CFSTR("joinLatency");
  v2 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(*(id *)(a1 + 32), "joinLatency");
  objc_msgSend(v2, "numberWithDouble:");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v25[2] = v19;
  v24[3] = CFSTR("restoreLatency");
  v3 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(*(id *)(a1 + 32), "restoreLatency");
  objc_msgSend(v3, "numberWithDouble:");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v25[3] = v4;
  v24[4] = CFSTR("configurationLatency");
  v5 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(*(id *)(a1 + 32), "configurationLatency");
  objc_msgSend(v5, "numberWithDouble:");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v25[4] = v6;
  v24[5] = CFSTR("preConfigDiscoveryTime");
  v7 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(*(id *)(a1 + 32), "preConfigDiscoveryTime");
  objc_msgSend(v7, "numberWithDouble:");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v25[5] = v8;
  v24[6] = CFSTR("postConfigDiscoveryTime");
  v9 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(*(id *)(a1 + 32), "postConfigDiscoveryTime");
  objc_msgSend(v9, "numberWithDouble:");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v25[6] = v10;
  v24[7] = CFSTR("setupCodeDelay");
  v11 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(*(id *)(a1 + 32), "setupCodeDelay");
  objc_msgSend(v11, "numberWithDouble:");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v25[7] = v12;
  v24[8] = CFSTR("retryCount");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(*(id *)(a1 + 32), "retryCount"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v25[8] = v13;
  v24[9] = CFSTR("errorCode");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(*(id *)(a1 + 40), "code"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v25[9] = v14;
  v24[10] = CFSTR("errorDescription");
  objc_msgSend(*(id *)(a1 + 40), "description");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (v15)
  {
    objc_msgSend(*(id *)(a1 + 40), "description");
    v16 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v16 = &stru_1E894EFE8;
  }
  v25[10] = v16;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v25, v24, 11);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  if (v15)

  return v17;
}

void __84__HAPWACAccessoryClient_initWithWACAccessory_server_browser_compatible2Pt4Networks___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  id v4;
  id v5;
  id v6;
  id v7;
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;

  objc_msgSend(*(id *)(a1 + 32), "server");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "pairingActivity");
  v13 = (id)objc_claimAutoreleasedReturnValue();

  if (v13)
  {
    objc_msgSend(*(id *)(a1 + 40), "wacCategory");

    v3 = (id)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(*(id *)(a1 + 40), "version"));
    objc_msgSend(*(id *)(a1 + 40), "supportsLegacyWAC");
    v4 = (id)HMFBooleanToString();
    v5 = HAPAuthFeaturesToString(objc_msgSend(*(id *)(a1 + 40), "authFeatures"));
    objc_msgSend(*(id *)(a1 + 40), "supportedWiFiBands");
    v6 = (id)HMFBooleanToString();
    objc_msgSend(*(id *)(a1 + 40), "supportedWiFiBands");
    v7 = (id)HMFBooleanToString();
    objc_msgSend(*(id *)(a1 + 40), "supportsTokenAuth");
    v8 = (id)HMFBooleanToString();
    objc_msgSend(*(id *)(a1 + 40), "supportsCertAuth");
    v9 = (id)HMFBooleanToString();
    objc_msgSend(*(id *)(a1 + 40), "isAirPlayAccessory");
    v10 = (id)HMFBooleanToString();
    objc_msgSend(*(id *)(a1 + 40), "isHomeKitAccessory");
    v11 = (id)HMFBooleanToString();
    objc_msgSend(*(id *)(a1 + 40), "requiresOwnershipToken");
    v12 = (id)HMFBooleanToString();
  }

}

+ (id)logCategory
{
  if (logCategory__hmf_once_t48 != -1)
    dispatch_once(&logCategory__hmf_once_t48, &__block_literal_global_5574);
  return (id)logCategory__hmf_once_v49;
}

void __36__HAPWACAccessoryClient_logCategory__block_invoke()
{
  uint64_t v0;
  void *v1;

  HMFCreateOSLogHandle();
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)logCategory__hmf_once_v49;
  logCategory__hmf_once_v49 = v0;

}

@end
