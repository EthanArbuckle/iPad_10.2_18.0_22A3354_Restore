@implementation AMSNetworkQualityInquiry

uint64_t __47__AMSNetworkQualityInquiry_investigateNetworks__block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(a1 + 32), "finishWithResult:error:", a2, a3);
}

uint64_t __64__AMSNetworkQualityInquiry_reportForTaskTimingData_fromReports___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;

  objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("interface"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqualToString:", *(_QWORD *)(a1 + 32));

  return v4;
}

void __63__AMSNetworkQualityInquiry_updateLastConnectionReportWithTask___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  void *v3;
  void *v4;
  void *v5;

  if (!a3)
  {
    objc_msgSend(*(id *)(a1 + 40), "reportForTaskTimingData:fromReports:", *(_QWORD *)(a1 + 32), a2);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if (v3)
    {
      v5 = v3;
      objc_storeStrong((id *)&kLastConnectionReport, v3);
      objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "postNotificationName:object:", CFSTR("AMSLastConnectionReportChangedNotification"), v5);

      v3 = v5;
    }

  }
}

+ (id)reportForTaskTimingData:(id)a3 fromReports:(id)a4
{
  id v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  __CFString *v11;
  _QWORD v13[4];
  __CFString *v14;

  v5 = a4;
  objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("_kCFNTimingDataConnectionInterfaceIdentifier"));
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = (void *)v6;
  v8 = 0;
  if (v5 && v6)
  {
    v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CCEC88]), "initWithInterfaceName:", v6);
    v10 = objc_msgSend(v9, "type");
    if ((unint64_t)(v10 - 1) > 2)
    {
      v8 = 0;
    }
    else
    {
      v11 = off_1E2544338[v10 - 1];
      v13[0] = MEMORY[0x1E0C809B0];
      v13[1] = 3221225472;
      v13[2] = __64__AMSNetworkQualityInquiry_reportForTaskTimingData_fromReports___block_invoke;
      v13[3] = &unk_1E25442F0;
      v14 = v11;
      objc_msgSend(v5, "ams_firstObjectPassingTest:", v13);
      v8 = (void *)objc_claimAutoreleasedReturnValue();

    }
  }

  return v8;
}

+ (void)updateLastConnectionReportWithTask:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  _QWORD v10[4];
  id v11;
  id v12;

  v4 = a3;
  objc_msgSend(a1, "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    objc_msgSend(v4, "_timingData");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "sharedInstance");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "investigateNetworks");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __63__AMSNetworkQualityInquiry_updateLastConnectionReportWithTask___block_invoke;
    v10[3] = &unk_1E2544318;
    v11 = v6;
    v12 = a1;
    v9 = v6;
    objc_msgSend(v8, "addFinishBlock:", v10);

  }
}

+ (AMSNetworkQualityInquiry)sharedInstance
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __42__AMSNetworkQualityInquiry_sharedInstance__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (qword_1ECEAD798 != -1)
    dispatch_once(&qword_1ECEAD798, block);
  return (AMSNetworkQualityInquiry *)(id)_MergedGlobals_135;
}

- (id)investigateNetworks
{
  AMSMutablePromise *v3;
  AMSMutablePromise *v4;
  AMSMutablePromise *v5;
  AMSMutablePromise *v6;
  _QWORD v8[5];
  AMSMutablePromise *v9;

  v3 = objc_alloc_init(AMSMutablePromise);
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __47__AMSNetworkQualityInquiry_investigateNetworks__block_invoke;
  v8[3] = &unk_1E25442C8;
  v8[4] = self;
  v4 = v3;
  v9 = v4;
  -[AMSNetworkQualityInquiry performWhenKnownNetworksReady:](self, "performWhenKnownNetworksReady:", v8);
  v5 = v9;
  v6 = v4;

  return v6;
}

- (void)performWhenKnownNetworksReady:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  -[AMSNetworkQualityInquiry queue](self, "queue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __58__AMSNetworkQualityInquiry_performWhenKnownNetworksReady___block_invoke;
  v7[3] = &unk_1E253DC28;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, v7);

}

