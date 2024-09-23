@implementation BuddyTargetDeviceMigrationManager

- (BuddyTargetDeviceMigrationManager)initWithFileTranferSession:(id)a3 proximitySetupController:(id)a4 prepareForMigrationRebootBlock:(id)a5 passcodeCacheManager:(id)a6 buddyPreferencesExcludedFromBackup:(id)a7 analyticsManager:(id)a8 lockdownModeProvider:(id)a9
{
  id v14;
  id v15;
  void *v16;
  id v17;
  unsigned __int8 v18;
  BuddyTargetDeviceMigrationManager *v19;
  objc_super v21;
  id v22;
  id v23;
  id v24;
  id v25;
  id v26;
  id obj;
  id location[2];
  id v29;

  v29 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  obj = 0;
  objc_storeStrong(&obj, a4);
  v26 = 0;
  objc_storeStrong(&v26, a5);
  v25 = 0;
  objc_storeStrong(&v25, a6);
  v24 = 0;
  objc_storeStrong(&v24, a7);
  v23 = 0;
  objc_storeStrong(&v23, a8);
  v22 = 0;
  objc_storeStrong(&v22, a9);
  v14 = v29;
  v29 = 0;
  v21.receiver = v14;
  v21.super_class = (Class)BuddyTargetDeviceMigrationManager;
  v29 = -[BuddyTargetDeviceMigrationManager initWithFileTranferSession:](&v21, "initWithFileTranferSession:", location[0]);
  objc_storeStrong(&v29, v29);
  if (v29)
  {
    objc_storeStrong((id *)v29 + 4, obj);
    v15 = objc_retainBlock(v26);
    v16 = (void *)*((_QWORD *)v29 + 5);
    *((_QWORD *)v29 + 5) = v15;

    objc_storeStrong((id *)v29 + 15, v25);
    objc_storeStrong((id *)v29 + 16, v24);
    objc_storeStrong((id *)v29 + 17, v23);
    v17 = +[BYPreferencesController buddyPreferencesInternal](BYPreferencesController, "buddyPreferencesInternal");
    v18 = objc_msgSend(v17, "BOOLForKey:", CFSTR("RequireSoftwareUpdateForMigration"));
    *((_BYTE *)v29 + 9) = v18 & 1;

    objc_storeStrong((id *)v29 + 19, v22);
  }
  v19 = (BuddyTargetDeviceMigrationManager *)v29;
  objc_storeStrong(&v22, 0);
  objc_storeStrong(&v23, 0);
  objc_storeStrong(&v24, 0);
  objc_storeStrong(&v25, 0);
  objc_storeStrong(&v26, 0);
  objc_storeStrong(&obj, 0);
  objc_storeStrong(location, 0);
  objc_storeStrong(&v29, 0);
  return v19;
}

- (void)start
{
  dispatch_queue_t v2;
  NSObject *v3;
  BuddyNetworkProvider *v4;
  unsigned __int8 v5;
  objc_super v6;
  SEL v7;
  BuddyTargetDeviceMigrationManager *v8;

  v8 = self;
  v7 = a2;
  v6.receiver = self;
  v6.super_class = (Class)BuddyTargetDeviceMigrationManager;
  -[BuddyTargetDeviceMigrationManager start](&v6, "start");
  v2 = dispatch_queue_create("Keychain Data Transfer Completion Queue", 0);
  -[BuddyTargetDeviceMigrationManager setKeychainDataTransferCompletionQueue:](v8, "setKeychainDataTransferCompletionQueue:", v2);

  v3 = -[BuddyTargetDeviceMigrationManager keychainDataTransferCompletionQueue](v8, "keychainDataTransferCompletionQueue");
  dispatch_suspend(v3);

  v4 = -[BuddyTargetDeviceMigrationManager networkProvider](v8, "networkProvider");
  v5 = -[BuddyNetworkProvider inAppleStore](v4, "inAppleStore");
  -[BuddyTargetDeviceMigrationManager setInAppleStore:](v8, "setInAppleStore:", v5 & 1);

}

- (void)startPreflight
{
  NSObject *v2;
  void **block;
  int v4;
  int v5;
  void (*v6);
  void *v7;
  id v8[2];
  BuddyTargetDeviceMigrationManager *v9;

  v9 = self;
  v8[1] = (id)a2;
  v2 = -[BuddyTargetDeviceMigrationManager migrationQueue](self, "migrationQueue");
  block = _NSConcreteStackBlock;
  v4 = -1073741824;
  v5 = 0;
  v6 = sub_10008325C;
  v7 = &unk_100280730;
  v8[0] = v9;
  dispatch_async(v2, &block);

  objc_storeStrong(v8, 0);
}

