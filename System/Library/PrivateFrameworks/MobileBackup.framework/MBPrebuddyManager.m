@implementation MBPrebuddyManager

+ (id)sharedManager
{
  if (sharedManager_onceToken != -1)
    dispatch_once(&sharedManager_onceToken, &__block_literal_global_15);
  return (id)_sharedManager;
}

void __34__MBPrebuddyManager_sharedManager__block_invoke()
{
  MBPrebuddyManager *v0;
  void *v1;

  v0 = objc_alloc_init(MBPrebuddyManager);
  v1 = (void *)_sharedManager;
  _sharedManager = (uint64_t)v0;

}

- (MBPrebuddyManager)init
{
  MBPrebuddyManager *v2;
  MBXPCClient *v3;
  uint64_t v4;
  MBXPCClient *managerClient;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)MBPrebuddyManager;
  v2 = -[MBPrebuddyManager init](&v7, sel_init);
  if (v2)
  {
    v3 = [MBXPCClient alloc];
    v4 = -[MBXPCClient initWithDelegate:eventQueue:](v3, "initWithDelegate:eventQueue:", v2, MEMORY[0x1E0C80D38]);
    managerClient = v2->_managerClient;
    v2->_managerClient = (MBXPCClient *)v4;

  }
  return v2;
}

- (MBManagerDelegate)delegate
{
  return -[MBManager delegate](self->_managerClient, "delegate");
}

- (void)setDelegate:(id)a3
{
  -[MBManager setDelegate:](self->_managerClient, "setDelegate:", a3);
}

- (void)turnOnBackup
{
  -[MBXPCClient setBackupEnabled:](self->_managerClient, "setBackupEnabled:", 1);
}

- (void)signalPrebuddy:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = v4;
  if (v4)
  {
    v8[0] = v4;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v8, 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = (void *)MEMORY[0x1E0C9AA60];
  }
  v7 = -[MBXPCClient _sendRequest:arguments:error:](self->_managerClient, "_sendRequest:arguments:error:", CFSTR("kMBMessageStartPrebuddySignal"), v6, 0);

}

- (void)extendPrebuddy:(id)a3 completion:(id)a4
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD block[4];
  id v8;

  v4 = a4;
  dispatch_get_global_queue(21, 0);
  v5 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __47__MBPrebuddyManager_extendPrebuddy_completion___block_invoke;
  block[3] = &unk_1E995D750;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, block);

}

uint64_t __47__MBPrebuddyManager_extendPrebuddy_completion___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, uint64_t, _QWORD))(result + 16))(result, 1, MEMORY[0x1E0C9AA70]);
  return result;
}

- (void)prebuddyBackupDeleted:(id)a3
{
  MBManager *v4;
  BOOL v5;
  id v6;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  id v14;
  id v15;
  uint8_t buf[4];
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = objc_alloc_init(MBManager);
  v15 = 0;
  v5 = -[MBManager restorePreviousSettingsEnabledForMegaBackup:](v4, "restorePreviousSettingsEnabledForMegaBackup:", &v15);
  v6 = v15;
  if (!v5)
  {
    MBGetDefaultLog();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v17 = v6;
      _os_log_impl(&dword_1D5213000, v7, OS_LOG_TYPE_DEFAULT, "Failed to restore previous settings enabled for mega backup: %@", buf, 0xCu);
      _MBLog(CFSTR("DEFAULT"), (uint64_t)"Failed to restore previous settings enabled for mega backup: %@", v8, v9, v10, v11, v12, v13, (uint64_t)v6);
    }

  }
  v14 = -[MBXPCClient _sendRequest:arguments:error:](self->_managerClient, "_sendRequest:arguments:error:", CFSTR("kMBMessagePrebuddyBackupDeleted"), 0, 0);

}

- (void)cancelPrebuddy
{
  id v2;

  v2 = -[MBXPCClient _sendRequest:arguments:error:](self->_managerClient, "_sendRequest:arguments:error:", CFSTR("kMBMessageCancelPrebuddySignal"), 0, 0);
}

- (void)cancelPrebuddyOnAccountSignOut
{
  id v2;

  v2 = -[MBXPCClient _sendRequest:arguments:error:](self->_managerClient, "_sendRequest:arguments:error:", CFSTR("kMBMessageCancelPrebuddySignal"), &unk_1E996E220, 0);
}

- (void)beginPrebuddyBackupFromManualSignal:(BOOL)a3
{
  -[MBPrebuddyManager beginPrebuddyBackupFromManualSignal:error:](self, "beginPrebuddyBackupFromManualSignal:error:", a3, 0);
}

