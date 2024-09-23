@implementation _KSiCloudDeviceListMonitor

+ (id)iCloudDeviceListMonitor
{
  if (iCloudDeviceListMonitor_onceToken != -1)
    dispatch_once(&iCloudDeviceListMonitor_onceToken, &__block_literal_global);
  return (id)iCloudDeviceListMonitor_sharedInstance;
}

- (_KSiCloudDeviceListMonitor)init
{
  _KSiCloudDeviceListMonitor *v2;
  ACAccountStore *v3;
  ACAccountStore *accountStore;
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  ACAccount *account;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)_KSiCloudDeviceListMonitor;
  v2 = -[_KSiCloudDeviceListMonitor init](&v11, sel_init);
  if (v2)
  {
    v3 = (ACAccountStore *)objc_alloc_init(MEMORY[0x24BDB4398]);
    accountStore = v2->_accountStore;
    v2->_accountStore = v3;

    +[_KSTextReplacementHelper fetchConfigurationPlistIfNeeded](_KSTextReplacementHelper, "fetchConfigurationPlistIfNeeded");
    v5 = objc_alloc(MEMORY[0x24BDBCF50]);
    +[_KSUtilities userDefaultsSuiteName](_KSUtilities, "userDefaultsSuiteName");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (void *)objc_msgSend(v5, "initWithSuiteName:", v6);

    -[ACAccountStore aa_primaryAppleAccount](v2->_accountStore, "aa_primaryAppleAccount");
    v8 = objc_claimAutoreleasedReturnValue();
    account = v2->_account;
    v2->_account = (ACAccount *)v8;

    -[_KSiCloudDeviceListMonitor setMajorVersForCloudKitSynciOS:](v2, "setMajorVersForCloudKitSynciOS:", objc_msgSend(v7, "integerForKey:", CFSTR("iOSMajorVersForCloudKitSync")));
    -[_KSiCloudDeviceListMonitor setMinorVersForCloudKitSynciOS:](v2, "setMinorVersForCloudKitSynciOS:", objc_msgSend(v7, "integerForKey:", CFSTR("iOSMinorVersForCloudKitSync")));
    -[_KSiCloudDeviceListMonitor setMajorVersForCloudKitSyncMacOS:](v2, "setMajorVersForCloudKitSyncMacOS:", objc_msgSend(v7, "integerForKey:", CFSTR("osxMajorVersForCloudKitSync")));
    -[_KSiCloudDeviceListMonitor setMinorVersForCloudKitSyncMacOS:](v2, "setMinorVersForCloudKitSyncMacOS:", objc_msgSend(v7, "integerForKey:", CFSTR("osxMinorVersForCloudKitSync")));
    -[_KSiCloudDeviceListMonitor setMinorSubversionForCloudKitSyncMacOS:](v2, "setMinorSubversionForCloudKitSyncMacOS:", objc_msgSend(v7, "integerForKey:", CFSTR("osxMinorSubversionForCloudKitSync")));

  }
  return v2;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

  v4.receiver = self;
  v4.super_class = (Class)_KSiCloudDeviceListMonitor;
  -[_KSiCloudDeviceListMonitor dealloc](&v4, sel_dealloc);
}

