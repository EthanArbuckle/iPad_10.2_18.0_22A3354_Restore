@implementation _HAPAccessoryServerBTLE100

- (_HAPAccessoryServerBTLE100)initWithPeripheral:(id)a3 name:(id)a4 pairingUsername:(id)a5 statusFlags:(id)a6 stateNumber:(id)a7 stateChanged:(BOOL)a8 connectReason:(unsigned __int8)a9 configNumber:(id)a10 category:(id)a11 setupHash:(id)a12 connectionIdleTime:(unsigned __int8)a13 browser:(id)a14 keyStore:(id)a15 whbStableIdentifier:(id)a16
{
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;
  void *v25;
  id v26;
  id v27;
  id v28;
  id v29;
  id v30;
  id v31;
  void *v32;
  _HAPAccessoryServerBTLE100 *v33;
  _HAPAccessoryServerBTLE100 *v34;
  void *v35;
  void *v36;
  _HAPAccessoryServerBTLE100 *v37;
  _HAPAccessoryServerBTLE100 *v38;
  void *v39;
  NSObject *v40;
  void *v41;
  id v43;
  _BOOL4 v44;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  objc_super v51;
  uint8_t buf[4];
  void *v53;
  __int16 v54;
  id v55;
  uint64_t v56;

  v44 = a8;
  v56 = *MEMORY[0x1E0C80C00];
  v20 = a3;
  v21 = a4;
  v22 = a5;
  v23 = a6;
  v24 = a7;
  v25 = v23;
  v26 = a10;
  v27 = a11;
  v28 = a12;
  v29 = a14;
  v30 = a15;
  v31 = a16;
  v49 = v27;
  v50 = v24;
  v47 = v30;
  v48 = v28;
  v46 = v31;
  if (v25)
  {
    v51.receiver = self;
    v51.super_class = (Class)_HAPAccessoryServerBTLE100;
    v43 = v28;
    v32 = v26;
    v33 = -[HAPAccessoryServerBTLE initWithPeripheral:name:pairingUsername:statusFlags:stateNumber:stateChanged:connectReason:configNumber:category:setupHash:connectionIdleTime:browser:keyStore:whbStableIdentifier:](&v51, sel_initWithPeripheral_name_pairingUsername_statusFlags_stateNumber_stateChanged_connectReason_configNumber_category_setupHash_connectionIdleTime_browser_keyStore_whbStableIdentifier_, v20, v21, v22, v25, v24, v44, a9, v26, v27, v43, a13, v29, v30, v31);
    v34 = v33;
    if (v33)
    {
      -[HAPAccessoryServerBTLE peripheral](v33, "peripheral");
      v35 = v25;
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v36, "setDelegate:", v34);

      v25 = v35;
      -[_HAPAccessoryServerBTLE100 _resetState](v34, "_resetState");
      -[_HAPAccessoryServerBTLE100 _createPrimaryAccessoryFromAdvertisementData](v34, "_createPrimaryAccessoryFromAdvertisementData");
    }
    v37 = v34;
    v38 = v37;
  }
  else
  {
    v37 = self;
    v39 = (void *)MEMORY[0x1D17B7244]();
    HMFGetOSLogHandle();
    v40 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v53 = v41;
      v54 = 2112;
      v55 = v22;
      _os_log_impl(&dword_1CCE01000, v40, OS_LOG_TYPE_ERROR, "%{public}@[HAPAccessoryServerBTLE %@] Missing required parameter 'inStatusFlags'", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v39);
    v38 = 0;
    v32 = v26;
  }

  return v38;
}

- (void)_resetState
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  PairingSessionPrivate *pairingSession;

  -[_HAPAccessoryServerBTLE100 setState:](self, "setState:", 1);
  objc_msgSend(MEMORY[0x1E0CB3748], "strongToStrongObjectsMapTable");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[_HAPAccessoryServerBTLE100 setBtleServiceToHAPServiceMap:](self, "setBtleServiceToHAPServiceMap:", v3);

  objc_msgSend(MEMORY[0x1E0CB3748], "strongToStrongObjectsMapTable");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[_HAPAccessoryServerBTLE100 setBtleCharacteristicToHAPCharacteristicMap:](self, "setBtleCharacteristicToHAPCharacteristicMap:", v4);

  objc_msgSend(MEMORY[0x1E0CB3748], "strongToStrongObjectsMapTable");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[_HAPAccessoryServerBTLE100 setHapCharacteristicReadCompletionQueues:](self, "setHapCharacteristicReadCompletionQueues:", v5);

  objc_msgSend(MEMORY[0x1E0CB3748], "strongToStrongObjectsMapTable");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[_HAPAccessoryServerBTLE100 setHapCharacteristicWriteCompletionQueues:](self, "setHapCharacteristicWriteCompletionQueues:", v6);

  objc_msgSend(MEMORY[0x1E0CB3748], "strongToStrongObjectsMapTable");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[_HAPAccessoryServerBTLE100 setHapCharacteristicEnableEventCompletionQueues:](self, "setHapCharacteristicEnableEventCompletionQueues:", v7);

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[_HAPAccessoryServerBTLE100 setAddRemovePairingOperationsQueue:](self, "setAddRemovePairingOperationsQueue:", v8);

  -[_HAPAccessoryServerBTLE100 setPairingService:](self, "setPairingService:", 0);
  -[_HAPAccessoryServerBTLE100 setPairingsCharacteristic:](self, "setPairingsCharacteristic:", 0);
  -[_HAPAccessoryServerBTLE100 setPairSetupCharacteristic:](self, "setPairSetupCharacteristic:", 0);
  -[_HAPAccessoryServerBTLE100 setPairVerifyCharacteristic:](self, "setPairVerifyCharacteristic:", 0);
  -[_HAPAccessoryServerBTLE100 setPairingFeaturesCharacteristic:](self, "setPairingFeaturesCharacteristic:", 0);
  -[_HAPAccessoryServerBTLE100 setIdentifyCharacteristic:](self, "setIdentifyCharacteristic:", 0);
  -[_HAPAccessoryServerBTLE100 setModelCharacteristic:](self, "setModelCharacteristic:", 0);
  -[_HAPAccessoryServerBTLE100 setSerialNumberCharacteristic:](self, "setSerialNumberCharacteristic:", 0);
  -[_HAPAccessoryServerBTLE100 setManufacturerCharacteristic:](self, "setManufacturerCharacteristic:", 0);
  -[_HAPAccessoryServerBTLE100 setConnectionRetryCount:](self, "setConnectionRetryCount:", 0);
  -[_HAPAccessoryServerBTLE100 setCharacteristicDiscoveryRequestCount:](self, "setCharacteristicDiscoveryRequestCount:", 0);
  -[_HAPAccessoryServerBTLE100 setCharacteristicValueReadCount:](self, "setCharacteristicValueReadCount:", 0);
  -[_HAPAccessoryServerBTLE100 setMetadataDiscoveryRequestCount:](self, "setMetadataDiscoveryRequestCount:", 0);
  -[_HAPAccessoryServerBTLE100 setMetadataValueReadCount:](self, "setMetadataValueReadCount:", 0);
  -[_HAPAccessoryServerBTLE100 setAvailableInstanceID:](self, "setAvailableInstanceID:", 1);
  -[_HAPAccessoryServerBTLE100 setStartPairingRequested:](self, "setStartPairingRequested:", 0);
  -[_HAPAccessoryServerBTLE100 setRemoveOnDisconnect:](self, "setRemoveOnDisconnect:", -[_HAPAccessoryServerBTLE100 unpairedIdentifyRequested](self, "unpairedIdentifyRequested") ^ 1);
  -[_HAPAccessoryServerBTLE100 setUnpairedIdentifyRequested:](self, "setUnpairedIdentifyRequested:", 0);
  -[_HAPAccessoryServerBTLE100 connectionLifetimeTimer](self, "connectionLifetimeTimer");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    -[_HAPAccessoryServerBTLE100 connectionLifetimeTimer](self, "connectionLifetimeTimer");
    v10 = objc_claimAutoreleasedReturnValue();
    dispatch_source_cancel(v10);

    -[_HAPAccessoryServerBTLE100 setConnectionLifetimeTimer:](self, "setConnectionLifetimeTimer:", 0);
  }
  -[_HAPAccessoryServerBTLE100 setIdleConnectionTimeoutInSec:](self, "setIdleConnectionTimeoutInSec:", 10.0);
  pairingSession = self->_pairingSession;
  if (pairingSession)
  {
    CFRelease(pairingSession);
    self->_pairingSession = 0;
  }
  -[_HAPAccessoryServerBTLE100 setSecuritySession:](self, "setSecuritySession:", 0);
  -[HAPAccessoryServer setSecuritySessionOpen:](self, "setSecuritySessionOpen:", 0);
  -[_HAPAccessoryServerBTLE100 setSecuritySessionOpening:](self, "setSecuritySessionOpening:", 0);
}

- (void)dealloc
{
  PairingSessionPrivate *pairingSession;
  void *v4;
  objc_super v5;

  pairingSession = self->_pairingSession;
  if (pairingSession)
  {
    CFRelease(pairingSession);
    self->_pairingSession = 0;
  }
  -[HAPAccessoryServerBTLE peripheral](self, "peripheral");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setDelegate:", 0);

  v5.receiver = self;
  v5.super_class = (Class)_HAPAccessoryServerBTLE100;
  -[_HAPAccessoryServerBTLE100 dealloc](&v5, sel_dealloc);
}

- (NSString)description
{
  id v3;
  NSObject *v4;
  id v5;
  id v6;
  _QWORD v8[4];
  id v9;
  _HAPAccessoryServerBTLE100 *v10;

  v3 = objc_alloc_init(MEMORY[0x1E0CB37A0]);
  -[HAPAccessoryServer clientQueue](self, "clientQueue");
  v4 = objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __41___HAPAccessoryServerBTLE100_description__block_invoke;
  v8[3] = &unk_1E894E0F8;
  v5 = v3;
  v9 = v5;
  v10 = self;
  dispatch_sync(v4, v8);

  v6 = v5;
  return (NSString *)v6;
}

- (unint64_t)hapBLEProtocolVersion
{
  return 1;
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

- (void)generateBroadcastKey:(unsigned __int8)a3 queue:(id)a4 withCompletionHandler:(id)a5
{
  id v6;
  NSObject *v7;
  id v8;
  _QWORD block[4];
  id v10;

  v6 = a5;
  -[HAPAccessoryServer clientQueue](self, "clientQueue");
  v7 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __79___HAPAccessoryServerBTLE100_generateBroadcastKey_queue_withCompletionHandler___block_invoke;
  block[3] = &unk_1E894D498;
  v10 = v6;
  v8 = v6;
  dispatch_async(v7, block);

}

- (void)configureCharacteristics:(id)a3 queue:(id)a4 withCompletionHandler:(id)a5
{
  id v6;
  NSObject *v7;
  id v8;
  _QWORD block[4];
  id v10;

  v6 = a5;
  -[HAPAccessoryServer clientQueue](self, "clientQueue");
  v7 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __83___HAPAccessoryServerBTLE100_configureCharacteristics_queue_withCompletionHandler___block_invoke;
  block[3] = &unk_1E894D498;
  v10 = v6;
  v8 = v6;
  dispatch_async(v7, block);

}

- (void)startPairingWithRequest:(id)a3
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
  v7[2] = __54___HAPAccessoryServerBTLE100_startPairingWithRequest___block_invoke;
  v7[3] = &unk_1E894E0F8;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, v7);

}

- (void)continuePairingAfterAuthPrompt
{
  NSObject *v3;
  _QWORD block[5];

  -[HAPAccessoryServer clientQueue](self, "clientQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __60___HAPAccessoryServerBTLE100_continuePairingAfterAuthPrompt__block_invoke;
  block[3] = &unk_1E894DD08;
  block[4] = self;
  dispatch_async(v3, block);

}

- (void)_checkForAuthPrompt
{
  void *v3;
  NSObject *v4;
  void *v5;
  unint64_t pairingFeatureFlags;
  uint64_t pairingFeatureFlags_low;
  void *v8;
  NSObject *v9;
  _BOOL4 v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  HAPAccessoryInfo *v17;
  void *v18;
  void *v19;
  HAPAccessoryInfo *v20;
  NSObject *v21;
  HAPAccessoryInfo *v22;
  NSObject *v23;
  _QWORD v24[5];
  _QWORD block[5];
  HAPAccessoryInfo *v26;
  uint8_t buf[4];
  void *v28;
  __int16 v29;
  unint64_t v30;
  __int16 v31;
  void *v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v3 = (void *)MEMORY[0x1D17B7244](self, a2);
  HMFGetOSLogHandle();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    pairingFeatureFlags = self->_pairingFeatureFlags;
    *(_DWORD *)buf = 138543618;
    v28 = v5;
    v29 = 2048;
    v30 = pairingFeatureFlags;
    _os_log_impl(&dword_1CCE01000, v4, OS_LOG_TYPE_INFO, "%{public}@[BTLE] PairingFeatureFlags = %llu", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v3);
  pairingFeatureFlags_low = LOBYTE(self->_pairingFeatureFlags);
  v8 = (void *)MEMORY[0x1D17B7244]();
  HMFGetOSLogHandle();
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = os_log_type_enabled(v9, OS_LOG_TYPE_INFO);
  if (pairingFeatureFlags_low)
  {
    if (v10)
    {
      HMFGetLogIdentifier();
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[HAPAccessoryServer identifier](self, "identifier");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[HAPAccessoryServer name](self, "name");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v28 = v11;
      v29 = 2112;
      v30 = (unint64_t)v12;
      v31 = 2112;
      v32 = v13;
      _os_log_impl(&dword_1CCE01000, v9, OS_LOG_TYPE_INFO, "%{public}@[BTLE Accessory Server %@ %@] Accessory supports auth, skipping prompting user...", buf, 0x20u);

    }
    objc_autoreleasePoolPop(v8);
    -[_HAPAccessoryServerBTLE100 _handlePairingStateMachine](self, "_handlePairingStateMachine");
  }
  else
  {
    if (v10)
    {
      HMFGetLogIdentifier();
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      -[HAPAccessoryServer identifier](self, "identifier");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      -[HAPAccessoryServer name](self, "name");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v28 = v14;
      v29 = 2112;
      v30 = (unint64_t)v15;
      v31 = 2112;
      v32 = v16;
      _os_log_impl(&dword_1CCE01000, v9, OS_LOG_TYPE_INFO, "%{public}@[BTLE Accessory Server %@ %@] Accessory doesn't support auth, prompting user...", buf, 0x20u);

    }
    objc_autoreleasePoolPop(v8);
    if (-[_HAPAccessoryServerBTLE100 _delegateRespondsToSelector:](self, "_delegateRespondsToSelector:", sel_accessoryServer_requestUserPermission_accessoryInfo_error_))
    {
      v17 = [HAPAccessoryInfo alloc];
      -[HAPAccessoryServer name](self, "name");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      -[HAPAccessoryServer category](self, "category");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = -[HAPAccessoryInfo initWithName:manufacturer:modelName:category:certificationStatus:denylisted:ppid:](v17, "initWithName:manufacturer:modelName:category:certificationStatus:denylisted:ppid:", v18, 0, 0, v19, 0, 0, 0);

      -[HAPAccessoryServer delegateQueue](self, "delegateQueue");
      v21 = objc_claimAutoreleasedReturnValue();
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __49___HAPAccessoryServerBTLE100__checkForAuthPrompt__block_invoke;
      block[3] = &unk_1E894E0F8;
      block[4] = self;
      v26 = v20;
      v22 = v20;
      dispatch_async(v21, block);

    }
    else
    {
      if (-[_HAPAccessoryServerBTLE100 _delegateRespondsToSelector:](self, "_delegateRespondsToSelector:", sel_accessoryServer_didStopPairingWithError_))
      {
        -[HAPAccessoryServer delegateQueue](self, "delegateQueue");
        v23 = objc_claimAutoreleasedReturnValue();
        v24[0] = MEMORY[0x1E0C809B0];
        v24[1] = 3221225472;
        v24[2] = __49___HAPAccessoryServerBTLE100__checkForAuthPrompt__block_invoke_2;
        v24[3] = &unk_1E894DD08;
        v24[4] = self;
        dispatch_async(v23, v24);

      }
      -[_HAPAccessoryServerBTLE100 setStartPairingRequested:](self, "setStartPairingRequested:", 0);
    }
  }
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
  v10[2] = __84___HAPAccessoryServerBTLE100_tryPairingPassword_onboardingSetupPayloadString_error___block_invoke;
  v10[3] = &unk_1E894E0F8;
  v10[4] = self;
  v11 = v6;
  v8 = v6;
  dispatch_async(v7, v10);

  return 1;
}

- (void)continueAuthAfterValidation:(BOOL)a3
{
  void *v4;
  NSObject *v5;
  _QWORD v6[5];
  id v7;

  if (a3)
  {
    -[_HAPAccessoryServerBTLE100 continuePairingAfterAuthPrompt](self, "continuePairingAfterAuthPrompt");
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "hapErrorWithCode:description:reason:suggestion:underlyingError:", 2, CFSTR("Pairing Failed."), CFSTR("User cancelled pairing"), 0, 0);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (-[_HAPAccessoryServerBTLE100 _delegateRespondsToSelector:](self, "_delegateRespondsToSelector:", sel_accessoryServer_didStopPairingWithError_))
    {
      -[HAPAccessoryServer delegateQueue](self, "delegateQueue");
      v5 = objc_claimAutoreleasedReturnValue();
      v6[0] = MEMORY[0x1E0C809B0];
      v6[1] = 3221225472;
      v6[2] = __58___HAPAccessoryServerBTLE100_continueAuthAfterValidation___block_invoke;
      v6[3] = &unk_1E894E0F8;
      v6[4] = self;
      v7 = v4;
      dispatch_async(v5, v6);

    }
  }
}

- (void)_handlePairingStateMachine
{
  _HAPAccessoryServerBTLE100 *v2;
  void *v3;
  NSObject *v4;
  void *v5;
  _HAPAccessoryServerBTLE100 *v6;
  __CFString *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  __CFString *v11;
  __CFString *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  void *v17;
  NSObject *v18;
  void *v19;
  __CFString *v20;
  void *v21;
  void *v22;
  void *v23;
  NSObject *v24;
  void *v25;
  uint64_t v26;
  __CFString *v27;
  void *v28;
  void *v29;
  uint64_t v30;
  __int128 v31;
  uint64_t v32;
  uint64_t i;
  void *v34;
  void *v35;
  NSObject *v36;
  void *v37;
  __CFString *v38;
  void *v39;
  char *v40;
  void *v41;
  void *v42;
  int v43;
  void *v44;
  void *v45;
  int v46;
  uint64_t v47;
  void *v48;
  void *v49;
  uint64_t v50;
  void *v51;
  void *v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t j;
  void *v57;
  void *v58;
  void *v59;
  int v60;
  void *v61;
  void *v62;
  int v63;
  void *v64;
  void *v65;
  int v66;
  void *v67;
  void *v68;
  int v69;
  uint64_t v70;
  void *v71;
  uint64_t v72;
  void *v73;
  uint64_t v74;
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  void *v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t k;
  void *v84;
  void *v85;
  void *v86;
  int v87;
  void *v88;
  void *v89;
  int v90;
  void *v91;
  void *v92;
  int v93;
  void *v94;
  void *v95;
  int v96;
  void *v97;
  void *v98;
  char v99;
  void *v100;
  NSObject *v101;
  void *v102;
  __CFString *v103;
  void *v104;
  const char *v105;
  uint64_t v106;
  void *v107;
  uint64_t v108;
  void *v109;
  uint64_t v110;
  void *v111;
  void *v112;
  char v113;
  void *v114;
  __CFString *v115;
  __int128 v116;
  id obj;
  uint64_t v118;
  char v119;
  _HAPAccessoryServerBTLE100 *v120;
  __int128 v121;
  __int128 v122;
  __int128 v123;
  __int128 v124;
  __int128 v125;
  __int128 v126;
  __int128 v127;
  __int128 v128;
  __int128 v129;
  __int128 v130;
  __int128 v131;
  __int128 v132;
  _BYTE v133[128];
  _BYTE v134[128];
  uint8_t v135[128];
  uint8_t buf[4];
  void *v137;
  __int16 v138;
  __CFString *v139;
  __int16 v140;
  void *v141;
  __int16 v142;
  const char *v143;
  __int16 v144;
  uint64_t v145;
  __int16 v146;
  __CFString *v147;
  uint64_t v148;

  v2 = self;
  v148 = *MEMORY[0x1E0C80C00];
  v3 = (void *)MEMORY[0x1D17B7244](self, a2);
  HMFGetOSLogHandle();
  v4 = objc_claimAutoreleasedReturnValue();
  v120 = v2;
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[HAPAccessoryServer identifier](v2, "identifier");
    v6 = v2;
    v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
    -[HAPAccessoryServer name](v6, "name");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = -[_HAPAccessoryServerBTLE100 state](v6, "state");
    v10 = -[_HAPAccessoryServerBTLE100 state](v6, "state");
    if ((unint64_t)(v10 - 1) > 0xB)
      v11 = CFSTR("Unknown State");
    else
      v11 = off_1E894DE40[v10 - 1];
    v12 = v11;
    *(_DWORD *)buf = 138544642;
    v137 = v5;
    v138 = 2112;
    v139 = v7;
    v140 = 2112;
    v141 = v8;
    v142 = 2080;
    v143 = "-[_HAPAccessoryServerBTLE100 _handlePairingStateMachine]";
    v144 = 2048;
    v145 = v9;
    v146 = 2112;
    v147 = v12;
    _os_log_impl(&dword_1CCE01000, v4, OS_LOG_TYPE_INFO, "%{public}@[BTLE Accessory Server %@ %@] %s with state %lu (%@)", buf, 0x3Eu);

    v2 = v120;
  }

  objc_autoreleasePoolPop(v3);
  switch(-[_HAPAccessoryServerBTLE100 state](v2, "state"))
  {
    case 1uLL:
      -[HAPAccessoryServerBTLE peripheral](v2, "peripheral");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = objc_msgSend(v13, "state");

      if (v14)
      {
        -[HAPAccessoryServerBTLE peripheral](v2, "peripheral");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = objc_msgSend(v15, "state");

        if (v16 == 2)
        {
          -[_HAPAccessoryServerBTLE100 setState:](v2, "setState:", 2);
          v17 = (void *)MEMORY[0x1D17B7244](-[_HAPAccessoryServerBTLE100 _updateConnectionLifetimeTimer](v2, "_updateConnectionLifetimeTimer"));
          HMFGetOSLogHandle();
          v18 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
          {
            HMFGetLogIdentifier();
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            -[HAPAccessoryServer identifier](v2, "identifier");
            v20 = (__CFString *)objc_claimAutoreleasedReturnValue();
            -[HAPAccessoryServer name](v120, "name");
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543874;
            v137 = v19;
            v138 = 2112;
            v139 = v20;
            v140 = 2112;
            v141 = v21;
            _os_log_impl(&dword_1CCE01000, v18, OS_LOG_TYPE_INFO, "%{public}@[BTLE Accessory Server %@ %@] Discovering services", buf, 0x20u);

            v2 = v120;
          }

          objc_autoreleasePoolPop(v17);
          -[HAPAccessoryServerBTLE peripheral](v2, "peripheral");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v22, "discoverServices:", 0);
          goto LABEL_104;
        }
      }
      else
      {
        -[_HAPAccessoryServerBTLE100 _updateConnectionLifetimeTimer](v2, "_updateConnectionLifetimeTimer");
        -[_HAPAccessoryServerBTLE100 _setupBTLEConnectionToPeripheral](v2, "_setupBTLEConnectionToPeripheral");
      }
      return;
    case 2uLL:
      v131 = 0u;
      v132 = 0u;
      v129 = 0u;
      v130 = 0u;
      -[HAPAccessoryServerBTLE peripheral](v2, "peripheral");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "services");
      v29 = (void *)objc_claimAutoreleasedReturnValue();

      obj = v29;
      v30 = objc_msgSend(v29, "countByEnumeratingWithState:objects:count:", &v129, v135, 16);
      if (v30)
      {
        v32 = v30;
        v118 = *(_QWORD *)v130;
        *(_QWORD *)&v31 = 138544130;
        v116 = v31;
        do
        {
          for (i = 0; i != v32; ++i)
          {
            if (*(_QWORD *)v130 != v118)
              objc_enumerationMutation(obj);
            v34 = *(void **)(*((_QWORD *)&v129 + 1) + 8 * i);
            v35 = (void *)MEMORY[0x1D17B7244]();
            HMFGetOSLogHandle();
            v36 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v36, OS_LOG_TYPE_INFO))
            {
              HMFGetLogIdentifier();
              v37 = (void *)objc_claimAutoreleasedReturnValue();
              -[HAPAccessoryServer identifier](v2, "identifier");
              v38 = (__CFString *)objc_claimAutoreleasedReturnValue();
              -[HAPAccessoryServer name](v120, "name");
              v39 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v34, "UUID");
              v40 = (char *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = v116;
              v137 = v37;
              v138 = 2112;
              v139 = v38;
              v140 = 2112;
              v141 = v39;
              v142 = 2112;
              v143 = v40;
              _os_log_impl(&dword_1CCE01000, v36, OS_LOG_TYPE_INFO, "%{public}@[BTLE Accessory Server %@ %@] current service UUID: %@", buf, 0x2Au);

              v2 = v120;
            }

            objc_autoreleasePoolPop(v35);
            objc_msgSend(v34, "UUID");
            v41 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(MEMORY[0x1E0C97778], "UUIDWithString:", CFSTR("FED4"));
            v42 = (void *)objc_claimAutoreleasedReturnValue();
            v43 = objc_msgSend(v41, "isEqual:", v42);

            if (v43)
              -[_HAPAccessoryServerBTLE100 setPairingService:](v2, "setPairingService:", v34);
            objc_msgSend(v34, "UUID", v116);
            v44 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(MEMORY[0x1E0C97778], "UUIDWithString:", CFSTR("FED3"));
            v45 = (void *)objc_claimAutoreleasedReturnValue();
            v46 = objc_msgSend(v44, "isEqual:", v45);

            if (v46)
              -[_HAPAccessoryServerBTLE100 setAccessoryInfoService:](v2, "setAccessoryInfoService:", v34);
          }
          v32 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v129, v135, 16);
        }
        while (v32);
      }

      -[_HAPAccessoryServerBTLE100 pairingService](v2, "pairingService");
      v47 = objc_claimAutoreleasedReturnValue();
      if (v47)
      {
        v48 = (void *)v47;
        -[_HAPAccessoryServerBTLE100 accessoryInfoService](v2, "accessoryInfoService");
        v49 = (void *)objc_claimAutoreleasedReturnValue();

        if (v49)
        {
          -[_HAPAccessoryServerBTLE100 setState:](v2, "setState:", 3);
          -[_HAPAccessoryServerBTLE100 _updateConnectionLifetimeTimer](v2, "_updateConnectionLifetimeTimer");
          -[HAPAccessoryServerBTLE peripheral](v2, "peripheral");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          -[_HAPAccessoryServerBTLE100 pairingService](v2, "pairingService");
          v50 = objc_claimAutoreleasedReturnValue();
          goto LABEL_56;
        }
      }
      v100 = (void *)MEMORY[0x1D17B7244]();
      HMFGetOSLogHandle();
      v101 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v101, OS_LOG_TYPE_ERROR))
        goto LABEL_103;
      HMFGetLogIdentifier();
      v102 = (void *)objc_claimAutoreleasedReturnValue();
      -[HAPAccessoryServer identifier](v2, "identifier");
      v103 = (__CFString *)objc_claimAutoreleasedReturnValue();
      -[HAPAccessoryServer name](v2, "name");
      v104 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v137 = v102;
      v138 = 2112;
      v139 = v103;
      v140 = 2112;
      v141 = v104;
      v105 = "%{public}@[BTLE Accessory Server %@ %@] Unable to discover pairing service or accessory info service!";
      goto LABEL_102;
    case 3uLL:
      v127 = 0u;
      v128 = 0u;
      v125 = 0u;
      v126 = 0u;
      -[_HAPAccessoryServerBTLE100 pairingService](v2, "pairingService");
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v51, "characteristics");
      v52 = (void *)objc_claimAutoreleasedReturnValue();

      v53 = objc_msgSend(v52, "countByEnumeratingWithState:objects:count:", &v125, v134, 16);
      if (v53)
      {
        v54 = v53;
        v55 = *(_QWORD *)v126;
        do
        {
          for (j = 0; j != v54; ++j)
          {
            if (*(_QWORD *)v126 != v55)
              objc_enumerationMutation(v52);
            v57 = *(void **)(*((_QWORD *)&v125 + 1) + 8 * j);
            objc_msgSend(v57, "UUID");
            v58 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(MEMORY[0x1E0C97778], "UUIDWithString:", CFSTR("0000004C-0000-1000-8000-0026BB765291"));
            v59 = (void *)objc_claimAutoreleasedReturnValue();
            v60 = objc_msgSend(v58, "isEqual:", v59);

            if (v60)
            {
              -[_HAPAccessoryServerBTLE100 setPairSetupCharacteristic:](v120, "setPairSetupCharacteristic:", v57);
            }
            else
            {
              objc_msgSend(v57, "UUID");
              v61 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(MEMORY[0x1E0C97778], "UUIDWithString:", CFSTR("0000004E-0000-1000-8000-0026BB765291"));
              v62 = (void *)objc_claimAutoreleasedReturnValue();
              v63 = objc_msgSend(v61, "isEqual:", v62);

              if (v63)
              {
                -[_HAPAccessoryServerBTLE100 setPairVerifyCharacteristic:](v120, "setPairVerifyCharacteristic:", v57);
              }
              else
              {
                objc_msgSend(v57, "UUID");
                v64 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(MEMORY[0x1E0C97778], "UUIDWithString:", CFSTR("0000004F-0000-1000-8000-0026BB765291"));
                v65 = (void *)objc_claimAutoreleasedReturnValue();
                v66 = objc_msgSend(v64, "isEqual:", v65);

                if (v66)
                {
                  -[_HAPAccessoryServerBTLE100 setPairingFeaturesCharacteristic:](v120, "setPairingFeaturesCharacteristic:", v57);
                }
                else
                {
                  objc_msgSend(v57, "UUID");
                  v67 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(MEMORY[0x1E0C97778], "UUIDWithString:", CFSTR("00000050-0000-1000-8000-0026BB765291"));
                  v68 = (void *)objc_claimAutoreleasedReturnValue();
                  v69 = objc_msgSend(v67, "isEqual:", v68);

                  if (v69)
                    -[_HAPAccessoryServerBTLE100 setPairingsCharacteristic:](v120, "setPairingsCharacteristic:", v57);
                }
              }
            }
          }
          v54 = objc_msgSend(v52, "countByEnumeratingWithState:objects:count:", &v125, v134, 16);
        }
        while (v54);
      }

      v2 = v120;
      -[_HAPAccessoryServerBTLE100 pairSetupCharacteristic](v120, "pairSetupCharacteristic");
      v70 = objc_claimAutoreleasedReturnValue();
      if (!v70)
        goto LABEL_96;
      v71 = (void *)v70;
      -[_HAPAccessoryServerBTLE100 pairVerifyCharacteristic](v120, "pairVerifyCharacteristic");
      v72 = objc_claimAutoreleasedReturnValue();
      if (!v72)
        goto LABEL_95;
      v73 = (void *)v72;
      -[_HAPAccessoryServerBTLE100 pairingFeaturesCharacteristic](v120, "pairingFeaturesCharacteristic");
      v74 = objc_claimAutoreleasedReturnValue();
      if (v74)
      {
        v75 = (void *)v74;
        -[_HAPAccessoryServerBTLE100 pairingsCharacteristic](v120, "pairingsCharacteristic");
        v76 = (void *)objc_claimAutoreleasedReturnValue();

        if (v76)
        {
          -[_HAPAccessoryServerBTLE100 setState:](v120, "setState:", 4);
          -[_HAPAccessoryServerBTLE100 _updateConnectionLifetimeTimer](v120, "_updateConnectionLifetimeTimer");
          -[HAPAccessoryServerBTLE peripheral](v120, "peripheral");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          -[_HAPAccessoryServerBTLE100 pairingFeaturesCharacteristic](v120, "pairingFeaturesCharacteristic");
          v77 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v22, "readValueForCharacteristic:", v77);
          goto LABEL_57;
        }
      }
      else
      {

LABEL_95:
      }
