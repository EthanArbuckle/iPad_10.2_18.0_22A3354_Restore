@implementation HMDSiriEndpointProfile

- (HMDSiriEndpointProfile)initWithSiriEndpointServices:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  HMDSiriEndpointProfile *v7;

  v4 = (void *)MEMORY[0x1E0CB37D0];
  v5 = a3;
  objc_msgSend(v4, "defaultCenter");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[HMDSiriEndpointProfile initWithSiriEndpointServices:notificationCenter:](self, "initWithSiriEndpointServices:notificationCenter:", v5, v6);

  return v7;
}

- (HMDSiriEndpointProfile)initWithSiriEndpointServices:(id)a3 notificationCenter:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  const char *v12;
  NSObject *v13;
  dispatch_queue_t v14;
  HMDSiriEndpointProfile *v15;
  uint64_t v16;
  NSUUID *sessionHubIdentifier;
  NSString *siriEndpointVersion;
  void *v19;
  NSString *siriEngineVersion;
  uint64_t v21;
  NSString *clientEndpointIdentifier;
  uint64_t v23;
  NSString *clientSettingsIdentifier;
  void *v25;
  NSArray *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t i;
  void *v31;
  void *v32;
  int v33;
  HMDSiriEndpointProfileAssistant *v34;
  uint64_t v35;
  NSArray *assistants;
  uint64_t v37;
  HMFStagedValue *stagedNeedsOnboarding;
  HMDSiriEndpointProfile *v39;
  void *v40;
  NSObject *v41;
  void *v42;
  HMDSiriEndpointProfile *v44;
  void *v45;
  void *v46;
  void *v47;
  id v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  objc_super v53;
  uint8_t v54[128];
  uint8_t buf[4];
  void *v56;
  __int16 v57;
  id v58;
  uint64_t v59;

  v59 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  objc_msgSend(v6, "firstObject");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "accessory");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    objc_msgSend((id)objc_opt_class(), "uniqueIdentifierFromAccessory:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    HMDispatchQueueNameString();
    v11 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v12 = (const char *)objc_msgSend(v11, "UTF8String");
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v13 = objc_claimAutoreleasedReturnValue();
    v14 = dispatch_queue_create(v12, v13);
    v53.receiver = self;
    v53.super_class = (Class)HMDSiriEndpointProfile;
    v15 = -[HMDAccessoryProfile initWithAccessory:uniqueIdentifier:services:workQueue:](&v53, sel_initWithAccessory_uniqueIdentifier_services_workQueue_, v9, v10, 0, v14);

    if (v15)
    {
      v46 = v9;
      v15->_sessionState = -1;
      objc_msgSend(MEMORY[0x1E0CB3A28], "hmf_zeroUUID");
      v16 = objc_claimAutoreleasedReturnValue();
      sessionHubIdentifier = v15->_sessionHubIdentifier;
      v15->_sessionHubIdentifier = (NSUUID *)v16;

      siriEndpointVersion = v15->_siriEndpointVersion;
      v15->_siriEndpointVersion = (NSString *)&stru_1E89C3E38;

      v19 = v6;
      if (!v6)
      {
        objc_msgSend(MEMORY[0x1E0C99D20], "array");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
      }
      v47 = v8;
      objc_storeStrong((id *)&v15->_profileServices, v19);
      v48 = v6;
      if (!v6)

      objc_storeStrong((id *)&v15->_notificationCenter, a4);
      v15->_siriEnable = -1;
      v15->_siriListening = -1;
      v15->_siriTouchToUse = -1;
      v15->_siriLightOnUse = -1;
      siriEngineVersion = v15->_siriEngineVersion;
      v15->_siriEngineVersion = (NSString *)&stru_1E89C3E38;

      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@.HMDSiriEndpointProfile.Endpoint.%@"), CFSTR("com.apple.HomeKitDaemon.Local"), v10);
      v21 = objc_claimAutoreleasedReturnValue();
      clientEndpointIdentifier = v15->_clientEndpointIdentifier;
      v15->_clientEndpointIdentifier = (NSString *)v21;

      v45 = v10;
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@.HMDSiriEndpointProfile.Settings.%@"), CFSTR("com.apple.HomeKitDaemon.Local"), v10);
      v23 = objc_claimAutoreleasedReturnValue();
      clientSettingsIdentifier = v15->_clientSettingsIdentifier;
      v15->_clientSettingsIdentifier = (NSString *)v23;

      v15->_manuallyDisabled = 0;
      v44 = v15;
      v15->_multifunctionButton = -1;
      objc_msgSend(MEMORY[0x1E0C99DE8], "array");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v49 = 0u;
      v50 = 0u;
      v51 = 0u;
      v52 = 0u;
      v26 = v15->_profileServices;
      v27 = -[NSArray countByEnumeratingWithState:objects:count:](v26, "countByEnumeratingWithState:objects:count:", &v49, v54, 16);
      if (v27)
      {
        v28 = v27;
        v29 = *(_QWORD *)v50;
        do
        {
          for (i = 0; i != v28; ++i)
          {
            if (*(_QWORD *)v50 != v29)
              objc_enumerationMutation(v26);
            v31 = *(void **)(*((_QWORD *)&v49 + 1) + 8 * i);
            objc_msgSend(v31, "serviceType");
            v32 = (void *)objc_claimAutoreleasedReturnValue();
            v33 = objc_msgSend(v32, "isEqualToString:", CFSTR("0000026A-0000-1000-8000-0026BB765291"));

            if (v33)
            {
              v34 = -[HMDSiriEndpointProfileAssistant initWithService:]([HMDSiriEndpointProfileAssistant alloc], "initWithService:", v31);
              objc_msgSend(v25, "addObject:", v34);

            }
          }
          v28 = -[NSArray countByEnumeratingWithState:objects:count:](v26, "countByEnumeratingWithState:objects:count:", &v49, v54, 16);
        }
        while (v28);
      }

      v35 = objc_msgSend(v25, "copy");
      v15 = v44;
      assistants = v44->_assistants;
      v44->_assistants = (NSArray *)v35;

      v37 = objc_msgSend(objc_alloc(MEMORY[0x1E0D286A8]), "initWithValue:", &unk_1E8B33558);
      stagedNeedsOnboarding = v44->_stagedNeedsOnboarding;
      v44->_stagedNeedsOnboarding = (HMFStagedValue *)v37;

      -[HMFStagedValue setDelegate:](v15->_stagedNeedsOnboarding, "setDelegate:", v15);
      v6 = v48;
      v9 = v46;
      v8 = v47;
      v10 = v45;
    }
    self = v15;

    v39 = self;
  }
  else
  {
    v40 = (void *)MEMORY[0x1D17BA0A0]();
    HMFGetOSLogHandle();
    v41 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v56 = v42;
      v57 = 2112;
      v58 = v6;
      _os_log_impl(&dword_1CD062000, v41, OS_LOG_TYPE_ERROR, "%{public}@Cannot create Siri Endpoint profile, cannot determine accessory from services %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v40);
    v39 = 0;
  }

  return v39;
}

- (void)registerForMessages
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  _QWORD v10[5];
  objc_super v11;
  _QWORD v12[3];

  v12[2] = *MEMORY[0x1E0C80C00];
  v11.receiver = self;
  v11.super_class = (Class)HMDSiriEndpointProfile;
  -[HMDAccessoryProfile registerForMessages](&v11, sel_registerForMessages);
  -[HMDAccessoryProfile msgDispatcher](self, "msgDispatcher");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[HMDXPCMessagePolicy policyWithEntitlements:](HMDXPCMessagePolicy, "policyWithEntitlements:", 5);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = v4;
  -[HMDAccessoryProfile accessory](self, "accessory");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "home");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[HMDUserMessagePolicy userMessagePolicyWithHome:userPrivilege:remoteAccessRequired:](HMDUserMessagePolicy, "userMessagePolicyWithHome:userPrivilege:remoteAccessRequired:", v6, 0, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v12[1] = v7;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v12, 2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "registerForMessage:receiver:policies:selector:", *MEMORY[0x1E0CB9C08], self, v8, sel__handleRefreshProfileState_);
  objc_msgSend(v3, "registerForMessage:receiver:policies:selector:", *MEMORY[0x1E0CB9BE0], self, v8, sel_handleEnableNotifications_);
  -[HMDSiriEndpointProfile unregisterForNotifications](self, "unregisterForNotifications");
  -[HMDSiriEndpointProfile registerForNotifications](self, "registerForNotifications");
  -[HMDAccessoryProfile workQueue](self, "workQueue");
  v9 = objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __45__HMDSiriEndpointProfile_registerForMessages__block_invoke;
  v10[3] = &unk_1E89C2730;
  v10[4] = self;
  dispatch_async(v9, v10);

}

- (void)registerForNotifications
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  -[HMDAccessoryProfile accessory](self, "accessory");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "home");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDSiriEndpointProfile notificationCenter](self, "notificationCenter");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addObserver:selector:name:object:", self, sel_handleHomeCharacteristicValuesChanged_, CFSTR("HMDAccessoryCharacteristicsChangedNotification"), v10);

  -[HMDSiriEndpointProfile notificationCenter](self, "notificationCenter");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObserver:selector:name:object:", self, sel_handleHomeCharacteristicValuesChanged_, CFSTR("HMDAccessoryCharacteristicsResponseReceivedNotification"), v3);

  -[HMDSiriEndpointProfile notificationCenter](self, "notificationCenter");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addObserver:selector:name:object:", self, sel_handleAccessoryConfigured_, CFSTR("HMDAccessoryConnectedNotification"), v10);

  -[HMDSiriEndpointProfile notificationCenter](self, "notificationCenter");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "addObserver:selector:name:object:", self, sel_handlePrimaryResidentChanged_, CFSTR("HMDResidentDeviceConfirmedStateChangedNotification"), 0);

  -[HMDSiriEndpointProfile notificationCenter](self, "notificationCenter");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "addObserver:selector:name:object:", self, sel_handleDeviceCapabilitiesUpdated_, CFSTR("HMDDeviceCapabilitiiesUpdatedNotification"), 0);

  -[HMDSiriEndpointProfile notificationCenter](self, "notificationCenter");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "addObserver:selector:name:object:", self, sel_handleUpdateNeedsOnboarding_, CFSTR("HMDSiriEndpointProfileUpdateNeedsOnboardingNotification"), 0);

}

- (void)unregisterForNotifications
{
  id v3;

  -[HMDSiriEndpointProfile notificationCenter](self, "notificationCenter");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

}

- (id)_siriService
{
  return -[HMDAccessoryProfile findServiceWithType:](self, "findServiceWithType:", CFSTR("00000133-0000-1000-8000-0026BB765291"));
}

- (id)_siriEndpointService
{
  return -[HMDAccessoryProfile findServiceWithType:](self, "findServiceWithType:", CFSTR("00000253-0000-1000-8000-0026BB765291"));
}

- (id)_siriSettingSiriEnableCharacteristic
{
  void *v2;
  void *v3;

  -[HMDSiriEndpointProfile _siriService](self, "_siriService");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "findCharacteristicWithType:", CFSTR("00000255-0000-1000-8000-0026BB765291"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)_siriSettingSiriEnableReadRequest
{
  void *v2;
  void *v3;

  -[HMDSiriEndpointProfile _siriSettingSiriEnableCharacteristic](self, "_siriSettingSiriEnableCharacteristic");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    +[HMDCharacteristicRequest requestWithCharacteristic:](HMDCharacteristicRequest, "requestWithCharacteristic:", v2);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }

  return v3;
}

- (id)_siriSettingSiriListeningCharacteristic
{
  void *v2;
  void *v3;

  -[HMDSiriEndpointProfile _siriService](self, "_siriService");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "findCharacteristicWithType:", CFSTR("00000256-0000-1000-8000-0026BB765291"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)_siriSettingSiriListeningReadRequest
{
  void *v2;
  void *v3;

  -[HMDSiriEndpointProfile _siriSettingSiriListeningCharacteristic](self, "_siriSettingSiriListeningCharacteristic");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    +[HMDCharacteristicRequest requestWithCharacteristic:](HMDCharacteristicRequest, "requestWithCharacteristic:", v2);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }

  return v3;
}

- (id)_siriSettingSiriTouchCharacteristic
{
  void *v2;
  void *v3;

  -[HMDSiriEndpointProfile _siriService](self, "_siriService");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "findCharacteristicWithType:", CFSTR("00000257-0000-1000-8000-0026BB765291"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)_siriSettingSiriTouchReadRequest
{
  void *v2;
  void *v3;

  -[HMDSiriEndpointProfile _siriSettingSiriTouchCharacteristic](self, "_siriSettingSiriTouchCharacteristic");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    +[HMDCharacteristicRequest requestWithCharacteristic:](HMDCharacteristicRequest, "requestWithCharacteristic:", v2);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }

  return v3;
}

- (id)_siriSettingSiriLightOnUseCharacteristic
{
  void *v2;
  void *v3;

  -[HMDSiriEndpointProfile _siriService](self, "_siriService");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "findCharacteristicWithType:", CFSTR("00000258-0000-1000-8000-0026BB765291"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)_siriSettingSiriLightOnUseReadRequest
{
  void *v2;
  void *v3;

  -[HMDSiriEndpointProfile _siriSettingSiriLightOnUseCharacteristic](self, "_siriSettingSiriLightOnUseCharacteristic");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    +[HMDCharacteristicRequest requestWithCharacteristic:](HMDCharacteristicRequest, "requestWithCharacteristic:", v2);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }

  return v3;
}

- (id)_siriSettingSiriEngineVersionCharacteristic
{
  void *v2;
  void *v3;

  -[HMDSiriEndpointProfile _siriService](self, "_siriService");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "findCharacteristicWithType:", CFSTR("0000025A-0000-1000-8000-0026BB765291"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)_siriSettingSiriEngineVersionReadRequest
{
  void *v2;
  void *v3;

  -[HMDSiriEndpointProfile _siriSettingSiriEngineVersionCharacteristic](self, "_siriSettingSiriEngineVersionCharacteristic");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    +[HMDCharacteristicRequest requestWithCharacteristic:](HMDCharacteristicRequest, "requestWithCharacteristic:", v2);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }

  return v3;
}

- (id)_siriEndpointSessionStatusCharacteristic
{
  void *v2;
  void *v3;

  -[HMDSiriEndpointProfile _siriEndpointService](self, "_siriEndpointService");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "findCharacteristicWithType:", CFSTR("00000254-0000-1000-8000-0026BB765291"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)_siriEndpointSessionStatusReadRequest
{
  void *v2;
  void *v3;

  -[HMDSiriEndpointProfile _siriEndpointSessionStatusCharacteristic](self, "_siriEndpointSessionStatusCharacteristic");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    +[HMDCharacteristicRequest requestWithCharacteristic:](HMDCharacteristicRequest, "requestWithCharacteristic:", v2);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }

  return v3;
}

- (id)_siriEndpointVersionCharacteristic
{
  void *v2;
  void *v3;

  -[HMDSiriEndpointProfile _siriEndpointService](self, "_siriEndpointService");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "findCharacteristicWithType:", *MEMORY[0x1E0CB8B28]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)_siriEndpointVersionReadRequest
{
  void *v2;
  void *v3;

  -[HMDSiriEndpointProfile _siriEndpointVersionCharacteristic](self, "_siriEndpointVersionCharacteristic");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    +[HMDCharacteristicRequest requestWithCharacteristic:](HMDCharacteristicRequest, "requestWithCharacteristic:", v2);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }

  return v3;
}

- (id)_siriEndpointActiveIdentifierCharacteristic
{
  void *v2;
  void *v3;

  -[HMDSiriEndpointProfile _siriEndpointService](self, "_siriEndpointService");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "findCharacteristicWithType:", *MEMORY[0x1E0CB8798]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)_siriEndpointActiveIdentifierReadRequest
{
  void *v2;
  void *v3;

  -[HMDSiriEndpointProfile _siriEndpointActiveIdentifierCharacteristic](self, "_siriEndpointActiveIdentifierCharacteristic");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    +[HMDCharacteristicRequest requestWithCharacteristic:](HMDCharacteristicRequest, "requestWithCharacteristic:", v2);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }

  return v3;
}

- (id)_siriEndpointManuallyDisabledCharacteristic
{
  void *v2;
  void *v3;

  -[HMDSiriEndpointProfile _siriEndpointService](self, "_siriEndpointService");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "findCharacteristicWithType:", CFSTR("00000227-0000-1000-8000-0026BB765291"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)_siriEndpointManuallyDisabledReadRequest
{
  void *v2;
  void *v3;

  -[HMDSiriEndpointProfile _siriEndpointManuallyDisabledCharacteristic](self, "_siriEndpointManuallyDisabledCharacteristic");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    +[HMDCharacteristicRequest requestWithCharacteristic:](HMDCharacteristicRequest, "requestWithCharacteristic:", v2);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }

  return v3;
}

- (id)_siriSettingMultifunctionButtonCharacteristic
{
  void *v2;
  void *v3;

  -[HMDSiriEndpointProfile _siriService](self, "_siriService");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "findCharacteristicWithType:", CFSTR("0000026B-0000-1000-8000-0026BB765291"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)_siriSettingMultifunctionButtonReadRequest
{
  void *v2;
  void *v3;

  -[HMDSiriEndpointProfile _siriSettingMultifunctionButtonCharacteristic](self, "_siriSettingMultifunctionButtonCharacteristic");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    +[HMDCharacteristicRequest requestWithCharacteristic:](HMDCharacteristicRequest, "requestWithCharacteristic:", v2);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }

  return v3;
}

- (void)setSessionHubIdentifier:(id)a3
{
  NSUUID *v4;
  NSUUID *sessionHubIdentifier;
  id v6;

  v6 = a3;
  os_unfair_lock_lock_with_options();
  v4 = (NSUUID *)objc_msgSend(v6, "copy");
  sessionHubIdentifier = self->_sessionHubIdentifier;
  self->_sessionHubIdentifier = v4;

  os_unfair_lock_unlock(&self->_lock);
}