- (void)resetDataNoAccount
{
  id v2;
  void *v3;
  id v4;

  v2 = objc_alloc(MEMORY[0x24BDBCF50]);
  +[_KSUtilities userDefaultsSuiteName](_KSUtilities, "userDefaultsSuiteName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (id)objc_msgSend(v2, "initWithSuiteName:", v3);

  objc_msgSend(v4, "setBool:forKey:", 0, CFSTR("_KSTRCloudKitMigratable"));
  objc_msgSend(v4, "removeObjectForKey:", CFSTR("_KSCKMigrationPreviousCheckDate"));

}

- (BOOL)isSWVersionCloudKitSyncCompatible:(id)a3
{
  id v4;
  void *v5;
  int v6;
  int64_t v7;
  int64_t v8;
  int64_t v9;
  BOOL v10;
  void *v11;
  void *v12;
  void *v13;
  int v15;
  uint64_t v16;

  v4 = a3;
  v5 = v4;
  if (v4)
  {
    if ((objc_msgSend(v4, "containsString:", CFSTR("OSX")) & 1) != 0
      || objc_msgSend(v5, "containsString:", CFSTR("iOS")))
    {
      v6 = objc_msgSend(v5, "hasPrefix:", CFSTR("OSX"));
      if ((v6 & 1) != 0)
      {
        v7 = -[_KSiCloudDeviceListMonitor majorVersForCloudKitSyncMacOS](self, "majorVersForCloudKitSyncMacOS");
        v8 = -[_KSiCloudDeviceListMonitor minorVersForCloudKitSyncMacOS](self, "minorVersForCloudKitSyncMacOS");
        v9 = -[_KSiCloudDeviceListMonitor minorSubversionForCloudKitSyncMacOS](self, "minorSubversionForCloudKitSyncMacOS");
      }
      else
      {
        v7 = -[_KSiCloudDeviceListMonitor majorVersForCloudKitSynciOS](self, "majorVersForCloudKitSynciOS");
        v8 = -[_KSiCloudDeviceListMonitor minorVersForCloudKitSynciOS](self, "minorVersForCloudKitSynciOS");
        v9 = 0;
      }
      v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17A8]), "initWithString:", v5);
      objc_msgSend(MEMORY[0x24BDD14A8], "decimalDigitCharacterSet");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "invertedSet");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "setCharactersToBeSkipped:", v13);

      v16 = 0;
      v15 = 0;
      v10 = objc_msgSend(v11, "scanInt:", (char *)&v16 + 4)
         && objc_msgSend(v11, "scanInt:", &v16)
         && (v7 < SHIDWORD(v16)
          || v7 == SHIDWORD(v16)
          && (((v8 <= (int)v16) & ~v6) != 0
           || v8 < (int)v16
           || v8 == (int)v16 && (!v9 || objc_msgSend(v11, "scanInt:", &v15) && v9 <= v15)));

    }
    else
    {
      v10 = 1;
    }
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (BOOL)canMigrateToCloudKit
{
  id v3;
  void *v4;
  void *v5;
  char v6;
  void *v7;
  void *v8;
  double v9;

  v3 = objc_alloc(MEMORY[0x24BDBCF50]);
  +[_KSUtilities userDefaultsSuiteName](_KSUtilities, "userDefaultsSuiteName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v3, "initWithSuiteName:", v4);

  v6 = objc_msgSend(v5, "BOOLForKey:", CFSTR("_KSTRCloudKitMigratable"));
  if ((v6 & 1) == 0)
  {
    objc_msgSend(v5, "objectForKey:", CFSTR("_KSCKMigrationPreviousCheckDate"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v7;
    if (!v7 || (objc_msgSend(v7, "timeIntervalSinceNow"), fabs(v9) > 216000.0))
      -[_KSiCloudDeviceListMonitor queryMigrationState](self, "queryMigrationState");

  }
  return v6;
}

- (void)fetchCloudKitDevicesWithCompletionBlock:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  id v8;
  _QWORD v9[5];
  id v10;

  v4 = a3;
  v5 = objc_alloc(MEMORY[0x24BE04910]);
  -[_KSiCloudDeviceListMonitor account](self, "account");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v5, "initWithAccount:", v6);

  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __70___KSiCloudDeviceListMonitor_fetchCloudKitDevicesWithCompletionBlock___block_invoke;
  v9[3] = &unk_24E2048A0;
  v9[4] = self;
  v10 = v4;
  v8 = v4;
  objc_msgSend(v7, "performRequestWithHandler:", v9);

}

- (void)fetchICloudDevicesWithCompletionBlock:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  id v8;
  _QWORD v9[4];
  id v10;

  v4 = a3;
  v5 = objc_alloc(MEMORY[0x24BE04968]);
  -[_KSiCloudDeviceListMonitor account](self, "account");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v5, "initWithAccount:", v6);

  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __68___KSiCloudDeviceListMonitor_fetchICloudDevicesWithCompletionBlock___block_invoke;
  v9[3] = &unk_24E2048C8;
  v10 = v4;
  v8 = v4;
  objc_msgSend(v7, "performRequestWithHandler:", v9);

}

- (void)queryMigrationState
{
  void *v3;

  if (queryMigrationState_onceToken != -1)
    dispatch_once(&queryMigrationState_onceToken, &__block_literal_global_116);
  -[_KSiCloudDeviceListMonitor account](self, "account");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
    -[_KSiCloudDeviceListMonitor isAccountCompatibleForCloudKitSyncingWithCompletionBlock:](self, "isAccountCompatibleForCloudKitSyncingWithCompletionBlock:", &__block_literal_global_123);
}

- (void)isAccountCompatibleForCloudKitSyncingWithCompletionBlock:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __87___KSiCloudDeviceListMonitor_isAccountCompatibleForCloudKitSyncingWithCompletionBlock___block_invoke;
  v6[3] = &unk_24E204950;
  v6[4] = self;
  v7 = v4;
  v5 = v4;
  -[_KSiCloudDeviceListMonitor fetchCloudKitDevicesWithCompletionBlock:](self, "fetchCloudKitDevicesWithCompletionBlock:", v6);

}

- (ACAccountStore)accountStore
{
  return self->_accountStore;
}

- (void)setAccountStore:(id)a3
{
  objc_storeStrong((id *)&self->_accountStore, a3);
}

- (ACAccount)account
{
  return self->_account;
}

- (void)setAccount:(id)a3
{
  objc_storeStrong((id *)&self->_account, a3);
}

- (int64_t)majorVersForCloudKitSyncMacOS
{
  return self->_majorVersForCloudKitSyncMacOS;
}

- (void)setMajorVersForCloudKitSyncMacOS:(int64_t)a3
{
  self->_majorVersForCloudKitSyncMacOS = a3;
}

- (int64_t)minorVersForCloudKitSyncMacOS
{
  return self->_minorVersForCloudKitSyncMacOS;
}

- (void)setMinorVersForCloudKitSyncMacOS:(int64_t)a3
{
  self->_minorVersForCloudKitSyncMacOS = a3;
}

- (int64_t)minorSubversionForCloudKitSyncMacOS
{
  return self->_minorSubversionForCloudKitSyncMacOS;
}

- (void)setMinorSubversionForCloudKitSyncMacOS:(int64_t)a3
{
  self->_minorSubversionForCloudKitSyncMacOS = a3;
}

- (int64_t)majorVersForCloudKitSynciOS
{
  return self->_majorVersForCloudKitSynciOS;
}

- (void)setMajorVersForCloudKitSynciOS:(int64_t)a3
{
  self->_majorVersForCloudKitSynciOS = a3;
}

- (int64_t)minorVersForCloudKitSynciOS
{
  return self->_minorVersForCloudKitSynciOS;
}

- (void)setMinorVersForCloudKitSynciOS:(int64_t)a3
{
  self->_minorVersForCloudKitSynciOS = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_account, 0);
  objc_storeStrong((id *)&self->_accountStore, 0);
}

@end
