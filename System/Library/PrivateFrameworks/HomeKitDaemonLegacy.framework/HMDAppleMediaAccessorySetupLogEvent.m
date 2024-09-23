@implementation HMDAppleMediaAccessorySetupLogEvent

- (HMDAppleMediaAccessorySetupLogEvent)initWithRole:(int64_t)a3 setupStartTime:(unint64_t)a4 setupEndTime:(unint64_t)a5 accessoryAddEndTime:(unint64_t)a6 accessoryRemoveTime:(unint64_t)a7 configurationEndTime:(unint64_t)a8 setupSessionError:(id)a9 setupSessionIdentifier:(id)a10 isRepairSession:(BOOL)a11 category:(id)a12 accessorySoftwareVersion:(id)a13 setupClientBundleID:(id)a14 retryCount:(unint64_t)a15 firstSettingTime:(unint64_t)a16 languageSettingTime:(unint64_t)a17 accessoryInDefaultRoom:(BOOL)a18 lastPrimaryResidentAvailableTime:(unint64_t)a19 numberOfTimesPrimaryResidentChanged:(unsigned int)a20 lastPrimaryClientConnectedTime:(unint64_t)a21 numberOfTimesPrimaryClientConnected:(unsigned int)a22 numberOfTimesPrimaryClientDisconnected:(unsigned int)a23 numberOfTimesPrimaryClientConnectMessageFailed:(unsigned int)a24 lastPrimaryClientConnectMessageFailError:(id)a25 accessoryDiagnosticInfoFetchError:(id)a26 primaryResidentDiagnosticInfoFetchError:(id)a27
{
  id v30;
  id v31;
  id v32;
  id v33;
  void *v34;
  HMDAppleMediaAccessorySetupLogEvent *v35;
  uint64_t v36;
  NSNumber *role;
  uint64_t v38;
  NSError *setupSessionError;
  uint64_t v40;
  NSString *category;
  uint64_t v42;
  NSString *accessorySoftwareVersion;
  uint64_t v44;
  NSNumber *retryCount;
  id v51;
  id v52;
  id v53;
  id v54;
  objc_super v55;

  v54 = a9;
  v53 = a10;
  v30 = a12;
  v31 = a13;
  v52 = a14;
  v32 = a25;
  v33 = a26;
  v34 = v31;
  v51 = a27;
  v55.receiver = self;
  v55.super_class = (Class)HMDAppleMediaAccessorySetupLogEvent;
  v35 = -[HMMLogEvent init](&v55, sel_init);
  if (v35)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
    v36 = objc_claimAutoreleasedReturnValue();
    role = v35->_role;
    v35->_role = (NSNumber *)v36;

    v35->_setupStartTime = a4;
    v35->_setupEndTime = a5;
    v35->_accessoryAddEndTime = a6;
    v35->_accessoryRemoveTime = a7;
    v35->_configurationEndTime = a8;
    v38 = objc_msgSend(v54, "copy");
    setupSessionError = v35->_setupSessionError;
    v35->_setupSessionError = (NSError *)v38;

    v35->_isRepairSession = a11;
    v40 = objc_msgSend(v30, "copy");
    category = v35->_category;
    v35->_category = (NSString *)v40;

    v42 = objc_msgSend(v34, "copy");
    accessorySoftwareVersion = v35->_accessorySoftwareVersion;
    v35->_accessorySoftwareVersion = (NSString *)v42;

    objc_storeStrong((id *)&v35->_setupClientBundleID, a14);
    objc_storeStrong((id *)&v35->_setupSessionIdentifier, a10);
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a15);
    v44 = objc_claimAutoreleasedReturnValue();
    retryCount = v35->_retryCount;
    v35->_retryCount = (NSNumber *)v44;

    v35->_languageSettingTime = a17;
    v35->_firstSettingTime = a16;
    v35->_accessoryInDefaultRoom = a18;
    v35->_lastPrimaryResidentAvailableTime = a19;
    v35->_numberOfTimesPrimaryResidentChanged = a20;
    v35->_lastPrimaryClientConnectedTime = a21;
    v35->_numberOfTimesPrimaryClientConnected = a22;
    v35->_numberOfTimesPrimaryClientDisconnected = a23;
    v35->_numberOfTimesPrimaryClientConnectMessageFailed = a24;
    objc_storeStrong((id *)&v35->_lastPrimaryClientConnectMessageFailError, a25);
    objc_storeStrong((id *)&v35->_accessoryDiagnosticInfoFetchError, a26);
    objc_storeStrong((id *)&v35->_primaryResidentDiagnosticInfoFetchError, a27);
  }

  return v35;
}