LABEL_96:
      v100 = (void *)MEMORY[0x1D17B7244]();
      HMFGetOSLogHandle();
      v101 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v101, OS_LOG_TYPE_ERROR))
        goto LABEL_103;
      HMFGetLogIdentifier();
      v102 = (void *)objc_claimAutoreleasedReturnValue();
      -[HAPAccessoryServer identifier](v120, "identifier");
      v103 = (__CFString *)objc_claimAutoreleasedReturnValue();
      -[HAPAccessoryServer name](v120, "name");
      v104 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v137 = v102;
      v138 = 2112;
      v139 = v103;
      v140 = 2112;
      v141 = v104;
      v105 = "%{public}@[BTLE Accessory Server %@ %@] Unable to find all pairing characteristics in the pairing service";
      goto LABEL_102;
    case 4uLL:
      if (-[_HAPAccessoryServerBTLE100 pairingFeaturesRead](v2, "pairingFeaturesRead"))
      {
        if (-[_HAPAccessoryServerBTLE100 startPairingRequested](v2, "startPairingRequested"))
        {
          -[_HAPAccessoryServerBTLE100 setState:](v2, "setState:", 5);
          -[_HAPAccessoryServerBTLE100 _cancelConnectionLifetimeTimer](v2, "_cancelConnectionLifetimeTimer");
          -[_HAPAccessoryServerBTLE100 _checkForAuthPrompt](v2, "_checkForAuthPrompt");
          return;
        }
LABEL_55:
        -[_HAPAccessoryServerBTLE100 setState:](v2, "setState:", 6);
        -[HAPAccessoryServerBTLE peripheral](v2, "peripheral");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        -[_HAPAccessoryServerBTLE100 accessoryInfoService](v2, "accessoryInfoService");
        v50 = objc_claimAutoreleasedReturnValue();
LABEL_56:
        v77 = (void *)v50;
        objc_msgSend(v22, "discoverCharacteristics:forService:", 0, v50);
        goto LABEL_57;
      }
      v100 = (void *)MEMORY[0x1D17B7244]();
      HMFGetOSLogHandle();
      v101 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v101, OS_LOG_TYPE_ERROR))
        goto LABEL_103;
      HMFGetLogIdentifier();
      v102 = (void *)objc_claimAutoreleasedReturnValue();
      -[HAPAccessoryServer identifier](v2, "identifier");
      v103 = (__CFString *)objc_claimAutoreleasedReturnValue();
      -[HAPAccessoryServer name](v2, "name");
      v104 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v137 = v102;
      v138 = 2112;
      v139 = v103;
      v140 = 2112;
      v141 = v104;
      v105 = "%{public}@[BTLE Accessory Server %@ %@] Unable to read pairing features characteristic";
      goto LABEL_102;
    case 5uLL:
      -[_HAPAccessoryServerBTLE100 _updateConnectionLifetimeTimer](v2, "_updateConnectionLifetimeTimer");
      goto LABEL_55;
    case 6uLL:
      v123 = 0u;
      v124 = 0u;
      v121 = 0u;
      v122 = 0u;
      -[_HAPAccessoryServerBTLE100 accessoryInfoService](v2, "accessoryInfoService");
      v78 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v78, "characteristics");
      v79 = (void *)objc_claimAutoreleasedReturnValue();

      v80 = objc_msgSend(v79, "countByEnumeratingWithState:objects:count:", &v121, v133, 16);
      if (v80)
      {
        v81 = v80;
        v119 = 0;
        v82 = *(_QWORD *)v122;
        do
        {
          for (k = 0; k != v81; ++k)
          {
            if (*(_QWORD *)v122 != v82)
              objc_enumerationMutation(v79);
            v84 = *(void **)(*((_QWORD *)&v121 + 1) + 8 * k);
            objc_msgSend(v84, "UUID");
            v85 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(MEMORY[0x1E0C97778], "UUIDWithString:", CFSTR("00000014-0000-1000-8000-0026BB765291"));
            v86 = (void *)objc_claimAutoreleasedReturnValue();
            v87 = objc_msgSend(v85, "isEqual:", v86);

            if (v87)
            {
              -[_HAPAccessoryServerBTLE100 setIdentifyCharacteristic:](v120, "setIdentifyCharacteristic:", v84);
            }
            else
            {
              objc_msgSend(v84, "UUID");
              v88 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(MEMORY[0x1E0C97778], "UUIDWithString:", CFSTR("00000021-0000-1000-8000-0026BB765291"));
              v89 = (void *)objc_claimAutoreleasedReturnValue();
              v90 = objc_msgSend(v88, "isEqual:", v89);

              if (v90)
              {
                -[_HAPAccessoryServerBTLE100 setModelCharacteristic:](v120, "setModelCharacteristic:", v84);
              }
              else
              {
                objc_msgSend(v84, "UUID");
                v91 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(MEMORY[0x1E0C97778], "UUIDWithString:", CFSTR("00000020-0000-1000-8000-0026BB765291"));
                v92 = (void *)objc_claimAutoreleasedReturnValue();
                v93 = objc_msgSend(v91, "isEqual:", v92);

                if (v93)
                {
                  -[_HAPAccessoryServerBTLE100 setManufacturerCharacteristic:](v120, "setManufacturerCharacteristic:", v84);
                }
                else
                {
                  objc_msgSend(v84, "UUID");
                  v94 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(MEMORY[0x1E0C97778], "UUIDWithString:", CFSTR("00000030-0000-1000-8000-0026BB765291"));
                  v95 = (void *)objc_claimAutoreleasedReturnValue();
                  v96 = objc_msgSend(v94, "isEqual:", v95);

                  if (v96)
                  {
                    -[_HAPAccessoryServerBTLE100 setSerialNumberCharacteristic:](v120, "setSerialNumberCharacteristic:", v84);
                  }
                  else
                  {
                    objc_msgSend(v84, "UUID");
                    v97 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(MEMORY[0x1E0C97778], "UUIDWithString:", CFSTR("00000051-0000-1000-8000-0026BB765291"));
                    v98 = (void *)objc_claimAutoreleasedReturnValue();
                    v99 = objc_msgSend(v97, "isEqual:", v98);

                    v119 |= v99;
                  }
                }
              }
            }
          }
          v81 = objc_msgSend(v79, "countByEnumeratingWithState:objects:count:", &v121, v133, 16);
        }
        while (v81);
      }
      else
      {
        v119 = 0;
      }

      v2 = v120;
      -[_HAPAccessoryServerBTLE100 identifyCharacteristic](v120, "identifyCharacteristic");
      v106 = objc_claimAutoreleasedReturnValue();
      if (!v106)
        goto LABEL_100;
      v107 = (void *)v106;
      -[_HAPAccessoryServerBTLE100 modelCharacteristic](v120, "modelCharacteristic");
      v108 = objc_claimAutoreleasedReturnValue();
      if (!v108)
        goto LABEL_99;
      v109 = (void *)v108;
      -[_HAPAccessoryServerBTLE100 manufacturerCharacteristic](v120, "manufacturerCharacteristic");
      v110 = objc_claimAutoreleasedReturnValue();
      if (!v110)
      {

LABEL_99:
        goto LABEL_100;
      }
      v111 = (void *)v110;
      -[_HAPAccessoryServerBTLE100 serialNumberCharacteristic](v120, "serialNumberCharacteristic");
      v112 = (void *)objc_claimAutoreleasedReturnValue();
      v113 = (v112 != 0) & v119;

      if ((v113 & 1) == 0)
      {
LABEL_100:
        v100 = (void *)MEMORY[0x1D17B7244]();
        HMFGetOSLogHandle();
        v101 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v101, OS_LOG_TYPE_ERROR))
        {
          HMFGetLogIdentifier();
          v102 = (void *)objc_claimAutoreleasedReturnValue();
          -[HAPAccessoryServer identifier](v120, "identifier");
          v103 = (__CFString *)objc_claimAutoreleasedReturnValue();
          -[HAPAccessoryServer name](v120, "name");
          v104 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543874;
          v137 = v102;
          v138 = 2112;
          v139 = v103;
          v140 = 2112;
          v141 = v104;
          v105 = "%{public}@[BTLE Accessory Server %@ %@] Unable to find all accessory info characteristics in the pairing service";
LABEL_102:
          _os_log_impl(&dword_1CCE01000, v101, OS_LOG_TYPE_ERROR, v105, buf, 0x20u);

          v2 = v120;
        }
LABEL_103:

        objc_autoreleasePoolPop(v100);
        -[HAPAccessoryServerBTLE browser](v2, "browser");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "disconnectFromBTLEAccessoryServer:", v2);
        goto LABEL_104;
      }
      if (-[_HAPAccessoryServerBTLE100 unpairedIdentifyRequested](v120, "unpairedIdentifyRequested"))
      {
        buf[0] = 1;
        objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", buf, 1);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        -[HAPAccessoryServerBTLE peripheral](v120, "peripheral");
        v77 = (void *)objc_claimAutoreleasedReturnValue();
        -[_HAPAccessoryServerBTLE100 identifyCharacteristic](v120, "identifyCharacteristic");
        v114 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v77, "writeValue:forCharacteristic:type:", v22, v114, 0);

LABEL_57:
LABEL_104:

        return;
      }
      if (-[_HAPAccessoryServerBTLE100 startPairingRequested](v120, "startPairingRequested"))
      {
        -[_HAPAccessoryServerBTLE100 setState:](v120, "setState:", 7);
        -[_HAPAccessoryServerBTLE100 _pairSetupStart](v120, "_pairSetupStart");
      }
      else
      {
LABEL_108:
        -[_HAPAccessoryServerBTLE100 setState:](v2, "setState:", 8);
        -[_HAPAccessoryServerBTLE100 _reallyEstablishSecureSession](v2, "_reallyEstablishSecureSession");
      }
      return;
    case 7uLL:
      goto LABEL_108;
    case 8uLL:
      -[_HAPAccessoryServerBTLE100 setState:](v2, "setState:", 9);
      -[_HAPAccessoryServerBTLE100 _handleHAPServiceDiscovery](v2, "_handleHAPServiceDiscovery");
      return;
    case 9uLL:
      -[_HAPAccessoryServerBTLE100 setState:](v2, "setState:", 10);
      -[_HAPAccessoryServerBTLE100 _handleDescriptorDiscovery](v2, "_handleDescriptorDiscovery");
      return;
    case 10uLL:
      -[_HAPAccessoryServerBTLE100 setState:](v2, "setState:", 11);
      -[_HAPAccessoryServerBTLE100 _handleReadDescriptorValues](v2, "_handleReadDescriptorValues");
      return;
    case 11uLL:
      -[_HAPAccessoryServerBTLE100 setState:](v2, "setState:", 12);
      return;
    default:
      v23 = (void *)MEMORY[0x1D17B7244]();
      HMFGetOSLogHandle();
      v24 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        v26 = -[_HAPAccessoryServerBTLE100 state](v2, "state");
        if ((unint64_t)(v26 - 1) > 0xB)
          v27 = CFSTR("Unknown State");
        else
          v27 = off_1E894DE40[v26 - 1];
        v115 = v27;
        *(_DWORD *)buf = 138543618;
        v137 = v25;
        v138 = 2112;
        v139 = v115;
        _os_log_impl(&dword_1CCE01000, v24, OS_LOG_TYPE_ERROR, "%{public}@### Unhandled pairing state for BTLE accessory: '%@'", buf, 0x16u);

      }
      objc_autoreleasePoolPop(v23);
      return;
  }
}

- (BOOL)stopPairingWithError:(id *)a3
{
  NSObject *v4;
  _QWORD block[5];

  -[HAPAccessoryServer clientQueue](self, "clientQueue", a3);
  v4 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __51___HAPAccessoryServerBTLE100_stopPairingWithError___block_invoke;
  block[3] = &unk_1E894DD08;
  block[4] = self;
  dispatch_async(v4, block);

  return 1;
}

- (void)enableEvents:(BOOL)a3 forCharacteristics:(id)a4 withCompletionHandler:(id)a5 queue:(id)a6
{
  id v10;
  id v11;
  id v12;
  NSObject *v13;
  id v14;
  id v15;
  id v16;
  _QWORD block[5];
  id v18;
  id v19;
  id v20;
  BOOL v21;

  v10 = a4;
  v11 = a5;
  v12 = a6;
  -[HAPAccessoryServer clientQueue](self, "clientQueue");
  v13 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __90___HAPAccessoryServerBTLE100_enableEvents_forCharacteristics_withCompletionHandler_queue___block_invoke;
  block[3] = &unk_1E894D518;
  v21 = a3;
  block[4] = self;
  v18 = v10;
  v19 = v12;
  v20 = v11;
  v14 = v12;
  v15 = v11;
  v16 = v10;
  dispatch_async(v13, block);

}

- (void)_enableEvents:(BOOL)a3 forCharacteristics:(id)a4 withCompletionHandler:(id)a5 queue:(id)a6
{
  _BOOL8 v8;
  id v10;
  id v11;
  void *v12;
  NSObject *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  NSObject *v20;
  id v21;
  id v22;
  id v23;
  id v24;
  id v25;
  id obj;
  _QWORD block[5];
  id v28;
  id v29;
  id v30;
  id v31;
  BOOL v32;
  _QWORD v33[4];
  id v34;
  NSObject *v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  _BYTE v40[128];
  uint64_t v41;

  v8 = a3;
  v41 = *MEMORY[0x1E0C80C00];
  v10 = a4;
  v25 = a5;
  v11 = a6;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = dispatch_group_create();
  v36 = 0u;
  v37 = 0u;
  v38 = 0u;
  v39 = 0u;
  obj = v10;
  v14 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v36, v40, 16);
  if (v14)
  {
    v15 = v14;
    v16 = *(_QWORD *)v37;
    do
    {
      v17 = 0;
      do
      {
        if (*(_QWORD *)v37 != v16)
          objc_enumerationMutation(obj);
        v18 = *(_QWORD *)(*((_QWORD *)&v36 + 1) + 8 * v17);
        dispatch_group_enter(v13);
        v33[0] = MEMORY[0x1E0C809B0];
        v33[1] = 3221225472;
        v33[2] = __91___HAPAccessoryServerBTLE100__enableEvents_forCharacteristics_withCompletionHandler_queue___block_invoke;
        v33[3] = &unk_1E894D540;
        v34 = v12;
        v35 = v13;
        v19 = (void *)MEMORY[0x1D17B7400](v33);
        -[_HAPAccessoryServerBTLE100 _enableEvent:forCharacteristic:withCompletionHandler:queue:](self, "_enableEvent:forCharacteristic:withCompletionHandler:queue:", v8, v18, v19, v11);

        ++v17;
      }
      while (v15 != v17);
      v15 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v36, v40, 16);
    }
    while (v15);
  }

  -[HAPAccessoryServer clientQueue](self, "clientQueue");
  v20 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __91___HAPAccessoryServerBTLE100__enableEvents_forCharacteristics_withCompletionHandler_queue___block_invoke_101;
  block[3] = &unk_1E894D590;
  v30 = obj;
  v31 = v25;
  block[4] = self;
  v28 = v11;
  v32 = v8;
  v29 = v12;
  v21 = obj;
  v22 = v12;
  v23 = v11;
  v24 = v25;
  dispatch_group_notify(v13, v20, block);

}

- (void)_enableEvent:(BOOL)a3 forCharacteristic:(id)a4 withCompletionHandler:(id)a5 queue:(id)a6
{
  id v9;
  id v10;
  NSObject *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  NSObject *v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  NSObject *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  NSObject *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  NSObject *v38;
  void *v39;
  void *v40;
  _BOOL4 v41;
  _QWORD v42[4];
  NSObject *v43;
  id v44;
  BOOL v45;
  _QWORD v46[4];
  id v47;
  id v48;
  id v49;
  _QWORD block[4];
  id v51;
  id v52;
  id v53;
  _QWORD v54[4];
  id v55;
  id v56;
  id v57;
  _QWORD v58[2];
  _QWORD v59[2];
  _QWORD v60[2];
  _QWORD v61[2];
  _QWORD v62[2];
  _QWORD v63[2];
  uint8_t buf[4];
  void *v65;
  __int16 v66;
  id v67;
  __int16 v68;
  void *v69;
  __int16 v70;
  _BOOL4 v71;
  __int16 v72;
  id v73;
  uint64_t v74;

  v41 = a3;
  v74 = *MEMORY[0x1E0C80C00];
  v9 = a4;
  v10 = a5;
  v11 = a6;
  -[_HAPAccessoryServerBTLE100 _btleCharacteristicForHAPCharacteristic:](self, "_btleCharacteristicForHAPCharacteristic:", v9);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (void *)MEMORY[0x1D17B7244]();
  HMFGetOSLogHandle();
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v15 = v11;
    v16 = v10;
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[HAPAccessoryServer identifier](self, "identifier");
    v18 = v12;
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[HAPAccessoryServer name](self, "name");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138544386;
    v65 = v17;
    v66 = 2112;
    v67 = v19;
    v68 = 2112;
    v69 = v20;
    v70 = 1024;
    v71 = v41;
    v72 = 2112;
    v73 = v9;
    _os_log_impl(&dword_1CCE01000, v14, OS_LOG_TYPE_INFO, "%{public}@[BTLE Accessory %@ %@] Enable Events :%d for Characteristics: %@", buf, 0x30u);

    v12 = v18;
    v10 = v16;
    v11 = v15;
  }

  objc_autoreleasePoolPop(v13);
  if (!v12)
  {
    v30 = (void *)MEMORY[0x1D17B7244]();
    HMFGetOSLogHandle();
    v31 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v65 = v32;
      v66 = 2114;
      v67 = v9;
      _os_log_impl(&dword_1CCE01000, v31, OS_LOG_TYPE_ERROR, "%{public}@### Error while attempting to enable Events on HAP characteristic %{public}@: it does not have a corresponding BTLE characteristic", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v30);
    v62[0] = *MEMORY[0x1E0CB2D50];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Failed to enable events for characteristic %@"), v9);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v63[0] = v33;
    v62[1] = *MEMORY[0x1E0CB2D68];
    objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "localizedStringForKey:value:table:", CFSTR("Unable to find matching BTLE characteristic"), &stru_1E894EFE8, 0);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    v63[1] = v35;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v63, v62, 2);
    v27 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("HAPErrorDomain"), -6727, v27);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v10 || !v11)
      goto LABEL_20;
    v54[0] = MEMORY[0x1E0C809B0];
    v54[1] = 3221225472;
    v54[2] = __89___HAPAccessoryServerBTLE100__enableEvent_forCharacteristic_withCompletionHandler_queue___block_invoke;
    v54[3] = &unk_1E894D9E8;
    v57 = v10;
    v55 = v9;
    v56 = v28;
    dispatch_async(v11, v54);

    v29 = v57;
    goto LABEL_19;
  }
  if ((objc_msgSend(v12, "properties") & 0x20) == 0)
  {
    v21 = (void *)MEMORY[0x1D17B7244]();
    HMFGetOSLogHandle();
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v65 = v23;
      v66 = 2114;
      v67 = v9;
      v68 = 2114;
      v69 = v12;
      _os_log_impl(&dword_1CCE01000, v22, OS_LOG_TYPE_ERROR, "%{public}@### Error while attempting to enable Events on HAP characteristic %{public}@: Corresponding BTLE Characteristics %{public}@: does not support it", buf, 0x20u);

    }
    objc_autoreleasePoolPop(v21);
    v60[0] = *MEMORY[0x1E0CB2D50];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Failed to enable events for characteristic %@"), v9);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v61[0] = v24;
    v60[1] = *MEMORY[0x1E0CB2D68];
    objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "localizedStringForKey:value:table:", CFSTR("BTLE characteristic does not support indication"), &stru_1E894EFE8, 0);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v61[1] = v26;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v61, v60, 2);
    v27 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("HAPErrorDomain"), -6735, v27);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v10 || !v11)
      goto LABEL_20;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __89___HAPAccessoryServerBTLE100__enableEvent_forCharacteristic_withCompletionHandler_queue___block_invoke_117;
    block[3] = &unk_1E894D9E8;
    v53 = v10;
    v51 = v9;
    v52 = v28;
    dispatch_async(v11, block);

    v29 = v53;
    goto LABEL_19;
  }
  if (!-[_HAPAccessoryServerBTLE100 isDisconnecting](self, "isDisconnecting"))
  {
    v42[0] = MEMORY[0x1E0C809B0];
    v42[1] = 3221225472;
    v42[2] = __89___HAPAccessoryServerBTLE100__enableEvent_forCharacteristic_withCompletionHandler_queue___block_invoke_3;
    v42[3] = &unk_1E894D5B8;
    v45 = v41;
    v44 = v10;
    v38 = v11;
    v43 = v38;
    v39 = (void *)MEMORY[0x1D17B7400](v42);
    -[_HAPAccessoryServerBTLE100 _enqueueEnableEventCompletionHandler:queue:forCharacteristic:](self, "_enqueueEnableEventCompletionHandler:queue:forCharacteristic:", v39, v38, v9);
    -[_HAPAccessoryServerBTLE100 _updateConnectionLifetimeTimer](self, "_updateConnectionLifetimeTimer");
    -[HAPAccessoryServerBTLE peripheral](self, "peripheral");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "setNotifyValue:forCharacteristic:", v41, v12);

    v27 = v44;
    goto LABEL_21;
  }
  v58[0] = *MEMORY[0x1E0CB2D50];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Failed to enable events for characteristics %@"), v9);
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  v59[0] = v36;
  v58[1] = *MEMORY[0x1E0CB2D68];
  objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithHMErrorCode:", 4);
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  v59[1] = v37;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v59, v58, 2);
  v27 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("HAPErrorDomain"), -6753, v27);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10 && v11)
  {
    v46[0] = MEMORY[0x1E0C809B0];
    v46[1] = 3221225472;
    v46[2] = __89___HAPAccessoryServerBTLE100__enableEvent_forCharacteristic_withCompletionHandler_queue___block_invoke_2;
    v46[3] = &unk_1E894D9E8;
    v49 = v10;
    v47 = v9;
    v48 = v28;
    dispatch_async(v11, v46);

    v29 = v49;
LABEL_19:

  }
LABEL_20:

LABEL_21:
}

- (void)_handleHAPNotificationStateUpdateForCharacteristic:(id)a3 error:(id)a4
{
  id v6;
  char *v7;
  char *v8;
  void *v9;
  NSObject *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  NSObject *v15;
  void *v16;
  void *v17;
  NSObject *v18;
  void *v19;
  _QWORD block[4];
  id v21;
  char *v22;
  char *v23;
  uint8_t buf[4];
  void *v25;
  __int16 v26;
  const char *v27;
  __int16 v28;
  char *v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = (char *)a4;
  -[_HAPAccessoryServerBTLE100 _hapCharacteristicForBTLECharacteristic:](self, "_hapCharacteristicForBTLECharacteristic:", v6);
  v8 = (char *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)MEMORY[0x1D17B7244]();
  HMFGetOSLogHandle();
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (v8)
  {
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v25 = v12;
      v26 = 2112;
      v27 = v8;
      v28 = 2112;
      v29 = v7;
      _os_log_impl(&dword_1CCE01000, v11, OS_LOG_TYPE_INFO, "%{public}@Received notification update completion for characteristic %@ with error %@", buf, 0x20u);

    }
    objc_autoreleasePoolPop(v9);
    -[_HAPAccessoryServerBTLE100 _dequeueEnableEventCompletionTupleForCharacteristic:](self, "_dequeueEnableEventCompletionTupleForCharacteristic:", v8);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = v13;
    if (v13)
    {
      objc_msgSend(v13, "completionQueue");
      v15 = objc_claimAutoreleasedReturnValue();
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __87___HAPAccessoryServerBTLE100__handleHAPNotificationStateUpdateForCharacteristic_error___block_invoke;
      block[3] = &unk_1E894E120;
      v21 = v14;
      v22 = v8;
      v23 = v7;
      dispatch_async(v15, block);

    }
    else
    {
      v17 = (void *)MEMORY[0x1D17B7244]();
      HMFGetOSLogHandle();
      v18 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        v25 = v19;
        v26 = 2080;
        v27 = "-[_HAPAccessoryServerBTLE100 _handleHAPNotificationStateUpdateForCharacteristic:error:]";
        v28 = 2112;
        v29 = v8;
        _os_log_impl(&dword_1CCE01000, v18, OS_LOG_TYPE_ERROR, "%{public}@%s: ### Unable to get enable event completion handler for %@ after receiving a notification update confirmation", buf, 0x20u);

      }
      objc_autoreleasePoolPop(v17);
    }

  }
  else
  {
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v25 = v16;
      _os_log_impl(&dword_1CCE01000, v11, OS_LOG_TYPE_ERROR, "%{public}@### Unable to find HAP characteristic for BTLE characteristic after receiving Notification Update confirmation", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v9);
  }

}

- (void)_setupBTLEConnectionToPeripheral
{
  id v3;

  -[HAPAccessoryServerBTLE browser](self, "browser");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "connectToBTLEAccessoryServer:", self);

}

- (void)handleConnectionWithPeripheral:(id)a3 withError:(id)a4
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
  block[2] = __71___HAPAccessoryServerBTLE100_handleConnectionWithPeripheral_withError___block_invoke;
  block[3] = &unk_1E894E120;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(v8, block);

}

- (void)_handleConnectionWithError:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  void *v7;
  id v8;
  int v9;
  void *v10;
  __int16 v11;
  id v12;
  __int16 v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = (void *)MEMORY[0x1D17B7244]();
  HMFGetOSLogHandle();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = 138543874;
    v10 = v7;
    v11 = 2112;
    v12 = (id)objc_opt_class();
    v13 = 2112;
    v14 = v4;
    v8 = v12;
    _os_log_impl(&dword_1CCE01000, v6, OS_LOG_TYPE_INFO, "%{public}@%@ connection completed with error: %@", (uint8_t *)&v9, 0x20u);

  }
  objc_autoreleasePoolPop(v5);
  if (!v4)
  {
    -[_HAPAccessoryServerBTLE100 _handleSuccessfulBTLEConnection](self, "_handleSuccessfulBTLEConnection");
    -[HAPAccessoryServerBTLE incrementHAPBTLEMetricsConnectionCount](self, "incrementHAPBTLEMetricsConnectionCount");
  }

}

