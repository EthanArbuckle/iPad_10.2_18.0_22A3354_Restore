@implementation HAPAccessoryServerBrowserIP

- (HAPAccessoryServerBrowserIP)initWithQueue:(id)a3
{
  id v4;
  HAPAccessoryServerBrowserIP *v5;
  uint64_t v6;
  NSMutableSet *discoveredAccessoryServers;
  uint64_t v8;
  NSMutableSet *pendingBonjourEvents;
  uint64_t v10;
  HMFTimer *bonjourEventTimer;
  HMFTimer *v12;
  void *v13;
  HAPWACAccessoryBrowser *v14;
  HAPWACAccessoryBrowser *hapWACBrowser;
  NSOperationQueue *v16;
  NSOperationQueue *delegateOperationQueue;
  void *v18;
  void *v19;
  uint64_t v20;
  NSString *serverIdentifierToSkipBonjourUpdate;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  void *v26;
  HAPAccessoryServerBrowserIP *v27;
  NSObject *v28;
  void *v29;
  NSString *v30;
  objc_super v32;
  uint8_t buf[4];
  void *v34;
  __int16 v35;
  NSString *v36;
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v32.receiver = self;
  v32.super_class = (Class)HAPAccessoryServerBrowserIP;
  v5 = -[HAPAccessoryServerBrowser initWithQueue:](&v32, sel_initWithQueue_, v4);
  if (v5)
  {
    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v6 = objc_claimAutoreleasedReturnValue();
    discoveredAccessoryServers = v5->_discoveredAccessoryServers;
    v5->_discoveredAccessoryServers = (NSMutableSet *)v6;

    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v8 = objc_claimAutoreleasedReturnValue();
    pendingBonjourEvents = v5->_pendingBonjourEvents;
    v5->_pendingBonjourEvents = (NSMutableSet *)v8;

    v10 = objc_msgSend(objc_alloc(MEMORY[0x1E0D286C8]), "initWithTimeInterval:options:", 0, 8.0);
    bonjourEventTimer = v5->_bonjourEventTimer;
    v5->_bonjourEventTimer = (HMFTimer *)v10;

    -[HMFTimer setDelegate:](v5->_bonjourEventTimer, "setDelegate:", v5);
    v12 = v5->_bonjourEventTimer;
    -[HAPAccessoryServerBrowser workQueue](v5, "workQueue");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMFTimer setDelegateQueue:](v12, "setDelegateQueue:", v13);

    v14 = -[HAPWACAccessoryBrowser initWithDelegate:queue:]([HAPWACAccessoryBrowser alloc], "initWithDelegate:queue:", v5, v4);
    hapWACBrowser = v5->_hapWACBrowser;
    v5->_hapWACBrowser = v14;

    v16 = (NSOperationQueue *)objc_alloc_init(MEMORY[0x1E0CB3828]);
    delegateOperationQueue = v5->_delegateOperationQueue;
    v5->_delegateOperationQueue = v16;

    -[NSOperationQueue setMaxConcurrentOperationCount:](v5->_delegateOperationQueue, "setMaxConcurrentOperationCount:", 1);
    -[NSOperationQueue setName:](v5->_delegateOperationQueue, "setName:", CFSTR("HAPAccessoryServerBrowserIPDelegateOperationQueue"));
    objc_msgSend(MEMORY[0x1E0D28678], "sharedPreferences");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "preferenceForKey:", CFSTR("HAPServerIPBrowserServerIdentifierToSkipBonjourUpdates"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "stringValue");
    v20 = objc_claimAutoreleasedReturnValue();
    serverIdentifierToSkipBonjourUpdate = v5->_serverIdentifierToSkipBonjourUpdate;
    v5->_serverIdentifierToSkipBonjourUpdate = (NSString *)v20;

    objc_msgSend(MEMORY[0x1E0D28678], "sharedPreferences");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "preferenceForKey:", CFSTR("HAPMaximumConsecutiveIPPairVerifyFailures"));
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "numberValue");
    v24 = (void *)objc_claimAutoreleasedReturnValue();

    if (v24)
      v25 = objc_msgSend(v24, "unsignedIntValue");
    else
      v25 = 2;
    v5->_maximumNumberOfPairVeifiesAllowed = v25;
    if (v5->_serverIdentifierToSkipBonjourUpdate)
    {
      v26 = (void *)MEMORY[0x1D17B7244]();
      v27 = v5;
      HMFGetOSLogHandle();
      v28 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        v30 = v5->_serverIdentifierToSkipBonjourUpdate;
        *(_DWORD *)buf = 138543618;
        v34 = v29;
        v35 = 2112;
        v36 = v30;
        _os_log_impl(&dword_1CCE01000, v28, OS_LOG_TYPE_INFO, "%{public}@Skipping bonjour updates for server with identifier: %@", buf, 0x16u);

      }
      objc_autoreleasePoolPop(v26);
    }

  }
  return v5;
}

- (int64_t)linkType
{
  return 1;
}

- (int)_initializeAndStartBonjourBrowser
{
  void *v3;
  BonjourBrowser **p_bonjourBrowser;
  int v5;
  void *v6;
  _QWORD v8[5];

  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __64__HAPAccessoryServerBrowserIP__initializeAndStartBonjourBrowser__block_invoke;
  v8[3] = &unk_1E894B3A8;
  v8[4] = self;
  v3 = (void *)MEMORY[0x1D17B7400](v8, a2);
  p_bonjourBrowser = &self->_bonjourBrowser;
  if (self->_bonjourBrowser)
  {
    v5 = 0;
  }
  else
  {
    v5 = BonjourBrowser_Create();
    if (v5
      || (-[HAPAccessoryServerBrowser workQueue](self, "workQueue"),
          v6 = (void *)objc_claimAutoreleasedReturnValue(),
          BonjourBrowser_SetDispatchQueue(),
          v6,
          BonjourBrowser_SetEventHandlerBlock(),
          (v5 = BonjourBrowser_Start()) != 0))
    {
      if (*p_bonjourBrowser)
      {
        BonjourBrowser_Stop();
        CFRelease(*p_bonjourBrowser);
        *p_bonjourBrowser = 0;
      }
    }
  }

  return v5;
}

- (void)setDelegate:(id)a3 queue:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  -[HAPAccessoryServerBrowser workQueue](self, "workQueue");
  v8 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __49__HAPAccessoryServerBrowserIP_setDelegate_queue___block_invoke;
  block[3] = &unk_1E894E120;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(v8, block);

}

- (void)startDiscoveringAccessoryServers
{
  NSObject *v3;
  _QWORD block[5];

  -[HAPAccessoryServerBrowser workQueue](self, "workQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __63__HAPAccessoryServerBrowserIP_startDiscoveringAccessoryServers__block_invoke;
  block[3] = &unk_1E894DD08;
  block[4] = self;
  dispatch_async(v3, block);

}

- (void)startDiscoveringWACAccessoryServers
{
  NSObject *v3;
  _QWORD block[5];

  -[HAPAccessoryServerBrowser workQueue](self, "workQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __66__HAPAccessoryServerBrowserIP_startDiscoveringWACAccessoryServers__block_invoke;
  block[3] = &unk_1E894DD08;
  block[4] = self;
  dispatch_async(v3, block);

}

- (void)startDiscoveringWACAccessoryServerWithIdentifier:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  -[HAPAccessoryServerBrowser workQueue](self, "workQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __80__HAPAccessoryServerBrowserIP_startDiscoveringWACAccessoryServerWithIdentifier___block_invoke;
  v7[3] = &unk_1E894E0F8;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, v7);

}

- (void)startDiscoveringAirPlayAccessoriesWithDelegate:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  -[HAPAccessoryServerBrowser workQueue](self, "workQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __78__HAPAccessoryServerBrowserIP_startDiscoveringAirPlayAccessoriesWithDelegate___block_invoke;
  v7[3] = &unk_1E894E0F8;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, v7);

}

- (void)pendDelegateBlock:(id)a3 identifier:(id)a4
{
  void *v6;
  id v7;
  id v8;

  v6 = (void *)MEMORY[0x1E0CB34C8];
  v7 = a4;
  objc_msgSend(v6, "blockOperationWithBlock:", a3);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  -[HAPAccessoryServerBrowserIP pendDelegateOperation:identifier:](self, "pendDelegateOperation:identifier:", v8, v7);

}

- (void)pendDelegateOperation:(id)a3 identifier:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  void *v15;
  int v16;
  void *v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (v7)
  {
    objc_msgSend(v6, "setName:", v7);
    v20 = 0u;
    v21 = 0u;
    v18 = 0u;
    v19 = 0u;
    -[HAPAccessoryServerBrowserIP delegateOperationQueue](self, "delegateOperationQueue", 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "operations");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v19;
      do
      {
        for (i = 0; i != v11; ++i)
        {
          if (*(_QWORD *)v19 != v12)
            objc_enumerationMutation(v9);
          v14 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * i);
          objc_msgSend(v14, "name");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          v16 = objc_msgSend(v15, "isEqualToString:", v7);

          if (v16)
            objc_msgSend(v6, "addDependency:", v14);
        }
        v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
      }
      while (v11);
    }

  }
  -[HAPAccessoryServerBrowserIP delegateOperationQueue](self, "delegateOperationQueue");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "addOperation:", v6);

}

- (void)stopDiscoveringAccessoryServers
{
  NSObject *v3;
  _QWORD block[5];

  -[HAPAccessoryServerBrowser workQueue](self, "workQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __62__HAPAccessoryServerBrowserIP_stopDiscoveringAccessoryServers__block_invoke;
  block[3] = &unk_1E894DD08;
  block[4] = self;
  dispatch_async(v3, block);

}

- (void)stopDiscoveringWACAccessoryServersWithInvalidation:(BOOL)a3
{
  NSObject *v5;
  _QWORD v6[5];
  BOOL v7;

  -[HAPAccessoryServerBrowser workQueue](self, "workQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __82__HAPAccessoryServerBrowserIP_stopDiscoveringWACAccessoryServersWithInvalidation___block_invoke;
  v6[3] = &unk_1E894D770;
  v6[4] = self;
  v7 = a3;
  dispatch_async(v5, v6);

}

- (id)visible2Pt4Networks
{
  void *v2;
  void *v3;

  -[HAPAccessoryServerBrowserIP hapWACBrowser](self, "hapWACBrowser");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "visible2Pt4Networks");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)notifyDelegatesOfWACCompletionWithIdentifier:(id)a3 error:(id)a4
{
  id v6;
  id v7;
  _QWORD v8[5];
  id v9;
  id v10;

  v6 = a3;
  v7 = a4;
  if (-[HAPAccessoryServerBrowserIP _delegateRespondsToSelector:](self, "_delegateRespondsToSelector:", sel_accessoryServerBrowser_didFinishWACForAccessoryWithIdentifier_error_))
  {
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __82__HAPAccessoryServerBrowserIP_notifyDelegatesOfWACCompletionWithIdentifier_error___block_invoke;
    v8[3] = &unk_1E894E120;
    v8[4] = self;
    v9 = v6;
    v10 = v7;
    -[HAPAccessoryServerBrowserIP pendDelegateBlock:identifier:](self, "pendDelegateBlock:identifier:", v8, v9);

  }
}

- (void)discoverAccessoryServerWithIdentifier:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  -[HAPAccessoryServerBrowser workQueue](self, "workQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __69__HAPAccessoryServerBrowserIP_discoverAccessoryServerWithIdentifier___block_invoke;
  v7[3] = &unk_1E894E0F8;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, v7);

}

- (void)processPendingBonjourRemoveEvents:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  -[HAPAccessoryServerBrowser workQueue](self, "workQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __65__HAPAccessoryServerBrowserIP_processPendingBonjourRemoveEvents___block_invoke;
  v7[3] = &unk_1E894E0F8;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, v7);

}

- (void)matchAccessoryServerWithSetupID:(id)a3 serverIdentifier:(id)a4 completionHandler:(id)a5
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
  -[HAPAccessoryServerBrowser workQueue](self, "workQueue");
  v11 = objc_claimAutoreleasedReturnValue();
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __98__HAPAccessoryServerBrowserIP_matchAccessoryServerWithSetupID_serverIdentifier_completionHandler___block_invoke;
  v15[3] = &unk_1E894D6D0;
  v15[4] = self;
  v16 = v8;
  v17 = v9;
  v18 = v10;
  v12 = v10;
  v13 = v9;
  v14 = v8;
  dispatch_async(v11, v15);

}

