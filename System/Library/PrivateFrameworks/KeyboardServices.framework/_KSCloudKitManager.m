@implementation _KSCloudKitManager

- (void)queryAccountStatusWithCompletionHandler:(id)a3
{
  id v4;
  NSObject *ckWorkQueue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  ckWorkQueue = self->_ckWorkQueue;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __62___KSCloudKitManager_queryAccountStatusWithCompletionHandler___block_invoke;
  v7[3] = &unk_24E204BB8;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(ckWorkQueue, v7);

}

+ (id)prepareContainerForID:(id)a3
{
  id v3;
  uint64_t v4;
  void *v5;

  v3 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v4 = objc_msgSend(objc_alloc(MEMORY[0x24BDB9030]), "initWithContainerID:", v3);
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDB9030], "containerWithIdentifier:", v3);
    v4 = objc_claimAutoreleasedReturnValue();
  }
  v5 = (void *)v4;

  return v5;
}

- (void)shouldDetectAccountChangeWithResponse:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __60___KSCloudKitManager_shouldDetectAccountChangeWithResponse___block_invoke;
  v6[3] = &unk_24E204B18;
  v6[4] = self;
  v7 = v4;
  v5 = v4;
  -[_KSCloudKitManager userIdentityWithResponse:](self, "userIdentityWithResponse:", v6);

}

- (void)userIdentityWithResponse:(id)a3
{
  id v4;
  void *v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  if (v4)
  {
    -[_KSCloudKitManager cloudKitContainer](self, "cloudKitContainer");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6[0] = MEMORY[0x24BDAC760];
    v6[1] = 3221225472;
    v6[2] = __47___KSCloudKitManager_userIdentityWithResponse___block_invoke;
    v6[3] = &unk_24E204A28;
    v6[4] = self;
    v7 = v4;
    objc_msgSend(v5, "fetchUserRecordIDWithCompletionHandler:", v6);

  }
}

- (void)_checkAccountStatusWithCompletionHandler:(id)a3 withRetryCount:(unint64_t)a4
{
  id v6;
  void *v7;
  id v8;
  _QWORD v9[5];
  id v10;
  unint64_t v11;

  v6 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_ckWorkQueue);
  -[_KSCloudKitManager cloudKitContainer](self, "cloudKitContainer");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __78___KSCloudKitManager__checkAccountStatusWithCompletionHandler_withRetryCount___block_invoke;
  v9[3] = &unk_24E204C80;
  v10 = v6;
  v11 = a4;
  v9[4] = self;
  v8 = v6;
  objc_msgSend(v7, "accountInfoWithCompletionHandler:", v9);

}

- (CKContainer)cloudKitContainer
{
  return self->_cloudKitContainer;
}

- (BOOL)isAccountAvailable
{
  void *v3;
  char v4;
  NSObject *v5;
  NSObject *ckWorkQueue;
  NSObject *v7;
  dispatch_time_t v8;
  NSObject *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  BOOL v17;
  NSObject *v18;
  void *v19;
  NSObject *v20;
  _QWORD block[5];
  NSObject *v23;
  __int128 *v24;
  uint8_t buf[4];
  const char *v26;
  __int16 v27;
  void *v28;
  __int128 v29;
  uint64_t v30;
  char v31;
  uint64_t v32;

  v32 = *MEMORY[0x24BDAC8D0];
  if (_os_feature_enabled_impl()
    && (objc_msgSend(getCloudSettingsManagerClass(), "sharedCloudSettingsManager"),
        v3 = (void *)objc_claimAutoreleasedReturnValue(),
        v4 = objc_msgSend(v3, "isEnabledForStore:", CFSTR("com.apple.cloudsettings.keyboard")),
        v3,
        (v4 & 1) == 0))
  {
    KSCategory();
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
    {
      LODWORD(v29) = 136315138;
      *(_QWORD *)((char *)&v29 + 4) = "-[_KSCloudKitManager isAccountAvailable]";
      _os_log_impl(&dword_21DFEB000, v20, OS_LOG_TYPE_INFO, "%s  iCloud sync is disabled by preferences", (uint8_t *)&v29, 0xCu);
    }

    return 0;
  }
  else
  {
    *(_QWORD *)&v29 = 0;
    *((_QWORD *)&v29 + 1) = &v29;
    v30 = 0x2020000000;
    v31 = 0;
    v5 = dispatch_group_create();
    dispatch_group_enter(v5);
    ckWorkQueue = self->_ckWorkQueue;
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __40___KSCloudKitManager_isAccountAvailable__block_invoke;
    block[3] = &unk_24E204C08;
    block[4] = self;
    v24 = &v29;
    v7 = v5;
    v23 = v7;
    dispatch_async(ckWorkQueue, block);
    v8 = dispatch_time(0, 5000000000);
    if (dispatch_group_wait(v7, v8))
    {
      KSCategory();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
        -[_KSCloudKitManager isAccountAvailable].cold.1(v9, v10, v11, v12, v13, v14, v15, v16);

      v17 = 0;
    }
    else
    {
      KSCategory();
      v18 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
      {
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", *(unsigned __int8 *)(*((_QWORD *)&v29 + 1) + 24));
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 136315394;
        v26 = "-[_KSCloudKitManager isAccountAvailable]";
        v27 = 2112;
        v28 = v19;
        _os_log_impl(&dword_21DFEB000, v18, OS_LOG_TYPE_INFO, "%s  Account status: %@", buf, 0x16u);

      }
      v17 = *(_BYTE *)(*((_QWORD *)&v29 + 1) + 24) != 0;
    }

    _Block_object_dispose(&v29, 8);
  }
  return v17;
}