- (void)waitForPreflight:(id)a3
{
  NSObject *v3;
  void **block;
  int v5;
  int v6;
  void (*v7)(uint64_t);
  void *v8;
  BuddyTargetDeviceMigrationManager *v9;
  id v10;
  id location[2];
  BuddyTargetDeviceMigrationManager *v12;

  v12 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v3 = -[BuddyTargetDeviceMigrationManager migrationQueue](v12, "migrationQueue");
  block = _NSConcreteStackBlock;
  v5 = -1073741824;
  v6 = 0;
  v7 = sub_100083730;
  v8 = &unk_1002806E0;
  v9 = v12;
  v10 = location[0];
  dispatch_async(v3, &block);

  objc_storeStrong(&v10, 0);
  objc_storeStrong((id *)&v9, 0);
  objc_storeStrong(location, 0);
}

- (void)startKeychainDataTransferWithCompletionHandler:(id)a3
{
  NSObject *v3;
  void **block;
  int v5;
  int v6;
  void (*v7);
  void *v8;
  BuddyTargetDeviceMigrationManager *v9;
  id v10;
  id location[2];
  BuddyTargetDeviceMigrationManager *v12;

  v12 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v3 = -[BuddyTargetDeviceMigrationManager migrationQueue](v12, "migrationQueue");
  block = _NSConcreteStackBlock;
  v5 = -1073741824;
  v6 = 0;
  v7 = sub_100083918;
  v8 = &unk_1002806E0;
  v9 = v12;
  v10 = location[0];
  dispatch_async(v3, &block);

  objc_storeStrong(&v10, 0);
  objc_storeStrong((id *)&v9, 0);
  objc_storeStrong(location, 0);
}

- (void)waitForKeychainDataTransfer:(id)a3
{
  NSObject *v3;
  void **block;
  int v5;
  int v6;
  void (*v7)(uint64_t);
  void *v8;
  BuddyTargetDeviceMigrationManager *v9;
  id v10;
  id location[2];
  BuddyTargetDeviceMigrationManager *v12;

  v12 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v3 = -[BuddyTargetDeviceMigrationManager keychainDataTransferCompletionQueue](v12, "keychainDataTransferCompletionQueue");
  block = _NSConcreteStackBlock;
  v5 = -1073741824;
  v6 = 0;
  v7 = sub_100083DF8;
  v8 = &unk_1002806E0;
  v9 = v12;
  v10 = location[0];
  dispatch_async(v3, &block);

  objc_storeStrong(&v10, 0);
  objc_storeStrong((id *)&v9, 0);
  objc_storeStrong(location, 0);
}

- (void)startKeychainDataImport
{
  NSObject *v2;
  void **block;
  int v4;
  int v5;
  void (*v6);
  void *v7;
  id v8[2];
  BuddyTargetDeviceMigrationManager *v9;

  v9 = self;
  v8[1] = (id)a2;
  v2 = -[BuddyTargetDeviceMigrationManager migrationQueue](self, "migrationQueue");
  block = _NSConcreteStackBlock;
  v4 = -1073741824;
  v5 = 0;
  v6 = sub_10008406C;
  v7 = &unk_100280730;
  v8[0] = v9;
  dispatch_async(v2, &block);

  objc_storeStrong(v8, 0);
}

- (void)waitForKeychainDataImport:(id)a3
{
  NSObject *v3;
  void **block;
  int v5;
  int v6;
  void (*v7)(uint64_t);
  void *v8;
  BuddyTargetDeviceMigrationManager *v9;
  id v10;
  id location[2];
  BuddyTargetDeviceMigrationManager *v12;

  v12 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v3 = -[BuddyTargetDeviceMigrationManager migrationQueue](v12, "migrationQueue");
  block = _NSConcreteStackBlock;
  v5 = -1073741824;
  v6 = 0;
  v7 = sub_10008454C;
  v8 = &unk_1002806E0;
  v9 = v12;
  v10 = location[0];
  dispatch_async(v3, &block);

  objc_storeStrong(&v10, 0);
  objc_storeStrong((id *)&v9, 0);
  objc_storeStrong(location, 0);
}

- (void)waitForKeychain:(id)a3
{
  BuddyTargetDeviceMigrationManager *v3;
  void **v4;
  int v5;
  int v6;
  void (*v7)(uint64_t, void *);
  void *v8;
  BuddyTargetDeviceMigrationManager *v9;
  id v10;
  id location[2];
  BuddyTargetDeviceMigrationManager *v12;

  v12 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v3 = v12;
  v4 = _NSConcreteStackBlock;
  v5 = -1073741824;
  v6 = 0;
  v7 = sub_100084698;
  v8 = &unk_100281910;
  v10 = location[0];
  v9 = v12;
  -[BuddyTargetDeviceMigrationManager waitForKeychainDataTransfer:](v3, "waitForKeychainDataTransfer:", &v4);
  objc_storeStrong((id *)&v9, 0);
  objc_storeStrong(&v10, 0);
  objc_storeStrong(location, 0);
}

