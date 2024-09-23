@implementation IMCommSafetySettingsManager

- (void)setEnablementSubscription:(id)a3
{
  objc_storeStrong(&self->_enablementSubscription, a3);
}

- (IMCommSafetySettingsManager)init
{
  IMCommSafetySettingsManager *v2;
  NSObject *v3;
  NSMutableArray *v4;
  NSMutableArray *parents;
  dispatch_queue_t v6;
  OS_dispatch_queue *connectionQueue;
  void *v8;
  const char **v9;
  void *v10;
  const char *v11;
  NSObject *v12;
  uint64_t v13;
  IMCommSafetySettingsManager *v14;
  NSObject *v15;
  IMCommSafetySettingsManager *result;
  _QWORD block[4];
  id v18;
  _QWORD handler[4];
  id v20;
  id location;
  objc_super v22;
  uint8_t buf[8];
  uint8_t *v24;
  uint64_t v25;
  uint64_t v26;

  v22.receiver = self;
  v22.super_class = (Class)IMCommSafetySettingsManager;
  v2 = -[IMCommSafetySettingsManager init](&v22, sel_init);
  if (!v2)
    goto LABEL_14;
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_19E239000, v3, OS_LOG_TYPE_INFO, "Initializing", buf, 2u);
    }

  }
  v2->_notificationToken = -1;
  v2->_protectedChildAge = -1;
  v4 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
  parents = v2->_parents;
  v2->_parents = v4;

  v2->_hasConnected = 0;
  v2->_enablementGroup = 3;
  v6 = dispatch_queue_create("com.apple.private.IMCommSafetySettingsManager.connection", 0);
  connectionQueue = v2->_connectionQueue;
  v2->_connectionQueue = (OS_dispatch_queue *)v6;

  +[IMUnlockMonitor sharedInstance](IMUnlockMonitor, "sharedInstance");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "addListener:", v2);

  if (!-[IMCommSafetySettingsManager _shouldUseScreenTimeAndFamilyCircle](v2, "_shouldUseScreenTimeAndFamilyCircle"))
  {
LABEL_13:
    -[IMCommSafetySettingsManager _configureUserSafetySettingsListener](v2, "_configureUserSafetySettingsListener");
LABEL_14:
    v14 = v2;
    goto LABEL_15;
  }
  location = 0;
  objc_initWeak(&location, v2);
  *(_QWORD *)buf = 0;
  v24 = buf;
  v25 = 0x2020000000;
  v9 = (const char **)qword_1ECFC7090;
  v26 = qword_1ECFC7090;
  if (!qword_1ECFC7090)
  {
    v10 = (void *)sub_19E24B458();
    v9 = (const char **)dlsym(v10, "STSettingsDidChangeNotification");
    *((_QWORD *)v24 + 3) = v9;
    qword_1ECFC7090 = (uint64_t)v9;
  }
  _Block_object_dispose(buf, 8);
  if (v9)
  {
    v11 = *v9;
    v12 = v2->_connectionQueue;
    v13 = MEMORY[0x1E0C809B0];
    handler[0] = MEMORY[0x1E0C809B0];
    handler[1] = 3221225472;
    handler[2] = sub_19E313BC8;
    handler[3] = &unk_1E3FB76E8;
    objc_copyWeak(&v20, &location);
    if (notify_register_dispatch(v11, &v2->_notificationToken, v12, handler))
    {
      objc_destroyWeak(&v20);
      objc_destroyWeak(&location);
      v14 = 0;
LABEL_15:

      return v14;
    }
    v15 = v2->_connectionQueue;
    block[0] = v13;
    block[1] = 3221225472;
    block[2] = sub_19E24B210;
    block[3] = &unk_1E3FB4E60;
    objc_copyWeak(&v18, &location);
    dispatch_async(v15, block);
    objc_destroyWeak(&v18);
    objc_destroyWeak(&v20);
    objc_destroyWeak(&location);
    goto LABEL_13;
  }
  dlerror();
  result = (IMCommSafetySettingsManager *)abort_report_np();
  __break(1u);
  return result;
}