- (void)drainKnownNetworksReadyHandlers
{
  NSObject *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  -[AMSNetworkQualityInquiry queue](self, "queue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  v11 = 0u;
  v12 = 0u;
  v9 = 0u;
  v10 = 0u;
  -[AMSNetworkQualityInquiry knownNetworksReadyHandlers](self, "knownNetworksReadyHandlers", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v10;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v10 != v7)
          objc_enumerationMutation(v4);
        (*(void (**)(void))(*(_QWORD *)(*((_QWORD *)&v9 + 1) + 8 * v8++) + 16))();
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v6);
  }

  -[AMSNetworkQualityInquiry setKnownNetworksReadyHandlers:](self, "setKnownNetworksReadyHandlers:", 0);
}

void __47__AMSNetworkQualityInquiry_investigateNetworks__block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  double v5;
  double v6;
  uint64_t v7;
  id v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  AMSMutablePromise *v17;
  void *v18;
  AMSMutablePromise *v19;
  void *v20;
  id v21;
  uint64_t v22;
  id obj;
  id v24;
  _QWORD v25[5];
  id v26;
  _QWORD v27[5];
  id v28;
  AMSMutablePromise *v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  _QWORD v34[4];
  id v35;
  _BYTE v36[128];
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v24 = a2;
  v3 = *(void **)(*(_QWORD *)(a1 + 32) + 24);
  if (v3)
  {
    v34[0] = MEMORY[0x1E0C809B0];
    v34[1] = 3221225472;
    v34[2] = __47__AMSNetworkQualityInquiry_investigateNetworks__block_invoke_2;
    v34[3] = &unk_1E25425C0;
    v35 = *(id *)(a1 + 40);
    objc_msgSend(v3, "addFinishBlock:", v34);

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "timeIntervalSince1970");
    v6 = v5;

    v7 = *(_QWORD *)(a1 + 32);
    if (*(_QWORD *)(v7 + 8) && (uint64_t)(v6 * 1000.0) - *(_QWORD *)(v7 + 16) <= 999)
    {
      objc_msgSend(*(id *)(a1 + 40), "finishWithResult:");
    }
    else
    {
      v22 = a1;
      v8 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      objc_msgSend(v24, "knownNetworks");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v9, "count");

      v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", v10);
      v30 = 0u;
      v31 = 0u;
      v32 = 0u;
      v33 = 0u;
      objc_msgSend(v24, "knownNetworks");
      obj = (id)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v30, v36, 16);
      if (v12)
      {
        v13 = v12;
        v14 = *(_QWORD *)v31;
        do
        {
          v15 = 0;
          do
          {
            if (*(_QWORD *)v31 != v14)
              objc_enumerationMutation(obj);
            v16 = *(_QWORD *)(*((_QWORD *)&v30 + 1) + 8 * v15);
            v17 = objc_alloc_init(AMSMutablePromise);
            objc_msgSend(v8, "addObject:", v17);
            objc_msgSend(v24, "manager");
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            v27[0] = MEMORY[0x1E0C809B0];
            v27[1] = 3221225472;
            v27[2] = __47__AMSNetworkQualityInquiry_investigateNetworks__block_invoke_3;
            v27[3] = &unk_1E2543F08;
            v27[4] = v16;
            v28 = v11;
            v29 = v17;
            v19 = v17;
            objc_msgSend(v18, "auditableLinkQualityForNOI:reply:", v16, v27);

            ++v15;
          }
          while (v13 != v15);
          v13 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v30, v36, 16);
        }
        while (v13);
      }

      +[AMSPromise promiseWithAll:](AMSPromise, "promiseWithAll:", v8);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v25[0] = MEMORY[0x1E0C809B0];
      v25[1] = 3221225472;
      v25[2] = __47__AMSNetworkQualityInquiry_investigateNetworks__block_invoke_42;
      v25[3] = &unk_1E25442A0;
      v25[4] = *(_QWORD *)(v22 + 32);
      v26 = v11;
      v21 = v11;
      objc_msgSend(v20, "addFinishBlock:", v25);
      objc_storeStrong((id *)(*(_QWORD *)(v22 + 32) + 24), *(id *)(v22 + 40));

    }
  }

}