- (void)_handleSuccessfulBTLEConnection
{
  void *v3;
  NSObject *v4;
  void *v5;
  id v6;
  int v7;
  void *v8;
  __int16 v9;
  id v10;
  __int16 v11;
  const char *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v3 = (void *)MEMORY[0x1D17B7244](self, a2);
  HMFGetOSLogHandle();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = 138543874;
    v8 = v5;
    v9 = 2112;
    v10 = (id)objc_opt_class();
    v11 = 2080;
    v12 = "-[_HAPAccessoryServerBTLE100 _handleSuccessfulBTLEConnection]";
    v6 = v10;
    _os_log_impl(&dword_1CCE01000, v4, OS_LOG_TYPE_INFO, "%{public}@%@ %s", (uint8_t *)&v7, 0x20u);

  }
  objc_autoreleasePoolPop(v3);
  -[_HAPAccessoryServerBTLE100 _handlePairingStateMachine](self, "_handlePairingStateMachine");
}

- (BOOL)isBLELinkConnected
{
  void *v2;
  BOOL v3;

  -[HAPAccessoryServerBTLE peripheral](self, "peripheral");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "state") == 2;

  return v3;
}

- (void)handleDisconnectionWithError:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  NSObject *v9;
  void *v10;
  unint64_t v11;
  __CFString *v12;
  __CFString *v13;
  void *v14;
  NSObject *v15;
  void *v16;
  unint64_t v17;
  NSObject *v18;
  _QWORD v19[5];
  id v20;
  uint8_t buf[4];
  void *v22;
  __int16 v23;
  unint64_t v24;
  __int16 v25;
  __CFString *v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = (void *)MEMORY[0x1D17B7244]();
  HMFGetOSLogHandle();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    HMFGetLogIdentifier();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = -[_HAPAccessoryServerBTLE100 state](self, "state");
    if (v11 - 1 > 0xB)
      v12 = CFSTR("Unknown State");
    else
      v12 = off_1E894DE40[v11 - 1];
    v13 = v12;
    *(_DWORD *)buf = 138543874;
    v22 = v10;
    v23 = 2112;
    v24 = (unint64_t)v6;
    v25 = 2112;
    v26 = v13;
    _os_log_impl(&dword_1CCE01000, v9, OS_LOG_TYPE_DEFAULT, "%{public}@[BTLE Accessory Server] Received disconnection event with error %@ in state %@", buf, 0x20u);

  }
  objc_autoreleasePoolPop(v8);
  if (-[_HAPAccessoryServerBTLE100 state](self, "state") == 2
    && -[_HAPAccessoryServerBTLE100 connectionRetryCount](self, "connectionRetryCount") <= 2)
  {
    v14 = (void *)MEMORY[0x1D17B7244]();
    HMFGetOSLogHandle();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = -[_HAPAccessoryServerBTLE100 connectionRetryCount](self, "connectionRetryCount");
      *(_DWORD *)buf = 138543618;
      v22 = v16;
      v23 = 2048;
      v24 = v17;
      _os_log_impl(&dword_1CCE01000, v15, OS_LOG_TYPE_ERROR, "%{public}@[BTLE Accessory Server] ### BLE Connection Failure, Retry count: %lu", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v14);
    -[_HAPAccessoryServerBTLE100 setConnectionRetryCount:](self, "setConnectionRetryCount:", -[_HAPAccessoryServerBTLE100 connectionRetryCount](self, "connectionRetryCount") + 1);
    -[_HAPAccessoryServerBTLE100 setState:](self, "setState:", 1);
    -[_HAPAccessoryServerBTLE100 _handlePairingStateMachine](self, "_handlePairingStateMachine");
  }
  else
  {
    -[HAPAccessoryServer clientQueue](self, "clientQueue");
    v18 = objc_claimAutoreleasedReturnValue();
    v19[0] = MEMORY[0x1E0C809B0];
    v19[1] = 3221225472;
    v19[2] = __77___HAPAccessoryServerBTLE100_handleDisconnectionWithError_completionHandler___block_invoke;
    v19[3] = &unk_1E894D5E0;
    v19[4] = self;
    v20 = v7;
    dispatch_async(v18, v19);

  }
}

- (void)_handleDisconnectionWithCompletion:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  void *v14;
  _QWORD *v15;
  void *v16;
  NSObject *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  NSObject *v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  void *v27;
  unint64_t v28;
  void *v29;
  NSObject *v30;
  _BOOL4 v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  uint64_t v37;
  uint64_t i;
  uint64_t v39;
  uint64_t v40;
  void *v41;
  uint64_t v42;
  void *v43;
  void *v44;
  NSObject *v45;
  uint64_t v46;
  uint64_t v47;
  void *v48;
  NSObject *v49;
  id v50;
  uint64_t v51;
  void *v52;
  uint64_t v53;
  void *v54;
  void *v55;
  NSObject *v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t j;
  void *v62;
  void *v63;
  NSObject *v64;
  void *v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  void *v69;
  int v70;
  uint64_t v71;
  void *v72;
  void *v73;
  NSObject *v74;
  void *v75;
  void *v76;
  void *v77;
  void (**v78)(_QWORD, _QWORD);
  id v79;
  void *obj;
  id v81;
  id v82;
  uint64_t v83;
  void *v84;
  _QWORD v85[5];
  id v86;
  __int128 v87;
  __int128 v88;
  __int128 v89;
  __int128 v90;
  _QWORD v91[4];
  id v92;
  uint64_t v93;
  id v94;
  _QWORD v95[5];
  id v96;
  id v97;
  _QWORD block[4];
  id v99;
  uint64_t v100;
  id v101;
  __int128 v102;
  __int128 v103;
  __int128 v104;
  __int128 v105;
  _QWORD v106[5];
  _QWORD v107[5];
  uint8_t buf[4];
  void *v109;
  __int16 v110;
  uint64_t v111;
  __int16 v112;
  void *v113;
  __int16 v114;
  int v115;
  _BYTE v116[128];
  _BYTE v117[128];
  uint64_t v118;

  v118 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = (void *)MEMORY[0x1D17B7244]();
  HMFGetOSLogHandle();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    HMFGetLogIdentifier();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[HAPAccessoryServer identifier](self, "identifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v109 = v7;
    v110 = 2112;
    v111 = (uint64_t)v8;
    _os_log_impl(&dword_1CCE01000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@[BTLE Accessory Server %@] Handling disconnection with error", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v5);
  if (-[_HAPAccessoryServerBTLE100 startPairingRequested](self, "startPairingRequested"))
  {
    v9 = (void *)MEMORY[0x1D17B7244]();
    HMFGetOSLogHandle();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      HMFGetLogIdentifier();
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[HAPAccessoryServer identifier](self, "identifier");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v109 = v11;
      v110 = 2112;
      v111 = (uint64_t)v12;
      _os_log_impl(&dword_1CCE01000, v10, OS_LOG_TYPE_DEFAULT, "%{public}@[BTLE Accessory Server %@] disconnected during pairing", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v9);
    if (-[_HAPAccessoryServerBTLE100 _delegateRespondsToSelector:](self, "_delegateRespondsToSelector:", sel_accessoryServer_didStopPairingWithError_))
    {
      -[HAPAccessoryServer delegateQueue](self, "delegateQueue");
      v13 = objc_claimAutoreleasedReturnValue();
      v14 = v13;
      v107[0] = MEMORY[0x1E0C809B0];
      v107[1] = 3221225472;
      v107[2] = __65___HAPAccessoryServerBTLE100__handleDisconnectionWithCompletion___block_invoke;
      v107[3] = &unk_1E894DD08;
      v107[4] = self;
      v15 = v107;
LABEL_60:
      dispatch_async(v13, v15);
LABEL_61:

    }
  }
  else if (-[_HAPAccessoryServerBTLE100 unpairedIdentifyRequested](self, "unpairedIdentifyRequested"))
  {
    v16 = (void *)MEMORY[0x1D17B7244]();
    HMFGetOSLogHandle();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      HMFGetLogIdentifier();
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      -[HAPAccessoryServer identifier](self, "identifier");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v109 = v18;
      v110 = 2112;
      v111 = (uint64_t)v19;
      _os_log_impl(&dword_1CCE01000, v17, OS_LOG_TYPE_DEFAULT, "%{public}@[BTLE Accessory Server %@] disconnected after unpaired identify request completed", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v16);
    -[_HAPAccessoryServerBTLE100 unpairedIdentifyCompletionBlock](self, "unpairedIdentifyCompletionBlock");
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    if (v20)
    {
      v21 = (void *)MEMORY[0x1D17B7244]();
      HMFGetOSLogHandle();
      v22 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
      {
        HMFGetLogIdentifier();
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        -[HAPAccessoryServer identifier](self, "identifier");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v109 = v23;
        v110 = 2112;
        v111 = (uint64_t)v24;
        _os_log_impl(&dword_1CCE01000, v22, OS_LOG_TYPE_DEFAULT, "%{public}@[BTLE Accessory Server %@] identify failed calling completion block", buf, 0x16u);

      }
      objc_autoreleasePoolPop(v21);
      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithHMErrorCode:", 52);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      -[_HAPAccessoryServerBTLE100 unpairedIdentifyCompletionBlock](self, "unpairedIdentifyCompletionBlock");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      -[_HAPAccessoryServerBTLE100 setUnpairedIdentifyCompletionBlock:](self, "setUnpairedIdentifyCompletionBlock:", 0);
      v26 = MEMORY[0x1D17B7400](v25);
      v27 = (void *)v26;
      if (v26)
        (*(void (**)(uint64_t, void *))(v26 + 16))(v26, v14);

      goto LABEL_61;
    }
  }
  else
  {
    v28 = -[_HAPAccessoryServerBTLE100 state](self, "state");
    v29 = (void *)MEMORY[0x1D17B7244]();
    HMFGetOSLogHandle();
    v30 = objc_claimAutoreleasedReturnValue();
    v31 = os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT);
    if (v28 == 12)
    {
      v79 = v4;
      if (v31)
      {
        HMFGetLogIdentifier();
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        -[HAPAccessoryServer identifier](self, "identifier");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v109 = v32;
        v110 = 2112;
        v111 = (uint64_t)v33;
        _os_log_impl(&dword_1CCE01000, v30, OS_LOG_TYPE_DEFAULT, "%{public}@[BTLE Accessory Server %@] failed after session is up", buf, 0x16u);

      }
      objc_autoreleasePoolPop(v29);
      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithHMErrorCode:", 4);
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      v102 = 0u;
      v103 = 0u;
      v104 = 0u;
      v105 = 0u;
      -[_HAPAccessoryServerBTLE100 btleCharacteristicToHAPCharacteristicMap](self, "btleCharacteristicToHAPCharacteristicMap");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v35, "objectEnumerator");
      v36 = (void *)objc_claimAutoreleasedReturnValue();

      obj = v36;
      v83 = objc_msgSend(v36, "countByEnumeratingWithState:objects:count:", &v102, v117, 16);
      if (v83)
      {
        v81 = *(id *)v103;
        v37 = MEMORY[0x1E0C809B0];
        do
        {
          for (i = 0; i != v83; ++i)
          {
            if (*(id *)v103 != v81)
              objc_enumerationMutation(obj);
            v39 = *(_QWORD *)(*((_QWORD *)&v102 + 1) + 8 * i);
            -[_HAPAccessoryServerBTLE100 _dequeueReadCompletionTupleForCharacteristic:](self, "_dequeueReadCompletionTupleForCharacteristic:", v39);
            v40 = objc_claimAutoreleasedReturnValue();
            if (v40)
            {
              v41 = (void *)v40;
              do
              {
                objc_msgSend(v41, "handler");
                v42 = objc_claimAutoreleasedReturnValue();
                if (v42)
                {
                  v43 = (void *)v42;
                  objc_msgSend(v41, "completionQueue");
                  v44 = (void *)objc_claimAutoreleasedReturnValue();

                  if (v44)
                  {
                    objc_msgSend(v41, "completionQueue");
                    v45 = objc_claimAutoreleasedReturnValue();
                    block[0] = v37;
                    block[1] = 3221225472;
                    block[2] = __65___HAPAccessoryServerBTLE100__handleDisconnectionWithCompletion___block_invoke_124;
                    block[3] = &unk_1E894E120;
                    v99 = v41;
                    v100 = v39;
                    v101 = v34;
                    dispatch_async(v45, block);

                  }
                }
                -[_HAPAccessoryServerBTLE100 _dequeueReadCompletionTupleForCharacteristic:](self, "_dequeueReadCompletionTupleForCharacteristic:", v39);
                v46 = objc_claimAutoreleasedReturnValue();

                v41 = (void *)v46;
              }
              while (v46);
            }
            -[_HAPAccessoryServerBTLE100 _dequeueWriteCompletionHandlerForCharacteristic:](self, "_dequeueWriteCompletionHandlerForCharacteristic:", v39);
            v47 = objc_claimAutoreleasedReturnValue();
            if (v47)
            {
              v48 = (void *)v47;
              do
              {
                -[HAPAccessoryServer delegateQueue](self, "delegateQueue");
                v49 = objc_claimAutoreleasedReturnValue();
                v95[0] = v37;
                v95[1] = 3221225472;
                v95[2] = __65___HAPAccessoryServerBTLE100__handleDisconnectionWithCompletion___block_invoke_2;
                v95[3] = &unk_1E894D9E8;
                v97 = v48;
                v95[4] = v39;
                v96 = v34;
                v50 = v48;
                dispatch_async(v49, v95);

                -[_HAPAccessoryServerBTLE100 _dequeueWriteCompletionHandlerForCharacteristic:](self, "_dequeueWriteCompletionHandlerForCharacteristic:", v39);
                v48 = (void *)objc_claimAutoreleasedReturnValue();

              }
              while (v48);
            }
            -[_HAPAccessoryServerBTLE100 _dequeueEnableEventCompletionTupleForCharacteristic:](self, "_dequeueEnableEventCompletionTupleForCharacteristic:", v39);
            v51 = objc_claimAutoreleasedReturnValue();
            if (v51)
            {
              v52 = (void *)v51;
              do
              {
                objc_msgSend(v52, "handler");
                v53 = objc_claimAutoreleasedReturnValue();
                if (v53)
                {
                  v54 = (void *)v53;
                  objc_msgSend(v52, "completionQueue");
                  v55 = (void *)objc_claimAutoreleasedReturnValue();

                  if (v55)
                  {
                    objc_msgSend(v52, "completionQueue");
                    v56 = objc_claimAutoreleasedReturnValue();
                    v91[0] = v37;
                    v91[1] = 3221225472;
                    v91[2] = __65___HAPAccessoryServerBTLE100__handleDisconnectionWithCompletion___block_invoke_3;
                    v91[3] = &unk_1E894E120;
                    v92 = v52;
                    v93 = v39;
                    v94 = v34;
                    dispatch_async(v56, v91);

                  }
                }
                -[_HAPAccessoryServerBTLE100 _dequeueEnableEventCompletionTupleForCharacteristic:](self, "_dequeueEnableEventCompletionTupleForCharacteristic:", v39);
                v57 = objc_claimAutoreleasedReturnValue();

                v52 = (void *)v57;
              }
              while (v57);
            }
          }
          v83 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v102, v117, 16);
        }
        while (v83);
      }

      v89 = 0u;
      v90 = 0u;
      v87 = 0u;
      v88 = 0u;
      -[_HAPAccessoryServerBTLE100 addRemovePairingOperationsQueue](self, "addRemovePairingOperationsQueue");
      v82 = (id)objc_claimAutoreleasedReturnValue();
      v58 = objc_msgSend(v82, "countByEnumeratingWithState:objects:count:", &v87, v116, 16);
      if (v58)
      {
        v59 = v58;
        v60 = *(_QWORD *)v88;
        do
        {
          for (j = 0; j != v59; ++j)
          {
            if (*(_QWORD *)v88 != v60)
              objc_enumerationMutation(v82);
            v62 = *(void **)(*((_QWORD *)&v87 + 1) + 8 * j);
            v63 = (void *)MEMORY[0x1D17B7244]();
            HMFGetOSLogHandle();
            v64 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v64, OS_LOG_TYPE_INFO))
            {
              HMFGetLogIdentifier();
              v84 = v63;
              v65 = (void *)objc_claimAutoreleasedReturnValue();
              v66 = v59;
              v67 = v60;
              v68 = objc_msgSend(v62, "operation");
              objc_msgSend(v62, "identifier");
              v69 = (void *)objc_claimAutoreleasedReturnValue();
              v70 = objc_msgSend(v62, "operationExecuting");
              *(_DWORD *)buf = 138544130;
              v109 = v65;
              v110 = 2048;
              v111 = v68;
              v60 = v67;
              v59 = v66;
              v112 = 2112;
              v113 = v69;
              v114 = 1024;
              v115 = v70;
              _os_log_impl(&dword_1CCE01000, v64, OS_LOG_TYPE_INFO, "%{public}@Failed pending operation %tu for %@, Executing: %d", buf, 0x26u);

              v63 = v84;
            }

            objc_autoreleasePoolPop(v63);
            if ((objc_msgSend(v62, "operationExecuting") & 1) == 0)
            {
              objc_msgSend(v62, "completionHandler");
              v71 = objc_claimAutoreleasedReturnValue();
              if (v71)
              {
                v72 = (void *)v71;
                objc_msgSend(v62, "queue");
                v73 = (void *)objc_claimAutoreleasedReturnValue();

                if (v73)
                {
                  objc_msgSend(v62, "queue");
                  v74 = objc_claimAutoreleasedReturnValue();
                  v85[0] = MEMORY[0x1E0C809B0];
                  v85[1] = 3221225472;
                  v85[2] = __65___HAPAccessoryServerBTLE100__handleDisconnectionWithCompletion___block_invoke_125;
                  v85[3] = &unk_1E894E0F8;
                  v85[4] = v62;
                  v86 = v34;
                  dispatch_async(v74, v85);

                }
              }
            }
          }
          v59 = objc_msgSend(v82, "countByEnumeratingWithState:objects:count:", &v87, v116, 16);
        }
        while (v59);
      }

      -[_HAPAccessoryServerBTLE100 addRemovePairingOperationsQueue](self, "addRemovePairingOperationsQueue");
      v75 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v75, "removeAllObjects");

      v4 = v79;
    }
    else
    {
      if (v31)
      {
        HMFGetLogIdentifier();
        v76 = (void *)objc_claimAutoreleasedReturnValue();
        -[HAPAccessoryServer identifier](self, "identifier");
        v77 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v109 = v76;
        v110 = 2112;
        v111 = (uint64_t)v77;
        _os_log_impl(&dword_1CCE01000, v30, OS_LOG_TYPE_DEFAULT, "%{public}@[BTLE Accessory Server %@] disconnected before secure session was established", buf, 0x16u);

      }
      objc_autoreleasePoolPop(v29);
      if (-[_HAPAccessoryServerBTLE100 _delegateRespondsToSelector:](self, "_delegateRespondsToSelector:", sel_accessoryServer_didDiscoverAccessories_transaction_error_))
      {
        -[HAPAccessoryServer delegateQueue](self, "delegateQueue");
        v13 = objc_claimAutoreleasedReturnValue();
        v14 = v13;
        v106[0] = MEMORY[0x1E0C809B0];
        v106[1] = 3221225472;
        v106[2] = __65___HAPAccessoryServerBTLE100__handleDisconnectionWithCompletion___block_invoke_123;
        v106[3] = &unk_1E894DD08;
        v106[4] = self;
        v15 = v106;
        goto LABEL_60;
      }
    }
  }
  -[_HAPAccessoryServerBTLE100 _resetState](self, "_resetState");
  v78 = (void (**)(_QWORD, _QWORD))MEMORY[0x1D17B7400](v4);
  if (v78)
    ((void (**)(_QWORD, BOOL))v78)[2](v78, -[_HAPAccessoryServerBTLE100 removeOnDisconnect](self, "removeOnDisconnect"));

}

- (void)_enqueueWriteCompletionHandler:(id)a3 forCharacteristic:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v11 = a3;
  v6 = a4;
  -[_HAPAccessoryServerBTLE100 hapCharacteristicWriteCompletionQueues](self, "hapCharacteristicWriteCompletionQueues");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKey:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v8)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[_HAPAccessoryServerBTLE100 hapCharacteristicWriteCompletionQueues](self, "hapCharacteristicWriteCompletionQueues");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setObject:forKey:", v8, v6);

  }
  v10 = (void *)MEMORY[0x1D17B7400](v11);
  objc_msgSend(v8, "addObject:", v10);

}

- (id)_dequeueWriteCompletionHandlerForCharacteristic:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;

  v4 = a3;
  -[_HAPAccessoryServerBTLE100 hapCharacteristicWriteCompletionQueues](self, "hapCharacteristicWriteCompletionQueues");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "firstObject");
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = (void *)v7;
  if (v7)
  {
    v9 = (void *)MEMORY[0x1D17B7400](v7);
    objc_msgSend(v6, "removeObject:", v9);

  }
  v10 = (void *)MEMORY[0x1D17B7400](v8);

  return v10;
}

- (void)_enqueueReadCompletionHandler:(id)a3 queue:(id)a4 forCharacteristic:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;

  v14 = a3;
  v8 = a4;
  v9 = a5;
  -[_HAPAccessoryServerBTLE100 hapCharacteristicReadCompletionQueues](self, "hapCharacteristicReadCompletionQueues");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "objectForKey:", v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v11)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[_HAPAccessoryServerBTLE100 hapCharacteristicReadCompletionQueues](self, "hapCharacteristicReadCompletionQueues");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setObject:forKey:", v11, v9);

  }
  +[HAPCharacteristicReadCompletionTuple readCompletionTupleWithHandler:queue:](HAPCharacteristicReadCompletionTuple, "readCompletionTupleWithHandler:queue:", v14, v8);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "addObject:", v13);

}

- (id)_dequeueReadCompletionTupleForCharacteristic:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = a3;
  -[_HAPAccessoryServerBTLE100 hapCharacteristicReadCompletionQueues](self, "hapCharacteristicReadCompletionQueues");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "firstObject");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
    objc_msgSend(v6, "removeObject:", v7);

  return v7;
}

- (void)_enqueueEnableEventCompletionHandler:(id)a3 queue:(id)a4 forCharacteristic:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;

  v14 = a3;
  v8 = a4;
  v9 = a5;
  -[_HAPAccessoryServerBTLE100 hapCharacteristicEnableEventCompletionQueues](self, "hapCharacteristicEnableEventCompletionQueues");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "objectForKey:", v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v11)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[_HAPAccessoryServerBTLE100 hapCharacteristicEnableEventCompletionQueues](self, "hapCharacteristicEnableEventCompletionQueues");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setObject:forKey:", v11, v9);

  }
  +[HAPCharacteristicEnableEventCompletionTuple enableEventCompletionTupleWithHandler:queue:](HAPCharacteristicEnableEventCompletionTuple, "enableEventCompletionTupleWithHandler:queue:", v14, v8);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (v13)
    objc_msgSend(v11, "addObject:", v13);

}

- (id)_dequeueEnableEventCompletionTupleForCharacteristic:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = a3;
  -[_HAPAccessoryServerBTLE100 hapCharacteristicEnableEventCompletionQueues](self, "hapCharacteristicEnableEventCompletionQueues");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "firstObject");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
    objc_msgSend(v6, "removeObject:", v7);

  return v7;
}

- (void)writeCharacteristicValues:(id)a3 timeout:(double)a4 completionQueue:(id)a5 completionHandler:(id)a6
{
  id v10;
  id v11;
  id v12;
  NSObject *v13;
  id v14;
  id v15;
  id v16;
  _QWORD block[5];
  id v18;
  id v19;
  id v20;
  double v21;

  v10 = a3;
  v11 = a5;
  v12 = a6;
  -[HAPAccessoryServer clientQueue](self, "clientQueue");
  v13 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __98___HAPAccessoryServerBTLE100_writeCharacteristicValues_timeout_completionQueue_completionHandler___block_invoke;
  block[3] = &unk_1E894D608;
  v21 = a4;
  block[4] = self;
  v18 = v10;
  v19 = v11;
  v20 = v12;
  v14 = v12;
  v15 = v11;
  v16 = v10;
  dispatch_async(v13, block);

}

- (void)_writeCharacteristicValues:(id)a3 queue:(id)a4 completionHandler:(id)a5
{
  id v8;
  NSObject *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  NSObject *v21;
  id v22;
  id v23;
  id v24;
  id v25;
  id v26;
  void *v27;
  id obj;
  void *v29;
  _QWORD block[5];
  id v31;
  id v32;
  id v33;
  _QWORD v34[4];
  id v35;
  NSObject *v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  _BYTE v41[128];
  uint64_t v42;

  v42 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v26 = a4;
  v25 = a5;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = dispatch_group_create();
  objc_msgSend(MEMORY[0x1E0D28540], "currentActivity");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v37 = 0u;
  v38 = 0u;
  v39 = 0u;
  v40 = 0u;
  obj = v8;
  v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v37, v41, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v38;
    do
    {
      v13 = 0;
      do
      {
        if (*(_QWORD *)v38 != v12)
          objc_enumerationMutation(obj);
        v14 = *(void **)(*((_QWORD *)&v37 + 1) + 8 * v13);
        dispatch_group_enter(v9);
        v34[0] = MEMORY[0x1E0C809B0];
        v34[1] = 3221225472;
        v34[2] = __81___HAPAccessoryServerBTLE100__writeCharacteristicValues_queue_completionHandler___block_invoke;
        v34[3] = &unk_1E894D540;
        v35 = v29;
        v36 = v9;
        v15 = (void *)MEMORY[0x1D17B7400](v34);
        objc_msgSend(v14, "characteristic");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "instanceID");

        objc_msgSend(v14, "value");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "characteristic");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "authorizationData");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        -[HAPAccessoryServer clientQueue](self, "clientQueue");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        -[_HAPAccessoryServerBTLE100 _writeValue:forCharacteristic:authorizationData:withCompletionHandler:queue:](self, "_writeValue:forCharacteristic:authorizationData:withCompletionHandler:queue:", v17, v18, v19, v15, v20);

        ++v13;
      }
      while (v11 != v13);
      v11 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v37, v41, 16);
    }
    while (v11);
  }

  -[HAPAccessoryServer clientQueue](self, "clientQueue");
  v21 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __81___HAPAccessoryServerBTLE100__writeCharacteristicValues_queue_completionHandler___block_invoke_131;
  block[3] = &unk_1E894D6D0;
  block[4] = self;
  v31 = v26;
  v32 = v29;
  v33 = v25;
  v22 = v29;
  v23 = v26;
  v24 = v25;
  dispatch_group_notify(v9, v21, block);

}

