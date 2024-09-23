@implementation HMDAccessorySessionMetric

- (HMDAccessorySessionMetric)initWithAccessory:(id)a3 workQueue:(id)a4
{
  void *v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  HMDAccessorySessionMetric *v16;

  v6 = (void *)MEMORY[0x1E0D28678];
  v7 = a4;
  v8 = a3;
  objc_msgSend(v6, "sharedPreferences");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "preferenceForKey:", CFSTR("HAPSessionTTRAllowList"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "value");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v12 = v11;
  else
    v12 = 0;
  v13 = v12;

  v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D286C8]), "initWithTimeInterval:options:", 0, 30.0);
  +[HMDTTRManager sharedManager](HMDTTRManager, "sharedManager");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = -[HMDAccessorySessionMetric initWithAccessory:workQueue:hapSessionTTRTimer:hapSessionTTRAllowList:radarInitiator:](self, "initWithAccessory:workQueue:hapSessionTTRTimer:hapSessionTTRAllowList:radarInitiator:", v8, v7, v14, v13, v15);

  return v16;
}

- (HMDAccessorySessionMetric)initWithAccessory:(id)a3 workQueue:(id)a4 hapSessionTTRTimer:(id)a5 hapSessionTTRAllowList:(id)a6 radarInitiator:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  HMDAccessorySessionMetric *v17;
  HMDAccessorySessionMetric *v18;
  uint64_t v19;
  NSArray *hapSessionTTRAllowList;
  void *v21;
  uint64_t v22;
  NSMutableDictionary *errorCounts;
  uint64_t v24;
  NSDate *metricCollectionStartTime;
  uint64_t v26;
  HAP2AccessorySessionInfo *sessionInfo;
  uint64_t v28;
  NSString *accessoryTransport;
  uint64_t v30;
  NSString *expectedTransport;
  objc_super v33;

  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  v33.receiver = self;
  v33.super_class = (Class)HMDAccessorySessionMetric;
  v17 = -[HMDAccessorySessionMetric init](&v33, sel_init);
  v18 = v17;
  if (v17)
  {
    objc_storeWeak((id *)&v17->_accessory, v12);
    objc_storeStrong((id *)&v18->_workQueue, a4);
    v19 = objc_msgSend(v15, "copy");
    hapSessionTTRAllowList = v18->_hapSessionTTRAllowList;
    v18->_hapSessionTTRAllowList = (NSArray *)v19;

    objc_storeWeak((id *)&v18->_radarInitiator, v16);
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v12, "isReachable"))
    {
      v18->_isReachable = 1;
      objc_storeStrong((id *)&v18->_reachableStartTime, v21);
    }
    if (objc_msgSend(v12, "hasActiveSession"))
    {
      v18->_hasActiveSession = 1;
      objc_storeStrong((id *)&v18->_sessionStartTime, v21);
    }
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v22 = objc_claimAutoreleasedReturnValue();
    errorCounts = v18->_errorCounts;
    v18->_errorCounts = (NSMutableDictionary *)v22;

    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v24 = objc_claimAutoreleasedReturnValue();
    metricCollectionStartTime = v18->_metricCollectionStartTime;
    v18->_metricCollectionStartTime = (NSDate *)v24;

    v26 = objc_msgSend(objc_alloc(MEMORY[0x1E0D16348]), "initWithNumIPs:numIPsTried:numBonjourNames:", 0, 0, 0);
    sessionInfo = v18->_sessionInfo;
    v18->_sessionInfo = (HAP2AccessorySessionInfo *)v26;

    objc_msgSend(v12, "linkLayerType");
    HAPLinkLayerTypeDescription();
    v28 = objc_claimAutoreleasedReturnValue();
    accessoryTransport = v18->_accessoryTransport;
    v18->_accessoryTransport = (NSString *)v28;

    objc_msgSend(v12, "expectedTransport");
    v30 = objc_claimAutoreleasedReturnValue();
    expectedTransport = v18->_expectedTransport;
    v18->_expectedTransport = (NSString *)v30;

    objc_storeStrong((id *)&v18->_hapSessionTTRTimer, a5);
    -[HMFTimer setDelegateQueue:](v18->_hapSessionTTRTimer, "setDelegateQueue:", v18->_workQueue);
    -[HMFTimer setDelegate:](v18->_hapSessionTTRTimer, "setDelegate:", v18);

  }
  return v18;
}

- (NSDictionary)state
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  double v18;
  void *v19;
  void *v20;
  void *v21;
  double v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDAccessorySessionMetric accessory](self, "accessory");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v5 = v4;
  else
    v5 = 0;
  v6 = v5;

  objc_msgSend(v6, "manufacturer");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("Manufacturer"));

  objc_msgSend(v6, "model");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v8, CFSTR("Model"));

  objc_msgSend(v6, "firmwareVersion");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "shortVersionString");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v10, CFSTR("FirmwareVersion"));

  objc_msgSend(v6, "serialNumber");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v11, CFSTR("SerialNumber"));

  objc_msgSend(MEMORY[0x1E0D28678], "sharedPreferences");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "preferenceForKey:", CFSTR("HMDAccessorySessionMetricSubmissionInterval"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "numberValue");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v14, CFSTR("submissionInterval"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[HMDAccessorySessionMetric hasActiveSession](self, "hasActiveSession"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v15, CFSTR("hasActiveSession"));

  v16 = (void *)MEMORY[0x1E0CB37E8];
  -[HMDAccessorySessionMetric sessionStartTime](self, "sessionStartTime");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "timeIntervalSinceNow");
  objc_msgSend(v16, "numberWithDouble:", fabs(v18));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v19, CFSTR("activeSessionDurationSec"));

  v20 = (void *)MEMORY[0x1E0CB37E8];
  -[HMDAccessorySessionMetric reachableStartTime](self, "reachableStartTime");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "timeIntervalSinceNow");
  objc_msgSend(v20, "numberWithDouble:", fabs(v22));
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v23, CFSTR("reachableDurationSec"));

  v24 = (void *)MEMORY[0x1E0CB37E8];
  -[HMDAccessorySessionMetric sessionCheckIntervalSec](self, "sessionCheckIntervalSec");
  objc_msgSend(v24, "numberWithDouble:");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v25, CFSTR("sessionCheckIntervalSec"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[HMDAccessorySessionMetric sessionFailures](self, "sessionFailures"));
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v26, CFSTR("sessionFailures"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[HMDAccessorySessionMetric successfulSessionRetries](self, "successfulSessionRetries"));
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v27, CFSTR("successfulSessionRetries"));

  -[HMDAccessorySessionMetric errorCounts](self, "errorCounts");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "description");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v29, CFSTR("sessionErrors"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[HMDAccessorySessionMetric isFromPrimary](self, "isFromPrimary"));
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v30, CFSTR("isFromPrimary"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v6, "numActiveSessionClients"));
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v31, CFSTR("numActiveClients"));

  objc_msgSend(v6, "currentActiveSessionRestoreClients");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v32, CFSTR("activeClients"));

  objc_msgSend(v6, "expectedTransport");
  v33 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "setObject:forKeyedSubscript:", v33, CFSTR("expectedTransport"));
  -[HMDAccessorySessionMetric accessoryTransport](self, "accessoryTransport");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v34, CFSTR("currentTransport"));

  return (NSDictionary *)v3;
}