- (void)startDataTransfer
{
  BYPasscodeCacheManager *v2;
  NSObject *v3;
  void **block;
  int v5;
  int v6;
  void (*v7);
  void *v8;
  id v9[2];
  BuddyTargetDeviceMigrationManager *v10;

  v10 = self;
  v9[1] = (id)a2;
  v2 = -[BuddyTargetDeviceMigrationManager passcodeCacheManager](self, "passcodeCacheManager");
  -[BYPasscodeCacheManager persistPasscodeStash](v2, "persistPasscodeStash");

  v3 = -[BuddyTargetDeviceMigrationManager migrationQueue](v10, "migrationQueue");
  block = _NSConcreteStackBlock;
  v5 = -1073741824;
  v6 = 0;
  v7 = sub_1000847D0;
  v8 = &unk_100280730;
  v9[0] = v10;
  dispatch_async(v3, &block);

  objc_storeStrong(v9, 0);
}

- (void)reset
{
  -[BuddyTargetDeviceMigrationManager cancelWithCause:](self, "cancelWithCause:", 2, a2);
  -[BuddyTargetDeviceMigrationManager setUserChoseMigration:](self, "setUserChoseMigration:", 0);
  -[BuddyTargetDeviceMigrationManager setDidComplete:](self, "setDidComplete:", 0);
}

- (BOOL)requiresUpdateToMigrate
{
  BOOL requiresUpdateToMigrate;
  unsigned __int8 v3;

  requiresUpdateToMigrate = self->_requiresUpdateToMigrate;
  v3 = 1;
  if (!requiresUpdateToMigrate)
    v3 = -[BuddyTargetDeviceMigrationManager forceUpdateToMigrate](self, "forceUpdateToMigrate", a2);
  return v3 & 1;
}

- (BOOL)hasVersionIncompatibility
{
  id v2;
  id v3;
  unsigned __int8 v4;
  BOOL v5;
  char v7;
  id v8;
  BOOL v10;

  v2 = -[BuddyTargetDeviceMigrationManager error](self, "error");
  v3 = objc_msgSend(v2, "domain");
  v4 = objc_msgSend(v3, "isEqualToString:", CFSTR("MBErrorDomain"));
  v7 = 0;
  v5 = 0;
  if ((v4 & 1) != 0)
  {
    v8 = -[BuddyTargetDeviceMigrationManager error](self, "error");
    v7 = 1;
    v5 = objc_msgSend(v8, "code") == (id)203;
  }
  v10 = v5;
  if ((v7 & 1) != 0)

  return v10;
}

- (BOOL)migrationInProgressOrCompleted
{
  unsigned __int8 v2;
  unsigned __int8 v3;
  BOOL v5;

  v5 = 0;
  if (-[BuddyTargetDeviceMigrationManager userChoseMigration](self, "userChoseMigration"))
  {
    v2 = -[BuddyTargetDeviceMigrationManager willMigrate](self, "willMigrate");
    v3 = 1;
    if ((v2 & 1) == 0)
      v3 = -[BuddyTargetDeviceMigrationManager didComplete](self, "didComplete");
    return v3 & 1;
  }
  return v5;
}

- (void)startDeviceTransferTask
{
  ProximitySetupController *v2;
  NSString *v3;
  ProximitySetupController *v4;
  NSString *v5;
  id v6;

  v2 = -[BuddyTargetDeviceMigrationManager proximitySetupController](self, "proximitySetupController", a2);
  v3 = -[ProximitySetupController model](v2, "model");
  -[BuddyTargetDeviceMigrationManager setSourceDeviceModel:](self, "setSourceDeviceModel:", v3);

  v4 = -[BuddyTargetDeviceMigrationManager proximitySetupController](self, "proximitySetupController");
  v5 = -[ProximitySetupController productVersion](v4, "productVersion");
  -[BuddyTargetDeviceMigrationManager setSourceDeviceProductVersion:](self, "setSourceDeviceProductVersion:", v5);

  v6 = -[BuddyTargetDeviceMigrationManager _targetDeviceTransferTask](self, "_targetDeviceTransferTask");
  objc_msgSend(v6, "start");

}

- (void)cancelDeviceTransferTask
{
  id v2;

  v2 = -[BuddyTargetDeviceMigrationManager _targetDeviceTransferTask](self, "_targetDeviceTransferTask", a2, self);
  objc_msgSend(v2, "cancel");

}