- (void)_writeValue:(id)a3 forCharacteristic:(id)a4 authorizationData:(id)a5 withCompletionHandler:(id)a6 queue:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  NSObject *v16;
  void *v17;
  void *v18;
  NSObject *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  id v25;
  void *v26;
  NSObject *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  uint64_t v34;
  id v35;
  void *v36;
  void *v37;
  void *v38;
  NSObject *v39;
  id v40;
  NSObject *v41;
  NSObject *v42;
  void *v43;
  void *v44;
  void *v45;
  NSObject *v46;
  NSObject *v47;
  void *v48;
  NSObject *v49;
  void *context;
  void *contexta;
  id v52;
  void *v53;
  id v54;
  void *v55;
  id v56;
  uint64_t v57;
  id v58;
  id v59;
  id v60;
  _QWORD v61[4];
  id v62;
  id v63;
  id v64;
  id v65;
  _QWORD v66[5];
  id v67;
  _HAPAccessoryServerBTLE100 *v68;
  id v69;
  NSObject *v70;
  id v71;
  _QWORD v72[4];
  id v73;
  id v74;
  id v75;
  _QWORD v76[4];
  id v77;
  id v78;
  id v79;
  id v80;
  _QWORD block[4];
  id v82;
  id v83;
  id v84;
  _QWORD v85[4];
  id v86;
  id v87;
  id v88;
  _QWORD v89[2];
  _QWORD v90[2];
  uint8_t buf[4];
  void *v92;
  __int16 v93;
  id v94;
  uint64_t v95;

  v95 = *MEMORY[0x1E0C80C00];
  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  -[_HAPAccessoryServerBTLE100 _btleCharacteristicForHAPCharacteristic:](self, "_btleCharacteristicForHAPCharacteristic:", v13);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v17)
  {
    v26 = (void *)MEMORY[0x1D17B7244]();
    HMFGetOSLogHandle();
    v27 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v92 = v28;
      v93 = 2112;
      v94 = v13;
      _os_log_impl(&dword_1CCE01000, v27, OS_LOG_TYPE_ERROR, "%{public}@### Error while attempting to write HAP characteristic %@: it does not have a corresponding BTLE characteristic", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v26);
    v89[0] = *MEMORY[0x1E0CB2D50];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Failed to write the value of characteristic %@"), v13);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v90[0] = v29;
    v89[1] = *MEMORY[0x1E0CB2D68];
    objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "localizedStringForKey:value:table:", CFSTR("Unable to find matching BTLE characteristic"), &stru_1E894EFE8, 0);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v90[1] = v31;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v90, v89, 2);
    v24 = (id)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithHMErrorCode:userInfo:", 2, v24);
    v25 = (id)objc_claimAutoreleasedReturnValue();
    if (v15 && v16)
    {
      v85[0] = MEMORY[0x1E0C809B0];
      v85[1] = 3221225472;
      v85[2] = __106___HAPAccessoryServerBTLE100__writeValue_forCharacteristic_authorizationData_withCompletionHandler_queue___block_invoke;
      v85[3] = &unk_1E894D9E8;
      v88 = v15;
      v86 = v13;
      v25 = v25;
      v87 = v25;
      dispatch_async(v16, v85);

    }
    goto LABEL_39;
  }
  if ((objc_msgSend(v13, "properties") & 4) != 0)
  {
    objc_msgSend(v13, "metadata");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "format");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v34 = HAPCharacteristicFormatFromString(v33);

    v80 = 0;
    +[_HAPAccessoryServerBTLE100 serializeCharacteristicWriteValue:characteristicFormat:supportsAdditionalAuthentication:authenticationData:error:](_HAPAccessoryServerBTLE100, "serializeCharacteristicWriteValue:characteristicFormat:supportsAdditionalAuthentication:authenticationData:error:", v12, v34, objc_msgSend(v13, "supportsAdditionalAuthorizationData"), v14, &v80);
    v25 = (id)objc_claimAutoreleasedReturnValue();
    v24 = v80;
    if (v24)
    {
      if (!v15 || !v16)
        goto LABEL_39;
      v76[0] = MEMORY[0x1E0C809B0];
      v76[1] = 3221225472;
      v76[2] = __106___HAPAccessoryServerBTLE100__writeValue_forCharacteristic_authorizationData_withCompletionHandler_queue___block_invoke_2;
      v76[3] = &unk_1E894D9E8;
      v79 = v15;
      v77 = v13;
      v78 = v24;
      dispatch_async(v16, v76);

      v35 = v79;
      goto LABEL_38;
    }
    if (-[_HAPAccessoryServerBTLE100 isDisconnecting](self, "isDisconnecting"))
    {
      v36 = (void *)MEMORY[0x1E0CB35C8];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Failed to write the value of characteristic %@"), v13);
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v36, "errorWithHMErrorCode:reason:underlyingError:", 4, v37, 0);
      v35 = (id)objc_claimAutoreleasedReturnValue();

      if (v15 && v16)
      {
        v72[0] = MEMORY[0x1E0C809B0];
        v72[1] = 3221225472;
        v72[2] = __106___HAPAccessoryServerBTLE100__writeValue_forCharacteristic_authorizationData_withCompletionHandler_queue___block_invoke_3;
        v72[3] = &unk_1E894D9E8;
        v75 = v15;
        v73 = v13;
        v35 = v35;
        v74 = v35;
        dispatch_async(v16, v72);

      }
      goto LABEL_38;
    }
    objc_msgSend(MEMORY[0x1E0D28540], "currentActivity");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    v66[0] = MEMORY[0x1E0C809B0];
    v66[1] = 3221225472;
    v66[2] = __106___HAPAccessoryServerBTLE100__writeValue_forCharacteristic_authorizationData_withCompletionHandler_queue___block_invoke_4;
    v66[3] = &unk_1E894D630;
    v66[4] = v12;
    v59 = v13;
    v67 = v59;
    v68 = self;
    v58 = v38;
    v69 = v58;
    v52 = v15;
    v71 = v52;
    v39 = v16;
    v70 = v39;
    v57 = MEMORY[0x1D17B7400](v66);
    v56 = v12;
    if (-[_HAPAccessoryServerBTLE100 _shouldEnableSessionSecurity](self, "_shouldEnableSessionSecurity"))
    {
      v49 = v39;
      v65 = 0;
      -[_HAPAccessoryServerBTLE100 _encryptDataAndGenerateAuthTag:error:](self, "_encryptDataAndGenerateAuthTag:error:", v25, &v65);
      v60 = (id)objc_claimAutoreleasedReturnValue();
      v40 = v65;
      context = (void *)MEMORY[0x1D17B7244]();
      HMFGetOSLogHandle();
      v41 = objc_claimAutoreleasedReturnValue();
      if (v40)
      {
        v42 = v41;
        if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR))
        {
          HMFGetLogIdentifier();
          v43 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543618;
          v92 = v43;
          v93 = 2112;
          v94 = v40;
          _os_log_impl(&dword_1CCE01000, v42, OS_LOG_TYPE_ERROR, "%{public}@[HAPAccessoryServerBTLE] Failed to encrypt payload with error: %@", buf, 0x16u);

        }
        v44 = v40;

        objc_autoreleasePoolPop(context);
        if (v52)
        {
          v45 = (void *)v57;
          if (v49)
          {
            v61[0] = MEMORY[0x1E0C809B0];
            v61[1] = 3221225472;
            v61[2] = __106___HAPAccessoryServerBTLE100__writeValue_forCharacteristic_authorizationData_withCompletionHandler_queue___block_invoke_146;
            v61[3] = &unk_1E894D9E8;
            v64 = v52;
            v62 = v59;
            v63 = v44;
            dispatch_async(v49, v61);

          }
        }
        else
        {
          v45 = (void *)v57;
        }
        v48 = v60;
        goto LABEL_37;
      }
      v47 = v41;
      if (os_log_type_enabled(v41, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v55 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v92 = v55;
        v93 = 2112;
        v94 = v60;
        _os_log_impl(&dword_1CCE01000, v47, OS_LOG_TYPE_INFO, "%{public}@Sending encrypted data: %@", buf, 0x16u);

      }
      v54 = v14;

      objc_autoreleasePoolPop(context);
      -[_HAPAccessoryServerBTLE100 _notifyDelegateOfSentEncryptedAuthenticatedData:forCharacteristic:](self, "_notifyDelegateOfSentEncryptedAuthenticatedData:forCharacteristic:", v60, v59);
    }
    else
    {
      v60 = v25;
      contexta = (void *)MEMORY[0x1D17B7244]();
      HMFGetOSLogHandle();
      v46 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v46, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v53 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v92 = v53;
        _os_log_impl(&dword_1CCE01000, v46, OS_LOG_TYPE_INFO, "%{public}@Sending plaintext data because encryption has been disabled.", buf, 0xCu);

      }
      v54 = v14;

      objc_autoreleasePoolPop(contexta);
    }
    v45 = (void *)v57;
    -[_HAPAccessoryServerBTLE100 _enqueueWriteCompletionHandler:forCharacteristic:](self, "_enqueueWriteCompletionHandler:forCharacteristic:", v57, v59);
    -[_HAPAccessoryServerBTLE100 _notifyDelegateOfSentPlaintextData:forCharacteristic:](self, "_notifyDelegateOfSentPlaintextData:forCharacteristic:", v25, v59);
    -[_HAPAccessoryServerBTLE100 _updateConnectionLifetimeTimer](self, "_updateConnectionLifetimeTimer");
    -[HAPAccessoryServerBTLE peripheral](self, "peripheral");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    v48 = v60;
    objc_msgSend(v44, "writeValue:forCharacteristic:type:", v60, v17, 0);
    v14 = v54;
LABEL_37:

    v35 = v58;
    v12 = v56;
LABEL_38:

    goto LABEL_39;
  }
  v18 = (void *)MEMORY[0x1D17B7244]();
  HMFGetOSLogHandle();
  v19 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
  {
    HMFGetLogIdentifier();
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v92 = v20;
    v93 = 2112;
    v94 = v13;
    _os_log_impl(&dword_1CCE01000, v19, OS_LOG_TYPE_ERROR, "%{public}@### Error while attempting to write HAP characteristic %@: it does not support writing", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v18);
  v21 = (void *)MEMORY[0x1E0CB35C8];
  objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "localizedStringForKey:value:table:", CFSTR("The characteristic does not support writing."), &stru_1E894EFE8, 0);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "errorWithHMErrorCode:reason:underlyingError:", 5, v23, 0);
  v24 = (id)objc_claimAutoreleasedReturnValue();

  if (v15 && v16)
  {
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __106___HAPAccessoryServerBTLE100__writeValue_forCharacteristic_authorizationData_withCompletionHandler_queue___block_invoke_137;
    block[3] = &unk_1E894D9E8;
    v84 = v15;
    v82 = v13;
    v24 = v24;
    v83 = v24;
    dispatch_async(v16, block);

    v25 = v84;
LABEL_39:

  }
}

- (void)_handleHAPWriteConfirmationForCharacteristic:(id)a3 error:(id)a4
{
  id v6;
  char *v7;
  char *v8;
  void *v9;
  NSObject *v10;
  NSObject *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  NSObject *v17;
  void *v18;
  int v19;
  void *v20;
  __int16 v21;
  const char *v22;
  __int16 v23;
  char *v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = (char *)a4;
  -[_HAPAccessoryServerBTLE100 _hapCharacteristicForBTLECharacteristic:](self, "_hapCharacteristicForBTLECharacteristic:", v6);
  v8 = (char *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)MEMORY[0x1D17B7244]();
  HMFGetOSLogHandle();
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (v8)
  {
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = 138543874;
      v20 = v12;
      v21 = 2112;
      v22 = v8;
      v23 = 2112;
      v24 = v7;
      _os_log_impl(&dword_1CCE01000, v11, OS_LOG_TYPE_INFO, "%{public}@Received write completion for characteristic %@ with error %@", (uint8_t *)&v19, 0x20u);

    }
    objc_autoreleasePoolPop(v9);
    -[_HAPAccessoryServerBTLE100 _dequeueWriteCompletionHandlerForCharacteristic:](self, "_dequeueWriteCompletionHandlerForCharacteristic:", v8);
    v13 = objc_claimAutoreleasedReturnValue();
    v14 = (void *)v13;
    if (v13)
    {
      (*(void (**)(uint64_t, char *, char *))(v13 + 16))(v13, v8, v7);
    }
    else
    {
      v16 = (void *)MEMORY[0x1D17B7244]();
      HMFGetOSLogHandle();
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = 138543874;
        v20 = v18;
        v21 = 2080;
        v22 = "-[_HAPAccessoryServerBTLE100 _handleHAPWriteConfirmationForCharacteristic:error:]";
        v23 = 2112;
        v24 = v8;
        _os_log_impl(&dword_1CCE01000, v17, OS_LOG_TYPE_ERROR, "%{public}@%s: ### Unable to get write completion handler for %@ after receiving a write confirmation", (uint8_t *)&v19, 0x20u);

      }
      objc_autoreleasePoolPop(v16);
    }

  }
  else
  {
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = 138543362;
      v20 = v15;
      _os_log_impl(&dword_1CCE01000, v11, OS_LOG_TYPE_ERROR, "%{public}@### Unable to find HAP characteristic for BTLE characteristic after receiving write confirmation", (uint8_t *)&v19, 0xCu);

    }
    objc_autoreleasePoolPop(v9);
  }

}

- (void)readCharacteristicValues:(id)a3 timeout:(double)a4 completionQueue:(id)a5 completionHandler:(id)a6
{
  id v10;
  id v11;
  id v12;
  NSObject *v13;
  id v14;
  id v15;
  id v16;
  _QWORD block[5];
  id v18;
  id v19;
  id v20;
  double v21;

  v10 = a3;
  v11 = a5;
  v12 = a6;
  -[HAPAccessoryServer clientQueue](self, "clientQueue");
  v13 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __97___HAPAccessoryServerBTLE100_readCharacteristicValues_timeout_completionQueue_completionHandler___block_invoke;
  block[3] = &unk_1E894D608;
  v21 = a4;
  block[4] = self;
  v18 = v10;
  v19 = v11;
  v20 = v12;
  v14 = v12;
  v15 = v11;
  v16 = v10;
  dispatch_async(v13, block);

}

- (void)readValueForCharacteristic:(id)a3 queue:(id)a4 completionHandler:(id)a5
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
  v15[2] = __81___HAPAccessoryServerBTLE100_readValueForCharacteristic_queue_completionHandler___block_invoke;
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

- (void)_readCharacteristicValues:(id)a3 completionQueue:(id)a4 completionHandler:(id)a5
{
  id v8;
  void *v9;
  NSObject *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  NSObject *v19;
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;
  id obj;
  _QWORD block[5];
  id v27;
  id v28;
  id v29;
  _QWORD v30[4];
  id v31;
  id v32;
  NSObject *v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  _BYTE v38[128];
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v24 = a4;
  v23 = a5;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = dispatch_group_create();
  objc_msgSend(MEMORY[0x1E0D28540], "currentActivity");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v34 = 0u;
  v35 = 0u;
  v36 = 0u;
  v37 = 0u;
  obj = v8;
  v12 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v34, v38, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v35;
    do
    {
      v15 = 0;
      do
      {
        if (*(_QWORD *)v35 != v14)
          objc_enumerationMutation(obj);
        v16 = *(void **)(*((_QWORD *)&v34 + 1) + 8 * v15);
        dispatch_group_enter(v10);
        v30[0] = MEMORY[0x1E0C809B0];
        v30[1] = 3221225472;
        v30[2] = __90___HAPAccessoryServerBTLE100__readCharacteristicValues_completionQueue_completionHandler___block_invoke;
        v30[3] = &unk_1E894D6A8;
        v31 = v11;
        v32 = v9;
        v33 = v10;
        v17 = (void *)MEMORY[0x1D17B7400](v30);
        objc_msgSend(v16, "instanceID");

        -[HAPAccessoryServer clientQueue](self, "clientQueue");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        -[_HAPAccessoryServerBTLE100 _readValueForCharacteristic:completionQueue:completionHandler:](self, "_readValueForCharacteristic:completionQueue:completionHandler:", v16, v18, v17);

        ++v15;
      }
      while (v13 != v15);
      v13 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v34, v38, 16);
    }
    while (v13);
  }

  -[HAPAccessoryServer clientQueue](self, "clientQueue");
  v19 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __90___HAPAccessoryServerBTLE100__readCharacteristicValues_completionQueue_completionHandler___block_invoke_157;
  block[3] = &unk_1E894D6D0;
  block[4] = self;
  v27 = v24;
  v28 = v9;
  v29 = v23;
  v20 = v9;
  v21 = v23;
  v22 = v24;
  dispatch_group_notify(v10, v19, block);

}

- (void)_readValueForCharacteristic:(id)a3 completionQueue:(id)a4 completionHandler:(id)a5
{
  id v8;
  NSObject *v9;
  id v10;
  void *v11;
  void *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  NSObject *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  _QWORD v29[4];
  id v30;
  id v31;
  id v32;
  _QWORD block[4];
  id v34;
  id v35;
  id v36;
  _QWORD v37[4];
  id v38;
  id v39;
  id v40;
  _QWORD v41[2];
  _QWORD v42[2];
  uint8_t buf[4];
  void *v44;
  __int16 v45;
  id v46;
  uint64_t v47;

  v47 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  -[_HAPAccessoryServerBTLE100 _btleCharacteristicForHAPCharacteristic:](self, "_btleCharacteristicForHAPCharacteristic:", v8);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11)
  {
    if ((objc_msgSend(v8, "properties") & 2) != 0)
    {
      if (!-[_HAPAccessoryServerBTLE100 isDisconnecting](self, "isDisconnecting"))
      {
        -[_HAPAccessoryServerBTLE100 _enqueueReadCompletionHandler:queue:forCharacteristic:](self, "_enqueueReadCompletionHandler:queue:forCharacteristic:", v10, v9, v8);
        -[_HAPAccessoryServerBTLE100 _updateConnectionLifetimeTimer](self, "_updateConnectionLifetimeTimer");
        -[HAPAccessoryServerBTLE peripheral](self, "peripheral");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "readValueForCharacteristic:", v11);
        goto LABEL_20;
      }
      v27 = (void *)MEMORY[0x1E0CB35C8];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Failed to read the value of characteristic %@"), v8);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "errorWithHMErrorCode:reason:underlyingError:", 4, v28, 0);
      v18 = (void *)objc_claimAutoreleasedReturnValue();

      if (v9 && v10)
      {
        v29[0] = MEMORY[0x1E0C809B0];
        v29[1] = 3221225472;
        v29[2] = __92___HAPAccessoryServerBTLE100__readValueForCharacteristic_completionQueue_completionHandler___block_invoke_2;
        v29[3] = &unk_1E894D9E8;
        v32 = v10;
        v30 = v8;
        v31 = v18;
        dispatch_async(v9, v29);

        v19 = v32;
        goto LABEL_18;
      }
    }
    else
    {
      v12 = (void *)MEMORY[0x1D17B7244]();
      HMFGetOSLogHandle();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v44 = v14;
        v45 = 2112;
        v46 = v8;
        _os_log_impl(&dword_1CCE01000, v13, OS_LOG_TYPE_ERROR, "%{public}@### Error while attempting to read HAP characteristic %@: it does not support reading", buf, 0x16u);

      }
      objc_autoreleasePoolPop(v12);
      v15 = (void *)MEMORY[0x1E0CB35C8];
      objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "localizedStringForKey:value:table:", CFSTR("The characteristic does not support reading."), &stru_1E894EFE8, 0);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "errorWithHMErrorCode:reason:underlyingError:", 6, v17, 0);
      v18 = (void *)objc_claimAutoreleasedReturnValue();

      if (v9 && v10)
      {
        block[0] = MEMORY[0x1E0C809B0];
        block[1] = 3221225472;
        block[2] = __92___HAPAccessoryServerBTLE100__readValueForCharacteristic_completionQueue_completionHandler___block_invoke_163;
        block[3] = &unk_1E894D9E8;
        v36 = v10;
        v34 = v8;
        v35 = v18;
        dispatch_async(v9, block);

        v19 = v36;
LABEL_18:

      }
    }
  }
  else
  {
    v20 = (void *)MEMORY[0x1D17B7244]();
    HMFGetOSLogHandle();
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v44 = v22;
      v45 = 2112;
      v46 = v8;
      _os_log_impl(&dword_1CCE01000, v21, OS_LOG_TYPE_ERROR, "%{public}@### Error while attempting to read HAP characteristic %@: it does not have a corresponding BTLE characteristic", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v20);
    v41[0] = *MEMORY[0x1E0CB2D50];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Failed to read the value of characteristic %@"), v8);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v42[0] = v23;
    v41[1] = *MEMORY[0x1E0CB2D68];
    objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "localizedStringForKey:value:table:", CFSTR("Unable to find matching BTLE characteristic"), &stru_1E894EFE8, 0);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v42[1] = v25;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v42, v41, 2);
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithHMErrorCode:userInfo:", 2, v18);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    if (v9 && v10)
    {
      v37[0] = MEMORY[0x1E0C809B0];
      v37[1] = 3221225472;
      v37[2] = __92___HAPAccessoryServerBTLE100__readValueForCharacteristic_completionQueue_completionHandler___block_invoke;
      v37[3] = &unk_1E894D9E8;
      v40 = v10;
      v38 = v8;
      v39 = v26;
      dispatch_async(v9, v37);

    }
  }
LABEL_20:

}

- (void)_handleUpdatedValueForBTLECharacteristic:(id)a3 error:(id)a4
{
  id v6;
  id v7;
  void *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  NSObject *v18;
  void *v19;
  void *v20;
  void *v21;
  char v22;
  void *v23;
  void *v24;
  uint64_t v25;
  void *v26;
  void *v27;
  NSObject *v28;
  void *v29;
  uint64_t v30;
  _BOOL4 v31;
  void *v32;
  void *v33;
  id v34;
  void *v35;
  NSObject *v36;
  void *v37;
  void *v38;
  void *v39;
  NSObject *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  char v45;
  int v46;
  void *v47;
  void *v48;
  void *v49;
  NSObject *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  NSObject *v55;
  void *v56;
  uint64_t v57;
  void *v58;
  void *v59;
  uint64_t v60;
  void *v61;
  _QWORD v62[4];
  id v63;
  id v64;
  id v65;
  _QWORD v66[5];
  id v67;
  id v68;
  uint8_t buf[4];
  void *v70;
  __int16 v71;
  id v72;
  __int16 v73;
  id v74;
  __int16 v75;
  id v76;
  uint64_t v77;

  v77 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = (void *)MEMORY[0x1D17B7244]();
  HMFGetOSLogHandle();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "UUID");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "value");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138544130;
    v70 = v10;
    v71 = 2112;
    v72 = v11;
    v73 = 2112;
    v74 = v12;
    v75 = 2112;
    v76 = v7;
    _os_log_impl(&dword_1CCE01000, v9, OS_LOG_TYPE_INFO, "%{public}@Updated value for BTLE characteristic: %@ Value: %@ error: %@", buf, 0x2Au);

  }
  objc_autoreleasePoolPop(v8);
  v13 = v7;
  v14 = v13;
  if (v13)
  {
    v15 = 0;
    v16 = v13;
    goto LABEL_5;
  }
  -[_HAPAccessoryServerBTLE100 _hapCharacteristicForBTLECharacteristic:](self, "_hapCharacteristicForBTLECharacteristic:", v6);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v15)
  {
    v54 = (void *)MEMORY[0x1D17B7244]();
    HMFGetOSLogHandle();
    v55 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v55, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v56 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v70 = v56;
      v71 = 2112;
      v72 = v6;
      _os_log_impl(&dword_1CCE01000, v55, OS_LOG_TYPE_ERROR, "%{public}@### Unable to find HAP characteristic for BTLE characteristic %@ after receiving read response", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v54);
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithHMErrorCode:", 27);
    v57 = objc_claimAutoreleasedReturnValue();
    if (v57)
    {
      v16 = (id)v57;
      v15 = 0;
      goto LABEL_5;
    }
  }
  objc_msgSend(v6, "value");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = objc_msgSend(v29, "length");

  if (!v30)
  {
    v22 = 0;
    v16 = 0;
    goto LABEL_8;
  }
  v31 = -[_HAPAccessoryServerBTLE100 _shouldEnableSessionSecurity](self, "_shouldEnableSessionSecurity");
  objc_msgSend(v6, "value");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  if (v31)
  {
    -[_HAPAccessoryServerBTLE100 _notifyDelegateOfReceivedEncryptedAuthenticatedData:forCharacteristic:](self, "_notifyDelegateOfReceivedEncryptedAuthenticatedData:forCharacteristic:", v32, v15);

    objc_msgSend(v6, "value");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v68 = 0;
    -[_HAPAccessoryServerBTLE100 _decryptData:error:](self, "_decryptData:error:", v33, &v68);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v34 = v68;

    if (v34)
    {
      v35 = (void *)MEMORY[0x1D17B7244]();
      HMFGetOSLogHandle();
      v36 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        v70 = v37;
        v71 = 2112;
        v72 = v6;
        v73 = 2112;
        v74 = v34;
        _os_log_impl(&dword_1CCE01000, v36, OS_LOG_TYPE_ERROR, "%{public}@### Decrypting data for characteristic %@ received after a read request failed with error: %@", buf, 0x20u);

      }
      objc_autoreleasePoolPop(v35);
      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithHMErrorCode:", 55);
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_39;
    }
  }
  else
  {
    v34 = 0;
  }
  v38 = 0;
LABEL_39:
  -[_HAPAccessoryServerBTLE100 _notifyDelegateOfReceivedPlaintextData:forCharacteristic:](self, "_notifyDelegateOfReceivedPlaintextData:forCharacteristic:", v32, v15);
  objc_msgSend(v15, "metadata");
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v58, "format");
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  v60 = HAPCharacteristicFormatFromString(v59);

  v67 = v38;
  +[_HAPAccessoryServerBTLE100 deserializeCharacteristicReadData:characteristicFormat:supportsAdditionalAuthentication:error:](_HAPAccessoryServerBTLE100, "deserializeCharacteristicReadData:characteristicFormat:supportsAdditionalAuthentication:error:", v32, v60, objc_msgSend(v15, "supportsAdditionalAuthorizationData"), &v67);
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = v67;

  if (!v16)
  {
    objc_msgSend(v15, "setValue:", v61);

    v22 = 0;
    goto LABEL_8;
  }

LABEL_5:
  v17 = (void *)MEMORY[0x1D17B7244]();
  HMFGetOSLogHandle();
  v18 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
  {
    HMFGetLogIdentifier();
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[HAPAccessoryServer identifier](self, "identifier");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[HAPAccessoryServer name](self, "name");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138544130;
    v70 = v19;
    v71 = 2112;
    v72 = v20;
    v73 = 2112;
    v74 = v21;
    v75 = 2112;
    v76 = v16;
    _os_log_impl(&dword_1CCE01000, v18, OS_LOG_TYPE_ERROR, "%{public}@### [BTLE Accessory Server '%@' '%@'] Failed to process updated characteristic value with error: %@", buf, 0x2Au);

  }
  objc_autoreleasePoolPop(v17);
  v22 = 1;
LABEL_8:
  -[_HAPAccessoryServerBTLE100 _dequeueReadCompletionTupleForCharacteristic:](self, "_dequeueReadCompletionTupleForCharacteristic:", v15);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = v23;
  if (v23)
  {
    objc_msgSend(v23, "completionQueue");
    v25 = objc_claimAutoreleasedReturnValue();
    if (v25)
    {
      v26 = (void *)v25;
      objc_msgSend(v24, "handler");
      v27 = (void *)objc_claimAutoreleasedReturnValue();

      if (v27)
      {
        objc_msgSend(v24, "completionQueue");
        v28 = objc_claimAutoreleasedReturnValue();
        v62[0] = MEMORY[0x1E0C809B0];
        v62[1] = 3221225472;
        v62[2] = __77___HAPAccessoryServerBTLE100__handleUpdatedValueForBTLECharacteristic_error___block_invoke_164;
        v62[3] = &unk_1E894E120;
        v63 = v24;
        v64 = v15;
        v65 = v16;
        dispatch_async(v28, v62);

      }
    }
  }
  else
  {
    v39 = (void *)MEMORY[0x1D17B7244]();
    HMFGetOSLogHandle();
    v40 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v40, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v70 = v41;
      v71 = 2112;
      v72 = v15;
      _os_log_impl(&dword_1CCE01000, v40, OS_LOG_TYPE_INFO, "%{public}@Received notification for HAPCharacteristic %@, Reading Value", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v39);
    -[HAPAccessoryServerBTLE browser](self, "browser");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    -[HAPAccessoryServer identifier](self, "identifier");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v42, "markNotifyingCharacteristicUpdatedForIdentifier:", v43);

    objc_msgSend(v6, "value");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v44, "length"))
      v45 = 1;
    else
      v45 = v22;
    if ((v45 & 1) != 0)
    {

    }
    else
    {
      v46 = objc_msgSend(v15, "eventNotificationsEnabled");

      if (v46)
      {
        v66[0] = MEMORY[0x1E0C809B0];
        v66[1] = 3221225472;
        v66[2] = __77___HAPAccessoryServerBTLE100__handleUpdatedValueForBTLECharacteristic_error___block_invoke;
        v66[3] = &unk_1E894D6F8;
        v66[4] = self;
        v47 = (void *)MEMORY[0x1D17B7400](v66);
        -[_HAPAccessoryServerBTLE100 _updateConnectionLifetimeTimer](self, "_updateConnectionLifetimeTimer");
        -[HAPAccessoryServer clientQueue](self, "clientQueue");
        v48 = (void *)objc_claimAutoreleasedReturnValue();
        -[_HAPAccessoryServerBTLE100 readValueForCharacteristic:queue:completionHandler:](self, "readValueForCharacteristic:queue:completionHandler:", v15, v48, v47);

        goto LABEL_31;
      }
    }
    v49 = (void *)MEMORY[0x1D17B7244]();
    HMFGetOSLogHandle();
    v50 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v50, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      -[HAPAccessoryServer identifier](self, "identifier");
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      -[HAPAccessoryServer name](self, "name");
      v53 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544130;
      v70 = v51;
      v71 = 2112;
      v72 = v52;
      v73 = 2112;
      v74 = v53;
      v75 = 2112;
      v76 = v16;
      _os_log_impl(&dword_1CCE01000, v50, OS_LOG_TYPE_ERROR, "%{public}@### [BTLE Accessory Server '%@' '%@'] Failed to process updated characteristic value with error: %@", buf, 0x2Au);

    }
    objc_autoreleasePoolPop(v49);
  }
LABEL_31:

}

- (void)_reallyEstablishSecureSession
{
  void *v3;
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  HAPSecuritySession *v11;
  int v12;
  void *v13;
  __int16 v14;
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  if (-[HAPAccessoryServerBTLE isPaired](self, "isPaired"))
  {
    if (-[HAPAccessoryServer isSecuritySessionOpen](self, "isSecuritySessionOpen"))
    {
      v3 = (void *)MEMORY[0x1D17B7244]();
      HMFGetOSLogHandle();
      v4 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
      {
        HMFGetLogIdentifier();
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        -[HAPAccessoryServer identifier](self, "identifier");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = 138543618;
        v13 = v5;
        v14 = 2112;
        v15 = v6;
        _os_log_impl(&dword_1CCE01000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@[BTLE Accessory Server %@] A security session is already established.", (uint8_t *)&v12, 0x16u);

      }
      objc_autoreleasePoolPop(v3);
    }
  }
  else
  {
    v7 = (void *)MEMORY[0x1D17B7244]();
    HMFGetOSLogHandle();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[HAPAccessoryServer identifier](self, "identifier");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = 138543618;
      v13 = v9;
      v14 = 2112;
      v15 = v10;
      _os_log_impl(&dword_1CCE01000, v8, OS_LOG_TYPE_ERROR, "%{public}@[BTLE Accessory Server %@] Unable to establish a secure session because the accessory isn't paired.", (uint8_t *)&v12, 0x16u);

    }
    objc_autoreleasePoolPop(v7);
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithHMErrorCode:", 18);

  }
  if (HAPIsHH2Enabled_onceToken != -1)
    dispatch_once(&HAPIsHH2Enabled_onceToken, &__block_literal_global_11472);
  if (HAPIsHH2Enabled_hh2Enabled == 1)
    -[HAPAccessoryServer initializeKeyBagIfNecessary](self, "initializeKeyBagIfNecessary");
  v11 = -[HAPSecuritySession initWithRole:resumeSessionID:delegate:]([HAPSecuritySession alloc], "initWithRole:resumeSessionID:delegate:", 0, 0, self);
  -[_HAPAccessoryServerBTLE100 setSecuritySession:](self, "setSecuritySession:", v11);
  -[HAPSecuritySession open](v11, "open");

}

