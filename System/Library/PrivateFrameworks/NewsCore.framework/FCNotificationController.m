@implementation FCNotificationController

- (void)registerDeviceToken:(id)a3 deviceDigestMode:(int)a4
{
  uint64_t v4;
  void *v6;
  char v7;
  id v8;

  v4 = *(_QWORD *)&a4;
  v8 = a3;
  -[FCNotificationController deviceToken](self, "deviceToken");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "isEqualToString:", v8);

  if ((v7 & 1) == 0)
  {
    -[FCNotificationController setDeviceToken:](self, "setDeviceToken:", v8);
    -[FCNotificationController setDeviceDigestMode:](self, "setDeviceDigestMode:", v4);
    if (v8)
      -[FCNotificationController _registerDeviceToken:deviceDigestMode:](self, "_registerDeviceToken:deviceDigestMode:", v8, v4);
  }

}

- (void)setDeviceToken:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (void)setDeviceDigestMode:(int)a3
{
  self->_deviceDigestMode = a3;
}

- (NSString)deviceToken
{
  return self->_deviceToken;
}

- (FCNotificationController)initWithUserInfo:(id)a3 commandQueue:(id)a4 configurationManager:(id)a5 publisherNotificationsAllowed:(BOOL)a6 appleNewsNotificationsAllowed:(BOOL)a7
{
  id v13;
  id v14;
  id v15;
  FCNotificationController *v16;
  FCNotificationController *v17;
  uint64_t v18;
  NSString *notificationsUserID;
  void *v21;
  objc_super v22;
  uint8_t buf[4];
  const char *v24;
  __int16 v25;
  char *v26;
  __int16 v27;
  int v28;
  __int16 v29;
  void *v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v13 = a3;
  v14 = a4;
  v15 = a5;
  if (!v14 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v21 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Invalid parameter not satisfying %s"), "commandQueue");
    *(_DWORD *)buf = 136315906;
    v24 = "-[FCNotificationController initWithUserInfo:commandQueue:configurationManager:publisherNotificationsAllowed:ap"
          "pleNewsNotificationsAllowed:]";
    v25 = 2080;
    v26 = "FCNotificationController.m";
    v27 = 1024;
    v28 = 58;
    v29 = 2114;
    v30 = v21;
    _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

  }
  v22.receiver = self;
  v22.super_class = (Class)FCNotificationController;
  v16 = -[FCNotificationController init](&v22, sel_init);
  v17 = v16;
  if (v16)
  {
    objc_storeStrong((id *)&v16->_userInfo, a3);
    objc_msgSend(v13, "notificationsUserID");
    v18 = objc_claimAutoreleasedReturnValue();
    notificationsUserID = v17->_notificationsUserID;
    v17->_notificationsUserID = (NSString *)v18;

    objc_storeStrong((id *)&v17->_commandQueue, a4);
    objc_storeStrong((id *)&v17->_configurationManager, a5);
    v17->_publisherNotificationsAllowed = a6;
    v17->_appleNewsNotificationsAllowed = a7;
    v17->_shouldUseNewsUINotificationHandling = -[FCNotificationController shouldUseNewsUINotificationHandling](v17, "shouldUseNewsUINotificationHandling");
    objc_msgSend(v13, "addObserver:", v17);
  }

  return v17;
}

- (BOOL)shouldUseNewsUINotificationHandling
{
  void *v3;
  char v4;
  void *v5;
  void *v6;
  NSObject *v7;
  BOOL v8;
  NSObject *v9;
  NSObject *v10;
  int v11;
  NSObject *v12;
  _BOOL4 v13;
  const char *v14;
  uint8_t *v15;
  void *v16;
  void *v17;
  NSObject *v18;
  NSObject *v19;
  uint8_t v21[16];
  uint8_t v22[2];
  __int16 v23;
  uint8_t v24[16];
  uint8_t buf[16];
  uint8_t v26[16];
  uint8_t v27[16];

  NFGeneralDeviceString();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqualToString:", CFSTR("iPhone"));

  if ((v4 & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "stringForKey:", CFSTR("news.features.feed30"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v6, "isEqualToString:", CFSTR("enabled")))
    {
      v7 = FCPushNotificationsLog;
      if (os_log_type_enabled((os_log_t)FCPushNotificationsLog, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1A1B90000, v7, OS_LOG_TYPE_DEFAULT, "Internal settings switch for Feed 3.0 set to Enabled", buf, 2u);
      }
      v8 = 1;
LABEL_26:

      return v8;
    }
    if (objc_msgSend(v6, "isEqualToString:", CFSTR("disabled")))
    {
      v10 = FCPushNotificationsLog;
      v8 = 0;
      if (os_log_type_enabled((os_log_t)FCPushNotificationsLog, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v24 = 0;
        _os_log_impl(&dword_1A1B90000, v10, OS_LOG_TYPE_DEFAULT, "Internal settings switch for Feed 3.0 set to Disabled", v24, 2u);
        v8 = 0;
      }
      goto LABEL_26;
    }
    v11 = objc_msgSend(v6, "isEqualToString:", CFSTR("default"));
    v12 = FCPushNotificationsLog;
    v13 = os_log_type_enabled((os_log_t)FCPushNotificationsLog, OS_LOG_TYPE_DEFAULT);
    if (v11)
    {
      if (!v13)
        goto LABEL_18;
      v23 = 0;
      v14 = "Internal settings switch for Feed 3.0 set to default, using config";
      v15 = (uint8_t *)&v23;
    }
    else
    {
      if (!v13)
        goto LABEL_18;
      *(_WORD *)v22 = 0;
      v14 = "Internal settings switch for Feed 3.0 has no value, using config";
      v15 = v22;
    }
    _os_log_impl(&dword_1A1B90000, v12, OS_LOG_TYPE_DEFAULT, v14, v15, 2u);
LABEL_18:
    -[FCNotificationController configurationManager](self, "configurationManager");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "configuration");
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    if ((objc_opt_respondsToSelector() & 1) != 0 && (objc_msgSend(v17, "todayFeedEnabled") & 1) != 0)
    {
      v18 = FCPushNotificationsLog;
      if (os_log_type_enabled((os_log_t)FCPushNotificationsLog, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v21 = 0;
        _os_log_impl(&dword_1A1B90000, v18, OS_LOG_TYPE_DEFAULT, "app config has NewsUI notification handling enabled", v21, 2u);
      }
      v8 = 1;
    }
    else
    {
      v19 = FCPushNotificationsLog;
      v8 = 0;
      if (os_log_type_enabled((os_log_t)FCPushNotificationsLog, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v27 = 0;
        _os_log_impl(&dword_1A1B90000, v19, OS_LOG_TYPE_DEFAULT, "app config does not have NewsUI notification handling enabled", v27, 2u);
        v8 = 0;
      }
    }

    goto LABEL_26;
  }
  v9 = FCPushNotificationsLog;
  if (os_log_type_enabled((os_log_t)FCPushNotificationsLog, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v26 = 0;
    _os_log_impl(&dword_1A1B90000, v9, OS_LOG_TYPE_DEFAULT, "Using Feed 3.0 for notifications since this device is not a phone.", v26, 2u);
  }
  return 1;
}

- (FCCoreConfigurationManager)configurationManager
{
  return self->_configurationManager;
}

- (void)_registerDeviceToken:(id)a3 deviceDigestMode:(int)a4
{
  uint64_t v4;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  FCRegisterDeviceTokenCommand *v11;
  void *v12;
  FCRegisterDeviceTokenCommand *v13;
  void *v14;
  NSObject *v15;
  const char *v16;
  void *v17;
  _QWORD v18[6];
  uint8_t buf[4];
  const char *v20;
  __int16 v21;
  char *v22;
  __int16 v23;
  int v24;
  __int16 v25;
  void *v26;
  uint64_t v27;

  v4 = *(_QWORD *)&a4;
  v27 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  if (-[FCNotificationController publisherNotificationsAllowed](self, "publisherNotificationsAllowed")
    || -[FCNotificationController appleNewsNotificationsAllowed](self, "appleNewsNotificationsAllowed"))
  {
    if (!v6 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Invalid parameter not satisfying %s"), "deviceToken");
      *(_DWORD *)buf = 136315906;
      v20 = "-[FCNotificationController _registerDeviceToken:deviceDigestMode:]";
      v21 = 2080;
      v22 = "FCNotificationController.m";
      v23 = 1024;
      v24 = 117;
      v25 = 2114;
      v26 = v17;
      _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

    }
    +[FCAppleAccount sharedAccount](FCAppleAccount, "sharedAccount");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "contentStoreFrontID");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      -[FCNotificationController notificationsUserID](self, "notificationsUserID");
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      if (v9)
      {
        +[FCNetworkReachability sharedNetworkReachability](FCNetworkReachability, "sharedNetworkReachability");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        if ((objc_msgSend(v10, "isCloudKitReachable") & 1) != 0)
        {
          v11 = [FCRegisterDeviceTokenCommand alloc];
          -[FCNotificationController notificationsUserID](self, "notificationsUserID");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          v13 = -[FCRegisterDeviceTokenCommand initWithUserID:deviceToken:storefrontID:deviceDigestMode:](v11, "initWithUserID:deviceToken:storefrontID:deviceDigestMode:", v12, v6, v8, v4);

          -[FCNotificationController commandQueue](self, "commandQueue");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "addCommand:", v13);

        }
        else
        {
          v18[0] = MEMORY[0x1E0C809B0];
          v18[1] = 3221225472;
          v18[2] = __66__FCNotificationController__registerDeviceToken_deviceDigestMode___block_invoke_18;
          v18[3] = &unk_1E463AD10;
          v18[4] = self;
          v18[5] = v8;
          __66__FCNotificationController__registerDeviceToken_deviceDigestMode___block_invoke_18((uint64_t)v18);
        }

        goto LABEL_17;
      }
      v15 = FCPushNotificationsLog;
      if (os_log_type_enabled((os_log_t)FCPushNotificationsLog, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        v16 = "failed to create command to register device token: invalid notificationsUserID";
        goto LABEL_14;
      }
    }
    else
    {
      v15 = FCPushNotificationsLog;
      if (os_log_type_enabled((os_log_t)FCPushNotificationsLog, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        v16 = "failed to create command to register device token: invalid deviceToken";
LABEL_14:
        _os_log_error_impl(&dword_1A1B90000, v15, OS_LOG_TYPE_ERROR, v16, buf, 2u);
      }
    }
LABEL_17:

  }
}

- (NSString)notificationsUserID
{
  return self->_notificationsUserID;
}

- (BOOL)publisherNotificationsAllowed
{
  return self->_publisherNotificationsAllowed;
}

- (FCCommandQueue)commandQueue
{
  return self->_commandQueue;
}

- (FCNotificationController)init
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  id v6;
  uint8_t buf[4];
  const char *v8;
  __int16 v9;
  char *v10;
  __int16 v11;
  int v12;
  __int16 v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Do not call method"));
    *(_DWORD *)buf = 136315906;
    v8 = "-[FCNotificationController init]";
    v9 = 2080;
    v10 = "FCNotificationController.m";
    v11 = 1024;
    v12 = 49;
    v13 = 2114;
    v14 = v2;
    _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

  }
  v3 = (void *)MEMORY[0x1E0C99DA0];
  v4 = *MEMORY[0x1E0C99768];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@: %s"), CFSTR("Do not call method"), "-[FCNotificationController init]");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "exceptionWithName:reason:userInfo:", v4, v5, 0);
  v6 = (id)objc_claimAutoreleasedReturnValue();

  objc_exception_throw(v6);
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  -[FCNotificationController userInfo](self, "userInfo");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

  v4.receiver = self;
  v4.super_class = (Class)FCNotificationController;
  -[FCNotificationController dealloc](&v4, sel_dealloc);
}