- (NWNetworkOfInterestManager)manager
{
  return self->_manager;
}

- (void)didStartTrackingNOI:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  -[AMSNetworkQualityInquiry knownNetworks](self, "knownNetworks");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObject:", v4);

  if (-[AMSNetworkQualityInquiry areKnownNetworksReady](self, "areKnownNetworksReady"))
    -[AMSNetworkQualityInquiry drainKnownNetworksReadyHandlers](self, "drainKnownNetworksReadyHandlers");
}

- (BOOL)areKnownNetworksReady
{
  NSObject *v3;
  void *v4;

  -[AMSNetworkQualityInquiry queue](self, "queue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  -[AMSNetworkQualityInquiry knownNetworks](self, "knownNetworks");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v3) = objc_msgSend(v4, "count") == 3;

  return (char)v3;
}

- (NSMutableSet)knownNetworks
{
  return self->_knownNetworks;
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

void __58__AMSNetworkQualityInquiry_performWhenKnownNetworksReady___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  if (objc_msgSend(*(id *)(a1 + 32), "areKnownNetworksReady"))
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "knownNetworksReadyHandlers");
    v2 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v2)
    {
      v3 = *(void **)(a1 + 32);
      v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", 1);
      objc_msgSend(v3, "setKnownNetworksReadyHandlers:", v4);

    }
    objc_msgSend(*(id *)(a1 + 32), "knownNetworksReadyHandlers");
    v7 = (id)objc_claimAutoreleasedReturnValue();
    v5 = (void *)objc_msgSend(*(id *)(a1 + 40), "copy");
    v6 = _Block_copy(v5);
    objc_msgSend(v7, "addObject:", v6);

  }
}

- (NSMutableArray)knownNetworksReadyHandlers
{
  return self->_knownNetworksReadyHandlers;
}

- (void)setKnownNetworksReadyHandlers:(id)a3
{
  objc_storeStrong((id *)&self->_knownNetworksReadyHandlers, a3);
}

void __42__AMSNetworkQualityInquiry_sharedInstance__block_invoke()
{
  AMSNetworkQualityInquiry *v0;
  void *v1;
  void *v2;
  NSObject *v3;
  id v4;
  int v5;
  id v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v0 = objc_alloc_init(AMSNetworkQualityInquiry);
  v1 = (void *)_MergedGlobals_135;
  _MergedGlobals_135 = (uint64_t)v0;

  if (!_MergedGlobals_135)
  {
    +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v2)
    {
      +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
      v2 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v2, "OSLogObject");
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      v5 = 138543362;
      v6 = (id)objc_opt_class();
      v4 = v6;
      _os_log_impl(&dword_18C849000, v3, OS_LOG_TYPE_DEFAULT, "%{public}@: The network quality inquiry failed to initialize.", (uint8_t *)&v5, 0xCu);

    }
  }
}