- (void)_updateSettings
{
  void *v3;
  int v4;
  NSObject *v5;
  void *v6;
  uint64_t v7;
  objc_class *v8;
  id v9;
  void *v10;
  id v11;
  void *v12;
  char v13;
  void *v14;
  NSObject *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  dispatch_time_t v20;
  NSObject *connectionQueue;
  _QWORD v22[5];
  _QWORD v23[5];
  id v24;
  char v25;
  id v26;
  uint64_t v27;
  uint64_t *v28;
  uint64_t v29;
  uint64_t v30;
  __int128 v31;
  Class (*v32)(uint64_t);
  void *v33;
  uint64_t *v34;
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  +[IMUnlockMonitor sharedInstance](IMUnlockMonitor, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isUnderFirstDataProtectionLock");

  if (v4)
  {
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
      {
        LOWORD(v31) = 0;
        _os_log_impl(&dword_19E239000, v5, OS_LOG_TYPE_INFO, "Not updating settings as we are under first unlock.", (uint8_t *)&v31, 2u);
      }

    }
  }
  else
  {
    dispatch_assert_queue_not_V2(MEMORY[0x1E0C80D38]);
    v27 = 0;
    v28 = &v27;
    v29 = 0x2050000000;
    v6 = (void *)qword_1ECFC7088;
    v30 = qword_1ECFC7088;
    v7 = MEMORY[0x1E0C809B0];
    if (!qword_1ECFC7088)
    {
      *(_QWORD *)&v31 = MEMORY[0x1E0C809B0];
      *((_QWORD *)&v31 + 1) = 3221225472;
      v32 = sub_19E247EB4;
      v33 = &unk_1E3FB4F80;
      v34 = &v27;
      sub_19E247EB4((uint64_t)&v31);
      v6 = (void *)v28[3];
    }
    v8 = objc_retainAutorelease(v6);
    _Block_object_dispose(&v27, 8);
    v9 = objc_alloc_init(v8);
    v26 = 0;
    objc_msgSend(v9, "currentConfigurationWithError:", &v26);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v26;
    v12 = v11;
    if (!v10 || v11)
    {
      if (IMOSLoggingEnabled())
      {
        OSLogHandleForIMFoundationCategory();
        v15 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
        {
          LODWORD(v31) = 138412290;
          *(_QWORD *)((char *)&v31 + 4) = v12;
          _os_log_impl(&dword_19E239000, v15, OS_LOG_TYPE_INFO, "IMCommSafetySettingsManager: Error fetching CommSafety configuration from ScreenTime: %@", (uint8_t *)&v31, 0xCu);
        }

      }
    }
    else
    {
      v13 = objc_msgSend(v10, "isCommunicationSafetyNotificationEnabled");
      v23[0] = v7;
      v23[1] = 3221225472;
      v23[2] = sub_19E24AA84;
      v23[3] = &unk_1E3FBA188;
      v23[4] = self;
      v24 = v10;
      v25 = v13;
      v14 = (void *)MEMORY[0x1E0C80D38];
      dispatch_async(MEMORY[0x1E0C80D38], v23);

    }
    +[IMDefaults sharedInstance](IMDefaults, "sharedInstance");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "getValueFromDomain:forKey:", CFSTR("com.apple.messages"), CFSTR("kCommSafetyRefreshInterval"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    v18 = objc_msgSend(v17, "longLongValue");
    v19 = 240;
    if (v18)
      v19 = v18;
    v20 = dispatch_time(0, (uint64_t)(float)((float)((float)v19 * 60.0) * 1000000000.0));
    connectionQueue = self->_connectionQueue;
    v22[0] = v7;
    v22[1] = 3221225472;
    v22[2] = sub_19E314548;
    v22[3] = &unk_1E3FB6B98;
    v22[4] = self;
    dispatch_after(v20, connectionQueue, v22);

  }
}

- (BOOL)_shouldUseScreenTimeAndFamilyCircle
{
  return 1;
}

- (int64_t)_fetchEnablementGroup
{
  int64_t v2;
  NSObject *v3;
  int v5;
  int64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  if ((objc_msgSend(MEMORY[0x1E0DC61A0], "isCommunicationSafetyEnabled") & 1) != 0)
  {
    v2 = 1;
  }
  else if (objc_msgSend(MEMORY[0x1E0DC61A0], "isNudityDetectionEnabled"))
  {
    v2 = 2;
  }
  else
  {
    v2 = 0;
  }
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      v5 = 134217984;
      v6 = v2;
      _os_log_impl(&dword_19E239000, v3, OS_LOG_TYPE_INFO, "Fetched CommSafety enablement group: %ld", (uint8_t *)&v5, 0xCu);
    }

  }
  return v2;
}