- (void)deviceDigestModeDidUpdateToDigestMode:(int)a3
{
  uint64_t v3;
  void *v5;
  NSObject *v6;
  id v7;
  uint8_t buf[16];

  v3 = *(_QWORD *)&a3;
  -[FCNotificationController setDeviceDigestMode:](self, "setDeviceDigestMode:");
  -[FCNotificationController deviceToken](self, "deviceToken");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[FCNotificationController deviceToken](self, "deviceToken");
    v7 = (id)objc_claimAutoreleasedReturnValue();
    -[FCNotificationController _registerDeviceToken:deviceDigestMode:](self, "_registerDeviceToken:deviceDigestMode:", v7, v3);

  }
  else
  {
    v6 = FCPushNotificationsLog;
    if (os_log_type_enabled((os_log_t)FCPushNotificationsLog, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1A1B90000, v6, OS_LOG_TYPE_ERROR, "failed to update digest mode; cannot call CAPI endpoint without device token",
        buf,
        2u);
    }
  }
}

void __66__FCNotificationController__registerDeviceToken_deviceDigestMode___block_invoke_18(uint64_t a1)
{
  void *v2;
  void *v3;
  NSObject *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  int v8;
  void *v9;
  __int16 v10;
  void *v11;
  __int16 v12;
  uint64_t v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v2 = (void *)FCPushNotificationsLog;
  if (os_log_type_enabled((os_log_t)FCPushNotificationsLog, OS_LOG_TYPE_ERROR))
  {
    v3 = *(void **)(a1 + 32);
    v4 = v2;
    objc_msgSend(v3, "deviceToken");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "notificationsUserID");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = *(_QWORD *)(a1 + 40);
    v8 = 138543874;
    v9 = v5;
    v10 = 2114;
    v11 = v6;
    v12 = 2114;
    v13 = v7;
    _os_log_error_impl(&dword_1A1B90000, v4, OS_LOG_TYPE_ERROR, "failed to create command to register device token: CloudKit unreachable, deviceToken: %{public}@ notificationsUserID: %{public}@ storefrontID: %{public}@", (uint8_t *)&v8, 0x20u);

  }
}

- (BOOL)registerNotificationsForChannelID:(id)a3 isPaid:(BOOL)a4
{
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  id v12;
  char v13;
  void *v14;
  void *v15;
  id v16;
  FCModifyNotificationsForChannelsCommand *v17;
  void *v18;
  void *v19;
  FCModifyNotificationsForChannelsCommand *v20;
  void *v21;
  void *v23;
  uint64_t v24;
  _QWORD v25[7];
  _QWORD v26[7];
  id v27;
  id v28;
  uint8_t buf[4];
  const char *v30;
  __int16 v31;
  char *v32;
  __int16 v33;
  int v34;
  __int16 v35;
  void *v36;
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  if (-[FCNotificationController publisherNotificationsAllowed](self, "publisherNotificationsAllowed"))
  {
    if (!v6 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      v23 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Invalid parameter not satisfying %s"), "channelID");
      *(_DWORD *)buf = 136315906;
      v30 = "-[FCNotificationController registerNotificationsForChannelID:isPaid:]";
      v31 = 2080;
      v32 = "FCNotificationController.m";
      v33 = 1024;
      v34 = 149;
      v35 = 2114;
      v36 = v23;
      _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

    }
    +[FCAppleAccount sharedAccount](FCAppleAccount, "sharedAccount");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "contentStoreFrontID");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6
      && (-[FCNotificationController deviceToken](self, "deviceToken"), (v9 = objc_claimAutoreleasedReturnValue()) != 0)
      && (v10 = (void *)v9,
          -[FCNotificationController notificationsUserID](self, "notificationsUserID"),
          v11 = (void *)objc_claimAutoreleasedReturnValue(),
          v11,
          v10,
          v11))
    {
      +[FCNetworkReachability sharedNetworkReachability](FCNetworkReachability, "sharedNetworkReachability");
      v12 = (id)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v12, "isCloudKitReachable");
      if ((v13 & 1) != 0)
      {
        if (a4)
        {
          v27 = v6;
          objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v27, 1);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          v15 = 0;
        }
        else
        {
          v28 = v6;
          objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v28, 1);
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          v14 = 0;
        }
        -[FCNotificationController appendBreakingNewsIfNeededToChannelIDs:](self, "appendBreakingNewsIfNeededToChannelIDs:", v15);
        v16 = (id)objc_claimAutoreleasedReturnValue();

        v17 = [FCModifyNotificationsForChannelsCommand alloc];
        -[FCNotificationController notificationsUserID](self, "notificationsUserID");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        -[FCNotificationController deviceToken](self, "deviceToken");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        LODWORD(v24) = -[FCNotificationController deviceDigestMode](self, "deviceDigestMode");
        v20 = -[FCModifyNotificationsForChannelsCommand initWithChannelIDsToAdd:paidChannelIDsToAdd:channelIDsToRemove:userID:deviceToken:storefrontID:deviceDigestMode:](v17, "initWithChannelIDsToAdd:paidChannelIDsToAdd:channelIDsToRemove:userID:deviceToken:storefrontID:deviceDigestMode:", v16, v14, 0, v18, v19, v8, v24);

        -[FCNotificationController commandQueue](self, "commandQueue");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "addCommand:", v20);

      }
      else
      {
        v25[0] = MEMORY[0x1E0C809B0];
        v25[1] = 3221225472;
        v25[2] = __69__FCNotificationController_registerNotificationsForChannelID_isPaid___block_invoke_24;
        v25[3] = &unk_1E463BF40;
        v16 = v6;
        v25[4] = v16;
        v25[5] = self;
        v25[6] = v8;
        __69__FCNotificationController_registerNotificationsForChannelID_isPaid___block_invoke_24((uint64_t)v25);
      }

    }
    else
    {
      v26[0] = MEMORY[0x1E0C809B0];
      v26[1] = 3221225472;
      v26[2] = __69__FCNotificationController_registerNotificationsForChannelID_isPaid___block_invoke_23;
      v26[3] = &unk_1E463BF40;
      v12 = v6;
      v26[4] = v12;
      v26[5] = self;
      v26[6] = v8;
      __69__FCNotificationController_registerNotificationsForChannelID_isPaid___block_invoke_23((uint64_t)v26);
      v13 = 0;
    }

  }
  else
  {
    v13 = 0;
  }

  return v13;
}