- (void)_matchAccessoryServerWithSetupID:(id)a3 serverIdentifier:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  void (**v10)(id, uint64_t, id);
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  id v17;
  void *v18;
  _BOOL8 v19;
  uint64_t v20;
  uint64_t v21;
  HAPAccessoryServerBrowserIP *v22;
  NSObject *v23;
  void *v24;
  void *v25;
  void *v26;
  void *context;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  uint8_t buf[4];
  void *v33;
  __int16 v34;
  void *v35;
  __int16 v36;
  id v37;
  __int16 v38;
  void *v39;
  __int16 v40;
  void *v41;
  _BYTE v42[128];
  uint64_t v43;

  v43 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = (void (**)(id, uint64_t, id))a5;
  if (v10)
  {
    v30 = 0u;
    v31 = 0u;
    v28 = 0u;
    v29 = 0u;
    -[HAPAccessoryServerBrowserIP discoveredAccessoryServers](self, "discoveredAccessoryServers");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "allObjects");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v28, v42, 16);
    if (v13)
    {
      v14 = *(_QWORD *)v29;
      while (2)
      {
        for (i = 0; i != v13; ++i)
        {
          if (*(_QWORD *)v29 != v14)
            objc_enumerationMutation(v12);
          v16 = *(void **)(*((_QWORD *)&v28 + 1) + 8 * i);
          if (objc_msgSend(v16, "matchesSetupID:serverIdentifier:", v8, v9))
          {
            objc_msgSend(v16, "identifier");
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            v19 = -[HAPAccessoryServerBrowser isPaired:](self, "isPaired:", v18);

            v20 = objc_msgSend(v16, "hasPairings");
            v13 = v19 | v20;
            if ((_DWORD)v13 == 1)
            {
              v21 = v20;
              context = (void *)MEMORY[0x1D17B7244]();
              v22 = self;
              HMFGetOSLogHandle();
              v23 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
              {
                HMFGetLogIdentifier();
                v26 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v19);
                v24 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v21);
                v25 = (void *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = 138544386;
                v33 = v26;
                v34 = 2112;
                v35 = v16;
                v36 = 2114;
                v37 = v8;
                v38 = 2114;
                v39 = v24;
                v40 = 2114;
                v41 = v25;
                _os_log_impl(&dword_1CCE01000, v23, OS_LOG_TYPE_INFO, "%{public}@IP Accessory server %@ matches setupID %{public}@ and is paired/hasPairings: (%{public}@/%{public}@)", buf, 0x34u);

              }
              objc_autoreleasePoolPop(context);
            }
            v17 = v16;
            goto LABEL_16;
          }
        }
        v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v28, v42, 16);
        if (v13)
          continue;
        break;
      }
    }
    v17 = 0;
LABEL_16:

    v10[2](v10, v13, v17);
  }

}

- (unint64_t)maximumPairVerifyFailureCount
{
  return self->_maximumNumberOfPairVeifiesAllowed;
}

- (void)_handleBonjourBrowserEvent:(unsigned int)a3 eventInfo:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  HAPAccessoryServerBrowserIP *v10;
  NSObject *v11;
  void *v12;
  int v13;
  int v14;
  void *v15;
  HAPAccessoryServerBrowserIP *v16;
  NSObject *v17;
  void *v18;
  void *v19;
  HAPAccessoryServerBrowserIP *v20;
  NSObject *v21;
  void *v22;
  id v23;
  int v24;
  void *v25;
  HAPAccessoryServerBrowserIP *v26;
  NSObject *v27;
  void *v28;
  void *v29;
  void *v30;
  HAPAccessoryServerBrowserIP *v31;
  NSObject *v32;
  void *v33;
  void *v34;
  HAPAccessoryServerBrowserIP *v35;
  NSObject *v36;
  void *v37;
  _QWORD v38[5];
  id v39;
  uint8_t buf[4];
  void *v41;
  __int16 v42;
  void *v43;
  __int16 v44;
  void *v45;
  uint64_t v46;

  v46 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  objc_msgSend(v6, "hmf_stringForKey:", CFSTR("deviceID"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "hmf_stringForKey:", CFSTR("name"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (a3 != 3)
  {
    if (a3 != 2)
    {
      if (a3 == 1 && v6)
      {
        v9 = (void *)MEMORY[0x1D17B7244]();
        v10 = self;
        HMFGetOSLogHandle();
        v11 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
        {
          HMFGetLogIdentifier();
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543874;
          v41 = v12;
          v42 = 2112;
          v43 = v8;
          v44 = 2114;
          v45 = v7;
          _os_log_impl(&dword_1CCE01000, v11, OS_LOG_TYPE_INFO, "%{public}@Received add/update message for BonjourDevice with name '%@', id %{public}@", buf, 0x20u);

        }
        objc_autoreleasePoolPop(v9);
        v13 = -[HAPAccessoryServerBrowserIP _purgePendingBonjourEvents:withProcessing:](v10, "_purgePendingBonjourEvents:withProcessing:", v7, 0);
        if (v13)
        {
          v14 = v13;
          v15 = (void *)MEMORY[0x1D17B7244]();
          v16 = v10;
          HMFGetOSLogHandle();
          v17 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
          {
            HMFGetLogIdentifier();
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543618;
            v41 = v18;
            v42 = 1024;
            LODWORD(v43) = v14;
            _os_log_impl(&dword_1CCE01000, v17, OS_LOG_TYPE_INFO, "%{public}@Purged %d pending remove events", buf, 0x12u);

          }
          objc_autoreleasePoolPop(v15);
        }
        -[HAPAccessoryServerBrowserIP _handleBonjourAddOrUpdateWithEventInfo:](v10, "_handleBonjourAddOrUpdateWithEventInfo:", v6);
      }
      goto LABEL_24;
    }
    if (!v6)
      goto LABEL_24;
    v39 = 0;
    -[HAPAccessoryServerBrowserIP _server:forBonjourDevice:](self, "_server:forBonjourDevice:", &v39, v6);
    v23 = v39;
    v24 = objc_msgSend(v23, "isSessionEstablished");
    if (objc_msgSend(v23, "wakeNumber"))
    {
      v25 = (void *)MEMORY[0x1D17B7244]();
      v26 = self;
      HMFGetOSLogHandle();
      v27 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "identifier");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v41 = v28;
        v42 = 2114;
        v43 = v29;
        _os_log_impl(&dword_1CCE01000, v27, OS_LOG_TYPE_INFO, "%{public}@pending bonjour remove event for suspended accessory server: %{public}@", buf, 0x16u);

      }
      objc_autoreleasePoolPop(v25);
    }
    else if (!v24)
    {
      if (objc_msgSend(v23, "isWacAccessory") && (objc_msgSend(v23, "isWacComplete") & 1) == 0)
      {
        v34 = (void *)MEMORY[0x1D17B7244]();
        v35 = self;
        HMFGetOSLogHandle();
        v36 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v36, OS_LOG_TYPE_DEBUG))
        {
          HMFGetLogIdentifier();
          v37 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543618;
          v41 = v37;
          v42 = 2112;
          v43 = v8;
          _os_log_impl(&dword_1CCE01000, v36, OS_LOG_TYPE_DEBUG, "%{public}@WAC in progress, ignoring the remove event for BonjourDevice with name %@", buf, 0x16u);

        }
        objc_autoreleasePoolPop(v34);
      }
      else
      {
        v30 = (void *)MEMORY[0x1D17B7244]();
        v31 = self;
        HMFGetOSLogHandle();
        v32 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v32, OS_LOG_TYPE_INFO))
        {
          HMFGetLogIdentifier();
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543618;
          v41 = v33;
          v42 = 2112;
          v43 = v8;
          _os_log_impl(&dword_1CCE01000, v32, OS_LOG_TYPE_INFO, "%{public}@No session yet, processing the remove event for BonjourDevice with name %@", buf, 0x16u);

        }
        objc_autoreleasePoolPop(v30);
        -[HAPAccessoryServerBrowserIP _handleBonjourRemoveWithEventInfo:](v31, "_handleBonjourRemoveWithEventInfo:", v6);
      }
      goto LABEL_23;
    }
    -[HAPAccessoryServerBrowserIP _pendBonjourRemoveEvent:](self, "_pendBonjourRemoveEvent:", v6);
LABEL_23:

    goto LABEL_24;
  }
  v19 = (void *)MEMORY[0x1D17B7244]();
  v20 = self;
  HMFGetOSLogHandle();
  v21 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v41 = v22;
    _os_log_impl(&dword_1CCE01000, v21, OS_LOG_TYPE_INFO, "%{public}@Received a stop browsing event for the BonjourBrowser, invalidating all unpaired accessory servers", buf, 0xCu);

  }
  objc_autoreleasePoolPop(v19);
  -[HAPAccessoryServerBrowserIP _purgePendingBonjourEvents:withProcessing:](v20, "_purgePendingBonjourEvents:withProcessing:", v7, 1);
  -[HAPAccessoryServerBrowserIP _invalidateAccessoryServers:](v20, "_invalidateAccessoryServers:", 1);
  if (-[HAPAccessoryServerBrowserIP _delegateRespondsToSelector:](v20, "_delegateRespondsToSelector:", sel_accessoryServerBrowser_didStopDiscoveringWithError_))
  {
    v38[0] = MEMORY[0x1E0C809B0];
    v38[1] = 3221225472;
    v38[2] = __68__HAPAccessoryServerBrowserIP__handleBonjourBrowserEvent_eventInfo___block_invoke;
    v38[3] = &unk_1E894DD08;
    v38[4] = v20;
    -[HAPAccessoryServerBrowserIP pendDelegateBlock:identifier:](v20, "pendDelegateBlock:identifier:", v38, 0);
  }
LABEL_24:

}