- (NSUUID)sessionHubIdentifier
{
  os_unfair_lock_s *p_lock;
  NSUUID *v4;

  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  v4 = self->_sessionHubIdentifier;
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (NSString)siriEndpointVersion
{
  os_unfair_lock_s *p_lock;
  NSString *v4;

  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  v4 = self->_siriEndpointVersion;
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (void)setSiriEndpointVersion:(id)a3
{
  NSString *v4;
  NSString *siriEndpointVersion;
  id v6;

  v6 = a3;
  os_unfair_lock_lock_with_options();
  v4 = (NSString *)objc_msgSend(v6, "copy");
  siriEndpointVersion = self->_siriEndpointVersion;
  self->_siriEndpointVersion = v4;

  os_unfair_lock_unlock(&self->_lock);
}

- (void)setProfileServices:(id)a3
{
  NSArray *v4;
  NSArray *profileServices;
  id v6;

  v6 = a3;
  os_unfair_lock_lock_with_options();
  v4 = (NSArray *)objc_msgSend(v6, "copy");
  profileServices = self->_profileServices;
  self->_profileServices = v4;

  os_unfair_lock_unlock(&self->_lock);
}

- (NSArray)profileServices
{
  os_unfair_lock_s *p_lock;
  NSArray *v4;

  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  v4 = self->_profileServices;
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (void)addService:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  char v17;
  void *v18;
  void *v19;
  int v20;
  void *v21;
  void *v22;
  HMDSiriEndpointProfileAssistant *v23;
  void *v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[HMDAccessoryProfile accessory](self, "accessory");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "workQueue");
  v6 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v6);

  if (v4)
  {
    v7 = (void *)MEMORY[0x1E0C99DE8];
    -[HMDSiriEndpointProfile profileServices](self, "profileServices");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "arrayWithArray:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    v27 = 0u;
    v28 = 0u;
    v25 = 0u;
    v26 = 0u;
    v10 = v9;
    v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
    if (v11)
    {
      v12 = v11;
      v13 = *(_QWORD *)v26;
      while (2)
      {
        v14 = 0;
        do
        {
          if (*(_QWORD *)v26 != v13)
            objc_enumerationMutation(v10);
          objc_msgSend(*(id *)(*((_QWORD *)&v25 + 1) + 8 * v14), "instanceID", (_QWORD)v25);
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v4, "instanceID");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          v17 = objc_msgSend(v15, "isEqual:", v16);

          if ((v17 & 1) != 0)
          {
            v22 = v10;
            goto LABEL_13;
          }
          ++v14;
        }
        while (v12 != v14);
        v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
        if (v12)
          continue;
        break;
      }
    }

    objc_msgSend(v10, "addObject:", v4);
    v18 = (void *)objc_msgSend(v10, "copy");
    -[HMDSiriEndpointProfile setProfileServices:](self, "setProfileServices:", v18);

    objc_msgSend(v4, "serviceType");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = objc_msgSend(v19, "isEqualToString:", CFSTR("0000026A-0000-1000-8000-0026BB765291"));

    if (v20)
    {
      -[HMDSiriEndpointProfile assistants](self, "assistants");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = (void *)objc_msgSend(v21, "mutableCopy");

      v23 = -[HMDSiriEndpointProfileAssistant initWithService:]([HMDSiriEndpointProfileAssistant alloc], "initWithService:", v4);
      objc_msgSend(v22, "addObject:", v23);
      v24 = (void *)objc_msgSend(v22, "copy");
      -[HMDSiriEndpointProfile setAssistants:](self, "setAssistants:", v24);

LABEL_13:
    }

  }
}

- (void)setAssistants:(id)a3
{
  NSArray *v4;
  NSArray *assistants;
  id v6;

  v6 = a3;
  os_unfair_lock_lock_with_options();
  v4 = (NSArray *)objc_msgSend(v6, "copy");
  assistants = self->_assistants;
  self->_assistants = v4;

  os_unfair_lock_unlock(&self->_lock);
}

- (NSArray)assistants
{
  os_unfair_lock_s *p_lock;
  NSArray *v4;

  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  v4 = self->_assistants;
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (void)stageNeedsOnboarding:(int64_t)a3
{
  void *v5;
  void *v6;
  id v7;

  objc_msgSend(MEMORY[0x1E0D28678], "sharedPreferences");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "preferenceForKey:", CFSTR("siriProfileOnBoardingPendingTime"));
  v7 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "numberValue");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "doubleValue");
  -[HMDSiriEndpointProfile stageNeedsOnboarding:withTimeout:](self, "stageNeedsOnboarding:withTimeout:", a3);

}

- (void)stageNeedsOnboarding:(int64_t)a3 withTimeout:(double)a4
{
  void *v7;
  HMDSiriEndpointProfile *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  void *v14;
  __int16 v15;
  int64_t v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v7 = (void *)MEMORY[0x1D17BA0A0](self, a2);
  v8 = self;
  HMFGetOSLogHandle();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = 138543618;
    v14 = v10;
    v15 = 2048;
    v16 = a3;
    _os_log_impl(&dword_1CD062000, v9, OS_LOG_TYPE_INFO, "%{public}@Staging needsOnboarding: %ld", (uint8_t *)&v13, 0x16u);

  }
  objc_autoreleasePoolPop(v7);
  -[HMDSiriEndpointProfile stagedNeedsOnboarding](v8, "stagedNeedsOnboarding");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "stageValue:withTimeout:", v12, a4);

}

- (NSNumber)needsOnboarding
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;

  -[HMDAccessoryProfile accessory](self, "accessory");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v4 = v3;
  else
    v4 = 0;
  v5 = v4;

  if (!v5 || (objc_msgSend(v5, "needsOnboarding"), (v6 = (void *)objc_claimAutoreleasedReturnValue()) == 0))
  {
    -[HMDSiriEndpointProfile stagedNeedsOnboarding](self, "stagedNeedsOnboarding");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "value");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return (NSNumber *)v6;
}

- (NSNumber)activeIdentifier
{
  os_unfair_lock_s *p_lock;
  NSNumber *v4;

  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  v4 = self->_activeIdentifier;
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (void)setActiveIdentifier:(id)a3
{
  NSNumber *v4;
  NSNumber *activeIdentifier;
  id v6;

  v6 = a3;
  os_unfair_lock_lock_with_options();
  v4 = (NSNumber *)objc_msgSend(v6, "copy");
  activeIdentifier = self->_activeIdentifier;
  self->_activeIdentifier = v4;

  os_unfair_lock_unlock(&self->_lock);
}

- (BOOL)manuallyDisabled
{
  HMDSiriEndpointProfile *v2;
  os_unfair_lock_s *p_lock;

  v2 = self;
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  LOBYTE(v2) = v2->_manuallyDisabled;
  os_unfair_lock_unlock(p_lock);
  return (char)v2;
}

- (void)setManuallyDisabled:(BOOL)a3
{
  os_unfair_lock_s *p_lock;

  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  self->_manuallyDisabled = a3;
  os_unfair_lock_unlock(p_lock);
}

- (int64_t)multifunctionButton
{
  os_unfair_lock_s *p_lock;
  int64_t multifunctionButton;

  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  multifunctionButton = self->_multifunctionButton;
  os_unfair_lock_unlock(p_lock);
  return multifunctionButton;
}

- (void)setMultifunctionButton:(int64_t)a3
{
  os_unfair_lock_s *p_lock;

  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  self->_multifunctionButton = a3;
  os_unfair_lock_unlock(p_lock);
}

- (int64_t)siriEnable
{
  os_unfair_lock_s *p_lock;
  int64_t siriEnable;

  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  siriEnable = self->_siriEnable;
  os_unfair_lock_unlock(p_lock);
  return siriEnable;
}

- (void)setSiriEnable:(int64_t)a3
{
  os_unfair_lock_s *p_lock;

  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  self->_siriEnable = a3;
  os_unfair_lock_unlock(p_lock);
}

- (int64_t)siriListening
{
  os_unfair_lock_s *p_lock;
  int64_t siriListening;

  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  siriListening = self->_siriListening;
  os_unfair_lock_unlock(p_lock);
  return siriListening;
}

- (void)setSiriListening:(int64_t)a3
{
  os_unfair_lock_s *p_lock;

  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  self->_siriListening = a3;
  os_unfair_lock_unlock(p_lock);
}

- (int64_t)siriTouchToUse
{
  os_unfair_lock_s *p_lock;
  int64_t siriTouchToUse;

  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  siriTouchToUse = self->_siriTouchToUse;
  os_unfair_lock_unlock(p_lock);
  return siriTouchToUse;
}

- (void)setSiriTouchToUse:(int64_t)a3
{
  os_unfair_lock_s *p_lock;

  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  self->_siriTouchToUse = a3;
  os_unfair_lock_unlock(p_lock);
}

- (int64_t)siriLightOnUse
{
  os_unfair_lock_s *p_lock;
  int64_t siriLightOnUse;

  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  siriLightOnUse = self->_siriLightOnUse;
  os_unfair_lock_unlock(p_lock);
  return siriLightOnUse;
}

- (void)setSiriLightOnUse:(int64_t)a3
{
  os_unfair_lock_s *p_lock;

  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  self->_siriLightOnUse = a3;
  os_unfair_lock_unlock(p_lock);
}

- (int64_t)siriSoundOnUse
{
  return -1;
}

- (NSString)siriEngineVersion
{
  os_unfair_lock_s *p_lock;
  NSString *v4;

  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  v4 = self->_siriEngineVersion;
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (void)setSiriEngineVersion:(id)a3
{
  NSString *v4;
  NSString *siriEngineVersion;
  id v6;

  v6 = a3;
  os_unfair_lock_lock_with_options();
  v4 = (NSString *)objc_msgSend(v6, "copy");
  siriEngineVersion = self->_siriEngineVersion;
  self->_siriEngineVersion = v4;

  os_unfair_lock_unlock(&self->_lock);
}

- (void)_handleCharacteristicChanges:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  int v16;
  void *v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  id v27;
  id v28;
  void *v29;
  void *v30;
  char v31;
  void *v32;
  int v33;
  uint64_t v34;
  id v35;
  HMDSiriEndpointProfile *v36;
  NSObject *v37;
  void *v38;
  void *v39;
  int v40;
  id v41;
  void *v42;
  id v43;
  void *v44;
  int v45;
  id v46;
  void *v47;
  id v48;
  void *v49;
  int v50;
  id v51;
  void *v52;
  id v53;
  void *v54;
  int v55;
  id v56;
  void *v57;
  id v58;
  void *v59;
  int v60;
  id v61;
  void *v62;
  id v63;
  void *v64;
  int v65;
  id v66;
  void *v67;
  id v68;
  void *v69;
  int v70;
  id v71;
  void *v72;
  id v73;
  void *v74;
  int v75;
  id v76;
  void *v77;
  id v78;
  void *v79;
  int v80;
  id v81;
  void *v82;
  id v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t i;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t v91;
  uint64_t v92;
  id obj;
  uint64_t v94;
  uint64_t v95;
  uint64_t v96;
  id v97;
  uint64_t v98;
  id v99;
  id v100;
  uint64_t v101;
  id v102;
  HMDSiriEndpointProfile *v103;
  HMDSiriEndpointHAPSettings *v104;
  void *context;
  void *contexta;
  id v107;
  uint64_t v108;
  void *v109;
  void *v110;
  uint64_t v111;
  void *v112;
  __int128 v113;
  __int128 v114;
  __int128 v115;
  __int128 v116;
  id v117;
  __int128 v118;
  __int128 v119;
  __int128 v120;
  __int128 v121;
  __int128 v122;
  __int128 v123;
  __int128 v124;
  __int128 v125;
  __int128 v126;
  __int128 v127;
  __int128 v128;
  __int128 v129;
  uint8_t v130[128];
  uint8_t buf[4];
  id v132;
  __int16 v133;
  uint64_t v134;
  __int16 v135;
  id v136;
  _BYTE v137[128];
  _BYTE v138[128];
  _BYTE v139[128];
  uint64_t v140;

  v140 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v103 = self;
  -[HMDAccessoryProfile accessory](self, "accessory");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v6 = v5;
  else
    v6 = 0;
  v7 = v6;

  v104 = objc_alloc_init(HMDSiriEndpointHAPSettings);
  v8 = objc_alloc_init(MEMORY[0x1E0CB37F0]);
  v126 = 0u;
  v127 = 0u;
  v128 = 0u;
  v129 = 0u;
  obj = v4;
  v90 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v126, v139, 16);
  if (v90)
  {
    context = 0;
    v89 = *(_QWORD *)v127;
    v101 = *MEMORY[0x1E0CB8B28];
    v92 = *MEMORY[0x1E0CB8798];
    v102 = v7;
    v107 = v8;
    while (1)
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v127 != v89)
        {
          v10 = v9;
          objc_enumerationMutation(obj);
          v9 = v10;
        }
        v91 = v9;
        v95 = *(_QWORD *)(*((_QWORD *)&v126 + 1) + 8 * v9);
        objc_msgSend(v8, "numberFromString:", v89);
        v112 = (void *)objc_claimAutoreleasedReturnValue();
        v122 = 0u;
        v123 = 0u;
        v124 = 0u;
        v125 = 0u;
        -[HMDSiriEndpointProfile services](v103, "services");
        v97 = (id)objc_claimAutoreleasedReturnValue();
        v11 = objc_msgSend(v97, "countByEnumeratingWithState:objects:count:", &v122, v138, 16);
        if (v11)
        {
          v12 = v11;
          v13 = *(_QWORD *)v123;
          v94 = *(_QWORD *)v123;
          do
          {
            v14 = 0;
            v96 = v12;
            do
            {
              if (*(_QWORD *)v123 != v13)
                objc_enumerationMutation(v97);
              objc_msgSend(*(id *)(*((_QWORD *)&v122 + 1) + 8 * v14), "instanceID");
              v15 = (void *)objc_claimAutoreleasedReturnValue();
              v16 = HMFEqualObjects();

              if (v16)
              {
                v98 = v14;
                objc_msgSend(obj, "hmf_dictionaryForKey:", v95);
                v17 = (void *)objc_claimAutoreleasedReturnValue();
                v118 = 0u;
                v119 = 0u;
                v120 = 0u;
                v121 = 0u;
                v18 = v17;
                v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v118, v137, 16);
                if (!v19)
                  goto LABEL_95;
                v20 = v19;
                v111 = *(_QWORD *)v119;
                while (1)
                {
                  v21 = 0;
                  v108 = v20;
                  do
                  {
                    if (*(_QWORD *)v119 != v111)
                      objc_enumerationMutation(v18);
                    v22 = *(_QWORD *)(*((_QWORD *)&v118 + 1) + 8 * v21);
                    objc_msgSend(v8, "numberFromString:", v22);
                    v23 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v7, "findCharacteristic:forService:", v23, v112);
                    v24 = (void *)objc_claimAutoreleasedReturnValue();
                    if (v24)
                    {
                      objc_msgSend(v18, "hmf_dictionaryForKey:", v22);
                      v25 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v25, "hmf_dataForKey:", CFSTR("kCharacteristicErrorDataKey"));
                      v26 = (void *)objc_claimAutoreleasedReturnValue();
                      if (v26)
                      {
LABEL_43:

                        goto LABEL_44;
                      }
                      v27 = v18;
                      v28 = v7;
                      objc_msgSend(v25, "objectForKeyedSubscript:", CFSTR("kCharacteristicValue"));
                      v29 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(MEMORY[0x1E0C99E38], "null");
                      v30 = (void *)objc_claimAutoreleasedReturnValue();
                      v31 = objc_msgSend(v29, "isEqual:", v30);

                      if ((v31 & 1) != 0)
                      {
                        v109 = v29;
                        v7 = v28;
                        v18 = v27;
                        v8 = v107;
                        v20 = v108;

                        goto LABEL_43;
                      }
                      if (!v29)
                      {
                        v7 = v28;
                        v18 = v27;
                        v8 = v107;
                        v20 = v108;
                        goto LABEL_43;
                      }
                      v110 = v29;
                      objc_msgSend(v24, "type");
                      v32 = (void *)objc_claimAutoreleasedReturnValue();
                      v33 = objc_msgSend(v32, "isEqualToString:", CFSTR("00000254-0000-1000-8000-0026BB765291"));

                      if (v33)
                      {
                        v117 = 0;
                        +[HMDSiriEndpointSessionStateTLV parsedFromData:error:](HMDSiriEndpointSessionStateTLV, "parsedFromData:error:", v29, &v117);
                        v34 = objc_claimAutoreleasedReturnValue();
                        v35 = v117;

                        contexta = (void *)MEMORY[0x1D17BA0A0]();
                        v36 = v103;
                        HMFGetOSLogHandle();
                        v37 = objc_claimAutoreleasedReturnValue();
                        if (os_log_type_enabled(v37, OS_LOG_TYPE_DEBUG))
                        {
                          HMFGetLogIdentifier();
                          v99 = (id)objc_claimAutoreleasedReturnValue();
                          *(_DWORD *)buf = 138543874;
                          v132 = v99;
                          v133 = 2112;
                          v134 = v34;
                          v135 = 2112;
                          v136 = v35;
                          _os_log_impl(&dword_1CD062000, v37, OS_LOG_TYPE_DEBUG, "%{public}@Parsed HMDSiriEndpointSessionStateTLV: %@ with error: %@", buf, 0x20u);

                        }
                        objc_autoreleasePoolPop(contexta);
                        v7 = v102;
                        v38 = v35;
LABEL_40:
                        v18 = v27;
LABEL_41:
                        v20 = v108;
                      }
                      else
                      {
                        objc_msgSend(v24, "type");
                        v39 = (void *)objc_claimAutoreleasedReturnValue();
                        v40 = objc_msgSend(v39, "isEqualToString:", v101);

                        if (v40)
                        {
                          v41 = v29;
                          objc_opt_class();
                          if ((objc_opt_isKindOfClass() & 1) != 0)
                            v42 = v41;
                          else
                            v42 = 0;
                          v43 = v42;

                          v38 = v43;
                          -[HMDSiriEndpointHAPSettings setSiriEndpointVersion:](v104, "setSiriEndpointVersion:", v43);
                          v34 = (uint64_t)context;
                          v7 = v28;
                          goto LABEL_40;
                        }
                        objc_msgSend(v24, "type");
                        v44 = (void *)objc_claimAutoreleasedReturnValue();
                        v45 = objc_msgSend(v44, "isEqualToString:", CFSTR("00000255-0000-1000-8000-0026BB765291"));

                        v7 = v28;
                        if (v45)
                        {
                          v46 = v110;
                          objc_opt_class();
                          if ((objc_opt_isKindOfClass() & 1) != 0)
                            v47 = v46;
                          else
                            v47 = 0;
                          v48 = v47;

                          v38 = v48;
                          -[HMDSiriEndpointHAPSettings setSiriEnable:](v104, "setSiriEnable:", v48);
                          v34 = (uint64_t)context;
                          goto LABEL_40;
                        }
                        objc_msgSend(v24, "type");
                        v49 = (void *)objc_claimAutoreleasedReturnValue();
                        v50 = objc_msgSend(v49, "isEqualToString:", CFSTR("00000256-0000-1000-8000-0026BB765291"));

                        v18 = v27;
                        if (v50)
                        {
                          v51 = v110;
                          objc_opt_class();
                          if ((objc_opt_isKindOfClass() & 1) != 0)
                            v52 = v51;
                          else
                            v52 = 0;
                          v53 = v52;

                          v38 = v53;
                          -[HMDSiriEndpointHAPSettings setSiriListening:](v104, "setSiriListening:", v53);
                          v34 = (uint64_t)context;
                          goto LABEL_41;
                        }
                        objc_msgSend(v24, "type");
                        v54 = (void *)objc_claimAutoreleasedReturnValue();
                        v55 = objc_msgSend(v54, "isEqualToString:", CFSTR("00000257-0000-1000-8000-0026BB765291"));

                        v20 = v108;
                        if (v55)
                        {
                          v56 = v110;
                          objc_opt_class();
                          if ((objc_opt_isKindOfClass() & 1) != 0)
                            v57 = v56;
                          else
                            v57 = 0;
                          v58 = v57;

                          v38 = v58;
                          -[HMDSiriEndpointHAPSettings setSiriTouchToUse:](v104, "setSiriTouchToUse:", v58);
                        }
                        else
                        {
                          objc_msgSend(v24, "type");
                          v59 = (void *)objc_claimAutoreleasedReturnValue();
                          v60 = objc_msgSend(v59, "isEqualToString:", CFSTR("00000258-0000-1000-8000-0026BB765291"));

                          if (v60)
                          {
                            v61 = v110;
                            objc_opt_class();
                            if ((objc_opt_isKindOfClass() & 1) != 0)
                              v62 = v61;
                            else
                              v62 = 0;
                            v63 = v62;

                            v38 = v63;
                            -[HMDSiriEndpointHAPSettings setSiriLightOnUse:](v104, "setSiriLightOnUse:", v63);
                          }
                          else
                          {
                            objc_msgSend(v24, "type");
                            v64 = (void *)objc_claimAutoreleasedReturnValue();
                            v65 = objc_msgSend(v64, "isEqualToString:", CFSTR("0000025A-0000-1000-8000-0026BB765291"));

                            if (v65)
                            {
                              v66 = v110;
                              objc_opt_class();
                              if ((objc_opt_isKindOfClass() & 1) != 0)
                                v67 = v66;
                              else
                                v67 = 0;
                              v68 = v67;

                              v38 = v68;
                              -[HMDSiriEndpointHAPSettings setSiriEngineVersion:](v104, "setSiriEngineVersion:", v68);
                            }
                            else
                            {
                              objc_msgSend(v24, "type");
                              v69 = (void *)objc_claimAutoreleasedReturnValue();
                              v70 = objc_msgSend(v69, "isEqualToString:", v92);

                              if (v70)
                              {
                                v71 = v110;
                                objc_opt_class();
                                if ((objc_opt_isKindOfClass() & 1) != 0)
                                  v72 = v71;
                                else
                                  v72 = 0;
                                v73 = v72;

                                v38 = v73;
                                -[HMDSiriEndpointHAPSettings setActiveIdentifier:](v104, "setActiveIdentifier:", v73);
                              }
                              else
                              {
                                objc_msgSend(v24, "type");
                                v74 = (void *)objc_claimAutoreleasedReturnValue();
                                v75 = objc_msgSend(v74, "isEqualToString:", CFSTR("00000227-0000-1000-8000-0026BB765291"));

                                if (v75)
                                {
                                  v76 = v110;
                                  objc_opt_class();
                                  if ((objc_opt_isKindOfClass() & 1) != 0)
                                    v77 = v76;
                                  else
                                    v77 = 0;
                                  v78 = v77;

                                  v38 = v78;
                                  -[HMDSiriEndpointHAPSettings setManuallyDisabled:](v104, "setManuallyDisabled:", v78);
                                }
                                else
                                {
                                  objc_msgSend(v24, "type");
                                  v79 = (void *)objc_claimAutoreleasedReturnValue();
                                  v80 = objc_msgSend(v79, "isEqualToString:", CFSTR("0000026B-0000-1000-8000-0026BB765291"));

                                  if (!v80)
                                  {
                                    v115 = 0u;
                                    v116 = 0u;
                                    v113 = 0u;
                                    v114 = 0u;
                                    -[HMDSiriEndpointProfile assistants](v103, "assistants");
                                    v100 = (id)objc_claimAutoreleasedReturnValue();
                                    v84 = objc_msgSend(v100, "countByEnumeratingWithState:objects:count:", &v113, v130, 16);
                                    if (v84)
                                    {
                                      v85 = v84;
                                      v86 = *(_QWORD *)v114;
                                      do
                                      {
                                        for (i = 0; i != v85; ++i)
                                        {
                                          if (*(_QWORD *)v114 != v86)
                                            objc_enumerationMutation(v100);
                                          if (objc_msgSend(*(id *)(*((_QWORD *)&v113 + 1) + 8 * i), "updateCharacteristic:value:", v24, v110))-[HMDSiriEndpointHAPSettings setAssistantsUpdated:](v104, "setAssistantsUpdated:", 1);
                                        }
                                        v85 = objc_msgSend(v100, "countByEnumeratingWithState:objects:count:", &v113, v130, 16);
                                      }
                                      while (v85);
                                      v34 = (uint64_t)context;
                                      v7 = v102;
                                    }
                                    else
                                    {
                                      v34 = (uint64_t)context;
                                    }
                                    v38 = v100;
                                    goto LABEL_42;
                                  }
                                  v81 = v110;
                                  objc_opt_class();
                                  if ((objc_opt_isKindOfClass() & 1) != 0)
                                    v82 = v81;
                                  else
                                    v82 = 0;
                                  v83 = v82;

                                  v38 = v83;
                                  -[HMDSiriEndpointHAPSettings setMultifunctionButton:](v104, "setMultifunctionButton:", v83);
                                }
                              }
                            }
                          }
                        }
                        v34 = (uint64_t)context;
                      }
LABEL_42:

                      context = (void *)v34;
                      v8 = v107;

                      goto LABEL_43;
                    }
LABEL_44:

                    ++v21;
                  }
                  while (v21 != v20);
                  v88 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v118, v137, 16);
                  v20 = v88;
                  if (!v88)
                  {
LABEL_95:

                    v13 = v94;
                    v12 = v96;
                    v14 = v98;
                    break;
                  }
                }
              }
              ++v14;
            }
            while (v14 != v12);
            v12 = objc_msgSend(v97, "countByEnumeratingWithState:objects:count:", &v122, v138, 16);
          }
          while (v12);
        }

        v9 = v91 + 1;
      }
      while (v91 + 1 != v90);
      v90 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v126, v139, 16);
      if (!v90)
        goto LABEL_102;
    }
  }
  context = 0;