uint64_t __69__FCNotificationController_registerNotificationsForChannelID_isPaid___block_invoke_23(uint64_t a1)
{
  void *v2;
  void *v4;
  uint64_t v5;
  NSObject *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  int v10;
  uint64_t v11;
  __int16 v12;
  void *v13;
  __int16 v14;
  void *v15;
  __int16 v16;
  uint64_t v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v2 = (void *)FCPushNotificationsLog;
  if (os_log_type_enabled((os_log_t)FCPushNotificationsLog, OS_LOG_TYPE_ERROR))
  {
    v5 = *(_QWORD *)(a1 + 32);
    v4 = *(void **)(a1 + 40);
    v6 = v2;
    objc_msgSend(v4, "deviceToken");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "notificationsUserID");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = *(_QWORD *)(a1 + 48);
    v10 = 138544130;
    v11 = v5;
    v12 = 2114;
    v13 = v7;
    v14 = 2114;
    v15 = v8;
    v16 = 2114;
    v17 = v9;
    _os_log_error_impl(&dword_1A1B90000, v6, OS_LOG_TYPE_ERROR, "failed to create command to register notifications for channelID: %{public}@ deviceToken: %{public}@ notificationsUserID: %{public}@ storefrontID: %{public}@", (uint8_t *)&v10, 0x2Au);

  }
  return 0;
}

uint64_t __69__FCNotificationController_registerNotificationsForChannelID_isPaid___block_invoke_24(uint64_t a1)
{
  void *v2;
  void *v4;
  uint64_t v5;
  NSObject *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  int v10;
  uint64_t v11;
  __int16 v12;
  void *v13;
  __int16 v14;
  void *v15;
  __int16 v16;
  uint64_t v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v2 = (void *)FCPushNotificationsLog;
  if (os_log_type_enabled((os_log_t)FCPushNotificationsLog, OS_LOG_TYPE_ERROR))
  {
    v5 = *(_QWORD *)(a1 + 32);
    v4 = *(void **)(a1 + 40);
    v6 = v2;
    objc_msgSend(v4, "deviceToken");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "notificationsUserID");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = *(_QWORD *)(a1 + 48);
    v10 = 138544130;
    v11 = v5;
    v12 = 2114;
    v13 = v7;
    v14 = 2114;
    v15 = v8;
    v16 = 2114;
    v17 = v9;
    _os_log_error_impl(&dword_1A1B90000, v6, OS_LOG_TYPE_ERROR, "failed to create command to register notifications: CloudKit unreachable, channelID: %{public}@ deviceToken: %{public}@ notificationsUserID: %{public}@ storefrontID: %{public}@", (uint8_t *)&v10, 0x2Au);

  }
  return 0;
}

- (BOOL)unregisterNotificationsForChannelID:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  id v10;
  char v11;
  void *v12;
  id v13;
  FCModifyNotificationsForChannelsCommand *v14;
  void *v15;
  void *v16;
  FCModifyNotificationsForChannelsCommand *v17;
  void *v18;
  void *v20;
  uint64_t v21;
  _QWORD v22[7];
  _QWORD v23[7];
  id v24;
  uint8_t buf[4];
  const char *v26;
  __int16 v27;
  char *v28;
  __int16 v29;
  int v30;
  __int16 v31;
  void *v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (-[FCNotificationController publisherNotificationsAllowed](self, "publisherNotificationsAllowed"))
  {
    if (!v4 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      v20 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Invalid parameter not satisfying %s"), "channelID");
      *(_DWORD *)buf = 136315906;
      v26 = "-[FCNotificationController unregisterNotificationsForChannelID:]";
      v27 = 2080;
      v28 = "FCNotificationController.m";
      v29 = 1024;
      v30 = 186;
      v31 = 2114;
      v32 = v20;
      _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

    }
    +[FCAppleAccount sharedAccount](FCAppleAccount, "sharedAccount");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "contentStoreFrontID");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v4
      && (-[FCNotificationController deviceToken](self, "deviceToken"), (v7 = objc_claimAutoreleasedReturnValue()) != 0)
      && (v8 = (void *)v7,
          -[FCNotificationController notificationsUserID](self, "notificationsUserID"),
          v9 = (void *)objc_claimAutoreleasedReturnValue(),
          v9,
          v8,
          v9))
    {
      +[FCNetworkReachability sharedNetworkReachability](FCNetworkReachability, "sharedNetworkReachability");
      v10 = (id)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v10, "isCloudKitReachable");
      if ((v11 & 1) != 0)
      {
        v24 = v4;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v24, 1);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        -[FCNotificationController appendBreakingNewsIfNeededToChannelIDs:](self, "appendBreakingNewsIfNeededToChannelIDs:", v12);
        v13 = (id)objc_claimAutoreleasedReturnValue();

        v14 = [FCModifyNotificationsForChannelsCommand alloc];
        -[FCNotificationController notificationsUserID](self, "notificationsUserID");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        -[FCNotificationController deviceToken](self, "deviceToken");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        LODWORD(v21) = -[FCNotificationController deviceDigestMode](self, "deviceDigestMode");
        v17 = -[FCModifyNotificationsForChannelsCommand initWithChannelIDsToAdd:paidChannelIDsToAdd:channelIDsToRemove:userID:deviceToken:storefrontID:deviceDigestMode:](v14, "initWithChannelIDsToAdd:paidChannelIDsToAdd:channelIDsToRemove:userID:deviceToken:storefrontID:deviceDigestMode:", 0, 0, v13, v15, v16, v6, v21);

        -[FCNotificationController commandQueue](self, "commandQueue");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "addCommand:", v17);

      }
      else
      {
        v22[0] = MEMORY[0x1E0C809B0];
        v22[1] = 3221225472;
        v22[2] = __64__FCNotificationController_unregisterNotificationsForChannelID___block_invoke_29;
        v22[3] = &unk_1E463BF40;
        v13 = v4;
        v22[4] = v13;
        v22[5] = self;
        v22[6] = v6;
        __64__FCNotificationController_unregisterNotificationsForChannelID___block_invoke_29((uint64_t)v22);
      }

    }
    else
    {
      v23[0] = MEMORY[0x1E0C809B0];
      v23[1] = 3221225472;
      v23[2] = __64__FCNotificationController_unregisterNotificationsForChannelID___block_invoke_28;
      v23[3] = &unk_1E463BF40;
      v10 = v4;
      v23[4] = v10;
      v23[5] = self;
      v23[6] = v6;
      __64__FCNotificationController_unregisterNotificationsForChannelID___block_invoke_28((uint64_t)v23);
      v11 = 0;
    }

  }
  else
  {
    v11 = 0;
  }

  return v11;
}