- (void)_handleConnectionUpdateWithBonjourDeviceInfo:(id)a3 socketInfo:(id)a4
{
  id v6;
  id v7;
  id v8;
  void *v9;
  HAPAccessoryServerBrowserIP *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  HAPAccessoryServerIP *v16;
  void *v17;
  HAPAccessoryServerIP *v18;
  void *v19;
  void *v20;
  int v21;
  void *v22;
  HAPAccessoryServerBrowserIP *v23;
  NSObject *v24;
  void *v25;
  void *v26;
  NSObject *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  HAPAccessoryServerBrowserIP *v33;
  NSObject *v34;
  void *v35;
  void *v36;
  void *v37;
  _QWORD v38[5];
  HAPAccessoryServerIP *v39;
  id v40;
  uint8_t buf[4];
  void *v42;
  __int16 v43;
  id v44;
  __int16 v45;
  void *v46;
  __int16 v47;
  id v48;
  uint64_t v49;

  v49 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v40 = 0;
  -[HAPAccessoryServerBrowserIP _server:forBonjourDevice:](self, "_server:forBonjourDevice:", &v40, v6);
  v8 = v40;
  if (!v8)
  {
    if (v7)
      v15 = 2;
    else
      v15 = 1;
    v16 = [HAPAccessoryServerIP alloc];
    -[HAPAccessoryServerBrowser keyStore](self, "keyStore");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = -[HAPAccessoryServerIP initWithBonjourDeviceInfo:keyStore:browser:discoveryMethod:](v16, "initWithBonjourDeviceInfo:keyStore:browser:discoveryMethod:", v6, v17, self, v15);

    -[HAPAccessoryServer identifier](v18, "identifier");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[HAPAccessoryServerBrowserIP serverIdentifierToSkipBonjourUpdate](self, "serverIdentifierToSkipBonjourUpdate");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_msgSend(v19, "isEqual:", v20);

    if (v7 || !v21)
    {
      v22 = (void *)MEMORY[0x1D17B7244]();
      v23 = self;
      HMFGetOSLogHandle();
      v27 = objc_claimAutoreleasedReturnValue();
      v24 = v27;
      if (v18)
      {
        if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
        {
          HMFGetLogIdentifier();
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          -[HAPAccessoryServer name](v18, "name");
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          -[HAPAccessoryServer identifier](v18, "identifier");
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543874;
          v42 = v28;
          v43 = 2112;
          v44 = v29;
          v45 = 2114;
          v46 = v30;
          _os_log_impl(&dword_1CCE01000, v24, OS_LOG_TYPE_INFO, "%{public}@Discovered new accessory server %@/%{public}@ with BonjourDevice info", buf, 0x20u);

        }
        objc_autoreleasePoolPop(v22);
        -[HAPAccessoryServerBrowserIP discoveredAccessoryServers](v23, "discoveredAccessoryServers");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v31, "addObject:", v18);

        if (v7)
        {
          v32 = (void *)MEMORY[0x1D17B7244]();
          v33 = v23;
          HMFGetOSLogHandle();
          v34 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v34, OS_LOG_TYPE_INFO))
          {
            HMFGetLogIdentifier();
            v35 = (void *)objc_claimAutoreleasedReturnValue();
            -[HAPAccessoryServer identifier](v18, "identifier");
            v36 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543618;
            v42 = v35;
            v43 = 2112;
            v44 = v36;
            _os_log_impl(&dword_1CCE01000, v34, OS_LOG_TYPE_INFO, "%{public}@Saving socket info for newly discovered server %@", buf, 0x16u);

          }
          objc_autoreleasePoolPop(v32);
          -[HAPAccessoryServerIP setCachedSocketInfo:](v18, "setCachedSocketInfo:", v7);
        }
        if (-[HAPAccessoryServerBrowserIP _delegateRespondsToSelector:](v23, "_delegateRespondsToSelector:", sel_accessoryServerBrowser_didFindAccessoryServer_stateChanged_stateNumber_))
        {
          v38[0] = MEMORY[0x1E0C809B0];
          v38[1] = 3221225472;
          v38[2] = __87__HAPAccessoryServerBrowserIP__handleConnectionUpdateWithBonjourDeviceInfo_socketInfo___block_invoke;
          v38[3] = &unk_1E894E0F8;
          v38[4] = v23;
          v39 = v18;
          -[HAPAccessoryServer identifier](v39, "identifier");
          v37 = (void *)objc_claimAutoreleasedReturnValue();
          -[HAPAccessoryServerBrowserIP pendDelegateBlock:identifier:](v23, "pendDelegateBlock:identifier:", v38, v37);

        }
        -[HAPAccessoryServer registerForNotifications:](v18, "registerForNotifications:", v23);
        goto LABEL_26;
      }
      if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v42 = v25;
        v43 = 2112;
        v44 = v6;
        _os_log_impl(&dword_1CCE01000, v24, OS_LOG_TYPE_ERROR, "%{public}@Failed to create an accessory server from the TXT record data after discovering BonjourDevice %@", buf, 0x16u);
        goto LABEL_24;
      }
    }
    else
    {
      v22 = (void *)MEMORY[0x1D17B7244]();
      v23 = self;
      HMFGetOSLogHandle();
      v24 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        -[HAPAccessoryServer identifier](v18, "identifier");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v42 = v25;
        v43 = 2112;
        v44 = v26;
        _os_log_impl(&dword_1CCE01000, v24, OS_LOG_TYPE_INFO, "%{public}@*** Skipping bonjour add for %@.  Remove HAPServerIPBrowserSkipBonjourUpdateForIdentifier from preferences to clear", buf, 0x16u);

LABEL_24:
      }
    }

    objc_autoreleasePoolPop(v22);
LABEL_26:

    goto LABEL_27;
  }
  v9 = (void *)MEMORY[0x1D17B7244]();
  v10 = self;
  HMFGetOSLogHandle();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "identifier");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "isWacAccessory");
    HMFBooleanToString();
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138544130;
    v42 = v12;
    v43 = 2114;
    v44 = v13;
    v45 = 2114;
    v46 = v14;
    v47 = 2112;
    v48 = v6;
    _os_log_impl(&dword_1CCE01000, v11, OS_LOG_TYPE_INFO, "%{public}@Updating IP accessory server %{public}@ wacAccessory:%{public}@ with new BonjourDevice info: %@", buf, 0x2Au);

  }
  objc_autoreleasePoolPop(v9);
  -[HAPAccessoryServerBrowserIP _setReachability:forServer:](v10, "_setReachability:forServer:", 1, v8);
  objc_msgSend(v8, "updateWithBonjourDeviceInfo:socketInfo:", v6, v7);
LABEL_27:

}

- (void)handleConnectionUpdateWithBonjourDeviceInfo:(id)a3 socketInfo:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  -[HAPAccessoryServerBrowser workQueue](self, "workQueue");
  v8 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __86__HAPAccessoryServerBrowserIP_handleConnectionUpdateWithBonjourDeviceInfo_socketInfo___block_invoke;
  block[3] = &unk_1E894E120;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(v8, block);

}

- (void)_handleBonjourAddOrUpdateWithEventInfo:(id)a3
{
  NSObject *v4;
  id v5;

  v5 = a3;
  -[HAPAccessoryServerBrowser workQueue](self, "workQueue");
  v4 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v4);

  -[HAPAccessoryServerBrowserIP _handleConnectionUpdateWithBonjourDeviceInfo:socketInfo:](self, "_handleConnectionUpdateWithBonjourDeviceInfo:socketInfo:", v5, 0);
}

- (void)_invalidateAndRemoveAccessoryServer:(id)a3
{
  id v4;
  int v5;
  void *v6;
  HAPAccessoryServerBrowserIP *v7;
  NSObject *v8;
  _BOOL4 v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  HAPAccessoryServerBrowserInvalidateServerOperation *v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  _QWORD v20[4];
  id v21;
  id v22;
  id v23;
  uint8_t buf[4];
  void *v25;
  __int16 v26;
  id v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = objc_msgSend(v4, "isPreSoftAuthWacStarted");
  v6 = (void *)MEMORY[0x1D17B7244]();
  v7 = self;
  HMFGetOSLogHandle();
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = os_log_type_enabled(v8, OS_LOG_TYPE_INFO);
  if (v5)
  {
    if (v9)
    {
      HMFGetLogIdentifier();
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v25 = v10;
      v26 = 2112;
      v27 = v4;
      _os_log_impl(&dword_1CCE01000, v8, OS_LOG_TYPE_INFO, "%{public}@Not invalidating accessory server during WAC progress - %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v6);
  }
  else
  {
    if (v9)
    {
      HMFGetLogIdentifier();
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v25 = v11;
      v26 = 2112;
      v27 = v4;
      _os_log_impl(&dword_1CCE01000, v8, OS_LOG_TYPE_INFO, "%{public}@Removing from discoveredAccessoryServers: %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v6);
    -[HAPAccessoryServerBrowserIP discoveredAccessoryServers](v7, "discoveredAccessoryServers");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "removeObject:", v4);

    -[HAPAccessoryServerBrowserIP delegate](v7, "delegate");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = -[HAPAccessoryServerBrowserInvalidateServerOperation initWithServer:]([HAPAccessoryServerBrowserInvalidateServerOperation alloc], "initWithServer:", v4);
    objc_msgSend(v4, "identifier");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[HAPAccessoryServerBrowserIP pendDelegateOperation:identifier:](v7, "pendDelegateOperation:identifier:", v14, v15);

    if (v13 && (objc_opt_respondsToSelector() & 1) != 0)
    {
      objc_initWeak((id *)buf, v7);
      v16 = (void *)MEMORY[0x1E0CB34C8];
      v20[0] = MEMORY[0x1E0C809B0];
      v20[1] = 3221225472;
      v20[2] = __67__HAPAccessoryServerBrowserIP__invalidateAndRemoveAccessoryServer___block_invoke;
      v20[3] = &unk_1E894DFD8;
      objc_copyWeak(&v23, (id *)buf);
      v21 = v13;
      v17 = v4;
      v22 = v17;
      objc_msgSend(v16, "blockOperationWithBlock:", v20);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "addDependency:", v14);
      objc_msgSend(v17, "identifier");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      -[HAPAccessoryServerBrowserIP pendDelegateOperation:identifier:](v7, "pendDelegateOperation:identifier:", v18, v19);

      objc_destroyWeak(&v23);
      objc_destroyWeak((id *)buf);
    }

  }
}

- (void)_doReachabilityUpdateForServer:(id)a3 withDictionary:(id)a4
{
  id v6;
  id v7;
  int v8;
  void *v9;
  HAPAccessoryServerBrowserIP *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  HAPAccessoryServerBrowserIP *v16;
  NSObject *v17;
  void *v18;
  void *v19;
  int v20;
  void *v21;
  __int16 v22;
  _WORD v23[17];

  *(_QWORD *)&v23[13] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if ((objc_msgSend(v6, "reachabilityPingEnabled") & 1) != 0)
  {
    v8 = objc_msgSend(v7, "hmf_BOOLForKey:", CFSTR("HAPAccessoryReachable"));
    v9 = (void *)MEMORY[0x1D17B7244]();
    v10 = self;
    HMFGetOSLogHandle();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "identifier");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = 138543874;
      v21 = v12;
      v22 = 1024;
      *(_DWORD *)v23 = v8;
      v23[2] = 2114;
      *(_QWORD *)&v23[3] = v13;
      _os_log_impl(&dword_1CCE01000, v11, OS_LOG_TYPE_INFO, "%{public}@accessory server reachability via ping %d from accessory server %{public}@", (uint8_t *)&v20, 0x1Cu);

    }
    objc_autoreleasePoolPop(v9);
    if ((v8 & 1) == 0)
    {
      objc_msgSend(v6, "identifier");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      -[HAPAccessoryServerBrowserIP _processPendingBonjourEvent:](v10, "_processPendingBonjourEvent:", v14);

    }
  }
  else
  {
    v15 = (void *)MEMORY[0x1D17B7244]();
    v16 = self;
    HMFGetOSLogHandle();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "identifier");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = 138543618;
      v21 = v18;
      v22 = 2114;
      *(_QWORD *)v23 = v19;
      _os_log_impl(&dword_1CCE01000, v17, OS_LOG_TYPE_INFO, "%{public}@ignoring reachability update on browser - pings not enabled for accessory server %{public}@", (uint8_t *)&v20, 0x16u);

    }
    objc_autoreleasePoolPop(v15);
  }

}

- (void)indicateNotificationFromServer:(id)a3 notifyType:(unint64_t)a4 withDictionary:(id)a5
{
  id v8;
  id v9;
  NSObject *v10;
  id v11;
  id v12;
  _QWORD v13[4];
  id v14;
  HAPAccessoryServerBrowserIP *v15;
  id v16;
  unint64_t v17;

  v8 = a3;
  v9 = a5;
  -[HAPAccessoryServerBrowser workQueue](self, "workQueue");
  v10 = objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __88__HAPAccessoryServerBrowserIP_indicateNotificationFromServer_notifyType_withDictionary___block_invoke;
  v13[3] = &unk_1E894DF10;
  v14 = v9;
  v15 = self;
  v16 = v8;
  v17 = a4;
  v11 = v8;
  v12 = v9;
  dispatch_async(v10, v13);

}

- (void)_doBonjourRemoveWithServer:(id)a3
{
  id v4;
  void *v5;
  HAPAccessoryServerBrowserIP *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  __int16 v12;
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (v4)
  {
    v5 = (void *)MEMORY[0x1D17B7244]();
    v6 = self;
    HMFGetOSLogHandle();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "identifier");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = 138543618;
      v11 = v8;
      v12 = 2114;
      v13 = v9;
      _os_log_impl(&dword_1CCE01000, v7, OS_LOG_TYPE_INFO, "%{public}@Removing IP accessory server with device ID %{public}@", (uint8_t *)&v10, 0x16u);

    }
    objc_autoreleasePoolPop(v5);
    objc_msgSend(v4, "bonjourRemoveEvent");
    objc_msgSend(v4, "unregisterForNotifications:", v6);
    -[HAPAccessoryServerBrowserIP _invalidateAndRemoveAccessoryServer:](v6, "_invalidateAndRemoveAccessoryServer:", v4);
  }

}