- (id)attributeDescriptions
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  id v11;
  id v12;
  id v13;
  id v14;
  void *v15;
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
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  id v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
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
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  _QWORD v63[17];

  v63[15] = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc(MEMORY[0x1E0D28548]);
  v4 = (void *)MEMORY[0x1E0CB37E8];
  -[HMDAccessorySessionMetric submissionIntervalSec](self, "submissionIntervalSec");
  objc_msgSend(v4, "numberWithDouble:");
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  v61 = (void *)objc_msgSend(v3, "initWithName:value:", CFSTR("submissionInterval"), v62);
  v63[0] = v61;
  v5 = objc_alloc(MEMORY[0x1E0D28548]);
  v6 = (void *)MEMORY[0x1E0CB37E8];
  -[HMDAccessorySessionMetric activeSessionDurationSec](self, "activeSessionDurationSec");
  objc_msgSend(v6, "numberWithDouble:");
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  v59 = (void *)objc_msgSend(v5, "initWithName:value:", CFSTR("activeSessionDurationSec"), v60);
  v63[1] = v59;
  v7 = objc_alloc(MEMORY[0x1E0D28548]);
  v8 = (void *)MEMORY[0x1E0CB37E8];
  -[HMDAccessorySessionMetric reachableDurationSec](self, "reachableDurationSec");
  objc_msgSend(v8, "numberWithDouble:");
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  v57 = (void *)objc_msgSend(v7, "initWithName:value:", CFSTR("reachableDurationSec"), v58);
  v63[2] = v57;
  v9 = objc_alloc(MEMORY[0x1E0D28548]);
  v10 = (void *)MEMORY[0x1E0CB37E8];
  -[HMDAccessorySessionMetric sessionCheckIntervalSec](self, "sessionCheckIntervalSec");
  objc_msgSend(v10, "numberWithDouble:");
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  v55 = (void *)objc_msgSend(v9, "initWithName:value:", CFSTR("sessionCheckIntervalSec"), v56);
  v63[3] = v55;
  v11 = objc_alloc(MEMORY[0x1E0D28548]);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[HMDAccessorySessionMetric sessionFailures](self, "sessionFailures"));
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  v53 = (void *)objc_msgSend(v11, "initWithName:value:", CFSTR("sessionFailures"), v54);
  v63[4] = v53;
  v12 = objc_alloc(MEMORY[0x1E0D28548]);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[HMDAccessorySessionMetric successfulSessionRetries](self, "successfulSessionRetries"));
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  v51 = (void *)objc_msgSend(v12, "initWithName:value:", CFSTR("successfulSessionRetries"), v52);
  v63[5] = v51;
  v13 = objc_alloc(MEMORY[0x1E0D28548]);
  -[HMDAccessorySessionMetric topError](self, "topError");
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v50, "domain");
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  v48 = (void *)objc_msgSend(v13, "initWithName:value:", CFSTR("topErrorDomain"), v49);
  v63[6] = v48;
  v14 = objc_alloc(MEMORY[0x1E0D28548]);
  v15 = (void *)MEMORY[0x1E0CB37E8];
  -[HMDAccessorySessionMetric topError](self, "topError");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "numberWithInteger:", objc_msgSend(v47, "code"));
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  v45 = (void *)objc_msgSend(v14, "initWithName:value:", CFSTR("topErrorCode"), v46);
  v63[7] = v45;
  v16 = objc_alloc(MEMORY[0x1E0D28548]);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[HMDAccessorySessionMetric isFromPrimary](self, "isFromPrimary"));
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  v43 = (void *)objc_msgSend(v16, "initWithName:value:", CFSTR("isFromPrimary"), v44);
  v63[8] = v43;
  v17 = objc_alloc(MEMORY[0x1E0D28548]);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[HMDAccessorySessionMetric isHomeThreadCapable](self, "isHomeThreadCapable"));
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  v41 = (void *)objc_msgSend(v17, "initWithName:value:", CFSTR("isHomeThreadCapable"), v42);
  v63[9] = v41;
  v18 = objc_alloc(MEMORY[0x1E0D28548]);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[HMDAccessorySessionMetric isPrimaryResidentThreadCapable](self, "isPrimaryResidentThreadCapable"));
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  v39 = (void *)objc_msgSend(v18, "initWithName:value:", CFSTR("isPrimaryResidentThreadCapable"), v40);
  v63[10] = v39;
  v19 = objc_alloc(MEMORY[0x1E0D28548]);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[HMDAccessorySessionMetric isThreadNetworkUp](self, "isThreadNetworkUp"));
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = (void *)objc_msgSend(v19, "initWithName:value:", CFSTR("isThreadNetworkUp"), v38);
  v63[11] = v20;
  v21 = objc_alloc(MEMORY[0x1E0D28548]);
  v22 = (void *)MEMORY[0x1E0CB37E8];
  -[HMDAccessorySessionMetric sessionInfo](self, "sessionInfo");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "numberWithUnsignedInteger:", objc_msgSend(v23, "numIPAddresses"));
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = (void *)objc_msgSend(v21, "initWithName:value:", CFSTR("numIPAddressesResolved"), v24);
  v63[12] = v25;
  v26 = objc_alloc(MEMORY[0x1E0D28548]);
  v27 = (void *)MEMORY[0x1E0CB37E8];
  -[HMDAccessorySessionMetric sessionInfo](self, "sessionInfo");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "numberWithUnsignedInteger:", objc_msgSend(v28, "numIPAddressesTried"));
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = (void *)objc_msgSend(v26, "initWithName:value:", CFSTR("numIPAddressesTried"), v29);
  v63[13] = v30;
  v31 = objc_alloc(MEMORY[0x1E0D28548]);
  v32 = (void *)MEMORY[0x1E0CB37E8];
  -[HMDAccessorySessionMetric sessionInfo](self, "sessionInfo");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "numberWithUnsignedInteger:", objc_msgSend(v33, "numBonjourNames"));
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v35 = (void *)objc_msgSend(v31, "initWithName:value:", CFSTR("numBonjourNamesSeen"), v34);
  v63[14] = v35;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v63, 15);
  v37 = (id)objc_claimAutoreleasedReturnValue();

  return v37;
}