- (void)didCancel
{
  NSObject *v2;
  void **block;
  int v4;
  int v5;
  void (*v6)(uint64_t);
  void *v7;
  id v8[2];
  BuddyTargetDeviceMigrationManager *v9;

  v9 = self;
  v8[1] = (id)a2;
  -[BuddyTargetDeviceMigrationManager setWillMigrate:](self, "setWillMigrate:", 0);
  v2 = -[BuddyTargetDeviceMigrationManager migrationQueue](v9, "migrationQueue");
  block = _NSConcreteStackBlock;
  v4 = -1073741824;
  v5 = 0;
  v6 = sub_100084E88;
  v7 = &unk_100280730;
  v8[0] = v9;
  dispatch_async(v2, &block);

  objc_storeStrong(v8, 0);
}

- (void)didCompleteWithError:(id)a3
{
  id v3;
  BOOL v4;
  uint64_t v5;
  char *v6;
  NSDictionary *v7;
  NSError *v8;
  id v9;
  id v10;
  NSNumber *v11;
  NSString *v12;
  NSString *v13;
  NSNumber *v14;
  NSNumber *v15;
  NSNumber *v16;
  NSNumber *v17;
  NSNumber *v18;
  NSDictionary *v19;
  id v20;
  NSString *v21;
  id v22;
  id v23;
  NSString *v24;
  BYAnalyticsManager *v25;
  NSNumber *v26;
  id v27;
  id v28;
  id location[2];
  BuddyTargetDeviceMigrationManager *v30;
  _QWORD v31[9];
  _QWORD v32[9];
  NSErrorUserInfoKey v33;
  id v34;

  v30 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  -[BuddyTargetDeviceMigrationManager setDidComplete:](v30, "setDidComplete:", 1);
  v3 = objc_msgSend(location[0], "domain");
  v4 = 0;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("MBErrorDomain")) & 1) != 0)
    v4 = objc_msgSend(location[0], "code") == (id)202;

  if (v4)
  {
    v5 = BYDeviceMigrationManagerErrorDomain;
    v6 = (char *)-[BuddyTargetDeviceMigrationManager cancellationCause](v30, "cancellationCause") + 1000;
    v33 = NSUnderlyingErrorKey;
    v34 = location[0];
    v7 = +[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v34, &v33, 1);
    v8 = +[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", v5, v6, v7);
    v9 = location[0];
    location[0] = v8;

  }
  if (-[BuddyTargetDeviceMigrationManager userChoseMigration](v30, "userChoseMigration"))
  {
    v31[0] = CFSTR("success");
    v26 = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", location[0] == 0);
    v32[0] = v26;
    v31[1] = CFSTR("connectionType");
    v10 = -[BuddyTargetDeviceMigrationManager connectionInfo](v30, "connectionInfo");
    v11 = +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", objc_msgSend(v10, "connectionType"));
    v32[1] = v11;
    v31[2] = CFSTR("sourceDeviceModel");
    v12 = -[BuddyTargetDeviceMigrationManager sourceDeviceModel](v30, "sourceDeviceModel");
    v32[2] = v12;
    v31[3] = CFSTR("sourceDeviceProductVersion");
    v13 = -[BuddyTargetDeviceMigrationManager sourceDeviceProductVersion](v30, "sourceDeviceProductVersion");
    v32[3] = v13;
    v31[4] = CFSTR("inAppleStore");
    v14 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", -[BuddyTargetDeviceMigrationManager inAppleStore](v30, "inAppleStore"));
    v32[4] = v14;
    v31[5] = CFSTR("transferSize");
    v15 = +[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", -[BuddyTargetDeviceMigrationManager bytesTransferred](v30, "bytesTransferred"));
    v32[5] = v15;
    v31[6] = CFSTR("numberOfFilesTransferred");
    v16 = +[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", -[BuddyTargetDeviceMigrationManager filesTransferred](v30, "filesTransferred"));
    v32[6] = v16;
    v31[7] = CFSTR("transferDuration");
    -[BuddyTargetDeviceMigrationManager durationOfTransfer](v30, "durationOfTransfer");
    v17 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
    v32[7] = v17;
    v31[8] = CFSTR("restoreDuration");
    -[BuddyTargetDeviceMigrationManager durationOfRestore](v30, "durationOfRestore");
    v18 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
    v32[8] = v18;
    v19 = +[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v32, v31, 9);
    v28 = +[NSMutableDictionary dictionaryWithDictionary:](NSMutableDictionary, "dictionaryWithDictionary:", v19);

    if (location[0])
    {
      v20 = objc_msgSend(location[0], "domain");
      v21 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@ (%ld)"), v20, objc_msgSend(location[0], "code"));
      objc_msgSend(v28, "setObject:forKeyedSubscript:", v21, CFSTR("error"));

      v22 = objc_msgSend(location[0], "userInfo");
      v27 = objc_msgSend(v22, "objectForKey:", NSUnderlyingErrorKey);

      if (v27)
      {
        v23 = objc_msgSend(location[0], "domain");
        v24 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@ (%ld)"), v23, objc_msgSend(location[0], "code"));
        objc_msgSend(v28, "setObject:forKeyedSubscript:", v24, CFSTR("underlyingError"));

      }
      objc_storeStrong(&v27, 0);
    }
    v25 = -[BuddyTargetDeviceMigrationManager analyticsManager](v30, "analyticsManager");
    -[BYAnalyticsManager addEvent:withPayload:persist:](v25, "addEvent:withPayload:persist:", CFSTR("com.apple.setupassistant.ios.migration"), v28, 1);

    objc_storeStrong(&v28, 0);
  }
  if (!location[0])
    -[BuddyTargetDeviceMigrationManager _stageReboot](v30, "_stageReboot");
  objc_storeStrong(location, 0);
}

- (__MKBAssertion)acquireDeviceLockAssertion
{
  uint64_t v2;
  NSObject *v3;
  os_log_type_t v4;
  NSString *v5;
  char v7;
  NSString *v8;
  char v9;
  id v10;
  os_log_t v11;
  uint8_t buf[7];
  os_log_type_t v13;
  os_log_t oslog;
  __MKBAssertion *v15;
  CFTypeRef cf;
  id location;
  objc_super v18;
  SEL v19;
  BuddyTargetDeviceMigrationManager *v20;
  __MKBAssertion *v21;
  uint8_t v22[24];

  v20 = self;
  v19 = a2;
  if (-[BuddyTargetDeviceMigrationManager softwareUpdateDidOccur](self, "softwareUpdateDidOccur"))
  {
    location = objc_alloc_init((Class)BYBuddyDaemonGeneralClient);
    objc_msgSend(location, "cancelDataMigratorDeferredExit");
    cf = 0;
    v2 = MKBDeviceLockAssertionConsume(&__NSDictionary0__struct, &cf);
    v15 = (__MKBAssertion *)v2;
    if (v2)
    {
      oslog = (os_log_t)(id)_BYLoggingFacility(v2);
      v13 = OS_LOG_TYPE_DEFAULT;
      if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
      {
        v3 = oslog;
        v4 = v13;
        sub_100038C3C(buf);
        _os_log_impl((void *)&_mh_execute_header, v3, v4, "Device lock assertion consumed during migration", buf, 2u);
      }
      objc_storeStrong((id *)&oslog, 0);
    }
    else
    {
      v11 = (os_log_t)(id)_BYLoggingFacility(0);
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        v9 = 0;
        v7 = 0;
        if ((_BYIsInternalInstall() & 1) != 0)
        {
          v5 = (NSString *)cf;
        }
        else if (cf)
        {
          v10 = objc_msgSend((id)cf, "domain");
          v9 = 1;
          v5 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("<Error domain: %@, code %ld>"), v10, objc_msgSend((id)cf, "code"));
          v8 = v5;
          v7 = 1;
        }
        else
        {
          v5 = 0;
        }
        sub_100039500((uint64_t)v22, (uint64_t)v5);
        _os_log_error_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_ERROR, "Failed to consume device lock assertion during migration - %{public}@", v22, 0xCu);
        if ((v7 & 1) != 0)

        if ((v9 & 1) != 0)
      }
      objc_storeStrong((id *)&v11, 0);
      CFRelease(cf);
    }
    v21 = v15;
    objc_storeStrong(&location, 0);
  }
  else
  {
    v18.receiver = v20;
    v18.super_class = (Class)BuddyTargetDeviceMigrationManager;
    return -[BuddyTargetDeviceMigrationManager acquireDeviceLockAssertion](&v18, "acquireDeviceLockAssertion");
  }
  return v21;
}