- (void)_handleBonjourRemoveWithEventInfo:(id)a3
{
  id v4;
  id v5;
  void *v6;
  id v7;
  NSObject *v8;
  void *v9;
  int v10;
  void *v11;
  void *v12;
  HAPAccessoryServerBrowserIP *v13;
  NSObject *v14;
  void *v15;
  id v16;
  uint8_t buf[4];
  void *v18;
  __int16 v19;
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v16 = 0;
  -[HAPAccessoryServerBrowserIP _server:forBonjourDevice:](self, "_server:forBonjourDevice:", &v16, v4);
  v5 = v16;
  if (v5)
  {
    v6 = (void *)MEMORY[0x1D17B7244]();
    v7 = v5;
    HMFGetOSLogHandle();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v7, "isPaired");
      *(_DWORD *)buf = 138543618;
      v18 = v9;
      v19 = 1024;
      LODWORD(v20) = v10;
      _os_log_impl(&dword_1CCE01000, v8, OS_LOG_TYPE_INFO, "%{public}@Authenticated: %d", buf, 0x12u);

    }
    objc_autoreleasePoolPop(v6);
    -[HAPAccessoryServerBrowserIP _doBonjourRemoveWithServer:](self, "_doBonjourRemoveWithServer:", v7);
  }
  else
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("name"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = (void *)MEMORY[0x1D17B7244]();
    v13 = self;
    HMFGetOSLogHandle();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v18 = v15;
      v19 = 2112;
      v20 = v11;
      _os_log_impl(&dword_1CCE01000, v14, OS_LOG_TYPE_ERROR, "%{public}@Removed BonjourDevice with name %@ but it was not a part of the discoveredAccessoryServers set", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v12);

  }
}

- (int)_server:(id *)a3 forBonjourDevice:(id)a4
{
  id v6;
  const void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  void *i;
  void *v12;
  void *v13;
  int v14;
  id v15;
  int v16;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  int v22;
  uint8_t v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  v22 = 0;
  v7 = (const void *)BonjourDevice_CopyCFString();
  v20 = 0u;
  v21 = 0u;
  v18 = 0u;
  v19 = 0u;
  -[HAPAccessoryServerBrowserIP discoveredAccessoryServers](self, "discoveredAccessoryServers", 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (id)objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v18, v23, 16);
  if (v9)
  {
    v10 = *(_QWORD *)v19;
    while (2)
    {
      for (i = 0; i != v9; i = (char *)i + 1)
      {
        if (*(_QWORD *)v19 != v10)
          objc_enumerationMutation(v8);
        v12 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * (_QWORD)i);
        objc_msgSend(v12, "identifier");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = objc_msgSend(v13, "isEqualToString:", v7);

        if (v14)
        {
          v9 = v12;
          goto LABEL_11;
        }
      }
      v9 = (id)objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v18, v23, 16);
      if (v9)
        continue;
      break;
    }
  }
LABEL_11:

  if (v7)
    CFRelease(v7);
  v15 = objc_retainAutorelease(v9);
  *a3 = v15;
  v16 = v22;

  return v16;
}

- (void)_server:(id *)a3 forHAPWACAccessory:(id)a4
{
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  void *i;
  void *v11;
  void *v12;
  int v13;
  id v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  if (a3)
  {
    *a3 = 0;
    objc_msgSend(a4, "deviceId");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = 0u;
    v16 = 0u;
    v17 = 0u;
    v18 = 0u;
    -[HAPAccessoryServerBrowserIP discoveredAccessoryServers](self, "discoveredAccessoryServers", 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (id)objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    if (v8)
    {
      v9 = *(_QWORD *)v16;
      while (2)
      {
        for (i = 0; i != v8; i = (char *)i + 1)
        {
          if (*(_QWORD *)v16 != v9)
            objc_enumerationMutation(v7);
          v11 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * (_QWORD)i);
          objc_msgSend(v11, "identifier");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          v13 = objc_msgSend(v12, "isEqualToString:", v6);

          if (v13)
          {
            v8 = v11;
            goto LABEL_12;
          }
        }
        v8 = (id)objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
        if (v8)
          continue;
        break;
      }
    }
LABEL_12:

    v14 = objc_retainAutorelease(v8);
    *a3 = v14;

  }
}

- (void)_invalidateAccessoryServers:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  BOOL v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v3 = a3;
  v21 = *MEMORY[0x1E0C80C00];
  v5 = (void *)MEMORY[0x1E0C99E60];
  -[HAPAccessoryServerBrowserIP discoveredAccessoryServers](self, "discoveredAccessoryServers");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setWithSet:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v18 = 0u;
  v19 = 0u;
  v16 = 0u;
  v17 = 0u;
  v8 = v7;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v17;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v17 != v11)
          objc_enumerationMutation(v8);
        v13 = *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * v12);
        if (!v3
          || (objc_msgSend(*(id *)(*((_QWORD *)&v16 + 1) + 8 * v12), "identifier", (_QWORD)v16),
              v14 = (void *)objc_claimAutoreleasedReturnValue(),
              v15 = -[HAPAccessoryServerBrowser isPaired:](self, "isPaired:", v14),
              v14,
              !v15))
        {
          -[HAPAccessoryServerBrowserIP _invalidateAndRemoveAccessoryServer:](self, "_invalidateAndRemoveAccessoryServer:", v13, (_QWORD)v16);
        }
        ++v12;
      }
      while (v10 != v12);
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v10);
  }

}

- (void)_setReachability:(BOOL)a3 forServer:(id)a4
{
  _BOOL8 v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v4 = a3;
  v15 = *MEMORY[0x1E0C80C00];
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  objc_msgSend(a4, "accessories", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v11;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v11 != v8)
          objc_enumerationMutation(v5);
        objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * v9++), "setReachable:", v4);
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v7);
  }

}

- (BOOL)_delegateRespondsToSelector:(SEL)a3
{
  void *v4;
  void *v5;
  void *v6;
  char v7;

  -[HAPAccessoryServerBrowserIP delegate](self, "delegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    -[HAPAccessoryServerBrowserIP delegateQueue](self, "delegateQueue");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      -[HAPAccessoryServerBrowserIP delegate](self, "delegate");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = objc_opt_respondsToSelector();

    }
    else
    {
      v7 = 0;
    }

  }
  else
  {
    v7 = 0;
  }

  return v7 & 1;
}

- (void)_pendBonjourRemoveEvent:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  BOOL v8;
  void *v9;
  void *v10;
  void *v11;
  HAPAccessoryServerBrowserIP *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  HAPAccessoryServerBrowserIP *v19;
  NSObject *v20;
  void *v21;
  void *v22;
  void *v23;
  HAPAccessoryServerBrowserIP *v24;
  NSObject *v25;
  void *v26;
  void *v27;
  int v28;
  void *v29;
  HAPAccessoryServerBrowserIP *v30;
  NSObject *v31;
  void *v32;
  id v33;
  uint8_t buf[4];
  void *v35;
  __int16 v36;
  id v37;
  __int16 v38;
  uint64_t v39;
  __int16 v40;
  void *v41;
  _QWORD v42[3];
  _QWORD v43[4];

  v43[3] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v33 = 0;
  -[HAPAccessoryServerBrowserIP _server:forBonjourDevice:](self, "_server:forBonjourDevice:", &v33, v4);
  v5 = v33;
  v6 = v5;
  if (v5
    && (objc_msgSend(v5, "identifier"),
        v7 = (void *)objc_claimAutoreleasedReturnValue(),
        v8 = -[HAPAccessoryServerBrowser isPaired:](self, "isPaired:", v7),
        v7,
        !v8))
  {
    v23 = (void *)MEMORY[0x1D17B7244]();
    v24 = self;
    HMFGetOSLogHandle();
    v25 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v35 = v26;
      v36 = 2112;
      v37 = v4;
      v38 = 2114;
      v39 = (uint64_t)v6;
      _os_log_impl(&dword_1CCE01000, v25, OS_LOG_TYPE_INFO, "%{public}@Handling Bonjour remove event %@ for unpaired accessory server: %{public}@", buf, 0x20u);

    }
    objc_autoreleasePoolPop(v23);
    objc_msgSend(v6, "bonjourRemoveEvent");
    objc_msgSend(v4, "hmf_stringForKey:", CFSTR("deviceID"));
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = -[HAPAccessoryServerBrowserIP _processPendingBonjourEvent:](v24, "_processPendingBonjourEvent:", v27);

    if (!v28)
    {
      v29 = (void *)MEMORY[0x1D17B7244]();
      v30 = v24;
      HMFGetOSLogHandle();
      v31 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v31, OS_LOG_TYPE_DEBUG))
      {
        HMFGetLogIdentifier();
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v35 = v32;
        _os_log_impl(&dword_1CCE01000, v31, OS_LOG_TYPE_DEBUG, "%{public}@None pending - processing the remove", buf, 0xCu);

      }
      objc_autoreleasePoolPop(v29);
      -[HAPAccessoryServerBrowserIP _handleBonjourRemoveWithEventInfo:](v30, "_handleBonjourRemoveWithEventInfo:", v4);
    }
  }
  else
  {
    v43[0] = CFSTR("kHAPBonjourEventType_Remove");
    v42[0] = CFSTR("kHAPBonjourEventType");
    v42[1] = CFSTR("kHAPBonjourEventReceivedTimeKey");
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v42[2] = CFSTR("kHAPBonjourEventKey");
    v43[1] = v9;
    v43[2] = v4;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v43, v42, 3);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    v11 = (void *)MEMORY[0x1D17B7244]();
    v12 = self;
    HMFGetOSLogHandle();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      -[HAPAccessoryServerBrowserIP pendingBonjourEvents](v12, "pendingBonjourEvents");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = objc_msgSend(v15, "count");
      objc_msgSend(v6, "isSessionRestoreActive");
      HMFBooleanToString();
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544130;
      v35 = v14;
      v36 = 2112;
      v37 = v4;
      v38 = 2048;
      v39 = v16;
      v40 = 2114;
      v41 = v17;
      _os_log_impl(&dword_1CCE01000, v13, OS_LOG_TYPE_INFO, "%{public}@Pending Bonjour remove event: %@, Current Count: %lu, session restore: %{public}@ ", buf, 0x2Au);

    }
    objc_autoreleasePoolPop(v11);
    -[HAPAccessoryServerBrowserIP _pendBonjourEvent:](v12, "_pendBonjourEvent:", v10);
    if (v6 && (objc_msgSend(v6, "isSessionRestoreActive") & 1) == 0)
    {
      v18 = (void *)MEMORY[0x1D17B7244]();
      v19 = v12;
      HMFGetOSLogHandle();
      v20 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "identifier");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v35 = v21;
        v36 = 2114;
        v37 = v22;
        _os_log_impl(&dword_1CCE01000, v20, OS_LOG_TYPE_INFO, "%{public}@Marking all accessories for server %{public}@ as unreachable while confirming the remove event", buf, 0x16u);

      }
      objc_autoreleasePoolPop(v18);
      -[HAPAccessoryServerBrowserIP _setReachability:forServer:](v19, "_setReachability:forServer:", 0, v6);
    }

  }
}

- (void)_pendBonjourEvent:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  id v8;

  v4 = a3;
  -[HAPAccessoryServerBrowserIP pendingBonjourEvents](self, "pendingBonjourEvents");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "count");

  if (!v6)
  {
    -[HAPAccessoryServerBrowserIP bonjourEventTimer](self, "bonjourEventTimer");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "resume");

  }
  -[HAPAccessoryServerBrowserIP pendingBonjourEvents](self, "pendingBonjourEvents");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "addObject:", v4);

}

- (int)_processPendingBonjourEvent:(id)a3
{
  return -[HAPAccessoryServerBrowserIP _purgePendingBonjourEvents:withProcessing:](self, "_purgePendingBonjourEvents:withProcessing:", a3, 1);
}

- (void)processPendingBonjourRemoveEventsForDeviceID:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  -[HAPAccessoryServerBrowser workQueue](self, "workQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __76__HAPAccessoryServerBrowserIP_processPendingBonjourRemoveEventsForDeviceID___block_invoke;
  v7[3] = &unk_1E894E0F8;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, v7);

}