- (double)sessionCheckIntervalSec
{
  void *v2;
  double v3;
  double v4;

  -[HMDAccessorySessionMetric accessory](self, "accessory");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "sessionCheckPeriod");
  v4 = v3;

  return v4;
}

- (BOOL)isCurrentPrimaryResident
{
  void *v2;
  void *v3;
  char v4;

  -[HMDAccessorySessionMetric accessory](self, "accessory");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "home");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isCurrentDevicePrimaryResident");

  return v4;
}

- (BOOL)isHomeThreadCapable
{
  void *v2;
  void *v3;
  char v4;

  -[HMDAccessorySessionMetric accessory](self, "accessory");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "home");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isThreadCapable");

  return v4;
}

- (BOOL)isThreadNetworkUp
{
  void *v2;
  void *v3;
  char v4;

  -[HMDAccessorySessionMetric accessory](self, "accessory");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "home");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isThreadNetworkUp");

  return v4;
}

- (BOOL)isPrimaryResidentThreadCapable
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  char v6;

  -[HMDAccessorySessionMetric accessory](self, "accessory");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "home");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "primaryResident");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "capabilities");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "supportsThreadBorderRouter");

  return v6;
}

- (NSError)topError
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  -[HMDAccessorySessionMetric errorCounts](self, "errorCounts");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)objc_msgSend(v2, "copy");

  objc_msgSend(v3, "keysSortedByValueUsingComparator:", &__block_literal_global_185472);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "firstObject");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSError *)v5;
}

- (void)updateSessionState:(BOOL)a3 linkLayerType:(int64_t)a4 sessionInfo:(id)a5 bookkeeping:(id)a6 withError:(id)a7
{
  id v12;
  id v13;
  id v14;
  NSObject *v15;
  id v16;
  id v17;
  id v18;
  _QWORD v19[5];
  id v20;
  id v21;
  id v22;
  int64_t v23;
  BOOL v24;

  v12 = a5;
  v13 = a6;
  v14 = a7;
  -[HMDAccessorySessionMetric workQueue](self, "workQueue");
  v15 = objc_claimAutoreleasedReturnValue();
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __96__HMDAccessorySessionMetric_updateSessionState_linkLayerType_sessionInfo_bookkeeping_withError___block_invoke;
  v19[3] = &unk_1E89C2708;
  v24 = a3;
  v22 = v14;
  v23 = a4;
  v19[4] = self;
  v20 = v12;
  v21 = v13;
  v16 = v14;
  v17 = v13;
  v18 = v12;
  dispatch_async(v15, v19);

}