+ (id)createDeviceTransferTask:(id)a3
{
  id v3;
  id v4;
  id location[3];

  location[2] = a1;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v3 = objc_alloc((Class)MBTargetDeviceTransferTask);
  v4 = objc_msgSend(v3, "initWithFileTransferSession:", location[0]);
  objc_storeStrong(location, 0);
  return v4;
}

- (id)_targetDeviceTransferTask
{
  return -[BuddyTargetDeviceMigrationManager deviceTransferTask](self, "deviceTransferTask", a2, self);
}

- (void)_stageReboot
{
  BYPreferencesController *v2;
  unsigned __int8 v3;
  uint64_t v4;
  NSObject *v5;
  os_log_type_t v6;
  uint64_t v7;
  BYPreferencesController *v8;
  NSNumber *v9;
  void (**v10)(_QWORD);
  void *v11;
  void **v12;
  int v13;
  int v14;
  void (*v15)(id *);
  void *v16;
  BuddyTargetDeviceMigrationManager *v17;
  os_log_type_t v18;
  os_log_t oslog;
  int v20;
  uint8_t buf[7];
  os_log_type_t v22;
  id location[2];
  BuddyTargetDeviceMigrationManager *v24;
  uint8_t v25[8];

  v24 = self;
  location[1] = (id)a2;
  v2 = -[BuddyTargetDeviceMigrationManager buddyPreferencesExcludedFromBackup](self, "buddyPreferencesExcludedFromBackup");
  v3 = +[BuddyMigrationState hasStateFromPreferences:](BuddyMigrationState, "hasStateFromPreferences:", v2);

  if ((v3 & 1) != 0)
  {
    location[0] = (id)_BYLoggingFacility(v4);
    v22 = OS_LOG_TYPE_DEFAULT;
    if (os_log_type_enabled((os_log_t)location[0], OS_LOG_TYPE_DEFAULT))
    {
      v5 = location[0];
      v6 = v22;
      sub_100038C3C(buf);
      _os_log_impl((void *)&_mh_execute_header, v5, v6, "Promoting device lock assertion...", buf, 2u);
    }
    objc_storeStrong(location, 0);
    v7 = MKBDeviceLockAssertionPromote(-[BuddyTargetDeviceMigrationManager deviceLockAssertion](v24, "deviceLockAssertion"));
    v20 = v7;
    if ((_DWORD)v7)
    {
      oslog = (os_log_t)(id)_BYLoggingFacility(v7);
      v18 = OS_LOG_TYPE_ERROR;
      if (os_log_type_enabled(oslog, OS_LOG_TYPE_ERROR))
      {
        sub_100046FA0(v25, v20);
        _os_log_error_impl((void *)&_mh_execute_header, oslog, v18, "Failed to promote device lock assertion: %d", v25, 8u);
      }
      objc_storeStrong((id *)&oslog, 0);
    }
  }
  v8 = -[BuddyTargetDeviceMigrationManager buddyPreferencesExcludedFromBackup](v24, "buddyPreferencesExcludedFromBackup");
  v9 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", -[BuddyTargetDeviceMigrationManager softwareUpdateDidOccur](v24, "softwareUpdateDidOccur"));
  -[BYPreferencesController setObject:forKey:persistImmediately:](v8, "setObject:forKey:persistImmediately:", v9, BYBuddySoftwareUpdateMigration, 1);

  v10 = (void (**)(_QWORD))-[BuddyTargetDeviceMigrationManager prepareForMigrationRebootBlock](v24, "prepareForMigrationRebootBlock");
  v10[2](v10);

  v11 = &_dispatch_main_q;
  v12 = _NSConcreteStackBlock;
  v13 = -1073741824;
  v14 = 0;
  v15 = sub_100085BC0;
  v16 = &unk_100280730;
  v17 = v24;
  dispatch_async((dispatch_queue_t)v11, &v12);

  objc_storeStrong((id *)&v17, 0);
}