LABEL_102:

  -[HMDSiriEndpointProfile _updateSessionState:settings:message:](v103, "_updateSessionState:settings:message:", context, v104, 0);
}

- (void)handleHomeCharacteristicValuesChanged:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  _QWORD v15[5];
  id v16;
  _QWORD block[4];
  id v18;
  HMDSiriEndpointProfile *v19;

  v4 = a3;
  objc_msgSend(v4, "userInfo");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "hmf_arrayForKey:", CFSTR("kModifiedCharacteristicsKey"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v6, "count"))
  {
    -[HMDAccessoryProfile workQueue](self, "workQueue");
    v7 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __64__HMDSiriEndpointProfile_handleHomeCharacteristicValuesChanged___block_invoke;
    block[3] = &unk_1E89C2328;
    v18 = v6;
    v19 = self;
    dispatch_async(v7, block);

    v8 = v18;
  }
  else
  {
    objc_msgSend(v4, "userInfo");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "hmf_dictionaryForKey:", CFSTR("kModifiedCharacteristicsForAccessoryKey"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    -[HMDAccessoryProfile accessory](self, "accessory");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "uuid");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "UUIDString");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "hmf_dictionaryForKey:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    if (v13)
    {
      -[HMDAccessoryProfile workQueue](self, "workQueue");
      v14 = objc_claimAutoreleasedReturnValue();
      v15[0] = MEMORY[0x1E0C809B0];
      v15[1] = 3221225472;
      v15[2] = __64__HMDSiriEndpointProfile_handleHomeCharacteristicValuesChanged___block_invoke_2;
      v15[3] = &unk_1E89C2328;
      v15[4] = self;
      v16 = v13;
      dispatch_async(v14, v15);

    }
  }

}

- (void)handleAccessoryConfigured:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  -[HMDAccessoryProfile workQueue](self, "workQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __52__HMDSiriEndpointProfile_handleAccessoryConfigured___block_invoke;
  v7[3] = &unk_1E89C2328;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, v7);

}

- (void)handlePrimaryResidentChanged:(id)a3
{
  NSObject *v4;
  _QWORD block[5];

  -[HMDAccessoryProfile workQueue](self, "workQueue", a3);
  v4 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __55__HMDSiriEndpointProfile_handlePrimaryResidentChanged___block_invoke;
  block[3] = &unk_1E89C2730;
  block[4] = self;
  dispatch_async(v4, block);

}

- (void)handleDeviceCapabilitiesUpdated:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[4];
  id v8;
  HMDSiriEndpointProfile *v9;

  v4 = a3;
  -[HMDAccessoryProfile workQueue](self, "workQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __58__HMDSiriEndpointProfile_handleDeviceCapabilitiesUpdated___block_invoke;
  v7[3] = &unk_1E89C2328;
  v8 = v4;
  v9 = self;
  v6 = v4;
  dispatch_async(v5, v7);

}

- (void)updateNeedsOnboarding:(int64_t)a3 withTimeout:(double)a4
{
  -[HMDSiriEndpointProfile stageNeedsOnboarding:withTimeout:](self, "stageNeedsOnboarding:withTimeout:", a3, a4);
  -[HMDSiriEndpointProfile notifyClientsDidUpdateStagedNeedsOnboarding](self, "notifyClientsDidUpdateStagedNeedsOnboarding");
}

- (void)handleUpdateNeedsOnboarding:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  int v11;
  void *v12;
  HMDSiriEndpointProfile *v13;
  NSObject *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  uint64_t v22;
  uint64_t v23;
  int v24;
  void *v25;
  __int16 v26;
  void *v27;
  __int16 v28;
  void *v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "userInfo");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "hmf_UUIDForKey:", CFSTR("accessoryUUID"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[HMDAccessoryProfile accessory](self, "accessory");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v8 = v7;
  else
    v8 = 0;
  v9 = v8;

  if (v6)
  {
    if (v9)
    {
      objc_msgSend(v9, "uuid");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v10, "isEqual:", v6);

      if (v11)
      {
        v12 = (void *)MEMORY[0x1D17BA0A0]();
        v13 = self;
        HMFGetOSLogHandle();
        v14 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
        {
          HMFGetLogIdentifier();
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v4, "name");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v4, "userInfo");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          v24 = 138543874;
          v25 = v15;
          v26 = 2112;
          v27 = v16;
          v28 = 2112;
          v29 = v17;
          _os_log_impl(&dword_1CD062000, v14, OS_LOG_TYPE_INFO, "%{public}@Handling %@/%@", (uint8_t *)&v24, 0x20u);

        }
        objc_autoreleasePoolPop(v12);
        objc_msgSend(v4, "userInfo");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "objectForKeyedSubscript:", CFSTR("HMDSiriEndpointProfileNeedsOnboardingResultCodingKey"));
        v19 = (void *)objc_claimAutoreleasedReturnValue();

        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
          v20 = v19;
        else
          v20 = 0;
        v21 = v20;

        v22 = objc_msgSend(v21, "integerValue");
        if (v22 == 3)
          v23 = 1;
        else
          v23 = 2 * (v22 == 2);
        -[HMDSiriEndpointProfile stageNeedsOnboarding:](v13, "stageNeedsOnboarding:", v23);
        -[HMDSiriEndpointProfile notifyClientsDidUpdateStagedNeedsOnboarding](v13, "notifyClientsDidUpdateStagedNeedsOnboarding");
      }
    }
  }

}

- (void)handleEnableNotifications:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  HMDSiriEndpointProfile *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  int v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "numberForKey:", *MEMORY[0x1E0CB9BD8]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "numberForKey:", *MEMORY[0x1E0CB9BE8]);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "unsignedIntegerValue");

  if (!v5)
  {
    v8 = (void *)MEMORY[0x1D17BA0A0]();
    v9 = self;
    HMFGetOSLogHandle();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = 138543362;
      v14 = v11;
      _os_log_impl(&dword_1CD062000, v10, OS_LOG_TYPE_ERROR, "%{public}@[Profile Notifications] parameters not specific", (uint8_t *)&v13, 0xCu);

    }
    objc_autoreleasePoolPop(v8);
    objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", 3);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "respondWithError:", v12);

  }
  -[HMDSiriEndpointProfile setNotifications:options:](self, "setNotifications:options:", objc_msgSend(v5, "BOOLValue"), v7);
  objc_msgSend(v4, "respondWithSuccess");

}

- (void)stagedValue:(id)a3 didExpireValue:(id)a4
{
  id v6;
  id v7;
  id v8;
  void *v9;
  HMDSiriEndpointProfile *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  int v14;
  void *v15;
  __int16 v16;
  id v17;
  __int16 v18;
  id v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  -[HMDSiriEndpointProfile stagedNeedsOnboarding](self, "stagedNeedsOnboarding");
  v8 = (id)objc_claimAutoreleasedReturnValue();

  if (v8 == v6)
  {
    -[HMDSiriEndpointProfile stagedNeedsOnboarding](self, "stagedNeedsOnboarding");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "commitValue:", &unk_1E8B33558);

    -[HMDSiriEndpointProfile notifyClientsDidUpdateStagedNeedsOnboarding](self, "notifyClientsDidUpdateStagedNeedsOnboarding");
  }
  else
  {
    v9 = (void *)MEMORY[0x1D17BA0A0]();
    v10 = self;
    HMFGetOSLogHandle();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = 138543874;
      v15 = v12;
      v16 = 2112;
      v17 = v6;
      v18 = 2112;
      v19 = v7;
      _os_log_impl(&dword_1CD062000, v11, OS_LOG_TYPE_ERROR, "%{public}@Unknown stage value: %@ did expire value: %@", (uint8_t *)&v14, 0x20u);

    }
    objc_autoreleasePoolPop(v9);
  }

}