uint64_t __64__FCNotificationController_unregisterNotificationsForChannelID___block_invoke_28(uint64_t a1)
{
  void *v2;
  void *v4;
  uint64_t v5;
  NSObject *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  int v10;
  uint64_t v11;
  __int16 v12;
  void *v13;
  __int16 v14;
  void *v15;
  __int16 v16;
  uint64_t v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v2 = (void *)FCPushNotificationsLog;
  if (os_log_type_enabled((os_log_t)FCPushNotificationsLog, OS_LOG_TYPE_ERROR))
  {
    v5 = *(_QWORD *)(a1 + 32);
    v4 = *(void **)(a1 + 40);
    v6 = v2;
    objc_msgSend(v4, "deviceToken");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "notificationsUserID");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = *(_QWORD *)(a1 + 48);
    v10 = 138544130;
    v11 = v5;
    v12 = 2114;
    v13 = v7;
    v14 = 2114;
    v15 = v8;
    v16 = 2114;
    v17 = v9;
    _os_log_error_impl(&dword_1A1B90000, v6, OS_LOG_TYPE_ERROR, "failed to create command to unregister notifications for channelID: %{public}@ deviceToken: %{public}@ notificationsUserID: %{public}@ storefrontID: %{public}@", (uint8_t *)&v10, 0x2Au);

  }
  return 0;
}

uint64_t __64__FCNotificationController_unregisterNotificationsForChannelID___block_invoke_29(uint64_t a1)
{
  void *v2;
  void *v4;
  uint64_t v5;
  NSObject *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  int v10;
  uint64_t v11;
  __int16 v12;
  void *v13;
  __int16 v14;
  void *v15;
  __int16 v16;
  uint64_t v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v2 = (void *)FCPushNotificationsLog;
  if (os_log_type_enabled((os_log_t)FCPushNotificationsLog, OS_LOG_TYPE_ERROR))
  {
    v5 = *(_QWORD *)(a1 + 32);
    v4 = *(void **)(a1 + 40);
    v6 = v2;
    objc_msgSend(v4, "deviceToken");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "notificationsUserID");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = *(_QWORD *)(a1 + 48);
    v10 = 138544130;
    v11 = v5;
    v12 = 2114;
    v13 = v7;
    v14 = 2114;
    v15 = v8;
    v16 = 2114;
    v17 = v9;
    _os_log_error_impl(&dword_1A1B90000, v6, OS_LOG_TYPE_ERROR, "failed to create command to unregister notifications: CloudKit unreachable, channelID: %{public}@ deviceToken: %{public}@ notificationsUserID: %{public}@ storefrontID: %{public}@", (uint8_t *)&v10, 0x2Au);

  }
  return 0;
}

- (BOOL)refreshNotificationsForChannelIDs:(id)a3 paidChannelIDs:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  char v14;
  void *v15;
  FCRefreshNotificationsForChannelsCommand *v16;
  void *v17;
  void *v18;
  FCRefreshNotificationsForChannelsCommand *v19;
  void *v20;
  _QWORD v22[8];
  _QWORD v23[8];

  v6 = a3;
  v7 = a4;
  if (-[FCNotificationController publisherNotificationsAllowed](self, "publisherNotificationsAllowed"))
  {
    +[FCAppleAccount sharedAccount](FCAppleAccount, "sharedAccount");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "contentStoreFrontID");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    -[FCNotificationController deviceToken](self, "deviceToken");
    v10 = objc_claimAutoreleasedReturnValue();
    if (v10
      && (v11 = (void *)v10,
          -[FCNotificationController notificationsUserID](self, "notificationsUserID"),
          v12 = (void *)objc_claimAutoreleasedReturnValue(),
          v12,
          v11,
          v12))
    {
      +[FCNetworkReachability sharedNetworkReachability](FCNetworkReachability, "sharedNetworkReachability");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = objc_msgSend(v13, "isCloudKitReachable");
      if ((v14 & 1) != 0)
      {
        -[FCNotificationController appendBreakingNewsIfNeededToChannelIDs:](self, "appendBreakingNewsIfNeededToChannelIDs:", v6);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = [FCRefreshNotificationsForChannelsCommand alloc];
        -[FCNotificationController notificationsUserID](self, "notificationsUserID");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        -[FCNotificationController deviceToken](self, "deviceToken");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = -[FCRefreshNotificationsForChannelsCommand initWithChannelIDs:paidChannelIDs:userID:deviceToken:storefrontID:deviceDigestMode:](v16, "initWithChannelIDs:paidChannelIDs:userID:deviceToken:storefrontID:deviceDigestMode:", v15, v7, v17, v18, v9, -[FCNotificationController deviceDigestMode](self, "deviceDigestMode"));

        -[FCNotificationController commandQueue](self, "commandQueue");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "addCommand:", v19);

      }
      else
      {
        v22[0] = MEMORY[0x1E0C809B0];
        v22[1] = 3221225472;
        v22[2] = __77__FCNotificationController_refreshNotificationsForChannelIDs_paidChannelIDs___block_invoke_31;
        v22[3] = &unk_1E464B668;
        v22[4] = v6;
        v22[5] = v7;
        v22[6] = self;
        v22[7] = v9;
        __77__FCNotificationController_refreshNotificationsForChannelIDs_paidChannelIDs___block_invoke_31((uint64_t)v22);
      }

    }
    else
    {
      v23[0] = MEMORY[0x1E0C809B0];
      v23[1] = 3221225472;
      v23[2] = __77__FCNotificationController_refreshNotificationsForChannelIDs_paidChannelIDs___block_invoke_2;
      v23[3] = &unk_1E464B668;
      v23[4] = v6;
      v23[5] = v7;
      v23[6] = self;
      v23[7] = v9;
      __77__FCNotificationController_refreshNotificationsForChannelIDs_paidChannelIDs___block_invoke_2((uint64_t)v23);
      v14 = 0;
    }

  }
  else
  {
    v14 = 0;
  }

  return v14;
}

uint64_t __77__FCNotificationController_refreshNotificationsForChannelIDs_paidChannelIDs___block_invoke_2(uint64_t a1)
{
  void *v2;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  int v11;
  uint64_t v12;
  __int16 v13;
  uint64_t v14;
  __int16 v15;
  void *v16;
  __int16 v17;
  void *v18;
  __int16 v19;
  uint64_t v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v2 = (void *)FCPushNotificationsLog;
  if (os_log_type_enabled((os_log_t)FCPushNotificationsLog, OS_LOG_TYPE_ERROR))
  {
    v4 = *(_QWORD *)(a1 + 32);
    v5 = *(_QWORD *)(a1 + 40);
    v6 = *(void **)(a1 + 48);
    v7 = v2;
    objc_msgSend(v6, "deviceToken");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 48), "notificationsUserID");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = *(_QWORD *)(a1 + 56);
    v11 = 138544386;
    v12 = v4;
    v13 = 2114;
    v14 = v5;
    v15 = 2114;
    v16 = v8;
    v17 = 2114;
    v18 = v9;
    v19 = 2114;
    v20 = v10;
    _os_log_error_impl(&dword_1A1B90000, v7, OS_LOG_TYPE_ERROR, "failed to create command to refresh notifications for channelIDs: %{public}@ paidChannelIDs: %{public}@ deviceToken: %{public}@ notificationsUserID: %{public}@ storefrontID: %{public}@", (uint8_t *)&v11, 0x34u);

  }
  return 0;
}

uint64_t __77__FCNotificationController_refreshNotificationsForChannelIDs_paidChannelIDs___block_invoke_31(uint64_t a1)
{
  void *v2;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  int v11;
  uint64_t v12;
  __int16 v13;
  uint64_t v14;
  __int16 v15;
  void *v16;
  __int16 v17;
  void *v18;
  __int16 v19;
  uint64_t v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v2 = (void *)FCPushNotificationsLog;
  if (os_log_type_enabled((os_log_t)FCPushNotificationsLog, OS_LOG_TYPE_ERROR))
  {
    v4 = *(_QWORD *)(a1 + 32);
    v5 = *(_QWORD *)(a1 + 40);
    v6 = *(void **)(a1 + 48);
    v7 = v2;
    objc_msgSend(v6, "deviceToken");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 48), "notificationsUserID");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = *(_QWORD *)(a1 + 56);
    v11 = 138544386;
    v12 = v4;
    v13 = 2114;
    v14 = v5;
    v15 = 2114;
    v16 = v8;
    v17 = 2114;
    v18 = v9;
    v19 = 2114;
    v20 = v10;
    _os_log_error_impl(&dword_1A1B90000, v7, OS_LOG_TYPE_ERROR, "failed to create command to refresh notifications: CloudKit unreachable, channelIDs: %{public}@ paidChannelIDs: %{public}@ deviceToken: %{public}@ notificationsUserID: %{public}@ storefrontID: %{public}@", (uint8_t *)&v11, 0x34u);

  }
  return 0;
}