- (void)_rebootDevice
{
  NSObject *v2;
  os_log_type_t v3;
  _TtP5Setup20LockdownModeProvider_ *v4;
  unsigned __int8 v5;
  uint64_t v6;
  NSObject *v7;
  os_log_type_t v8;
  _TtP5Setup20LockdownModeProvider_ *v9;
  NSObject *v10;
  void **v11;
  int v12;
  int v13;
  id (*v14)(uint64_t);
  void *v15;
  BuddyTargetDeviceMigrationManager *v16;
  void **v17;
  int v18;
  int v19;
  void (*v20)(NSObject *, void *);
  void *v21;
  id v22;
  uint8_t v23[15];
  os_log_type_t v24;
  id v25;
  id v26;
  uint8_t buf[7];
  os_log_type_t v28;
  id location[2];
  BuddyTargetDeviceMigrationManager *v30;

  v30 = self;
  location[1] = (id)a2;
  location[0] = (id)_BYLoggingFacility(self);
  v28 = OS_LOG_TYPE_DEFAULT;
  if (os_log_type_enabled((os_log_t)location[0], OS_LOG_TYPE_DEFAULT))
  {
    v2 = location[0];
    v3 = v28;
    sub_100038C3C(buf);
    _os_log_impl((void *)&_mh_execute_header, v2, v3, "Rebooting...", buf, 2u);
  }
  objc_storeStrong(location, 0);
  v26 = objc_alloc_init((Class)MBManager);
  v4 = -[BuddyTargetDeviceMigrationManager lockdownModeProvider](v30, "lockdownModeProvider");
  v5 = -[LockdownModeProvider hasStagedEnablement](v4, "hasStagedEnablement");

  if ((v5 & 1) != 0)
  {
    v25 = (id)_BYLoggingFacility(v6);
    v24 = OS_LOG_TYPE_DEFAULT;
    if (os_log_type_enabled((os_log_t)v25, OS_LOG_TYPE_DEFAULT))
    {
      v7 = v25;
      v8 = v24;
      sub_100038C3C(v23);
      _os_log_impl((void *)&_mh_execute_header, v7, v8, "Enabling lockdown...", v23, 2u);
    }
    objc_storeStrong(&v25, 0);
    v9 = -[BuddyTargetDeviceMigrationManager lockdownModeProvider](v30, "lockdownModeProvider");
    v17 = _NSConcreteStackBlock;
    v18 = -1073741824;
    v19 = 0;
    v20 = sub_100085F24;
    v21 = &unk_100280B80;
    v22 = v26;
    -[LockdownModeProvider enableWithStrategy:completionHandler:](v9, "enableWithStrategy:completionHandler:", 1, &v17);

    objc_storeStrong(&v22, 0);
  }
  else
  {
    objc_msgSend(v26, "rebootDevice:", 0);
  }
  v10 = -[BuddyTargetDeviceMigrationManager migrationQueue](v30, "migrationQueue");
  v11 = _NSConcreteStackBlock;
  v12 = -1073741824;
  v13 = 0;
  v14 = sub_10008609C;
  v15 = &unk_100280730;
  v16 = v30;
  dispatch_async(v10, &v11);

  objc_storeStrong((id *)&v16, 0);
  objc_storeStrong(&v26, 0);
}