- (void)notifyClientsDidUpdateStagedNeedsOnboarding
{
  NSObject *v3;
  _QWORD block[5];

  -[HMDAccessoryProfile workQueue](self, "workQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __69__HMDSiriEndpointProfile_notifyClientsDidUpdateStagedNeedsOnboarding__block_invoke;
  block[3] = &unk_1E89C2730;
  block[4] = self;
  dispatch_async(v3, block);

}

- (void)_handleRefreshProfileState:(id)a3
{
  -[HMDSiriEndpointProfile _handleRefreshProfileState:completionHandler:](self, "_handleRefreshProfileState:completionHandler:", a3, 0);
}

- (void)_handleRefreshProfileState:(id)a3 completionHandler:(id)a4
{
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  HMDSiriEndpointProfile *v14;
  NSObject *v15;
  void *v16;
  id v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  HMDSiriEndpointProfile *v26;
  NSObject *v27;
  void *v28;
  void *v29;
  void *v30;
  HMDSiriEndpointProfile *v31;
  NSObject *v32;
  void *v33;
  void *v34;
  void *v35;
  HMDSiriEndpointProfile *v36;
  NSObject *v37;
  void *v38;
  void *v39;
  void *v40;
  HMDSiriEndpointProfile *v41;
  NSObject *v42;
  void *v43;
  void *v44;
  HMDSiriEndpointProfile *v45;
  NSObject *v46;
  void *v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t i;
  void *v51;
  void *v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t j;
  void *v56;
  void *v57;
  void *v58;
  HMDSiriEndpointProfile *v59;
  NSObject *v60;
  void *v61;
  void *v62;
  void *v63;
  HMDSiriEndpointProfile *v64;
  NSObject *v65;
  void *v66;
  void *v67;
  void *v68;
  HMDSiriEndpointProfile *v69;
  NSObject *v70;
  void *v71;
  void *v72;
  void *v73;
  HMDSiriEndpointProfile *v74;
  NSObject *v75;
  void *v76;
  void *v77;
  HMDSiriEndpointProfile *v78;
  NSObject *v79;
  void *v80;
  void *v81;
  uint64_t v82;
  void *v83;
  id obj;
  void (**v85)(void);
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  id v90;
  uint64_t v91;
  HMDSiriEndpointProfile *val;
  id v93;
  _QWORD v94[4];
  id v95;
  id v96;
  void (**v97)(void);
  id v98;
  __int128 v99;
  __int128 v100;
  __int128 v101;
  __int128 v102;
  __int128 v103;
  __int128 v104;
  __int128 v105;
  __int128 v106;
  __int128 v107;
  __int128 v108;
  __int128 v109;
  __int128 v110;
  _BYTE v111[128];
  _BYTE v112[128];
  _BYTE v113[128];
  _QWORD v114[2];
  uint8_t buf[4];
  void *v116;
  __int16 v117;
  HMDSiriEndpointProfile *v118;
  uint64_t v119;

  v119 = *MEMORY[0x1E0C80C00];
  v90 = a3;
  v85 = (void (**)(void))a4;
  val = self;
  -[HMDAccessoryProfile accessory](self, "accessory");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v7 = v6;
  else
    v7 = 0;
  v8 = v7;

  v83 = v8;
  if (v8)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", 3);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v90, "arrayForKey:", *MEMORY[0x1E0CB9C00]);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v10;
    if (v10)
    {
      v12 = v10;
    }
    else
    {
      v18 = *MEMORY[0x1E0CB9C30];
      v114[0] = *MEMORY[0x1E0CB9C10];
      v114[1] = v18;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v114, 2);
      v12 = (id)objc_claimAutoreleasedReturnValue();
    }
    v19 = v12;

    v109 = 0u;
    v110 = 0u;
    v107 = 0u;
    v108 = 0u;
    obj = v19;
    v89 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v107, v113, 16);
    if (v89)
    {
      v86 = *MEMORY[0x1E0CB9C10];
      v87 = *(_QWORD *)v108;
      v82 = *MEMORY[0x1E0CB9C30];
      do
      {
        v20 = 0;
        do
        {
          if (*(_QWORD *)v108 != v87)
          {
            v21 = v20;
            objc_enumerationMutation(obj);
            v20 = v21;
          }
          v91 = v20;
          v22 = *(void **)(*((_QWORD *)&v107 + 1) + 8 * v20);
          if (objc_msgSend(v22, "isEqual:", v86))
          {
            -[HMDSiriEndpointProfile _siriEndpointSessionStatusReadRequest](val, "_siriEndpointSessionStatusReadRequest");
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            if (v23)
            {
              objc_msgSend(v9, "addObject:", v23);
            }
            else
            {
              v25 = (void *)MEMORY[0x1D17BA0A0]();
              v26 = val;
              HMFGetOSLogHandle();
              v27 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
              {
                HMFGetLogIdentifier();
                v28 = (void *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = 138543362;
                v116 = v28;
                _os_log_impl(&dword_1CD062000, v27, OS_LOG_TYPE_ERROR, "%{public}@[Refreshing Profile State] siri endpoint session status is not available", buf, 0xCu);

              }
              objc_autoreleasePoolPop(v25);
            }
            -[HMDSiriEndpointProfile _siriEndpointVersionReadRequest](val, "_siriEndpointVersionReadRequest");
            v29 = (void *)objc_claimAutoreleasedReturnValue();

            if (v29)
            {
              objc_msgSend(v9, "addObject:", v29);
            }
            else
            {
              v30 = (void *)MEMORY[0x1D17BA0A0]();
              v31 = val;
              HMFGetOSLogHandle();
              v32 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
              {
                HMFGetLogIdentifier();
                v33 = (void *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = 138543362;
                v116 = v33;
                _os_log_impl(&dword_1CD062000, v32, OS_LOG_TYPE_ERROR, "%{public}@[Refreshing Profile State] siri endpoint version is not available", buf, 0xCu);

              }
              objc_autoreleasePoolPop(v30);
            }
            -[HMDSiriEndpointProfile _siriEndpointActiveIdentifierReadRequest](val, "_siriEndpointActiveIdentifierReadRequest");
            v34 = (void *)objc_claimAutoreleasedReturnValue();

            if (v34)
            {
              objc_msgSend(v9, "addObject:", v34);
            }
            else
            {
              v35 = (void *)MEMORY[0x1D17BA0A0]();
              v36 = val;
              HMFGetOSLogHandle();
              v37 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
              {
                HMFGetLogIdentifier();
                v38 = (void *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = 138543362;
                v116 = v38;
                _os_log_impl(&dword_1CD062000, v37, OS_LOG_TYPE_ERROR, "%{public}@[Refreshing Profile State] siri endpoint active identifier is not available", buf, 0xCu);

              }
              objc_autoreleasePoolPop(v35);
            }
            -[HMDSiriEndpointProfile _siriEndpointManuallyDisabledReadRequest](val, "_siriEndpointManuallyDisabledReadRequest");
            v39 = (void *)objc_claimAutoreleasedReturnValue();

            if (v39)
            {
              objc_msgSend(v9, "addObject:", v39);
            }
            else
            {
              v40 = (void *)MEMORY[0x1D17BA0A0]();
              v41 = val;
              HMFGetOSLogHandle();
              v42 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR))
              {
                HMFGetLogIdentifier();
                v43 = (void *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = 138543362;
                v116 = v43;
                _os_log_impl(&dword_1CD062000, v42, OS_LOG_TYPE_ERROR, "%{public}@[Refreshing Profile State] siri endpoint manually disable is not available", buf, 0xCu);

              }
              objc_autoreleasePoolPop(v40);
            }
            -[HMDSiriEndpointProfile _siriSettingMultifunctionButtonReadRequest](val, "_siriSettingMultifunctionButtonReadRequest");
            v88 = objc_claimAutoreleasedReturnValue();

            if (v88)
            {
              objc_msgSend(v9, "addObject:");
            }
            else
            {
              v44 = (void *)MEMORY[0x1D17BA0A0]();
              v45 = val;
              HMFGetOSLogHandle();
              v46 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v46, OS_LOG_TYPE_ERROR))
              {
                HMFGetLogIdentifier();
                v47 = (void *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = 138543362;
                v116 = v47;
                _os_log_impl(&dword_1CD062000, v46, OS_LOG_TYPE_ERROR, "%{public}@[Refreshing Profile State] siri endpoint multifunction button is not available", buf, 0xCu);

              }
              objc_autoreleasePoolPop(v44);
            }
            v105 = 0u;
            v106 = 0u;
            v103 = 0u;
            v104 = 0u;
            -[HMDSiriEndpointProfile assistants](val, "assistants");
            v93 = (id)objc_claimAutoreleasedReturnValue();
            v48 = objc_msgSend(v93, "countByEnumeratingWithState:objects:count:", &v103, v112, 16);
            if (v48)
            {
              v49 = *(_QWORD *)v104;
              do
              {
                for (i = 0; i != v48; ++i)
                {
                  if (*(_QWORD *)v104 != v49)
                    objc_enumerationMutation(v93);
                  v51 = *(void **)(*((_QWORD *)&v103 + 1) + 8 * i);
                  v99 = 0u;
                  v100 = 0u;
                  v101 = 0u;
                  v102 = 0u;
                  objc_msgSend(v51, "allCharacteristics");
                  v52 = (void *)objc_claimAutoreleasedReturnValue();
                  v53 = objc_msgSend(v52, "countByEnumeratingWithState:objects:count:", &v99, v111, 16);
                  if (v53)
                  {
                    v54 = *(_QWORD *)v100;
                    do
                    {
                      for (j = 0; j != v53; ++j)
                      {
                        if (*(_QWORD *)v100 != v54)
                          objc_enumerationMutation(v52);
                        +[HMDCharacteristicRequest requestWithCharacteristic:](HMDCharacteristicRequest, "requestWithCharacteristic:", *(_QWORD *)(*((_QWORD *)&v99 + 1) + 8 * j));
                        v56 = (void *)objc_claimAutoreleasedReturnValue();
                        if (v56)
                          objc_msgSend(v9, "addObject:", v56);

                      }
                      v53 = objc_msgSend(v52, "countByEnumeratingWithState:objects:count:", &v99, v111, 16);
                    }
                    while (v53);
                  }

                }
                v48 = objc_msgSend(v93, "countByEnumeratingWithState:objects:count:", &v103, v112, 16);
              }
              while (v48);
            }

            v57 = (void *)v88;
          }
          else
          {
            if (!objc_msgSend(v22, "isEqual:", v82))
              goto LABEL_87;
            -[HMDSiriEndpointProfile _siriSettingSiriEnableReadRequest](val, "_siriSettingSiriEnableReadRequest");
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            if (v24)
            {
              objc_msgSend(v9, "addObject:", v24);
            }
            else
            {
              v58 = (void *)MEMORY[0x1D17BA0A0]();
              v59 = val;
              HMFGetOSLogHandle();
              v60 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v60, OS_LOG_TYPE_ERROR))
              {
                HMFGetLogIdentifier();
                v61 = (void *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = 138543362;
                v116 = v61;
                _os_log_impl(&dword_1CD062000, v60, OS_LOG_TYPE_ERROR, "%{public}@[Refreshing Profile State] siri endpoint settings siri enable is not available", buf, 0xCu);

              }
              objc_autoreleasePoolPop(v58);
            }
            -[HMDSiriEndpointProfile _siriSettingSiriListeningReadRequest](val, "_siriSettingSiriListeningReadRequest");
            v62 = (void *)objc_claimAutoreleasedReturnValue();

            if (v62)
            {
              objc_msgSend(v9, "addObject:", v62);
            }
            else
            {
              v63 = (void *)MEMORY[0x1D17BA0A0]();
              v64 = val;
              HMFGetOSLogHandle();
              v65 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v65, OS_LOG_TYPE_ERROR))
              {
                HMFGetLogIdentifier();
                v66 = (void *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = 138543362;
                v116 = v66;
                _os_log_impl(&dword_1CD062000, v65, OS_LOG_TYPE_ERROR, "%{public}@[Refreshing Profile State] siri endpoint settings siri listening is not available", buf, 0xCu);

              }
              objc_autoreleasePoolPop(v63);
            }
            -[HMDSiriEndpointProfile _siriSettingSiriTouchReadRequest](val, "_siriSettingSiriTouchReadRequest");
            v67 = (void *)objc_claimAutoreleasedReturnValue();

            if (v67)
            {
              objc_msgSend(v9, "addObject:", v67);
            }
            else
            {
              v68 = (void *)MEMORY[0x1D17BA0A0]();
              v69 = val;
              HMFGetOSLogHandle();
              v70 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v70, OS_LOG_TYPE_ERROR))
              {
                HMFGetLogIdentifier();
                v71 = (void *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = 138543362;
                v116 = v71;
                _os_log_impl(&dword_1CD062000, v70, OS_LOG_TYPE_ERROR, "%{public}@[Refreshing Profile State] siri endpoint settings siri touch is not available", buf, 0xCu);

              }
              objc_autoreleasePoolPop(v68);
            }
            -[HMDSiriEndpointProfile _siriSettingSiriLightOnUseReadRequest](val, "_siriSettingSiriLightOnUseReadRequest");
            v72 = (void *)objc_claimAutoreleasedReturnValue();

            if (v72)
            {
              objc_msgSend(v9, "addObject:", v72);
            }
            else
            {
              v73 = (void *)MEMORY[0x1D17BA0A0]();
              v74 = val;
              HMFGetOSLogHandle();
              v75 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v75, OS_LOG_TYPE_ERROR))
              {
                HMFGetLogIdentifier();
                v76 = (void *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = 138543362;
                v116 = v76;
                _os_log_impl(&dword_1CD062000, v75, OS_LOG_TYPE_ERROR, "%{public}@[Refreshing Profile State] siri endpoint settings siri light on use is not available", buf, 0xCu);

              }
              objc_autoreleasePoolPop(v73);
            }
            -[HMDSiriEndpointProfile _siriSettingSiriEngineVersionReadRequest](val, "_siriSettingSiriEngineVersionReadRequest");
            v57 = (void *)objc_claimAutoreleasedReturnValue();

            if (v57)
            {
              objc_msgSend(v9, "addObject:", v57);
            }
            else
            {
              v77 = (void *)MEMORY[0x1D17BA0A0]();
              v78 = val;
              HMFGetOSLogHandle();
              v79 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v79, OS_LOG_TYPE_ERROR))
              {
                HMFGetLogIdentifier();
                v80 = (void *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = 138543362;
                v116 = v80;
                _os_log_impl(&dword_1CD062000, v79, OS_LOG_TYPE_ERROR, "%{public}@[Refreshing Profile State] siri endpoint settings siri engine is not available", buf, 0xCu);

              }
              objc_autoreleasePoolPop(v77);
              v57 = 0;
            }
          }

LABEL_87:
          v20 = v91 + 1;
        }
        while (v91 + 1 != v89);
        v89 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v107, v113, 16);
      }
      while (v89);
    }

    objc_initWeak((id *)buf, val);
    -[HMDAccessoryProfile workQueue](val, "workQueue");
    v81 = (void *)objc_claimAutoreleasedReturnValue();
    v94[0] = MEMORY[0x1E0C809B0];
    v94[1] = 3221225472;
    v94[2] = __71__HMDSiriEndpointProfile__handleRefreshProfileState_completionHandler___block_invoke;
    v94[3] = &unk_1E89B1720;
    objc_copyWeak(&v98, (id *)buf);
    v17 = v9;
    v95 = v17;
    v96 = v90;
    v97 = v85;
    objc_msgSend(v83, "readCharacteristicValues:source:queue:completionHandler:", v17, 7, v81, v94);

    objc_destroyWeak(&v98);
    objc_destroyWeak((id *)buf);

  }
  else
  {
    v13 = (void *)MEMORY[0x1D17BA0A0]();
    v14 = val;
    HMFGetOSLogHandle();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v116 = v16;
      v117 = 2112;
      v118 = v14;
      _os_log_impl(&dword_1CD062000, v15, OS_LOG_TYPE_ERROR, "%{public}@[Refreshing Profile] accessory not part of profile (%@)", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v13);
    objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", 4);
    v17 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v90, "respondWithError:", v17);
    if (v85)
      v85[2]();
  }

}

- (void)_notifyProfileSettingsUpdated:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  if (objc_msgSend(v5, "count"))
  {
    -[HMDSiriEndpointProfile notificationCenter](self, "notificationCenter");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "postNotificationName:object:userInfo:", CFSTR("HMDSiriEndpointProfileSettingsUpdatedNotification"), self, v5);

  }
}

- (void)_updateSessionState:(id)a3 settings:(id)a4 message:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  unint64_t v13;
  uint64_t v14;
  void *v15;
  HMDSiriEndpointProfile *v16;
  NSObject *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  char v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  void *v35;
  void *v36;
  void *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  void *v41;
  void *v42;
  void *v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  void *v47;
  void *v48;
  void *v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  char v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  uint64_t v65;
  void *v66;
  void *v67;
  void *v68;
  char v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  int v75;
  int v76;
  void *v77;
  void *v78;
  void *v79;
  void *v80;
  void *v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  void *v85;
  void *v86;
  void *v87;
  void *v88;
  uint64_t v89;
  void *v90;
  HMDSiriEndpointProfile *v91;
  NSObject *v92;
  _BOOL4 v93;
  id v94;
  void *v95;
  id v96;
  void *v97;
  void *v98;
  void *v99;
  uint64_t v100;
  void *v101;
  void *v102;
  void *v103;
  void *v104;
  void *v105;
  void *v106;
  void *v107;
  id v108;
  id v109;
  void *v110;
  uint8_t buf[4];
  void *v112;
  __int16 v113;
  void *v114;
  uint64_t v115;

  v115 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v109 = a5;
  v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", 12);
  v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", 6);
  v110 = v11;
  if (v8)
  {
    objc_msgSend(v8, "sessionState");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "value");
    if (v13 >= 4)
      v14 = -1;
    else
      v14 = v13;

    if (v14 != -[HMDSiriEndpointProfile sessionState](self, "sessionState"))
    {
      v108 = v8;
      v15 = (void *)MEMORY[0x1D17BA0A0]();
      v16 = self;
      HMFGetOSLogHandle();
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        HMSiriEndpointProfileSessionStateTypeToString();
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v112 = v18;
        v113 = 2112;
        v114 = v19;
        _os_log_impl(&dword_1CD062000, v17, OS_LOG_TYPE_INFO, "%{public}@Updating session state: %@", buf, 0x16u);

      }
      objc_autoreleasePoolPop(v15);
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", -[HMDSiriEndpointProfile sessionState](v16, "sessionState"));
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = v110;
      objc_msgSend(v110, "setValue:forKey:", v20, CFSTR("HMDSiriEndpointProfilePreviousSessionStateKey"));

      v8 = v108;
    }
    -[HMDSiriEndpointProfile setSessionState:](self, "setSessionState:", v14);
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", -[HMDSiriEndpointProfile sessionState](self, "sessionState"));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setValue:forKey:", v21, *MEMORY[0x1E0CB9C20]);

    objc_msgSend(v8, "hubUUID");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDSiriEndpointProfile sessionHubIdentifier](self, "sessionHubIdentifier");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = HMFEqualObjects();

    if ((v24 & 1) == 0)
    {
      -[HMDSiriEndpointProfile sessionHubIdentifier](self, "sessionHubIdentifier");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "UUIDString");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "setValue:forKey:", v26, CFSTR("HMDSiriEndpointProfilePreviousSessionHubIdentiferKey"));

    }
    -[HMDSiriEndpointProfile setSessionHubIdentifier:](self, "setSessionHubIdentifier:", v22);
    -[HMDSiriEndpointProfile sessionHubIdentifier](self, "sessionHubIdentifier");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "UUIDString");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setValue:forKey:", v28, *MEMORY[0x1E0CB9C18]);

  }
  v29 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", 5);
  if (v9)
  {
    objc_msgSend(v9, "siriEnable");
    v30 = (void *)objc_claimAutoreleasedReturnValue();

    if (v30)
    {
      objc_msgSend(v9, "siriEnable");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      v32 = objc_msgSend(v31, "integerValue");
      v33 = v32 == 1 ? 1 : -1;
      v34 = v32 ? v33 : 0;

      if (-[HMDSiriEndpointProfile siriEnable](self, "siriEnable") != v34)
      {
        -[HMDSiriEndpointProfile setSiriEnable:](self, "setSiriEnable:", v34);
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", -[HMDSiriEndpointProfile siriEnable](self, "siriEnable"));
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v29, "setValue:forKey:", v35, CFSTR("settings-enable"));

      }
    }
    objc_msgSend(v9, "siriListening");
    v36 = (void *)objc_claimAutoreleasedReturnValue();

    if (v36)
    {
      objc_msgSend(v9, "siriListening");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      v38 = objc_msgSend(v37, "integerValue");
      v39 = v38 == 1 ? 1 : -1;
      v40 = v38 ? v39 : 0;

      if (-[HMDSiriEndpointProfile siriListening](self, "siriListening") != v40)
      {
        -[HMDSiriEndpointProfile setSiriListening:](self, "setSiriListening:", v40);
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", -[HMDSiriEndpointProfile siriListening](self, "siriListening"));
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v29, "setValue:forKey:", v41, CFSTR("settings-listening"));

      }
    }
    objc_msgSend(v9, "siriTouchToUse");
    v42 = (void *)objc_claimAutoreleasedReturnValue();

    if (v42)
    {
      objc_msgSend(v9, "siriTouchToUse");
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      v44 = objc_msgSend(v43, "integerValue");
      v45 = v44 == 1 ? 1 : -1;
      v46 = v44 ? v45 : 0;

      if (-[HMDSiriEndpointProfile siriTouchToUse](self, "siriTouchToUse") != v46)
      {
        -[HMDSiriEndpointProfile setSiriTouchToUse:](self, "setSiriTouchToUse:", v46);
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", -[HMDSiriEndpointProfile siriTouchToUse](self, "siriTouchToUse"));
        v47 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v29, "setValue:forKey:", v47, CFSTR("settings-touch"));

      }
    }
    objc_msgSend(v9, "siriLightOnUse");
    v48 = (void *)objc_claimAutoreleasedReturnValue();

    if (v48)
    {
      objc_msgSend(v9, "siriLightOnUse");
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      v50 = objc_msgSend(v49, "integerValue");
      v51 = v50 == 1 ? 1 : -1;
      v52 = v50 ? v51 : 0;

      if (-[HMDSiriEndpointProfile siriLightOnUse](self, "siriLightOnUse") != v52)
      {
        -[HMDSiriEndpointProfile setSiriLightOnUse:](self, "setSiriLightOnUse:", v52);
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", -[HMDSiriEndpointProfile siriLightOnUse](self, "siriLightOnUse"));
        v53 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v29, "setValue:forKey:", v53, CFSTR("settings-light"));

      }
    }
    objc_msgSend(v9, "siriEndpointVersion");
    v54 = (void *)objc_claimAutoreleasedReturnValue();

    if (v54)
    {
      objc_msgSend(v9, "siriEndpointVersion");
      v55 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMDSiriEndpointProfile setSiriEndpointVersion:](self, "setSiriEndpointVersion:", v55);

      -[HMDSiriEndpointProfile siriEndpointVersion](self, "siriEndpointVersion");
      v56 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "setValue:forKey:", v56, *MEMORY[0x1E0CB9C48]);

    }
    objc_msgSend(v9, "siriEngineVersion");
    v57 = (void *)objc_claimAutoreleasedReturnValue();

    if (v57)
    {
      objc_msgSend(v9, "siriEngineVersion");
      v58 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMDSiriEndpointProfile siriEngineVersion](self, "siriEngineVersion");
      v59 = (void *)objc_claimAutoreleasedReturnValue();
      v60 = HMFEqualObjects();

      if ((v60 & 1) == 0)
      {
        -[HMDSiriEndpointProfile siriEngineVersion](self, "siriEngineVersion");
        v61 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "setValue:forKey:", v61, CFSTR("HMDSiriEndpointProfilePreviousSiriEngineVersionKey"));

      }
      objc_msgSend(v9, "siriEngineVersion");
      v62 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMDSiriEndpointProfile setSiriEngineVersion:](self, "setSiriEngineVersion:", v62);

      -[HMDSiriEndpointProfile siriEngineVersion](self, "siriEngineVersion");
      v63 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "setValue:forKey:", v63, *MEMORY[0x1E0CB9C38]);

    }
    objc_msgSend(v9, "activeIdentifier");
    v64 = (void *)objc_claimAutoreleasedReturnValue();

    if (v64)
    {
      -[HMDSiriEndpointProfile activeIdentifier](self, "activeIdentifier");
      v65 = objc_claimAutoreleasedReturnValue();
      if (v65)
      {
        v66 = (void *)v65;
        objc_msgSend(v9, "activeIdentifier");
        v67 = (void *)objc_claimAutoreleasedReturnValue();
        -[HMDSiriEndpointProfile activeIdentifier](self, "activeIdentifier");
        v68 = (void *)objc_claimAutoreleasedReturnValue();
        v69 = HMFEqualObjects();

        if ((v69 & 1) == 0)
        {
          -[HMDSiriEndpointProfile activeIdentifier](self, "activeIdentifier");
          v70 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v110, "setValue:forKey:", v70, CFSTR("HMDSiriEndpointProfilePreviousActiveIdentifierKey"));

        }
      }
      objc_msgSend(v9, "activeIdentifier");
      v71 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMDSiriEndpointProfile setActiveIdentifier:](self, "setActiveIdentifier:", v71);

      -[HMDSiriEndpointProfile activeIdentifier](self, "activeIdentifier");
      v72 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "setValue:forKey:", v72, *MEMORY[0x1E0CB9BA8]);

      v11 = v110;
    }
    objc_msgSend(v9, "manuallyDisabled");
    v73 = (void *)objc_claimAutoreleasedReturnValue();

    if (v73)
    {
      objc_msgSend(v9, "manuallyDisabled");
      v74 = (void *)objc_claimAutoreleasedReturnValue();
      v75 = objc_msgSend(v74, "BOOLValue");
      v76 = -[HMDSiriEndpointProfile manuallyDisabled](self, "manuallyDisabled");

      if (v75 != v76)
      {
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[HMDSiriEndpointProfile manuallyDisabled](self, "manuallyDisabled"));
        v77 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "setValue:forKey:", v77, CFSTR("HMDSiriEndpointProfilePreviousManuallyDisabledKey"));

      }
      objc_msgSend(v9, "manuallyDisabled");
      v78 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMDSiriEndpointProfile setManuallyDisabled:](self, "setManuallyDisabled:", objc_msgSend(v78, "BOOLValue"));

      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[HMDSiriEndpointProfile manuallyDisabled](self, "manuallyDisabled"));
      v79 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "setValue:forKey:", v79, *MEMORY[0x1E0CB9BF0]);

    }
    objc_msgSend(v9, "multifunctionButton");
    v80 = (void *)objc_claimAutoreleasedReturnValue();

    if (v80)
    {
      objc_msgSend(v9, "multifunctionButton");
      v81 = (void *)objc_claimAutoreleasedReturnValue();
      v82 = objc_msgSend(v81, "integerValue");
      if (v82 == 1)
        v83 = 1;
      else
        v83 = -1;
      if (v82)
        v84 = v83;
      else
        v84 = 0;

      if (v84 != -[HMDSiriEndpointProfile multifunctionButton](self, "multifunctionButton"))
      {
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", -[HMDSiriEndpointProfile multifunctionButton](self, "multifunctionButton"));
        v85 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "setValue:forKey:", v85, CFSTR("HMDSiriEndpointProfilePreviousMultifunctionButtonKey"));

      }
      -[HMDSiriEndpointProfile setMultifunctionButton:](self, "setMultifunctionButton:", v84);
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", -[HMDSiriEndpointProfile multifunctionButton](self, "multifunctionButton"));
      v86 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "setValue:forKey:", v86, *MEMORY[0x1E0CB9BF8]);

    }
    if (objc_msgSend(v9, "assistantsUpdated"))
    {
      -[HMDSiriEndpointProfile assistants](self, "assistants");
      v87 = (void *)objc_claimAutoreleasedReturnValue();
      encodeRootObjectForIncomingXPCMessage(v87, 0);
      v88 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "setValue:forKey:", v88, *MEMORY[0x1E0CB9BC8]);

    }
  }
  v89 = objc_msgSend(v10, "count");
  v90 = (void *)MEMORY[0x1D17BA0A0]();
  v91 = self;
  HMFGetOSLogHandle();
  v92 = objc_claimAutoreleasedReturnValue();
  v93 = os_log_type_enabled(v92, OS_LOG_TYPE_INFO);
  if (v89)
  {
    v94 = v8;
    if (v93)
    {
      HMFGetLogIdentifier();
      v95 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v112 = v95;
      v113 = 2112;
      v114 = v10;
      _os_log_impl(&dword_1CD062000, v92, OS_LOG_TYPE_INFO, "%{public}@Notifying XPC clients of updated profile state: %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v90);
    v96 = objc_alloc(MEMORY[0x1E0D285D8]);
    -[HMDAccessoryProfile uniqueIdentifier](v91, "uniqueIdentifier");
    v97 = (void *)objc_claimAutoreleasedReturnValue();
    v98 = (void *)objc_msgSend(v96, "initWithTarget:", v97);

    v99 = (void *)MEMORY[0x1E0D285F8];
    v100 = *MEMORY[0x1E0CB9C40];
    v101 = (void *)objc_msgSend(v10, "copy");
    objc_msgSend(v99, "messageWithName:destination:payload:", v100, v98, v101);
    v102 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v109, "identifier");
    v103 = (void *)objc_claimAutoreleasedReturnValue();
    if (v103)
      objc_msgSend(v102, "setIdentifier:", v103);
    objc_msgSend(v102, "setRequiresSPIEntitlement");
    -[HMDAccessoryProfile msgDispatcher](v91, "msgDispatcher");
    v104 = (void *)objc_claimAutoreleasedReturnValue();
    v105 = (void *)objc_msgSend(v102, "copy");
    objc_msgSend(v104, "sendMessage:completionHandler:", v105, 0);

    v8 = v94;
  }
  else
  {
    if (v93)
    {
      HMFGetLogIdentifier();
      v106 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v112 = v106;
      _os_log_impl(&dword_1CD062000, v92, OS_LOG_TYPE_INFO, "%{public}@No changes, not notifying XPC clients", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v90);
  }
  if (objc_msgSend(v110, "count"))
  {
    -[HMDSiriEndpointProfile notificationCenter](v91, "notificationCenter");
    v107 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v107, "postNotificationName:object:userInfo:", CFSTR("HMDSiriEndpointProfileUpdatedNotification"), v91, v110);

  }
  -[HMDSiriEndpointProfile _notifyProfileSettingsUpdated:](v91, "_notifyProfileSettingsUpdated:", v29);

}