- (_KSCloudKitManager)initWithContainer:(id)a3 recordZoneName:(id)a4
{
  id v6;
  id v7;
  _KSCloudKitManager *v8;
  uint64_t v9;
  CKContainer *cloudKitContainer;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  CKDatabase *cloudKitDatabase;
  uint64_t v18;
  CKDatabase *publicDatabase;
  uint64_t v20;
  CKRecordZone *recordZone;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  NSString *recordZoneKey;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  uint64_t v32;
  NSString *subscriptionKey;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  uint64_t v38;
  NSString *lastKnownUserKey;
  NSObject *v40;
  dispatch_queue_t v41;
  OS_dispatch_queue *ckWorkQueue;
  void *v43;
  void *v44;
  _KSRequestThrottle *v45;
  _KSRequestThrottle *accountChangeThrottle;
  _KSRequestThrottle *v47;
  _KSRequestThrottle *fetchZoneThrottle;
  _KSCloudKitManager *v49;
  objc_super v51;

  v6 = a3;
  v7 = a4;
  v51.receiver = self;
  v51.super_class = (Class)_KSCloudKitManager;
  v8 = -[_KSCloudKitManager init](&v51, sel_init);
  if (v8)
  {
    objc_msgSend((id)objc_opt_class(), "prepareContainerForID:", v6);
    v9 = objc_claimAutoreleasedReturnValue();
    cloudKitContainer = v8->_cloudKitContainer;
    v8->_cloudKitContainer = (CKContainer *)v9;

    objc_msgSend(MEMORY[0x24BDD1488], "mainBundle");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "bundleIdentifier");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (!objc_msgSend(v12, "length"))
    {
      objc_msgSend(MEMORY[0x24BDD1488], "mainBundle");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "executablePath");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "lastPathComponent");
      v15 = objc_claimAutoreleasedReturnValue();

      v12 = (void *)v15;
    }
    -[CKContainer setSourceApplicationBundleIdentifier:](v8->_cloudKitContainer, "setSourceApplicationBundleIdentifier:", v12);
    -[CKContainer privateCloudDatabase](v8->_cloudKitContainer, "privateCloudDatabase");
    v16 = objc_claimAutoreleasedReturnValue();
    cloudKitDatabase = v8->_cloudKitDatabase;
    v8->_cloudKitDatabase = (CKDatabase *)v16;

    -[CKContainer publicCloudDatabase](v8->_cloudKitContainer, "publicCloudDatabase");
    v18 = objc_claimAutoreleasedReturnValue();
    publicDatabase = v8->_publicDatabase;
    v8->_publicDatabase = (CKDatabase *)v18;

    if (v7)
    {
      v20 = objc_msgSend(objc_alloc(MEMORY[0x24BDB91F0]), "initWithZoneName:", v7);
    }
    else
    {
      objc_msgSend(MEMORY[0x24BDB91F0], "defaultRecordZone");
      v20 = objc_claimAutoreleasedReturnValue();
    }
    recordZone = v8->_recordZone;
    v8->_recordZone = (CKRecordZone *)v20;

    v22 = (void *)MEMORY[0x24BDD17C8];
    -[_KSCloudKitManager recordZone](v8, "recordZone");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "zoneID");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "zoneName");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "stringWithFormat:", CFSTR("%@-%@"), CFSTR("KSCKDidSetupRecordZoneProd"), v25);
    v26 = objc_claimAutoreleasedReturnValue();
    recordZoneKey = v8->_recordZoneKey;
    v8->_recordZoneKey = (NSString *)v26;

    v28 = (void *)MEMORY[0x24BDD17C8];
    -[_KSCloudKitManager recordZone](v8, "recordZone");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "zoneID");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "zoneName");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "stringWithFormat:", CFSTR("%@-%@"), CFSTR("KSCKSubscriptionProd"), v31);
    v32 = objc_claimAutoreleasedReturnValue();
    subscriptionKey = v8->_subscriptionKey;
    v8->_subscriptionKey = (NSString *)v32;

    v34 = (void *)MEMORY[0x24BDD17C8];
    -[_KSCloudKitManager recordZone](v8, "recordZone");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "zoneID");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "zoneName");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "stringWithFormat:", CFSTR("%@-%@"), CFSTR("KSLastKnownUserID"), v37);
    v38 = objc_claimAutoreleasedReturnValue();
    lastKnownUserKey = v8->_lastKnownUserKey;
    v8->_lastKnownUserKey = (NSString *)v38;

    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v40 = objc_claimAutoreleasedReturnValue();
    v41 = dispatch_queue_create("com.apple.keyboardservices._ksCloudKitManager.cloudKitWorkQueue", v40);
    ckWorkQueue = v8->_ckWorkQueue;
    v8->_ckWorkQueue = (OS_dispatch_queue *)v41;

    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v43, "addObserver:selector:name:object:", v8, sel_accountStatusDidChange_, *MEMORY[0x24BDB8E60], 0);

    if (-[_KSCloudKitManager needsDeviceToDevice](v8, "needsDeviceToDevice"))
    {
      objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v44, "addObserver:selector:name:object:", v8, sel_identityUpdated_, *MEMORY[0x24BDB8ED8], 0);

    }
    -[_KSCloudKitManager setupAccountDidChange:](v8, "setupAccountDidChange:", 0);
    v45 = objc_alloc_init(_KSRequestThrottle);
    accountChangeThrottle = v8->_accountChangeThrottle;
    v8->_accountChangeThrottle = v45;

    -[_KSRequestThrottle setQueue:](v8->_accountChangeThrottle, "setQueue:", v8->_ckWorkQueue);
    -[_KSRequestThrottle setDebugIdentifier:](v8->_accountChangeThrottle, "setDebugIdentifier:", CFSTR("account change"));
    v47 = objc_alloc_init(_KSRequestThrottle);
    fetchZoneThrottle = v8->_fetchZoneThrottle;
    v8->_fetchZoneThrottle = v47;

    -[_KSRequestThrottle setQueue:](v8->_fetchZoneThrottle, "setQueue:", v8->_ckWorkQueue);
    -[_KSRequestThrottle setDebugIdentifier:](v8->_fetchZoneThrottle, "setDebugIdentifier:", CFSTR("fetch zone"));

  }
  v49 = v8;

  return v49;
}