- (NSString)coreAnalyticsEventName
{
  return (NSString *)CFSTR("com.apple.HomeKit.daemon.homepod.accessory.setup.metric.event");
}

- (NSDictionary)coreAnalyticsEventDictionary
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
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
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
  void *v35;
  void *v36;
  void *v37;
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
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;

  v3 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  if (-[HMDAppleMediaAccessorySetupLogEvent configurationEndTime](self, "configurationEndTime"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", -[HMDAppleMediaAccessorySetupLogEvent configurationEndTime](self, "configurationEndTime")- -[HMDAppleMediaAccessorySetupLogEvent setupStartTime](self, "setupStartTime"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v4, CFSTR("configurationDuration"));

  }
  if (-[HMDAppleMediaAccessorySetupLogEvent setupEndTime](self, "setupEndTime"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", -[HMDAppleMediaAccessorySetupLogEvent setupEndTime](self, "setupEndTime")- -[HMDAppleMediaAccessorySetupLogEvent setupStartTime](self, "setupStartTime"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("setupDuration"));

  }
  if (-[HMDAppleMediaAccessorySetupLogEvent accessoryAddEndTime](self, "accessoryAddEndTime"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", -[HMDAppleMediaAccessorySetupLogEvent accessoryAddEndTime](self, "accessoryAddEndTime")- -[HMDAppleMediaAccessorySetupLogEvent setupStartTime](self, "setupStartTime"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("hmd_latencyAccessoryAddComplete"));

  }
  if (-[HMDAppleMediaAccessorySetupLogEvent firstSettingTime](self, "firstSettingTime"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", -[HMDAppleMediaAccessorySetupLogEvent firstSettingTime](self, "firstSettingTime")- -[HMDAppleMediaAccessorySetupLogEvent setupStartTime](self, "setupStartTime"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("hmd_latencyFirstSettingObserved"));

  }
  if (-[HMDAppleMediaAccessorySetupLogEvent languageSettingTime](self, "languageSettingTime"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", -[HMDAppleMediaAccessorySetupLogEvent languageSettingTime](self, "languageSettingTime")- -[HMDAppleMediaAccessorySetupLogEvent setupStartTime](self, "setupStartTime"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v8, CFSTR("hmd_latencyLanguageSettingObserved"));

  }
  if (-[HMDAppleMediaAccessorySetupLogEvent accessoryRemoveTime](self, "accessoryRemoveTime"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", -[HMDAppleMediaAccessorySetupLogEvent accessoryRemoveTime](self, "accessoryRemoveTime")- -[HMDAppleMediaAccessorySetupLogEvent setupStartTime](self, "setupStartTime"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, CFSTR("accessoryRemoveTime"));

  }
  if (-[HMDAppleMediaAccessorySetupLogEvent lastPrimaryResidentAvailableTime](self, "lastPrimaryResidentAvailableTime"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", -[HMDAppleMediaAccessorySetupLogEvent lastPrimaryResidentAvailableTime](self, "lastPrimaryResidentAvailableTime")- -[HMDAppleMediaAccessorySetupLogEvent accessoryAddEndTime](self, "accessoryAddEndTime"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v10, CFSTR("hmd_latencyLastPrimaryResidentAvailableTime"));

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[HMDAppleMediaAccessorySetupLogEvent numberOfTimesPrimaryResidentChanged](self, "numberOfTimesPrimaryResidentChanged"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v11, CFSTR("hmd_numberOfTimesPrimaryResidentChanged"));

  }
  if (-[HMDAppleMediaAccessorySetupLogEvent lastPrimaryClientConnectedTime](self, "lastPrimaryClientConnectedTime"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", -[HMDAppleMediaAccessorySetupLogEvent lastPrimaryClientConnectedTime](self, "lastPrimaryClientConnectedTime")- -[HMDAppleMediaAccessorySetupLogEvent accessoryAddEndTime](self, "accessoryAddEndTime"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v12, CFSTR("hmd_latencyLastPrimaryClientConnectedTime"));

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[HMDAppleMediaAccessorySetupLogEvent numberOfTimesPrimaryClientConnected](self, "numberOfTimesPrimaryClientConnected"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v13, CFSTR("hmd_numberOfTimesPrimaryClientConnected"));

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[HMDAppleMediaAccessorySetupLogEvent numberOfTimesPrimaryClientDisconnected](self, "numberOfTimesPrimaryClientDisconnected"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v14, CFSTR("hmd_numberOfTimesPrimaryClientDisconnected"));

  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[HMDAppleMediaAccessorySetupLogEvent numberOfTimesPrimaryClientConnectMessageFailed](self, "numberOfTimesPrimaryClientConnectMessageFailed"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v15, CFSTR("hmd_numberOfTimesPrimaryClientConnectMessageFailed"));

  -[HMDAppleMediaAccessorySetupLogEvent lastPrimaryClientConnectMessageFailError](self, "lastPrimaryClientConnectMessageFailError");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (v16)
  {
    v17 = (void *)MEMORY[0x1E0CB37E8];
    -[HMDAppleMediaAccessorySetupLogEvent lastPrimaryClientConnectMessageFailError](self, "lastPrimaryClientConnectMessageFailError");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "numberWithInteger:", objc_msgSend(v18, "code"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v19, CFSTR("hmd_primaryClientConnectMessageErrorCode"));

    -[HMDAppleMediaAccessorySetupLogEvent lastPrimaryClientConnectMessageFailError](self, "lastPrimaryClientConnectMessageFailError");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "domain");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v21, CFSTR("hmd_primaryClientConnectMessageErrorDomain"));

    -[HMDAppleMediaAccessorySetupLogEvent lastPrimaryClientConnectMessageFailError](self, "lastPrimaryClientConnectMessageFailError");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "underlyingErrors");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "firstObject");
    v24 = (void *)objc_claimAutoreleasedReturnValue();

    if (v24)
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(v24, "code"));
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v25, CFSTR("hmd_primaryClientConnectMessageUnderlyingErrorCode"));

      objc_msgSend(v24, "domain");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v26, CFSTR("hmd_primaryClientConnectMessageUnderlyingErrorDomain"));

    }
  }
  -[HMDAppleMediaAccessorySetupLogEvent accessoryDiagnosticInfoFetchError](self, "accessoryDiagnosticInfoFetchError");
  v27 = (void *)objc_claimAutoreleasedReturnValue();

  if (v27)
  {
    v28 = (void *)MEMORY[0x1E0CB37E8];
    -[HMDAppleMediaAccessorySetupLogEvent accessoryDiagnosticInfoFetchError](self, "accessoryDiagnosticInfoFetchError");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "numberWithInteger:", objc_msgSend(v29, "code"));
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v30, CFSTR("hmd_accessoryDiagnosticInfoFetchErrorCode"));

    -[HMDAppleMediaAccessorySetupLogEvent accessoryDiagnosticInfoFetchError](self, "accessoryDiagnosticInfoFetchError");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "domain");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v32, CFSTR("hmd_accessoryDiagnosticInfoFetchErrorDomain"));

    -[HMDAppleMediaAccessorySetupLogEvent accessoryDiagnosticInfoFetchError](self, "accessoryDiagnosticInfoFetchError");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "underlyingErrors");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "firstObject");
    v35 = (void *)objc_claimAutoreleasedReturnValue();

    if (v35)
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(v35, "code"));
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v36, CFSTR("hmd_accessoryDiagnosticInfoFetchUnderlyingErrorCode"));

      objc_msgSend(v35, "domain");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v37, CFSTR("hmd_accessoryDiagnosticInfoFetchUnderlyingErrorDomain"));

    }
  }
  -[HMDAppleMediaAccessorySetupLogEvent primaryResidentDiagnosticInfoFetchError](self, "primaryResidentDiagnosticInfoFetchError");
  v38 = (void *)objc_claimAutoreleasedReturnValue();

  if (v38)
  {
    v39 = (void *)MEMORY[0x1E0CB37E8];
    -[HMDAppleMediaAccessorySetupLogEvent primaryResidentDiagnosticInfoFetchError](self, "primaryResidentDiagnosticInfoFetchError");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "numberWithInteger:", objc_msgSend(v40, "code"));
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v41, CFSTR("hmd_primaryResidentDiagnosticInfoFetchErrorCode"));

    -[HMDAppleMediaAccessorySetupLogEvent primaryResidentDiagnosticInfoFetchError](self, "primaryResidentDiagnosticInfoFetchError");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v42, "domain");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v43, CFSTR("hmd_primaryResidentDiagnosticInfoFetchErrorDomain"));

    -[HMDAppleMediaAccessorySetupLogEvent primaryResidentDiagnosticInfoFetchError](self, "primaryResidentDiagnosticInfoFetchError");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v44, "underlyingErrors");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v45, "firstObject");
    v46 = (void *)objc_claimAutoreleasedReturnValue();

    if (v46)
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(v46, "code"));
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v47, CFSTR("hmd_primaryResidentDiagnosticInfoFetchUnderlyingErrorCode"));

      objc_msgSend(v46, "domain");
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v48, CFSTR("hmd_primaryResidentDiagnosticInfoFetchUnderlyingErrorDomain"));

    }
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[HMDAppleMediaAccessorySetupLogEvent isRepairSession](self, "isRepairSession"));
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v49, CFSTR("isRepairSession"));

  -[HMDAppleMediaAccessorySetupLogEvent setupClientBundleID](self, "setupClientBundleID");
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v50, CFSTR("setupClientBundleID"));

  -[HMDAppleMediaAccessorySetupLogEvent setupSessionIdentifier](self, "setupSessionIdentifier");
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v51, CFSTR("setupSessionIdentifier"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[HMDAppleMediaAccessorySetupLogEvent accessoryInDefaultRoom](self, "accessoryInDefaultRoom"));
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v52, CFSTR("accessoryInDefaultRoom"));

  -[HMDAppleMediaAccessorySetupLogEvent role](self, "role");
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v53, CFSTR("role"));

  -[HMDAppleMediaAccessorySetupLogEvent category](self, "category");
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v54, CFSTR("category"));

  -[HMDAppleMediaAccessorySetupLogEvent accessorySoftwareVersion](self, "accessorySoftwareVersion");
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v55, CFSTR("accessorySoftwareVersion"));

  -[HMDAppleMediaAccessorySetupLogEvent setupSessionError](self, "setupSessionError");
  v56 = (void *)objc_claimAutoreleasedReturnValue();

  if (v56)
  {
    v57 = (void *)MEMORY[0x1E0CB37E8];
    -[HMDAppleMediaAccessorySetupLogEvent setupSessionError](self, "setupSessionError");
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v57, "numberWithInteger:", objc_msgSend(v58, "code"));
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v59, CFSTR("setupSessionErrorCode"));

    -[HMDAppleMediaAccessorySetupLogEvent setupSessionError](self, "setupSessionError");
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v60, "domain");
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v61, CFSTR("setupSessionErrorDomain"));

  }
  -[HMMLogEvent error](self, "error");
  v62 = (void *)objc_claimAutoreleasedReturnValue();

  if (v62)
  {
    v63 = (void *)MEMORY[0x1E0CB37E8];
    -[HMMLogEvent error](self, "error");
    v64 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v63, "numberWithInteger:", objc_msgSend(v64, "code"));
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v65, CFSTR("configurationErrorCode"));

    -[HMMLogEvent error](self, "error");
    v66 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v66, "domain");
    v67 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v67, CFSTR("configurationErrorDomain"));

  }
  -[HMDAppleMediaAccessorySetupLogEvent category](self, "category");
  v68 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v68, CFSTR("category"));

  -[HMDAppleMediaAccessorySetupLogEvent retryCount](self, "retryCount");
  v69 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v69, CFSTR("retryCount"));

  v70 = (void *)objc_msgSend(v3, "copy");
  return (NSDictionary *)v70;
}