- (unint64_t)_capability
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  _BOOL8 v7;
  unint64_t v8;

  -[HMDAccessoryProfile accessory](self, "accessory");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v4 = v3;
  else
    v4 = 0;
  v5 = v4;

  if (v5)
  {
    -[HMDSiriEndpointProfile needsOnboarding](self, "needsOnboarding");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "integerValue") == 0;

    if (objc_msgSend(v5, "supportsSiriEndpointOnBoarding"))
      v8 = v7 | 2;
    else
      v8 = v7;
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (id)attributeDescriptions
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v11[3];

  v11[2] = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc(MEMORY[0x1E0D28548]);
  -[HMDAccessoryProfile uniqueIdentifier](self, "uniqueIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v3, "initWithName:value:", CFSTR("uniqueIdentifier"), v4);
  v11[0] = v5;
  v6 = objc_alloc(MEMORY[0x1E0D28548]);
  -[HMDSiriEndpointProfile sessionState](self, "sessionState");
  HMSiriEndpointProfileSessionStateTypeToString();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v6, "initWithName:value:", CFSTR("sessionState"), v7);
  v11[1] = v8;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v11, 2);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  unint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  objc_super v15;

  v15.receiver = self;
  v15.super_class = (Class)HMDSiriEndpointProfile;
  v4 = a3;
  -[HMDAccessoryProfile encodeWithCoder:](&v15, sel_encodeWithCoder_, v4);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", -[HMDSiriEndpointProfile sessionState](self, "sessionState", v15.receiver, v15.super_class));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, *MEMORY[0x1E0CB9C20]);

  -[HMDSiriEndpointProfile sessionHubIdentifier](self, "sessionHubIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "UUIDString");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, *MEMORY[0x1E0CB9C18]);

  -[HMDSiriEndpointProfile siriEndpointVersion](self, "siriEndpointVersion");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v8, *MEMORY[0x1E0CB9C48]);

  v9 = -[HMDSiriEndpointProfile _capability](self, "_capability");
  objc_msgSend(v4, "encodeInteger:forKey:", v9, *MEMORY[0x1E0CB9BD0]);
  -[HMDSiriEndpointProfile siriEngineVersion](self, "siriEngineVersion");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v10, *MEMORY[0x1E0CB9C38]);

  -[HMDSiriEndpointProfile activeIdentifier](self, "activeIdentifier");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v11, *MEMORY[0x1E0CB9BA8]);

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[HMDSiriEndpointProfile manuallyDisabled](self, "manuallyDisabled"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v12, *MEMORY[0x1E0CB9BF0]);

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", -[HMDSiriEndpointProfile multifunctionButton](self, "multifunctionButton"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v13, *MEMORY[0x1E0CB9BF8]);

  -[HMDSiriEndpointProfile assistants](self, "assistants");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v14, *MEMORY[0x1E0CB9BC8]);

}

- (void)setEnable:(int64_t)a3 completionHandler:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  HMDSiriEndpointProfile *v19;
  NSObject *v20;
  void *v21;
  void *v22;
  HMDSiriEndpointProfile *v23;
  NSObject *v24;
  void *v25;
  _QWORD v26[4];
  id v27;
  id v28;
  id v29[2];
  void *v30;
  id location[4];

  location[3] = *(id *)MEMORY[0x1E0C80C00];
  v6 = a4;
  if ((unint64_t)a3 < 2)
  {
    -[HMDAccessoryProfile accessory](self, "accessory");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v9 = v8;
    else
      v9 = 0;
    v10 = v9;

    if (v10)
    {
      -[HMDSiriEndpointProfile _siriSettingSiriEnableCharacteristic](self, "_siriSettingSiriEnableCharacteristic");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v11)
        goto LABEL_12;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3 == 1);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "authorizationData");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      +[HMDCharacteristicWriteRequest writeRequestWithCharacteristic:value:authorizationData:type:](HMDCharacteristicWriteRequest, "writeRequestWithCharacteristic:value:authorizationData:type:", v11, v12, v13, 0);
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      if (v14)
      {
        objc_initWeak(location, self);
        v30 = v14;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v30, 1);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        -[HMDAccessoryProfile workQueue](self, "workQueue");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v26[0] = MEMORY[0x1E0C809B0];
        v26[1] = 3221225472;
        v26[2] = __54__HMDSiriEndpointProfile_setEnable_completionHandler___block_invoke;
        v26[3] = &unk_1E89BBFB0;
        objc_copyWeak(v29, location);
        v17 = v14;
        v27 = v17;
        v28 = v6;
        v29[1] = (id)a3;
        objc_msgSend(v10, "writeCharacteristicValues:source:queue:completionHandler:", v15, 7, v16, v26);

        objc_destroyWeak(v29);
        objc_destroyWeak(location);
      }
      else
      {
LABEL_12:
        v18 = (void *)MEMORY[0x1D17BA0A0]();
        v19 = self;
        HMFGetOSLogHandle();
        v20 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
        {
          HMFGetLogIdentifier();
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          LODWORD(location[0]) = 138543362;
          *(id *)((char *)location + 4) = v21;
          _os_log_impl(&dword_1CD062000, v20, OS_LOG_TYPE_ERROR, "%{public}@[Set Enable] failed to create siri enable write request", (uint8_t *)location, 0xCu);

        }
        objc_autoreleasePoolPop(v18);
        objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", 2);
        v17 = (id)objc_claimAutoreleasedReturnValue();
        if (v6)
          (*((void (**)(id, id))v6 + 2))(v6, v17);
      }

    }
    else
    {
      v22 = (void *)MEMORY[0x1D17BA0A0]();
      v23 = self;
      HMFGetOSLogHandle();
      v24 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        LODWORD(location[0]) = 138543362;
        *(id *)((char *)location + 4) = v25;
        _os_log_impl(&dword_1CD062000, v24, OS_LOG_TYPE_ERROR, "%{public}@[Set Enable] accessory not part of profile", (uint8_t *)location, 0xCu);

      }
      objc_autoreleasePoolPop(v22);
      objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", 4);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      if (v6)
        (*((void (**)(id, void *))v6 + 2))(v6, v11);
    }

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", 3);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
      (*((void (**)(id, void *))v6 + 2))(v6, v7);

  }
}

- (void)setListening:(int64_t)a3 completionHandler:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  HMDSiriEndpointProfile *v19;
  NSObject *v20;
  void *v21;
  void *v22;
  HMDSiriEndpointProfile *v23;
  NSObject *v24;
  void *v25;
  _QWORD v26[4];
  id v27;
  id v28;
  id v29[2];
  void *v30;
  id location[4];

  location[3] = *(id *)MEMORY[0x1E0C80C00];
  v6 = a4;
  if ((unint64_t)a3 < 2)
  {
    -[HMDAccessoryProfile accessory](self, "accessory");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v9 = v8;
    else
      v9 = 0;
    v10 = v9;

    if (v10)
    {
      -[HMDSiriEndpointProfile _siriSettingSiriListeningCharacteristic](self, "_siriSettingSiriListeningCharacteristic");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v11)
        goto LABEL_12;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3 == 1);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "authorizationData");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      +[HMDCharacteristicWriteRequest writeRequestWithCharacteristic:value:authorizationData:type:](HMDCharacteristicWriteRequest, "writeRequestWithCharacteristic:value:authorizationData:type:", v11, v12, v13, 0);
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      if (v14)
      {
        objc_initWeak(location, self);
        v30 = v14;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v30, 1);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        -[HMDAccessoryProfile workQueue](self, "workQueue");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v26[0] = MEMORY[0x1E0C809B0];
        v26[1] = 3221225472;
        v26[2] = __57__HMDSiriEndpointProfile_setListening_completionHandler___block_invoke;
        v26[3] = &unk_1E89BBFB0;
        objc_copyWeak(v29, location);
        v17 = v14;
        v27 = v17;
        v28 = v6;
        v29[1] = (id)a3;
        objc_msgSend(v10, "writeCharacteristicValues:source:queue:completionHandler:", v15, 7, v16, v26);

        objc_destroyWeak(v29);
        objc_destroyWeak(location);
      }
      else
      {
LABEL_12:
        v18 = (void *)MEMORY[0x1D17BA0A0]();
        v19 = self;
        HMFGetOSLogHandle();
        v20 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
        {
          HMFGetLogIdentifier();
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          LODWORD(location[0]) = 138543362;
          *(id *)((char *)location + 4) = v21;
          _os_log_impl(&dword_1CD062000, v20, OS_LOG_TYPE_ERROR, "%{public}@[Set Listening] failed to create siri enable write request", (uint8_t *)location, 0xCu);

        }
        objc_autoreleasePoolPop(v18);
        objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", 2);
        v17 = (id)objc_claimAutoreleasedReturnValue();
        if (v6)
          (*((void (**)(id, id))v6 + 2))(v6, v17);
      }

    }
    else
    {
      v22 = (void *)MEMORY[0x1D17BA0A0]();
      v23 = self;
      HMFGetOSLogHandle();
      v24 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        LODWORD(location[0]) = 138543362;
        *(id *)((char *)location + 4) = v25;
        _os_log_impl(&dword_1CD062000, v24, OS_LOG_TYPE_ERROR, "%{public}@[Set Listening] accessory not part of profile", (uint8_t *)location, 0xCu);

      }
      objc_autoreleasePoolPop(v22);
      objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", 4);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      if (v6)
        (*((void (**)(id, void *))v6 + 2))(v6, v11);
    }

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", 3);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
      (*((void (**)(id, void *))v6 + 2))(v6, v7);

  }
}

- (void)setTouchToUse:(int64_t)a3 completionHandler:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  HMDSiriEndpointProfile *v19;
  NSObject *v20;
  void *v21;
  void *v22;
  HMDSiriEndpointProfile *v23;
  NSObject *v24;
  void *v25;
  _QWORD v26[4];
  id v27;
  id v28;
  id v29[2];
  void *v30;
  id location[4];

  location[3] = *(id *)MEMORY[0x1E0C80C00];
  v6 = a4;
  if ((unint64_t)a3 < 2)
  {
    -[HMDAccessoryProfile accessory](self, "accessory");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v9 = v8;
    else
      v9 = 0;
    v10 = v9;

    if (v10)
    {
      -[HMDSiriEndpointProfile _siriSettingSiriTouchCharacteristic](self, "_siriSettingSiriTouchCharacteristic");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v11)
        goto LABEL_12;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3 == 1);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "authorizationData");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      +[HMDCharacteristicWriteRequest writeRequestWithCharacteristic:value:authorizationData:type:](HMDCharacteristicWriteRequest, "writeRequestWithCharacteristic:value:authorizationData:type:", v11, v12, v13, 0);
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      if (v14)
      {
        objc_initWeak(location, self);
        v30 = v14;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v30, 1);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        -[HMDAccessoryProfile workQueue](self, "workQueue");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v26[0] = MEMORY[0x1E0C809B0];
        v26[1] = 3221225472;
        v26[2] = __58__HMDSiriEndpointProfile_setTouchToUse_completionHandler___block_invoke;
        v26[3] = &unk_1E89BBFB0;
        objc_copyWeak(v29, location);
        v17 = v14;
        v27 = v17;
        v28 = v6;
        v29[1] = (id)a3;
        objc_msgSend(v10, "writeCharacteristicValues:source:queue:completionHandler:", v15, 7, v16, v26);

        objc_destroyWeak(v29);
        objc_destroyWeak(location);
      }
      else
      {
LABEL_12:
        v18 = (void *)MEMORY[0x1D17BA0A0]();
        v19 = self;
        HMFGetOSLogHandle();
        v20 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
        {
          HMFGetLogIdentifier();
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          LODWORD(location[0]) = 138543362;
          *(id *)((char *)location + 4) = v21;
          _os_log_impl(&dword_1CD062000, v20, OS_LOG_TYPE_ERROR, "%{public}@[Set Touch To Use] failed to create siri enable write request", (uint8_t *)location, 0xCu);

        }
        objc_autoreleasePoolPop(v18);
        objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", 2);
        v17 = (id)objc_claimAutoreleasedReturnValue();
        if (v6)
          (*((void (**)(id, id))v6 + 2))(v6, v17);
      }

    }
    else
    {
      v22 = (void *)MEMORY[0x1D17BA0A0]();
      v23 = self;
      HMFGetOSLogHandle();
      v24 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        LODWORD(location[0]) = 138543362;
        *(id *)((char *)location + 4) = v25;
        _os_log_impl(&dword_1CD062000, v24, OS_LOG_TYPE_ERROR, "%{public}@[Set Touch To Use] accessory not part of profile", (uint8_t *)location, 0xCu);

      }
      objc_autoreleasePoolPop(v22);
      objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", 4);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      if (v6)
        (*((void (**)(id, void *))v6 + 2))(v6, v11);
    }

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", 3);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
      (*((void (**)(id, void *))v6 + 2))(v6, v7);

  }
}