- (void)_updateSessionState:(BOOL)a3 linkLayerType:(int64_t)a4 sessionInfo:(id)a5 bookkeeping:(id)a6 withError:(id)a7
{
  _BOOL8 v9;
  id v11;
  id v12;
  id v13;
  NSObject *v14;
  void *v15;
  void *v16;
  void *v17;
  HMDAccessorySessionMetric *v18;
  NSObject *v19;
  void *v20;
  void *v21;
  id v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  HMDAccessorySessionMetric *v33;
  NSObject *v34;
  _BOOL4 v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  id v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  double v50;
  double v51;
  double v52;
  void *v53;
  void *v54;
  HMDAccessorySessionMetric *v55;
  NSObject *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  uint64_t i;
  void *v63;
  void *v64;
  void *v65;
  id v66;
  void *v67;
  void *v68;
  id v69;
  void *v70;
  void *v71;
  id v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  int v77;
  void *v78;
  int v79;
  void *v80;
  HMDAccessorySessionMetric *v81;
  NSObject *v82;
  _BOOL4 v83;
  void *v84;
  void *v85;
  void *v86;
  void *v87;
  void *v88;
  void *v89;
  void *v90;
  void *v91;
  uint64_t v92;
  void *v93;
  void *v94;
  id v95;
  void *v96;
  void *v97;
  uint64_t v98;
  void *v99;
  void *v100;
  id v101;
  id v102;
  HMDAccessorySessionMetric *v103;
  HMDAccessorySessionMetric *v104;
  void *v105;
  void *v106;
  void *v107;
  uint64_t v108;
  uint64_t v109;
  __int128 v110;
  __int128 v111;
  __int128 v112;
  __int128 v113;
  uint8_t v114[128];
  uint8_t buf[4];
  void *v116;
  __int16 v117;
  void *v118;
  __int16 v119;
  id v120;
  __int16 v121;
  void *v122;
  uint64_t v123;

  v9 = a3;
  v123 = *MEMORY[0x1E0C80C00];
  v11 = a5;
  v12 = a6;
  v13 = a7;
  -[HMDAccessorySessionMetric workQueue](self, "workQueue");
  v14 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v14);

  if (v9)
  {
    -[HMDAccessorySessionMetric sessionStartTime](self, "sessionStartTime");
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    if (v15)
    {
      HAPLinkLayerTypeDescription();
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMDAccessorySessionMetric setAccessoryTransport:](self, "setAccessoryTransport:", v16);

      v17 = (void *)MEMORY[0x1D17BA0A0]();
      v18 = self;
      HMFGetOSLogHandle();
      v19 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
      {
        HMFGetLogIdentifier();
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        -[HMDAccessorySessionMetric accessoryTransport](v18, "accessoryTransport");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        -[HMDAccessorySessionMetric accessory](v18, "accessory");
        v22 = v12;
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "shortDescription");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        v116 = v20;
        v117 = 2112;
        v118 = v21;
        v119 = 2112;
        v120 = v24;
        _os_log_impl(&dword_1CD062000, v19, OS_LOG_TYPE_DEBUG, "%{public}@Session was already started on %@ for: %@", buf, 0x20u);

        v12 = v22;
      }

      objc_autoreleasePoolPop(v17);
      goto LABEL_63;
    }
  }
  v105 = v12;
  -[HMDAccessorySessionMetric setHasActiveSession:](self, "setHasActiveSession:", v9);
  -[HMDAccessorySessionMetric sessionInfo](self, "sessionInfo");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = v25;
  if (v11)
  {
    v27 = objc_msgSend(v11, "numIPAddresses");
    v28 = objc_msgSend(v11, "numIPAddressesTried");
    v29 = objc_msgSend(v11, "numBonjourNames");
    v25 = v26;
    v30 = v27;
    v31 = v28;
  }
  else
  {
    v30 = 0;
    v31 = 0;
    v29 = 0;
  }
  objc_msgSend(v25, "resetWithNumIPs:numIPsTried:numBonjourNames:", v30, v31, v29);

  v32 = (void *)MEMORY[0x1D17BA0A0]();
  v33 = self;
  HMFGetOSLogHandle();
  v34 = objc_claimAutoreleasedReturnValue();
  v35 = os_log_type_enabled(v34, OS_LOG_TYPE_INFO);
  if (v9)
  {
    if (v35)
    {
      HMFGetLogIdentifier();
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMDAccessorySessionMetric accessoryTransport](v33, "accessoryTransport");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMDAccessorySessionMetric accessory](v33, "accessory");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v38, "shortDescription");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v105, "lastDiscoveryMethod");
      HAPAccessoryServerDiscoveryMethodToString();
      v103 = v33;
      v40 = v13;
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544130;
      v116 = v36;
      v117 = 2114;
      v118 = v37;
      v119 = 2114;
      v120 = v39;
      v121 = 2112;
      v122 = v41;
      _os_log_impl(&dword_1CD062000, v34, OS_LOG_TYPE_INFO, "%{public}@Session started on %{public}@ for accessory: %{public}@ discovered by %@", buf, 0x2Au);

      v13 = v40;
      v33 = v103;

    }
    objc_autoreleasePoolPop(v32);
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDAccessorySessionMetric setSessionStartTime:](v33, "setSessionStartTime:", v42);

    -[HMDAccessorySessionMetric setSuccessfulSessionRetries:](v33, "setSuccessfulSessionRetries:", -[HMDAccessorySessionMetric successfulSessionRetries](v33, "successfulSessionRetries") + 1);
    HAPLinkLayerTypeDescription();
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDAccessorySessionMetric setAccessoryTransport:](v33, "setAccessoryTransport:", v43);

    -[HMDAccessorySessionMetric setIsFromPrimary:](v33, "setIsFromPrimary:", -[HMDAccessorySessionMetric isCurrentPrimaryResident](v33, "isCurrentPrimaryResident"));
    v12 = v105;
    if (v105)
      v33->_isBonjourUpdateForced = objc_msgSend(v105, "lastDiscoveryMethod") == 2;
    goto LABEL_63;
  }
  if (v35)
  {
    HMFGetLogIdentifier();
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDAccessorySessionMetric accessoryTransport](v33, "accessoryTransport");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDAccessorySessionMetric accessory](v33, "accessory");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v46, "shortDescription");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138544130;
    v116 = v44;
    v117 = 2114;
    v118 = v45;
    v119 = 2114;
    v120 = v13;
    v121 = 2112;
    v122 = v47;
    _os_log_impl(&dword_1CD062000, v34, OS_LOG_TYPE_INFO, "%{public}@Session ended on %{public}@ with error: %{public}@ for accessory: %@", buf, 0x2Au);

  }
  objc_autoreleasePoolPop(v32);
  -[HMDAccessorySessionMetric sessionStartTime](v33, "sessionStartTime");
  v48 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = v105;
  if (v48)
  {
    -[HMDAccessorySessionMetric sessionStartTime](v33, "sessionStartTime");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v49, "timeIntervalSinceNow");
    v51 = fabs(v50);
    -[HMDAccessorySessionMetric activeSessionDurationSec](v33, "activeSessionDurationSec");
    -[HMDAccessorySessionMetric setActiveSessionDurationSec:](v33, "setActiveSessionDurationSec:", v52 + v51);

  }
  -[HMDAccessorySessionMetric accessory](v33, "accessory");
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v13)
    goto LABEL_53;
  v101 = v13;
  v102 = v11;
  v54 = (void *)MEMORY[0x1D17BA0A0]();
  v104 = v33;
  v55 = v33;
  HMFGetOSLogHandle();
  v56 = objc_claimAutoreleasedReturnValue();
  v107 = v53;
  if (os_log_type_enabled(v56, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v53, "manufacturer");
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v53, "model");
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v53, "firmwareVersion");
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138544130;
    v116 = v57;
    v117 = 2114;
    v118 = v58;
    v119 = 2114;
    v120 = v59;
    v121 = 2114;
    v122 = v60;
      buf,
      0x2Au);

    v53 = v107;
  }

  objc_autoreleasePoolPop(v54);
  v112 = 0u;
  v113 = 0u;
  v110 = 0u;
  v111 = 0u;
  -[HMDAccessorySessionMetric hapSessionTTRAllowList](v55, "hapSessionTTRAllowList");
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  v109 = objc_msgSend(v61, "countByEnumeratingWithState:objects:count:", &v110, v114, 16);
  if (!v109)
    goto LABEL_52;
  v108 = *(_QWORD *)v111;
  v106 = v61;
  while (2)
  {
    for (i = 0; i != v109; ++i)
    {
      if (*(_QWORD *)v111 != v108)
        objc_enumerationMutation(v61);
      v63 = *(void **)(*((_QWORD *)&v110 + 1) + 8 * i);
      objc_msgSend(v63, "objectForKeyedSubscript:", CFSTR("Manufacturer"));
      v64 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v65 = v64;
      else
        v65 = 0;
      v66 = v65;

      objc_msgSend(v63, "objectForKeyedSubscript:", CFSTR("Model"));
      v67 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v68 = v67;
      else
        v68 = 0;
      v69 = v68;

      objc_msgSend(v63, "objectForKeyedSubscript:", CFSTR("FirmwareVersion"));
      v70 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v71 = v70;
      else
        v71 = 0;
      v72 = v71;

      objc_msgSend(v53, "manufacturer");
      v73 = (void *)objc_claimAutoreleasedReturnValue();
      if (!objc_msgSend(v73, "isEqualToString:", v66))
        goto LABEL_40;
      objc_msgSend(v53, "model");
      v74 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v74, "isEqualToString:", v69) & 1) == 0)
      {

LABEL_40:
        goto LABEL_41;
      }
      objc_msgSend(v53, "firmwareVersion");
      v75 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v75, "versionString");
      v76 = (void *)objc_claimAutoreleasedReturnValue();
      v77 = objc_msgSend(v76, "isEqualToString:", v72);

      v53 = v107;
      v61 = v106;

      if (v77)
      {
        -[HMDAccessorySessionMetric hapSessionTTRTimer](v55, "hapSessionTTRTimer");
        v78 = (void *)objc_claimAutoreleasedReturnValue();
        v79 = objc_msgSend(v78, "isRunning");

        v80 = (void *)MEMORY[0x1D17BA0A0]();
        v81 = v55;
        HMFGetOSLogHandle();
        v82 = objc_claimAutoreleasedReturnValue();
        v83 = os_log_type_enabled(v82, OS_LOG_TYPE_INFO);
        if (v79)
        {
          if (v83)
          {
            HMFGetLogIdentifier();
            v84 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543362;
            v116 = v84;
            _os_log_impl(&dword_1CD062000, v82, OS_LOG_TYPE_INFO, "%{public}@Not starting timer to initiate radar for accessory because one is already running", buf, 0xCu);

          }
          objc_autoreleasePoolPop(v80);
        }
        else
        {
          if (v83)
          {
            HMFGetLogIdentifier();
            v85 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543362;
            v116 = v85;
            _os_log_impl(&dword_1CD062000, v82, OS_LOG_TYPE_INFO, "%{public}@Starting timer to initiate radar for accessory", buf, 0xCu);

          }
          objc_autoreleasePoolPop(v80);
          -[HMDAccessorySessionMetric hapSessionTTRTimer](v81, "hapSessionTTRTimer");
          v86 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v86, "resume");

        }
        v61 = v106;
        goto LABEL_52;
      }