- (int)_purgePendingBonjourEvents:(id)a3 withProcessing:(BOOL)a4
{
  id v5;
  void *v6;
  void *v7;
  __int128 v8;
  int v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  void *v14;
  int v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  HAPAccessoryServerBrowserIP *v20;
  NSObject *v21;
  void *v22;
  HAPAccessoryServerBrowserIP *v23;
  void *v24;
  id v25;
  void *v26;
  uint64_t v27;
  void *v28;
  HAPAccessoryServerBrowserIP *v29;
  NSObject *v30;
  int v31;
  void *v32;
  __int128 v34;
  void *v35;
  int v36;
  void *v37;
  uint64_t v38;
  _BOOL4 v39;
  id obj;
  uint64_t v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  uint8_t buf[4];
  void *v47;
  __int16 v48;
  void *v49;
  __int16 v50;
  void *v51;
  __int16 v52;
  uint64_t v53;
  _BYTE v54[128];
  uint64_t v55;

  v39 = a4;
  v55 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  -[HAPAccessoryServerBrowserIP pendingBonjourEvents](self, "pendingBonjourEvents");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v6, "copy");

  v44 = 0u;
  v45 = 0u;
  v42 = 0u;
  v43 = 0u;
  obj = v7;
  v41 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v42, v54, 16);
  v9 = 0;
  if (v41)
  {
    v10 = *(_QWORD *)v43;
    *(_QWORD *)&v8 = 138543618;
    v34 = v8;
    v38 = *(_QWORD *)v43;
    do
    {
      for (i = 0; i != v41; ++i)
      {
        if (*(_QWORD *)v43 != v10)
          objc_enumerationMutation(obj);
        v12 = *(void **)(*((_QWORD *)&v42 + 1) + 8 * i);
        objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("kHAPBonjourEventKey"), v34);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "hmf_stringForKey:", CFSTR("deviceID"));
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = objc_msgSend(v14, "isEqualToString:", v5);

        if (v15)
        {
          objc_msgSend(v13, "hmf_stringForKey:", CFSTR("name"));
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("kHAPBonjourEventType"));
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          -[HAPAccessoryServerBrowserIP pendingBonjourEvents](self, "pendingBonjourEvents");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v18, "removeObject:", v12);

          v19 = (void *)MEMORY[0x1D17B7244]();
          v20 = self;
          HMFGetOSLogHandle();
          v21 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
          {
            HMFGetLogIdentifier();
            v36 = v9;
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            -[HAPAccessoryServerBrowserIP pendingBonjourEvents](v20, "pendingBonjourEvents");
            v35 = v16;
            v23 = self;
            v24 = v17;
            v25 = v5;
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            v27 = objc_msgSend(v26, "count");
            *(_DWORD *)buf = 138544130;
            v47 = v22;
            v48 = 2112;
            v49 = v24;
            v50 = 2112;
            v51 = v13;
            v52 = 2048;
            v53 = v27;
            _os_log_impl(&dword_1CCE01000, v21, OS_LOG_TYPE_INFO, "%{public}@Removed pending Bonjour %@, Event: %@, Current Count: %lu", buf, 0x2Au);

            v5 = v25;
            v17 = v24;
            self = v23;
            v16 = v35;

            v9 = v36;
          }

          objc_autoreleasePoolPop(v19);
          if (v39 && objc_msgSend(v17, "isEqualToString:", CFSTR("kHAPBonjourEventType_Remove")))
          {
            v28 = (void *)MEMORY[0x1D17B7244]();
            v29 = v20;
            HMFGetOSLogHandle();
            v30 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v30, OS_LOG_TYPE_INFO))
            {
              HMFGetLogIdentifier();
              v37 = v17;
              v31 = v9;
              v32 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = v34;
              v47 = v32;
              v48 = 2112;
              v49 = v16;
              _os_log_impl(&dword_1CCE01000, v30, OS_LOG_TYPE_INFO, "%{public}@Processing pending Bonjour remove event for BonjourDevice with name %@", buf, 0x16u);

              v9 = v31;
              v17 = v37;
            }

            objc_autoreleasePoolPop(v28);
            -[HAPAccessoryServerBrowserIP _handleBonjourRemoveWithEventInfo:](v29, "_handleBonjourRemoveWithEventInfo:", v13);
          }
          ++v9;

          v10 = v38;
        }

      }
      v41 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v42, v54, 16);
    }
    while (v41);
  }

  return v9;
}

- (void)devicePowerStateChanged:(unint64_t)a3
{
  void *v4;
  int v5;
  id v6;

  if (a3 == 2)
  {
    -[HAPAccessoryServerBrowserIP bonjourEventTimer](self, "bonjourEventTimer");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "isRunning");

    if (v5)
    {
      -[HAPAccessoryServerBrowserIP bonjourEventTimer](self, "bonjourEventTimer");
      v6 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "kick");

    }
  }
}

- (void)timerDidFire:(id)a3
{
  NSObject *v4;
  id v5;
  void *v6;
  id v7;

  v7 = a3;
  -[HAPAccessoryServerBrowser workQueue](self, "workQueue");
  v4 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v4);

  -[HAPAccessoryServerBrowserIP bonjourEventTimer](self, "bonjourEventTimer");
  v5 = (id)objc_claimAutoreleasedReturnValue();

  v6 = v7;
  if (v5 == v7)
  {
    -[HAPAccessoryServerBrowserIP _timerDidExpire:](self, "_timerDidExpire:", v7);
    v6 = v7;
  }

}

- (void)_timerDidExpire:(id)a3
{
  void *v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  double v15;
  double v16;
  id v17;
  void *v18;
  void *v19;
  HAPAccessoryServerBrowserIP *v20;
  NSObject *v21;
  void *v22;
  void *v23;
  void *v24;
  HAPAccessoryServerBrowserIP *v25;
  NSObject *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  uint64_t v31;
  void *v32;
  id v33;
  id v34;
  HAPAccessoryServerBrowserIP *v35;
  uint64_t v36;
  id v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  uint8_t buf[4];
  void *v43;
  __int16 v44;
  void *v45;
  _BYTE v46[128];
  uint64_t v47;

  v47 = *MEMORY[0x1E0C80C00];
  v33 = a3;
  -[HAPAccessoryServerBrowserIP pendingBonjourEvents](self, "pendingBonjourEvents");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v4, "copy");

  v40 = 0u;
  v41 = 0u;
  v38 = 0u;
  v39 = 0u;
  v6 = v5;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v38, v46, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v39;
    v34 = v6;
    v35 = self;
    do
    {
      v10 = 0;
      v36 = v8;
      do
      {
        if (*(_QWORD *)v39 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v38 + 1) + 8 * v10);
        objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("kHAPBonjourEventReceivedTimeKey"));
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("kHAPBonjourEventKey"));
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0C99D68], "date");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "timeIntervalSinceDate:", v12);
        v16 = v15;

        if (v16 > 40.0)
        {
          v37 = 0;
          -[HAPAccessoryServerBrowserIP _server:forBonjourDevice:](self, "_server:forBonjourDevice:", &v37, v13);
          v17 = v37;
          v18 = v17;
          if (v17 && objc_msgSend(v17, "isSessionRestoreActive"))
          {
            v19 = (void *)MEMORY[0x1D17B7244]();
            v20 = self;
            HMFGetOSLogHandle();
            v21 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
            {
              HMFGetLogIdentifier();
              v22 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("deviceID"));
              v23 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138543618;
              v43 = v22;
              v44 = 2114;
              v45 = v23;
              _os_log_impl(&dword_1CCE01000, v21, OS_LOG_TYPE_INFO, "%{public}@Timed out,  Not handling pending Bonjour for %{public}@, as session restore is active", buf, 0x16u);

              v6 = v34;
              self = v35;
            }

            objc_autoreleasePoolPop(v19);
          }
          else
          {
            v24 = (void *)MEMORY[0x1D17B7244]();
            v25 = self;
            HMFGetOSLogHandle();
            v26 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
            {
              HMFGetLogIdentifier();
              v27 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("deviceID"));
              v28 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138543618;
              v43 = v27;
              v44 = 2114;
              v45 = v28;
              _os_log_impl(&dword_1CCE01000, v26, OS_LOG_TYPE_INFO, "%{public}@Timed out, handling pending Bonjour event for %{public}@", buf, 0x16u);

              v6 = v34;
              self = v35;
            }

            objc_autoreleasePoolPop(v24);
            objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("deviceID"));
            v29 = (void *)objc_claimAutoreleasedReturnValue();
            -[HAPAccessoryServerBrowserIP _purgePendingBonjourEvents:withProcessing:](v25, "_purgePendingBonjourEvents:withProcessing:", v29, 1);

          }
          v8 = v36;
        }

        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v38, v46, 16);
    }
    while (v8);
  }

  -[HAPAccessoryServerBrowserIP pendingBonjourEvents](self, "pendingBonjourEvents");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = objc_msgSend(v30, "count");

  if (v31)
  {
    -[HAPAccessoryServerBrowserIP bonjourEventTimer](self, "bonjourEventTimer");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "resume");

  }
}

- (void)_invalidateWACServers
{
  HAPAccessoryServerBrowserIP *v2;
  void *v3;
  void *v4;
  id v5;
  uint64_t v6;
  __int128 v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  _BOOL4 v13;
  uint64_t v14;
  HAPAccessoryServerBrowserIP *v15;
  NSObject *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  HAPAccessoryServerBrowserIP *v22;
  NSObject *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  HAPAccessoryServerBrowserIP *v30;
  NSObject *v31;
  void *v32;
  void *v33;
  uint64_t v34;
  __int128 v35;
  id v36;
  HAPAccessoryServerBrowserIP *v37;
  uint64_t v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  uint8_t buf[4];
  void *v44;
  __int16 v45;
  void *v46;
  __int16 v47;
  void *v48;
  __int16 v49;
  void *v50;
  __int16 v51;
  void *v52;
  _BYTE v53[128];
  uint64_t v54;

  v2 = self;
  v54 = *MEMORY[0x1E0C80C00];
  -[HAPAccessoryServerBrowserIP discoveredAccessoryServers](self, "discoveredAccessoryServers");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "copy");

  v41 = 0u;
  v42 = 0u;
  v39 = 0u;
  v40 = 0u;
  v5 = v4;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v39, v53, 16);
  if (v6)
  {
    v8 = v6;
    v9 = *(_QWORD *)v40;
    *(_QWORD *)&v7 = 138543618;
    v35 = v7;
    v36 = v5;
    v37 = v2;
    v38 = *(_QWORD *)v40;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v40 != v9)
          objc_enumerationMutation(v5);
        v11 = *(void **)(*((_QWORD *)&v39 + 1) + 8 * v10);
        if (objc_msgSend(v11, "isWacAccessory", v35))
        {
          objc_msgSend(v11, "identifier");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          v13 = -[HAPAccessoryServerBrowser isPaired:](v2, "isPaired:", v12);

          if (v13)
          {
            v14 = MEMORY[0x1D17B7244]();
            v15 = v2;
            HMFGetOSLogHandle();
            v16 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
            {
              HMFGetLogIdentifier();
              v17 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v11, "name");
              v18 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v11, "identifier");
              v19 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138543874;
              v44 = v17;
              v45 = 2112;
              v46 = v18;
              v47 = 2114;
              v48 = v19;
              _os_log_impl(&dword_1CCE01000, v16, OS_LOG_TYPE_INFO, "%{public}@Accessory Server %@/%{public}@ is already paired - not removing the accessory server", buf, 0x20u);

              v9 = v38;
            }

            v20 = (void *)v14;