- (void)_handleReceivedSecuritySessionSetupExchangeData:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  _BOOL4 v7;
  void *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  void *v14;
  __int16 v15;
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[_HAPAccessoryServerBTLE100 securitySession](self, "securitySession");
  v5 = objc_claimAutoreleasedReturnValue();
  if (v5
    && (v6 = (void *)v5,
        v7 = -[HAPAccessoryServer isSecuritySessionOpen](self, "isSecuritySessionOpen"),
        v6,
        !v7))
  {
    -[_HAPAccessoryServerBTLE100 securitySession](self, "securitySession");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "receivedSetupExchangeData:error:", v4, 0);

  }
  else
  {
    v8 = (void *)MEMORY[0x1D17B7244]();
    HMFGetOSLogHandle();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      HMFGetLogIdentifier();
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[HAPAccessoryServer identifier](self, "identifier");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = 138543618;
      v14 = v10;
      v15 = 2112;
      v16 = v11;
      _os_log_impl(&dword_1CCE01000, v9, OS_LOG_TYPE_DEFAULT, "%{public}@[BTLE Accessory Server %@] Unexpected security session setup exchange data, dropping.", (uint8_t *)&v13, 0x16u);

    }
    objc_autoreleasePoolPop(v8);
  }

}

- (id)_encryptDataAndGenerateAuthTag:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  int v14;
  void *v15;
  __int16 v16;
  const char *v17;
  __int16 v18;
  id v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = (void *)MEMORY[0x1D17B7244]();
  HMFGetOSLogHandle();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    HMFGetLogIdentifier();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = 138543874;
    v15 = v9;
    v16 = 2080;
    v17 = "-[_HAPAccessoryServerBTLE100 _encryptDataAndGenerateAuthTag:error:]";
    v18 = 2112;
    v19 = v6;
    _os_log_impl(&dword_1CCE01000, v8, OS_LOG_TYPE_DEBUG, "%{public}@%s: Encrypting plaintext data: %@", (uint8_t *)&v14, 0x20u);

  }
  objc_autoreleasePoolPop(v7);
  -[_HAPAccessoryServerBTLE100 securitySession](self, "securitySession");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    -[_HAPAccessoryServerBTLE100 securitySession](self, "securitySession");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "encryptData:additionalAuthenticatedData:error:", v6, 0, a4);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else if (a4)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("HAPErrorDomain"), -6718, 0);
    v12 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v12 = 0;
  }

  return v12;
}

- (id)_decryptData:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  int v14;
  void *v15;
  __int16 v16;
  const char *v17;
  __int16 v18;
  uint64_t v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = (void *)MEMORY[0x1D17B7244]();
  HMFGetOSLogHandle();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    HMFGetLogIdentifier();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = 138543874;
    v15 = v9;
    v16 = 2080;
    v17 = "-[_HAPAccessoryServerBTLE100 _decryptData:error:]";
    v18 = 2048;
    v19 = objc_msgSend(v6, "length");
    _os_log_impl(&dword_1CCE01000, v8, OS_LOG_TYPE_DEBUG, "%{public}@%s: Decrypting data with length %lu", (uint8_t *)&v14, 0x20u);

  }
  objc_autoreleasePoolPop(v7);
  -[_HAPAccessoryServerBTLE100 securitySession](self, "securitySession");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    -[_HAPAccessoryServerBTLE100 securitySession](self, "securitySession");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "decryptData:additionalAuthenticatedData:error:", v6, 0, a4);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else if (a4)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("HAPErrorDomain"), -6718, 0);
    v12 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v12 = 0;
  }

  return v12;
}

- (id)securitySession:(id)a3 didReceiveLocalPairingIdentityRequestWithError:(id *)a4
{
  id v6;
  void *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  int v16;
  void *v17;
  __int16 v18;
  void *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = (void *)MEMORY[0x1D17B7244]();
  HMFGetOSLogHandle();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[HAPAccessoryServer identifier](self, "identifier");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = 138543618;
    v17 = v9;
    v18 = 2112;
    v19 = v10;
    _os_log_impl(&dword_1CCE01000, v8, OS_LOG_TYPE_INFO, "%{public}@[BTLE Accessory Server %@] Request for local pairing identity", (uint8_t *)&v16, 0x16u);

  }
  objc_autoreleasePoolPop(v7);
  if (HAPIsHH2Enabled_onceToken != -1)
    dispatch_once(&HAPIsHH2Enabled_onceToken, &__block_literal_global_11472);
  if (HAPIsHH2Enabled_hh2Enabled != 1
    || (-[HAPAccessoryServer keyBag](self, "keyBag"),
        v11 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v11, "currentIdentity"),
        v12 = (void *)objc_claimAutoreleasedReturnValue(),
        v11,
        !v12))
  {
    -[HAPAccessoryServer keyStore](self, "keyStore");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[HAPAccessoryServer identifier](self, "identifier");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "readControllerPairingKeyForAccessory:error:", v14, a4);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v12;
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
  NSObject *v18;
  void *v19;
  void *v20;
  void *v21;
  NSObject *v22;
  void *v23;
  void *v24;
  void *v25;
  NSObject *v26;
  void *v27;
  void *v28;
  void *v30;
  id v31;
  uint8_t buf[4];
  void *v33;
  __int16 v34;
  void *v35;
  __int16 v36;
  id v37;
  __int16 v38;
  id v39;
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
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
        HMFGetOSLogHandle();
        v18 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
        {
          HMFGetLogIdentifier();
          v30 = v17;
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          -[HAPAccessoryServer identifier](self, "identifier");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138544130;
          v33 = v19;
          v34 = 2112;
          v35 = v20;
          v36 = 2112;
          v37 = v9;
          v38 = 2112;
          v39 = v13;
          _os_log_impl(&dword_1CCE01000, v18, OS_LOG_TYPE_DEFAULT, "%{public}@[BTLE Accessory Server %@] Failed to create pairing identity with identifier, %@, public key, %@", buf, 0x2Au);

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
      HMFGetOSLogHandle();
      v26 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        -[HAPAccessoryServer identifier](self, "identifier");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138544130;
        v33 = v27;
        v34 = 2112;
        v35 = v28;
        v36 = 2112;
        v37 = v9;
        v38 = 2112;
        v39 = v14;
        _os_log_impl(&dword_1CCE01000, v26, OS_LOG_TYPE_ERROR, "%{public}@[BTLE Accessory Server %@] Failed to retrieved public key for accessory with identifier '%@' with error: %@", buf, 0x2Au);

      }
      objc_autoreleasePoolPop(v25);
      v16 = 0;
    }

  }
  else
  {
    v21 = (void *)MEMORY[0x1D17B7244]();
    HMFGetOSLogHandle();
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      -[HAPAccessoryServer identifier](self, "identifier");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v33 = v23;
      v34 = 2112;
      v35 = v24;
      v36 = 2112;
      v37 = v9;
      _os_log_impl(&dword_1CCE01000, v22, OS_LOG_TYPE_ERROR, "%{public}@[BTLE Accessory Server %@] Unexpected pairing peer identifier, %@", buf, 0x20u);

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
  _HAPAccessoryServerBTLE100 *v13;
  id v14;

  v6 = a3;
  v7 = a4;
  -[HAPAccessoryServer clientQueue](self, "clientQueue");
  v8 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __74___HAPAccessoryServerBTLE100_securitySession_didReceiveSetupExchangeData___block_invoke;
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
  _HAPAccessoryServerBTLE100 *v9;

  v4 = a3;
  -[HAPAccessoryServer clientQueue](self, "clientQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __55___HAPAccessoryServerBTLE100_securitySessionIsOpening___block_invoke;
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
  _HAPAccessoryServerBTLE100 *v9;

  v4 = a3;
  -[HAPAccessoryServer clientQueue](self, "clientQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __53___HAPAccessoryServerBTLE100_securitySessionDidOpen___block_invoke;
  v7[3] = &unk_1E894E0F8;
  v8 = v4;
  v9 = self;
  v6 = v4;
  dispatch_async(v5, v7);

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
  _HAPAccessoryServerBTLE100 *v13;
  id v14;

  v6 = a3;
  v7 = a4;
  -[HAPAccessoryServer clientQueue](self, "clientQueue");
  v8 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __64___HAPAccessoryServerBTLE100_securitySession_didCloseWithError___block_invoke;
  block[3] = &unk_1E894E120;
  v12 = v6;
  v13 = self;
  v14 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(v8, block);

}

- (void)discoverAccessories
{
  NSObject *v3;
  _QWORD block[5];

  -[HAPAccessoryServer clientQueue](self, "clientQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __49___HAPAccessoryServerBTLE100_discoverAccessories__block_invoke;
  block[3] = &unk_1E894DD08;
  block[4] = self;
  dispatch_async(v3, block);

}

- (void)_getAttributeDatabase
{
  void *v3;
  NSObject *v4;
  void *v5;
  id v6;
  void *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  void *v12;
  _QWORD block[5];
  uint8_t buf[4];
  void *v15;
  __int16 v16;
  id v17;
  __int16 v18;
  const char *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v3 = (void *)MEMORY[0x1D17B7244](self, a2);
  HMFGetOSLogHandle();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    v15 = v5;
    v16 = 2112;
    v17 = (id)objc_opt_class();
    v18 = 2080;
    v19 = "-[_HAPAccessoryServerBTLE100 _getAttributeDatabase]";
    v6 = v17;
    _os_log_impl(&dword_1CCE01000, v4, OS_LOG_TYPE_INFO, "%{public}@%@ %s: Getting HAP attribute database from accessory", buf, 0x20u);

  }
  objc_autoreleasePoolPop(v3);
  if (-[_HAPAccessoryServerBTLE100 state](self, "state") == 12)
  {
    v7 = (void *)MEMORY[0x1D17B7244]();
    HMFGetOSLogHandle();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      HMFGetLogIdentifier();
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[HAPAccessoryServer identifier](self, "identifier");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v15 = v9;
      v16 = 2112;
      v17 = v10;
      _os_log_impl(&dword_1CCE01000, v8, OS_LOG_TYPE_DEFAULT, "%{public}@[BTLE Accessory Server %@] Ignoring request to discover accessories because the session is already established, calling delegate immediately", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v7);
    if (-[_HAPAccessoryServerBTLE100 _delegateRespondsToSelector:](self, "_delegateRespondsToSelector:", sel_accessoryServer_didDiscoverAccessories_transaction_error_))
    {
      -[HAPAccessoryServer delegateQueue](self, "delegateQueue");
      v11 = objc_claimAutoreleasedReturnValue();
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __51___HAPAccessoryServerBTLE100__getAttributeDatabase__block_invoke;
      block[3] = &unk_1E894DD08;
      block[4] = self;
      dispatch_async(v11, block);

    }
  }
  else
  {
    -[_HAPAccessoryServerBTLE100 _updateConnectionLifetimeTimer](self, "_updateConnectionLifetimeTimer");
    -[HAPAccessoryServerBTLE peripheral](self, "peripheral");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "discoverServices:", 0);

  }
}

- (void)_handleHAPServiceDiscovery
{
  _HAPAccessoryServerBTLE100 *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  _HAPAccessoryServerBTLE100 *v24;
  void *v25;
  char v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  id obj;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  _BYTE v37[128];
  uint64_t v38;

  v2 = self;
  v38 = *MEMORY[0x1E0C80C00];
  -[_HAPAccessoryServerBTLE100 setCharacteristicDiscoveryRequestCount:](self, "setCharacteristicDiscoveryRequestCount:", 0);
  -[_HAPAccessoryServerBTLE100 setCharacteristicValueReadCount:](v2, "setCharacteristicValueReadCount:", 0);
  v35 = 0u;
  v36 = 0u;
  v33 = 0u;
  v34 = 0u;
  -[HAPAccessoryServerBTLE peripheral](v2, "peripheral");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "services");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  obj = v4;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v33, v37, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v34;
    v8 = *MEMORY[0x1E0C976F8];
    v27 = *MEMORY[0x1E0C976C8];
    v28 = *MEMORY[0x1E0C976D0];
    v23 = *MEMORY[0x1E0C976B8];
    v24 = v2;
    v9 = 0x1E0C97000uLL;
    v29 = *MEMORY[0x1E0C976F8];
    v30 = *(_QWORD *)v34;
    do
    {
      v10 = 0;
      v31 = v6;
      do
      {
        if (*(_QWORD *)v34 != v7)
          objc_enumerationMutation(obj);
        v11 = *(void **)(*((_QWORD *)&v33 + 1) + 8 * v10);
        -[_HAPAccessoryServerBTLE100 pairingService](v2, "pairingService", v23);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        if ((objc_msgSend(v11, "isEqual:", v12) & 1) != 0)
          goto LABEL_12;
        v13 = v11;
        objc_msgSend(v13, "UUID");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(v9 + 1912), "UUIDWithString:", v8);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        if ((objc_msgSend(v14, "isEqual:", v15) & 1) != 0)
        {

          goto LABEL_11;
        }
        objc_msgSend(v13, "UUID");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(v9 + 1912), "UUIDWithString:", v28);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        if ((objc_msgSend(v16, "isEqual:", v17) & 1) != 0)
        {

          v8 = v29;
          v7 = v30;
LABEL_11:
          v6 = v31;
LABEL_12:

          goto LABEL_13;
        }
        objc_msgSend(v13, "UUID");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(v9 + 1912), "UUIDWithString:", v27);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        if ((objc_msgSend(v18, "isEqual:", v19) & 1) != 0)
        {

          v8 = v29;
          v7 = v30;
          v6 = v31;
          v9 = 0x1E0C97000;
          goto LABEL_12;
        }
        objc_msgSend(v13, "UUID");
        v25 = v18;
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0C97778], "UUIDWithString:", v23);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        v26 = objc_msgSend(v20, "isEqual:", v21);

        v2 = v24;
        v8 = v29;
        v7 = v30;
        v6 = v31;
        v9 = 0x1E0C97000;
        if ((v26 & 1) == 0)
        {
          -[_HAPAccessoryServerBTLE100 setCharacteristicDiscoveryRequestCount:](v24, "setCharacteristicDiscoveryRequestCount:", -[_HAPAccessoryServerBTLE100 characteristicDiscoveryRequestCount](v24, "characteristicDiscoveryRequestCount")+ 1);
          -[_HAPAccessoryServerBTLE100 _updateConnectionLifetimeTimer](v24, "_updateConnectionLifetimeTimer");
          -[HAPAccessoryServerBTLE peripheral](v24, "peripheral");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "discoverCharacteristics:forService:", 0, v13);
          goto LABEL_12;
        }
LABEL_13:
        ++v10;
      }
      while (v6 != v10);
      v22 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v33, v37, 16);
      v6 = v22;
    }
    while (v22);
  }

}

- (void)_handleDescriptorDiscovery
{
  void *v3;
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  __int128 v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  NSObject *v15;
  void *v16;
  void *v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  uint8_t buf[4];
  void *v24;
  __int16 v25;
  uint64_t v26;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  -[_HAPAccessoryServerBTLE100 setMetadataDiscoveryRequestCount:](self, "setMetadataDiscoveryRequestCount:", 0);
  if (-[_HAPAccessoryServerBTLE100 hapBLEProtocolVersion](self, "hapBLEProtocolVersion") == 1)
  {
    v3 = (void *)MEMORY[0x1D17B7244]();
    HMFGetOSLogHandle();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v24 = v5;
      _os_log_impl(&dword_1CCE01000, v4, OS_LOG_TYPE_INFO, "%{public}@Skipping descriptor discovery", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v3);
  }
  else
  {
    v21 = 0u;
    v22 = 0u;
    v19 = 0u;
    v20 = 0u;
    -[_HAPAccessoryServerBTLE100 btleCharacteristicToHAPCharacteristicMap](self, "btleCharacteristicToHAPCharacteristicMap");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "keyEnumerator");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v19, v27, 16);
    if (v8)
    {
      v10 = v8;
      v11 = *(_QWORD *)v20;
      *(_QWORD *)&v9 = 138543618;
      v18 = v9;
      do
      {
        v12 = 0;
        do
        {
          if (*(_QWORD *)v20 != v11)
            objc_enumerationMutation(v7);
          v13 = *(_QWORD *)(*((_QWORD *)&v19 + 1) + 8 * v12);
          v14 = (void *)MEMORY[0x1D17B7244]();
          HMFGetOSLogHandle();
          v15 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
          {
            HMFGetLogIdentifier();
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = v18;
            v24 = v16;
            v25 = 2112;
            v26 = v13;
            _os_log_impl(&dword_1CCE01000, v15, OS_LOG_TYPE_INFO, "%{public}@Discovering metadata for BTLE Char: %@", buf, 0x16u);

          }
          objc_autoreleasePoolPop(v14);
          -[_HAPAccessoryServerBTLE100 setMetadataDiscoveryRequestCount:](self, "setMetadataDiscoveryRequestCount:", -[_HAPAccessoryServerBTLE100 metadataDiscoveryRequestCount](self, "metadataDiscoveryRequestCount") + 1);
          -[_HAPAccessoryServerBTLE100 _updateConnectionLifetimeTimer](self, "_updateConnectionLifetimeTimer");
          -[HAPAccessoryServerBTLE peripheral](self, "peripheral");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "discoverDescriptorsForCharacteristic:", v13);

          ++v12;
        }
        while (v10 != v12);
        v10 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v19, v27, 16);
      }
      while (v10);
    }

  }
  if (!-[_HAPAccessoryServerBTLE100 metadataDiscoveryRequestCount](self, "metadataDiscoveryRequestCount", v18))
    -[_HAPAccessoryServerBTLE100 _handlePairingStateMachine](self, "_handlePairingStateMachine");
}

- (void)_handleReadDescriptorValues
{
  void *v3;
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  NSObject *v20;
  id obj;
  _QWORD block[5];
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  uint8_t buf[4];
  void *v32;
  _BYTE v33[128];
  _BYTE v34[128];
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  -[_HAPAccessoryServerBTLE100 setMetadataValueReadCount:](self, "setMetadataValueReadCount:", 0);
  if (-[_HAPAccessoryServerBTLE100 hapBLEProtocolVersion](self, "hapBLEProtocolVersion") == 1)
  {
    v3 = (void *)MEMORY[0x1D17B7244]();
    HMFGetOSLogHandle();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v32 = v5;
      _os_log_impl(&dword_1CCE01000, v4, OS_LOG_TYPE_INFO, "%{public}@Skipping descriptor reads", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v3);
  }
  else
  {
    v29 = 0u;
    v30 = 0u;
    v27 = 0u;
    v28 = 0u;
    -[_HAPAccessoryServerBTLE100 btleCharacteristicToHAPCharacteristicMap](self, "btleCharacteristicToHAPCharacteristicMap");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "keyEnumerator");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    obj = v7;
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v27, v34, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v28;
      do
      {
        v11 = 0;
        do
        {
          if (*(_QWORD *)v28 != v10)
            objc_enumerationMutation(obj);
          v12 = *(void **)(*((_QWORD *)&v27 + 1) + 8 * v11);
          v23 = 0u;
          v24 = 0u;
          v25 = 0u;
          v26 = 0u;
          objc_msgSend(v12, "descriptors");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v23, v33, 16);
          if (v14)
          {
            v15 = v14;
            v16 = *(_QWORD *)v24;
            do
            {
              v17 = 0;
              do
              {
                if (*(_QWORD *)v24 != v16)
                  objc_enumerationMutation(v13);
                v18 = *(_QWORD *)(*((_QWORD *)&v23 + 1) + 8 * v17);
                -[_HAPAccessoryServerBTLE100 setMetadataValueReadCount:](self, "setMetadataValueReadCount:", -[_HAPAccessoryServerBTLE100 metadataValueReadCount](self, "metadataValueReadCount") + 1);
                -[_HAPAccessoryServerBTLE100 _updateConnectionLifetimeTimer](self, "_updateConnectionLifetimeTimer");
                -[HAPAccessoryServerBTLE peripheral](self, "peripheral");
                v19 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v19, "readValueForDescriptor:", v18);

                ++v17;
              }
              while (v15 != v17);
              v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v23, v33, 16);
            }
            while (v15);
          }

          ++v11;
        }
        while (v11 != v9);
        v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v27, v34, 16);
      }
      while (v9);
    }

  }
  if (!-[_HAPAccessoryServerBTLE100 metadataValueReadCount](self, "metadataValueReadCount"))
  {
    -[_HAPAccessoryServerBTLE100 _handlePairingStateMachine](self, "_handlePairingStateMachine");
    if (-[_HAPAccessoryServerBTLE100 _delegateRespondsToSelector:](self, "_delegateRespondsToSelector:", sel_accessoryServer_didDiscoverAccessories_transaction_error_))
    {
      -[HAPAccessoryServer delegateQueue](self, "delegateQueue");
      v20 = objc_claimAutoreleasedReturnValue();
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __57___HAPAccessoryServerBTLE100__handleReadDescriptorValues__block_invoke;
      block[3] = &unk_1E894DD08;
      block[4] = self;
      dispatch_async(v20, block);

    }
  }
}

- (void)_handleHAPCharacteristicDiscoveryForService:(id)a3 error:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  int v15;
  void *v16;
  NSObject *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  uint8_t buf[4];
  void *v29;
  __int16 v30;
  void *v31;
  __int16 v32;
  void *v33;
  __int16 v34;
  void *v35;
  _BYTE v36[128];
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v23 = a4;
  objc_msgSend(MEMORY[0x1E0C97778], "UUIDWithString:", CFSTR("00000051-0000-1000-8000-0026BB765291"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  objc_msgSend(v6, "characteristics");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v24, v36, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v25;
    while (2)
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v25 != v11)
          objc_enumerationMutation(v8);
        v13 = *(void **)(*((_QWORD *)&v24 + 1) + 8 * i);
        objc_msgSend(v13, "UUID");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = objc_msgSend(v14, "isEqual:", v7);

        if (v15)
        {
          -[_HAPAccessoryServerBTLE100 setCharacteristicValueReadCount:](self, "setCharacteristicValueReadCount:", -[_HAPAccessoryServerBTLE100 characteristicValueReadCount](self, "characteristicValueReadCount") + 1);
          -[HAPAccessoryServerBTLE peripheral](self, "peripheral");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v22, "readValueForCharacteristic:", v13);

          goto LABEL_13;
        }
      }
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v24, v36, 16);
      if (v10)
        continue;
      break;
    }
  }

  v16 = (void *)MEMORY[0x1D17B7244]();
  HMFGetOSLogHandle();
  v17 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    HMFGetLogIdentifier();
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[HAPAccessoryServer identifier](self, "identifier");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[HAPAccessoryServer name](self, "name");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "UUID");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138544130;
    v29 = v18;
    v30 = 2112;
    v31 = v19;
    v32 = 2112;
    v33 = v20;
    v34 = 2112;
    v35 = v21;
    _os_log_impl(&dword_1CCE01000, v17, OS_LOG_TYPE_DEFAULT, "%{public}@[BTLE Accessory Server %@ '%@'] Service with UUID %@ does not have the HAP Service Instance ID characteristic, skipping HAPService creation", buf, 0x2Au);

  }
  objc_autoreleasePoolPop(v16);
LABEL_13:
  -[_HAPAccessoryServerBTLE100 setCharacteristicDiscoveryRequestCount:](self, "setCharacteristicDiscoveryRequestCount:", -[_HAPAccessoryServerBTLE100 characteristicDiscoveryRequestCount](self, "characteristicDiscoveryRequestCount") - 1);

}

- (void)_handleHAPServiceDiscoveryCompletionForService:(id)a3 withInstanceId:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  NSObject *v17;
  void *v18;
  void *v19;
  NSObject *v20;
  id v21;
  _QWORD v22[5];
  id v23;
  uint8_t buf[4];
  void *v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  -[_HAPAccessoryServerBTLE100 _parseBTLEService:withInstanceId:](self, "_parseBTLEService:withInstanceId:", v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    -[_HAPAccessoryServerBTLE100 btleServiceToHAPServiceMap](self, "btleServiceToHAPServiceMap");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setObject:forKey:", v8, v6);

    -[HAPAccessoryServer primaryAccessory](self, "primaryAccessory");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setAccessory:", v10);

    v11 = (void *)MEMORY[0x1E0C99DE8];
    -[HAPAccessoryServer primaryAccessory](self, "primaryAccessory");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "services");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "arrayWithArray:", v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v14, "addObject:", v8);
    -[HAPAccessoryServer primaryAccessory](self, "primaryAccessory");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setServices:", v14);

    -[_HAPAccessoryServerBTLE100 setCharacteristicValueReadCount:](self, "setCharacteristicValueReadCount:", -[_HAPAccessoryServerBTLE100 characteristicValueReadCount](self, "characteristicValueReadCount") - 1);
    if (!-[_HAPAccessoryServerBTLE100 characteristicDiscoveryRequestCount](self, "characteristicDiscoveryRequestCount")
      && !-[_HAPAccessoryServerBTLE100 characteristicValueReadCount](self, "characteristicValueReadCount"))
    {
      -[_HAPAccessoryServerBTLE100 _handlePairingStateMachine](self, "_handlePairingStateMachine");
    }

  }
  else
  {
    v16 = (void *)MEMORY[0x1D17B7244]();
    HMFGetOSLogHandle();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v25 = v18;
      _os_log_impl(&dword_1CCE01000, v17, OS_LOG_TYPE_ERROR, "%{public}@### Unable to parse BTLE service", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v16);
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithHMErrorCode:", 66);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[HAPAccessoryServer delegateQueue](self, "delegateQueue");
    v20 = objc_claimAutoreleasedReturnValue();
    v22[0] = MEMORY[0x1E0C809B0];
    v22[1] = 3221225472;
    v22[2] = __92___HAPAccessoryServerBTLE100__handleHAPServiceDiscoveryCompletionForService_withInstanceId___block_invoke;
    v22[3] = &unk_1E894E0F8;
    v22[4] = self;
    v23 = v19;
    v21 = v19;
    dispatch_async(v20, v22);

  }
}

- (id)_parseBTLEService:(id)a3 withInstanceId:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  _HAPAccessoryServerBTLE100 *v11;
  uint64_t v12;
  void *v13;
  NSObject *v14;
  void *v15;
  void *v16;
  HAPService *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  _HAPAccessoryServerBTLE100 *v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  void *v25;
  char v26;
  unint64_t v27;
  uint64_t v28;
  HAPCharacteristicMetadata *v29;
  void *v30;
  void *v31;
  HAPCharacteristic *v32;
  void *v33;
  void *v34;
  HAPCharacteristic *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  NSObject *v40;
  void *v41;
  void *v42;
  NSObject *v43;
  void *v44;
  uint64_t v46;
  void *v47;
  id v48;
  id v49;
  void *v50;
  uint64_t v51;
  void *v52;
  HAPService *v53;
  id obj;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  uint8_t v59[128];
  uint8_t buf[4];
  void *v61;
  __int16 v62;
  void *v63;
  uint64_t v64;

  v64 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  objc_msgSend(v6, "UUID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "UUIDString");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  +[_HAPAccessoryServerBTLE100 _convertFromBTLEToHAPUUID:](_HAPAccessoryServerBTLE100, "_convertFromBTLEToHAPUUID:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    v11 = self;
    if (-[_HAPAccessoryServerBTLE100 hapBLEProtocolVersion](self, "hapBLEProtocolVersion") == 1)
    {
      -[_HAPAccessoryServerBTLE100 _nextInstanceID](self, "_nextInstanceID");
      v12 = objc_claimAutoreleasedReturnValue();

      v7 = (id)v12;
    }
    v53 = -[HAPService initWithType:instanceID:]([HAPService alloc], "initWithType:instanceID:", v10, v7);
    if (v53)
    {
      v47 = v10;
      v48 = v7;
      objc_msgSend(MEMORY[0x1E0C97778], "UUIDWithString:", CFSTR("00000051-0000-1000-8000-0026BB765291"));
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0C99DE8], "array");
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      v55 = 0u;
      v56 = 0u;
      v57 = 0u;
      v58 = 0u;
      v49 = v6;
      objc_msgSend(v6, "characteristics");
      obj = (id)objc_claimAutoreleasedReturnValue();
      v19 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v55, v59, 16);
      if (v19)
      {
        v20 = v19;
        v21 = v11;
        v22 = *(_QWORD *)v56;
        v50 = v18;
        while (2)
        {
          v23 = 0;
          v51 = v20;
          do
          {
            if (*(_QWORD *)v56 != v22)
              objc_enumerationMutation(obj);
            v24 = *(void **)(*((_QWORD *)&v55 + 1) + 8 * v23);
            objc_msgSend(v24, "UUID");
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            v26 = objc_msgSend(v25, "isEqual:", v18);

            if ((v26 & 1) == 0)
            {
              v27 = objc_msgSend(v24, "properties");
              v28 = (v27 >> 1) & 4 | v27 & 2 | (v27 >> 5) & 1;
              v29 = -[HAPCharacteristicMetadata initWithConstraints:description:format:units:]([HAPCharacteristicMetadata alloc], "initWithConstraints:description:format:units:", 0, 0, CFSTR("data"), 0);
              objc_msgSend(v24, "UUID");
              v30 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v30, "UUIDString");
              v31 = (void *)objc_claimAutoreleasedReturnValue();

              v32 = [HAPCharacteristic alloc];
              -[_HAPAccessoryServerBTLE100 _nextInstanceID](v21, "_nextInstanceID");
              v33 = (void *)objc_claimAutoreleasedReturnValue();
              -[HAPAccessoryServerBTLE stateNumber](v21, "stateNumber");
              v34 = (void *)objc_claimAutoreleasedReturnValue();
              LOBYTE(v46) = 1;
              v35 = -[HAPCharacteristic initWithType:instanceID:value:stateNumber:properties:eventNotificationsEnabled:implicitWriteWithResponse:metadata:](v32, "initWithType:instanceID:value:stateNumber:properties:eventNotificationsEnabled:implicitWriteWithResponse:metadata:", v31, v33, 0, v34, v28, 0, v46, v29);

              if (!v35)
              {
                v42 = (void *)MEMORY[0x1D17B7244]();
                HMFGetOSLogHandle();
                v43 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v43, OS_LOG_TYPE_ERROR))
                {
                  HMFGetLogIdentifier();
                  v44 = (void *)objc_claimAutoreleasedReturnValue();
                  *(_DWORD *)buf = 138543362;
                  v61 = v44;
                  _os_log_impl(&dword_1CCE01000, v43, OS_LOG_TYPE_ERROR, "%{public}@### Creating HAPCharacteristic for BTLE failed init.", buf, 0xCu);

                }
                objc_autoreleasePoolPop(v42);

                v17 = 0;
                v7 = v48;
                v6 = v49;
                v10 = v47;
                v18 = v50;
                v38 = v52;
                goto LABEL_25;
              }
              objc_msgSend(MEMORY[0x1E0C99D68], "distantPast");
              v36 = (void *)objc_claimAutoreleasedReturnValue();
              -[HAPCharacteristic setValueUpdatedTime:](v35, "setValueUpdatedTime:", v36);

              -[HAPCharacteristic setService:](v35, "setService:", v53);
              objc_msgSend(v52, "addObject:", v35);
              -[_HAPAccessoryServerBTLE100 btleCharacteristicToHAPCharacteristicMap](v21, "btleCharacteristicToHAPCharacteristicMap");
              v37 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v37, "setObject:forKey:", v35, v24);

              v18 = v50;
              v20 = v51;
            }
            ++v23;
          }
          while (v20 != v23);
          v20 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v55, v59, 16);
          if (v20)
            continue;
          break;
        }
      }

      v38 = v52;
      -[HAPService setCharacteristics:](v53, "setCharacteristics:", v52);
      v17 = v53;
      v7 = v48;
      v6 = v49;
      v10 = v47;