- (void)_connectToFamilyCircle:(id)a3
{
  id v4;
  void *v5;
  int v6;
  NSObject *v7;
  void *v8;
  uint64_t v9;
  objc_class *v10;
  id v11;
  _QWORD v12[5];
  id v13;
  uint8_t buf[8];
  uint64_t v15;
  Class (*v16)(uint64_t);
  void *v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t v22;

  v4 = a3;
  +[IMUnlockMonitor sharedInstance](IMUnlockMonitor, "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isUnderFirstDataProtectionLock");

  if (v6)
  {
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_19E239000, v7, OS_LOG_TYPE_INFO, "Not connecting to FamilyCircle as we are under first unlock.", buf, 2u);
      }

    }
  }
  else
  {
    v19 = 0;
    v20 = &v19;
    v21 = 0x2050000000;
    v8 = (void *)qword_1ECFC7080;
    v22 = qword_1ECFC7080;
    v9 = MEMORY[0x1E0C809B0];
    if (!qword_1ECFC7080)
    {
      *(_QWORD *)buf = MEMORY[0x1E0C809B0];
      v15 = 3221225472;
      v16 = sub_19E247F08;
      v17 = &unk_1E3FB4F80;
      v18 = &v19;
      sub_19E247F08((uint64_t)buf);
      v8 = (void *)v20[3];
    }
    v10 = objc_retainAutorelease(v8);
    _Block_object_dispose(&v19, 8);
    v11 = objc_alloc_init(v10);
    v12[0] = v9;
    v12[1] = 3221225472;
    v12[2] = sub_19E24A68C;
    v12[3] = &unk_1E3FBA1B0;
    v12[4] = self;
    v13 = v4;
    objc_msgSend(v11, "startRequestWithCompletionHandler:", v12);

  }
}

- (void)_configureUserSafetySettingsListener
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void (*v7)(uint64_t, int, int);
  void *v8;
  id v9;
  id location;

  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    location = 0;
    objc_initWeak(&location, self);
    v3 = (void *)MEMORY[0x1E0DC61A0];
    v5 = MEMORY[0x1E0C809B0];
    v6 = 3221225472;
    v7 = sub_19E314180;
    v8 = &unk_1E3FBA160;
    objc_copyWeak(&v9, &location);
    objc_msgSend(v3, "subscribeForAnalysisEnabledChanges:", &v5);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[IMCommSafetySettingsManager setEnablementSubscription:](self, "setEnablementSubscription:", v4, v5, v6, v7, v8);

    objc_destroyWeak(&v9);
    objc_destroyWeak(&location);
  }
}

+ (id)sharedManager
{
  if (qword_1ECFC7150 != -1)
    dispatch_once(&qword_1ECFC7150, &unk_1E3FB3DA8);
  return (id)qword_1ECFC7168;
}

- (void)dealloc
{
  int notificationToken;
  void *v4;
  char v5;
  void *v6;
  objc_super v7;

  notificationToken = self->_notificationToken;
  if (notificationToken != -1)
    notify_cancel(notificationToken);
  -[IMCommSafetySettingsManager enablementSubscription](self, "enablementSubscription");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_opt_respondsToSelector();

  if ((v5 & 1) != 0)
  {
    -[IMCommSafetySettingsManager enablementSubscription](self, "enablementSubscription");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "cancel");

  }
  v7.receiver = self;
  v7.super_class = (Class)IMCommSafetySettingsManager;
  -[IMCommSafetySettingsManager dealloc](&v7, sel_dealloc);
}

- (BOOL)checkSensitivePhotosAnalyticsEnabled
{
  NSObject *connectionQueue;
  char v4;
  void *v6;
  char v7;
  _QWORD v8[6];
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  char v12;

  if (-[IMCommSafetySettingsManager hasConnected](self, "hasConnected"))
  {
    v9 = 0;
    v10 = &v9;
    v11 = 0x2020000000;
    v12 = 0;
    connectionQueue = self->_connectionQueue;
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = sub_19E313D68;
    v8[3] = &unk_1E3FBA110;
    v8[4] = self;
    v8[5] = &v9;
    dispatch_sync(connectionQueue, v8);
    v4 = *((_BYTE *)v10 + 24);
    _Block_object_dispose(&v9, 8);
    return v4;
  }
  else
  {
    +[IMDefaults sharedInstance](IMDefaults, "sharedInstance");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "getBoolFromDomain:forKey:defaultValue:", CFSTR("com.apple.messages.commsafety"), CFSTR("CheckSensitivePhotosAnalytics"), 0);

    return v7;
  }
}