LABEL_17:
            objc_autoreleasePoolPop(v20);
            goto LABEL_18;
          }
          if ((objc_msgSend(v11, "hasBonjourDeviceInfo") & 1) != 0
            || objc_msgSend(v11, "isWacLegacy") && objc_msgSend(v11, "isWacComplete"))
          {
            v21 = MEMORY[0x1D17B7244]();
            v22 = v2;
            HMFGetOSLogHandle();
            v23 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
            {
              HMFGetLogIdentifier();
              v24 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v11, "name");
              v25 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v11, "identifier");
              v26 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v11, "isWacLegacy");
              HMFBooleanToString();
              v27 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v11, "isWacComplete");
              HMFBooleanToString();
              v28 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138544386;
              v44 = v24;
              v45 = 2112;
              v46 = v25;
              v47 = 2114;
              v48 = v26;
              v49 = 2112;
              v50 = v27;
              v51 = 2112;
              v52 = v28;
              _os_log_impl(&dword_1CCE01000, v23, OS_LOG_TYPE_INFO, "%{public}@Accessory Server %@/%{public}@ already has a Bonjour device info/completed WAC %@/%@ - not removing the accessory server", buf, 0x34u);

              v2 = v37;
              v9 = v38;

              v5 = v36;
            }

            v20 = (void *)v21;
            goto LABEL_17;
          }
          v29 = (void *)MEMORY[0x1D17B7244]();
          v30 = v2;
          HMFGetOSLogHandle();
          v31 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v31, OS_LOG_TYPE_INFO))
          {
            HMFGetLogIdentifier();
            v32 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v11, "identifier");
            v33 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = v35;
            v44 = v32;
            v45 = 2114;
            v46 = v33;
            _os_log_impl(&dword_1CCE01000, v31, OS_LOG_TYPE_INFO, "%{public}@Removing unpaired accessory %{public}@", buf, 0x16u);

            v2 = v37;
            v5 = v36;
          }

          objc_autoreleasePoolPop(v29);
          -[HAPAccessoryServerBrowserIP _invalidateAndRemoveAccessoryServer:](v30, "_invalidateAndRemoveAccessoryServer:", v11);
        }
LABEL_18:
        ++v10;
      }
      while (v8 != v10);
      v34 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v39, v53, 16);
      v8 = v34;
    }
    while (v34);
  }

}

- (BOOL)recommendBrowserReset
{
  return 1;
}

- (void)wacBrowser:(id)a3 didFindHAPWACAccessory:(id)a4
{
  id v5;
  NSObject *v6;
  id v7;
  _QWORD v8[5];
  id v9;

  v5 = a4;
  -[HAPAccessoryServerBrowser workQueue](self, "workQueue");
  v6 = objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __65__HAPAccessoryServerBrowserIP_wacBrowser_didFindHAPWACAccessory___block_invoke;
  v8[3] = &unk_1E894E0F8;
  v8[4] = self;
  v9 = v5;
  v7 = v5;
  dispatch_async(v6, v8);

}

- (void)wacBrowser:(id)a3 didRemoveHAPWACAccessory:(id)a4
{
  id v5;
  NSObject *v6;
  id v7;
  _QWORD v8[5];
  id v9;

  v5 = a4;
  -[HAPAccessoryServerBrowser workQueue](self, "workQueue");
  v6 = objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __67__HAPAccessoryServerBrowserIP_wacBrowser_didRemoveHAPWACAccessory___block_invoke;
  v8[3] = &unk_1E894E0F8;
  v8[4] = self;
  v9 = v5;
  v7 = v5;
  dispatch_async(v6, v8);

}

- (void)wacBrowser:(id)a3 didFindUnconfiguredPairedHAPWACAccessory:(id)a4
{
  id v5;
  NSObject *v6;
  id v7;
  _QWORD v8[5];
  id v9;

  v5 = a4;
  -[HAPAccessoryServerBrowser workQueue](self, "workQueue");
  v6 = objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __83__HAPAccessoryServerBrowserIP_wacBrowser_didFindUnconfiguredPairedHAPWACAccessory___block_invoke;
  v8[3] = &unk_1E894E0F8;
  v8[4] = self;
  v9 = v5;
  v7 = v5;
  dispatch_async(v6, v8);

}

- (id)serverWithIdentifier:(id)a3 ignoreLPM:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  int v14;
  id v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v4 = a4;
  v22 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  -[HAPAccessoryServerBrowserIP discoveredAccessoryServers](self, "discoveredAccessoryServers", 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v18;
LABEL_3:
    v11 = 0;
    while (1)
    {
      if (*(_QWORD *)v18 != v10)
        objc_enumerationMutation(v7);
      v12 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * v11);
      objc_msgSend(v12, "identifier");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = objc_msgSend(v13, "isEqual:", v6);

      if (v14)
        break;
      if (v9 == ++v11)
      {
        v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
        if (v9)
          goto LABEL_3;
        goto LABEL_13;
      }
    }
    if ((!v4 || !objc_msgSend(v12, "wakeNumber")) && (objc_msgSend(v12, "isWacAccessory") & 1) == 0)
    {
      v15 = v12;
      goto LABEL_15;
    }
  }
LABEL_13:
  v15 = 0;
LABEL_15:

  return v15;
}

- (void)unitTest_handleBonjourBrowserEvent:(unsigned int)a3 eventInfo:(id)a4
{
  id v6;
  NSObject *v7;
  id v8;
  _QWORD block[5];
  id v10;
  unsigned int v11;

  v6 = a4;
  -[HAPAccessoryServerBrowser workQueue](self, "workQueue");
  v7 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __76__HAPAccessoryServerBrowserIP_unitTest_handleBonjourBrowserEvent_eventInfo___block_invoke;
  block[3] = &unk_1E894BC78;
  v11 = a3;
  block[4] = self;
  v10 = v6;
  v8 = v6;
  dispatch_sync(v7, block);

}

- (id)logIdentifier
{
  return CFSTR("IP Browser");
}

- (NSMutableSet)discoveredAccessoryServers
{
  return self->_discoveredAccessoryServers;
}

- (void)setDiscoveredAccessoryServers:(id)a3
{
  objc_storeStrong((id *)&self->_discoveredAccessoryServers, a3);
}

- (HAPAccessoryServerBrowserDelegate)delegate
{
  return (HAPAccessoryServerBrowserDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (OS_dispatch_queue)delegateQueue
{
  return self->_delegateQueue;
}

- (void)setDelegateQueue:(id)a3
{
  objc_storeStrong((id *)&self->_delegateQueue, a3);
}

- (NSOperationQueue)delegateOperationQueue
{
  return self->_delegateOperationQueue;
}

- (void)setDelegateOperationQueue:(id)a3
{
  objc_storeStrong((id *)&self->_delegateOperationQueue, a3);
}

- (NSMutableSet)pendingBonjourEvents
{
  return self->_pendingBonjourEvents;
}

- (void)setPendingBonjourEvents:(id)a3
{
  objc_storeStrong((id *)&self->_pendingBonjourEvents, a3);
}

- (HMFTimer)bonjourEventTimer
{
  return self->_bonjourEventTimer;
}

- (void)setBonjourEventTimer:(id)a3
{
  objc_storeStrong((id *)&self->_bonjourEventTimer, a3);
}

- (HAPWACAccessoryBrowser)hapWACBrowser
{
  return self->_hapWACBrowser;
}

- (void)setHapWACBrowser:(id)a3
{
  objc_storeStrong((id *)&self->_hapWACBrowser, a3);
}

- (HAPPowerManager)powerManager
{
  return self->_powerManager;
}

- (void)setPowerManager:(id)a3
{
  objc_storeStrong((id *)&self->_powerManager, a3);
}

- (NSString)serverIdentifierToSkipBonjourUpdate
{
  return self->_serverIdentifierToSkipBonjourUpdate;
}

- (void)setServerIdentifierToSkipBonjourUpdate:(id)a3
{
  objc_storeStrong((id *)&self->_serverIdentifierToSkipBonjourUpdate, a3);
}

- (unint64_t)maximumNumberOfPairVeifiesAllowed
{
  return self->_maximumNumberOfPairVeifiesAllowed;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serverIdentifierToSkipBonjourUpdate, 0);
  objc_storeStrong((id *)&self->_powerManager, 0);
  objc_storeStrong((id *)&self->_hapWACBrowser, 0);
  objc_storeStrong((id *)&self->_bonjourEventTimer, 0);
  objc_storeStrong((id *)&self->_pendingBonjourEvents, 0);
  objc_storeStrong((id *)&self->_delegateOperationQueue, 0);
  objc_storeStrong((id *)&self->_delegateQueue, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_discoveredAccessoryServers, 0);
}

uint64_t __76__HAPAccessoryServerBrowserIP_unitTest_handleBonjourBrowserEvent_eventInfo___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_handleBonjourBrowserEvent:eventInfo:", *(unsigned int *)(a1 + 48), *(_QWORD *)(a1 + 40));
}

void __83__HAPAccessoryServerBrowserIP_wacBrowser_didFindUnconfiguredPairedHAPWACAccessory___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  NSObject *v4;
  void *v5;
  uint64_t v6;
  HAPAccessoryServerIP *v7;
  HAPAccessoryServerIP *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  void *v14;
  id v15;
  NSObject *v16;
  NSObject *v17;
  void *v18;
  void *v19;
  char v20;
  void *v21;
  void *v22;
  char v23;
  uint64_t v24;
  void *v25;
  id v26;
  uint64_t v27;
  void *v28;
  void *v29;
  id v30;
  uint64_t v31;
  void *v32;
  void *v33;
  uint64_t v34;
  _QWORD v35[4];
  id v36;
  uint64_t v37;
  HAPAccessoryServerIP *v38;
  _QWORD v39[4];
  id v40;
  uint64_t v41;
  HAPAccessoryServerIP *v42;
  id v43;
  uint8_t buf[4];
  void *v45;
  __int16 v46;
  uint64_t v47;
  uint64_t v48;

  v48 = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x1D17B7244]();
  v3 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    HMFGetLogIdentifier();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = *(_QWORD *)(a1 + 40);
    *(_DWORD *)buf = 138543618;
    v45 = v5;
    v46 = 2112;
    v47 = v6;
    _os_log_impl(&dword_1CCE01000, v4, OS_LOG_TYPE_DEBUG, "%{public}@WAC Browser found Unconfigured Accessory: %@", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v2);
  if (objc_msgSend(*(id *)(a1 + 40), "isHomeKitAccessory"))
  {
    v43 = 0;
    objc_msgSend(*(id *)(a1 + 32), "_server:forHAPWACAccessory:", &v43, *(_QWORD *)(a1 + 40));
    v7 = (HAPAccessoryServerIP *)v43;
    if (!v7)
    {
      v8 = [HAPAccessoryServerIP alloc];
      v9 = *(_QWORD *)(a1 + 40);
      objc_msgSend(*(id *)(a1 + 32), "keyStore");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = -[HAPAccessoryServerIP initWithHAPWACAccessory:keystore:browser:](v8, "initWithHAPWACAccessory:keystore:browser:", v9, v10, *(_QWORD *)(a1 + 32));

    }
    v11 = *(void **)(a1 + 32);
    -[HAPAccessoryServer identifier](v7, "identifier");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v11, "isPaired:", v12);

    v14 = (void *)MEMORY[0x1D17B7244]();
    v15 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    v16 = objc_claimAutoreleasedReturnValue();
    v17 = v16;
    if (v13)
    {
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
      {
        HMFGetLogIdentifier();
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v45 = v18;
        _os_log_impl(&dword_1CCE01000, v17, OS_LOG_TYPE_DEBUG, "%{public}@Found unconfigured server paired with us - needs to reprovision", buf, 0xCu);

      }
      objc_autoreleasePoolPop(v14);
      objc_msgSend(*(id *)(a1 + 32), "discoveredAccessoryServers");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = objc_msgSend(v19, "containsObject:", v7);

      if ((v20 & 1) == 0)
      {
        objc_msgSend(*(id *)(a1 + 32), "discoveredAccessoryServers");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "addObject:", v7);

      }
      objc_msgSend(*(id *)(a1 + 32), "delegate");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = objc_opt_respondsToSelector();
      v24 = MEMORY[0x1E0C809B0];
      if ((v23 & 1) != 0)
      {
        v25 = *(void **)(a1 + 32);
        v39[0] = MEMORY[0x1E0C809B0];
        v39[1] = 3221225472;
        v39[2] = __83__HAPAccessoryServerBrowserIP_wacBrowser_didFindUnconfiguredPairedHAPWACAccessory___block_invoke_68;
        v39[3] = &unk_1E894E120;
        v26 = v22;
        v27 = *(_QWORD *)(a1 + 32);
        v40 = v26;
        v41 = v27;
        v42 = v7;
        -[HAPAccessoryServer identifier](v42, "identifier");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "pendDelegateBlock:identifier:", v39, v28);

      }
      if ((objc_opt_respondsToSelector() & 1) != 0)
      {
        v29 = *(void **)(a1 + 32);
        v35[0] = v24;
        v35[1] = 3221225472;
        v35[2] = __83__HAPAccessoryServerBrowserIP_wacBrowser_didFindUnconfiguredPairedHAPWACAccessory___block_invoke_2;
        v35[3] = &unk_1E894E120;
        v30 = v22;
        v31 = *(_QWORD *)(a1 + 32);
        v36 = v30;
        v37 = v31;
        v38 = v7;
        -[HAPAccessoryServer identifier](v38, "identifier");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v29, "pendDelegateBlock:identifier:", v35, v32);

      }
    }
    else
    {
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        v34 = *(_QWORD *)(a1 + 40);
        *(_DWORD *)buf = 138543618;
        v45 = v33;
        v46 = 2112;
        v47 = v34;
        _os_log_impl(&dword_1CCE01000, v17, OS_LOG_TYPE_ERROR, "%{public}@Ignoring accessory not paired with us: %@", buf, 0x16u);

      }
      objc_autoreleasePoolPop(v14);
    }

  }
}