- (void)setLightOnUse:(int64_t)a3 completionHandler:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  HMDSiriEndpointProfile *v19;
  NSObject *v20;
  void *v21;
  void *v22;
  HMDSiriEndpointProfile *v23;
  NSObject *v24;
  void *v25;
  _QWORD v26[4];
  id v27;
  id v28;
  id v29[2];
  void *v30;
  id location[4];

  location[3] = *(id *)MEMORY[0x1E0C80C00];
  v6 = a4;
  if ((unint64_t)a3 < 2)
  {
    -[HMDAccessoryProfile accessory](self, "accessory");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v9 = v8;
    else
      v9 = 0;
    v10 = v9;

    if (v10)
    {
      -[HMDSiriEndpointProfile _siriSettingSiriLightOnUseCharacteristic](self, "_siriSettingSiriLightOnUseCharacteristic");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v11)
        goto LABEL_12;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3 == 1);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "authorizationData");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      +[HMDCharacteristicWriteRequest writeRequestWithCharacteristic:value:authorizationData:type:](HMDCharacteristicWriteRequest, "writeRequestWithCharacteristic:value:authorizationData:type:", v11, v12, v13, 0);
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      if (v14)
      {
        objc_initWeak(location, self);
        v30 = v14;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v30, 1);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        -[HMDAccessoryProfile workQueue](self, "workQueue");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v26[0] = MEMORY[0x1E0C809B0];
        v26[1] = 3221225472;
        v26[2] = __58__HMDSiriEndpointProfile_setLightOnUse_completionHandler___block_invoke;
        v26[3] = &unk_1E89BBFB0;
        objc_copyWeak(v29, location);
        v17 = v14;
        v27 = v17;
        v28 = v6;
        v29[1] = (id)a3;
        objc_msgSend(v10, "writeCharacteristicValues:source:queue:completionHandler:", v15, 7, v16, v26);

        objc_destroyWeak(v29);
        objc_destroyWeak(location);
      }
      else
      {
LABEL_12:
        v18 = (void *)MEMORY[0x1D17BA0A0]();
        v19 = self;
        HMFGetOSLogHandle();
        v20 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
        {
          HMFGetLogIdentifier();
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          LODWORD(location[0]) = 138543362;
          *(id *)((char *)location + 4) = v21;
          _os_log_impl(&dword_1CD062000, v20, OS_LOG_TYPE_ERROR, "%{public}@[Set Light On Use] failed to create siri enable write request", (uint8_t *)location, 0xCu);

        }
        objc_autoreleasePoolPop(v18);
        objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", 2);
        v17 = (id)objc_claimAutoreleasedReturnValue();
        if (v6)
          (*((void (**)(id, id))v6 + 2))(v6, v17);
      }

    }
    else
    {
      v22 = (void *)MEMORY[0x1D17BA0A0]();
      v23 = self;
      HMFGetOSLogHandle();
      v24 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        LODWORD(location[0]) = 138543362;
        *(id *)((char *)location + 4) = v25;
        _os_log_impl(&dword_1CD062000, v24, OS_LOG_TYPE_ERROR, "%{public}@[Set Light On Use] accessory not part of profile", (uint8_t *)location, 0xCu);

      }
      objc_autoreleasePoolPop(v22);
      objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", 4);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      if (v6)
        (*((void (**)(id, void *))v6 + 2))(v6, v11);
    }

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", 3);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
      (*((void (**)(id, void *))v6 + 2))(v6, v7);

  }
}

- (void)setSoundOnUse:(int64_t)a3 completionHandler:(id)a4
{
  void *v4;
  void (**v5)(id, void *);

  v5 = (void (**)(id, void *))a4;
  objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", 2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
    v5[2](v5, v4);

}

- (void)refreshStateWithCompletionHandler:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  -[HMDAccessoryProfile workQueue](self, "workQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __60__HMDSiriEndpointProfile_refreshStateWithCompletionHandler___block_invoke;
  v7[3] = &unk_1E89C1D68;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, v7);

}

- (BOOL)_notificationEnabledForType:(unint64_t)a3
{
  os_unfair_lock_s *p_lock;

  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  LOBYTE(a3) = (a3 & ~-[HMDSiriEndpointProfile notifications](self, "notifications")) == 0;
  os_unfair_lock_unlock(p_lock);
  return a3;
}

- (void)_notificationEnable:(BOOL)a3 forType:(unint64_t)a4
{
  _BOOL4 v5;
  os_unfair_lock_s *p_lock;
  unint64_t v8;

  v5 = a3;
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  if (v5)
    v8 = -[HMDSiriEndpointProfile notifications](self, "notifications") | a4;
  else
    v8 = -[HMDSiriEndpointProfile notifications](self, "notifications") & (a4 == 0);
  -[HMDSiriEndpointProfile setNotifications:](self, "setNotifications:", v8);
  os_unfair_lock_unlock(p_lock);
}

- (NSArray)_allEndpointCharacteristicsToMonitor
{
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDSiriEndpointProfile _siriEndpointSessionStatusCharacteristic](self, "_siriEndpointSessionStatusCharacteristic");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
    objc_msgSend(v3, "addObject:", v4);
  v5 = (void *)objc_msgSend(v3, "copy");

  return (NSArray *)v5;
}

- (NSArray)_allSettingsCharacteristicsToMonitor
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDSiriEndpointProfile _siriSettingSiriEnableCharacteristic](self, "_siriSettingSiriEnableCharacteristic");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
    objc_msgSend(v3, "addObject:", v4);
  -[HMDSiriEndpointProfile _siriSettingSiriListeningCharacteristic](self, "_siriSettingSiriListeningCharacteristic");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
    objc_msgSend(v3, "addObject:", v5);
  -[HMDSiriEndpointProfile _siriSettingSiriTouchCharacteristic](self, "_siriSettingSiriTouchCharacteristic");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
    objc_msgSend(v3, "addObject:", v6);
  -[HMDSiriEndpointProfile _siriSettingSiriLightOnUseCharacteristic](self, "_siriSettingSiriLightOnUseCharacteristic");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
    objc_msgSend(v3, "addObject:", v7);
  -[HMDSiriEndpointProfile _siriEndpointActiveIdentifierCharacteristic](self, "_siriEndpointActiveIdentifierCharacteristic");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
    objc_msgSend(v3, "addObject:", v8);
  -[HMDSiriEndpointProfile _siriEndpointManuallyDisabledCharacteristic](self, "_siriEndpointManuallyDisabledCharacteristic");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
    objc_msgSend(v3, "addObject:", v9);
  -[HMDSiriEndpointProfile _siriSettingMultifunctionButtonCharacteristic](self, "_siriSettingMultifunctionButtonCharacteristic");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
    objc_msgSend(v3, "addObject:", v10);
  v21 = 0u;
  v22 = 0u;
  v19 = 0u;
  v20 = 0u;
  -[HMDSiriEndpointProfile assistants](self, "assistants", 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v20;
    do
    {
      v15 = 0;
      do
      {
        if (*(_QWORD *)v20 != v14)
          objc_enumerationMutation(v11);
        objc_msgSend(*(id *)(*((_QWORD *)&v19 + 1) + 8 * v15), "characteristicsToMonitor");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "addObjectsFromArray:", v16);

        ++v15;
      }
      while (v13 != v15);
      v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    }
    while (v13);
  }

  v17 = (void *)objc_msgSend(v3, "copy");
  return (NSArray *)v17;
}

- (void)setNotifications:(BOOL)a3 options:(unint64_t)a4
{
  NSObject *v7;
  _QWORD block[6];
  BOOL v9;

  -[HMDAccessoryProfile workQueue](self, "workQueue");
  v7 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __51__HMDSiriEndpointProfile_setNotifications_options___block_invoke;
  block[3] = &unk_1E89B1748;
  block[4] = self;
  block[5] = a4;
  v9 = a3;
  dispatch_async(v7, block);

}

- (void)_setNotifications:(BOOL)a3 options:(unint64_t)a4
{
  _BOOL8 v5;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  HMDSiriEndpointProfile *v14;
  NSObject *v15;
  NSObject *v16;
  void *v17;
  const __CFString *v18;
  void *v19;
  HMDSiriEndpointProfile *v20;
  NSObject *v21;
  void *v22;
  const __CFString *v23;
  void *v24;
  HMDSiriEndpointProfile *v25;
  NSObject *v26;
  void *v27;
  void *v28;
  int v29;
  void *v30;
  __int16 v31;
  unint64_t v32;
  __int16 v33;
  uint64_t v34;
  __int16 v35;
  void *v36;
  uint64_t v37;

  v5 = a3;
  v37 = *MEMORY[0x1E0C80C00];
  if (a4 == 2)
  {
    -[HMDSiriEndpointProfile _allSettingsCharacteristicsToMonitor](self, "_allSettingsCharacteristicsToMonitor");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDSiriEndpointProfile clientSettingsIdentifier](self, "clientSettingsIdentifier");
    v8 = objc_claimAutoreleasedReturnValue();
LABEL_5:
    v9 = (void *)v8;
    if (v8 && objc_msgSend(v7, "count"))
    {
      -[HMDAccessoryProfile accessory](self, "accessory");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v11 = v10;
      else
        v11 = 0;
      v12 = v11;

      v13 = (void *)MEMORY[0x1D17BA0A0]();
      v14 = self;
      HMFGetOSLogHandle();
      v15 = objc_claimAutoreleasedReturnValue();
      v16 = v15;
      if (v12)
      {
        if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
        {
          HMFGetLogIdentifier();
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          v18 = CFSTR("Disabling");
          v29 = 138544130;
          v30 = v17;
          if (v5)
            v18 = CFSTR("Enabling");
          v31 = 2112;
          v32 = (unint64_t)v18;
          v33 = 2112;
          v34 = (uint64_t)v9;
          v35 = 2112;
          v36 = v7;
          _os_log_impl(&dword_1CD062000, v16, OS_LOG_TYPE_INFO, "%{public}@[Profile Notifications] %@ notifications for characteristics for %@: %@", (uint8_t *)&v29, 0x2Au);

        }
        objc_autoreleasePoolPop(v13);
        objc_msgSend(v12, "enableNotification:forCharacteristics:message:clientIdentifier:", v5, v7, 0, v9);
        -[HMDSiriEndpointProfile _notificationEnable:forType:](v14, "_notificationEnable:forType:", v5, a4);
      }
      else
      {
        if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
        {
          HMFGetLogIdentifier();
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          v29 = 138543362;
          v30 = v28;
          _os_log_impl(&dword_1CD062000, v16, OS_LOG_TYPE_ERROR, "%{public}@[Profile Notifications] accessory not part of profile", (uint8_t *)&v29, 0xCu);

        }
        objc_autoreleasePoolPop(v13);
      }

    }
    else
    {
      v19 = (void *)MEMORY[0x1D17BA0A0]();
      v20 = self;
      HMFGetOSLogHandle();
      v21 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        if (v5)
          v23 = CFSTR("enable");
        else
          v23 = CFSTR("disable");
        v29 = 138544130;
        v30 = v22;
        v31 = 2112;
        v32 = (unint64_t)v23;
        v33 = 2048;
        v34 = objc_msgSend(v7, "count");
        v35 = 2112;
        v36 = v9;
        _os_log_impl(&dword_1CD062000, v21, OS_LOG_TYPE_ERROR, "%{public}@[Profile Notifications] nothing to %@ because characteristic.count (%ld) or client indentifier %@", (uint8_t *)&v29, 0x2Au);

      }
      objc_autoreleasePoolPop(v19);
    }

    return;
  }
  if (a4 == 1)
  {
    -[HMDSiriEndpointProfile _allEndpointCharacteristicsToMonitor](self, "_allEndpointCharacteristicsToMonitor");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDSiriEndpointProfile clientEndpointIdentifier](self, "clientEndpointIdentifier");
    v8 = objc_claimAutoreleasedReturnValue();
    goto LABEL_5;
  }
  v24 = (void *)MEMORY[0x1D17BA0A0](self, a2);
  v25 = self;
  HMFGetOSLogHandle();
  v26 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
  {
    HMFGetLogIdentifier();
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = 138543618;
    v30 = v27;
    v31 = 2048;
    v32 = a4;
    _os_log_impl(&dword_1CD062000, v26, OS_LOG_TYPE_ERROR, "%{public}@[Profile Notifications] options is not valid: %ld", (uint8_t *)&v29, 0x16u);

  }
  objc_autoreleasePoolPop(v24);
}

- (unint64_t)notifications
{
  return self->_notifications;
}

- (void)setNotifications:(unint64_t)a3
{
  self->_notifications = a3;
}

- (int64_t)sessionState
{
  return self->_sessionState;
}

- (void)setSessionState:(int64_t)a3
{
  self->_sessionState = a3;
}

- (HMFStagedValue)stagedNeedsOnboarding
{
  return (HMFStagedValue *)objc_getProperty(self, a2, 104, 1);
}

- (NSString)clientEndpointIdentifier
{
  return (NSString *)objc_getProperty(self, a2, 152, 1);
}

- (NSString)clientSettingsIdentifier
{
  return (NSString *)objc_getProperty(self, a2, 160, 1);
}

- (NSNotificationCenter)notificationCenter
{
  return (NSNotificationCenter *)objc_getProperty(self, a2, 192, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_notificationCenter, 0);
  objc_storeStrong((id *)&self->_assistants, 0);
  objc_storeStrong((id *)&self->_activeIdentifier, 0);
  objc_storeStrong((id *)&self->_clientSettingsIdentifier, 0);
  objc_storeStrong((id *)&self->_clientEndpointIdentifier, 0);
  objc_storeStrong((id *)&self->_siriEngineVersion, 0);
  objc_storeStrong((id *)&self->_stagedNeedsOnboarding, 0);
  objc_storeStrong((id *)&self->_profileServices, 0);
  objc_storeStrong((id *)&self->_siriEndpointVersion, 0);
  objc_storeStrong((id *)&self->_sessionHubIdentifier, 0);
}

void __51__HMDSiriEndpointProfile_setNotifications_options___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  id v4;
  NSObject *v5;
  void *v6;
  uint64_t v7;
  int v8;
  void *v9;
  __int16 v10;
  uint64_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v2 = *(_QWORD *)(a1 + 40);
  if ((v2 & 1) != 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "_setNotifications:options:", *(unsigned __int8 *)(a1 + 48), 1);
    if ((*(_BYTE *)(a1 + 40) & 2) == 0)
      return;
    goto LABEL_7;
  }
  if ((v2 & 2) != 0)
  {
LABEL_7:
    objc_msgSend(*(id *)(a1 + 32), "_setNotifications:options:", *(unsigned __int8 *)(a1 + 48), 2);
    return;
  }
  v3 = (void *)MEMORY[0x1D17BA0A0]();
  v4 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
  {
    HMFGetLogIdentifier();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = *(_QWORD *)(a1 + 40);
    v8 = 138543618;
    v9 = v6;
    v10 = 2048;
    v11 = v7;
    _os_log_impl(&dword_1CD062000, v5, OS_LOG_TYPE_ERROR, "%{public}@[Notifications] options is not valid: %ld", (uint8_t *)&v8, 0x16u);

  }
  objc_autoreleasePoolPop(v3);
}

uint64_t __60__HMDSiriEndpointProfile_refreshStateWithCompletionHandler___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_handleRefreshProfileState:completionHandler:", 0, *(_QWORD *)(a1 + 40));
}

void __58__HMDSiriEndpointProfile_setLightOnUse_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  id v14;
  NSObject *v15;
  uint64_t v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  int v24;
  void *v25;
  void *v26;
  void *v27;
  id v28;
  NSObject *v29;
  void *v30;
  void *v31;
  uint64_t v32;
  uint64_t v33;
  id v34;
  _QWORD *v35;
  uint64_t v36;
  id obj;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  const __CFString *v42;
  void *v43;
  uint8_t buf[4];
  void *v45;
  __int16 v46;
  void *v47;
  __int16 v48;
  void *v49;
  _BYTE v50[128];
  uint64_t v51;

  v51 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v35 = (_QWORD *)a1;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (objc_msgSend(v3, "count"))
  {
    v40 = 0u;
    v41 = 0u;
    v38 = 0u;
    v39 = 0u;
    v34 = v3;
    obj = v3;
    v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v38, v50, 16);
    if (v5)
    {
      v6 = v5;
      v7 = 0;
      v8 = *(_QWORD *)v39;
      do
      {
        v9 = 0;
        v36 = v6;
        do
        {
          if (*(_QWORD *)v39 != v8)
            objc_enumerationMutation(obj);
          v10 = *(void **)(*((_QWORD *)&v38 + 1) + 8 * v9);
          objc_msgSend(v10, "error", v34);
          v11 = (void *)objc_claimAutoreleasedReturnValue();

          if (v11)
          {
            objc_msgSend(v10, "error");
            v12 = objc_claimAutoreleasedReturnValue();

            v13 = (void *)MEMORY[0x1D17BA0A0]();
            v14 = WeakRetained;
            HMFGetOSLogHandle();
            v15 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
            {
              HMFGetLogIdentifier();
              v16 = v8;
              v17 = WeakRetained;
              v18 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v10, "request");
              v19 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v10, "error");
              v20 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138543874;
              v45 = v18;
              v46 = 2112;
              v47 = v19;
              v48 = 2112;
              v49 = v20;
              _os_log_impl(&dword_1CD062000, v15, OS_LOG_TYPE_ERROR, "%{public}@Write request %@ failed with error %@", buf, 0x20u);

              WeakRetained = v17;
              v8 = v16;
              v6 = v36;
            }

            objc_autoreleasePoolPop(v13);
            v7 = (void *)v12;
          }
          else
          {
            objc_msgSend(v10, "request");
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v21, "characteristic");
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v22, "type");
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            v24 = objc_msgSend(v23, "isEqual:", CFSTR("00000258-0000-1000-8000-0026BB765291"));

            if (v24)
            {
              objc_msgSend(WeakRetained, "setSiriLightOnUse:", v35[7]);
              v42 = CFSTR("settings-light");
              objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(WeakRetained, "siriLightOnUse"));
              v25 = (void *)objc_claimAutoreleasedReturnValue();
              v43 = v25;
              objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v43, &v42, 1);
              v26 = (void *)objc_claimAutoreleasedReturnValue();

              objc_msgSend(WeakRetained, "_notifyProfileSettingsUpdated:", v26);
            }
          }
          ++v9;
        }
        while (v6 != v9);
        v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v38, v50, 16);
      }
      while (v6);
    }
    else
    {
      v7 = 0;
    }

    v33 = v35[5];
    if (v33)
      (*(void (**)(uint64_t, void *))(v33 + 16))(v33, v7);
    v3 = v34;
  }
  else
  {
    v27 = (void *)MEMORY[0x1D17BA0A0]();
    v28 = WeakRetained;
    HMFGetOSLogHandle();
    v29 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      v31 = (void *)v35[4];
      *(_DWORD *)buf = 138543618;
      v45 = v30;
      v46 = 2112;
      v47 = v31;
      _os_log_impl(&dword_1CD062000, v29, OS_LOG_TYPE_ERROR, "%{public}@Invalid response for %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v27);
    objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", 50);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = v35[5];
    if (v32)
      (*(void (**)(uint64_t, void *))(v32 + 16))(v32, v7);
  }

}