- (BOOL)childIsYoungAgeGroup
{
  int64_t protectedChildAge;
  void *v4;
  void *v5;
  int v6;
  NSObject *v7;
  void *v8;
  char v9;
  dispatch_semaphore_t v10;
  dispatch_time_t v11;
  NSObject *v12;
  NSObject *v13;
  uint8_t v15[16];
  _QWORD v16[4];
  NSObject *v17;
  uint8_t *v18;
  uint8_t buf[8];
  uint8_t *v20;
  uint64_t v21;
  char v22;

  if (-[IMCommSafetySettingsManager hasConnected](self, "hasConnected"))
  {
    protectedChildAge = self->_protectedChildAge;
    if (protectedChildAge < 0)
    {
      v10 = dispatch_semaphore_create(0);
      *(_QWORD *)buf = 0;
      v20 = buf;
      v21 = 0x2020000000;
      v22 = 0;
      v16[0] = MEMORY[0x1E0C809B0];
      v16[1] = 3221225472;
      v16[2] = sub_19E31416C;
      v16[3] = &unk_1E3FBA138;
      v18 = buf;
      v7 = v10;
      v17 = v7;
      -[IMCommSafetySettingsManager _connectToFamilyCircle:](self, "_connectToFamilyCircle:", v16);
      v11 = dispatch_time(0, 100000000);
      if (dispatch_semaphore_wait(v7, v11) || !v20[24])
      {
        if (IMOSLoggingEnabled())
        {
          OSLogHandleForIMFoundationCategory();
          v12 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
          {
            *(_WORD *)v15 = 0;
            _os_log_impl(&dword_19E239000, v12, OS_LOG_TYPE_INFO, "Failed to identify child's age, proceed with default value", v15, 2u);
          }

        }
        _Block_object_dispose(buf, 8);
        goto LABEL_14;
      }

      _Block_object_dispose(buf, 8);
      protectedChildAge = self->_protectedChildAge;
    }
    +[IMDefaults sharedInstance](IMDefaults, "sharedInstance");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", protectedChildAge < 13);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setValue:forDomain:forKey:", v5, CFSTR("com.apple.messages.commsafety"), CFSTR("IsYoungAgeGroup"));

    v6 = IMOSLoggingEnabled();
    if (protectedChildAge <= 12)
    {
      if (!v6)
      {
LABEL_15:
        LOBYTE(v6) = 1;
        return v6;
      }
      OSLogHandleForIMFoundationCategory();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_19E239000, v7, OS_LOG_TYPE_INFO, "Child identified as in young age group", buf, 2u);
      }
LABEL_14:

      goto LABEL_15;
    }
    if (v6)
    {
      OSLogHandleForIMFoundationCategory();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_19E239000, v13, OS_LOG_TYPE_INFO, "Child in older age group", buf, 2u);
      }

      LOBYTE(v6) = 0;
    }
  }
  else
  {
    +[IMDefaults sharedInstance](IMDefaults, "sharedInstance");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "getBoolFromDomain:forKey:defaultValue:", CFSTR("com.apple.messages.commsafety"), CFSTR("IsYoungAgeGroup"), 0);

    LOBYTE(v6) = v9;
  }
  return v6;
}

- (BOOL)checksForSensitivityOnNicknameReceive
{
  return (objc_msgSend(MEMORY[0x1E0DC61A0], "isNudityDetectionEnabledForService:", CFSTR("messages")) & 1) != 0
      || (objc_msgSend(MEMORY[0x1E0DC61A0], "isNudityDetectionEnabledForService:", CFSTR("contacts")) & 1) != 0
      || -[IMCommSafetySettingsManager enablementGroup](self, "enablementGroup") == 1;
}