- (CKRecordZone)recordZone
{
  return self->_recordZone;
}

- (void)setupAccountDidChange:(BOOL)a3
{
  NSObject *ckWorkQueue;
  _QWORD v4[5];
  BOOL v5;

  ckWorkQueue = self->_ckWorkQueue;
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __44___KSCloudKitManager_setupAccountDidChange___block_invoke;
  v4[3] = &unk_24E204AC8;
  v4[4] = self;
  v5 = a3;
  dispatch_async(ckWorkQueue, v4);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (BOOL)needsDeviceToDevice
{
  return 0;
}

- (_KSCloudKitManager)initWithRecordZoneName:(id)a3
{
  return -[_KSCloudKitManager initWithContainer:recordZoneName:](self, "initWithContainer:recordZoneName:", kKeyboardServicesCloudKitContainerID, a3);
}

- (_KSCloudKitManager)init
{
  return -[_KSCloudKitManager initWithRecordZoneName:](self, "initWithRecordZoneName:", 0);
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

  v4.receiver = self;
  v4.super_class = (Class)_KSCloudKitManager;
  -[_KSCloudKitManager dealloc](&v4, sel_dealloc);
}

- (void)accountStatusDidChange:(id)a3
{
  NSObject *v4;
  _KSRequestThrottle *accountChangeThrottle;
  _QWORD v6[5];
  uint8_t buf[4];
  const char *v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  KSCategory();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    v8 = "-[_KSCloudKitManager accountStatusDidChange:]";
    _os_log_impl(&dword_21DFEB000, v4, OS_LOG_TYPE_INFO, "%s  Received account change from cloudkit", buf, 0xCu);
  }

  accountChangeThrottle = self->_accountChangeThrottle;
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __45___KSCloudKitManager_accountStatusDidChange___block_invoke;
  v6[3] = &unk_24E204AF0;
  v6[4] = self;
  -[_KSRequestThrottle postRequest:](accountChangeThrottle, "postRequest:", v6);
}

- (void)identityUpdated:(id)a3
{
  id v4;

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "postNotificationName:object:", CFSTR("KSCloudKitIdentitiesDidChange"), self);

}

- (void)setupRecordZoneWithCompletionHandler:(id)a3 ignoreDefaults:(BOOL)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  uint64_t v12;
  id v13;
  void *v14;
  NSObject *ckWorkQueue;
  id v16;
  _QWORD v17[5];
  id v18;
  id v19;
  _QWORD v20[5];
  id v21;
  id v22;

  v6 = a3;
  v7 = objc_alloc(MEMORY[0x24BDBCF50]);
  +[_KSUtilities userDefaultsSuiteName](_KSUtilities, "userDefaultsSuiteName");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v7, "initWithSuiteName:", v8);

  -[_KSCloudKitManager recordZoneKey](self, "recordZoneKey");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v9, "BOOLForKey:", v10);

  if (a4 || !v11)
  {
    v12 = MEMORY[0x24BDAC760];
    v20[0] = MEMORY[0x24BDAC760];
    v20[1] = 3221225472;
    v20[2] = __74___KSCloudKitManager_setupRecordZoneWithCompletionHandler_ignoreDefaults___block_invoke;
    v20[3] = &unk_24E204CD0;
    v20[4] = self;
    v21 = v9;
    v13 = v6;
    v22 = v13;
    v14 = (void *)MEMORY[0x2207A8D04](v20);
    ckWorkQueue = self->_ckWorkQueue;
    v17[0] = v12;
    v17[1] = 3221225472;
    v17[2] = __74___KSCloudKitManager_setupRecordZoneWithCompletionHandler_ignoreDefaults___block_invoke_3;
    v17[3] = &unk_24E204D48;
    v17[4] = self;
    v18 = v14;
    v19 = v13;
    v16 = v14;
    dispatch_async(ckWorkQueue, v17);

  }
  else
  {
    (*((void (**)(id, _QWORD))v6 + 2))(v6, 0);
  }

}