- (AMSNetworkQualityInquiry)init
{
  AMSNetworkQualityInquiry *v3;
  NWNetworkOfInterestManager *v4;
  NWNetworkOfInterestManager *manager;
  dispatch_queue_t v6;
  OS_dispatch_queue *queue;
  NSMutableSet *v8;
  NSMutableSet *knownNetworks;
  void *v10;
  NSObject *v11;
  id v12;
  AMSNetworkQualityInquiry *v13;
  objc_super v15;
  uint8_t buf[4];
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  if (+[AMSNetworkQualityInquiry isEntitled](AMSNetworkQualityInquiry, "isEntitled"))
  {
    v15.receiver = self;
    v15.super_class = (Class)AMSNetworkQualityInquiry;
    v3 = -[AMSNetworkQualityInquiry init](&v15, sel_init);
    if (v3)
    {
      v4 = (NWNetworkOfInterestManager *)objc_alloc_init(MEMORY[0x1E0DB0688]);
      manager = v3->_manager;
      v3->_manager = v4;

      if (!v3->_manager)
      {
        v13 = 0;
        goto LABEL_11;
      }
      v6 = dispatch_queue_create("com.apple.AppleMediaServices.NetworkQualityInquiry.queue", 0);
      queue = v3->_queue;
      v3->_queue = (OS_dispatch_queue *)v6;

      -[NWNetworkOfInterestManager setQueue:](v3->_manager, "setQueue:", v3->_queue);
      -[NWNetworkOfInterestManager setDelegate:](v3->_manager, "setDelegate:", v3);
      v8 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E0C99E20]);
      knownNetworks = v3->_knownNetworks;
      v3->_knownNetworks = v8;

      -[NWNetworkOfInterestManager trackNOIAnyForInterfaceType:options:](v3->_manager, "trackNOIAnyForInterfaceType:options:", 2, 0);
      -[NWNetworkOfInterestManager trackNOIAnyForInterfaceType:options:](v3->_manager, "trackNOIAnyForInterfaceType:options:", 1, 0);
      -[NWNetworkOfInterestManager trackNOIAnyForInterfaceType:options:](v3->_manager, "trackNOIAnyForInterfaceType:options:", 3, 0);
    }
  }
  else
  {
    +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v10)
    {
      +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v10, "OSLogObject");
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      v17 = (id)objc_opt_class();
      v12 = v17;
      _os_log_impl(&dword_18C849000, v11, OS_LOG_TYPE_ERROR, "%{public}@: Missing entitlements to perform network quality inquiry.", buf, 0xCu);

    }
    v3 = 0;
  }
  v3 = v3;
  v13 = v3;
LABEL_11:

  return v13;
}

+ (BOOL)isEntitled
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char v5;
  uint64_t i;
  const __CFString *v7;
  __SecTask *v8;
  __SecTask *v9;
  CFTypeRef v10;
  BOOL v11;
  CFErrorRef error;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v2 = objc_msgSend(&unk_1E25B0158, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (!v2)
    return 1;
  v3 = v2;
  v4 = *(_QWORD *)v15;
  v5 = 1;
  do
  {
    for (i = 0; i != v3; ++i)
    {
      if (*(_QWORD *)v15 != v4)
        objc_enumerationMutation(&unk_1E25B0158);
      v7 = *(const __CFString **)(*((_QWORD *)&v14 + 1) + 8 * i);
      v8 = SecTaskCreateFromSelf(0);
      if (v8)
      {
        v9 = v8;
        error = 0;
        v10 = SecTaskCopyValueForEntitlement(v8, v7, &error);
        if (error)
          CFRelease(error);
        v11 = v10 != 0;
        if (v10)
          CFRelease(v10);
        CFRelease(v9);
      }
      else
      {
        v11 = 0;
      }
      v5 &= v11;
    }
    v3 = objc_msgSend(&unk_1E25B0158, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  }
  while (v3);
  return v5;
}

- (void)dealloc
{
  objc_super v3;

  -[NWNetworkOfInterestManager setDelegate:](self->_manager, "setDelegate:", 0);
  -[NWNetworkOfInterestManager destroy](self->_manager, "destroy");
  v3.receiver = self;
  v3.super_class = (Class)AMSNetworkQualityInquiry;
  -[AMSNetworkQualityInquiry dealloc](&v3, sel_dealloc);
}

void __47__AMSNetworkQualityInquiry_investigateNetworks__block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  id v8;
  uint64_t v9;
  __CFString *v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  NSObject *v15;
  uint64_t v16;
  _BYTE v17[24];
  void *v18;
  id v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  v7 = *(void **)(a1 + 32);
  v8 = v5;
  if (v8 && (v9 = objc_msgSend(v7, "interface"), (unint64_t)(v9 - 1) <= 2))
  {
    v10 = off_1E2544338[v9 - 1];
    v11 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    *(_QWORD *)v17 = MEMORY[0x1E0C809B0];
    *(_QWORD *)&v17[8] = 3221225472;
    *(_QWORD *)&v17[16] = __AMSNetworkQualityInquiryReportMake_block_invoke;
    v18 = &unk_1E253EAE8;
    v12 = v11;
    v19 = v12;
    objc_msgSend(v8, "enumerateKeysAndObjectsUsingBlock:", v17);
    if (objc_msgSend(v12, "count", *(_QWORD *)v17, *(_QWORD *)&v17[8], *(_QWORD *)&v17[16], v18))
    {
      objc_msgSend(v12, "setObject:forKeyedSubscript:", v10, CFSTR("interface"));
      v13 = (void *)objc_msgSend(v12, "copy");
    }
    else
    {
      v13 = 0;
    }

    if (v13)
    {
      objc_msgSend(*(id *)(a1 + 40), "addObject:", v13);

    }
  }
  else
  {

  }
  if (v6)
  {
    +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "OSLogObject");
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      v16 = *(_QWORD *)(a1 + 32);
      *(_DWORD *)v17 = 138543618;
      *(_QWORD *)&v17[4] = v16;
      *(_WORD *)&v17[12] = 2112;
      *(_QWORD *)&v17[14] = v6;
      _os_log_impl(&dword_18C849000, v15, OS_LOG_TYPE_ERROR, "Could not determine link quality for %{public}@, reason: %@", v17, 0x16u);
    }

  }
  objc_msgSend(*(id *)(a1 + 48), "finishWithResult:", MEMORY[0x1E0C9AAB0]);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_knownNetworksReadyHandlers, 0);
  objc_storeStrong((id *)&self->_knownNetworks, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_manager, 0);
  objc_storeStrong((id *)&self->_currentInvestigation, 0);
  objc_storeStrong((id *)&self->_lastKnownReports, 0);
}

