@implementation _HAPAccessoryServerBTLE200

- (_HAPAccessoryServerBTLE200)initWithPeripheral:(id)a3 name:(id)a4 pairingUsername:(id)a5 statusFlags:(id)a6 stateNumber:(id)a7 stateChanged:(BOOL)a8 connectReason:(unsigned __int8)a9 configNumber:(id)a10 category:(id)a11 setupHash:(id)a12 connectionIdleTime:(unsigned __int8)a13 browser:(id)a14 keyStore:(id)a15 whbStableIdentifier:(id)a16
{
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;
  id v25;
  id v26;
  void *v27;
  id v28;
  id v29;
  void *v30;
  void *v31;
  id v32;
  void *v33;
  _HAPAccessoryServerBTLE200 *v34;
  uint64_t v35;
  NSMutableArray *pendingRequests;
  uint64_t v37;
  NSMutableArray *pendingResponses;
  uint64_t v39;
  NSMutableArray *operationsReceivedDuringConnectionStateChange;
  uint64_t v41;
  NSMapTable *characteristicWriteCompletionHandlers;
  uint64_t v43;
  NSMapTable *characteristicEnableEventCompletionHandlers;
  uint64_t v45;
  NSMutableSet *discoveredAccessoryCharacteristicsPendingRead;
  id v47;
  id v48;
  void *v49;
  id v50;
  void *v51;
  id v52;
  void *v53;
  uint64_t v54;
  HMFTimer *connectionIdleTimer;
  HMFTimer *v56;
  void *v57;
  void *v58;
  HAPBLEPeripheralInfo *v59;
  void *v60;
  double Current;
  void *v62;
  HAPBLEPeripheralInfo *v63;
  HAPBLEAccessoryCache *v64;
  uint64_t v65;
  void *v66;
  void *v67;
  uint64_t v68;
  void *v69;
  void *v70;
  char v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  char v77;
  void *v78;
  uint64_t v79;
  void *v80;
  void *v81;
  void *v82;
  id v84;
  id v85;
  void *v86;
  void *v87;
  void *v88;
  id v89;
  void *v90;
  id v91;
  void *v92;
  id v94;
  _BOOL4 v95;
  void *v96;
  void *v97;
  void *v98;
  id v99;
  _QWORD v100[4];
  id v101;
  id location;
  objc_super v103;

  v95 = a8;
  v20 = a3;
  v21 = a4;
  v99 = a5;
  v22 = a6;
  v23 = a7;
  v24 = a10;
  v25 = a11;
  v26 = a12;
  v27 = v22;
  v28 = a14;
  v29 = a15;
  v103.receiver = self;
  v103.super_class = (Class)_HAPAccessoryServerBTLE200;
  v94 = a16;
  v85 = v25;
  v97 = v25;
  v30 = v23;
  v31 = v99;
  v98 = v20;
  v32 = v20;
  v33 = v21;
  v34 = -[HAPAccessoryServerBTLE initWithPeripheral:name:pairingUsername:statusFlags:stateNumber:stateChanged:connectReason:configNumber:category:setupHash:connectionIdleTime:browser:keyStore:whbStableIdentifier:](&v103, sel_initWithPeripheral_name_pairingUsername_statusFlags_stateNumber_stateChanged_connectReason_configNumber_category_setupHash_connectionIdleTime_browser_keyStore_whbStableIdentifier_, v32, v21, v99, v22, v30, v95, a9, v24, v85, v26, a13, v28, v29, v94);
  if (!v34)
    goto LABEL_13;
  v89 = v29;
  v91 = v26;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v35 = objc_claimAutoreleasedReturnValue();
  pendingRequests = v34->_pendingRequests;
  v34->_pendingRequests = (NSMutableArray *)v35;

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v37 = objc_claimAutoreleasedReturnValue();
  pendingResponses = v34->_pendingResponses;
  v34->_pendingResponses = (NSMutableArray *)v37;

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v39 = objc_claimAutoreleasedReturnValue();
  operationsReceivedDuringConnectionStateChange = v34->_operationsReceivedDuringConnectionStateChange;
  v34->_operationsReceivedDuringConnectionStateChange = (NSMutableArray *)v39;

  objc_msgSend(MEMORY[0x1E0CB3748], "weakToStrongObjectsMapTable");
  v41 = objc_claimAutoreleasedReturnValue();
  characteristicWriteCompletionHandlers = v34->_characteristicWriteCompletionHandlers;
  v34->_characteristicWriteCompletionHandlers = (NSMapTable *)v41;

  objc_msgSend(MEMORY[0x1E0CB3748], "weakToStrongObjectsMapTable");
  v43 = objc_claimAutoreleasedReturnValue();
  characteristicEnableEventCompletionHandlers = v34->_characteristicEnableEventCompletionHandlers;
  v34->_characteristicEnableEventCompletionHandlers = (NSMapTable *)v43;

  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v45 = objc_claimAutoreleasedReturnValue();
  discoveredAccessoryCharacteristicsPendingRead = v34->_discoveredAccessoryCharacteristicsPendingRead;
  v34->_discoveredAccessoryCharacteristicsPendingRead = (NSMutableSet *)v45;

  v34->_authenticated = 0;
  v47 = objc_alloc_init(MEMORY[0x1E0CB3828]);
  v96 = v28;
  v90 = v33;
  v48 = v24;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s"), HAPDispatchQueueName(v34, CFSTR("requestOperationQueue")));
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v47, "setName:", v49);

  objc_msgSend(v47, "setMaxConcurrentOperationCount:", 1);
  objc_msgSend(v47, "setQualityOfService:", 25);
  v86 = v47;
  objc_storeStrong((id *)&v34->_requestOperationQueue, v47);
  v50 = objc_alloc_init(MEMORY[0x1E0CB3828]);
  v51 = v30;
  v52 = v99;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s"), HAPDispatchQueueName(v34, CFSTR("securitySessionOperationQueue")));
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v50, "setName:", v53);

  objc_msgSend(v50, "setMaxConcurrentOperationCount:", 1);
  objc_msgSend(v50, "setQualityOfService:", 25);
  objc_storeStrong((id *)&v34->_pairVerifyOperationQueue, v50);
  v54 = objc_msgSend(objc_alloc(MEMORY[0x1E0D286C8]), "initWithTimeInterval:options:", 0, 15.0);
  connectionIdleTimer = v34->_connectionIdleTimer;
  v34->_connectionIdleTimer = (HMFTimer *)v54;

  -[HMFTimer setDelegate:](v34->_connectionIdleTimer, "setDelegate:", v34);
  v56 = v34->_connectionIdleTimer;
  -[HAPAccessoryServer clientQueue](v34, "clientQueue");
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMFTimer setDelegateQueue:](v56, "setDelegateQueue:", v57);

  objc_msgSend(v98, "cbPeripheral");
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v58, "setDelegate:", v34);

  v59 = [HAPBLEPeripheralInfo alloc];
  objc_msgSend(v98, "uniqueBTIdentifier");
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  Current = CFAbsoluteTimeGetCurrent();
  objc_msgSend(v98, "name");
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  v92 = v48;
  v84 = v48;
  v33 = v90;
  v87 = v51;
  v88 = v27;
  v63 = -[HAPBLEPeripheralInfo initWithPeripheralInfo:advertisedProtocolVersion:previousProtocolVersion:resumeSessionId:lastSeen:statusFlags:stateNumber:configNumber:categoryIdentifier:accessoryName:](v59, "initWithPeripheralInfo:advertisedProtocolVersion:previousProtocolVersion:resumeSessionId:lastSeen:statusFlags:stateNumber:configNumber:categoryIdentifier:accessoryName:", v60, 2, 2, 0, v27, v51, Current, v84, v97, v62);

  objc_msgSend(v96, "cachedAccessoryForIdentifier:", v99);
  v64 = (HAPBLEAccessoryCache *)objc_claimAutoreleasedReturnValue();
  -[HAPBLEAccessoryCache metadataVersion](v64, "metadataVersion");
  v65 = objc_claimAutoreleasedReturnValue();
  if (!v65)
    goto LABEL_8;
  v66 = (void *)v65;
  -[HAPBLEAccessoryCache cachedServices](v64, "cachedServices");
  v67 = (void *)objc_claimAutoreleasedReturnValue();
  v68 = objc_msgSend(v67, "count");
  if (!v92 || !v68)
  {

    goto LABEL_8;
  }
  -[HAPBLEAccessoryCache peripheralInfo](v64, "peripheralInfo");
  v69 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v69, "configNumber");
  v70 = (void *)objc_claimAutoreleasedReturnValue();
  v71 = objc_msgSend(v70, "isEqual:", v92);

  v52 = v99;
  v33 = v90;
  if ((v71 & 1) == 0)
  {
LABEL_8:
    v77 = 0;
    v72 = v64;
    v64 = -[HAPBLEAccessoryCache initWithPairingIdentifier:]([HAPBLEAccessoryCache alloc], "initWithPairingIdentifier:", v52);
    goto LABEL_9;
  }
  -[HAPBLEAccessoryCache peripheralInfo](v64, "peripheralInfo");
  v72 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v72, "broadcastKey");
  v73 = (void *)objc_claimAutoreleasedReturnValue();
  -[HAPBLEAccessoryCache peripheralInfo](v64, "peripheralInfo");
  v74 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v74, "keyUpdatedStateNumber");
  v75 = (void *)objc_claimAutoreleasedReturnValue();
  -[HAPBLEAccessoryCache peripheralInfo](v64, "peripheralInfo");
  v76 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v76, "keyUpdatedTime");
  -[HAPBLEPeripheralInfo saveBroadcastKey:keyUpdatedStateNumber:updatedTime:](v63, "saveBroadcastKey:keyUpdatedStateNumber:updatedTime:", v73, v75);

  v33 = v90;
  v77 = 1;
LABEL_9:

  -[HAPBLEAccessoryCache updateWithPeripheralInfo:](v64, "updateWithPeripheralInfo:", v63);
  v34->_hasValidCache = v77;
  objc_storeStrong((id *)&v34->_accessoryCache, v64);
  -[HAPBLEAccessoryCache peripheralInfo](v64, "peripheralInfo");
  v78 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v78, "accessoryName");
  v79 = objc_claimAutoreleasedReturnValue();
  v80 = (void *)v79;
  if (v79)
    v81 = (void *)v79;
  else
    v81 = v33;
  objc_storeStrong((id *)&v34->super.super._name, v81);

  v82 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D286E0]), "initWithMajorVersion:minorVersion:updateVersion:", 2, 0, 0);
  -[HAPAccessoryServer setVersion:](v34, "setVersion:", v82);

  objc_initWeak(&location, v34);
  v100[0] = MEMORY[0x1E0C809B0];
  v100[1] = 3221225472;
  v100[2] = __209___HAPAccessoryServerBTLE200_initWithPeripheral_name_pairingUsername_statusFlags_stateNumber_stateChanged_connectReason_configNumber_category_setupHash_connectionIdleTime_browser_keyStore_whbStableIdentifier___block_invoke;
  v100[3] = &unk_1E894E050;
  objc_copyWeak(&v101, &location);
  -[HAPBLEAccessoryCache updateWithSaveBlock:](v64, "updateWithSaveBlock:", v100);
  v26 = v91;
  -[_HAPAccessoryServerBTLE200 _createPrimaryAccessoryFromAdvertisementData](v34, "_createPrimaryAccessoryFromAdvertisementData");
  v24 = v92;
  v29 = v89;
  objc_destroyWeak(&v101);
  objc_destroyWeak(&location);

  v31 = v99;
  v30 = v87;
  v27 = v88;
  v28 = v96;
LABEL_13:

  return v34;
}

- (void)_resetWithError:(id)a3
{
  id v4;
  void *v5;
  _HAPAccessoryServerBTLE200 *v6;
  NSObject *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t i;
  void *v19;
  void *v20;
  void (**v21)(_QWORD, _QWORD);
  void *v22;
  _HAPAccessoryServerBTLE200 *v23;
  NSObject *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t j;
  void *v33;
  void *v34;
  void (**v35)(_QWORD, _QWORD);
  void *v36;
  _HAPAccessoryServerBTLE200 *v37;
  NSObject *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  id obj;
  id obja;
  _HAPAccessoryServerBTLE200 *v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  uint8_t v55[128];
  uint8_t buf[4];
  void *v57;
  __int16 v58;
  id v59;
  __int16 v60;
  void *v61;
  _BYTE v62[128];
  uint64_t v63;

  v63 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = (void *)MEMORY[0x1D17B7244]();
  v6 = self;
  HMFGetOSLogHandle();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v57 = v8;
    v58 = 2112;
    v59 = v4;
    _os_log_impl(&dword_1CCE01000, v7, OS_LOG_TYPE_INFO, "%{public}@Resetting server with error: %@", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v5);
  -[HAPAccessoryServerBTLE setNotifyingCharacteristicUpdated:](v6, "setNotifyingCharacteristicUpdated:", 0);
  v9 = v4;
  v10 = v9;
  if (!v9)
  {
    if (-[_HAPAccessoryServerBTLE200 isPairing](v6, "isPairing")
      && (-[_HAPAccessoryServerBTLE200 pairingDisconnectionError](v6, "pairingDisconnectionError"),
          v11 = (void *)objc_claimAutoreleasedReturnValue(),
          v11,
          v11))
    {
      -[_HAPAccessoryServerBTLE200 pairingDisconnectionError](v6, "pairingDisconnectionError");
      v12 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "hapErrorWithCode:description:reason:suggestion:underlyingError:", 2, CFSTR("Cancelled."), CFSTR("Resetting the server."), 0, 0);
      v12 = objc_claimAutoreleasedReturnValue();
    }
    v10 = (void *)v12;
  }
  v43 = v9;
  -[_HAPAccessoryServerBTLE200 _cancelAllQueuedOperationsWithError:](v6, "_cancelAllQueuedOperationsWithError:", v10);
  -[_HAPAccessoryServerBTLE200 _resumeAllOperations](v6, "_resumeAllOperations");
  -[_HAPAccessoryServerBTLE200 characteristicWriteCompletionHandlers](v6, "characteristicWriteCompletionHandlers");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "keyEnumerator");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  v53 = 0u;
  v54 = 0u;
  v51 = 0u;
  v52 = 0u;
  obj = v14;
  v15 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v51, v62, 16);
  v46 = v6;
  if (v15)
  {
    v16 = v15;
    v17 = *(_QWORD *)v52;
    do
    {
      for (i = 0; i != v16; ++i)
      {
        if (*(_QWORD *)v52 != v17)
          objc_enumerationMutation(obj);
        v19 = *(void **)(*((_QWORD *)&v51 + 1) + 8 * i);
        -[_HAPAccessoryServerBTLE200 characteristicWriteCompletionHandlers](v6, "characteristicWriteCompletionHandlers");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "objectForKey:", v19);
        v21 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();

        if (v10)
        {
          v22 = (void *)MEMORY[0x1D17B7244]();
          v23 = v6;
          HMFGetOSLogHandle();
          v24 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG))
          {
            HMFGetLogIdentifier();
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543874;
            v57 = v25;
            v58 = 2114;
            v59 = v19;
            v60 = 2114;
            v61 = v10;
            _os_log_impl(&dword_1CCE01000, v24, OS_LOG_TYPE_DEBUG, "%{public}@Calling write completion handler for %{public}@ with error: %{public}@", buf, 0x20u);

            v6 = v46;
          }

          objc_autoreleasePoolPop(v22);
        }
        ((void (**)(_QWORD, void *))v21)[2](v21, v10);

      }
      v16 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v51, v62, 16);
    }
    while (v16);
  }

  -[_HAPAccessoryServerBTLE200 characteristicWriteCompletionHandlers](v6, "characteristicWriteCompletionHandlers");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "removeAllObjects");

  -[_HAPAccessoryServerBTLE200 characteristicEnableEventCompletionHandlers](v6, "characteristicEnableEventCompletionHandlers");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "keyEnumerator");
  v28 = (void *)objc_claimAutoreleasedReturnValue();

  v49 = 0u;
  v50 = 0u;
  v47 = 0u;
  v48 = 0u;
  obja = v28;
  v29 = objc_msgSend(obja, "countByEnumeratingWithState:objects:count:", &v47, v55, 16);
  if (v29)
  {
    v30 = v29;
    v31 = *(_QWORD *)v48;
    do
    {
      for (j = 0; j != v30; ++j)
      {
        if (*(_QWORD *)v48 != v31)
          objc_enumerationMutation(obja);
        v33 = *(void **)(*((_QWORD *)&v47 + 1) + 8 * j);
        -[_HAPAccessoryServerBTLE200 characteristicEnableEventCompletionHandlers](v6, "characteristicEnableEventCompletionHandlers");
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v34, "objectForKey:", v33);
        v35 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();

        if (v10)
        {
          v36 = (void *)MEMORY[0x1D17B7244]();
          v37 = v6;
          HMFGetOSLogHandle();
          v38 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v38, OS_LOG_TYPE_DEBUG))
          {
            HMFGetLogIdentifier();
            v39 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543874;
            v57 = v39;
            v58 = 2114;
            v59 = v33;
            v60 = 2114;
            v61 = v10;
            _os_log_impl(&dword_1CCE01000, v38, OS_LOG_TYPE_DEBUG, "%{public}@Calling enable event completion handler for %{public}@ with error: %{public}@", buf, 0x20u);

            v6 = v46;
          }

          objc_autoreleasePoolPop(v36);
        }
        ((void (**)(_QWORD, void *))v35)[2](v35, v10);

      }
      v30 = objc_msgSend(obja, "countByEnumeratingWithState:objects:count:", &v47, v55, 16);
    }
    while (v30);
  }

  -[_HAPAccessoryServerBTLE200 characteristicEnableEventCompletionHandlers](v6, "characteristicEnableEventCompletionHandlers");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v40, "removeAllObjects");

  -[_HAPAccessoryServerBTLE200 _invokeOperationsReceivedDuringConnectionStateChangeWithError:](v6, "_invokeOperationsReceivedDuringConnectionStateChangeWithError:", v10);
  -[_HAPAccessoryServerBTLE200 _cancelDiscoveryWithError:](v6, "_cancelDiscoveryWithError:", v43);
  if (-[_HAPAccessoryServerBTLE200 isPairing](v6, "isPairing"))
    -[_HAPAccessoryServerBTLE200 _pairingCompletedWithError:](v6, "_pairingCompletedWithError:", v10);
  -[_HAPAccessoryServerBTLE200 pairSetupSession](v6, "pairSetupSession");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  -[_HAPAccessoryServerBTLE200 setPairSetupSession:](v6, "setPairSetupSession:", 0);
  objc_msgSend(v41, "stop");
  -[_HAPAccessoryServerBTLE200 securitySession](v6, "securitySession");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  -[_HAPAccessoryServerBTLE200 setSecuritySession:](v6, "setSecuritySession:", 0);
  objc_msgSend(v42, "close");
  -[_HAPAccessoryServerBTLE200 setDiscoveryRetries:](v6, "setDiscoveryRetries:", 0);

}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  -[HAPAccessoryServerBTLE peripheral](self, "peripheral");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setDelegate:", 0);

  v4.receiver = self;
  v4.super_class = (Class)_HAPAccessoryServerBTLE200;
  -[_HAPAccessoryServerBTLE200 dealloc](&v4, sel_dealloc);
}

- (id)descriptionWithPointer:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  void *v6;
  __CFString *v7;
  void *v8;
  void *v9;
  void *v10;

  v3 = a3;
  v5 = (void *)MEMORY[0x1E0CB3940];
  -[HAPAccessoryServerBTLE shortDescription](self, "shortDescription");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR(" %p"), self);
    v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7 = &stru_1E894EFE8;
  }
  -[HAPAccessoryServer hasPairings](self, "hasPairings");
  HMFBooleanToString();
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[HAPAccessoryServerBTLE peripheral](self, "peripheral");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringWithFormat:", CFSTR("<%@%@, hasPairings = %@, Peripheral = %@>"), v6, v7, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  return v10;
}

- (NSString)debugDescription
{
  return (NSString *)-[_HAPAccessoryServerBTLE200 descriptionWithPointer:](self, "descriptionWithPointer:", 1);
}

- (NSString)description
{
  return (NSString *)-[_HAPAccessoryServerBTLE200 descriptionWithPointer:](self, "descriptionWithPointer:", 0);
}

- (BOOL)hasValidCache
{
  _HAPAccessoryServerBTLE200 *v2;
  os_unfair_lock_s *p_lock;

  v2 = self;
  p_lock = &self->super.super._lock;
  os_unfair_lock_lock_with_options();
  LOBYTE(v2) = v2->_hasValidCache;
  os_unfair_lock_unlock(p_lock);
  return (char)v2;
}

- (void)setHasValidCache:(BOOL)a3
{
  os_unfair_lock_s *p_lock;

  p_lock = &self->super.super._lock;
  os_unfair_lock_lock_with_options();
  self->_hasValidCache = a3;
  os_unfair_lock_unlock(p_lock);
}

- (BOOL)hasBeenDiscovered
{
  _HAPAccessoryServerBTLE200 *v2;
  os_unfair_lock_s *p_lock;

  v2 = self;
  p_lock = &self->super.super._lock;
  os_unfair_lock_lock_with_options();
  LOBYTE(v2) = v2->_hasBeenDiscovered;
  os_unfair_lock_unlock(p_lock);
  return (char)v2;
}

- (void)setHasBeenDiscovered:(BOOL)a3
{
  os_unfair_lock_s *p_lock;

  p_lock = &self->super.super._lock;
  os_unfair_lock_lock_with_options();
  self->_hasBeenDiscovered = a3;
  os_unfair_lock_unlock(p_lock);
}

- (int64_t)connectionState
{
  os_unfair_lock_s *p_lock;
  int64_t connectionState;

  p_lock = &self->super.super._lock;
  os_unfair_lock_lock_with_options();
  connectionState = self->_connectionState;
  os_unfair_lock_unlock(p_lock);
  return connectionState;
}

- (void)setConnectionState:(int64_t)a3
{
  os_unfair_lock_s *p_lock;

  p_lock = &self->super.super._lock;
  os_unfair_lock_lock_with_options();
  self->_connectionState = a3;
  os_unfair_lock_unlock(p_lock);
}

- (unint64_t)hapBLEProtocolVersion
{
  return 2;
}

- (void)_createPrimaryAccessoryFromAdvertisementData
{
  HAPAccessory *v3;
  void *v4;
  HAPAccessory *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x1E0C80C00];
  v3 = [HAPAccessory alloc];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[HAPAccessory initWithServer:instanceID:](v3, "initWithServer:instanceID:", self, v4);

  -[HAPAccessoryServer name](self, "name");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[HAPAccessory setName:](v5, "setName:", v6);

  -[HAPAccessoryServer identifier](self, "identifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[HAPAccessory setIdentifier:](v5, "setIdentifier:", v7);

  -[HAPAccessoryServer identifier](self, "identifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[HAPAccessory setServerIdentifier:](v5, "setServerIdentifier:", v8);

  -[HAPAccessoryServer setPrimaryAccessory:](self, "setPrimaryAccessory:", v5);
  v10[0] = v5;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v10, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[HAPAccessoryServer setAccessories:](self, "setAccessories:", v9);

}

- (BOOL)_delegateRespondsToSelector:(SEL)a3
{
  void *v4;
  void *v5;
  void *v6;
  char v7;

  -[HAPAccessoryServer delegate](self, "delegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    -[HAPAccessoryServer delegateQueue](self, "delegateQueue");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      -[HAPAccessoryServer delegate](self, "delegate");
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

- (id)_serviceForCBService:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t j;
  void *v14;
  void *v15;
  char v16;
  id v17;
  uint64_t v19;
  uint64_t v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  -[HAPAccessoryServer accessories](self, "accessories");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v25, v30, 16);
  if (v20)
  {
    v6 = *(_QWORD *)v26;
    v19 = *(_QWORD *)v26;
    do
    {
      for (i = 0; i != v20; ++i)
      {
        if (*(_QWORD *)v26 != v6)
          objc_enumerationMutation(v5);
        v8 = *(void **)(*((_QWORD *)&v25 + 1) + 8 * i);
        v21 = 0u;
        v22 = 0u;
        v23 = 0u;
        v24 = 0u;
        objc_msgSend(v8, "services", v19);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v21, v29, 16);
        if (v10)
        {
          v11 = v10;
          v12 = *(_QWORD *)v22;
          while (2)
          {
            for (j = 0; j != v11; ++j)
            {
              if (*(_QWORD *)v22 != v12)
                objc_enumerationMutation(v9);
              v14 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * j);
              objc_msgSend(v14, "cbService");
              v15 = (void *)objc_claimAutoreleasedReturnValue();
              v16 = objc_msgSend(v15, "isEqual:", v4);

              if ((v16 & 1) != 0)
              {
                v17 = v14;

                goto LABEL_19;
              }
            }
            v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v21, v29, 16);
            if (v11)
              continue;
            break;
          }
        }

        v6 = v19;
      }
      v17 = 0;
      v20 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v25, v30, 16);
    }
    while (v20);
  }
  else
  {
    v17 = 0;
  }
LABEL_19:

  return v17;
}

- (id)_characteristicForCBCharacteristic:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  void *i;
  void *v11;
  void *v12;
  char v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "service");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[_HAPAccessoryServerBTLE200 _serviceForCBService:](self, "_serviceForCBService:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v17 = 0u;
  v18 = 0u;
  v15 = 0u;
  v16 = 0u;
  objc_msgSend(v6, "characteristics", 0);
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
        objc_msgSend(v11, "cbCharacteristic");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = objc_msgSend(v12, "isEqual:", v4);

        if ((v13 & 1) != 0)
        {
          v8 = v11;
          goto LABEL_11;
        }
      }
      v8 = (id)objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
      if (v8)
        continue;
      break;
    }
  }
LABEL_11:

  return v8;
}

- (void)_removePairingOfAccessoryServerCancelledMidPairing
{
  uint64_t v3;
  void *v4;
  void *v5;
  id v6;
  _QWORD v7[4];
  id v8;
  _QWORD v9[5];

  if (-[HAPAccessoryServer pendingRemovePairing](self, "pendingRemovePairing") == 1)
  {
    v3 = MEMORY[0x1E0C809B0];
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __80___HAPAccessoryServerBTLE200__removePairingOfAccessoryServerCancelledMidPairing__block_invoke;
    v9[3] = &unk_1E894DD58;
    v9[4] = self;
    v4 = (void *)MEMORY[0x1D17B7400](v9);
    -[HAPAccessoryServer clientQueue](self, "clientQueue");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v7[0] = v3;
    v7[1] = 3221225472;
    v7[2] = __80___HAPAccessoryServerBTLE200__removePairingOfAccessoryServerCancelledMidPairing__block_invoke_175;
    v7[3] = &unk_1E894AA10;
    v8 = v4;
    v6 = v4;
    -[_HAPAccessoryServerBTLE200 removePairingForCurrentControllerOnQueue:completion:serverPairingCompletion:](self, "removePairingForCurrentControllerOnQueue:completion:serverPairingCompletion:", v5, v7, v6);

  }
}

- (void)discoverAccessories
{
  -[_HAPAccessoryServerBTLE200 discoverAccessoriesAndReadCharacteristicTypes:](self, "discoverAccessoriesAndReadCharacteristicTypes:", 0);
}

- (void)discoverAccessoriesAndReadCharacteristicTypes:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  -[HAPAccessoryServer clientQueue](self, "clientQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __76___HAPAccessoryServerBTLE200_discoverAccessoriesAndReadCharacteristicTypes___block_invoke;
  v7[3] = &unk_1E894E0F8;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, v7);

}

- (void)_readPendingDiscoveredCharacteristicTypesWithCompletion:(id)a3
{
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  int v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  _HAPAccessoryServerBTLE200 *v18;
  NSObject *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t j;
  uint64_t v27;
  void *v28;
  void (**v29)(_QWORD);
  _QWORD v30[4];
  id v31;
  uint64_t v32;
  void (**v33)(_QWORD);
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  uint8_t v42[128];
  uint8_t buf[4];
  void *v44;
  __int16 v45;
  void *v46;
  _BYTE v47[128];
  uint64_t v48;

  v48 = *MEMORY[0x1E0C80C00];
  v29 = (void (**)(_QWORD))a3;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v38 = 0u;
  v39 = 0u;
  v40 = 0u;
  v41 = 0u;
  -[_HAPAccessoryServerBTLE200 discoveredAccessoryCharacteristicsPendingRead](self, "discoveredAccessoryCharacteristicsPendingRead");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v38, v47, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v39;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v39 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v38 + 1) + 8 * i);
        v11 = objc_msgSend(v10, "isEqualToString:", CFSTR("00000023-0000-1000-8000-0026BB765291"));
        -[HAPAccessoryServer primaryAccessory](self, "primaryAccessory");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = v12;
        if (!v11)
        {
          objc_msgSend(v12, "characteristicsOfType:", v10);
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "firstObject");
          v14 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_10:
          if (!v14)
            continue;
          goto LABEL_11;
        }
        objc_msgSend(v12, "characteristicOfType:serviceType:", v10, CFSTR("0000003E-0000-1000-8000-0026BB765291"));
        v14 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v14)
        {
          -[HAPAccessoryServer primaryAccessory](self, "primaryAccessory");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "characteristicOfType:serviceType:", v10, CFSTR("FED3"));
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          goto LABEL_10;
        }
LABEL_11:
        objc_msgSend(v4, "addObject:", v14);

      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v38, v47, 16);
    }
    while (v7);
  }

  -[_HAPAccessoryServerBTLE200 discoveredAccessoryCharacteristicsPendingRead](self, "discoveredAccessoryCharacteristicsPendingRead");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "removeAllObjects");

  if (objc_msgSend(v4, "count"))
  {
    v17 = (void *)MEMORY[0x1D17B7244]();
    v18 = self;
    HMFGetOSLogHandle();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v44 = v20;
      v45 = 2112;
      v46 = v4;
      _os_log_impl(&dword_1CCE01000, v19, OS_LOG_TYPE_INFO, "%{public}@Reading pending discovered characteristics with types: %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v17);
    v36 = 0u;
    v37 = 0u;
    v34 = 0u;
    v35 = 0u;
    v21 = (void *)objc_msgSend(v4, "copy");
    v22 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v34, v42, 16);
    if (v22)
    {
      v23 = v22;
      v24 = *(_QWORD *)v35;
      v25 = MEMORY[0x1E0C809B0];
      do
      {
        for (j = 0; j != v23; ++j)
        {
          if (*(_QWORD *)v35 != v24)
            objc_enumerationMutation(v21);
          v27 = *(_QWORD *)(*((_QWORD *)&v34 + 1) + 8 * j);
          v30[0] = v25;
          v30[1] = 3221225472;
          v30[2] = __86___HAPAccessoryServerBTLE200__readPendingDiscoveredCharacteristicTypesWithCompletion___block_invoke;
          v30[3] = &unk_1E894D7C0;
          v31 = v4;
          v32 = v27;
          v33 = v29;
          -[_HAPAccessoryServerBTLE200 _readValueForCharacteristic:options:completionHandler:](v18, "_readValueForCharacteristic:options:completionHandler:", v27, 1, v30);

        }
        v23 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v34, v42, 16);
      }
      while (v23);
    }

    v28 = v29;
  }
  else
  {
    v28 = v29;
    v29[2](v29);
  }

}

- (void)_discoverWithType:(int64_t)a3 completionHandler:(id)a4
{
  id v6;
  void *v7;
  uint64_t v8;
  id v9;
  id v10;
  void (**v11)(_QWORD, _QWORD);
  void *v12;
  int v13;
  void *v14;
  _HAPAccessoryServerBTLE200 *v15;
  NSObject *v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  _HAPBTLEDiscoveryContext *v21;
  _HAPBTLEDiscoveryContext *v22;
  _QWORD v23[4];
  _HAPBTLEDiscoveryContext *v24;
  id v25[2];
  _QWORD v26[4];
  id v27;
  id v28;
  id v29[2];
  id location;
  uint8_t buf[4];
  id v32;
  __int16 v33;
  void *v34;
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_initWeak(&location, self);
  v8 = MEMORY[0x1E0C809B0];
  v26[0] = MEMORY[0x1E0C809B0];
  v26[1] = 3221225472;
  v26[2] = __66___HAPAccessoryServerBTLE200__discoverWithType_completionHandler___block_invoke;
  v26[3] = &unk_1E894AAB0;
  objc_copyWeak(v29, &location);
  v9 = v7;
  v27 = v9;
  v29[1] = (id)a3;
  v10 = v6;
  v28 = v10;
  v11 = (void (**)(_QWORD, _QWORD))MEMORY[0x1D17B7400](v26);
  -[_HAPAccessoryServerBTLE200 discoveryContext](self, "discoveryContext");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "isDiscovering");

  if (v13)
  {
    v14 = (void *)MEMORY[0x1D17B7244]();
    v15 = self;
    HMFGetOSLogHandle();
    v16 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v17 = (id)objc_claimAutoreleasedReturnValue();
      v18 = (void *)MEMORY[0x1E0CB37E8];
      -[_HAPAccessoryServerBTLE200 discoveryContext](v15, "discoveryContext");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "numberWithInteger:", objc_msgSend(v19, "discoveryType"));
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v32 = v17;
      v33 = 2112;
      v34 = v20;
      _os_log_impl(&dword_1CCE01000, v16, OS_LOG_TYPE_ERROR, "%{public}@The server already has a discovery in progress for type: %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v14);
    objc_msgSend(MEMORY[0x1E0CB35C8], "hapErrorWithCode:", 4);
    v21 = (_HAPBTLEDiscoveryContext *)objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, _HAPBTLEDiscoveryContext *))v11)[2](v11, v21);
  }
  else
  {
    v22 = -[_HAPBTLEDiscoveryContext initWithDiscoveryType:]([_HAPBTLEDiscoveryContext alloc], "initWithDiscoveryType:", a3);
    -[_HAPBTLEDiscoveryContext setCompletionHandler:](v22, "setCompletionHandler:", v11);
    -[_HAPBTLEDiscoveryContext setDiscovering:](v22, "setDiscovering:", 1);
    -[_HAPAccessoryServerBTLE200 setDiscoveryContext:](self, "setDiscoveryContext:", v22);
    v23[0] = v8;
    v23[1] = 3221225472;
    v23[2] = __66___HAPAccessoryServerBTLE200__discoverWithType_completionHandler___block_invoke_192;
    v23[3] = &unk_1E894AAD8;
    objc_copyWeak(v25, &location);
    v25[1] = (id)a3;
    v21 = v22;
    v24 = v21;
    -[_HAPAccessoryServerBTLE200 connectWithCompletionHandler:](self, "connectWithCompletionHandler:", v23);

    objc_destroyWeak(v25);
  }

  objc_destroyWeak(v29);
  objc_destroyWeak(&location);

}

- (BOOL)_cancelDiscoveryWithError:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  int v12;
  _BOOL4 v13;
  void *v14;
  _HAPAccessoryServerBTLE200 *v15;
  NSObject *v16;
  _BOOL4 v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  int v22;
  void *v23;
  _HAPAccessoryServerBTLE200 *v24;
  NSObject *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  uint64_t v29;
  BOOL v30;
  id v31;
  void *v32;
  void *v33;
  void *v34;
  NSObject *v35;
  uint64_t v37;
  uint64_t v38;
  uint64_t (*v39)(uint64_t);
  void *v40;
  id v41;
  id v42;
  uint8_t buf[4];
  void *v44;
  __int16 v45;
  uint64_t v46;
  __int16 v47;
  uint64_t v48;
  __int16 v49;
  int v50;
  uint64_t v51;

  v51 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[_HAPAccessoryServerBTLE200 discoveryContext](self, "discoveryContext");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
  {
LABEL_25:
    v30 = 0;
    goto LABEL_26;
  }
  -[_HAPAccessoryServerBTLE200 accessoryCache](self, "accessoryCache");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "lastKeyBagIdentityIndexFailingPV");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    -[HAPAccessoryServer keyBag](self, "keyBag");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[_HAPAccessoryServerBTLE200 accessoryCache](self, "accessoryCache");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "lastKeyBagIdentityIndexFailingPV");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v8, "isValidIndex:", objc_msgSend(v10, "integerValue") + 1);

  }
  else
  {
    v11 = 0;
  }

  if (-[_HAPAccessoryServerBTLE200 discoveryRetries](self, "discoveryRetries") < 2)
    v12 = 1;
  else
    v12 = v11;
  v13 = -[_HAPAccessoryServerBTLE200 _shouldIgnoreRetryDiscoveryError:](self, "_shouldIgnoreRetryDiscoveryError:", v4);
  v14 = (void *)MEMORY[0x1D17B7244]();
  v15 = self;
  HMFGetOSLogHandle();
  v16 = objc_claimAutoreleasedReturnValue();
  v17 = os_log_type_enabled(v16, OS_LOG_TYPE_INFO);
  if (v13 && v12)
  {
    if (v17)
    {
      HMFGetLogIdentifier();
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v44 = v18;
      v45 = 2112;
      v46 = (uint64_t)v4;
      _os_log_impl(&dword_1CCE01000, v16, OS_LOG_TYPE_INFO, "%{public}@Ignoring cancel discovery request due to BTLE sudden disconnection: %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v14);
    goto LABEL_25;
  }
  if (v17)
  {
    HMFGetLogIdentifier();
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[_HAPAccessoryServerBTLE200 discoveryContext](v15, "discoveryContext");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    v44 = v19;
    v45 = 2050;
    v46 = objc_msgSend(v20, "discoveryType");
    v47 = 2114;
    v48 = (uint64_t)v4;
    _os_log_impl(&dword_1CCE01000, v16, OS_LOG_TYPE_INFO, "%{public}@Attribute database discovery type: %{public}tu cancelled with error: %{public}@", buf, 0x20u);

  }
  objc_autoreleasePoolPop(v14);
  if (!v4)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "hapErrorWithCode:description:reason:suggestion:underlyingError:", 2, CFSTR("Discovery failed."), CFSTR("Cancelled."), 0, 0);
    v31 = (id)objc_claimAutoreleasedReturnValue();
LABEL_22:
    v32 = v31;
    -[_HAPAccessoryServerBTLE200 discoveryContext](v15, "discoveryContext");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "completionHandler");
    v34 = (void *)objc_claimAutoreleasedReturnValue();

    if (v34)
    {
      -[HAPAccessoryServer clientQueue](v15, "clientQueue");
      v35 = objc_claimAutoreleasedReturnValue();
      v37 = MEMORY[0x1E0C809B0];
      v38 = 3221225472;
      v39 = __56___HAPAccessoryServerBTLE200__cancelDiscoveryWithError___block_invoke;
      v40 = &unk_1E894D5E0;
      v42 = v34;
      v41 = v32;
      dispatch_async(v35, &v37);

    }
    -[_HAPAccessoryServerBTLE200 setDiscoveryContext:](v15, "setDiscoveryContext:", 0, v37, v38, v39, v40);

    goto LABEL_25;
  }
  objc_msgSend(v4, "domain");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = objc_msgSend(v21, "isEqualToString:", *MEMORY[0x1E0C97688]) & v12;

  if (v22 != 1)
  {
    -[_HAPAccessoryServerBTLE200 setHasValidCache:](v15, "setHasValidCache:", 0);
    v31 = v4;
    goto LABEL_22;
  }
  v23 = (void *)MEMORY[0x1D17B7244]();
  v24 = v15;
  HMFGetOSLogHandle();
  v25 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    -[_HAPAccessoryServerBTLE200 discoveryContext](v24, "discoveryContext");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = objc_msgSend(v27, "discoveryType");
    v29 = -[_HAPAccessoryServerBTLE200 discoveryRetries](v24, "discoveryRetries");
    *(_DWORD *)buf = 138544130;
    v44 = v26;
    v45 = 2048;
    v46 = v28;
    v47 = 2048;
    v48 = v29;
    v49 = 1024;
    v50 = 2;
    _os_log_impl(&dword_1CCE01000, v25, OS_LOG_TYPE_INFO, "%{public}@Reconnecting and restarting attribute database discovery type: %tu due to a connection error. Current retries, %tu, max retries, %d.", buf, 0x26u);

  }
  objc_autoreleasePoolPop(v23);
  -[_HAPAccessoryServerBTLE200 _retryDiscovery](v24, "_retryDiscovery");
  v30 = 1;
LABEL_26:

  return v30;
}

- (void)_retryDiscovery
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v8[5];

  -[_HAPAccessoryServerBTLE200 discoveryContext](self, "discoveryContext");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[_HAPAccessoryServerBTLE200 discoveryContext](self, "discoveryContext");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "reset");

    -[_HAPAccessoryServerBTLE200 setDiscoveryRetries:](self, "setDiscoveryRetries:", -[_HAPAccessoryServerBTLE200 discoveryRetries](self, "discoveryRetries") + 1);
    -[_HAPAccessoryServerBTLE200 pairVerifyOperationQueue](self, "pairVerifyOperationQueue");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB35C8], "hapErrorWithCode:", 27);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "cancelAllOperationsWithError:", v6);

    objc_msgSend(MEMORY[0x1E0CB35C8], "hapErrorWithCode:", 27);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[_HAPAccessoryServerBTLE200 _cancelAllQueuedOperationsWithError:](self, "_cancelAllQueuedOperationsWithError:", v7);

    -[_HAPAccessoryServerBTLE200 _resumeAllOperations](self, "_resumeAllOperations");
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __45___HAPAccessoryServerBTLE200__retryDiscovery__block_invoke;
    v8[3] = &unk_1E894DD08;
    v8[4] = self;
    __45___HAPAccessoryServerBTLE200__retryDiscovery__block_invoke((uint64_t)v8);
    -[_HAPAccessoryServerBTLE200 setDiscoveryContext:](self, "setDiscoveryContext:", 0);
    -[_HAPAccessoryServerBTLE200 discoverAccessoriesAndReadCharacteristicTypes:](self, "discoverAccessoriesAndReadCharacteristicTypes:", 0);
  }
}

- (void)_handleCompletedDiscovery
{
  void *v3;
  void *v4;
  _HAPAccessoryServerBTLE200 *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  BOOL v9;
  void *v10;
  NSObject *v11;
  _BOOL4 v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  _HAPAccessoryServerBTLE200 *v18;
  NSObject *v19;
  void *v20;
  int64_t v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  _HAPAccessoryServerBTLE200 *v28;
  uint64_t v29;
  uint64_t v30;
  unint64_t v31;
  uint64_t v32;
  uint64_t v33;
  void *v34;
  void *v35;
  uint64_t v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  char v41;
  void *v42;
  _HAPAccessoryServerBTLE200 *v43;
  NSObject *v44;
  void *v45;
  void *v46;
  uint64_t v47;
  void *v48;
  void *v49;
  void *v50;
  id v51;
  void *v52;
  void *v53;
  _HAPAccessoryServerBTLE200 *v54;
  NSObject *v55;
  void *v56;
  void *v57;
  void *v58;
  char v59;
  void *v60;
  _HAPAccessoryServerBTLE200 *v61;
  NSObject *v62;
  void *v63;
  uint64_t v64;
  void *v65;
  uint64_t v66;
  void *v67;
  _HAPAccessoryServerBTLE200 *v68;
  NSObject *v69;
  NSObject *v70;
  void *v71;
  void *v72;
  uint64_t v73;
  void *v74;
  void *v75;
  void *v76;
  uint64_t v77;
  void *v78;
  void *v79;
  void *v80;
  void *v81;
  void *v82;
  void *v83;
  void *v84;
  void *v85;
  _HAPAccessoryServerBTLE200 *v86;
  NSObject *v87;
  void *v88;
  void *v89;
  void *v90;
  void *v91;
  _HAPAccessoryServerBTLE200 *v92;
  void *v93;
  void *v94;
  NSObject *v95;
  void *v96;
  _HAPAccessoryServerBTLE200 *v97;
  void *v98;
  id v99;
  uint64_t v100;
  _QWORD block[4];
  id v102;
  id v103;
  id v104;
  __int128 v105;
  __int128 v106;
  __int128 v107;
  __int128 v108;
  _QWORD v109[2];
  _QWORD v110[2];
  uint8_t buf[4];
  void *v112;
  __int16 v113;
  uint64_t v114;
  __int16 v115;
  uint64_t v116;
  _BYTE v117[128];
  uint64_t v118;

  v118 = *MEMORY[0x1E0C80C00];
  -[_HAPAccessoryServerBTLE200 discoveryContext](self, "discoveryContext");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
    return;
  v4 = (void *)MEMORY[0x1D17B7244]();
  v5 = self;
  HMFGetOSLogHandle();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[_HAPAccessoryServerBTLE200 discoveryContext](v5, "discoveryContext");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v112 = v7;
    v113 = 2050;
    v114 = objc_msgSend(v8, "discoveryType");
    _os_log_impl(&dword_1CCE01000, v6, OS_LOG_TYPE_INFO, "%{public}@Attribute database discovery type: %{public}tu completed.", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v4);
  v9 = -[_HAPAccessoryServerBTLE200 hasValidCache](v5, "hasValidCache");
  v10 = (void *)MEMORY[0x1D17B7244]();
  v97 = v5;
  HMFGetOSLogHandle();
  v11 = objc_claimAutoreleasedReturnValue();
  v12 = os_log_type_enabled(v11, OS_LOG_TYPE_INFO);
  if (v9)
  {
    if (v12)
    {
      HMFGetLogIdentifier();
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[_HAPAccessoryServerBTLE200 accessoryCache](v97, "accessoryCache");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "peripheralInfo");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v112 = v13;
      v113 = 2114;
      v114 = (uint64_t)v15;
      _os_log_impl(&dword_1CCE01000, v11, OS_LOG_TYPE_INFO, "%{public}@HAPBLECache: Constructing attribute database from cache %{public}@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v10);
    -[_HAPAccessoryServerBTLE200 _hapServicesFromCache](v97, "_hapServicesFromCache");
    v16 = (id)objc_claimAutoreleasedReturnValue();
    v17 = (void *)MEMORY[0x1D17B7244]();
    v18 = v97;
    HMFGetOSLogHandle();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v112 = v20;
      v113 = 2114;
      v114 = (uint64_t)v16;
      _os_log_impl(&dword_1CCE01000, v19, OS_LOG_TYPE_INFO, "%{public}@Completed attribute database with cached services: %{public}@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v17);
    if (v16 && objc_msgSend(v16, "count"))
    {
      v21 = +[HAPBLEAccessoryCache currentDiscoveryVersion](HAPBLEAccessoryCache, "currentDiscoveryVersion");
      -[_HAPAccessoryServerBTLE200 accessoryCache](v18, "accessoryCache");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "setDiscoveryVersion:", v21);

      -[_HAPAccessoryServerBTLE200 accessoryCache](v18, "accessoryCache");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "save");
    }
    else
    {
      v109[0] = *MEMORY[0x1E0CB2D50];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Failed att-db construction from cache"));
      v78 = (void *)objc_claimAutoreleasedReturnValue();
      v110[0] = v78;
      v109[1] = *MEMORY[0x1E0CB2D68];
      objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
      v79 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v79, "localizedStringForKey:value:table:", CFSTR("Unable to find matching CB service / characteristic"), &stru_1E894EFE8, 0);
      v80 = (void *)objc_claimAutoreleasedReturnValue();
      v110[1] = v80;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v110, v109, 2);
      v23 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("HAPErrorDomain"), -6727, v23);
      v81 = (void *)objc_claimAutoreleasedReturnValue();
      -[_HAPAccessoryServerBTLE200 _cancelDiscoveryWithError:](v18, "_cancelDiscoveryWithError:", v81);
      -[HAPAccessoryServerBTLE browser](v18, "browser");
      v82 = (void *)objc_claimAutoreleasedReturnValue();
      -[_HAPAccessoryServerBTLE200 accessoryCache](v18, "accessoryCache");
      v83 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v83, "pairingIdentifier");
      v84 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v82, "removeCachedAccessoryWithIdentifier:", v84);

      v85 = (void *)MEMORY[0x1D17B7244](-[_HAPAccessoryServerBTLE200 setHasValidCache:](v18, "setHasValidCache:", 0));
      v86 = v18;
      HMFGetOSLogHandle();
      v87 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v87, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v88 = (void *)objc_claimAutoreleasedReturnValue();
        -[_HAPAccessoryServerBTLE200 accessoryCache](v86, "accessoryCache");
        v89 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v112 = v88;
        v113 = 2114;
        v114 = (uint64_t)v89;
        _os_log_impl(&dword_1CCE01000, v87, OS_LOG_TYPE_INFO, "%{public}@HAPBLECache: Att-db mismatch removing the cached accessory: %{public}@", buf, 0x16u);

      }
      objc_autoreleasePoolPop(v85);

    }
    -[HAPAccessoryServer primaryAccessory](v18, "primaryAccessory");
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    v90 = (void *)objc_msgSend(v16, "copy");
    objc_msgSend(v65, "setServices:", v90);

    goto LABEL_54;
  }
  if (v12)
  {
    HMFGetLogIdentifier();
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v112 = v24;
    _os_log_impl(&dword_1CCE01000, v11, OS_LOG_TYPE_INFO, "%{public}@Starting attribute database parsing", buf, 0xCu);

  }
  objc_autoreleasePoolPop(v10);
  -[HAPAccessoryServerBTLE peripheral](v97, "peripheral");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "services");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = (void *)objc_msgSend(v26, "copy");

  v28 = v97;
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v27, "count"));
  v98 = (void *)objc_claimAutoreleasedReturnValue();
  v105 = 0u;
  v106 = 0u;
  v107 = 0u;
  v108 = 0u;
  v16 = v27;
  v29 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v105, v117, 16);
  if (v29)
  {
    v30 = v29;
    v31 = 0x1E0C97000uLL;
    v32 = *(_QWORD *)v106;
    v99 = v16;
    v100 = *(_QWORD *)v106;
    do
    {
      v33 = 0;
      do
      {
        if (*(_QWORD *)v106 != v32)
          objc_enumerationMutation(v16);
        v34 = *(void **)(*((_QWORD *)&v105 + 1) + 8 * v33);
        if (objc_msgSend((id)objc_opt_class(), "isHAPService:", v34))
        {
          -[_HAPAccessoryServerBTLE200 discoveryContext](v28, "discoveryContext");
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          v36 = objc_msgSend(v35, "discoveryType");

          if (v36 != 1)
          {
            -[_HAPAccessoryServerBTLE200 discoveryContext](v28, "discoveryContext");
            v46 = (void *)objc_claimAutoreleasedReturnValue();
            v47 = objc_msgSend(v46, "discoveryType");

            if (v47 != 2)
              goto LABEL_31;
            objc_msgSend(v34, "UUID");
            v37 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(MEMORY[0x1E0C97778], "UUIDWithString:", CFSTR("FED4"));
            v38 = (void *)objc_claimAutoreleasedReturnValue();
            if ((objc_msgSend(v37, "isEqual:", v38) & 1) != 0)
              goto LABEL_30;
            objc_msgSend(v34, "UUID");
            v48 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(MEMORY[0x1E0C97778], "UUIDWithString:", CFSTR("00000055-0000-1000-8000-0026BB765291"));
            v49 = (void *)objc_claimAutoreleasedReturnValue();
            if ((objc_msgSend(v48, "isEqual:", v49) & 1) != 0)
            {

              v16 = v99;
LABEL_30:

LABEL_31:
              v104 = 0;
              -[_HAPAccessoryServerBTLE200 _parseService:error:](v28, "_parseService:error:", v34, &v104);
              v50 = (void *)objc_claimAutoreleasedReturnValue();
              v51 = v104;
              if (v50)
              {
                -[HAPAccessoryServer primaryAccessory](v28, "primaryAccessory");
                v52 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v50, "setAccessory:", v52);

                objc_msgSend(v98, "addObject:", v50);
                v32 = v100;
              }
              else
              {
                v53 = (void *)MEMORY[0x1D17B7244]();
                v54 = v28;
                HMFGetOSLogHandle();
                v55 = objc_claimAutoreleasedReturnValue();
                v32 = v100;
                if (os_log_type_enabled(v55, OS_LOG_TYPE_DEFAULT))
                {
                  HMFGetLogIdentifier();
                  v56 = (void *)objc_claimAutoreleasedReturnValue();
                  *(_DWORD *)buf = 138543618;
                  v112 = v56;
                  v113 = 2114;
                  v114 = (uint64_t)v51;
                  _os_log_impl(&dword_1CCE01000, v55, OS_LOG_TYPE_DEFAULT, "%{public}@Failed to parse service with error: %{public}@", buf, 0x16u);

                }
                objc_autoreleasePoolPop(v53);
                v16 = v99;
              }

            }
            else
            {
              objc_msgSend(v34, "UUID");
              v57 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(MEMORY[0x1E0C97778], "UUIDWithString:", CFSTR("000000A2-0000-1000-8000-0026BB765291"));
              v58 = (void *)objc_claimAutoreleasedReturnValue();
              v59 = objc_msgSend(v57, "isEqual:", v58);

              v28 = v97;
              v16 = v99;
              if ((v59 & 1) != 0)
                goto LABEL_31;
              v60 = (void *)MEMORY[0x1D17B7244]();
              v61 = v97;
              HMFGetOSLogHandle();
              v62 = objc_claimAutoreleasedReturnValue();
              v32 = v100;
              if (os_log_type_enabled(v62, OS_LOG_TYPE_INFO))
              {
                HMFGetLogIdentifier();
                v63 = (void *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = 138543618;
                v112 = v63;
                v113 = 2112;
                v114 = (uint64_t)v34;
                _os_log_impl(&dword_1CCE01000, v62, OS_LOG_TYPE_INFO, "%{public}@Skipping parsing service during Pairing discovery: %@", buf, 0x16u);

              }
              objc_autoreleasePoolPop(v60);
            }
            v31 = 0x1E0C97000;
            goto LABEL_38;
          }
          objc_msgSend(v34, "UUID");
          v37 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(*(id *)(v31 + 1912), "UUIDWithString:", CFSTR("FED3"));
          v38 = (void *)objc_claimAutoreleasedReturnValue();
          if ((objc_msgSend(v37, "isEqual:", v38) & 1) != 0)
            goto LABEL_30;
          objc_msgSend(v34, "UUID");
          v39 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(*(id *)(v31 + 1912), "UUIDWithString:", CFSTR("0000003E-0000-1000-8000-0026BB765291"));
          v40 = (void *)objc_claimAutoreleasedReturnValue();
          v41 = objc_msgSend(v39, "isEqual:", v40);

          v16 = v99;
          if ((v41 & 1) != 0)
            goto LABEL_31;
          v42 = (void *)MEMORY[0x1D17B7244]();
          v43 = v28;
          HMFGetOSLogHandle();
          v44 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v44, OS_LOG_TYPE_INFO))
          {
            HMFGetLogIdentifier();
            v45 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543618;
            v112 = v45;
            v113 = 2112;
            v114 = (uint64_t)v34;
            _os_log_impl(&dword_1CCE01000, v44, OS_LOG_TYPE_INFO, "%{public}@Skipping parsing service during Identify discovery: %@", buf, 0x16u);

          }
          objc_autoreleasePoolPop(v42);
          v31 = 0x1E0C97000;
          v32 = v100;
        }
LABEL_38:
        ++v33;
      }
      while (v30 != v33);
      v64 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v105, v117, 16);
      v30 = v64;
    }
    while (v64);
  }

  v65 = v98;
  v66 = objc_msgSend(v98, "count");
  v67 = (void *)MEMORY[0x1D17B7244]();
  v68 = v28;
  HMFGetOSLogHandle();
  v69 = objc_claimAutoreleasedReturnValue();
  v70 = v69;
  if (!v66)
  {
    if (os_log_type_enabled(v69, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v96 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v112 = v96;
      _os_log_impl(&dword_1CCE01000, v70, OS_LOG_TYPE_ERROR, "%{public}@Attribute database parsing failed due to missing compatible services", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v67);
    objc_msgSend(MEMORY[0x1E0CB35C8], "hapErrorWithCode:description:reason:suggestion:underlyingError:", 3, CFSTR("Peripheral missing services"), 0, 0, 0);
    v91 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_55;
  }
  if (os_log_type_enabled(v69, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v71 = (void *)objc_claimAutoreleasedReturnValue();
    -[_HAPAccessoryServerBTLE200 discoveryContext](v68, "discoveryContext");
    v72 = (void *)objc_claimAutoreleasedReturnValue();
    v73 = objc_msgSend(v72, "discoveryType");
    *(_DWORD *)buf = 138543874;
    v112 = v71;
    v113 = 2114;
    v114 = (uint64_t)v98;
    v115 = 2050;
    v116 = v73;
    _os_log_impl(&dword_1CCE01000, v70, OS_LOG_TYPE_INFO, "%{public}@Completed attribute database parsing with parsed services: %{public}@, type: %{public}tu", buf, 0x20u);

  }
  objc_autoreleasePoolPop(v67);
  -[HAPAccessoryServer primaryAccessory](v68, "primaryAccessory");
  v74 = (void *)objc_claimAutoreleasedReturnValue();
  v75 = (void *)objc_msgSend(v98, "copy");
  objc_msgSend(v74, "setServices:", v75);

  -[_HAPAccessoryServerBTLE200 discoveryContext](v68, "discoveryContext");
  v76 = (void *)objc_claimAutoreleasedReturnValue();
  v77 = objc_msgSend(v76, "discoveryType");

  if (!v77)
  {
    -[_HAPAccessoryServerBTLE200 setVerified:](v68, "setVerified:", 1);
    -[_HAPAccessoryServerBTLE200 _cacheServices:](v68, "_cacheServices:", v98);
  }
LABEL_54:
  v91 = 0;
  v28 = v97;
LABEL_55:

  -[_HAPAccessoryServerBTLE200 discoveryContext](v28, "discoveryContext");
  v92 = v28;
  v93 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v93, "completionHandler");
  v94 = (void *)objc_claimAutoreleasedReturnValue();

  if (v94)
  {
    -[HAPAccessoryServer clientQueue](v92, "clientQueue");
    v95 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __55___HAPAccessoryServerBTLE200__handleCompletedDiscovery__block_invoke;
    block[3] = &unk_1E894D5E0;
    v103 = v94;
    v102 = v91;
    dispatch_async(v95, block);

  }
  -[_HAPAccessoryServerBTLE200 setDiscoveryContext:](v92, "setDiscoveryContext:", 0);

}

- (id)_getCBCharacteristic:(id)a3 instanceId:(id)a4 service:(id)a5
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  void *v16;
  char v17;
  void *v18;
  _HAPAccessoryServerBTLE200 *v19;
  NSObject *v20;
  void *v21;
  void *v22;
  id v23;
  _HAPAccessoryServerBTLE200 *v25;
  id v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  uint8_t buf[4];
  void *v32;
  __int16 v33;
  id v34;
  __int16 v35;
  id v36;
  _BYTE v37[128];
  uint64_t v38;

  v25 = self;
  v38 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v26 = a4;
  v8 = a5;
  objc_msgSend(MEMORY[0x1E0C97778], "UUIDWithNSUUID:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  objc_msgSend(v8, "characteristics");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v27, v37, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v28;
    while (2)
    {
      for (i = 0; i != v12; ++i)
      {
        if (*(_QWORD *)v28 != v13)
          objc_enumerationMutation(v10);
        v15 = *(void **)(*((_QWORD *)&v27 + 1) + 8 * i);
        objc_msgSend(v15, "UUID", v25);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = objc_msgSend(v16, "isEqual:", v9);

        if ((v17 & 1) != 0)
        {
          v23 = v15;

          v21 = v26;
          goto LABEL_13;
        }
      }
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v27, v37, 16);
      if (v12)
        continue;
      break;
    }
  }

  v18 = (void *)MEMORY[0x1D17B7244]();
  v19 = v25;
  HMFGetOSLogHandle();
  v20 = objc_claimAutoreleasedReturnValue();
  v21 = v26;
  if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
  {
    HMFGetLogIdentifier();
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    v32 = v22;
    v33 = 2114;
    v34 = v7;
    v35 = 2114;
    v36 = v26;
    _os_log_impl(&dword_1CCE01000, v20, OS_LOG_TYPE_ERROR, "%{public}@HAPBLECache: NO CB Characteristic for : %{public}@/%{public}@", buf, 0x20u);

  }
  objc_autoreleasePoolPop(v18);
  v23 = 0;
LABEL_13:

  return v23;
}

- (id)_getCBService:(id)a3 instanceOrder:(unint64_t)a4
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  unsigned int v16;
  void *v17;
  int v18;
  id v19;
  void *v20;
  int v21;
  BOOL v22;
  id v23;
  void *v24;
  void *v25;
  _HAPAccessoryServerBTLE200 *v26;
  NSObject *v27;
  void *v28;
  id v30;
  id obj;
  _HAPAccessoryServerBTLE200 *v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  uint8_t buf[4];
  void *v39;
  __int16 v40;
  id v41;
  __int16 v42;
  id v43;
  __int16 v44;
  unint64_t v45;
  _BYTE v46[128];
  uint64_t v47;

  v47 = *MEMORY[0x1E0C80C00];
  v30 = a3;
  objc_msgSend(MEMORY[0x1E0C97778], "UUIDWithNSUUID:");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v34 = 0u;
  v35 = 0u;
  v36 = 0u;
  v37 = 0u;
  v33 = self;
  -[HAPAccessoryServerBTLE peripheral](self, "peripheral");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "services");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v7, "copy");

  obj = v8;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v34, v46, 16);
  if (v9)
  {
    v10 = v9;
    v11 = 0;
    v12 = 0;
    v13 = *(_QWORD *)v35;
    while (2)
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v35 != v13)
          objc_enumerationMutation(obj);
        v15 = *(void **)(*((_QWORD *)&v34 + 1) + 8 * i);
        v16 = objc_msgSend((id)objc_opt_class(), "isHAPService:", v15);
        objc_msgSend(v15, "UUID");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = objc_msgSend(v17, "isEqual:", v5);

        if (v18)
        {
          v19 = v15;

          v11 = v19;
        }
        v12 += v16;
        objc_msgSend(v15, "UUID");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v21 = objc_msgSend(v20, "isEqual:", v5);

        if (v21)
          v22 = v12 == a4;
        else
          v22 = 0;
        if (v22)
        {
          v23 = v15;

          v24 = v30;
          goto LABEL_20;
        }
      }
      v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v34, v46, 16);
      if (v10)
        continue;
      break;
    }
  }
  else
  {
    v11 = 0;
  }

  v25 = (void *)MEMORY[0x1D17B7244]();
  v26 = v33;
  HMFGetOSLogHandle();
  v27 = objc_claimAutoreleasedReturnValue();
  v24 = v30;
  if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
  {
    HMFGetLogIdentifier();
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138544130;
    v39 = v28;
    v40 = 2114;
    v41 = v11;
    v42 = 2114;
    v43 = v30;
    v44 = 2050;
    v45 = a4;
    _os_log_impl(&dword_1CCE01000, v27, OS_LOG_TYPE_ERROR, "%{public}@HAPBLECache: Returning first instance %{public}@ Service for : %{public}@/%{public}tu", buf, 0x2Au);

  }
  objc_autoreleasePoolPop(v25);
  v11 = v11;
  v23 = v11;
LABEL_20:

  return v23;
}

- (id)_getCachedService:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  void *i;
  void *v10;
  void *v11;
  char v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  -[_HAPAccessoryServerBTLE200 accessoryCache](self, "accessoryCache", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "cachedServices");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = (id)objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v7)
  {
    v8 = *(_QWORD *)v15;
    while (2)
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(_QWORD *)v15 != v8)
          objc_enumerationMutation(v6);
        v10 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * (_QWORD)i);
        objc_msgSend(v10, "serviceUUID");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = objc_msgSend(v11, "isEqual:", v4);

        if ((v12 & 1) != 0)
        {
          v7 = v10;
          goto LABEL_11;
        }
      }
      v7 = (id)objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      if (v7)
        continue;
      break;
    }
  }
LABEL_11:

  return v7;
}

- (id)_hapServicesFromCache
{
  unint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  id v10;
  const __CFString *v11;
  void *v12;
  id v13;
  uint64_t v14;
  unint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t i;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  HAPCharacteristic *v28;
  void *v29;
  void *v30;
  void *v31;
  unint64_t v32;
  uint64_t v33;
  void *v34;
  _HAPAccessoryServerBTLE200 *v35;
  void *v36;
  uint64_t v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  HAPService *v42;
  HAPService *v43;
  void *v44;
  void *v45;
  void *v46;
  uint64_t v47;
  void *v48;
  uint64_t v49;
  void *v50;
  id v51;
  void *v52;
  _HAPAccessoryServerBTLE200 *v53;
  NSObject *v54;
  void *v55;
  void *v57;
  _HAPAccessoryServerBTLE200 *v58;
  NSObject *v59;
  void *v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  void *v64;
  uint64_t v65;
  void *v66;
  void *v67;
  void *v68;
  id obj;
  HAPCharacteristic *v70;
  void *v71;
  void *v72;
  uint64_t v73;
  uint64_t v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  __int128 v80;
  __int128 v81;
  __int128 v82;
  uint8_t v83[128];
  uint8_t buf[4];
  void *v85;
  __int16 v86;
  void *v87;
  _BYTE v88[128];
  uint64_t v89;

  v89 = *MEMORY[0x1E0C80C00];
  v3 = 0x1E0C99000uLL;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[_HAPAccessoryServerBTLE200 discoveryContext](self, "discoveryContext");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "discoveryType");

  if (v7 == 2)
  {
    v10 = objc_alloc(MEMORY[0x1E0CB3A28]);
    v11 = CFSTR("00000055-0000-1000-8000-0026BB765291");
  }
  else
  {
    if (v7 != 1)
    {
      if (v7)
        goto LABEL_10;
      -[_HAPAccessoryServerBTLE200 accessoryCache](self, "accessoryCache");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "cachedServices");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "addObjectsFromArray:", v9);

      goto LABEL_9;
    }
    v10 = objc_alloc(MEMORY[0x1E0CB3A28]);
    v11 = CFSTR("0000003E-0000-1000-8000-0026BB765291");
  }
  v12 = (void *)objc_msgSend(v10, "initWithUUIDString:", v11);
  -[_HAPAccessoryServerBTLE200 _getCachedService:](self, "_getCachedService:", v12);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v8)
    goto LABEL_10;
  objc_msgSend(v4, "addObject:", v8);
LABEL_9:

LABEL_10:
  v81 = 0u;
  v82 = 0u;
  v79 = 0u;
  v80 = 0u;
  v13 = v4;
  v63 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v79, v88, 16);
  if (v63)
  {
    v14 = *(_QWORD *)v80;
    v15 = 0x1E0C99000uLL;
    v66 = v13;
    v67 = v5;
    v62 = *(_QWORD *)v80;
    while (2)
    {
      v16 = 0;
      do
      {
        if (*(_QWORD *)v80 != v14)
          objc_enumerationMutation(v13);
        v17 = *(void **)(*((_QWORD *)&v79 + 1) + 8 * v16);
        objc_msgSend(v17, "serviceUUID");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        -[_HAPAccessoryServerBTLE200 _getCBService:instanceOrder:](self, "_getCBService:instanceOrder:", v18, objc_msgSend(v17, "serviceInstanceOrder"));
        v19 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v19)
        {
          v57 = (void *)MEMORY[0x1D17B7244]();
          v58 = self;
          HMFGetOSLogHandle();
          v59 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v59, OS_LOG_TYPE_ERROR))
          {
            HMFGetLogIdentifier();
            v60 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543618;
            v85 = v60;
            v86 = 2114;
            v87 = v17;
            _os_log_impl(&dword_1CCE01000, v59, OS_LOG_TYPE_ERROR, "%{public}@HAPBLECache: No matching cb service for %{public}@", buf, 0x16u);

          }
          objc_autoreleasePoolPop(v57);
LABEL_34:

          v51 = 0;
          goto LABEL_35;
        }
        v65 = v16;
        objc_msgSend(*(id *)(v3 + 3560), "array");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v75 = 0u;
        v76 = 0u;
        v77 = 0u;
        v78 = 0u;
        v64 = v17;
        objc_msgSend(v17, "cachedCharacteristics");
        obj = (id)objc_claimAutoreleasedReturnValue();
        v68 = v20;
        v74 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v75, v83, 16);
        if (v74)
        {
          v73 = *(_QWORD *)v76;
          while (2)
          {
            for (i = 0; i != v74; ++i)
            {
              if (*(_QWORD *)v76 != v73)
                objc_enumerationMutation(obj);
              v22 = *(void **)(*((_QWORD *)&v75 + 1) + 8 * i);
              objc_msgSend(v22, "characteristicUUID");
              v23 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v22, "characteristicInstanceId");
              v24 = (void *)objc_claimAutoreleasedReturnValue();
              -[_HAPAccessoryServerBTLE200 _getCBCharacteristic:instanceId:service:](self, "_getCBCharacteristic:instanceId:service:", v23, v24, v19);
              v25 = (void *)objc_claimAutoreleasedReturnValue();

              -[HAPAccessoryServer primaryAccessory](self, "primaryAccessory");
              v26 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v22, "characteristicInstanceId");
              v27 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v26, "characteristicWithInstanceID:", v27);
              v28 = (HAPCharacteristic *)objc_claimAutoreleasedReturnValue();

              if (!v28)
              {
                v70 = [HAPCharacteristic alloc];
                objc_msgSend(v22, "characteristicUUID");
                v71 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v71, "UUIDString");
                v29 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v22, "characteristicInstanceId");
                v72 = v25;
                v30 = (void *)objc_claimAutoreleasedReturnValue();
                -[HAPAccessoryServerBTLE stateNumber](self, "stateNumber");
                v31 = (void *)objc_claimAutoreleasedReturnValue();
                v32 = v15;
                v33 = objc_msgSend(v22, "characteristicProperties");
                objc_msgSend(v22, "characteristicMetadata");
                v34 = v19;
                v35 = self;
                v36 = (void *)objc_claimAutoreleasedReturnValue();
                LOBYTE(v61) = 1;
                v37 = v33;
                v15 = v32;
                v28 = -[HAPCharacteristic initWithType:instanceID:value:stateNumber:properties:eventNotificationsEnabled:implicitWriteWithResponse:metadata:](v70, "initWithType:instanceID:value:stateNumber:properties:eventNotificationsEnabled:implicitWriteWithResponse:metadata:", v29, v30, 0, v31, v37, 0, v61, v36);

                self = v35;
                v19 = v34;

                v20 = v68;
                v25 = v72;

                if (!v28)
                {
                  v52 = (void *)MEMORY[0x1D17B7244]();
                  v53 = self;
                  HMFGetOSLogHandle();
                  v54 = objc_claimAutoreleasedReturnValue();
                  if (os_log_type_enabled(v54, OS_LOG_TYPE_ERROR))
                  {
                    HMFGetLogIdentifier();
                    v55 = (void *)objc_claimAutoreleasedReturnValue();
                    *(_DWORD *)buf = 138543618;
                    v85 = v55;
                    v86 = 2114;
                    v87 = v22;
                    _os_log_impl(&dword_1CCE01000, v54, OS_LOG_TYPE_ERROR, "%{public}@HAPBLECache: No matching cb characteristic for %{public}@", buf, 0x16u);

                  }
                  objc_autoreleasePoolPop(v52);

                  v13 = v66;
                  v5 = v67;
                  goto LABEL_34;
                }
              }
              objc_msgSend(*(id *)(v15 + 3432), "distantPast");
              v38 = (void *)objc_claimAutoreleasedReturnValue();
              -[HAPCharacteristic setValueUpdatedTime:](v28, "setValueUpdatedTime:", v38);

              -[HAPAccessoryServerBTLE stateNumber](self, "stateNumber");
              v39 = (void *)objc_claimAutoreleasedReturnValue();
              -[HAPCharacteristic setStateNumber:](v28, "setStateNumber:", v39);

              -[HAPCharacteristic setCBCharacteristic:](v28, "setCBCharacteristic:", v25);
              objc_msgSend(v20, "addObject:", v28);

            }
            v74 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v75, v83, 16);
            if (v74)
              continue;
            break;
          }
        }

        -[HAPAccessoryServer primaryAccessory](self, "primaryAccessory");
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v64, "serviceInstanceId");
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v40, "serviceWithInstanceID:", v41);
        v42 = (HAPService *)objc_claimAutoreleasedReturnValue();

        v5 = v67;
        if (v42)
          goto LABEL_27;
        v43 = [HAPService alloc];
        objc_msgSend(v64, "serviceUUID");
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v44, "UUIDString");
        v45 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v64, "serviceInstanceId");
        v46 = (void *)objc_claimAutoreleasedReturnValue();
        v47 = objc_msgSend(v64, "serviceProperties");
        objc_msgSend(v64, "linkedServices");
        v48 = (void *)objc_claimAutoreleasedReturnValue();
        v49 = v47;
        v20 = v68;
        v42 = -[HAPService initWithType:instanceID:parsedCharacteristics:serviceProperties:linkedServices:](v43, "initWithType:instanceID:parsedCharacteristics:serviceProperties:linkedServices:", v45, v46, v68, v49, v48);

        if (v42)
        {
LABEL_27:
          -[HAPAccessoryServer primaryAccessory](self, "primaryAccessory");
          v50 = (void *)objc_claimAutoreleasedReturnValue();
          -[HAPService setAccessory:](v42, "setAccessory:", v50);

          -[HAPService setCBService:](v42, "setCBService:", v19);
          objc_msgSend(v67, "addObject:", v42);

        }
        v13 = v66;
        v16 = v65 + 1;
        v14 = v62;
        v3 = 0x1E0C99000;
        v15 = 0x1E0C99000;
      }
      while (v65 + 1 != v63);
      v63 = objc_msgSend(v66, "countByEnumeratingWithState:objects:count:", &v79, v88, 16);
      if (v63)
        continue;
      break;
    }
  }

  v51 = v5;
LABEL_35:

  return v51;
}

- (id)_serviceCacheFromHAPService:(id)a3 serviceOrder:(unint64_t)a4
{
  id v5;
  HAPBLEServiceCache *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  HAPBLEServiceCache *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  HAPBLECharacteristicCache *v19;
  id v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  HAPBLECharacteristicCache *v26;
  void *v28;
  id obj;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  _BYTE v34[128];
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = [HAPBLEServiceCache alloc];
  v7 = objc_alloc(MEMORY[0x1E0CB3A28]);
  objc_msgSend(v5, "type");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v7, "initWithUUIDString:", v8);
  objc_msgSend(v5, "instanceID");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v5, "serviceProperties");
  objc_msgSend(v5, "linkedServices");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = -[HAPBLEServiceCache initWithServiceUUID:instanceId:instanceOrder:serviceProperties:linkedServices:](v6, "initWithServiceUUID:instanceId:instanceOrder:serviceProperties:linkedServices:", v9, v10, a4, v11, v12);

  v32 = 0u;
  v33 = 0u;
  v30 = 0u;
  v31 = 0u;
  v28 = v5;
  objc_msgSend(v5, "characteristics");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v30, v34, 16);
  if (v14)
  {
    v15 = v14;
    v16 = *(_QWORD *)v31;
    do
    {
      v17 = 0;
      do
      {
        if (*(_QWORD *)v31 != v16)
          objc_enumerationMutation(obj);
        v18 = *(void **)(*((_QWORD *)&v30 + 1) + 8 * v17);
        v19 = [HAPBLECharacteristicCache alloc];
        v20 = objc_alloc(MEMORY[0x1E0CB3A28]);
        objc_msgSend(v18, "type");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        v22 = (void *)objc_msgSend(v20, "initWithUUIDString:", v21);
        objc_msgSend(v18, "instanceID");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        v24 = objc_msgSend(v18, "properties");
        objc_msgSend(v18, "accessoryMetadata");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        v26 = -[HAPBLECharacteristicCache initWithCharacteristicUUID:instanceId:characteristicProperties:characteristicMetadata:](v19, "initWithCharacteristicUUID:instanceId:characteristicProperties:characteristicMetadata:", v22, v23, v24, v25);

        -[HAPBLEServiceCache updateWithCharacteristic:](v13, "updateWithCharacteristic:", v26);
        ++v17;
      }
      while (v15 != v17);
      v15 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v30, v34, 16);
    }
    while (v15);
  }

  return v13;
}

- (void)_cacheServices:(id)a3
{
  id v4;
  void *v5;
  _HAPAccessoryServerBTLE200 *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  int64_t v18;
  void *v19;
  void *v20;
  void *v21;
  _HAPAccessoryServerBTLE200 *v22;
  NSObject *v23;
  void *v24;
  void *v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  uint8_t v30[128];
  uint8_t buf[4];
  void *v32;
  __int16 v33;
  void *v34;
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = (void *)MEMORY[0x1D17B7244]();
  v6 = self;
  HMFGetOSLogHandle();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[_HAPAccessoryServerBTLE200 accessoryCache](v6, "accessoryCache");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v32 = v8;
    v33 = 2112;
    v34 = v9;
    _os_log_impl(&dword_1CCE01000, v7, OS_LOG_TYPE_INFO, "%{public}@HAPBLECache: current Cache : %@", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v5);
  v28 = 0u;
  v29 = 0u;
  v26 = 0u;
  v27 = 0u;
  v10 = v4;
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v27;
    v14 = 1;
    do
    {
      v15 = 0;
      do
      {
        if (*(_QWORD *)v27 != v13)
          objc_enumerationMutation(v10);
        -[_HAPAccessoryServerBTLE200 _serviceCacheFromHAPService:serviceOrder:](v6, "_serviceCacheFromHAPService:serviceOrder:", *(_QWORD *)(*((_QWORD *)&v26 + 1) + 8 * v15), v14 + v15, (_QWORD)v26);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        -[_HAPAccessoryServerBTLE200 accessoryCache](v6, "accessoryCache");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "updateWithService:", v16);

        ++v15;
      }
      while (v12 != v15);
      v14 += v15;
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
    }
    while (v12);
  }

  v18 = +[HAPBLEAccessoryCache currentDiscoveryVersion](HAPBLEAccessoryCache, "currentDiscoveryVersion");
  -[_HAPAccessoryServerBTLE200 accessoryCache](v6, "accessoryCache");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "setDiscoveryVersion:", v18);

  -[_HAPAccessoryServerBTLE200 accessoryCache](v6, "accessoryCache");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "save");

  v21 = (void *)MEMORY[0x1D17B7244](-[_HAPAccessoryServerBTLE200 setHasValidCache:](v6, "setHasValidCache:", 1));
  v22 = v6;
  HMFGetOSLogHandle();
  v23 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    -[_HAPAccessoryServerBTLE200 accessoryCache](v22, "accessoryCache");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v32 = v24;
    v33 = 2112;
    v34 = v25;
    _os_log_impl(&dword_1CCE01000, v23, OS_LOG_TYPE_INFO, "%{public}@HAPBLECache: Saved Valid Cache : %@", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v21);

}

- (void)_discoverServices
{
  id v2;

  -[HAPAccessoryServerBTLE peripheral](self, "peripheral");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "discoverServices:", 0);

}

- (void)_handleDiscoveredServices:(id)a3 error:(id)a4
{
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  int v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  id v28;
  void *v29;
  char v30;
  id obj;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  _BYTE v36[128];
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  if (!a4)
  {
    -[_HAPAccessoryServerBTLE200 _kickConnectionIdleTimer](self, "_kickConnectionIdleTimer");
    v34 = 0u;
    v35 = 0u;
    v32 = 0u;
    v33 = 0u;
    v28 = v6;
    obj = v6;
    v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v32, v36, 16);
    if (!v7)
      goto LABEL_27;
    v8 = v7;
    v9 = *(_QWORD *)v33;
    while (1)
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v33 != v9)
          objc_enumerationMutation(obj);
        v11 = *(void **)(*((_QWORD *)&v32 + 1) + 8 * v10);
        if (objc_msgSend((id)objc_opt_class(), "isHAPService:", v11))
        {
          -[_HAPAccessoryServerBTLE200 discoveryContext](self, "discoveryContext");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          v13 = objc_msgSend(v12, "discoveryType");

          if (v13 == 1)
          {
            objc_msgSend(v11, "UUID");
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(MEMORY[0x1E0C97778], "UUIDWithString:", CFSTR("FED3"));
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            if (objc_msgSend(v14, "isEqual:", v15))
            {

LABEL_26:
              -[_HAPAccessoryServerBTLE200 _discoverCharacteristicsForService:](self, "_discoverCharacteristicsForService:", v11, v28);
              goto LABEL_27;
            }
            objc_msgSend(v11, "UUID");
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(MEMORY[0x1E0C97778], "UUIDWithString:", CFSTR("0000003E-0000-1000-8000-0026BB765291"));
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            v18 = objc_msgSend(v16, "isEqual:", v17);

            if (v18)
              goto LABEL_26;
          }
          else
          {
            -[_HAPAccessoryServerBTLE200 discoveryContext](self, "discoveryContext");
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            v20 = objc_msgSend(v19, "discoveryType");

            if (v20 != 2)
              goto LABEL_18;
            objc_msgSend(v11, "UUID");
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(MEMORY[0x1E0C97778], "UUIDWithString:", CFSTR("FED4"));
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            if ((objc_msgSend(v21, "isEqual:", v22) & 1) != 0)
              goto LABEL_17;
            objc_msgSend(v11, "UUID");
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(MEMORY[0x1E0C97778], "UUIDWithString:", CFSTR("00000055-0000-1000-8000-0026BB765291"));
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            if ((objc_msgSend(v23, "isEqual:", v24) & 1) != 0)
            {

LABEL_17:
LABEL_18:
              -[_HAPAccessoryServerBTLE200 _discoverCharacteristicsForService:](self, "_discoverCharacteristicsForService:", v11, v28);
              goto LABEL_19;
            }
            objc_msgSend(v11, "UUID");
            v29 = v23;
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(MEMORY[0x1E0C97778], "UUIDWithString:", CFSTR("000000A2-0000-1000-8000-0026BB765291"));
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            v30 = objc_msgSend(v25, "isEqual:", v26);

            if ((v30 & 1) != 0)
              goto LABEL_18;
          }
        }
LABEL_19:
        ++v10;
      }
      while (v8 != v10);
      v27 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v32, v36, 16);
      v8 = v27;
      if (!v27)
      {
LABEL_27:

        v6 = v28;
        goto LABEL_28;
      }
    }
  }
  -[_HAPAccessoryServerBTLE200 _cancelDiscoveryWithError:](self, "_cancelDiscoveryWithError:", a4);
LABEL_28:

}

- (void)_discoverCharacteristicsForService:(id)a3
{
  id v4;
  void *v5;
  _HAPAccessoryServerBTLE200 *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  void *v13;
  __int16 v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = (void *)MEMORY[0x1D17B7244]();
  v6 = self;
  HMFGetOSLogHandle();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    HMFGetLogIdentifier();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = 138543618;
    v13 = v8;
    v14 = 2112;
    v15 = v4;
    _os_log_impl(&dword_1CCE01000, v7, OS_LOG_TYPE_DEBUG, "%{public}@Discovering service: %@", (uint8_t *)&v12, 0x16u);

  }
  objc_autoreleasePoolPop(v5);
  -[_HAPAccessoryServerBTLE200 discoveryContext](v6, "discoveryContext");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "discoveringServices");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "addObject:", v4);

  -[HAPAccessoryServerBTLE peripheral](v6, "peripheral");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "discoverCharacteristics:forService:", 0, v4);

}

- (void)_handleDiscoveredCharacteristicsForService:(id)a3 error:(id)a4
{
  id v6;
  id v7;
  void *v8;
  _HAPAccessoryServerBTLE200 *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  int v15;
  void *v16;
  int v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t i;
  void *v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  uint8_t buf[4];
  void *v28;
  __int16 v29;
  id v30;
  _BYTE v31[128];
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (v7)
  {
    -[_HAPAccessoryServerBTLE200 _cancelDiscoveryWithError:](self, "_cancelDiscoveryWithError:", v7);
  }
  else
  {
    -[_HAPAccessoryServerBTLE200 _kickConnectionIdleTimer](self, "_kickConnectionIdleTimer");
    if (objc_msgSend((id)objc_opt_class(), "isHAPService:", v6)
      && !-[_HAPAccessoryServerBTLE200 hasValidCache](self, "hasValidCache"))
    {
      v25 = 0u;
      v26 = 0u;
      v23 = 0u;
      v24 = 0u;
      objc_msgSend(v6, "characteristics", 0);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v23, v31, 16);
      if (v18)
      {
        v19 = v18;
        v20 = *(_QWORD *)v24;
        while (2)
        {
          for (i = 0; i != v19; ++i)
          {
            if (*(_QWORD *)v24 != v20)
              objc_enumerationMutation(v12);
            v22 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * i);
            if (_isServiceInstanceIDCharacteristic(v22))
            {
              -[_HAPAccessoryServerBTLE200 _readCharacteristicValue:](self, "_readCharacteristicValue:", v22);
              goto LABEL_8;
            }
          }
          v19 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v23, v31, 16);
          if (v19)
            continue;
          break;
        }
      }
    }
    else
    {
      v8 = (void *)MEMORY[0x1D17B7244]();
      v9 = self;
      HMFGetOSLogHandle();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
      {
        HMFGetLogIdentifier();
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v28 = v11;
        v29 = 2112;
        v30 = v6;
        _os_log_impl(&dword_1CCE01000, v10, OS_LOG_TYPE_DEBUG, "%{public}@Removing Service: %@ from discovery context", buf, 0x16u);

      }
      objc_autoreleasePoolPop(v8);
      -[_HAPAccessoryServerBTLE200 discoveryContext](v9, "discoveryContext");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "discoveringServices");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "removeObject:", v6);

    }
LABEL_8:

    if (!-[_HAPAccessoryServerBTLE200 hasValidCache](self, "hasValidCache"))
    {
      -[_HAPAccessoryServerBTLE200 discoveryContext](self, "discoveryContext");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = objc_msgSend(v14, "isComplete");

      if (v15)
        -[_HAPAccessoryServerBTLE200 _readCharacteristicSignatures](self, "_readCharacteristicSignatures");
    }
    if (-[_HAPAccessoryServerBTLE200 hasValidCache](self, "hasValidCache"))
    {
      -[_HAPAccessoryServerBTLE200 discoveryContext](self, "discoveryContext");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = objc_msgSend(v16, "isComplete");

      if (v17)
        -[_HAPAccessoryServerBTLE200 _handleCompletedDiscovery](self, "_handleCompletedDiscovery");
    }
  }

}

- (void)_handleReadServiceInstanceId:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (objc_msgSend((id)objc_opt_class(), "isHAPService:", v4))
  {
    v16 = 0u;
    v17 = 0u;
    v14 = 0u;
    v15 = 0u;
    objc_msgSend(v4, "characteristics", 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v15;
      do
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v15 != v8)
            objc_enumerationMutation(v5);
          v10 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * i);
          if ((_isServiceInstanceIDCharacteristic(v10) & 1) == 0
            && -[_HAPAccessoryServerBTLE200 isHAPCharacteristic:](self, "isHAPCharacteristic:", v10))
          {
            -[_HAPAccessoryServerBTLE200 _discoverCharacteristic:](self, "_discoverCharacteristic:", v10);
          }
        }
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      }
      while (v7);
    }

  }
  -[_HAPAccessoryServerBTLE200 discoveryContext](self, "discoveryContext");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "discoveringServices");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "removeObject:", v4);

  -[_HAPAccessoryServerBTLE200 discoveryContext](self, "discoveryContext");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v12) = objc_msgSend(v13, "isComplete");

  if ((_DWORD)v12)
    -[_HAPAccessoryServerBTLE200 _readCharacteristicSignatures](self, "_readCharacteristicSignatures");

}

- (void)_discoverCharacteristic:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  _HAPAccessoryServerBTLE200 *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  int v12;
  void *v13;
  __int16 v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[_HAPAccessoryServerBTLE200 discoveryContext](self, "discoveryContext");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "discoveringCharacteristics");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addObject:", v4);

  v7 = (void *)MEMORY[0x1D17B7244]();
  v8 = self;
  HMFGetOSLogHandle();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
  {
    HMFGetLogIdentifier();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = 138543618;
    v13 = v10;
    v14 = 2112;
    v15 = v4;
    _os_log_impl(&dword_1CCE01000, v9, OS_LOG_TYPE_DEBUG, "%{public}@Discovering characteristic: %@", (uint8_t *)&v12, 0x16u);

  }
  objc_autoreleasePoolPop(v7);
  -[HAPAccessoryServerBTLE peripheral](v8, "peripheral");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "discoverDescriptorsForCharacteristic:", v4);

}

- (void)_handleDiscoveredCharacteristic:(id)a3 error:(id)a4
{
  id v6;
  id v7;
  void *v8;
  _HAPAccessoryServerBTLE200 *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  int v17;
  void *v18;
  __int16 v19;
  void *v20;
  __int16 v21;
  id v22;
  __int16 v23;
  id v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = (void *)MEMORY[0x1D17B7244]();
  v9 = self;
  HMFGetOSLogHandle();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    HMFGetLogIdentifier();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "descriptors");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = 138544130;
    v18 = v11;
    v19 = 2112;
    v20 = v12;
    v21 = 2112;
    v22 = v6;
    v23 = 2112;
    v24 = v7;
    _os_log_impl(&dword_1CCE01000, v10, OS_LOG_TYPE_DEBUG, "%{public}@Discovered descriptors: %@ for characteristic: %@ with error: %@", (uint8_t *)&v17, 0x2Au);

  }
  objc_autoreleasePoolPop(v8);
  if (v7)
  {
    -[_HAPAccessoryServerBTLE200 _cancelDiscoveryWithError:](v9, "_cancelDiscoveryWithError:", v7);
  }
  else
  {
    -[_HAPAccessoryServerBTLE200 _kickConnectionIdleTimer](v9, "_kickConnectionIdleTimer");
    if (-[_HAPAccessoryServerBTLE200 isHAPCharacteristic:](v9, "isHAPCharacteristic:", v6))
    {
      objc_msgSend(v6, "descriptors");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[_HAPAccessoryServerBTLE200 _handleDiscoveredDescriptors:](v9, "_handleDiscoveredDescriptors:", v13);

    }
    -[_HAPAccessoryServerBTLE200 discoveryContext](v9, "discoveryContext");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "discoveringCharacteristics");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "removeObject:", v6);

    -[_HAPAccessoryServerBTLE200 discoveryContext](v9, "discoveryContext");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v15) = objc_msgSend(v16, "isComplete");

    if ((_DWORD)v15)
      -[_HAPAccessoryServerBTLE200 _readCharacteristicSignatures](v9, "_readCharacteristicSignatures");
  }

}

- (void)_handleDiscoveredDescriptors:(id)a3
{
  id v4;
  uint64_t v5;
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

  v15 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v11;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v11 != v7)
          objc_enumerationMutation(v4);
        v9 = *(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * v8);
        if (objc_msgSend((id)objc_opt_class(), "isHAPDescriptor:", v9))
          -[_HAPAccessoryServerBTLE200 _readDescriptorValue:](self, "_readDescriptorValue:", v9);
        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v6);
  }

}

- (void)_readCharacteristicValue:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  _HAPAccessoryServerBTLE200 *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  int v14;
  int v15;
  void *v16;
  __int16 v17;
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[_HAPAccessoryServerBTLE200 discoveryContext](self, "discoveryContext");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "readingCharacteristics");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addObject:", v4);

  objc_msgSend(v4, "value");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    -[_HAPAccessoryServerBTLE200 _handleReadCharacteristicValue:error:](self, "_handleReadCharacteristicValue:error:", v4, 0);
  }
  else
  {
    v8 = (void *)MEMORY[0x1D17B7244]();
    v9 = self;
    HMFGetOSLogHandle();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    {
      HMFGetLogIdentifier();
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = 138543618;
      v16 = v11;
      v17 = 2114;
      v18 = v4;
      _os_log_impl(&dword_1CCE01000, v10, OS_LOG_TYPE_DEBUG, "%{public}@Reading value of characteristic: %{public}@", (uint8_t *)&v15, 0x16u);

    }
    objc_autoreleasePoolPop(v8);
    -[HAPAccessoryServerBTLE peripheral](v9, "peripheral");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "readValueForCharacteristic:", v4);

  }
  -[_HAPAccessoryServerBTLE200 discoveryContext](self, "discoveryContext");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "isComplete");

  if (v14)
    -[_HAPAccessoryServerBTLE200 _readCharacteristicSignatures](self, "_readCharacteristicSignatures");

}

- (void)_handleReadCharacteristicValue:(id)a3 error:(id)a4
{
  void *v6;
  void *v7;
  void *v8;
  int isServiceInstanceIDCharacteristic;
  void *v10;
  void *v11;
  id v12;

  v12 = a3;
  if (a4)
  {
    -[_HAPAccessoryServerBTLE200 _cancelDiscoveryWithError:](self, "_cancelDiscoveryWithError:", a4);
LABEL_7:
    v10 = v12;
    goto LABEL_8;
  }
  -[_HAPAccessoryServerBTLE200 _kickConnectionIdleTimer](self, "_kickConnectionIdleTimer");
  -[_HAPAccessoryServerBTLE200 discoveryContext](self, "discoveryContext");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "readingCharacteristics");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "removeObject:", v12);

  -[_HAPAccessoryServerBTLE200 discoveryContext](self, "discoveryContext");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v7) = objc_msgSend(v8, "isComplete");

  if ((_DWORD)v7)
    -[_HAPAccessoryServerBTLE200 _readCharacteristicSignatures](self, "_readCharacteristicSignatures");
  isServiceInstanceIDCharacteristic = _isServiceInstanceIDCharacteristic(v12);
  v10 = v12;
  if (isServiceInstanceIDCharacteristic)
  {
    objc_msgSend(v12, "service");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[_HAPAccessoryServerBTLE200 _handleReadServiceInstanceId:](self, "_handleReadServiceInstanceId:", v11);

    goto LABEL_7;
  }
LABEL_8:

}

- (void)_readDescriptorValue:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  _HAPAccessoryServerBTLE200 *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  int v14;
  int v15;
  void *v16;
  __int16 v17;
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "value");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
  {
    v6 = (void *)MEMORY[0x1D17B7244]();
    v7 = self;
    HMFGetOSLogHandle();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    {
      HMFGetLogIdentifier();
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = 138543618;
      v16 = v9;
      v17 = 2112;
      v18 = v4;
      _os_log_impl(&dword_1CCE01000, v8, OS_LOG_TYPE_DEBUG, "%{public}@Reading value of descriptor: %@", (uint8_t *)&v15, 0x16u);

    }
    objc_autoreleasePoolPop(v6);
    -[_HAPAccessoryServerBTLE200 discoveryContext](v7, "discoveryContext");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "readingDescriptors");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "addObject:", v4);

    -[HAPAccessoryServerBTLE peripheral](v7, "peripheral");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "readValueForDescriptor:", v4);

  }
  -[_HAPAccessoryServerBTLE200 discoveryContext](self, "discoveryContext");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "isComplete");

  if (v14)
    -[_HAPAccessoryServerBTLE200 _readCharacteristicSignatures](self, "_readCharacteristicSignatures");

}

- (void)_handleReadDescriptorValue:(id)a3 error:(id)a4
{
  id v6;
  id v7;
  void *v8;
  _HAPAccessoryServerBTLE200 *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  int v17;
  void *v18;
  __int16 v19;
  id v20;
  __int16 v21;
  void *v22;
  __int16 v23;
  void *v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = (void *)MEMORY[0x1D17B7244]();
  v9 = self;
  HMFGetOSLogHandle();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "characteristic");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "value");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = 138544130;
    v18 = v11;
    v19 = 2114;
    v20 = v6;
    v21 = 2114;
    v22 = v12;
    v23 = 2114;
    v24 = v13;
    _os_log_impl(&dword_1CCE01000, v10, OS_LOG_TYPE_INFO, "%{public}@Read value of descriptor: %{public}@ for characteristic: %{public}@ value: %{public}@", (uint8_t *)&v17, 0x2Au);

  }
  objc_autoreleasePoolPop(v8);
  if (v7)
  {
    -[_HAPAccessoryServerBTLE200 _cancelDiscoveryWithError:](v9, "_cancelDiscoveryWithError:", v7);
  }
  else
  {
    -[_HAPAccessoryServerBTLE200 _kickConnectionIdleTimer](v9, "_kickConnectionIdleTimer");
    -[_HAPAccessoryServerBTLE200 discoveryContext](v9, "discoveryContext");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "readingDescriptors");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "removeObject:", v6);

    -[_HAPAccessoryServerBTLE200 discoveryContext](v9, "discoveryContext");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v15) = objc_msgSend(v16, "isComplete");

    if ((_DWORD)v15)
      -[_HAPAccessoryServerBTLE200 _readCharacteristicSignatures](v9, "_readCharacteristicSignatures");
  }

}

- (void)_handleUpdateValueForCharacteristic:(id)a3 error:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  void *v17;
  void *v18;
  void *v19;
  int v20;
  void *v21;
  _HAPAccessoryServerBTLE200 *v22;
  NSObject *v23;
  void *v24;
  void *v25;
  void *v26;
  _HAPAccessoryServerBTLE200 *v27;
  NSObject *v28;
  NSObject *v29;
  void *v30;
  void *v31;
  void *v32;
  id v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  uint8_t v38[128];
  uint8_t buf[4];
  void *v40;
  __int16 v41;
  id v42;
  uint64_t v43;

  v43 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  -[_HAPAccessoryServerBTLE200 discoveryContext](self, "discoveryContext");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "readingCharacteristics");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "containsObject:", v6);

  if (v10)
  {
    -[_HAPAccessoryServerBTLE200 _handleReadCharacteristicValue:error:](self, "_handleReadCharacteristicValue:error:", v6, v7);
  }
  else
  {
    objc_msgSend(v6, "value");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v11, "length"))
    {
      v32 = v11;
      v33 = v7;
      v36 = 0u;
      v37 = 0u;
      v34 = 0u;
      v35 = 0u;
      -[_HAPAccessoryServerBTLE200 pendingRequests](self, "pendingRequests");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v34, v38, 16);
      if (v13)
      {
        v14 = v13;
        v15 = *(_QWORD *)v35;
        while (2)
        {
          for (i = 0; i != v14; ++i)
          {
            if (*(_QWORD *)v35 != v15)
              objc_enumerationMutation(v12);
            v17 = *(void **)(*((_QWORD *)&v34 + 1) + 8 * i);
            objc_msgSend(v17, "characteristic");
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v18, "cbCharacteristic");
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            v20 = objc_msgSend(v19, "isEqual:", v6);

            if (v20)
            {
              objc_msgSend(v17, "characteristic");
              v25 = (void *)objc_claimAutoreleasedReturnValue();
              v11 = v32;
              v7 = v33;
              -[_HAPAccessoryServerBTLE200 _handleResponseData:fromCharacteristic:error:](self, "_handleResponseData:fromCharacteristic:error:", v32, v25, v33);

              goto LABEL_23;
            }
          }
          v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v34, v38, 16);
          if (v14)
            continue;
          break;
        }
      }

      v21 = (void *)MEMORY[0x1D17B7244]();
      v22 = self;
      HMFGetOSLogHandle();
      v23 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v40 = v24;
        v41 = 2114;
        v42 = v6;
        _os_log_impl(&dword_1CCE01000, v23, OS_LOG_TYPE_INFO, "%{public}@Received unexpected response from characteristic: %{public}@", buf, 0x16u);

      }
      objc_autoreleasePoolPop(v21);
      v11 = v32;
      v7 = v33;
    }
    else
    {
      -[_HAPAccessoryServerBTLE200 _characteristicForCBCharacteristic:](self, "_characteristicForCBCharacteristic:", v6);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = (void *)MEMORY[0x1D17B7244]();
      v27 = self;
      HMFGetOSLogHandle();
      v28 = objc_claimAutoreleasedReturnValue();
      v29 = v28;
      if (v12)
      {
        if (os_log_type_enabled(v28, OS_LOG_TYPE_DEBUG))
        {
          HMFGetLogIdentifier();
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543618;
          v40 = v30;
          v41 = 2114;
          v42 = v6;
          _os_log_impl(&dword_1CCE01000, v29, OS_LOG_TYPE_DEBUG, "%{public}@Received zero-length value for characteristic: %{public}@", buf, 0x16u);

        }
        objc_autoreleasePoolPop(v26);
        -[_HAPAccessoryServerBTLE200 _handleEventIndicationForCharacteristic:](v27, "_handleEventIndicationForCharacteristic:", v12);
      }
      else
      {
        if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
        {
          HMFGetLogIdentifier();
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543618;
          v40 = v31;
          v41 = 2114;
          v42 = v6;
          _os_log_impl(&dword_1CCE01000, v29, OS_LOG_TYPE_ERROR, "%{public}@Received characteristic indication from unmapped characteristic: %{public}@", buf, 0x16u);

        }
        objc_autoreleasePoolPop(v26);
      }
LABEL_23:

    }
  }

}

- (void)_readCharacteristicSignatures
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t j;
  void *v15;
  void *v16;
  int v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  -[HAPAccessoryServerBTLE peripheral](self, "peripheral");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "services");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v22, v27, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v23;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v23 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * i);
        if (objc_msgSend((id)objc_opt_class(), "isHAPService:", v9))
        {
          v20 = 0u;
          v21 = 0u;
          v18 = 0u;
          v19 = 0u;
          objc_msgSend(v9, "characteristics", 0);
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v18, v26, 16);
          if (v11)
          {
            v12 = v11;
            v13 = *(_QWORD *)v19;
            do
            {
              for (j = 0; j != v12; ++j)
              {
                if (*(_QWORD *)v19 != v13)
                  objc_enumerationMutation(v10);
                v15 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * j);
                if (_isServiceSignatureCharacteristic(v15))
                  -[_HAPAccessoryServerBTLE200 _readServiceSignature:](self, "_readServiceSignature:", v15);
                if (-[_HAPAccessoryServerBTLE200 isHAPCharacteristic:](self, "isHAPCharacteristic:", v15))
                  -[_HAPAccessoryServerBTLE200 _readCharacteristicSignature:](self, "_readCharacteristicSignature:", v15);
              }
              v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v18, v26, 16);
            }
            while (v12);
          }

        }
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v22, v27, 16);
    }
    while (v6);
  }

  -[_HAPAccessoryServerBTLE200 discoveryContext](self, "discoveryContext");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v16, "isComplete");

  if (v17)
    -[_HAPAccessoryServerBTLE200 _handleCompletedDiscovery](self, "_handleCompletedDiscovery");
}

- (id)_getCharacteristicInstanceID:(id)a3 error:(id *)a4
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  void *v11;
  char v12;
  void *v13;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a3, "descriptors");
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v4 = (id)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v17;
    while (2)
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v17 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * i);
        objc_msgSend(v9, "UUID");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0C97778], "UUIDWithString:", CFSTR("DC46F0FE-81D2-4616-B5D9-6ABDD796939A"));
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = objc_msgSend(v10, "isEqual:", v11);

        if ((v12 & 1) != 0)
        {
          _parseCharacteristicInstanceID(v9, a4);
          v13 = (void *)objc_claimAutoreleasedReturnValue();

          goto LABEL_12;
        }
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
      if (v6)
        continue;
      break;
    }
  }

  if (a4)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "hapErrorWithCode:description:reason:suggestion:underlyingError:", 1, CFSTR("Characteristic missing the characteristic instance ID descriptor"), 0, 0, 0);
    v13 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v13 = 0;
  }
LABEL_12:

  return v13;
}

- (id)_getServiceInstanceID:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *i;
  void *v9;
  void *v10;
  _HAPAccessoryServerBTLE200 *v11;
  NSObject *v12;
  void *v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  uint8_t buf[4];
  void *v20;
  __int16 v21;
  id v22;
  __int16 v23;
  void *v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  objc_msgSend(v4, "characteristics", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v15, v25, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v16;
    while (2)
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(_QWORD *)v16 != v7)
          objc_enumerationMutation(v5);
        v9 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * (_QWORD)i);
        if (_isServiceInstanceIDCharacteristic(v9))
        {
          _parseServiceInstanceID(v9, 0);
          v6 = (void *)objc_claimAutoreleasedReturnValue();
          if (!v6)
          {
            v10 = (void *)MEMORY[0x1D17B7244]();
            v11 = self;
            HMFGetOSLogHandle();
            v12 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
            {
              HMFGetLogIdentifier();
              v13 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138543874;
              v20 = v13;
              v21 = 2114;
              v22 = v4;
              v23 = 2114;
              v24 = v9;
              _os_log_impl(&dword_1CCE01000, v12, OS_LOG_TYPE_ERROR, "%{public}@Failed to get Service Instance ID for Service: %{public}@, Characteristic: %{public}@", buf, 0x20u);

            }
            objc_autoreleasePoolPop(v10);
            v6 = 0;
          }
          goto LABEL_14;
        }
      }
      v6 = (void *)objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v15, v25, 16);
      if (v6)
        continue;
      break;
    }
  }
LABEL_14:

  return v6;
}

- (id)_getProtocolInfoService
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  void *v7;
  void *v8;
  char v9;
  id v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  -[_HAPAccessoryServerBTLE200 _hapServicesFromCache](self, "_hapServicesFromCache");
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v2 = (id)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v13;
    while (2)
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v13 != v5)
          objc_enumerationMutation(v2);
        v7 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * i);
        objc_msgSend(v7, "type", (_QWORD)v12);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = objc_msgSend(v8, "isEqualToString:", CFSTR("000000A2-0000-1000-8000-0026BB765291"));

        if ((v9 & 1) != 0)
        {
          v10 = v7;
          goto LABEL_11;
        }
      }
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      if (v4)
        continue;
      break;
    }
  }
  v10 = 0;
LABEL_11:

  return v10;
}

- (void)_readCharacteristicSignature:(id)a3
{
  __CFString *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  __CFString *v9;
  _BOOL4 v10;
  void *v11;
  _HAPAccessoryServerBTLE200 *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  _HAPAccessoryServerBTLE200 *v18;
  NSObject *v19;
  void *v20;
  void *v21;
  _HAPAccessoryServerBTLE200 *v22;
  NSObject *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  void *v27;
  void *v28;
  _HAPAccessoryServerBTLE200 *v29;
  NSObject *v30;
  void *v31;
  id v32;
  void *v33;
  void *v34;
  void *v35;
  id v36;
  void *v37;
  void *v38;
  void *v39;
  uint64_t v40;
  void *v41;
  HAPBTLECharacteristicSignature *v42;
  void *v43;
  void *v44;
  void *v45;
  _HAPAccessoryServerBTLE200 *v46;
  NSObject *v47;
  void *v48;
  void *v49;
  _HAPAccessoryServerBTLE200 *v50;
  NSObject *v51;
  void *v52;
  HAPBTLECharacteristicSignature *v53;
  void *v54;
  uint64_t v55;
  HAPCharacteristic *v56;
  void *v57;
  void *v58;
  HAPCharacteristic *v59;
  void *v60;
  _BOOL8 v61;
  void *v62;
  __CFString *v63;
  __CFString *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  _HAPAccessoryServerBTLE200 *v71;
  NSObject *v72;
  void *v73;
  void *v74;
  _HAPAccessoryServerBTLE200 *v75;
  NSObject *v76;
  void *v77;
  uint64_t v78;
  void *v79;
  HAPBTLECharacteristicSignature *v80;
  _HAPAccessoryServerBTLE200 *v81;
  void *v82;
  HAPBTLECharacteristicSignature *v83;
  void *v84;
  void *v85;
  __CFString *v86;
  __CFString *v87;
  void *v88;
  void *v89;
  _QWORD v90[5];
  __CFString *v91;
  id v92;
  id v93;
  uint8_t buf[4];
  void *v95;
  __int16 v96;
  const __CFString *v97;
  __int16 v98;
  __CFString *v99;
  uint64_t v100;

  v100 = *MEMORY[0x1E0C80C00];
  v4 = (__CFString *)a3;
  if (-[_HAPAccessoryServerBTLE200 isHAPCharacteristic:](self, "isHAPCharacteristic:", v4))
  {
    v5 = (void *)objc_opt_class();
    -[__CFString UUID](v4, "UUID");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "hapUUIDFromBTLEUUID:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7)
    {
      v93 = 0;
      -[_HAPAccessoryServerBTLE200 _getCharacteristicInstanceID:error:](self, "_getCharacteristicInstanceID:error:", v4, &v93);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = (__CFString *)v93;
      if (v8)
      {
        if (-[_HAPAccessoryServerBTLE200 isVerified](self, "isVerified"))
        {
          v10 = 0;
        }
        else
        {
          -[_HAPAccessoryServerBTLE200 discoveryContext](self, "discoveryContext");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v25, "discoveryType"))
            v10 = 0;
          else
            v10 = -[_HAPAccessoryServerBTLE200 shouldVerifyHAPCharacteristic:](self, "shouldVerifyHAPCharacteristic:", v4);

        }
        -[_HAPAccessoryServerBTLE200 _characteristicForCBCharacteristic:](self, "_characteristicForCBCharacteristic:", v4);
        v26 = objc_claimAutoreleasedReturnValue();
        v27 = (void *)v26;
        if (v10 || !v26)
        {
          if (v10 && objc_msgSend(0, "isAuthenticated"))
          {
            v45 = (void *)MEMORY[0x1D17B7244]();
            v46 = self;
            HMFGetOSLogHandle();
            v47 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v47, OS_LOG_TYPE_DEBUG))
            {
              HMFGetLogIdentifier();
              v48 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138543618;
              v95 = v48;
              v96 = 2112;
              v97 = v4;
              _os_log_impl(&dword_1CCE01000, v47, OS_LOG_TYPE_DEBUG, "%{public}@Found authenticated cached signature, skipping reading characteristic signature for characteristic: %@", buf, 0x16u);

            }
            objc_autoreleasePoolPop(v45);
            -[_HAPAccessoryServerBTLE200 discoveryContext](v46, "discoveryContext");
            v42 = (HAPBTLECharacteristicSignature *)objc_claimAutoreleasedReturnValue();
            -[HAPBTLECharacteristicSignature characteristicSignatures](v42, "characteristicSignatures");
            v43 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v43, "setObject:forKey:", 0, v4);
          }
          else
          {
            v49 = (void *)MEMORY[0x1D17B7244]();
            v50 = self;
            HMFGetOSLogHandle();
            v51 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v51, OS_LOG_TYPE_DEBUG))
            {
              HMFGetLogIdentifier();
              v52 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138543618;
              v95 = v52;
              v96 = 2112;
              v97 = v4;
              _os_log_impl(&dword_1CCE01000, v51, OS_LOG_TYPE_DEBUG, "%{public}@Reading signature for characteristic: %@", buf, 0x16u);

            }
            objc_autoreleasePoolPop(v49);
            +[HAPMetadata getSharedInstance](HAPMetadata, "getSharedInstance");
            v53 = (HAPBTLECharacteristicSignature *)objc_claimAutoreleasedReturnValue();
            v89 = v7;
            objc_msgSend(v7, "UUIDString");
            v54 = (void *)objc_claimAutoreleasedReturnValue();
            -[HAPBTLECharacteristicSignature getDefaultCharacteristicProperties:](v53, "getDefaultCharacteristicProperties:", v54);
            v43 = (void *)objc_claimAutoreleasedReturnValue();

            v87 = v9;
            v79 = v27;
            v83 = v53;
            if (v43)
              v55 = objc_msgSend(v43, "unsignedLongLongValue");
            else
              v55 = 2;
            v56 = [HAPCharacteristic alloc];
            objc_msgSend(v7, "UUIDString");
            v57 = (void *)objc_claimAutoreleasedReturnValue();
            -[HAPAccessoryServerBTLE stateNumber](v50, "stateNumber");
            v58 = (void *)objc_claimAutoreleasedReturnValue();
            LOBYTE(v78) = 1;
            v59 = -[HAPCharacteristic initWithType:instanceID:value:stateNumber:properties:eventNotificationsEnabled:implicitWriteWithResponse:metadata:](v56, "initWithType:instanceID:value:stateNumber:properties:eventNotificationsEnabled:implicitWriteWithResponse:metadata:", v57, v8, 0, v58, v55, 0, v78, 0);

            v85 = v8;
            if (v59)
            {
              -[HAPCharacteristic setCBCharacteristic:](v59, "setCBCharacteristic:", v4);
              -[_HAPAccessoryServerBTLE200 discoveryContext](v50, "discoveryContext");
              v60 = (void *)objc_claimAutoreleasedReturnValue();
              v61 = objc_msgSend(v60, "discoveryType") == 0;

              v92 = 0;
              objc_msgSend((id)objc_opt_class(), "signatureRequestForCharacteristic:requiresAuthentication:error:", v59, v61, &v92);
              v62 = (void *)objc_claimAutoreleasedReturnValue();
              v63 = (__CFString *)v92;
              if (v62)
              {
                v90[0] = MEMORY[0x1E0C809B0];
                v90[1] = 3221225472;
                v90[2] = __59___HAPAccessoryServerBTLE200__readCharacteristicSignature___block_invoke;
                v90[3] = &unk_1E894AB00;
                v90[4] = v50;
                v64 = v4;
                v91 = v64;
                v65 = (void *)MEMORY[0x1D17B7400](v90);
                -[_HAPAccessoryServerBTLE200 _sendRequest:shouldPrioritize:responseHandler:](v50, "_sendRequest:shouldPrioritize:responseHandler:", v62, 0, v65);
                -[_HAPAccessoryServerBTLE200 discoveryContext](v50, "discoveryContext");
                v66 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v66, "readingSignatureCharacteristics");
                v67 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v67, "addObject:", v64);

              }
              else
              {
                v74 = (void *)MEMORY[0x1D17B7244]();
                v75 = v50;
                HMFGetOSLogHandle();
                v76 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v76, OS_LOG_TYPE_ERROR))
                {
                  HMFGetLogIdentifier();
                  v77 = (void *)objc_claimAutoreleasedReturnValue();
                  *(_DWORD *)buf = 138543874;
                  v95 = v77;
                  v96 = 2112;
                  v97 = v4;
                  v98 = 2112;
                  v99 = v63;
                  _os_log_impl(&dword_1CCE01000, v76, OS_LOG_TYPE_ERROR, "%{public}@Failed to create signature request for characteristic, %@, with error: %@", buf, 0x20u);

                }
                objc_autoreleasePoolPop(v74);
                -[_HAPAccessoryServerBTLE200 _handleReadCharacteristicSignature:error:](v75, "_handleReadCharacteristicSignature:error:", v4, v63);
                v62 = 0;
              }
            }
            else
            {
              v68 = (void *)MEMORY[0x1E0CB3940];
              objc_msgSend(v7, "UUIDString");
              v69 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v68, "stringWithFormat:", CFSTR("Failed to create characteristic with type, %@, characteristic instance ID, %@, properties, %tu"), v69, v8, v55);
              v63 = (__CFString *)objc_claimAutoreleasedReturnValue();

              v70 = (void *)MEMORY[0x1D17B7244]();
              v71 = v50;
              HMFGetOSLogHandle();
              v72 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v72, OS_LOG_TYPE_ERROR))
              {
                HMFGetLogIdentifier();
                v73 = (void *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = 138543618;
                v95 = v73;
                v96 = 2112;
                v97 = v63;
                _os_log_impl(&dword_1CCE01000, v72, OS_LOG_TYPE_ERROR, "%{public}@%@", buf, 0x16u);

              }
              objc_autoreleasePoolPop(v70);
              objc_msgSend(MEMORY[0x1E0CB35C8], "hapErrorWithCode:description:reason:suggestion:underlyingError:", 3, v63, 0, 0, 0);
              v62 = (void *)objc_claimAutoreleasedReturnValue();
              -[_HAPAccessoryServerBTLE200 _handleReadCharacteristicSignature:error:](v71, "_handleReadCharacteristicSignature:error:", v4, v62);
            }
            v27 = v79;

            v8 = v85;
            v9 = v87;
            v7 = v89;
            v42 = v83;
          }
        }
        else
        {
          v86 = v9;
          v88 = v7;
          v84 = v8;
          v28 = (void *)MEMORY[0x1D17B7244]();
          v29 = self;
          HMFGetOSLogHandle();
          v30 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v30, OS_LOG_TYPE_DEBUG))
          {
            HMFGetLogIdentifier();
            v31 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543618;
            v95 = v31;
            v96 = 2112;
            v97 = v4;
            _os_log_impl(&dword_1CCE01000, v30, OS_LOG_TYPE_DEBUG, "%{public}@Found cached signature, skipping reading characteristic signature for characteristic: %@", buf, 0x16u);

          }
          objc_autoreleasePoolPop(v28);
          v80 = [HAPBTLECharacteristicSignature alloc];
          v32 = objc_alloc(MEMORY[0x1E0CB3A28]);
          objc_msgSend(v27, "type");
          v82 = (void *)objc_claimAutoreleasedReturnValue();
          v33 = (void *)objc_msgSend(v32, "initWithUUIDString:", v82);
          objc_msgSend(v27, "service");
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v34, "instanceID");
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          v36 = objc_alloc(MEMORY[0x1E0CB3A28]);
          objc_msgSend(v27, "service");
          v81 = v29;
          v37 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v37, "type");
          v38 = (void *)objc_claimAutoreleasedReturnValue();
          v39 = (void *)objc_msgSend(v36, "initWithUUIDString:", v38);
          v40 = objc_msgSend(v27, "properties");
          objc_msgSend(v27, "metadata");
          v41 = (void *)objc_claimAutoreleasedReturnValue();
          v42 = -[HAPBTLECharacteristicSignature initWithCharacteristicType:serviceInstanceID:serviceType:characteristicProperties:characteristicMetadata:authenticated:](v80, "initWithCharacteristicType:serviceInstanceID:serviceType:characteristicProperties:characteristicMetadata:authenticated:", v33, v35, v39, v40, v41, 0);

          -[_HAPAccessoryServerBTLE200 discoveryContext](v81, "discoveryContext");
          v43 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v43, "characteristicSignatures");
          v44 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v44, "setObject:forKey:", v42, v4);

          v8 = v84;
          v9 = v86;
          v7 = v88;
        }

      }
      else
      {
        v21 = (void *)MEMORY[0x1D17B7244]();
        v22 = self;
        HMFGetOSLogHandle();
        v23 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
        {
          HMFGetLogIdentifier();
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543874;
          v95 = v24;
          v96 = 2112;
          v97 = v4;
          v98 = 2112;
          v99 = v9;
          _os_log_impl(&dword_1CCE01000, v23, OS_LOG_TYPE_ERROR, "%{public}@Failed to get characteristic, %@, instance ID with error: %@", buf, 0x20u);

        }
        objc_autoreleasePoolPop(v21);
        -[_HAPAccessoryServerBTLE200 _handleReadCharacteristicSignature:error:](v22, "_handleReadCharacteristicSignature:error:", v4, v9);
        v8 = 0;
      }
    }
    else
    {
      v15 = (void *)MEMORY[0x1E0CB3940];
      -[__CFString UUID](v4, "UUID");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "stringWithFormat:", CFSTR("Failed to convert UUID '%@' to HAP UUID"), v16);
      v9 = (__CFString *)objc_claimAutoreleasedReturnValue();

      v17 = (void *)MEMORY[0x1D17B7244]();
      v18 = self;
      HMFGetOSLogHandle();
      v19 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v95 = v20;
        v96 = 2112;
        v97 = v9;
        _os_log_impl(&dword_1CCE01000, v19, OS_LOG_TYPE_ERROR, "%{public}@%@", buf, 0x16u);

      }
      objc_autoreleasePoolPop(v17);
      objc_msgSend(MEMORY[0x1E0CB35C8], "hapErrorWithCode:description:reason:suggestion:underlyingError:", 3, v9, 0, 0, 0);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[_HAPAccessoryServerBTLE200 _handleReadCharacteristicSignature:error:](v18, "_handleReadCharacteristicSignature:error:", v4, v8);
    }

  }
  else
  {
    v11 = (void *)MEMORY[0x1D17B7244]();
    v12 = self;
    HMFGetOSLogHandle();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v95 = v14;
      v96 = 2112;
      v97 = CFSTR("Characteristic does not support HAP");
      _os_log_impl(&dword_1CCE01000, v13, OS_LOG_TYPE_ERROR, "%{public}@%@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v11);
    objc_msgSend(MEMORY[0x1E0CB35C8], "hapErrorWithCode:description:reason:suggestion:underlyingError:", 3, CFSTR("Characteristic does not support HAP"), 0, 0, 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[_HAPAccessoryServerBTLE200 _handleReadCharacteristicSignature:error:](v12, "_handleReadCharacteristicSignature:error:", v4, v7);
  }

}

- (void)_readServiceSignature:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  __CFString *v12;
  _BOOL4 v13;
  void *v14;
  _HAPAccessoryServerBTLE200 *v15;
  NSObject *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  _HAPAccessoryServerBTLE200 *v22;
  NSObject *v23;
  void *v24;
  void *v25;
  _HAPAccessoryServerBTLE200 *v26;
  NSObject *v27;
  void *v28;
  __CFString *v29;
  __CFString *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  _HAPAccessoryServerBTLE200 *v35;
  NSObject *v36;
  __CFString *v37;
  void *v38;
  __CFString *v39;
  HAPBTLEServiceSignature *v40;
  id v41;
  void *v42;
  void *v43;
  void *v44;
  uint64_t v45;
  void *v46;
  HAPBTLEServiceSignature *v47;
  void *v48;
  HAPService *v49;
  void *v50;
  void *v51;
  _HAPAccessoryServerBTLE200 *v52;
  NSObject *v53;
  void *v54;
  uint64_t v55;
  __CFString *v56;
  void *v57;
  _HAPAccessoryServerBTLE200 *v58;
  NSObject *v59;
  void *v60;
  uint64_t v61;
  __CFString *v62;
  HAPBTLEServiceSignature *v63;
  void *v64;
  void *v65;
  HAPService *v66;
  void *v67;
  void *v68;
  HAPCharacteristic *v69;
  void *v70;
  void *v71;
  void *v72;
  HAPCharacteristic *v73;
  HAPCharacteristic *v74;
  void *v75;
  _BOOL8 v76;
  void *v77;
  id v78;
  void *v79;
  void *v80;
  id v81;
  void *v82;
  void *v83;
  void *v84;
  void *v85;
  void *v86;
  void *v87;
  uint64_t v88;
  void *v89;
  _HAPAccessoryServerBTLE200 *v90;
  NSObject *v91;
  void *v92;
  void *v93;
  void *v94;
  id v95;
  void *v96;
  _HAPAccessoryServerBTLE200 *v97;
  NSObject *v98;
  void *v99;
  uint64_t v100;
  id v101;
  HAPCharacteristic *v102;
  void *v103;
  HAPBTLEServiceSignature *v104;
  void *v105;
  const __CFString *v106;
  uint64_t v107;
  uint64_t v108;
  void *v109;
  _QWORD v110[4];
  id v111;
  _HAPAccessoryServerBTLE200 *v112;
  id v113;
  id v114;
  id v115;
  id v116;
  uint8_t buf[4];
  void *v118;
  __int16 v119;
  const __CFString *v120;
  __int16 v121;
  id v122;
  __int16 v123;
  __CFString *v124;
  uint64_t v125;

  v125 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (-[_HAPAccessoryServerBTLE200 isHAPCharacteristic:](self, "isHAPCharacteristic:", v4))
  {
    v5 = (void *)objc_opt_class();
    objc_msgSend(v4, "service");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "UUID");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "hapUUIDFromBTLEUUID:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
    {
      objc_msgSend(v4, "service");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[_HAPAccessoryServerBTLE200 _getServiceInstanceID:](self, "_getServiceInstanceID:", v9);
      v10 = objc_claimAutoreleasedReturnValue();

      v116 = 0;
      -[_HAPAccessoryServerBTLE200 _getCharacteristicInstanceID:error:](self, "_getCharacteristicInstanceID:error:", v4, &v116);
      v11 = objc_claimAutoreleasedReturnValue();
      v12 = (__CFString *)v116;
      if (v10 | v11)
      {
        if (-[_HAPAccessoryServerBTLE200 isVerified](self, "isVerified"))
        {
          v13 = 0;
        }
        else
        {
          -[_HAPAccessoryServerBTLE200 discoveryContext](self, "discoveryContext");
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v31, "discoveryType"))
          {
            v13 = 0;
          }
          else
          {
            objc_msgSend(v4, "service");
            v32 = (void *)objc_claimAutoreleasedReturnValue();
            v13 = -[_HAPAccessoryServerBTLE200 shouldVerifyHAPService:](self, "shouldVerifyHAPService:", v32);

          }
        }
        objc_msgSend(v4, "service");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        -[_HAPAccessoryServerBTLE200 _serviceForCBService:](self, "_serviceForCBService:", v33);
        v30 = (__CFString *)objc_claimAutoreleasedReturnValue();

        v109 = (void *)v10;
        if (v13 || !v30)
        {
          if (v13 && objc_msgSend(0, "isAuthenticated"))
          {
            v51 = (void *)MEMORY[0x1D17B7244]();
            v52 = self;
            HMFGetOSLogHandle();
            v53 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v53, OS_LOG_TYPE_DEBUG))
            {
              HMFGetLogIdentifier();
              v54 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v4, "service");
              v55 = v11;
              v56 = (__CFString *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138543618;
              v118 = v54;
              v119 = 2112;
              v120 = v56;
              _os_log_impl(&dword_1CCE01000, v53, OS_LOG_TYPE_DEBUG, "%{public}@Found authenticated cached signature, skipping reading service signature for service: %@", buf, 0x16u);

              v11 = v55;
              v10 = (uint64_t)v109;
            }

            objc_autoreleasePoolPop(v51);
            -[_HAPAccessoryServerBTLE200 discoveryContext](v52, "discoveryContext");
            v47 = (HAPBTLEServiceSignature *)objc_claimAutoreleasedReturnValue();
            -[HAPBTLEServiceSignature serviceSignatures](v47, "serviceSignatures");
            v48 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v4, "service");
            v49 = (HAPService *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v48, "setObject:forKey:", 0, v49);
          }
          else
          {
            v106 = v30;
            v57 = (void *)MEMORY[0x1D17B7244]();
            v58 = self;
            HMFGetOSLogHandle();
            v59 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v59, OS_LOG_TYPE_DEBUG))
            {
              HMFGetLogIdentifier();
              v60 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v4, "service");
              v61 = v11;
              v62 = (__CFString *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138543618;
              v118 = v60;
              v119 = 2112;
              v120 = v62;
              _os_log_impl(&dword_1CCE01000, v59, OS_LOG_TYPE_DEBUG, "%{public}@Reading signature for service: %@", buf, 0x16u);

              v11 = v61;
            }

            objc_autoreleasePoolPop(v57);
            +[HAPMetadata getSharedInstance](HAPMetadata, "getSharedInstance");
            v63 = (HAPBTLEServiceSignature *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v8, "UUIDString");
            v64 = (void *)objc_claimAutoreleasedReturnValue();
            -[HAPBTLEServiceSignature getDefaultServiceProperties:](v63, "getDefaultServiceProperties:", v64);
            v65 = (void *)objc_claimAutoreleasedReturnValue();

            v108 = v11;
            v103 = v65;
            v104 = v63;
            if (v65)
              v65 = (void *)objc_msgSend(v65, "unsignedLongLongValue");
            v66 = [HAPService alloc];
            objc_msgSend(v8, "UUIDString");
            v67 = (void *)objc_claimAutoreleasedReturnValue();
            v49 = -[HAPService initWithType:instanceID:parsedCharacteristics:serviceProperties:linkedServices:](v66, "initWithType:instanceID:parsedCharacteristics:serviceProperties:linkedServices:", v67, v109, 0, v65, 0);

            if (v49)
            {
              objc_msgSend(v4, "service");
              v68 = (void *)objc_claimAutoreleasedReturnValue();
              -[HAPService setCBService:](v49, "setCBService:", v68);

              v69 = [HAPCharacteristic alloc];
              objc_msgSend(v4, "UUID");
              v70 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v70, "UUIDString");
              v71 = (void *)objc_claimAutoreleasedReturnValue();
              -[HAPAccessoryServerBTLE stateNumber](v58, "stateNumber");
              v72 = (void *)objc_claimAutoreleasedReturnValue();
              LOBYTE(v100) = 1;
              v73 = -[HAPCharacteristic initWithType:instanceID:value:stateNumber:properties:eventNotificationsEnabled:implicitWriteWithResponse:metadata:](v69, "initWithType:instanceID:value:stateNumber:properties:eventNotificationsEnabled:implicitWriteWithResponse:metadata:", v71, v108, 0, v72, 2, 0, v100, 0);

              v74 = v73;
              -[HAPCharacteristic setCBCharacteristic:](v73, "setCBCharacteristic:", v4);
              -[HAPCharacteristic setService:](v73, "setService:", v49);
              -[_HAPAccessoryServerBTLE200 discoveryContext](v58, "discoveryContext");
              v75 = (void *)objc_claimAutoreleasedReturnValue();
              v76 = objc_msgSend(v75, "discoveryType") == 0;

              v115 = 0;
              objc_msgSend((id)objc_opt_class(), "signatureRequestForService:characteristic:requiresAuthentication:error:", v49, v74, v76, &v115);
              v77 = (void *)objc_claimAutoreleasedReturnValue();
              v78 = v115;
              v101 = v78;
              v102 = v74;
              if (v77)
              {
                objc_msgSend(v4, "service");
                v79 = v77;
                v80 = (void *)objc_claimAutoreleasedReturnValue();
                v110[0] = MEMORY[0x1E0C809B0];
                v110[1] = 3221225472;
                v110[2] = __52___HAPAccessoryServerBTLE200__readServiceSignature___block_invoke;
                v110[3] = &unk_1E894AB28;
                v111 = v80;
                v112 = v58;
                v113 = v109;
                v114 = v8;
                v81 = v80;
                v82 = (void *)MEMORY[0x1D17B7400](v110);
                -[_HAPAccessoryServerBTLE200 _sendRequest:shouldPrioritize:responseHandler:](v58, "_sendRequest:shouldPrioritize:responseHandler:", v79, 0, v82);
                -[_HAPAccessoryServerBTLE200 discoveryContext](v58, "discoveryContext");
                v83 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v83, "readingSignatureServices");
                v84 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v4, "service");
                v85 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v84, "addObject:", v85);

                v77 = v79;
              }
              else
              {
                v95 = v78;
                v96 = (void *)MEMORY[0x1D17B7244]();
                v97 = v58;
                HMFGetOSLogHandle();
                v98 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v98, OS_LOG_TYPE_ERROR))
                {
                  HMFGetLogIdentifier();
                  v99 = (void *)objc_claimAutoreleasedReturnValue();
                  *(_DWORD *)buf = 138543874;
                  v118 = v99;
                  v119 = 2112;
                  v120 = v106;
                  v121 = 2112;
                  v122 = v95;
                  _os_log_impl(&dword_1CCE01000, v98, OS_LOG_TYPE_ERROR, "%{public}@Failed to create signature request for service, %@, with error: %@", buf, 0x20u);

                  v77 = 0;
                }

                objc_autoreleasePoolPop(v96);
                objc_msgSend(v4, "service");
                v81 = (id)objc_claimAutoreleasedReturnValue();
                -[_HAPAccessoryServerBTLE200 _handleReadServiceSignature:error:](v97, "_handleReadServiceSignature:error:", v81, v95);
              }
              v11 = v108;
              v47 = v104;

              v10 = (uint64_t)v109;
              v30 = (__CFString *)v106;
              v93 = v101;
              v94 = v102;
            }
            else
            {
              v86 = (void *)MEMORY[0x1E0CB3940];
              objc_msgSend(v8, "UUIDString");
              v87 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v86, "stringWithFormat:", CFSTR("Failed to create service with type, %@, instance ID, %@, properties, %tu"), v87, v109, v65);
              v88 = objc_claimAutoreleasedReturnValue();

              v89 = (void *)MEMORY[0x1D17B7244]();
              v90 = v58;
              HMFGetOSLogHandle();
              v91 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v91, OS_LOG_TYPE_ERROR))
              {
                HMFGetLogIdentifier();
                v92 = (void *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = 138543618;
                v118 = v92;
                v119 = 2112;
                v120 = (const __CFString *)v88;
                _os_log_impl(&dword_1CCE01000, v91, OS_LOG_TYPE_ERROR, "%{public}@%@", buf, 0x16u);

              }
              objc_autoreleasePoolPop(v89);
              objc_msgSend(MEMORY[0x1E0CB35C8], "hapErrorWithCode:description:reason:suggestion:underlyingError:", 3, v88, 0, 0, 0);
              v93 = (void *)objc_claimAutoreleasedReturnValue();
              -[_HAPAccessoryServerBTLE200 _handleReadCharacteristicSignature:error:](v90, "_handleReadCharacteristicSignature:error:", v4, v93);
              v11 = v108;
              v10 = (uint64_t)v109;
              v94 = (void *)v88;
              v47 = v104;
              v30 = (__CFString *)v106;
            }

            v48 = v103;
          }
        }
        else
        {
          v105 = v8;
          v107 = v11;
          v34 = (void *)MEMORY[0x1D17B7244]();
          v35 = self;
          HMFGetOSLogHandle();
          v36 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v36, OS_LOG_TYPE_DEBUG))
          {
            HMFGetLogIdentifier();
            v37 = v30;
            v38 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v4, "service");
            v39 = (__CFString *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543618;
            v118 = v38;
            v119 = 2112;
            v120 = v39;
            _os_log_impl(&dword_1CCE01000, v36, OS_LOG_TYPE_DEBUG, "%{public}@Found cached service signature, skipping reading service signature for service: %@", buf, 0x16u);

            v30 = v37;
          }

          objc_autoreleasePoolPop(v34);
          v40 = [HAPBTLEServiceSignature alloc];
          v41 = objc_alloc(MEMORY[0x1E0CB3A28]);
          -[__CFString type](v30, "type");
          v42 = (void *)objc_claimAutoreleasedReturnValue();
          v43 = (void *)objc_msgSend(v41, "initWithUUIDString:", v42);
          -[__CFString instanceID](v30, "instanceID");
          v44 = (void *)objc_claimAutoreleasedReturnValue();
          v45 = -[__CFString serviceProperties](v30, "serviceProperties");
          -[__CFString linkedServices](v30, "linkedServices");
          v46 = (void *)objc_claimAutoreleasedReturnValue();
          v47 = -[HAPBTLEServiceSignature initWithServiceType:serviceInstanceID:serviceProperties:linkedServices:authenticated:](v40, "initWithServiceType:serviceInstanceID:serviceProperties:linkedServices:authenticated:", v43, v44, v45, v46, 0);

          -[_HAPAccessoryServerBTLE200 discoveryContext](v35, "discoveryContext");
          v48 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v48, "serviceSignatures");
          v49 = (HAPService *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v4, "service");
          v50 = (void *)objc_claimAutoreleasedReturnValue();
          -[HAPService setObject:forKey:](v49, "setObject:forKey:", v47, v50);

          v11 = v107;
          v10 = (uint64_t)v109;
          v8 = v105;
        }

      }
      else
      {
        v25 = (void *)MEMORY[0x1D17B7244]();
        v26 = self;
        HMFGetOSLogHandle();
        v27 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
        {
          HMFGetLogIdentifier();
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v4, "service");
          v29 = (__CFString *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138544130;
          v118 = v28;
          v119 = 2112;
          v120 = v29;
          v121 = 2112;
          v122 = v4;
          v123 = 2112;
          v124 = v12;
          _os_log_impl(&dword_1CCE01000, v27, OS_LOG_TYPE_ERROR, "%{public}@Failed to get service/characteristic, %@/%@, instance ID with error: %@", buf, 0x2Au);

        }
        objc_autoreleasePoolPop(v25);
        objc_msgSend(v4, "service");
        v30 = (__CFString *)objc_claimAutoreleasedReturnValue();
        -[_HAPAccessoryServerBTLE200 _handleReadServiceSignature:error:](v26, "_handleReadServiceSignature:error:", v30, v12);
      }

    }
    else
    {
      v18 = (void *)MEMORY[0x1E0CB3940];
      objc_msgSend(v4, "service");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "UUID");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "stringWithFormat:", CFSTR("Failed to convert UUID '%@' to HAP UUID"), v20);
      v12 = (__CFString *)objc_claimAutoreleasedReturnValue();

      v21 = (void *)MEMORY[0x1D17B7244]();
      v22 = self;
      HMFGetOSLogHandle();
      v23 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v118 = v24;
        v119 = 2112;
        v120 = v12;
        _os_log_impl(&dword_1CCE01000, v23, OS_LOG_TYPE_ERROR, "%{public}@%@", buf, 0x16u);

      }
      objc_autoreleasePoolPop(v21);
      objc_msgSend(MEMORY[0x1E0CB35C8], "hapErrorWithCode:description:reason:suggestion:underlyingError:", 3, v12, 0, 0, 0);
      v10 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "service");
      v11 = objc_claimAutoreleasedReturnValue();
      -[_HAPAccessoryServerBTLE200 _handleReadServiceSignature:error:](v22, "_handleReadServiceSignature:error:", v11, v10);
    }

  }
  else
  {
    v14 = (void *)MEMORY[0x1D17B7244]();
    v15 = self;
    HMFGetOSLogHandle();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v118 = v17;
      v119 = 2112;
      v120 = CFSTR("Service Properties Characteristic does not support HAP");
      _os_log_impl(&dword_1CCE01000, v16, OS_LOG_TYPE_ERROR, "%{public}@%@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v14);
    objc_msgSend(MEMORY[0x1E0CB35C8], "hapErrorWithCode:description:reason:suggestion:underlyingError:", 3, CFSTR("Service Properties Characteristic does not support HAP"), 0, 0, 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "service");
    v12 = (__CFString *)objc_claimAutoreleasedReturnValue();
    -[_HAPAccessoryServerBTLE200 _handleReadServiceSignature:error:](v15, "_handleReadServiceSignature:error:", v12, v8);
  }

}

- (void)_handleReadCharacteristicSignature:(id)a3 error:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  id v12[7];

  v11 = a3;
  v6 = a4;
  if (v6)
  {
    if (!-[_HAPAccessoryServerBTLE200 _shouldIgnoreRetryDiscoveryError:](self, "_shouldIgnoreRetryDiscoveryError:", v6))
    {
      v12[0] = (id)MEMORY[0x1E0C809B0];
      v12[1] = (id)3221225472;
      v12[2] = __71___HAPAccessoryServerBTLE200__handleReadCharacteristicSignature_error___block_invoke;
      v12[3] = &unk_1E894E120;
      v12[4] = self;
      v12[5] = v11;
      v12[6] = v6;
      v7 = v6;
      __71___HAPAccessoryServerBTLE200__handleReadCharacteristicSignature_error___block_invoke(v12);
      -[_HAPAccessoryServerBTLE200 _cancelDiscoveryWithError:](self, "_cancelDiscoveryWithError:", v7);

    }
  }
  else
  {
    -[_HAPAccessoryServerBTLE200 discoveryContext](self, "discoveryContext");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "readingSignatureCharacteristics");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "removeObject:", v11);

    -[_HAPAccessoryServerBTLE200 discoveryContext](self, "discoveryContext");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v9) = objc_msgSend(v10, "isComplete");

    if ((_DWORD)v9)
      -[_HAPAccessoryServerBTLE200 _handleCompletedDiscovery](self, "_handleCompletedDiscovery");
  }

}

- (void)_handleReadServiceSignature:(id)a3 error:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  id v12[7];

  v11 = a3;
  v6 = a4;
  if (v6)
  {
    if (!-[_HAPAccessoryServerBTLE200 _shouldIgnoreRetryDiscoveryError:](self, "_shouldIgnoreRetryDiscoveryError:", v6))
    {
      v12[0] = (id)MEMORY[0x1E0C809B0];
      v12[1] = (id)3221225472;
      v12[2] = __64___HAPAccessoryServerBTLE200__handleReadServiceSignature_error___block_invoke;
      v12[3] = &unk_1E894E120;
      v12[4] = self;
      v12[5] = v11;
      v12[6] = v6;
      v7 = v6;
      __64___HAPAccessoryServerBTLE200__handleReadServiceSignature_error___block_invoke(v12);
      -[_HAPAccessoryServerBTLE200 _cancelDiscoveryWithError:](self, "_cancelDiscoveryWithError:", v7);

    }
  }
  else
  {
    -[_HAPAccessoryServerBTLE200 discoveryContext](self, "discoveryContext");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "readingSignatureServices");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "removeObject:", v11);

    -[_HAPAccessoryServerBTLE200 discoveryContext](self, "discoveryContext");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v9) = objc_msgSend(v10, "isComplete");

    if ((_DWORD)v9)
      -[_HAPAccessoryServerBTLE200 _handleCompletedDiscovery](self, "_handleCompletedDiscovery");
  }

}

- (BOOL)isHAPCharacteristic:(id)a3
{
  id v3;
  BOOL v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  char v13;
  void *v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  if ((_isServiceInstanceIDCharacteristic(v3) & 1) != 0)
  {
    v4 = 0;
  }
  else
  {
    objc_msgSend(v3, "descriptors");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v5, "count"))
    {
      v18 = 0u;
      v19 = 0u;
      v16 = 0u;
      v17 = 0u;
      v6 = v5;
      v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
      if (v7)
      {
        v8 = v7;
        v15 = v5;
        v9 = *(_QWORD *)v17;
        while (2)
        {
          for (i = 0; i != v8; ++i)
          {
            if (*(_QWORD *)v17 != v9)
              objc_enumerationMutation(v6);
            objc_msgSend(*(id *)(*((_QWORD *)&v16 + 1) + 8 * i), "UUID");
            v11 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(MEMORY[0x1E0C97778], "UUIDWithString:", CFSTR("DC46F0FE-81D2-4616-B5D9-6ABDD796939A"));
            v12 = (void *)objc_claimAutoreleasedReturnValue();
            v13 = objc_msgSend(v11, "isEqual:", v12);

            if ((v13 & 1) != 0)
            {
              v4 = 1;
              goto LABEL_14;
            }
          }
          v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
          if (v8)
            continue;
          break;
        }
        v4 = 0;
LABEL_14:
        v5 = v15;
      }
      else
      {
        v4 = 0;
      }

    }
    else
    {
      v4 = 1;
    }

  }
  return v4;
}

- (BOOL)shouldVerifyHAPCharacteristic:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  void *v13;
  void *v14;
  char v15;
  void *v16;
  void *v17;
  char v18;
  void *v19;
  void *v20;
  void *v21;
  char v22;
  void *v23;
  void *v24;
  _HAPAccessoryServerBTLE200 *v25;
  void *v26;
  void *v27;
  int v28;
  void *v30;
  void *v31;
  void *v32;

  v4 = a3;
  objc_msgSend(v4, "service");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "UUID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C97778], "UUIDWithString:", CFSTR("FED4"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v6, "isEqual:", v7))
  {

  }
  else
  {
    objc_msgSend(v4, "service");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "UUID");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C97778], "UUIDWithString:", CFSTR("00000055-0000-1000-8000-0026BB765291"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v9, "isEqual:", v10);

    if (!v11)
      goto LABEL_10;
  }
  objc_msgSend(v4, "UUID");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C97778], "UUIDWithString:", CFSTR("0000004C-0000-1000-8000-0026BB765291"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v12, "isEqual:", v13))
  {
    objc_msgSend(v4, "UUID");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C97778], "UUIDWithString:", CFSTR("0000004E-0000-1000-8000-0026BB765291"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v14, "isEqual:", v9) & 1) != 0)
    {

      goto LABEL_7;
    }
    objc_msgSend(v4, "UUID");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C97778], "UUIDWithString:", CFSTR("0000004F-0000-1000-8000-0026BB765291"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v16, "isEqual:", v17);

    if ((v18 & 1) != 0)
      goto LABEL_8;
LABEL_10:
    objc_msgSend(v4, "service");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "UUID");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C97778], "UUIDWithString:", CFSTR("FED3"));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = objc_msgSend(v20, "isEqual:", v21);
    if ((v22 & 1) == 0)
    {
      objc_msgSend(v4, "service");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "UUID");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0C97778], "UUIDWithString:", CFSTR("0000003E-0000-1000-8000-0026BB765291"));
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      if (!objc_msgSend(v24, "isEqual:", v9))
      {
        LOBYTE(v28) = 0;
LABEL_19:

LABEL_20:
        v15 = v28 ^ 1;
        goto LABEL_21;
      }
      v30 = v24;
      v32 = v23;
    }
    v25 = self;
    objc_msgSend(v4, "UUID", v30);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C97778], "UUIDWithString:", CFSTR("00000014-0000-1000-8000-0026BB765291"));
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v26, "isEqual:", v27))
      v28 = !-[HAPAccessoryServerBTLE isPaired](v25, "isPaired");
    else
      LOBYTE(v28) = 0;
    v24 = v31;

    v23 = v32;
    if ((v22 & 1) != 0)
      goto LABEL_20;
    goto LABEL_19;
  }
LABEL_7:

LABEL_8:
  v15 = 0;
LABEL_21:

  return v15;
}

- (BOOL)shouldVerifyHAPService:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  char v9;
  char v10;
  void *v11;
  void *v12;
  int v13;
  void *v14;
  void *v15;

  v4 = a3;
  objc_msgSend(v4, "UUID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C97778], "UUIDWithString:", CFSTR("FED4"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "isEqual:", v6))
  {

LABEL_4:
    v10 = 0;
    goto LABEL_12;
  }
  objc_msgSend(v4, "UUID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C97778], "UUIDWithString:", CFSTR("00000055-0000-1000-8000-0026BB765291"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v7, "isEqual:", v8);

  if ((v9 & 1) != 0)
    goto LABEL_4;
  objc_msgSend(v4, "UUID");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C97778], "UUIDWithString:", CFSTR("FED3"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v11, "isEqual:", v12) & 1) != 0)
  {
    v13 = !-[HAPAccessoryServerBTLE isPaired](self, "isPaired");
  }
  else
  {
    objc_msgSend(v4, "UUID");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C97778], "UUIDWithString:", CFSTR("0000003E-0000-1000-8000-0026BB765291"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v14, "isEqual:", v15))
      v13 = !-[HAPAccessoryServerBTLE isPaired](self, "isPaired");
    else
      LOBYTE(v13) = 0;

  }
  v10 = v13 ^ 1;
LABEL_12:

  return v10;
}

- (id)_parseService:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  __CFString *v14;
  uint64_t v15;
  uint64_t i;
  __CFString *v17;
  void *v18;
  id v19;
  void *v20;
  _HAPAccessoryServerBTLE200 *v21;
  NSObject *v22;
  void *v23;
  void *v24;
  _HAPAccessoryServerBTLE200 *v25;
  NSObject *v26;
  void *v27;
  HAPService *v28;
  void *v29;
  void *v30;
  void *v31;
  _HAPAccessoryServerBTLE200 *v32;
  NSObject *v33;
  const __CFString *v34;
  void *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  char v51;
  void *v52;
  char v53;
  void *v54;
  void *v55;
  void *v56;
  HAPService *v57;
  void *v58;
  void *v59;
  uint64_t v60;
  void *v61;
  void *v62;
  HAPService *v63;
  void *v64;
  _HAPAccessoryServerBTLE200 *v65;
  NSObject *v66;
  __CFString *v67;
  void *v68;
  void *v69;
  _HAPAccessoryServerBTLE200 *v70;
  NSObject *v71;
  void *v73;
  __CFString *v74;
  void *v75;
  _HAPAccessoryServerBTLE200 *v76;
  NSObject *v77;
  void *v78;
  void *v79;
  void *v80;
  __CFString *v81;
  void *v82;
  _HAPAccessoryServerBTLE200 *v83;
  NSObject *v84;
  id *v85;
  void *v86;
  void *v87;
  void *v88;
  __CFString *v89;
  void *v90;
  _HAPAccessoryServerBTLE200 *v91;
  NSObject *v92;
  void *v93;
  void *v94;
  void *v95;
  void *v96;
  void *v97;
  void *v98;
  void *v99;
  _HAPAccessoryServerBTLE200 *v100;
  NSObject *v101;
  void *v102;
  id v104;
  void *v105;
  uint64_t v106;
  id *v107;
  void *v108;
  id v109;
  void *v110;
  _HAPAccessoryServerBTLE200 *v111;
  void *v112;
  __CFString *v113;
  __CFString *v114;
  __int128 v115;
  __int128 v116;
  __int128 v117;
  __int128 v118;
  id v119;
  __int128 v120;
  __int128 v121;
  __int128 v122;
  __int128 v123;
  uint8_t v124[128];
  uint8_t buf[4];
  void *v126;
  __int16 v127;
  const __CFString *v128;
  __int16 v129;
  id v130;
  _BYTE v131[128];
  uint64_t v132;

  v132 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  if ((objc_msgSend((id)objc_opt_class(), "isHAPService:", v6) & 1) == 0)
  {
    v24 = (void *)MEMORY[0x1D17B7244]();
    v25 = self;
    HMFGetOSLogHandle();
    v26 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v126 = v27;
      v127 = 2112;
      v128 = CFSTR("Service does not support HAP");
      _os_log_impl(&dword_1CCE01000, v26, OS_LOG_TYPE_ERROR, "%{public}@%@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v24);
    if (a4)
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "hapErrorWithCode:description:reason:suggestion:underlyingError:", 3, CFSTR("Service does not support HAP"), 0, 0, 0);
      v28 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v28 = 0;
    }
    goto LABEL_78;
  }
  objc_msgSend(v6, "UUID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  +[HAPAccessoryServerBTLE hapUUIDFromBTLEUUID:](HAPAccessoryServerBTLE, "hapUUIDFromBTLEUUID:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v8)
  {
    v29 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(v6, "UUID");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "stringWithFormat:", CFSTR("Failed to convert UUID '%@' to HAP UUID"), v30);
    v14 = (__CFString *)objc_claimAutoreleasedReturnValue();

    v31 = (void *)MEMORY[0x1D17B7244]();
    v32 = self;
    HMFGetOSLogHandle();
    v33 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v34 = v14;
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v126 = v35;
      v127 = 2112;
      v128 = v34;
      _os_log_impl(&dword_1CCE01000, v33, OS_LOG_TYPE_ERROR, "%{public}@%@", buf, 0x16u);

      v14 = (__CFString *)v34;
    }

    objc_autoreleasePoolPop(v31);
    if (a4)
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "hapErrorWithCode:description:reason:suggestion:underlyingError:", 3, v14, 0, 0, 0);
      v28 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v28 = 0;
    }
    goto LABEL_77;
  }
  v108 = v8;
  v9 = (void *)MEMORY[0x1E0C99DE8];
  objc_msgSend(v6, "characteristics");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "arrayWithCapacity:", objc_msgSend(v10, "count"));
  v112 = (void *)objc_claimAutoreleasedReturnValue();

  v122 = 0u;
  v123 = 0u;
  v120 = 0u;
  v121 = 0u;
  v104 = v6;
  objc_msgSend(v6, "characteristics");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v120, v131, 16);
  v111 = self;
  v107 = a4;
  if (!v12)
  {
    v14 = 0;
    goto LABEL_32;
  }
  v13 = v12;
  v14 = 0;
  v15 = *(_QWORD *)v121;
  v109 = v11;
  do
  {
    for (i = 0; i != v13; ++i)
    {
      if (*(_QWORD *)v121 != v15)
        objc_enumerationMutation(v11);
      v17 = *(__CFString **)(*((_QWORD *)&v120 + 1) + 8 * i);
      if (-[_HAPAccessoryServerBTLE200 isHAPCharacteristic:](self, "isHAPCharacteristic:", v17))
      {
        v119 = 0;
        -[_HAPAccessoryServerBTLE200 _parseCharacteristic:error:](self, "_parseCharacteristic:error:", v17, &v119);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = v119;
        if (v18)
        {
          objc_msgSend(v112, "addObject:", v18);
        }
        else
        {
          v113 = v14;
          v20 = (void *)MEMORY[0x1D17B7244]();
          v21 = self;
          HMFGetOSLogHandle();
          v22 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
          {
            HMFGetLogIdentifier();
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543874;
            v126 = v23;
            v127 = 2112;
            v128 = v17;
            v129 = 2112;
            v130 = v19;
            _os_log_impl(&dword_1CCE01000, v22, OS_LOG_TYPE_DEFAULT, "%{public}@Failed to parse characteristic, %@, with error: %@", buf, 0x20u);

            a4 = v107;
          }

          objc_autoreleasePoolPop(v20);
          v14 = v113;
          v11 = v109;
          self = v111;
        }

      }
      else
      {
        if (!_isServiceInstanceIDCharacteristic(v17))
          continue;
        if (v14)
        {
          v64 = (void *)MEMORY[0x1D17B7244]();
          v65 = self;
          HMFGetOSLogHandle();
          v66 = objc_claimAutoreleasedReturnValue();
          v6 = v104;
          if (os_log_type_enabled(v66, OS_LOG_TYPE_ERROR))
          {
            HMFGetLogIdentifier();
            v67 = v14;
            v68 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543618;
            v126 = v68;
            v127 = 2112;
            v128 = CFSTR("Invalid service, multiple Service Instance ID characteristics.");
            _os_log_impl(&dword_1CCE01000, v66, OS_LOG_TYPE_ERROR, "%{public}@%@", buf, 0x16u);

            v14 = v67;
          }

          objc_autoreleasePoolPop(v64);
          if (a4)
          {
            objc_msgSend(MEMORY[0x1E0CB35C8], "hapErrorWithCode:description:reason:suggestion:underlyingError:", 9, CFSTR("Invalid service, multiple Service Instance ID characteristics."), 0, 0, 0);
            v28 = 0;
            *a4 = (id)objc_claimAutoreleasedReturnValue();
          }
          else
          {
            v28 = 0;
          }
          goto LABEL_55;
        }
        _parseServiceInstanceID(v17, a4);
        v14 = (__CFString *)objc_claimAutoreleasedReturnValue();
        if (!v14)
        {
          v69 = (void *)MEMORY[0x1D17B7244]();
          v70 = self;
          HMFGetOSLogHandle();
          v71 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v71, OS_LOG_TYPE_ERROR))
          {
            HMFGetLogIdentifier();
            v73 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543362;
            v126 = v73;
            _os_log_impl(&dword_1CCE01000, v71, OS_LOG_TYPE_ERROR, "%{public}@Failed to parse Service Instance ID", buf, 0xCu);

          }
          objc_autoreleasePoolPop(v69);
          v14 = 0;
          v28 = 0;
          v6 = v104;
LABEL_55:
          v8 = v108;
          goto LABEL_76;
        }
      }
    }
    v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v120, v131, 16);
  }
  while (v13);
LABEL_32:
  v114 = v14;

  v117 = 0u;
  v118 = 0u;
  v115 = 0u;
  v116 = 0u;
  v11 = v112;
  v36 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v115, v124, 16);
  v110 = v11;
  if (!v36)
    goto LABEL_44;
  v37 = v36;
  v38 = *(_QWORD *)v116;
  while (2)
  {
    v39 = 0;
    while (2)
    {
      if (*(_QWORD *)v116 != v38)
        objc_enumerationMutation(v11);
      v40 = *(void **)(*((_QWORD *)&v115 + 1) + 8 * v39);
      -[_HAPAccessoryServerBTLE200 discoveryContext](self, "discoveryContext");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v41, "characteristicSignatures");
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v40, "cbCharacteristic");
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v42, "objectForKey:", v43);
      v44 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v44)
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Missing characteristic signature for characteristic: %@"), v40);
        v74 = (__CFString *)objc_claimAutoreleasedReturnValue();
        v75 = (void *)MEMORY[0x1D17B7244]();
        v76 = v111;
        HMFGetOSLogHandle();
        v77 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v77, OS_LOG_TYPE_ERROR))
        {
          HMFGetLogIdentifier();
          v78 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543618;
          v126 = v78;
          v127 = 2112;
          v128 = v74;
          _os_log_impl(&dword_1CCE01000, v77, OS_LOG_TYPE_ERROR, "%{public}@%@", buf, 0x16u);

        }
        objc_autoreleasePoolPop(v75);
        v8 = v108;
        if (v107)
        {
          objc_msgSend(MEMORY[0x1E0CB35C8], "hapErrorWithCode:description:reason:suggestion:underlyingError:", 9, v74, 0, 0, 0);
          *v107 = (id)objc_claimAutoreleasedReturnValue();
        }

        v28 = 0;
        v6 = v104;
        v14 = v114;
        goto LABEL_76;
      }
      v45 = (void *)MEMORY[0x1E0C97778];
      objc_msgSend(v44, "serviceType");
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v46, "UUIDString");
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v45, "UUIDWithString:", v47);
      v48 = (void *)objc_claimAutoreleasedReturnValue();

      +[HAPAccessoryServerBTLE hapUUIDFromBTLEUUID:](HAPAccessoryServerBTLE, "hapUUIDFromBTLEUUID:", v48);
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v44, "serviceType");
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v50, "isEqual:", v108) & 1) != 0)
      {

        goto LABEL_41;
      }
      v51 = objc_msgSend(v49, "isEqual:", v108);

      if ((v51 & 1) == 0)
      {
        v94 = (void *)MEMORY[0x1E0CB3940];
        objc_msgSend(v44, "serviceType");
        v95 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v95, "UUIDString");
        v96 = (void *)objc_claimAutoreleasedReturnValue();
        v8 = v108;
        objc_msgSend(v108, "UUIDString");
        v97 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v48, "UUIDString");
        v98 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v94, "stringWithFormat:", CFSTR("The authenticated service type, %@, does not match the service type, %@ or %@, for characteristic: %@"), v96, v97, v98, v40);
        v106 = objc_claimAutoreleasedReturnValue();

        v99 = (void *)MEMORY[0x1D17B7244]();
        v100 = v111;
        HMFGetOSLogHandle();
        v101 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v101, OS_LOG_TYPE_ERROR))
        {
          HMFGetLogIdentifier();
          v102 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543618;
          v126 = v102;
          v127 = 2112;
          v128 = (const __CFString *)v106;
          _os_log_impl(&dword_1CCE01000, v101, OS_LOG_TYPE_ERROR, "%{public}@%@", buf, 0x16u);

        }
        objc_autoreleasePoolPop(v99);
        v6 = v104;
        v81 = (__CFString *)v106;
        v85 = v107;
        goto LABEL_73;
      }
LABEL_41:
      objc_msgSend(v44, "serviceInstanceID");
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      v53 = objc_msgSend(v52, "isEqualToNumber:", v114);

      if ((v53 & 1) == 0)
      {
        v79 = (void *)MEMORY[0x1E0CB3940];
        objc_msgSend(v44, "serviceInstanceID");
        v80 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v79, "stringWithFormat:", CFSTR("The authenticated service instance ID, %@, does not match the service instance ID, %@, for characteristic: %@"), v80, v114, v40);
        v81 = (__CFString *)objc_claimAutoreleasedReturnValue();

        v82 = (void *)MEMORY[0x1D17B7244]();
        v83 = v111;
        HMFGetOSLogHandle();
        v84 = objc_claimAutoreleasedReturnValue();
        v85 = v107;
        if (os_log_type_enabled(v84, OS_LOG_TYPE_ERROR))
        {
          HMFGetLogIdentifier();
          v86 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543618;
          v126 = v86;
          v127 = 2112;
          v128 = v81;
          _os_log_impl(&dword_1CCE01000, v84, OS_LOG_TYPE_ERROR, "%{public}@%@", buf, 0x16u);

        }
        objc_autoreleasePoolPop(v82);
        v6 = v104;
        v8 = v108;
LABEL_73:
        v14 = v114;
        if (v85)
        {
          objc_msgSend(MEMORY[0x1E0CB35C8], "hapErrorWithCode:description:reason:suggestion:underlyingError:", 9, v81, 0, 0, 0);
          *v85 = (id)objc_claimAutoreleasedReturnValue();
        }

        v28 = 0;
        v11 = v110;
        goto LABEL_76;
      }

      ++v39;
      v11 = v110;
      self = v111;
      if (v37 != v39)
        continue;
      break;
    }
    v37 = objc_msgSend(v110, "countByEnumeratingWithState:objects:count:", &v115, v124, 16);
    if (v37)
      continue;
    break;
  }
LABEL_44:

  -[_HAPAccessoryServerBTLE200 discoveryContext](self, "discoveryContext");
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v54, "serviceSignatures");
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v104;
  objc_msgSend(v55, "objectForKey:", v104);
  v56 = (void *)objc_claimAutoreleasedReturnValue();

  v57 = [HAPService alloc];
  v8 = v108;
  objc_msgSend(v108, "UUIDString");
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  v59 = (void *)objc_msgSend(v11, "copy");
  v60 = objc_msgSend(v56, "serviceProperties");
  v105 = v56;
  objc_msgSend(v56, "linkedServices");
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  v62 = (void *)objc_msgSend(v61, "copy");
  v28 = -[HAPService initWithType:instanceID:parsedCharacteristics:serviceProperties:linkedServices:](v57, "initWithType:instanceID:parsedCharacteristics:serviceProperties:linkedServices:", v58, v114, v59, v60, v62);

  if (v28)
  {
    -[HAPService setCBService:](v28, "setCBService:", v104);
    v63 = v28;
    v14 = v114;
  }
  else
  {
    v87 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(v108, "UUIDString");
    v88 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v87, "stringWithFormat:", CFSTR("Failed to create service with type, %@, service instance ID, %@, characteristics, %@"), v88, v114, v110);
    v89 = (__CFString *)objc_claimAutoreleasedReturnValue();

    v90 = (void *)MEMORY[0x1D17B7244]();
    v91 = v111;
    HMFGetOSLogHandle();
    v92 = objc_claimAutoreleasedReturnValue();
    v14 = v114;
    if (os_log_type_enabled(v92, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v93 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v126 = v93;
      v127 = 2112;
      v128 = v89;
      _os_log_impl(&dword_1CCE01000, v92, OS_LOG_TYPE_ERROR, "%{public}@%@", buf, 0x16u);

      v14 = v114;
    }

    objc_autoreleasePoolPop(v90);
    if (v107)
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "hapErrorWithCode:description:reason:suggestion:underlyingError:", 3, v89, 0, 0, 0);
      *v107 = (id)objc_claimAutoreleasedReturnValue();
    }

  }
  v11 = v105;
LABEL_76:

LABEL_77:
LABEL_78:

  return v28;
}

- (id)_parseCharacteristic:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  uint64_t v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  void *v16;
  void *v17;
  int v18;
  id v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  char v25;
  HAPCharacteristic *v26;
  void *v27;
  void *v28;
  uint64_t v29;
  void *v30;
  HAPCharacteristic *v31;
  void *v32;
  __CFString *v33;
  void *v34;
  void *v35;
  int v36;
  void *v37;
  _HAPAccessoryServerBTLE200 *v38;
  NSObject *v39;
  void *v40;
  __CFString *v41;
  void *v42;
  _HAPAccessoryServerBTLE200 *v43;
  NSObject *v44;
  void *v45;
  __CFString *v46;
  void *v47;
  void *v48;
  uint64_t v49;
  void *v50;
  _HAPAccessoryServerBTLE200 *v51;
  NSObject *v52;
  void *v53;
  void *v54;
  _HAPAccessoryServerBTLE200 *v55;
  NSObject *v56;
  void *v57;
  void *v58;
  void *v59;
  _HAPAccessoryServerBTLE200 *v60;
  NSObject *v61;
  void *v62;
  void *v63;
  _HAPAccessoryServerBTLE200 *v64;
  NSObject *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  uint64_t v73;
  void *v74;
  void *v75;
  _HAPAccessoryServerBTLE200 *v76;
  NSObject *v77;
  void *v78;
  uint64_t v80;
  void *v81;
  id v82;
  _HAPAccessoryServerBTLE200 *v83;
  void *v84;
  id *v85;
  id obj;
  __int128 v87;
  __int128 v88;
  __int128 v89;
  __int128 v90;
  uint8_t v91[128];
  uint8_t buf[4];
  void *v93;
  __int16 v94;
  const __CFString *v95;
  uint64_t v96;

  v96 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  if (-[_HAPAccessoryServerBTLE200 isHAPCharacteristic:](self, "isHAPCharacteristic:", v6))
  {
    objc_msgSend(v6, "UUID");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    +[HAPAccessoryServerBTLE hapUUIDFromBTLEUUID:](HAPAccessoryServerBTLE, "hapUUIDFromBTLEUUID:", v7);
    v8 = objc_claimAutoreleasedReturnValue();

    v84 = (void *)v8;
    v85 = a4;
    if (v8)
    {
      v83 = self;
      objc_msgSend(v6, "descriptors");
      v87 = 0u;
      v88 = 0u;
      v89 = 0u;
      v90 = 0u;
      v9 = (id)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v87, v91, 16);
      obj = v9;
      if (v10)
      {
        v11 = v10;
        v82 = v6;
        v12 = 0;
        v13 = *(_QWORD *)v88;
        do
        {
          for (i = 0; i != v11; ++i)
          {
            if (*(_QWORD *)v88 != v13)
              objc_enumerationMutation(obj);
            v15 = *(void **)(*((_QWORD *)&v87 + 1) + 8 * i);
            objc_msgSend(v15, "UUID");
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(MEMORY[0x1E0C97778], "UUIDWithString:", CFSTR("DC46F0FE-81D2-4616-B5D9-6ABDD796939A"));
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            v18 = objc_msgSend(v16, "isEqual:", v17);

            if (v18)
            {
              v19 = v15;

              v12 = v19;
            }
          }
          v11 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v87, v91, 16);
        }
        while (v11);

        v6 = v82;
        if (v12)
        {
          _parseCharacteristicInstanceID(v12, a4);
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          if (!v20)
          {
            v59 = (void *)MEMORY[0x1D17B7244]();
            v60 = v83;
            HMFGetOSLogHandle();
            v61 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v61, OS_LOG_TYPE_ERROR))
            {
              HMFGetLogIdentifier();
              v62 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138543362;
              v93 = v62;
              _os_log_impl(&dword_1CCE01000, v61, OS_LOG_TYPE_ERROR, "%{public}@Failed to parse Characteristic Instance ID", buf, 0xCu);

            }
            objc_autoreleasePoolPop(v59);
            v46 = 0;
            v58 = v84;
            goto LABEL_58;
          }
          -[_HAPAccessoryServerBTLE200 discoveryContext](v83, "discoveryContext");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v21, "characteristicSignatures");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v22, "objectForKey:", v82);
          v23 = (void *)objc_claimAutoreleasedReturnValue();

          v81 = v20;
          if (v23)
          {
            objc_msgSend(v23, "characteristicType");
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            v25 = objc_msgSend(v24, "isEqual:", v84);

            if ((v25 & 1) != 0)
            {
              v26 = [HAPCharacteristic alloc];
              objc_msgSend(v84, "UUIDString");
              v27 = (void *)objc_claimAutoreleasedReturnValue();
              -[HAPAccessoryServerBTLE stateNumber](v83, "stateNumber");
              v28 = (void *)objc_claimAutoreleasedReturnValue();
              v29 = objc_msgSend(v23, "characteristicProperties");
              objc_msgSend(v23, "characteristicMetadata");
              v30 = (void *)objc_claimAutoreleasedReturnValue();
              LOBYTE(v80) = 1;
              v31 = -[HAPCharacteristic initWithType:instanceID:value:stateNumber:properties:eventNotificationsEnabled:implicitWriteWithResponse:metadata:](v26, "initWithType:instanceID:value:stateNumber:properties:eventNotificationsEnabled:implicitWriteWithResponse:metadata:", v27, v81, 0, v28, v29, 0, v80, v30);

              if (v31)
              {
                objc_msgSend(MEMORY[0x1E0C99D68], "distantPast");
                v32 = (void *)objc_claimAutoreleasedReturnValue();
                -[HAPCharacteristic setValueUpdatedTime:](v31, "setValueUpdatedTime:", v32);

                -[HAPCharacteristic setCBCharacteristic:](v31, "setCBCharacteristic:", v82);
                -[_HAPAccessoryServerBTLE200 _characteristicForCBCharacteristic:](v83, "_characteristicForCBCharacteristic:", v82);
                v33 = (__CFString *)objc_claimAutoreleasedReturnValue();
                if (-[__CFString isEqualToCharacteristic:](v33, "isEqualToCharacteristic:", v31)
                  && (-[__CFString metadata](v33, "metadata"),
                      v34 = (void *)objc_claimAutoreleasedReturnValue(),
                      -[HAPCharacteristic metadata](v31, "metadata"),
                      v35 = (void *)objc_claimAutoreleasedReturnValue(),
                      v36 = objc_msgSend(v34, "isEqualToCharacteristicMetadata:", v35),
                      v35,
                      v34,
                      v36))
                {
                  v37 = (void *)MEMORY[0x1D17B7244]();
                  v38 = v83;
                  HMFGetOSLogHandle();
                  v39 = objc_claimAutoreleasedReturnValue();
                  if (os_log_type_enabled(v39, OS_LOG_TYPE_DEBUG))
                  {
                    HMFGetLogIdentifier();
                    v40 = (void *)objc_claimAutoreleasedReturnValue();
                    *(_DWORD *)buf = 138543618;
                    v93 = v40;
                    v94 = 2112;
                    v95 = v33;
                    _os_log_impl(&dword_1CCE01000, v39, OS_LOG_TYPE_DEBUG, "%{public}@Using existing characteristic: %@", buf, 0x16u);

                  }
                  objc_autoreleasePoolPop(v37);
                  v41 = v33;
                  v33 = v41;
                }
                else
                {
                  v41 = v31;
                }
                v46 = v41;
              }
              else
              {
                v71 = (void *)MEMORY[0x1E0CB3940];
                objc_msgSend(v84, "UUIDString");
                v72 = (void *)objc_claimAutoreleasedReturnValue();
                v73 = objc_msgSend(v23, "characteristicProperties");
                objc_msgSend(v23, "characteristicMetadata");
                v74 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v71, "stringWithFormat:", CFSTR("Failed to create characteristic with type, %@, characteristic instance ID, %@, properties, %tu, metadata, %@"), v72, v81, v73, v74);
                v33 = (__CFString *)objc_claimAutoreleasedReturnValue();

                v75 = (void *)MEMORY[0x1D17B7244]();
                v76 = v83;
                HMFGetOSLogHandle();
                v77 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v77, OS_LOG_TYPE_ERROR))
                {
                  HMFGetLogIdentifier();
                  v78 = (void *)objc_claimAutoreleasedReturnValue();
                  *(_DWORD *)buf = 138543618;
                  v93 = v78;
                  v94 = 2112;
                  v95 = v33;
                  _os_log_impl(&dword_1CCE01000, v77, OS_LOG_TYPE_ERROR, "%{public}@%@", buf, 0x16u);

                }
                objc_autoreleasePoolPop(v75);
                if (v85)
                {
                  objc_msgSend(MEMORY[0x1E0CB35C8], "hapErrorWithCode:description:reason:suggestion:underlyingError:", 3, v33, 0, 0, 0);
                  v46 = 0;
                  *v85 = (id)objc_claimAutoreleasedReturnValue();
                }
                else
                {
                  v46 = 0;
                }
              }
              v58 = v84;

              goto LABEL_57;
            }
            v66 = (void *)MEMORY[0x1E0CB3940];
            objc_msgSend(v23, "characteristicType");
            v67 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v67, "UUIDString");
            v68 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v84, "UUIDString");
            v69 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v66, "stringWithFormat:", CFSTR("The authenticated characteristic type, %@, does not match the characteristic type, %@"), v68, v69);
            v31 = (HAPCharacteristic *)objc_claimAutoreleasedReturnValue();

            v63 = (void *)MEMORY[0x1D17B7244]();
            v64 = v83;
            HMFGetOSLogHandle();
            v65 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v65, OS_LOG_TYPE_ERROR))
              goto LABEL_44;
          }
          else
          {
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Missing characteristic signature for characteristic: %@"), v82);
            v31 = (HAPCharacteristic *)objc_claimAutoreleasedReturnValue();
            v63 = (void *)MEMORY[0x1D17B7244]();
            v64 = v83;
            HMFGetOSLogHandle();
            v65 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v65, OS_LOG_TYPE_ERROR))
            {
LABEL_44:
              HMFGetLogIdentifier();
              v70 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138543618;
              v93 = v70;
              v94 = 2112;
              v95 = (const __CFString *)v31;
              _os_log_impl(&dword_1CCE01000, v65, OS_LOG_TYPE_ERROR, "%{public}@%@", buf, 0x16u);

            }
          }

          objc_autoreleasePoolPop(v63);
          if (v85)
          {
            objc_msgSend(MEMORY[0x1E0CB35C8], "hapErrorWithCode:description:reason:suggestion:underlyingError:", 9, v31, 0, 0, 0);
            v46 = 0;
            *v85 = (id)objc_claimAutoreleasedReturnValue();
          }
          else
          {
            v46 = 0;
          }
          v58 = v84;
LABEL_57:

          v20 = v81;
LABEL_58:

          goto LABEL_59;
        }
      }
      else
      {

      }
      v54 = (void *)MEMORY[0x1D17B7244]();
      v55 = v83;
      HMFGetOSLogHandle();
      v56 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v56, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v57 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v93 = v57;
        v94 = 2112;
        v95 = CFSTR("Characteristic missing characteristic instance ID descriptor");
        _os_log_impl(&dword_1CCE01000, v56, OS_LOG_TYPE_ERROR, "%{public}@%@", buf, 0x16u);

      }
      objc_autoreleasePoolPop(v54);
      if (v85)
      {
        objc_msgSend(MEMORY[0x1E0CB35C8], "hapErrorWithCode:description:reason:suggestion:underlyingError:", 9, CFSTR("Characteristic missing characteristic instance ID descriptor"), 0, 0, 0);
        v46 = 0;
        *v85 = (id)objc_claimAutoreleasedReturnValue();
        goto LABEL_37;
      }
    }
    else
    {
      v47 = (void *)MEMORY[0x1E0CB3940];
      objc_msgSend(v6, "UUID");
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v47, "stringWithFormat:", CFSTR("Failed to convert UUID '%@' to HAP UUID"), v48);
      v49 = objc_claimAutoreleasedReturnValue();

      v50 = (void *)MEMORY[0x1D17B7244]();
      v51 = self;
      HMFGetOSLogHandle();
      v52 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v52, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v53 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v93 = v53;
        v94 = 2112;
        v95 = (const __CFString *)v49;
        _os_log_impl(&dword_1CCE01000, v52, OS_LOG_TYPE_ERROR, "%{public}@%@", buf, 0x16u);

      }
      objc_autoreleasePoolPop(v50);
      obj = (id)v49;
      if (v85)
      {
        objc_msgSend(MEMORY[0x1E0CB35C8], "hapErrorWithCode:description:reason:suggestion:underlyingError:", 3, v49, 0, 0, 0);
        v46 = 0;
        *v85 = (id)objc_claimAutoreleasedReturnValue();
LABEL_37:
        v58 = v84;
LABEL_59:

        goto LABEL_60;
      }
    }
    v46 = 0;
    goto LABEL_37;
  }
  v42 = (void *)MEMORY[0x1D17B7244]();
  v43 = self;
  HMFGetOSLogHandle();
  v44 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v44, OS_LOG_TYPE_ERROR))
  {
    HMFGetLogIdentifier();
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v93 = v45;
    v94 = 2112;
    v95 = CFSTR("Characteristic does not support HAP");
    _os_log_impl(&dword_1CCE01000, v44, OS_LOG_TYPE_ERROR, "%{public}@%@", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v42);
  if (a4)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "hapErrorWithCode:description:reason:suggestion:underlyingError:", 3, CFSTR("Characteristic does not support HAP"), 0, 0, 0);
    v46 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v46 = 0;
  }
LABEL_60:

  return v46;
}

- (void)readCharacteristicValues:(id)a3 timeout:(double)a4 completionQueue:(id)a5 completionHandler:(id)a6
{
  id v11;
  id v12;
  id v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  id v20;
  id v21;
  id v22;
  _QWORD v23[4];
  id v24;
  _HAPAccessoryServerBTLE200 *v25;
  id v26;
  id v27;
  id v28;
  double v29;

  v11 = a3;
  v12 = a5;
  v13 = a6;
  v14 = objc_alloc(MEMORY[0x1E0D28540]);
  v15 = (void *)MEMORY[0x1E0CB3940];
  MEMORY[0x1D17B692C](self, a2);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "stringWithFormat:", CFSTR("%@, %s:%ld"), v16, "/Library/Caches/com.apple.xbs/Sources/HomeKit/Sources/CoreHAP/Servers/_HAPAccessoryServerBTLE200.m", 4233);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = (void *)objc_msgSend(v14, "initWithName:", v17);

  v23[0] = MEMORY[0x1E0C809B0];
  v23[1] = 3221225472;
  v23[2] = __97___HAPAccessoryServerBTLE200_readCharacteristicValues_timeout_completionQueue_completionHandler___block_invoke;
  v23[3] = &unk_1E894AC48;
  v24 = v11;
  v25 = self;
  v27 = v12;
  v28 = v13;
  v29 = a4;
  v26 = v18;
  v19 = v12;
  v20 = v13;
  v21 = v18;
  v22 = v11;
  -[_HAPAccessoryServerBTLE200 evaluateConnectionStateForOperation:block:](self, "evaluateConnectionStateForOperation:block:", 2, v23);

}

- (void)_readCharacteristicValues:(id)a3 queue:(id)a4 completionHandler:(id)a5
{
  id v8;
  void *v9;
  NSObject *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  NSObject *v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  _QWORD block[5];
  id v24;
  id v25;
  id v26;
  _QWORD v27[5];
  id v28;
  NSObject *v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  _BYTE v34[128];
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v22 = a4;
  v21 = a5;
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v8, "count"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = dispatch_group_create();
  v30 = 0u;
  v31 = 0u;
  v32 = 0u;
  v33 = 0u;
  v11 = v8;
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v30, v34, 16);
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
          objc_enumerationMutation(v11);
        v16 = *(void **)(*((_QWORD *)&v30 + 1) + 8 * v15);
        dispatch_group_enter(v10);
        objc_msgSend(v16, "instanceID");

        v27[0] = MEMORY[0x1E0C809B0];
        v27[1] = 3221225472;
        v27[2] = __80___HAPAccessoryServerBTLE200__readCharacteristicValues_queue_completionHandler___block_invoke;
        v27[3] = &unk_1E894D6A8;
        v27[4] = self;
        v28 = v9;
        v29 = v10;
        -[_HAPAccessoryServerBTLE200 _readValueForCharacteristic:options:completionHandler:](self, "_readValueForCharacteristic:options:completionHandler:", v16, 1, v27);

        ++v15;
      }
      while (v13 != v15);
      v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v30, v34, 16);
    }
    while (v13);
  }

  -[HAPAccessoryServer clientQueue](self, "clientQueue");
  v17 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __80___HAPAccessoryServerBTLE200__readCharacteristicValues_queue_completionHandler___block_invoke_322;
  block[3] = &unk_1E894D6D0;
  block[4] = self;
  v24 = v22;
  v25 = v9;
  v26 = v21;
  v18 = v9;
  v19 = v21;
  v20 = v22;
  dispatch_group_notify(v10, v17, block);

}

- (void)_updatePropertiesFromCharacteristic:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a3;
  objc_msgSend(v9, "type");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HAPAccessoryServer primaryAccessory](self, "primaryAccessory");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "isEqualToString:", CFSTR("00000220-0000-1000-8000-0026BB765291")))
  {
    objc_msgSend(v9, "value");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    +[HAPAccessory productDataStringFromData:](HAPAccessory, "productDataStringFromData:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[HAPAccessoryServer setProductData:](self, "setProductData:", v7);

    -[HAPAccessoryServer productData](self, "productData");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setProductData:", v8);

  }
}

- (void)_readValueForCharacteristic:(id)a3 options:(int64_t)a4 completionHandler:(id)a5
{
  id v9;
  id v10;
  void *v11;
  void *v12;
  _HAPAccessoryServerBTLE200 *v13;
  void *v14;
  _HAPAccessoryServerBTLE200 *v15;
  NSObject *v16;
  void *v17;
  id v18;
  void *v19;
  id v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  _HAPAccessoryServerBTLE200 *v27;
  NSObject *v28;
  void *v29;
  _QWORD v30[4];
  id v31;
  id v32;
  id v33;
  id v34;
  id location;
  id v36;
  _BYTE buf[12];
  __int16 v38;
  id v39;
  __int16 v40;
  id v41;
  uint64_t v42;

  v42 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a5;
  objc_msgSend(v9, "service");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "accessory");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "server");
  v13 = (_HAPAccessoryServerBTLE200 *)objc_claimAutoreleasedReturnValue();

  if (v13 == self)
  {
    v36 = 0;
    objc_msgSend((id)objc_opt_class(), "readRequestForCharacteristic:options:error:", v9, a4, &v36);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = v36;
    if (v19)
    {
      v20 = objc_alloc(MEMORY[0x1E0D28540]);
      v21 = (void *)MEMORY[0x1E0CB3940];
      MEMORY[0x1D17B692C](self, a2);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "stringWithFormat:", CFSTR("%@, %s:%ld"), v22, "/Library/Caches/com.apple.xbs/Sources/HomeKit/Sources/CoreHAP/Servers/_HAPAccessoryServerBTLE200.m", 4371);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = (void *)objc_msgSend(v20, "initWithName:", v23);
      *(_QWORD *)buf = v24;

      objc_initWeak(&location, self);
      v30[0] = MEMORY[0x1E0C809B0];
      v30[1] = 3221225472;
      v30[2] = __84___HAPAccessoryServerBTLE200__readValueForCharacteristic_options_completionHandler___block_invoke;
      v30[3] = &unk_1E894ABF8;
      objc_copyWeak(&v34, &location);
      v31 = v9;
      v32 = v24;
      v33 = v10;
      v25 = (void *)MEMORY[0x1D17B7400](v30);
      -[_HAPAccessoryServerBTLE200 _sendRequest:shouldPrioritize:responseHandler:](self, "_sendRequest:shouldPrioritize:responseHandler:", v19, ((unint64_t)a4 >> 1) & 1, v25);

      objc_destroyWeak(&v34);
      objc_destroyWeak(&location);
      __HMFActivityScopeLeave();

    }
    else
    {
      v26 = (void *)MEMORY[0x1D17B7244]();
      v27 = self;
      HMFGetOSLogHandle();
      v28 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        *(_QWORD *)&buf[4] = v29;
        v38 = 2114;
        v39 = v9;
        v40 = 2114;
        v41 = v18;
        _os_log_impl(&dword_1CCE01000, v28, OS_LOG_TYPE_ERROR, "%{public}@Read failed, failed to create request for characteristic, %{public}@, with error: %{public}@", buf, 0x20u);

      }
      objc_autoreleasePoolPop(v26);
      _callCharacteristicOperationCompletion(v9, v10, 1, v18, CFSTR("Failed to create request."));
    }

  }
  else
  {
    v14 = (void *)MEMORY[0x1D17B7244]();
    v15 = self;
    HMFGetOSLogHandle();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      *(_QWORD *)&buf[4] = v17;
      v38 = 2114;
      v39 = v9;
      _os_log_impl(&dword_1CCE01000, v16, OS_LOG_TYPE_ERROR, "%{public}@Read failed, characteristic is not part of server: %{public}@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v14);
    objc_msgSend(MEMORY[0x1E0CB35C8], "hapErrorWithCode:", 11);
    v18 = (id)objc_claimAutoreleasedReturnValue();
    _callCharacteristicOperationCompletion(v9, v10, 1, v18, CFSTR("Characteristic is not part of server."));
  }

}

- (void)writeCharacteristicValues:(id)a3 timeout:(double)a4 completionQueue:(id)a5 completionHandler:(id)a6
{
  id v11;
  id v12;
  id v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  id v20;
  id v21;
  id v22;
  _QWORD v23[5];
  id v24;
  id v25;
  id v26;
  id v27;
  double v28;

  v11 = a3;
  v12 = a5;
  v13 = a6;
  v14 = objc_alloc(MEMORY[0x1E0D28540]);
  v15 = (void *)MEMORY[0x1E0CB3940];
  MEMORY[0x1D17B692C](self, a2);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "stringWithFormat:", CFSTR("%@, %s:%ld"), v16, "/Library/Caches/com.apple.xbs/Sources/HomeKit/Sources/CoreHAP/Servers/_HAPAccessoryServerBTLE200.m", 4596);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = (void *)objc_msgSend(v14, "initWithName:", v17);

  v23[0] = MEMORY[0x1E0C809B0];
  v23[1] = 3221225472;
  v23[2] = __98___HAPAccessoryServerBTLE200_writeCharacteristicValues_timeout_completionQueue_completionHandler___block_invoke;
  v23[3] = &unk_1E894AC48;
  v28 = a4;
  v23[4] = self;
  v24 = v11;
  v25 = v18;
  v26 = v12;
  v27 = v13;
  v19 = v13;
  v20 = v12;
  v21 = v18;
  v22 = v11;
  -[_HAPAccessoryServerBTLE200 evaluateConnectionStateForOperation:block:](self, "evaluateConnectionStateForOperation:block:", 3, v23);

}

- (void)_writeValue:(id)a3 toCharacteristic:(id)a4 authorizationData:(id)a5 contextData:(id)a6 options:(int64_t)a7 completionHandler:(id)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  void (**v18)(id, id, void *);
  void *v19;
  void *v20;
  _HAPAccessoryServerBTLE200 *v21;
  void *v22;
  _HAPAccessoryServerBTLE200 *v23;
  NSObject *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  _HAPAccessoryServerBTLE200 *v29;
  NSObject *v30;
  void *v31;
  void *v32;
  _HAPAccessoryServerBTLE200 *v33;
  NSObject *v34;
  void *v35;
  int v36;
  void *v37;
  __int16 v38;
  id v39;
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  v14 = a3;
  v15 = a4;
  v16 = a5;
  v17 = a6;
  v18 = (void (**)(id, id, void *))a8;
  objc_msgSend(v15, "service");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "accessory");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "server");
  v21 = (_HAPAccessoryServerBTLE200 *)objc_claimAutoreleasedReturnValue();

  if (v21 == self)
  {
    if ((a7 & 4) != 0 || (objc_msgSend(v15, "properties") & 0x20) != 0)
    {
      v32 = (void *)MEMORY[0x1D17B7244]();
      v33 = self;
      HMFGetOSLogHandle();
      v34 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v34, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        v36 = 138543618;
        v37 = v35;
        v38 = 2114;
        v39 = v15;
        _os_log_impl(&dword_1CCE01000, v34, OS_LOG_TYPE_INFO, "%{public}@Performing timed write for characteristic %{public}@", (uint8_t *)&v36, 0x16u);

      }
      objc_autoreleasePoolPop(v32);
      -[_HAPAccessoryServerBTLE200 _performTimedWriteValue:toCharacteristic:authorizationData:contextData:options:completionHandler:](v33, "_performTimedWriteValue:toCharacteristic:authorizationData:contextData:options:completionHandler:", v14, v15, v16, v17, a7, v18);
    }
    else
    {
      v28 = (void *)MEMORY[0x1D17B7244]();
      v29 = self;
      HMFGetOSLogHandle();
      v30 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v30, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        v36 = 138543618;
        v37 = v31;
        v38 = 2114;
        v39 = v15;
        _os_log_impl(&dword_1CCE01000, v30, OS_LOG_TYPE_INFO, "%{public}@Performing write for characteristic %{public}@", (uint8_t *)&v36, 0x16u);

      }
      objc_autoreleasePoolPop(v28);
      -[_HAPAccessoryServerBTLE200 _performWriteValue:toCharacteristic:authorizationData:contextData:options:completionHandler:](v29, "_performWriteValue:toCharacteristic:authorizationData:contextData:options:completionHandler:", v14, v15, v16, v17, a7, v18);
    }
  }
  else
  {
    v22 = (void *)MEMORY[0x1D17B7244]();
    v23 = self;
    HMFGetOSLogHandle();
    v24 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "shortDescription");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v36 = 138543618;
      v37 = v25;
      v38 = 2114;
      v39 = v26;
      _os_log_impl(&dword_1CCE01000, v24, OS_LOG_TYPE_ERROR, "%{public}@Write failed, characteristic is not part of server: %{public}@", (uint8_t *)&v36, 0x16u);

    }
    objc_autoreleasePoolPop(v22);
    if (v18)
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "hapErrorWithCode:", 10);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v18[2](v18, v15, v27);

    }
  }

}

- (void)_performWriteValue:(id)a3 toCharacteristic:(id)a4 authorizationData:(id)a5 contextData:(id)a6 options:(int64_t)a7 completionHandler:(id)a8
{
  id v15;
  id v16;
  id v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  id v24;
  id v25;
  void *v26;
  void *v27;
  id v28;
  _HAPAccessoryServerBTLE200 *v29;
  NSObject *v30;
  void *v31;
  void *context;
  id v33;
  id v34;
  id v35;
  _QWORD v36[4];
  id v37;
  id v38;
  id v39;
  id v40;
  id v41[2];
  id location;
  id v43;
  uint8_t buf[4];
  void *v45;
  __int16 v46;
  id v47;
  __int16 v48;
  id v49;
  uint64_t v50;

  v50 = *MEMORY[0x1E0C80C00];
  v15 = a3;
  v16 = a4;
  v33 = a5;
  v34 = a6;
  v17 = a8;
  v18 = objc_alloc(MEMORY[0x1E0D28540]);
  v19 = (void *)MEMORY[0x1E0CB3940];
  MEMORY[0x1D17B692C](self, a2);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "stringWithFormat:", CFSTR("%@, %s:%ld"), v20, "/Library/Caches/com.apple.xbs/Sources/HomeKit/Sources/CoreHAP/Servers/_HAPAccessoryServerBTLE200.m", 4727);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = (void *)objc_msgSend(v18, "initWithName:", v21);
  v43 = v22;

  objc_initWeak(&location, self);
  v36[0] = MEMORY[0x1E0C809B0];
  v36[1] = 3221225472;
  v36[2] = __122___HAPAccessoryServerBTLE200__performWriteValue_toCharacteristic_authorizationData_contextData_options_completionHandler___block_invoke;
  v36[3] = &unk_1E894AC70;
  objc_copyWeak(v41, &location);
  v23 = v16;
  v37 = v23;
  v38 = v22;
  v24 = v17;
  v40 = v24;
  v25 = v15;
  v39 = v25;
  v41[1] = (id)a7;
  v26 = (void *)MEMORY[0x1D17B7400](v36);
  v35 = 0;
  objc_msgSend((id)objc_opt_class(), "writeRequestForCharacteristic:value:authorizationData:contextData:options:error:", v23, v25, v33, v34, a7, &v35);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = v35;
  if (v27)
  {
    -[_HAPAccessoryServerBTLE200 _sendRequest:shouldPrioritize:responseHandler:](self, "_sendRequest:shouldPrioritize:responseHandler:", v27, ((unint64_t)a7 >> 4) & 1, v26);
  }
  else
  {
    context = (void *)MEMORY[0x1D17B7244]();
    v29 = self;
    HMFGetOSLogHandle();
    v30 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v45 = v31;
      v46 = 2114;
      v47 = v23;
      v48 = 2114;
      v49 = v28;
      _os_log_impl(&dword_1CCE01000, v30, OS_LOG_TYPE_ERROR, "%{public}@Write failed, failed to create request for characteristic, %{public}@, with error: %{public}@", buf, 0x20u);

    }
    objc_autoreleasePoolPop(context);
    _callCharacteristicOperationCompletion(v23, v24, 2, v28, CFSTR("Failed to create request."));
  }

  objc_destroyWeak(v41);
  objc_destroyWeak(&location);
  __HMFActivityScopeLeave();

}

- (void)_performTimedWriteValue:(id)a3 toCharacteristic:(id)a4 authorizationData:(id)a5 contextData:(id)a6 options:(int64_t)a7 completionHandler:(id)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  void *v22;
  _QWORD v23[5];
  id v24;
  id v25;
  id v26;
  int64_t v27;

  v14 = a3;
  v15 = a4;
  v16 = a8;
  v23[0] = MEMORY[0x1E0C809B0];
  v23[1] = 3221225472;
  v23[2] = __127___HAPAccessoryServerBTLE200__performTimedWriteValue_toCharacteristic_authorizationData_contextData_options_completionHandler___block_invoke;
  v23[3] = &unk_1E894AC98;
  v23[4] = self;
  v24 = v15;
  v25 = v14;
  v26 = v16;
  v27 = a7;
  v17 = v14;
  v18 = v15;
  v19 = v16;
  v20 = a6;
  v21 = a5;
  v22 = (void *)MEMORY[0x1D17B7400](v23);
  -[_HAPAccessoryServerBTLE200 _performTimedWritePrepareWithValue:toCharacteristic:authorizationData:contextData:options:completionHandler:](self, "_performTimedWritePrepareWithValue:toCharacteristic:authorizationData:contextData:options:completionHandler:", v17, v18, v21, v20, a7, v22);

}

- (void)_performTimedWritePrepareWithValue:(id)a3 toCharacteristic:(id)a4 authorizationData:(id)a5 contextData:(id)a6 options:(int64_t)a7 completionHandler:(id)a8
{
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  void *v20;
  id v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  id v26;
  id v27;
  void *v28;
  id v29;
  void *v30;
  _HAPAccessoryServerBTLE200 *v31;
  NSObject *v32;
  void *v33;
  void *v34;
  void *v35;
  id v36;
  _QWORD v37[5];
  id v38;
  id v39;
  id v40;
  id v41;
  _BYTE buf[12];
  __int16 v43;
  id v44;
  __int16 v45;
  id v46;
  uint64_t v47;

  v47 = *MEMORY[0x1E0C80C00];
  v15 = a3;
  v16 = a4;
  v17 = a5;
  v18 = a6;
  v19 = a8;
  v41 = 0;
  v35 = v15;
  objc_msgSend((id)objc_opt_class(), "prepareWriteRequestForCharacteristic:value:authorizationData:contextData:options:error:", v16, v15, v17, v18, a7, &v41);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v36 = v41;
  if (v20)
  {
    v21 = objc_alloc(MEMORY[0x1E0D28540]);
    v22 = (void *)MEMORY[0x1E0CB3940];
    MEMORY[0x1D17B692C](self, a2);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "stringWithFormat:", CFSTR("%@, %s:%ld"), v23, "/Library/Caches/com.apple.xbs/Sources/HomeKit/Sources/CoreHAP/Servers/_HAPAccessoryServerBTLE200.m", 4873);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = (void *)objc_msgSend(v21, "initWithName:", v24);
    *(_QWORD *)buf = v25;

    v37[0] = MEMORY[0x1E0C809B0];
    v37[1] = 3221225472;
    v37[2] = __138___HAPAccessoryServerBTLE200__performTimedWritePrepareWithValue_toCharacteristic_authorizationData_contextData_options_completionHandler___block_invoke;
    v37[3] = &unk_1E894ACC0;
    v37[4] = self;
    v26 = v25;
    v38 = v26;
    v27 = v16;
    v39 = v27;
    v40 = v19;
    v28 = (void *)MEMORY[0x1D17B7400](v37);
    v29 = v26;
    objc_msgSend(v27, "instanceID");

    -[_HAPAccessoryServerBTLE200 _sendRequest:shouldPrioritize:responseHandler:](self, "_sendRequest:shouldPrioritize:responseHandler:", v20, ((unint64_t)a7 >> 4) & 1, v28);
    __HMFActivityScopeLeave();

  }
  else
  {
    v30 = (void *)MEMORY[0x1D17B7244]();
    v31 = self;
    HMFGetOSLogHandle();
    v32 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      *(_QWORD *)&buf[4] = v33;
      v43 = 2114;
      v44 = v16;
      v45 = 2114;
      v46 = v36;
      _os_log_impl(&dword_1CCE01000, v32, OS_LOG_TYPE_ERROR, "%{public}@Timed write prepare failed, failed to create request for characteristic, %{public}@, with error: %{public}@", buf, 0x20u);

    }
    objc_autoreleasePoolPop(v30);
    objc_msgSend(MEMORY[0x1E0CB35C8], "hapErrorWithCode:", 10);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    _callCharacteristicOperationCompletion(v16, v19, 2, v34, CFSTR("Failed to create prepare-write request."));

  }
}

- (void)_performTimedWriteExecuteForCharacteristic:(id)a3 value:(id)a4 options:(int64_t)a5 completionHandler:(id)a6
{
  id v11;
  id v12;
  id v13;
  void *v14;
  id v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  _HAPAccessoryServerBTLE200 *v23;
  NSObject *v24;
  void *v25;
  _QWORD v26[4];
  id v27;
  id v28;
  id v29;
  id v30;
  id v31[2];
  id v32;
  id v33;
  _BYTE location[12];
  __int16 v35;
  id v36;
  __int16 v37;
  id v38;
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  v11 = a3;
  v12 = a4;
  v13 = a6;
  v33 = 0;
  objc_msgSend((id)objc_opt_class(), "executeWriteRequestForCharacteristic:options:error:", v11, a5, &v33);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = v33;
  if (v14)
  {
    objc_initWeak((id *)location, self);
    v16 = objc_alloc(MEMORY[0x1E0D28540]);
    v17 = (void *)MEMORY[0x1E0CB3940];
    MEMORY[0x1D17B692C](self, a2);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "stringWithFormat:", CFSTR("%@, %s:%ld"), v18, "/Library/Caches/com.apple.xbs/Sources/HomeKit/Sources/CoreHAP/Servers/_HAPAccessoryServerBTLE200.m", 4939);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = (void *)objc_msgSend(v16, "initWithName:", v19);
    v32 = v20;

    v26[0] = MEMORY[0x1E0C809B0];
    v26[1] = 3221225472;
    v26[2] = __105___HAPAccessoryServerBTLE200__performTimedWriteExecuteForCharacteristic_value_options_completionHandler___block_invoke;
    v26[3] = &unk_1E894AC70;
    objc_copyWeak(v31, (id *)location);
    v27 = v20;
    v28 = v11;
    v30 = v13;
    v29 = v12;
    v31[1] = (id)a5;
    v21 = (void *)MEMORY[0x1D17B7400](v26);
    -[_HAPAccessoryServerBTLE200 _sendRequest:shouldPrioritize:responseHandler:](self, "_sendRequest:shouldPrioritize:responseHandler:", v14, 1, v21);

    objc_destroyWeak(v31);
    __HMFActivityScopeLeave();

    objc_destroyWeak((id *)location);
  }
  else
  {
    v22 = (void *)MEMORY[0x1D17B7244]();
    v23 = self;
    HMFGetOSLogHandle();
    v24 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)location = 138543874;
      *(_QWORD *)&location[4] = v25;
      v35 = 2114;
      v36 = v11;
      v37 = 2114;
      v38 = v15;
      _os_log_impl(&dword_1CCE01000, v24, OS_LOG_TYPE_ERROR, "%{public}@Timed write execute failed, failed to create request for characteristic, %{public}@, with error: %{public}@", location, 0x20u);

    }
    objc_autoreleasePoolPop(v22);
    _callCharacteristicOperationCompletion(v11, v13, 2, v15, CFSTR("Failed to create execute-write request."));
  }

}

- (void)markNotifyingCharacteristicUpdatedforCharacteristic:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  unsigned __int16 v8;
  void *v9;
  _HAPAccessoryServerBTLE200 *v10;
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
  __int16 v21;
  void *v22;
  __int16 v23;
  id v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if ((objc_msgSend(v4, "properties") & 1) != 0)
  {
    -[HAPAccessoryServerBTLE browser](self, "browser");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[HAPAccessoryServer identifier](self, "identifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "markNotifyingCharacteristicUpdatedForIdentifier:", v6);

    if (!-[HAPAccessoryServerBTLE notifyingCharacteristicUpdated](self, "notifyingCharacteristicUpdated"))
    {
      -[HAPAccessoryServerBTLE setNotifyingCharacteristicUpdated:](self, "setNotifyingCharacteristicUpdated:", 1);
      -[HAPAccessoryServerBTLE stateNumber](self, "stateNumber");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v7, "unsignedShortValue") + 1;

      v9 = (void *)MEMORY[0x1D17B7244]();
      v10 = self;
      HMFGetOSLogHandle();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        -[HAPAccessoryServerBTLE stateNumber](v10, "stateNumber");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedShort:", v8);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = 138544130;
        v18 = v12;
        v19 = 2114;
        v20 = v13;
        v21 = 2114;
        v22 = v14;
        v23 = 2114;
        v24 = v4;
        _os_log_impl(&dword_1CCE01000, v11, OS_LOG_TYPE_INFO, "%{public}@Updating state number %{public}@ -> %{public}@ due to characteristic update: %{public}@", (uint8_t *)&v17, 0x2Au);

      }
      objc_autoreleasePoolPop(v9);
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedShort:", v8);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      -[HAPAccessoryServerBTLE setStateNumber:](v10, "setStateNumber:", v15);

    }
    -[HAPAccessoryServerBTLE stateNumber](self, "stateNumber");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setStateNumber:", v16);

  }
}

- (void)enableEvents:(BOOL)a3 forCharacteristics:(id)a4 withCompletionHandler:(id)a5 queue:(id)a6
{
  _BOOL4 v8;
  id v10;
  id v11;
  id v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  char v22;
  char v23;
  _BOOL4 v24;
  void *v25;
  _HAPAccessoryServerBTLE200 *v26;
  NSObject *v27;
  void *v28;
  id v29;
  const __CFString *v30;
  id v31;
  void *v32;
  void *v33;
  BOOL v34;
  int64_t v35;
  void *v36;
  void *v37;
  void *v38;
  double v39;
  void *v40;
  _HAPAccessoryServerBTLE200 *v41;
  NSObject *v42;
  void *v43;
  const __CFString *v44;
  void *v45;
  void *v46;
  dispatch_time_t v47;
  NSObject *v48;
  id v49;
  id v50;
  void *v51;
  _BOOL4 v52;
  id v53;
  _QWORD block[5];
  id v55;
  id v56;
  id v57;
  BOOL v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  uint8_t v63[128];
  uint8_t buf[4];
  void *v65;
  __int16 v66;
  const __CFString *v67;
  __int16 v68;
  void *v69;
  __int16 v70;
  void *v71;
  uint64_t v72;

  v8 = a3;
  v72 = *MEMORY[0x1E0C80C00];
  v10 = a4;
  v11 = a5;
  v12 = a6;
  if (-[_HAPAccessoryServerBTLE200 isBLELinkConnected](self, "isBLELinkConnected"))
  {
    v53 = v11;
    v52 = v8;
    if (v8)
    {
      v61 = 0u;
      v62 = 0u;
      v59 = 0u;
      v60 = 0u;
      v13 = v10;
      v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v59, v63, 16);
      if (v14)
      {
        v15 = v14;
        v49 = v12;
        v16 = *(_QWORD *)v60;
        while (2)
        {
          for (i = 0; i != v15; ++i)
          {
            if (*(_QWORD *)v60 != v16)
              objc_enumerationMutation(v13);
            v18 = *(void **)(*((_QWORD *)&v59 + 1) + 8 * i);
            +[HAPMetadata getSharedInstance](HAPMetadata, "getSharedInstance");
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v19, "characteristicTypesChangingTargetState");
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v18, "type");
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            v22 = objc_msgSend(v20, "containsObject:", v21);

            if ((v22 & 1) != 0)
            {
              v23 = 1;
              goto LABEL_20;
            }
          }
          v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v59, v63, 16);
          if (v15)
            continue;
          break;
        }
        v23 = 0;
LABEL_20:
        v12 = v49;
      }
      else
      {
        v23 = 0;
      }

      LOBYTE(v8) = v52;
    }
    else
    {
      v23 = 0;
    }
    v34 = -[HAPAccessoryServerBTLE stateChanged](self, "stateChanged");
    v35 = 0;
    if ((v23 & 1) != 0)
    {
      v11 = v53;
    }
    else
    {
      v11 = v53;
      if (!v34)
      {
        objc_msgSend(MEMORY[0x1E0D28678], "sharedPreferences");
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v36, "preferenceForKey:", CFSTR("BTLEAccessoryEnableEventBackoffTime"));
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v37, "numberValue");
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v38, "doubleValue");
        v35 = (uint64_t)(v39 * 1000000000.0);

        v40 = (void *)MEMORY[0x1D17B7244]();
        v41 = self;
        HMFGetOSLogHandle();
        v42 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v42, OS_LOG_TYPE_INFO))
        {
          HMFGetLogIdentifier();
          v43 = (void *)objc_claimAutoreleasedReturnValue();
          if (v52)
            v44 = CFSTR("enable");
          else
            v44 = CFSTR("disable");
          v51 = v40;
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v10, "count"));
          v45 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", -[_HAPAccessoryServerBTLE200 connectionState](v41, "connectionState"));
          v46 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138544130;
          v65 = v43;
          v66 = 2112;
          v67 = v44;
          v11 = v53;
          v68 = 2112;
          v69 = v45;
          v70 = 2112;
          v71 = v46;
          _os_log_impl(&dword_1CCE01000, v42, OS_LOG_TYPE_INFO, "%{public}@Deferring %@ events on %@ characteristics to prioritize local operations. Connection state: %@", buf, 0x2Au);

          v40 = v51;
        }

        objc_autoreleasePoolPop(v40);
        LOBYTE(v8) = v52;
      }
    }
    v47 = dispatch_time(0, v35);
    -[HAPAccessoryServer clientQueue](self, "clientQueue");
    v48 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __90___HAPAccessoryServerBTLE200_enableEvents_forCharacteristics_withCompletionHandler_queue___block_invoke;
    block[3] = &unk_1E894D518;
    block[4] = self;
    v58 = v8;
    v55 = v10;
    v57 = v11;
    v56 = v12;
    dispatch_after(v47, v48, block);

  }
  else
  {
    v24 = v8;
    v25 = (void *)MEMORY[0x1D17B7244]();
    v26 = self;
    HMFGetOSLogHandle();
    v27 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      v29 = v11;
      if (v24)
        v30 = CFSTR("enabling");
      else
        v30 = CFSTR("disabling");
      v50 = v12;
      v31 = v10;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v10, "count"));
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", -[_HAPAccessoryServerBTLE200 connectionState](v26, "connectionState"));
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544130;
      v65 = v28;
      v66 = 2112;
      v67 = v30;
      v11 = v29;
      v68 = 2112;
      v69 = v32;
      v70 = 2112;
      v71 = v33;
      _os_log_impl(&dword_1CCE01000, v27, OS_LOG_TYPE_INFO, "%{public}@Skipping %@ events for %@ characteristics in connection state: %@", buf, 0x2Au);

      v10 = v31;
      v12 = v50;

    }
    objc_autoreleasePoolPop(v25);
  }

}

- (void)_enableEvents:(BOOL)a3 forCharacteristics:(id)a4 withCompletionHandler:(id)a5 queue:(id)a6
{
  BOOL v9;
  void *v10;
  NSObject *v11;
  NSObject *v12;
  void *v13;
  const __CFString *v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  id v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t i;
  void *v20;
  void *v21;
  _HAPAccessoryServerBTLE200 *v22;
  NSObject *v23;
  void *v24;
  void *v25;
  const __CFString *v26;
  NSObject *v27;
  NSObject *v28;
  void *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t j;
  void *v34;
  void *v35;
  NSObject *v36;
  id v37;
  id v38;
  uint64_t v39;
  unsigned int v40;
  uint64_t k;
  void *v42;
  void *v43;
  void *v44;
  _HAPAccessoryServerBTLE200 *v45;
  NSObject *v46;
  id v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  uint64_t v54;
  void *v55;
  void *v56;
  _HAPAccessoryServerBTLE200 *v57;
  NSObject *v58;
  void *v59;
  void *v60;
  NSObject *v61;
  id v62;
  id v63;
  id v64;
  uint64_t v65;
  uint64_t v66;
  NSObject *v67;
  NSObject *group;
  char *obj;
  id obja;
  _HAPAccessoryServerBTLE200 *v71;
  unsigned int v72;
  _QWORD v73[4];
  NSObject *v74;
  id v75;
  _BYTE *v76;
  _QWORD v77[4];
  NSObject *v78;
  id v79;
  __int128 v80;
  __int128 v81;
  __int128 v82;
  __int128 v83;
  _QWORD v84[5];
  id v85;
  NSObject *v86;
  id v87;
  id v88;
  _BYTE *v89;
  char v90;
  _QWORD v91[5];
  id v92;
  NSObject *v93;
  char v94;
  __int128 v95;
  __int128 v96;
  __int128 v97;
  __int128 v98;
  __int128 v99;
  __int128 v100;
  __int128 v101;
  __int128 v102;
  _QWORD block[4];
  id v104;
  id v105;
  NSObject *v106;
  _QWORD v107[2];
  _QWORD v108[2];
  uint8_t v109[4];
  id v110;
  __int16 v111;
  void *v112;
  __int16 v113;
  void *v114;
  __int16 v115;
  void *v116;
  _BYTE v117[128];
  uint8_t v118[128];
  _BYTE buf[24];
  uint64_t (*v120)(uint64_t, uint64_t);
  void (*v121)(uint64_t);
  id v122;
  _BYTE v123[128];
  uint64_t v124;

  v72 = a3;
  v124 = *MEMORY[0x1E0C80C00];
  v62 = a4;
  v63 = a5;
  v67 = a6;
  v9 = -[_HAPAccessoryServerBTLE200 connectionState](self, "connectionState") == 2;
  v10 = (void *)MEMORY[0x1D17B7244]();
  v71 = self;
  HMFGetOSLogHandle();
  v11 = objc_claimAutoreleasedReturnValue();
  v12 = v11;
  if (v9)
  {
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      HMFGetLogIdentifier();
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      if (v72)
        v14 = CFSTR("Enabling");
      else
        v14 = CFSTR("Disabling");
      objc_msgSend(v62, "shortDescription");
      v15 = (uint64_t (*)(uint64_t, uint64_t))objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      *(_QWORD *)&buf[4] = v13;
      *(_WORD *)&buf[12] = 2112;
      *(_QWORD *)&buf[14] = v14;
      *(_WORD *)&buf[22] = 2112;
      v120 = v15;
      _os_log_impl(&dword_1CCE01000, v12, OS_LOG_TYPE_DEFAULT, "%{public}@%@ events for characteristics: %@", buf, 0x20u);

    }
    objc_autoreleasePoolPop(v10);
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v64 = (id)objc_claimAutoreleasedReturnValue();
    v101 = 0u;
    v102 = 0u;
    v99 = 0u;
    v100 = 0u;
    v16 = v62;
    v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v99, v123, 16);
    if (v17)
    {
      obj = 0;
      v18 = *(_QWORD *)v100;
      do
      {
        for (i = 0; i != v17; ++i)
        {
          if (*(_QWORD *)v100 != v18)
            objc_enumerationMutation(v16);
          v20 = *(void **)(*((_QWORD *)&v99 + 1) + 8 * i);
          if (objc_msgSend(v20, "eventNotificationsEnabled") == v72)
          {
            v21 = (void *)MEMORY[0x1D17B7244]();
            v22 = v71;
            HMFGetOSLogHandle();
            v23 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
            {
              HMFGetLogIdentifier();
              v24 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138543618;
              *(_QWORD *)&buf[4] = v24;
              *(_WORD *)&buf[12] = 2112;
              *(_QWORD *)&buf[14] = v20;
              _os_log_impl(&dword_1CCE01000, v23, OS_LOG_TYPE_DEBUG, "%{public}@Events already enabled for %@", buf, 0x16u);

            }
            objc_autoreleasePoolPop(v21);
            ++obj;
          }
          else if ((objc_msgSend(v20, "properties") & 1) != 0)
          {
            objc_msgSend(v64, "addObject:", v20);
          }
        }
        v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v99, v123, 16);
      }
      while (v17);
    }
    else
    {
      obj = 0;
    }

    v28 = dispatch_group_create();
    *(_QWORD *)buf = 0;
    *(_QWORD *)&buf[8] = buf;
    *(_QWORD *)&buf[16] = 0x3032000000;
    v120 = __Block_byref_object_copy__7162;
    v121 = __Block_byref_object_dispose__7163;
    v122 = 0;
    v61 = v28;
    if (objc_msgSend(v64, "count"))
    {
      dispatch_group_enter(v28);
      objc_msgSend(MEMORY[0x1E0C99DE8], "array");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      group = dispatch_group_create();
      v95 = 0u;
      v96 = 0u;
      v97 = 0u;
      v98 = 0u;
      obja = v16;
      v30 = objc_msgSend(obja, "countByEnumeratingWithState:objects:count:", &v95, v118, 16);
      if (v30)
      {
        v31 = *(_QWORD *)v96;
        v32 = MEMORY[0x1E0C809B0];
        do
        {
          for (j = 0; j != v30; ++j)
          {
            if (*(_QWORD *)v96 != v31)
              objc_enumerationMutation(obja);
            v34 = *(void **)(*((_QWORD *)&v95 + 1) + 8 * j);
            dispatch_group_enter(group);
            v91[0] = v32;
            v91[1] = 3221225472;
            v91[2] = __91___HAPAccessoryServerBTLE200__enableEvents_forCharacteristics_withCompletionHandler_queue___block_invoke_431;
            v91[3] = &unk_1E894ACE8;
            v94 = v72;
            v91[4] = v71;
            v92 = v29;
            v93 = group;
            v35 = (void *)MEMORY[0x1D17B7400](v91);
            -[_HAPAccessoryServerBTLE200 _enableEvent:forCharacteristic:withCompletionHandler:queue:](v71, "_enableEvent:forCharacteristic:withCompletionHandler:queue:", v72, v34, v35, v67);
            objc_msgSend(v34, "setEventNotificationsEnabled:", v72);

          }
          v30 = objc_msgSend(obja, "countByEnumeratingWithState:objects:count:", &v95, v118, 16);
        }
        while (v30);
      }

      dispatch_group_leave(v61);
      -[HAPAccessoryServer clientQueue](v71, "clientQueue");
      v36 = objc_claimAutoreleasedReturnValue();
      v84[0] = MEMORY[0x1E0C809B0];
      v84[1] = 3221225472;
      v84[2] = __91___HAPAccessoryServerBTLE200__enableEvents_forCharacteristics_withCompletionHandler_queue___block_invoke_432;
      v84[3] = &unk_1E894AD38;
      v84[4] = v71;
      v85 = v64;
      v86 = v67;
      v89 = buf;
      v90 = v72;
      v87 = v29;
      v88 = v63;
      v37 = v29;
      dispatch_group_notify(v61, v36, v84);

    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v16, "count"));
      group = objc_claimAutoreleasedReturnValue();
      v82 = 0u;
      v83 = 0u;
      v80 = 0u;
      v81 = 0u;
      v38 = v16;
      v39 = objc_msgSend(v38, "countByEnumeratingWithState:objects:count:", &v80, v117, 16);
      v40 = v72;
      if (v39)
      {
        v65 = *(_QWORD *)v81;
        do
        {
          v66 = v39;
          for (k = 0; k != v66; ++k)
          {
            if (*(_QWORD *)v81 != v65)
              objc_enumerationMutation(v38);
            v42 = *(void **)(*((_QWORD *)&v80 + 1) + 8 * k);
            if (objc_msgSend(v42, "eventNotificationsEnabled") == v40)
            {
              v43 = 0;
            }
            else
            {
              objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("HAPErrorDomain"), -6711, 0);
              v43 = (void *)objc_claimAutoreleasedReturnValue();
              v44 = (void *)MEMORY[0x1D17B7244]();
              v45 = v71;
              HMFGetOSLogHandle();
              v46 = (id)objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v46, OS_LOG_TYPE_DEFAULT))
              {
                HMFGetLogIdentifier();
                v47 = (id)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v42, "instanceID");
                v48 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v42, "type");
                v49 = (void *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)v109 = 138544130;
                v110 = v47;
                v111 = 2112;
                v112 = v48;
                v113 = 2112;
                v114 = v49;
                v115 = 2112;
                v116 = v43;
                _os_log_impl(&dword_1CCE01000, v46, OS_LOG_TYPE_DEFAULT, "%{public}@Enable event response for characteristic %@/%@ with error: %@", v109, 0x2Au);

              }
              objc_autoreleasePoolPop(v44);
            }
            +[HAPCharacteristicResponseTuple responseTupleForCharacteristic:error:](HAPCharacteristicResponseTuple, "responseTupleForCharacteristic:error:", v42, v43);
            v50 = (void *)objc_claimAutoreleasedReturnValue();
            if (v50)
              -[NSObject addObject:](group, "addObject:", v50);

            v40 = v72;
          }
          v39 = objc_msgSend(v38, "countByEnumeratingWithState:objects:count:", &v80, v117, 16);
        }
        while (v39);
      }

      if (obj == (char *)objc_msgSend(v38, "count"))
      {
        if (!v63 || !v67)
          goto LABEL_40;
        v77[0] = MEMORY[0x1E0C809B0];
        v77[1] = 3221225472;
        v77[2] = __91___HAPAccessoryServerBTLE200__enableEvents_forCharacteristics_withCompletionHandler_queue___block_invoke_437;
        v77[3] = &unk_1E894D5E0;
        v79 = v63;
        group = group;
        v78 = group;
        dispatch_async(v67, v77);

        v37 = v79;
      }
      else
      {
        v107[0] = *MEMORY[0x1E0CB2D50];
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Failed to enable events for characteristic %@"), v38);
        v51 = (void *)objc_claimAutoreleasedReturnValue();
        v108[0] = v51;
        v107[1] = *MEMORY[0x1E0CB2D68];
        objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
        v52 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v52, "localizedStringForKey:value:table:", CFSTR("No Characteristics support notify property"), &stru_1E894EFE8, 0);
        v53 = (void *)objc_claimAutoreleasedReturnValue();
        v108[1] = v53;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v108, v107, 2);
        v37 = (id)objc_claimAutoreleasedReturnValue();

        objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("HAPErrorDomain"), -6735, v37);
        v54 = objc_claimAutoreleasedReturnValue();
        v55 = *(void **)(*(_QWORD *)&buf[8] + 40);
        *(_QWORD *)(*(_QWORD *)&buf[8] + 40) = v54;

        v56 = (void *)MEMORY[0x1D17B7244]();
        v57 = v71;
        HMFGetOSLogHandle();
        v58 = (id)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v58, OS_LOG_TYPE_ERROR))
        {
          HMFGetLogIdentifier();
          v59 = (void *)objc_claimAutoreleasedReturnValue();
          v60 = *(void **)(*(_QWORD *)&buf[8] + 40);
          *(_DWORD *)v109 = 138543618;
          v110 = v59;
          v111 = 2112;
          v112 = v60;
          _os_log_impl(&dword_1CCE01000, v58, OS_LOG_TYPE_ERROR, "%{public}@Failed to enable events for characteristic with error: %@", v109, 0x16u);

        }
        objc_autoreleasePoolPop(v56);
        if (v63 && v67)
        {
          v73[0] = MEMORY[0x1E0C809B0];
          v73[1] = 3221225472;
          v73[2] = __91___HAPAccessoryServerBTLE200__enableEvents_forCharacteristics_withCompletionHandler_queue___block_invoke_442;
          v73[3] = &unk_1E894D188;
          v75 = v63;
          group = group;
          v74 = group;
          v76 = buf;
          dispatch_async(v67, v73);

        }
      }
    }

LABEL_40:
    _Block_object_dispose(buf, 8);

    v27 = v61;
    goto LABEL_41;
  }
  if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
  {
    HMFGetLogIdentifier();
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    if (v72)
      v26 = CFSTR("enabling");
    else
      v26 = CFSTR("disabling");
    *(_DWORD *)buf = 138543874;
    *(_QWORD *)&buf[4] = v25;
    *(_WORD *)&buf[12] = 2112;
    *(_QWORD *)&buf[14] = v26;
    *(_WORD *)&buf[22] = 2048;
    v120 = -[_HAPAccessoryServerBTLE200 connectionState](v71, "connectionState");
    _os_log_impl(&dword_1CCE01000, v12, OS_LOG_TYPE_ERROR, "%{public}@Rejecting %@ events on server that is not connected, current state: %tu", buf, 0x20u);

  }
  objc_autoreleasePoolPop(v10);
  objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("HAPErrorDomain"), 2, 0);
  v64 = (id)objc_claimAutoreleasedReturnValue();
  if (v63 && v67)
  {
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __91___HAPAccessoryServerBTLE200__enableEvents_forCharacteristics_withCompletionHandler_queue___block_invoke;
    block[3] = &unk_1E894D9E8;
    v106 = v63;
    v104 = v62;
    v64 = v64;
    v105 = v64;
    dispatch_async(v67, block);

    v27 = v106;
LABEL_41:

  }
}

- (void)_enableEvent:(BOOL)a3 forCharacteristic:(id)a4 withCompletionHandler:(id)a5 queue:(id)a6
{
  _BOOL8 v8;
  id v10;
  id v11;
  NSObject *v12;
  void *v13;
  void *v14;
  _HAPAccessoryServerBTLE200 *v15;
  NSObject *v16;
  void *v17;
  void *v18;
  _HAPAccessoryServerBTLE200 *v19;
  NSObject *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  _HAPAccessoryServerBTLE200 *v29;
  NSObject *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  _QWORD v36[5];
  NSObject *v37;
  id v38;
  BOOL v39;
  _QWORD block[4];
  id v41;
  id v42;
  id v43;
  _QWORD v44[4];
  id v45;
  id v46;
  id v47;
  _QWORD v48[2];
  _QWORD v49[2];
  uint8_t buf[4];
  void *v51;
  __int16 v52;
  _BYTE v53[18];
  _QWORD v54[2];
  _QWORD v55[5];

  v8 = a3;
  v55[2] = *MEMORY[0x1E0C80C00];
  v10 = a4;
  v11 = a5;
  v12 = a6;
  objc_msgSend(v10, "cbCharacteristic");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (void *)MEMORY[0x1D17B7244]();
  v15 = self;
  HMFGetOSLogHandle();
  v16 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
  {
    HMFGetLogIdentifier();
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    v51 = v17;
    v52 = 1024;
    *(_DWORD *)v53 = v8;
    *(_WORD *)&v53[4] = 2112;
    *(_QWORD *)&v53[6] = v10;
    _os_log_impl(&dword_1CCE01000, v16, OS_LOG_TYPE_DEBUG, "%{public}@Enable Events :%d for Characteristics: %@", buf, 0x1Cu);

  }
  objc_autoreleasePoolPop(v14);
  if (!v13)
  {
    v28 = (void *)MEMORY[0x1D17B7244]();
    v29 = v15;
    HMFGetOSLogHandle();
    v30 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v51 = v31;
      v52 = 2114;
      *(_QWORD *)v53 = v10;
      _os_log_impl(&dword_1CCE01000, v30, OS_LOG_TYPE_ERROR, "%{public}@Error while attempting to enable Events on HAP characteristic %{public}@: it does not have a corresponding BTLE characteristic", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v28);
    v54[0] = *MEMORY[0x1E0CB2D50];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Failed to enable events for characteristic %@"), v10);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v55[0] = v32;
    v54[1] = *MEMORY[0x1E0CB2D68];
    objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "localizedStringForKey:value:table:", CFSTR("Unable to find matching BTLE characteristic"), &stru_1E894EFE8, 0);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    v55[1] = v34;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v55, v54, 2);
    v25 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("HAPErrorDomain"), -6727, v25);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v11 || !v12)
      goto LABEL_16;
    v44[0] = MEMORY[0x1E0C809B0];
    v44[1] = 3221225472;
    v44[2] = __89___HAPAccessoryServerBTLE200__enableEvent_forCharacteristic_withCompletionHandler_queue___block_invoke;
    v44[3] = &unk_1E894D9E8;
    v47 = v11;
    v45 = v10;
    v46 = v26;
    dispatch_async(v12, v44);

    v27 = v47;
    goto LABEL_15;
  }
  if ((objc_msgSend(v13, "properties") & 0x20) != 0)
  {
    v36[0] = MEMORY[0x1E0C809B0];
    v36[1] = 3221225472;
    v36[2] = __89___HAPAccessoryServerBTLE200__enableEvent_forCharacteristic_withCompletionHandler_queue___block_invoke_2;
    v36[3] = &unk_1E894D7E8;
    v39 = v8;
    v36[4] = v15;
    v38 = v11;
    v37 = v12;
    v35 = (void *)MEMORY[0x1D17B7400](v36);
    -[_HAPAccessoryServerBTLE200 _performEnableEvent:toCharacteristic:completionHandler:](v15, "_performEnableEvent:toCharacteristic:completionHandler:", v8, v10, v35);

    goto LABEL_18;
  }
  v18 = (void *)MEMORY[0x1D17B7244]();
  v19 = v15;
  HMFGetOSLogHandle();
  v20 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
  {
    HMFGetLogIdentifier();
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    v51 = v21;
    v52 = 2114;
    *(_QWORD *)v53 = v10;
    *(_WORD *)&v53[8] = 2114;
    *(_QWORD *)&v53[10] = v13;
    _os_log_impl(&dword_1CCE01000, v20, OS_LOG_TYPE_ERROR, "%{public}@Error while attempting to enable Events on HAP characteristic %{public}@: Corresponding BTLE Characteristics %{public}@: does not support it", buf, 0x20u);

  }
  objc_autoreleasePoolPop(v18);
  v48[0] = *MEMORY[0x1E0CB2D50];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Failed to enable events for characteristic %@"), v10);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v49[0] = v22;
  v48[1] = *MEMORY[0x1E0CB2D68];
  objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "localizedStringForKey:value:table:", CFSTR("BTLE characteristic does not support indication"), &stru_1E894EFE8, 0);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v49[1] = v24;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v49, v48, 2);
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("HAPErrorDomain"), -6735, v25);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11 && v12)
  {
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __89___HAPAccessoryServerBTLE200__enableEvent_forCharacteristic_withCompletionHandler_queue___block_invoke_447;
    block[3] = &unk_1E894D9E8;
    v43 = v11;
    v41 = v10;
    v42 = v26;
    dispatch_async(v12, block);

    v27 = v43;
LABEL_15:

  }
LABEL_16:

LABEL_18:
}

- (void)_performEnableEvent:(BOOL)a3 toCharacteristic:(id)a4 completionHandler:(id)a5
{
  _BOOL8 v6;
  id v8;
  id v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  char v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t (*v17)(uint64_t, uint64_t);
  void *v18;
  id v19;
  id v20;

  v6 = a3;
  v8 = a4;
  v9 = a5;
  v15 = MEMORY[0x1E0C809B0];
  v16 = 3221225472;
  v17 = __85___HAPAccessoryServerBTLE200__performEnableEvent_toCharacteristic_completionHandler___block_invoke;
  v18 = &unk_1E894D798;
  v19 = v8;
  v20 = v9;
  v10 = v8;
  v11 = v9;
  -[_HAPAccessoryServerBTLE200 _enableEvent:toCharacteristic:completionHandler:](self, "_enableEvent:toCharacteristic:completionHandler:", v6, v10, &v15);
  -[_HAPAccessoryServerBTLE200 securitySession](self, "securitySession", v15, v16, v17, v18);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v12, "isOpen"))
  {

  }
  else
  {
    -[_HAPAccessoryServerBTLE200 securitySession](self, "securitySession");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "isOpening");

    if ((v14 & 1) == 0)
    {
      -[_HAPAccessoryServerBTLE200 _suspendAllOperations](self, "_suspendAllOperations");
      -[HAPAccessoryServer setMetric_pairVerifyReason:](self, "setMetric_pairVerifyReason:", CFSTR("noSession.event"));
      -[_HAPAccessoryServerBTLE200 _establishSecureSession](self, "_establishSecureSession");
    }
  }

}

- (void)_enableEvent:(BOOL)a3 toCharacteristic:(id)a4 completionHandler:(id)a5
{
  _BOOL8 v6;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  _HAPAccessoryServerBTLE200 *v16;
  NSObject *v17;
  void *v18;
  int v19;
  void *v20;
  __int16 v21;
  id v22;
  uint64_t v23;

  v6 = a3;
  v23 = *MEMORY[0x1E0C80C00];
  v8 = a4;
  v9 = a5;
  objc_msgSend(v8, "cbCharacteristic");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
  {
    -[_HAPAccessoryServerBTLE200 characteristicEnableEventCompletionHandlers](self, "characteristicEnableEventCompletionHandlers");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = (void *)objc_msgSend(v9, "copy");
    v13 = (void *)MEMORY[0x1D17B7400]();
    objc_msgSend(v11, "setObject:forKey:", v13, v8);

    -[HAPAccessoryServerBTLE peripheral](self, "peripheral");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setNotifyValue:forCharacteristic:", v6, v10);
LABEL_7:

    goto LABEL_8;
  }
  v15 = (void *)MEMORY[0x1D17B7244]();
  v16 = self;
  HMFGetOSLogHandle();
  v17 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
  {
    HMFGetLogIdentifier();
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = 138543618;
    v20 = v18;
    v21 = 2112;
    v22 = v8;
    _os_log_impl(&dword_1CCE01000, v17, OS_LOG_TYPE_ERROR, "%{public}@Missing mapped characteristic for characteristic: %@", (uint8_t *)&v19, 0x16u);

  }
  objc_autoreleasePoolPop(v15);
  if (v9)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "hapErrorWithCode:description:reason:suggestion:underlyingError:", 1, CFSTR("Missing mapped characteristic"), 0, 0, 0);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, void *))v9 + 2))(v9, v14);
    goto LABEL_7;
  }
LABEL_8:

}

- (void)_handleHAPNotificationStateUpdateForCharacteristic:(id)a3 error:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void (**v9)(_QWORD, _QWORD);
  void *v10;
  void *v11;
  _HAPAccessoryServerBTLE200 *v12;
  NSObject *v13;
  void *v14;
  int v15;
  void *v16;
  __int16 v17;
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  -[_HAPAccessoryServerBTLE200 characteristicEnableEventCompletionHandlers](self, "characteristicEnableEventCompletionHandlers");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKey:", v6);
  v9 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    -[_HAPAccessoryServerBTLE200 characteristicEnableEventCompletionHandlers](self, "characteristicEnableEventCompletionHandlers");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "removeObjectForKey:", v6);

    -[_HAPAccessoryServerBTLE200 _kickConnectionIdleTimer](self, "_kickConnectionIdleTimer");
    ((void (**)(_QWORD, id))v9)[2](v9, v7);
  }
  else
  {
    v11 = (void *)MEMORY[0x1D17B7244]();
    v12 = self;
    HMFGetOSLogHandle();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = 138543618;
      v16 = v14;
      v17 = 2112;
      v18 = v6;
      _os_log_impl(&dword_1CCE01000, v13, OS_LOG_TYPE_INFO, "%{public}@Received unexpected notification updated completion from characteristic, %@, dropping", (uint8_t *)&v15, 0x16u);

    }
    objc_autoreleasePoolPop(v11);
  }

}

- (void)_handleEventIndicationForCharacteristic:(id)a3
{
  id v4;
  void *v5;
  _HAPAccessoryServerBTLE200 *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  _QWORD v11[5];
  uint8_t buf[4];
  void *v13;
  __int16 v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if ((objc_msgSend(v4, "properties") & 1) != 0)
  {
    v5 = (void *)MEMORY[0x1D17B7244]();
    v6 = self;
    HMFGetOSLogHandle();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v13 = v8;
      v14 = 2112;
      v15 = v4;
      _os_log_impl(&dword_1CCE01000, v7, OS_LOG_TYPE_INFO, "%{public}@Reading value on Indication for characteristic %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v5);
    -[_HAPAccessoryServerBTLE200 markNotifyingCharacteristicUpdatedforCharacteristic:](v6, "markNotifyingCharacteristicUpdatedforCharacteristic:", v4);
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObject:", v4);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[HAPAccessoryServer clientQueue](v6, "clientQueue");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __70___HAPAccessoryServerBTLE200__handleEventIndicationForCharacteristic___block_invoke;
    v11[3] = &unk_1E894C998;
    v11[4] = v6;
    -[_HAPAccessoryServerBTLE200 _readCharacteristicValues:queue:completionHandler:](v6, "_readCharacteristicValues:queue:completionHandler:", v9, v10, v11);

  }
}

- (void)_configureBroadcastKeyGeneration:(unsigned __int8)a3 service:(id)a4 withCompletion:(id)a5
{
  int v6;
  id v8;
  id v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  id v16;
  void *v17;
  _HAPAccessoryServerBTLE200 *v18;
  NSObject *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  _QWORD v25[5];
  id v26;
  id v27;
  id v28;
  char v29;
  id location;
  uint8_t buf[4];
  void *v32;
  __int16 v33;
  id v34;
  __int16 v35;
  id v36;
  uint64_t v37;

  v6 = a3;
  v37 = *MEMORY[0x1E0C80C00];
  v8 = a4;
  v9 = a5;
  objc_initWeak(&location, self);
  v25[0] = MEMORY[0x1E0C809B0];
  v25[1] = 3221225472;
  v25[2] = __86___HAPAccessoryServerBTLE200__configureBroadcastKeyGeneration_service_withCompletion___block_invoke;
  v25[3] = &unk_1E894AD60;
  v25[4] = self;
  v29 = v6;
  objc_copyWeak(&v28, &location);
  v10 = v9;
  v27 = v10;
  v11 = v8;
  v26 = v11;
  v12 = (void *)MEMORY[0x1D17B7400](v25);
  v13 = (void *)objc_opt_class();
  v24 = 0;
  if (v6 == 2)
    v14 = 2;
  else
    v14 = 1;
  objc_msgSend(v13, "configurationRequestForService:configRequestType:error:", v11, v14, &v24);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = v24;
  if (v15)
  {
    -[_HAPAccessoryServerBTLE200 _sendRequest:shouldPrioritize:responseHandler:](self, "_sendRequest:shouldPrioritize:responseHandler:", v15, 0, v12);
  }
  else
  {
    v17 = (void *)MEMORY[0x1D17B7244]();
    v18 = self;
    HMFGetOSLogHandle();
    v19 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v32 = v20;
      v33 = 2112;
      v34 = v11;
      v35 = 2112;
      v36 = v16;
      _os_log_impl(&dword_1CCE01000, v19, OS_LOG_TYPE_ERROR, "%{public}@Failed to create configuration request for service, %@, with error: %@", buf, 0x20u);

    }
    objc_autoreleasePoolPop(v17);
    v21 = (void *)MEMORY[0x1E0CB35C8];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Failed to configure service %@."), v11);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "hapErrorWithCode:description:reason:suggestion:underlyingError:", 1, v22, CFSTR("Failed to create request."), 0, v16);
    v23 = (void *)objc_claimAutoreleasedReturnValue();

    (*((void (**)(id, _QWORD, _QWORD, _QWORD, void *, double))v10 + 2))(v10, 0, 0, 0, v23, 0.0);
  }

  objc_destroyWeak(&v28);
  objc_destroyWeak(&location);

}

- (void)configureCharacteristics:(id)a3 queue:(id)a4 withCompletionHandler:(id)a5
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
  -[HAPAccessoryServer clientQueue](self, "clientQueue");
  v11 = objc_claimAutoreleasedReturnValue();
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __83___HAPAccessoryServerBTLE200_configureCharacteristics_queue_withCompletionHandler___block_invoke;
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

- (void)_configureCharacteristics:(id)a3 queue:(id)a4 withCompletionHandler:(id)a5
{
  id v8;
  NSObject *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  char v15;
  void *v16;
  _HAPAccessoryServerBTLE200 *v17;
  NSObject *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  NSObject *v24;
  id v25;
  id v26;
  id v27;
  id v28;
  id v29;
  void *v30;
  id obj;
  _QWORD block[4];
  id v33;
  id v34;
  id v35;
  id v36;
  _QWORD v37[5];
  id v38;
  NSObject *v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  uint8_t buf[4];
  void *v45;
  __int16 v46;
  void *v47;
  _BYTE v48[128];
  uint64_t v49;

  v49 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v29 = a4;
  v28 = a5;
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v8, "count"));
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = dispatch_group_create();
  v40 = 0u;
  v41 = 0u;
  v42 = 0u;
  v43 = 0u;
  obj = v8;
  v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v40, v48, 16);
  if (v10)
  {
    v11 = *(_QWORD *)v41;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v41 != v11)
          objc_enumerationMutation(obj);
        v13 = *(void **)(*((_QWORD *)&v40 + 1) + 8 * i);
        objc_msgSend(v13, "characteristic");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = objc_msgSend(v14, "properties");

        if ((v15 & 8) != 0)
        {
          dispatch_group_enter(v9);
          v21 = objc_msgSend(v13, "broadcastEnable");
          v22 = objc_msgSend(v13, "broadcastInterval");
          objc_msgSend(v13, "characteristic");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          v37[0] = MEMORY[0x1E0C809B0];
          v37[1] = 3221225472;
          v37[2] = __84___HAPAccessoryServerBTLE200__configureCharacteristics_queue_withCompletionHandler___block_invoke;
          v37[3] = &unk_1E894D6A8;
          v37[4] = self;
          v38 = v30;
          v39 = v9;
          -[_HAPAccessoryServerBTLE200 _enableBroadcastEvent:interval:forCharacteristic:completionHandler:](self, "_enableBroadcastEvent:interval:forCharacteristic:completionHandler:", v21, v22, v23, v37);

        }
        else
        {
          v16 = (void *)MEMORY[0x1D17B7244]();
          v17 = self;
          HMFGetOSLogHandle();
          v18 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
          {
            HMFGetLogIdentifier();
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v13, "characteristic");
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543618;
            v45 = v19;
            v46 = 2112;
            v47 = v20;
            _os_log_impl(&dword_1CCE01000, v18, OS_LOG_TYPE_DEBUG, "%{public}@Characteristic %@ does not support broadcast notification", buf, 0x16u);

          }
          objc_autoreleasePoolPop(v16);
        }
      }
      v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v40, v48, 16);
    }
    while (v10);
  }

  objc_initWeak((id *)buf, self);
  -[HAPAccessoryServer clientQueue](self, "clientQueue");
  v24 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __84___HAPAccessoryServerBTLE200__configureCharacteristics_queue_withCompletionHandler___block_invoke_473;
  block[3] = &unk_1E894DC70;
  objc_copyWeak(&v36, (id *)buf);
  v33 = v29;
  v34 = v30;
  v35 = v28;
  v25 = v30;
  v26 = v28;
  v27 = v29;
  dispatch_group_notify(v9, v24, block);

  objc_destroyWeak(&v36);
  objc_destroyWeak((id *)buf);

}

- (void)_enableBroadcastEvent:(BOOL)a3 interval:(unint64_t)a4 forCharacteristic:(id)a5 completionHandler:(id)a6
{
  _BOOL8 v8;
  id v10;
  id v11;
  void *v12;
  void *v13;
  _HAPAccessoryServerBTLE200 *v14;
  void *v15;
  _HAPAccessoryServerBTLE200 *v16;
  NSObject *v17;
  void *v18;
  id v19;
  id v20;
  void *v21;
  void *v22;
  id v23;
  _HAPAccessoryServerBTLE200 *v24;
  NSObject *v25;
  void *v26;
  void *v27;
  void *context;
  id v29;
  _QWORD v30[4];
  id v31;
  id v32;
  id v33;
  id location;
  uint8_t buf[4];
  void *v36;
  __int16 v37;
  id v38;
  __int16 v39;
  id v40;
  uint64_t v41;

  v8 = a3;
  v41 = *MEMORY[0x1E0C80C00];
  v10 = a5;
  v11 = a6;
  objc_msgSend(v10, "service");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "accessory");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "server");
  v14 = (_HAPAccessoryServerBTLE200 *)objc_claimAutoreleasedReturnValue();

  if (v14 == self)
  {
    objc_initWeak(&location, self);
    v30[0] = MEMORY[0x1E0C809B0];
    v30[1] = 3221225472;
    v30[2] = __97___HAPAccessoryServerBTLE200__enableBroadcastEvent_interval_forCharacteristic_completionHandler___block_invoke;
    v30[3] = &unk_1E894AD88;
    objc_copyWeak(&v33, &location);
    v19 = v10;
    v31 = v19;
    v20 = v11;
    v32 = v20;
    v21 = (void *)MEMORY[0x1D17B7400](v30);
    v29 = 0;
    objc_msgSend((id)objc_opt_class(), "configurationRequestForCharacteristic:isBroadcasted:interval:error:", v19, v8, a4, &v29);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = v29;
    if (v22)
    {
      -[_HAPAccessoryServerBTLE200 _sendRequest:shouldPrioritize:responseHandler:](self, "_sendRequest:shouldPrioritize:responseHandler:", v22, 0, v21);
    }
    else
    {
      context = (void *)MEMORY[0x1D17B7244]();
      v24 = self;
      HMFGetOSLogHandle();
      v25 = (id)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        v36 = v26;
        v37 = 2112;
        v38 = v19;
        v39 = 2112;
        v40 = v23;
        _os_log_impl(&dword_1CCE01000, v25, OS_LOG_TYPE_ERROR, "%{public}@Failed to create configuration request for characteristic, %@, with error: %@", buf, 0x20u);

      }
      objc_autoreleasePoolPop(context);
      objc_msgSend(MEMORY[0x1E0CB35C8], "hapErrorWithCode:", 9);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      _callCharacteristicOperationCompletion(v19, v20, 3, v27, CFSTR("Failed to create configuration request."));

    }
    objc_destroyWeak(&v33);
    objc_destroyWeak(&location);
  }
  else
  {
    v15 = (void *)MEMORY[0x1D17B7244]();
    v16 = self;
    HMFGetOSLogHandle();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v36 = v18;
      v37 = 2112;
      v38 = v10;
      _os_log_impl(&dword_1CCE01000, v17, OS_LOG_TYPE_ERROR, "%{public}@Configure characteristic failed, characteristic is not part of server: %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v15);
    _callCharacteristicOperationCompletion(v10, v11, 3, 0, CFSTR("Characteristic is not part of server."));
  }

}

- (void)startPairingWithRequest:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  id v7;
  id v8;
  _QWORD block[5];
  id v10;
  id v11;

  v4 = a3;
  objc_msgSend(MEMORY[0x1E0D28540], "currentActivity");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HAPAccessoryServer clientQueue](self, "clientQueue");
  v6 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __54___HAPAccessoryServerBTLE200_startPairingWithRequest___block_invoke;
  block[3] = &unk_1E894E120;
  block[4] = self;
  v10 = v5;
  v11 = v4;
  v7 = v4;
  v8 = v5;
  dispatch_async(v6, block);

}

- (void)_checkForAuthPrompt:(BOOL)a3
{
  _QWORD v3[5];
  BOOL v4;

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __50___HAPAccessoryServerBTLE200__checkForAuthPrompt___block_invoke;
  v3[3] = &unk_1E894ADD8;
  v3[4] = self;
  v4 = a3;
  -[_HAPAccessoryServerBTLE200 _discoverWithType:completionHandler:](self, "_discoverWithType:completionHandler:", 2, v3);
}

- (void)_getPairingFeaturesWithCompletionHandler:(id)a3
{
  id v4;
  uint64_t v5;
  id v6;
  void (**v7)(_QWORD, _QWORD, _QWORD);
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  _HAPAccessoryServerBTLE200 *v13;
  NSObject *v14;
  void *v15;
  id v16;
  void *v17;
  id v18;
  _QWORD v19[5];
  id v20;
  void (**v21)(_QWORD, _QWORD, _QWORD);
  _QWORD v22[5];
  id v23;
  uint8_t buf[24];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = MEMORY[0x1E0C809B0];
  v22[0] = MEMORY[0x1E0C809B0];
  v22[1] = 3221225472;
  v22[2] = __71___HAPAccessoryServerBTLE200__getPairingFeaturesWithCompletionHandler___block_invoke;
  v22[3] = &unk_1E894AE00;
  v22[4] = self;
  v6 = v4;
  v23 = v6;
  v7 = (void (**)(_QWORD, _QWORD, _QWORD))MEMORY[0x1D17B7400](v22);
  -[_HAPAccessoryServerBTLE200 pairingFeaturesCharacteristic](self, "pairingFeaturesCharacteristic");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v8)
  {
    objc_msgSend(v8, "value");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v10)
    {
      v19[0] = v5;
      v19[1] = 3221225472;
      v19[2] = __71___HAPAccessoryServerBTLE200__getPairingFeaturesWithCompletionHandler___block_invoke_509;
      v19[3] = &unk_1E894D7C0;
      v19[4] = self;
      v21 = v7;
      v16 = v9;
      v20 = v16;
      v17 = (void *)MEMORY[0x1D17B7400](v19);
      -[_HAPAccessoryServerBTLE200 _readValueForCharacteristic:options:completionHandler:](self, "_readValueForCharacteristic:options:completionHandler:", v16, 2, v17);

      goto LABEL_9;
    }
    *(_QWORD *)buf = 0;
    v18 = 0;
    -[_HAPAccessoryServerBTLE200 _parsePairingFeaturesCharacteristic:authMethod:error:](self, "_parsePairingFeaturesCharacteristic:authMethod:error:", v9, buf, &v18);
    v11 = v18;
    ((void (**)(_QWORD, _QWORD, id))v7)[2](v7, *(_QWORD *)buf, v11);
  }
  else
  {
    v12 = (void *)MEMORY[0x1D17B7244]();
    v13 = self;
    HMFGetOSLogHandle();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      *(_QWORD *)&buf[4] = v15;
      _os_log_impl(&dword_1CCE01000, v14, OS_LOG_TYPE_ERROR, "%{public}@Pairing failed, missing the Pairing Features characteristic", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v12);
    objc_msgSend(MEMORY[0x1E0CB35C8], "hapErrorWithCode:description:reason:suggestion:underlyingError:", 7, CFSTR("Pairing Failed."), CFSTR("Missing Pairing Features characteristic."), 0, 0);
    v11 = (id)objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, _QWORD, id))v7)[2](v7, 0, v11);
  }

LABEL_9:
}

- (BOOL)_parsePairingFeaturesCharacteristic:(id)a3 authMethod:(unint64_t *)a4 error:(id *)a5
{
  id v8;
  void *v9;
  char isKindOfClass;
  int v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  _HAPAccessoryServerBTLE200 *v18;
  NSObject *v19;
  void *v20;
  int v22;
  void *v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  objc_msgSend(v8, "value");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();
  if ((isKindOfClass & 1) != 0)
  {
    -[_HAPAccessoryServerBTLE200 setFeatureFlags:](self, "setFeatureFlags:", objc_msgSend(v9, "unsignedCharValue"));
    v11 = -[_HAPAccessoryServerBTLE200 featureFlags](self, "featureFlags");
    v12 = 2;
    v13 = 4;
    v14 = 5;
    if ((v11 & 0x10) != 0)
      v14 = 6;
    if ((v11 & 8) == 0)
      v13 = v14;
    if ((v11 & 2) == 0)
      v12 = v13;
    if ((v11 & 1) != 0)
      v15 = 1;
    else
      v15 = v12;
    if (v11)
      v16 = v15;
    else
      v16 = 0;
    -[HAPAccessoryServer setAuthMethod:](self, "setAuthMethod:", v16);
    if (-[HAPAccessoryServer authMethod](self, "authMethod") == 6)
      -[HAPAccessoryServer setAuthMethod:](self, "setAuthMethod:", 4);
    if (a4)
      *a4 = -[HAPAccessoryServer authMethod](self, "authMethod");
  }
  else
  {
    v17 = (void *)MEMORY[0x1D17B7244]();
    v18 = self;
    HMFGetOSLogHandle();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = 138543362;
      v23 = v20;
      _os_log_impl(&dword_1CCE01000, v19, OS_LOG_TYPE_ERROR, "%{public}@Pairing failed, the Pairing Features characteristic value is invalid", (uint8_t *)&v22, 0xCu);

    }
    objc_autoreleasePoolPop(v17);
    if (a5)
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "hapErrorWithCode:description:reason:suggestion:underlyingError:", 12, CFSTR("Pairing Failed."), CFSTR("The Pairing Features characteristic value is missing"), 0, 0);
      *a5 = (id)objc_claimAutoreleasedReturnValue();
    }
  }

  return isKindOfClass & 1;
}

- (void)continuePairingAfterAuthPrompt
{
  NSObject *v3;
  _QWORD block[5];

  -[HAPAccessoryServer clientQueue](self, "clientQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __60___HAPAccessoryServerBTLE200_continuePairingAfterAuthPrompt__block_invoke;
  block[3] = &unk_1E894DD08;
  block[4] = self;
  dispatch_async(v3, block);

}

- (BOOL)stopPairingWithError:(id *)a3
{
  NSObject *v4;
  _QWORD block[5];

  -[HAPAccessoryServer clientQueue](self, "clientQueue", a3);
  v4 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __51___HAPAccessoryServerBTLE200_stopPairingWithError___block_invoke;
  block[3] = &unk_1E894DD08;
  block[4] = self;
  dispatch_async(v4, block);

  return 1;
}

- (void)_handlePairSetupSessionExchangeData:(id)a3
{
  id v4;
  uint64_t v5;
  id v6;
  void (**v7)(_QWORD, _QWORD);
  void *v8;
  void *v9;
  _HAPAccessoryServerBTLE200 *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  _QWORD v15[5];
  id v16;
  void (**v17)(_QWORD, _QWORD);
  _QWORD v18[4];
  id v19;
  _HAPAccessoryServerBTLE200 *v20;
  uint8_t buf[4];
  void *v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = MEMORY[0x1E0C809B0];
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __66___HAPAccessoryServerBTLE200__handlePairSetupSessionExchangeData___block_invoke;
  v18[3] = &unk_1E894DB00;
  v6 = v4;
  v19 = v6;
  v20 = self;
  v7 = (void (**)(_QWORD, _QWORD))MEMORY[0x1D17B7400](v18);
  -[_HAPAccessoryServerBTLE200 pairSetupCharacteristic](self, "pairSetupCharacteristic");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    v15[0] = v5;
    v15[1] = 3221225472;
    v15[2] = __66___HAPAccessoryServerBTLE200__handlePairSetupSessionExchangeData___block_invoke_528;
    v15[3] = &unk_1E894D7C0;
    v15[4] = self;
    v17 = v7;
    v16 = v8;
    -[_HAPAccessoryServerBTLE200 _writeValue:toCharacteristic:authorizationData:contextData:options:completionHandler:](self, "_writeValue:toCharacteristic:authorizationData:contextData:options:completionHandler:", v6, v16, 0, 0, 26, v15);

  }
  else
  {
    v9 = (void *)MEMORY[0x1D17B7244]();
    v10 = self;
    HMFGetOSLogHandle();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v22 = v12;
      _os_log_impl(&dword_1CCE01000, v11, OS_LOG_TYPE_ERROR, "%{public}@Pairing failed, missing the Pair Setup characteristic", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v9);
    objc_msgSend(MEMORY[0x1E0CB35C8], "hapErrorWithCode:description:reason:suggestion:underlyingError:", 7, CFSTR("Pairing Failed."), CFSTR("Missing Pair Setup characteristic."), 0, 0);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, void *))v7)[2](v7, v13);
    -[_HAPAccessoryServerBTLE200 pairSetupSession](v10, "pairSetupSession");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "receivedSetupExchangeData:error:", 0, v13);

  }
}

- (void)_handlePairingSetupCodeRequestWithCompletionHandler:(id)a3
{
  void (**v4)(id, _QWORD, void *);
  NSObject *v5;
  void *v6;
  _QWORD *v7;
  void *v8;
  _HAPAccessoryServerBTLE200 *v9;
  NSObject *v10;
  void *v11;
  _QWORD v12[5];
  _QWORD v13[5];
  uint8_t buf[4];
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v4 = (void (**)(id, _QWORD, void *))a3;
  if (-[_HAPAccessoryServerBTLE200 isBadSetupCode](self, "isBadSetupCode")
    && -[_HAPAccessoryServerBTLE200 _delegateRespondsToSelector:](self, "_delegateRespondsToSelector:", sel_accessoryServer_didReceiveBadPasswordThrottleAttemptsWithDelay_))
  {
    -[_HAPAccessoryServerBTLE200 _suspendConnectionIdleTimer](self, "_suspendConnectionIdleTimer");
    -[_HAPAccessoryServerBTLE200 setSetupCodeCompletionHandler:](self, "setSetupCodeCompletionHandler:", v4);
    -[HAPAccessoryServer delegateQueue](self, "delegateQueue");
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = v5;
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __82___HAPAccessoryServerBTLE200__handlePairingSetupCodeRequestWithCompletionHandler___block_invoke;
    v13[3] = &unk_1E894DD08;
    v13[4] = self;
    v7 = v13;
LABEL_6:
    dispatch_async(v5, v7);
    goto LABEL_10;
  }
  if (-[_HAPAccessoryServerBTLE200 _delegateRespondsToSelector:](self, "_delegateRespondsToSelector:", sel_accessoryServer_promptUserForPasswordWithType_))
  {
    -[_HAPAccessoryServerBTLE200 _suspendConnectionIdleTimer](self, "_suspendConnectionIdleTimer");
    -[_HAPAccessoryServerBTLE200 setSetupCodeCompletionHandler:](self, "setSetupCodeCompletionHandler:", v4);
    -[HAPAccessoryServer delegateQueue](self, "delegateQueue");
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = v5;
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __82___HAPAccessoryServerBTLE200__handlePairingSetupCodeRequestWithCompletionHandler___block_invoke_2;
    v12[3] = &unk_1E894DD08;
    v12[4] = self;
    v7 = v12;
    goto LABEL_6;
  }
  v8 = (void *)MEMORY[0x1D17B7244]();
  v9 = self;
  HMFGetOSLogHandle();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
  {
    HMFGetLogIdentifier();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v15 = v11;
    _os_log_impl(&dword_1CCE01000, v10, OS_LOG_TYPE_ERROR, "%{public}@The delegate does not support prompting the user for a passcode", buf, 0xCu);

  }
  objc_autoreleasePoolPop(v8);
  objc_msgSend(MEMORY[0x1E0CB35C8], "hapErrorWithCode:description:reason:suggestion:underlyingError:", 9, CFSTR("Pairing Failed."), CFSTR("The delegate is missing."), 0, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v4[2](v4, 0, v6);
  -[_HAPAccessoryServerBTLE200 setSetupCodeCompletionHandler:](v9, "setSetupCodeCompletionHandler:", 0);
LABEL_10:

}

- (BOOL)tryPairingPassword:(id)a3 onboardingSetupPayloadString:(id)a4 error:(id *)a5
{
  id v6;
  NSObject *v7;
  id v8;
  _QWORD v10[5];
  id v11;

  v6 = a3;
  -[HAPAccessoryServer clientQueue](self, "clientQueue");
  v7 = objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __84___HAPAccessoryServerBTLE200_tryPairingPassword_onboardingSetupPayloadString_error___block_invoke;
  v10[3] = &unk_1E894E0F8;
  v10[4] = self;
  v11 = v6;
  v8 = v6;
  dispatch_async(v7, v10);

  return 0;
}

- (void)_pairingCompletedWithError:(id)a3
{
  id v4;
  void *v5;
  _HAPAccessoryServerBTLE200 *v6;
  NSObject *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  HAPAuthSession *v11;
  void *v12;
  void *v13;
  HAPAuthSession *v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  NSObject *v19;
  id v20;
  _QWORD v21[5];
  id v22;
  _QWORD v23[4];
  id v24;
  _HAPAccessoryServerBTLE200 *v25;
  uint8_t buf[4];
  void *v27;
  __int16 v28;
  id v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = (void *)MEMORY[0x1D17B7244]();
  v6 = self;
  HMFGetOSLogHandle();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v27 = v8;
    v28 = 2112;
    v29 = v4;
    _os_log_impl(&dword_1CCE01000, v7, OS_LOG_TYPE_INFO, "%{public}@Pair Setup completed with error: %@", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v5);
  if (v4)
  {
    -[_HAPAccessoryServerBTLE200 setPairing:](v6, "setPairing:", 0);
    -[_HAPAccessoryServerBTLE200 setPairingDisconnectionError:](v6, "setPairingDisconnectionError:", 0);
    -[_HAPAccessoryServerBTLE200 setBadPairSetupCode:](v6, "setBadPairSetupCode:", 0);
    -[_HAPAccessoryServerBTLE200 setPairSetupBackoffTimeInterval:](v6, "setPairSetupBackoffTimeInterval:", 0.0);
    -[_HAPAccessoryServerBTLE200 setPairSetupSession:](v6, "setPairSetupSession:", 0);
    -[_HAPAccessoryServerBTLE200 _disconnectWithDisconnectionError:completionHandler:](v6, "_disconnectWithDisconnectionError:completionHandler:", v4, 0);
  }
  v9 = -[_HAPAccessoryServerBTLE200 _getPairSetupType](v6, "_getPairSetupType");
  if (v9 == 5)
  {
    if (-[_HAPAccessoryServerBTLE200 _delegateRespondsToSelector:](v6, "_delegateRespondsToSelector:", sel_accessoryServer_validateCert_model_))
    {
      -[_HAPAccessoryServerBTLE200 pairSetupSession](v6, "pairSetupSession");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "getCertificate");
      v18 = (void *)objc_claimAutoreleasedReturnValue();

      -[HAPAccessoryServer delegateQueue](v6, "delegateQueue");
      v19 = objc_claimAutoreleasedReturnValue();
      v21[0] = MEMORY[0x1E0C809B0];
      v21[1] = 3221225472;
      v21[2] = __57___HAPAccessoryServerBTLE200__pairingCompletedWithError___block_invoke_3;
      v21[3] = &unk_1E894E0F8;
      v21[4] = v6;
      v22 = v18;
      v20 = v18;
      dispatch_async(v19, v21);

    }
  }
  else if (v9 == 3)
  {
    -[_HAPAccessoryServerBTLE200 pairSetupSession](v6, "pairSetupSession");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "generateSessionKeys");

    v11 = [HAPAuthSession alloc];
    -[_HAPAccessoryServerBTLE200 protocolInfoServiceSignatureCharacteristics](v6, "protocolInfoServiceSignatureCharacteristics");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "instanceID");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = -[HAPAuthSession initWithRole:instanceId:delegate:](v11, "initWithRole:instanceId:delegate:", 0, v13, v6);
    -[_HAPAccessoryServerBTLE200 setAuthSession:](v6, "setAuthSession:", v14);

    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v23[0] = MEMORY[0x1E0C809B0];
    v23[1] = 3221225472;
    v23[2] = __57___HAPAccessoryServerBTLE200__pairingCompletedWithError___block_invoke;
    v23[3] = &unk_1E894DB00;
    v24 = v15;
    v25 = v6;
    v16 = v15;
    -[_HAPAccessoryServerBTLE200 getAccessoryInfo:](v6, "getAccessoryInfo:", v23);

  }
  else
  {
    -[_HAPAccessoryServerBTLE200 setPairing:](v6, "setPairing:", 0);
    -[_HAPAccessoryServerBTLE200 setBadPairSetupCode:](v6, "setBadPairSetupCode:", 0);
    -[_HAPAccessoryServerBTLE200 setPairSetupBackoffTimeInterval:](v6, "setPairSetupBackoffTimeInterval:", 0.0);
    -[_HAPAccessoryServerBTLE200 setPairSetupSession:](v6, "setPairSetupSession:", 0);
    -[HAPAccessoryServer setPairingRequest:](v6, "setPairingRequest:", 0);
    -[_HAPAccessoryServerBTLE200 _notifyDelegatesPairingStopped:](v6, "_notifyDelegatesPairingStopped:", v4);
  }

}

- (HAPCharacteristic)pairingFeaturesCharacteristic
{
  HAPCharacteristic **p_pairingFeaturesCharacteristic;
  id WeakRetained;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  p_pairingFeaturesCharacteristic = &self->_pairingFeaturesCharacteristic;
  WeakRetained = objc_loadWeakRetained((id *)&self->_pairingFeaturesCharacteristic);

  if (!WeakRetained)
  {
    -[HAPAccessoryServer primaryAccessory](self, "primaryAccessory");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "servicesOfType:", CFSTR("00000055-0000-1000-8000-0026BB765291"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "firstObject");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v7, "characteristicsOfType:", CFSTR("0000004F-0000-1000-8000-0026BB765291"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "firstObject");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_storeWeak((id *)p_pairingFeaturesCharacteristic, v9);

  }
  return (HAPCharacteristic *)objc_loadWeakRetained((id *)p_pairingFeaturesCharacteristic);
}

- (HAPCharacteristic)pairSetupCharacteristic
{
  HAPCharacteristic **p_pairSetupCharacteristic;
  id WeakRetained;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  p_pairSetupCharacteristic = &self->_pairSetupCharacteristic;
  WeakRetained = objc_loadWeakRetained((id *)&self->_pairSetupCharacteristic);

  if (!WeakRetained)
  {
    -[HAPAccessoryServer primaryAccessory](self, "primaryAccessory");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "servicesOfType:", CFSTR("00000055-0000-1000-8000-0026BB765291"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "firstObject");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v7, "characteristicsOfType:", CFSTR("0000004C-0000-1000-8000-0026BB765291"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "firstObject");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_storeWeak((id *)p_pairSetupCharacteristic, v9);

  }
  return (HAPCharacteristic *)objc_loadWeakRetained((id *)p_pairSetupCharacteristic);
}

- (HAPCharacteristic)pairingsCharacteristic
{
  HAPCharacteristic **p_pairingsCharacteristic;
  id WeakRetained;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  p_pairingsCharacteristic = &self->_pairingsCharacteristic;
  WeakRetained = objc_loadWeakRetained((id *)&self->_pairingsCharacteristic);

  if (!WeakRetained)
  {
    -[HAPAccessoryServer primaryAccessory](self, "primaryAccessory");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "servicesOfType:", CFSTR("00000055-0000-1000-8000-0026BB765291"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "firstObject");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v7, "characteristicsOfType:", CFSTR("00000050-0000-1000-8000-0026BB765291"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "firstObject");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_storeWeak((id *)p_pairingsCharacteristic, v9);

  }
  return (HAPCharacteristic *)objc_loadWeakRetained((id *)p_pairingsCharacteristic);
}

- (void)addPairing:(id)a3 completionQueue:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  id v12;
  id v13;
  id v14;
  _QWORD v15[4];
  id v16;
  _HAPAccessoryServerBTLE200 *v17;
  id v18;
  id v19;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  -[HAPAccessoryServer clientQueue](self, "clientQueue");
  v11 = objc_claimAutoreleasedReturnValue();
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __75___HAPAccessoryServerBTLE200_addPairing_completionQueue_completionHandler___block_invoke;
  v15[3] = &unk_1E894D6D0;
  v16 = v8;
  v17 = self;
  v18 = v9;
  v19 = v10;
  v12 = v10;
  v13 = v9;
  v14 = v8;
  dispatch_async(v11, v15);

}

- (void)removePairing:(id)a3 completionQueue:(id)a4 completionHandler:(id)a5
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
  -[HAPAccessoryServer clientQueue](self, "clientQueue");
  v11 = objc_claimAutoreleasedReturnValue();
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __78___HAPAccessoryServerBTLE200_removePairing_completionQueue_completionHandler___block_invoke;
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

- (BOOL)removePairingForCurrentControllerOnQueue:(id)a3 completion:(id)a4
{
  return -[_HAPAccessoryServerBTLE200 removePairingForCurrentControllerOnQueue:completion:serverPairingCompletion:](self, "removePairingForCurrentControllerOnQueue:completion:serverPairingCompletion:", a3, a4, 0);
}

- (BOOL)removePairingForCurrentControllerOnQueue:(id)a3 completion:(id)a4 serverPairingCompletion:(id)a5
{
  NSObject *v8;
  id v9;
  id v10;
  void *v11;
  id v12;
  void *v13;
  _HAPAccessoryServerBTLE200 *v14;
  NSObject *v15;
  NSObject *v16;
  void *v17;
  void *v18;
  void *v19;
  _QWORD v21[4];
  NSObject *v22;
  id v23;
  id v24;
  id v25;
  _QWORD block[4];
  id v27;
  id v28;
  id v29;
  uint8_t buf[4];
  void *v31;
  __int16 v32;
  id v33;
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  v29 = 0;
  -[HAPAccessoryServer getControllerPairingIdentityWithError:](self, "getControllerPairingIdentityWithError:", &v29);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v29;
  v13 = (void *)MEMORY[0x1D17B7244]();
  v14 = self;
  HMFGetOSLogHandle();
  v15 = objc_claimAutoreleasedReturnValue();
  v16 = v15;
  if (v11)
  {
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v31 = v17;
      _os_log_impl(&dword_1CCE01000, v16, OS_LOG_TYPE_INFO, "%{public}@Received request to remove pairing for the current controller", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v13);
    objc_initWeak((id *)buf, v14);
    -[HAPAccessoryServer clientQueue](v14, "clientQueue");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v21[0] = MEMORY[0x1E0C809B0];
    v21[1] = 3221225472;
    v21[2] = __106___HAPAccessoryServerBTLE200_removePairingForCurrentControllerOnQueue_completion_serverPairingCompletion___block_invoke_571;
    v21[3] = &unk_1E894AE28;
    objc_copyWeak(&v25, (id *)buf);
    v22 = v8;
    v23 = v9;
    v24 = v10;
    -[_HAPAccessoryServerBTLE200 removePairing:completionQueue:completionHandler:](v14, "removePairing:completionQueue:completionHandler:", v11, v18, v21);

    -[_HAPAccessoryServerBTLE200 setHasValidCache:](v14, "setHasValidCache:", 0);
    objc_destroyWeak(&v25);
    objc_destroyWeak((id *)buf);
  }
  else
  {
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v31 = v19;
      v32 = 2112;
      v33 = v12;
      _os_log_impl(&dword_1CCE01000, v16, OS_LOG_TYPE_ERROR, "%{public}@Remove current pairing failed, failed to get the current controller with error: %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v13);
    if (v8 && v9)
    {
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __106___HAPAccessoryServerBTLE200_removePairingForCurrentControllerOnQueue_completion_serverPairingCompletion___block_invoke;
      block[3] = &unk_1E894D5E0;
      v28 = v9;
      v27 = v12;
      dispatch_async(v8, block);

    }
  }

  return v11 != 0;
}

- (void)listPairingsWithCompletionQueue:(id)a3 completionHandler:(id)a4
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
  -[HAPAccessoryServer clientQueue](self, "clientQueue");
  v8 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __80___HAPAccessoryServerBTLE200_listPairingsWithCompletionQueue_completionHandler___block_invoke;
  block[3] = &unk_1E894D9E8;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(v8, block);

}

- (void)_sendPairingRequestData:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  _HAPAccessoryServerBTLE200 *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  void (*v17)(uint64_t, void *, void *);
  void *v18;
  id v19;
  id v20;
  id location[4];

  location[3] = *(id *)MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  -[_HAPAccessoryServerBTLE200 pairingsCharacteristic](self, "pairingsCharacteristic");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    objc_initWeak(location, self);
    v15 = MEMORY[0x1E0C809B0];
    v16 = 3221225472;
    v17 = __72___HAPAccessoryServerBTLE200__sendPairingRequestData_completionHandler___block_invoke;
    v18 = &unk_1E894D680;
    objc_copyWeak(&v20, location);
    v19 = v7;
    v9 = (void *)MEMORY[0x1D17B7400](&v15);
    -[_HAPAccessoryServerBTLE200 _writeValue:toCharacteristic:authorizationData:contextData:options:completionHandler:](self, "_writeValue:toCharacteristic:authorizationData:contextData:options:completionHandler:", v6, v8, 0, 0, 7, v9, v15, v16, v17, v18);

    objc_destroyWeak(&v20);
    objc_destroyWeak(location);
  }
  else
  {
    v10 = (void *)MEMORY[0x1D17B7244]();
    v11 = self;
    HMFGetOSLogHandle();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(location[0]) = 138543362;
      *(id *)((char *)location + 4) = v13;
      _os_log_impl(&dword_1CCE01000, v12, OS_LOG_TYPE_ERROR, "%{public}@Pairing operation failed, missing the Pairings characteristic", (uint8_t *)location, 0xCu);

    }
    objc_autoreleasePoolPop(v10);
    if (v7)
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "hapErrorWithCode:description:reason:suggestion:underlyingError:", 12, CFSTR("Pairing operation failed."), CFSTR("Missing Pairings characteristic."), 0, 0);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      (*((void (**)(id, _QWORD, void *))v7 + 2))(v7, 0, v14);

    }
  }

}

- (unint64_t)_getPairSetupType
{
  unint64_t result;

  result = -[HAPAccessoryServer authMethod](self, "authMethod");
  if (result != 1)
  {
    if (-[HAPAccessoryServer authMethod](self, "authMethod") == 2)
    {
      if (-[_HAPAccessoryServerBTLE200 authenticated](self, "authenticated"))
        return 4;
      else
        return 3;
    }
    else if (-[HAPAccessoryServer authMethod](self, "authMethod") == 4)
    {
      return 5;
    }
    else
    {
      return 0;
    }
  }
  return result;
}

- (void)identifyWithCompletion:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;
  id v8;
  id location;

  v4 = a3;
  objc_initWeak(&location, self);
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __53___HAPAccessoryServerBTLE200_identifyWithCompletion___block_invoke;
  v6[3] = &unk_1E894AA60;
  objc_copyWeak(&v8, &location);
  v5 = v4;
  v7 = v5;
  -[_HAPAccessoryServerBTLE200 _discoverWithType:completionHandler:](self, "_discoverWithType:completionHandler:", 1, v6);

  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);

}

- (HAPCharacteristic)identifyCharacteristic
{
  HAPCharacteristic **p_identifyCharacteristic;
  id WeakRetained;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  p_identifyCharacteristic = &self->_identifyCharacteristic;
  WeakRetained = objc_loadWeakRetained((id *)&self->_identifyCharacteristic);

  if (!WeakRetained)
  {
    -[HAPAccessoryServer primaryAccessory](self, "primaryAccessory");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "servicesOfType:", CFSTR("0000003E-0000-1000-8000-0026BB765291"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "firstObject");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v7, "characteristicsOfType:", CFSTR("00000014-0000-1000-8000-0026BB765291"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "firstObject");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_storeWeak((id *)p_identifyCharacteristic, v9);

  }
  return (HAPCharacteristic *)objc_loadWeakRetained((id *)p_identifyCharacteristic);
}

- (id)_pendingRequestForCharacteristic:(id)a3
{
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  void *i;
  void *v9;
  void *v10;
  char v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  -[_HAPAccessoryServerBTLE200 pendingRequests](self, "pendingRequests", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (id)objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v14;
    while (2)
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(_QWORD *)v14 != v7)
          objc_enumerationMutation(v5);
        v9 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * (_QWORD)i);
        objc_msgSend(v9, "characteristic");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = objc_msgSend(v10, "isEqual:", v4);

        if ((v11 & 1) != 0)
        {
          v6 = v9;
          goto LABEL_11;
        }
      }
      v6 = (id)objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      if (v6)
        continue;
      break;
    }
  }
LABEL_11:

  return v6;
}

- (id)_pendingResponseForRequest:(id)a3
{
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  void *i;
  void *v9;
  void *v10;
  char v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  -[_HAPAccessoryServerBTLE200 pendingResponses](self, "pendingResponses", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (id)objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v14;
    while (2)
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(_QWORD *)v14 != v7)
          objc_enumerationMutation(v5);
        v9 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * (_QWORD)i);
        objc_msgSend(v9, "request");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = objc_msgSend(v10, "isEqual:", v4);

        if ((v11 & 1) != 0)
        {
          v6 = v9;
          goto LABEL_11;
        }
      }
      v6 = (id)objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      if (v6)
        continue;
      break;
    }
  }
LABEL_11:

  return v6;
}

- (void)_sendRequest:(id)a3 shouldPrioritize:(BOOL)a4 responseHandler:(id)a5
{
  _BOOL8 v6;
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  id v12;
  id v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  void (*v17)(id *);
  void *v18;
  id v19;
  id v20;
  id v21;
  id v22;
  _QWORD v23[5];
  id v24;
  id v25;
  id v26;
  id from;
  id location;

  v6 = a4;
  v8 = a3;
  v9 = a5;
  v10 = objc_alloc_init(MEMORY[0x1E0D28550]);
  objc_initWeak(&location, self);
  objc_initWeak(&from, v10);
  v11 = MEMORY[0x1E0C809B0];
  v23[0] = MEMORY[0x1E0C809B0];
  v23[1] = 3221225472;
  v23[2] = __76___HAPAccessoryServerBTLE200__sendRequest_shouldPrioritize_responseHandler___block_invoke;
  v23[3] = &unk_1E894AEC8;
  objc_copyWeak(&v25, &from);
  v23[4] = self;
  v12 = v8;
  v24 = v12;
  objc_copyWeak(&v26, &location);
  objc_msgSend(v10, "addExecutionBlock:", v23);
  v15 = v11;
  v16 = 3221225472;
  v17 = __76___HAPAccessoryServerBTLE200__sendRequest_shouldPrioritize_responseHandler___block_invoke_3;
  v18 = &unk_1E894AF40;
  objc_copyWeak(&v21, &location);
  objc_copyWeak(&v22, &from);
  v13 = v12;
  v19 = v13;
  v14 = v9;
  v20 = v14;
  objc_msgSend(v10, "setCompletionBlock:", &v15);
  objc_msgSend(v13, "setOperation:", v10, v15, v16, v17, v18);
  -[_HAPAccessoryServerBTLE200 _enqueueRequest:shouldPrioritize:](self, "_enqueueRequest:shouldPrioritize:", v13, v6);

  objc_destroyWeak(&v22);
  objc_destroyWeak(&v21);
  objc_destroyWeak(&v26);

  objc_destroyWeak(&v25);
  objc_destroyWeak(&from);
  objc_destroyWeak(&location);

}

- (void)_reallySendRequest:(id)a3 completionHandler:(id)a4
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
  -[HAPAccessoryServer clientQueue](self, "clientQueue");
  v8 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __67___HAPAccessoryServerBTLE200__reallySendRequest_completionHandler___block_invoke;
  block[3] = &unk_1E894D9E8;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(v8, block);

}

- (unint64_t)_maximumControlWriteLengthForRequest:(id)a3
{
  id v4;
  void *v5;
  unint64_t v6;
  void *v7;
  unint64_t v8;
  void *v9;
  _HAPAccessoryServerBTLE200 *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  _HAPAccessoryServerBTLE200 *v14;
  NSObject *v15;
  void *v16;
  int v17;
  unint64_t v18;
  void *v19;
  _HAPAccessoryServerBTLE200 *v20;
  NSObject *v21;
  void *v22;
  void *v23;
  _HAPAccessoryServerBTLE200 *v24;
  NSObject *v25;
  void *v26;
  int v28;
  void *v29;
  __int16 v30;
  unint64_t v31;
  __int16 v32;
  int v33;
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[HAPAccessoryServerBTLE peripheral](self, "peripheral");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "maximumWriteValueLengthForType:", 0);

  -[HAPAccessoryServerBTLE peripheral](self, "peripheral");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "maximumWriteValueLengthForType:", 1);

  if (!v6)
  {
    v9 = (void *)MEMORY[0x1D17B7244]();
    v10 = self;
    HMFGetOSLogHandle();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    {
      HMFGetLogIdentifier();
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v28 = 138543362;
      v29 = v12;
      _os_log_impl(&dword_1CCE01000, v11, OS_LOG_TYPE_DEBUG, "%{public}@Overriding the maximum write length to 512", (uint8_t *)&v28, 0xCu);

    }
    objc_autoreleasePoolPop(v9);
    v6 = 512;
    if (!v8)
      goto LABEL_8;
LABEL_7:
    if (v8 != -3)
      goto LABEL_11;
    goto LABEL_8;
  }
  if (v8)
    goto LABEL_7;
LABEL_8:
  v13 = (void *)MEMORY[0x1D17B7244]();
  v14 = self;
  HMFGetOSLogHandle();
  v15 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
  {
    HMFGetLogIdentifier();
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = 138543362;
    v29 = v16;
    _os_log_impl(&dword_1CCE01000, v15, OS_LOG_TYPE_DEBUG, "%{public}@Overriding the peripheral's mtu length to 23", (uint8_t *)&v28, 0xCu);

  }
  objc_autoreleasePoolPop(v13);
  v8 = 23;
LABEL_11:
  v17 = objc_msgSend(v4, "isEncrypted");
  v18 = 17;
  if (!v17)
    v18 = 1;
  if (v8 / v18 >= 4)
  {
    v19 = (void *)MEMORY[0x1D17B7244]();
    v20 = self;
    HMFGetOSLogHandle();
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
    {
      HMFGetLogIdentifier();
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v28 = 138543618;
      v29 = v22;
      v30 = 2048;
      v31 = v8;
      _os_log_impl(&dword_1CCE01000, v21, OS_LOG_TYPE_DEBUG, "%{public}@Electing to write as reduced size payload of length %tu", (uint8_t *)&v28, 0x16u);

    }
    objc_autoreleasePoolPop(v19);
    v6 = v8;
  }
  if (objc_msgSend(v4, "isEncrypted"))
  {
    if (v6 > 0xF)
    {
      v6 -= 16;
    }
    else
    {
      v23 = (void *)MEMORY[0x1D17B7244]();
      v24 = self;
      HMFGetOSLogHandle();
      v25 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        v28 = 138543874;
        v29 = v26;
        v30 = 2048;
        v31 = v6;
        v32 = 1024;
        v33 = 16;
        _os_log_impl(&dword_1CCE01000, v25, OS_LOG_TYPE_ERROR, "%{public}@The maximum write length, %tu, is less than the auth tag length, %d", (uint8_t *)&v28, 0x1Cu);

      }
      objc_autoreleasePoolPop(v23);
      v6 = 0;
    }
  }

  return v6;
}

- (void)_sendControlPacket:(id)a3 forRequest:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  void (**v10)(id, id);
  void *v11;
  uint64_t v12;
  id v13;
  void *v14;
  _HAPAccessoryServerBTLE200 *v15;
  NSObject *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  _HAPAccessoryServerBTLE200 *v20;
  NSObject *v21;
  void *v22;
  void *v23;
  void *v24;
  _HAPAccessoryServerBTLE200 *v25;
  NSObject *v26;
  void *v27;
  id v28;
  uint8_t buf[4];
  void *v30;
  __int16 v31;
  uint64_t v32;
  __int16 v33;
  id v34;
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = (void (**)(id, id))a5;
  objc_msgSend(v8, "serialize");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v9, "isEncrypted"))
  {
    v13 = 0;
    goto LABEL_5;
  }
  v28 = 0;
  -[_HAPAccessoryServerBTLE200 _encryptDataAndGenerateAuthTag:error:](self, "_encryptDataAndGenerateAuthTag:error:", v11, &v28);
  v12 = objc_claimAutoreleasedReturnValue();
  v13 = v28;

  if (v12)
  {
    v11 = (void *)v12;
LABEL_5:
    v14 = (void *)MEMORY[0x1D17B7244]();
    v15 = self;
    HMFGetOSLogHandle();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
    {
      HMFGetLogIdentifier();
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = objc_msgSend(v11, "length");
      *(_DWORD *)buf = 138543874;
      v30 = v17;
      v31 = 2048;
      v32 = v18;
      v33 = 2112;
      v34 = v9;
      _os_log_impl(&dword_1CCE01000, v16, OS_LOG_TYPE_DEBUG, "%{public}@Sending %tu bytes of control payload for request: %@", buf, 0x20u);

    }
    objc_autoreleasePoolPop(v14);
    v19 = (void *)MEMORY[0x1D17B7244]();
    v20 = v15;
    HMFGetOSLogHandle();
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
    {
      HMFGetLogIdentifier();
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v30 = v22;
      v31 = 2112;
      v32 = (uint64_t)v9;
      v33 = 2112;
      v34 = v11;
      _os_log_impl(&dword_1CCE01000, v21, OS_LOG_TYPE_DEBUG, "%{public}@Sending control payload for request, %@, to accessory: %@", buf, 0x20u);

    }
    objc_autoreleasePoolPop(v19);
    objc_msgSend(v9, "characteristic");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    -[_HAPAccessoryServerBTLE200 _sendData:toCharacteristic:completionHandler:](v20, "_sendData:toCharacteristic:completionHandler:", v11, v23, v10);

    goto LABEL_10;
  }
  v24 = (void *)MEMORY[0x1D17B7244]();
  v25 = self;
  HMFGetOSLogHandle();
  v26 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
  {
    HMFGetLogIdentifier();
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v30 = v27;
    v31 = 2112;
    v32 = (uint64_t)v13;
    _os_log_impl(&dword_1CCE01000, v26, OS_LOG_TYPE_ERROR, "%{public}@Failed to encrypt control payload with error: %@", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v24);
  if (v10)
    v10[2](v10, v13);
LABEL_10:

}

- (void)_sendData:(id)a3 toCharacteristic:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  _HAPAccessoryServerBTLE200 *v14;
  NSObject *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  _HAPAccessoryServerBTLE200 *v24;
  NSObject *v25;
  void *v26;
  void *v27;
  int v28;
  void *v29;
  __int16 v30;
  id v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  -[_HAPAccessoryServerBTLE200 characteristicWriteCompletionHandlers](self, "characteristicWriteCompletionHandlers");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "objectForKey:", v9);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v12)
  {
    objc_msgSend(v9, "cbCharacteristic");
    v18 = objc_claimAutoreleasedReturnValue();
    if (v18)
    {
      v17 = (void *)v18;
      -[_HAPAccessoryServerBTLE200 characteristicWriteCompletionHandlers](self, "characteristicWriteCompletionHandlers");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = (void *)objc_msgSend(v10, "copy");
      v21 = (void *)MEMORY[0x1D17B7400]();
      objc_msgSend(v19, "setObject:forKey:", v21, v9);

      -[HAPAccessoryServerBTLE peripheral](self, "peripheral");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "writeValue:forCharacteristic:type:", v8, v17, 0);

      -[_HAPAccessoryServerBTLE200 _kickConnectionIdleTimer](self, "_kickConnectionIdleTimer");
    }
    else
    {
      v23 = (void *)MEMORY[0x1D17B7244]();
      v24 = self;
      HMFGetOSLogHandle();
      v25 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        v28 = 138543618;
        v29 = v26;
        v30 = 2112;
        v31 = v9;
        _os_log_impl(&dword_1CCE01000, v25, OS_LOG_TYPE_ERROR, "%{public}@Missing mapped characteristic for characteristic: %@", (uint8_t *)&v28, 0x16u);

      }
      objc_autoreleasePoolPop(v23);
      if (v10)
      {
        objc_msgSend(MEMORY[0x1E0CB35C8], "hapErrorWithCode:description:reason:suggestion:underlyingError:", 1, CFSTR("Missing mapped characteristic"), 0, 0, 0);
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        (*((void (**)(id, void *))v10 + 2))(v10, v27);

      }
      v17 = 0;
    }
    goto LABEL_13;
  }
  v13 = (void *)MEMORY[0x1D17B7244]();
  v14 = self;
  HMFGetOSLogHandle();
  v15 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
  {
    HMFGetLogIdentifier();
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = 138543618;
    v29 = v16;
    v30 = 2112;
    v31 = v9;
    _os_log_impl(&dword_1CCE01000, v15, OS_LOG_TYPE_ERROR, "%{public}@A write operation for '%@' is already is progress.", (uint8_t *)&v28, 0x16u);

  }
  objc_autoreleasePoolPop(v13);
  if (v10)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "hapErrorWithCode:description:reason:suggestion:underlyingError:", 4, CFSTR("Operation in progress."), CFSTR("A write operation is already in progress."), 0, 0);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, void *))v10 + 2))(v10, v17);
LABEL_13:

  }
}

- (void)_handleWriteCompletionForCharacteristic:(id)a3 error:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void (**v9)(_QWORD, _QWORD);
  void *v10;
  void *v11;
  _HAPAccessoryServerBTLE200 *v12;
  NSObject *v13;
  void *v14;
  int v15;
  void *v16;
  __int16 v17;
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  -[_HAPAccessoryServerBTLE200 characteristicWriteCompletionHandlers](self, "characteristicWriteCompletionHandlers");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKey:", v6);
  v9 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    -[_HAPAccessoryServerBTLE200 characteristicWriteCompletionHandlers](self, "characteristicWriteCompletionHandlers");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "removeObjectForKey:", v6);

    -[_HAPAccessoryServerBTLE200 _kickConnectionIdleTimer](self, "_kickConnectionIdleTimer");
    ((void (**)(_QWORD, id))v9)[2](v9, v7);
  }
  else
  {
    v11 = (void *)MEMORY[0x1D17B7244]();
    v12 = self;
    HMFGetOSLogHandle();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = 138543618;
      v16 = v14;
      v17 = 2112;
      v18 = v6;
      _os_log_impl(&dword_1CCE01000, v13, OS_LOG_TYPE_ERROR, "%{public}@Received unexpected write completion from characteristic, %@, dropping", (uint8_t *)&v15, 0x16u);

    }
    objc_autoreleasePoolPop(v11);
  }

}

- (void)_requestResponseForRequest:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  _HAPAccessoryServerBTLE200 *v10;
  NSObject *v11;
  void *v12;
  int v13;
  void *v14;
  __int16 v15;
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "characteristic");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "cbCharacteristic");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    objc_msgSend(v4, "responseTimer");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "resume");

    -[HAPAccessoryServerBTLE peripheral](self, "peripheral");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "readValueForCharacteristic:", v6);
  }
  else
  {
    v9 = (void *)MEMORY[0x1D17B7244]();
    v10 = self;
    HMFGetOSLogHandle();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = 138543618;
      v14 = v12;
      v15 = 2112;
      v16 = v4;
      _os_log_impl(&dword_1CCE01000, v11, OS_LOG_TYPE_ERROR, "%{public}@Missing mapped characteristic for request: %@", (uint8_t *)&v13, 0x16u);

    }
    objc_autoreleasePoolPop(v9);
    objc_msgSend(MEMORY[0x1E0CB35C8], "hapErrorWithCode:description:reason:suggestion:underlyingError:", 1, CFSTR("Missing mapped characteristic"), 0, 0, 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "cancelWithError:", v8);
  }

}

- (void)_handleResponseData:(id)a3 fromCharacteristic:(id)a4 error:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  _HAPAccessoryServerBTLE200 *v14;
  NSObject *v15;
  void *v16;
  void *v17;
  _HAPAccessoryServerBTLE200 *v18;
  NSObject *v19;
  void *v20;
  void *v21;
  id v22;
  uint64_t v23;
  id v24;
  void *v25;
  _HAPAccessoryServerBTLE200 *v26;
  NSObject *v27;
  void *v28;
  void *v29;
  id v30;
  id v31;
  void *v32;
  void *v33;
  char v34;
  uint64_t v35;
  _HAPAccessoryServerBTLE200 *v36;
  NSObject *v37;
  NSObject *v38;
  void *v39;
  HAPBTLEResponse *v40;
  void *v41;
  _HAPAccessoryServerBTLE200 *v42;
  NSObject *v43;
  id v44;
  id v45;
  void *v46;
  id v47;
  void *v48;
  _HAPAccessoryServerBTLE200 *v49;
  NSObject *v50;
  void *v51;
  int v52;
  void *v53;
  void *v54;
  _HAPAccessoryServerBTLE200 *v55;
  NSObject *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  uint64_t v62;
  void *v63;
  void *v64;
  _HAPAccessoryServerBTLE200 *v65;
  NSObject *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  _HAPAccessoryServerBTLE200 *v71;
  NSObject *v72;
  void *v73;
  uint64_t v74;
  void *v75;
  void *v76;
  _HAPAccessoryServerBTLE200 *v77;
  NSObject *v78;
  void *v79;
  void *v80;
  HAPBTLEResponse *v81;
  void *v82;
  _HAPAccessoryServerBTLE200 *v83;
  NSObject *v84;
  void *v85;
  id v86;
  void *v87;
  void *v88;
  _HAPAccessoryServerBTLE200 *v89;
  NSObject *v90;
  void *v91;
  void *v92;
  void *context;
  id contexta;
  void *contextb;
  HAPBTLEResponse *v96;
  void *v97;
  HAPBTLEResponse *v98;
  void *v99;
  id v100;
  id v101;
  id v102;
  id v103;
  id v104;
  uint8_t buf[4];
  void *v106;
  __int16 v107;
  uint64_t v108;
  __int16 v109;
  uint64_t v110;
  uint64_t v111;

  v111 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  -[_HAPAccessoryServerBTLE200 _pendingRequestForCharacteristic:](self, "_pendingRequestForCharacteristic:", v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v11;
  if (v11)
  {
    if (v10)
    {
      v13 = (void *)MEMORY[0x1D17B7244]();
      v14 = self;
      HMFGetOSLogHandle();
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        v106 = v16;
        v107 = 2112;
        v108 = (uint64_t)v12;
        v109 = 2112;
        v110 = (uint64_t)v10;
        _os_log_impl(&dword_1CCE01000, v15, OS_LOG_TYPE_ERROR, "%{public}@Failed to get response for request, %@, with error: %@", buf, 0x20u);

      }
      objc_autoreleasePoolPop(v13);
      objc_msgSend(v12, "cancelWithError:", v10);
      goto LABEL_64;
    }
    objc_msgSend(v11, "responseTimer");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "suspend");

    -[_HAPAccessoryServerBTLE200 _kickConnectionIdleTimer](self, "_kickConnectionIdleTimer");
    v22 = v8;
    if (objc_msgSend(v12, "isEncrypted"))
    {
      v104 = 0;
      -[_HAPAccessoryServerBTLE200 _decryptData:error:](self, "_decryptData:error:", v22, &v104);
      v23 = objc_claimAutoreleasedReturnValue();
      v24 = v104;

      if (!v23)
      {
        v54 = (void *)MEMORY[0x1D17B7244]();
        v55 = self;
        HMFGetOSLogHandle();
        v56 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v56, OS_LOG_TYPE_ERROR))
        {
          HMFGetLogIdentifier();
          v57 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543874;
          v106 = v57;
          v107 = 2112;
          v108 = (uint64_t)v12;
          v109 = 2112;
          v110 = (uint64_t)v24;
          _os_log_impl(&dword_1CCE01000, v56, OS_LOG_TYPE_ERROR, "%{public}@Failed to decrypt response to request %@ with error: %@", buf, 0x20u);

        }
        objc_autoreleasePoolPop(v54);
        objc_msgSend(v12, "cancelWithError:", v24);
        goto LABEL_63;
      }

      v24 = (id)v23;
    }
    else
    {
      v24 = v22;
    }
    v25 = (void *)MEMORY[0x1D17B7244]();
    v26 = self;
    HMFGetOSLogHandle();
    v27 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG))
    {
      HMFGetLogIdentifier();
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v106 = v28;
      v107 = 2112;
      v108 = (uint64_t)v24;
      _os_log_impl(&dword_1CCE01000, v27, OS_LOG_TYPE_DEBUG, "%{public}@Decrypted Response: %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v25);
    v103 = 0;
    +[HAPBTLEControlPacket packetWithSerializedData:error:](HAPBTLEControlPacket, "packetWithSerializedData:error:", v24, &v103);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = v103;
    if (!v29)
    {
      v41 = (void *)MEMORY[0x1D17B7244]();
      v42 = v26;
      HMFGetOSLogHandle();
      v43 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v43, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v44 = v24;
        v45 = v30;
        v46 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v106 = v46;
        v107 = 2112;
        v108 = (uint64_t)v45;
        _os_log_impl(&dword_1CCE01000, v43, OS_LOG_TYPE_ERROR, "%{public}@Failed to parse control field with error: %@", buf, 0x16u);

        v30 = v45;
        v24 = v44;
        v29 = 0;
      }

      objc_autoreleasePoolPop(v41);
      objc_msgSend(v12, "cancelWithError:", v30);
      goto LABEL_62;
    }
    v101 = v24;
    if (objc_msgSend(v29, "type") == 1)
    {
      if (!objc_msgSend(v29, "isContinuationPacket"))
        goto LABEL_19;
      objc_msgSend(v12, "identifier");
      v31 = v30;
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "transactionIdentifier");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      v34 = objc_msgSend(v32, "isEqual:", v33);

      v30 = v31;
      if ((v34 & 1) != 0)
      {
LABEL_19:
        v100 = v30;
        if (objc_msgSend(v29, "isContinuationPacket"))
        {
          -[_HAPAccessoryServerBTLE200 _pendingResponseForRequest:](v26, "_pendingResponseForRequest:", v12);
          v35 = objc_claimAutoreleasedReturnValue();
          context = (void *)MEMORY[0x1D17B7244]();
          v36 = v26;
          HMFGetOSLogHandle();
          v37 = objc_claimAutoreleasedReturnValue();
          v38 = v37;
          if (!v35)
          {
            if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
            {
              HMFGetLogIdentifier();
              v86 = v30;
              v87 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138543618;
              v106 = v87;
              v107 = 2112;
              v108 = (uint64_t)v12;
              _os_log_impl(&dword_1CCE01000, v38, OS_LOG_TYPE_ERROR, "%{public}@Failed to retrieve the response for the continued request: %@", buf, 0x16u);

              v30 = v86;
            }

            objc_autoreleasePoolPop(context);
            objc_msgSend(MEMORY[0x1E0CB35C8], "hapErrorWithCode:description:reason:suggestion:underlyingError:", 3, CFSTR("Request failed."), CFSTR("Failed to handle continued response."), 0, 0);
            v40 = (HAPBTLEResponse *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v12, "cancelWithError:", v40);
            v24 = v101;
            goto LABEL_61;
          }
          if (os_log_type_enabled(v37, OS_LOG_TYPE_DEBUG))
          {
            HMFGetLogIdentifier();
            v39 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543618;
            v106 = v39;
            v107 = 2112;
            v108 = v35;
            _os_log_impl(&dword_1CCE01000, v38, OS_LOG_TYPE_DEBUG, "%{public}@Received data for continued response: %@", buf, 0x16u);

          }
          objc_autoreleasePoolPop(context);
          v40 = (HAPBTLEResponse *)v35;
        }
        else
        {
          v40 = -[HAPBTLEResponse initWithRequest:]([HAPBTLEResponse alloc], "initWithRequest:", v12);
          -[_HAPAccessoryServerBTLE200 pendingResponses](v26, "pendingResponses");
          v58 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v58, "addObject:", v40);

          v59 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D286C8]), "initWithTimeInterval:options:", 1, 4.0);
          objc_msgSend(v59, "setDelegate:", v26);
          -[HAPAccessoryServer clientQueue](v26, "clientQueue");
          v60 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v59, "setDelegateQueue:", v60);

          objc_msgSend(v12, "setResponseTimer:", v59);
        }
        objc_msgSend(v29, "payload");
        v61 = (void *)objc_claimAutoreleasedReturnValue();
        v102 = 0;
        v62 = -[HAPBTLEResponse appendData:error:](v40, "appendData:error:", v61, &v102);
        contexta = v102;

        if (!v62)
        {
          v98 = v40;
          v76 = (void *)MEMORY[0x1D17B7244]();
          v77 = v26;
          HMFGetOSLogHandle();
          v78 = objc_claimAutoreleasedReturnValue();
          v24 = v101;
          if (os_log_type_enabled(v78, OS_LOG_TYPE_ERROR))
          {
            HMFGetLogIdentifier();
            v79 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543618;
            v106 = v79;
            v107 = 2112;
            v108 = (uint64_t)v98;
            _os_log_impl(&dword_1CCE01000, v78, OS_LOG_TYPE_ERROR, "%{public}@Failed to deserialize the response data for response: %@", buf, 0x16u);

          }
          objc_autoreleasePoolPop(v76);
          v63 = contexta;
          objc_msgSend(MEMORY[0x1E0CB35C8], "hapErrorWithCode:description:reason:suggestion:underlyingError:", 15, CFSTR("Failed to deserialize response."), 0, 0, contexta);
          v80 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "cancelWithError:", v80);

          v40 = v98;
          v30 = v100;
          goto LABEL_60;
        }
        v24 = v101;
        if (-[HAPBTLEResponse isComplete](v40, "isComplete"))
        {
          v30 = v100;
          if (-[HAPBTLEResponse isValid](v40, "isValid"))
          {
            v63 = contexta;
            if ((objc_msgSend(v12, "isFinished") & 1) != 0)
            {
LABEL_60:

LABEL_61:
              goto LABEL_62;
            }
            v96 = v40;
            v64 = (void *)MEMORY[0x1D17B7244]();
            v65 = v26;
            HMFGetOSLogHandle();
            v66 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v66, OS_LOG_TYPE_INFO))
            {
              HMFGetLogIdentifier();
              v67 = v64;
              v68 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138543618;
              v106 = v68;
              v107 = 2112;
              v108 = (uint64_t)v96;
              _os_log_impl(&dword_1CCE01000, v66, OS_LOG_TYPE_INFO, "%{public}@Handling completed response: %@", buf, 0x16u);

              v64 = v67;
            }

            objc_autoreleasePoolPop(v64);
            if (objc_msgSend(v12, "type") == 4)
              -[_HAPAccessoryServerBTLE200 _suspendAllOperations](v65, "_suspendAllOperations");
            objc_msgSend(v12, "operation");
            v69 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v69, "finish");

            v30 = v100;
            v24 = v101;
            v40 = v96;
          }
          else
          {
            v88 = (void *)MEMORY[0x1D17B7244]();
            v89 = v26;
            HMFGetOSLogHandle();
            v90 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v90, OS_LOG_TYPE_ERROR))
            {
              HMFGetLogIdentifier();
              v91 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138543874;
              v106 = v91;
              v107 = 2112;
              v108 = (uint64_t)v40;
              v109 = 2112;
              v110 = (uint64_t)v12;
              _os_log_impl(&dword_1CCE01000, v90, OS_LOG_TYPE_ERROR, "%{public}@Received invalid response, %@, to request: %@", buf, 0x20u);

            }
            objc_autoreleasePoolPop(v88);
            objc_msgSend(MEMORY[0x1E0CB35C8], "hapErrorWithCode:description:reason:suggestion:underlyingError:", 15, CFSTR("Invalid response."), CFSTR("The response could not be validated against the request."), 0, 0);
            v92 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v12, "cancelWithError:", v92);

            v30 = v100;
            v24 = v101;
          }
        }
        else
        {
          v81 = v40;
          v82 = (void *)MEMORY[0x1D17B7244]();
          v83 = v26;
          HMFGetOSLogHandle();
          v84 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v84, OS_LOG_TYPE_DEBUG))
          {
            HMFGetLogIdentifier();
            v99 = v82;
            v85 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543618;
            v106 = v85;
            v107 = 2112;
            v108 = (uint64_t)v81;
            _os_log_impl(&dword_1CCE01000, v84, OS_LOG_TYPE_DEBUG, "%{public}@Requesting additional data for response: %@", buf, 0x16u);

            v82 = v99;
          }

          objc_autoreleasePoolPop(v82);
          -[_HAPAccessoryServerBTLE200 _requestResponseForRequest:](v83, "_requestResponseForRequest:", v12);
          v30 = v100;
          v40 = v81;
        }
        v63 = contexta;
        goto LABEL_60;
      }
      v70 = (void *)MEMORY[0x1D17B7244]();
      v71 = v26;
      HMFGetOSLogHandle();
      v72 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v72, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        contextb = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v29, "transactionIdentifier");
        v97 = v70;
        v73 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "identifier");
        v74 = objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        v106 = contextb;
        v107 = 2112;
        v108 = (uint64_t)v73;
        v109 = 2112;
        v110 = v74;
        v75 = (void *)v74;
        _os_log_impl(&dword_1CCE01000, v72, OS_LOG_TYPE_ERROR, "%{public}@The continuation response payload transaction identifier, %@, does not match the request's transaction identifier, %@.", buf, 0x20u);

        v30 = v31;
        v70 = v97;

      }
      objc_autoreleasePoolPop(v70);
      objc_msgSend(v12, "cancelWithError:", 0);
    }
    else
    {
      v47 = v30;
      v48 = (void *)MEMORY[0x1D17B7244]();
      v49 = v26;
      HMFGetOSLogHandle();
      v50 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v50, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v51 = (void *)objc_claimAutoreleasedReturnValue();
        v52 = objc_msgSend(v29, "type");
        *(_DWORD *)buf = 138543618;
        v106 = v51;
        v107 = 1024;
        LODWORD(v108) = v52;
        _os_log_impl(&dword_1CCE01000, v50, OS_LOG_TYPE_ERROR, "%{public}@Invalid response type control type: %u", buf, 0x12u);

      }
      objc_autoreleasePoolPop(v48);
      objc_msgSend(MEMORY[0x1E0CB35C8], "hapErrorWithCode:description:reason:suggestion:underlyingError:", 3, CFSTR("Request failed."), CFSTR("Invalid response control type."), 0, 0);
      v53 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "cancelWithError:", v53);

      v30 = v47;
    }
    v24 = v101;
LABEL_62:

LABEL_63:
    goto LABEL_64;
  }
  v17 = (void *)MEMORY[0x1D17B7244]();
  v18 = self;
  HMFGetOSLogHandle();
  v19 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
  {
    HMFGetLogIdentifier();
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v106 = v20;
    v107 = 2112;
    v108 = (uint64_t)v9;
    _os_log_impl(&dword_1CCE01000, v19, OS_LOG_TYPE_ERROR, "%{public}@Received unexpected response from characteristic, %@, dropping", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v17);
LABEL_64:

}

- (void)_sendProtocolInfoServiceExchangeData:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  _HAPAccessoryServerBTLE200 *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  HAPBTLERequest *v16;
  void *v17;
  _HAPAccessoryServerBTLE200 *v18;
  NSObject *v19;
  void *v20;
  void *v21;
  _HAPAccessoryServerBTLE200 *v22;
  NSObject *v23;
  void *v24;
  void *v25;
  void *context;
  _QWORD v27[4];
  id v28;
  id v29;
  id location;
  uint8_t buf[4];
  void *v32;
  __int16 v33;
  id v34;
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if ((unint64_t)objc_msgSend(v6, "length") >= 2)
  {
    objc_msgSend(v6, "subdataWithRange:", 1, objc_msgSend(v6, "length") - 1);
    v8 = objc_claimAutoreleasedReturnValue();

    v6 = (id)v8;
  }
  v9 = (void *)MEMORY[0x1D17B7244]();
  v10 = self;
  HMFGetOSLogHandle();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
  {
    HMFGetLogIdentifier();
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v32 = v12;
    v33 = 2112;
    v34 = v6;
    _os_log_impl(&dword_1CCE01000, v11, OS_LOG_TYPE_DEBUG, "%{public}@Sending Protocol Exchange for data: %@", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v9);
  -[_HAPAccessoryServerBTLE200 protocolInfoServiceSignatureCharacteristics](v10, "protocolInfoServiceSignatureCharacteristics");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (v13)
  {
    objc_initWeak(&location, v10);
    v27[0] = MEMORY[0x1E0C809B0];
    v27[1] = 3221225472;
    v27[2] = __78___HAPAccessoryServerBTLE200__sendProtocolInfoServiceExchangeData_completion___block_invoke;
    v27[3] = &unk_1E894AF68;
    objc_copyWeak(&v29, &location);
    v14 = v7;
    v28 = v14;
    v15 = (void *)MEMORY[0x1D17B7400](v27);
    v16 = -[HAPBTLERequest initWithCharacteristic:requestType:bodyData:shouldEncrypt:timeoutInterval:]([HAPBTLERequest alloc], "initWithCharacteristic:requestType:bodyData:shouldEncrypt:timeoutInterval:", v13, 255, v6, 1, 10.0);
    if (v16)
    {
      -[_HAPAccessoryServerBTLE200 _sendRequest:shouldPrioritize:responseHandler:](v10, "_sendRequest:shouldPrioritize:responseHandler:", v16, 0, v15);
      -[_HAPAccessoryServerBTLE200 _kickConnectionIdleTimer](v10, "_kickConnectionIdleTimer");
    }
    else
    {
      context = (void *)MEMORY[0x1D17B7244]();
      v22 = v10;
      HMFGetOSLogHandle();
      v23 = (id)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v32 = v24;
        v33 = 2112;
        v34 = v13;
        _os_log_impl(&dword_1CCE01000, v23, OS_LOG_TYPE_ERROR, "%{public}@Failed to create exchange request for characteristic, %@", buf, 0x16u);

      }
      objc_autoreleasePoolPop(context);
      objc_msgSend(MEMORY[0x1E0CB35C8], "hapErrorWithCode:", 9);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      (*((void (**)(id, void *, _QWORD))v14 + 2))(v14, v25, 0);

    }
    objc_destroyWeak(&v29);
    objc_destroyWeak(&location);
  }
  else
  {
    v17 = (void *)MEMORY[0x1D17B7244]();
    v18 = v10;
    HMFGetOSLogHandle();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v32 = v20;
      _os_log_impl(&dword_1CCE01000, v19, OS_LOG_TYPE_ERROR, "%{public}@Failed, missing the Service Signature Characteristic for Protocol Info Service", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v17);
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("HAPErrorDomain"), 3, 0);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, void *, _QWORD))v7 + 2))(v7, v21, 0);

  }
}

- (void)_enqueueRequest:(id)a3 shouldPrioritize:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  void *v7;
  _HAPAccessoryServerBTLE200 *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  char v21;
  int v22;
  void *v23;
  __int16 v24;
  id v25;
  uint64_t v26;

  v4 = a4;
  v26 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = (void *)MEMORY[0x1D17B7244]();
  v8 = self;
  HMFGetOSLogHandle();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
  {
    HMFGetLogIdentifier();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = 138543618;
    v23 = v10;
    v24 = 2112;
    v25 = v6;
    _os_log_impl(&dword_1CCE01000, v9, OS_LOG_TYPE_DEBUG, "%{public}@Queueing request: %@", (uint8_t *)&v22, 0x16u);

  }
  objc_autoreleasePoolPop(v7);
  objc_msgSend(v6, "characteristic");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[_HAPAccessoryServerBTLE200 pairVerifyCharacteristic](v8, "pairVerifyCharacteristic");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v11, "isEqual:", v12))
  {
    v13 = objc_msgSend(v6, "type");

    if (v13 != 1)
    {
      -[_HAPAccessoryServerBTLE200 pairVerifyOperationQueue](v8, "pairVerifyOperationQueue");
      v14 = objc_claimAutoreleasedReturnValue();
      goto LABEL_13;
    }
  }
  else
  {

  }
  if (objc_msgSend(v6, "isEncrypted"))
  {
    -[_HAPAccessoryServerBTLE200 securitySession](v8, "securitySession");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend(v15, "isOpen"))
    {
      -[_HAPAccessoryServerBTLE200 securitySession](v8, "securitySession");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      if (!objc_msgSend(v16, "isOpening"))
      {
        -[_HAPAccessoryServerBTLE200 pairSetupSession](v8, "pairSetupSession");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v21 = objc_msgSend(v20, "isSecureSession");

        if ((v21 & 1) == 0)
        {
          -[_HAPAccessoryServerBTLE200 _suspendAllOperations](v8, "_suspendAllOperations");
          -[HAPAccessoryServer setMetric_pairVerifyReason:](v8, "setMetric_pairVerifyReason:", CFSTR("noSession.request"));
          -[_HAPAccessoryServerBTLE200 _establishSecureSession](v8, "_establishSecureSession");
        }
        goto LABEL_12;
      }

    }
  }
LABEL_12:
  -[_HAPAccessoryServerBTLE200 requestOperationQueue](v8, "requestOperationQueue");
  v14 = objc_claimAutoreleasedReturnValue();
LABEL_13:
  v17 = (void *)v14;
  if (v4)
  {
    objc_msgSend(v6, "operation");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setQueuePriority:", 4);

  }
  objc_msgSend(v6, "operation");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "addOperation:", v19);

}

- (unint64_t)_outstandingRequests
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t i;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  -[_HAPAccessoryServerBTLE200 requestOperationQueue](self, "requestOperationQueue", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "operations");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v4)
  {
    v5 = v4;
    v6 = 0;
    v7 = *(_QWORD *)v11;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v11 != v7)
          objc_enumerationMutation(v3);
        v6 += objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * i), "isFinished") ^ 1;
      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v5);
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (void)_suspendAllOperations
{
  void *v3;
  char v4;
  void *v5;
  _HAPAccessoryServerBTLE200 *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  -[_HAPAccessoryServerBTLE200 requestOperationQueue](self, "requestOperationQueue");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isSuspended");

  if ((v4 & 1) == 0)
  {
    v5 = (void *)MEMORY[0x1D17B7244]();
    v6 = self;
    HMFGetOSLogHandle();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    {
      HMFGetLogIdentifier();
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = 138543362;
      v11 = v8;
      _os_log_impl(&dword_1CCE01000, v7, OS_LOG_TYPE_DEBUG, "%{public}@Suspending all request operations", (uint8_t *)&v10, 0xCu);

    }
    objc_autoreleasePoolPop(v5);
    -[_HAPAccessoryServerBTLE200 requestOperationQueue](v6, "requestOperationQueue");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setSuspended:", 1);

  }
}

- (void)_resumeAllOperations
{
  void *v3;
  int v4;
  void *v5;
  _HAPAccessoryServerBTLE200 *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  -[_HAPAccessoryServerBTLE200 requestOperationQueue](self, "requestOperationQueue");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isSuspended");

  if (v4)
  {
    v5 = (void *)MEMORY[0x1D17B7244]();
    v6 = self;
    HMFGetOSLogHandle();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    {
      HMFGetLogIdentifier();
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = 138543362;
      v11 = v8;
      _os_log_impl(&dword_1CCE01000, v7, OS_LOG_TYPE_DEBUG, "%{public}@Resuming all request operations", (uint8_t *)&v10, 0xCu);

    }
    objc_autoreleasePoolPop(v5);
    -[_HAPAccessoryServerBTLE200 requestOperationQueue](v6, "requestOperationQueue");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setSuspended:", 0);

  }
}

- (void)_cancelAllQueuedOperationsWithError:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  _HAPAccessoryServerBTLE200 *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  int v15;
  void *v16;
  __int16 v17;
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (v4)
  {
    -[_HAPAccessoryServerBTLE200 requestOperationQueue](self, "requestOperationQueue");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "operations");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "count");

    if (v7)
    {
      v8 = (void *)MEMORY[0x1D17B7244]();
      v9 = self;
      HMFGetOSLogHandle();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
      {
        HMFGetLogIdentifier();
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        -[_HAPAccessoryServerBTLE200 requestOperationQueue](v9, "requestOperationQueue");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "operations");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = 138543618;
        v16 = v11;
        v17 = 2112;
        v18 = v13;
        _os_log_impl(&dword_1CCE01000, v10, OS_LOG_TYPE_DEBUG, "%{public}@Cancelling all queued operations: %@", (uint8_t *)&v15, 0x16u);

      }
      objc_autoreleasePoolPop(v8);
    }
    -[_HAPAccessoryServerBTLE200 requestOperationQueue](self, "requestOperationQueue");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "cancelAllOperationsWithError:", v4);

  }
}

- (void)evaluateConnectionStateForOperation:(int64_t)a3 block:(id)a4
{
  id v6;
  NSObject *v7;
  id v8;
  _QWORD block[5];
  id v10;
  int64_t v11;

  v6 = a4;
  -[HAPAccessoryServer clientQueue](self, "clientQueue");
  v7 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __72___HAPAccessoryServerBTLE200_evaluateConnectionStateForOperation_block___block_invoke;
  block[3] = &unk_1E894AF90;
  block[4] = self;
  v10 = v6;
  v11 = a3;
  v8 = v6;
  dispatch_async(v7, block);

}

- (void)_invokeOperationsReceivedDuringConnectionStateChangeWithError:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  _HAPAccessoryServerBTLE200 *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  uint8_t v25[128];
  uint8_t buf[4];
  void *v27;
  __int16 v28;
  void *v29;
  __int16 v30;
  id v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[HAPAccessoryServer clientQueue](self, "clientQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  -[_HAPAccessoryServerBTLE200 operationsReceivedDuringConnectionStateChange](self, "operationsReceivedDuringConnectionStateChange");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "count");

  if (v7)
  {
    v8 = (void *)MEMORY[0x1D17B7244]();
    v9 = self;
    HMFGetOSLogHandle();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = (void *)MEMORY[0x1E0CB37E8];
      -[_HAPAccessoryServerBTLE200 operationsReceivedDuringConnectionStateChange](v9, "operationsReceivedDuringConnectionStateChange");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "numberWithUnsignedInteger:", objc_msgSend(v13, "count"));
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v27 = v11;
      v28 = 2112;
      v29 = v14;
      v30 = 2112;
      v31 = v4;
      _os_log_impl(&dword_1CCE01000, v10, OS_LOG_TYPE_INFO, "%{public}@Invoking %@ operation blocks pended during connection state change with error: %@", buf, 0x20u);

    }
    objc_autoreleasePoolPop(v8);
    v23 = 0u;
    v24 = 0u;
    v21 = 0u;
    v22 = 0u;
    -[_HAPAccessoryServerBTLE200 operationsReceivedDuringConnectionStateChange](v9, "operationsReceivedDuringConnectionStateChange", 0);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
    if (v16)
    {
      v17 = v16;
      v18 = *(_QWORD *)v22;
      do
      {
        v19 = 0;
        do
        {
          if (*(_QWORD *)v22 != v18)
            objc_enumerationMutation(v15);
          (*(void (**)(void))(*(_QWORD *)(*((_QWORD *)&v21 + 1) + 8 * v19++) + 16))();
        }
        while (v17 != v19);
        v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
      }
      while (v17);
    }

    -[_HAPAccessoryServerBTLE200 operationsReceivedDuringConnectionStateChange](v9, "operationsReceivedDuringConnectionStateChange");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "removeAllObjects");

  }
}

- (HAPSecuritySession)securitySession
{
  os_unfair_lock_s *p_lock;
  HAPSecuritySession *v4;

  p_lock = &self->super.super._lock;
  os_unfair_lock_lock_with_options();
  v4 = self->_securitySession;
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (void)setSecuritySession:(id)a3
{
  HAPSecuritySession *v4;
  HAPSecuritySession *securitySession;

  v4 = (HAPSecuritySession *)a3;
  os_unfair_lock_lock_with_options();
  securitySession = self->_securitySession;
  self->_securitySession = v4;

  os_unfair_lock_unlock(&self->super.super._lock);
}

- (BOOL)isSecuritySessionOpen
{
  void *v2;
  char v3;

  -[_HAPAccessoryServerBTLE200 securitySession](self, "securitySession");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isOpen");

  return v3;
}

- (void)setSecuritySessionOpen:(BOOL)a3
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v3 = (void *)MEMORY[0x1E0C99DA0];
  v4 = *MEMORY[0x1E0C99768];
  v5 = (void *)MEMORY[0x1E0CB3940];
  NSStringFromSelector(a2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringWithFormat:", CFSTR("%@ is unavailable"), v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "exceptionWithName:reason:userInfo:", v4, v7, 0);
  v8 = (id)objc_claimAutoreleasedReturnValue();

  objc_exception_throw(v8);
}

- (void)_establishSecureSession
{
  void *v3;
  void *v4;
  _HAPAccessoryServerBTLE200 *v5;
  NSObject *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  _HAPAccessoryServerBTLE200 *v13;
  NSObject *v14;
  void *v15;
  void *v16;
  void *v17;
  HAPSecuritySession *v18;
  uint8_t buf[4];
  void *v20;
  __int16 v21;
  const __CFString *v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  if (-[HAPAccessoryServerBTLE isPaired](self, "isPaired"))
  {
    -[_HAPAccessoryServerBTLE200 securitySession](self, "securitySession");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v3, "isOpen"))
    {

LABEL_9:
      v12 = (void *)MEMORY[0x1D17B7244]();
      v13 = self;
      HMFGetOSLogHandle();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
      {
        HMFGetLogIdentifier();
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v20 = v15;
        _os_log_impl(&dword_1CCE01000, v14, OS_LOG_TYPE_DEBUG, "%{public}@A security session is already established.", buf, 0xCu);

      }
      objc_autoreleasePoolPop(v12);
      return;
    }
    -[_HAPAccessoryServerBTLE200 securitySession](self, "securitySession");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "isOpening");

    if (v11)
      goto LABEL_9;
    if (HAPIsHH2Enabled_onceToken != -1)
      dispatch_once(&HAPIsHH2Enabled_onceToken, &__block_literal_global_11472);
    if (HAPIsHH2Enabled_hh2Enabled == 1)
    {
      -[HAPAccessoryServer initializeKeyBagIfNecessary](self, "initializeKeyBagIfNecessary");
      -[_HAPAccessoryServerBTLE200 accessoryCache](self, "accessoryCache");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      -[HAPAccessoryServer keyBag](self, "keyBag");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "updateCurrentPairingIdentityIndexIfNeededForKeyBag:", v17);

    }
    v18 = -[HAPSecuritySession initWithRole:resumeSessionID:delegate:]([HAPSecuritySession alloc], "initWithRole:resumeSessionID:delegate:", 0, -[HAPAccessoryServerBTLE resumeSessionID](self, "resumeSessionID"), self);
    -[_HAPAccessoryServerBTLE200 setSecuritySession:](self, "setSecuritySession:", v18);
    -[HAPSecuritySession open](v18, "open");

  }
  else
  {
    v4 = (void *)MEMORY[0x1D17B7244]();
    v5 = self;
    HMFGetOSLogHandle();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v20 = v7;
      v21 = 2112;
      v22 = CFSTR("Unable to establish a secure session because the accessory isn't paired.");
      _os_log_impl(&dword_1CCE01000, v6, OS_LOG_TYPE_ERROR, "%{public}@%@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v4);
    objc_msgSend(MEMORY[0x1E0CB35C8], "hapErrorWithCode:description:reason:suggestion:underlyingError:", 3, CFSTR("Unable to establish a secure session because the accessory isn't paired."), 0, 0, 0);
    v8 = objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      v9 = (void *)v8;
      -[_HAPAccessoryServerBTLE200 _disconnectWithDisconnectionError:completionHandler:](v5, "_disconnectWithDisconnectionError:completionHandler:", v8, 0);

    }
  }
}

- (void)_handleSecuritySessionSetupExchangeData:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  _HAPAccessoryServerBTLE200 *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  _QWORD v12[4];
  id v13;
  id v14;
  id location[4];

  location[3] = *(id *)MEMORY[0x1E0C80C00];
  v4 = a3;
  -[_HAPAccessoryServerBTLE200 pairVerifyCharacteristic](self, "pairVerifyCharacteristic");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    objc_initWeak(location, self);
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __70___HAPAccessoryServerBTLE200__handleSecuritySessionSetupExchangeData___block_invoke;
    v12[3] = &unk_1E894AFB8;
    objc_copyWeak(&v14, location);
    v13 = v5;
    -[_HAPAccessoryServerBTLE200 _writeValue:toCharacteristic:authorizationData:contextData:options:completionHandler:](self, "_writeValue:toCharacteristic:authorizationData:contextData:options:completionHandler:", v4, v13, 0, 0, 18, v12);

    objc_destroyWeak(&v14);
    objc_destroyWeak(location);
  }
  else
  {
    v6 = (void *)MEMORY[0x1D17B7244]();
    v7 = self;
    HMFGetOSLogHandle();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(location[0]) = 138543362;
      *(id *)((char *)location + 4) = v9;
      _os_log_impl(&dword_1CCE01000, v8, OS_LOG_TYPE_ERROR, "%{public}@Security session setup exchange failed, missing the Pair Verify characteristic", (uint8_t *)location, 0xCu);

    }
    objc_autoreleasePoolPop(v6);
    objc_msgSend(MEMORY[0x1E0CB35C8], "hapErrorWithCode:description:reason:suggestion:underlyingError:", 9, CFSTR("Security session setup exchange failed."), CFSTR("Missing Pair Verify characteristic."), 0, 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[_HAPAccessoryServerBTLE200 securitySession](v7, "securitySession");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "receivedSetupExchangeData:error:", 0, v10);

  }
}

- (HAPCharacteristic)pairVerifyCharacteristic
{
  HAPCharacteristic **p_pairVerifyCharacteristic;
  id WeakRetained;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  p_pairVerifyCharacteristic = &self->_pairVerifyCharacteristic;
  WeakRetained = objc_loadWeakRetained((id *)&self->_pairVerifyCharacteristic);

  if (!WeakRetained)
  {
    -[HAPAccessoryServer primaryAccessory](self, "primaryAccessory");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "servicesOfType:", CFSTR("00000055-0000-1000-8000-0026BB765291"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "firstObject");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v7, "characteristicsOfType:", CFSTR("0000004E-0000-1000-8000-0026BB765291"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "firstObject");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_storeWeak((id *)p_pairVerifyCharacteristic, v9);

  }
  return (HAPCharacteristic *)objc_loadWeakRetained((id *)p_pairVerifyCharacteristic);
}

- (id)protocolInfoServiceSignatureCharacteristics
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  -[HAPAccessoryServer primaryAccessory](self, "primaryAccessory");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "servicesOfType:", CFSTR("000000A2-0000-1000-8000-0026BB765291"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "firstObject");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "characteristicsOfType:", CFSTR("000000A5-0000-1000-8000-0026BB765291"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "firstObject");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)_encryptDataAndGenerateAuthTag:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  _HAPAccessoryServerBTLE200 *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  int v14;
  void *v15;
  void *v16;
  int v18;
  void *v19;
  __int16 v20;
  id v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = (void *)MEMORY[0x1D17B7244]();
  v8 = self;
  HMFGetOSLogHandle();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
  {
    HMFGetLogIdentifier();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = 138543618;
    v19 = v10;
    v20 = 2112;
    v21 = v6;
    _os_log_impl(&dword_1CCE01000, v9, OS_LOG_TYPE_DEBUG, "%{public}@Encrypting plaintext data: %@", (uint8_t *)&v18, 0x16u);

  }
  objc_autoreleasePoolPop(v7);
  -[_HAPAccessoryServerBTLE200 securitySession](v8, "securitySession");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    -[_HAPAccessoryServerBTLE200 securitySession](v8, "securitySession");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_7:
    v15 = v12;
    objc_msgSend(v12, "encryptData:additionalAuthenticatedData:error:", v6, 0, a4);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    goto LABEL_8;
  }
  -[_HAPAccessoryServerBTLE200 pairSetupSession](v8, "pairSetupSession");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "isSecureSession");

  if (v14)
  {
    -[_HAPAccessoryServerBTLE200 pairSetupSession](v8, "pairSetupSession");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_7;
  }
  if (a4)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "hapErrorWithCode:description:reason:suggestion:underlyingError:", 3, CFSTR("Missing security session."), 0, 0, 0);
    v16 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v16 = 0;
  }
LABEL_8:

  return v16;
}

- (id)_decryptData:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  _HAPAccessoryServerBTLE200 *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  int v14;
  void *v15;
  void *v16;
  int v18;
  void *v19;
  __int16 v20;
  uint64_t v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = (void *)MEMORY[0x1D17B7244]();
  v8 = self;
  HMFGetOSLogHandle();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
  {
    HMFGetLogIdentifier();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = 138543618;
    v19 = v10;
    v20 = 2048;
    v21 = objc_msgSend(v6, "length");
    _os_log_impl(&dword_1CCE01000, v9, OS_LOG_TYPE_DEBUG, "%{public}@Decrypting data with length %lu", (uint8_t *)&v18, 0x16u);

  }
  objc_autoreleasePoolPop(v7);
  -[_HAPAccessoryServerBTLE200 securitySession](v8, "securitySession");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    -[_HAPAccessoryServerBTLE200 securitySession](v8, "securitySession");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_7:
    v15 = v12;
    objc_msgSend(v12, "decryptData:additionalAuthenticatedData:error:", v6, 0, a4);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    goto LABEL_8;
  }
  -[_HAPAccessoryServerBTLE200 pairSetupSession](v8, "pairSetupSession");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "isSecureSession");

  if (v14)
  {
    -[_HAPAccessoryServerBTLE200 pairSetupSession](v8, "pairSetupSession");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_7;
  }
  if (a4)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "hapErrorWithCode:description:reason:suggestion:underlyingError:", 3, CFSTR("Missing security session."), 0, 0, 0);
    v16 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v16 = 0;
  }
LABEL_8:

  return v16;
}

- (void)connectWithCompletionHandler:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;
  id v9;
  id location;

  v4 = a3;
  objc_initWeak(&location, self);
  -[HAPAccessoryServer clientQueue](self, "clientQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __59___HAPAccessoryServerBTLE200_connectWithCompletionHandler___block_invoke;
  v7[3] = &unk_1E894DC48;
  v7[4] = self;
  objc_copyWeak(&v9, &location);
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, v7);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

- (void)_cancelConnectionWithError:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  _HAPAccessoryServerBTLE200 *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  _QWORD v18[6];
  uint8_t buf[4];
  void *v20;
  __int16 v21;
  id v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = v4;
  if (-[_HAPAccessoryServerBTLE200 connectionState](self, "connectionState") == 1)
  {
    v6 = (void *)MEMORY[0x1D17B7244]();
    v7 = self;
    HMFGetOSLogHandle();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v20 = v9;
      v21 = 2112;
      v22 = v4;
      _os_log_impl(&dword_1CCE01000, v8, OS_LOG_TYPE_INFO, "%{public}@Cancelling connection with error: %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v6);
    v5 = v4;
    if (!v4)
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "hapErrorWithCode:", 2);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
    }
    -[_HAPAccessoryServerBTLE200 connectionCompletionHandler](v7, "connectionCompletionHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = MEMORY[0x1D17B7400]();
    v12 = (void *)v11;
    if (v11)
      (*(void (**)(uint64_t, void *))(v11 + 16))(v11, v5);

    -[_HAPAccessoryServerBTLE200 setConnectionCompletionHandler:](v7, "setConnectionCompletionHandler:", 0);
    -[_HAPAccessoryServerBTLE200 discoveryContext](v7, "discoveryContext");
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    if (v13)
      -[_HAPAccessoryServerBTLE200 _cancelDiscoveryWithError:](v7, "_cancelDiscoveryWithError:", v5);
    if (-[_HAPAccessoryServerBTLE200 isPairing](v7, "isPairing"))
    {
      objc_msgSend(v5, "userInfo");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "objectForKeyedSubscript:", *MEMORY[0x1E0CB3388]);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      if (v15)
        v16 = v15;
      else
        v16 = v5;

      v18[0] = MEMORY[0x1E0C809B0];
      v18[1] = 3221225472;
      v18[2] = __57___HAPAccessoryServerBTLE200__cancelConnectionWithError___block_invoke;
      v18[3] = &unk_1E894E0F8;
      v18[4] = v7;
      v18[5] = v16;
      __57___HAPAccessoryServerBTLE200__cancelConnectionWithError___block_invoke((uint64_t)v18);
    }
    -[HAPAccessoryServerBTLE browser](v7, "browser");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "disconnectFromBTLEAccessoryServer:", v7);

  }
}

- (void)_disconnectWithDisconnectionError:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  int64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  _HAPAccessoryServerBTLE200 *v13;
  NSObject *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  int64_t v19;
  void *v20;
  _HAPAccessoryServerBTLE200 *v21;
  NSObject *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  _HAPAccessoryServerBTLE200 *v27;
  NSObject *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  id v33;
  void *v34;
  uint64_t v35;
  void *v36;
  uint64_t v37;
  uint64_t v38;
  void (*v39)(uint64_t);
  void *v40;
  _HAPAccessoryServerBTLE200 *v41;
  id v42;
  uint8_t buf[4];
  void *v44;
  __int16 v45;
  void *v46;
  __int16 v47;
  void *v48;
  uint64_t v49;

  v49 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  -[HAPAccessoryServer clientQueue](self, "clientQueue");
  v8 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v8);

  v9 = -[_HAPAccessoryServerBTLE200 connectionState](self, "connectionState");
  if (v9 == 2)
  {
    -[_HAPAccessoryServerBTLE200 requestOperationQueue](self, "requestOperationQueue");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "operationCount");

    if (v11 && objc_msgSend(v6, "isHAPError") && objc_msgSend(v6, "code") == 29)
    {
      v12 = (void *)MEMORY[0x1D17B7244]();
      v13 = self;
      HMFGetOSLogHandle();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        -[HAPAccessoryServerBTLE blePeripheral](v13, "blePeripheral");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "shortDescription");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v11);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        v44 = v15;
        v45 = 2112;
        v46 = v17;
        v47 = 2112;
        v48 = v18;
        _os_log_impl(&dword_1CCE01000, v14, OS_LOG_TYPE_INFO, "%{public}@Deferring disconnecting from the peripheral: %@. Pending requests: %@", buf, 0x20u);

      }
      objc_autoreleasePoolPop(v12);
      -[_HAPAccessoryServerBTLE200 _kickConnectionIdleTimer](v13, "_kickConnectionIdleTimer");
    }
    else
    {
      v26 = (void *)MEMORY[0x1D17B7244](-[_HAPAccessoryServerBTLE200 setConnectionCompletionHandler:](self, "setConnectionCompletionHandler:", v7));
      v27 = self;
      HMFGetOSLogHandle();
      v28 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        -[HAPAccessoryServerBTLE blePeripheral](v27, "blePeripheral");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v30, "shortDescription");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v11);
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        v44 = v29;
        v45 = 2112;
        v46 = v31;
        v47 = 2112;
        v48 = v32;
        _os_log_impl(&dword_1CCE01000, v28, OS_LOG_TYPE_INFO, "%{public}@Disconnecting from the peripheral: %@. Pending requests: %@", buf, 0x20u);

      }
      objc_autoreleasePoolPop(v26);
      v37 = MEMORY[0x1E0C809B0];
      v38 = 3221225472;
      v39 = __82___HAPAccessoryServerBTLE200__disconnectWithDisconnectionError_completionHandler___block_invoke;
      v40 = &unk_1E894E0F8;
      v41 = v27;
      v33 = v6;
      v42 = v33;
      __82___HAPAccessoryServerBTLE200__disconnectWithDisconnectionError_completionHandler___block_invoke((uint64_t)&v37);
      -[_HAPAccessoryServerBTLE200 _suspendConnectionIdleTimer](v27, "_suspendConnectionIdleTimer", v37, v38, v39, v40, v41);
      -[HAPAccessoryServerBTLE browser](v27, "browser");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v34, "disconnectFromBTLEAccessoryServer:", v27);

      -[_HAPAccessoryServerBTLE200 setConnectionState:](v27, "setConnectionState:", 3);
    }
  }
  else
  {
    v19 = v9;
    if ((v9 & 0xFFFFFFFFFFFFFFFDLL) == 1)
    {
      v20 = (void *)MEMORY[0x1D17B7244]();
      v21 = self;
      HMFGetOSLogHandle();
      v22 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v19);
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v44 = v23;
        v45 = 2112;
        v46 = v24;
        _os_log_impl(&dword_1CCE01000, v22, OS_LOG_TYPE_ERROR, "%{public}@Trying to disconnect but a connection is already in progress (%@)", buf, 0x16u);

      }
      objc_autoreleasePoolPop(v20);
      objc_msgSend(MEMORY[0x1E0CB35C8], "hapErrorWithCode:", 4);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v25 = 0;
    }
    v35 = MEMORY[0x1D17B7400](v7);
    v36 = (void *)v35;
    if (v35)
      (*(void (**)(uint64_t, void *))(v35 + 16))(v35, v25);

  }
}

- (void)updateConnectionIdleTime:(unsigned __int8)a3
{
  NSObject *v5;
  _QWORD v6[5];
  unsigned __int8 v7;

  -[HAPAccessoryServer clientQueue](self, "clientQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __55___HAPAccessoryServerBTLE200_updateConnectionIdleTime___block_invoke;
  v6[3] = &unk_1E894D770;
  v6[4] = self;
  v7 = a3;
  dispatch_async(v5, v6);

}

- (void)_updateConnectionIdleTime:(unsigned __int8)a3
{
  int v3;
  double v5;

  v3 = a3;
  -[HAPAccessoryServerBTLE setConnectionIdleTime:](self, "setConnectionIdleTime:");
  v5 = 5.0;
  if (v3 == 1)
    v5 = 2.0;
  if (v3 == 2)
    v5 = 15.0;
  -[_HAPAccessoryServerBTLE200 _restartConnectionIdleTimer:](self, "_restartConnectionIdleTimer:", v5);
}

- (void)_restartConnectionIdleTimer:(double)a3
{
  void *v5;
  _HAPAccessoryServerBTLE200 *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  int v14;
  void *v15;
  __int16 v16;
  double v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v5 = (void *)MEMORY[0x1D17B7244](-[_HAPAccessoryServerBTLE200 _suspendConnectionIdleTimer](self, "_suspendConnectionIdleTimer"));
  v6 = self;
  HMFGetOSLogHandle();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    HMFGetLogIdentifier();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = 138543618;
    v15 = v8;
    v16 = 2048;
    v17 = a3;
    _os_log_impl(&dword_1CCE01000, v7, OS_LOG_TYPE_DEBUG, "%{public}@Updating connectionIdle time to: %f", (uint8_t *)&v14, 0x16u);

  }
  objc_autoreleasePoolPop(v5);
  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D286C8]), "initWithTimeInterval:options:", 0, a3);
  -[_HAPAccessoryServerBTLE200 setConnectionIdleTimer:](v6, "setConnectionIdleTimer:", v9);

  -[_HAPAccessoryServerBTLE200 connectionIdleTimer](v6, "connectionIdleTimer");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setDelegate:", v6);

  -[_HAPAccessoryServerBTLE200 connectionIdleTimer](v6, "connectionIdleTimer");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[HAPAccessoryServer clientQueue](v6, "clientQueue");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setDelegateQueue:", v12);

  -[_HAPAccessoryServerBTLE200 connectionIdleTimer](v6, "connectionIdleTimer");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "resume");

}

- (void)handleConnectionWithPeripheral:(id)a3 withError:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  id v9;
  id v10;
  _QWORD block[4];
  id v12;
  _HAPAccessoryServerBTLE200 *v13;
  id v14;

  v6 = a3;
  v7 = a4;
  -[HAPAccessoryServer clientQueue](self, "clientQueue");
  v8 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __71___HAPAccessoryServerBTLE200_handleConnectionWithPeripheral_withError___block_invoke;
  block[3] = &unk_1E894E120;
  v12 = v7;
  v13 = self;
  v14 = v6;
  v9 = v6;
  v10 = v7;
  dispatch_async(v8, block);

}

- (void)_handleConnectionWithError:(id)a3
{
  id v4;
  void *v5;
  _HAPAccessoryServerBTLE200 *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  int v14;
  void *v15;
  __int16 v16;
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = (void *)MEMORY[0x1D17B7244]();
  v6 = self;
  HMFGetOSLogHandle();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = 138543618;
    v15 = v8;
    v16 = 2112;
    v17 = v4;
    _os_log_impl(&dword_1CCE01000, v7, OS_LOG_TYPE_INFO, "%{public}@Connection completed with error: %@", (uint8_t *)&v14, 0x16u);

  }
  objc_autoreleasePoolPop(v5);
  if (v4)
  {
    -[_HAPAccessoryServerBTLE200 setConnectionState:](v6, "setConnectionState:", 0);
    -[_HAPAccessoryServerBTLE200 _suspendConnectionIdleTimer](v6, "_suspendConnectionIdleTimer");
  }
  else
  {
    -[HAPAccessoryServerBTLE browser](v6, "browser");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[HAPAccessoryServerBTLE peripheral](v6, "peripheral");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setConnectionLatency:forPeripheral:", 1, v10);

    -[_HAPAccessoryServerBTLE200 setConnectionState:](v6, "setConnectionState:", 2);
    -[_HAPAccessoryServerBTLE200 _updateConnectionIdleTime:](v6, "_updateConnectionIdleTime:", -[HAPAccessoryServerBTLE connectionIdleTime](v6, "connectionIdleTime"));
    -[_HAPAccessoryServerBTLE200 _kickConnectionIdleTimer](v6, "_kickConnectionIdleTimer");
    -[HAPAccessoryServerBTLE incrementHAPBTLEMetricsConnectionCount](v6, "incrementHAPBTLEMetricsConnectionCount");
  }
  -[_HAPAccessoryServerBTLE200 connectionCompletionHandler](v6, "connectionCompletionHandler");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = MEMORY[0x1D17B7400]();
  v13 = (void *)v12;
  if (v12)
    (*(void (**)(uint64_t, id))(v12 + 16))(v12, v4);

  -[_HAPAccessoryServerBTLE200 setConnectionCompletionHandler:](v6, "setConnectionCompletionHandler:", 0);
}

- (BOOL)isReadyForOperation:(int64_t)a3
{
  NSObject *v5;
  _QWORD block[7];
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  char v11;

  v8 = 0;
  v9 = &v8;
  v10 = 0x2020000000;
  v11 = 0;
  -[HAPAccessoryServer clientQueue](self, "clientQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __50___HAPAccessoryServerBTLE200_isReadyForOperation___block_invoke;
  block[3] = &unk_1E894C548;
  block[4] = self;
  block[5] = &v8;
  block[6] = a3;
  dispatch_sync(v5, block);

  LOBYTE(a3) = *((_BYTE *)v9 + 24);
  _Block_object_dispose(&v8, 8);
  return a3;
}

- (void)handleDisconnectionWithError:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  NSObject *v13;
  id v14;
  id v15;
  _QWORD v16[4];
  id v17;
  _HAPAccessoryServerBTLE200 *v18;
  id v19;
  uint64_t v20;

  v6 = a3;
  v7 = a4;
  -[HAPAccessoryServer connectionStartTime](self, "connectionStartTime");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[HAPAccessoryServer connectionStartTime](self, "connectionStartTime");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "timeIntervalSinceDate:", v10);
    v12 = v11;

  }
  else
  {
    v12 = 0;
  }

  -[HAPAccessoryServer setConnectionStartTime:](self, "setConnectionStartTime:", 0);
  -[HAPAccessoryServer clientQueue](self, "clientQueue");
  v13 = objc_claimAutoreleasedReturnValue();
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __77___HAPAccessoryServerBTLE200_handleDisconnectionWithError_completionHandler___block_invoke;
  v16[3] = &unk_1E894B008;
  v17 = v6;
  v18 = self;
  v20 = v12;
  v19 = v7;
  v14 = v7;
  v15 = v6;
  dispatch_async(v13, v16);

}

- (void)_kickConnectionIdleTimer
{
  id v2;

  -[_HAPAccessoryServerBTLE200 connectionIdleTimer](self, "connectionIdleTimer");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "kick");

}

- (void)_resumeConnectionIdleTimer
{
  void *v3;
  _HAPAccessoryServerBTLE200 *v4;
  NSObject *v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v3 = (void *)MEMORY[0x1D17B7244](self, a2);
  v4 = self;
  HMFGetOSLogHandle();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    HMFGetLogIdentifier();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = 138543362;
    v9 = v6;
    _os_log_impl(&dword_1CCE01000, v5, OS_LOG_TYPE_DEBUG, "%{public}@Resuming the connection idle timer...", (uint8_t *)&v8, 0xCu);

  }
  objc_autoreleasePoolPop(v3);
  -[_HAPAccessoryServerBTLE200 connectionIdleTimer](v4, "connectionIdleTimer");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "resume");

}

- (void)_suspendConnectionIdleTimer
{
  void *v3;
  _HAPAccessoryServerBTLE200 *v4;
  NSObject *v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v3 = (void *)MEMORY[0x1D17B7244](self, a2);
  v4 = self;
  HMFGetOSLogHandle();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    HMFGetLogIdentifier();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = 138543362;
    v9 = v6;
    _os_log_impl(&dword_1CCE01000, v5, OS_LOG_TYPE_DEBUG, "%{public}@Suspending the connection idle timer...", (uint8_t *)&v8, 0xCu);

  }
  objc_autoreleasePoolPop(v3);
  -[_HAPAccessoryServerBTLE200 connectionIdleTimer](v4, "connectionIdleTimer");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "suspend");

}

- (void)_handleConnectionIdleTimeout
{
  void *v3;
  int64_t v4;
  void *v5;
  _HAPAccessoryServerBTLE200 *v6;
  NSObject *v7;
  _BOOL4 v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  int v16;
  void *v17;
  __int16 v18;
  void *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB35C8], "hapErrorWithCode:", 29);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[_HAPAccessoryServerBTLE200 isPairing](self, "isPairing"))
    -[_HAPAccessoryServerBTLE200 setPairingDisconnectionError:](self, "setPairingDisconnectionError:", v3);
  v4 = -[_HAPAccessoryServerBTLE200 connectionState](self, "connectionState");
  v5 = (void *)MEMORY[0x1D17B7244]();
  v6 = self;
  HMFGetOSLogHandle();
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = os_log_type_enabled(v7, OS_LOG_TYPE_INFO);
  if (v4 == 1)
  {
    if (v8)
    {
      HMFGetLogIdentifier();
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[HAPAccessoryServerBTLE peripheral](v6, "peripheral");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = 138543618;
      v17 = v9;
      v18 = 2112;
      v19 = v10;
      _os_log_impl(&dword_1CCE01000, v7, OS_LOG_TYPE_INFO, "%{public}@The connection idle timer fired, cancelling connection to the peripheral: %@", (uint8_t *)&v16, 0x16u);

    }
    objc_autoreleasePoolPop(v5);
    objc_msgSend(MEMORY[0x1E0CB35C8], "hapErrorWithCode:description:reason:suggestion:underlyingError:", 8, CFSTR("Connection Failed"), CFSTR("Connection request timed out"), 0, v3);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[_HAPAccessoryServerBTLE200 _cancelConnectionWithError:](v6, "_cancelConnectionWithError:", v11);

  }
  else
  {
    if (v8)
    {
      HMFGetLogIdentifier();
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = (void *)MEMORY[0x1E0CB37E8];
      -[_HAPAccessoryServerBTLE200 requestOperationQueue](v6, "requestOperationQueue");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "numberWithUnsignedInteger:", objc_msgSend(v14, "operationCount"));
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = 138543618;
      v17 = v12;
      v18 = 2112;
      v19 = v15;
      _os_log_impl(&dword_1CCE01000, v7, OS_LOG_TYPE_INFO, "%{public}@The connection idle timer fired, pending requests: %@", (uint8_t *)&v16, 0x16u);

    }
    objc_autoreleasePoolPop(v5);
    -[_HAPAccessoryServerBTLE200 _disconnectWithDisconnectionError:completionHandler:](v6, "_disconnectWithDisconnectionError:completionHandler:", v3, 0);
  }

}

- (BOOL)isBLELinkConnected
{
  return -[_HAPAccessoryServerBTLE200 connectionState](self, "connectionState") == 2;
}

- (BOOL)doesPeriodicSessionChecks
{
  return 1;
}

- (unint64_t)sessionCheckInterval
{
  return 0;
}

- (unint64_t)numActiveSessionClients
{
  return 0;
}

- (void)generateBroadcastKey:(unsigned __int8)a3 queue:(id)a4 withCompletionHandler:(id)a5
{
  id v8;
  id v9;
  NSObject *v10;
  id v11;
  id v12;
  _QWORD v13[5];
  id v14;
  id v15;
  unsigned __int8 v16;

  v8 = a4;
  v9 = a5;
  -[HAPAccessoryServer clientQueue](self, "clientQueue");
  v10 = objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __79___HAPAccessoryServerBTLE200_generateBroadcastKey_queue_withCompletionHandler___block_invoke;
  v13[3] = &unk_1E894CF58;
  v13[4] = self;
  v14 = v8;
  v15 = v9;
  v16 = a3;
  v11 = v9;
  v12 = v8;
  dispatch_async(v10, v13);

}

- (void)_generateBroadcastKey:(unsigned __int8)a3 queue:(id)a4 withCompletionHandler:(id)a5
{
  uint64_t v6;
  id v8;
  id v9;
  void *v10;
  id v11;
  id v12;
  _QWORD v13[4];
  id v14;
  id v15;
  id v16;
  char v17;
  id location;

  v6 = a3;
  v8 = a4;
  v9 = a5;
  -[_HAPAccessoryServerBTLE200 _getProtocolInfoService](self, "_getProtocolInfoService");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_initWeak(&location, self);
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __80___HAPAccessoryServerBTLE200__generateBroadcastKey_queue_withCompletionHandler___block_invoke;
  v13[3] = &unk_1E894B030;
  objc_copyWeak(&v16, &location);
  v17 = v6;
  v11 = v8;
  v14 = v11;
  v12 = v9;
  v15 = v12;
  -[_HAPAccessoryServerBTLE200 _configureBroadcastKeyGeneration:service:withCompletion:](self, "_configureBroadcastKeyGeneration:service:withCompletion:", v6, v10, v13);

  objc_destroyWeak(&v16);
  objc_destroyWeak(&location);

}

- (BOOL)_validateGeneratedBroadcastKey:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  int v7;
  id v8;
  id v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  char v14;
  BOOL v15;
  void *v16;
  _HAPAccessoryServerBTLE200 *v17;
  NSObject *v18;
  void *v19;
  void *v20;
  _HAPAccessoryServerBTLE200 *v21;
  NSObject *v22;
  void *v23;
  void *v24;
  void *v25;
  id v27;
  id v28;
  id v29;
  id v30;
  id v31;
  uint8_t buf[4];
  void *v33;
  __int16 v34;
  id v35;
  __int16 v36;
  id v37;
  __int16 v38;
  void *v39;
  __int16 v40;
  id v41;
  __int16 v42;
  id v43;
  uint64_t v44;

  v44 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (v4)
  {
    -[HAPAccessoryServer keyStore](self, "keyStore");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = 0;
    v31 = 0;
    v29 = 0;
    -[HAPAccessoryServer identifier](self, "identifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = 0;
    v7 = objc_msgSend(v5, "getControllerPublicKey:secretKey:username:allowCreation:forAccessory:error:", &v31, &v30, &v29, 0, v6, &v28);
    v8 = v31;
    v9 = v30;
    v10 = v29;
    v11 = v28;

    if (v7)
    {
      -[_HAPAccessoryServerBTLE200 securitySession](self, "securitySession");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "broadcastKey");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = objc_msgSend(v13, "isEqualToData:", v4);

      if ((v14 & 1) != 0)
      {
        v15 = 1;
LABEL_12:

        goto LABEL_13;
      }
      v16 = (void *)MEMORY[0x1D17B7244]();
      v17 = self;
      HMFGetOSLogHandle();
      v18 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v33 = v19;
        _os_log_impl(&dword_1CCE01000, v18, OS_LOG_TYPE_ERROR, "%{public}@Generated Broadcast key does not match", buf, 0xCu);

      }
      objc_autoreleasePoolPop(v16);
    }
    v20 = (void *)MEMORY[0x1D17B7244]();
    v21 = self;
    HMFGetOSLogHandle();
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
    {
      HMFGetLogIdentifier();
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      -[_HAPAccessoryServerBTLE200 securitySession](v21, "securitySession");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "broadcastKey");
      v27 = v9;
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544642;
      v33 = v23;
      v34 = 2112;
      v35 = v8;
      v36 = 2112;
      v37 = v10;
      v38 = 2112;
      v39 = v25;
      v40 = 2112;
      v41 = v4;
      v42 = 2112;
      v43 = v11;
      _os_log_impl(&dword_1CCE01000, v22, OS_LOG_TYPE_DEBUG, "%{public}@Controller Public Key: %@, Controller Identifier: %@, \n\tGenerated Broadcast Key: %@, \n\tAccessory Broadcast Key: %@. Error: %@", buf, 0x3Eu);

      v9 = v27;
    }

    objc_autoreleasePoolPop(v20);
    v15 = 0;
    goto LABEL_12;
  }
  v15 = 0;
LABEL_13:

  return v15;
}

- (void)_notifyDelegateOfReceivedEncryptedAuthenticatedData:(id)a3 forCharacteristic:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  char v10;
  NSObject *v11;
  _QWORD block[5];
  id v13;
  id v14;

  v6 = a3;
  v7 = a4;
  -[HAPAccessoryServer delegate](self, "delegate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v8, "conformsToProtocol:", &unk_1EFA51DA8) & 1) != 0)
  {
    -[HAPAccessoryServer delegate](self, "delegate");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_opt_respondsToSelector();

    if ((v10 & 1) != 0)
    {
      -[HAPAccessoryServer delegateQueue](self, "delegateQueue");
      v11 = objc_claimAutoreleasedReturnValue();
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __100___HAPAccessoryServerBTLE200__notifyDelegateOfReceivedEncryptedAuthenticatedData_forCharacteristic___block_invoke;
      block[3] = &unk_1E894E120;
      block[4] = self;
      v13 = v6;
      v14 = v7;
      dispatch_async(v11, block);

    }
  }
  else
  {

  }
}

- (void)_notifyDelegateOfReceivedPlaintextData:(id)a3 forCharacteristic:(id)a4
{
  id v6;
  id v7;
  void *v8;
  _BOOL4 v9;
  NSObject *v10;
  _QWORD block[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  -[HAPAccessoryServer delegate](self, "delegate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v8, "conformsToProtocol:", &unk_1EFA51DA8))
  {
    v9 = -[_HAPAccessoryServerBTLE200 _delegateRespondsToSelector:](self, "_delegateRespondsToSelector:", sel_accessoryServerBTLE_didReceivePlaintextPayload_forCharacteristic_);

    if (v9)
    {
      -[HAPAccessoryServer delegateQueue](self, "delegateQueue");
      v10 = objc_claimAutoreleasedReturnValue();
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __87___HAPAccessoryServerBTLE200__notifyDelegateOfReceivedPlaintextData_forCharacteristic___block_invoke;
      block[3] = &unk_1E894E120;
      block[4] = self;
      v12 = v6;
      v13 = v7;
      dispatch_async(v10, block);

    }
  }
  else
  {

  }
}

- (void)_notifyDelegateOfSentEncryptedAuthenticatedData:(id)a3 forCharacteristic:(id)a4
{
  id v6;
  id v7;
  void *v8;
  _BOOL4 v9;
  NSObject *v10;
  _QWORD block[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  -[HAPAccessoryServer delegate](self, "delegate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v8, "conformsToProtocol:", &unk_1EFA51DA8))
  {
    v9 = -[_HAPAccessoryServerBTLE200 _delegateRespondsToSelector:](self, "_delegateRespondsToSelector:", sel_accessoryServerBTLE_willSendEncryptedAndAuthenticatedPayload_forCharacteristic_);

    if (v9)
    {
      -[HAPAccessoryServer delegateQueue](self, "delegateQueue");
      v10 = objc_claimAutoreleasedReturnValue();
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __96___HAPAccessoryServerBTLE200__notifyDelegateOfSentEncryptedAuthenticatedData_forCharacteristic___block_invoke;
      block[3] = &unk_1E894E120;
      block[4] = self;
      v12 = v6;
      v13 = v7;
      dispatch_async(v10, block);

    }
  }
  else
  {

  }
}

- (void)_notifyDelegateOfSentPlaintextData:(id)a3 forCharacteristic:(id)a4
{
  id v6;
  id v7;
  void *v8;
  _BOOL4 v9;
  NSObject *v10;
  _QWORD block[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  -[HAPAccessoryServer delegate](self, "delegate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v8, "conformsToProtocol:", &unk_1EFA51DA8))
  {
    v9 = -[_HAPAccessoryServerBTLE200 _delegateRespondsToSelector:](self, "_delegateRespondsToSelector:", sel_accessoryServerBTLE_willSendPlaintextPayload_forCharacteristic_);

    if (v9)
    {
      -[HAPAccessoryServer delegateQueue](self, "delegateQueue");
      v10 = objc_claimAutoreleasedReturnValue();
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __83___HAPAccessoryServerBTLE200__notifyDelegateOfSentPlaintextData_forCharacteristic___block_invoke;
      block[3] = &unk_1E894E120;
      block[4] = self;
      v12 = v6;
      v13 = v7;
      dispatch_async(v10, block);

    }
  }
  else
  {

  }
}

- (void)peripheral:(id)a3 didDiscoverServices:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  _HAPAccessoryServerBTLE200 *v11;
  NSObject *v12;
  void *v13;
  NSObject *v14;
  id v15;
  id v16;
  id v17;
  _QWORD v18[4];
  id v19;
  _HAPAccessoryServerBTLE200 *v20;
  id v21;
  id v22;
  uint8_t buf[4];
  void *v24;
  __int16 v25;
  void *v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  objc_msgSend(v6, "services");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v8, "copy");

  v10 = (void *)MEMORY[0x1D17B7244]();
  v11 = self;
  HMFGetOSLogHandle();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
  {
    HMFGetLogIdentifier();
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v24 = v13;
    v25 = 2112;
    v26 = v9;
    _os_log_impl(&dword_1CCE01000, v12, OS_LOG_TYPE_DEBUG, "%{public}@Discovered CB services: %@", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v10);
  -[HAPAccessoryServer clientQueue](v11, "clientQueue");
  v14 = objc_claimAutoreleasedReturnValue();
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __61___HAPAccessoryServerBTLE200_peripheral_didDiscoverServices___block_invoke;
  v18[3] = &unk_1E894DA30;
  v19 = v6;
  v20 = v11;
  v21 = v9;
  v22 = v7;
  v15 = v7;
  v16 = v9;
  v17 = v6;
  dispatch_async(v14, v18);

}

- (void)peripheral:(id)a3 didModifyServices:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  id v9;
  id v10;
  _QWORD block[4];
  id v12;
  id v13;
  _HAPAccessoryServerBTLE200 *v14;

  v6 = a3;
  v7 = a4;
  -[HAPAccessoryServer clientQueue](self, "clientQueue");
  v8 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __59___HAPAccessoryServerBTLE200_peripheral_didModifyServices___block_invoke;
  block[3] = &unk_1E894E120;
  v12 = v6;
  v13 = v7;
  v14 = self;
  v9 = v7;
  v10 = v6;
  dispatch_async(v8, block);

}

- (void)peripheral:(id)a3 didDiscoverCharacteristicsForService:(id)a4 error:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  id v12;
  id v13;
  id v14;
  _QWORD v15[4];
  id v16;
  _HAPAccessoryServerBTLE200 *v17;
  id v18;
  id v19;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  -[HAPAccessoryServer clientQueue](self, "clientQueue");
  v11 = objc_claimAutoreleasedReturnValue();
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __84___HAPAccessoryServerBTLE200_peripheral_didDiscoverCharacteristicsForService_error___block_invoke;
  v15[3] = &unk_1E894DA30;
  v16 = v8;
  v17 = self;
  v18 = v9;
  v19 = v10;
  v12 = v10;
  v13 = v9;
  v14 = v8;
  dispatch_async(v11, v15);

}

- (void)peripheral:(id)a3 didDiscoverDescriptorsForCharacteristic:(id)a4 error:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  id v12;
  id v13;
  id v14;
  _QWORD v15[4];
  id v16;
  _HAPAccessoryServerBTLE200 *v17;
  id v18;
  id v19;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  -[HAPAccessoryServer clientQueue](self, "clientQueue");
  v11 = objc_claimAutoreleasedReturnValue();
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __87___HAPAccessoryServerBTLE200_peripheral_didDiscoverDescriptorsForCharacteristic_error___block_invoke;
  v15[3] = &unk_1E894DA30;
  v16 = v8;
  v17 = self;
  v18 = v9;
  v19 = v10;
  v12 = v10;
  v13 = v9;
  v14 = v8;
  dispatch_async(v11, v15);

}

- (void)peripheral:(id)a3 didUpdateValueForDescriptor:(id)a4 error:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  id v12;
  id v13;
  id v14;
  _QWORD v15[4];
  id v16;
  _HAPAccessoryServerBTLE200 *v17;
  id v18;
  id v19;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  -[HAPAccessoryServer clientQueue](self, "clientQueue");
  v11 = objc_claimAutoreleasedReturnValue();
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __75___HAPAccessoryServerBTLE200_peripheral_didUpdateValueForDescriptor_error___block_invoke;
  v15[3] = &unk_1E894DA30;
  v16 = v8;
  v17 = self;
  v18 = v9;
  v19 = v10;
  v12 = v10;
  v13 = v9;
  v14 = v8;
  dispatch_async(v11, v15);

}

- (void)peripheral:(id)a3 didUpdateValueForCharacteristic:(id)a4 error:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  id v12;
  id v13;
  id v14;
  _QWORD v15[4];
  id v16;
  _HAPAccessoryServerBTLE200 *v17;
  id v18;
  id v19;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  -[HAPAccessoryServer clientQueue](self, "clientQueue");
  v11 = objc_claimAutoreleasedReturnValue();
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __79___HAPAccessoryServerBTLE200_peripheral_didUpdateValueForCharacteristic_error___block_invoke;
  v15[3] = &unk_1E894DA30;
  v16 = v8;
  v17 = self;
  v18 = v9;
  v19 = v10;
  v12 = v10;
  v13 = v9;
  v14 = v8;
  dispatch_async(v11, v15);

}

- (void)peripheral:(id)a3 didWriteValueForCharacteristic:(id)a4 error:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  id v12;
  id v13;
  id v14;
  _QWORD v15[4];
  id v16;
  _HAPAccessoryServerBTLE200 *v17;
  id v18;
  id v19;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  -[HAPAccessoryServer clientQueue](self, "clientQueue");
  v11 = objc_claimAutoreleasedReturnValue();
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __78___HAPAccessoryServerBTLE200_peripheral_didWriteValueForCharacteristic_error___block_invoke;
  v15[3] = &unk_1E894DA30;
  v16 = v8;
  v17 = self;
  v18 = v9;
  v19 = v10;
  v12 = v10;
  v13 = v9;
  v14 = v8;
  dispatch_async(v11, v15);

}

- (void)peripheral:(id)a3 didUpdateNotificationStateForCharacteristic:(id)a4 error:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  id v12;
  id v13;
  id v14;
  _QWORD v15[4];
  id v16;
  _HAPAccessoryServerBTLE200 *v17;
  id v18;
  id v19;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  -[HAPAccessoryServer clientQueue](self, "clientQueue");
  v11 = objc_claimAutoreleasedReturnValue();
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __91___HAPAccessoryServerBTLE200_peripheral_didUpdateNotificationStateForCharacteristic_error___block_invoke;
  v15[3] = &unk_1E894DA30;
  v16 = v8;
  v17 = self;
  v18 = v9;
  v19 = v10;
  v12 = v10;
  v13 = v9;
  v14 = v8;
  dispatch_async(v11, v15);

}

- (void)controlOutputStream:(id)a3 didReceiveRequestToSendControlPacket:(id)a4 completionHandler:(id)a5
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
  -[HAPAccessoryServer clientQueue](self, "clientQueue");
  v11 = objc_claimAutoreleasedReturnValue();
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __105___HAPAccessoryServerBTLE200_controlOutputStream_didReceiveRequestToSendControlPacket_completionHandler___block_invoke;
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

- (void)controlOutputStream:(id)a3 didCloseWithError:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  -[HAPAccessoryServer clientQueue](self, "clientQueue");
  v8 = objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __68___HAPAccessoryServerBTLE200_controlOutputStream_didCloseWithError___block_invoke;
  v11[3] = &unk_1E894E0F8;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(v8, v11);

}

- (void)controlOutputStreamDidComplete:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD block[4];
  id v8;

  v4 = a3;
  -[HAPAccessoryServer clientQueue](self, "clientQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __61___HAPAccessoryServerBTLE200_controlOutputStreamDidComplete___block_invoke;
  block[3] = &unk_1E894DD08;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, block);

}

- (void)pairSetupSession:(id)a3 didReceiveSetupExchangeData:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  id v9;
  id v10;
  _QWORD block[4];
  id v12;
  _HAPAccessoryServerBTLE200 *v13;
  id v14;

  v6 = a3;
  v7 = a4;
  -[HAPAccessoryServer clientQueue](self, "clientQueue");
  v8 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __75___HAPAccessoryServerBTLE200_pairSetupSession_didReceiveSetupExchangeData___block_invoke;
  block[3] = &unk_1E894E120;
  v12 = v6;
  v13 = self;
  v14 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(v8, block);

}

- (id)pairSetupSession:(id)a3 didReceiveLocalPairingIdentityRequestWithError:(id *)a4
{
  id v6;
  void *v7;
  _HAPAccessoryServerBTLE200 *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v16;
  int v17;
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = (void *)MEMORY[0x1D17B7244]();
  v8 = self;
  HMFGetOSLogHandle();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = 138543362;
    v18 = v10;
    _os_log_impl(&dword_1CCE01000, v9, OS_LOG_TYPE_INFO, "%{public}@Request for local pairing identity", (uint8_t *)&v17, 0xCu);

  }
  objc_autoreleasePoolPop(v7);
  -[HAPAccessoryServer pairingRequest](v8, "pairingRequest");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "pairingIdentity");
  v12 = objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    v13 = (void *)v12;
  }
  else
  {
    -[HAPAccessoryServer keyBag](v8, "keyBag");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "currentIdentity");
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    if (v13)
      goto LABEL_7;
    -[HAPAccessoryServer keyStore](v8, "keyStore");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[HAPAccessoryServer identifier](v8, "identifier");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "readControllerPairingKeyForAccessory:error:", v16, a4);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

  }
LABEL_7:

  return v13;
}

- (BOOL)pairSetupSession:(id)a3 didPairWithPeer:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  void *v10;
  _HAPAccessoryServerBTLE200 *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  void *v15;
  char v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  char v21;
  id v22;
  BOOL v23;
  id v24;
  void *v25;
  _HAPAccessoryServerBTLE200 *v26;
  NSObject *v27;
  void *v28;
  void *v29;
  _HAPAccessoryServerBTLE200 *v30;
  NSObject *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  _HAPAccessoryServerBTLE200 *v36;
  NSObject *v37;
  void *v38;
  void *v40;
  id v41;
  id v42;
  uint8_t buf[4];
  void *v44;
  __int16 v45;
  id v46;
  __int16 v47;
  void *v48;
  uint64_t v49;

  v49 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = (void *)MEMORY[0x1D17B7244]();
  v11 = self;
  HMFGetOSLogHandle();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
  {
    HMFGetLogIdentifier();
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v44 = v13;
    v45 = 2112;
    v46 = v9;
    _os_log_impl(&dword_1CCE01000, v12, OS_LOG_TYPE_DEBUG, "%{public}@Request to save pairing peer: %@", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v10);
  objc_msgSend(v9, "identifier");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[HAPAccessoryServer identifier](v11, "identifier");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v14, "isEqualToString:", v15);

  if ((v16 & 1) != 0)
  {
    objc_msgSend(v9, "publicKey");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "data");
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    -[HAPAccessoryServer keyStore](v11, "keyStore");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "identifier");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v42 = 0;
    v21 = objc_msgSend(v19, "savePublicKey:forAccessoryName:error:", v18, v20, &v42);
    v22 = v42;

    if ((v21 & 1) != 0)
    {
      -[HAPAccessoryServer associateAccessoryWithControllerKeyUsingAccessoryPublicKey:](v11, "associateAccessoryWithControllerKeyUsingAccessoryPublicKey:", v18);
      v41 = 0;
      v23 = -[HAPAccessoryServerBTLE updatePeripheralIdentifier:isPairing:](v11, "updatePeripheralIdentifier:isPairing:", &v41, 1);
      v24 = v41;
      if (!v23)
      {
        v25 = (void *)MEMORY[0x1D17B7244]();
        v26 = v11;
        HMFGetOSLogHandle();
        v27 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
        {
          HMFGetLogIdentifier();
          v40 = v25;
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543618;
          v44 = v28;
          v45 = 2112;
          v46 = v24;
          _os_log_impl(&dword_1CCE01000, v27, OS_LOG_TYPE_ERROR, "%{public}@Failed to update the accessory's peripheral identifier with error: %@", buf, 0x16u);

          v25 = v40;
        }

        objc_autoreleasePoolPop(v25);
        if (a5)
          *a5 = objc_retainAutorelease(v24);
      }

    }
    else
    {
      v35 = (void *)MEMORY[0x1D17B7244]();
      v36 = v11;
      HMFGetOSLogHandle();
      v37 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v44 = v38;
        v45 = 2112;
        v46 = v22;
        _os_log_impl(&dword_1CCE01000, v37, OS_LOG_TYPE_ERROR, "%{public}@Failed to save accessory's identifier and public key to the keystore with error: %@", buf, 0x16u);

      }
      objc_autoreleasePoolPop(v35);
      v23 = 0;
      if (a5)
        *a5 = objc_retainAutorelease(v22);
    }

  }
  else
  {
    v29 = (void *)MEMORY[0x1D17B7244]();
    v30 = v11;
    HMFGetOSLogHandle();
    v31 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "identifier");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      -[HAPAccessoryServer identifier](v30, "identifier");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v44 = v32;
      v45 = 2112;
      v46 = v33;
      v47 = 2112;
      v48 = v34;
      _os_log_impl(&dword_1CCE01000, v31, OS_LOG_TYPE_ERROR, "%{public}@The peer's identifier exchanged during Pair Setup, %@, does not match the identifier from the accessory's advertisement, %@", buf, 0x20u);

    }
    objc_autoreleasePoolPop(v29);
    if (a5)
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "hapErrorWithCode:description:reason:suggestion:underlyingError:", 7, CFSTR("Pairing failed."), CFSTR("The peer's identifier does not match it's advertised identifier"), 0, 0);
      v23 = 0;
      *a5 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v23 = 0;
    }
  }

  return v23;
}

- (void)pairSetupSession:(id)a3 didStopWithError:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  id v9;
  id v10;
  _QWORD block[4];
  id v12;
  _HAPAccessoryServerBTLE200 *v13;
  id v14;

  v6 = a3;
  v7 = a4;
  -[HAPAccessoryServer clientQueue](self, "clientQueue");
  v8 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __64___HAPAccessoryServerBTLE200_pairSetupSession_didStopWithError___block_invoke;
  block[3] = &unk_1E894E120;
  v12 = v6;
  v13 = self;
  v14 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(v8, block);

}

- (void)pairSetupSession:(id)a3 didReceiveProductData:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  id v9;
  id v10;
  _QWORD block[4];
  id v12;
  _HAPAccessoryServerBTLE200 *v13;
  id v14;

  v6 = a3;
  v7 = a4;
  -[HAPAccessoryServer clientQueue](self, "clientQueue");
  v8 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __69___HAPAccessoryServerBTLE200_pairSetupSession_didReceiveProductData___block_invoke;
  block[3] = &unk_1E894E120;
  v12 = v6;
  v13 = self;
  v14 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(v8, block);

}

- (void)pairSetupSession:(id)a3 didReceiveSetupCodeRequestWithCompletionHandler:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  id v9;
  id v10;
  _QWORD block[4];
  id v12;
  _HAPAccessoryServerBTLE200 *v13;
  id v14;

  v6 = a3;
  v7 = a4;
  -[HAPAccessoryServer clientQueue](self, "clientQueue");
  v8 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __95___HAPAccessoryServerBTLE200_pairSetupSession_didReceiveSetupCodeRequestWithCompletionHandler___block_invoke;
  block[3] = &unk_1E894D9E8;
  v12 = v6;
  v13 = self;
  v14 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(v8, block);

}

- (void)pairSetupSessionDidReceiveInvalidSetupCode:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[4];
  id v8;
  _HAPAccessoryServerBTLE200 *v9;

  v4 = a3;
  -[HAPAccessoryServer clientQueue](self, "clientQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __73___HAPAccessoryServerBTLE200_pairSetupSessionDidReceiveInvalidSetupCode___block_invoke;
  v7[3] = &unk_1E894E0F8;
  v8 = v4;
  v9 = self;
  v6 = v4;
  dispatch_async(v5, v7);

}

- (BOOL)pairSetupSession:(id)a3 didReceiveBackoffRequestWithTimeInterval:(double)a4
{
  id v6;
  NSObject *v7;
  id v8;
  _QWORD block[4];
  id v11;
  _HAPAccessoryServerBTLE200 *v12;
  double v13;

  v6 = a3;
  -[HAPAccessoryServer clientQueue](self, "clientQueue");
  v7 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __88___HAPAccessoryServerBTLE200_pairSetupSession_didReceiveBackoffRequestWithTimeInterval___block_invoke;
  block[3] = &unk_1E894B6C0;
  v11 = v6;
  v12 = self;
  v13 = a4;
  v8 = v6;
  dispatch_async(v7, block);

  return 0;
}

- (void)getAccessoryInfo:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD block[5];
  id v8;
  _QWORD *v9;
  _QWORD v10[3];
  char v11;

  v4 = a3;
  v10[0] = 0;
  v10[1] = v10;
  v10[2] = 0x2020000000;
  v11 = 0;
  -[HAPAccessoryServer clientQueue](self, "clientQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __47___HAPAccessoryServerBTLE200_getAccessoryInfo___block_invoke;
  block[3] = &unk_1E894D188;
  v8 = v4;
  v9 = v10;
  block[4] = self;
  v6 = v4;
  dispatch_async(v5, block);

  _Block_object_dispose(v10, 8);
}

- (BOOL)_validateProtocolInfo:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  int v7;
  void *v8;
  int v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  BOOL v14;
  void *v15;
  _HAPAccessoryServerBTLE200 *v16;
  NSObject *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  int v24;
  void *v25;
  __int16 v26;
  id v27;
  __int16 v28;
  void *v29;
  __int16 v30;
  void *v31;
  __int16 v32;
  uint64_t v33;
  __int16 v34;
  void *v35;
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "deviceIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HAPAccessoryServer identifier](self, "identifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v5, "isEqualToString:", v6))
    goto LABEL_7;
  v7 = objc_msgSend(v4, "categoryIdentifier");
  -[HAPAccessoryServer category](self, "category");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7 != objc_msgSend(v8, "unsignedShortValue")
    || (v9 = objc_msgSend(v4, "featureFlags"), v9 != -[_HAPAccessoryServerBTLE200 featureFlags](self, "featureFlags")))
  {

LABEL_7:
    goto LABEL_8;
  }
  objc_msgSend(v4, "protocolVersion");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "majorVersion");
  -[HAPAccessoryServer version](self, "version");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "majorVersion");

  if (v11 == v13)
  {
    v14 = 1;
    goto LABEL_11;
  }
LABEL_8:
  v15 = (void *)MEMORY[0x1D17B7244]();
  v16 = self;
  HMFGetOSLogHandle();
  v17 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
  {
    HMFGetLogIdentifier();
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[HAPAccessoryServer identifier](v16, "identifier");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[HAPAccessoryServer category](v16, "category");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = -[HAPAccessoryServer authMethod](v16, "authMethod");
    -[HAPAccessoryServer version](v16, "version");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = 138544642;
    v25 = v18;
    v26 = 2112;
    v27 = v4;
    v28 = 2112;
    v29 = v19;
    v30 = 2112;
    v31 = v20;
    v32 = 2048;
    v33 = v21;
    v34 = 2112;
    v35 = v22;
    _os_log_impl(&dword_1CCE01000, v17, OS_LOG_TYPE_DEBUG, "%{public}@Authenticated Info %@ does not match: identifier: %@, category: %@, authMethods: %tu version: %@", (uint8_t *)&v24, 0x3Eu);

  }
  objc_autoreleasePoolPop(v15);
  v14 = 0;
LABEL_11:

  return v14;
}

- (void)authenticateAccessory
{
  NSObject *v3;
  _QWORD block[5];

  -[HAPAccessoryServer clientQueue](self, "clientQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __51___HAPAccessoryServerBTLE200_authenticateAccessory__block_invoke;
  block[3] = &unk_1E894DD08;
  block[4] = self;
  dispatch_async(v3, block);

}

- (void)continueAuthAfterValidation:(BOOL)a3
{
  void *v5;
  _HAPAccessoryServerBTLE200 *v6;
  NSObject *v7;
  void *v8;
  unint64_t v9;
  __CFString *v10;
  __CFString *v11;
  NSObject *v12;
  _QWORD v13[5];
  BOOL v14;
  uint8_t buf[4];
  void *v16;
  __int16 v17;
  __CFString *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v5 = (void *)MEMORY[0x1D17B7244](self, a2);
  v6 = self;
  HMFGetOSLogHandle();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    HMFGetLogIdentifier();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = -[HAPAccessoryServer authMethod](v6, "authMethod");
    if (v9 > 6)
      v10 = CFSTR("HAPAuthMethodUnknown");
    else
      v10 = off_1E8948F80[v9];
    v11 = v10;
    *(_DWORD *)buf = 138543618;
    v16 = v8;
    v17 = 2112;
    v18 = v11;
    _os_log_impl(&dword_1CCE01000, v7, OS_LOG_TYPE_DEBUG, "%{public}@Current Auth Method %@", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v5);
  -[HAPAccessoryServer clientQueue](v6, "clientQueue");
  v12 = objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __58___HAPAccessoryServerBTLE200_continueAuthAfterValidation___block_invoke;
  v13[3] = &unk_1E894D770;
  v13[4] = v6;
  v14 = a3;
  dispatch_async(v12, v13);

}

- (void)provisionToken:(id)a3
{
  id v4;
  void *v5;
  _HAPAccessoryServerBTLE200 *v6;
  NSObject *v7;
  void *v8;
  NSObject *v9;
  id v10;
  _QWORD v11[5];
  id v12;
  uint8_t buf[4];
  void *v14;
  __int16 v15;
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = (void *)MEMORY[0x1D17B7244]();
  v6 = self;
  HMFGetOSLogHandle();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    HMFGetLogIdentifier();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v14 = v8;
    v15 = 2112;
    v16 = v4;
    _os_log_impl(&dword_1CCE01000, v7, OS_LOG_TYPE_DEBUG, "%{public}@Provisioning Tokens T1: %@", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v5);
  -[HAPAccessoryServer clientQueue](v6, "clientQueue");
  v9 = objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __45___HAPAccessoryServerBTLE200_provisionToken___block_invoke;
  v11[3] = &unk_1E894E0F8;
  v11[4] = v6;
  v12 = v4;
  v10 = v4;
  dispatch_async(v9, v11);

}

- (void)tearDownSessionOnAuthCompletion
{
  NSObject *v3;
  _QWORD block[5];

  -[HAPAccessoryServer clientQueue](self, "clientQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __61___HAPAccessoryServerBTLE200_tearDownSessionOnAuthCompletion__block_invoke;
  block[3] = &unk_1E894DD08;
  block[4] = self;
  dispatch_async(v3, block);

}

- (void)_continuePairingAfterMFiCertValidation
{
  -[_HAPAccessoryServerBTLE200 tearDownSessionOnAuthCompletion](self, "tearDownSessionOnAuthCompletion");
  -[_HAPAccessoryServerBTLE200 setPairing:](self, "setPairing:", 0);
  -[_HAPAccessoryServerBTLE200 setBadPairSetupCode:](self, "setBadPairSetupCode:", 0);
  -[_HAPAccessoryServerBTLE200 setPairSetupBackoffTimeInterval:](self, "setPairSetupBackoffTimeInterval:", 0.0);
  -[_HAPAccessoryServerBTLE200 setPairSetupSession:](self, "setPairSetupSession:", 0);
  -[_HAPAccessoryServerBTLE200 _notifyDelegatesPairingStopped:](self, "_notifyDelegatesPairingStopped:", 0);
}

- (void)_notifyDelegatesPairingStopped:(id)a3
{
  id v4;
  NSObject *v5;
  _QWORD v6[4];
  id v7;
  _HAPAccessoryServerBTLE200 *v8;

  v4 = a3;
  if (-[_HAPAccessoryServerBTLE200 _delegateRespondsToSelector:](self, "_delegateRespondsToSelector:", sel_accessoryServer_didStopPairingWithError_))
  {
    -[HAPAccessoryServer delegateQueue](self, "delegateQueue");
    v5 = objc_claimAutoreleasedReturnValue();
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __61___HAPAccessoryServerBTLE200__notifyDelegatesPairingStopped___block_invoke;
    v6[3] = &unk_1E894E0F8;
    v7 = v4;
    v8 = self;
    dispatch_async(v5, v6);

  }
}

- (void)_notifyDelegatesOfConnectionState:(BOOL)a3 withError:(id)a4
{
  id v6;
  NSObject *v7;
  _QWORD block[5];
  id v9;
  BOOL v10;

  v6 = a4;
  if (-[_HAPAccessoryServerBTLE200 _delegateRespondsToSelector:](self, "_delegateRespondsToSelector:", sel_accessoryServer_didUpdateConnectionState_linkLayerType_withError_))
  {
    -[HAPAccessoryServer delegateQueue](self, "delegateQueue");
    v7 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __74___HAPAccessoryServerBTLE200__notifyDelegatesOfConnectionState_withError___block_invoke;
    block[3] = &unk_1E894C050;
    block[4] = self;
    v10 = a3;
    v9 = v6;
    dispatch_async(v7, block);

  }
}

- (void)authSession:(id)a3 sendAuthExchangeData:(id)a4
{
  id v5;
  NSObject *v6;
  id v7;
  _QWORD v8[5];
  id v9;

  v5 = a4;
  -[HAPAccessoryServer clientQueue](self, "clientQueue");
  v6 = objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __63___HAPAccessoryServerBTLE200_authSession_sendAuthExchangeData___block_invoke;
  v8[3] = &unk_1E894E0F8;
  v8[4] = self;
  v9 = v5;
  v7 = v5;
  dispatch_async(v6, v8);

}

- (void)authSession:(id)a3 validateUUID:(id)a4 token:(id)a5
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
  -[HAPAccessoryServer clientQueue](self, "clientQueue");
  v11 = objc_claimAutoreleasedReturnValue();
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __61___HAPAccessoryServerBTLE200_authSession_validateUUID_token___block_invoke;
  v15[3] = &unk_1E894DA30;
  v15[4] = self;
  v16 = v9;
  v17 = v10;
  v18 = v8;
  v12 = v8;
  v13 = v10;
  v14 = v9;
  dispatch_async(v11, v15);

}

- (void)authSession:(id)a3 authenticateUUID:(id)a4 token:(id)a5
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
  -[HAPAccessoryServer clientQueue](self, "clientQueue");
  v11 = objc_claimAutoreleasedReturnValue();
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __65___HAPAccessoryServerBTLE200_authSession_authenticateUUID_token___block_invoke;
  v15[3] = &unk_1E894DA30;
  v15[4] = self;
  v16 = v9;
  v17 = v10;
  v18 = v8;
  v12 = v8;
  v13 = v10;
  v14 = v9;
  dispatch_async(v11, v15);

}

- (void)authSession:(id)a3 confirmUUID:(id)a4 token:(id)a5
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
  -[HAPAccessoryServer clientQueue](self, "clientQueue");
  v11 = objc_claimAutoreleasedReturnValue();
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __60___HAPAccessoryServerBTLE200_authSession_confirmUUID_token___block_invoke;
  v15[3] = &unk_1E894DA30;
  v15[4] = self;
  v16 = v9;
  v17 = v10;
  v18 = v8;
  v12 = v8;
  v13 = v10;
  v14 = v9;
  dispatch_async(v11, v15);

}

- (void)authSession:(id)a3 authComplete:(id)a4
{
  id v5;
  NSObject *v6;
  id v7;
  _QWORD v8[5];
  id v9;

  v5 = a4;
  -[HAPAccessoryServer clientQueue](self, "clientQueue");
  v6 = objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __55___HAPAccessoryServerBTLE200_authSession_authComplete___block_invoke;
  v8[3] = &unk_1E894E0F8;
  v8[4] = self;
  v9 = v5;
  v7 = v5;
  dispatch_async(v6, v8);

}

- (void)submitPairVerifyMetricWithError:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  objc_super v11;

  v4 = a3;
  -[HAPAccessoryServer metric_pairVerifyReason](self, "metric_pairVerifyReason");
  v5 = objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v6 = (void *)v5;
    -[_HAPAccessoryServerBTLE200 securitySession](self, "securitySession");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "sessionStartTime");

    if (v8)
    {
      mach_absolute_time();
      v9 = UpTicksToMilliseconds();
      -[_HAPAccessoryServerBTLE200 securitySession](self, "securitySession");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[HAPAccessoryServer setMetric_pairVerifyDurationInMS:](self, "setMetric_pairVerifyDurationInMS:", v9 - objc_msgSend(v10, "sessionStartTime"));

      v11.receiver = self;
      v11.super_class = (Class)_HAPAccessoryServerBTLE200;
      -[HAPAccessoryServer submitPairVerifyMetricWithError:](&v11, sel_submitPairVerifyMetricWithError_, v4);
    }
  }

}

- (id)securitySession:(id)a3 didReceiveLocalPairingIdentityRequestWithError:(id *)a4
{
  id v6;
  void *v7;
  _HAPAccessoryServerBTLE200 *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  int v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = (void *)MEMORY[0x1D17B7244]();
  v8 = self;
  HMFGetOSLogHandle();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
  {
    HMFGetLogIdentifier();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = 138543362;
    v14 = v10;
    _os_log_impl(&dword_1CCE01000, v9, OS_LOG_TYPE_DEBUG, "%{public}@Request for local pairing identity", (uint8_t *)&v13, 0xCu);

  }
  objc_autoreleasePoolPop(v7);
  -[HAPAccessoryServer getControllerPairingIdentityWithError:](v8, "getControllerPairingIdentityWithError:", a4);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (id)securitySession:(id)a3 didReceiveRequestForPeerPairingIdentityWithIdentifier:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  void *v10;
  char v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  HAPPairingIdentity *v16;
  void *v17;
  _HAPAccessoryServerBTLE200 *v18;
  NSObject *v19;
  void *v20;
  void *v21;
  _HAPAccessoryServerBTLE200 *v22;
  NSObject *v23;
  void *v24;
  void *v25;
  _HAPAccessoryServerBTLE200 *v26;
  NSObject *v27;
  void *v28;
  void *v30;
  id v31;
  uint8_t buf[4];
  void *v33;
  __int16 v34;
  id v35;
  __int16 v36;
  id v37;
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  -[HAPAccessoryServer identifier](self, "identifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "isEqualToString:", v9);

  if ((v11 & 1) != 0)
  {
    -[HAPAccessoryServer keyStore](self, "keyStore");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = 0;
    objc_msgSend(v12, "readPublicKeyForAccessoryName:registeredWithHomeKit:error:", v9, 0, &v31);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = v31;

    if (v13)
    {
      v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D28658]), "initWithPairingKeyData:", v13);
      v16 = -[HAPPairingIdentity initWithIdentifier:publicKey:privateKey:permissions:]([HAPPairingIdentity alloc], "initWithIdentifier:publicKey:privateKey:permissions:", v9, v15, 0, 0);
      if (!v16)
      {
        v17 = (void *)MEMORY[0x1D17B7244]();
        v18 = self;
        HMFGetOSLogHandle();
        v19 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
        {
          HMFGetLogIdentifier();
          v30 = v17;
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543874;
          v33 = v20;
          v34 = 2112;
          v35 = v9;
          v36 = 2112;
          v37 = v13;
          _os_log_impl(&dword_1CCE01000, v19, OS_LOG_TYPE_DEBUG, "%{public}@Failed to create pairing identity with identifier, %@, public key, %@", buf, 0x20u);

          v17 = v30;
        }

        objc_autoreleasePoolPop(v17);
        if (a5)
        {
          objc_msgSend(MEMORY[0x1E0CB35C8], "hapErrorWithCode:description:reason:suggestion:underlyingError:", 1, CFSTR("Failed to retrieve peer pairing identity."), CFSTR("Failed to create pairing identity"), 0, 0);
          *a5 = (id)objc_claimAutoreleasedReturnValue();
        }
      }

    }
    else
    {
      v25 = (void *)MEMORY[0x1D17B7244]();
      v26 = self;
      HMFGetOSLogHandle();
      v27 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        v33 = v28;
        v34 = 2112;
        v35 = v9;
        v36 = 2112;
        v37 = v14;
        _os_log_impl(&dword_1CCE01000, v27, OS_LOG_TYPE_ERROR, "%{public}@Failed to retrieve public key for accessory with identifier '%@' with error: %@", buf, 0x20u);

      }
      objc_autoreleasePoolPop(v25);
      v16 = 0;
    }

  }
  else
  {
    v21 = (void *)MEMORY[0x1D17B7244]();
    v22 = self;
    HMFGetOSLogHandle();
    v23 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
    {
      HMFGetLogIdentifier();
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v33 = v24;
      v34 = 2112;
      v35 = v9;
      _os_log_impl(&dword_1CCE01000, v23, OS_LOG_TYPE_DEBUG, "%{public}@Unexpected pairing peer identifier, %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v21);
    if (a5)
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "hapErrorWithCode:description:reason:suggestion:underlyingError:", 16, CFSTR("Insufficient Authorization."), CFSTR("Unexpected pairing peer identifier."), 0, 0);
      v16 = 0;
      *a5 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v16 = 0;
    }
  }

  return v16;
}

- (void)securitySession:(id)a3 didReceiveSetupExchangeData:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  id v9;
  id v10;
  _QWORD block[4];
  id v12;
  _HAPAccessoryServerBTLE200 *v13;
  id v14;

  v6 = a3;
  v7 = a4;
  -[HAPAccessoryServer clientQueue](self, "clientQueue");
  v8 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __74___HAPAccessoryServerBTLE200_securitySession_didReceiveSetupExchangeData___block_invoke;
  block[3] = &unk_1E894E120;
  v12 = v6;
  v13 = self;
  v14 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(v8, block);

}

- (void)securitySessionIsOpening:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[4];
  id v8;
  _HAPAccessoryServerBTLE200 *v9;

  v4 = a3;
  -[HAPAccessoryServer clientQueue](self, "clientQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __55___HAPAccessoryServerBTLE200_securitySessionIsOpening___block_invoke;
  v7[3] = &unk_1E894E0F8;
  v8 = v4;
  v9 = self;
  v6 = v4;
  dispatch_async(v5, v7);

}

- (void)securitySessionDidOpen:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[4];
  id v8;
  _HAPAccessoryServerBTLE200 *v9;

  v4 = a3;
  -[HAPAccessoryServer clientQueue](self, "clientQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __53___HAPAccessoryServerBTLE200_securitySessionDidOpen___block_invoke;
  v7[3] = &unk_1E894E0F8;
  v8 = v4;
  v9 = self;
  v6 = v4;
  dispatch_async(v5, v7);

}

- (BOOL)_shouldIgnoreRetryDiscoveryError:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  BOOL v6;

  v3 = a3;
  objc_msgSend(v3, "underlyingErrors");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "firstObject");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = ((objc_msgSend(v3, "isHAPError") & 1) != 0 || objc_msgSend(v5, "isHAPError"))
    && (objc_msgSend(v3, "code") == 27 || objc_msgSend(v5, "code") == 27);

  return v6;
}

- (void)_updateLastKeyBagIdentityIndexFailingPVWithError:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;

  v4 = a3;
  -[HAPAccessoryServer clientQueue](self, "clientQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  objc_msgSend(v4, "userInfo");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "objectForKeyedSubscript:", *MEMORY[0x1E0CB3388]);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v8 = v7;
  else
    v8 = 0;
  v15 = v8;

  objc_msgSend(v15, "domain");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = HMFEqualObjects();

  if (v10 && objc_msgSend(v15, "code") == -6754)
  {
    -[_HAPAccessoryServerBTLE200 accessoryCache](self, "accessoryCache");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = (void *)MEMORY[0x1E0CB37E8];
    -[HAPAccessoryServer keyBag](self, "keyBag");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "numberWithInteger:", objc_msgSend(v13, "getCurrentIndexInBag"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setLastKeyBagIdentityIndexFailingPV:", v14);

  }
}

- (void)securitySession:(id)a3 didCloseWithError:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  id v9;
  id v10;
  _QWORD block[4];
  id v12;
  _HAPAccessoryServerBTLE200 *v13;
  id v14;

  v6 = a3;
  v7 = a4;
  -[HAPAccessoryServer clientQueue](self, "clientQueue");
  v8 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __64___HAPAccessoryServerBTLE200_securitySession_didCloseWithError___block_invoke;
  block[3] = &unk_1E894E120;
  v12 = v6;
  v13 = self;
  v14 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(v8, block);

}

- (void)timerDidFire:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  id v13;
  void *v14;
  _HAPAccessoryServerBTLE200 *v15;
  NSObject *v16;
  void *v17;
  void *v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  uint8_t buf[4];
  void *v24;
  __int16 v25;
  void *v26;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[HAPAccessoryServer clientQueue](self, "clientQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  -[_HAPAccessoryServerBTLE200 connectionIdleTimer](self, "connectionIdleTimer");
  v6 = (id)objc_claimAutoreleasedReturnValue();

  if (v6 == v4)
  {
    -[HAPAccessoryServer pairingActivity](self, "pairingActivity");

    -[_HAPAccessoryServerBTLE200 _handleConnectionIdleTimeout](self, "_handleConnectionIdleTimeout");
  }
  else
  {
    v21 = 0u;
    v22 = 0u;
    v19 = 0u;
    v20 = 0u;
    -[_HAPAccessoryServerBTLE200 pendingRequests](self, "pendingRequests", 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v19, v27, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v20;
      while (2)
      {
        for (i = 0; i != v9; ++i)
        {
          if (*(_QWORD *)v20 != v10)
            objc_enumerationMutation(v7);
          v12 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * i);
          objc_msgSend(v12, "responseTimer");
          v13 = (id)objc_claimAutoreleasedReturnValue();

          if (v13 == v4)
          {
            v14 = (void *)MEMORY[0x1D17B7244]();
            v15 = self;
            HMFGetOSLogHandle();
            v16 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
            {
              HMFGetLogIdentifier();
              v17 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138543618;
              v24 = v17;
              v25 = 2112;
              v26 = v12;
              _os_log_impl(&dword_1CCE01000, v16, OS_LOG_TYPE_INFO, "%{public}@Cancelling the timed out request: %@", buf, 0x16u);

            }
            objc_autoreleasePoolPop(v14);
            objc_msgSend(MEMORY[0x1E0CB35C8], "hapErrorWithCode:description:reason:suggestion:underlyingError:", 24, CFSTR("Request failed."), CFSTR("Request timed out waiting for response."), 0, 0);
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v12, "cancelWithError:", v18);

            goto LABEL_14;
          }
        }
        v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v19, v27, 16);
        if (v9)
          continue;
        break;
      }
    }
LABEL_14:

  }
}

- (void)disconnect
{
  void *v3;
  _HAPAccessoryServerBTLE200 *v4;
  NSObject *v5;
  void *v6;
  NSObject *v7;
  _QWORD block[5];
  uint8_t buf[4];
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v3 = (void *)MEMORY[0x1D17B7244](self, a2);
  v4 = self;
  HMFGetOSLogHandle();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v10 = v6;
    _os_log_impl(&dword_1CCE01000, v5, OS_LOG_TYPE_INFO, "%{public}@Disconnecting as a result of direct disconnect call", buf, 0xCu);

  }
  objc_autoreleasePoolPop(v3);
  -[HAPAccessoryServer clientQueue](v4, "clientQueue");
  v7 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __40___HAPAccessoryServerBTLE200_disconnect__block_invoke;
  block[3] = &unk_1E894DD08;
  block[4] = v4;
  dispatch_async(v7, block);

}

- (HAPBLEAccessoryCache)accessoryCache
{
  return self->_accessoryCache;
}

- (void)setAccessoryCache:(id)a3
{
  objc_storeStrong((id *)&self->_accessoryCache, a3);
}

- (id)connectionCompletionHandler
{
  return self->_connectionCompletionHandler;
}

- (void)setConnectionCompletionHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 464);
}

- (HMFTimer)connectionIdleTimer
{
  return self->_connectionIdleTimer;
}

- (void)setConnectionIdleTimer:(id)a3
{
  objc_storeStrong((id *)&self->_connectionIdleTimer, a3);
}

- (_HAPBTLEDiscoveryContext)discoveryContext
{
  return self->_discoveryContext;
}

- (void)setDiscoveryContext:(id)a3
{
  objc_storeStrong((id *)&self->_discoveryContext, a3);
}

- (int64_t)discoveryRetries
{
  return self->_discoveryRetries;
}

- (void)setDiscoveryRetries:(int64_t)a3
{
  self->_discoveryRetries = a3;
}

- (BOOL)isVerified
{
  return self->_verified;
}

- (void)setVerified:(BOOL)a3
{
  self->_verified = a3;
}

- (void)setIdentifyCharacteristic:(id)a3
{
  objc_storeWeak((id *)&self->_identifyCharacteristic, a3);
}

- (HAPPairSetupSession)pairSetupSession
{
  return self->_pairSetupSession;
}

- (void)setPairSetupSession:(id)a3
{
  objc_storeStrong((id *)&self->_pairSetupSession, a3);
}

- (double)pairSetupBackoffTimeInterval
{
  return self->_pairSetupBackoffTimeInterval;
}

- (void)setPairSetupBackoffTimeInterval:(double)a3
{
  self->_pairSetupBackoffTimeInterval = a3;
}

- (BOOL)isBadSetupCode
{
  return self->_badPairSetupCode;
}

- (void)setBadPairSetupCode:(BOOL)a3
{
  self->_badPairSetupCode = a3;
}

- (id)setupCodeCompletionHandler
{
  return self->_setupCodeCompletionHandler;
}

- (void)setSetupCodeCompletionHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 520);
}

- (BOOL)isPairing
{
  return self->_pairing;
}

- (void)setPairing:(BOOL)a3
{
  self->_pairing = a3;
}

- (NSError)pairingDisconnectionError
{
  return self->_pairingDisconnectionError;
}

- (void)setPairingDisconnectionError:(id)a3
{
  objc_storeStrong((id *)&self->_pairingDisconnectionError, a3);
}

- (BOOL)authenticated
{
  return self->_authenticated;
}

- (void)setAuthenticated:(BOOL)a3
{
  self->_authenticated = a3;
}

- (HAPAuthSession)authSession
{
  return self->_authSession;
}

- (void)setAuthSession:(id)a3
{
  objc_storeStrong((id *)&self->_authSession, a3);
}

- (HAPAccessoryProtocolInfo)authenticatedProtocolInfo
{
  return self->_authenticatedProtocolInfo;
}

- (void)setAuthenticatedProtocolInfo:(id)a3
{
  objc_storeStrong((id *)&self->_authenticatedProtocolInfo, a3);
}

- (void)setPairingFeaturesCharacteristic:(id)a3
{
  objc_storeWeak((id *)&self->_pairingFeaturesCharacteristic, a3);
}

- (void)setPairSetupCharacteristic:(id)a3
{
  objc_storeWeak((id *)&self->_pairSetupCharacteristic, a3);
}

- (void)setPairVerifyCharacteristic:(id)a3
{
  objc_storeWeak((id *)&self->_pairVerifyCharacteristic, a3);
}

- (NSOperationQueue)pairVerifyOperationQueue
{
  return self->_pairVerifyOperationQueue;
}

- (void)setPairingsCharacteristic:(id)a3
{
  objc_storeWeak((id *)&self->_pairingsCharacteristic, a3);
}

- (NSMutableArray)pendingRequests
{
  return self->_pendingRequests;
}

- (NSOperationQueue)requestOperationQueue
{
  return self->_requestOperationQueue;
}

- (NSMutableArray)pendingResponses
{
  return self->_pendingResponses;
}

- (NSMapTable)characteristicWriteCompletionHandlers
{
  return self->_characteristicWriteCompletionHandlers;
}

- (NSMapTable)characteristicEnableEventCompletionHandlers
{
  return self->_characteristicEnableEventCompletionHandlers;
}

- (unsigned)featureFlags
{
  return self->_featureFlags;
}

- (void)setFeatureFlags:(unsigned __int8)a3
{
  self->_featureFlags = a3;
}

- (NSMutableSet)discoveredAccessoryCharacteristicsPendingRead
{
  return self->_discoveredAccessoryCharacteristicsPendingRead;
}

- (void)setDiscoveredAccessoryCharacteristicsPendingRead:(id)a3
{
  objc_storeStrong((id *)&self->_discoveredAccessoryCharacteristicsPendingRead, a3);
}

- (NSMutableArray)operationsReceivedDuringConnectionStateChange
{
  return self->_operationsReceivedDuringConnectionStateChange;
}

- (void)setOperationsReceivedDuringConnectionStateChange:(id)a3
{
  objc_storeStrong((id *)&self->_operationsReceivedDuringConnectionStateChange, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_operationsReceivedDuringConnectionStateChange, 0);
  objc_storeStrong((id *)&self->_discoveredAccessoryCharacteristicsPendingRead, 0);
  objc_storeStrong((id *)&self->_characteristicEnableEventCompletionHandlers, 0);
  objc_storeStrong((id *)&self->_characteristicWriteCompletionHandlers, 0);
  objc_storeStrong((id *)&self->_pendingResponses, 0);
  objc_storeStrong((id *)&self->_requestOperationQueue, 0);
  objc_storeStrong((id *)&self->_pendingRequests, 0);
  objc_destroyWeak((id *)&self->_pairingsCharacteristic);
  objc_storeStrong((id *)&self->_pairVerifyOperationQueue, 0);
  objc_destroyWeak((id *)&self->_pairVerifyCharacteristic);
  objc_destroyWeak((id *)&self->_pairSetupCharacteristic);
  objc_destroyWeak((id *)&self->_pairingFeaturesCharacteristic);
  objc_storeStrong((id *)&self->_authenticatedProtocolInfo, 0);
  objc_storeStrong((id *)&self->_authSession, 0);
  objc_storeStrong((id *)&self->_pairingDisconnectionError, 0);
  objc_storeStrong(&self->_setupCodeCompletionHandler, 0);
  objc_storeStrong((id *)&self->_pairSetupSession, 0);
  objc_destroyWeak((id *)&self->_identifyCharacteristic);
  objc_storeStrong((id *)&self->_discoveryContext, 0);
  objc_storeStrong((id *)&self->_connectionIdleTimer, 0);
  objc_storeStrong(&self->_connectionCompletionHandler, 0);
  objc_storeStrong((id *)&self->_accessoryCache, 0);
  objc_storeStrong((id *)&self->_securitySession, 0);
}

+ (id)signatureRequestForCharacteristic:(id)a3 requiresAuthentication:(BOOL)a4 error:(id *)a5
{
  _BOOL8 v5;
  id v6;
  HAPBTLERequest *v7;

  v5 = a4;
  v6 = a3;
  v7 = -[HAPBTLERequest initWithCharacteristic:requestType:bodyData:shouldEncrypt:timeoutInterval:]([HAPBTLERequest alloc], "initWithCharacteristic:requestType:bodyData:shouldEncrypt:timeoutInterval:", v6, 1, 0, v5, 10.0);

  return v7;
}

+ (id)signatureRequestForService:(id)a3 characteristic:(id)a4 requiresAuthentication:(BOOL)a5 error:(id *)a6
{
  _BOOL8 v6;
  id v7;
  HAPBTLERequest *v8;

  v6 = a5;
  v7 = a4;
  v8 = -[HAPBTLERequest initWithCharacteristic:requestType:bodyData:shouldEncrypt:timeoutInterval:]([HAPBTLERequest alloc], "initWithCharacteristic:requestType:bodyData:shouldEncrypt:timeoutInterval:", v7, 6, 0, v6, 10.0);

  return v8;
}

+ (id)parseSignatureResponse:(id)a3 error:(id *)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  void *v11;
  void *v12;
  HAPBTLECharacteristicSignature *v13;

  v5 = a3;
  objc_msgSend(v5, "body");
  v6 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  objc_msgSend(v6, "bytes");

  objc_msgSend(v5, "body");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "length");

  objc_msgSend(v5, "request");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "type");

  if (v9 == 1)
    TLV8GetOrCopyCoalesced();
  v10 = (void *)MEMORY[0x1E0CB35C8];
  objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithOSStatus:");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "hapErrorWithCode:description:reason:suggestion:underlyingError:", 12, CFSTR("Signature request failed."), CFSTR("Failed to parse signature response body."), 0, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    v13 = 0;
    if (a4)
      *a4 = objc_retainAutorelease(v12);
  }
  else
  {
    v13 = -[HAPBTLECharacteristicSignature initWithCharacteristicType:serviceInstanceID:serviceType:characteristicProperties:characteristicMetadata:authenticated:]([HAPBTLECharacteristicSignature alloc], "initWithCharacteristicType:serviceInstanceID:serviceType:characteristicProperties:characteristicMetadata:authenticated:", 0, 0, 0, 0, 0, objc_msgSend(v5, "isEncrypted"));
  }

  return v13;
}

+ (id)parseServiceSignatureResponse:(id)a3 serviceInstanceID:(id)a4 serviceType:(id)a5 error:(id *)a6
{
  id v9;
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  int v16;
  uint64_t v17;
  id v18;
  uint64_t v19;
  id v20;
  uint64_t v21;
  id v22;
  void *v23;
  HAPBTLEServiceSignature *v24;
  id v26[2];
  uint64_t v27;
  uint64_t v28;
  __int16 v29;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  objc_msgSend(v9, "body");
  v12 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  objc_msgSend(v12, "bytes");

  objc_msgSend(v9, "body");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "length");

  v27 = 0;
  v28 = 0;
  v26[1] = 0;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "request");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v15, "type");

  if (v16 == 6)
  {
    v17 = 0;
    if (!TLV8GetOrCopyCoalesced())
    {
      objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", v28, v27);
      v17 = objc_claimAutoreleasedReturnValue();
      if (!v17)
      {
        v18 = 0;
LABEL_27:
        v20 = 0;
        v21 = 4294960559;
        goto LABEL_13;
      }
      v18 = (id)v17;
      if ((unint64_t)objc_msgSend(v18, "length") <= 1)
      {
        objc_msgSend(MEMORY[0x1E0CB35C8], "hapErrorWithCode:description:reason:suggestion:underlyingError:", 12, CFSTR("The service properties value is missing."), 0, 0, 0);
        v22 = (id)objc_claimAutoreleasedReturnValue();

        v20 = v22;
        v17 = 0;
        v21 = 0;
LABEL_13:

        goto LABEL_14;
      }
      v29 = 0;
      objc_msgSend(v18, "getBytes:length:", &v29, 2);
      v17 = v29 & 7;

    }
    v19 = TLV8GetOrCopyCoalesced();
    v20 = 0;
    if ((_DWORD)v19 == -6727)
    {
LABEL_22:
      v24 = -[HAPBTLEServiceSignature initWithServiceType:serviceInstanceID:serviceProperties:linkedServices:authenticated:]([HAPBTLEServiceSignature alloc], "initWithServiceType:serviceInstanceID:serviceProperties:linkedServices:authenticated:", v11, v10, v17, v14, objc_msgSend(v9, "isEncrypted"));
      goto LABEL_24;
    }
    v21 = v19;
    if ((_DWORD)v19)
    {
LABEL_14:
      if (v20)
        goto LABEL_19;
      goto LABEL_15;
    }
    objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", v28, v27);
    v18 = (id)objc_claimAutoreleasedReturnValue();
    if (v18)
    {
      if (!objc_msgSend(v18, "length"))
      {
        v20 = 0;
        goto LABEL_18;
      }
      v26[0] = 0;
      v21 = _parseLinkedServices(v18, v14, v26);
      v20 = v26[0];
      if ((_DWORD)v21)
      {
        objc_msgSend(v14, "removeObject:", v10);
        goto LABEL_18;
      }
      goto LABEL_13;
    }
    goto LABEL_27;
  }
  v17 = 0;
  v20 = 0;
  v21 = 4294960591;
LABEL_15:
  if (!(_DWORD)v21)
    goto LABEL_19;
  v23 = (void *)MEMORY[0x1E0CB35C8];
  objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithOSStatus:", v21);
  v18 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "hapErrorWithCode:description:reason:suggestion:underlyingError:", 12, CFSTR("Service Signature response failed."), CFSTR("Failed to parse service signature response body."), 0, v18);
  v20 = (id)objc_claimAutoreleasedReturnValue();
LABEL_18:

LABEL_19:
  if (!v20)
    goto LABEL_22;
  if (a6)
  {
    v20 = objc_retainAutorelease(v20);
    v24 = 0;
    *a6 = v20;
  }
  else
  {
    v24 = 0;
  }
LABEL_24:

  return v24;
}

+ (BOOL)isHAPService:(id)a3
{
  id v3;
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
  BOOL v14;
  void *v16;
  char v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t i;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  _BYTE v39[128];
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend(v3, "UUID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C97778], "UUIDWithString:", *MEMORY[0x1E0C97708]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "isEqual:", v5))
    goto LABEL_10;
  objc_msgSend(v3, "UUID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C97778], "UUIDWithString:", *MEMORY[0x1E0C97710]);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v6, "isEqual:", v7) & 1) != 0)
  {
LABEL_9:

LABEL_10:
    goto LABEL_11;
  }
  objc_msgSend(v3, "UUID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C97778], "UUIDWithString:", *MEMORY[0x1E0C976F8]);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v8, "isEqual:", v9) & 1) != 0)
  {
LABEL_8:

    goto LABEL_9;
  }
  objc_msgSend(v3, "UUID");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C97778], "UUIDWithString:", *MEMORY[0x1E0C976D0]);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v10, "isEqual:", v11) & 1) != 0)
  {

    goto LABEL_8;
  }
  v33 = v11;
  v34 = v10;
  objc_msgSend(v3, "UUID");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C97778], "UUIDWithString:", *MEMORY[0x1E0C976C8]);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v12, "isEqual:", v13) & 1) != 0)
  {

    goto LABEL_8;
  }
  v32 = v13;
  objc_msgSend(v3, "UUID");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C97778], "UUIDWithString:", *MEMORY[0x1E0C976B8]);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = v16;
  if ((objc_msgSend(v16, "isEqual:") & 1) != 0)
  {
    v17 = 1;
    v18 = v32;
  }
  else
  {
    objc_msgSend(v3, "UUID");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C97778], "UUIDWithString:", *MEMORY[0x1E0C97700]);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = v19;
    if ((objc_msgSend(v19, "isEqual:") & 1) != 0)
    {
      v17 = 1;
    }
    else
    {
      objc_msgSend(v3, "UUID");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0C97778], "UUIDWithString:", *MEMORY[0x1E0C976D8]);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = objc_msgSend(v27, "isEqual:");

    }
    v18 = v32;

  }
  if ((v17 & 1) != 0)
    goto LABEL_12;
  objc_msgSend(v3, "characteristics");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = objc_msgSend(v21, "count");

  if (!v22)
  {
LABEL_32:
    v14 = 1;
    goto LABEL_13;
  }
  v37 = 0u;
  v38 = 0u;
  v35 = 0u;
  v36 = 0u;
  objc_msgSend(v3, "characteristics");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v35, v39, 16);
  if (v23)
  {
    v24 = v23;
    v25 = *(_QWORD *)v36;
    while (2)
    {
      for (i = 0; i != v24; ++i)
      {
        if (*(_QWORD *)v36 != v25)
          objc_enumerationMutation(v4);
        if ((_isServiceInstanceIDCharacteristic(*(void **)(*((_QWORD *)&v35 + 1) + 8 * i)) & 1) != 0)
        {

          goto LABEL_32;
        }
      }
      v24 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v35, v39, 16);
      if (v24)
        continue;
      break;
    }
  }
LABEL_11:

LABEL_12:
  v14 = 0;
LABEL_13:

  return v14;
}

+ (BOOL)isHAPDescriptor:(id)a3
{
  void *v3;
  void *v4;
  char v5;

  objc_msgSend(a3, "UUID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C97778], "UUIDWithString:", CFSTR("DC46F0FE-81D2-4616-B5D9-6ABDD796939A"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v3, "isEqual:", v4);

  return v5;
}

+ (id)readRequestForCharacteristic:(id)a3 options:(int64_t)a4 error:(id *)a5
{
  char v6;
  id v7;
  void *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  HAPBTLERequest *v12;
  int v14;
  void *v15;
  __int16 v16;
  void *v17;
  uint64_t v18;

  v6 = a4;
  v18 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  if ((objc_msgSend(v7, "properties") & 2) != 0)
  {
    v12 = -[HAPBTLERequest initWithCharacteristic:requestType:bodyData:shouldEncrypt:timeoutInterval:]([HAPBTLERequest alloc], "initWithCharacteristic:requestType:bodyData:shouldEncrypt:timeoutInterval:", v7, 3, 0, v6 & 1, 10.0);
  }
  else
  {
    v8 = (void *)MEMORY[0x1D17B7244]();
    HMFGetOSLogHandle();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "shortDescription");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = 138543618;
      v15 = v10;
      v16 = 2114;
      v17 = v11;
      _os_log_impl(&dword_1CCE01000, v9, OS_LOG_TYPE_ERROR, "%{public}@[HAPBTLERequest] Read failed, characteristic does not support secured reads: %{public}@", (uint8_t *)&v14, 0x16u);

    }
    objc_autoreleasePoolPop(v8);
    if (a5)
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "hapErrorWithCode:", 11);
      v12 = 0;
      *a5 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v12 = 0;
    }
  }

  return v12;
}

+ (BOOL)parseReadResponse:(id)a3 value:(id *)a4 notificationContext:(id *)a5 error:(id *)a6
{
  id v9;
  void *v10;
  int v11;
  int v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  id v25;
  void *v26;
  void *v27;
  __int16 v28;
  id v29;
  void *v30;
  void *v31;
  id v32;
  NSObject *v33;
  void *v34;
  BOOL v35;
  uint64_t v36;
  void *v37;
  void *v38;
  id *v41;
  id v42;
  id v43;
  id v44;
  uint8_t buf[4];
  void *v46;
  __int16 v47;
  id v48;
  __int16 v49;
  id v50;
  uint64_t v51;

  v51 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  objc_msgSend(v9, "request");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "type");

  v41 = a5;
  if (v11 != 3)
  {
    v36 = 4294960591;
    goto LABEL_25;
  }
  v12 = objc_msgSend(v9, "statusCode");
  v13 = 3;
  switch(v12)
  {
    case 0:
      goto LABEL_10;
    case 1:
    case 6:
      break;
    case 2:
      v13 = 5;
      break;
    case 3:
      v13 = 16;
      break;
    case 4:
      v13 = 9;
      break;
    case 5:
      v13 = 17;
      break;
    case 8:
      v13 = 31;
      break;
    default:
      v13 = 1;
      break;
  }
  objc_msgSend(MEMORY[0x1E0CB35C8], "hapErrorWithCode:", v13);
  v14 = objc_claimAutoreleasedReturnValue();
  if (v14)
  {
    v17 = (id)v14;
    goto LABEL_22;
  }
LABEL_10:
  objc_msgSend(v9, "body", v13);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v44 = 0;
  objc_msgSend(a1, "extractSerializedRequestValueFromBodyData:error:", v15, &v44);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = v44;

  if (!v16)
  {
    if (v17)
    {
LABEL_22:
      v24 = 0;
      v29 = 0;
      v16 = 0;
      goto LABEL_17;
    }
    v36 = 4294960559;
LABEL_25:
    v37 = (void *)MEMORY[0x1E0CB35C8];
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithOSStatus:", v36);
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "hapErrorWithCode:description:reason:suggestion:underlyingError:", 1, CFSTR("Read failed."), CFSTR("Failed to parse read request body."), 0, v38);
    v17 = (id)objc_claimAutoreleasedReturnValue();

    v16 = 0;
    v29 = 0;
    v24 = 0;
    if (!v17)
      goto LABEL_26;
LABEL_17:
    if (a6)
    {
      v17 = objc_retainAutorelease(v17);
      v35 = 0;
      *a6 = v17;
    }
    else
    {
      v35 = 0;
    }
    goto LABEL_32;
  }
  objc_msgSend(v9, "request");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "characteristic");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "metadata");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "format");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = HAPCharacteristicFormatFromString(v21);

  +[HAPDataValueTransformer defaultDataValueTransformer](HAPDataValueTransformer, "defaultDataValueTransformer");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v43 = v17;
  objc_msgSend(v23, "reverseTransformedValue:format:error:", v16, v22, &v43);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = v43;

  if (v25)
  {
    v29 = 0;
    v17 = v25;
    goto LABEL_17;
  }
  objc_msgSend(v9, "request");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "characteristic");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = objc_msgSend(v27, "properties");

  if ((v28 & 0x100) != 0)
  {
    objc_msgSend(v9, "body");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v42 = 0;
    objc_msgSend(a1, "extractNotificationContextFromBodyData:error:", v30, &v42);
    v29 = (id)objc_claimAutoreleasedReturnValue();
    v17 = v42;

    v31 = (void *)MEMORY[0x1D17B7244]();
    v32 = a1;
    HMFGetOSLogHandle();
    v33 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v33, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v46 = v34;
      v47 = 2114;
      v48 = v29;
      v49 = 2114;
      v50 = v17;
      _os_log_impl(&dword_1CCE01000, v33, OS_LOG_TYPE_INFO, "%{public}@Parsed read response notification context: %{public}@ with error: %{public}@", buf, 0x20u);

    }
    objc_autoreleasePoolPop(v31);
    if (!v17)
      goto LABEL_26;
    goto LABEL_17;
  }
  v29 = 0;
LABEL_26:
  if (a4)
    *a4 = objc_retainAutorelease(v24);
  if (v29)
  {
    v29 = objc_retainAutorelease(v29);
    v17 = 0;
    *v41 = v29;
  }
  else
  {
    v17 = 0;
  }
  v35 = 1;
LABEL_32:

  return v35;
}

+ (id)extractSerializedRequestValueFromBodyData:(id)a3 error:(id *)a4
{
  id v5;
  uint64_t v6;
  void *v7;
  void *v8;

  v5 = objc_retainAutorelease(a3);
  objc_msgSend(v5, "bytes");
  objc_msgSend(v5, "length");

  v6 = TLV8GetOrCopyCoalesced();
  if ((_DWORD)v6)
  {
    if (a4)
    {
      v7 = (void *)MEMORY[0x1E0CB35C8];
      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithOSStatus:", v6);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "hapErrorWithCode:description:reason:suggestion:underlyingError:", 12, CFSTR("Parse failed."), CFSTR("Failed to parse request body."), 0, v8);
      *a4 = (id)objc_claimAutoreleasedReturnValue();

      return 0;
    }
    else
    {
      return a4;
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", 0, 0);
    return (id)objc_claimAutoreleasedReturnValue();
  }
}

+ (id)extractNotificationContextFromBodyData:(id)a3 error:(id *)a4
{
  id v5;
  uint64_t v6;
  void *v7;
  void *v8;

  v5 = objc_retainAutorelease(a3);
  objc_msgSend(v5, "bytes");
  objc_msgSend(v5, "length");

  v6 = TLV8GetOrCopyCoalesced();
  if ((_DWORD)v6)
  {
    if (!a4 || (_DWORD)v6 == -6727)
    {
      return 0;
    }
    else
    {
      v7 = (void *)MEMORY[0x1E0CB35C8];
      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithOSStatus:", v6);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "hapErrorWithCode:description:reason:suggestion:underlyingError:", 12, CFSTR("Parse failed."), CFSTR("Failed to parse notification context."), 0, v8);
      *a4 = (id)objc_claimAutoreleasedReturnValue();

      return 0;
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", 0, 0);
    return (id)objc_claimAutoreleasedReturnValue();
  }
}

+ (id)writeRequestForCharacteristic:(id)a3 value:(id)a4 authorizationData:(id)a5 contextData:(id)a6 options:(int64_t)a7 error:(id *)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  void *v18;
  id v19;
  NSObject *v20;
  void *v21;
  void *v22;
  HAPBTLERequest *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  void *v27;
  double v28;
  int v30;
  void *v31;
  __int16 v32;
  void *v33;
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v14 = a3;
  v15 = a4;
  v16 = a5;
  v17 = a6;
  if ((objc_msgSend(v14, "properties") & 4) != 0)
  {
    objc_msgSend(v14, "metadata");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "format");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = HAPCharacteristicFormatFromString(v25);

    _createCharacteristicWriteBody(v15, v26, v16, ((unint64_t)a7 >> 1) & 1, v17, a8, 0.0);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    if (v27)
    {
      if ((a7 & 8) != 0)
        v28 = 60.0;
      else
        v28 = 10.0;
      v23 = -[HAPBTLERequest initWithCharacteristic:requestType:bodyData:shouldEncrypt:timeoutInterval:]([HAPBTLERequest alloc], "initWithCharacteristic:requestType:bodyData:shouldEncrypt:timeoutInterval:", v14, 2, v27, a7 & 1, v28);
    }
    else
    {
      v23 = 0;
    }

  }
  else
  {
    v18 = (void *)MEMORY[0x1D17B7244]();
    v19 = a1;
    HMFGetOSLogHandle();
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "shortDescription");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v30 = 138543618;
      v31 = v21;
      v32 = 2114;
      v33 = v22;
      _os_log_impl(&dword_1CCE01000, v20, OS_LOG_TYPE_ERROR, "%{public}@[HAPBTLERequest] Write failed, characteristic does not support secured writes: %{public}@", (uint8_t *)&v30, 0x16u);

    }
    objc_autoreleasePoolPop(v18);
    if (a8)
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "hapErrorWithCode:", 10);
      v23 = 0;
      *a8 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v23 = 0;
    }
  }

  return v23;
}

+ (id)prepareWriteRequestForCharacteristic:(id)a3 value:(id)a4 authorizationData:(id)a5 contextData:(id)a6 options:(int64_t)a7 error:(id *)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  void *v18;
  id v19;
  NSObject *v20;
  void *v21;
  void *v22;
  HAPBTLERequest *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  void *v27;
  int v29;
  void *v30;
  __int16 v31;
  void *v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v14 = a3;
  v15 = a4;
  v16 = a5;
  v17 = a6;
  if ((objc_msgSend(v14, "properties") & 4) != 0)
  {
    objc_msgSend(v14, "metadata");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "format");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = HAPCharacteristicFormatFromString(v25);

    _createCharacteristicWriteBody(v15, v26, v16, ((unint64_t)a7 >> 1) & 1, v17, a8, 2.5);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    if (v27)
      v23 = -[HAPBTLERequest initWithCharacteristic:requestType:bodyData:shouldEncrypt:timeoutInterval:]([HAPBTLERequest alloc], "initWithCharacteristic:requestType:bodyData:shouldEncrypt:timeoutInterval:", v14, 4, v27, a7 & 1, 2.5);
    else
      v23 = 0;

  }
  else
  {
    v18 = (void *)MEMORY[0x1D17B7244]();
    v19 = a1;
    HMFGetOSLogHandle();
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "shortDescription");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v29 = 138543618;
      v30 = v21;
      v31 = 2114;
      v32 = v22;
      _os_log_impl(&dword_1CCE01000, v20, OS_LOG_TYPE_ERROR, "%{public}@[HAPBTLERequest] Write failed, characteristic does not support secured writes: %{public}@", (uint8_t *)&v29, 0x16u);

    }
    objc_autoreleasePoolPop(v18);
    if (a8)
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "hapErrorWithCode:", 10);
      v23 = 0;
      *a8 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v23 = 0;
    }
  }

  return v23;
}

+ (id)executeWriteRequestForCharacteristic:(id)a3 options:(int64_t)a4 error:(id *)a5
{
  char v6;
  id v8;
  void *v9;
  id v10;
  NSObject *v11;
  void *v12;
  void *v13;
  HAPBTLERequest *v14;
  int v16;
  void *v17;
  __int16 v18;
  void *v19;
  uint64_t v20;

  v6 = a4;
  v20 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  if ((objc_msgSend(v8, "properties") & 4) != 0)
  {
    v14 = -[HAPBTLERequest initWithCharacteristic:requestType:bodyData:shouldEncrypt:timeoutInterval:]([HAPBTLERequest alloc], "initWithCharacteristic:requestType:bodyData:shouldEncrypt:timeoutInterval:", v8, 5, 0, v6 & 1, 10.0);
  }
  else
  {
    v9 = (void *)MEMORY[0x1D17B7244]();
    v10 = a1;
    HMFGetOSLogHandle();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "shortDescription");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = 138543618;
      v17 = v12;
      v18 = 2114;
      v19 = v13;
      _os_log_impl(&dword_1CCE01000, v11, OS_LOG_TYPE_ERROR, "%{public}@[HAPBTLERequest] Write failed, characteristic does not support secured writes: %{public}@", (uint8_t *)&v16, 0x16u);

    }
    objc_autoreleasePoolPop(v9);
    if (a5)
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "hapErrorWithCode:", 11);
      v14 = 0;
      *a5 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v14 = 0;
    }
  }

  return v14;
}

+ (BOOL)parseWriteResponse:(id)a3 value:(id *)a4 error:(id *)a5
{
  id v8;
  void *v9;
  int v10;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  id v21;
  id v22;
  uint64_t v23;
  void *v24;
  BOOL v25;
  id v27;
  id v28;

  v8 = a3;
  objc_msgSend(v8, "request");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "type");

  if (v10 == 5 || v10 == 2)
  {
    objc_msgSend(v8, "body");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = 0;
    objc_msgSend(a1, "extractSerializedRequestValueFromBodyData:error:", v12, &v28);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = v28;

    if (v13)
    {
      objc_msgSend(v8, "request");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "characteristic");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "metadata");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "format");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = HAPCharacteristicFormatFromString(v18);

      +[HAPDataValueTransformer defaultDataValueTransformer](HAPDataValueTransformer, "defaultDataValueTransformer");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = v14;
      objc_msgSend(v20, "reverseTransformedValue:format:error:", v13, v19, &v27);
      v21 = (id)objc_claimAutoreleasedReturnValue();
      v22 = v27;

      v14 = v22;
      goto LABEL_9;
    }
    if (v14)
    {
      v13 = 0;
      v21 = 0;
      if (a5)
        goto LABEL_11;
      goto LABEL_18;
    }
    v23 = 4294960559;
  }
  else
  {
    v23 = 4294960591;
  }
  v24 = (void *)MEMORY[0x1E0CB35C8];
  objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithOSStatus:", v23);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "hapErrorWithCode:description:reason:suggestion:underlyingError:", 12, CFSTR("Write failed."), CFSTR("Failed to parse write request body."), 0, v20);
  v14 = (id)objc_claimAutoreleasedReturnValue();
  v21 = 0;
  v13 = 0;
LABEL_9:

  if (v14)
  {
    if (a5)
    {
LABEL_11:
      v14 = objc_retainAutorelease(v14);
      v25 = 0;
      *a5 = v14;
      goto LABEL_19;
    }
LABEL_18:
    v25 = 0;
    goto LABEL_19;
  }
  if (a4)
  {
    v21 = objc_retainAutorelease(v21);
    v14 = 0;
    *a4 = v21;
  }
  else
  {
    v14 = 0;
  }
  v25 = 1;
LABEL_19:

  return v25;
}

+ (id)configurationRequestForService:(id)a3 configRequestType:(unsigned __int8)a4 error:(id *)a5
{
  int v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  void *v19;
  char v20;
  id v21;
  HAPBTLERequest *v22;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  uint64_t v50;

  v6 = a4;
  v50 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v48 = 0u;
  v49 = 0u;
  v46 = 0u;
  v47 = 0u;
  v44 = 0u;
  v45 = 0u;
  v42 = 0u;
  v43 = 0u;
  v40 = 0u;
  v41 = 0u;
  v38 = 0u;
  v39 = 0u;
  v36 = 0u;
  v37 = 0u;
  v34 = 0u;
  v35 = 0u;
  v32 = 0u;
  v33 = 0u;
  v30 = 0u;
  v31 = 0u;
  v29 = 0u;
  TLV8BufferInit();
  if (v6 != 2 && (v8 = TLV8BufferAppend(), (_DWORD)v8) || (v8 = TLV8BufferAppend(), (_DWORD)v8))
  {
    v9 = v8;
    v10 = 0;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", v29);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (v10)
      v9 = 0;
    else
      v9 = 4294960568;
  }
  TLV8BufferFree();
  if (a5 && (_DWORD)v9)
  {
    v11 = (void *)MEMORY[0x1E0CB35C8];
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithOSStatus:", v9);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "hapErrorWithCode:description:reason:suggestion:underlyingError:", 12, CFSTR("Protocol configuration failed"), CFSTR("Failed to create protocol configuration body"), 0, v12);
    *a5 = (id)objc_claimAutoreleasedReturnValue();

  }
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  objc_msgSend(v7, "characteristics", 0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
  if (!v14)
  {
LABEL_21:

    goto LABEL_24;
  }
  v15 = v14;
  v16 = *(_QWORD *)v25;
LABEL_12:
  v17 = 0;
  while (1)
  {
    if (*(_QWORD *)v25 != v16)
      objc_enumerationMutation(v13);
    v18 = *(void **)(*((_QWORD *)&v24 + 1) + 8 * v17);
    objc_msgSend(v18, "cbCharacteristic");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    if (!_isServiceSignatureCharacteristic(v19))
    {

      goto LABEL_19;
    }
    v20 = objc_msgSend(v7, "serviceProperties");

    if ((v20 & 4) != 0)
      break;
LABEL_19:
    if (v15 == ++v17)
    {
      v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
      if (v15)
        goto LABEL_12;
      goto LABEL_21;
    }
  }
  v21 = v18;

  if (v21)
  {
    v22 = -[HAPBTLERequest initWithCharacteristic:requestType:bodyData:shouldEncrypt:timeoutInterval:]([HAPBTLERequest alloc], "initWithCharacteristic:requestType:bodyData:shouldEncrypt:timeoutInterval:", v21, 8, v10, 1, 10.0);

    goto LABEL_27;
  }
LABEL_24:
  if (a5)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "hapErrorWithCode:description:reason:suggestion:underlyingError:", 3, CFSTR("Protocol configuration request create failed"), CFSTR("Service is missing service signature characteristic or support for configuration"), 0, 0);
    v22 = 0;
    *a5 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v22 = 0;
  }
LABEL_27:

  return v22;
}

+ (BOOL)parseProtocolConfigurationResponse:(id)a3 key:(id *)a4 stateNumber:(id *)a5 error:(id *)a6
{
  id v9;
  id v10;
  void *v11;
  void *v12;
  int v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  BOOL v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  id v23;
  NSObject *v24;
  void *v25;
  void *v26;
  id v27;
  NSObject *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  id v34;
  NSObject *v35;
  void *v36;
  int __s;
  __int16 v39;
  unsigned __int8 v40;
  unsigned __int16 v41;
  void *v42;
  uint64_t v43;
  uint64_t v44;
  uint8_t buf[4];
  void *v46;
  __int16 v47;
  _BYTE v48[10];
  __int16 v49;
  int v50;
  __int16 v51;
  int v52;
  __int16 v53;
  int v54;
  __int16 v55;
  int v56;
  __int16 v57;
  int v58;
  __int16 v59;
  int v60;
  _BYTE v61[32];
  uint64_t v62;

  v62 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  objc_msgSend(v9, "body");
  v10 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  objc_msgSend(v10, "bytes");

  objc_msgSend(v9, "body");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "length");

  v43 = 0;
  v44 = 0;
  v42 = 0;
  v41 = 0;
  v40 = 0;
  v39 = 0;
  __s = 0;
  objc_msgSend(v9, "request");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "type");

  if (v13 == 8)
  {
    v14 = 0;
    if (!TLV8GetOrCopyCoalesced())
    {
      objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", v44, v43);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
    }
    if (TLV8GetOrCopyCoalesced())
    {
      v15 = v14;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", v44, v43);
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      if (v42)
      {
        free(v42);
        v42 = 0;
      }
      if (v43 == 1)
        objc_msgSend(v15, "getBytes:range:", &v40, 0, 1);
    }
    if (TLV8GetOrCopyCoalesced())
    {
      v16 = v15;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", v44, v43);
      v16 = (void *)objc_claimAutoreleasedReturnValue();

      if (v42)
      {
        free(v42);
        v42 = 0;
      }
      memset_s(&__s, 6uLL, 0, 6uLL);
      if (v43 == 6)
        objc_msgSend(v16, "getBytes:range:", &__s, 0, 6);
    }
    if (TLV8GetOrCopyCoalesced())
      goto LABEL_17;
    objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", v44, v43);
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    if (v42)
    {
      free(v42);
      v42 = 0;
    }
    if (v19)
    {
      memset_s(v61, 0x20uLL, 0, 0x20uLL);
      v20 = v43;
      if (v43 == 32)
      {
        objc_msgSend(v19, "getBytes:range:", v61, 0, 32);
        objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", v61, 32);
        v21 = 0;
        *a4 = (id)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v21 = 4294960591;
      }
      v22 = (void *)MEMORY[0x1D17B7244]();
      v23 = a1;
      HMFGetOSLogHandle();
      v24 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG))
      {
        HMFGetLogIdentifier();
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138545410;
        v46 = v25;
        v47 = 1024;
        *(_DWORD *)v48 = v41;
        *(_WORD *)&v48[4] = 1024;
        *(_DWORD *)&v48[6] = v40;
        v49 = 1024;
        v50 = __s;
        v51 = 1024;
        v52 = BYTE1(__s);
        v53 = 1024;
        v54 = BYTE2(__s);
        v55 = 1024;
        v56 = HIBYTE(__s);
        v57 = 1024;
        v58 = v39;
        v59 = 1024;
        v60 = HIBYTE(v39);
        _os_log_impl(&dword_1CCE01000, v24, OS_LOG_TYPE_DEBUG, "%{public}@Parsed protocol configuration response GSN: %d, C#: %d, advId: %02X:%02X:%02X:%02X:%02X:%02X", buf, 0x3Cu);

      }
      objc_autoreleasePoolPop(v22);
      v26 = (void *)MEMORY[0x1D17B7244]();
      v27 = v23;
      HMFGetOSLogHandle();
      v28 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v28, OS_LOG_TYPE_DEBUG))
      {
        HMFGetLogIdentifier();
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", v61, 32);
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v46 = v29;
        v47 = 2112;
        *(_QWORD *)v48 = v30;
        _os_log_impl(&dword_1CCE01000, v28, OS_LOG_TYPE_DEBUG, "%{public}@Broadcast Key: %@", buf, 0x16u);

      }
      objc_autoreleasePoolPop(v26);
      if (v20 == 32)
      {
        v17 = 0;
      }
      else
      {
        v31 = (void *)MEMORY[0x1E0CB35C8];
        objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithOSStatus:", v21);
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v31, "hapErrorWithCode:description:reason:suggestion:underlyingError:", 12, CFSTR("Configuration response failed."), CFSTR("Failed to parse configuration response body."), 0, v32);
        v17 = (id)objc_claimAutoreleasedReturnValue();

        if (v17)
        {
          v33 = (void *)MEMORY[0x1D17B7244]();
          v34 = v27;
          HMFGetOSLogHandle();
          v35 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v35, OS_LOG_TYPE_DEBUG))
          {
            HMFGetLogIdentifier();
            v36 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543618;
            v46 = v36;
            v47 = 2112;
            *(_QWORD *)v48 = v17;
            _os_log_impl(&dword_1CCE01000, v35, OS_LOG_TYPE_DEBUG, "%{public}@Failed parsing protocol configuration response with error: %@", buf, 0x16u);

          }
          objc_autoreleasePoolPop(v33);
          if (a6)
          {
            v17 = objc_retainAutorelease(v17);
            v18 = 0;
            *a6 = v17;
          }
          else
          {
            v18 = 0;
          }
          goto LABEL_36;
        }
      }
      v18 = 1;
LABEL_36:
      v16 = v19;
      goto LABEL_37;
    }
  }
  v16 = 0;
LABEL_17:
  v17 = 0;
  v18 = 1;
LABEL_37:

  return v18;
}

+ (id)configurationRequestForCharacteristic:(id)a3 isBroadcasted:(BOOL)a4 interval:(unint64_t)a5 error:(id *)a6
{
  _BOOL4 v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  HAPBTLERequest *v15;

  v7 = a4;
  v8 = a3;
  TLV8BufferInit();
  v9 = TLV8BufferAppend();
  if ((_DWORD)v9 || v7 && (v9 = TLV8BufferAppend(), (_DWORD)v9))
  {
    v10 = v9;
    v11 = 0;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", 0, 0);
    v12 = objc_claimAutoreleasedReturnValue();
    if (v12)
      v11 = (void *)v12;
    else
      v11 = 0;
    if (v12)
      v10 = 0;
    else
      v10 = 4294960568;
  }
  TLV8BufferFree();
  if (a6 && (_DWORD)v10)
  {
    v13 = (void *)MEMORY[0x1E0CB35C8];
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithOSStatus:", v10);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "hapErrorWithCode:description:reason:suggestion:underlyingError:", 1, CFSTR("Characteristic configuration failed."), CFSTR("Failed to create characteristic configuration request body."), 0, v14);
    *a6 = (id)objc_claimAutoreleasedReturnValue();

  }
  v15 = -[HAPBTLERequest initWithCharacteristic:requestType:bodyData:shouldEncrypt:timeoutInterval:]([HAPBTLERequest alloc], "initWithCharacteristic:requestType:bodyData:shouldEncrypt:timeoutInterval:", v8, 7, v11, 1, 10.0);

  return v15;
}

+ (BOOL)parseCharacteristicConfigurationResponse:(id)a3 error:(id *)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  int v10;
  BOOL v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  id v16;
  NSObject *v17;
  void *v18;
  void *v19;
  void *v20;
  uint8_t buf[4];
  void *v23;
  __int16 v24;
  int v25;
  __int16 v26;
  int v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  objc_msgSend(v6, "body");
  v7 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  objc_msgSend(v7, "bytes");

  objc_msgSend(v6, "body");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "length");

  objc_msgSend(v6, "request");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "type");

  if (v10 != 7)
  {
    v12 = 0;
    v13 = 0;
    goto LABEL_16;
  }
  v11 = 1;
  if (TLV8GetOrCopyCoalesced()
    || (objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", 0, 0),
        (v14 = (void *)objc_claimAutoreleasedReturnValue()) == 0))
  {
    v12 = 0;
    v13 = 0;
    goto LABEL_17;
  }
  if (TLV8GetOrCopyCoalesced())
  {
    v12 = v14;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", 0, 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (v12)
    {
      v15 = (void *)MEMORY[0x1D17B7244](0);
      v16 = a1;
      HMFGetOSLogHandle();
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
      {
        HMFGetLogIdentifier();
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        v23 = v18;
        v24 = 1024;
        v25 = 0;
        v26 = 1024;
        v27 = 0;
        _os_log_impl(&dword_1CCE01000, v17, OS_LOG_TYPE_DEBUG, "%{public}@Parsed configuration response properties: %0xX, Interval: %d", buf, 0x18u);

      }
      objc_autoreleasePoolPop(v15);
    }
  }
  v19 = (void *)MEMORY[0x1E0CB35C8];
  objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithOSStatus:", 4294960591);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "hapErrorWithCode:description:reason:suggestion:underlyingError:", 12, CFSTR("Configuration response failed."), CFSTR("Failed to parse configuration response body."), 0, v20);
  v13 = (id)objc_claimAutoreleasedReturnValue();

  if (!v13)
  {
LABEL_16:
    v11 = 1;
    goto LABEL_17;
  }
  if (a4)
  {
    v13 = objc_retainAutorelease(v13);
    v11 = 0;
    *a4 = v13;
  }
  else
  {
    v11 = 0;
  }
LABEL_17:

  return v11;
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t332 != -1)
    dispatch_once(&logCategory__hmf_once_t332, &__block_literal_global_807);
  return (id)logCategory__hmf_once_v333;
}

@end