uint64_t __83__HAPAccessoryServerBrowserIP_wacBrowser_didFindUnconfiguredPairedHAPWACAccessory___block_invoke_68(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "accessoryServerBrowser:didFindAccessoryServerNeedingReprovisioning:error:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), 0);
}

uint64_t __83__HAPAccessoryServerBrowserIP_wacBrowser_didFindUnconfiguredPairedHAPWACAccessory___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "accessoryServerBrowser:didFindAccessoryServerForReprovisioning:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

void __67__HAPAccessoryServerBrowserIP_wacBrowser_didRemoveHAPWACAccessory___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  NSObject *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  HAPAccessoryServerBrowserInvalidateServerOperation *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  _QWORD v27[4];
  id v28;
  id v29;
  id v30;
  uint8_t buf[4];
  void *v32;
  __int16 v33;
  void *v34;
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x1D17B7244]();
  v3 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    HMFGetLogIdentifier();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = *(void **)(a1 + 40);
    *(_DWORD *)buf = 138543618;
    v32 = v5;
    v33 = 2112;
    v34 = v6;
    _os_log_impl(&dword_1CCE01000, v4, OS_LOG_TYPE_DEBUG, "%{public}@Removing WAC Accessory: %@", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v2);
  v7 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "deviceId");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "serverWithIdentifier:ignoreLPM:", v8, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = (void *)MEMORY[0x1D17B7244]();
  v11 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v12 = objc_claimAutoreleasedReturnValue();
  v13 = v12;
  if (v9)
  {
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v32 = v14;
      v33 = 2114;
      v34 = v9;
      _os_log_impl(&dword_1CCE01000, v13, OS_LOG_TYPE_INFO, "%{public}@WAC accessory was removed invalidating server: %{public}@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v10);
    objc_msgSend(*(id *)(a1 + 32), "delegate");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = -[HAPAccessoryServerBrowserInvalidateServerOperation initWithServer:]([HAPAccessoryServerBrowserInvalidateServerOperation alloc], "initWithServer:", v9);
    v17 = *(void **)(a1 + 32);
    objc_msgSend(v9, "identifier");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "pendDelegateOperation:identifier:", v16, v18);

    if (v15 && (objc_opt_respondsToSelector() & 1) != 0)
    {
      objc_initWeak((id *)buf, *(id *)(a1 + 32));
      v19 = (void *)MEMORY[0x1E0CB34C8];
      v27[0] = MEMORY[0x1E0C809B0];
      v27[1] = 3221225472;
      v27[2] = __67__HAPAccessoryServerBrowserIP_wacBrowser_didRemoveHAPWACAccessory___block_invoke_65;
      v27[3] = &unk_1E894DFD8;
      objc_copyWeak(&v30, (id *)buf);
      v28 = v15;
      v20 = v9;
      v29 = v20;
      objc_msgSend(v19, "blockOperationWithBlock:", v27);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "addDependency:", v16);
      v22 = *(void **)(a1 + 32);
      objc_msgSend(v20, "identifier");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "pendDelegateOperation:identifier:", v21, v23);

      objc_destroyWeak(&v30);
      objc_destroyWeak((id *)buf);
    }
    objc_msgSend(*(id *)(a1 + 32), "discoveredAccessoryServers");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "removeObject:", v9);

  }
  else
  {
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
    {
      HMFGetLogIdentifier();
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = *(void **)(a1 + 40);
      *(_DWORD *)buf = 138543618;
      v32 = v25;
      v33 = 2112;
      v34 = v26;
      _os_log_impl(&dword_1CCE01000, v13, OS_LOG_TYPE_DEBUG, "%{public}@Unknown wac device was removed: %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v10);
  }

}

void __67__HAPAccessoryServerBrowserIP_wacBrowser_didRemoveHAPWACAccessory___block_invoke_65(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  objc_msgSend(*(id *)(a1 + 32), "accessoryServerBrowser:didRemoveAccessoryServer:error:", WeakRetained, *(_QWORD *)(a1 + 40), 0);

}

void __65__HAPAccessoryServerBrowserIP_wacBrowser_didFindHAPWACAccessory___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  NSObject *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  id v8;
  NSObject *v9;
  void *v10;
  id v11;
  NSObject *v12;
  void *v13;
  uint64_t v14;
  HAPAccessoryServerIP *v15;
  HAPAccessoryServerIP *v16;
  HAPAccessoryServerIP *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  uint64_t v24;
  void *v25;
  _QWORD v26[4];
  id v27;
  uint64_t v28;
  HAPAccessoryServerIP *v29;
  id v30;
  uint8_t buf[4];
  void *v32;
  __int16 v33;
  uint64_t v34;
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x1D17B7244]();
  v3 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    HMFGetLogIdentifier();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = *(_QWORD *)(a1 + 40);
    *(_DWORD *)buf = 138543618;
    v32 = v5;
    v33 = 2112;
    v34 = v6;
    _os_log_impl(&dword_1CCE01000, v4, OS_LOG_TYPE_DEBUG, "%{public}@WAC Browser found wac accessory: %@", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v2);
  if (!objc_msgSend(*(id *)(a1 + 40), "isHomeKitAccessory"))
  {
    v7 = (void *)MEMORY[0x1D17B7244]();
    v11 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
    {
      HMFGetLogIdentifier();
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = *(_QWORD *)(a1 + 40);
      *(_DWORD *)buf = 138543618;
      v32 = v13;
      v33 = 2112;
      v34 = v14;
      _os_log_impl(&dword_1CCE01000, v12, OS_LOG_TYPE_DEBUG, "%{public}@Ignoring unknown accessory: %@", buf, 0x16u);

    }
    goto LABEL_11;
  }
  if (objc_msgSend(*(id *)(a1 + 40), "requiresOwnershipToken"))
  {
    v7 = (void *)MEMORY[0x1D17B7244]();
    v8 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    {
      HMFGetLogIdentifier();
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v32 = v10;
      _os_log_impl(&dword_1CCE01000, v9, OS_LOG_TYPE_DEBUG, "%{public}@Ignoring WAC accessory requiring ownership token", buf, 0xCu);

    }
LABEL_11:
    objc_autoreleasePoolPop(v7);
    return;
  }
  v30 = 0;
  objc_msgSend(*(id *)(a1 + 32), "_server:forHAPWACAccessory:", &v30, *(_QWORD *)(a1 + 40));
  v15 = (HAPAccessoryServerIP *)v30;
  if (v15)
  {
    v16 = v15;
    -[HAPAccessoryServerIP updateWithHAPWACAccessory:](v15, "updateWithHAPWACAccessory:", *(_QWORD *)(a1 + 40));
  }
  else
  {
    v17 = [HAPAccessoryServerIP alloc];
    v18 = *(_QWORD *)(a1 + 40);
    objc_msgSend(*(id *)(a1 + 32), "keyStore");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = -[HAPAccessoryServerIP initWithHAPWACAccessory:keystore:browser:](v17, "initWithHAPWACAccessory:keystore:browser:", v18, v19, *(_QWORD *)(a1 + 32));

    objc_msgSend(*(id *)(a1 + 32), "discoveredAccessoryServers");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "addObject:", v16);

  }
  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v22 = *(void **)(a1 + 32);
    v26[0] = MEMORY[0x1E0C809B0];
    v26[1] = 3221225472;
    v26[2] = __65__HAPAccessoryServerBrowserIP_wacBrowser_didFindHAPWACAccessory___block_invoke_64;
    v26[3] = &unk_1E894E120;
    v23 = v21;
    v24 = *(_QWORD *)(a1 + 32);
    v27 = v23;
    v28 = v24;
    v29 = v16;
    -[HAPAccessoryServer identifier](v29, "identifier", v26[0], 3221225472, __65__HAPAccessoryServerBrowserIP_wacBrowser_didFindHAPWACAccessory___block_invoke_64, &unk_1E894E120);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "pendDelegateBlock:identifier:", v26, v25);

  }
}

uint64_t __65__HAPAccessoryServerBrowserIP_wacBrowser_didFindHAPWACAccessory___block_invoke_64(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "accessoryServerBrowser:didFindAccessoryServer:stateChanged:stateNumber:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), 0, 0);
}

uint64_t __76__HAPAccessoryServerBrowserIP_processPendingBonjourRemoveEventsForDeviceID___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_purgePendingBonjourEvents:withProcessing:", *(_QWORD *)(a1 + 40), 1);
}

void __88__HAPAccessoryServerBrowserIP_indicateNotificationFromServer_notifyType_withDictionary___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  void *v13;
  id v14;
  NSObject *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  id v20;
  NSObject *v21;
  _BOOL4 v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  uint8_t buf[4];
  void *v33;
  __int16 v34;
  void *v35;
  __int16 v36;
  void *v37;
  __int16 v38;
  void *v39;
  _BYTE v40[128];
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  v2 = *(void **)(a1 + 32);
  if (v2)
  {
    objc_msgSend(v2, "hmf_numberForKey:", CFSTR("HAPAccessoryInstanceID"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }
  v30 = 0u;
  v31 = 0u;
  v28 = 0u;
  v29 = 0u;
  objc_msgSend(*(id *)(a1 + 40), "discoveredAccessoryServers", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v28, v40, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v29;
    while (2)
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v29 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v28 + 1) + 8 * i);
        objc_msgSend(v9, "identifier");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(a1 + 48), "identifier");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = objc_msgSend(v10, "isEqualToString:", v11);

        if (v12)
        {
          v18 = *(_QWORD *)(a1 + 56);
          v19 = (void *)MEMORY[0x1D17B7244]();
          v20 = *(id *)(a1 + 40);
          HMFGetOSLogHandle();
          v21 = objc_claimAutoreleasedReturnValue();
          v22 = os_log_type_enabled(v21, OS_LOG_TYPE_INFO);
          if (v18 == 1)
          {
            if (v22)
            {
              HMFGetLogIdentifier();
              v23 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v9, "identifier");
              v24 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138543874;
              v33 = v23;
              v34 = 2114;
              v35 = v24;
              v36 = 2114;
              v37 = v3;
              _os_log_impl(&dword_1CCE01000, v21, OS_LOG_TYPE_INFO, "%{public}@Browser - Notification HAPNotification_ReachabilityUpdate from server %{public}@ with instanceId %{public}@", buf, 0x20u);

            }
            objc_autoreleasePoolPop(v19);
            objc_msgSend(*(id *)(a1 + 40), "_doReachabilityUpdateForServer:withDictionary:", v9, *(_QWORD *)(a1 + 32));
          }
          else
          {
            if (v22)
            {
              HMFGetLogIdentifier();
              v25 = (void *)objc_claimAutoreleasedReturnValue();
              +[HAPNotification typeToString:](HAPNotification, "typeToString:", *(_QWORD *)(a1 + 56));
              v26 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v9, "identifier");
              v27 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138544130;
              v33 = v25;
              v34 = 2112;
              v35 = v26;
              v36 = 2114;
              v37 = v27;
              v38 = 2114;
              v39 = v3;
              _os_log_impl(&dword_1CCE01000, v21, OS_LOG_TYPE_INFO, "%{public}@Browser - Unhandled notification %@ from server %{public}@ with instanceId %{public}@", buf, 0x2Au);

            }
            objc_autoreleasePoolPop(v19);
          }

          goto LABEL_23;
        }
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v28, v40, 16);
      if (v6)
        continue;
      break;
    }
  }

  v13 = (void *)MEMORY[0x1D17B7244]();
  v14 = *(id *)(a1 + 40);
  HMFGetOSLogHandle();
  v15 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
  {
    HMFGetLogIdentifier();
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 48), "identifier");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v33 = v16;
    v34 = 2114;
    v35 = v17;
    _os_log_impl(&dword_1CCE01000, v15, OS_LOG_TYPE_ERROR, "%{public}@*** Server Browser Failed to find AccessoryServerIP object for handling notification: %{public}@", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v13);