void __47__AMSNetworkQualityInquiry_investigateNetworks__block_invoke_42(uint64_t a1)
{
  void *v2;
  double v3;
  uint64_t v4;
  void *v5;

  objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 8), *(id *)(a1 + 40));
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "timeIntervalSince1970");
  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 16) = (uint64_t)(v3 * 1000.0);

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "finishWithResult:", *(_QWORD *)(a1 + 40));
  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(void **)(v4 + 24);
  *(_QWORD *)(v4 + 24) = 0;

}

+ (NSDictionary)lastConnectionReport
{
  void *v3;
  void *v4;
  NSObject *v5;
  id v6;
  _QWORD block[5];
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t (*v12)(uint64_t, uint64_t);
  void (*v13)(uint64_t);
  id v14;

  objc_msgSend(a1, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
    return (NSDictionary *)0;
  v9 = 0;
  v10 = &v9;
  v11 = 0x3032000000;
  v12 = __Block_byref_object_copy__52;
  v13 = __Block_byref_object_dispose__52;
  v14 = 0;
  objc_msgSend(a1, "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "queue");
  v5 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __48__AMSNetworkQualityInquiry_lastConnectionReport__block_invoke;
  block[3] = &unk_1E253DDB8;
  block[4] = &v9;
  dispatch_sync(v5, block);

  v6 = (id)v10[5];
  _Block_object_dispose(&v9, 8);

  return (NSDictionary *)v6;
}

void __48__AMSNetworkQualityInquiry_lastConnectionReport__block_invoke(uint64_t a1)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), (id)kLastConnectionReport);
}

- (void)didStopTrackingNOI:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  NSObject *v7;
  void *v8;
  int v9;
  AMSNetworkQualityInquiry *v10;
  __int16 v11;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[AMSNetworkQualityInquiry knownNetworks](self, "knownNetworks");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeObject:", v4);

  +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v6)
  {
    +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v6, "OSLogObject");
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    v9 = 138543618;
    v10 = self;
    v11 = 2112;
    v12 = v4;
    _os_log_impl(&dword_18C849000, v7, OS_LOG_TYPE_DEBUG, "%{public}@: Stopped tracking %@, searching for interface again", (uint8_t *)&v9, 0x16u);
  }

  -[AMSNetworkQualityInquiry manager](self, "manager");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "trackNOIAnyForInterfaceType:options:", objc_msgSend(v4, "interface"), 0);

}

- (void)didStopTrackingAllNOIs:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v10;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v10 != v7)
          objc_enumerationMutation(v4);
        -[AMSNetworkQualityInquiry didStopTrackingNOI:](self, "didStopTrackingNOI:", *(_QWORD *)(*((_QWORD *)&v9 + 1) + 8 * v8++));
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v6);
  }

}

@end