LABEL_25:

    }
    else
    {
      v39 = (void *)MEMORY[0x1D17B7244]();
      HMFGetOSLogHandle();
      v40 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v61 = v41;
        _os_log_impl(&dword_1CCE01000, v40, OS_LOG_TYPE_ERROR, "%{public}@### Creating HAPService for BTLE failed init.", buf, 0xCu);

      }
      objc_autoreleasePoolPop(v39);
      v17 = 0;
    }

  }
  else
  {
    v13 = (void *)MEMORY[0x1D17B7244]();
    HMFGetOSLogHandle();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "UUID");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v61 = v15;
      v62 = 2112;
      v63 = v16;
      _os_log_impl(&dword_1CCE01000, v14, OS_LOG_TYPE_ERROR, "%{public}@### [HAP Accessory Server BTLE] Failed converting from BTLE UUID to internal: %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v13);
    v17 = 0;
  }

  return v17;
}

- (BOOL)_parseBTLECharacteristicDescriptor:(id)a3 existingDescriptors:(id)a4 characteristics:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  HAPCharacteristicMetadata *v14;
  void *v15;
  void *v16;
  unint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  NSObject *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  int v26;
  id v27;
  void *v28;
  NSObject *v29;
  void *v30;
  HAPCharacteristicMetadata *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  id v36;
  uint64_t v37;
  unint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t i;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  int v59;
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
  int v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  HAPMetadataConstraints *v75;
  void *v76;
  void *v77;
  void *v78;
  void *v79;
  void *v80;
  void *v81;
  void *v82;
  NSObject *v83;
  void *v84;
  BOOL v85;
  void *v86;
  NSObject *v87;
  void *v88;
  void *v89;
  void *v91;
  void *v92;
  int v93;
  void *v94;
  void *v95;
  void *v96;
  void *v97;
  void *v98;
  void *v99;
  int v100;
  int v101;
  HAPCharacteristicMetadata *v102;
  HAPCharacteristicMetadata *v103;
  void *v104;
  NSObject *v105;
  void *v106;
  const char *v107;
  void *v108;
  void *v109;
  int v110;
  void *v111;
  void *v112;
  NSObject *v113;
  void *v114;
  void *v115;
  NSObject *v116;
  void *v117;
  uint64_t v118;
  const __CFString *v119;
  HAPCharacteristicMetadata *v120;
  id v121;
  id v122;
  id v123;
  void *v124;
  id obj;
  __int128 v126;
  __int128 v127;
  __int128 v128;
  __int128 v129;
  uint8_t buf[4];
  void *v131;
  __int16 v132;
  id v133;
  __int16 v134;
  id v135;
  uint64_t v136;

  v136 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  -[_HAPAccessoryServerBTLE100 btleCharacteristicToHAPCharacteristicMap](self, "btleCharacteristicToHAPCharacteristicMap");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "objectForKey:", v10);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v12, "metadata");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v13)
  {
    v14 = objc_alloc_init(HAPCharacteristicMetadata);
    objc_msgSend(v12, "setMetadata:", v14);

  }
  objc_msgSend(v8, "UUID");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C97778], "UUIDWithString:", CFSTR("DC46F0FE-81D2-4616-B5D9-6ABDD796939A"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v15, "isEqual:", v16))
  {

LABEL_10:
    objc_msgSend(v8, "UUID");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C97778], "UUIDWithString:", *MEMORY[0x1E0C976E0]);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = objc_msgSend(v24, "isEqual:", v25);

    if (v26)
    {
      objc_msgSend(v8, "value");
      v27 = (id)objc_claimAutoreleasedReturnValue();
      v123 = v8;
      v124 = v12;
      v121 = v10;
      if ((unint64_t)objc_msgSend(v27, "length") <= 6
        || (objc_msgSend(v27, "getBytes:length:", buf, 7), buf[1]))
      {

LABEL_14:
        v28 = (void *)MEMORY[0x1D17B7244]();
        HMFGetOSLogHandle();
        v29 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
        {
          HMFGetLogIdentifier();
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543618;
          v131 = v30;
          v132 = 2112;
          v133 = v27;
          _os_log_impl(&dword_1CCE01000, v29, OS_LOG_TYPE_ERROR, "%{public}@### Invalid BTLE Format Descriptor: %@", buf, 0x16u);

        }
        objc_autoreleasePoolPop(v28);
        v31 = 0;
        goto LABEL_17;
      }
      v98 = (void *)buf[0];
      v99 = (void *)*(unsigned __int16 *)&buf[2];
      v100 = *(unsigned __int16 *)((char *)&v131 + 1);
      v101 = v131;

      if (v101 != 1 || v100)
        goto LABEL_14;
      v102 = objc_alloc_init(HAPCharacteristicMetadata);
      v103 = v102;
      if (((_BYTE)v98 - 1) >= 0x1Bu || ((0x50AAAA9u >> ((_BYTE)v98 - 1)) & 1) == 0)
      {
        v104 = (void *)MEMORY[0x1D17B7244]();
        HMFGetOSLogHandle();
        v105 = objc_claimAutoreleasedReturnValue();
        if (!os_log_type_enabled(v105, OS_LOG_TYPE_ERROR))
        {
LABEL_69:

          objc_autoreleasePoolPop(v104);
          v31 = 0;
LABEL_92:

          v12 = v124;
LABEL_17:

          -[HAPCharacteristicMetadata format](v31, "format");
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "metadata");
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v33, "setFormat:", v32);

          v120 = v31;
          -[HAPCharacteristicMetadata units](v31, "units");
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "metadata");
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v35, "setUnits:", v34);

          objc_msgSend(v12, "metadata");
          v36 = (id)objc_claimAutoreleasedReturnValue();
          v122 = v9;
          v126 = 0u;
          v127 = 0u;
          v128 = 0u;
          v129 = 0u;
          obj = v9;
          v37 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v126, buf, 16);
          v38 = 0x1E0C97000uLL;
          if (!v37)
            goto LABEL_38;
          v39 = v37;
          v40 = *(_QWORD *)v127;
          v41 = *MEMORY[0x1E0C976F0];
          while (1)
          {
            for (i = 0; i != v39; ++i)
            {
              if (*(_QWORD *)v127 != v40)
                objc_enumerationMutation(obj);
              v43 = *(void **)(*((_QWORD *)&v126 + 1) + 8 * i);
              objc_msgSend(v43, "UUID");
              v44 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(*(id *)(v38 + 1912), "UUIDWithString:", CFSTR("6EB45C6C-A230-4F3A-886F-F8A8EEFC42E8"));
              v45 = (void *)objc_claimAutoreleasedReturnValue();
              if (!objc_msgSend(v44, "isEqual:", v45))
                goto LABEL_25;
              objc_msgSend(v36, "constraints");
              v46 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v46, "stepValue");
              v47 = (void *)objc_claimAutoreleasedReturnValue();
              if (v47)
              {

                v38 = 0x1E0C97000uLL;
LABEL_25:

                goto LABEL_26;
              }
              objc_msgSend(v43, "value");
              v52 = (void *)objc_claimAutoreleasedReturnValue();

              v38 = 0x1E0C97000;
              if (v52)
              {
                objc_msgSend(v36, "format");
                v48 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v43, "value");
                v53 = (void *)objc_claimAutoreleasedReturnValue();
                _convertFromBTLEToHAPValue(v48, v53);
                v54 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v36, "constraints");
                v55 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v55, "setStepValue:", v54);

                goto LABEL_32;
              }
LABEL_26:
              objc_msgSend(v43, "UUID");
              v48 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(*(id *)(v38 + 1912), "UUIDWithString:", v41);
              v49 = (void *)objc_claimAutoreleasedReturnValue();
              if ((objc_msgSend(v48, "isEqual:", v49) & 1) != 0)
              {
                objc_msgSend(v36, "constraints");
                v50 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v50, "stepValue");
                v51 = (void *)objc_claimAutoreleasedReturnValue();
                if (v51)
                {

LABEL_32:
                  v38 = 0x1E0C97000;
                  goto LABEL_35;
                }
                objc_msgSend(v43, "value");
                v56 = (void *)objc_claimAutoreleasedReturnValue();

                v38 = 0x1E0C97000;
                if (!v56)
                  continue;
                objc_msgSend(v43, "value");
                v48 = (void *)objc_claimAutoreleasedReturnValue();
                _updateHAPConstraintsFromBTLEValidRange(v36, v48);
              }
              else
              {

              }
LABEL_35:

            }
            v39 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v126, buf, 16);
            if (!v39)
            {
LABEL_38:

              v9 = v122;
              v8 = v123;
              v10 = v121;
              v12 = v124;
              goto LABEL_55;
            }
          }
        }
        HMFGetLogIdentifier();
        v106 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v131 = v106;
        v132 = 2048;
        v133 = v98;
        v107 = "%{public}@### Invalid BTLE Format Value: %lu";
LABEL_68:
        _os_log_impl(&dword_1CCE01000, v105, OS_LOG_TYPE_ERROR, v107, buf, 0x16u);

        goto LABEL_69;
      }
      v118 = -[HAPCharacteristicMetadata setFormat:](v102, "setFormat:", *off_1E894D8A8[((_BYTE)v98 - 1)]);
      if ((int)v99 > 10032)
      {
        switch((_DWORD)v99)
        {
          case 0x2731:
            v119 = CFSTR("lux");
            goto LABEL_91;
          case 0x2763:
            v119 = CFSTR("arcdegrees");
            goto LABEL_91;
          case 0x27AD:
            v119 = CFSTR("percentage");
            goto LABEL_91;
        }
      }
      else
      {
        switch((_DWORD)v99)
        {
          case 0x2700:
            v119 = 0;
            goto LABEL_91;
          case 0x2703:
            v119 = CFSTR("seconds");
            goto LABEL_91;
          case 0x272F:
            v119 = CFSTR("celsius");
LABEL_91:
            -[HAPCharacteristicMetadata setUnits:](v103, "setUnits:", v119);
            v31 = v103;
            goto LABEL_92;
        }
      }
      v104 = (void *)MEMORY[0x1D17B7244](v118);
      HMFGetOSLogHandle();
      v105 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v105, OS_LOG_TYPE_ERROR))
        goto LABEL_69;
      HMFGetLogIdentifier();
      v106 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v131 = v106;
      v132 = 2048;
      v133 = v99;
      v107 = "%{public}@### Invalid BTLE Units Value: 0x%lu";
      goto LABEL_68;
    }
    objc_msgSend(v8, "UUID");
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C97778], "UUIDWithString:", *MEMORY[0x1E0C976E8]);
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    v59 = objc_msgSend(v57, "isEqual:", v58);

    if (v59)
    {
      objc_msgSend(v8, "value");
      v60 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v60, "containsString:", CFSTR(";")))
      {
        objc_msgSend(v60, "componentsSeparatedByString:", CFSTR(";"));
        v61 = (void *)objc_claimAutoreleasedReturnValue();
        v62 = (void *)objc_msgSend(v61, "mutableCopy");

        if (-[_HAPAccessoryServerBTLE100 hapBLEProtocolVersion](self, "hapBLEProtocolVersion") != 1)
        {
          v63 = (void *)MEMORY[0x1E0CB37E8];
          objc_msgSend(v62, "objectAtIndexedSubscript:", 0);
          v64 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v63, "numberWithUnsignedInteger:", objc_msgSend(v64, "integerValue"));
          v65 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "setInstanceID:", v65);

        }
        objc_msgSend(v62, "removeObjectAtIndex:", 0);
        objc_msgSend(v62, "componentsJoinedByString:", CFSTR(";"));
        v66 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "metadata");
        v67 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v67, "setManufacturerDescription:", v66);

      }
      else
      {
        objc_msgSend(v8, "value");
        v62 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "metadata");
        v66 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v66, "setManufacturerDescription:", v62);
      }

    }
    else
    {
      objc_msgSend(v8, "UUID");
      v68 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0C97778], "UUIDWithString:", CFSTR("6EB45C6C-A230-4F3A-886F-F8A8EEFC42E8"));
      v69 = (void *)objc_claimAutoreleasedReturnValue();
      v70 = objc_msgSend(v68, "isEqual:", v69);

      if (v70)
      {
        objc_msgSend(v12, "metadata");
        v71 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v71, "format");
        v72 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v72)
        {
LABEL_55:
          v86 = (void *)MEMORY[0x1D17B7244]();
          HMFGetOSLogHandle();
          v87 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v87, OS_LOG_TYPE_INFO))
          {
            HMFGetLogIdentifier();
            v88 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v12, "metadata");
            v89 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543874;
            v131 = v88;
            v132 = 2112;
            v133 = v89;
            v134 = 2112;
            v135 = v8;
            _os_log_impl(&dword_1CCE01000, v87, OS_LOG_TYPE_INFO, "%{public}@HAP Metadata :%@ from BTLEDescriptor: %@", buf, 0x20u);

          }
          objc_autoreleasePoolPop(v86);
          v85 = 1;
          goto LABEL_58;
        }
        objc_msgSend(v12, "metadata");
        v73 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v73, "constraints");
        v74 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v74)
        {
          v75 = objc_alloc_init(HAPMetadataConstraints);
          objc_msgSend(v12, "metadata");
          v76 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v76, "setConstraints:", v75);

        }
        objc_msgSend(v12, "metadata");
        v60 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v60, "format");
        v77 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "value");
        v78 = (void *)objc_claimAutoreleasedReturnValue();
        _convertFromBTLEToHAPValue(v77, v78);
        v79 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "metadata");
        v80 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v80, "constraints");
        v81 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v81, "setStepValue:", v79);

      }
      else
      {
        objc_msgSend(v8, "UUID");
        v91 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0C97778], "UUIDWithString:", *MEMORY[0x1E0C976F0]);
        v92 = (void *)objc_claimAutoreleasedReturnValue();
        v93 = objc_msgSend(v91, "isEqual:", v92);

        if (v93)
        {
          objc_msgSend(v12, "metadata");
          v94 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v94, "format");
          v95 = (void *)objc_claimAutoreleasedReturnValue();

          if (v95)
          {
            objc_msgSend(v12, "metadata");
            v96 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v8, "value");
            v97 = (void *)objc_claimAutoreleasedReturnValue();
            _updateHAPConstraintsFromBTLEValidRange(v96, v97);

          }
          goto LABEL_55;
        }
        objc_msgSend(v8, "UUID");
        v108 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0C97778], "UUIDWithString:", CFSTR("C5FC363E-D2BF-43E5-928C-AB7D3628470E"));
        v109 = (void *)objc_claimAutoreleasedReturnValue();
        v110 = objc_msgSend(v108, "isEqual:", v109);

        if (!v110)
        {
          v115 = (void *)MEMORY[0x1D17B7244]();
          HMFGetOSLogHandle();
          v116 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v116, OS_LOG_TYPE_ERROR))
          {
            HMFGetLogIdentifier();
            v117 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543618;
            v131 = v117;
            v132 = 2112;
            v133 = v8;
            _os_log_impl(&dword_1CCE01000, v116, OS_LOG_TYPE_ERROR, "%{public}@Unknown BTLE Descriptor: %@", buf, 0x16u);

          }
          objc_autoreleasePoolPop(v115);
          goto LABEL_55;
        }
        objc_msgSend(v8, "value");
        v111 = (void *)objc_claimAutoreleasedReturnValue();
        _convertFromBTLEToHAPValue(CFSTR("uint16"), v111);
        v60 = (void *)objc_claimAutoreleasedReturnValue();

        if ((objc_msgSend(v60, "shortValue") & 4) != 0)
        {
          v112 = (void *)MEMORY[0x1D17B7244](objc_msgSend(v12, "setProperties:", objc_msgSend(v12, "properties") | 0x10));
          HMFGetOSLogHandle();
          v113 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v113, OS_LOG_TYPE_DEFAULT))
          {
            HMFGetLogIdentifier();
            v114 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543618;
            v131 = v114;
            v132 = 2112;
            v133 = v10;
            _os_log_impl(&dword_1CCE01000, v113, OS_LOG_TYPE_DEFAULT, "%{public}@ ### Characteristic with AAD: %@", buf, 0x16u);

          }
          objc_autoreleasePoolPop(v112);
        }
      }
    }

    goto LABEL_55;
  }
  v17 = -[_HAPAccessoryServerBTLE100 hapBLEProtocolVersion](self, "hapBLEProtocolVersion");

  if (v17 == 1)
    goto LABEL_10;
  objc_msgSend(v8, "value");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  LOWORD(v126) = 0;
  if (objc_msgSend(v18, "length") == 2)
  {
    objc_msgSend(v18, "getBytes:length:", &v126, 2);
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedShort:", (unsigned __int16)v126);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setInstanceID:", v19);

    v20 = (void *)MEMORY[0x1D17B7244]();
    HMFGetOSLogHandle();
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", (unsigned __int16)v126);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v131 = v22;
      v132 = 2112;
      v133 = v23;
      _os_log_impl(&dword_1CCE01000, v21, OS_LOG_TYPE_INFO, "%{public}@HAP Metadata : Found Characteristics with Instance ID = %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v20);

    goto LABEL_55;
  }
  v82 = (void *)MEMORY[0x1D17B7244]();
  HMFGetOSLogHandle();
  v83 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v83, OS_LOG_TYPE_ERROR))
  {
    HMFGetLogIdentifier();
    v84 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v131 = v84;
    v132 = 2112;
    v133 = v18;
    _os_log_impl(&dword_1CCE01000, v83, OS_LOG_TYPE_ERROR, "%{public}@HAP Metadata : ### Invalid Characteristic Instance ID bytes %@", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v82);

  v85 = 0;
LABEL_58:

  return v85;
}

- (id)_nextInstanceID
{
  void *v3;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[_HAPAccessoryServerBTLE100 availableInstanceID](self, "availableInstanceID"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[_HAPAccessoryServerBTLE100 setAvailableInstanceID:](self, "setAvailableInstanceID:", -[_HAPAccessoryServerBTLE100 availableInstanceID](self, "availableInstanceID") + 1);
  return v3;
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

- (id)_btleCharacteristicForHAPCharacteristic:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
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

  v22 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  -[_HAPAccessoryServerBTLE100 btleCharacteristicToHAPCharacteristicMap](self, "btleCharacteristicToHAPCharacteristicMap", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "keyEnumerator");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v18;
    while (2)
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v18 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * v10);
        -[_HAPAccessoryServerBTLE100 btleCharacteristicToHAPCharacteristicMap](self, "btleCharacteristicToHAPCharacteristicMap");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "objectForKey:", v11);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = objc_msgSend(v13, "isEqual:", v4);

        if (v14)
        {
          v15 = v11;
          goto LABEL_11;
        }
        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
      if (v8)
        continue;
      break;
    }
  }
  v15 = 0;
LABEL_11:

  return v15;
}

- (id)_hapCharacteristicForBTLECharacteristic:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[_HAPAccessoryServerBTLE100 btleCharacteristicToHAPCharacteristicMap](self, "btleCharacteristicToHAPCharacteristicMap");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (BOOL)_shouldEnableSessionSecurity
{
  return 1;
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
      block[2] = __100___HAPAccessoryServerBTLE100__notifyDelegateOfReceivedEncryptedAuthenticatedData_forCharacteristic___block_invoke;
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
    v9 = -[_HAPAccessoryServerBTLE100 _delegateRespondsToSelector:](self, "_delegateRespondsToSelector:", sel_accessoryServerBTLE_didReceivePlaintextPayload_forCharacteristic_);

    if (v9)
    {
      -[HAPAccessoryServer delegateQueue](self, "delegateQueue");
      v10 = objc_claimAutoreleasedReturnValue();
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __87___HAPAccessoryServerBTLE100__notifyDelegateOfReceivedPlaintextData_forCharacteristic___block_invoke;
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
    v9 = -[_HAPAccessoryServerBTLE100 _delegateRespondsToSelector:](self, "_delegateRespondsToSelector:", sel_accessoryServerBTLE_willSendEncryptedAndAuthenticatedPayload_forCharacteristic_);

    if (v9)
    {
      -[HAPAccessoryServer delegateQueue](self, "delegateQueue");
      v10 = objc_claimAutoreleasedReturnValue();
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __96___HAPAccessoryServerBTLE100__notifyDelegateOfSentEncryptedAuthenticatedData_forCharacteristic___block_invoke;
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
    v9 = -[_HAPAccessoryServerBTLE100 _delegateRespondsToSelector:](self, "_delegateRespondsToSelector:", sel_accessoryServerBTLE_willSendPlaintextPayload_forCharacteristic_);

    if (v9)
    {
      -[HAPAccessoryServer delegateQueue](self, "delegateQueue");
      v10 = objc_claimAutoreleasedReturnValue();
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __83___HAPAccessoryServerBTLE100__notifyDelegateOfSentPlaintextData_forCharacteristic___block_invoke;
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

- (id)_pairSetupHAPCharacteristic
{
  HAPCharacteristic *v3;
  void *v4;
  HAPCharacteristic *v5;
  uint64_t v7;

  v3 = [HAPCharacteristic alloc];
  -[HAPAccessoryServerBTLE stateNumber](self, "stateNumber");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v7) = 1;
  v5 = -[HAPCharacteristic initWithType:instanceID:value:stateNumber:properties:eventNotificationsEnabled:implicitWriteWithResponse:metadata:](v3, "initWithType:instanceID:value:stateNumber:properties:eventNotificationsEnabled:implicitWriteWithResponse:metadata:", CFSTR("0000004C-0000-1000-8000-0026BB765291"), &unk_1E8989668, 0, v4, 6, 0, v7, 0);

  return v5;
}

- (id)_pairVerifyHAPCharacteristic
{
  HAPCharacteristic *v3;
  void *v4;
  HAPCharacteristic *v5;
  uint64_t v7;

  v3 = [HAPCharacteristic alloc];
  -[HAPAccessoryServerBTLE stateNumber](self, "stateNumber");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v7) = 1;
  v5 = -[HAPCharacteristic initWithType:instanceID:value:stateNumber:properties:eventNotificationsEnabled:implicitWriteWithResponse:metadata:](v3, "initWithType:instanceID:value:stateNumber:properties:eventNotificationsEnabled:implicitWriteWithResponse:metadata:", CFSTR("0000004E-0000-1000-8000-0026BB765291"), &unk_1E8989680, 0, v4, 6, 0, v7, 0);

  return v5;
}

- (void)peripheral:(id)a3 didDiscoverServices:(id)a4
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
  v8[2] = __61___HAPAccessoryServerBTLE100_peripheral_didDiscoverServices___block_invoke;
  v8[3] = &unk_1E894E0F8;
  v8[4] = self;
  v9 = v5;
  v7 = v5;
  dispatch_async(v6, v8);

}

- (void)peripheral:(id)a3 didModifyServices:(id)a4
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
  v8[2] = __59___HAPAccessoryServerBTLE100_peripheral_didModifyServices___block_invoke;
  v8[3] = &unk_1E894E0F8;
  v8[4] = self;
  v9 = v5;
  v7 = v5;
  dispatch_async(v6, v8);

}

- (void)peripheral:(id)a3 didDiscoverCharacteristicsForService:(id)a4 error:(id)a5
{
  id v7;
  id v8;
  NSObject *v9;
  id v10;
  id v11;
  _QWORD block[5];
  id v13;
  id v14;

  v7 = a4;
  v8 = a5;
  -[HAPAccessoryServer clientQueue](self, "clientQueue");
  v9 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __84___HAPAccessoryServerBTLE100_peripheral_didDiscoverCharacteristicsForService_error___block_invoke;
  block[3] = &unk_1E894E120;
  block[4] = self;
  v13 = v7;
  v14 = v8;
  v10 = v8;
  v11 = v7;
  dispatch_async(v9, block);

}

- (void)peripheral:(id)a3 didDiscoverDescriptorsForCharacteristic:(id)a4 error:(id)a5
{
  id v7;
  id v8;
  NSObject *v9;
  id v10;
  id v11;
  _QWORD block[5];
  id v13;
  id v14;

  v7 = a4;
  v8 = a5;
  -[HAPAccessoryServer clientQueue](self, "clientQueue");
  v9 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __87___HAPAccessoryServerBTLE100_peripheral_didDiscoverDescriptorsForCharacteristic_error___block_invoke;
  block[3] = &unk_1E894E120;
  block[4] = self;
  v13 = v7;
  v14 = v8;
  v10 = v8;
  v11 = v7;
  dispatch_async(v9, block);

}

- (void)peripheral:(id)a3 didUpdateValueForDescriptor:(id)a4 error:(id)a5
{
  id v7;
  id v8;
  NSObject *v9;
  id v10;
  id v11;
  _QWORD block[4];
  id v13;
  _HAPAccessoryServerBTLE100 *v14;
  id v15;

  v7 = a4;
  v8 = a5;
  -[HAPAccessoryServer clientQueue](self, "clientQueue");
  v9 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __75___HAPAccessoryServerBTLE100_peripheral_didUpdateValueForDescriptor_error___block_invoke;
  block[3] = &unk_1E894E120;
  v13 = v8;
  v14 = self;
  v15 = v7;
  v10 = v7;
  v11 = v8;
  dispatch_async(v9, block);

}

- (void)peripheral:(id)a3 didUpdateValueForCharacteristic:(id)a4 error:(id)a5
{
  id v7;
  id v8;
  NSObject *v9;
  id v10;
  id v11;
  _QWORD block[5];
  id v13;
  id v14;

  v7 = a4;
  v8 = a5;
  -[HAPAccessoryServer clientQueue](self, "clientQueue");
  v9 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __79___HAPAccessoryServerBTLE100_peripheral_didUpdateValueForCharacteristic_error___block_invoke;
  block[3] = &unk_1E894E120;
  block[4] = self;
  v13 = v8;
  v14 = v7;
  v10 = v7;
  v11 = v8;
  dispatch_async(v9, block);

}

- (void)peripheral:(id)a3 didWriteValueForCharacteristic:(id)a4 error:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  NSObject *v12;
  void *v13;
  NSObject *v14;
  id v15;
  id v16;
  _QWORD block[5];
  id v18;
  id v19;
  uint8_t buf[4];
  void *v21;
  __int16 v22;
  const char *v23;
  __int16 v24;
  id v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = (void *)MEMORY[0x1D17B7244]();
  HMFGetOSLogHandle();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    v21 = v13;
    v22 = 2080;
    v23 = "-[_HAPAccessoryServerBTLE100 peripheral:didWriteValueForCharacteristic:error:]";
    v24 = 2112;
    v25 = v9;
    _os_log_impl(&dword_1CCE01000, v12, OS_LOG_TYPE_INFO, "%{public}@%s: Received write confirmation for characteristic %@", buf, 0x20u);

  }
  objc_autoreleasePoolPop(v11);
  -[HAPAccessoryServer clientQueue](self, "clientQueue");
  v14 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __78___HAPAccessoryServerBTLE100_peripheral_didWriteValueForCharacteristic_error___block_invoke;
  block[3] = &unk_1E894E120;
  block[4] = self;
  v18 = v10;
  v19 = v9;
  v15 = v9;
  v16 = v10;
  dispatch_async(v14, block);

}

- (void)peripheral:(id)a3 didUpdateNotificationStateForCharacteristic:(id)a4 error:(id)a5
{
  id v7;
  id v8;
  NSObject *v9;
  id v10;
  id v11;
  _QWORD block[4];
  id v13;
  _HAPAccessoryServerBTLE100 *v14;
  id v15;

  v7 = a4;
  v8 = a5;
  -[HAPAccessoryServer clientQueue](self, "clientQueue");
  v9 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __91___HAPAccessoryServerBTLE100_peripheral_didUpdateNotificationStateForCharacteristic_error___block_invoke;
  block[3] = &unk_1E894E120;
  v13 = v7;
  v14 = self;
  v15 = v8;
  v10 = v8;
  v11 = v7;
  dispatch_async(v9, block);

}