- (void)resetZoneWithDelete:(unint64_t)a3 withCompletionHandler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  NSObject *ckWorkQueue;
  id v11;
  id v12;
  _QWORD v13[5];
  id v14;
  id v15;
  unint64_t v16;

  v6 = a4;
  v7 = objc_alloc(MEMORY[0x24BDBCF50]);
  +[_KSUtilities userDefaultsSuiteName](_KSUtilities, "userDefaultsSuiteName");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v7, "initWithSuiteName:", v8);

  ckWorkQueue = self->_ckWorkQueue;
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = __64___KSCloudKitManager_resetZoneWithDelete_withCompletionHandler___block_invoke;
  v13[3] = &unk_24E204D98;
  v13[4] = self;
  v14 = v9;
  v15 = v6;
  v16 = a3;
  v11 = v6;
  v12 = v9;
  dispatch_async(ckWorkQueue, v13);

}

- (id)recordWithName:(id)a3 type:(id)a4 cloudData:(id)a5 attributes:(id)a6 encryptedFields:(id)a7
{
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  void *v16;
  void *v17;
  uint64_t v18;
  id v19;
  id v20;
  _QWORD v22[4];
  id v23;
  _QWORD v24[4];
  id v25;
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  v15 = a7;
  v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1620]), "initForReadingFromData:error:", v13, 0);
  v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDB91D8]), "initWithCoder:", v16);
  v18 = MEMORY[0x24BDAC760];
  v24[0] = MEMORY[0x24BDAC760];
  v24[1] = 3221225472;
  v24[2] = __79___KSCloudKitManager_recordWithName_type_cloudData_attributes_encryptedFields___block_invoke;
  v24[3] = &unk_24E204DC0;
  v19 = v17;
  v25 = v19;
  objc_msgSend(v14, "enumerateKeysAndObjectsUsingBlock:", v24);
  v22[0] = v18;
  v22[1] = 3221225472;
  v22[2] = __79___KSCloudKitManager_recordWithName_type_cloudData_attributes_encryptedFields___block_invoke_2;
  v22[3] = &unk_24E204DC0;
  v20 = v19;
  v23 = v20;
  objc_msgSend(v15, "enumerateKeysAndObjectsUsingBlock:", v22);

  return v20;
}

- (id)recordWithName:(id)a3 type:(id)a4 cloudData:(id)a5 attributes:(id)a6
{
  return -[_KSCloudKitManager recordWithName:type:cloudData:attributes:encryptedFields:](self, "recordWithName:type:cloudData:attributes:encryptedFields:", a3, a4, a5, a6, 0);
}

- (id)recordWithName:(id)a3 type:(id)a4 attributes:(id)a5 encryptedFields:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  id v20;
  id v21;
  _QWORD v23[4];
  id v24;
  _QWORD v25[4];
  id v26;
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v14 = objc_alloc(MEMORY[0x24BDB91E8]);
  -[_KSCloudKitManager recordZone](self, "recordZone");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "zoneID");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = (void *)objc_msgSend(v14, "initWithRecordName:zoneID:", v10, v16);

  v18 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDB91D8]), "initWithRecordType:recordID:", v11, v17);
  v19 = MEMORY[0x24BDAC760];
  v25[0] = MEMORY[0x24BDAC760];
  v25[1] = 3221225472;
  v25[2] = __69___KSCloudKitManager_recordWithName_type_attributes_encryptedFields___block_invoke;
  v25[3] = &unk_24E204DC0;
  v20 = v18;
  v26 = v20;
  objc_msgSend(v12, "enumerateKeysAndObjectsUsingBlock:", v25);
  v23[0] = v19;
  v23[1] = 3221225472;
  v23[2] = __69___KSCloudKitManager_recordWithName_type_attributes_encryptedFields___block_invoke_2;
  v23[3] = &unk_24E204DC0;
  v21 = v20;
  v24 = v21;
  objc_msgSend(v13, "enumerateKeysAndObjectsUsingBlock:", v23);

  return v21;
}

- (id)recordWithName:(id)a3 type:(id)a4 attributes:(id)a5
{
  return -[_KSCloudKitManager recordWithName:type:attributes:encryptedFields:](self, "recordWithName:type:attributes:encryptedFields:", a3, a4, a5, 0);
}

- (id)recordIDForName:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;

  v4 = a3;
  v5 = objc_alloc(MEMORY[0x24BDB91E8]);
  -[_KSCloudKitManager recordZone](self, "recordZone");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "zoneID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v5, "initWithRecordName:zoneID:", v4, v7);

  return v8;
}

- (void)addOperation:(id)a3
{
  -[_KSCloudKitManager addOperation:priority:](self, "addOperation:priority:", a3, 2);
}

- (void)addOperation:(id)a3 priority:(unint64_t)a4
{
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;
  id v10;

  v6 = a3;
  v10 = v6;
  if (!a4)
  {
    objc_msgSend(v6, "setQualityOfService:", 17);
LABEL_9:
    objc_msgSend(v10, "configuration");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setDiscretionaryNetworkBehavior:", 0);

    goto LABEL_10;
  }
  if (qos_class_self() <= QOS_CLASS_BACKGROUND)
    v7 = 9;
  else
    v7 = 17;
  objc_msgSend(v10, "setQualityOfService:", v7);
  if (a4 == 2 && qos_class_self() >= 0x16)
    goto LABEL_9;
LABEL_10:
  -[_KSCloudKitManager cloudKitDatabase](self, "cloudKitDatabase");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "addOperation:", v10);

}