void __58__HMDSiriEndpointProfile_setTouchToUse_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  id v14;
  NSObject *v15;
  uint64_t v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  int v24;
  void *v25;
  void *v26;
  void *v27;
  id v28;
  NSObject *v29;
  void *v30;
  void *v31;
  uint64_t v32;
  uint64_t v33;
  id v34;
  _QWORD *v35;
  uint64_t v36;
  id obj;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  const __CFString *v42;
  void *v43;
  uint8_t buf[4];
  void *v45;
  __int16 v46;
  void *v47;
  __int16 v48;
  void *v49;
  _BYTE v50[128];
  uint64_t v51;

  v51 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v35 = (_QWORD *)a1;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (objc_msgSend(v3, "count"))
  {
    v40 = 0u;
    v41 = 0u;
    v38 = 0u;
    v39 = 0u;
    v34 = v3;
    obj = v3;
    v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v38, v50, 16);
    if (v5)
    {
      v6 = v5;
      v7 = 0;
      v8 = *(_QWORD *)v39;
      do
      {
        v9 = 0;
        v36 = v6;
        do
        {
          if (*(_QWORD *)v39 != v8)
            objc_enumerationMutation(obj);
          v10 = *(void **)(*((_QWORD *)&v38 + 1) + 8 * v9);
          objc_msgSend(v10, "error", v34);
          v11 = (void *)objc_claimAutoreleasedReturnValue();

          if (v11)
          {
            objc_msgSend(v10, "error");
            v12 = objc_claimAutoreleasedReturnValue();

            v13 = (void *)MEMORY[0x1D17BA0A0]();
            v14 = WeakRetained;
            HMFGetOSLogHandle();
            v15 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
            {
              HMFGetLogIdentifier();
              v16 = v8;
              v17 = WeakRetained;
              v18 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v10, "request");
              v19 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v10, "error");
              v20 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138543874;
              v45 = v18;
              v46 = 2112;
              v47 = v19;
              v48 = 2112;
              v49 = v20;
              _os_log_impl(&dword_1CD062000, v15, OS_LOG_TYPE_ERROR, "%{public}@Write request %@ failed with error %@", buf, 0x20u);

              WeakRetained = v17;
              v8 = v16;
              v6 = v36;
            }

            objc_autoreleasePoolPop(v13);
            v7 = (void *)v12;
          }
          else
          {
            objc_msgSend(v10, "request");
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v21, "characteristic");
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v22, "type");
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            v24 = objc_msgSend(v23, "isEqual:", CFSTR("00000257-0000-1000-8000-0026BB765291"));

            if (v24)
            {
              objc_msgSend(WeakRetained, "setSiriTouchToUse:", v35[7]);
              v42 = CFSTR("settings-touch");
              objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(WeakRetained, "siriTouchToUse"));
              v25 = (void *)objc_claimAutoreleasedReturnValue();
              v43 = v25;
              objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v43, &v42, 1);
              v26 = (void *)objc_claimAutoreleasedReturnValue();

              objc_msgSend(WeakRetained, "_notifyProfileSettingsUpdated:", v26);
            }
          }
          ++v9;
        }
        while (v6 != v9);
        v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v38, v50, 16);
      }
      while (v6);
    }
    else
    {
      v7 = 0;
    }

    v33 = v35[5];
    if (v33)
      (*(void (**)(uint64_t, void *))(v33 + 16))(v33, v7);
    v3 = v34;
  }
  else
  {
    v27 = (void *)MEMORY[0x1D17BA0A0]();
    v28 = WeakRetained;
    HMFGetOSLogHandle();
    v29 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      v31 = (void *)v35[4];
      *(_DWORD *)buf = 138543618;
      v45 = v30;
      v46 = 2112;
      v47 = v31;
      _os_log_impl(&dword_1CD062000, v29, OS_LOG_TYPE_ERROR, "%{public}@Invalid response for %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v27);
    objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", 50);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = v35[5];
    if (v32)
      (*(void (**)(uint64_t, void *))(v32 + 16))(v32, v7);
  }

}

void __57__HMDSiriEndpointProfile_setListening_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  id v14;
  NSObject *v15;
  uint64_t v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  int v24;
  void *v25;
  void *v26;
  void *v27;
  id v28;
  NSObject *v29;
  void *v30;
  void *v31;
  uint64_t v32;
  uint64_t v33;
  id v34;
  _QWORD *v35;
  uint64_t v36;
  id obj;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  const __CFString *v42;
  void *v43;
  uint8_t buf[4];
  void *v45;
  __int16 v46;
  void *v47;
  __int16 v48;
  void *v49;
  _BYTE v50[128];
  uint64_t v51;

  v51 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v35 = (_QWORD *)a1;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (objc_msgSend(v3, "count"))
  {
    v40 = 0u;
    v41 = 0u;
    v38 = 0u;
    v39 = 0u;
    v34 = v3;
    obj = v3;
    v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v38, v50, 16);
    if (v5)
    {
      v6 = v5;
      v7 = 0;
      v8 = *(_QWORD *)v39;
      do
      {
        v9 = 0;
        v36 = v6;
        do
        {
          if (*(_QWORD *)v39 != v8)
            objc_enumerationMutation(obj);
          v10 = *(void **)(*((_QWORD *)&v38 + 1) + 8 * v9);
          objc_msgSend(v10, "error", v34);
          v11 = (void *)objc_claimAutoreleasedReturnValue();

          if (v11)
          {
            objc_msgSend(v10, "error");
            v12 = objc_claimAutoreleasedReturnValue();

            v13 = (void *)MEMORY[0x1D17BA0A0]();
            v14 = WeakRetained;
            HMFGetOSLogHandle();
            v15 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
            {
              HMFGetLogIdentifier();
              v16 = v8;
              v17 = WeakRetained;
              v18 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v10, "request");
              v19 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v10, "error");
              v20 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138543874;
              v45 = v18;
              v46 = 2112;
              v47 = v19;
              v48 = 2112;
              v49 = v20;
              _os_log_impl(&dword_1CD062000, v15, OS_LOG_TYPE_ERROR, "%{public}@Write request %@ failed with error %@", buf, 0x20u);

              WeakRetained = v17;
              v8 = v16;
              v6 = v36;
            }

            objc_autoreleasePoolPop(v13);
            v7 = (void *)v12;
          }
          else
          {
            objc_msgSend(v10, "request");
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v21, "characteristic");
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v22, "type");
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            v24 = objc_msgSend(v23, "isEqual:", CFSTR("00000256-0000-1000-8000-0026BB765291"));

            if (v24)
            {
              objc_msgSend(WeakRetained, "setSiriListening:", v35[7]);
              v42 = CFSTR("settings-listening");
              objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(WeakRetained, "siriListening"));
              v25 = (void *)objc_claimAutoreleasedReturnValue();
              v43 = v25;
              objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v43, &v42, 1);
              v26 = (void *)objc_claimAutoreleasedReturnValue();

              objc_msgSend(WeakRetained, "_notifyProfileSettingsUpdated:", v26);
            }
          }
          ++v9;
        }
        while (v6 != v9);
        v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v38, v50, 16);
      }
      while (v6);
    }
    else
    {
      v7 = 0;
    }

    v33 = v35[5];
    if (v33)
      (*(void (**)(uint64_t, void *))(v33 + 16))(v33, v7);
    v3 = v34;
  }
  else
  {
    v27 = (void *)MEMORY[0x1D17BA0A0]();
    v28 = WeakRetained;
    HMFGetOSLogHandle();
    v29 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      v31 = (void *)v35[4];
      *(_DWORD *)buf = 138543618;
      v45 = v30;
      v46 = 2112;
      v47 = v31;
      _os_log_impl(&dword_1CD062000, v29, OS_LOG_TYPE_ERROR, "%{public}@Invalid response for %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v27);
    objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", 50);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = v35[5];
    if (v32)
      (*(void (**)(uint64_t, void *))(v32 + 16))(v32, v7);
  }

}

void __54__HMDSiriEndpointProfile_setEnable_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  id v14;
  NSObject *v15;
  uint64_t v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  int v24;
  void *v25;
  void *v26;
  void *v27;
  id v28;
  NSObject *v29;
  void *v30;
  void *v31;
  uint64_t v32;
  uint64_t v33;
  id v34;
  _QWORD *v35;
  uint64_t v36;
  id obj;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  const __CFString *v42;
  void *v43;
  uint8_t buf[4];
  void *v45;
  __int16 v46;
  void *v47;
  __int16 v48;
  void *v49;
  _BYTE v50[128];
  uint64_t v51;

  v51 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v35 = (_QWORD *)a1;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (objc_msgSend(v3, "count"))
  {
    v40 = 0u;
    v41 = 0u;
    v38 = 0u;
    v39 = 0u;
    v34 = v3;
    obj = v3;
    v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v38, v50, 16);
    if (v5)
    {
      v6 = v5;
      v7 = 0;
      v8 = *(_QWORD *)v39;
      do
      {
        v9 = 0;
        v36 = v6;
        do
        {
          if (*(_QWORD *)v39 != v8)
            objc_enumerationMutation(obj);
          v10 = *(void **)(*((_QWORD *)&v38 + 1) + 8 * v9);
          objc_msgSend(v10, "error", v34);
          v11 = (void *)objc_claimAutoreleasedReturnValue();

          if (v11)
          {
            objc_msgSend(v10, "error");
            v12 = objc_claimAutoreleasedReturnValue();

            v13 = (void *)MEMORY[0x1D17BA0A0]();
            v14 = WeakRetained;
            HMFGetOSLogHandle();
            v15 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
            {
              HMFGetLogIdentifier();
              v16 = v8;
              v17 = WeakRetained;
              v18 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v10, "request");
              v19 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v10, "error");
              v20 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138543874;
              v45 = v18;
              v46 = 2112;
              v47 = v19;
              v48 = 2112;
              v49 = v20;
              _os_log_impl(&dword_1CD062000, v15, OS_LOG_TYPE_ERROR, "%{public}@Write request %@ failed with error %@", buf, 0x20u);

              WeakRetained = v17;
              v8 = v16;
              v6 = v36;
            }

            objc_autoreleasePoolPop(v13);
            v7 = (void *)v12;
          }
          else
          {
            objc_msgSend(v10, "request");
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v21, "characteristic");
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v22, "type");
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            v24 = objc_msgSend(v23, "isEqual:", CFSTR("00000255-0000-1000-8000-0026BB765291"));

            if (v24)
            {
              objc_msgSend(WeakRetained, "setSiriEnable:", v35[7]);
              v42 = CFSTR("settings-enable");
              objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(WeakRetained, "siriEnable"));
              v25 = (void *)objc_claimAutoreleasedReturnValue();
              v43 = v25;
              objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v43, &v42, 1);
              v26 = (void *)objc_claimAutoreleasedReturnValue();

              objc_msgSend(WeakRetained, "_notifyProfileSettingsUpdated:", v26);
            }
          }
          ++v9;
        }
        while (v6 != v9);
        v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v38, v50, 16);
      }
      while (v6);
    }
    else
    {
      v7 = 0;
    }

    v33 = v35[5];
    if (v33)
      (*(void (**)(uint64_t, void *))(v33 + 16))(v33, v7);
    v3 = v34;
  }
  else
  {
    v27 = (void *)MEMORY[0x1D17BA0A0]();
    v28 = WeakRetained;
    HMFGetOSLogHandle();
    v29 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      v31 = (void *)v35[4];
      *(_DWORD *)buf = 138543618;
      v45 = v30;
      v46 = 2112;
      v47 = v31;
      _os_log_impl(&dword_1CD062000, v29, OS_LOG_TYPE_ERROR, "%{public}@Invalid response for %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v27);
    objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", 50);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = v35[5];
    if (v32)
      (*(void (**)(uint64_t, void *))(v32 + 16))(v32, v7);
  }

}

void __71__HMDSiriEndpointProfile__handleRefreshProfileState_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  id v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  id v14;
  NSObject *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  int v21;
  id v22;
  void *v23;
  uint64_t v24;
  id v25;
  void *v26;
  id v27;
  NSObject *v28;
  void *v29;
  void *v30;
  int v31;
  void *v32;
  void *v33;
  void *v34;
  int v35;
  void *v36;
  void *v37;
  void *v38;
  int v39;
  void *v40;
  void *v41;
  void *v42;
  int v43;
  void *v44;
  void *v45;
  void *v46;
  int v47;
  void *v48;
  void *v49;
  void *v50;
  int v51;
  void *v52;
  void *v53;
  void *v54;
  int v55;
  void *v56;
  void *v57;
  void *v58;
  int v59;
  void *v60;
  void *v61;
  void *v62;
  int v63;
  void *v64;
  void *v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t i;
  void *v70;
  void *v71;
  void *v72;
  id v73;
  NSObject *v74;
  void *v75;
  uint64_t v76;
  void *v77;
  uint64_t v78;
  void *v79;
  void (**v80)(_QWORD, _QWORD, _QWORD);
  uint64_t v81;
  id v82;
  uint64_t v83;
  id v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  HMDSiriEndpointHAPSettings *v88;
  id v89;
  void *v90;
  uint64_t v91;
  __int128 v92;
  __int128 v93;
  __int128 v94;
  __int128 v95;
  id v96;
  __int128 v97;
  __int128 v98;
  __int128 v99;
  __int128 v100;
  uint8_t v101[128];
  uint8_t buf[4];
  void *v103;
  __int16 v104;
  uint64_t v105;
  __int16 v106;
  id v107;
  _BYTE v108[128];
  uint64_t v109;

  v109 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  v89 = WeakRetained;
  if (objc_msgSend(v3, "count"))
  {
    v83 = a1;
    v88 = objc_alloc_init(HMDSiriEndpointHAPSettings);
    v97 = 0u;
    v98 = 0u;
    v99 = 0u;
    v100 = 0u;
    v84 = v3;
    v5 = v3;
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v97, v108, 16);
    if (!v6)
    {
      v8 = 0;
      v90 = 0;
      goto LABEL_81;
    }
    v7 = v6;
    v8 = 0;
    v90 = 0;
    v91 = *(_QWORD *)v98;
    v86 = *MEMORY[0x1E0CB8B28];
    v85 = *MEMORY[0x1E0CB8798];
    while (1)
    {
      v9 = 0;
      v87 = v7;
      do
      {
        if (*(_QWORD *)v98 != v91)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v97 + 1) + 8 * v9);
        objc_msgSend(v10, "error");
        v11 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v11)
        {
          objc_msgSend(v10, "request");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v18, "characteristic");
          v19 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v19, "type");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          v21 = objc_msgSend(v20, "isEqual:", CFSTR("00000254-0000-1000-8000-0026BB765291"));

          if (v21)
          {
            v22 = v5;
            objc_msgSend(v10, "value");
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            v96 = 0;
            +[HMDSiriEndpointSessionStateTLV parsedFromData:error:](HMDSiriEndpointSessionStateTLV, "parsedFromData:error:", v23, &v96);
            v24 = objc_claimAutoreleasedReturnValue();
            v25 = v96;

            v26 = (void *)MEMORY[0x1D17BA0A0]();
            v27 = WeakRetained;
            HMFGetOSLogHandle();
            v28 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v28, OS_LOG_TYPE_DEBUG))
            {
              HMFGetLogIdentifier();
              v29 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138543874;
              v103 = v29;
              v104 = 2112;
              v105 = v24;
              v106 = 2112;
              v107 = v25;
              _os_log_impl(&dword_1CD062000, v28, OS_LOG_TYPE_DEBUG, "%{public}@Response Parsed HMDSiriEndpointSessionStateTLV: %@ with error: %@", buf, 0x20u);

              WeakRetained = v89;
            }

            objc_autoreleasePoolPop(v26);
            v5 = v22;
            goto LABEL_15;
          }
          objc_msgSend(v19, "type");
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          v31 = objc_msgSend(v30, "isEqualToString:", v86);

          if (v31)
          {
            objc_msgSend(v10, "value");
            v32 = (void *)objc_claimAutoreleasedReturnValue();
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
              v33 = v32;
            else
              v33 = 0;
            v25 = v33;

            -[HMDSiriEndpointHAPSettings setSiriEndpointVersion:](v88, "setSiriEndpointVersion:", v25);
            goto LABEL_71;
          }
          objc_msgSend(v19, "type");
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          v35 = objc_msgSend(v34, "isEqual:", CFSTR("00000255-0000-1000-8000-0026BB765291"));

          if (v35)
          {
            objc_msgSend(v10, "value");
            v36 = (void *)objc_claimAutoreleasedReturnValue();
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
              v37 = v36;
            else
              v37 = 0;
            v25 = v37;

            -[HMDSiriEndpointHAPSettings setSiriEnable:](v88, "setSiriEnable:", v25);
            goto LABEL_71;
          }
          objc_msgSend(v19, "type");
          v38 = (void *)objc_claimAutoreleasedReturnValue();
          v39 = objc_msgSend(v38, "isEqual:", CFSTR("00000256-0000-1000-8000-0026BB765291"));

          if (v39)
          {
            objc_msgSend(v10, "value");
            v40 = (void *)objc_claimAutoreleasedReturnValue();
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
              v41 = v40;
            else
              v41 = 0;
            v25 = v41;

            -[HMDSiriEndpointHAPSettings setSiriListening:](v88, "setSiriListening:", v25);
            goto LABEL_71;
          }
          objc_msgSend(v19, "type");
          v42 = (void *)objc_claimAutoreleasedReturnValue();
          v43 = objc_msgSend(v42, "isEqual:", CFSTR("00000257-0000-1000-8000-0026BB765291"));

          if (v43)
          {
            objc_msgSend(v10, "value");
            v44 = (void *)objc_claimAutoreleasedReturnValue();
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
              v45 = v44;
            else
              v45 = 0;
            v25 = v45;

            -[HMDSiriEndpointHAPSettings setSiriTouchToUse:](v88, "setSiriTouchToUse:", v25);
            goto LABEL_71;
          }
          objc_msgSend(v19, "type");
          v46 = (void *)objc_claimAutoreleasedReturnValue();
          v47 = objc_msgSend(v46, "isEqual:", CFSTR("00000258-0000-1000-8000-0026BB765291"));

          if (v47)
          {
            objc_msgSend(v10, "value");
            v48 = (void *)objc_claimAutoreleasedReturnValue();
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
              v49 = v48;
            else
              v49 = 0;
            v25 = v49;

            -[HMDSiriEndpointHAPSettings setSiriLightOnUse:](v88, "setSiriLightOnUse:", v25);
            goto LABEL_71;
          }
          objc_msgSend(v19, "type");
          v50 = (void *)objc_claimAutoreleasedReturnValue();
          v51 = objc_msgSend(v50, "isEqualToString:", CFSTR("0000025A-0000-1000-8000-0026BB765291"));

          if (v51)
          {
            objc_msgSend(v10, "value");
            v52 = (void *)objc_claimAutoreleasedReturnValue();
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
              v53 = v52;
            else
              v53 = 0;
            v25 = v53;

            -[HMDSiriEndpointHAPSettings setSiriEngineVersion:](v88, "setSiriEngineVersion:", v25);
            goto LABEL_71;
          }
          objc_msgSend(v19, "type");
          v54 = (void *)objc_claimAutoreleasedReturnValue();
          v55 = objc_msgSend(v54, "isEqualToString:", v85);

          if (v55)
          {
            objc_msgSend(v10, "value");
            v56 = (void *)objc_claimAutoreleasedReturnValue();
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
              v57 = v56;
            else
              v57 = 0;
            v25 = v57;

            -[HMDSiriEndpointHAPSettings setActiveIdentifier:](v88, "setActiveIdentifier:", v25);
            goto LABEL_71;
          }
          objc_msgSend(v19, "type");
          v58 = (void *)objc_claimAutoreleasedReturnValue();
          v59 = objc_msgSend(v58, "isEqualToString:", CFSTR("00000227-0000-1000-8000-0026BB765291"));

          if (v59)
          {
            objc_msgSend(v10, "value");
            v60 = (void *)objc_claimAutoreleasedReturnValue();
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
              v61 = v60;
            else
              v61 = 0;
            v25 = v61;

            -[HMDSiriEndpointHAPSettings setManuallyDisabled:](v88, "setManuallyDisabled:", v25);
            goto LABEL_71;
          }
          objc_msgSend(v19, "type");
          v62 = (void *)objc_claimAutoreleasedReturnValue();
          v63 = objc_msgSend(v62, "isEqualToString:", CFSTR("0000026B-0000-1000-8000-0026BB765291"));

          if (v63)
          {
            objc_msgSend(v10, "value");
            v64 = (void *)objc_claimAutoreleasedReturnValue();
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
              v65 = v64;
            else
              v65 = 0;
            v25 = v65;

            -[HMDSiriEndpointHAPSettings setMultifunctionButton:](v88, "setMultifunctionButton:", v25);
LABEL_71:
            v24 = (uint64_t)v90;
          }
          else
          {
            v94 = 0u;
            v95 = 0u;
            v92 = 0u;
            v93 = 0u;
            objc_msgSend(WeakRetained, "assistants");
            v25 = (id)objc_claimAutoreleasedReturnValue();
            v66 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v92, v101, 16);
            if (!v66)
              goto LABEL_71;
            v67 = v66;
            v82 = v5;
            v68 = *(_QWORD *)v93;
            do
            {
              for (i = 0; i != v67; ++i)
              {
                if (*(_QWORD *)v93 != v68)
                  objc_enumerationMutation(v25);
                v70 = *(void **)(*((_QWORD *)&v92 + 1) + 8 * i);
                objc_msgSend(v10, "value", v82);
                v71 = (void *)objc_claimAutoreleasedReturnValue();
                LODWORD(v70) = objc_msgSend(v70, "updateCharacteristic:value:", v19, v71);

                if ((_DWORD)v70)
                  -[HMDSiriEndpointHAPSettings setAssistantsUpdated:](v88, "setAssistantsUpdated:", 1);
                WeakRetained = v89;
              }
              v67 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v92, v101, 16);
            }
            while (v67);
            v24 = (uint64_t)v90;
            v5 = v82;