- (BOOL)registerNotificationsForTopicIDs:(id)a3 withTopicGroupingID:(id)a4 fromChannelID:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  id v16;
  char v17;
  FCModifyNotificationsForTopicsCommand *v18;
  void *v19;
  void *v20;
  FCModifyNotificationsForTopicsCommand *v21;
  void *v22;
  id v24;
  void *v25;
  uint64_t v26;
  _QWORD v27[8];
  _QWORD v28[8];
  uint8_t buf[4];
  const char *v30;
  __int16 v31;
  char *v32;
  __int16 v33;
  int v34;
  __int16 v35;
  void *v36;
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (!v10 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v25 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Invalid parameter not satisfying %s"), "channelID");
    *(_DWORD *)buf = 136315906;
    v30 = "-[FCNotificationController registerNotificationsForTopicIDs:withTopicGroupingID:fromChannelID:]";
    v31 = 2080;
    v32 = "FCNotificationController.m";
    v33 = 1024;
    v34 = 250;
    v35 = 2114;
    v36 = v25;
    _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

  }
  +[FCAppleAccount sharedAccount](FCAppleAccount, "sharedAccount");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "contentStoreFrontID");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10
    && (-[FCNotificationController deviceToken](self, "deviceToken"), (v13 = objc_claimAutoreleasedReturnValue()) != 0)
    && (v14 = (void *)v13,
        -[FCNotificationController notificationsUserID](self, "notificationsUserID"),
        v15 = (void *)objc_claimAutoreleasedReturnValue(),
        v15,
        v14,
        v15))
  {
    +[FCNetworkReachability sharedNetworkReachability](FCNetworkReachability, "sharedNetworkReachability");
    v16 = (id)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v16, "isCloudKitReachable");
    if ((v17 & 1) != 0)
    {
      v18 = [FCModifyNotificationsForTopicsCommand alloc];
      -[FCNotificationController notificationsUserID](self, "notificationsUserID");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      -[FCNotificationController deviceToken](self, "deviceToken");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(v26) = -[FCNotificationController deviceDigestMode](self, "deviceDigestMode");
      v21 = -[FCModifyNotificationsForTopicsCommand initWithTopicIDsToAdd:topicIDsToRemove:withTopicGroupingID:fromChannelID:userID:deviceToken:storefrontID:deviceDigestMode:](v18, "initWithTopicIDsToAdd:topicIDsToRemove:withTopicGroupingID:fromChannelID:userID:deviceToken:storefrontID:deviceDigestMode:", v8, 0, v9, v10, v19, v20, v12, v26);

      -[FCNotificationController commandQueue](self, "commandQueue");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "addCommand:", v21);

    }
    else
    {
      v27[0] = MEMORY[0x1E0C809B0];
      v27[1] = 3221225472;
      v27[2] = __95__FCNotificationController_registerNotificationsForTopicIDs_withTopicGroupingID_fromChannelID___block_invoke_33;
      v27[3] = &unk_1E464B668;
      v21 = (FCModifyNotificationsForTopicsCommand *)v8;
      v27[4] = v21;
      v24 = v10;
      v27[5] = v24;
      v27[6] = self;
      v27[7] = v12;
      __95__FCNotificationController_registerNotificationsForTopicIDs_withTopicGroupingID_fromChannelID___block_invoke_33((uint64_t)v27);

    }
  }
  else
  {
    v28[0] = MEMORY[0x1E0C809B0];
    v28[1] = 3221225472;
    v28[2] = __95__FCNotificationController_registerNotificationsForTopicIDs_withTopicGroupingID_fromChannelID___block_invoke;
    v28[3] = &unk_1E464B668;
    v16 = v8;
    v28[4] = v16;
    v21 = (FCModifyNotificationsForTopicsCommand *)v10;
    v28[5] = v21;
    v28[6] = self;
    v28[7] = v12;
    __95__FCNotificationController_registerNotificationsForTopicIDs_withTopicGroupingID_fromChannelID___block_invoke((uint64_t)v28);
    v17 = 0;
  }

  return v17;
}

uint64_t __95__FCNotificationController_registerNotificationsForTopicIDs_withTopicGroupingID_fromChannelID___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  int v11;
  uint64_t v12;
  __int16 v13;
  uint64_t v14;
  __int16 v15;
  void *v16;
  __int16 v17;
  void *v18;
  __int16 v19;
  uint64_t v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v2 = (void *)FCPushNotificationsLog;
  if (os_log_type_enabled((os_log_t)FCPushNotificationsLog, OS_LOG_TYPE_ERROR))
  {
    v4 = *(_QWORD *)(a1 + 32);
    v5 = *(_QWORD *)(a1 + 40);
    v6 = *(void **)(a1 + 48);
    v7 = v2;
    objc_msgSend(v6, "deviceToken");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 48), "notificationsUserID");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = *(_QWORD *)(a1 + 56);
    v11 = 138544386;
    v12 = v4;
    v13 = 2114;
    v14 = v5;
    v15 = 2114;
    v16 = v8;
    v17 = 2114;
    v18 = v9;
    v19 = 2114;
    v20 = v10;
    _os_log_error_impl(&dword_1A1B90000, v7, OS_LOG_TYPE_ERROR, "failed to create command to register topic notifications with topicIDs: %{public}@ channelID: %{public}@ deviceToken: %{public}@ notificationsUserID: %{public}@ storefrontID: %{public}@", (uint8_t *)&v11, 0x34u);

  }
  return 0;
}

uint64_t __95__FCNotificationController_registerNotificationsForTopicIDs_withTopicGroupingID_fromChannelID___block_invoke_33(uint64_t a1)
{
  void *v2;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  int v11;
  uint64_t v12;
  __int16 v13;
  uint64_t v14;
  __int16 v15;
  void *v16;
  __int16 v17;
  void *v18;
  __int16 v19;
  uint64_t v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v2 = (void *)FCPushNotificationsLog;
  if (os_log_type_enabled((os_log_t)FCPushNotificationsLog, OS_LOG_TYPE_ERROR))
  {
    v4 = *(_QWORD *)(a1 + 32);
    v5 = *(_QWORD *)(a1 + 40);
    v6 = *(void **)(a1 + 48);
    v7 = v2;
    objc_msgSend(v6, "deviceToken");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 48), "notificationsUserID");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = *(_QWORD *)(a1 + 56);
    v11 = 138544386;
    v12 = v4;
    v13 = 2114;
    v14 = v5;
    v15 = 2114;
    v16 = v8;
    v17 = 2114;
    v18 = v9;
    v19 = 2114;
    v20 = v10;
    _os_log_error_impl(&dword_1A1B90000, v7, OS_LOG_TYPE_ERROR, "failed to create command to register notifications: CloudKit unreachable, topicIDs: %{public}@ channelID: %{public}@ deviceToken: %{public}@ notificationsUserID: %{public}@ storefrontID: %{public}@", (uint8_t *)&v11, 0x34u);

  }
  return 0;
}