LABEL_41:

    }
    v109 = objc_msgSend(v61, "countByEnumeratingWithState:objects:count:", &v110, v114, 16);
    if (v109)
      continue;
    break;
  }
LABEL_52:

  v13 = v101;
  v11 = v102;
  v33 = v104;
  v12 = v105;
LABEL_53:
  if (v11)
  {
    objc_msgSend(v53, "home");
    v87 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v87, "homeManager");
    v88 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v88, "metricsManager");
    v89 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v89, "threadNetworkObserver");
    v90 = (void *)objc_claimAutoreleasedReturnValue();

    if (v90)
      objc_msgSend(v90, "requestThreadNetworkStateCaptureForAccessory:failingScenario:", v53, 2);

  }
  objc_msgSend(v13, "underlyingErrors");
  v91 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v91, "firstObject");
  v92 = objc_claimAutoreleasedReturnValue();
  v93 = (void *)v92;
  if (v92)
    v94 = (void *)v92;
  else
    v94 = v13;
  v95 = v94;

  if (v95)
  {
    -[HMDAccessorySessionMetric setSessionFailures:](v33, "setSessionFailures:", -[HMDAccessorySessionMetric sessionFailures](v33, "sessionFailures") + 1);
    -[HMDAccessorySessionMetric errorCounts](v33, "errorCounts");
    v96 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v96, "objectForKeyedSubscript:", v95);
    v97 = (void *)objc_claimAutoreleasedReturnValue();
    v98 = objc_msgSend(v97, "integerValue");

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v98 + 1);
    v99 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDAccessorySessionMetric errorCounts](v33, "errorCounts");
    v100 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v100, "setObject:forKeyedSubscript:", v99, v95);

  }
  -[HMDAccessorySessionMetric setSessionStartTime:](v33, "setSessionStartTime:", 0);

LABEL_63:
}