- (unint64_t)coreAnalyticsEventOptions
{
  return 1;
}

- (NSNumber)role
{
  return (NSNumber *)objc_getProperty(self, a2, 64, 1);
}

- (unint64_t)setupStartTime
{
  return self->_setupStartTime;
}

- (unint64_t)setupEndTime
{
  return self->_setupEndTime;
}

- (unint64_t)accessoryAddEndTime
{
  return self->_accessoryAddEndTime;
}

- (unint64_t)accessoryRemoveTime
{
  return self->_accessoryRemoveTime;
}

- (unint64_t)configurationEndTime
{
  return self->_configurationEndTime;
}

- (NSError)setupSessionError
{
  return (NSError *)objc_getProperty(self, a2, 112, 1);
}

- (BOOL)isRepairSession
{
  return self->_isRepairSession;
}

- (NSString)setupSessionIdentifier
{
  return (NSString *)objc_getProperty(self, a2, 120, 1);
}

- (NSString)category
{
  return (NSString *)objc_getProperty(self, a2, 128, 1);
}

- (NSString)setupClientBundleID
{
  return (NSString *)objc_getProperty(self, a2, 136, 1);
}

- (NSString)accessorySoftwareVersion
{
  return (NSString *)objc_getProperty(self, a2, 144, 1);
}