LABEL_15:
            v7 = v87;
          }

          v90 = (void *)v24;
          goto LABEL_73;
        }
        objc_msgSend(v10, "error");
        v12 = objc_claimAutoreleasedReturnValue();

        v13 = (void *)MEMORY[0x1D17BA0A0]();
        v14 = WeakRetained;
        HMFGetOSLogHandle();
        v15 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
        {
          HMFGetLogIdentifier();
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "error");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543618;
          v103 = v16;
          v104 = 2112;
          v105 = (uint64_t)v17;
          _os_log_impl(&dword_1CD062000, v15, OS_LOG_TYPE_ERROR, "%{public}@Read failed with error %@", buf, 0x16u);

        }
        objc_autoreleasePoolPop(v13);
        v8 = (void *)v12;
LABEL_73:
        ++v9;
      }
      while (v9 != v7);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v97, v108, 16);
      if (!v7)
      {
LABEL_81:

        v77 = v90;
        objc_msgSend(WeakRetained, "_updateSessionState:settings:message:", v90, v88, *(_QWORD *)(v83 + 40));
        objc_msgSend(*(id *)(v83 + 40), "responseHandler");
        v79 = (void *)objc_claimAutoreleasedReturnValue();

        if (v79)
        {
          objc_msgSend(*(id *)(v83 + 40), "responseHandler");
          v80 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
          ((void (**)(_QWORD, void *, _QWORD))v80)[2](v80, v8, 0);

        }
        v81 = *(_QWORD *)(v83 + 48);
        v3 = v84;
        if (v81)
          (*(void (**)(uint64_t, void *))(v81 + 16))(v81, v8);

        goto LABEL_86;
      }
    }
  }
  v72 = (void *)MEMORY[0x1D17BA0A0]();
  v73 = WeakRetained;
  HMFGetOSLogHandle();
  v74 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v74, OS_LOG_TYPE_ERROR))
  {
    HMFGetLogIdentifier();
    v75 = (void *)objc_claimAutoreleasedReturnValue();
    v76 = *(_QWORD *)(a1 + 32);
    *(_DWORD *)buf = 138543618;
    v103 = v75;
    v104 = 2112;
    v105 = v76;
    _os_log_impl(&dword_1CD062000, v74, OS_LOG_TYPE_ERROR, "%{public}@Invalid response for %@", buf, 0x16u);

    WeakRetained = v89;
  }

  objc_autoreleasePoolPop(v72);
  objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", 50);
  v77 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "respondWithError:", v77);
  v78 = *(_QWORD *)(a1 + 48);
  if (v78)
    (*(void (**)(uint64_t, void *))(v78 + 16))(v78, v77);
LABEL_86:

}

void __69__HMDSiriEndpointProfile_notifyClientsDidUpdateStagedNeedsOnboarding__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  NSObject *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  int v14;
  void *v15;
  __int16 v16;
  void *v17;
  uint64_t v18;
  _QWORD v19[2];

  v19[1] = *MEMORY[0x1E0C80C00];
  v18 = *MEMORY[0x1E0CB9BD0];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(*(id *)(a1 + 32), "_capability"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v19[0] = v2;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v19, &v18, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v4 = (void *)MEMORY[0x1D17BA0A0]();
  v5 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = 138543618;
    v15 = v7;
    v16 = 2112;
    v17 = v3;
    _os_log_impl(&dword_1CD062000, v6, OS_LOG_TYPE_INFO, "%{public}@Notifying XPC clients of updated needsOnboarding: %@", (uint8_t *)&v14, 0x16u);

  }
  objc_autoreleasePoolPop(v4);
  v8 = objc_alloc(MEMORY[0x1E0D285D8]);
  objc_msgSend(*(id *)(a1 + 32), "uniqueIdentifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v8, "initWithTarget:", v9);

  objc_msgSend(MEMORY[0x1E0D285F8], "messageWithName:destination:payload:", *MEMORY[0x1E0CB9C40], v10, v3);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setRequiresSPIEntitlement");
  objc_msgSend(*(id *)(a1 + 32), "msgDispatcher");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (void *)objc_msgSend(v11, "copy");
  objc_msgSend(v12, "sendMessage:completionHandler:", v13, 0);

}

void __58__HMDSiriEndpointProfile_handleDeviceCapabilitiesUpdated___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  NSObject *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  int v22;
  void *v23;
  id v24;
  NSObject *v25;
  void *v26;
  int v27;
  void *v28;
  __int16 v29;
  id v30;
  __int16 v31;
  uint64_t v32;
  _QWORD v33[2];

  v33[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "object");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v3 = v2;
  else
    v3 = 0;
  v4 = v3;

  objc_msgSend(*(id *)(a1 + 32), "userInfo");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)MEMORY[0x1E0C99E60];
  v33[0] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v33, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setWithArray:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "hmf_arrayForKey:ofClasses:", CFSTR("HMDDeviceCapabilitiesUpdatedDifferingFieldsNotificationKey"), v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = (void *)MEMORY[0x1D17BA0A0]();
  v11 = *(id *)(a1 + 40);
  HMFGetOSLogHandle();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = *(_QWORD *)(a1 + 32);
    v27 = 138543874;
    v28 = v13;
    v29 = 2112;
    v30 = v4;
    v31 = 2112;
    v32 = v14;
    _os_log_impl(&dword_1CD062000, v12, OS_LOG_TYPE_INFO, "%{public}@Handling updated resident capabilities: %@ notification: %@", (uint8_t *)&v27, 0x20u);

  }
  objc_autoreleasePoolPop(v10);
  objc_msgSend(*(id *)(a1 + 40), "accessory");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "home");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "residentDeviceManager");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "residentDevices");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "na_firstObjectPassingTest:", &__block_literal_global_139_93977);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v19, "device");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  if (v19 && objc_msgSend(v19, "isConfirmed"))
  {
    objc_msgSend(v20, "capabilities");
    v21 = (id)objc_claimAutoreleasedReturnValue();
    if (v21 == v4 && (objc_msgSend(v9, "containsObject:", CFSTR("supportsSiriEndpointSetup")) & 1) != 0)
    {
      v22 = objc_msgSend(v4, "supportsSiriEndpointSetup");

      if (v22)
      {
        v23 = (void *)MEMORY[0x1D17BA0A0]();
        v24 = *(id *)(a1 + 40);
        HMFGetOSLogHandle();
        v25 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
        {
          HMFGetLogIdentifier();
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          v27 = 138543618;
          v28 = v26;
          v29 = 2112;
          v30 = v20;
          _os_log_impl(&dword_1CD062000, v25, OS_LOG_TYPE_INFO, "%{public}@Current device was updated to support Siri Endpoint Settings (%@)", (uint8_t *)&v27, 0x16u);

        }
        objc_autoreleasePoolPop(v23);
        objc_msgSend(*(id *)(a1 + 40), "_setNotifications:options:", 1, 2);
        objc_msgSend(*(id *)(a1 + 40), "_handleRefreshProfileState:completionHandler:", 0, 0);
      }
    }
    else
    {

    }
  }

}

uint64_t __58__HMDSiriEndpointProfile_handleDeviceCapabilitiesUpdated___block_invoke_137(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "isCurrentDevice");
}

void __55__HMDSiriEndpointProfile_handlePrimaryResidentChanged___block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  int v12;
  int v13;
  void *v14;
  id v15;
  NSObject *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  uint8_t buf[4];
  void *v28;
  __int16 v29;
  void *v30;
  _BYTE v31[128];
  uint64_t v32;

  v1 = a1;
  v32 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "accessory");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "home");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "residentDeviceManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v25 = 0u;
  v26 = 0u;
  v23 = 0u;
  v24 = 0u;
  v21 = v4;
  objc_msgSend(v4, "residentDevices");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v23, v31, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v24;
    v22 = v1;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v24 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * i);
        if (objc_msgSend(v10, "isCurrentDevice"))
        {
          objc_msgSend(v10, "capabilities");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          v12 = objc_msgSend(v11, "supportsSiriEndpointSetup");

          if (v12)
          {
            v13 = objc_msgSend(v10, "isConfirmed");
            v14 = (void *)MEMORY[0x1D17BA0A0]();
            v15 = *(id *)(v1 + 32);
            HMFGetOSLogHandle();
            v16 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
            {
              HMFGetLogIdentifier();
              v17 = v5;
              v18 = (void *)objc_claimAutoreleasedReturnValue();
              HMFBooleanToString();
              v19 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138543618;
              v28 = v18;
              v29 = 2112;
              v30 = v19;
              _os_log_impl(&dword_1CD062000, v16, OS_LOG_TYPE_INFO, "%{public}@Current device is primary:%@ and does not support home hub", buf, 0x16u);

              v5 = v17;
              v1 = v22;
            }

            objc_autoreleasePoolPop(v14);
            v20 = *(void **)(v1 + 32);
            if (v13)
            {
              objc_msgSend(v20, "_setNotifications:options:", 1, 2);
              objc_msgSend(*(id *)(v1 + 32), "_handleRefreshProfileState:completionHandler:", 0, 0);
            }
            else
            {
              objc_msgSend(v20, "_setNotifications:options:", 0, 2);
            }
          }
        }
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v23, v31, 16);
    }
    while (v7);
  }

}

uint64_t __52__HMDSiriEndpointProfile_handleAccessoryConfigured___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  int v9;
  int v11;
  void *v12;
  __int16 v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x1D17BA0A0]();
  v3 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "name");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = 138543618;
    v12 = v5;
    v13 = 2112;
    v14 = v6;
    _os_log_impl(&dword_1CD062000, v4, OS_LOG_TYPE_INFO, "%{public}@Handling %@", (uint8_t *)&v11, 0x16u);

  }
  objc_autoreleasePoolPop(v2);
  objc_msgSend(*(id *)(a1 + 32), "accessory");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "home");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "currentDeviceSupportsSidekickSettings");

  if (v9)
    objc_msgSend(*(id *)(a1 + 32), "_setNotifications:options:", 1, 2);
  if (objc_msgSend(*(id *)(a1 + 32), "_notificationEnabledForType:", 1))
    objc_msgSend(*(id *)(a1 + 32), "_setNotifications:options:", 1, 1);
  objc_msgSend(*(id *)(a1 + 32), "setSessionState:", -1);
  return objc_msgSend(*(id *)(a1 + 32), "_handleRefreshProfileState:completionHandler:", 0, 0);
}

void __64__HMDSiriEndpointProfile_handleHomeCharacteristicValuesChanged___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  int v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  id obj;
  uint64_t v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  _BYTE v43[128];
  _BYTE v44[128];
  uint64_t v45;

  v45 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v39 = 0u;
  v40 = 0u;
  v41 = 0u;
  v42 = 0u;
  obj = *(id *)(a1 + 32);
  v2 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v39, v44, 16);
  if (v2)
  {
    v3 = v2;
    v4 = *(_QWORD *)v40;
    v30 = *(_QWORD *)v40;
    v31 = a1;
    do
    {
      v5 = 0;
      v32 = v3;
      do
      {
        if (*(_QWORD *)v40 != v4)
          objc_enumerationMutation(obj);
        v6 = *(void **)(*((_QWORD *)&v39 + 1) + 8 * v5);
        objc_msgSend(*(id *)(a1 + 40), "accessory", v29);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "uuid");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "accessory");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "uuid");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = HMFEqualObjects();

        if (v11)
        {
          v37 = 0u;
          v38 = 0u;
          v35 = 0u;
          v36 = 0u;
          objc_msgSend(*(id *)(a1 + 40), "services");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v35, v43, 16);
          if (v13)
          {
            v14 = v13;
            v15 = *(_QWORD *)v36;
            v34 = v5;
            while (2)
            {
              for (i = 0; i != v14; ++i)
              {
                if (*(_QWORD *)v36 != v15)
                  objc_enumerationMutation(v12);
                v17 = *(void **)(*((_QWORD *)&v35 + 1) + 8 * i);
                objc_msgSend(v17, "instanceID");
                v18 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v6, "service");
                v19 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v19, "instanceID");
                v20 = (void *)objc_claimAutoreleasedReturnValue();
                v21 = HMFEqualObjects();

                if (v21)
                {
                  objc_msgSend(v17, "instanceID");
                  v22 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v22, "stringValue");
                  v23 = (void *)objc_claimAutoreleasedReturnValue();

                  objc_msgSend(v29, "objectForKeyedSubscript:", v23);
                  v24 = (void *)objc_claimAutoreleasedReturnValue();
                  if (!v24)
                  {
                    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
                    v24 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v29, "setObject:forKeyedSubscript:", v24, v23);
                  }
                  objc_msgSend(v6, "instanceID");
                  v25 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v25, "stringValue");
                  v26 = (void *)objc_claimAutoreleasedReturnValue();

                  objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", 1);
                  v27 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v6, "value");
                  v28 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v27, "setObject:forKeyedSubscript:", v28, CFSTR("kCharacteristicValue"));

                  objc_msgSend(v24, "setObject:forKeyedSubscript:", v27, v26);
                  v5 = v34;
                  goto LABEL_19;
                }
              }
              v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v35, v43, 16);
              v5 = v34;
              if (v14)
                continue;
              break;
            }
          }
LABEL_19:

          v4 = v30;
          a1 = v31;
          v3 = v32;
        }
        ++v5;
      }
      while (v5 != v3);
      v3 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v39, v44, 16);
    }
    while (v3);
  }

  objc_msgSend(*(id *)(a1 + 40), "_handleCharacteristicChanges:", v29);
}

uint64_t __64__HMDSiriEndpointProfile_handleHomeCharacteristicValuesChanged___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_handleCharacteristicChanges:", *(_QWORD *)(a1 + 40));
}

void __45__HMDSiriEndpointProfile_registerForMessages__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  int v4;
  void *v5;
  id v6;
  NSObject *v7;
  void *v8;
  int v9;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "accessory");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "home");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "currentDeviceSupportsSidekickSettings");

  if (v4)
  {
    v5 = (void *)MEMORY[0x1D17BA0A0]();
    v6 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = 138543362;
      v10 = v8;
      _os_log_impl(&dword_1CD062000, v7, OS_LOG_TYPE_INFO, "%{public}@Registering for characteristic notifcations since current device supports home hub", (uint8_t *)&v9, 0xCu);

    }
    objc_autoreleasePoolPop(v5);
    objc_msgSend(*(id *)(a1 + 32), "_setNotifications:options:", 1, 2);
    objc_msgSend(*(id *)(a1 + 32), "_handleRefreshProfileState:completionHandler:", 0, 0);
  }
}

+ (void)initialize
{
  objc_msgSend(MEMORY[0x1E0D28678], "setDefaultValue:forPreferenceKey:", &unk_1E8B36BB8, CFSTR("siriProfileOnBoardingPendingTime"));
}

+ (id)namespace
{
  if (namespace_onceToken_94021 != -1)
    dispatch_once(&namespace_onceToken_94021, &__block_literal_global_94022);
  return (id)namespace_namespace_94023;
}

+ (id)uniqueIdentifierFromAccessory:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;

  v3 = (void *)MEMORY[0x1E0C99DF0];
  v4 = a3;
  objc_msgSend(v3, "dataWithLength:", 16);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "uuid");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_retainAutorelease(v5);
  objc_msgSend(v6, "getUUIDBytes:", objc_msgSend(v7, "mutableBytes"));

  v8 = (void *)MEMORY[0x1E0CB3A28];
  objc_msgSend((id)objc_opt_class(), "namespace");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "hmf_UUIDWithNamespace:data:", v9, v7);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

void __35__HMDSiriEndpointProfile_namespace__block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3A28]), "initWithUUIDString:", CFSTR("4CF0DBFA-FE71-485F-956B-20002E66B3AA"));
  v1 = (void *)namespace_namespace_94023;
  namespace_namespace_94023 = v0;

}

@end