- (void)submitMetric
{
  NSObject *v3;
  _QWORD block[5];

  -[HMDAccessorySessionMetric workQueue](self, "workQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __41__HMDAccessorySessionMetric_submitMetric__block_invoke;
  block[3] = &unk_1E89C2730;
  block[4] = self;
  dispatch_async(v3, block);

}

- (void)_submitMetric
{
  NSObject *v3;
  void *v4;
  double v5;
  void *v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  void *v11;
  void *v12;
  double v13;
  double v14;
  double v15;
  void *v16;
  HMDAccessorySessionMetricEvent *v17;
  void *v18;
  HMDAccessorySessionMetric *v19;
  NSObject *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  double v26;
  double v27;
  void *v28;
  HMDAccessorySessionMetric *v29;
  NSObject *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  int v36;
  void *v37;
  __int16 v38;
  void *v39;
  __int16 v40;
  void *v41;
  __int16 v42;
  void *v43;
  uint64_t v44;

  v44 = *MEMORY[0x1E0C80C00];
  -[HMDAccessorySessionMetric workQueue](self, "workQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  -[HMDAccessorySessionMetric metricCollectionStartTime](self, "metricCollectionStartTime");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "timeIntervalSinceNow");
  -[HMDAccessorySessionMetric setSubmissionIntervalSec:](self, "setSubmissionIntervalSec:", fabs(v5));

  -[HMDAccessorySessionMetric sessionStartTime](self, "sessionStartTime");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[HMDAccessorySessionMetric sessionStartTime](self, "sessionStartTime");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "timeIntervalSinceNow");
    v9 = fabs(v8);
    -[HMDAccessorySessionMetric activeSessionDurationSec](self, "activeSessionDurationSec");
    -[HMDAccessorySessionMetric setActiveSessionDurationSec:](self, "setActiveSessionDurationSec:", v10 + v9);

  }
  -[HMDAccessorySessionMetric reachableStartTime](self, "reachableStartTime");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    -[HMDAccessorySessionMetric reachableStartTime](self, "reachableStartTime");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "timeIntervalSinceNow");
    v14 = fabs(v13);
    -[HMDAccessorySessionMetric reachableDurationSec](self, "reachableDurationSec");
    -[HMDAccessorySessionMetric setReachableDurationSec:](self, "setReachableDurationSec:", v15 + v14);

  }
  -[HMDAccessorySessionMetric accessory](self, "accessory");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = -[HMDAccessorySessionMetricEvent initWithAccessory:sessionMetric:]([HMDAccessorySessionMetricEvent alloc], "initWithAccessory:sessionMetric:", v16, self);
  v18 = (void *)MEMORY[0x1D17BA0A0]();
  v19 = self;
  HMFGetOSLogHandle();
  v20 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "name");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "identifier");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDAccessorySessionMetricEvent coreAnalyticsEventDictionary](v17, "coreAnalyticsEventDictionary");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v36 = 138544130;
    v37 = v21;
    v38 = 2112;
    v39 = v22;
    v40 = 2114;
    v41 = v23;
    v42 = 2114;
    v43 = v24;
    _os_log_impl(&dword_1CD062000, v20, OS_LOG_TYPE_INFO, "%{public}@Submitting SessionMetric for accessory: %@/%{public}@ - %{public}@", (uint8_t *)&v36, 0x2Au);

  }
  objc_autoreleasePoolPop(v18);
  -[HMDAccessorySessionMetric expectedTransport](v19, "expectedTransport");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v25, "isEqualToString:", CFSTR("BLE")) & 1) != 0)
  {

  }
  else
  {
    -[HMDAccessorySessionMetric submissionIntervalSec](v19, "submissionIntervalSec");
    v27 = v26;

    if (v27 >= 3600.0)
    {
      objc_msgSend(v16, "home");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v34, "logEventSubmitter");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v35, "submitLogEvent:", v17);

      goto LABEL_14;
    }
  }
  v28 = (void *)MEMORY[0x1D17BA0A0]();
  v29 = v19;
  HMFGetOSLogHandle();
  v30 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v30, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "name");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "identifier");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v36 = 138543874;
    v37 = v31;
    v38 = 2112;
    v39 = v32;
    v40 = 2114;
    v41 = v33;
    _os_log_impl(&dword_1CD062000, v30, OS_LOG_TYPE_INFO, "%{public}@Skipped Submitting SessionMetric for %@/%{public}@", (uint8_t *)&v36, 0x20u);

  }
  objc_autoreleasePoolPop(v28);
LABEL_14:

}

- (void)resetSessionMetric
{
  NSObject *v3;
  _QWORD block[5];

  -[HMDAccessorySessionMetric workQueue](self, "workQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __47__HMDAccessorySessionMetric_resetSessionMetric__block_invoke;
  block[3] = &unk_1E89C2730;
  block[4] = self;
  dispatch_async(v3, block);

}

- (void)_resetSessionMetric
{
  NSObject *v3;
  void *v4;
  HMDAccessorySessionMetric *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  void *v14;
  __int16 v15;
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  -[HMDAccessorySessionMetric workQueue](self, "workQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  v4 = (void *)MEMORY[0x1D17BA0A0]();
  v5 = self;
  HMFGetOSLogHandle();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    HMFGetLogIdentifier();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDAccessorySessionMetric accessory](v5, "accessory");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "shortDescription");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = 138543618;
    v14 = v7;
    v15 = 2114;
    v16 = v9;
    _os_log_impl(&dword_1CD062000, v6, OS_LOG_TYPE_DEBUG, "%{public}@Resetting session metric - accessory: %{public}@", (uint8_t *)&v13, 0x16u);

  }
  objc_autoreleasePoolPop(v4);
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDAccessorySessionMetric setReachableStartTime:](v5, "setReachableStartTime:", 0);
  -[HMDAccessorySessionMetric setSessionStartTime:](v5, "setSessionStartTime:", 0);
  -[HMDAccessorySessionMetric errorCounts](v5, "errorCounts");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "removeAllObjects");

  -[HMDAccessorySessionMetric setMetricCollectionStartTime:](v5, "setMetricCollectionStartTime:", v10);
  -[HMDAccessorySessionMetric setActiveSessionDurationSec:](v5, "setActiveSessionDurationSec:", 0.0);
  -[HMDAccessorySessionMetric setReachableDurationSec:](v5, "setReachableDurationSec:", 0.0);
  -[HMDAccessorySessionMetric setSessionFailures:](v5, "setSessionFailures:", 0);
  -[HMDAccessorySessionMetric setSuccessfulSessionRetries:](v5, "setSuccessfulSessionRetries:", 0);
  if (-[HMDAccessorySessionMetric isReachable](v5, "isReachable"))
    -[HMDAccessorySessionMetric setReachableStartTime:](v5, "setReachableStartTime:", v10);
  if (-[HMDAccessorySessionMetric hasActiveSession](v5, "hasActiveSession"))
    -[HMDAccessorySessionMetric setSessionStartTime:](v5, "setSessionStartTime:", v10);
  -[HMDAccessorySessionMetric sessionInfo](v5, "sessionInfo");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "resetWithNumIPs:numIPsTried:numBonjourNames:", 0, 0, 0);

}