- (void)setupSubscription
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  int v7;
  NSObject *v8;
  NSObject *ckWorkQueue;
  _QWORD block[5];
  __CFString *v11;
  id v12;
  uint8_t buf[4];
  const char *v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v3 = objc_alloc(MEMORY[0x24BDBCF50]);
  +[_KSUtilities userDefaultsSuiteName](_KSUtilities, "userDefaultsSuiteName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v3, "initWithSuiteName:", v4);

  -[_KSCloudKitManager subscriptionKey](self, "subscriptionKey");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v5, "BOOLForKey:", v6);

  if (v7)
  {
    KSCategory();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315138;
      v14 = "-[_KSCloudKitManager setupSubscription]";
      _os_log_impl(&dword_21DFEB000, v8, OS_LOG_TYPE_INFO, "%s  already subsribed for zone change", buf, 0xCu);
    }

  }
  else
  {
    ckWorkQueue = self->_ckWorkQueue;
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __39___KSCloudKitManager_setupSubscription__block_invoke;
    block[3] = &unk_24E204E10;
    block[4] = self;
    v11 = CFSTR("KSTextReplacementSubscription");
    v12 = v5;
    dispatch_async(ckWorkQueue, block);

  }
}

- (void)updateRecords:(id)a3 deleteRecordIDs:(id)a4 withPriority:(unint64_t)a5 completionHandler:(id)a6
{
  id v10;
  id v11;
  id v12;
  NSObject *ckWorkQueue;
  id v14;
  id v15;
  id v16;
  _QWORD block[5];
  id v18;
  id v19;
  id v20;
  unint64_t v21;

  v10 = a3;
  v11 = a4;
  v12 = a6;
  ckWorkQueue = self->_ckWorkQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __83___KSCloudKitManager_updateRecords_deleteRecordIDs_withPriority_completionHandler___block_invoke;
  block[3] = &unk_24E204E38;
  block[4] = self;
  v18 = v10;
  v20 = v12;
  v21 = a5;
  v19 = v11;
  v14 = v12;
  v15 = v11;
  v16 = v10;
  dispatch_async(ckWorkQueue, block);

}

- (void)updateRecords:(id)a3 deleteRecordIDs:(id)a4 withPriority:(unint64_t)a5 completionHandler:(id)a6 retryCount:(unint64_t)a7
{
  id v12;
  id v13;
  void (**v14)(id, _QWORD, id, void *);
  NSObject *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  id v20;
  id v21;
  id v22;
  id v23;
  _QWORD v24[5];
  id v25;
  id v26;
  id v27;
  void (**v28)(id, _QWORD, id, void *);
  unint64_t v29;
  unint64_t v30;
  _QWORD v31[4];
  id v32;
  id v33;
  uint8_t buf[4];
  const char *v35;
  uint64_t v36;

  v36 = *MEMORY[0x24BDAC8D0];
  v12 = a3;
  v13 = a4;
  v14 = (void (**)(id, _QWORD, id, void *))a6;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_ckWorkQueue);
  if (a7 == 2)
  {
    KSCategory();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315138;
      v35 = "-[_KSCloudKitManager updateRecords:deleteRecordIDs:withPriority:completionHandler:retryCount:]";
      _os_log_impl(&dword_21DFEB000, v15, OS_LOG_TYPE_INFO, "%s  hit max retry limit, not updating records", buf, 0xCu);
    }

    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", KSCKErrorDomain, 1, 0);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v14[2](v14, 0, v12, v16);
  }
  else
  {
    v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDB9158]), "initWithRecordsToSave:recordIDsToDelete:", v12, v13);
    objc_msgSend(v16, "setSavePolicy:", 0);
    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = MEMORY[0x24BDAC760];
    v31[0] = MEMORY[0x24BDAC760];
    v31[1] = 3221225472;
    v31[2] = __94___KSCloudKitManager_updateRecords_deleteRecordIDs_withPriority_completionHandler_retryCount___block_invoke;
    v31[3] = &unk_24E204E60;
    v20 = v17;
    v32 = v20;
    v21 = v18;
    v33 = v21;
    objc_msgSend(v16, "setPerRecordCompletionBlock:", v31);
    v24[0] = v19;
    v24[1] = 3221225472;
    v24[2] = __94___KSCloudKitManager_updateRecords_deleteRecordIDs_withPriority_completionHandler_retryCount___block_invoke_102;
    v24[3] = &unk_24E204F00;
    v24[4] = self;
    v25 = v12;
    v29 = a5;
    v27 = v20;
    v28 = v14;
    v30 = a7;
    v26 = v21;
    v22 = v20;
    v23 = v21;
    objc_msgSend(v16, "setModifyRecordsCompletionBlock:", v24);
    -[_KSCloudKitManager addOperation:priority:](self, "addOperation:priority:", v16, a5);

  }
}

- (id)resolveConflicts:(id)a3
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  double v16;
  id obj;
  id v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  v20 = (id)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", objc_msgSend(v3, "count"));
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  obj = v3;
  v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v22;
    v7 = *MEMORY[0x24BDB8F10];
    v8 = *MEMORY[0x24BDB8F08];
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v22 != v6)
          objc_enumerationMutation(obj);
        v10 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * i);
        objc_msgSend(v10, "objectForKeyedSubscript:", v7);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "objectForKeyedSubscript:", v8);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
        {
          objc_msgSend(v11, "objectForKey:", CFSTR("timestamp"));
          v13 = objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "objectForKey:", CFSTR("timestamp"));
          v14 = objc_claimAutoreleasedReturnValue();
          v15 = (void *)v14;
          if (!(v13 | v14) || (objc_msgSend((id)v14, "timeIntervalSinceDate:", v13), v16 > 2.0))
            -[_KSCloudKitManager copyFieldsFromRecord:toRecord:](self, "copyFieldsFromRecord:toRecord:", v12, v11);
          objc_msgSend(v20, "addObject:", v11);

        }
      }
      v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
    }
    while (v5);
  }

  return v20;
}