- (BOOL)unregisterNotificationsForTopicIDs:(id)a3 withTopicGroupingID:(id)a4 fromChannelID:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  id v16;
  char v17;
  FCModifyNotificationsForTopicsCommand *v18;
  void *v19;
  void *v20;
  FCModifyNotificationsForTopicsCommand *v21;
  void *v22;
  id v24;
  void *v25;
  uint64_t v26;
  _QWORD v27[8];
  _QWORD v28[8];
  uint8_t buf[4];
  const char *v30;
  __int16 v31;
  char *v32;
  __int16 v33;
  int v34;
  __int16 v35;
  void *v36;
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (!v10 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v25 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Invalid parameter not satisfying %s"), "channelID");
    *(_DWORD *)buf = 136315906;
    v30 = "-[FCNotificationController unregisterNotificationsForTopicIDs:withTopicGroupingID:fromChannelID:]";
    v31 = 2080;
    v32 = "FCNotificationController.m";
    v33 = 1024;
    v34 = 282;
    v35 = 2114;
    v36 = v25;
    _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

  }
  +[FCAppleAccount sharedAccount](FCAppleAccount, "sharedAccount");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "contentStoreFrontID");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10
    && (-[FCNotificationController deviceToken](self, "deviceToken"), (v13 = objc_claimAutoreleasedReturnValue()) != 0)
    && (v14 = (void *)v13,
        -[FCNotificationController notificationsUserID](self, "notificationsUserID"),
        v15 = (void *)objc_claimAutoreleasedReturnValue(),
        v15,
        v14,
        v15))
  {
    +[FCNetworkReachability sharedNetworkReachability](FCNetworkReachability, "sharedNetworkReachability");
    v16 = (id)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v16, "isCloudKitReachable");
    if ((v17 & 1) != 0)
    {
      v18 = [FCModifyNotificationsForTopicsCommand alloc];
      -[FCNotificationController notificationsUserID](self, "notificationsUserID");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      -[FCNotificationController deviceToken](self, "deviceToken");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(v26) = -[FCNotificationController deviceDigestMode](self, "deviceDigestMode");
      v21 = -[FCModifyNotificationsForTopicsCommand initWithTopicIDsToAdd:topicIDsToRemove:withTopicGroupingID:fromChannelID:userID:deviceToken:storefrontID:deviceDigestMode:](v18, "initWithTopicIDsToAdd:topicIDsToRemove:withTopicGroupingID:fromChannelID:userID:deviceToken:storefrontID:deviceDigestMode:", 0, v8, v9, v10, v19, v20, v12, v26);

      -[FCNotificationController commandQueue](self, "commandQueue");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "addCommand:", v21);

    }
    else
    {
      v27[0] = MEMORY[0x1E0C809B0];
      v27[1] = 3221225472;
      v27[2] = __97__FCNotificationController_unregisterNotificationsForTopicIDs_withTopicGroupingID_fromChannelID___block_invoke_35;
      v27[3] = &unk_1E464B668;
      v21 = (FCModifyNotificationsForTopicsCommand *)v8;
      v27[4] = v21;
      v24 = v10;
      v27[5] = v24;
      v27[6] = self;
      v27[7] = v12;
      __97__FCNotificationController_unregisterNotificationsForTopicIDs_withTopicGroupingID_fromChannelID___block_invoke_35((uint64_t)v27);

    }
  }
  else
  {
    v28[0] = MEMORY[0x1E0C809B0];
    v28[1] = 3221225472;
    v28[2] = __97__FCNotificationController_unregisterNotificationsForTopicIDs_withTopicGroupingID_fromChannelID___block_invoke;
    v28[3] = &unk_1E464B668;
    v16 = v8;
    v28[4] = v16;
    v21 = (FCModifyNotificationsForTopicsCommand *)v10;
    v28[5] = v21;
    v28[6] = self;
    v28[7] = v12;
    __97__FCNotificationController_unregisterNotificationsForTopicIDs_withTopicGroupingID_fromChannelID___block_invoke((uint64_t)v28);
    v17 = 0;
  }

  return v17;
}

uint64_t __97__FCNotificationController_unregisterNotificationsForTopicIDs_withTopicGroupingID_fromChannelID___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  int v11;
  uint64_t v12;
  __int16 v13;
  uint64_t v14;
  __int16 v15;
  void *v16;
  __int16 v17;
  void *v18;
  __int16 v19;
  uint64_t v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v2 = (void *)FCPushNotificationsLog;
  if (os_log_type_enabled((os_log_t)FCPushNotificationsLog, OS_LOG_TYPE_ERROR))
  {
    v4 = *(_QWORD *)(a1 + 32);
    v5 = *(_QWORD *)(a1 + 40);
    v6 = *(void **)(a1 + 48);
    v7 = v2;
    objc_msgSend(v6, "deviceToken");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 48), "notificationsUserID");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = *(_QWORD *)(a1 + 56);
    v11 = 138544386;
    v12 = v4;
    v13 = 2114;
    v14 = v5;
    v15 = 2114;
    v16 = v8;
    v17 = 2114;
    v18 = v9;
    v19 = 2114;
    v20 = v10;
    _os_log_error_impl(&dword_1A1B90000, v7, OS_LOG_TYPE_ERROR, "failed to create command to register topic notifications with topicIDs: %{public}@ channelID: %{public}@ deviceToken: %{public}@ notificationsUserID: %{public}@ storefrontID: %{public}@", (uint8_t *)&v11, 0x34u);

  }
  return 0;
}

uint64_t __97__FCNotificationController_unregisterNotificationsForTopicIDs_withTopicGroupingID_fromChannelID___block_invoke_35(uint64_t a1)
{
  void *v2;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  int v11;
  uint64_t v12;
  __int16 v13;
  uint64_t v14;
  __int16 v15;
  void *v16;
  __int16 v17;
  void *v18;
  __int16 v19;
  uint64_t v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v2 = (void *)FCPushNotificationsLog;
  if (os_log_type_enabled((os_log_t)FCPushNotificationsLog, OS_LOG_TYPE_ERROR))
  {
    v4 = *(_QWORD *)(a1 + 32);
    v5 = *(_QWORD *)(a1 + 40);
    v6 = *(void **)(a1 + 48);
    v7 = v2;
    objc_msgSend(v6, "deviceToken");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 48), "notificationsUserID");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = *(_QWORD *)(a1 + 56);
    v11 = 138544386;
    v12 = v4;
    v13 = 2114;
    v14 = v5;
    v15 = 2114;
    v16 = v8;
    v17 = 2114;
    v18 = v9;
    v19 = 2114;
    v20 = v10;
    _os_log_error_impl(&dword_1A1B90000, v7, OS_LOG_TYPE_ERROR, "failed to create command to register notifications: CloudKit unreachable, topicIDs: %{public}@ channelID: %{public}@ deviceToken: %{public}@ notificationsUserID: %{public}@ storefrontID: %{public}@", (uint8_t *)&v11, 0x34u);

  }
  return 0;
}

- (BOOL)refreshNotificationsForTopicIDs:(id)a3 withTopicGroupingID:(id)a4 fromChannelID:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  char v17;
  FCRefreshNotificationsForTopicsCommand *v18;
  void *v19;
  void *v20;
  FCRefreshNotificationsForTopicsCommand *v21;
  void *v22;
  uint64_t v24;
  _QWORD v25[9];
  _QWORD v26[10];

  v8 = a3;
  v9 = a4;
  v10 = a5;
  +[FCAppleAccount sharedAccount](FCAppleAccount, "sharedAccount");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "contentStoreFrontID");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  -[FCNotificationController deviceToken](self, "deviceToken");
  v13 = objc_claimAutoreleasedReturnValue();
  if (v13
    && (v14 = (void *)v13,
        -[FCNotificationController notificationsUserID](self, "notificationsUserID"),
        v15 = (void *)objc_claimAutoreleasedReturnValue(),
        v15,
        v14,
        v15))
  {
    +[FCNetworkReachability sharedNetworkReachability](FCNetworkReachability, "sharedNetworkReachability");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v16, "isCloudKitReachable");
    if ((v17 & 1) != 0)
    {
      v18 = [FCRefreshNotificationsForTopicsCommand alloc];
      -[FCNotificationController notificationsUserID](self, "notificationsUserID");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      -[FCNotificationController deviceToken](self, "deviceToken");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(v24) = -[FCNotificationController deviceDigestMode](self, "deviceDigestMode");
      v21 = -[FCRefreshNotificationsForTopicsCommand initWithTopicsIDs:withTopicGroupingID:fromChannelID:userID:deviceToken:storefrontID:deviceDigestMode:](v18, "initWithTopicsIDs:withTopicGroupingID:fromChannelID:userID:deviceToken:storefrontID:deviceDigestMode:", v8, v9, v10, v19, v20, v12, v24);

      -[FCNotificationController commandQueue](self, "commandQueue");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "addCommand:", v21);

    }
    else
    {
      v25[0] = MEMORY[0x1E0C809B0];
      v25[1] = 3221225472;
      v25[2] = __94__FCNotificationController_refreshNotificationsForTopicIDs_withTopicGroupingID_fromChannelID___block_invoke_36;
      v25[3] = &unk_1E464B690;
      v25[4] = v8;
      v25[5] = v9;
      v25[6] = v10;
      v25[7] = self;
      v25[8] = v12;
      __94__FCNotificationController_refreshNotificationsForTopicIDs_withTopicGroupingID_fromChannelID___block_invoke_36((uint64_t)v25);
    }

  }
  else
  {
    v26[0] = MEMORY[0x1E0C809B0];
    v26[1] = 3221225472;
    v26[2] = __94__FCNotificationController_refreshNotificationsForTopicIDs_withTopicGroupingID_fromChannelID___block_invoke;
    v26[3] = &unk_1E464B690;
    v26[4] = v8;
    v26[5] = v9;
    v26[6] = v10;
    v26[7] = self;
    v26[8] = v12;
    __94__FCNotificationController_refreshNotificationsForTopicIDs_withTopicGroupingID_fromChannelID___block_invoke((uint64_t)v26);
    v17 = 0;
  }

  return v17;
}