- (BOOL)beginPrebuddyBackupFromManualSignal:(BOOL)a3 error:(id *)a4
{
  MBXPCClient *managerClient;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x1E0C80C00];
  managerClient = self->_managerClient;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = v6;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v10, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[MBXPCClient _sendRequest:arguments:error:](managerClient, "_sendRequest:arguments:error:", CFSTR("kMBMessageStartPrebuddyBackup"), v7, a4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(a4) = objc_msgSend(v8, "BOOLValue");
  return (char)a4;
}

+ (NSString)twoDeviceImageName
{
  void *v2;
  void *v3;
  void *v4;
  int v5;
  const __CFString *v6;
  char v7;
  const __CFString *v8;

  MBDeviceClass();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "lowercaseString");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  MBHomeButtonType();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "integerValue");

  if (objc_msgSend(v3, "isEqualToString:", CFSTR("ipad")))
  {
    if (v5 == 2)
      v6 = CFSTR("iPad");
    else
      v6 = CFSTR("iPad_home");
  }
  else
  {
    v7 = objc_msgSend(v3, "isEqualToString:", CFSTR("ipod"));
    v8 = CFSTR("iPhone_home");
    if (v5 == 2)
      v8 = CFSTR("iPhone");
    if ((v7 & 1) != 0)
      v6 = CFSTR("ipod_touch");
    else
      v6 = v8;
  }

  return &v6->isa;
}

+ (NSString)backupToCloudImageName
{
  void *v2;
  void *v3;
  void *v4;
  int v5;
  const __CFString *v6;
  char v7;
  const __CFString *v8;

  MBDeviceClass();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "lowercaseString");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  MBHomeButtonType();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "integerValue");

  if (objc_msgSend(v3, "isEqualToString:", CFSTR("ipad")))
  {
    if (v5 == 2)
      v6 = CFSTR("cloud-arrow-up-iPad");
    else
      v6 = CFSTR("cloud-arrow-up-iPad-2");
  }
  else
  {
    v7 = objc_msgSend(v3, "isEqualToString:", CFSTR("ipod"));
    v8 = CFSTR("cloud-arrow-up-iphone-2");
    if (v5 == 2)
      v8 = CFSTR("cloud-arrow-up-iphone-1");
    if ((v7 & 1) != 0)
      v6 = CFSTR("cloud-arrow-up-iPod");
    else
      v6 = v8;
  }

  return &v6->isa;
}

+ (id)baseFollowupItem
{
  id v3;
  void *v4;

  v3 = objc_alloc_init(MEMORY[0x1E0D15E38]);
  objc_msgSend(v3, "setUniqueIdentifier:", CFSTR("com.apple.backupd.prebuddy"));
  objc_msgSend(v3, "setGroupIdentifier:", *MEMORY[0x1E0D15E00]);
  objc_msgSend(v3, "setTargetBundleIdentifier:", *MEMORY[0x1E0D15DD8]);
  objc_msgSend(v3, "setExtensionIdentifier:", CFSTR("com.apple.MobileBackup.framework.MBPrebuddyFollowUpExtension"));
  objc_msgSend(v3, "setRepresentingBundlePath:", CFSTR("/System/Library/PrivateFrameworks/MobileBackup.framework/PlugIns/MBPrebuddyFollowUpExtension.appex"));
  objc_msgSend(a1, "twoDeviceImageName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setBundleIconName:", v4);

  objc_msgSend(v3, "setDisplayStyle:", 18);
  return v3;
}

+ (BOOL)hasPrebuddyFollowUp
{
  void *v2;
  void *v3;
  id v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  void *v17;
  void *v18;
  char v19;
  BOOL v20;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  id v26;
  uint8_t v27[128];
  uint8_t buf[4];
  id v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D15E30]), "initWithClientIdentifier:", CFSTR("com.apple.backupd"));
  v26 = 0;
  objc_msgSend(v2, "pendingFollowUpItems:", &v26);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v26;
  if (v4)
  {
    MBGetDefaultLog();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v29 = v4;
      _os_log_impl(&dword_1D5213000, v5, OS_LOG_TYPE_ERROR, "Unable to fetch pending follow ups: %@", buf, 0xCu);
      _MBLog(CFSTR("ERROR"), (uint64_t)"Unable to fetch pending follow ups: %@", v6, v7, v8, v9, v10, v11, (uint64_t)v4);
    }

  }
  v24 = 0u;
  v25 = 0u;
  v22 = 0u;
  v23 = 0u;
  v12 = v3;
  v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v22, v27, 16);
  if (v13)
  {
    v14 = v13;
    v15 = *(_QWORD *)v23;
    do
    {
      for (i = 0; i != v14; ++i)
      {
        if (*(_QWORD *)v23 != v15)
          objc_enumerationMutation(v12);
        v17 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * i);
        objc_msgSend(v17, "uniqueIdentifier");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v18, "isEqualToString:", CFSTR("com.apple.backupd.prebuddy")))
        {
          v19 = objc_msgSend(v17, "isExpired");

          if ((v19 & 1) == 0)
          {
            v20 = 1;
            goto LABEL_17;
          }
        }
        else
        {

        }
      }
      v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v22, v27, 16);
    }
    while (v14);
  }
  v20 = 0;