- (void)copyFieldsFromRecord:(id)a3 toRecord:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  _BYTE v33[128];
  _BYTE v34[128];
  uint64_t v35;

  v35 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v6 = a4;
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  v32 = 0u;
  objc_msgSend(v5, "valuesByKey");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "allKeys");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v29, v34, 16);
  if (v9)
  {
    v10 = *(_QWORD *)v30;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v30 != v10)
          objc_enumerationMutation(v8);
        v12 = *(_QWORD *)(*((_QWORD *)&v29 + 1) + 8 * v11);
        objc_msgSend(v5, "valuesByKey");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "objectForKeyedSubscript:", v12);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "valuesByKey");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "setObject:forKeyedSubscript:", v14, v12);

        ++v11;
      }
      while (v9 != v11);
      v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v29, v34, 16);
    }
    while (v9);
  }

  v27 = 0u;
  v28 = 0u;
  v25 = 0u;
  v26 = 0u;
  objc_msgSend(v5, "encryptedValuesByKey", 0);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "allKeys");
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v25, v33, 16);
  if (v18)
  {
    v19 = *(_QWORD *)v26;
    do
    {
      v20 = 0;
      do
      {
        if (*(_QWORD *)v26 != v19)
          objc_enumerationMutation(v17);
        v21 = *(_QWORD *)(*((_QWORD *)&v25 + 1) + 8 * v20);
        objc_msgSend(v5, "encryptedValuesByKey");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "objectForKeyedSubscript:", v21);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "encryptedValuesByKey");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "setObject:forKeyedSubscript:", v23, v21);

        ++v20;
      }
      while (v18 != v20);
      v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v25, v33, 16);
    }
    while (v18);
  }

}

- (void)fetchRecordsWithPriority:(unint64_t)a3 changeToken:(id)a4 completionHandler:(id)a5
{
  -[_KSCloudKitManager fetchRecordsWithPriority:changeToken:completionHandler:retryCount:](self, "fetchRecordsWithPriority:changeToken:completionHandler:retryCount:", a3, a4, a5, 0);
}

- (void)fetchRecordsWithPriority:(unint64_t)a3 changeToken:(id)a4 completionHandler:(id)a5 retryCount:(unint64_t)a6
{
  id v10;
  void *v11;
  void *v12;
  id v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  NSObject *ckWorkQueue;
  id v23;
  id v24;
  id v25;
  id v26;
  unint64_t v27;
  void *v28;
  unint64_t v29;
  _QWORD block[5];
  id v31;
  id v32;
  id v33;
  unint64_t v34;
  unint64_t v35;
  void *v36;
  id v37;
  _QWORD v38[2];

  v38[1] = *MEMORY[0x24BDAC8D0];
  v10 = a4;
  v28 = v10;
  v29 = a6;
  v26 = a5;
  v27 = a3;
  if (!v10)
    goto LABEL_5;
  objc_msgSend(MEMORY[0x24BDD1620], "unarchivedObjectOfClass:fromData:error:", objc_opt_class(), v10, 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {

LABEL_5:
    v12 = 0;
    goto LABEL_6;
  }
  v12 = v11;
LABEL_6:
  v13 = objc_alloc_init(MEMORY[0x24BDB90D8]);
  objc_msgSend(v13, "setPreviousServerChangeToken:", v12);
  v14 = objc_alloc(MEMORY[0x24BDB90C8]);
  -[_KSCloudKitManager recordZone](self, "recordZone");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "zoneID");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v38[0] = v16;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v38, 1);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[_KSCloudKitManager recordZone](self, "recordZone");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "zoneID");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v36 = v19;
  v37 = v13;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v37, &v36, 1);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = (void *)objc_msgSend(v14, "initWithRecordZoneIDs:optionsByRecordZoneID:", v17, v20);

  ckWorkQueue = self->_ckWorkQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __88___KSCloudKitManager_fetchRecordsWithPriority_changeToken_completionHandler_retryCount___block_invoke;
  block[3] = &unk_24E204EB0;
  block[4] = self;
  v31 = v21;
  v32 = v28;
  v33 = v26;
  v34 = v27;
  v35 = v29;
  v23 = v26;
  v24 = v28;
  v25 = v21;
  dispatch_async(ckWorkQueue, block);

}