- (void)connectionTerminated
{
  _BOOL8 v2;
  NSObject *v3;
  os_log_type_t v4;
  NSObject *v5;
  os_log_type_t v6;
  _WORD v7[3];
  os_log_type_t v8;
  os_log_t v9;
  uint8_t buf[7];
  os_log_type_t v11;
  os_log_t oslog[2];
  BuddyTargetDeviceMigrationManager *v13;

  v13 = self;
  oslog[1] = (os_log_t)a2;
  v2 = -[BuddyTargetDeviceMigrationManager ignoreProximityDisconnections](self, "ignoreProximityDisconnections");
  if (v2)
  {
    oslog[0] = (os_log_t)(id)_BYLoggingFacility(v2);
    v11 = OS_LOG_TYPE_DEFAULT;
    if (os_log_type_enabled(oslog[0], OS_LOG_TYPE_DEFAULT))
    {
      v3 = oslog[0];
      v4 = v11;
      sub_100038C3C(buf);
      _os_log_impl((void *)&_mh_execute_header, v3, v4, "Ignoring loss of proximity connection; will not cancel migration",
        buf,
        2u);
    }
    objc_storeStrong((id *)oslog, 0);
  }
  else
  {
    v9 = (os_log_t)(id)_BYLoggingFacility(v2);
    v8 = OS_LOG_TYPE_DEFAULT;
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      v5 = v9;
      v6 = v8;
      sub_100038C3C(v7);
      _os_log_impl((void *)&_mh_execute_header, v5, v6, "Cancelling migration in response to loss of proximity connection...", (uint8_t *)v7, 2u);
    }
    objc_storeStrong((id *)&v9, 0);
    -[BuddyTargetDeviceMigrationManager cancelWithCause:](v13, "cancelWithCause:", 4);
  }
}

- (void)setRequiresUpdateToMigrate:(BOOL)a3
{
  self->_requiresUpdateToMigrate = a3;
}

- (BOOL)forceUpdateToMigrate
{
  return self->_forceUpdateToMigrate;
}

- (BOOL)userChoseMigration
{
  return self->_userChoseMigration;
}

- (void)setUserChoseMigration:(BOOL)a3
{
  self->_userChoseMigration = a3;
}

- (BOOL)hasTransferredData
{
  return self->_hasTransferredData;
}

- (void)setHasTransferredData:(BOOL)a3
{
  self->_hasTransferredData = a3;
}

- (BOOL)didComplete
{
  return self->_didComplete;
}

- (void)setDidComplete:(BOOL)a3
{
  self->_didComplete = a3;
}

- (BOOL)ignoreProximityDisconnections
{
  return self->_ignoreProximityDisconnections;
}

- (void)setIgnoreProximityDisconnections:(BOOL)a3
{
  self->_ignoreProximityDisconnections = a3;
}

- (BOOL)softwareUpdateDidOccur
{
  return self->_softwareUpdateDidOccur;
}

- (void)setSoftwareUpdateDidOccur:(BOOL)a3
{
  self->_softwareUpdateDidOccur = a3;
}

- (void)setHasVersionIncompatibility:(BOOL)a3
{
  self->_hasVersionIncompatibility = a3;
}

- (BuddyNetworkProvider)networkProvider
{
  return self->_networkProvider;
}

- (void)setNetworkProvider:(id)a3
{
  objc_storeStrong((id *)&self->_networkProvider, a3);
}

- (ProximitySetupController)proximitySetupController
{
  return self->_proximitySetupController;
}

- (void)setProximitySetupController:(id)a3
{
  objc_storeStrong((id *)&self->_proximitySetupController, a3);
}

- (id)prepareForMigrationRebootBlock
{
  return self->_prepareForMigrationRebootBlock;
}

- (void)setPrepareForMigrationRebootBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (BOOL)hasImportedKeychain
{
  return self->_hasImportedKeychain;
}