uint64_t __94__FCNotificationController_refreshNotificationsForTopicIDs_withTopicGroupingID_fromChannelID___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  NSObject *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  int v12;
  uint64_t v13;
  __int16 v14;
  uint64_t v15;
  __int16 v16;
  uint64_t v17;
  __int16 v18;
  void *v19;
  __int16 v20;
  void *v21;
  __int16 v22;
  uint64_t v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v2 = (void *)FCPushNotificationsLog;
  if (os_log_type_enabled((os_log_t)FCPushNotificationsLog, OS_LOG_TYPE_ERROR))
  {
    v4 = *(_QWORD *)(a1 + 32);
    v5 = *(_QWORD *)(a1 + 40);
    v7 = *(_QWORD *)(a1 + 48);
    v6 = *(void **)(a1 + 56);
    v8 = v2;
    objc_msgSend(v6, "deviceToken");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 56), "notificationsUserID");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = *(_QWORD *)(a1 + 64);
    v12 = 138544642;
    v13 = v4;
    v14 = 2114;
    v15 = v5;
    v16 = 2114;
    v17 = v7;
    v18 = 2114;
    v19 = v9;
    v20 = 2114;
    v21 = v10;
    v22 = 2114;
    v23 = v11;
    _os_log_error_impl(&dword_1A1B90000, v8, OS_LOG_TYPE_ERROR, "failed to create command to refresh notifications for topicIDs: %{public}@ topicGroupingID: %{public}@ channelID: %{public}@ deviceToken: %{public}@ notificationsUserID: %{public}@ storefrontID: %{public}@", (uint8_t *)&v12, 0x3Eu);

  }
  return 0;
}

uint64_t __94__FCNotificationController_refreshNotificationsForTopicIDs_withTopicGroupingID_fromChannelID___block_invoke_36(uint64_t a1)
{
  void *v2;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  NSObject *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  int v12;
  uint64_t v13;
  __int16 v14;
  uint64_t v15;
  __int16 v16;
  uint64_t v17;
  __int16 v18;
  void *v19;
  __int16 v20;
  void *v21;
  __int16 v22;
  uint64_t v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v2 = (void *)FCPushNotificationsLog;
  if (os_log_type_enabled((os_log_t)FCPushNotificationsLog, OS_LOG_TYPE_ERROR))
  {
    v4 = *(_QWORD *)(a1 + 32);
    v5 = *(_QWORD *)(a1 + 40);
    v7 = *(_QWORD *)(a1 + 48);
    v6 = *(void **)(a1 + 56);
    v8 = v2;
    objc_msgSend(v6, "deviceToken");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 56), "notificationsUserID");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = *(_QWORD *)(a1 + 64);
    v12 = 138544642;
    v13 = v4;
    v14 = 2114;
    v15 = v5;
    v16 = 2114;
    v17 = v7;
    v18 = 2114;
    v19 = v9;
    v20 = 2114;
    v21 = v10;
    v22 = 2114;
    v23 = v11;
    _os_log_error_impl(&dword_1A1B90000, v8, OS_LOG_TYPE_ERROR, "failed to create command to refresh notifications: CloudKit unreachable, topicIDs: %{public}@ topicGroupingID: %{public}@ channelID: %{public}@ deviceToken: %{public}@ notificationsUserID: %{public}@ storefrontID: %{public}@", (uint8_t *)&v12, 0x3Eu);

  }
  return 0;
}

- (BOOL)setMarketingNotificationsEnabled:(BOOL)a3 error:(id *)a4
{
  _BOOL8 v5;
  void *v7;
  void *v8;
  void *v9;
  char v10;
  uint64_t v11;
  FCModifyNotificationsForMarketingCommand *v12;
  void *v13;
  void *v14;
  NSObject *v15;
  NSObject *v16;
  uint8_t v18[16];
  uint8_t buf[16];

  v5 = a3;
  if (-[FCNotificationController appleNewsNotificationsAllowed](self, "appleNewsNotificationsAllowed"))
  {
    +[FCAppleAccount sharedAccount](FCAppleAccount, "sharedAccount");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "iTunesAccountDSID");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
    {
      +[FCNetworkReachability sharedNetworkReachability](FCNetworkReachability, "sharedNetworkReachability");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v9, "isCloudKitReachable");
      if ((v10 & 1) != 0)
      {
        if (v5)
          v11 = 1;
        else
          v11 = 2;
        v12 = -[FCModifyNotificationsForMarketingCommand initWithType:action:iTunesDSID:]([FCModifyNotificationsForMarketingCommand alloc], "initWithType:action:iTunesDSID:", 1, v11, v8);
        -[FCNotificationController commandQueue](self, "commandQueue");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "addCommand:", v12);

        -[FCNotificationController userInfo](self, "userInfo");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "setMarketingNotificationsEnabled:", v5);

        goto LABEL_15;
      }
      v16 = FCPushNotificationsLog;
      if (os_log_type_enabled((os_log_t)FCPushNotificationsLog, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)v18 = 0;
        _os_log_error_impl(&dword_1A1B90000, v16, OS_LOG_TYPE_ERROR, "failed to create command to register For Marketing Notifications: CloudKit unreachable", v18, 2u);
        if (!a4)
          goto LABEL_15;
      }
      else if (!a4)
      {
LABEL_15:

        goto LABEL_16;
      }
      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("FCErrorDomain"), 10, 0);
      *a4 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_15;
    }
    v15 = FCPushNotificationsLog;
    if (os_log_type_enabled((os_log_t)FCPushNotificationsLog, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1A1B90000, v15, OS_LOG_TYPE_ERROR, "Cannot alter marketing notifications status without an iTunes DSID. Please ensure device is logged into iTunes.", buf, 2u);
      if (a4)
        goto LABEL_11;
    }
    else if (a4)
    {
LABEL_11:
      objc_msgSend(MEMORY[0x1E0CB35C8], "fc_errorWithCode:description:", 16, CFSTR("Cannot alter marketing notifications status without an iTunes DSID. Please ensure device is logged into iTunes."));
      v10 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
LABEL_16:

      return v10;
    }
    v10 = 0;
    goto LABEL_16;
  }
  return 0;
}

- (BOOL)setPuzzleNotificationsEnabled:(BOOL)a3 userTriggered:(BOOL)a4 error:(id *)a5
{
  _BOOL8 v6;
  _BOOL8 v7;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  void *v14;
  const __CFString *v15;
  NSObject *v16;
  BOOL v17;
  NSObject *v18;
  void *v19;
  NSObject *v20;
  int v22;
  void *v23;
  uint64_t v24;

  v6 = a4;
  v7 = a3;
  v24 = *MEMORY[0x1E0C80C00];
  if (-[FCNotificationController appleNewsNotificationsAllowed](self, "appleNewsNotificationsAllowed"))
  {
    -[FCNotificationController configurationManager](self, "configurationManager");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "configuration");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "puzzlesConfig");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "puzzleHubTagID");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v12)
    {
      v18 = FCPushNotificationsLog;
      if (os_log_type_enabled((os_log_t)FCPushNotificationsLog, OS_LOG_TYPE_ERROR))
      {
        LOWORD(v22) = 0;
        _os_log_error_impl(&dword_1A1B90000, v18, OS_LOG_TYPE_ERROR, "Failed to get puzzleHubTagID. Cannot alter puzzles notifications status.", (uint8_t *)&v22, 2u);
      }
      v14 = (void *)MEMORY[0x1E0CB35C8];
      v15 = CFSTR("Failed to get puzzleHubTagID. Cannot alter marketing notifications status without a valid puzzleHubTagID.");
      goto LABEL_19;
    }
    if (v7)
    {
      if (!-[FCNotificationController registerNotificationsForChannelID:isPaid:](self, "registerNotificationsForChannelID:isPaid:", v12, 0))
      {
        v13 = FCPushNotificationsLog;
        if (os_log_type_enabled((os_log_t)FCPushNotificationsLog, OS_LOG_TYPE_ERROR))
        {
          v22 = 138412290;
          v23 = v12;
          _os_log_error_impl(&dword_1A1B90000, v13, OS_LOG_TYPE_ERROR, "Failed to register notifications for %@.", (uint8_t *)&v22, 0xCu);
        }
        v14 = (void *)MEMORY[0x1E0CB35C8];
        v15 = CFSTR("Failed to register notifications for puzzleHubTagID.");
LABEL_19:
        objc_msgSend(v14, "fc_errorWithCode:description:", 16, v15);
        v17 = 0;
        *a5 = (id)objc_claimAutoreleasedReturnValue();
        goto LABEL_20;
      }
    }
    else if (!-[FCNotificationController unregisterNotificationsForChannelID:](self, "unregisterNotificationsForChannelID:", v12))
    {
      v20 = FCPushNotificationsLog;
      if (os_log_type_enabled((os_log_t)FCPushNotificationsLog, OS_LOG_TYPE_ERROR))
      {
        v22 = 138412290;
        v23 = v12;
        _os_log_error_impl(&dword_1A1B90000, v20, OS_LOG_TYPE_ERROR, "Failed to unregister notifications for %@.", (uint8_t *)&v22, 0xCu);
      }
      v14 = (void *)MEMORY[0x1E0CB35C8];
      v15 = CFSTR("Failed to unregister notifications for puzzleHubTagID.");
      goto LABEL_19;
    }
    -[FCNotificationController userInfo](self, "userInfo");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "setPuzzleNotificationsEnabled:userTriggered:", v7, v6);

    v17 = 1;