- (void)_submitFetchRecordsOperation:(id)a3 withPriority:(unint64_t)a4 changeToken:(id)a5 completionHandler:(id)a6 retryCount:(unint64_t)a7
{
  id v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  id v16;
  uint64_t v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;
  id v25;
  _QWORD v27[5];
  id v28;
  id v29;
  id v30;
  _QWORD *v31;
  unint64_t v32;
  unint64_t v33;
  _QWORD v34[5];
  id v35;
  id v36;
  id v37;
  _QWORD *v38;
  _QWORD v39[4];
  id v40;
  _QWORD v41[4];
  id v42;
  _QWORD v43[5];
  id v44;

  v11 = a3;
  v12 = a5;
  v13 = a6;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_ckWorkQueue);
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v43[0] = 0;
  v43[1] = v43;
  v43[2] = 0x3032000000;
  v43[3] = __Block_byref_object_copy_;
  v43[4] = __Block_byref_object_dispose_;
  v16 = v12;
  v44 = v16;
  v17 = MEMORY[0x24BDAC760];
  v41[0] = MEMORY[0x24BDAC760];
  v41[1] = 3221225472;
  v41[2] = __105___KSCloudKitManager__submitFetchRecordsOperation_withPriority_changeToken_completionHandler_retryCount___block_invoke;
  v41[3] = &unk_24E204F28;
  v18 = v14;
  v42 = v18;
  objc_msgSend(v11, "setRecordChangedBlock:", v41);
  v39[0] = v17;
  v39[1] = 3221225472;
  v39[2] = __105___KSCloudKitManager__submitFetchRecordsOperation_withPriority_changeToken_completionHandler_retryCount___block_invoke_2;
  v39[3] = &unk_24E204F50;
  v19 = v15;
  v40 = v19;
  objc_msgSend(v11, "setRecordWithIDWasDeletedBlock:", v39);
  v34[0] = v17;
  v34[1] = 3221225472;
  v34[2] = __105___KSCloudKitManager__submitFetchRecordsOperation_withPriority_changeToken_completionHandler_retryCount___block_invoke_3;
  v34[3] = &unk_24E204FA0;
  v34[4] = self;
  v38 = v43;
  v20 = v18;
  v35 = v20;
  v21 = v19;
  v36 = v21;
  v22 = v13;
  v37 = v22;
  objc_msgSend(v11, "setRecordZoneChangeTokensUpdatedBlock:", v34);
  v27[0] = v17;
  v27[1] = 3221225472;
  v27[2] = __105___KSCloudKitManager__submitFetchRecordsOperation_withPriority_changeToken_completionHandler_retryCount___block_invoke_2_114;
  v27[3] = &unk_24E2050B8;
  v27[4] = self;
  v31 = v43;
  v32 = a7;
  v33 = a4;
  v23 = v22;
  v30 = v23;
  v24 = v20;
  v28 = v24;
  v25 = v21;
  v29 = v25;
  objc_msgSend(v11, "setRecordZoneFetchCompletionBlock:", v27);
  -[_KSCloudKitManager addOperation:priority:](self, "addOperation:priority:", v11, a4);

  _Block_object_dispose(v43, 8);
}

- (void)fetchPublicRecordsWithNames:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  NSObject *ckWorkQueue;
  id v9;
  id v10;
  _QWORD block[4];
  id v12;
  _KSCloudKitManager *v13;
  id v14;

  v6 = a3;
  v7 = a4;
  ckWorkQueue = self->_ckWorkQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __68___KSCloudKitManager_fetchPublicRecordsWithNames_completionHandler___block_invoke;
  block[3] = &unk_24E205108;
  v12 = v6;
  v13 = self;
  v14 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(ckWorkQueue, block);

}

- (void)_inconvenientOperation:(id)a3
{
  id v4;

  v4 = a3;
  objc_msgSend(v4, "setQueuePriority:", -4);
  -[_KSCloudKitManager addOperation:priority:](self, "addOperation:priority:", v4, 0);

}

- (void)_ckFetchRecordZoneWithID:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  _KSRequestThrottle *fetchZoneThrottle;
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;
  _KSCloudKitManager *v13;
  id v14;

  v6 = a3;
  v7 = a4;
  fetchZoneThrottle = self->_fetchZoneThrottle;
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __65___KSCloudKitManager__ckFetchRecordZoneWithID_completionHandler___block_invoke;
  v11[3] = &unk_24E205158;
  v13 = self;
  v14 = v7;
  v12 = v6;
  v9 = v7;
  v10 = v6;
  -[_KSRequestThrottle postRequest:](fetchZoneThrottle, "postRequest:", v11);

}

- (void)_ckSaveRecordZone:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  void (*v15)(uint64_t, void *, uint64_t, void *);
  void *v16;
  id v17;
  id v18;
  _QWORD v19[2];

  v19[1] = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  v8 = objc_alloc(MEMORY[0x24BDB9150]);
  v19[0] = v6;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v19, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v8, "initWithRecordZonesToSave:recordZoneIDsToDelete:", v9, 0);

  v13 = MEMORY[0x24BDAC760];
  v14 = 3221225472;
  v15 = __58___KSCloudKitManager__ckSaveRecordZone_completionHandler___block_invoke;
  v16 = &unk_24E205180;
  v17 = v6;
  v18 = v7;
  v11 = v6;
  v12 = v7;
  objc_msgSend(v10, "setModifyRecordZonesCompletionBlock:", &v13);
  -[_KSCloudKitManager _inconvenientOperation:](self, "_inconvenientOperation:", v10, v13, v14, v15, v16);

}