- (void)setHasImportedKeychain:(BOOL)a3
{
  self->_hasImportedKeychain = a3;
}

- (MBDeviceTransferPreflight)preflightInformation
{
  return self->_preflightInformation;
}

- (void)setPreflightInformation:(id)a3
{
  objc_storeStrong((id *)&self->_preflightInformation, a3);
}

- (NSError)preflightError
{
  return self->_preflightError;
}

- (void)setPreflightError:(id)a3
{
  objc_storeStrong((id *)&self->_preflightError, a3);
}

- (MBDeviceTransferKeychain)keychainInfo
{
  return self->_keychainInfo;
}

- (void)setKeychainInfo:(id)a3
{
  objc_storeStrong((id *)&self->_keychainInfo, a3);
}

- (NSError)keychainError
{
  return self->_keychainError;
}

- (void)setKeychainError:(id)a3
{
  objc_storeStrong((id *)&self->_keychainError, a3);
}

- (id)preflightCompletionBlock
{
  return self->_preflightCompletionBlock;
}

- (void)setPreflightCompletionBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 80);
}

- (OS_dispatch_queue)keychainDataTransferCompletionQueue
{
  return self->_keychainDataTransferCompletionQueue;
}

- (void)setKeychainDataTransferCompletionQueue:(id)a3
{
  objc_storeStrong((id *)&self->_keychainDataTransferCompletionQueue, a3);
}

- (id)keychainDataImportCompletionBlock
{
  return self->_keychainDataImportCompletionBlock;
}

- (void)setKeychainDataImportCompletionBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 96);
}

- (NSString)sourceDeviceModel
{
  return self->_sourceDeviceModel;
}

- (void)setSourceDeviceModel:(id)a3
{
  objc_storeStrong((id *)&self->_sourceDeviceModel, a3);
}

- (NSString)sourceDeviceProductVersion
{
  return self->_sourceDeviceProductVersion;
}

- (void)setSourceDeviceProductVersion:(id)a3
{
  objc_storeStrong((id *)&self->_sourceDeviceProductVersion, a3);
}

- (BOOL)inAppleStore
{
  return self->_inAppleStore;
}

- (void)setInAppleStore:(BOOL)a3
{
  self->_inAppleStore = a3;
}

- (BYPasscodeCacheManager)passcodeCacheManager
{
  return self->_passcodeCacheManager;
}

- (void)setPasscodeCacheManager:(id)a3
{
  objc_storeStrong((id *)&self->_passcodeCacheManager, a3);
}

- (BYPreferencesController)buddyPreferencesExcludedFromBackup
{
  return self->_buddyPreferencesExcludedFromBackup;
}

- (void)setBuddyPreferencesExcludedFromBackup:(id)a3
{
  objc_storeStrong((id *)&self->_buddyPreferencesExcludedFromBackup, a3);
}

- (BYAnalyticsManager)analyticsManager
{
  return self->_analyticsManager;
}

- (void)setAnalyticsManager:(id)a3
{
  objc_storeStrong((id *)&self->_analyticsManager, a3);
}

- (BuddyDisplayMonitor)displayMonitor
{
  return self->_displayMonitor;
}

- (void)setDisplayMonitor:(id)a3
{
  objc_storeStrong((id *)&self->_displayMonitor, a3);
}

- (_TtP5Setup20LockdownModeProvider_)lockdownModeProvider
{
  return self->_lockdownModeProvider;
}

- (void)setLockdownModeProvider:(id)a3
{
  objc_storeStrong((id *)&self->_lockdownModeProvider, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lockdownModeProvider, 0);
  objc_storeStrong((id *)&self->_displayMonitor, 0);
  objc_storeStrong((id *)&self->_analyticsManager, 0);
  objc_storeStrong((id *)&self->_buddyPreferencesExcludedFromBackup, 0);
  objc_storeStrong((id *)&self->_passcodeCacheManager, 0);
  objc_storeStrong((id *)&self->_sourceDeviceProductVersion, 0);
  objc_storeStrong((id *)&self->_sourceDeviceModel, 0);
  objc_storeStrong(&self->_keychainDataImportCompletionBlock, 0);
  objc_storeStrong((id *)&self->_keychainDataTransferCompletionQueue, 0);
  objc_storeStrong(&self->_preflightCompletionBlock, 0);
  objc_storeStrong((id *)&self->_keychainError, 0);
  objc_storeStrong((id *)&self->_keychainInfo, 0);
  objc_storeStrong((id *)&self->_preflightError, 0);
  objc_storeStrong((id *)&self->_preflightInformation, 0);
  objc_storeStrong(&self->_prepareForMigrationRebootBlock, 0);
  objc_storeStrong((id *)&self->_proximitySetupController, 0);
  objc_storeStrong((id *)&self->_networkProvider, 0);
}

@end