- (void)updateReachableState:(BOOL)a3
{
  NSObject *v5;
  _QWORD v6[5];
  BOOL v7;

  -[HMDAccessorySessionMetric workQueue](self, "workQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __50__HMDAccessorySessionMetric_updateReachableState___block_invoke;
  v6[3] = &unk_1E89C2758;
  v7 = a3;
  v6[4] = self;
  dispatch_async(v5, v6);

}

- (void)timerDidFire:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  void *v7;
  void *v8;
  HMDAccessorySessionMetric *v9;
  NSObject *v10;
  _BOOL4 v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint8_t buf[4];
  void *v21;
  __int16 v22;
  void *v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[HMDAccessorySessionMetric workQueue](self, "workQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  -[HMDAccessorySessionMetric hapSessionTTRTimer](self, "hapSessionTTRTimer");
  v6 = (id)objc_claimAutoreleasedReturnValue();

  if (v6 == v4)
  {
    -[HMDAccessorySessionMetric accessory](self, "accessory");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (void *)MEMORY[0x1D17BA0A0]();
    v9 = self;
    HMFGetOSLogHandle();
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = os_log_type_enabled(v10, OS_LOG_TYPE_INFO);
    if (v7)
    {
      if (v11)
      {
        HMFGetLogIdentifier();
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "shortDescription");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v21 = v12;
        v22 = 2114;
        v23 = v13;
        _os_log_impl(&dword_1CD062000, v10, OS_LOG_TYPE_INFO, "%{public}@HAP session TTR timer fired. Initiating radar for allowed accessory: %{public}@", buf, 0x16u);

      }
      objc_autoreleasePoolPop(v8);
      -[HMDAccessorySessionMetric radarInitiator](v9, "radarInitiator");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = (void *)MEMORY[0x1E0CB3940];
      objc_msgSend(v7, "manufacturer");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "model");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "stringWithFormat:", CFSTR("Lost connection with Accessory: %@ Model: %@"), v16, v17);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "requestRadarWithDisplayReason:radarTitle:", CFSTR("a HAP session failure was detected"), v18);

    }
    else
    {
      if (v11)
      {
        HMFGetLogIdentifier();
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v21 = v19;
        _os_log_impl(&dword_1CD062000, v10, OS_LOG_TYPE_INFO, "%{public}@Accessory reference is nil when handling HAP session TTR timer", buf, 0xCu);

      }
      objc_autoreleasePoolPop(v8);
    }

  }
}

- (id)logIdentifier
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  -[HMDAccessorySessionMetric accessory](self, "accessory");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(v2, "name");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@/%@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (NSString)accessoryTransport
{
  return self->_accessoryTransport;
}

- (void)setAccessoryTransport:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (double)activeSessionDurationSec
{
  return self->_activeSessionDurationSec;
}

- (void)setActiveSessionDurationSec:(double)a3
{
  self->_activeSessionDurationSec = a3;
}

- (double)reachableDurationSec
{
  return self->_reachableDurationSec;
}

- (void)setReachableDurationSec:(double)a3
{
  self->_reachableDurationSec = a3;
}

- (unint64_t)sessionFailures
{
  return self->_sessionFailures;
}

- (void)setSessionFailures:(unint64_t)a3
{
  self->_sessionFailures = a3;
}

- (unint64_t)successfulSessionRetries
{
  return self->_successfulSessionRetries;
}

- (void)setSuccessfulSessionRetries:(unint64_t)a3
{
  self->_successfulSessionRetries = a3;
}

- (void)setTopError:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (double)submissionIntervalSec
{
  return self->_submissionIntervalSec;
}

- (void)setSubmissionIntervalSec:(double)a3
{
  self->_submissionIntervalSec = a3;
}

- (BOOL)isFromPrimary
{
  return self->_isFromPrimary;
}

- (void)setIsFromPrimary:(BOOL)a3
{
  self->_isFromPrimary = a3;
}

- (BOOL)isBonjourUpdateForced
{
  return self->_isBonjourUpdateForced;
}

- (NSString)expectedTransport
{
  return self->_expectedTransport;
}

- (HAP2AccessorySessionInfo)sessionInfo
{
  return self->_sessionInfo;
}

- (void)setSessionInfo:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 80);
}

- (HMDHAPAccessory)accessory
{
  return (HMDHAPAccessory *)objc_loadWeakRetained((id *)&self->_accessory);
}

- (OS_dispatch_queue)workQueue
{
  return self->_workQueue;
}

- (HMFTimer)hapSessionTTRTimer
{
  return self->_hapSessionTTRTimer;
}

- (NSArray)hapSessionTTRAllowList
{
  return self->_hapSessionTTRAllowList;
}

- (HMMRadarInitiating)radarInitiator
{
  return (HMMRadarInitiating *)objc_loadWeakRetained((id *)&self->_radarInitiator);
}

- (NSDate)sessionStartTime
{
  return self->_sessionStartTime;
}

- (void)setSessionStartTime:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 128);
}

- (BOOL)hasActiveSession
{
  return self->_hasActiveSession;
}

- (void)setHasActiveSession:(BOOL)a3
{
  self->_hasActiveSession = a3;
}

- (NSDate)reachableStartTime
{
  return self->_reachableStartTime;
}

- (void)setReachableStartTime:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 136);
}

- (BOOL)isReachable
{
  return self->_isReachable;
}

- (void)setIsReachable:(BOOL)a3
{
  self->_isReachable = a3;
}

- (NSDate)metricCollectionStartTime
{
  return self->_metricCollectionStartTime;
}

- (void)setMetricCollectionStartTime:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 144);
}

- (NSMutableDictionary)errorCounts
{
  return self->_errorCounts;
}