- (int)_ensurePairingSessionIsInitializedWithType:(unsigned int)a3
{
  PairingSessionPrivate **p_pairingSession;
  int v4;
  uint64_t v6;
  void *v7;
  _HAPAccessoryServerBTLE100 *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  id v12;
  uint8_t buf[4];
  void *v15;
  __int16 v16;
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  p_pairingSession = &self->_pairingSession;
  if (self->_pairingSession)
    return 0;
  v4 = PairingSessionCreate();
  if (v4)
    goto LABEL_13;
  v6 = PairingSessionSetFlags();
  v7 = (void *)MEMORY[0x1D17B7244](v6);
  v8 = self;
  HMFGetOSLogHandle();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[_HAPAccessoryServerBTLE100 controllerUsername](v8, "controllerUsername");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v15 = v10;
    v16 = 2112;
    v17 = v11;
    _os_log_impl(&dword_1CCE01000, v9, OS_LOG_TYPE_INFO, "%{public}@Setting Pairing session identifier to : %@", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v7);
  -[_HAPAccessoryServerBTLE100 controllerUsername](v8, "controllerUsername");
  v12 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  objc_msgSend(v12, "UTF8String");
  v4 = PairingSessionSetIdentifier();

  if (v4 || (v4 = PairingSessionSetMTU()) != 0)
  {
LABEL_13:
    if (*p_pairingSession)
    {
      CFRelease(*p_pairingSession);
      *p_pairingSession = 0;
    }
  }
  return v4;
}

- (int)_pairSetupStart
{
  NSObject *v3;
  void *v4;
  int v5;
  void *v6;
  NSObject *v7;
  void *v8;
  id v9;
  int v10;
  void *v11;
  NSObject *v12;
  void *v13;
  PairingSessionPrivate *pairingSession;
  void *v15;
  NSObject *v16;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  NSObject *v22;
  void *v23;
  void *v24;
  id v25;
  _QWORD v26[5];
  int v27;
  _QWORD block[5];
  char v29;
  uint64_t v30;
  void *v31;
  uint8_t buf[4];
  void *v33;
  __int16 v34;
  id v35;
  __int16 v36;
  const char *v37;
  __int16 v38;
  void *v39;
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  v30 = 0;
  v31 = 0;
  v29 = 0;
  if (-[HAPAccessoryServerBTLE isPaired](self, "isPaired"))
  {
    if (-[_HAPAccessoryServerBTLE100 _delegateRespondsToSelector:](self, "_delegateRespondsToSelector:", sel_accessoryServer_didStopPairingWithError_))
    {
      -[HAPAccessoryServer delegateQueue](self, "delegateQueue");
      v3 = objc_claimAutoreleasedReturnValue();
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __45___HAPAccessoryServerBTLE100__pairSetupStart__block_invoke;
      block[3] = &unk_1E894DD08;
      block[4] = self;
      dispatch_async(v3, block);

    }
    -[_HAPAccessoryServerBTLE100 setStartPairingRequested:](self, "setStartPairingRequested:", 0);
    v4 = 0;
    v5 = 0;
    goto LABEL_19;
  }
  v6 = (void *)MEMORY[0x1D17B7244]();
  HMFGetOSLogHandle();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    v33 = v8;
    v34 = 2112;
    v35 = (id)objc_opt_class();
    v36 = 2080;
    v37 = "-[_HAPAccessoryServerBTLE100 _pairSetupStart]";
    v9 = v35;
    _os_log_impl(&dword_1CCE01000, v7, OS_LOG_TYPE_INFO, "%{public}@%@ %s", buf, 0x20u);

  }
  objc_autoreleasePoolPop(v6);
  v10 = -[_HAPAccessoryServerBTLE100 _ensurePairingSessionIsInitializedWithType:](self, "_ensurePairingSessionIsInitializedWithType:", 1);
  if (v10)
  {
    v5 = v10;
    v4 = 0;
LABEL_12:
    v11 = (void *)MEMORY[0x1D17B7244]();
    HMFGetOSLogHandle();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      HMFGetLogIdentifier();
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v33 = v13;
      v34 = 1024;
      LODWORD(v35) = v5;
      _os_log_impl(&dword_1CCE01000, v12, OS_LOG_TYPE_DEFAULT, "%{public}@### Pair-setup start failed: %d\n", buf, 0x12u);

    }
    objc_autoreleasePoolPop(v11);
    pairingSession = self->_pairingSession;
    if (pairingSession)
    {
      CFRelease(pairingSession);
      self->_pairingSession = 0;
    }
    -[HAPAccessoryServerBTLE browser](self, "browser");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "disconnectFromBTLEAccessoryServer:", self);

    if (-[_HAPAccessoryServerBTLE100 _delegateRespondsToSelector:](self, "_delegateRespondsToSelector:", sel_accessoryServer_didStopPairingWithError_))
    {
      -[HAPAccessoryServer delegateQueue](self, "delegateQueue");
      v16 = objc_claimAutoreleasedReturnValue();
      v26[0] = MEMORY[0x1E0C809B0];
      v26[1] = 3221225472;
      v26[2] = __45___HAPAccessoryServerBTLE100__pairSetupStart__block_invoke_290;
      v26[3] = &unk_1E894D748;
      v27 = v5;
      v26[4] = self;
      dispatch_async(v16, v26);

    }
    -[_HAPAccessoryServerBTLE100 setStartPairingRequested:](self, "setStartPairingRequested:", 0);
    goto LABEL_19;
  }
  v5 = PairingSessionExchange();
  if (v5)
  {
    v4 = 0;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", v31, v30);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[_HAPAccessoryServerBTLE100 _pairSetupHAPCharacteristic](self, "_pairSetupHAPCharacteristic");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[_HAPAccessoryServerBTLE100 _notifyDelegateOfSentPlaintextData:forCharacteristic:](self, "_notifyDelegateOfSentPlaintextData:forCharacteristic:", v4, v18);

    -[_HAPAccessoryServerBTLE100 _updateConnectionLifetimeTimer](self, "_updateConnectionLifetimeTimer");
    -[HAPAccessoryServerBTLE peripheral](self, "peripheral");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[_HAPAccessoryServerBTLE100 pairSetupCharacteristic](self, "pairSetupCharacteristic");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "writeValue:forCharacteristic:type:", v4, v20, 0);

    v21 = (void *)MEMORY[0x1D17B7244]();
    HMFGetOSLogHandle();
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = (void *)objc_opt_class();
      *(_DWORD *)buf = 138544130;
      v33 = v23;
      v34 = 2112;
      v35 = v24;
      v36 = 2080;
      v37 = "-[_HAPAccessoryServerBTLE100 _pairSetupStart]";
      v38 = 2112;
      v39 = v4;
      v25 = v24;
      _os_log_impl(&dword_1CCE01000, v22, OS_LOG_TYPE_INFO, "%{public}@%@ %s: Writing initial pair setup data: %@", buf, 0x2Au);

    }
    objc_autoreleasePoolPop(v21);
  }
  if (v5)
    goto LABEL_12;
LABEL_19:

  return v5;
}

- (int)_handlePairSetupExchangeWithData:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  void *v7;
  id v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  NSObject *v13;
  void *v14;
  PairingSessionPrivate *pairingSession;
  void *v16;
  void *v17;
  NSObject *v18;
  _QWORD v20[5];
  id v21;
  char v22;
  uint64_t v23;
  void *v24;
  uint8_t buf[4];
  void *v26;
  __int16 v27;
  id v28;
  __int16 v29;
  const char *v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v23 = 0;
  v24 = 0;
  v22 = 0;
  v5 = (void *)MEMORY[0x1D17B7244]();
  HMFGetOSLogHandle();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    v26 = v7;
    v27 = 2112;
    v28 = (id)objc_opt_class();
    v29 = 2080;
    v30 = "-[_HAPAccessoryServerBTLE100 _handlePairSetupExchangeWithData:]";
    v8 = v28;
    _os_log_impl(&dword_1CCE01000, v6, OS_LOG_TYPE_INFO, "%{public}@%@ %s", buf, 0x20u);

  }
  objc_autoreleasePoolPop(v5);
  v9 = objc_retainAutorelease(v4);
  objc_msgSend(v9, "bytes");
  objc_msgSend(v9, "length");
  v10 = PairingSessionExchange();
  if ((_DWORD)v10)
  {
    v11 = v10;
    if ((_DWORD)v10 == -6771)
      v11 = 0;
  }
  else
  {
    v11 = 0;
  }
  if ((_DWORD)v11)
  {
    v12 = (void *)MEMORY[0x1D17B7244]();
    HMFGetOSLogHandle();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v26 = v14;
      v27 = 1024;
      LODWORD(v28) = v11;
      _os_log_impl(&dword_1CCE01000, v13, OS_LOG_TYPE_INFO, "%{public}@### Pair-setup message failed: %d\n", buf, 0x12u);

    }
    objc_autoreleasePoolPop(v12);
    pairingSession = self->_pairingSession;
    if (pairingSession)
    {
      CFRelease(pairingSession);
      self->_pairingSession = 0;
    }
    -[HAPAccessoryServerBTLE browser](self, "browser");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "disconnectFromBTLEAccessoryServer:", self);

    HMErrorFromOSStatus(v11);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    if (-[_HAPAccessoryServerBTLE100 _delegateRespondsToSelector:](self, "_delegateRespondsToSelector:", sel_accessoryServer_didStopPairingWithError_))
    {
      -[HAPAccessoryServer delegateQueue](self, "delegateQueue");
      v18 = objc_claimAutoreleasedReturnValue();
      v20[0] = MEMORY[0x1E0C809B0];
      v20[1] = 3221225472;
      v20[2] = __63___HAPAccessoryServerBTLE100__handlePairSetupExchangeWithData___block_invoke_291;
      v20[3] = &unk_1E894E0F8;
      v20[4] = self;
      v21 = v17;
      dispatch_async(v18, v20);

    }
    -[_HAPAccessoryServerBTLE100 setStartPairingRequested:](self, "setStartPairingRequested:", 0);

  }
  return v11;
}

- (int)_pairSetupTryPassword:(id)a3
{
  id v4;
  void *v5;
  int v6;
  int v7;

  v4 = a3;
  v5 = v4;
  if (self->_pairingSession)
  {
    objc_msgSend(objc_retainAutorelease(v4), "UTF8String");
    v6 = PairingSessionSetSetupCode();
    if (!v6)
    {
      v7 = PairingSessionExchange();
      v6 = v7;
      if (v7)
      {
        if (v7 == -6771)
          v6 = 0;
      }
    }
  }
  else
  {
    v6 = -6718;
  }

  return v6;
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
  v6[2] = __55___HAPAccessoryServerBTLE100_updateConnectionIdleTime___block_invoke;
  v6[3] = &unk_1E894D770;
  v7 = a3;
  v6[4] = self;
  dispatch_async(v5, v6);

}

- (void)_updateConnectionLifetimeTimer
{
  void *v3;
  NSObject *v4;
  dispatch_source_t v5;
  NSObject *v6;
  int64_t v7;
  double v8;
  NSObject *v9;
  dispatch_time_t v10;
  NSObject *v11;
  uint64_t v12;
  uint64_t v13;
  void (*v14)(uint64_t);
  void *v15;
  id v16;
  id location;

  -[_HAPAccessoryServerBTLE100 connectionLifetimeTimer](self, "connectionLifetimeTimer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
  {
    -[HAPAccessoryServer clientQueue](self, "clientQueue");
    v4 = objc_claimAutoreleasedReturnValue();
    v5 = dispatch_source_create(MEMORY[0x1E0C80DD0], 0, 0, v4);
    -[_HAPAccessoryServerBTLE100 setConnectionLifetimeTimer:](self, "setConnectionLifetimeTimer:", v5);

    objc_initWeak(&location, self);
    -[_HAPAccessoryServerBTLE100 connectionLifetimeTimer](self, "connectionLifetimeTimer");
    v6 = objc_claimAutoreleasedReturnValue();
    v12 = MEMORY[0x1E0C809B0];
    v13 = 3221225472;
    v14 = __60___HAPAccessoryServerBTLE100__updateConnectionLifetimeTimer__block_invoke;
    v15 = &unk_1E894E050;
    objc_copyWeak(&v16, &location);
    dispatch_source_set_event_handler(v6, &v12);

    objc_destroyWeak(&v16);
    objc_destroyWeak(&location);
  }
  if (-[_HAPAccessoryServerBTLE100 state](self, "state", v12, v13, v14, v15) == 7)
  {
    v7 = 60000000000;
  }
  else
  {
    -[_HAPAccessoryServerBTLE100 idleConnectionTimeoutInSec](self, "idleConnectionTimeoutInSec");
    v7 = 1000000000 * (unint64_t)v8;
  }
  -[_HAPAccessoryServerBTLE100 connectionLifetimeTimer](self, "connectionLifetimeTimer");
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = dispatch_time(0, v7);
  dispatch_source_set_timer(v9, v10, 0xFFFFFFFFFFFFFFFFLL, 0x3B9ACA00uLL);

  if (!v3)
  {
    -[_HAPAccessoryServerBTLE100 connectionLifetimeTimer](self, "connectionLifetimeTimer");
    v11 = objc_claimAutoreleasedReturnValue();
    dispatch_resume(v11);

  }
}

- (void)_cancelConnectionLifetimeTimer
{
  void *v3;
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  int v9;
  void *v10;
  __int16 v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v3 = (void *)MEMORY[0x1D17B7244](self, a2);
  HMFGetOSLogHandle();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    HMFGetLogIdentifier();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[HAPAccessoryServer identifier](self, "identifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = 138543618;
    v10 = v5;
    v11 = 2112;
    v12 = v6;
    _os_log_impl(&dword_1CCE01000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@[BTLE Accessory Server %@] cancelling connection lifetime timer...", (uint8_t *)&v9, 0x16u);

  }
  objc_autoreleasePoolPop(v3);
  -[_HAPAccessoryServerBTLE100 connectionLifetimeTimer](self, "connectionLifetimeTimer");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    -[_HAPAccessoryServerBTLE100 connectionLifetimeTimer](self, "connectionLifetimeTimer");
    v8 = objc_claimAutoreleasedReturnValue();
    dispatch_source_cancel(v8);

    -[_HAPAccessoryServerBTLE100 setConnectionLifetimeTimer:](self, "setConnectionLifetimeTimer:", 0);
  }
}

- (void)_disconnect
{
  void *v3;
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  __int16 v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v3 = (void *)MEMORY[0x1D17B7244](self, a2);
  HMFGetOSLogHandle();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    HMFGetLogIdentifier();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[HAPAccessoryServer identifier](self, "identifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = 138543618;
    v9 = v5;
    v10 = 2112;
    v11 = v6;
    _os_log_impl(&dword_1CCE01000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@[BTLE Accessory Server %@] Canceling connection lifetime timeout and disconnecting from peripheral", (uint8_t *)&v8, 0x16u);

  }
  objc_autoreleasePoolPop(v3);
  -[_HAPAccessoryServerBTLE100 setDisconnecting:](self, "setDisconnecting:", 1);
  -[HAPAccessoryServerBTLE browser](self, "browser");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "disconnectFromBTLEAccessoryServer:", self);

}

- (void)_handleConnectionLifetimeTimeout
{
  void *v3;
  NSObject *v4;
  void *v5;
  void *v6;
  int v7;
  void *v8;
  __int16 v9;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v3 = (void *)MEMORY[0x1D17B7244](self, a2);
  HMFGetOSLogHandle();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    HMFGetLogIdentifier();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[HAPAccessoryServer identifier](self, "identifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = 138543618;
    v8 = v5;
    v9 = 2112;
    v10 = v6;
    _os_log_impl(&dword_1CCE01000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@[BTLE Accessory Server %@] Handling connection lifetime timeout", (uint8_t *)&v7, 0x16u);

  }
  objc_autoreleasePoolPop(v3);
  -[_HAPAccessoryServerBTLE100 _cancelConnectionLifetimeTimer](self, "_cancelConnectionLifetimeTimer");
  -[_HAPAccessoryServerBTLE100 _disconnect](self, "_disconnect");
}

- (void)identifyWithCompletion:(id)a3
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
  v7[2] = __53___HAPAccessoryServerBTLE100_identifyWithCompletion___block_invoke;
  v7[3] = &unk_1E894D5E0;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, v7);

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
  _HAPAccessoryServerBTLE100 *v17;
  id v18;
  id v19;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  -[HAPAccessoryServer clientQueue](self, "clientQueue");
  v11 = objc_claimAutoreleasedReturnValue();
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __75___HAPAccessoryServerBTLE100_addPairing_completionQueue_completionHandler___block_invoke;
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

- (void)_addPairingWithIdentifier:(id)a3 publicKey:(id)a4 admin:(BOOL)a5 queue:(id)a6 completion:(id)a7
{
  _BOOL4 v9;
  id v12;
  id v13;
  NSObject *v14;
  void *v15;
  HAPPairingIdentity *v16;
  void *v17;
  id v18;
  void *v19;
  NSObject *v20;
  NSObject *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  HAPCharacteristic *v26;
  HAPCharacteristic *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  uint64_t v36;
  id v37;
  id v38;
  id v39;
  id v40;
  _QWORD v41[5];
  NSObject *v42;
  id v43;
  _QWORD block[4];
  HAPCharacteristic *v45;
  id v46;
  id v47;
  uint8_t buf[4];
  void *v49;
  __int16 v50;
  void *v51;
  __int16 v52;
  id v53;
  uint64_t v54;

  v9 = a5;
  v54 = *MEMORY[0x1E0C80C00];
  v12 = a3;
  v13 = a4;
  v14 = a6;
  v40 = a7;
  v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D28658]), "initWithPairingKeyData:", v13);
  v16 = -[HAPPairingIdentity initWithIdentifier:publicKey:privateKey:permissions:]([HAPPairingIdentity alloc], "initWithIdentifier:publicKey:privateKey:permissions:", v12, v15, 0, v9);
  v47 = 0;
  +[HAPPairingUtilities createAddPairingRequestForPairingIdentity:error:](HAPPairingUtilities, "createAddPairingRequestForPairingIdentity:error:", v16, &v47);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = v47;
  v19 = (void *)MEMORY[0x1D17B7244]();
  HMFGetOSLogHandle();
  v20 = objc_claimAutoreleasedReturnValue();
  v21 = v20;
  if (v17)
  {
    v37 = v18;
    v38 = v13;
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      HMFGetLogIdentifier();
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      -[HAPAccessoryServer name](self, "name");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v49 = v22;
      v50 = 2112;
      v51 = v23;
      v52 = 2112;
      v53 = v12;
      _os_log_impl(&dword_1CCE01000, v21, OS_LOG_TYPE_DEFAULT, "%{public}@[BTLE Accessory Server '%@] Received request to add pairing for controller with identifier %@", buf, 0x20u);

    }
    objc_autoreleasePoolPop(v19);
    -[_HAPAccessoryServerBTLE100 btleCharacteristicToHAPCharacteristicMap](self, "btleCharacteristicToHAPCharacteristicMap");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    -[_HAPAccessoryServerBTLE100 pairingsCharacteristic](self, "pairingsCharacteristic");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "objectForKey:", v25);
    v26 = (HAPCharacteristic *)objc_claimAutoreleasedReturnValue();

    if (!v26)
    {
      v27 = [HAPCharacteristic alloc];
      -[HAPAccessoryServerBTLE stateNumber](self, "stateNumber");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      LOBYTE(v36) = 1;
      v26 = -[HAPCharacteristic initWithType:instanceID:value:stateNumber:properties:eventNotificationsEnabled:implicitWriteWithResponse:metadata:](v27, "initWithType:instanceID:value:stateNumber:properties:eventNotificationsEnabled:implicitWriteWithResponse:metadata:", CFSTR("00000050-0000-1000-8000-0026BB765291"), &unk_1E8989698, 0, v28, 6, 0, v36, 0);

      -[_HAPAccessoryServerBTLE100 btleCharacteristicToHAPCharacteristicMap](self, "btleCharacteristicToHAPCharacteristicMap");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      -[_HAPAccessoryServerBTLE100 pairingsCharacteristic](self, "pairingsCharacteristic");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "setObject:forKey:", v26, v30);

    }
    v41[0] = MEMORY[0x1E0C809B0];
    v41[1] = 3221225472;
    v41[2] = __89___HAPAccessoryServerBTLE100__addPairingWithIdentifier_publicKey_admin_queue_completion___block_invoke_299;
    v41[3] = &unk_1E894D7C0;
    v41[4] = self;
    v42 = v14;
    v31 = v40;
    v43 = v40;
    v32 = (void *)MEMORY[0x1D17B7400](v41);
    -[HAPAccessoryServer clientQueue](self, "clientQueue");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    -[_HAPAccessoryServerBTLE100 _writeValue:forCharacteristic:authorizationData:withCompletionHandler:queue:](self, "_writeValue:forCharacteristic:authorizationData:withCompletionHandler:queue:", v17, v26, 0, v32, v33);

    v18 = v37;
    v13 = v38;
    goto LABEL_12;
  }
  if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
  {
    HMFGetLogIdentifier();
    v39 = v13;
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    -[HAPAccessoryServer name](self, "name");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    v49 = v34;
    v50 = 2112;
    v51 = v35;
    v52 = 2112;
    v53 = v18;
    _os_log_impl(&dword_1CCE01000, v21, OS_LOG_TYPE_ERROR, "%{public}@[BTLE Accessory Server '%@] Failed to create add pairing request payload with error: %@", buf, 0x20u);

    v13 = v39;
  }

  objc_autoreleasePoolPop(v19);
  v31 = v40;
  if (v14 && v40)
  {
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __89___HAPAccessoryServerBTLE100__addPairingWithIdentifier_publicKey_admin_queue_completion___block_invoke;
    block[3] = &unk_1E894D5E0;
    v45 = (HAPCharacteristic *)v18;
    v46 = v40;
    dispatch_async(v14, block);

    v26 = v45;
LABEL_12:

  }
}

- (void)_handlePairingsWriteForCharacteristic:(id)a3 writeError:(id)a4 removing:(BOOL)a5 queue:(id)a6 completion:(id)a7
{
  _BOOL4 v9;
  id v12;
  id v13;
  NSObject *v14;
  NSObject *v15;
  void *v16;
  NSObject *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  const char *v21;
  NSObject *v22;
  NSObject *v23;
  NSObject *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t (*v29)(uint64_t, uint64_t, uint64_t);
  void *v30;
  _HAPAccessoryServerBTLE100 *v31;
  NSObject *v32;
  NSObject *v33;
  BOOL v34;
  _QWORD block[4];
  id v36;
  NSObject *v37;
  uint8_t buf[4];
  void *v39;
  __int16 v40;
  uint64_t v41;
  __int16 v42;
  const char *v43;
  __int16 v44;
  id v45;
  uint64_t v46;

  v9 = a5;
  v46 = *MEMORY[0x1E0C80C00];
  v12 = a3;
  v13 = a4;
  v14 = a6;
  v15 = a7;
  v16 = (void *)MEMORY[0x1D17B7244]();
  HMFGetOSLogHandle();
  v17 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    HMFGetLogIdentifier();
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[HAPAccessoryServer name](self, "name");
    v19 = objc_claimAutoreleasedReturnValue();
    v20 = (void *)v19;
    v21 = "Add";
    *(_DWORD *)buf = 138544130;
    v39 = v18;
    v40 = 2112;
    if (v9)
      v21 = "Remove";
    v41 = v19;
    v42 = 2080;
    v43 = v21;
    v44 = 2112;
    v45 = v13;
    _os_log_impl(&dword_1CCE01000, v17, OS_LOG_TYPE_DEFAULT, "%{public}@[BTLE Accessory Server '%@'] Completed Pairings write request for '%s' with error %@", buf, 0x2Au);

  }
  objc_autoreleasePoolPop(v16);
  if (v13)
  {
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __105___HAPAccessoryServerBTLE100__handlePairingsWriteForCharacteristic_writeError_removing_queue_completion___block_invoke;
    block[3] = &unk_1E894D5E0;
    v37 = v15;
    v36 = v13;
    v22 = v15;
    dispatch_async(v14, block);

    v23 = v37;
  }
  else
  {
    v27 = MEMORY[0x1E0C809B0];
    v28 = 3221225472;
    v29 = __105___HAPAccessoryServerBTLE100__handlePairingsWriteForCharacteristic_writeError_removing_queue_completion___block_invoke_2;
    v30 = &unk_1E894D7E8;
    v31 = self;
    v34 = v9;
    v32 = v14;
    v33 = v15;
    v24 = v15;
    v25 = (void *)MEMORY[0x1D17B7400](&v27);
    -[HAPAccessoryServer clientQueue](self, "clientQueue", v27, v28, v29, v30, v31);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    -[_HAPAccessoryServerBTLE100 _readValueForCharacteristic:completionQueue:completionHandler:](self, "_readValueForCharacteristic:completionQueue:completionHandler:", v12, v26, v25);

    v23 = v32;
  }

}

- (void)_handlePairingsReadForCharacteristic:(id)a3 readError:(id)a4 removing:(BOOL)a5 queue:(id)a6 completion:(id)a7
{
  _BOOL4 v9;
  id v12;
  id v13;
  NSObject *v14;
  id v15;
  void *v16;
  NSObject *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  const char *v21;
  id v22;
  id v23;
  void *v24;
  id *v25;
  id v26;
  void *v27;
  NSObject *v28;
  void *v29;
  uint64_t v30;
  void *v31;
  const char *v32;
  id v33;
  _QWORD v34[4];
  id v35;
  id v36;
  uint64_t v37;
  uint64_t v38;
  _QWORD block[4];
  id v40;
  id v41;
  uint8_t buf[4];
  void *v43;
  __int16 v44;
  uint64_t v45;
  __int16 v46;
  const char *v47;
  __int16 v48;
  id v49;
  uint64_t v50;

  v9 = a5;
  v50 = *MEMORY[0x1E0C80C00];
  v12 = a3;
  v13 = a4;
  v14 = a6;
  v15 = a7;
  v16 = (void *)MEMORY[0x1D17B7244]();
  HMFGetOSLogHandle();
  v17 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    HMFGetLogIdentifier();
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[HAPAccessoryServer name](self, "name");
    v19 = objc_claimAutoreleasedReturnValue();
    v20 = (void *)v19;
    v21 = "Add";
    *(_DWORD *)buf = 138544130;
    v43 = v18;
    v44 = 2112;
    if (v9)
      v21 = "Remove";
    v45 = v19;
    v46 = 2080;
    v47 = v21;
    v48 = 2112;
    v49 = v13;
    _os_log_impl(&dword_1CCE01000, v17, OS_LOG_TYPE_DEFAULT, "%{public}@[BTLE Accessory Server '%@'] Completed Pairings read request for '%s' with error %@", buf, 0x2Au);

  }
  objc_autoreleasePoolPop(v16);
  if (v13)
  {
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __103___HAPAccessoryServerBTLE100__handlePairingsReadForCharacteristic_readError_removing_queue_completion___block_invoke;
    block[3] = &unk_1E894D5E0;
    v41 = v15;
    v40 = v13;
    v22 = v15;
    dispatch_async(v14, block);

    v23 = v41;
  }
  else
  {
    objc_msgSend(v12, "value");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    if (v9)
    {
      v38 = 0;
      v25 = (id *)&v38;
      +[HAPPairingUtilities parseRemovePairingResponse:error:](HAPPairingUtilities, "parseRemovePairingResponse:error:", v24, &v38);
    }
    else
    {
      v37 = 0;
      v25 = (id *)&v37;
      +[HAPPairingUtilities parseAddPairingResponse:error:](HAPPairingUtilities, "parseAddPairingResponse:error:", v24, &v37);
    }
    v26 = *v25;

    v27 = (void *)MEMORY[0x1D17B7244]();
    HMFGetOSLogHandle();
    v28 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
    {
      HMFGetLogIdentifier();
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      -[HAPAccessoryServer name](self, "name");
      v30 = objc_claimAutoreleasedReturnValue();
      v31 = (void *)v30;
      v32 = "Add";
      *(_DWORD *)buf = 138544130;
      v43 = v29;
      v44 = 2112;
      if (v9)
        v32 = "Remove";
      v45 = v30;
      v46 = 2080;
      v47 = v32;
      v48 = 2112;
      v49 = v26;
      _os_log_impl(&dword_1CCE01000, v28, OS_LOG_TYPE_DEFAULT, "%{public}@[BTLE Accessory Server '%@'] Parsed pairing response for '%s' to error %@", buf, 0x2Au);

    }
    objc_autoreleasePoolPop(v27);
    v34[0] = MEMORY[0x1E0C809B0];
    v34[1] = 3221225472;
    v34[2] = __103___HAPAccessoryServerBTLE100__handlePairingsReadForCharacteristic_readError_removing_queue_completion___block_invoke_302;
    v34[3] = &unk_1E894D5E0;
    v35 = v26;
    v36 = v15;
    v33 = v15;
    v23 = v26;
    dispatch_async(v14, v34);

  }
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
  v15[2] = __78___HAPAccessoryServerBTLE100_removePairing_completionQueue_completionHandler___block_invoke;
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