LABEL_17:

  return v20;
}

- (void)followupAction:(id)a3
{
  void *v3;
  void (**v4)(id, void *);
  void *v5;
  void *v6;
  void *v7;
  const __CFString *v8;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x1E0C80C00];
  v3 = (void *)MEMORY[0x1E0D15E28];
  v4 = (void (**)(id, void *))a3;
  MBLocalizedStringFromTable(CFSTR("MB_PREBUDDY_START_TITLE"), CFSTR("MobileBackup"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "actionWithLabel:url:", v5, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = CFSTR("manualSignal");
  v9[0] = MEMORY[0x1E0C9AAB0];
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v9, &v8, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setUserInfo:", v7);

  v4[2](v4, v6);
}

- (id)dateOfLastBackup
{
  void *v2;
  void *v3;

  -[MBPrebuddyManager managerClient](self, "managerClient");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "dateOfLastBackup");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (BOOL)isPrebuddyMode
{
  void *v2;
  char v3;

  -[MBXPCClient _sendRequest:arguments:error:](self->_managerClient, "_sendRequest:arguments:error:", CFSTR("kMBMessageIsPrebuddyMode"), MEMORY[0x1E0C9AA60], 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "BOOLValue");

  return v3;
}

- (void)updateFollowUp
{
  id v2;

  v2 = -[MBXPCClient _sendRequest:arguments:error:](self->_managerClient, "_sendRequest:arguments:error:", CFSTR("kMBMessageUpdatePrebuddyFollowUp"), 0, 0);
}

- (void)shortenPrebuddyExpiration
{
  NSObject *v3;
  void *v4;
  void *v5;
  MBXPCClient *managerClient;
  BOOL v7;
  id v8;
  NSObject *v9;
  NSObject *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  id v30;
  uint8_t buf[4];
  void *v32;
  __int16 v33;
  id v34;
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  if (-[MBPrebuddyManager isPrebuddyMode](self, "isPrebuddyMode"))
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v3 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99D48], "currentCalendar");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "dateByAddingUnit:value:toDate:options:", 64, 5, v3, 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    managerClient = self->_managerClient;
    v30 = 0;
    v7 = -[MBXPCClient requestMegaBackupExpirationDate:error:](managerClient, "requestMegaBackupExpirationDate:error:", v5, &v30);
    v8 = v30;
    MBGetDefaultLog();
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = v9;
    if (v7)
    {
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        v32 = v5;
        _os_log_impl(&dword_1D5213000, v10, OS_LOG_TYPE_DEFAULT, "Successfully shortened prebuddy expiration to %{public}@", buf, 0xCu);
        _MBLog(CFSTR("DEFAULT"), (uint64_t)"Successfully shortened prebuddy expiration to %{public}@", v11, v12, v13, v14, v15, v16, (uint64_t)v5);
      }
    }
    else if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543618;
      v32 = v5;
      v33 = 2114;
      v34 = v8;
      _os_log_impl(&dword_1D5213000, v10, OS_LOG_TYPE_ERROR, "Unable to shorten prebuddy expiration to %{public}@. Error: %{public}@", buf, 0x16u);
      _MBLog(CFSTR("ERROR"), (uint64_t)"Unable to shorten prebuddy expiration to %{public}@. Error: %{public}@", v23, v24, v25, v26, v27, v28, (uint64_t)v5);
    }

  }
  else
  {
    MBGetDefaultLog();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D5213000, v3, OS_LOG_TYPE_DEFAULT, "Not in Prebuddy mode, so nothing to shorten.", buf, 2u);
      _MBLog(CFSTR("DEFAULT"), (uint64_t)"Not in Prebuddy mode, so nothing to shorten.", v17, v18, v19, v20, v21, v22, v29);
    }
  }

}

- (MBXPCClient)managerClient
{
  return (MBXPCClient *)objc_getProperty(self, a2, 8, 1);
}

- (void)setManagerClient:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 8);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_managerClient, 0);
}

@end