- (void)setErrorCounts:(id)a3
{
  objc_storeStrong((id *)&self->_errorCounts, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_errorCounts, 0);
  objc_storeStrong((id *)&self->_metricCollectionStartTime, 0);
  objc_storeStrong((id *)&self->_reachableStartTime, 0);
  objc_storeStrong((id *)&self->_sessionStartTime, 0);
  objc_destroyWeak((id *)&self->_radarInitiator);
  objc_storeStrong((id *)&self->_hapSessionTTRAllowList, 0);
  objc_storeStrong((id *)&self->_hapSessionTTRTimer, 0);
  objc_storeStrong((id *)&self->_workQueue, 0);
  objc_destroyWeak((id *)&self->_accessory);
  objc_storeStrong((id *)&self->_sessionInfo, 0);
  objc_storeStrong((id *)&self->_expectedTransport, 0);
  objc_storeStrong((id *)&self->_topError, 0);
  objc_storeStrong((id *)&self->_accessoryTransport, 0);
}

void __50__HMDAccessorySessionMetric_updateReachableState___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  const char *v9;
  NSObject *v10;
  os_log_type_t v11;
  _BOOL8 v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  double v17;
  double v18;
  double v19;
  void *v20;
  id v21;
  NSObject *v22;
  void *v23;
  void *v24;
  void *v25;
  const char *v26;
  NSObject *v27;
  os_log_type_t v28;
  int v29;
  void *v30;
  __int16 v31;
  void *v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  if (*(_BYTE *)(a1 + 40))
  {
    objc_msgSend(*(id *)(a1 + 32), "reachableStartTime");
    v2 = (void *)objc_claimAutoreleasedReturnValue();

    if (v2)
    {
      v3 = (void *)MEMORY[0x1D17BA0A0]();
      v4 = *(id *)(a1 + 32);
      HMFGetOSLogHandle();
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
      {
        HMFGetLogIdentifier();
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(a1 + 32), "accessory");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "shortDescription");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v29 = 138543618;
        v30 = v6;
        v31 = 2112;
        v32 = v8;
        v9 = "%{public}@Was already reachable for: %@";
        v10 = v5;
        v11 = OS_LOG_TYPE_DEBUG;
LABEL_10:
        _os_log_impl(&dword_1CD062000, v10, v11, v9, (uint8_t *)&v29, 0x16u);

        goto LABEL_11;
      }
      goto LABEL_11;
    }
    v12 = *(_BYTE *)(a1 + 40) != 0;
  }
  else
  {
    v12 = 0;
  }
  objc_msgSend(*(id *)(a1 + 32), "setIsReachable:", v12);
  if (*(_BYTE *)(a1 + 40))
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "setReachableStartTime:", v13);

    v3 = (void *)MEMORY[0x1D17BA0A0]();
    v4 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "accessory");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "shortDescription");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v29 = 138543618;
      v30 = v6;
      v31 = 2114;
      v32 = v8;
      v9 = "%{public}@Reachable started for accessory: %{public}@";
      v10 = v5;
      v11 = OS_LOG_TYPE_INFO;
      goto LABEL_10;
    }
LABEL_11:

    objc_autoreleasePoolPop(v3);
    return;
  }
  objc_msgSend(*(id *)(a1 + 32), "reachableStartTime");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (v14)
  {
    v15 = *(void **)(a1 + 32);
    objc_msgSend(v15, "reachableStartTime");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "timeIntervalSinceNow");
    v18 = fabs(v17);
    objc_msgSend(v15, "reachableDurationSec");
    objc_msgSend(v15, "setReachableDurationSec:", v19 + v18);

    v20 = (void *)MEMORY[0x1D17BA0A0]();
    v21 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "accessory");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "shortDescription");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v29 = 138543618;
      v30 = v23;
      v31 = 2114;
      v32 = v25;
      v26 = "%{public}@Reachable stopped for accessory: %{public}@";
      v27 = v22;
      v28 = OS_LOG_TYPE_INFO;
LABEL_17:
      _os_log_impl(&dword_1CD062000, v27, v28, v26, (uint8_t *)&v29, 0x16u);

    }
  }
  else
  {
    v20 = (void *)MEMORY[0x1D17BA0A0]();
    v21 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
    {
      HMFGetLogIdentifier();
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "accessory");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "shortDescription");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v29 = 138543618;
      v30 = v23;
      v31 = 2112;
      v32 = v25;
      v26 = "%{public}@Was not reachable for: %@";
      v27 = v22;
      v28 = OS_LOG_TYPE_DEBUG;
      goto LABEL_17;
    }
  }

  objc_autoreleasePoolPop(v20);
  objc_msgSend(*(id *)(a1 + 32), "setReachableStartTime:", 0);
}

uint64_t __47__HMDAccessorySessionMetric_resetSessionMetric__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_resetSessionMetric");
}

uint64_t __41__HMDAccessorySessionMetric_submitMetric__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_submitMetric");
}

uint64_t __96__HMDAccessorySessionMetric_updateSessionState_linkLayerType_sessionInfo_bookkeeping_withError___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_updateSessionState:linkLayerType:sessionInfo:bookkeeping:withError:", *(unsigned __int8 *)(a1 + 72), *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));
}

uint64_t __37__HMDAccessorySessionMetric_topError__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v4 = a2;
  v5 = a3;
  v6 = objc_msgSend(v4, "integerValue");
  if (v6 == objc_msgSend(v5, "integerValue"))
  {
    v7 = 0;
  }
  else
  {
    v8 = objc_msgSend(v4, "integerValue");
    if (v8 < objc_msgSend(v5, "integerValue"))
      v7 = 1;
    else
      v7 = -1;
  }

  return v7;
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t20_185531 != -1)
    dispatch_once(&logCategory__hmf_once_t20_185531, &__block_literal_global_72_185532);
  return (id)logCategory__hmf_once_v21_185533;
}

void __40__HMDAccessorySessionMetric_logCategory__block_invoke()
{
  uint64_t v0;
  void *v1;

  HMFCreateOSLogHandle();
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)logCategory__hmf_once_v21_185533;
  logCategory__hmf_once_v21_185533 = v0;

}

@end