LABEL_20:

    return v17;
  }
  v16 = FCPushNotificationsLog;
  if (os_log_type_enabled((os_log_t)FCPushNotificationsLog, OS_LOG_TYPE_ERROR))
  {
    LOWORD(v22) = 0;
    _os_log_error_impl(&dword_1A1B90000, v16, OS_LOG_TYPE_ERROR, "Apple News push notifications not allowed. Cannot alter puzzles notifications status.", (uint8_t *)&v22, 2u);
  }
  objc_msgSend(MEMORY[0x1E0CB35C8], "fc_errorWithCode:description:", 16, CFSTR("Apple News push notifications not allowed. Cannot alter puzzles notifications status."));
  v17 = 0;
  *a5 = (id)objc_claimAutoreleasedReturnValue();
  return v17;
}

- (void)setNewIssueNotificationsEnabled:(BOOL)a3
{
  _QWORD v3[5];
  BOOL v4;

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __60__FCNotificationController_setNewIssueNotificationsEnabled___block_invoke;
  v3[3] = &unk_1E464B6B8;
  v3[4] = self;
  v4 = a3;
  dispatch_async(MEMORY[0x1E0C80D38], v3);
}

void __60__FCNotificationController_setNewIssueNotificationsEnabled___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "userInfo");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setNewIssueNotificationsEnabled:", *(unsigned __int8 *)(a1 + 40));

}

- (void)setEndOfAudioTrackNotificationsEnabled:(BOOL)a3
{
  _QWORD v3[5];
  BOOL v4;

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __67__FCNotificationController_setEndOfAudioTrackNotificationsEnabled___block_invoke;
  v3[3] = &unk_1E464B6B8;
  v3[4] = self;
  v4 = a3;
  dispatch_async(MEMORY[0x1E0C80D38], v3);
}

void __67__FCNotificationController_setEndOfAudioTrackNotificationsEnabled___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "userInfo");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setEndOfAudioTrackNotificationsEnabled:", *(unsigned __int8 *)(a1 + 40));

}

- (void)setSportsTopicNotificationsEnabled:(BOOL)a3
{
  _QWORD v3[5];
  BOOL v4;

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __63__FCNotificationController_setSportsTopicNotificationsEnabled___block_invoke;
  v3[3] = &unk_1E464B6B8;
  v3[4] = self;
  v4 = a3;
  dispatch_async(MEMORY[0x1E0C80D38], v3);
}

void __63__FCNotificationController_setSportsTopicNotificationsEnabled___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  id v4;

  objc_msgSend(*(id *)(a1 + 32), "userInfo");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v2;
  if (*(_BYTE *)(a1 + 40))
    v3 = 3;
  else
    v3 = 2;
  objc_msgSend(v2, "setSportsTopicNotificationsEnabledState:", v3);

}

- (void)refreshNotificationsFromAppleNews
{
  void *v3;
  _QWORD v4[4];
  id v5;
  id location;

  if (-[FCNotificationController appleNewsNotificationsAllowed](self, "appleNewsNotificationsAllowed"))
  {
    objc_initWeak(&location, self);
    -[FCNotificationController userInfo](self, "userInfo");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4[0] = MEMORY[0x1E0C809B0];
    v4[1] = 3221225472;
    v4[2] = __61__FCNotificationController_refreshNotificationsFromAppleNews__block_invoke_2;
    v4[3] = &unk_1E464B708;
    objc_copyWeak(&v5, &location);
    objc_msgSend(v3, "syncWithCompletion:", v4);

    objc_destroyWeak(&v5);
    objc_destroyWeak(&location);
  }
}

void __61__FCNotificationController_refreshNotificationsFromAppleNews__block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  id WeakRetained;
  id v6;
  _QWORD v7[4];
  id v8;

  v4 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __61__FCNotificationController_refreshNotificationsFromAppleNews__block_invoke_3;
  v7[3] = &unk_1E464B6E0;
  v8 = v4;
  v6 = v4;
  FCPerformIfNonNil(WeakRetained, v7);

}

void __61__FCNotificationController_refreshNotificationsFromAppleNews__block_invoke_3(uint64_t a1, void *a2)
{
  id v2;
  id v3;

  if (!*(_QWORD *)(a1 + 32))
  {
    v2 = a2;
    objc_msgSend(v2, "userInfo");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "setMarketingNotificationsEnabled:error:", objc_msgSend(v3, "marketingNotificationsEnabled"), 0);

  }
}

- (id)appendBreakingNewsIfNeededToChannelIDs:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v4 = a3;
  -[FCNotificationController configurationManager](self, "configurationManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "configuration");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "topStoriesConfig");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "channelID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "breakingNewsChannelID");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v4;
  if (objc_msgSend(v9, "length"))
  {
    v10 = v4;
    if (objc_msgSend(v8, "length"))
    {
      v10 = v4;
      if (objc_msgSend(v4, "containsObject:", v8))
      {
        objc_msgSend(v4, "arrayByAddingObject:", v9);
        v10 = (void *)objc_claimAutoreleasedReturnValue();

      }
    }
  }

  return v10;
}

- (void)userInfoDidChangeNotificationsUserID:(id)a3
{
  void *v4;
  char v5;
  void *v6;
  void *v7;
  id v8;

  objc_msgSend(a3, "notificationsUserID");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  -[FCNotificationController notificationsUserID](self, "notificationsUserID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isEqualToString:", v8);

  if ((v5 & 1) == 0)
  {
    -[FCNotificationController setNotificationsUserID:](self, "setNotificationsUserID:", v8);
    -[FCNotificationController deviceToken](self, "deviceToken");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      -[FCNotificationController deviceToken](self, "deviceToken");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[FCNotificationController _registerDeviceToken:deviceDigestMode:](self, "_registerDeviceToken:deviceDigestMode:", v7, -[FCNotificationController deviceDigestMode](self, "deviceDigestMode"));

    }
  }

}

- (void)setNotificationsUserID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (void)setShouldUseNewsUINotificationHandling:(BOOL)a3
{
  self->_shouldUseNewsUINotificationHandling = a3;
}

- (FCUserInfo)userInfo
{
  return self->_userInfo;
}

- (void)setUserInfo:(id)a3
{
  objc_storeStrong((id *)&self->_userInfo, a3);
}

- (void)setCommandQueue:(id)a3
{
  objc_storeStrong((id *)&self->_commandQueue, a3);
}

- (void)setConfigurationManager:(id)a3
{
  objc_storeStrong((id *)&self->_configurationManager, a3);
}

- (int)deviceDigestMode
{
  return self->_deviceDigestMode;
}

- (void)setPublisherNotificationsAllowed:(BOOL)a3
{
  self->_publisherNotificationsAllowed = a3;
}

- (BOOL)appleNewsNotificationsAllowed
{
  return self->_appleNewsNotificationsAllowed;
}

- (void)setAppleNewsNotificationsAllowed:(BOOL)a3
{
  self->_appleNewsNotificationsAllowed = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_configurationManager, 0);
  objc_storeStrong((id *)&self->_commandQueue, 0);
  objc_storeStrong((id *)&self->_userInfo, 0);
  objc_storeStrong((id *)&self->_deviceToken, 0);
  objc_storeStrong((id *)&self->_notificationsUserID, 0);
}

@end