- (void)_ckDeleteRecordZoneWithID:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  void (*v15)(uint64_t, uint64_t, void *, void *);
  void *v16;
  id v17;
  id v18;
  _QWORD v19[2];

  v19[1] = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  v8 = objc_alloc(MEMORY[0x24BDB9150]);
  v19[0] = v6;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v19, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v8, "initWithRecordZonesToSave:recordZoneIDsToDelete:", 0, v9);

  v13 = MEMORY[0x24BDAC760];
  v14 = 3221225472;
  v15 = __66___KSCloudKitManager__ckDeleteRecordZoneWithID_completionHandler___block_invoke;
  v16 = &unk_24E205180;
  v17 = v6;
  v18 = v7;
  v11 = v6;
  v12 = v7;
  objc_msgSend(v10, "setModifyRecordZonesCompletionBlock:", &v13);
  -[_KSCloudKitManager _inconvenientOperation:](self, "_inconvenientOperation:", v10, v13, v14, v15, v16);

}

- (void)setRecordZone:(id)a3
{
  objc_storeStrong((id *)&self->_recordZone, a3);
}

- (_KSCloudKitManagerDelegate)delegate
{
  return (_KSCloudKitManagerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setCloudKitContainer:(id)a3
{
  objc_storeStrong((id *)&self->_cloudKitContainer, a3);
}

- (CKDatabase)cloudKitDatabase
{
  return self->_cloudKitDatabase;
}

- (void)setCloudKitDatabase:(id)a3
{
  objc_storeStrong((id *)&self->_cloudKitDatabase, a3);
}

- (CKDatabase)publicDatabase
{
  return self->_publicDatabase;
}

- (void)setPublicDatabase:(id)a3
{
  objc_storeStrong((id *)&self->_publicDatabase, a3);
}

- (NSString)recordZoneKey
{
  return self->_recordZoneKey;
}

- (NSString)subscriptionKey
{
  return self->_subscriptionKey;
}

- (NSString)lastKnownUserKey
{
  return self->_lastKnownUserKey;
}

- (BOOL)recordZoneOperationInProgress
{
  return self->_recordZoneOperationInProgress;
}

- (void)setRecordZoneOperationInProgress:(BOOL)a3
{
  self->_recordZoneOperationInProgress = a3;
}

- (BOOL)subscriptionOperationInProgress
{
  return self->_subscriptionOperationInProgress;
}

- (void)setSubscriptionOperationInProgress:(BOOL)a3
{
  self->_subscriptionOperationInProgress = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastKnownUserKey, 0);
  objc_storeStrong((id *)&self->_subscriptionKey, 0);
  objc_storeStrong((id *)&self->_recordZoneKey, 0);
  objc_storeStrong((id *)&self->_publicDatabase, 0);
  objc_storeStrong((id *)&self->_cloudKitDatabase, 0);
  objc_storeStrong((id *)&self->_cloudKitContainer, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_recordZone, 0);
  objc_storeStrong((id *)&self->_fetchZoneThrottle, 0);
  objc_storeStrong((id *)&self->_accountChangeThrottle, 0);
  objc_storeStrong((id *)&self->_dataQueue, 0);
  objc_storeStrong((id *)&self->_ckWorkQueue, 0);
}

- (void)isAccountAvailable
{
  OUTLINED_FUNCTION_1(&dword_21DFEB000, a1, a3, "%s  Failed to get account status", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_5();
}

- (void)recordWithName:type:cloudData:attributes:encryptedFields:.cold.1()
{
  void *v0;
  void *v1;
  _DWORD *v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t *v5;
  NSObject *v6;

  OUTLINED_FUNCTION_3();
  *v2 = 136315650;
  OUTLINED_FUNCTION_0(v3, v4, (uint64_t)v2);
  OUTLINED_FUNCTION_2(&dword_21DFEB000, "%s  ERROR creating record: %@; %@", v5, v6);

  OUTLINED_FUNCTION_7();
}

- (void)recordWithName:type:attributes:encryptedFields:.cold.1()
{
  void *v0;
  void *v1;
  _DWORD *v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t *v5;
  NSObject *v6;

  OUTLINED_FUNCTION_3();
  *v2 = 136315650;
  OUTLINED_FUNCTION_0(v3, v4, (uint64_t)v2);
  OUTLINED_FUNCTION_2(&dword_21DFEB000, "%s  >>> ERROR creating record: %@; %@", v5, v6);

  OUTLINED_FUNCTION_7();
}

- (void)recordIDForName:.cold.1()
{
  void *v0;
  void *v1;
  _DWORD *v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t *v5;
  NSObject *v6;

  OUTLINED_FUNCTION_3();
  *v2 = 136315650;
  OUTLINED_FUNCTION_0(v3, v4, (uint64_t)v2);
  OUTLINED_FUNCTION_2(&dword_21DFEB000, "%s  >>> ERROR creating recordID: %@; %@", v5, v6);

  OUTLINED_FUNCTION_7();
}

- (void)copyFieldsFromRecord:toRecord:.cold.1()
{
  void *v0;
  void *v1;
  _DWORD *v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t *v5;
  NSObject *v6;

  OUTLINED_FUNCTION_3();
  *v2 = 136315650;
  OUTLINED_FUNCTION_0(v3, v4, (uint64_t)v2);
  OUTLINED_FUNCTION_2(&dword_21DFEB000, "%s  >>> ERROR copying local to  cloud CKRecord: %@; %@", v5, v6);

  OUTLINED_FUNCTION_7();
}

- (void)fetchRecordsWithPriority:(uint64_t)a3 changeToken:(uint64_t)a4 completionHandler:(uint64_t)a5 retryCount:(uint64_t)a6 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1(&dword_21DFEB000, a1, a3, "%s  !!!ERROR failed to unarachive change token", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_5();
}

@end