- (void)_removePairingWithIdentifier:(id)a3 publicKey:(id)a4 queue:(id)a5 completion:(id)a6
{
  id v10;
  id v11;
  NSObject *v12;
  void *v13;
  HAPPairingIdentity *v14;
  void *v15;
  id v16;
  void *v17;
  NSObject *v18;
  NSObject *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  HAPCharacteristic *v26;
  HAPCharacteristic *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  uint64_t v36;
  id v37;
  id v38;
  id v39;
  id v40;
  _QWORD v41[5];
  NSObject *v42;
  id v43;
  _QWORD block[4];
  HAPCharacteristic *v45;
  id v46;
  id v47;
  uint8_t buf[4];
  void *v49;
  __int16 v50;
  void *v51;
  __int16 v52;
  id v53;
  uint64_t v54;

  v54 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v40 = a6;
  v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D28658]), "initWithPairingKeyData:", v11);
  v14 = -[HAPPairingIdentity initWithIdentifier:publicKey:privateKey:permissions:]([HAPPairingIdentity alloc], "initWithIdentifier:publicKey:privateKey:permissions:", v10, v13, 0, 0);
  v47 = 0;
  +[HAPPairingUtilities createRemovePairingRequestForPairingIdentity:error:](HAPPairingUtilities, "createRemovePairingRequestForPairingIdentity:error:", v14, &v47);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = v47;
  v17 = (void *)MEMORY[0x1D17B7244]();
  HMFGetOSLogHandle();
  v18 = objc_claimAutoreleasedReturnValue();
  v19 = v18;
  if (v15)
  {
    v37 = v16;
    v38 = v11;
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      HMFGetLogIdentifier();
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      -[HAPAccessoryServer name](self, "name");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v49 = v20;
      v50 = 2112;
      v51 = v21;
      v52 = 2112;
      v53 = v10;
      _os_log_impl(&dword_1CCE01000, v19, OS_LOG_TYPE_DEFAULT, "%{public}@[BTLE Accessory Server '%@] Received request to remove pairing for controller with identifier %@", buf, 0x20u);

    }
    objc_autoreleasePoolPop(v17);
    -[HAPAccessoryServerBTLE browser](self, "browser");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[HAPAccessoryServer identifier](self, "identifier");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "deRegisterAccessoryWithIdentifier:", v23);

    -[_HAPAccessoryServerBTLE100 btleCharacteristicToHAPCharacteristicMap](self, "btleCharacteristicToHAPCharacteristicMap");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    -[_HAPAccessoryServerBTLE100 pairingsCharacteristic](self, "pairingsCharacteristic");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "objectForKey:", v25);
    v26 = (HAPCharacteristic *)objc_claimAutoreleasedReturnValue();

    if (!v26)
    {
      v27 = [HAPCharacteristic alloc];
      -[HAPAccessoryServerBTLE stateNumber](self, "stateNumber");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      LOBYTE(v36) = 1;
      v26 = -[HAPCharacteristic initWithType:instanceID:value:stateNumber:properties:eventNotificationsEnabled:implicitWriteWithResponse:metadata:](v27, "initWithType:instanceID:value:stateNumber:properties:eventNotificationsEnabled:implicitWriteWithResponse:metadata:", CFSTR("00000050-0000-1000-8000-0026BB765291"), &unk_1E8989698, 0, v28, 6, 0, v36, 0);

      -[_HAPAccessoryServerBTLE100 btleCharacteristicToHAPCharacteristicMap](self, "btleCharacteristicToHAPCharacteristicMap");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      -[_HAPAccessoryServerBTLE100 pairingsCharacteristic](self, "pairingsCharacteristic");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "setObject:forKey:", v26, v30);

    }
    v41[0] = MEMORY[0x1E0C809B0];
    v41[1] = 3221225472;
    v41[2] = __86___HAPAccessoryServerBTLE100__removePairingWithIdentifier_publicKey_queue_completion___block_invoke_307;
    v41[3] = &unk_1E894D7C0;
    v41[4] = self;
    v42 = v12;
    v31 = v40;
    v43 = v40;
    v32 = (void *)MEMORY[0x1D17B7400](v41);
    -[HAPAccessoryServer clientQueue](self, "clientQueue");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    -[_HAPAccessoryServerBTLE100 _writeValue:forCharacteristic:authorizationData:withCompletionHandler:queue:](self, "_writeValue:forCharacteristic:authorizationData:withCompletionHandler:queue:", v15, v26, 0, v32, v33);

    v16 = v37;
    v11 = v38;
    goto LABEL_12;
  }
  if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
  {
    HMFGetLogIdentifier();
    v39 = v11;
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    -[HAPAccessoryServer name](self, "name");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    v49 = v34;
    v50 = 2112;
    v51 = v35;
    v52 = 2112;
    v53 = v16;
    _os_log_impl(&dword_1CCE01000, v19, OS_LOG_TYPE_ERROR, "%{public}@[BTLE Accessory Server '%@] Failed to create remove pairing request payload with error: %@", buf, 0x20u);

    v11 = v39;
  }

  objc_autoreleasePoolPop(v17);
  v31 = v40;
  if (v12 && v40)
  {
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __86___HAPAccessoryServerBTLE100__removePairingWithIdentifier_publicKey_queue_completion___block_invoke;
    block[3] = &unk_1E894D5E0;
    v45 = (HAPCharacteristic *)v16;
    v46 = v40;
    dispatch_async(v12, block);

    v26 = v45;
LABEL_12:

  }
}

- (BOOL)removePairingForCurrentControllerOnQueue:(id)a3 completion:(id)a4
{
  NSObject *v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  _QWORD v17[5];
  NSObject *v18;
  id v19;
  _QWORD block[4];
  id v21;
  id v22;
  id v23;
  uint8_t buf[4];
  void *v25;
  __int16 v26;
  void *v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v23 = 0;
  -[HAPAccessoryServer getControllerPairingIdentityWithError:](self, "getControllerPairingIdentityWithError:", &v23);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v23;
  if (v8)
  {
    v10 = (void *)MEMORY[0x1D17B7244]();
    HMFGetOSLogHandle();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      HMFGetLogIdentifier();
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[HAPAccessoryServer name](self, "name");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v25 = v12;
      v26 = 2112;
      v27 = v13;
      _os_log_impl(&dword_1CCE01000, v11, OS_LOG_TYPE_DEFAULT, "%{public}@[BTLE Accessory Server '%@] Received request to remove pairing for the current controller", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v10);
    -[HAPAccessoryServer clientQueue](self, "clientQueue");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v17[0] = MEMORY[0x1E0C809B0];
    v17[1] = 3221225472;
    v17[2] = __82___HAPAccessoryServerBTLE100_removePairingForCurrentControllerOnQueue_completion___block_invoke_308;
    v17[3] = &unk_1E894D810;
    v17[4] = self;
    v19 = v7;
    v18 = v6;
    -[_HAPAccessoryServerBTLE100 removePairing:completionQueue:completionHandler:](self, "removePairing:completionQueue:completionHandler:", 0, v14, v17);

    v15 = v19;
    goto LABEL_7;
  }
  if (v7)
  {
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __82___HAPAccessoryServerBTLE100_removePairingForCurrentControllerOnQueue_completion___block_invoke;
    block[3] = &unk_1E894D5E0;
    v22 = v7;
    v21 = v9;
    dispatch_async(v6, block);

    v15 = v22;
LABEL_7:

  }
  return v8 != 0;
}

- (void)listPairingsWithCompletionQueue:(id)a3 completionHandler:(id)a4
{
  NSObject *v7;
  id v8;
  void *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  _QWORD block[4];
  id v15;
  uint8_t buf[4];
  void *v17;
  __int16 v18;
  void *v19;
  __int16 v20;
  void *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v9 = (void *)MEMORY[0x1D17B7244]();
  HMFGetOSLogHandle();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    HMFGetLogIdentifier();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[HAPAccessoryServer name](self, "name");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(a2);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    v17 = v11;
    v18 = 2112;
    v19 = v12;
    v20 = 2112;
    v21 = v13;
    _os_log_impl(&dword_1CCE01000, v10, OS_LOG_TYPE_DEFAULT, "%{public}@[BTLE Accessory Server '%@] %@ is not supported over this transport", buf, 0x20u);

  }
  objc_autoreleasePoolPop(v9);
  if (v7 && v8)
  {
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __80___HAPAccessoryServerBTLE100_listPairingsWithCompletionQueue_completionHandler___block_invoke;
    block[3] = &unk_1E894D498;
    v15 = v8;
    dispatch_async(v7, block);

  }
}

- (void)_enqueueOperation:(int64_t)a3 identifier:(id)a4 publicKey:(id)a5 admin:(BOOL)a6 queue:(id)a7 completion:(id)a8
{
  _BOOL8 v10;
  id v14;
  id v15;
  id v16;
  id v17;
  HAPAddRemovePairingOperation *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  NSObject *v23;
  void *v24;
  void *v25;
  int v26;
  void *v27;
  __int16 v28;
  void *v29;
  __int16 v30;
  int64_t v31;
  __int16 v32;
  id v33;
  uint64_t v34;

  v10 = a6;
  v34 = *MEMORY[0x1E0C80C00];
  v14 = a4;
  v15 = a5;
  v16 = a7;
  v17 = a8;
  v18 = -[HAPAddRemovePairingOperation initWith:identifier:publicKey:admin:queue:completion:]([HAPAddRemovePairingOperation alloc], "initWith:identifier:publicKey:admin:queue:completion:", a3, v14, v15, v10, v16, v17);
  -[_HAPAccessoryServerBTLE100 addRemovePairingOperationsQueue](self, "addRemovePairingOperationsQueue");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = objc_msgSend(v19, "count");

  if (!v20)
    -[HAPAddRemovePairingOperation setOperationExecuting:](v18, "setOperationExecuting:", 1);
  -[_HAPAccessoryServerBTLE100 addRemovePairingOperationsQueue](self, "addRemovePairingOperationsQueue");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "addObject:", v18);

  v22 = (void *)MEMORY[0x1D17B7244]();
  HMFGetOSLogHandle();
  v23 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
  {
    HMFGetLogIdentifier();
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    -[HAPAccessoryServer name](self, "name");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = 138544130;
    v27 = v24;
    v28 = 2112;
    v29 = v25;
    v30 = 2048;
    v31 = a3;
    v32 = 2112;
    v33 = v14;
    _os_log_impl(&dword_1CCE01000, v23, OS_LOG_TYPE_DEFAULT, "%{public}@[BTLE Accessory Server '%@] Queued Operation %ld for controller with identifier %@", (uint8_t *)&v26, 0x2Au);

  }
  objc_autoreleasePoolPop(v22);

}

- (void)_dequeueAndContinueOperation
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  NSObject *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  void *v27;
  int v28;
  void *v29;
  __int16 v30;
  uint64_t v31;
  __int16 v32;
  uint64_t v33;
  __int16 v34;
  void *v35;
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  -[_HAPAccessoryServerBTLE100 addRemovePairingOperationsQueue](self, "addRemovePairingOperationsQueue");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count");

  if (v4)
  {
    -[_HAPAccessoryServerBTLE100 addRemovePairingOperationsQueue](self, "addRemovePairingOperationsQueue");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "removeObjectAtIndex:", 0);

  }
  -[_HAPAccessoryServerBTLE100 addRemovePairingOperationsQueue](self, "addRemovePairingOperationsQueue");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "count");

  if (v7)
  {
    v8 = (void *)MEMORY[0x1D17B7244]();
    HMFGetOSLogHandle();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[_HAPAccessoryServerBTLE100 addRemovePairingOperationsQueue](self, "addRemovePairingOperationsQueue");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v28 = 138543618;
      v29 = v10;
      v30 = 2048;
      v31 = objc_msgSend(v11, "count");
      _os_log_impl(&dword_1CCE01000, v9, OS_LOG_TYPE_INFO, "%{public}@Continuing with remaining %ld operations", (uint8_t *)&v28, 0x16u);

    }
    objc_autoreleasePoolPop(v8);
    -[_HAPAccessoryServerBTLE100 addRemovePairingOperationsQueue](self, "addRemovePairingOperationsQueue");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "objectAtIndex:", 0);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v13, "setOperationExecuting:", 1);
    v14 = objc_msgSend(v13, "operation");
    if (v14 == 6)
    {
      objc_msgSend(v13, "identifier");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "publicKey");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "queue");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "completionHandler");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      -[_HAPAccessoryServerBTLE100 _removePairingWithIdentifier:publicKey:queue:completion:](self, "_removePairingWithIdentifier:publicKey:queue:completion:", v15, v16, v20, v21);

    }
    else
    {
      if (v14 != 5)
      {
        v22 = (void *)MEMORY[0x1D17B7244]();
        HMFGetOSLogHandle();
        v23 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
        {
          HMFGetLogIdentifier();
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          -[HAPAccessoryServer name](self, "name");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          v26 = objc_msgSend(v13, "operation");
          objc_msgSend(v13, "identifier");
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          v28 = 138544130;
          v29 = v24;
          v30 = 2112;
          v31 = (uint64_t)v25;
          v32 = 2048;
          v33 = v26;
          v34 = 2112;
          v35 = v27;
          _os_log_impl(&dword_1CCE01000, v23, OS_LOG_TYPE_DEFAULT, "%{public}@[BTLE Accessory Server '%@] ### Invalid Operation %tu in Q for controller: %@, Dropping and continuing", (uint8_t *)&v28, 0x2Au);

        }
        objc_autoreleasePoolPop(v22);
        -[_HAPAccessoryServerBTLE100 _dequeueAndContinueOperation](self, "_dequeueAndContinueOperation");
        goto LABEL_14;
      }
      objc_msgSend(v13, "identifier");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "publicKey");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = objc_msgSend(v13, "admin");
      objc_msgSend(v13, "queue");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "completionHandler");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      -[_HAPAccessoryServerBTLE100 _addPairingWithIdentifier:publicKey:admin:queue:completion:](self, "_addPairingWithIdentifier:publicKey:admin:queue:completion:", v15, v16, v17, v18, v19);

    }
LABEL_14:

  }
}

- (void)disconnect
{
  NSObject *v3;
  _QWORD block[5];

  -[HAPAccessoryServer clientQueue](self, "clientQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __40___HAPAccessoryServerBTLE100_disconnect__block_invoke;
  block[3] = &unk_1E894DD08;
  block[4] = self;
  dispatch_async(v3, block);

}

- (unint64_t)state
{
  return self->_state;
}

- (void)setState:(unint64_t)a3
{
  self->_state = a3;
}

- (unint64_t)connectionRetryCount
{
  return self->_connectionRetryCount;
}

- (void)setConnectionRetryCount:(unint64_t)a3
{
  self->_connectionRetryCount = a3;
}

- (NSMapTable)btleServiceToHAPServiceMap
{
  return self->_btleServiceToHAPServiceMap;
}

- (void)setBtleServiceToHAPServiceMap:(id)a3
{
  objc_storeStrong((id *)&self->_btleServiceToHAPServiceMap, a3);
}

- (unint64_t)characteristicDiscoveryRequestCount
{
  return self->_characteristicDiscoveryRequestCount;
}

- (void)setCharacteristicDiscoveryRequestCount:(unint64_t)a3
{
  self->_characteristicDiscoveryRequestCount = a3;
}

- (unint64_t)characteristicValueReadCount
{
  return self->_characteristicValueReadCount;
}

- (void)setCharacteristicValueReadCount:(unint64_t)a3
{
  self->_characteristicValueReadCount = a3;
}

- (unint64_t)metadataDiscoveryRequestCount
{
  return self->_metadataDiscoveryRequestCount;
}

- (void)setMetadataDiscoveryRequestCount:(unint64_t)a3
{
  self->_metadataDiscoveryRequestCount = a3;
}

- (unint64_t)metadataValueReadCount
{
  return self->_metadataValueReadCount;
}

- (void)setMetadataValueReadCount:(unint64_t)a3
{
  self->_metadataValueReadCount = a3;
}

- (unint64_t)availableInstanceID
{
  return self->_availableInstanceID;
}

- (void)setAvailableInstanceID:(unint64_t)a3
{
  self->_availableInstanceID = a3;
}

- (NSMapTable)btleCharacteristicToHAPCharacteristicMap
{
  return self->_btleCharacteristicToHAPCharacteristicMap;
}

- (void)setBtleCharacteristicToHAPCharacteristicMap:(id)a3
{
  objc_storeStrong((id *)&self->_btleCharacteristicToHAPCharacteristicMap, a3);
}

- (NSMapTable)hapCharacteristicReadCompletionQueues
{
  return self->_hapCharacteristicReadCompletionQueues;
}

- (void)setHapCharacteristicReadCompletionQueues:(id)a3
{
  objc_storeStrong((id *)&self->_hapCharacteristicReadCompletionQueues, a3);
}

- (NSMapTable)hapCharacteristicWriteCompletionQueues
{
  return self->_hapCharacteristicWriteCompletionQueues;
}

- (void)setHapCharacteristicWriteCompletionQueues:(id)a3
{
  objc_storeStrong((id *)&self->_hapCharacteristicWriteCompletionQueues, a3);
}

- (NSMapTable)hapCharacteristicEnableEventCompletionQueues
{
  return self->_hapCharacteristicEnableEventCompletionQueues;
}

- (void)setHapCharacteristicEnableEventCompletionQueues:(id)a3
{
  objc_storeStrong((id *)&self->_hapCharacteristicEnableEventCompletionQueues, a3);
}

- (NSMutableArray)addRemovePairingOperationsQueue
{
  return self->_addRemovePairingOperationsQueue;
}

- (void)setAddRemovePairingOperationsQueue:(id)a3
{
  objc_storeStrong((id *)&self->_addRemovePairingOperationsQueue, a3);
}

- (CBService)pairingService
{
  return self->_pairingService;
}

- (void)setPairingService:(id)a3
{
  objc_storeStrong((id *)&self->_pairingService, a3);
}

- (CBCharacteristic)pairSetupCharacteristic
{
  return self->_pairSetupCharacteristic;
}

- (void)setPairSetupCharacteristic:(id)a3
{
  objc_storeStrong((id *)&self->_pairSetupCharacteristic, a3);
}

- (CBCharacteristic)pairVerifyCharacteristic
{
  return self->_pairVerifyCharacteristic;
}

- (void)setPairVerifyCharacteristic:(id)a3
{
  objc_storeStrong((id *)&self->_pairVerifyCharacteristic, a3);
}

- (CBCharacteristic)pairingFeaturesCharacteristic
{
  return self->_pairingFeaturesCharacteristic;
}

- (void)setPairingFeaturesCharacteristic:(id)a3
{
  objc_storeStrong((id *)&self->_pairingFeaturesCharacteristic, a3);
}

- (CBCharacteristic)pairingsCharacteristic
{
  return self->_pairingsCharacteristic;
}

- (void)setPairingsCharacteristic:(id)a3
{
  objc_storeStrong((id *)&self->_pairingsCharacteristic, a3);
}

- (CBService)accessoryInfoService
{
  return self->_accessoryInfoService;
}

- (void)setAccessoryInfoService:(id)a3
{
  objc_storeStrong((id *)&self->_accessoryInfoService, a3);
}

- (CBCharacteristic)identifyCharacteristic
{
  return self->_identifyCharacteristic;
}

- (void)setIdentifyCharacteristic:(id)a3
{
  objc_storeStrong((id *)&self->_identifyCharacteristic, a3);
}

- (CBCharacteristic)modelCharacteristic
{
  return self->_modelCharacteristic;
}

- (void)setModelCharacteristic:(id)a3
{
  objc_storeStrong((id *)&self->_modelCharacteristic, a3);
}

- (CBCharacteristic)serialNumberCharacteristic
{
  return self->_serialNumberCharacteristic;
}

- (void)setSerialNumberCharacteristic:(id)a3
{
  objc_storeStrong((id *)&self->_serialNumberCharacteristic, a3);
}

- (CBCharacteristic)manufacturerCharacteristic
{
  return self->_manufacturerCharacteristic;
}

- (void)setManufacturerCharacteristic:(id)a3
{
  objc_storeStrong((id *)&self->_manufacturerCharacteristic, a3);
}

- (id)pairVerifyCompletionBlock
{
  return self->_pairVerifyCompletionBlock;
}

- (void)setPairVerifyCompletionBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 632);
}

- (BOOL)startPairingRequested
{
  return self->_startPairingRequested;
}

- (void)setStartPairingRequested:(BOOL)a3
{
  self->_startPairingRequested = a3;
}

- (BOOL)pairingFeaturesRead
{
  return self->_pairingFeaturesRead;
}

- (void)setPairingFeaturesRead:(BOOL)a3
{
  self->_pairingFeaturesRead = a3;
}

- (unint64_t)pairingFeatureFlags
{
  return self->_pairingFeatureFlags;
}

- (void)setPairingFeatureFlags:(unint64_t)a3
{
  self->_pairingFeatureFlags = a3;
}

- (HAPSecuritySession)securitySession
{
  return self->_securitySession;
}

- (void)setSecuritySession:(id)a3
{
  objc_storeStrong((id *)&self->_securitySession, a3);
}

- (BOOL)isSecuritySessionOpening
{
  return self->_securitySessionOpening;
}

- (void)setSecuritySessionOpening:(BOOL)a3
{
  self->_securitySessionOpening = a3;
}

- (OS_dispatch_source)connectionLifetimeTimer
{
  return self->_connectionLifetimeTimer;
}

- (void)setConnectionLifetimeTimer:(id)a3
{
  objc_storeStrong((id *)&self->_connectionLifetimeTimer, a3);
}

- (double)idleConnectionTimeoutInSec
{
  return self->_idleConnectionTimeoutInSec;
}

- (void)setIdleConnectionTimeoutInSec:(double)a3
{
  self->_idleConnectionTimeoutInSec = a3;
}

- (BOOL)isDisconnecting
{
  return self->_disconnecting;
}

- (void)setDisconnecting:(BOOL)a3
{
  self->_disconnecting = a3;
}

- (BOOL)unpairedIdentifyRequested
{
  return self->_unpairedIdentifyRequested;
}

- (void)setUnpairedIdentifyRequested:(BOOL)a3
{
  self->_unpairedIdentifyRequested = a3;
}

- (id)unpairedIdentifyCompletionBlock
{
  return self->_unpairedIdentifyCompletionBlock;
}

- (void)setUnpairedIdentifyCompletionBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 672);
}

- (BOOL)removeOnDisconnect
{
  return self->_removeOnDisconnect;
}

- (void)setRemoveOnDisconnect:(BOOL)a3
{
  self->_removeOnDisconnect = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_unpairedIdentifyCompletionBlock, 0);
  objc_storeStrong((id *)&self->_connectionLifetimeTimer, 0);
  objc_storeStrong((id *)&self->_securitySession, 0);
  objc_storeStrong(&self->_pairVerifyCompletionBlock, 0);
  objc_storeStrong((id *)&self->_manufacturerCharacteristic, 0);
  objc_storeStrong((id *)&self->_serialNumberCharacteristic, 0);
  objc_storeStrong((id *)&self->_modelCharacteristic, 0);
  objc_storeStrong((id *)&self->_identifyCharacteristic, 0);
  objc_storeStrong((id *)&self->_accessoryInfoService, 0);
  objc_storeStrong((id *)&self->_pairingsCharacteristic, 0);
  objc_storeStrong((id *)&self->_pairingFeaturesCharacteristic, 0);
  objc_storeStrong((id *)&self->_pairVerifyCharacteristic, 0);
  objc_storeStrong((id *)&self->_pairSetupCharacteristic, 0);
  objc_storeStrong((id *)&self->_pairingService, 0);
  objc_storeStrong((id *)&self->_addRemovePairingOperationsQueue, 0);
  objc_storeStrong((id *)&self->_hapCharacteristicEnableEventCompletionQueues, 0);
  objc_storeStrong((id *)&self->_hapCharacteristicWriteCompletionQueues, 0);
  objc_storeStrong((id *)&self->_hapCharacteristicReadCompletionQueues, 0);
  objc_storeStrong((id *)&self->_btleCharacteristicToHAPCharacteristicMap, 0);
  objc_storeStrong((id *)&self->_btleServiceToHAPServiceMap, 0);
}

+ (id)serializeCharacteristicWriteValue:(id)a3 characteristicFormat:(unint64_t)a4 supportsAdditionalAuthentication:(BOOL)a5 authenticationData:(id)a6 error:(id *)a7
{
  _BOOL4 v9;
  id v11;
  id v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  NSObject *v17;
  void *v18;
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  void *v24;
  NSObject *v25;
  void *v26;
  id v28;
  uint64_t v29;
  void *v30;
  _OWORD buf[21];
  uint64_t v32;

  v9 = a5;
  v32 = *MEMORY[0x1E0C80C00];
  v11 = a3;
  v12 = a6;
  +[HAPDataValueTransformer defaultDataValueTransformer](HAPDataValueTransformer, "defaultDataValueTransformer");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = 0;
  objc_msgSend(v13, "transformedValue:format:error:", v11, a4, &v28);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = v28;

  if (v15)
  {
    v16 = (void *)MEMORY[0x1D17B7244]();
    HMFGetOSLogHandle();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(buf[0]) = 138543874;
      *(_QWORD *)((char *)buf + 4) = v18;
      WORD6(buf[0]) = 2112;
      *(_QWORD *)((char *)buf + 14) = v11;
      WORD3(buf[1]) = 2112;
      *((_QWORD *)&buf[1] + 1) = v15;
      _os_log_impl(&dword_1CCE01000, v17, OS_LOG_TYPE_ERROR, "%{public}@[HAPAccessoryServerBTLE] Failed to transform the write value '%@' with error: %@", (uint8_t *)buf, 0x20u);

    }
    objc_autoreleasePoolPop(v16);
    if (a7)
    {
      v19 = objc_retainAutorelease(v15);
LABEL_6:
      v20 = 0;
      *a7 = v19;
      goto LABEL_21;
    }
    goto LABEL_20;
  }
  v20 = v14;
  if (v9)
  {
    v21 = v12;
    memset(buf, 0, sizeof(buf));
    v29 = 0;
    v30 = 0;
    TLV8BufferInit();
    v22 = objc_retainAutorelease(v20);
    objc_msgSend(v22, "bytes");
    objc_msgSend(v22, "length");
    v20 = 0;
    if (!TLV8BufferAppend())
    {
      if (v21
        && objc_msgSend(v21, "length")
        && (v23 = objc_retainAutorelease(v21),
            objc_msgSend(v23, "bytes"),
            objc_msgSend(v23, "length"),
            TLV8BufferAppend())
        || TLV8BufferDetach())
      {
        v20 = 0;
      }
      else
      {
        objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", v30, v29);
        v20 = (id)objc_claimAutoreleasedReturnValue();
        free(v30);
      }
    }
    TLV8BufferFree();

    if (!v20)
    {
      v24 = (void *)MEMORY[0x1D17B7244]();
      HMFGetOSLogHandle();
      v25 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        LODWORD(buf[0]) = 138543618;
        *(_QWORD *)((char *)buf + 4) = v26;
        WORD6(buf[0]) = 2112;
        *(_QWORD *)((char *)buf + 14) = v22;
        _os_log_impl(&dword_1CCE01000, v25, OS_LOG_TYPE_ERROR, "%{public}@[HAPAccessoryServerBTLE] Failed to encode characteristic write payload: %@", (uint8_t *)buf, 0x16u);

      }
      objc_autoreleasePoolPop(v24);
      if (a7)
      {
        objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("HAPErrorDomain"), -6737, 0);
        v19 = (id)objc_claimAutoreleasedReturnValue();
        goto LABEL_6;
      }
LABEL_20:
      v20 = 0;
    }
  }
LABEL_21:

  return v20;
}

+ (id)deserializeCharacteristicReadData:(id)a3 characteristicFormat:(unint64_t)a4 supportsAdditionalAuthentication:(BOOL)a5 error:(id *)a6
{
  _BOOL4 v7;
  id v9;
  void *v10;
  void *v11;
  id v12;
  id v13;
  void *v14;
  NSObject *v15;
  void *v16;
  void *v17;
  void *v18;
  uint8_t buf[4];
  void *v21;
  uint64_t v22;

  v7 = a5;
  v22 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = v9;
  v11 = v9;
  if (!v7)
    goto LABEL_9;
  v12 = objc_retainAutorelease(v9);
  objc_msgSend(v12, "bytes");
  v13 = objc_retainAutorelease(v12);
  objc_msgSend(v13, "bytes");
  objc_msgSend(v13, "length");
  if (!TLV8GetBytes())
  {
    objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", buf, 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v11)
      goto LABEL_4;
LABEL_9:
    +[HAPDataValueTransformer defaultDataValueTransformer](HAPDataValueTransformer, "defaultDataValueTransformer");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "reverseTransformedValue:format:error:", v11, a4, a6);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    goto LABEL_10;
  }

LABEL_4:
  v14 = (void *)MEMORY[0x1D17B7244]();
  HMFGetOSLogHandle();
  v15 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
  {
    HMFGetLogIdentifier();
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v21 = v16;
    _os_log_impl(&dword_1CCE01000, v15, OS_LOG_TYPE_ERROR, "%{public}@[HAPAccessoryServerBTLE] Expected TLV8 value because the characteristic support authorization data but was unable to parse TLV8.", buf, 0xCu);

  }
  objc_autoreleasePoolPop(v14);
  if (a6)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("HAPErrorDomain"), -6737, 0);
    v17 = 0;
    *a6 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v17 = 0;
  }
LABEL_10:

  return v17;
}

+ (id)_convertFromBTLEToHAPUUID:(id)a3
{
  id v3;
  void *v4;
  id v5;

  v3 = a3;
  +[HAPMetadata getSharedInstance](HAPMetadata, "getSharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "btleToServiceType:", v3);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  if (!v5)
    v5 = v3;

  return v5;
}

@end