- (NSNumber)retryCount
{
  return (NSNumber *)objc_getProperty(self, a2, 152, 1);
}

- (unint64_t)firstSettingTime
{
  return self->_firstSettingTime;
}

- (unint64_t)languageSettingTime
{
  return self->_languageSettingTime;
}

- (BOOL)accessoryInDefaultRoom
{
  return self->_accessoryInDefaultRoom;
}

- (unint64_t)lastPrimaryResidentAvailableTime
{
  return self->_lastPrimaryResidentAvailableTime;
}

- (unsigned)numberOfTimesPrimaryResidentChanged
{
  return self->_numberOfTimesPrimaryResidentChanged;
}

- (unint64_t)lastPrimaryClientConnectedTime
{
  return self->_lastPrimaryClientConnectedTime;
}

- (unsigned)numberOfTimesPrimaryClientConnected
{
  return self->_numberOfTimesPrimaryClientConnected;
}

- (unsigned)numberOfTimesPrimaryClientDisconnected
{
  return self->_numberOfTimesPrimaryClientDisconnected;
}

- (unsigned)numberOfTimesPrimaryClientConnectMessageFailed
{
  return self->_numberOfTimesPrimaryClientConnectMessageFailed;
}

- (NSError)lastPrimaryClientConnectMessageFailError
{
  return (NSError *)objc_getProperty(self, a2, 192, 1);
}

- (NSError)accessoryDiagnosticInfoFetchError
{
  return (NSError *)objc_getProperty(self, a2, 200, 1);
}

- (NSError)primaryResidentDiagnosticInfoFetchError
{
  return (NSError *)objc_getProperty(self, a2, 208, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_primaryResidentDiagnosticInfoFetchError, 0);
  objc_storeStrong((id *)&self->_accessoryDiagnosticInfoFetchError, 0);
  objc_storeStrong((id *)&self->_lastPrimaryClientConnectMessageFailError, 0);
  objc_storeStrong((id *)&self->_retryCount, 0);
  objc_storeStrong((id *)&self->_accessorySoftwareVersion, 0);
  objc_storeStrong((id *)&self->_setupClientBundleID, 0);
  objc_storeStrong((id *)&self->_category, 0);
  objc_storeStrong((id *)&self->_setupSessionIdentifier, 0);
  objc_storeStrong((id *)&self->_setupSessionError, 0);
  objc_storeStrong((id *)&self->_role, 0);
}

@end