LABEL_23:

}

void __67__HAPAccessoryServerBrowserIP__invalidateAndRemoveAccessoryServer___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  objc_msgSend(*(id *)(a1 + 32), "accessoryServerBrowser:didRemoveAccessoryServer:error:", WeakRetained, *(_QWORD *)(a1 + 40), 0);

}

uint64_t __86__HAPAccessoryServerBrowserIP_handleConnectionUpdateWithBonjourDeviceInfo_socketInfo___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_handleConnectionUpdateWithBonjourDeviceInfo:socketInfo:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

void __87__HAPAccessoryServerBrowserIP__handleConnectionUpdateWithBonjourDeviceInfo_socketInfo___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "accessoryServerBrowser:didFindAccessoryServer:stateChanged:stateNumber:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), 0, 0);

}

void __68__HAPAccessoryServerBrowserIP__handleBonjourBrowserEvent_eventInfo___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "accessoryServerBrowser:didStopDiscoveringWithError:", *(_QWORD *)(a1 + 32), 0);

}

uint64_t __98__HAPAccessoryServerBrowserIP_matchAccessoryServerWithSetupID_serverIdentifier_completionHandler___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_matchAccessoryServerWithSetupID:serverIdentifier:completionHandler:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));
}

uint64_t __65__HAPAccessoryServerBrowserIP_processPendingBonjourRemoveEvents___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_processPendingBonjourEvent:", *(_QWORD *)(a1 + 40));
}

void __69__HAPAccessoryServerBrowserIP_discoverAccessoryServerWithIdentifier___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  id *v5;
  uint64_t v6;
  uint64_t *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void (*v11)(uint64_t);
  void *v12;
  void *v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  void (*v17)(uint64_t);
  void *v18;
  void *v19;
  id v20;

  objc_msgSend(*(id *)(a1 + 32), "serverWithIdentifier:ignoreLPM:", *(_QWORD *)(a1 + 40), 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = *(void **)(a1 + 32);
  if (v2)
  {
    if (objc_msgSend(v3, "_delegateRespondsToSelector:", sel_accessoryServerBrowser_didFindAccessoryServer_stateChanged_stateNumber_))
    {
      v4 = *(void **)(a1 + 32);
      v15 = MEMORY[0x1E0C809B0];
      v16 = 3221225472;
      v17 = __69__HAPAccessoryServerBrowserIP_discoverAccessoryServerWithIdentifier___block_invoke_2;
      v18 = &unk_1E894E0F8;
      v19 = v4;
      v5 = &v20;
      v20 = v2;
      v6 = *(_QWORD *)(a1 + 40);
      v7 = &v15;
LABEL_6:
      objc_msgSend(v4, "pendDelegateBlock:identifier:", v7, v6, v9, v10, v11, v12, v13, v14, v15, v16, v17, v18, v19, v20);

    }
  }
  else if (objc_msgSend(v3, "_delegateRespondsToSelector:", sel_accessoryServerBrowser_didFailToDiscoverAccessoryServerWithIdentifier_))
  {
    v9 = MEMORY[0x1E0C809B0];
    v10 = 3221225472;
    v11 = __69__HAPAccessoryServerBrowserIP_discoverAccessoryServerWithIdentifier___block_invoke_3;
    v12 = &unk_1E894E0F8;
    v4 = *(void **)(a1 + 32);
    v8 = *(void **)(a1 + 40);
    v13 = v4;
    v5 = &v14;
    v14 = v8;
    v6 = *(_QWORD *)(a1 + 40);
    v7 = &v9;
    goto LABEL_6;
  }

}

void __69__HAPAccessoryServerBrowserIP_discoverAccessoryServerWithIdentifier___block_invoke_2(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "accessoryServerBrowser:didFindAccessoryServer:stateChanged:stateNumber:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), 0, 0);

}

void __69__HAPAccessoryServerBrowserIP_discoverAccessoryServerWithIdentifier___block_invoke_3(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "accessoryServerBrowser:didFailToDiscoverAccessoryServerWithIdentifier:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

}

void __82__HAPAccessoryServerBrowserIP_notifyDelegatesOfWACCompletionWithIdentifier_error___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "accessoryServerBrowser:didFinishWACForAccessoryWithIdentifier:error:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));

}

void __82__HAPAccessoryServerBrowserIP_stopDiscoveringWACAccessoryServersWithInvalidation___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  NSObject *v4;
  void *v5;
  void *v6;
  int v7;
  void *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x1D17B7244]();
  v3 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = 138543362;
    v8 = v5;
    _os_log_impl(&dword_1CCE01000, v4, OS_LOG_TYPE_INFO, "%{public}@Stopping browse for WAC accessories", (uint8_t *)&v7, 0xCu);

  }
  objc_autoreleasePoolPop(v2);
  objc_msgSend(*(id *)(a1 + 32), "hapWACBrowser");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "stopDiscoveringAccessoryServers");

  if (*(_BYTE *)(a1 + 40))
    objc_msgSend(*(id *)(a1 + 32), "_invalidateWACServers");
}

void __62__HAPAccessoryServerBrowserIP_stopDiscoveringAccessoryServers__block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  NSObject *v4;
  void *v5;
  _QWORD *v6;
  void *v7;
  int v8;
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x1D17B7244]();
  v3 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = 138543362;
    v9 = v5;
    _os_log_impl(&dword_1CCE01000, v4, OS_LOG_TYPE_INFO, "%{public}@Stopping browse for IP accessories", (uint8_t *)&v8, 0xCu);

  }
  objc_autoreleasePoolPop(v2);
  v6 = *(_QWORD **)(a1 + 32);
  if (v6[7])
  {
    BonjourBrowser_Stop();
    CFRelease(*(CFTypeRef *)(*(_QWORD *)(a1 + 32) + 56));
    *(_QWORD *)(*(_QWORD *)(a1 + 32) + 56) = 0;
    v6 = *(_QWORD **)(a1 + 32);
  }
  objc_msgSend(v6, "powerManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "deRegisterFromSleepWake:", *(_QWORD *)(a1 + 32));

}

void __78__HAPAccessoryServerBrowserIP_startDiscoveringAirPlayAccessoriesWithDelegate___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  NSObject *v4;
  void *v5;
  void *v6;
  int v7;
  void *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x1D17B7244]();
  v3 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = 138543362;
    v8 = v5;
    _os_log_impl(&dword_1CCE01000, v4, OS_LOG_TYPE_INFO, "%{public}@Starting browse for AirPlay WAC accessories...", (uint8_t *)&v7, 0xCu);

  }
  objc_autoreleasePoolPop(v2);
  objc_msgSend(*(id *)(a1 + 32), "hapWACBrowser");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "startDiscoveringAirPlayAccessoriesWithDelegate:", *(_QWORD *)(a1 + 40));

}

void __80__HAPAccessoryServerBrowserIP_startDiscoveringWACAccessoryServerWithIdentifier___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  NSObject *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  int v8;
  void *v9;
  __int16 v10;
  uint64_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x1D17B7244]();
  v3 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = *(_QWORD *)(a1 + 40);
    v8 = 138543618;
    v9 = v5;
    v10 = 2114;
    v11 = v6;
    _os_log_impl(&dword_1CCE01000, v4, OS_LOG_TYPE_INFO, "%{public}@Starting browse for HAP WAC accessories with identifier: %{public}@", (uint8_t *)&v8, 0x16u);

  }
  objc_autoreleasePoolPop(v2);
  objc_msgSend(*(id *)(a1 + 32), "hapWACBrowser");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "discoverAccessoryServerWithIdentifier:", *(_QWORD *)(a1 + 40));

}

void __66__HAPAccessoryServerBrowserIP_startDiscoveringWACAccessoryServers__block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  NSObject *v4;
  void *v5;
  void *v6;
  int v7;
  void *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x1D17B7244]();
  v3 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = 138543362;
    v8 = v5;
    _os_log_impl(&dword_1CCE01000, v4, OS_LOG_TYPE_INFO, "%{public}@Starting browse for HAP WAC accessories...", (uint8_t *)&v7, 0xCu);

  }
  objc_autoreleasePoolPop(v2);
  objc_msgSend(*(id *)(a1 + 32), "hapWACBrowser");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "startDiscoveringAccessoryServers");

}

void __63__HAPAccessoryServerBrowserIP_startDiscoveringAccessoryServers__block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  NSObject *v4;
  void *v5;
  int v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  _QWORD v12[5];
  int v13;
  uint8_t buf[4];
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x1D17B7244]();
  v3 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v15 = v5;
    _os_log_impl(&dword_1CCE01000, v4, OS_LOG_TYPE_INFO, "%{public}@Starting browse for IP accessories...", buf, 0xCu);

  }
  objc_autoreleasePoolPop(v2);
  v6 = objc_msgSend(*(id *)(a1 + 32), "_initializeAndStartBonjourBrowser");
  if (objc_msgSend(*(id *)(a1 + 32), "_delegateRespondsToSelector:", sel_accessoryServerBrowser_didStartDiscoveringWithError_))
  {
    v7 = *(void **)(a1 + 32);
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __63__HAPAccessoryServerBrowserIP_startDiscoveringAccessoryServers__block_invoke_39;
    v12[3] = &unk_1E894D748;
    v12[4] = v7;
    v13 = v6;
    objc_msgSend(v7, "pendDelegateBlock:identifier:", v12, 0);
  }
  +[HAPPowerManager sharedInstance](HAPPowerManager, "sharedInstance");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "setPowerManager:", v8);

  objc_msgSend(*(id *)(a1 + 32), "powerManager");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = *(void **)(a1 + 32);
  objc_msgSend(v10, "workQueue");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "registerForSleepWake:queue:", v10, v11);

}

void __63__HAPAccessoryServerBrowserIP_startDiscoveringAccessoryServers__block_invoke_39(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  id v4;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  v2 = *(_QWORD *)(a1 + 32);
  HMErrorFromOSStatus(*(unsigned int *)(a1 + 40));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "accessoryServerBrowser:didStartDiscoveringWithError:", v2, v3);

}

void __49__HAPAccessoryServerBrowserIP_setDelegate_queue___block_invoke(uint64_t a1)
{
  uint64_t v2;
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "setDelegate:", *(_QWORD *)(a1 + 40));
  objc_msgSend(*(id *)(a1 + 32), "setDelegateQueue:", *(_QWORD *)(a1 + 48));
  v2 = *(_QWORD *)(a1 + 48);
  objc_msgSend(*(id *)(a1 + 32), "delegateOperationQueue");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setUnderlyingQueue:", v2);

}

uint64_t __64__HAPAccessoryServerBrowserIP__initializeAndStartBonjourBrowser__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(a1 + 32), "_handleBonjourBrowserEvent:eventInfo:", a2, a3);
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t50 != -1)
    dispatch_once(&logCategory__hmf_once_t50, &__block_literal_global_9740);
  return (id)logCategory__hmf_once_v51;
}

void __42__HAPAccessoryServerBrowserIP_logCategory__block_invoke()
{
  uint64_t v0;
  void *v1;

  HMFCreateOSLogHandle();
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)logCategory__hmf_once_v51;
  logCategory__hmf_once_v51 = v0;

}

@end