- (int64_t)enablementGroup
{
  int64_t result;

  if (-[IMCommSafetySettingsManager _hasOverriddenEnablementGroup](self, "_hasOverriddenEnablementGroup"))
    return MEMORY[0x1E0DE7D20](self, sel__overriddenEnablementGroup);
  result = self->_enablementGroup;
  if (result == 3)
  {
    result = -[IMCommSafetySettingsManager _fetchEnablementGroup](self, "_fetchEnablementGroup");
    self->_enablementGroup = result;
  }
  return result;
}

- (BOOL)isFeatureEnabled
{
  int64_t v3;

  v3 = -[IMCommSafetySettingsManager enablementGroup](self, "enablementGroup");
  if (v3 != 1)
    LOBYTE(v3) = -[IMCommSafetySettingsManager enablementGroup](self, "enablementGroup") == 2;
  return v3;
}

- (BOOL)checksForSensitivityOnSend
{
  _BOOL4 v3;

  v3 = -[IMCommSafetySettingsManager isFeatureEnabled](self, "isFeatureEnabled");
  if (v3)
    LOBYTE(v3) = -[IMCommSafetySettingsManager enablementGroup](self, "enablementGroup") == 1;
  return v3;
}

- (BOOL)_hasOverriddenEnablementGroup
{
  if (qword_1EE503D10 != -1)
    dispatch_once(&qword_1EE503D10, &unk_1E3FB2818);
  return byte_1EE5045E0;
}

- (int64_t)_overriddenEnablementGroup
{
  if (qword_1EE5045F0 != -1)
    dispatch_once(&qword_1EE5045F0, &unk_1E3FB43A8);
  return qword_1EE5045E8;
}

- (void)systemDidLeaveFirstDataProtectionLock
{
  NSObject *v3;
  NSObject *connectionQueue;
  _QWORD block[4];
  id v6;
  uint8_t buf[8];

  if (-[IMCommSafetySettingsManager _shouldUseScreenTimeAndFamilyCircle](self, "_shouldUseScreenTimeAndFamilyCircle"))
  {
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v3 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_19E239000, v3, OS_LOG_TYPE_INFO, "System did leave first unlock, updating ST settings", buf, 2u);
      }

    }
    *(_QWORD *)buf = 0;
    objc_initWeak((id *)buf, self);
    connectionQueue = self->_connectionQueue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = sub_19E31467C;
    block[3] = &unk_1E3FB4E60;
    objc_copyWeak(&v6, (id *)buf);
    dispatch_async(connectionQueue, block);
    objc_destroyWeak(&v6);
    objc_destroyWeak((id *)buf);
  }
}

- (void)setEnablementGroup:(int64_t)a3
{
  self->_enablementGroup = a3;
}

- (void)setCheckSensitivePhotosAnalyticsEnabled:(BOOL)a3
{
  self->_checkSensitivePhotosAnalyticsEnabled = a3;
}

- (BOOL)shouldNotifyParentAboutSensitivePhotos
{
  return self->_shouldNotifyParentAboutSensitivePhotos;
}

- (void)setShouldNotifyParentAboutSensitivePhotos:(BOOL)a3
{
  self->_shouldNotifyParentAboutSensitivePhotos = a3;
}

- (void)setChildIsYoungAgeGroup:(BOOL)a3
{
  self->_childIsYoungAgeGroup = a3;
}

- (NSMutableArray)parents
{
  return self->_parents;
}

- (void)setParents:(id)a3
{
  objc_storeStrong((id *)&self->_parents, a3);
}

- (id)enablementSubscription
{
  return self->_enablementSubscription;
}

- (int64_t)protectedChildAge
{
  return self->_protectedChildAge;
}

- (void)setProtectedChildAge:(int64_t)a3
{
  self->_protectedChildAge = a3;
}

- (BOOL)hasConnected
{
  return self->_hasConnected;
}

- (void)setHasConnected:(BOOL)a3
{
  self->_hasConnected = a3;
}

- (OS_dispatch_queue)connectionQueue
{
  return self->_connectionQueue;
}

- (void)setConnectionQueue:(id)a3
{
  objc_storeStrong((id *)&self->_connectionQueue, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_connectionQueue, 0);
  objc_storeStrong(&self->_enablementSubscription, 0);
  objc_storeStrong((id *)&self->_parents, 0);
}

@end
